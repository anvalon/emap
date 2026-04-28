% -----------------------------------------------------------------
% File: corrs.pl
% Project: Esperanto Morphological Analyzer
% Section: 2 - Correlatives
% 
% Description:
% This module implements the analysis of Esperanto correlatives.
% Following the updated EBNF, correlatives are now treated as 
% atomic roots (indivisible units) rather than prefix-suffix pairs.
%
% All semantic tags have been unified to 'kor' as per user request.
%
% The logic is divided into three categories (a, b, c) based on 
% their inflectional capabilities:
% - Category A: Ends in -iu, -ia. Accepts plural -j and accusative -n.
% - Category B: Ends in -io, -ie. Accepts accusative -n.
% - Category C: Other endings. Accepts general tails (vrb, nom, adj, adv).
%
% Grammar Rules Implemented:
% corr_ext = (corr_a [plu_end] [acc_end]) | (corr_b [acc_end]) | (corr_c [tail]);
% -----------------------------------------------------------------

% --- External Dependencies Declarations ---
% These predicates are defined in tails.pl to handle grammatical endings.
:- discontiguous check_prefixes/2.
:- discontiguous check_jn/2. 
:- discontiguous check_n/2.
:- discontiguous tail/2.

% --- Category A: -iu, -ia (Supports Plural and Accusative) ---
% These correlatives function like adjectives or pronouns.
corr_a(['k','i','u'], 'kor'). % kiu
corr_a(['t','i','u'], 'kor'). % tiu
corr_a(['ĉ','i','u'], 'kor'). % ĉiu
corr_a(['i','u'],     'kor'). % iu
corr_a(['n','e','n','i','u'], 'kor'). % neniu

corr_a(['k','i','a'], 'kor'). % kia
corr_a(['t','i','a'], 'kor'). % tia
corr_a(['ĉ','i','a'], 'kor'). % ĉia
corr_a(['i','a'],     'kor'). % ia
corr_a(['n','e','n','i','a'], 'kor'). % nenia

% --- Category B: -io, -ie (Supports Accusative) ---
% These correlatives function as objects or locations.
corr_b(['k','i','o'], 'kor'). % kio
corr_b(['t','i','o'], 'kor'). % tio
corr_b(['ĉ','i','o'], 'kor'). % ĉio
corr_b(['i','o'],     'kor'). % io
corr_b(['n','e','n','i','o'], 'kor'). % nenio

corr_b(['k','i','e'], 'kor'). % kie
corr_b(['t','i','e'], 'kor'). % tie
corr_b(['ĉ','i','e'], 'kor'). % ĉie
corr_b(['i','e'],     'kor'). % ie
corr_b(['n','e','n','i','e'], 'kor'). % nenie

% --- Category C: -am, -al, -el, -es, -om (Supports Tail) ---
% These are mostly adverbial but can be extended with grammatical endings.
corr_c(['k','i','a','m'], 'kor'). % kiam
corr_c(['t','i','a','m'], 'kor'). % tiam
corr_c(['ĉ','i','a','m'], 'kor'). % ĉiam
corr_c(['i','a','m'],     'kor'). % iam
corr_c(['n','e','n','i','a','m'], 'kor'). % neniam

corr_c(['k','i','a','l'], 'kor'). % kial
corr_c(['t','i','a','l'], 'kor'). % tial
corr_c(['ĉ','i','a','l'], 'kor'). % ĉial
corr_c(['i','a','l'],     'kor'). % ial
corr_c(['n','e','n','i','a','l'], 'kor'). % nenial

corr_c(['k','i','e','l'], 'kor'). % kiel
corr_c(['t','i','e','l'], 'kor'). % tiel
corr_c(['ĉ','i','e','l'], 'kor'). % ĉiel
corr_c(['i','e','l'],     'kor'). % iel
corr_c(['n','e','n','i','e','l'], 'kor'). % neniel

corr_c(['k','i','e','s'], 'kor'). % kies
corr_c(['t','i','e','s'], 'kor'). % ties
corr_c(['ĉ','i','e','s'], 'kor'). % ĉies
corr_c(['i','e','s'],     'kor'). % ies
corr_c(['n','e','n','i','e','s'], 'kor'). % nenies

corr_c(['k','i','o','m'], 'kor'). % kiom
corr_c(['t','i','o','m'], 'kor'). % tiom
corr_c(['ĉ','i','o','m'], 'kor'). % ĉiom
corr_c(['i','o','m'],     'kor'). % iom
corr_c(['n','e','n','i','o','m'], 'kor'). % neniom

% -----------------------------------------------------------------
% corr_extended/2: Main dispatch for correlatives
% -----------------------------------------------------------------
% This predicate implements the top-level logic of corr_ext from EBNF.
% It attempts to match Category A, then B, then C.

% Implementation of (corr_a [plu_end] [acc_end])
corr_extended(Input, [[BaseChars, BaseTag]|Rest]) :-
    append(BaseChars, JN, Input),
    corr_a(BaseChars, BaseTag),
    check_jn(JN, Rest).

% Implementation of (corr_b [acc_end])
corr_extended(Input, [[BaseChars, BaseTag]|Rest]) :-
    append(BaseChars, N, Input),
    corr_b(BaseChars, BaseTag),
    check_n(N, Rest).

% Implementation of (corr_c [tail])
corr_extended(Input, [[BaseChars, BaseTag]|Rest]) :-
    append(BaseChars, TailChars, Input),
    corr_c(BaseChars, BaseTag),
    (TailChars == [] -> Rest = [] ; tail(TailChars, Rest)).