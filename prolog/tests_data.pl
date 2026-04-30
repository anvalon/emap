% -----------------------------------------------------------------
% File: tests_data.pl
% Project: Esperanto Morphological Analyzer
% Description: Test Suite Database.
%              Contains positive, negative, and writing system 
%              test cases with logical categorization.
% -----------------------------------------------------------------

% --- Database Initialization ---
:- abolish(test_case/3).    % Ensure we start from a clean slate every time the file is consulted
:- dynamic test_case/3.     % Declares test_case/3 as dynamic so it can be managed at runtime.

% --- Test Suite Database ---

% -----------------------------------------------------------------
% --- Section: POSITIVE TESTS
% -----------------------------------------------------------------
test_case(info, "-----------------------------", _).
test_case(info, "POSITIVE TESTS", _).
test_case(info, "-----------------------------", _).

% --- Section: NOUNS & INFLECTIONS ---
% Basic nouns with plural and accusative markers.
test_case(blank, _, _).
test_case(info, "NOUNS & INFLECTIONS", _).
% ---
test_case(pos, "libro",  'libr-o').
test_case(pos, "domo",   'dom-o').
test_case(pos, "domon",  'dom-o-n').
test_case(pos, "domoj",  'dom-o-j').
test_case(pos, "domojn", 'dom-o-j-n').

% --- Section: ADJECTIVES & ADVERBS ---
% Adjectival and adverbal forms, including participles used as modifiers.
test_case(blank, _, _).
test_case(info, "ADJECTIVES & ADVERBS", _).
% ---
test_case(pos, "bela",   'bel-a').
test_case(pos, "belan",  'bel-a-n').
test_case(pos, "belaj",  'bel-a-j').
test_case(pos, "belajn", 'bel-a-j-n').

% --- Section: VERBS & TENSES ---
% Simple verbal forms including finite tenses and infinitives.
test_case(blank, _, _).
test_case(info, "VERBS & TENSES", _).
% ---
test_case(pos, "dormi",  'dorm-i').
test_case(pos, "dormas", 'dorm-as').
test_case(pos, "dormis", 'dorm-is').
test_case(pos, "dormos", 'dorm-os').
test_case(pos, "dormus", 'dorm-us').
test_case(pos, "dormu",  'dorm-u').

% --- Section: PREFIXES ---
% Words with official prefixes (bo, ĉef, dis, ek, eks, ge, mal, mis, pra, re)
test_case(blank, _, _).
test_case(info, "PREFIXES", _).
% ---
test_case(pos, "bofrato",   'bo-frat-o').
test_case(pos, "ĉefurbo",   'ĉef-urb-o').
test_case(pos, "disigi",    'dis-ig-i').
test_case(pos, "ekiri",     'ek-ir-i').
test_case(pos, "eksedzo",   'eks-edz-o').
test_case(pos, "gepatro",   'ge-patr-o').
test_case(pos, "malamo",    'mal-am-o').
test_case(pos, "misskribi", 'mis-skrib-i').
test_case(pos, "pratempo",  'pra-temp-o').
test_case(pos, "reveni",    're-ven-i').

% --- Section: MORE PREFIXES ---
% Words with more official prefixes
test_case(blank, _, _).
test_case(info, "MORE PREFIXES", _).
% ---
test_case(pos, "eksbofrato",  'eks-bo-frat-o').
test_case(pos, "eksgepatro",  'eks-ge-patr-o').
test_case(pos, "malreveni",   'mal-re-ven-i').
test_case(pos, "praĉefurbo",  'pra-ĉef-urb-o').
test_case(pos, "reekiri",     're-ek-ir-i').

% --- Section: SUFFIXES ---
% Words with official suffixes
% (ad, an, ant, ar, at, aĉ, aĵ, ĉj, ebl, ec, eg, ej, em, end, er, estr, et, id, ig, iĝ, il, in, ind, ing, int, ism, ist, it, nj, obl, on, ont, op, ot, uj, ul, um)
test_case(blank, _, _).
test_case(info, "SUFFIXES", _).
% ---
test_case(pos, "beleco",     'bel-ec-o').
test_case(pos, "beleta",     'bel-et-a').
test_case(pos, "brakumi",    'brak-um-i').
test_case(pos, "domaĉo",     'dom-aĉ-o').
test_case(pos, "evitinda",   'evit-ind-a').
test_case(pos, "fermilo",    'ferm-il-o').
test_case(pos, "glaciaĵo",   'glaci-aĵ-o').
test_case(pos, "grandega",   'grand-eg-a').
test_case(pos, "instruisto", 'instru-ist-o').
test_case(pos, "junulo",     'jun-ul-o').
test_case(pos, "katido",     'kat-id-o').
test_case(pos, "konigi",     'kon-ig-i').
test_case(pos, "kredeble",   'kred-ebl-e').
test_case(pos, "kubismo",    'kub-ism-o').
test_case(pos, "legenda",    'leg-end-a').
test_case(pos, "legita",     'leg-it-a').
test_case(pos, "legota",     'leg-ot-a').
test_case(pos, "lernejo",    'lern-ej-o').
test_case(pos, "lingvano",   'lingv-an-o').
test_case(pos, "manĝata",    'manĝ-at-a').
test_case(pos, "monujo",     'mon-uj-o').
test_case(pos, "parolado",   'parol-ad-o').
test_case(pos, "pasinta",    'pas-int-a').
test_case(pos, "ridante",    'rid-ant-e').
test_case(pos, "ridema",     'rid-em-a').
test_case(pos, "sidiĝi",     'sid-iĝ-i').
test_case(pos, "testero",    'test-er-o').
test_case(pos, "urbestro",   'urb-estr-o').
test_case(pos, "venonta",    'ven-ont-a').
test_case(pos, "virino",     'vir-in-o').
test_case(pos, "vortaro",    'vort-ar-o').
test_case(pos, "ŝraŭbingo",  'ŝraŭb-ing-o').

