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
	sum = integer.
	account = integer.
	size = integer.
	
	ownnership = building(price, address);
	area(price, size);
    	water_transport(price, color);
    	car(price, model, color).
    	

predicates
	phone_record(surname, phone, address).
	depositor(surname, bank, account, sum).
	own(surname, ownnership).
	
	ownershipsName(surname, symbol).
	ownershipsNamePrice(surname, symbol, price).
	sumCostInner(surname, symbol, price).
	sumCost(surname, price).


clauses
	phone_record("Rich", 7777772, address("London", "Green", 1, 10)).
	phone_record("Rich", 7777771, address("London", "Green", 1, 10)).
	phone_record("Rich", 1111111, address("Moscow", "Zelenaya", 2, 20)).
	phone_record("Middle", 9999999, address("Moscow", "Ivanovskaya", 3, 2)).
	phone_record("Poor", 3333331, address("Karaganda", "Pit", 23, 5)).
	phone_record("Poor", 3333332, address("Perm", "Pit", 36, 7)).
	phone_record("Poor", 3333333, address("Kop", "Leet", 2, 53)).
	
	
	depositor("Rich", "Gosbank", 10, 10000000).
	depositor("Rich", "Mosbank", 15, 9000000).
	depositor("Middle", "Mosbank", 17, 20000).
	depositor("Middle", "Newbank", 345, 0).
	
	
	own("Rich", building(100, address("Kop", "Leet", 2, 53))).
	own("Rich", area(10, 500)).
	own("Rich", water_transport(1, "Green")).
	own("Rich", car(5, "Model1", "Red")).
	
	
	own("Middle", car(3, "Model2", "Red")).
	own("Middle", building(90, address("Moscow", "Leninskaya", 2, 53))).
	
	
    	% 1
    	ownershipsName(Surname, building) :- own(Surname, building(_, _)).
    	ownershipsName(Surname, area) :- own(Surname, area(_, _)).
    	ownershipsName(Surname, water_transport) :- own(Surname, water_transport(_, _)).
    	ownershipsName(Surname, car) :- own(Surname, car(_, _, _)).

    	% 2
    	ownershipsNamePrice(Surname, building, Price) :- own(Surname, building(Price, _)).
    	ownershipsNamePrice(Surname, area, Price) :- own(Surname, area(Price, _)).
    	ownershipsNamePrice(Surname, water_transport, Price) :- own(Surname, water_transport(Price, _)).
    	ownershipsNamePrice(Surname, car, Price) :- own(Surname, car(Price, _, _)).
    
    	% 3
    	sumCostInner(Surname, building, Price) :- own(Surname, building(Price, _)), !.
    	sumCostInner(Surname, area, Price) :- own(Surname, area(Price, _)), !.
    	sumCostInner(Surname, water_transport, Price) :- own(Surname, water_transport(Price, _)), !.
    	sumCostInner(Surname, car, Price) :- own(Surname, car(Price, _, _)), !.
    	sumCostInner(_, _, 0).
    
    	sumCost(Surname, Price) :-
                        sumCostInner(Surname, building, Price1),
                        sumCostInner(Surname, area, Price2),
                        sumCostInner(Surname, water_transport, Price3),
                        sumCostInner(Surname, car, Price4),
                        Price = Price1 + Price2 + Price3 + Price4.

goal
	% 1
    	% ownershipsName("Rich", Ownnership).
    	% Ownnership=building
    	% Ownnership=area
    	% Ownnership=water_transport
    	% Ownnership=car
    	% 4 Solutions
    	
    	% ownershipsName(Surname, car).
    	% Surname=Rich
    	% Surname=Middle
    	% 2 Solutions
    	
    	% 2
    	% ownershipsNamePrice(Surname, building, Price).
    	% Surname=Rich, Price=100
    	% Surname=Middle, Price=90
    	% 2 Solutions
    	
    	% ownershipsNamePrice("Middle", Ownnership, Price).
    	% Ownnership=building, Price=90
	% Ownnership=car, Price=3
	% 2 Solutions
    
    
    	% 3
	% sumCost("Middle", Price).
	% Price=93
	% 1 Solution
	
	% sumCost("Rich", Price).
	% Price=116
	% 1 Solution

	sumCost("Poor", Price).
	% Price=0
	% 1 Solution