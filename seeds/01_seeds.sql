INSERT INTO users (name, email, password)
VALUES ('Mike', 'mike@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('David', 'divid@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Phile', 'phile@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code)
VALUES (1, 'Mr.', 'description', 'www.aaa.com', 'www.bbb.com', 500, 2, 5, 5, 'Canada', '32 Ave', 'Edmonton', 'AB', 'X0X 0X0'),
(2, 'Mrs.', 'description', 'www.aaa.com', 'www.bbb.com', 200, 2, 3,3, 'Canada', '32 Ave', 'Edmonton', 'AB', 'X0X 0X0'),
(3, 'Mr.', 'description', 'www.aaa.com', 'www.bbb.com', 100, 1, 2,2, 'Canada', '32 Ave', 'Edmonton', 'AB', 'X0X 0X0');

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26', 1, 1),
('2019-01-04', '2019-02-01', 2, 2),
('2021-10-01', '2021-10-14', 3, 3);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (1, 1, 1, 8, 'messages'),
(2, 2, 2, 7, 'messages'),
(3, 3, 3, 6, 'messages');