/*
% --- Section: SUFFIX "i" (national) ---
% Words with more official suffixes
test_case(blank, _, _).
test_case(info, "SUFFIX i (national)", _).
% ---
% --- TEST RADICI NAZIONALI (Paesi: rad-i-o) ---
test_case(pos, "Abĥazio",      'abĥaz-i-o').
test_case(pos, "Afganio",      'afgan-i-o').
test_case(pos, "Albanio",      'alban-i-o').
test_case(pos, "Alĝerio",      'alĝer-i-o').
test_case(pos, "Amazonio",     'amazon-i-o').
test_case(pos, "Andaluzio",    'andaluz-i-o').
test_case(pos, "Anglio",       'angl-i-o').
test_case(pos, "Arabio",       'arab-i-o').
test_case(pos, "Armenio",      'armen-i-o').
test_case(pos, "Aŭstrio",      'aŭstr-i-o').
test_case(pos, "Aŭstralio",    'aŭstral-i-o').
test_case(pos, "Baltio",       'balt-i-o').
test_case(pos, "Bavario",      'bavar-i-o').
test_case(pos, "Belgio",       'belg-i-o').
test_case(pos, "Belorusio",    'belorus-i-o').
test_case(pos, "Bengalio",     'bengal-i-o').
test_case(pos, "Bolivio",      'boliv-i-o').
test_case(pos, "Bosnio",       'bosn-i-o').
test_case(pos, "Bretonio",     'breton-i-o').
test_case(pos, "Britio",       'brit-i-o').
test_case(pos, "Bulgario",     'bulgar-i-o').
test_case(pos, "Ĉeĉenio",      'ĉeĉen-i-o').
test_case(pos, "Ĉeĥio",        'ĉeĥ-i-o').
test_case(pos, "Ĉilio",        'ĉil-i-o').
test_case(pos, "Ĉinio",        'ĉin-i-o').
test_case(pos, "Danio",        'dan-i-o').
test_case(pos, "Egiptio",      'egipt-i-o').
test_case(pos, "Estonio",      'eston-i-o').
test_case(pos, "Etiopio",      'etiop-i-o').
test_case(pos, "Eŭskio",       'eŭsk-i-o').
test_case(pos, "Fiĝio",        'fiĝ-i-o').
test_case(pos, "Flandrio",     'flandr-i-o').
test_case(pos, "Francio",      'franc-i-o').
test_case(pos, "Galegio",      'galeg-i-o').
test_case(pos, "Gambio",       'gamb-i-o').
test_case(pos, "Germanio",     'german-i-o').
test_case(pos, "Ĝibutio",      'ĝibut-i-o').
test_case(pos, "Grekio",       'grek-i-o').
test_case(pos, "Guĝaratio",    'guĝarat-i-o').
test_case(pos, "Haitio",       'hait-i-o').
test_case(pos, "Hispanio",     'hispan-i-o').
test_case(pos, "Hungario",     'hungar-i-o').
test_case(pos, "Indonezio",    'indonez-i-o').
test_case(pos, "Italio",       'ital-i-o').
test_case(pos, "Japanio",      'japan-i-o').
test_case(pos, "Jordanio",     'jordan-i-o').
test_case(pos, "Jugoslavio",   'jugoslav-i-o').
test_case(pos, "Karelio",      'karel-i-o').
test_case(pos, "Kartvelio",    'kartvel-i-o').
test_case(pos, "Katalunio",    'katalun-i-o').
test_case(pos, "Kazaĥio",      'kazaĥ-i-o').
test_case(pos, "Kimrio",       'kimr-i-o').
test_case(pos, "Kirgizio",     'kirgiz-i-o').
test_case(pos, "Kolombio",     'kolomb-i-o').
test_case(pos, "Koreio",       'kore-i-o').
test_case(pos, "Kroatio",      'kroat-i-o').
test_case(pos, "Kurdio",       'kurd-i-o').
test_case(pos, "Latvio",       'latv-i-o').
test_case(pos, "Libio",        'lib-i-o').
test_case(pos, "Liberio",      'liber-i-o').
test_case(pos, "Litovio",      'litov-i-o').
test_case(pos, "Lucio",        'luc-i-o').
test_case(pos, "Makedonio",    'makedon-i-o').
test_case(pos, "Malio",        'mal-i-o').
test_case(pos, "Malajzio",     'malajz-i-o').
test_case(pos, "Malavio",      'malav-i-o').
test_case(pos, "Maŭricio",     'maŭric-i-o').
test_case(pos, "Maŭritanio",   'maŭritan-i-o').
test_case(pos, "Mezopotamio",  'mezopotam-i-o').
test_case(pos, "Mikronezio",   'mikronez-i-o').
test_case(pos, "Misisipio",    'misisip-i-o').
test_case(pos, "Moldavio",     'moldav-i-o').
test_case(pos, "Mongolio",     'mongol-i-o').
test_case(pos, "Namibio",      'namib-i-o').
test_case(pos, "Niĝerio",      'niĝer-i-o').
test_case(pos, "Norvegio",     'norveg-i-o').
test_case(pos, "Okcitanio",    'okcitan-i-o').
test_case(pos, "Osetio",       'oset-i-o').
test_case(pos, "Panĝabio",     'panĝab-i-o').
test_case(pos, "Persio",       'pers-i-o').
test_case(pos, "Portugalio",   'portugal-i-o').
test_case(pos, "Prusio",       'prus-i-o').
test_case(pos, "Rumanio",      'ruman-i-o').
test_case(pos, "Rusio",        'rus-i-o').
test_case(pos, "Saksio",       'saks-i-o').
test_case(pos, "Sameio",       'same-i-o').
test_case(pos, "Sardio",       'sard-i-o').
test_case(pos, "Serbio",       'serb-i-o').
test_case(pos, "Siberio",      'siber-i-o').
test_case(pos, "Sirio",        'sir-i-o').
test_case(pos, "Skandinavio",  'skandinav-i-o').
test_case(pos, "Slovakio",     'slovak-i-o').
test_case(pos, "Slovenio",     'sloven-i-o').
test_case(pos, "Somalio",      'somal-i-o').
test_case(pos, "Sovetunio",    'sovetun-i-o').
test_case(pos, "Svedio",       'sved-i-o').
test_case(pos, "Taĝikio",      'taĝik-i-o').
test_case(pos, "Tamilio",      'tamil-i-o').
test_case(pos, "Tanzanio",     'tanzan-i-o').
test_case(pos, "Tatario",      'tatar-i-o').
test_case(pos, "Tunizio",      'tuniz-i-o').
test_case(pos, "Turkio",       'turk-i-o').
test_case(pos, "Turkmenio",    'turkmen-i-o').
test_case(pos, "Tuvio",        'tuv-i-o').
test_case(pos, "Ukrainio",     'ukrain-i-o').
test_case(pos, "Uzbekio",      'uzbek-i-o').
test_case(pos, "Valonio",      'valon-i-o').
test_case(pos, "Vestfalio",    'vestfal-i-o').
test_case(pos, "Vjetnamio",    'vjetnam-i-o').
test_case(pos, "Zambio",       'zamb-i-o').

% --- Section: SUFFIX "t" (numeral) ---
% Words with more official suffixes
test_case(blank, _, _).
test_case(info, "SUFFIX t (numeral)", _).
% ---
test_case(pos, "duuo",     'du-t-o').
test_case(pos, "trito",    'tri-t-o').
test_case(pos, "kvarto",   'kvar-t-o').
test_case(pos, "kvinto",   'kvin-t-o').
test_case(pos, "sesto",    'ses-t-o').
test_case(pos, "septo",    'sep-t-o').
test_case(pos, "okto",     'ok-t-o').
test_case(pos, "naŭto",    'naŭ-t-o').
test_case(pos, "dekto",    'dek-t-o').
*/

