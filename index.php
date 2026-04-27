<?php
/* -------------------------------------------------------------------------
 * PROJECT:     Esperanto Morphological Analyzer (Prolog Version 1.0)
 * FILE:        index.php
 * DESCRIPTION:
 * This is the main entry point and user interface for the application. 
 * It handles the HTTP POST requests, manages word-tokenization logic, 
 * and orchestrates the presentation layer. 
 * * New Feature: Added a statistics summary block that displays the total 
 * count of words submitted, how many were successfully analyzed, and 
 * how many failed the analysis.
 * * The file integrates PHP logic with HTML5, CSS3, and JavaScript to 
 * provide a seamless user experience for analyzing Esperanto words 
 * based on a Prolog-powered engine.
 * ------------------------------------------------------------------------- */

    /* Load the main controller class for morphological analysis */
    require_once 'php/WordAnalyzer.php';

    /* Retrieve the word or text to analyze from the POST request, defaulting to null */
    $input = $_POST['input'] ?? null; 
?>

<!DOCTYPE html>
<html lang="eo">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Esperanta Morfanalizilo (Prolog-Versio 1.0)</title>

        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/form.css">
        <link rel="stylesheet" href="css/page.css">
        <link rel="stylesheet" href="css/stats.css">
        <link rel="stylesheet" href="css/morphs.css">
    </head>

    <body>
        <div id="div-page">
            
            <h1>Esperanto-Morfanalizilo <span style="color: #bb6b6b">0.1</span></h1>

            <form method="POST" action="" id="frm-search">
                <textarea id="txt-input" name="input" placeholder="Enigu tekston (ekz.: malsanulejon)..."><?php echo htmlspecialchars($input) ?></textarea>
                <button type="submit">Analizi</button>
            </form>

            <div id="div-content">
                
                <?php if ($input): ?>
                    <?php 
                        /* Initialize the analysis engine */
                        $analyzer = new WordAnalyzer();
                        
                        /* Tokenize input string by spaces to handle multiple words and filter empty results */
                        $words = array_filter(explode(' ', trim($input)));
                        $total_words = count($words);
                        
                        $analyzed_count = 0;
                        $not_analyzed_count = 0;
                        $results_html = "";

                        /* Perform analysis on each word and prepare the HTML output buffer */
                        foreach ($words as $word) {
                            $analysis_result = $analyzer->analyze($word);
                            
                            /* Increment counters based on whether the engine returned a valid result */
                            if ($analysis_result) {
                                $analyzed_count++;
                            } else {
                                $not_analyzed_count++;
                            }
                            
                            /* Build the HTML string for the results list */
                            $results_html .= "<div class='result'>";
                            $results_html .= "<div class='analysis'>" . htmlspecialchars($word) . "</div>";
                            $results_html .= $analysis_result ?? "<div class='invalido' style='color:#dc2626; font-style:italic;'>Neniu analizo trovita.</div>";
                            $results_html .= "</div>";
                        }
                    ?>

                    <div class="stats-summary">
                        <strong>Analizaj Statistikoj:</strong>
                        <ul>
                            <li class="stats-item">Vortoj: <span class="stats-value" style="color:#000;"><?php echo $total_words; ?></span></li>
                            <li class="stats-item">Analizitaj: <span class="stats-value"><?php echo $analyzed_count; ?></span></li>
                            <li class="stats-item">Ne analizitaj: <span class="stats-value" style="color:#dc2626;"><?php echo $not_analyzed_count; ?></span></li>
                        </ul>
                    </div>

                    <?php 
                        /* Output the buffered analysis results */
                        echo $results_html; 
                    ?>
                
                    <p><a href="index.php">← Montri ekzemplojn</a></p>
                
                <?php else: ?>
                    <div id="div-description">
                        Ĉi tiu morfanalizilo analizas Espeanto-vortojn kaj dividas ilin en ties morfojn. La nuna versio nur analizas:<br/>
                        1. <b style="color: #3E8458">radikvortojn</b> (<i>dom-o, ver-a, bon-e, far-is</i>) kun eventualajn afiksojn (<i>mal-ver-a, re-far-is</i>) kaj<br/>
                        2. <b style="color: #3E8458">tabelvortojn</b> (<i>kiu, tio, ĉie, tia</i>) kun eventualajn finaĵojn (<i>kiu-j, tio-n, ĉie-n, tia-j-n</i>),<br/>
                        Sed ankoraŭ ĝi ne analizas:<br/>
                        3. <b style="color: #bb6b6b">vortetojn</b> (<i>mi, de, el, por</i>), nek<br/>
                        4. <b style="color: #bb6b6b">kunmetitajn vortojn</b> (<i>sin-sekv-o, sen-erar-e</I>).<br/>
                        Bonvolu kontroli ĝiajn respondojn kaj komuniki eventualaj eraron al la
                        <a href="mailto:a.vaccari@gmail.com&subject=Esperanto-Morfoanalizilo">programisto</a>.
                    </div>
                    
                    <div id="div-examples-title">Ekzemploj:</div>
                    <?php 
                        $analyzer = new WordAnalyzer();
                        $test = ['malsanulejon', 'belegaj', 'malametaj', 'remanĝetegindas', 'plenumita'];
                        foreach ($test as $t) {
                            echo "<div class='result'>";
                            echo "<div class='analysis'>" . htmlspecialchars($t) . "</div>";
                            echo $analyzer->analyze($t);
                            echo "</div>";
                        }
                    ?>
                <?php endif; ?>
            </div>
        </div>
        
        <script src="js/page.js"></script>
    </body>
</html>