# --- Testing data

# --- !Ups


INSERT INTO `cargo_traffic`.`company` (name, date, transportation_cost_per_km) VALUES
("TradeCorp", "2015-01-01 10-00-00", '120.34'),
("TravelInc", "2010-01-01 11-00-00", '120.34'),
("SomeInc", "2005-01-01 12-00-00", '120.34'),
("Test", "2000-01-01 13-00-00", '120.34');
INSERT INTO `cargo_traffic`.`company` (`id`, `name`, `date`, `locked`, `transportation_cost_per_km`) VALUES ('5', 'Innovations Group', '2000-01-01 13:00:00', 0, '120.34'),
  ('6', 'Inweb24', '2005-01-01 12:00:00', 0, '120.34'),
  ('7', 'Vitamark', '2005-01-01 12:00:00', 0, '120.34'),
  ('8', 'AliveMax', '2005-01-01 12:00:00', 0, '120.34'),
  ('9', 'Acrux', '2005-01-01 12:00:00', 0, '120.34'),
  ('10', 'Vilavi', '2005-01-01 12:00:00', 0, '120.34'),
  ('11', 'Xango', '2005-01-01 12:00:00', 0, '120.34'),
  ('12', 'Luck Life', '2005-01-01 12:00:00', 0, '120.34'),
  ('13', 'ZeekRewards', '2005-01-01 12:00:00', 0, '120.34'),
  ('14', 'Majeko', '2005-01-01 12:00:00', 0, '120.34'),
  ('15', 'Yofoto', '2005-01-01 12:00:00', 0, '120.34'),
  ('16', 'CBS', '2005-01-01 12:00:00', 0, '120.34'),
  ('17', 'Wallet', '2005-01-01 12:00:00', 0, '120.34'),
  ('18', 'Usana', '2005-01-01 12:00:00', 0, '120.34'),
  ('19', 'IngeniumLab', '2005-01-01 12:00:00', 0, '120.34'),
  ('20', 'Your Rich Way', '2005-01-01 12:00:00', 0, '120.34'),
  ('21', 'Меркурий', '2005-01-01 12:00:00', 0, '120.34'),
  ('22', 'ПАЛЛАДА', '2005-01-01 12:00:00', 0, '120.34');


INSERT INTO `address` (country, city, street, house, flat) VALUES
  ('Belarus', 'Minsk', 'blabla', '12', '1'),
  ('Russia', 'Moscow', 'Sovetskaya', '24', null),
  ('Ukraine', 'Kiev', 'B.Xmelniskaga', '24', null),
  ('Belarus', 'Minsk', 'Lenina', '3', null),
  ('Belarus', 'Mozyr', 'Kirova', '10', null);

INSERT INTO `cargo_traffic`.`warehouse` (name,address_id) VALUES
  ('Торговая сила',2),
  ('IBM',3),
  ('Ашан',4),
  ('Склад 11',5);


INSERT INTO `cargo_traffic`.`user` (username, password, name, surname, patronymic, email, birthday, company_id, address_id) VALUES
  ('sys_admin', '$2a$10$nsE/Rt.2CteTvuLVvp64y.PC2y4/lcGGSIODMAvlCsew6stOoWMFi', 'poll', 'simson', 'васильевич', 'test@mail.ru', '1994-1-6', NULL, 1),
  ('admin1', '$2a$10$ipSFEtPaAjLraBNNezM5UuZImzmjWdQVbFkGMiTLWjoj3HceSh1cS', 'tom', 'brown', 'васильевич', 'test@mail.ru', '1994-1-6', 1, 1),
  ('admin2', '$2a$10$91Y1.6P1D.q67quSRfykuOBvS7NJSHAU.YsXXbLdKeugYcpizvyy.', 'bob', 'black', 'васильевич', 'test@mail.ru', '1994-1-6', 2, 1),
  ('admin3', '$2a$10$tNaKU9sTQJXOgqDso7hameAHdruldJEwtXJOmOo89dR7bzFLTuYQG', 'robert', 'cottrell', 'васильевич', 'test@mail.ru', '1994-1-6', 3, 1),
  ('dispatcher', '$2a$10$Mgs4qaUzqPIIm8TrkIX0ReeVP/1yENNpywjQ3UwWxWgZfmRFUO0ly', 'chris', 'richards', 'васильевич', 'test@mail.ru', '1994-1-6', 2, 1),
  ('manager', '$2a$10$NUbCCT3pBeGnr..Lla7hauWKNpaM.dIalrDUCqeWhKo2DeIZaqUVW', 'tom', 'brown', 'васильевич', 'test@mail.ru', '1994-1-6', 2, 1),
  ('driver', '$2a$10$oKnV374KGmKCBOE0CbYiHeSnV3M9HaBpEXK./rForcOh5yYA4wfR.', 'chris', 'richards', 'васильевич', 'test@mail.ru', '1994-1-6', 2, 1);