% --- Section: MORE SUFFIXES ---
% Words with more official suffixes
test_case(blank, _, _).
test_case(info, "MORE SUFFIXES", _).
% ---
test_case(pos, "belegeco",    'bel-eg-ec-o').
test_case(pos, "dometaĉo",    'dom-et-aĉ-o').
test_case(pos, "glaciaĵero",  'glaci-aĵ-er-o').
test_case(pos, "kredebleco",  'kred-ebl-ec-o').
test_case(pos, "lernejestro", 'lern-ej-estr-o').
test_case(pos, "lingvanaro",  'lingv-an-ar-o').
test_case(pos, "paroladejo",  'parol-ad-ej-o').
test_case(pos, "ridendema",   'rid-end-em-a').
test_case(pos, "ridetante",   'rid-et-ant-e').
test_case(pos, "testarero",   'test-ar-er-o').
test_case(pos, "vortarego",   'vort-ar-eg-o').

% --- Section: MORE PREFIXES AND SUFFIXES ---
% Words with more official prefixes and suffixes
test_case(blank, _, _).
test_case(info, "MORE PREFIXES AND SUFFIXES", _).
% ---
test_case(pos, "ĉefanaro",     'ĉef-an-ar-o').
test_case(pos, "dispraino",    'dis-pra-in-o').
test_case(pos, "disreigi",     'dis-re-ig-i').
test_case(pos, "eksboujeco",   'eks-bo-uj-ec-o').
test_case(pos, "eksejestro",   'eks-ej-estr-o').
test_case(pos, "geiĝo",        'ge-iĝ-o').
test_case(pos, "malegeco",     'mal-eg-ec-o').
test_case(pos, "maleti",       'mal-et-i').
test_case(pos, "malendema",    'mal-end-em-a').
test_case(pos, "misetante",    'mis-et-ant-e').
test_case(pos, "praarego",     'pra-ar-eg-o').
test_case(pos, "redisenda",    're-dis-end-a').
test_case(pos, "reegoj",       're-eg-o-j').
test_case(pos, "reetegindas",  're-et-eg-ind-as').


% --- Section: MORE PREFIXES AND SUFFIXES ---
% Words with more official prefixes and suffixes
test_case(blank, _, _).
test_case(info, "MORE PREFIXES AND SUFFIXES", _).
% ---
test_case(pos, "ĉeflingvanaro",            'ĉef-lingv-an-ar-o').
test_case(pos, "dispraulino",              'dis-pra-ul-in-o').
test_case(pos, "disrekonigi",              'dis-re-kon-ig-i').
test_case(pos, "eksbopatrujeco",           'eks-bo-patr-uj-ec-o').
test_case(pos, "ekslernejestro",           'eks-lern-ej-estr-o').
test_case(pos, "geedziĝo",                 'ge-edz-iĝ-o').
test_case(pos, "malbelegeco",              'mal-bel-eg-ec-o').
test_case(pos, "malmanĝeti",               'mal-manĝ-et-i').
test_case(pos, "malridendema",             'mal-rid-end-em-a').
test_case(pos, "misridetante",             'mis-rid-et-ant-e').
test_case(pos, "pravortarego",             'pra-vort-ar-eg-o').
test_case(pos, "redislegenda",             're-dis-leg-end-a').
test_case(pos, "remanĝegoj",               're-manĝ-eg-o-j').
test_case(pos, "remanĝetegindas",          're-manĝ-et-eg-ind-as').
test_case(pos, "eksprabopatraranestrino",  'eks-pra-bo-patr-ar-an-estr-in-o').

% --- Section: COMPLEX DERIVATIONS ---
% Words with multiple affixes (prefixes, suffixes) and compounds.
test_case(blank, _, _).
test_case(info, "COMPLEX DERIVATIONS", _).
% ---
test_case(pos, "orfonto", 'orf-ont-o').
test_case(pos, "praulon", 'pra-ul-o-n').

