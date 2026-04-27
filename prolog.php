<?php
/**
 * File: prolog.php
 * Interfacing PHP with the SWI-Prolog engine.
 */

function prolog_analyze($word) {

    $tag_desc = [
        'pre' => 'prefikso',
        'suf' => 'sufikso',
        'rad' => 'radiko',
    ];

    $class_map = [
        'pre' => 'prefix',
        'suf' => 'suffix',
        'rad' => 'root',
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
        return;
    }

    // Generate HTML Tiles for results
    $html_output = "";
    foreach ($data['solutions'] as $index => $sol) {
        
        $html_output .= "<div class='result-text'>";
        $morfemi = explode('-', $sol);
        
        foreach ($morfemi as $m) {
            if (preg_match('/^(.*)\{(.*)\}$/', $m, $matches)) {
                $text = $matches[1];
                $tag = $matches[2];
                
                $css_class = $class_map[$tag] ?? 'ending';
                $full_tag_name = $tag_desc[$tag] ?? 'finaĵo';

                $html_output .= "<span class='morph $css_class'>" . htmlspecialchars($text) . "<span class='label'>" . htmlspecialchars($full_tag_name) . "</span></span>";
            }
        }        
        $html_output .= "</div>";
    }
    
    return $html_output;
}