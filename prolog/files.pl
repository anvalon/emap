% -----------------------------------------------------------------
% File: files.pl
% Project: Esperanto Morphological Analyzer
% Description: Data loading module.
%              Handles reading external dictionary files (.txt)
%              and asserting them as dynamic Prolog facts.
% -----------------------------------------------------------------

% --- Dynamic Predicates Declaration ---
% These predicates are populated at runtime from external files.
:- dynamic root/1, prefix/1, suffix/1, tiny/1. %

% -----------------------------------------------------------------
% load_data/0: Logic to resolve paths and load all dictionaries
% -----------------------------------------------------------------
% 1. Finds the directory of this script.
% 2. Navigates to the project root and then to the /data folder.
% 3. Maps each .txt file to its corresponding dynamic predicate.
% -----------------------------------------------------------------
load_data :- 
    % We use relative paths starting from the current working directory (pwd)
    % We go up one level (..) and then descend into the data/ folder
    load_from_file('../data/roots.txt',    root),
    load_from_file('../data/prefixes.txt', prefix),
    load_from_file('../data/suffixes.txt', suffix),
    load_from_file('../data/tinies.txt',   tiny),
    format('--- Dictionaries loaded from relative paths ---~n', []).

% -----------------------------------------------------------------
% load_from_file/2: Generic logic to clear a predicate and load data
% load_from_file(+FileName, +PredicateName)
% -----------------------------------------------------------------
load_from_file(FileName, PredicateName) :-
    Term =.. [PredicateName, _],   % Construct a generic term for the predicate (e.g., root(_))
    retractall(Term),              % Remove any existing data to prevent duplicates during reload
    
    % Open the file, process its content, and ensure closure even on error
    setup_call_cleanup(
        open(FileName, read, In),
        read_lines(In, PredicateName),
        close(In)
    ).

% -----------------------------------------------------------------
% read_lines/2: Helper to process text files line by line
% -----------------------------------------------------------------
read_lines(In, PredicateName) :-
    read_line_to_codes(In, Codes),
    (   Codes == end_of_file ->  true;
        atom_codes(RawAtom, Codes),                   % Convert codes to atom and trim whitespace
        normalize_space(atom(Atom), RawAtom),
        
        (   Atom \== '' ->  atom_chars(Atom, Chars),  % Convert the word into a list of characters
            Fact =.. [PredicateName, Chars],          % Dynamically create the fact (e.g., root(['d','o','m']))
            assertz(Fact);
            true                                      % Skip empty lines
        ),
        read_lines(In, PredicateName)                 % Recursive call for the next line
    ).