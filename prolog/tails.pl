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
ending([a,s], pzn). % Present (pzn)
ending([i,s], prt). % Past/Preterite (prt)
ending([o,s], fut). % Future
ending([u,s], kon). % Conditional (kon)
ending([u],   vol). % Volitive/Imperative
ending([o],   sub). % Noun (substantivo)
ending([a],   adj). % Adjective
ending([e],   adv). % Adverb

% --- Final markers ---
% final(Characters, Tag)
final([j], plu). % Plural
final([n], aku). % Accusative

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
    check_final_jn(Rem, Rest).

% Case 3: Adverbs (accept optional -n for direction)
tail(T, [[Chars, Tag]|Rest]) :-        
    ending(Chars, Tag),
    Tag == adv,
    append(Chars, Rem, T),
    check_final_n(Rem, Rest).

% --- Helpers to handle final combinations (-j, -n, -jn) ---
check_final_jn([], []).
check_final_jn([j], [[[j], plu]]) :- !.
check_final_jn([n], [[[n], aku]]) :- !.
check_final_jn([j, n], [[[j], plu], [[n], aku]]) :- !.

check_final_n([], []).
check_final_n([n], [[[n], aku]]) :- !.