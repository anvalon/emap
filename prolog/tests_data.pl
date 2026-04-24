% -----------------------------------------------------------------
% File: tests_data.pl
% Project: Esperanto Morphological Analyzer
% Description: Test Suite Database.
%              Contains positive, negative, and writing system 
%              test cases with logical categorization.
% -----------------------------------------------------------------

% --- Database Initialization ---
% Removes any previously loaded test cases to ensure a clean state.
:- retractall(test_case(_, _, _)). 
% Declares test_case/3 as dynamic so it can be managed at runtime.
:- dynamic test_case/3.

% --- Test Suite Database ---

% --- Section: NOUNS & INFLECTIONS ---
% Basic nouns with plural and accusative markers.
test_case(blank, _, _).
test_case(info, "NOUNS & INFLECTIONS", _).
% ---
test_case(pos, "domoj", 'dom-o-j').
test_case(pos, "domojn", 'dom-o-j-n').
test_case(pos, "domon", 'dom-o-n').
test_case(pos, "katojn", 'kat-o-j-n').
test_case(pos, "interpreto", 'interpret-o').
test_case(pos, "komento", 'koment-o').
test_case(pos, "telefono", 'telefon-o').
test_case(pos, "vidojn", 'vid-o-j-n').

% --- Section: VERBS & TENSES ---
% Simple verbal forms including finite tenses and infinitives.
test_case(blank, _, _).
test_case(info, "VERBS & TENSES", _).
% ---
test_case(pos, "esperas", 'esper-as').
test_case(pos, "manĝas", 'manĝ-as').
test_case(pos, "vidi", 'vid-i').
test_case(pos, "revidu", 're-vid-u').
test_case(pos, "malas", 'mal-as').

% --- Section: ADJECTIVES & ADVERBS ---
% Adjectival and adverbal forms, including participles used as modifiers.
test_case(blank, _, _).
test_case(info, "ADJECTIVES & ADVERBS", _).
% ---
test_case(pos, "kurante", 'kur-ant-e').
test_case(pos, "malametaj", 'mal-am-et-a-j').
test_case(pos, "manĝajn", 'manĝ-a-j-n').
test_case(pos, "viditaj", 'vid-it-a-j').

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