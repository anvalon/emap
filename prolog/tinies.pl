% -----------------------------------------------------------------
% File:    tinies.pl
% Project: Esperanto Morphological Analyzer
% Section: 1 - Tinies (Vortetoj / Standalone Roots)
% 
% Description:
% This module implements the analysis for "Tinies" (vortetoj).
% It handles roots that can stand alone without a mandatory tail.
%
% EBNF Rules Implemented:
% 1. tiny_ext = {pref} tiny [tail]
% 2. tiny_ext = {pref} tiny {suff} tail
% -----------------------------------------------------------------

% --- External Dependencies Declarations ---
% 'tiny/1' is the dynamic predicate populated from atoms.txt
:- dynamic       tiny/1.           
:- discontiguous tail/2.           % Defined in tails.pl
:- discontiguous check_prefixes/2. % Defined in prefixes.pl
:- discontiguous check_suffixes/2. % Defined in suffixes.pl

% -----------------------------------------------------------------
% tiny_extended/2: Implementation of the first EBNF branch
% Rule: tiny_ext = {pref} tiny [tail]
% -----------------------------------------------------------------
tiny_extended(Input, Results) :-
    % Extract zero or more prefixes
    append(PrefPart, Rest, Input),
    check_prefixes(PrefPart, PrefTags),
    
    % Identify the tiny root and the optional tail
    append(TinyChars, TailChars, Rest),
    TinyChars \= [],
    tiny(TinyChars),                               % Dictionary lookup
    
    % Handle the optional tail [tail]
    (TailChars == [] -> 
        TailTags = [] 
    ;   tail(TailChars, TailTags)
    ),
    
    % Final assembly of components
    append(PrefTags, [[TinyChars, tin]], Temp),
    append(Temp, TailTags, Results).

% -----------------------------------------------------------------
% tiny_extended/2: Implementation of the second EBNF branch
% Rule: tiny_ext = {pref} tiny {suff} tail
% -----------------------------------------------------------------
tiny_extended(Input, Results) :-
    % Extract zero or more prefixes
    append(PrefPart, Rest, Input),
    check_prefixes(PrefPart, PrefTags),
    
    % Identify the tiny root
    append(TinyChars, Remainder, Rest),
    TinyChars \= [],
    tiny(TinyChars),                               % Dictionary lookup
    
    % When suffixes are present, the tail becomes mandatory
    append(SufPart, TailPart, Remainder),
    SufPart \= [],                                 % At least one suffix required
    TailPart \= [],                                % Tail is mandatory here
    
    % Validate the sequence of suffixes and the tail
    check_suffixes(SufPart, SufTags),
    tail(TailPart, TailTags),
    
    % Final assembly: Prefixes + Tiny + Suffixes + Tail
    append(PrefTags, [[TinyChars, tin]], T1),
    append(T1, SufTags, T2),
    append(T2, TailTags, Results).