% -----------------------------------------------------------------
% File: suffixes.pl
% Project: Esperanto Morphological Analyzer
% Description: Recursive suffix validation logic.
% -----------------------------------------------------------------

:- dynamic suffix/1.                               % Suffix facts are loaded dynamically                % Dynamic facts

% check_suffixes/2: Recursively validates multiple suffixes
% Following EBNF structure for {suffix} repetition.
check_suffixes([], []).                            % Base case: no suffixes found                       % End recursion
check_suffixes(Part, [[S, suf]|RestOut]) :-        % Recursive case: find suffix S                      % Find suffix
    append(S, Rest, Part),                         % Take a piece S from the front                      % Split S
    S \= [],                                       % The piece S must not be empty                      % S not empty
    suffix(S),                                     % Match S against the suffix dictionary              % Match dictionary
    check_suffixes(Rest, RestOut).                 % Recurse on the remaining characters                % Recurse