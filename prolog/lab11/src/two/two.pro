domains
	surname = string.
	name = string.
	university = string.
	phone = integer.

predicates
	student(surname, name, university, phone).

clauses
	student("Ivanov", "Ivan", "BMSTU", 2294055).
	student("Petrov", "Petr", "BMSTU", 8456372).
	student("Sidorov", "Nikolay", "MIPT", 8994527).
	student("Svidorov", "Ansrey", "MSU", 8994558).
	student("Ivanov", "Pavel", "BMSTU", 6994566).

goal
	% student("Ivanov", "Ivan", "BMSTU", _).
	% yes
	
	% student("Ivanov", _, "BMSTU", _).
	% yes

	% student("Ivanov", "Ivan", "BMSTU", Phone).
	% Phone=2294055
	% 1 Solution
	
	% student(Surname, Name, "BMSTU", Phone). 
	% Surname=Ivanov, Name=Ivan, Phone=2294055
	% Surname=Petrov, Name=Petr, Phone=8456372
	% Surname=Ivanov, Name=Pavel, Phone=6994566
	% 3 Solutions 
	
	