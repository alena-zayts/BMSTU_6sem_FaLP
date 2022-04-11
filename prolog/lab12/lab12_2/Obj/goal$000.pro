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
	
	f(model, color, surname, city, phone, bank).

clauses
	phone_record("Rich", 7777772, address("London", "Green", 1, 10)).
	phone_record("Rich", 1111111, address("Moscow", "Zelenaya", 2, 20)).
	phone_record("Middle", 9999999, address("Moscow", "Ivanovskaya", 3, 2)).
	
	car("Nobody", "Model_0", "Red", 1000000, 2022).
	car("Rich", "Model_1", "Red", 1000000, 2022).
	car("Rich", "Model_2", "Green", 5000000, 1900).
	car("Middle", "Model_2", "Green", 5000000, 1900).
	
	depositor("Rich", "Gosbank", 10, 10000000).
	depositor("Middle", "Mosbank", 17, 20000).
	
	f(Model_, Color_, Surname, City, Phone, Bank) :- 
	car(Surname, Model_, Color_, _, _), 
	phone_record(Surname, Phone, address(City, _, _, _)),
	depositor(Surname, Bank, _, _).
goal
	% f("Model_0", "Red", Surname, City, Phone, Bank).
	% No Solution
	
	% f("Model_1", "Red", Surname, City, Phone, Bank).
	% Surname=Rich, City=London, Phone=7777772, Bank=Gosbank
	% Surname=Rich, City=Moscow, Phone=1111111, Bank=Gosbank
	% 2 Solutions
	
	f("Model_2", "Green", Surname, City, Phone, Bank).
	
	
	