% --- Section: WRITING SYSTEMS ---
% These cases test the normalization of X-system, H-system, and Caret notation.
test_case(blank, _, _).
test_case(info, "WRITING SYSTEMS", _).
% ---
test_case(pos, "mangxas",  'manĝ-as').
test_case(pos, "manghas",  'manĝ-as').
test_case(pos, "mang^as",  'manĝ-as').
test_case(pos, "sxatataj", 'ŝat-at-a-j').
test_case(pos, "shatataj", 'ŝat-at-a-j').
test_case(pos, "s^atataj", 'ŝat-at-a-j').

% --- Section: CORRELATIVES ---
% These cases abaout correlatives.
test_case(blank, _, _).
test_case(info, "CORRELATIVES", _).
% ---
% Root "ki"
test_case(pos, "kiu",     'kiu').
test_case(pos, "kiun",    'kiu-n').
test_case(pos, "kiuj",    'kiu-j').
test_case(pos, "kiujn",   'kiu-j-n').
test_case(pos, "kia",     'kia').
test_case(pos, "kian",    'kia-n').
test_case(pos, "kiaj",    'kia-j').
test_case(pos, "kiajn",   'kia-j-n').
test_case(pos, "kio",     'kio').
test_case(pos, "kion",    'kio-n').
test_case(pos, "kie",     'kie').
test_case(pos, "kien",    'kie-n').
test_case(pos, "kiam",    'kiam').
test_case(pos, "kiama",   'kiam-a').
test_case(pos, "kiaman",  'kiam-a-n').
test_case(pos, "kiamaj",  'kiam-a-j').
test_case(pos, "kiamajn", 'kiam-a-j-n').
test_case(pos, "kial",    'kial').
test_case(pos, "kiel",    'kiel').
test_case(pos, "kies",    'kies').
test_case(pos, "kiom",    'kiom').
test_case(pos, "kioma",   'kiom-a').
test_case(pos, "kioman",  'kiom-a-n').
test_case(pos, "kiomaj",  'kiom-a-j').
test_case(pos, "kiomajn", 'kiom-a-j-n').
% Root "ti"
test_case(pos, "tiu",     'tiu').
test_case(pos, "tiun",    'tiu-n').
test_case(pos, "tiuj",    'tiu-j').
test_case(pos, "tiujn",   'tiu-j-n').
test_case(pos, "tia",     'tia').
test_case(pos, "tian",    'tia-n').
test_case(pos, "tiaj",    'tia-j').
test_case(pos, "tiajn",   'tia-j-n').
test_case(pos, "tio",     'tio').
test_case(pos, "tion",    'tio-n').
test_case(pos, "tie",     'tie').
test_case(pos, "tien",    'tie-n').
test_case(pos, "tiam",    'tiam').
test_case(pos, "tiama",   'tiam-a').
test_case(pos, "tiaman",  'tiam-a-n').
test_case(pos, "tiamaj",  'tiam-a-j').
test_case(pos, "tiamajn", 'tiam-a-j-n').
test_case(pos, "tial",    'tial').
test_case(pos, "tiel",    'tiel').
test_case(pos, "ties",    'ties').
test_case(pos, "tiom",    'tiom').
test_case(pos, "tioma",   'tiom-a').
test_case(pos, "tioman",  'tiom-a-n').
test_case(pos, "tiomaj",  'tiom-a-j').
test_case(pos, "tiomajn", 'tiom-a-j-n').
% Root "ĉi"
test_case(pos, "ĉiu",     'ĉiu').
test_case(pos, "ĉiun",    'ĉiu-n').
test_case(pos, "ĉiuj",    'ĉiu-j').
test_case(pos, "ĉiujn",   'ĉiu-j-n').
test_case(pos, "ĉia",     'ĉia').
test_case(pos, "ĉian",    'ĉia-n').
test_case(pos, "ĉiaj",    'ĉia-j').
test_case(pos, "ĉiajn",   'ĉia-j-n').
test_case(pos, "ĉio",     'ĉio').
test_case(pos, "ĉion",    'ĉio-n').
test_case(pos, "ĉie",     'ĉie').
test_case(pos, "ĉien",    'ĉie-n').
test_case(pos, "ĉiam",    'ĉiam').
test_case(pos, "ĉiama",   'ĉiam-a').
test_case(pos, "ĉiaman",  'ĉiam-a-n').
test_case(pos, "ĉiamaj",  'ĉiam-a-j').
test_case(pos, "ĉiamajn", 'ĉiam-a-j-n').
test_case(pos, "ĉial",    'ĉial').
test_case(pos, "ĉiel",    'ĉiel').
test_case(pos, "ĉies",    'ĉies').
test_case(pos, "ĉiom",    'ĉiom').
test_case(pos, "ĉioma",   'ĉiom-a').
test_case(pos, "ĉioman",  'ĉiom-a-n').
test_case(pos, "ĉiomaj",  'ĉiom-a-j').
test_case(pos, "ĉiomajn", 'ĉiom-a-j-n').
% Root "i"
test_case(pos, "iu",     'iu').
test_case(pos, "iun",    'iu-n').
test_case(pos, "iuj",    'iu-j').
test_case(pos, "iujn",   'iu-j-n').
test_case(pos, "ia",     'ia').
test_case(pos, "ian",    'ia-n').
test_case(pos, "iaj",    'ia-j').
test_case(pos, "iajn",   'ia-j-n').
test_case(pos, "io",     'io').
test_case(pos, "ion",    'io-n').
test_case(pos, "ie",     'ie').
test_case(pos, "ien",    'ie-n').
test_case(pos, "iam",    'iam').
test_case(pos, "iama",   'iam-a').
test_case(pos, "iaman",  'iam-a-n').
test_case(pos, "iamaj",  'iam-a-j').
test_case(pos, "iamajn", 'iam-a-j-n').
test_case(pos, "ial",    'ial').
test_case(pos, "iel",    'iel').
test_case(pos, "ies",    'ies').
test_case(pos, "iom",    'iom').
test_case(pos, "ioma",   'iom-a').
test_case(pos, "ioman",  'iom-a-n').
test_case(pos, "iomaj",  'iom-a-j').
test_case(pos, "iomajn", 'iom-a-j-n').
% Root "neni"
test_case(pos, "neniu",     'neniu').
test_case(pos, "neniun",    'neniu-n').
test_case(pos, "neniuj",    'neniu-j').
test_case(pos, "neniujn",   'neniu-j-n').
test_case(pos, "nenia",     'nenia').
test_case(pos, "nenian",    'nenia-n').
test_case(pos, "neniaj",    'nenia-j').
test_case(pos, "neniajn",   'nenia-j-n').
test_case(pos, "nenio",     'nenio').
test_case(pos, "nenion",    'nenio-n').
test_case(pos, "nenie",     'nenie').
test_case(pos, "nenien",    'nenie-n').
test_case(pos, "neniam",    'neniam').
test_case(pos, "neniama",   'neniam-a').
test_case(pos, "neniaman",  'neniam-a-n').
test_case(pos, "neniamaj",  'neniam-a-j').
test_case(pos, "neniamajn", 'neniam-a-j-n').
test_case(pos, "nenial",    'nenial').
test_case(pos, "neniel",    'neniel').
test_case(pos, "nenies",    'nenies').
test_case(pos, "neniom",    'neniom').
test_case(pos, "nenioma",   'neniom-a').
test_case(pos, "nenioman",  'neniom-a-n').
test_case(pos, "neniomaj",  'neniom-a-j').
test_case(pos, "neniomajn", 'neniom-a-j-n').
% Root "neni" extended
test_case(pos, "malnenio",  'mal-neni-o').
test_case(pos, "neniego",   'neni-eg-o').
test_case(pos, "renenieto", 're-neni-et-o').

