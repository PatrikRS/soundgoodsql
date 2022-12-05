INSERT INTO school (max_amount_of_students, street_name, street_number, zip_code, city, school_id)
VALUES (2500, 'Main road', '52', '15552', 'Kista', 'SCHOOL1');




INSERT INTO phone_number (phone_number)
VALUES 
('0505-48572643'),
('0505-52151244'),
('0505-48185658'),
('0505-96545646'),
('0505-15445421'),
('0505-54548525'),
('0505-32315158'),
('0505-45498454'),
('0505-15487454'),
('0505-54587152'),
('0505-15415488'),
('0505-65487445'),
('0505-84545488'),
('0505-54525577'),
('0505-51215484'),
('0505-54151515'),
('0505-48484545'),
('0505-88557545'),
('0505-12121255'),
('0505-46585121'),
('0505-15362466'),
('0505-46835463'),
('0505-55326236'),
('0505-38573955'),
('0505-73473445'),
('0505-20825224');



INSERT INTO lesson_price_table (skill_level, lesson_type, price, salary, discount_percentage)
VALUES
('BEGINNER', 'INDIVIDUAL', 150, 100, 10),
('INTERMEDIATE', 'INDIVIDUAL', 200, 150, 10),
('ADVANCED', 'INDIVIDUAL', 250, 200, 10),
('BEGINNER', 'GROUP', 50, 200, 15),
('INTERMEDIATE', 'GROUP', 75, 300, 15),
('ADVANCED', 'GROUP', 100, 400, 15),
('BEGINNER', 'ENSEMBLE', 50, 200, 10),
('INTERMEDIATE', 'ENSEMBLE', 75, 300, 10),
('ADVANCED', 'ENSEMBLE', 100, 400, 10);




INSERT INTO instrument_type (inst_type)
VALUES
('Guitar'),
('Bass'),
('Drums'),
('Saxophone'),
('Triangle'),
('Violin'),
('Keyboard'),
('Flute');




INSERT INTO instrument_brand (inst_brand)
VALUES
('Fender'),
('Gibson'),
('Epiphone'),
('Yamaha');



INSERT INTO ensemble_genre (genre)
VALUES
('Rock'),
('Metal'),
('Jazz'),
('Fusion'),
('Soul'),
('Rnb'),
('Rap'),
('Country'),
('Indie');



INSERT INTO teachable_instrument (instrument)
VALUES
('Guitar'),
('Bass'),
('Drums'),
('Saxophone'),
('Triangle'),
('Violin'),
('Keyboard'),
('Flute');



CREATE VIEW sch AS (
	SELECT id FROM school
	WHERE school_id = 'SCHOOL1'
);

