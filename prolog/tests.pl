% -----------------------------------------------------------------
% File: tests.pl
% Project: Esperanto Morphological Analyzer
% Description: Test Suite Engine.
%              This module automates the validation of the analyzer 
%              by comparing actual morphological segments with 
%              expected results. 
%
% Key Improvements:
% 1. Mathematical Failure Accumulation: Total failures are now 
%    summed as integers for a clear final report.
% 2. Negative Test Debugging: If a negative test fails (i.e., a 
%    word is incorrectly accepted), the system now displays 
%    the actual analysis to help identify logic leaks.
% 3. Dynamic Alignment: Arrows and results are vertically 
%    aligned based on the longest word in each block.
% -----------------------------------------------------------------
:- ensure_loaded(main).        % Ensure core analyzer is available
:- ensure_loaded(tests_data).  % Load the database of test cases

% -----------------------------------------------------------------
% run_tests/0-1: Test Engine Entry Points
% -----------------------------------------------------------------
run_tests :- run_tests(all), !.

run_tests(Visibility) :-
    format('~n==================================', []),
    format('~n          Starting Tests          ', []),
    format('~n==================================~n', []),
    % Gather all test cases defined in tests_data.pl
    findall(t(Mode, In, Exp), test_case(Mode, In, Exp), AllTests),
    % Group tests into blocks based on 'info' markers
    split_tests(AllTests, Blocks),
    % Execute blocks and collect final integer totals
    run_blocks(Blocks, Visibility, 0, 0, TotalP, TotalF),
    format('~n--- Test Results: ~w Passed, ~w Failed ---~n', [TotalP, TotalF]),
    !.

% -----------------------------------------------------------------
% split_tests/2: Helper to group tests by section
% -----------------------------------------------------------------
split_tests([], []).
split_tests([t(info, Msg, _)|Rest], [[info(Msg)|Block]|OtherBlocks]) :-
    extract_until_info(Rest, Block, Remaining),
    split_tests(Remaining, OtherBlocks).
split_tests([_|Rest], Blocks) :- split_tests(Rest, Blocks).

extract_until_info([], [], []).
extract_until_info([t(info, Msg, Exp)|Rest], [], [t(info, Msg, Exp)|Rest]) :- !.
extract_until_info([H|T], [H|Rest], Remaining) :- extract_until_info(T, Rest, Remaining).

% -----------------------------------------------------------------
% run_blocks/6: Processes test groups and accumulates results
% -----------------------------------------------------------------
run_blocks([], _, P, F, P, F).
run_blocks([[info(Msg)|Tests]|Rest], Visibility, AccP, AccF, TotalP, TotalF) :-
    % 1. Filtriamo i test che producono output in base alla visibilità
    include(should_show_test(Visibility), Tests, VisibleTests),
    ( VisibleTests \= [] ->
        % 2. Se ci sono test da mostrare, stampiamo l'intestazione
        format('~n--- ~w ---~n', [Msg]),
        get_max_length(Tests, MaxL),
        ArrowCol is 13 + MaxL,
        run_and_count(Tests, Visibility, ArrowCol, AccP, AccF, NewP, NewF)
    ;   
        % 3. Altrimenti, contiamo i risultati "silenziosamente" per non perdere i totali
        run_and_count_silent(Tests, AccP, AccF, NewP, NewF)
    ),
    run_blocks(Rest, Visibility, NewP, NewF, TotalP, TotalF).

% Helper per determinare se un test deve essere mostrato
should_show_test(all, t(Mode, _, _)) :- member(Mode, [pos, neg]).
should_show_test(failed_only, t(pos, In, Exp)) :- 
    \+ (setof(S, analyze(In, S), Sols), maplist(strip_tags_from_atom, Sols, CleanSols), member(Exp, CleanSols)).
should_show_test(failed_only, t(neg, In, _)) :- 
    analyze(In, _). % Fallisce se viene accettato

% Versione silenziosa di run_and_count per mantenere i totali corretti
run_and_count_silent([], P, F, P, F).
run_and_count_silent([t(blank,_,_)|T], P, F, RP, RF) :- run_and_count_silent(T, P, F, RP, RF).
run_and_count_silent([t(pos, In, Exp)|T], P, F, RP, RF) :-
    (setof(S, analyze(In, S), Sols), maplist(strip_tags_from_atom, Sols, CleanSols), member(Exp, CleanSols) -> 
        NP is P + 1, NF = F ; NP = P, NF is F + 1),
    run_and_count_silent(T, NP, NF, RP, RF).
run_and_count_silent([t(neg, In, _)|T], P, F, RP, RF) :-
    (analyze(In, _) -> NP = P, NF is F + 1 ; NP is P + 1, NF = F),
    run_and_count_silent(T, NP, NF, RP, RF).

