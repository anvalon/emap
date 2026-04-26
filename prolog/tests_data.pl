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

% --- Section: SUFFIXES ---
% Words with official suffixes (ad, an, ant, ar, at, aĉ, aĵ, ĉj, ebl, ec, eg, ej, em, end, er, estr, et, id, ig, iĝ, il, in, ind, ing, int, ism, ist, it, nj, obl, on, ont, op, ot, uj, ul, um)
test_case(blank, _, _).
test_case(info, "PREFIXES", _).
% ---
test_case(pos, "parolado",   'parol-ad-o').
test_case(pos, "lingvano",   'lingv-an-o').
test_case(pos, "ridante",    'rid-ant-e').
test_case(pos, "vortaro",    'vort-ar-o').
test_case(pos, "manĝata",    'manĝ-at-a').
test_case(pos, "domaĉo",     'dom-aĉ-o').
test_case(pos, "glaciaĵo",   'glaci-aĵ-o').
test_case(pos, "kredeble",   'kred-ebl-e').
test_case(pos, "beleco",     'bel-ec-o').
test_case(pos, "grandega",   'grand-eg-a').
test_case(pos, "lernejo",    'lern-ej-o').
test_case(pos, "ridema",     'rid-em-a').
test_case(pos, "legenda",    'leg-end-a').
test_case(pos, "testero",    'test-er-o').
test_case(pos, "urbestro",   'urb-estr-o').
test_case(pos, "beleta",     'bel-et-a').
test_case(pos, "katido",     'kat-id-o').
test_case(pos, "konigi",     'kon-ig-i').
test_case(pos, "sidiĝi",     'sid-iĝ-i').
test_case(pos, "fermilo",    'ferm-il-o').
test_case(pos, "virino",     'vir-in-o').
test_case(pos, "evitinda",   'evit-ind-a').
test_case(pos, "ŝraŭbingo",  'ŝraŭb-ing-o').
test_case(pos, "pasinta",    'pas-int-a').
test_case(pos, "kubismo",    'kub-ism-o').
test_case(pos, "instruisto", 'instru-ist-o').
test_case(pos, "legita",     'leg-it-a').
test_case(pos, "duoble",     'du-obl-e').
test_case(pos, "triono",     'tri-on-o').
test_case(pos, "venonta",    'ven-ont-a').
test_case(pos, "kvarope",    'kvar-op-e').
test_case(pos, "legota",     'leg-ot-a').
test_case(pos, "monujo",     'mon-uj-o').
test_case(pos, "junulo",     'jun-ul-o').
test_case(pos, "brakumi",    'brak-um-i').

% --- Section: MORE SUFFIXES ---
% Words with more official suffixes
test_case(blank, _, _).
test_case(info, "MORE SUFFIXES", _).
% ---

% --- Section: MORE PREFIXES AND SUFFIXES ---
% Words with more official prefixes and suffixes
test_case(blank, _, _).
test_case(info, "MORE PREFIXES AND SUFFIXES", _).
% ---

% --- Section: COMPLEX DERIVATIONS ---
% Words with multiple affixes (prefixes, suffixes) and compounds.
test_case(blank, _, _).
test_case(info, "COMPLEX DERIVATIONS", _).
% ---
test_case(pos, "dispraulino", 'dis-pra-ul-in-o').
test_case(pos, "geedziĝo", 'ge-edz-iĝ-o').
test_case(pos, "interpretita", 'interpret-it-a').
test_case(pos, "komunumo", 'komun-um-o').
test_case(pos, "malestimo", 'mal-estim-o').
test_case(pos, "malmanĝeti", 'mal-manĝ-et-i').
test_case(pos, "malplio", 'mal-pli-o').
test_case(pos, "maltroo", 'mal-tro-o').
test_case(pos, "manĝado", 'manĝ-ad-o').
test_case(pos, "orfonto", 'orf-ont-o').
test_case(pos, "plenumita", 'plen-um-it-a').
test_case(pos, "plenumo", 'plen-um-o').
test_case(pos, "praulon", 'pra-ul-o-n').
test_case(pos, "registaro", 'reg-ist-ar-o').
test_case(pos, "rekono", 're-kon-o').
test_case(pos, "remanĝegoj", 're-manĝ-eg-o-j').
test_case(pos, "remanĝetegindas", 're-manĝ-et-eg-ind-as').
test_case(pos, "sideti", 'sid-et-i').
test_case(pos, "suvereneco", 'suveren-ec-o').
test_case(pos, "telefonado", 'telefon-ad-o').
test_case(pos, "vidigi", 'vid-ig-i').
test_case(pos, "vidintajn", 'vid-int-a-j-n').
test_case(pos, "vidiĝi", 'vid-iĝ-i').

% --- Future/Optional Test Cases (Currently Commented Out) ---
% test_case(pos, "amaskomunikilo", 'amas-komunik-il-o'). 
% test_case(pos, "balotrajto", 'balot-rajt-o'). 
% test_case(pos, "ĉiu", 'ĉi-u').
% test_case(pos, "enmeto", 'en-met-o'). 
% test_case(pos, "interkompreno", 'inter-kompren-o'). 
% test_case(pos, "kunvenado", 'kun-ven-ad-o'). 
% test_case(pos, "kunveno", 'kun-ven-o'). 
% test_case(pos, "lingvonomo", 'lingv-o-nom-o'). 
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
% test_case(pos, "ĉiukazo", 'ĉiu-kaz-o'). 
% test_case(pos, "ĉiuokaze", 'ĉiu-okaz-e').

% --- Section: WRITING SYSTEMS ---
% These cases test the normalization of X-system, H-system, and Caret notation.
test_case(blank, _, _).
test_case(info, "WRITING SYSTEMS", _).
% ---
test_case(pos, "mangxas", 'manĝ-as').
test_case(pos, "manghas", 'manĝ-as').
test_case(pos, "mang^as", 'manĝ-as').
test_case(pos, "sxatataj", 'ŝat-at-a-j').
test_case(pos, "shatataj", 'ŝat-at-a-j').
test_case(pos, "s^atataj", 'ŝat-at-a-j').

% --- Section: NEGATIVE TESTS ---
% 'neg' tests ensure that the segmenter correctly rejects invalid
% strings or grammatically impossible structures.
test_case(blank, _, _).
test_case(info, "NEGATIVE TESTS", _).
% ---
test_case(neg, "antmanĝi", fail).
test_case(neg, "as", fail).
test_case(neg, "badabum", fail).
test_case(neg, "iomanĝi", fail).
test_case(neg, "malmanĝ", fail).
test_case(neg, "manĝ", fail).
test_case(neg, "manĝas n", fail).
test_case(neg, "manĝasas", fail).
test_case(neg, "manĝasj", fail).
test_case(neg, "manĝi-i", fail).
test_case(neg, "manĝio", fail).
test_case(neg, "manĝj", fail).
test_case(neg, "manĝn", fail).
test_case(neg, "manĝnn", fail).