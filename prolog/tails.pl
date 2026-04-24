% -----------------------------------------------------------------
% File: tails.pl
% Project: Esperanto Morphological Analyzer
% Description: Logic for grammatical endings (inflections).
%              Handles verbs, nouns, adjectives, and adverbs,
%              including plural and accusative markers.
% -----------------------------------------------------------------

% --- Basic Verbal Endings (Tense and Mood) ---
verbal_ending([i]).    % Infinitive
verbal_ending([a,s]).  % Present
verbal_ending([i,s]).  % Past
verbal_ending([o,s]).  % Future
verbal_ending([u,s]).  % Conditional
verbal_ending([u]).    % Volitive/Imperative

% --- Standard Part-of-Speech Endings ---
nominal_ending([o]).     % Noun (substantivo)
adjectival_ending([a]).  % Adjective (adjektivo)
adverbal_ending([e]).    % Adverb (adverbo)

% --- Plural and Accusative markers ---
plural([j]).
accusative([n]).

% -----------------------------------------------------------------
% tail/2: Validates the ending and assigns grammatical tags
% tail(+EndingChars, -TaggedList)
% -----------------------------------------------------------------

% Case 1: Purely verbal endings (vrb)
tail(T, [[T, vrb]]) :- verbal_ending(T).

% Case 2: Noun endings (sub) with optional plural and accusative
tail(T, [[N, sub]|Rest]) :-        
    nominal_ending(N),
    append(N, Rem, T),
    final_j_n(Rem, Rest).

% Case 3: Adjective endings (adj) with optional plural and accusative
tail(T, [[A, adj]|Rest]) :-        
    adjectival_ending(A),
    append(A, Rem, T),
    final_j_n(Rem, Rest).

% Case 4: Adverb endings (adv) with optional accusative for direction
% Plurals are not allowed for adverbs (e.g., -ejn is invalid).
tail(T, [[E, adv]|Rest]) :-        
    adverbal_ending(E),
    append(E, Rem, T),
    final_n(Rem, Rest).

% -----------------------------------------------------------------
% final_n/2: Handles the optional accusative marker (aku)
% -----------------------------------------------------------------
final_n([], []).
final_n([n], [[[n], aku]]) :- !.

% -----------------------------------------------------------------
% final_j_n/2: Handles plural (plu) and/or accusative (aku) markers
% -----------------------------------------------------------------
final_j_n([], []).
final_j_n([j], [[[j], plu]]) :- !.
final_j_n([n], [[[n], aku]]) :- !.
final_j_n([j, n], [[[j], plu], [[n], aku]]) :- !.