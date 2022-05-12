domains
    list = integer*.

predicates
    each3(list, list).

clauses
	each3([_|[_|[H|T]]], [H|NextRes]) :- each3(T, NextRes), !.
	each3(_, []).

goal
    each3([1, 2, 3, 4, 5, 6, 7, 8], Answer_).
