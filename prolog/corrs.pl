% -----------------------------------------------------------------
% File: corrs.pl
% Project: Esperanto Morphological Analyzer
% Section: 2 - Correlatives
% 
% Description:
% This module implements the analysis of Esperanto correlatives based 
% on the EBNF specification. It decomposes correlatives into a 
% prefix root (ki-, ti-, ĉi-, i-, neni-) and a specific final 
% category (a, o, u, e, am, al, el, es, om).
%
% The logic handles three types of endings:
% 1. Type A (u, o, a): Supports plural (-j) and accusative (-n).
% 2. Type B (e): Supports only the accusative (-n).
% 3. Type C (am, al, el, es, om): Invariable endings.
%
% Grammar Rules Implemented:
% - correlative_extended = correlative_root + correlative_final_parts
% - correlative_root     = "ki" | "ti" | "ĉi" | "i" | "neni"
% -----------------------------------------------------------------

% --- External Dependencies Declarations ---
% Inform Prolog that these predicates are defined in tails.pl to avoid warnings
:- discontiguous check_jn/2. 
:- discontiguous check_n/2.

% --- Correlative Roots Definition ---
% Maps the initial part of the correlative to its semantic tag
% Source: EBNF correlative_root [cite: 7]
corr_root(['k', 'i'],        'rel'). % Interrogative/Relative
corr_root(['t', 'i'],        'mnt'). % Demonstrative
corr_root(['ĉ', 'i'],        'omn'). % Collective/Universal
corr_root(['i'],             'ned'). % Indefinite
corr_root(['n','e','n','i'], 'neg'). % Negative

% --- Correlative Finals: Type A ---
% These endings represent individuals, objects, or qualities
% They can take plural (-j) and/or accusative (-n) markers [cite: 8, 15]
corr_final_a(['u'], 'ind'). % Individual
corr_final_a(['o'], 'obj'). % Thing/Object
corr_final_a(['a'], 'eco'). % Quality

% --- Correlative Finals: Type B ---
% This ending represents location and can take an accusative for direction [cite: 8, 15]
corr_final_b(['e'], 'lok').

% --- Correlative Finals: Type C ---
% These are specialized endings for time, reason, manner, etc. [cite: 9]
% They are generally treated as invariable in standard analysis.
corr_final_c(['a', 'm'], 'tmp'). % Time
corr_final_c(['a', 'l'], 'mot'). % Reason/Motive
corr_final_c(['e', 'l'], 'man'). % Manner
corr_final_c(['e', 's'], 'pos'). % Possession
corr_final_c(['o', 'm'], 'kvn'). % Quantity

% -----------------------------------------------------------------
% correlative_extended/2
% -----------------------------------------------------------------
% Main entry point for correlative analysis. Splits the input into 
% root and final, then processes the final's specific inflection rules.
correlative_extended(Input, Results) :-
    append(RootChars, FinalChars, Input),          % Split input into potential root and remainder
    corr_root(RootChars, RootTag),                 % Validate root against defined list [cite: 7]
    analyze_final(FinalChars, FinalTags),          % Process the remainder as a final with tails
    append([[RootChars, RootTag]], FinalTags, Results). % Assemble the final tagged list

% --- Final Analysis Logic ---

% Case 1: Type A Finals (u, o, a)
% Uses check_jn/2 from tails.pl to handle optional -j and -n [cite: 13, 15]
analyze_final(Input, [[BaseChars, BaseTag]|Rest]) :-
    corr_final_a(BaseChars, BaseTag),              % Identify the base vowel (u, o, a) [cite: 8]
    append(BaseChars, JN, Input),                  % Separate the base from possible inflections
    check_jn(JN, Rest).                            % Validate -j, -n, or -jn markers 

% Case 2: Type B Finals (e)
% Uses check_n/2 from tails.pl for the optional directional accusative [cite: 8, 15]
analyze_final(Input, [[BaseChars, BaseTag]|Rest]) :-
    corr_final_b(BaseChars, BaseTag),              % Identify the 'e' ending [cite: 8]
    append(BaseChars, N, Input),                   % Separate 'e' from a possible 'n'
    check_n(N, Rest).                              % Validate optional accusative marker 

% Case 3: Type C Finals (am, al, el, es, om)
% Treated as a single invariable unit according to basic grammar [cite: 9]
analyze_final(Input, [[Input, Tag]]) :-
    corr_final_c(Input, Tag).                      % Directly match the invariable final