% --- Section: LETTERS ---
% These cases abaout tinies (standalone roots).
test_case(blank, _, _).
test_case(info, "LETTERS", _).
% ---
% single
test_case(pos, "a",  'a').
test_case(pos, "bo", 'bo').
test_case(pos, "co", 'co').
test_case(pos, "ĉo", 'ĉo').
test_case(pos, "do", 'do').
test_case(pos, "e",  'e').
test_case(pos, "fo", 'fo').
test_case(pos, "go", 'go').
test_case(pos, "ĝo", 'ĝo').
test_case(pos, "ho", 'ho').
test_case(pos, "jo", 'jo').
test_case(pos, "ĵo", 'ĵo').
test_case(pos, "ĥo", 'ĥo').
test_case(pos, "ko", 'ko').
test_case(pos, "lo", 'lo').
test_case(pos, "mo", 'mo').
test_case(pos, "no", 'no').
test_case(pos, "o",  'o').
test_case(pos, "po", 'po').
test_case(pos, "ro", 'ro').
test_case(pos, "so", 'so').
test_case(pos, "ŝo", 'ŝo').
test_case(pos, "to", 'to').
test_case(pos, "u",  'u').
test_case(pos, "ŭo", 'ŭo').
test_case(pos, "vo", 'vo').
test_case(pos, "zo", 'zo').

% --- Section: INVARIANTS ---
% These cases abaout tinies (standalone roots).
test_case(blank, _, _).
test_case(info, "INVARIANTS", _).
% ---
test_case(pos, "almenaŭ",   'almenaŭ').
test_case(pos, "ankaŭ",     'ankaŭ').
test_case(pos, "ĉar",       'ĉar').
test_case(pos, "ĉi",        'ĉi').
test_case(pos, "ĉu",        'ĉu').
test_case(pos, "da",        'da').
test_case(pos, "des",       'des').
test_case(pos, "eĉ",        'eĉ').
test_case(pos, "ha",        'ha').
test_case(pos, "he",        'he').
test_case(pos, "ja",        'ja').
test_case(pos, "je",        'je').
test_case(pos, "ju",        'ju').
test_case(pos, "kaj",       'kaj').
test_case(pos, "ke",        'ke').
test_case(pos, "kvankam",   'kvankam').
test_case(pos, "la",        'la').
test_case(pos, "nek",       'nek').
test_case(pos, "se",        'se').
test_case(pos, "tamen",     'tamen').