INSERT INTO person_details (pin,first_name,last_name,email_address,street_name,street_number,apartment_number,floor_number,zip_code,city,school_id)
VALUES
  ('7454884469','Lucian','Velazquez','tristique@protonmail.net','Oregon',282,741,1,'51406','Sasolburg',(SELECT id FROM sch)),
  ('6784877544','Angela','Davenport','a.felis@yahoo.com','Michigan',271,1677,24,'15263','Nizip',(SELECT id FROM sch)),
  ('3753627663','George','Wright','facilisis.non.bibendum@protonmail.com','Delaware',309,1563,9,'7464','Lautaro',(SELECT id FROM sch)),
  ('6831426846','Jerry','Livingston','aliquet@yahoo.edu','Utah',191,1543,33,'30207','Belfast',(SELECT id FROM sch)),
  ('9314522222','Armando','Rodriguez','luctus.ut@aol.couk','Utah',41,1000,23,'5663','Yishun',(SELECT id FROM sch)),
  ('6565741574','Rhoda','Tyson','morbi.tristique.senectus@outlook.net','Oregon',32,167,4,'345871','Cusco',(SELECT id FROM sch)),
  ('5457287433','Glenna','Nelson','nascetur.ridiculus.mus@aol.edu','Indiana',420,746,3,'22584','Bến Tre',(SELECT id FROM sch)),
  ('5581321234','Nola','Schneider','maecenas.malesuada@google.org','Louisiana',353,154,49,'2149','Pizzoferrato',(SELECT id FROM sch)),
  ('4557378644','Stewart','Evans','consequat.dolor@aol.couk','Michigan',218,1186,15,'23476','Gosnells',(SELECT id FROM sch)),
  ('8558763869','Declan','Buckner','ut.semper@outlook.couk','Connecticut',377,445,32,'284493','Segovia',(SELECT id FROM sch)),
  ('5887839973','Carl','Lara','sit.amet@google.ca','Arkansas',424,320,44,'61741','Juliaca',(SELECT id FROM sch)),
  ('6627854452','Hu','Whitehead','aliquam.vulputate.ullamcorper@google.couk','California',472,889,5,'153412','Tando Allahyar',(SELECT id FROM sch)),
  ('7251756773','Jennifer','Figueroa','massa@protonmail.net','Virginia',334,1537,33,'6277','Zhytomyr',(SELECT id FROM sch)),
  ('9896238345','Shad','Calhoun','quam.vel@aol.edu','Illinois',493,658,37,'156950','Chongqing',(SELECT id FROM sch)),
  ('8765854964','Keith','Sheppard','at@hotmail.com','Alaska',398,1563,24,'9727','Zhejiang',(SELECT id FROM sch)),
  ('8575373632','Alden','Randall','tempor.augue@protonmail.net','Missouri',384,1519,45,'6934','Volda',(SELECT id FROM sch)),
  ('4557718828','Chava','Beach','iaculis.nec@yahoo.ca','Alabama',287,803,37,'5550','Oostkerke',(SELECT id FROM sch)),
  ('6999427859','Joshua','Chapman','lacinia.vitae@outlook.com','Idaho',484,856,38,'28976','Kostroma',(SELECT id FROM sch)),
  ('5676879274','Hadassah','Landry','iaculis@hotmail.ca','Nevada',48,300,26,'6481','Aurora',(SELECT id FROM sch)),
  ('4651242819','Guinevere','Hall','pretium@google.com','Colorado',82,1235,35,'28118','Buren',(SELECT id FROM sch));



  INSERT INTO person_details_phone_number (phone_number_id,person_details_id)
  VALUES
    ((SELECT id FROM phone_number WHERE phone_number='0505-52151244'),(SELECT id FROM person_details WHERE pin='7454884469')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-96545646'),(SELECT id FROM person_details WHERE pin='6784877544')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-54548525'),(SELECT id FROM person_details WHERE pin='3753627663')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-45498454'),(SELECT id FROM person_details WHERE pin='6831426846')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-54587152'),(SELECT id FROM person_details WHERE pin='9314522222')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-65487445'),(SELECT id FROM person_details WHERE pin='6565741574')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-54525577'),(SELECT id FROM person_details WHERE pin='5457287433')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-54151515'),(SELECT id FROM person_details WHERE pin='5581321234')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-88557545'),(SELECT id FROM person_details WHERE pin='4557378644')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-46585121'),(SELECT id FROM person_details WHERE pin='8558763869')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-48572643'),(SELECT id FROM person_details WHERE pin='5887839973')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-48185658'),(SELECT id FROM person_details WHERE pin='6627854452')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-15445421'),(SELECT id FROM person_details WHERE pin='7251756773')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-32315158'),(SELECT id FROM person_details WHERE pin='9896238345')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-15487454'),(SELECT id FROM person_details WHERE pin='8765854964')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-15415488'),(SELECT id FROM person_details WHERE pin='8575373632')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-84545488'),(SELECT id FROM person_details WHERE pin='4557718828')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-51215484'),(SELECT id FROM person_details WHERE pin='6999427859')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-48484545'),(SELECT id FROM person_details WHERE pin='5676879274')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-12121255'),(SELECT id FROM person_details WHERE pin='4651242819')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-20825224'),(SELECT id FROM person_details WHERE pin='4651242819'));



