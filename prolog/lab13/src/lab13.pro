domains
  surname, phone, city, street, house, apartment = string
  address = address(city, street, house, apartment)
  model, color, cost = string
  bank, sum = string

predicates
  man(surname, phone, address)
  car(surname, model, color, cost)
  deposit(surname, bank, sum)

  car_by_phone(phone, surname, model, cost)
  car_model_by_phone(phone, model)
  bank_and_street_by_surname_and_city(surname, city, bank, street)

clauses
  man("Alexey", "89096412389", address("Krasnogorsk", "Lesnaya", "17", "5")).
  man("Vladimir", "890955550987", address("Moscow", "Sovetskaya", "134", "15")).
  man("Mikhail", "8100500321", address("Khimki", "Lesnaya", "27", "501")).
  man("Pavel", "87654329867", address("Moscow", "Tikhaya", "105", "52")).
  man("Alexey", "89096421389", address("Moscow", "Baumanskaya", "170", "1")).

  car("Alexey", "AMG", "Black", "100000").
  car("Vladimir", "Volvo", "Red", "50000").
  car("Pavel", "Nissan", "White", "709000").
  car("Mikhail", "Cadillac", "Black", "1000000").

  deposit("Alexey", "Tinkoff", "10000000000").
  deposit("Alexey", "Sber", "1000").
  deposit("Pavel", "Sber", "0").
  deposit("Mikhail", "Alpha", "10").

  car_by_phone(Phone, Surname, Model, Cost)
   :- man(Surname, Phone, _), car(Surname, Model, _, Cost).

  car_model_by_phone(Phone, Model) :- car_by_phone(Phone, _, Model, _).

  bank_and_street_by_surname_and_city(Surname, City, Bank, Street)
   :- man(Surname, _, address(City, Street, _, _)), deposit(Surname, Bank, _).

goal
  %car_by_phone("89096412389", Surname, Model, Cost).
  %car_model_by_phone("89096412389", Model).
  bank_and_street_by_surname_and_city("Alexey", "Moscow", Bank, Street).
