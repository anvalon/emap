% -----------------------------------------------------------------
% File: utils.pl
% Project: Esperanto Morphological Analyzer
% Description: Formatting utilities to convert internal Prolog 
%              structures into human-readable strings.
% -----------------------------------------------------------------

% format_tagged_segments/2: Converts list of pairs to a hyphenated atom
% Input: [[['d','o','m'], root], [['o'], sub]]
% Output: 'dom{root}-o{sub}'
format_tagged_segments(ListOfPairs, Result) :-
    maplist(format_pair, ListOfPairs, Atoms),
    atomic_list_concat(Atoms, '-', Result).

% format_pair/2: Formats a single morpheme with its tag in braces
format_pair([Chars, Tag], Atom) :-
    atomic_list_concat(Chars, CharAtom),
    format(atom(Atom), '~w{~w}', [CharAtom, Tag]).