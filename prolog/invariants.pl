% -----------------------------------------------------------------
% File: invar.pl
% Project: Esperanto Morphological Analyzer
% Section: 3 - Invariant Logic
% 
% Description:
% This module handles the recognition of invariant words that 
% cannot take any affixes or grammatical endings.
%
% Grammar Rules Implemented:
% - invar = almenaŭ | ankaŭ | ĉar | ...
% -----------------------------------------------------------------

% --- External Dependencies Declarations ---
% 'invar/1' is the dynamic predicate populated from invars.txt
:- dynamic invar/1.

% -----------------------------------------------------------------
% invar/2: Validation of Invariant Words
% invar(+CharList, -Output)
% -----------------------------------------------------------------
% This predicate checks if the input character list matches 
% an entry in the invariant words database.
% Returns a tagged structure: [[CharList, invar]]
% -----------------------------------------------------------------
invar(CharList, [[CharList, invar]]) :-
    invar(CharList). % Lookup in dynamic facts loaded by files.pl