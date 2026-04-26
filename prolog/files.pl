% -----------------------------------------------------------------
% File: files.pl
% Project: Esperanto Morphological Analyzer
% Description: Data loading module.
%              Handles reading external dictionary files (.txt)
%              and asserting them as dynamic Prolog facts.
% -----------------------------------------------------------------

% --- Dynamic Predicates Declaration ---
% These predicates are populated at runtime from external files.
:- dynamic root/1, prefix/1, suffix/1.

% -----------------------------------------------------------------
% load_data/0: Automated dictionary loading with relative path resolution
% -----------------------------------------------------------------
load_data :- 
    % 1. Identify the absolute path of the current script
    source_file(load_data, FilePath),
    file_directory_name(FilePath, PrologDir),
    
    % 2. Resolve the project root (assuming /prolog is a subfolder)
    file_directory_name(PrologDir, ProjectRoot),
    
    % 3. Construct absolute paths to the /data folder
    atomic_list_concat([ProjectRoot, '/data/roots.txt'],    RootPath),
    atomic_list_concat([ProjectRoot, '/data/prefixes.txt'], PrefixPath),
    atomic_list_concat([ProjectRoot, '/data/suffixes.txt'], SuffixPath),
    
    % 4. Load each dictionary using utilities from files.pl
    load_from_file(RootPath,   root),
    load_from_file(PrefixPath, prefix),
    load_from_file(SuffixPath, suffix),
    format('--- Dictionaries updated in main ---~n', []).

% -----------------------------------------------------------------
% load_from_file/2: Generic logic to clear a predicate and load data
% load_from_file(+FileName, +PredicateName)
% -----------------------------------------------------------------
load_from_file(FileName, PredicateName) :-
    % 1. Construct a generic term for the predicate (e.g., root(_))
    Term =.. [PredicateName, _],
    
    % 2. Remove any existing data to prevent duplicates during reload
    retractall(Term),
    
    % 3. Open the file, process its content, and ensure closure even on error
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
    (   Codes == end_of_file
    ->  true
    ;   % Convert codes to atom and trim whitespace
        atom_codes(RawAtom, Codes),
        normalize_space(atom(Atom), RawAtom),
        
        (   Atom \== ''
        ->  % Convert the word into a list of characters
            atom_chars(Atom, Chars),
            % Dynamically create the fact (e.g., root(['d','o','m']))
            Fact =.. [PredicateName, Chars],
            assertz(Fact)
        ;   true % Skip empty lines
        ),
        % Recursive call for the next line
        read_lines(In, PredicateName)
    ).
