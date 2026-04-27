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
% All semantic tags have been unified to 'rad' as per user request.
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
:- discontiguous check_jn/2. 
:- discontiguous check_n/2.
:- discontiguous tail/2.

% --- Category A: -iu, -ia (Supports Plural and Accusative) ---
% These correlatives function like adjectives or pronouns.
corr_a(['k','i','u'], 'rad'). % kiu
corr_a(['t','i','u'], 'rad'). % tiu
corr_a(['ĉ','i','u'], 'rad'). % ĉiu
corr_a(['i','u'],     'rad'). % iu
corr_a(['n','e','n','i','u'], 'rad'). % neniu

corr_a(['k','i','a'], 'rad'). % kia
corr_a(['t','i','a'], 'rad'). % tia
corr_a(['ĉ','i','a'], 'rad'). % ĉia
corr_a(['i','a'],     'rad'). % ia
corr_a(['n','e','n','i','a'], 'rad'). % nenia

% --- Category B: -io, -ie (Supports Accusative) ---
% These correlatives function as objects or locations.
corr_b(['k','i','o'], 'rad'). % kio
corr_b(['t','i','o'], 'rad'). % tio
corr_b(['ĉ','i','o'], 'rad'). % ĉio
corr_b(['i','o'],     'rad'). % io
corr_b(['n','e','n','i','o'], 'rad'). % nenio

corr_b(['k','i','e'], 'rad'). % kie
corr_b(['t','i','e'], 'rad'). % tie
corr_b(['ĉ','i','e'], 'rad'). % ĉie
corr_b(['i','e'],     'rad'). % ie
corr_b(['n','e','n','i','e'], 'rad'). % nenie

% --- Category C: -am, -al, -el, -es, -om (Supports Tail) ---
% These are mostly adverbial but can be extended with grammatical endings.
corr_c(['k','i','a','m'], 'rad'). % kiam
corr_c(['t','i','a','m'], 'rad'). % tiam
corr_c(['ĉ','i','a','m'], 'rad'). % ĉiam
corr_c(['i','a','m'],     'rad'). % iam
corr_c(['n','e','n','i','a','m'], 'rad'). % neniam

corr_c(['k','i','a','l'], 'rad'). % kial
corr_c(['t','i','a','l'], 'rad'). % tial
corr_c(['ĉ','i','a','l'], 'rad'). % ĉial
corr_c(['i','a','l'],     'rad'). % ial
corr_c(['n','e','n','i','a','l'], 'rad'). % nenial

corr_c(['k','i','e','l'], 'rad'). % kiel
corr_c(['t','i','e','l'], 'rad'). % tiel
corr_c(['ĉ','i','e','l'], 'rad'). % ĉiel
corr_c(['i','e','l'],     'rad'). % iel
corr_c(['n','e','n','i','e','l'], 'rad'). % neniel

corr_c(['k','i','e','s'], 'rad'). % kies
corr_c(['t','i','e','s'], 'rad'). % ties
corr_c(['ĉ','i','e','s'], 'rad'). % ĉies
corr_c(['i','e','s'],     'rad'). % ies
corr_c(['n','e','n','i','e','s'], 'rad'). % nenies

corr_c(['k','i','o','m'], 'rad'). % kiom
corr_c(['t','i','o','m'], 'rad'). % tiom
corr_c(['ĉ','i','o','m'], 'rad'). % ĉiom
corr_c(['i','o','m'],     'rad'). % iom
corr_c(['n','e','n','i','o','m'], 'rad'). % neniom

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