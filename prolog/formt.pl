% -----------------------------------------------------------------
% File: formt.pl
% Project: Esperanto Morphological Analyzer
% Description: Unified formatting and normalization module.
%              Handles input normalization (X-system, H-system, etc.)
%              and output string formatting for analyzed segments.
% -----------------------------------------------------------------

% -----------------------------------------------------------------
% Input Normalization: format_input/2
% format_input(+Input, -Output)
% -----------------------------------------------------------------
% Converts raw input (string/atom) into normalized Unicode atoms.
% Example: "mangxas" -> 'manĝas'
% -----------------------------------------------------------------
format_input(Input, Output) :-
    string_chars(Input, Chars),              % 1. Convert input to a list of characters                % String to chars
    replace_diacritics(Chars, CleanChars),   % 2. Replace multi-char sequences with Unicode            % Normalize chars
    atom_chars(Output, CleanChars).          % 3. Convert character list back to an atom               % Chars to atom

% -----------------------------------------------------------------
% Output Formatting: format_output/2
% format_output(+List, -Result)
% -----------------------------------------------------------------
% Converts internal list of pairs to a tagged hyphenated atom.
% Input: [[['d','o','m'], root], [['o'], sub]]
% Output: 'dom{root}-o{sub}'
% -----------------------------------------------------------------
format_output(List, Output) :-
    maplist(format_pair, List, Atoms),       % Format each morpheme-tag pair into an atom             % Map formatter
    atomic_list_concat(Atoms, '-', Output).  % Join all formatted atoms with hyphens                  % Join with hyphens

% -----------------------------------------------------------------
% format_pair/2: Formats a single morpheme with its tag in braces
% -----------------------------------------------------------------
% Input:  [['d','o','m'], rad]
% Output: 'dom{rad}'
% -----------------------------------------------------------------
format_pair([Chars, Tag], Atom) :-
    atomic_list_concat(Chars, CharAtom),     % Join character list into a single atom                 % Chars to atom
    format(atom(Atom), '~w{~w}', [CharAtom, Tag]). % Wrap the tag in curly braces                     % Tagging format

% -----------------------------------------------------------------
% Diacritic Replacement Logic: replace_diacritics/2
% -----------------------------------------------------------------
% Recursively scans the character list to replace surrogate 
% notation systems with standard Esperanto Unicode characters.
% -----------------------------------------------------------------
replace_diacritics([], []).                  % Base case: end of character list                       % End recursion

% --- X-System support (cx, gx, hx, jx, sx, ux) ---
% Patterns: [char, 'x'] -> [unicode_char]
replace_diacritics(['c', 'x'|T], ['ĉ'|R]) :- !, replace_diacritics(T, R). % Replace cx with ĉ         % X-system ĉ
replace_diacritics(['g', 'x'|T], ['ĝ'|R]) :- !, replace_diacritics(T, R). % Replace gx with ĝ         % X-system ĝ
replace_diacritics(['h', 'x'|T], ['ĥ'|R]) :- !, replace_diacritics(T, R). % Replace hx with ĥ         % X-system ĥ
replace_diacritics(['j', 'x'|T], ['ĵ'|R]) :- !, replace_diacritics(T, R). % Replace jx with ĵ         % X-system ĵ
replace_diacritics(['s', 'x'|T], ['ŝ'|R]) :- !, replace_diacritics(T, R). % Replace sx with ŝ         % X-system ŝ
replace_diacritics(['u', 'x'|T], ['ŭ'|R]) :- !, replace_diacritics(T, R). % Replace ux with ŭ         % X-system ŭ

% --- H-System support (ch, gh, hh, jh, sh) ---
% Patterns: [char, 'h'] -> [unicode_char]
replace_diacritics(['c', 'h'|T], ['ĉ'|R]) :- !, replace_diacritics(T, R). % Replace ch with ĉ         % H-system ĉ
replace_diacritics(['g', 'h'|T], ['ĝ'|R]) :- !, replace_diacritics(T, R). % Replace gh with ĝ         % H-system ĝ
replace_diacritics(['h', 'h'|T], ['ĥ'|R]) :- !, replace_diacritics(T, R). % Replace hh with ĥ         % H-system ĥ
replace_diacritics(['j', 'h'|T], ['ĵ'|R]) :- !, replace_diacritics(T, R). % Replace jh with ĵ         % H-system ĵ
replace_diacritics(['s', 'h'|T], ['ŝ'|R]) :- !, replace_diacritics(T, R). % Replace sh with ŝ         % H-system ŝ

% --- Caret/Hat support (c^, g^, h^, j^, s^, u^) ---
% Patterns: [char, '^'] -> [unicode_char]
replace_diacritics(['c', '^'|T], ['ĉ'|R]) :- !, replace_diacritics(T, R). % Replace c^ with ĉ         % Caret ĉ
replace_diacritics(['g', '^'|T], ['ĝ'|R]) :- !, replace_diacritics(T, R). % Replace g^ with ĝ         % Caret ĝ
replace_diacritics(['h', '^'|T], ['ĥ'|R]) :- !, replace_diacritics(T, R). % Replace h^ with ĥ         % Caret ĥ
replace_diacritics(['j', '^'|T], ['ĵ'|R]) :- !, replace_diacritics(T, R). % Replace j^ with ĵ         % Caret ĵ
replace_diacritics(['s', '^'|T], ['ŝ'|R]) :- !, replace_diacritics(T, R). % Replace s^ with ŝ         % Caret ŝ
replace_diacritics(['u', '^'|T], ['ŭ'|R]) :- !, replace_diacritics(T, R). % Replace u^ with ŭ         % Caret ŭ

% --- Default case: no replacement needed ---
replace_diacritics([H|T], [H|R]) :-          % Recursive case: keep character as is                     % Keep char
    replace_diacritics(T, R).                % Continue with the rest of the list                       % Recurse