INSERT INTO student (student_number,main_skill_level,person_details_id,teachable_instrument_id)
  VALUES
    ('SGSTUDENT00001','BEGINNER',(SELECT id FROM person_details WHERE pin='7454884469'),(SELECT id FROM teachable_instrument WHERE instrument='Guitar')),
    ('SGSTUDENT00002','ADVANCED',(SELECT id FROM person_details WHERE pin='6784877544'),(SELECT id FROM teachable_instrument WHERE instrument='Flute')),
    ('SGSTUDENT00003','INTERMEDIATE',(SELECT id FROM person_details WHERE pin='3753627663'),(SELECT id FROM teachable_instrument WHERE instrument='Bass')),
    ('SGSTUDENT00004','BEGINNER',(SELECT id FROM person_details WHERE pin='6831426846'),(SELECT id FROM teachable_instrument WHERE instrument='Bass')),
    ('SGSTUDENT00005','INTERMEDIATE',(SELECT id FROM person_details WHERE pin='9314522222'),(SELECT id FROM teachable_instrument WHERE instrument='Violin')),
    ('SGSTUDENT00006','ADVANCED',(SELECT id FROM person_details WHERE pin='6565741574'),(SELECT id FROM teachable_instrument WHERE instrument='Flute')),
    ('SGSTUDENT00007','BEGINNER',(SELECT id FROM person_details WHERE pin='5457287433'),(SELECT id FROM teachable_instrument WHERE instrument='Guitar')),
    ('SGSTUDENT00008','INTERMEDIATE',(SELECT id FROM person_details WHERE pin='5581321234'),(SELECT id FROM teachable_instrument WHERE instrument='Guitar')),
    ('SGSTUDENT00009','INTERMEDIATE',(SELECT id FROM person_details WHERE pin='4557378644'),(SELECT id FROM teachable_instrument WHERE instrument='Triangle')),
    ('SGSTUDENT00010','BEGINNER',(SELECT id FROM person_details WHERE pin='8558763869'),(SELECT id FROM teachable_instrument WHERE instrument='Bass'));



INSERT INTO instructor (staff_id,can_teach_ensembles,person_details_id)
  VALUES
    ('SG001',TRUE,(SELECT id FROM person_details WHERE pin='5887839973')),
    ('SG002',TRUE,(SELECT id FROM person_details WHERE pin='6627854452')),
    ('SG003',FALSE,(SELECT id FROM person_details WHERE pin='7251756773')),
    ('SG004',FALSE,(SELECT id FROM person_details WHERE pin='9896238345'));



INSERT INTO instructor_teachable_instrument (teachable_instrument_id,instructor_id)
  VALUES
    ((SELECT id FROM teachable_instrument WHERE instrument='Guitar'),(SELECT id FROM instructor WHERE staff_id='SG001')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Bass'),(SELECT id FROM instructor WHERE staff_id='SG001')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Drums'),(SELECT id FROM instructor WHERE staff_id='SG001')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Triangle'),(SELECT id FROM instructor WHERE staff_id='SG001')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Drums'),(SELECT id FROM instructor WHERE staff_id='SG002')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Keyboard'),(SELECT id FROM instructor WHERE staff_id='SG002')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Flute'),(SELECT id FROM instructor WHERE staff_id='SG003')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Violin'),(SELECT id FROM instructor WHERE staff_id='SG003')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Saxophone'),(SELECT id FROM instructor WHERE staff_id='SG003')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Guitar'),(SELECT id FROM instructor WHERE staff_id='SG004')),
    ((SELECT id FROM teachable_instrument WHERE instrument='Bass'),(SELECT id FROM instructor WHERE staff_id='SG004'));



