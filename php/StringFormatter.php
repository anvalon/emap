<?php
/* -------------------------------------------------------------------------
 * PROJECT:     Esperanto-Morfanalizilo
 * FILE:        StringFormatter.php
 * DESCRIPTION:
 * This class is responsible for the visual presentation of morphological 
 * analysis results. It maps raw linguistic tags (rad, pre, suf) to human-readable 
 * labels and CSS classes. It transforms the abstract solution strings into 
 * accessible and structured HTML fragments.
 * ------------------------------------------------------------------------- */

class StringFormatter {

    /**
     * @var array $tag_desc Mapping of Prolog internal tags to full Esperanto labels.
     */
    private $tag_desc = [
        'pre' => 'prefikso',
        'suf' => 'sufikso',
        'rad' => 'radiko',
    ];

    /**
     * @var array $class_map Mapping of tags to CSS classes for styling.
     */
    private $class_map = [
        'pre' => 'prefix',
        'suf' => 'suffix',
        'rad' => 'root',
    ];

    /**
     * Sanitizes and prepares the input string for processing.
     * * @param string $word
     * @return string
     */
    public function prepare(string $word): string {
        return trim($word);
    }

    /**
     * Iterates through multiple solutions and generates the combined HTML output.
     * * @param array $data The decoded JSON data from Prolog.
     * @return string Accumulated HTML result blocks.
     */
    public function output(array $data): string {
        $full_html = "";
        foreach ($data['solutions'] as $solution) {
            /* Transform each string solution into an HTML block */
            $full_html .= $this->render($solution);
        }
        return $full_html;
    }

    /**
     * Renders a full solution string as a container of morphemes.
     * * @param string $solution A hyphen-separated string of morphemes with tags.
     * @return string
     */
    private function render(string $solution): string {
        $html = "<div class='result-text'>";
        /* Split the solution into individual morpheme units */
        $morphs = explode('-', $solution);
        foreach ($morphs as $morph) {
            $html .= $this->renderMorph($morph);
        }
        $html .= "</div>";
        return $html;
    }

    /**
     * Parses an individual morpheme (e.g., "vort{rad}") into a styled HTML span.
     * * @param string $morph The tagged morpheme string.
     * @return string
     */
    private function renderMorph(string $morph): string {
        /* Regex logic to separate the text content from the type tag */
        if (preg_match('/^(.*)\{(.*)\}$/', $morph, $matches)) {
            $text = $matches[1];
            $tag = $matches[2];
            
            /* Determine the appropriate CSS class and label based on maps */
            $class = $this->class_map[$tag] ?? 'ending';
            $full_tag_name = $this->tag_desc[$tag] ?? 'finaĵo';
            
            /* Construct the HTML element with proper escaping for security */
            return "<span class='morph " . htmlspecialchars($class) . "'>" . 
                   htmlspecialchars($text) . 
                   "<span class='label'>" . htmlspecialchars($full_tag_name) . "</span>" .
                   "</span>";
        }
        return "";
    }
}