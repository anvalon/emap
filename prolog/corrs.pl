% -----------------------------------------------------------------
% File: corrs.pl
% Project: Esperanto Morphological Analyzer
% Section: 2 - Correlatives
% 
% Description:
% This module implements the analysis of Esperanto correlatives based 
% on the updated EBNF specification. It decomposes correlatives into 
% a prefix root (ki, ti, ĉi, i, neni) and three categories of finals.
%
% This version utilizes check_jn/2 and check_n/2 from tails.pl to 
% handle standard Esperanto endings, following a declarative 
% Prolog style that maps directly to the EBNF logic branches.
%
% Grammar Rules Implemented:
% corr_extended = corr_root (corr_final_a [plural_ending] [accusative_ending]) | 
%                 (corr_final_b [accusative_ending | (nominal_ending [plural_ending] [accusative_ending])]) |
%                 (corr_final_c [(nominal_ending [plural_ending] [accusative_ending]) | (adverbal_ending [accusative_ending])]);
% -----------------------------------------------------------------

% --- External Dependencies Declarations ---
% These predicates are defined in tails.pl. Discontiguous handles 
% cases where they might be split during compilation.
:- discontiguous check_jn/2. 
:- discontiguous check_n/2.
:- discontiguous tail/2.

% --- Correlative Roots Definition ---
% Maps the initial part of the correlative to its semantic tag.
corr_root(['k', 'i'],        'rel'). % Interrogative/Relative
corr_root(['t', 'i'],        'mnt'). % Demonstrative
corr_root(['ĉ', 'i'],        'omn'). % Collective/Universal
corr_root(['i'],             'ned'). % Indefinite
corr_root(['n','e','n','i'], 'neg'). % Negative

% --- Correlative Finals Definitions ---
% Final Type A: u, o, a (Support plural -j and accusative -n)
corr_final_a(['u'], 'ind'). 
corr_final_a(['o'], 'obj'). 
corr_final_a(['a'], 'eco'). 

% Final Type B: e (Supports accusative -n or nominal extensions)
corr_final_b(['e'], 'lok'). 

% Final Type C: am, al, el, es, om (Invariable or extended)
corr_final_c(['a', 'm'], 'tmp'). 
corr_final_c(['a', 'l'], 'mot'). 
corr_final_c(['e', 'l'], 'man'). 
corr_final_c(['e', 's'], 'pos'). 
corr_final_c(['o', 'm'], 'kvn'). 

% -----------------------------------------------------------------
% correlative_extended/2
% -----------------------------------------------------------------
% Decomposes input into root and final parts.
correlative_extended(Input, Results) :-
    append(RootChars, FinalChars, Input),
    corr_root(RootChars, RootTag),
    analyze_final(FinalChars, FinalTags),
    append([[RootChars, RootTag]], FinalTags, Results).

% -----------------------------------------------------------------
% analyze_final/2: Declarative EBNF Implementation
% -----------------------------------------------------------------

% --- CASE 1: Finals A (u, o, a) ---
% Rule: (corr_final_a [plural_ending] [accusative_ending])
analyze_final(Input, [[BaseChars, BaseTag]|Rest]) :-
    corr_final_a(BaseChars, BaseTag),
    append(BaseChars, JN, Input),
    check_jn(JN, Rest). % Handles empty, -j, -n, or -jn

% --- CASE 2: Finals B (e) ---
% Branch 1: (corr_final_b [accusative_ending]) -> e, en
analyze_final(Input, [[BaseChars, BaseTag]|Rest]) :-
    corr_final_b(BaseChars, BaseTag),
    append(BaseChars, N, Input),
    check_n(N, Rest).   % Handles empty or -n

% Branch 2: (corr_final_b (nominal_ending ...)) -> e.g., e-o-j
analyze_final(Input, [[BaseChars, BaseTag]|Rest]) :-
    corr_final_b(BaseChars, BaseTag),
    append(BaseChars, TailPart, Input),
    TailPart \= [], 
    TailPart \= ['n'], % Prevents overlapping with Branch 1
    tail(TailPart, Rest).

% --- CASE 3: Finals C (am, al, el, es, om) ---
% Branch 1: Invariable -> e.g., kiam
analyze_final(Input, [[Input, Tag]]) :-
    corr_final_c(Input, Tag).

% Branch 2: Extended -> e.g., kiam-a, kiom-o-j
analyze_final(Input, [[BaseChars, BaseTag]|Rest]) :-
    corr_final_c(BaseChars, BaseTag),
    append(BaseChars, TailPart, Input),
    TailPart \= [],
    tail(TailPart, Rest).