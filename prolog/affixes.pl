% -------------------------------------------------------------------------------------------------------------------
% Project:     Esperanto Morphological Analyzer
% File:        affixes.pl
% Description: This module provides a unified implementation for the recursive validation logic of Esperanto 
%              affixes (both prefixes and suffixes). It strictly adheres to the EBNF grammar specification
%              where a morphological root (root_morf) is defined as:
%              root_morf = {pref} root {suff};
%
%              The logic is designed to handle multiple layers of affixes by recursively splitting the 
%              input list and validating each segment against dynamic dictionaries loaded from external sources.
%
% Application Rules:
% 1. Prefixes (pref): Attached before the root. The check_prefixes/2 predicate identifies zero or more
%    prefixes at the beginning of the word string.
% 2. Suffixes (suff): Attached after the root and before the final ending (tail). The check_suffixes/2
%    predicate identifies zero or more suffixes in a sequence.
%
% The implementation uses a pure Prolog approach, favoring recursion and backtracking over procedural 
% constructs to ensure the analyzer remains modular, maintainable, and linguistically accurate.
% -------------------------------------------------------------------------------------------------------------------

% --- Dynamic Predicates ---
% These predicates allow the analyzer to load and update prefix and suffix lists 
% from external dictionary files without modifying the core logic.
:- dynamic prefix/1.
:- dynamic suffix/1.

% -------------------------------------------------------------------------------------------------------------------
% 1. Prefixes (Section 4.1 of EBNF)
% -------------------------------------------------------------------------------------------------------------------
% check_prefixes/2: Recursive validation of prefix sequences.
% This predicate implements the {pref} part of the grammar.
% -------------------------------------------------------------------------------------------------------------------

% Base case: No more characters to process as prefixes.
% This represents the empty sequence in the {pref} EBNF rule.
check_prefixes([], []).

% Recursive case: Identify a prefix at the start of the list.
% 1. It attempts to split the 'Part' list into a potential prefix 'P' and the 'Rest'.
% 2. It validates 'P' against the dynamic 'prefix/1' dictionary.
% 3. It recursively calls itself on the 'Rest' to find further prefixes (e.g., "ex-pra-").
check_prefixes(Part, [[P, pre]|RestOut]) :-
    append(P, Rest, Part),                         % Split the list into potential prefix P and remainder[cite: 33].
    P \= [],                                       % Ensure P is not empty to avoid infinite loops.
    prefix(P),                                     % Validate P against the dynamic dictionary[cite: 44].
    check_prefixes(Rest, RestOut).                 % Continue checking for subsequent prefixes {pref}[cite: 34].

% -------------------------------------------------------------------------------------------------------------------
% 2. Suffixes (Section 4.2 of EBNF)
% -------------------------------------------------------------------------------------------------------------------
% check_suffixes/2: Recursive validation of suffix sequences.
% This predicate implements the {suff} part of the grammar.
% -------------------------------------------------------------------------------------------------------------------

% Base case: No more characters to process as suffixes.
% This represents the empty sequence in the {suff} EBNF rule.
check_suffixes([], []).

% Recursive case: Identify a suffix at the start of the list.
% 1. It attempts to split the 'Part' list into a potential suffix 'S' and the 'Rest'.
% 2. It validates 'S' against the dynamic 'suffix/1' dictionary.
% 3. It recursively calls itself on the 'Rest' to find further suffixes (e.g., "-et-in-").
check_suffixes(Part, [[S, suf]|RestOut]) :-
    append(S, Rest, Part),                         % Split the list into potential suffix S and remainder[cite: 33].
    S \= [],                                       % Ensure S is not empty to avoid infinite loops.
    suffix(S),                                     % Validate S against the dynamic dictionary[cite: 44].
    check_suffixes(Rest, RestOut).                 % Continue checking for subsequent suffixes {suff}[cite: 35].