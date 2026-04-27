% -----------------------------------------------------------------
% File: tails.pl
% Project: Esperanto Morphological Analyzer
% Description: Logic for grammatical endings (inflections).
%              Handles verbs, nouns, adjectives, and adverbs,
%              including plural and accusative markers.
% -----------------------------------------------------------------

% --- Unified definition of grammatical endings ---
% ending(Characters, Tag)
ending([i],   inf). % Infinitive
ending([a,s], pzn). % Present
ending([i,s], prt). % Past
ending([o,s], fut). % Future
ending([u,s], kon). % Conditional
ending([u],   vol). % Volitive
ending([o],   sub). % Noun
ending([a],   adj). % Adjective
ending([e],   adv). % Adverb
ending([j],   plu). % Plural
ending([n],   aku). % Accusative

% -----------------------------------------------------------------
% tail/2: Validates the ending and assigns grammatical tags
% -----------------------------------------------------------------

% Case 1: Verbal endings (inf, pzn, prt, etc.)
% These do not accept plural or accusative markers in Esperanto
tail(T, [[T, Tag]]) :- 
    ending(T, Tag), 
    member(Tag, [inf, pzn, prt, fut, kon, vol]).

% Case 2: Nouns and Adjectives (accept optional -j and -n)
tail(T, [[Chars, Tag]|Rest]) :-        
    ending(Chars, Tag),
    member(Tag, [sub, adj]),
    append(Chars, Rem, T),
    check_jn(Rem, Rest).

% Case 3: Adverbs (accept optional -n for direction)
tail(T, [[Chars, Tag]|Rest]) :-        
    ending(Chars, Tag),
    Tag == adv,
    append(Chars, Rem, T),
    check_n(Rem, Rest).

% --- Helpers to handle final combinations (-j, -n, -jn) ---
check_jn([], []).
check_jn([j], [[[j], Tag]]) :- ending([j], Tag), !.
check_jn([n], [[[n], Tag]]) :- ending([n], Tag), !.
check_jn([j, n], [[[j], T1], [[n], T2]]) :- ending([j], T1), ending([n], T2), !.

check_n([], []).
check_n([n], [[[n], Tag]]) :- ending([n], Tag), !.  