domains
	surname = string.
	name = string.
	address = string.
	phone = integer.

predicates
	phone_record(surname, name, address, phone).

clauses
	phone_record("Ivanov", "Ivan", "Moscow, Ivanovskay 5", 2294055).
	phone_record("Petrov", "Petr", "Volgograd, Leninskaya 1", 8456372).
	phone_record("Sidorov", "Ivan", "Ekaterinburg, Lesnaya 2/4", 8994527).
	phone_record("Svidorov", "Pavel", "Moscow, Lesnaya 8", 8994558).
	phone_record("Ivanov", "Ivan", "Ekaterinburg, Glavnaya 4", 6994566).

goal
	phone_record("Ivanov", "Ivan", "Moscow, Ivanovskay 5", "12").
	% yes

	% phone_record(Surname, _, _, Phone). 
	% Surname=Ivanov, Phone=2294055
	% Surname=Petrov, Phone=8456372
	% Surname=Sidorov, Phone=8994527
	% Surname=Svidorov, Phone=8994558
	% Surname=Ivanov, Phone=6994566
	% 5 Solutions
	
	% phone_record("Ivanov", "Ivan", "Moscow, Ivanovskay 5", Phone). 
	% Phone=2294055
	% 1 Solution
	
	% phone_record("Petrov", "Petr", "Volgograd, Leninskaya 2", Phone).
	% No Solution
	
	% phone_record(Surname, "Ivan", _, _).
	% Surname=Ivanov
	% Surname=Sidorov
	% Surname=Ivanov
	% 3 Solutions
	
	% phone_record(_, _, _, _).
	% yes