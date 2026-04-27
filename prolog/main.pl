% -----------------------------------------------------------------
% File: main.pl
% Project: EMAP - Esperanto Morphological Analyzer in Prolog
% Description: Core system coordinator.
%              This file loads all functional modules, initializes the dictionaries via files.pl,
%              and prepares the environment for word analysis and testing.
% -----------------------------------------------------------------
% Execution Instructions
% -----------------------------------------------------------------
% 1. Start Prolog in the project directory.
% 2. Load the system: 
%    ?- [main].
% 3. To run tests:
%    ?- [tests].
%    ?- run_tests.
% -----------------------------------------------------------------

% --- Module Imports ---
% These imports ensure that the file is modular and paths remain 
% relative to the location of main.pl.
:- ensure_loaded(format).    % Formatting utilities
:- ensure_loaded(files).     % File management
:- ensure_loaded(tails).     % Grammatical endings
:- ensure_loaded(prefixes).  % Recursive prefix logic                                     
:- ensure_loaded(suffixes).  % Recursive suffix logic
:- ensure_loaded(corrs).     % Correlative logic
:- ensure_loaded(roots).     % Root logic
:- ensure_loaded(words).     % Main word logic

% -----------------------------------------------------------------
% analyze/2: Coordination of normalization, analysis, and formatting
% analyze(+RawInput, -FormattedResult)
% -----------------------------------------------------------------
% 1. Takes raw input (string or atom).
% 2. Normalizes it to handle Esperanto diacritics.
% 3. Converts it to a character list for the grammar logic.
% 4. Executes morphological segmentation.
% 5. Formats the internal list into a tagged hyphenated string.
% -----------------------------------------------------------------
analyze(Input, Output) :-
    format_input(Input, Atom),        % Step 1: Normalize input (e.g., mangxas -> manĝas)
    atom_chars(Atom, CharList),       % Step 2: Convert atom to char list for word/2
    word(CharList, Analyzed),         % Step 3: Call morphological analysis logic in words.pl
    format_output(Analyzed, Output).  % Step 4: Format to 'root{rad}-tail{sub}'

% -----------------------------------------------------------------
% update/0: High-level system update command
% -----------------------------------------------------------------
% This predicate acts as a facade for load_data/0 in files.pl.
% It is used to refresh dictionaries without restarting the shell.
% -----------------------------------------------------------------
update :- load_data.

% -----------------------------------------------------------------
% System Initialization
% -----------------------------------------------------------------
% This directive ensures that load_data is executed as soon as 
% the main.pl file is loaded into the Prolog interpreter.
% -----------------------------------------------------------------
:- initialization(update).