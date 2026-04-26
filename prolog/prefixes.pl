% -----------------------------------------------------------------
% File: prefixes.pl
% Project: Esperanto Morphological Analyzer
% Description: Recursive prefix validation logic.
% -----------------------------------------------------------------

:- dynamic prefix/1.                               % Prefix facts are loaded dynamically                % Dynamic facts

% check_prefixes/2: Recursively validates multiple prefixes
% Following EBNF structure for {prefix} repetition.
check_prefixes([], []).                            % Base case: no prefixes found                       % End recursion
check_prefixes(Part, [[P, pre]|RestOut]) :-        % Recursive case: find prefix P                      % Find prefix
    append(P, Rest, Part),                         % Take a piece P from the front                      % Split P
    P \= [],                                       % The piece P must not be empty                      % P not empty
    prefix(P),                                     % Match P against the prefix dictionary              % Match dictionary
    check_prefixes(Rest, RestOut).                 % Recurse on the remaining characters                % Recurse