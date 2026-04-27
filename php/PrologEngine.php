<?php
/* -------------------------------------------------------------------------
 * PROJECT:     Esperanto-Morfanalizilo
 * FILE:        PrologEngine.php
 * DESCRIPTION:
 * This class handles the inter-process communication (IPC) between PHP 
 * and SWI-Prolog. It constructs the appropriate shell command to invoke 
 * the Prolog interpreter, loads the required logic files, and executes 
 * the morphological analysis goal. 
 * * UPDATE: The path resolution now accounts for the file being located 
 * in a 'php/' subdirectory.
 * ------------------------------------------------------------------------- */

class PrologEngine {

    /**
     * Entry point to run the Prolog process for a specific word.
     * * @param string $word The word to be analyzed.
     * @return string|null Raw output from the command line.
     */
    public function analyze(string $word) {
        $dir = $this->getPrologFolder();
        $cmd = $this->getPrologCommand($dir, $word);
        
        /* Execute the shell command and capture both standard output and error stream */
        return shell_exec($cmd);
    }

    /**
     * Resolves the absolute path to the directory containing Prolog source files.
     * It moves up one level from the current 'php/' directory.
     * * @return string
     */
    private function getPrologFolder() {
        /* Moving up one level (..) to reach the project root from the php/ folder */
        return dirname(__DIR__) . DIRECTORY_SEPARATOR . "prolog";
    }

    /**
     * Constructs the shell command string for SWI-Prolog execution.
     * * @param string $dir The working directory for the shell.
     * @param string $word The input argument for the Prolog predicate.
     * @return string
     */
    private function getPrologCommand(string $dir, string $word) {
        /* Command to change directory and execute swipl with the required goals */
        return "cd /d " . escapeshellarg($dir) . " && swipl -q -l web.pl -g \"analyze_for_web(" . escapeshellarg($word) . ")\" 2>&1";
    }
}