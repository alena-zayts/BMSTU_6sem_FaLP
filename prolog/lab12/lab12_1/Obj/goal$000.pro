domains
	city = string.
	street = string.
	house = integer.
	flat = integer.
	address = address(city, street, house, flat).
	
	surname = string.
	phone = integer.
	
	model = string.
	color = string.
	price = integer.
	year = integer.
	
	bank = string.
	account = integer.
	sum = integer.

predicates
	phone_record(surname, phone, address).
	car(surname, model, color, price, year).
	depositor(surname, bank, account, sum).
	
	f_1a(phone, surname, model, price).
	f_1b(phone, model).
	f_2(surname, city, street, bank, phone).

clauses
	phone_record("Rich", 7777772, address("London", "Green", 1, 10)).
	phone_record("Rich", 7777771, address("London", "Green", 1, 10)).
	phone_record("Rich", 1111111, address("Moscow", "Zelenaya", 2, 20)).
	phone_record("Middle", 9999999, address("Moscow", "Ivanovskaya", 3, 2)).
	phone_record("Poor", 3333331, address("Karaganda", "Pit", 23, 5)).
	phone_record("Poor", 3333332, address("Perm", "Pit", 36, 7)).
	phone_record("Poor", 3333333, address("Kop", "Leet", 2, 53)).
	
	car("Rich", "Coolmodel", "Red", 1000000, 2022).
	car("Rich", "Coolestmodel", "Green", 5000000, 1900).
	car("Rich", "Coolestmodel", "Blue", 5000000, 1900).
	car("Middle", "Coolmodel", "Red", 1000000, 2022).
	
	
	depositor("Rich", "Gosbank", 10, 10000000).
	depositor("Rich", "Mosbank", 15, 9000000).
	depositor("Middle", "Mosbank", 17, 20000).
	depositor("Middle", "Newbank", 345, 0).
	
	f_1a(Phone, Surname, Model, Price) :- phone_record(Surname, Phone, _), car(Surname, Model, _, Price, _).
	f_1b(Phone, Model) :- f_1a(Phone, _, Model, _).
	f_2(Surname, City, Street, Bank, Phone) :- 
	phone_record(Surname, Phone, address(City, Street, _, _)), 
	depositor(Surname, Bank, _, _).
	
goal
	% f_1a(7777771, Surname, Model, Price).
	% Surname=Rich, Model=Coolmodel, Price=1000000
	% Surname=Rich, Model=Coolestmodel, Price=5000000
	% Surname=Rich, Model=Coolestmodel, Price=5000000
	% 3 Solutions
	
	% f_1b(9999999, Model).
	% Model=Coolmodel
	% 1 Solution
	
	% f_2("Rich", "London", Street, Bank, Phone).
	% Street=Green, Bank=Gosbank, Phone=7777771
	% Street=Green, Bank=Mosbank, Phone=7777771
	% Street=Green, Bank=Gosbank, Phone=7777772
	% Street=Green, Bank=Mosbank, Phone=7777772
	% 4 Solutions
	
	f_2("Rich", "Moscow", Street, Bank, Phone).
	% Street=Zelenaya, Bank=Gosbank, Phone=1111111
	% Street=Zelenaya, Bank=Mosbank, Phone=1111111
	% 2 Solutions
	
	
