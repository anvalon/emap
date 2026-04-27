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
% Words with official suffixes (ad, an, ant, ar, at, aĉ, aĵ, ĉj, ebl, ec, eg, ej, em, end, er, estr, et, id, ig, iĝ, il, in, ind, ing, int, ism, ist, it, nj, obl, on, ont, op, ot, uj, ul, um)
test_case(blank, _, _).
test_case(info, "SUFFIXES", _).
% ---
test_case(pos, "beleco",     'bel-ec-o').
test_case(pos, "beleta",     'bel-et-a').
test_case(pos, "brakumi",    'brak-um-i').
test_case(pos, "domaĉo",     'dom-aĉ-o').
test_case(pos, "duoble",     'du-obl-e').
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
test_case(pos, "kvarope",    'kvar-op-e').
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
test_case(pos, "triono",     'tri-on-o').
test_case(pos, "urbestro",   'urb-estr-o').
test_case(pos, "venonta",    'ven-ont-a').
test_case(pos, "virino",     'vir-in-o').
test_case(pos, "vortaro",    'vort-ar-o').
test_case(pos, "ŝraŭbingo",  'ŝraŭb-ing-o').

% --- Section: MORE SUFFIXES ---
% Words with more official suffixes
test_case(blank, _, _).
test_case(info, "MORE SUFFIXES", _).
% ---
test_case(pos, "belegeco",    'bel-eg-ec-o').
test_case(pos, "dometaĉo",    'dom-et-aĉ-o').
test_case(pos, "glaciaĵero",  'glaci-aĵ-er-o').
test_case(pos, "kredebleco",  'kred-ebl-ec-o').
test_case(pos, "legenda",     'leg-end-a').
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
test_case(pos, "ĉeflingvanaro",   'ĉef-lingv-an-ar-o').
test_case(pos, "dispraulino",     'dis-pra-ul-in-o').
test_case(pos, "disrekonigi",     'dis-re-kon-ig-i').
test_case(pos, "eksbopatrujeco",  'eks-bo-patr-uj-ec-o').
test_case(pos, "ekslernejestro",  'eks-lern-ej-estr-o').
test_case(pos, "geedziĝo",        'ge-edz-iĝ-o').
test_case(pos, "malbelegeco",     'mal-bel-eg-ec-o').
test_case(pos, "malmanĝeti",      'mal-manĝ-et-i').
test_case(pos, "malridendema",    'mal-rid-end-em-a').
test_case(pos, "misridetante",    'mis-rid-et-ant-e').
test_case(pos, "pravortarego",    'pra-vort-ar-eg-o').
test_case(pos, "redislegenda",    're-dis-leg-end-a').
test_case(pos, "remanĝegoj",      're-manĝ-eg-o-j').
test_case(pos, "remanĝetegindas", 're-manĝ-et-eg-ind-as').

% --- Section: SUFFIX-PREFIX INVERSION ---
% test_case(blank, _, _).
% test_case(info, "SUFFIX-PREFIX INVERSION", _).
% ---
% test_case(pos, "lingvĉefanaro",   'lingv-ĉef-an-ar-o').
% test_case(pos, "lingvanĉefaro",   'lingv-an-ĉef-ar-o').
% test_case(pos, "lingvanarĉefo",   'lingv-an-ar-ĉef-o').
% test_case(pos, "bopatreksujeco",  'bo-patr-eks-uj-ec-o').
% test_case(pos, "bopatrujekseco",  'bo-patr-uj-eks-ec-o').

% --- Section: COMPLEX DERIVATIONS ---
% Words with multiple affixes (prefixes, suffixes) and compounds.
test_case(blank, _, _).
test_case(info, "COMPLEX DERIVATIONS", _).
% ---
test_case(pos, "malplio", 'mal-pli-o').
test_case(pos, "maltroo", 'mal-tro-o').
test_case(pos, "orfonto", 'orf-ont-o').
test_case(pos, "praulon", 'pra-ul-o-n').

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

% --- Section: CORRELATIVES ---
% These cases abaout correlatives.
test_case(blank, _, _).
test_case(info, "CORRELATIVES", _).
% ---
test_case(neg, "ki",        fail).
test_case(neg, "malkio",    fail).
test_case(neg, "kiego",     fail).
test_case(neg, "rekieto",   fail).
test_case(neg, "ti",        fail).
test_case(neg, "maltio",    fail).
test_case(neg, "tiego",     fail).
test_case(neg, "ekstieto",  fail).
test_case(neg, "i",         fail).
test_case(neg, "praio",     fail).
test_case(neg, "iego",      fail).
test_case(neg, "reieto",    fail).
test_case(neg, "ĉi",        fail).
test_case(neg, "malĉio",    fail).
test_case(neg, "ĉiego",     fail).
test_case(neg, "reĉieto",   fail).
test_case(neg, "neni",      fail).
test_case(neg, "malnenio",  fail).
test_case(neg, "neniego",   fail).
test_case(neg, "renenieto", fail).
