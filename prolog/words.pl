% -----------------------------------------------------------------
% File: words.pl
% Project: Esperanto Morphological Analyzer
% Section: 0 - Word Level Logic
% 
% Description:
% This file serves as the main entry point for word analysis. 
% It implements the top-level grammar rules defined in Section 0 
% of the EBNF specification. It coordinates the dispatching of 
% strings to specific handlers for bound roots, correlatives, 
% free roots, and now individual alphabet letters.
%
% Grammar Rules Implemented:
% - word      = word_head | letter
% - word_head = corr_ext | tiny_ext | root_wrd
% -----------------------------------------------------------------

% --- External Dependencies Declarations ---
:- discontiguous root_extended/2.
:- discontiguous corr_extended/2.
:- discontiguous tiny_extended/2.
:- discontiguous letter/2.
:- discontiguous invar/2.

% -----------------------------------------------------------------
% word/2: Main entry point for word validation.
% -----------------------------------------------------------------
% According to EBNF: word = word_head | letter.
% It first tries to match the input as a complex word head,
% and if that fails, it checks if it is a single letter name.
% -----------------------------------------------------------------
word(CharList, Output) :-
    letter(CharList, Output),
    !. % If it is a letter, we stop here.

word(CharList, Output) :-
    invar(CharList, Output),
    !. % If it is a letter, we stop here.

word(CharList, Output) :-
    word_head(CharList, Output).

% -----------------------------------------------------------------
% word_head/2: Dispatches to specific morphological categories.
% -----------------------------------------------------------------
% Implements: word_head = corr_ext | tiny_ext | root_wrd
% -----------------------------------------------------------------
word_head(In, Output) :-
    corr_extended(In, Output),
    !.

word_head(In, Output) :-
    tiny_extended(In, Output), 
    !.

word_head(In, Output) :-
    root_extended(In, Output).