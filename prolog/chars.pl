% -----------------------------------------------------------------
% File: chars.pl
% Project: Esperanto Morphological Analyzer
% Description: Character normalization module.
%              Converts various Esperanto writing systems (X-system, 
%              H-system, and Caret-system) into standard Unicode.
% -----------------------------------------------------------------

% -----------------------------------------------------------------
% normalize_input/2 (Main Entry Point)
% normalize_input(+Input, -Output)
% -----------------------------------------------------------------
% Converts a raw input string (or atom) into a normalized Unicode atom.
% Example: "mangxas" -> 'manĝas', "mang^as" -> 'manĝas'
% -----------------------------------------------------------------
normalize_input(Input, Output) :-
    % 1. Convert the input string/atom into a list of characters
    string_chars(Input, Chars),
    
    % 2. Recursively replace multi-character sequences with Unicode
    replace_diacritics(Chars, CleanChars),
    
    % 3. Convert the cleaned character list back into a single atom
    atom_chars(Output, CleanChars).

% -----------------------------------------------------------------
% replace_diacritics/2: Recursive character replacement logic
% -----------------------------------------------------------------
replace_diacritics([], []).

% --- X-System support (cx, gx, hx, jx, sx, ux) ---
% Patterns: [char, 'x'] -> [unicode_char]
replace_diacritics(['c', 'x'|T], ['ĉ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['g', 'x'|T], ['ĝ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['h', 'x'|T], ['ĥ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['j', 'x'|T], ['ĵ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['s', 'x'|T], ['ŝ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['u', 'x'|T], ['ŭ'|R]) :- !, replace_diacritics(T, R).

% --- H-System support (ch, gh, hh, jh, sh) ---
% Patterns: [char, 'h'] -> [unicode_char]
% Note: 'uh' is not standard for 'ŭ', but often used in H-system variations.
replace_diacritics(['c', 'h'|T], ['ĉ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['g', 'h'|T], ['ĝ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['h', 'h'|T], ['ĥ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['j', 'h'|T], ['ĵ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['s', 'h'|T], ['ŝ'|R]) :- !, replace_diacritics(T, R).

% --- Caret/Hat support (c^, g^, h^, j^, s^, u^) ---
% Patterns: [char, '^'] -> [unicode_char]
replace_diacritics(['c', '^'|T], ['ĉ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['g', '^'|T], ['ĝ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['h', '^'|T], ['ĥ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['j', '^'|T], ['ĵ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['s', '^'|T], ['ŝ'|R]) :- !, replace_diacritics(T, R).
replace_diacritics(['u', '^'|T], ['ŭ'|R]) :- !, replace_diacritics(T, R).

% --- Base Case: No replacement needed ---
% If no pattern matches, keep the current character and move to the next.
replace_diacritics([H|T], [H|R]) :- 
    replace_diacritics(T, R).