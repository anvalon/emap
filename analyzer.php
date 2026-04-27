<?php

/**
 * -------------------------------------------------------------
 * FILE: Analyzer.php
 * -------------------------------------------------------------
 * DESCRIPTION:
 * -------------------------------------------------------------
 * This class serves as a robust interface between a PHP-based web front-end 
 * and a SWI-Prolog morphological engine. It handles the complete lifecycle 
 * of a word analysis request: from process execution and raw output 
 * sanitization to recursive-like morphological parsing and HTML component 
 * generation.
 * -------------------------------------------------------------
 * ARCHITECTURE & MODULARITY:
 * -------------------------------------------------------------
 * 1. Data Acquisition: Executes shell commands to interface with Prolog.
 * 2. Response Sanitization: Extracts valid JSON payloads from potentially 
 * noisy shell outputs.
 * 3. Morphological Parsing: Breaks down individual solutions into semantic 
 * components (roots, prefixes, suffixes).
 * 4. UI Rendering: Transforms logical data structures into accessible 
 * and styled HTML components.
 * -------------------------------------------------------------
 * USAGE:
 * -------------------------------------------------------------
 * $analyzer = new Analyzer();
 * echo $analyzer->analyze("rebonvenon");
 */
class Analyzer {

    /**
     * @var array $tag_desc
     * Maps internal Prolog tags to human-readable Esperanto labels.
     */
    private $tag_desc = [
        'pre' => 'prefikso',
        'suf' => 'sufikso',
        'rad' => 'radiko',
    ];

    /**
     * @var array $class_map
     * Maps internal Prolog tags to CSS classes for visual differentiation.
     */
    private $class_map = [
        'pre' => 'prefix',
        'suf' => 'suffix',
        'rad' => 'root',
    ];

    /**
     * Internal method to trigger the Prolog engine.
     * @param string $word
     * @return string|null Raw command line output.
     */
    private function get_raw_prolog_output($word) {
        $prolog_dir = __DIR__ . DIRECTORY_SEPARATOR . "prolog";
        $cmd = "cd /d " . escapeshellarg($prolog_dir) . " && swipl -q -l web.pl -g \"analyze_for_web(" . escapeshellarg($word) . ")\" 2>&1";
        return shell_exec($cmd);
    }

    /**
     * Extracts and decodes the JSON object from the raw shell output.
     * Logic follows a clean filter-and-decode pattern.
     * @param string $output
     * @return array|null Decoded data or null on failure.
     */
    private function parse_prolog_json($output) {
        $start_json = strpos($output, '{');
        if ($start_json === false) return null;
        $json_string = substr($output, $start_json);
        $data = json_decode($json_string, true);
        if (!$data || !isset($data['status']) || $data['status'] === 'error') {
            return null;
        }
        return $data;
    }

    /**
     * Parses a single morpheme string and generates its HTML representation.
     * This mimics a functional mapping approach.
     * @param string $morpheme_string Format: "text{tag}"
     * @return string HTML span component.
     */
    private function render_morpheme($morpheme_string) {
        /* Regex pattern reflects the EBNF structure: <text> '{' <tag> '}' */
        if (preg_match('/^(.*)\{(.*)\}$/', $morpheme_string, $matches)) {
            $text = $matches[1];
            $tag = $matches[2];
            $css_class = $this->class_map[$tag] ?? 'ending';
            $full_tag_name = $this->tag_desc[$tag] ?? 'finaĵo';
            return
                "<span class='morph " . htmlspecialchars($css_class) . "'>" . 
                htmlspecialchars($text) . 
                "<span class='label'>" . htmlspecialchars($full_tag_name) . "</span>" .
                "</span>";
        }
        return "";
    }

    /**
     * Orchestrates the transformation of a single solution string into a result block.
     * @param string $solution_string Format: "m1{t1}-m2{t2}"
     * @return string HTML div block.
     */
    private function render_solution_block($solution_string) {
        $html = "<div class='result-text'>";
        $morphemes = explode('-', $solution_string);
        foreach ($morphemes as $m) {
            $html .= $this->render_morpheme($m);
        }
        $html .= "</div>";
        return $html;
    }
    
    /**
     * Public entry point for word analysis.
     * Orchestrates the flow: acquisition -> parsing -> rendering.
     * @param string $word
     * @return string|null Final HTML output.
     */
    public function analyze($word) {
        if (empty($word)) return null;
        $word = trim($word);
        /* 1. Get raw data from the Prolog process */
        $raw_output = $this->get_raw_prolog_output($word);
        /* 2. Convert raw output into a structured array */
        $data = $this->parse_prolog_json($raw_output);
        if (!$data || !isset($data['solutions'])) {
            return null;
        }
        /* 3. Map each solution to its HTML representation */
        $final_html = "";
        foreach ($data['solutions'] as $sol) {
            $final_html .= $this->render_solution_block($sol);
        }
        return $final_html;
    }
}
