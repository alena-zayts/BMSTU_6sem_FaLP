predicates
    factorial(integer, integer).
    factorialInner(integer, integer, integer).

    fibbonachi(integer, integer).
    fibbonachiInner(integer, integer, integer, integer).

clauses
    factorialInner(Number, CurAnswer, FinalAnswer) :- Number < 2, FinalAnswer = CurAnswer, !.
    factorialInner(Number, CurAnswer, FinalAnswer) :-
    				NextAnswer = CurAnswer * Number,
                        	NextNumber = Number - 1,
                        	factorialInner(NextNumber, NextAnswer, FinalAnswer).
    factorial(Number, Answer) :- factorialInner(Number, 1, Answer).

    fibbonachiInner(Number, FinalAnswer, _, PrevAnswer) :- Number < 3, FinalAnswer = PrevAnswer, !.
    fibbonachiInner(Number, FinalAnswer, PrevPrevAnswer, PrevAnswer) :-
                        NextNumber = Number - 1,
                        NextPrev = PrevPrevAnswer + PrevAnswer,
                        fibbonachiInner(NextNumber, FinalAnswer, PrevAnswer, NextPrev).


    fibbonachi(Number, Answer) :- fibbonachiInner(Number, Answer, 1, 1).

goal
    % factorial(1, Answer_).
    % Answer_=1
    % 1 Solution
    
    % factorial(2, Answer_).
    % Answer_=2
    % 1 Solution
    
    % factorial(3, Answer_).
    % Answer_=6
    % 1 Solution


    % fibbonachi(1, Answer_).
    % Answer_=1
    % 1 Solution
    
    % fibbonachi(4, Answer_).
    % Answer_=3
    % 1 Solution
    
    fibbonachi(5, Answer_).
    
