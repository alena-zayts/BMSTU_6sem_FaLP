domains
	surname = string.
	name = string.
	address = string.
	phone = integer.

predicates
	nondeterm record(name, surname, address, phone).

clauses
	record("Ivanov", "Ivan", "Moscow, Ivanovskay 5", 2294055).
	record("Petrov", "Petr", "Volgograd, Leninskaya 1", 8456372).
	record("Sidorov", "Ivan", "Ekaterinburg, Lesnaya 2/4", 8994527).
	record("Svidorov", "Pavel", "Moscow, Lesnaya 8", 8994558).
	record("Ivanov", "Ivan", "Ekaterinburg, Glavnaya 4", 6994566).

goal
	% record(Surname, _, _, Phone).
	% record("Ivanov", "Ivan", "Moscow, Ivanovskay 5", Phone).
	% record("Petrov", "Petr", "Volgograd, Leninskaya 2", Phone).
	record(Surname, "Ivan", _, _). 