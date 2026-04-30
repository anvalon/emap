% -----------------------------------------------------------------
% File: letters.pl
% Project: Esperanto Morphological Analyzer
% Section: 2 - Letter Level Logic
% 
% Description:
% This module handles the recognition of individual alphabet letters.
% It implements the logic for the 'letter' rule defined in the EBNF.
% Letters are identified as standalone units and return the 
% informative atom 'let'.
%
% Grammar Rules Implemented:
% - letter = a | bo | co | ...
% -----------------------------------------------------------------

% --- External Dependencies Declarations ---
% Inform Prolog that letter/1 is a dynamic predicate defined in files.pl
:- discontiguous letter/1.

% -----------------------------------------------------------------
% letter/2: Validation and Tagging of Alphabet Letters
% letter(+CharList, -Output)
% -----------------------------------------------------------------
% This predicate checks if the input character list (CharList) matches
% one of the letter names stored in the database.
% Upon success, it unifies Output with the informative atom 'let'.
% -----------------------------------------------------------------
letter(CharList, [[CharList, let]]) :-
    letter(CharList).