% --- Section: TINIES ---
% These cases abaout tinies (standalone roots).
test_case(blank, _, _).
test_case(info, "TINIES", _).
% ---
% single
test_case(pos, "adiaŭ",     'adiaŭ').
test_case(pos, "ajn",       'ajn').
test_case(pos, "al",        'al').
test_case(pos, "ambaŭ",     'ambaŭ').
test_case(pos, "ankoraŭ",   'ankoraŭ').
test_case(pos, "anstataŭ",  'anstataŭ').
test_case(pos, "antaŭ",     'antaŭ').
test_case(pos, "apenaŭ",    'apenaŭ').
test_case(pos, "apud",      'apud').
test_case(pos, "aŭ",        'aŭ').
test_case(pos, "baldaŭ",    'baldaŭ').
test_case(pos, "bis",       'bis').
test_case(pos, "cent",      'cent').
test_case(pos, "ĉe",        'ĉe').
test_case(pos, "ĉirkaŭ",    'ĉirkaŭ').
test_case(pos, "de",        'de').
test_case(pos, "dek",       'dek').
test_case(pos, "du",        'du').
test_case(pos, "dum",       'dum').
test_case(pos, "ek",        'ek').
test_case(pos, "eks",       'eks').
test_case(pos, "ekster",    'ekster').
test_case(pos, "el",        'el').
test_case(pos, "en",        'en').
test_case(pos, "fi",        'fi').
test_case(pos, "for",       'for').
test_case(pos, "ĝi",        'ĝi').
test_case(pos, "ĝis",       'ĝis').
test_case(pos, "halt",      'halt').
test_case(pos, "help",      'help').
test_case(pos, "hieraŭ",    'hieraŭ').
test_case(pos, "hodiaŭ",    'hodiaŭ').
test_case(pos, "hura",      'hura').
test_case(pos, "i",         'i').
test_case(pos, "ili",       'ili').
test_case(pos, "inter",     'inter').
test_case(pos, "jam",       'jam').
test_case(pos, "jen",       'jen').
test_case(pos, "jes",       'jes').
test_case(pos, "ĵus",       'ĵus').
test_case(pos, "kontraŭ",   'kontraŭ').
test_case(pos, "krom",      'krom').
test_case(pos, "kun",       'kun').
test_case(pos, "kvar",      'kvar').
test_case(pos, "kvazaŭ",    'kvazaŭ').
test_case(pos, "kvin",      'kvin').
test_case(pos, "laŭ",       'laŭ').
test_case(pos, "li",        'li').
test_case(pos, "malgraŭ",   'malgraŭ').
test_case(pos, "mem",       'mem').
test_case(pos, "mi",        'mi').
test_case(pos, "mil",       'mil').
test_case(pos, "minus",     'minus').
test_case(pos, "morgaŭ",    'morgaŭ').
test_case(pos, "naŭ",       'naŭ').
test_case(pos, "ne",        'ne').
test_case(pos, "ni",        'ni').
test_case(pos, "nu",        'nu').
test_case(pos, "nul",       'nul').
test_case(pos, "nun",       'nun').
test_case(pos, "nur",       'nur').
test_case(pos, "ok",        'ok').
test_case(pos, "ol",        'ol').
test_case(pos, "oni",       'oni').
test_case(pos, "per",       'per').
test_case(pos, "plej",      'plej').
test_case(pos, "pli",       'pli').
test_case(pos, "plu",       'plu').
test_case(pos, "plus",      'plus').
test_case(pos, "por",       'por').
test_case(pos, "post",      'post').
test_case(pos, "preskaŭ",   'preskaŭ').
test_case(pos, "preter",     'preter').
test_case(pos, "pri",       'pri').
test_case(pos, "pro",       'pro').
test_case(pos, "sed",       'sed').
test_case(pos, "sen",       'sen').
test_case(pos, "sep",       'sep').
test_case(pos, "ses",       'ses').
test_case(pos, "si",        'si').
test_case(pos, "sub",       'sub').
test_case(pos, "super",     'super').
test_case(pos, "sur",       'sur').
test_case(pos, "ŝi",        'ŝi').
test_case(pos, "tra",       'tra').
test_case(pos, "trans",     'trans').
test_case(pos, "tre",       'tre').
test_case(pos, "tri",       'tri').
test_case(pos, "tro",       'tro').
test_case(pos, "tuj",       'tuj').
test_case(pos, "unu",       'unu').
test_case(pos, "ve",        've').
test_case(pos, "vi",        'vi').

% --- Section: TINIES COMPOSED ---
test_case(blank, _, _).
test_case(info, "TINIES COMPOSED", _).
% ---
% composed
test_case(pos, "malankoraŭ", 'mal-ankoraŭ').
test_case(pos, "malantaŭ",   'mal-antaŭ').

% --- Future/Optional Test Cases (Currently Commented Out) ---
% test_case(pos, "amaskomunikilo", 'amas-komunik-il-o'). 
% test_case(pos, "balotrajto", 'balot-rajt-o'). 
% test_case(pos, "ĉiu", 'ĉi-u').
% test_case(pos, "ĉiukazo", 'ĉiu-kaz-o'). 
% test_case(pos, "ĉiuokaze", 'ĉiu-okaz-e').
% test_case(pos, "enmeto", 'en-met-o'). 
% test_case(pos, "interkompreno", 'inter-kompren-o'). 
% test_case(pos, "kunvenado", 'kun-ven-ad-o'). 
% test_case(pos, "kunveno", 'kun-ven-o'). 
% test_case(pos, "lingvonomo", 'lingv-o-nom-o'). 
% test_case(pos, "maltro",          'mal-tro').
% test_case(pos, "neoficiala", 'ne-oficial-a'). 
% test_case(pos, "nombrovorto", 'nombr-o-vort-o'). 
% test_case(pos, "nombrvorto", 'nombr-vort-o'). 
% test_case(pos, "orfonto", 'or-font-o'). 
% test_case(pos, "personkomunumo", 'person-komunum-o'). 
% test_case(pos, "senescepto", 'sen-escept-o'). 
% test_case(pos, "sensilaba", 'sen-silab-a'). 
% test_case(pos, "sensilabo", 'sen-silab-o'). 
% test_case(pos, "siatempa", 'si-a-temp-a'). 
% test_case(pos, "sindevigo", 'si-n-dev-ig-o'). 
% test_case(pos, "sinsekvo", 'si-n-sekv-o'). 
% test_case(pos, "tajperaro", 'tajp-erar-o'). 
% test_case(pos, "lingvĉefanaro",   'lingv-ĉef-an-ar-o').
% test_case(pos, "lingvanĉefaro",   'lingv-an-ĉef-ar-o').
% test_case(pos, "lingvanarĉefo",   'lingv-an-ar-ĉef-o').
% test_case(pos, "bopatreksujeco",  'bo-patr-eks-uj-ec-o').
% test_case(pos, "bopatrujekseco",  'bo-patr-uj-eks-ec-o').

% -----------------------------------------------------------------
% --- Section: NEGATIVE TESTS
% -----------------------------------------------------------------
% 'neg' tests ensure that the segmenter correctly rejects invalid
% strings or grammatically impossible structures.
test_case(blank, _, _).
test_case(info, "-----------------------------", _).
test_case(info, "NEGATIVE TESTS", _).
test_case(info, "-----------------------------", _).
% ---
% -------------------------------------------------------------------------------------------------------------------
% Project:     Esperanto Morphological Analyzer
% File:        negative_test_cases.pl
% Description: This file contains negative test cases for various Esperanto grammatical structures.
%              Each positive case from the original list has been converted to 'neg' with a 'fails' result,
%              reflecting inputs that the analyzer should reject in their current raw form.
% -------------------------------------------------------------------------------------------------------------------

% --- Section: NOUNS & INFLECTIONS ---
% Basic nouns with plural and accusative markers.
test_case(blank, _, _).
test_case(info, "NOUNS & INFLECTIONS", _).
% ---
test_case(neg, "dom",    fails).
test_case(neg, "domn",   fails).
test_case(neg, "domj",   fails).
test_case(neg, "domjn",  fails).

