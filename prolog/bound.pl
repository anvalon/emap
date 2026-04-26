% -----------------------------------------------------------------
% File: bound.pl
% Project: Esperanto Morphological Analyzer
% Section: 3 - Bound Roots
% 
% Description:
% This module handles the analysis of bound roots (roots that 
% require a grammatical ending/tail). It manages the combination 
% of prefixes, the central root, and suffixes, followed by 
% mandatory grammatical terminations.
%
% Grammar Rules Implemented:
% - bound_extended = bound_complete tail
% - bound_complete = {prefix} bound_root {suffix}
%
% Dependencies:
% - tails.pl: For grammatical endings and inflection logic.
% - Dynamic roots: Loaded from external dictionary files.
% -----------------------------------------------------------------

% Handles the segmentation of a bound root followed by its tail
bound_extended(In, Results) :-
    append(PrefixRootSuffix, TailChars, In),
    bound_complete(PrefixRootSuffix, RadPart),
    tail(TailChars, TailPart),
    % Uniamo le liste per restituire un risultato piatto al web/test
    append(RadPart, TailPart, Results).

% Logic for the complete root block (Prefixes + Root + Suffixes)
bound_complete(In, Results) :-
    append(PrefPart, Rest1, In),
    check_prefixes(PrefPart, PrefTags),
    append(RootPart, SufPart, Rest1),
    root(RootPart),
    check_suffixes(SufPart, SufTags),
    % Usiamo 'rad' per compatibilità con la class_map di prolog.php
    append(PrefTags, [[RootPart, rad]], Temp),
    append(Temp, SufTags, Results).

% -----------------------------------------------------------------
% Recursive Validation Rules
% -----------------------------------------------------------------

% check_prefixes/2: Recursively checks if the start contains valid prefixes
check_prefixes([], []).
check_prefixes(Part, [[P, pre]|RestOut]) :- 
    Part \= [],
    append(P, Rest, Part),
    P \= [],
    prefix(P),
    check_prefixes(Rest, RestOut).

% check_suffixes/2: Recursively checks if the post-root part contains valid suffixes
check_suffixes([], []).
check_suffixes(Part, [[S, suf]|RestOut]) :-
    Part \= [],
    append(S, Rest, Part),
    S \= [],
    suffix(S),
    check_suffixes(Rest, RestOut).