<?php
    require_once 'prolog.php';

    // Recupero la parola dal POST
    $testo_da_analizzare = $_POST['parola'] ?? null;
?>
<!DOCTYPE html>
<html lang="eo">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Esperanta Morfanalizilo (Prolog-Versio 1.0)</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="container">
            <h1>Esperanta Morfanalizilo (Prolog-Versio 1.0)</h1>

            <form method="POST" action="" class="search-box">
				<textarea name="parola" placeholder="Enigu tekston (ekz.: malsanulejon)..."><?php echo htmlspecialchars($testo_da_analizzare) ?></textarea>
                <button type="submit">Analizi</button>
            </form>

            <div class="content">
                <?php if ($testo_da_analizzare): ?>
                    <div class="risultato">
                        <?php 
                            // Se l'utente inserisce una frase, la dividiamo e analizziamo parola per parola
                            $words = explode(' ', trim($testo_da_analizzare));
                            foreach ($words as $word) {
                                if (count($words) > 1) echo "<div class='descrizione'>$word:</div>";
                                echo prolog_analyze($word);
                            }
                        ?>
                    </div>
                    <p><a href="index.php">← Montri ekzemplojn</a></p>
                
                <?php else: ?>
                    <div class="footer-info">
                        Bonvolu atenti: ĉi tiu morfanalizilo estas nova versio bazita sur Prolog...
                    </div>
                    
                    <div class="esempio-titolo">Ekzemploj:</div>
                    <?php 
                        $test = ['malsanulejon', 'belegaj', 'malametaj', 'remanĝetegindas', 'plenumita'];
                        foreach ($test as $t) {
                            echo "<div class='risultato'>";
                            echo "<div class='descrizione'>" . htmlspecialchars($t) . "</div>";
                            echo prolog_analyze($t);
                            echo "</div>";
                        }
                    ?>
                <?php endif; ?>
            </div>
        </div>
    </body>
</html>