% --- Section: ADJECTIVES & ADVERBS ---
% Adjectival and adverbal forms, including participles used as modifiers.
test_case(blank, _, _).
test_case(info, "ADJECTIVES & ADVERBS", _).
% ---
test_case(neg, "bel",    fails).
test_case(neg, "beln",   fails).
test_case(neg, "belj",   fails).
test_case(neg, "beljn",  fails).

% --- Section: VERBS & TENSES ---
% Simple verbal forms including finite tenses and infinitives.
test_case(blank, _, _).
test_case(info, "VERBS & TENSES", _).
% ---
test_case(neg, "dorm",   fails).
test_case(neg, "dorms",  fails).
test_case(neg, "dormes", fails).

% --- Section: PREFIXES ---
% Words with official prefixes (bo, ĉef, dis, ek, eks, ge, mal, mis, pra, re)
test_case(blank, _, _).
test_case(info, "PREFIXES", _).
% ---
test_case(neg, "ĉef",    fails).
test_case(neg, "dis",    fails).
test_case(neg, "ge",     fails).
test_case(neg, "mal",    fails).
test_case(neg, "mis",    fails).
test_case(neg, "pra",    fails).
test_case(neg, "rev",    fails).

% --- Section: MORE PREFIXES ---
% Words with more official prefixes
test_case(blank, _, _).
test_case(info, "MORE PREFIXES", _).
% ---
test_case(neg, "eksge",   fails).
test_case(neg, "malre",   fails).
test_case(neg, "praĉef",  fails).

% --- Section: SUFFIXES ---
% Words with official suffixes
test_case(blank, _, _).
test_case(info, "SUFFIXES", _).
% ---
test_case(neg, "ec",     fails).
test_case(neg, "et",     fails).
test_case(neg, "um",     fails).
test_case(neg, "aĉ",     fails).
test_case(neg, "ind",    fails).
test_case(neg, "il",     fails).
test_case(neg, "aĵ",     fails).
test_case(neg, "eg",     fails).
test_case(neg, "ist",    fails).
test_case(neg, "ul",     fails).
test_case(neg, "id",     fails).
test_case(neg, "ig",     fails).
test_case(neg, "ebl",    fails).
test_case(neg, "ism",    fails).
test_case(neg, "end",    fails).
test_case(neg, "it",     fails).
test_case(neg, "ot",     fails).
test_case(neg, "ej",     fails).
test_case(neg, "an",     fails).
test_case(neg, "at",     fails).
test_case(neg, "uj",     fails).
test_case(neg, "ad",     fails).
test_case(neg, "int",    fails).
test_case(neg, "ant",    fails).
test_case(neg, "em",     fails).
test_case(neg, "iĝ",     fails).
test_case(neg, "er",     fails).
test_case(neg, "estr",   fails).
test_case(neg, "ont",    fails).
test_case(neg, "in",     fails).
test_case(neg, "ar",     fails).
test_case(neg, "ing",    fails).

/*
% --- Section: SUFFIX "i" (national) ---
% Words with more official suffixes
test_case(blank, _, _).
test_case(info, "SUFFIX i (national)", _).
% ---
% --- TEST RADICI NAZIONALI (Paesi: rad-i-o) ---
test_case(neg, "librio", fails).
test_case(neg, "domio", fails).

% --- Section: SUFFIX "t" (numeral) ---
% Words with more official suffixes
test_case(blank, _, _).
test_case(info, "SUFFIX t (numeral)", _).
% ---
test_case(neg, "deto",  'fails').
test_case(neg, "ĉirkaŭto",  'fails').
*/

% --- Section: MORE SUFFIXES ---
% Words with more official suffixes
test_case(blank, _, _).
test_case(info, "MORE SUFFIXES", _).
% ---
test_case(neg, "egec",   fails).
test_case(neg, "etaĉ",   fails).
test_case(neg, "aĵer",   fails).
test_case(neg, "eblec",  fails).
test_case(neg, "ejestr", fails).
test_case(neg, "anar",   fails).
test_case(neg, "adej",   fails).
test_case(neg, "endem",  fails).
test_case(neg, "etant",  fails).
test_case(neg, "arer",   fails).
test_case(neg, "areg",   fails).

% --- Section: CORRELATIVES ---
% These cases about correlatives.
test_case(blank, _, _).
test_case(info, "CORRELATIVES", _).
% ---
% Root "ki"
test_case(neg, "ki",      fails).
test_case(neg, "kin",     fails).
test_case(neg, "kij",     fails).
test_case(neg, "kijn",    fails).
test_case(neg, "kim",     fails).
test_case(neg, "kil",     fails).
test_case(neg, "kis",     fails).
% Root "ti"
test_case(neg, "ti",      fails).
test_case(neg, "tin",     fails).
test_case(neg, "tij",     fails).
test_case(neg, "tijn",    fails).
test_case(neg, "tim",     fails).
test_case(neg, "til",     fails).
test_case(neg, "tis",     fails).
% Root "ĉi"
test_case(neg, "ĉin",     fails).
test_case(neg, "ĉij",     fails).
test_case(neg, "ĉijn",    fails).
test_case(neg, "ĉim",     fails).
test_case(neg, "ĉil",     fails).
test_case(neg, "ĉis",     fails).
test_case(neg, "ĉim",     fails).
% Root "i"
test_case(neg, "in",      fails).
test_case(neg, "ij",      fails).
test_case(neg, "ijn",     fails).
test_case(neg, "im",      fails).
test_case(neg, "ima",     fails).
test_case(neg, "iman",    fails).
test_case(neg, "imaj",    fails).
test_case(neg, "imajn",   fails).
test_case(neg, "il",      fails).
test_case(neg, "is",      fails).
test_case(neg, "im",      fails).
test_case(neg, "ima",     fails).
test_case(neg, "iman",    fails).
test_case(neg, "imaj",    fails).
test_case(neg, "imajn",   fails).
% Root "neni"
test_case(neg, "neni",    fails).
test_case(neg, "nenin",   fails).
test_case(neg, "nenij",   fails).
test_case(neg, "nenijn",  fails).
test_case(neg, "nenim",   fails).
test_case(neg, "nenima",  fails).
test_case(neg, "neniman", fails).
test_case(neg, "nenimaj", fails).
test_case(neg, "nenimajn", fails).
test_case(neg, "nenil",    fails).
test_case(neg, "nenis",    fails).
test_case(neg, "nenim",    fails).
test_case(neg, "nenima",   fails).
test_case(neg, "neniman",  fails).
test_case(neg, "nenimaj",  fails).
test_case(neg, "nenimajn", fails).
%More correlatives
test_case(neg, "ki",        fail).
test_case(neg, "kiego",     fail).
test_case(neg, "rekieto",   fail).
test_case(neg, "ti",        fail).
test_case(neg, "tiego",     fail).
test_case(neg, "ekstieto",  fail).
test_case(neg, "neni",      fail).
test_case(neg, "maltio",    fail).
test_case(neg, "malkio",    fail).

