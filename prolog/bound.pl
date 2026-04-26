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

% --- External Dependencies Declarations ---
:- dynamic root/1, prefix/1, suffix/1.             % Allow facts to be loaded from external files        % Dynamic facts
:- multifile root/1, prefix/1, suffix/1.           % Allow predicates to be spread across files          % Multifile support
:- discontiguous tail/2.                           % tail/2 is defined in tails.pl                       % External tail/2

% -----------------------------------------------------------------
% bound_extended/2: Implementation of 'bound_complete tail'
% -----------------------------------------------------------------
bound_extended(In, Results) :-                     % Entry point for analyzing bound words              % Main entry
    append(PrefixRootSuffix, TailChars, In),       % Split total chars into radical and tail             % Split rad/tail
    TailChars \= [],                               % A bound root MUST have a grammatical tail           % Ensure tail exists
    bound_complete(PrefixRootSuffix, RadPart),     % Validate the core radical structure                 % Validate radical
    tail(TailChars, TailPart),                     % Validate the grammatical ending                    % Validate tail
    append(RadPart, TailPart, Results).            % Merge radical and tail into one list                % Merge results

% -----------------------------------------------------------------
% bound_complete/2: Implementation of '{prefix} bound_root {suffix}'
% -----------------------------------------------------------------
bound_complete(In, Results) :-                     % Core logic for the radical part                     % Radical logic
    append(PrefPart, Rest1, In),                   % Extract potential prefixes from the start           % Extract prefixes
    check_prefixes(PrefPart, PrefTags),            % Validate the sequence of prefixes                  % Check prefixes
    append(RootPart, SufPart, Rest1),              % Split remainder into root and suffixes              % Split root/suf
    RootPart \= [],                                % Root cannot be an empty string                      % Root not empty
    root(RootPart),                                % Verify if the root exists in dictionary             % Dictionary lookup
    check_suffixes(SufPart, SufTags),              % Validate the sequence of suffixes                  % Check suffixes
    append(PrefTags, [[RootPart, rad]], Temp),     % Tag the root as 'rad' (radical)                     % Tag root
    append(Temp, SufTags, Results).                % Combine all tagged parts into Results               % Final assembly

% -----------------------------------------------------------------
% Recursive Validation Rules
% -----------------------------------------------------------------

% check_prefixes/2: Recursively validates multiple prefixes
check_prefixes([], []).                            % Base case: no prefixes found                        % End recursion
check_prefixes(Part, [[P, pre]|RestOut]) :-        % Recursive case: find prefix P                       % Find prefix
    append(P, Rest, Part),                         % Take a piece P from the front                       % Split P
    P \= [],                                       % The piece P must not be empty                       % P not empty
    prefix(P),                                     % Match P against the prefix dictionary               % Match dictionary
    check_prefixes(Rest, RestOut).                 % Recurse on the remaining characters                 % Recurse

% check_suffixes/2: Recursively validates multiple suffixes
check_suffixes([], []).                            % Base case: no suffixes found                        % End recursion
check_suffixes(Part, [[S, suf]|RestOut]) :-        % Recursive case: find suffix S                       % Find suffix
    append(S, Rest, Part),                         % Take a piece S from the front                       % Split S
    S \= [],                                       % The piece S must not be empty                       % S not empty
    suffix(S),                                     % Match S against the suffix dictionary               % Match dictionary
    check_suffixes(Rest, RestOut).                 % Recurse on the remaining characters                 % Recurse