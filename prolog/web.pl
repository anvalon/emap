% -----------------------------------------------------------------
% File: web.pl
% Project: Esperanto Morphological Analyzer
% Description: Web Interface Bridge.
%              This module handles the communication between the 
%              Prolog engine and external web services (like PHP).
%              It formats the analysis results into JSON strings.
% -----------------------------------------------------------------

% --- Core Engine Import ---
% Ensure the main segmentation logic is loaded before processing.
:- [main].

% -----------------------------------------------------------------
% analyze_for_web/1: Main API Entry Point
% analyze_for_web(+Word)
% -----------------------------------------------------------------
% 1. Takes a word from the web input.
% 2. Attempts to find all unique segmentation solutions using setof/3.
% 3. Outputs a JSON object directly to the standard output.
% 4. Terminates the Prolog process to return control to the caller.
% -----------------------------------------------------------------
analyze_for_web(Word) :-
    % setof/3 gathers all unique solutions for analyze(Word, S).
    % Updated from 'word' to 'analyze' to handle the full workflow.
    ( setof(S, analyze(Word, S), Solutions)
    -> % --- SUCCESS CASE ---
       format('{"status":"success", "solutions":[', []),
       % Recursively print the list of solutions in JSON format
       print_json_list(Solutions),
       format(']}', [])
    ;  % --- ERROR CASE ---
       % If analysis fails, return a structured error message.
       format('{"status":"error", "message":"Word not recognized"}', [])
    ),
    % halt/0 is crucial here: it tells the SWI-Prolog interpreter 
    % to close the process after printing the result.
    halt.

% -----------------------------------------------------------------
% print_json_list/1: JSON Formatting Helper
% -----------------------------------------------------------------
% Recursively iterates through the list of solutions to create 
% a valid JSON array of strings: "sol1", "sol2", ...
% -----------------------------------------------------------------

% Base Case: Only one solution left (no trailing comma).
print_json_list([H]) :- 
    format('"~w"', [H]).

% Recursive Case: Multiple solutions (print current one with a comma).
print_json_list([H|T]) :- 
    format('"~w",', [H]),
    print_json_list(T).