INSERT INTO sibling (student_1_id,student_2_id)
  VALUES
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT id FROM student WHERE student_number='SGSTUDENT00002')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00002'),(SELECT id FROM student WHERE student_number='SGSTUDENT00001')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT id FROM student WHERE student_number='SGSTUDENT00003')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT id FROM student WHERE student_number='SGSTUDENT00001')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00002'),(SELECT id FROM student WHERE student_number='SGSTUDENT00003')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT id FROM student WHERE student_number='SGSTUDENT00002')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT id FROM student WHERE student_number='SGSTUDENT00008')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00008'),(SELECT id FROM student WHERE student_number='SGSTUDENT00004')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT id FROM student WHERE student_number='SGSTUDENT00006')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00006'),(SELECT id FROM student WHERE student_number='SGSTUDENT00005')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00007'),(SELECT id FROM student WHERE student_number='SGSTUDENT00009')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00009'),(SELECT id FROM student WHERE student_number='SGSTUDENT00007'));



INSERT INTO contact_person (student_id,email_address,name)
  VALUES
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),'anonym@fakemail.domain','John Doe'),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),'dwadsdaw@fakemail.domain','Max Power'),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00008'),'hej@fakemail.domain','Con Tact'),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),'nobody@fakemail.domain','Chicken Salad'),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00010'),'pretender@fakemail.domain','Anders Andersson');



INSERT INTO contact_person_phone_number (phone_number_id,student_id)
  VALUES
    ((SELECT id FROM phone_number WHERE phone_number='0505-15362466'),(SELECT student_id FROM contact_person WHERE email_address='anonym@fakemail.domain')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-46835463'),(SELECT student_id FROM contact_person WHERE email_address='anonym@fakemail.domain')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-55326236'),(SELECT student_id FROM contact_person WHERE email_address='anonym@fakemail.domain')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-38573955'),(SELECT student_id FROM contact_person WHERE email_address='anonym@fakemail.domain')),
    ((SELECT id FROM phone_number WHERE phone_number='0505-73473445'),(SELECT student_id FROM contact_person WHERE email_address='anonym@fakemail.domain'));



INSERT INTO salary_payout (instructor_id,start_time,end_time)
  VALUES
    ((SELECT id FROM instructor WHERE staff_id='SG001'),'2022-01-01 00:00:00','2022-02-01 00:00:00'),
    ((SELECT id FROM instructor WHERE staff_id='SG002'),'2022-01-01 00:00:00','2022-02-01 00:00:00'),
    ((SELECT id FROM instructor WHERE staff_id='SG003'),'2022-01-01 00:00:00','2022-02-01 00:00:00'),
    ((SELECT id FROM instructor WHERE staff_id='SG004'),'2022-01-01 00:00:00','2022-02-01 00:00:00'),
    ((SELECT id FROM instructor WHERE staff_id='SG001'),'2022-02-01 00:00:00','2022-03-01 00:00:00'),
    ((SELECT id FROM instructor WHERE staff_id='SG002'),'2022-02-01 00:00:00','2022-03-01 00:00:00'),
    ((SELECT id FROM instructor WHERE staff_id='SG003'),'2022-02-01 00:00:00','2022-03-01 00:00:00'),
    ((SELECT id FROM instructor WHERE staff_id='SG004'),'2022-02-01 00:00:00','2022-03-01 00:00:00');



