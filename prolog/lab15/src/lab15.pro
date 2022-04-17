domains
  num = integer

predicates
  max2(num, num, num)
  max2Cut(num, num, num)
  max3(num, num, num, num)
  max3Cut(num, num, num, num)

clauses
  max2(N1, N2, N2) :- N2 >= N1.
  max2(N1, N2, N1) :- N1 >= N2.
  
  max2Cut(N1, N2, N2) :- N2 >= N1, !.
  max2Cut(N1, _, N1).

  max3(N1, N2, N3, N3) :- N3 >= N1, N3 >= N2.
  max3(N1, N2, N3, N2) :- N2 >= N1, N2 >= N3.
  max3(N1, N2, N3, N1) :- N1 >= N2, N1 >= N3.

  max3Cut(N1, N2, N3, N3) :- N3 >= N2, N3 >= N1, !.
  max3Cut(N1, N2, _, N2) :- N2 >= N1, !.
  max3Cut(N1, _, _, N1).

goal	
% max2
	% max2(1, 2, Max).
	% Max=2
	% 1 Solution
	
	% max2(2, 1, Max).
	% Max=2
	% 1 Solution

%max2Cut
	% max2Cut(1, 2, Max).
	% Max=2
	% 1 Solution
	
	% max2Cut(2, 1, Max).
	% Max=2
	% 1 Solution
	
% max3	
	% max3(1, 2, 3, Max).
	% Max=3
	% 1 Solution
	
	% max3(1, 3, 2, Max).
	% Max=3
	% 1 Solution
	
	% max3(3, 1, 2, Max).
	% Max=3
	% 1 Solution
	
% max3Cut	
	% max3Cut(1, 2, 3, Max).
	% Max=3
	% 1 Solution
	
	% max3Cut(1, 3, 2, Max).
	% Max=3
	% 1 Solution
	
	max3Cut(3, 1, 2, Max).
	% Max=3
	% 1 Solution