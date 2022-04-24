domains
		list = integer*.

predicates
		length(list, integer).
		lengthInner(list, integer, integer).

		sum(list, integer).
		sumInner(list, integer, integer).

		oddSum(list, integer).
		oddSumInner(list, integer, integer).

clauses
		lengthInner([], FinalAnswer, CurAnswer) :- 
						FinalAnswer = CurAnswer, 
						!.
										
		lengthInner([_|Tail], FinalAnswer, CurAnswer) :-
						NextAnswer = CurAnswer + 1,
						lengthInner(Tail, FinalAnswer, NextAnswer).   
										
		length(List, Length) :- 
						lengthInner(List, Length, 0).


		sumInner([], FinalSum, CurSum) :- 
						FinalSum = CurSum, 
						!.
										
		sumInner([Head|Tail], FinalSum, CurSum) :-
						NextSum = CurSum + Head,
						sumInner(Tail, FinalSum, NextSum).
										
		sum(List, Sum) :- 
						sumInner(List, Sum, 0).


		%  if list has even lenght
		oddSumInner([], FinalSum, CurSum) :- 
						FinalSum = CurSum, 
						!.
		%  if list has odd lenght								
		oddSumInner([_|[]], FinalSum, CurSum) :- 
						FinalSum = CurSum,
						!.
										
		oddSumInner([_|[NextHead|NextTail]], FinalSum, CurSum) :- 
						NextSum = CurSum + NextHead,
						oddSumInner(NextTail, FinalSum, NextSum), 
						!.
										
		oddSum(List, Sum) :- 
						oddSumInner(List, Sum, 0).

goal
		% length([], Length_).
		% Length_=0
		% 1 Solution
		% length([1, 2, 3], Length_).
		% Length_=3
		% 1 Solution
		
		% sum([], Sum_).
		% Sum_=0
		% 1 Solution
		% sum([-1, 1, 2], Sum_).
		% Sum_=2
		% 1 Solution
		
		% oddSum([], Sum_).
		% Sum_=0
		% 1 Solution
		
		% oddSum([0], Sum_).
		% Sum_=0
		% 1 Solution
		
		% oddSum([0, 1], Sum_).
		% Sum_=1
		% 1 Solution
		
		oddSum([0, 1, 2], Sum_).
		% Sum_=1
		% 1 Solution
		
		% oddSum([0, 1, 2, 3], Sum_).
		% Sum_=4
		% 1 Solution
		
		% oddSum([0, 1, 2, 3, 4], Sum_).
		% Sum_=4
		% 1 Solution


