% -----------------------------------------------------------------
% File: main.pl
% Project: Esperanto Morphological Analyzer
% Description: Core system coordinator.
%              This file loads all functional modules, initializes
%              the dictionaries via files.pl, and prepares the
%              environment for word analysis and testing.
% -----------------------------------------------------------------

% --- Module Imports ---
:- [utils].  % Formatting utilities
:- [files].  % Dictionary management utilities
:- [chars].  % Character normalization
:- [tails].  % Grammatical endings
:- [bound].  % Bound root logic (Section 3)
:- [words].  % Main entry point (Section 0)

% -----------------------------------------------------------------
% analyze/2: Coordination of normalization, analysis, and formatting
% analyze(+RawInput, -FormattedResult)
% -----------------------------------------------------------------
analyze(In, Result) :-
    normalize_input(In, Atom),              % 1. Normalizza (X-system, H-system, ecc.)
    atom_chars(Atom, CharList),             % 2. Converte in lista di caratteri per la logica morfologica
    word(CharList, Sols),                   % 3. Esegue la scomposizione vera e propria (definita in word.pl)
    format_tagged_segments(Sols, Result).   % 4. Formatta il risultato con i tag per l'output (es. dom{rad}-o{sub})

% -----------------------------------------------------------------
% update/0: High-level system update command
% -----------------------------------------------------------------
update :- load_data.

% -----------------------------------------------------------------
% System Initialization
% -----------------------------------------------------------------
:- initialization(update).

% -----------------------------------------------------------------
% Execution Instructions
% -----------------------------------------------------------------
% 1. Start Prolog in the project directory.
% 2. Load the system: 
%    ?- [main].
% 3. To run tests:
%    ?- run_tests.
% -----------------------------------------------------------------