% -----------------------------------------------------------------
% File: roots.pl
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
% - root_extended = root_affixed tail
% - root_affixed = {prefix} bound_root {suffix}
%
% Dependencies:
% - tails.pl: For grammatical endings and inflection logic.
% - Dynamic roots: Loaded from external dictionary files.
% -----------------------------------------------------------------

% --- External Dependencies Declarations ---
:- dynamic       root/1.                           % Roots are loaded dynamically from TXT              % Dynamic roots
:- discontiguous tail/2.                           % tail/2 is defined in tails.pl                      % External tail
:- discontiguous check_prefixes/2.                 % check_prefixes/2 is defined in prefix.pl           % External prefixes
:- discontiguous check_suffixes/2.                 % check_suffixes/2 is defined in suffix.pl           % External suffixes

% -----------------------------------------------------------------
% root_extended/2: Implementation of 'root_affixed tail'
% -----------------------------------------------------------------
root_extended(Input, Results) :-                  % Entry point for analyzing bound words               % Main entry
    append(PrefixRootSuffix, TailChars, Input),    % Split total chars into radical and tail             % Split rad/tail
    TailChars \= [],                               % A bound root MUST have a grammatical tail           % Ensure tail exists
    root_affixed(PrefixRootSuffix, RadPart),     % Validate the core radical structure                 % Validate radical
    tail(TailChars, TailPart),                     % Validate the grammatical ending                     % Validate tail
    append(RadPart, TailPart, Results).            % Merge radical and tail into one list                % Merge results

% -----------------------------------------------------------------
% root_affixed/2: Implementation of '{prefix} bound_root {suffix}'
% -----------------------------------------------------------------
root_affixed(Input, Results) :-                  % Core logic for the radical part                     % Radical logic
    append(PrefPart, Rest1, Input),                % Extract potential prefixes from the start           % Extract prefixes
    check_prefixes(PrefPart, PrefTags),            % Validate the sequence of prefixes                   % Check prefixes
    append(RootPart, SufPart, Rest1),              % Split remainder into root and suffixes              % Split root/suf
    RootPart \= [],                                % Root cannot be an empty string                      % Root not empty
    root(RootPart),                                % Verify if the root exists in dictionary             % Dictionary lookup
    check_suffixes(SufPart, SufTags),              % Validate the sequence of suffixes                   % Check suffixes
    append(PrefTags, [[RootPart, rad]], Temp),     % Tag the root as 'rad' (radical)                     % Tag root
    append(Temp, SufTags, Results).                % Combine all tagged parts into Results               % Final assembly