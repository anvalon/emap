<?php
/**
 * File: prolog.php
 * Interfacing PHP with the SWI-Prolog engine.
 */

function prolog_analyze($word) {

$tag_descriptions = [
        'pre' => 'prefikso',
        'suf' => 'sufikso',
        'rad' => 'radiko',
        'aku' => 'finaĵo',
        'plu' => 'finaĵo',
        'adv' => 'finaĵo',
        'adj' => 'finaĵo',
        'sub' => 'finaĵo',
        'inf' => 'finaĵo',
        'pzn' => 'finaĵo',
        'prt' => 'finaĵo',
        'fut' => 'finaĵo',
        'kon' => 'finaĵo',
        'vol' => 'finaĵo',
    ];

$class_map = [
        'pre' => 'prefikso',
        'suf' => 'sufikso',
        'rad' => 'radiko',
        'aku' => 'finaĵo',
        'plu' => 'finaĵo',
        'sub' => 'finaĵo',
        'adj' => 'finaĵo',
        'adv' => 'finaĵo',
        'inf' => 'finaĵo',
        'pzn' => 'finaĵo',
        'prt' => 'finaĵo',
        'fut' => 'finaĵo',
        'kon' => 'finaĵo',
        'vol' => 'finaĵo'
    ];

    if (empty($word)) return null;

    $word = trim($word);
    $base_dir = __DIR__; // Project root directory
    
    // Path to the 'prolog' subdirectory
    $prolog_dir = $base_dir . DIRECTORY_SEPARATOR . "prolog";
    
    // Command: 1. Change to prolog dir, 2. Run swipl loading web.pl
    // On Windows 'cd /d' handles drive letter changes.
    $cmd = "cd /d " . escapeshellarg($prolog_dir) . " && swipl -q -l web.pl -g \"analyze_for_web('$word')\" 2>&1";

    $output = shell_exec($cmd);

    // Filter output to find the start of the JSON object (skips warnings)
    $start_json = strpos($output, '{');
    if ($start_json !== false) {
        $output = substr($output, $start_json);
    }

    $data = json_decode($output, true);

    if (!$data || !isset($data['status']) || $data['status'] === 'error') {
        return "<div class='risultato'>Morfemo ne trovita por <strong>" . htmlspecialchars($word) . "</strong>.</div>";
    }

    // Generate HTML Tiles for results
    $html_output = "";
    foreach ($data['solutions'] as $index => $sol) {
        
        $html_output .= "<div class='scomposizione'>";
        $morfemi = explode('-', $sol);
        
        foreach ($morfemi as $m) {
            if (preg_match('/^(.*)\{(.*)\}$/', $m, $matches)) {
                $text = $matches[1];
                $tag = $matches[2];
                
                $css_class = $class_map[$tag] ?? 'disigilo';
                // Qui usiamo $tag_descriptions per mostrare la parola intera
                $full_tag_name = $tag_descriptions[$tag] ?? $tag;

                $html_output .= "<span class='morfemo $css_class'>" . htmlspecialchars($text) . "<span class='etikedo'>" . htmlspecialchars($full_tag_name) . "</span></span>";
            }
        }        
        $html_output .= "</div>";
    }
    
    return $html_output;
}