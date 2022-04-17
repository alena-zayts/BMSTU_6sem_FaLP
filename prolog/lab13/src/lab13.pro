domains
	city, street = symbol.
	house, flat = integer.
	address_struct = address(city, street, house, flat).
	surname = symbol.
	phone = integer.
	model, color = symbol.
	price, year = integer.
	bank = symbol.
	sum, account = integer.
	size = integer.
	
	ownnership = building(price, address_struct);
		     area(price, size);
    		     water_transport(price, color);
    		     car(price, model, color).
    	

predicates
	phone_record(surname, phone, address_struct).
	depositor(surname, bank, account, sum).
	
	own(surname, ownnership).
	
	ownershipsNamePrice(surname, symbol, price).
	sumCostInner(surname, symbol, price).
	sumCost(surname, price).


clauses
	phone_record(rich, 7777772, address(london, green, 1, 10)).
	phone_record(rich, 7777771, address(london, green, 1, 10)).
	phone_record(rich, 1111111, address(moscow, zelenaya, 2, 20)).
	phone_record(middle, 9999999, address(moscow, ivanovskaya, 3, 2)).
	phone_record(poor, 3333331, address(karaganda, pit, 23, 5)).
	phone_record(poor, 3333332, address(perm, pit, 36, 7)).
	phone_record(poor, 3333333, address(kop, leet, 2, 53)).
	
	
	depositor(rich, gosbank, 10, 10000000).
	depositor(rich, mosbank, 15, 9000000).
	depositor(middle, mosbank, 17, 20000).
	depositor(middle, newbank, 345, 0).
	
	
	own(rich, building(100, address(kop, leet, 2, 53))).
	own(rich, area(10, 500)).
	own(rich, water_transport(1, green)).
	own(rich, car(5, model1, red)).
	
	own(middle, car(3, model2, red)).
	own(middle, building(90, address(moscow, leninskaya, 2, 53))).
	

    	% 1, 2
    	ownershipsNamePrice(Surname_, building, Price_) :- own(Surname_, building(Price_, _)).
    	ownershipsNamePrice(Surname_, area, Price_) :- own(Surname_, area(Price_, _)).
    	ownershipsNamePrice(Surname_, water_transport, Price_) :- own(Surname_, water_transport(Price_, _)).
    	ownershipsNamePrice(Surname_, car, Price_) :- own(Surname_, car(Price_, _, _)).
    
    	% 3
    	sumCostInner(Surname_, building, Price_) :- own(Surname_, building(Price_, _)), !.
    	sumCostInner(Surname_, area, Price_) :- own(Surname_, area(Price_, _)), !.
    	sumCostInner(Surname_, water_transport, Price_) :- own(Surname_, water_transport(Price_, _)), !.
    	sumCostInner(Surname_, car, Price_) :- own(Surname_, car(Price_, _, _)), !.
    	sumCostInner(_, _, 0).  % if Surname_ has no some kind of ownership
    
    	sumCost(Surname_, Price_) :-
                        sumCostInner(Surname_, building, Price1_),
                        sumCostInner(Surname_, area, Price2_),
                        sumCostInner(Surname_, water_transport, Price3_),
                        sumCostInner(Surname_, car, Price4_),
                        Price_ = Price1_ + Price2_ + Price3_ + Price4_.

goal
	% 1
    	% ownershipsNamePrice(rich, Ownnership, _).
    	% Ownnership=building
    	% Ownnership=area
    	% Ownnership=water_transport
    	% Ownnership=car
    	% 4 Solutions
    	
    	% ownershipsNamePrice(Surname, car, _).
    	% Surname=rich
    	% Surname=middle
    	% 2 Solutions
    	
    	
    	% 2
    	% ownershipsNamePrice(middle, Ownnership, Price).
    	% Ownnership=building, Price=90
    	% Ownnership=car, Price=3
    	% 2 Solutions

    	% ownershipsNamePrice(Surname, building, Price).
    	% Surname=rich, Price=100
    	% Surname=middle, Price=90
    	% 2 Solutions
    	
    	
    	% 3
	sumCost(middle, Price). % =sumCost("middle", Price).
	% Price=93
	% 1 Solution
	
	% sumCost(rich, Price).
	% Price=116
	% 1 Solution

	% sumCost(poor, Price).
	% Price=0
	% 1 Solution