INSERT INTO activity_info (activity_number,start_time,end_time,lesson_price_table_id)
  VALUES
    ('ACT00000001', '2022-01-08 14:00:00','2022-01-08 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='INDIVIDUAL')),
    ('ACT00000002', '2022-01-08 15:00:00','2022-01-08 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='INDIVIDUAL')),
    ('ACT00000003', '2022-01-11 12:00:00','2022-01-11 14:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='GROUP')),
    ('ACT00000004', '2022-01-11 14:00:00','2022-01-11 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='ENSEMBLE')),
    ('ACT00000005', '2022-01-20 14:00:00','2022-01-20 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='INDIVIDUAL')),
    ('ACT00000006', '2022-01-20 14:00:00','2022-01-20 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='ADVANCED' AND lesson_type='INDIVIDUAL')),
    ('ACT00000007', '2022-01-22 14:00:00','2022-01-22 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='ADVANCED' AND lesson_type='GROUP')),
    ('ACT00000008', '2022-01-24 14:00:00','2022-01-24 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='ENSEMBLE')),
    ('ACT00000009', '2022-02-08 14:00:00','2022-02-08 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='INDIVIDUAL')),
    ('ACT00000010', '2022-02-08 15:00:00','2022-02-08 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='INDIVIDUAL')),
    ('ACT00000011', '2022-02-11 12:00:00','2022-02-11 14:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='GROUP')),
    ('ACT00000012', '2022-02-11 14:00:00','2022-02-11 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='ENSEMBLE')),
    ('ACT00000013', '2022-03-20 14:00:00','2022-03-20 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='INDIVIDUAL')),
    ('ACT00000014', '2022-03-20 14:00:00','2022-03-20 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='ADVANCED' AND lesson_type='INDIVIDUAL')),
    ('ACT00000015', '2022-03-22 14:00:00','2022-03-22 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='ADVANCED' AND lesson_type='GROUP')),
    ('ACT00000016', '2022-03-24 14:00:00','2022-03-24 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='ENSEMBLE')),
    ('ACT00000017', '2022-04-08 14:00:00','2022-04-08 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='INDIVIDUAL')),
    ('ACT00000018', '2022-04-08 15:00:00','2022-04-08 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='INDIVIDUAL')),
    ('ACT00000019', '2022-04-11 12:00:00','2022-04-11 14:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='GROUP')),
    ('ACT00000020', '2022-04-11 14:00:00','2022-04-11 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='ENSEMBLE')),
    ('ACT00000021', '2022-04-20 14:00:00','2022-04-20 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='INDIVIDUAL')),
    ('ACT00000022', '2022-04-20 14:00:00','2022-04-20 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='ADVANCED' AND lesson_type='INDIVIDUAL')),
    ('ACT00000023', '2022-04-22 14:00:00','2022-04-22 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='ADVANCED' AND lesson_type='GROUP')),
    ('ACT00000024', '2022-12-01 14:00:00','2022-12-01 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='ENSEMBLE')),
    ('ACT00000025', '2022-12-01 14:00:00','2022-12-01 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='ADVANCED' AND lesson_type='INDIVIDUAL')),
    ('ACT00000026', '2022-12-01 14:00:00','2022-12-01 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='INDIVIDUAL')),
    ('ACT00000027', '2022-12-02 14:00:00','2022-12-02 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='BEGINNER' AND lesson_type='INDIVIDUAL')),
    ('ACT00000028', '2022-12-02 14:00:00','2022-12-02 15:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='ADVANCED' AND lesson_type='INDIVIDUAL')),
    ('ACT00000029', '2022-12-14 14:00:00','2022-12-14 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='ENSEMBLE')),
    ('ACT00000030', '2022-12-15 14:00:00','2022-12-15 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='ENSEMBLE')),
    ('ACT00000031', '2022-12-16 14:00:00','2022-12-16 16:00:00',(SELECT id FROM lesson_price_table WHERE skill_level='INTERMEDIATE' AND lesson_type='ENSEMBLE'));



INSERT INTO individual_lesson (instrument_type,instructor_id,student_id,activity_info_id)
  VALUES
    ('Guitar',(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT id FROM activity_info WHERE activity_number='ACT00000001')),
    ('Triangle',(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT id FROM activity_info WHERE activity_number='ACT00000002')),
    ('Triangle',(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT id FROM activity_info WHERE activity_number='ACT00000005')),
    ('Guitar',(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT id FROM activity_info WHERE activity_number='ACT00000006')),
    ('Guitar',(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT id FROM activity_info WHERE activity_number='ACT00000009')),
    ('Triangle',(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT id FROM activity_info WHERE activity_number='ACT00000010')),
    ('Triangle',(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT id FROM activity_info WHERE activity_number='ACT00000013')),
    ('Guitar',(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT id FROM activity_info WHERE activity_number='ACT00000014')),
    ('Guitar',(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM student WHERE student_number='SGSTUDENT00002'),(SELECT id FROM activity_info WHERE activity_number='ACT00000017')),
    ('Triangle',(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT id FROM activity_info WHERE activity_number='ACT00000018')),
    ('Triangle',(SELECT id FROM instructor WHERE staff_id='SG003'),(SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT id FROM activity_info WHERE activity_number='ACT00000021')),
    ('Guitar',(SELECT id FROM instructor WHERE staff_id='SG004'),(SELECT id FROM student WHERE student_number='SGSTUDENT00006'),(SELECT id FROM activity_info WHERE activity_number='ACT00000022')),
    ('Guitar',(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM student WHERE student_number='SGSTUDENT00002'),(SELECT id FROM activity_info WHERE activity_number='ACT00000025')),
    ('Bass',(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT id FROM activity_info WHERE activity_number='ACT00000026')),
    ('Bass',(SELECT id FROM instructor WHERE staff_id='SG003'),(SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT id FROM activity_info WHERE activity_number='ACT00000027')),
    ('Guitar',(SELECT id FROM instructor WHERE staff_id='SG004'),(SELECT id FROM student WHERE student_number='SGSTUDENT00006'),(SELECT id FROM activity_info WHERE activity_number='ACT00000028'));



INSERT INTO group_lesson (instrument_type,min_student_amount,max_student_amount,instructor_id,activity_info_id)
  VALUES
    ('Guitar',4,8,(SELECT id FROM instructor WHERE staff_id='SG003'),(SELECT id FROM activity_info WHERE activity_number='ACT00000003')),
    ('Guitar',4,8,(SELECT id FROM instructor WHERE staff_id='SG004'),(SELECT id FROM activity_info WHERE activity_number='ACT00000007')),
    ('Guitar',4,8,(SELECT id FROM instructor WHERE staff_id='SG003'),(SELECT id FROM activity_info WHERE activity_number='ACT00000011')),
    ('Guitar',4,8,(SELECT id FROM instructor WHERE staff_id='SG004'),(SELECT id FROM activity_info WHERE activity_number='ACT00000015')),
    ('Guitar',4,8,(SELECT id FROM instructor WHERE staff_id='SG003'),(SELECT id FROM activity_info WHERE activity_number='ACT00000019')),
    ('Guitar',4,8,(SELECT id FROM instructor WHERE staff_id='SG004'),(SELECT id FROM activity_info WHERE activity_number='ACT00000023'));



INSERT INTO ensemble (min_student_amount,max_student_amount,instructor_id,activity_info_id,ensemble_genre_id)
  VALUES
    (3,6,(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM activity_info WHERE activity_number='ACT00000004'),(SELECT id FROM ensemble_genre WHERE genre='Rock')),
    (3,6,(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM activity_info WHERE activity_number='ACT00000008'),(SELECT id FROM ensemble_genre WHERE genre='Rock')),
    (3,6,(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM activity_info WHERE activity_number='ACT00000012'),(SELECT id FROM ensemble_genre WHERE genre='Metal')),
    (3,6,(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM activity_info WHERE activity_number='ACT00000016'),(SELECT id FROM ensemble_genre WHERE genre='Jazz')),
    (3,6,(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM activity_info WHERE activity_number='ACT00000020'),(SELECT id FROM ensemble_genre WHERE genre='Fusion')),
    (3,6,(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM activity_info WHERE activity_number='ACT00000024'),(SELECT id FROM ensemble_genre WHERE genre='Rock')),

    (4,8,(SELECT id FROM instructor WHERE staff_id='SG002'),(SELECT id FROM activity_info WHERE activity_number='ACT00000029'),(SELECT id FROM ensemble_genre WHERE genre='Metal')),
    (3,6,(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM activity_info WHERE activity_number='ACT00000030'),(SELECT id FROM ensemble_genre WHERE genre='Jazz')),
    (3,6,(SELECT id FROM instructor WHERE staff_id='SG001'),(SELECT id FROM activity_info WHERE activity_number='ACT00000031'),(SELECT id FROM ensemble_genre WHERE genre='Country'));



INSERT INTO student_group_lesson (student_id,group_lesson_id)
  VALUES
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000003')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000003')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00008'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000003')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00009'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000003')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000007')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000007')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00008'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000007')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00009'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000007')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000011')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000011')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00008'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000011')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00009'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000011')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000015')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000015')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00008'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000015')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00009'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000015')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000019')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000019')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00008'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000019')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00009'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000019')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000023')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000023')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00008'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000023')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00009'),(SELECT g.id FROM group_lesson AS g JOIN activity_info AS a ON g.activity_info_id=a.id WHERE a.activity_number='ACT00000023'));



INSERT INTO student_ensemble (student_id,ensemble_id)
  VALUES
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000004')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00002'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000004')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000004')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000008')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000008')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00006'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000008')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000012')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00002'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000012')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000012')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000016')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000016')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00006'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000016')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000020')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00002'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000020')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00003'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000020')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000024')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000024')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00006'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000024')),

    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000029')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000029')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000029')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00006'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000029')),

    ((SELECT id FROM student WHERE student_number='SGSTUDENT00002'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000030')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00008'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000030')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00009'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000030')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00010'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000030')),

    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000031')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00002'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000031')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00004'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000031')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000031')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00007'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000031')),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00009'),(SELECT e.id FROM ensemble AS e JOIN activity_info AS a ON e.activity_info_id=a.id WHERE a.activity_number='ACT00000031'));



INSERT INTO rental_instrument (price,amount_in_stock,delivery_cost,instrument_brand_id,instrument_type_id)
  VALUES
    (2000,11,50,(SELECT id FROM instrument_brand WHERE inst_brand='Gibson'),(SELECT id FROM instrument_type WHERE inst_type='Guitar')),
    (2200,8,50,(SELECT id FROM instrument_brand WHERE inst_brand='Fender'),(SELECT id FROM instrument_type WHERE inst_type='Guitar')),
    (5000,4,100,(SELECT id FROM instrument_brand WHERE inst_brand='Yamaha'),(SELECT id FROM instrument_type WHERE inst_type='Keyboard'));



INSERT INTO lease_contract (student_id,rental_instrument_id,start_time)
  VALUES
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00004'),
    (SELECT i.id FROM rental_instrument AS i JOIN instrument_brand AS b ON i.instrument_brand_id=b.id JOIN instrument_type AS t ON i.instrument_type_id=t.id WHERE b.inst_brand='Fender' AND t.inst_type='Guitar'),
    '2022-01-09 00:00:00'),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00005'),
    (SELECT i.id FROM rental_instrument AS i JOIN instrument_brand AS b ON i.instrument_brand_id=b.id JOIN instrument_type AS t ON i.instrument_type_id=t.id WHERE b.inst_brand='Fender' AND t.inst_type='Guitar'),
    '2022-01-15 00:00:00');



INSERT INTO student_payment (student_id,period_start,period_end)
  VALUES
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),'2022-01-01 00:00:00','2022-02-01 00:00:00'),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00001'),'2022-02-01 00:00:00','2022-03-01 00:00:00'),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00002'),'2022-01-01 00:00:00','2022-02-01 00:00:00'),
    ((SELECT id FROM student WHERE student_number='SGSTUDENT00002'),'2022-02-01 00:00:00','2022-03-01 00:00:00');




