% -----------------------------------------------------------------
% File: main.pl
% Project: Esperanto Morphological Analyzer
% Description: Core segmentation engine.
%              Coordinates dictionary loading, character 
%              normalization, and splitting rules.
% -----------------------------------------------------------------

% --- Sub-Module Imports ---
:- [files].  % Logic for loading dictionaries from .txt (roots, prefixes, suffixes)
:- [tails].  % Rules for grammatical endings (-o, -a, -as, etc.)
:- [chars].  % Character normalization (X-system, H-system, Unicode)

% -----------------------------------------------------------------
% segment/2 (Main Entry Point)
% segment(+RawString, -Result)
% -----------------------------------------------------------------
% Takes a raw string, normalizes it, and attempts to split it into:
% [Prefixes] - [Root] - [Suffixes] - [Ending]
% -----------------------------------------------------------------
segment(RawString, Result) :-
    % 1. Convert spelling variations (e.g., mangxas -> manĝas)
    normalize_input(RawString, CleanString),
    
    % 2. Transform the atom into a list of characters for processing
    atom_chars(CleanString, CharList),
    
    % 3. Use non-deterministic append/3 to find all valid decompositions.
    %    The logical pattern is: [Prefixes][Root][Suffixes][Ending]
    append(PrefixPart, Rest1, CharList),
    append(RootPart, Rest2, Rest1),
    append(SuffixPart, EndingPart, Rest2),
    
    % 4. Validate each segment against dictionaries and rules
    check_prefixes(PrefixPart, PList),  % Validates 0 or more prefixes (tag: pre)
    root(RootPart),                    % Validates root in dictionaries (tag: rad)
    check_suffixes(SuffixPart, SList), % Validates 0 or more suffixes (tag: suf)
    tail(EndingPart, EList),           % Validates endings in tails.pl (tags: sub, adj, vrb, etc.)
    
    % 5. Merge all validated parts into a list of [Morpheme, Tag] pairs
    append(PList, [[RootPart, rad]], Temp),
    append(Temp, SList, Temp2),
    append(Temp2, EList, FullStructure),
    
    % 6. Format the structure into a readable string: "rad{rad}-o{sub}"
    format_tagged_segments(FullStructure, Result).


% -----------------------------------------------------------------
% Recursive Validation Rules
% -----------------------------------------------------------------

% check_prefixes/2: Recursively checks if the start contains valid prefixes
check_prefixes([], []).
check_prefixes(Part, [[P, pre]|RestOut]) :- 
    Part \= [],
    append(P, Rest, Part),
    P \= [],
    prefix(P),                  % Searches the dictionary loaded from prefixes.txt
    check_prefixes(Rest, RestOut).

% check_suffixes/2: Recursively checks if the post-root part contains valid suffixes
check_suffixes([], []).
check_suffixes(Part, [[S, suf]|RestOut]) :-
    Part \= [],
    append(S, Rest, Part),
    S \= [],
    suffix(S),                  % Searches the dictionary loaded from suffixes.txt
    check_suffixes(Rest, RestOut).


% -----------------------------------------------------------------
% Formatting Utilities
% -----------------------------------------------------------------

% format_tagged_segments/2: Converts the list of pairs into a hyphenated atom
% Example: [[['d','o','m'], rad], [['o'], sub]] -> 'dom{rad}-o{sub}'
format_tagged_segments(ListOfPairs, Result) :-
    maplist(format_pair, ListOfPairs, Atoms),
    atomic_list_concat(Atoms, '-', Result).

% format_pair/2: Formats a single morpheme with its tag inside curly braces
format_pair([Chars, Tag], Atom) :-
    atomic_list_concat(Chars, CharAtom),
    format(atom(Atom), '~w{~w}', [CharAtom, Tag]).