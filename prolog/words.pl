% -----------------------------------------------------------------
% File: word.pl
% Project: Esperanto Morphological Analyzer
% Section: 0 - Word Level Logic
% 
% Description:
% This file serves as the main entry point for word analysis. 
% It implements the top-level grammar rules defined in Section 0 
% of the EBNF specification. It coordinates the dispatching of 
% strings to specific handlers for bound roots, correlatives, 
% and free roots.
%
% Grammar Rules Implemented:
% - word      = {word_part} word_head 
% - word_head = free_extended | correlative_extended | bound_extended
% -----------------------------------------------------------------

% --- External Dependencies Declarations ---
% These declarations prevent "undefined procedure" errors during compilation
% Inform Prolog that bound_extended/2 is defined elsewhere
:- discontiguous bound_extended/2. 

% Main predicate to validate and segment a word.
% Now strictly focused on the morphological definition.
word(CharList, Sols) :-
    word_head(CharList, Sols).

% Section 0: word_head
% Dispatches the word head to the appropriate morphological category
word_head(In, Sols) :-
    bound_extended(In, Sols).