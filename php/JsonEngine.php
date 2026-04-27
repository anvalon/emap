<?php
/* -------------------------------------------------------------------------
 * PROJECT:     Esperanto-Morfanalizilo
 * FILE:        JsonEngine.php
 * DESCRIPTION:
 * This component is specialized in sanitizing and parsing raw output from 
 * the Prolog process. Since shell execution might include unwanted noise 
 * (system warnings or headers), this engine isolates the JSON payload 
 * starting from the first curly brace and converts it into a native 
 * PHP associative array.
 * ------------------------------------------------------------------------- */

class JsonEngine {

    /**
     * Parses a string containing a JSON object into an associative array.
     * * @param string $text Raw output from shell execution.
     * @return array|null Returns the decoded array if successful, null otherwise.
     */
    public function parse(string $text) {
        /* Locate the beginning of the JSON structure to skip any leading shell noise */
        $start = strpos($text, '{');
        if ($start === false) {
            return null;
        }
        
        /* Extract and decode the JSON substring */
        $result = json_decode(substr($text, $start), true);
        
        /* Validate the structure and the status returned by the Prolog engine */
        if (!$result || !isset($result['status']) || $result['status'] === 'error') {
            return null;
        }
        
        return $result;
    }
}