INSERT INTO `cargo_traffic`.`user` (`id`, `username`, `password`, `name`, `surname`, `patronymic`, `email`, `birthday`, `company_id`, `address_id`, `deleted`) VALUES
  ('8', 'admin6', '$2a$04$FVPXZWib4gwMLUmbiKcBA.A1RzNjHoRglRZgg/20VkevIEpI1upBu', 'Людмила', 'Сысоева', 'Антоновна', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('9', 'dispatcher6', '$2a$04$9vrGgGiIs/5CqfH8j4VBQOmOgS7aJ6T2pqOiCPNECWTTmRB0rftOO', 'Александр', 'Наумов', 'Степанович', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('10', 'manager6', '$2a$04$2svmKvr0BGmrvUd2VXpaq.o1Wyzgn34VthuHMBIy6GYaf3.u01coi', 'Сергей', 'Власов', 'Степанович', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('11', 'driver60', '$2a$04$KqVLfozgszPsw13Yvoe5NOa237nE6qdrxdRODCb/Iq/YnD0BgT1Ze', 'Мария', 'Муравьёва', 'Максимовна', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('12', 'admin7', '$2a$04$wxH1jC.Cna4yc0nF2lbaLuHFPcPfO2cx8iepr89VhDTrHQvKzDvZG', 'Мария', 'Турова', 'Антоновна', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('13', 'dispatcher7', '$2a$04$tGWZ5FLvAZpPLReVAF14VeIV1Z.RlszIoVT4m3PiZlmmWxzI8t3oe', 'Александра', 'Родионова', 'Максимовна', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('14', 'manager7', '$2a$04$57N/2mC0zVhh66LdonvEzOF/oyXuS9ZjVvh3Ghi764ZAv5M2OGTJu', 'Нина', 'Петухова', 'Антоновна', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('15', 'driver70', '$2a$04$NRPw80tDIOrknwYLx93Kv.4MWATBQxKGR3SWeDr1E.nf6idCKdy4e', 'Александра', 'Емельянова', 'Васильевна', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('16', 'director6', '$2a$04$ZBCUdzdKiYPoP2LirwZYj.WpDHLpBGzHk/DDuOZZGUp25TgTeMdWy', 'Дмитрий', 'Ефимов', 'Сергеевич', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('17', 'director7', '$2a$04$YgQNSrY/KXUiRZ/Y.CdH5uKANnbPZFj.FapdPEgC82aFP3unwLcxi', 'Дмитрий', 'Горбачёв', 'Сергеевич', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('18', 'admin8', '$2a$04$c/UOjYVeqR3xQ7cxmswju.6aelZOTFzUVTxH7vKclxD.FKGPl5jt2', 'Людмила', 'Сергеева', 'Сергеевна', 'test@mail.ru', '1994-01-06', '8', '1', 0),
  ('19', 'dispatcher8', '$2a$04$UeS9UYGn5Rgb6gmbf9fUTOB0TX51kxTEWj8xh/MkQNMCuChIE4dQK', 'Дмитрий', 'Доронин', 'Владиславович', 'test@mail.ru', '1994-01-06', '8', '1', 0),
  ('20', 'manager8', '$2a$04$N0LUiYTFMABUuWEppjjC1eKO9YaYda/Z1Uq0lgWlHdH/32L5egxSC', 'Александр', 'Фокин', 'Генадьевич', 'test@mail.ru', '1994-01-06', '8', '1', 0),
  ('21', 'driver8', '$2a$04$2Kgsp56gR1ISpPFRrgLjceHO6Cj1uskokRkcFut2ynik90lerkDTG', 'Степан', 'Нестеров', 'Александрович', 'test@mail.ru', '1994-01-06', '8', '1', 0),
  ('22', 'director8', '$2a$04$S2YyK2CzoAxQZZ4yWdZa3u1VlI3kXS5NckqNm.ga12EjFvL04UKiW', 'Александр', 'Кулагин', 'Максимович', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('23', 'driver61', '$2a$04$i/af5EnVBc6kfTvysj.FkeTYHdPJE/DZqW0eGQwdKtFOCEtYp1DPu', 'Нина', 'Макарова', 'Александровна', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('24', 'driver62', '$2a$04$hInj6VQphwLsZfVHsnSeAOcvMuxhPlrbY6QL1CB48v4tmDymvWspS', 'Мария', 'Жукова', 'Генадиевна', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('25', 'driver63', '$2a$04$zimGgozTRMzCrpTmA1p43eqBx8vuY5cscCUyNz83NWSIktCE6yY5q', 'Дмитрий', 'Лапин', 'Степанович', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('26', 'driver64', '$2a$04$dNdohrOOrc8W/vzTXpDOQubWzL7onBDKaIAJd.hUDqpFk3jeR2kay', 'Владислав', 'Дьячков', 'Максимович', 'test@mail.ru', '1994-01-06', '6', '1', 0),
  ('27', 'driver71', '$2a$04$7LN2ic0mLZkgPrxIZXOoeeEj6Qa4Dh37lT6RCAwNMiT.GW.a6QGmK', 'Марина', 'Исаева', 'Владиславовна', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('28', 'driver72', '$2a$04$UvL7iieZ7DuqvrmoR/b/qOQ6z/C0F1ytS5CQyT9gJTKLYRfhVYWFG', 'Дмитрий', 'Щукин', 'Максимович', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('29', 'driver73', '$2a$04$oXk9VdCcNh3FV3egVTYrauDyrvcJozE0Ou6oHXis8JE54MT8Lo8Oy', 'Александра', 'Полякова', 'Николаевна', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('30', 'driver74', '$2a$04$h1RwfWPpvvp2esgocGFkw.TYThXynaLR65KzrfXhEbMqvSrK7vKdq', 'Константин', 'Моисеев', 'Владиславович', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('31', 'driver75', '$2a$04$Gon1.dRGbErcFEJEza8RiusqMpNd.2AhQLuVwMSb6IJe1hSdHgyMq', 'Марина', 'Носова', 'Александровна', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('32', 'driver76', '$2a$04$dnG7jWaOLJ47rfqoinfkn.zIFsraj.u25usvX77ClTQ0aLSLNXNLW', 'Людмила', 'Зиновьева', 'Александровна', 'test@mail.ru', '1994-01-06', '7', '1', 0),
  ('33', 'driver77', '$2a$04$rY7s3S./AiaqldQor9F3beUHZH6xNhHPMyNIYi.o8DrFBUthtL4AO', 'Александр', 'Трофимов', 'Александрович', 'test@mail.ru', '1994-01-06', '7', '1', 0);
INSERT INTO `cargo_traffic`.`user` (username, password, name, surname, patronymic, email, birthday, company_id, address_id) VALUES ('director', '$2a$04$kNbVmykHyClRxbvnr.2Ap.WjrydK8GL8BMEpNk4JyQAMcqUYlRIhq', 'chris', 'richards', 'васильевич', 'test@mail.ru', '1994-1-6', 2, 1);


INSERT INTO `user_role` (user_id, role_id) VALUES
  (1, 1),
  (2, 2),
  (3, 2),
  (4, 2),
  (5, 3),
  (6, 4),
  (7, 5),
  (34, 6);

INSERT INTO `vehicle_type` (`name`) VALUES
  ('Box'),
  ('Refrigerator'),
  ('Tank');

INSERT INTO `vehicle_fuel` (`name`, `cost`) VALUES
  ("Diesel", "2.03"),
  ("Bio-diesel", "2.34"),
  ("Petrol-95", "2.45"),
  ("Petrol-98", "2.23");

INSERT INTO `vehicle` (`vehicle_producer`, `vehicle_model`, `license_plate`, `products_constraint`, `fuel_consumption`, `company_id`, `vehicle_type_id`, `vehicle_fuel_id`, `deleted`) VALUES
  ('Man', 'A123', '1234-AB', 1234.3, 15.3, 1, 2, 3, 0),
  ('Man', 'B234', '6543-QW', 2345.6, 20.5, 1, 2, 1, 0),
  ('Man', 'C345', '4567-RT', 3456.75, 17.8, 2, 3, 4, 0);

INSERT INTO `cargo_traffic`.`vehicle` (`id`, `vehicle_producer`, `vehicle_model`, `license_plate`, `products_constraint`, `fuel_consumption`, `company_id`, `vehicle_type_id`, `vehicle_fuel_id`, `deleted`) VALUES
  ('4', 'Woman', 'B234', '4536-DF', '3456.75', '20.50', '6', '3', '2', 0),
  ('5', 'Woman', 'C345', '6466-DS', '3456.75', '15.30', '7', '3', '1', 0),
  ('6', 'Woman', 'B234', '6478-AS', '3456.75', '20.50', '7', '1', '1', 0),
  ('7', 'Woman', 'A123', '7896-FF', '3456.75', '20.50', '7', '1', '1', 0),
  ('8', 'Woman', 'A123', '3655-FG', '3456.75', '15.30', '7', '1', '1', 0),
  ('9', 'Woman', 'C345', '9854-GG', '3456.75', '20.50', '6', '1', '1', 0),
  ('10', 'Woman', 'B234', '8789-NY', '2345.60', '15.30', '6', '2', '2', 0),
  ('11', 'Woman', 'C345', '8787-MI', '2345.60', '20.50', '6', '2', '3', 0),
  ('12', 'Woman', 'B234', '1423-HG', '2345.60', '20.50', '6', '2', '3', 0);


INSERT INTO `cargo_traffic`.`address` (`id`, `country`, `city`, `street`, `house`, `deleted`) VALUES
  ('6', 'Ukraine', 'Kiev', 'Kirova', '5', 0),
  ('7', 'Belarus', 'Brest', 'Sovetskaya', '1', 0),
  ('8', 'Belarus', 'Brest', 'Sovetskaya', '12', 0);

INSERT INTO `cargo_traffic`.`warehouse` (`id`, `name`, `address_id`, `deleted`) VALUES
  ('5', 'Kodeko', '6', 0),
  ('6', 'В потоке', '7', 0),
  ('7', 'Жар-птица', '8', 0);

INSERT INTO `cargo_traffic`.`user_role` (`user_id`, `role_id`) VALUES ('8', '2'),
  ('9', '3'),
  ('10', '4'),
  ('11', '5'),
  ('12', '2'),
  ('13', '3'),
  ('14', '4'),
  ('15', '5'),
  ('16', '6'),
  ('17', '6'),
  ('18', '2'),
  ('19', '3'),
  ('20', '4'),
  ('21', '5'),
  ('22', '6'),
  ('23', '5'),
  ('24', '5'),
  ('25', '5'),
  ('26', '5'),
  ('27', '5'),
  ('28', '5'),
  ('29', '5'),
  ('30', '5'),
  ('31', '5'),
  ('32', '5'),
  ('33', '5');


# --- !Downs
