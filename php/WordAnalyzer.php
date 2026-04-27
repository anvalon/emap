<?php
/* -------------------------------------------------------------------------
 * PROJECT:     Esperanto-Morfanalizilo
 * FILE:        WordAnalyzer.php
 * DESCRIPTION:
 * The WordAnalyzer acts as the Facade and orchestrator of the entire 
 * analysis pipeline. It manages the dependencies between the Prolog execution 
 * engine, the JSON parsing logic, and the final string formatting. 
 * It follows a strict modular flow: formatting input -> invoking Prolog -> 
 * parsing response -> rendering output.
 * ------------------------------------------------------------------------- */

require_once 'php/JsonEngine.php';
require_once 'php/PrologEngine.php';
require_once 'php/StringFormatter.php';

class WordAnalyzer {

    /**
     * High-level orchestration of the word analysis process.
     * * @param string $word The raw input word from the user.
     * @return string|null The fully rendered HTML for the word analysis.
     */
    public function analyze($word) {

        /* Guard clause for empty input */
        if (empty($word)) {
            return null;
        }

        /* Initialize components */
        $formatter = new StringFormatter();
        $formatted = $formatter->prepare($word);

        /* 1. ACQUISITION: Invoke the external Prolog process to get the breakdown */
        $engine = new PrologEngine();
        $result = $engine->analyze($formatted);

        /* 2. PARSING: Extract and validate the JSON data structure from the output */
        $json = new JsonEngine();
        $data = $json->parse($result);
        
        /* Validate that the data structure contains usable solutions */
        if (!$data || !isset($data['solutions'])) {
            return null;
        }

        /* 3. RENDERING: Generate and return the final HTML visualization */
        return $formatter->output($data);
    }
}