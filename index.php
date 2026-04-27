<?php
    require_once 'analyzer.php';

    // Recupero la parola dal POST
    $testo_da_analizzare = $_POST['input'] ?? null;
?>
<!DOCTYPE html>
<html lang="eo">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Esperanta Morfanalizilo (Prolog-Versio 1.0)</title>

        <!-- CSS -->
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/form.css">
        <link rel="stylesheet" href="css/page.css">
        <link rel="stylesheet" href="css/morphs.css">
    </head>

    <body>
        <div id="div-container">
            
            <h1>Esperanto-Morfanalizilo <span style="color: #bb6b6b">0.1</span></h1>

            <form method="POST" action="" id="frm-search">
				<textarea id="txt-input" name="input" placeholder="Enigu tekston (ekz.: malsanulejon)..."><?php echo htmlspecialchars($testo_da_analizzare) ?></textarea>
                <button type="submit">Analizi</button>
            </form>

            <div id="div-content">
                <?php if ($testo_da_analizzare): ?>
                    <?php 
                        $analyzer = new Analyzer();
                        $words = explode(' ', trim($testo_da_analizzare));
                        
                        foreach ($words as $word) {
                            if (empty($word)) continue;
                            echo "<div class='result'>";
                            echo "<div class='analysis'>" . htmlspecialchars($word) . "</div>";
                            echo $analyzer->analyze($word);;
                            echo "</div>";
                        }
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
                        $analyzer = new Analyzer();
                        $test = ['malsanulejon', 'belegaj', 'malametaj', 'remanĝetegindas', 'plenumita'];
                        foreach ($test as $t) {
                            echo "<div class='result'>";
                            echo "<div class='analysis'>" . htmlspecialchars($t) . "</div>";
                            echo $analyzer->analyze($t);;
                            echo "</div>";
                        }
                    ?>
                <?php endif; ?>
            </div>
        </div>
        
        <!-- JavaScript -->
        <script src="js/page.js"></script>
    </body>
</html>