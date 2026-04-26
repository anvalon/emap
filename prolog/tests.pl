% -----------------------------------------------------------------
% File: tests.pl
% Project: Esperanto Morphological Analyzer
% Description: Test Suite Engine.
%              Automates validation by comparing actual segments 
%              with expected results. Handles dynamic alignment.
% -----------------------------------------------------------------
:- ensure_loaded(main).        % Load logic only if needed
:- ensure_loaded(tests_data).  % Load test cases only if needed

% --- Test Engine Entry Points ---
run_tests :- run_tests(all).
run_tests(Visibility) :-
    format('~n--- Starting Tests (Morpheme comparison) ---~n', []),
    findall(t(Mode, In, Exp), test_case(Mode, In, Exp), AllTests),
    split_tests(AllTests, Blocks),
    run_blocks(Blocks, Visibility, 0, 0, TotalP, TotalF),
    format('~n--- Test Results: ~w Passed, ~w Failed ---~n', [TotalP, TotalF]).

% --- Split tests into blocks based on 'info' markers ---
split_tests([], []).
split_tests([t(info, Msg, _)|Rest], [[info(Msg)|Block]|OtherBlocks]) :-
    extract_until_info(Rest, Block, Remaining),
    split_tests(Remaining, OtherBlocks).
split_tests([_|Rest], Blocks) :- split_tests(Rest, Blocks).

extract_until_info([], [], []).
extract_until_info([t(info, Msg, Exp)|Rest], [], [t(info, Msg, Exp)|Rest]) :- !.
extract_until_info([H|T], [H|Rest], Remaining) :- extract_until_info(T, Rest, Remaining).

% --- Run Blocks: Handles header printing and alignment calculation ---
run_blocks([], _, P, F, P, F).
run_blocks([[info(Msg)|Tests]|Rest], Visibility, AccP, AccF, TotalP, TotalF) :-
    format('~n--- ~w ---~n', [Msg]),
    get_max_length(Tests, MaxL),
    % ArrowCol: Calculation to ensure arrows '->' are vertically aligned.
    % Base (13) + length of the longest word in the section.
    ArrowCol is 13 + MaxL,
    run_and_count(Tests, Visibility, ArrowCol, AccP, AccF, NewP, NewF),
    run_blocks(Rest, Visibility, NewP, NewF, TotalP, TotalF).

% --- Max Length: Finds the longest input string for the current block ---
get_max_length(Tests, MaxL) :-
    findall(Len, (member(t(Mode, In, _), Tests), (Mode == pos; Mode == neg), atom_length(In, Len)), Lengths),
    ( Lengths == [] -> MaxL = 0 ; max_list(Lengths, MaxL) ).

% --- Recursive Processor: Executes tests and accumulates results ---
run_and_count([], _, _, P, F, P, F).

run_and_count([t(blank, _, _)|Rest], Visibility, ArrowCol, AccP, AccF, TotalP, TotalF) :-
    run_and_count(Rest, Visibility, ArrowCol, AccP, AccF, TotalP, TotalF).

run_and_count([t(pos, In, Exp)|Rest], Visibility, ArrowCol, AccP, AccF, TotalP, TotalF) :-
    ( setof(S, analyze(In, S), Sols) ->
        maplist(strip_tags_from_atom, Sols, CleanSols),
        ( member(Exp, CleanSols) -> 
            Status = pass, NewAccP is AccP + 1, NewAccF = AccF
        ;   Status = fail, NewAccP = AccP, NewAccF is AccF + 1
        ),
        report_pos(Status, In, Sols, Exp, Visibility, ArrowCol)
    ;   NewAccP = AccP, NewAccF is AccF + 1,
        report_pos(fail, In, [], Exp, Visibility, ArrowCol)
    ),
    run_and_count(Rest, Visibility, ArrowCol, NewAccP, NewAccF, TotalP, TotalF).

run_and_count([t(neg, In, _)|Rest], Visibility, ArrowCol, AccP, AccF, TotalP, TotalF) :-
    ( analyze(In, _) ->
        Status = fail, NewAccP = AccP, NewAccF = AccF + 1
    ;   Status = pass, NewAccP is AccP + 1, NewAccF = AccF
    ),
    report_neg(Status, In, Visibility, ArrowCol),
    run_and_count(Rest, Visibility, ArrowCol, NewAccP, NewAccF, TotalP, TotalF).

% --- Reporting Helpers ---

report_pos(pass, _, _, _, failed_only, _) :- !.
report_pos(Status, In, Sols, Exp, _, ArrowCol) :-
    upcase_atom(Status, Label),
    atom_length(In, InLen),
    % Padding calculation ensures the first '->' is in the correct column.
    Padding is ArrowCol - 13 - InLen,
    % The space (code 32) after ~*c is crucial for alignment.
    format('[~w] (pos) ~w ~*c ', [Label, In, Padding, 32]),
    ( Status == fail ->
        atomic_list_concat(Sols, ', ', ActualStr),
        format('-> --- ERROR! --- (Actual: ~w, Expected: ~w)~n', [ActualStr, Exp])
    ;   print_solutions(Sols, ArrowCol)
    ).

% print_solutions/2: Handles one or more results for a word
print_solutions([], _) :- format('-> --- ERROR! --- (No solution found)~n', []).
print_solutions([First|Rest], ArrowCol) :-
    format('-> ~w~n', [First]),
    print_rest_solutions(Rest, ArrowCol).

% print_rest_solutions/2: Indents secondary results to align with the first arrow
print_rest_solutions([], _).
print_rest_solutions([H|T], ArrowCol) :-
    % Offset accounts for the primary line's prefix and word length.
    Offset is ArrowCol + 1, 
    format('~*c -> ~w~n', [Offset, 32, H]),
    print_rest_solutions(T, ArrowCol).

report_neg(pass, _, failed_only, _) :- !.
report_neg(Status, In, _, ArrowCol) :-
    upcase_atom(Status, Label),
    atom_length(In, InLen),
    Padding is ArrowCol - 13 - InLen,
    format('[~w] (neg) ~w ~*c ', [Label, In, Padding, 32]),
    ( Status == pass ->
        format('-> Correctly rejected!~n', [])
    ;   format('-> --- ERROR! --- (Should fail)~n', [])
    ).

% --- Internal Helpers: Strips {tags} for raw comparison ---
strip_tags_from_atom(AtomIn, AtomOut) :-
    atom_chars(AtomIn, Chars),
    process_chars(Chars, CleanChars),
    atom_chars(Output, CleanChars),
    normalize_space(atom(AtomOut), Output).

process_chars([], []).
process_chars(['{'|T], Out) :- !, skip_until_closing('}', T, Rest), process_chars(Rest, Out).
process_chars(['['|T], Out) :- !, skip_until_closing(']', T, Rest), process_chars(Rest, Out).
process_chars([H|T], [H|R]) :- process_chars(T, R).

skip_until_closing(Char, [Char|T], T) :- !.
skip_until_closing(Char, [_|T], R) :- skip_until_closing(Char, T, R).