% -----------------------------------------------------------------
% run_and_count/7: Executes individual tests and sums results
% -----------------------------------------------------------------
run_and_count([], _, _, P, F, P, F).

% Skip blank lines/markers
run_and_count([t(blank, _, _)|Rest], Visibility, ArrowCol, AccP, AccF, TotalP, TotalF) :-
    run_and_count(Rest, Visibility, ArrowCol, AccP, AccF, TotalP, TotalF).

% Handle Positive Tests (Expected success)
run_and_count([t(pos, In, Exp)|Rest], Visibility, ArrowCol, AccP, AccF, TotalP, TotalF) :-
    ( setof(S, analyze(In, S), Sols) ->
        maplist(strip_tags_from_atom, Sols, CleanSols),
        ( member(Exp, CleanSols) -> 
            Status = pass, NewAccP is AccP + 1, NewAccF = AccF
        ;   Status = fail, NewAccP = AccP, NewAccF is AccF + 1
        ),
        report_pos(Status, In, Sols, Exp, Visibility, ArrowCol)
    ;   Status = fail, NewAccP = AccP, NewAccF is AccF + 1,
        report_pos(Status, In, [], Exp, Visibility, ArrowCol)
    ),
    run_and_count(Rest, Visibility, ArrowCol, NewAccP, NewAccF, TotalP, TotalF).

% Handle Negative Tests (Expected failure)
run_and_count([t(neg, In, _)|Rest], Visibility, ArrowCol, AccP, AccF, TotalP, TotalF) :-
    % Collect all possible analyses to show them if the test fails
    ( setof(S, analyze(In, S), Sols) ->
        Status = fail, NewAccP = AccP, NewAccF is AccF + 1,
        Actual = Sols
    ;   Status = pass, NewAccP is AccP + 1, NewAccF = AccF,
        Actual = []
    ),
    report_neg(Status, In, Actual, Visibility, ArrowCol),
    run_and_count(Rest, Visibility, ArrowCol, NewAccP, NewAccF, TotalP, TotalF).

% -----------------------------------------------------------------
% Reporting Helpers
% -----------------------------------------------------------------

% report_pos/6: Displays results for positive test cases
report_pos(pass, _, _, _, failed_only, _) :- !.
report_pos(Status, In, Sols, Exp, _, ArrowCol) :-
    upcase_atom(Status, Label),
    atom_length(In, InLen),
    Padding is ArrowCol - 13 - InLen,
    format('[~w] (pos) ~w ~*c ', [Label, In, Padding, 32]),
    ( Status == fail ->
        atomic_list_concat(Sols, ', ', ActualStr),
        format('-> --- ERROR! --- (Actual: ~w, Expected: ~w)~n', [ActualStr, Exp])
    ;   print_solutions(Sols, ArrowCol)
    ).

% report_neg/5: Displays results for negative test cases
% If Status is 'fail', it shows the unexpected analyses found.
report_neg(pass, _, _, failed_only, _) :- !.
report_neg(Status, In, Sols, _, ArrowCol) :-
    upcase_atom(Status, Label),
    atom_length(In, InLen),
    Padding is ArrowCol - 13 - InLen,
    format('[~w] (neg) ~w ~*c ', [Label, In, Padding, 32]),
    ( Status == pass ->
        format('-> Correctly rejected!~n', [])
    ;   % If it failed to reject, show what was actually found
        atomic_list_concat(Sols, ', ', ActualStr),
        format('-> --- ERROR! --- (Should fail, but accepted as: ~w)~n', [ActualStr])
    ).

% -----------------------------------------------------------------
% Formatting and Utility Helpers
% -----------------------------------------------------------------

% print_solutions/2: Prints one or multiple solutions with alignment
print_solutions([], _) :- format('-> --- ERROR! --- (No solution found)~n', []).
print_solutions([First|Rest], ArrowCol) :-
    format('-> ~w~n', [First]),
    print_rest_solutions(Rest, ArrowCol).

print_rest_solutions([], _).
print_rest_solutions([H|T], ArrowCol) :-
    Offset is ArrowCol + 1, 
    format('~*c -> ~w~n', [Offset, 32, H]),
    print_rest_solutions(T, ArrowCol).

% get_max_length/2: Finds the length of the longest input atom in a list
get_max_length(Tests, MaxL) :-
    findall(Len, (member(t(Mode, In, _), Tests), (Mode == pos; Mode == neg), atom_length(In, Len)), Lengths),
    ( Lengths == [] -> MaxL = 0 ; max_list(Lengths, MaxL) ).

% strip_tags_from_atom/2: Removes {tags} for raw comparison with expected results
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