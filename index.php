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
        <style>
            body { font-family: sans-serif; line-height: 1.6; max-width: 800px; margin: 0px auto; padding: 0 15px; color: #333; }
            .container { background: #f9f9f9; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
            h1 { color: #2e7d32; margin-top: 0 }

            /* Stile del Form */
            .search-box { display: flex; gap: 10px; margin-bottom: 15px; }
            textarea { flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px; }
            button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; font-weight: bold; }
            button:hover { background-color: #45a049; }

            /* Stile Risultati */
            .risultato { background: white; padding: 15px; border-left: 5px solid #4CAF50; margin-bottom: 10px; border-radius: 4px; }
			.invalido { border-left: 5px solid #dc2626; font-style: italic }
            .scomposizione:not(:last-child) { margin-bottom: 1em; }
            .esempio-titolo { margin-top: 30px; font-weight: bold; color: #666; border-bottom: 1px solid #ddd; }
            .footer-info { font-size: 0.8em; color: #777; margin-top: 10px; }

            .descrizione { font-weight:bold; margin-top: 0; margin-bottom: .2em; font-family:sans-serif; }
            .analizero { font-size:1.2em; font-weight:bold; display:block; margin-bottom: 2px; }

            /* Stile base delle tessere */
            .morfemo {
            	display: inline-block;
            	vertical-align: top;
            	margin-right: .3em;
            	margin-bottom: .3em;
            	text-align: center;
            	font-weight:bold;
            	font-family: 'Segoe UI', Tahoma, sans-serif;
            	border-width: 1px;
            	border-style: solid;
            	border-radius: 4px;
            	padding: 4px 6px;
            	box-shadow: 0 1px 2px rgba(0,0,0,0.05); /* Leggera profondità */
            }

            .morfemo.prefikso	{ background-color: #fef3c7; border-color: #f59e0b; color: #92400e; } /* Giallo miele */
            .morfemo.radiko		{ background-color: #dcfce7; border-color: #22c55e; color: #166534; } /* Verde salvia */
            .morfemo.sufikso	{ background-color: #dbeafe; border-color: #3b82f6; color: #1e40af; } /* Blu pastello */
            .morfemo.finaĵo		{ background-color: #fecaca; border-color: #dc2626; color: #7f1d1d; } /* Rosso profondo */

            .etikedo			{ display: block; font-size: 0.70em; opacity: 0.7; }
  		  </style>
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