% --- Section: LETTERS ---
% Tetst cases about lettere.
test_case(blank, _, _).
test_case(info, "LETTERS", _).
% ---
% Letter with ending
test_case(neg, "ao", fails).
test_case(neg, "boa", fails).
test_case(neg, "coe", fails).
test_case(neg, "ĉoa", fails).
test_case(neg, "doo", fails).
test_case(neg, "ea", fails).
test_case(neg, "foo", fails).
test_case(neg, "goe", fails).
test_case(neg, "ĝoai", fails).
test_case(neg, "hoa", fails).
test_case(neg, "joo", fails).
test_case(neg, "ĵoa", fails).
test_case(neg, "ĥoe", fails).
test_case(neg, "koa", fails).
test_case(neg, "loo", fails).
test_case(neg, "moe", fails).
test_case(neg, "noa", fails).
test_case(neg, "oa", fails).
test_case(neg, "poo", fails).
test_case(neg, "roe", fails).
test_case(neg, "soa", fails).
test_case(neg, "ŝoo", fails).
test_case(neg, "toe", fails).
test_case(neg, "uo", fails).
test_case(neg, "ŭoa", fails).
test_case(neg, "voo", fails).
test_case(neg, "zoe", fails).
% Letter with prefix
test_case(neg, "boa", fails).
test_case(neg, "prabo", fails).
test_case(neg, "boco", fails).
test_case(neg, "malĉo", fails).
test_case(neg, "redo", fails).
test_case(neg, "boe", fails).
test_case(neg, "disfo", fails).
test_case(neg, "bogo", fails).
test_case(neg, "eksĝo", fails).
test_case(neg, "malho", fails).
test_case(neg, "rejo", fails).
test_case(neg, "boĵo", fails).
test_case(neg, "reĥo", fails).
test_case(neg, "malko", fails).
test_case(neg, "pralo", fails).
test_case(neg, "bomo", fails).
test_case(neg, "malno", fails).
test_case(neg, "mallo", fails).
test_case(neg, "malpo", fails).
test_case(neg, "praro", fails).
test_case(neg, "reso", fails).
test_case(neg, "malŝo", fails).
test_case(neg, "eksto", fails).
test_case(neg, "bou", fails).
test_case(neg, "reŭo", fails).
test_case(neg, "eksvo", fails).
test_case(neg, "rezo", fails).

% --- Section: INVARIANTS (Negatives) ---
% Test Desinenza | Test Prefisso
test_case(blank, _, _).
test_case(info, "INVARIANTS", _).
% ---
% Invariant with ending
test_case(neg, "almenaŭo", fails).
test_case(neg, "ankaŭa", fails).
test_case(neg, "ĉius", fails).
test_case(neg, "ĉua", fails).
test_case(neg, "dao", fails).
test_case(neg, "deso", fails).
test_case(neg, "eĉa", fails).
test_case(neg, "hao", fails).
test_case(neg, "hea", fails).
test_case(neg, "jaa", fails).
test_case(neg, "jeo", fails).
test_case(neg, "juo", fails).
test_case(neg, "kaja", fails).
test_case(neg, "keo", fails).
test_case(neg, "kvankama", fails).
test_case(neg, "lao", fails).
test_case(neg, "neko", fails).
test_case(neg, "sea", fails).
% Invariant with prefix
test_case(neg, "malalmenaŭ", fails).
test_case(neg, "neankaŭ", fails).
test_case(neg, "reĉar", fails).
test_case(neg, "boĉi", fails).
test_case(neg, "ekĉu", fails).
test_case(neg, "malda", fails).
test_case(neg, "redes", fails).
test_case(neg, "boeĉ", fails).
test_case(neg, "reha", fails).
test_case(neg, "malhe", fails).
test_case(neg, "eksja", fails).
test_case(neg, "malje", fails).
test_case(neg, "reju", fails).
test_case(neg, "nekaj", fails).
test_case(neg, "ekke", fails).
test_case(neg, "rekvankam", fails).
test_case(neg, "malla", fails).
test_case(neg, "bonek", fails).
test_case(neg, "rese", fails).

% --- Section: MORE ---
% These cases about correlatives.
test_case(blank, _, _).
test_case(info, "MORE", _).
% ---
test_case(neg, "antmanĝi", fail).
test_case(neg, "as",       fail).
test_case(neg, "badabum",  fail).
test_case(neg, "iomanĝi",  fail).
test_case(neg, "malmanĝ",  fail).
test_case(neg, "manĝ",     fail).
test_case(neg, "manĝas n", fail).
test_case(neg, "manĝasas", fail).
test_case(neg, "manĝasj",  fail).
test_case(neg, "manĝi-i",  fail).
test_case(neg, "manĝio",   fail).
test_case(neg, "manĝj",    fail).
test_case(neg, "manĝn",    fail).
test_case(neg, "manĝnn",   fail).
