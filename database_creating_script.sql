CREATE TYPE skill_level AS ENUM ('BEGINNER', 'INTERMEDIATE', 'ADVANCED');
CREATE TYPE lesson_type AS ENUM ('INDIVIDUAL', 'GROUP', 'ENSEMBLE');

CREATE TABLE instrument_type (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 inst_type VARCHAR(500) NOT NULL
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (id);

CREATE TABLE instrument_brand (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 inst_brand VARCHAR(500) NOT NULL
);

ALTER TABLE instrument_brand ADD CONSTRAINT PK_instrument_brand PRIMARY KEY (id);

CREATE TABLE ensemble_genre (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre VARCHAR(500) NOT NULL
);

ALTER TABLE ensemble_genre ADD CONSTRAINT PK_ensemble_genre PRIMARY KEY (id);

CREATE TABLE lesson_price_table (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level skill_level NOT NULL,
 lesson_type lesson_type NOT NULL,
 price FLOAT(10) NOT NULL,
 salary FLOAT(10) NOT NULL,
 discount_percentage FLOAT(10) NOT NULL
);

ALTER TABLE lesson_price_table ADD CONSTRAINT PK_lesson_price_table PRIMARY KEY (id);


CREATE TABLE phone_number (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_number VARCHAR(500)
);

ALTER TABLE phone_number ADD CONSTRAINT PK_phone_number PRIMARY KEY (id);


CREATE TABLE rental_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price FLOAT(10) NOT NULL,
 amount_in_stock INT NOT NULL,
 delivery_cost FLOAT(10) NOT NULL,
 instrument_brand_id INT NOT NULL REFERENCES "instrument_brand",
 instrument_type_id INT NOT NULL REFERENCES "instrument_type"
);

ALTER TABLE rental_instrument ADD CONSTRAINT PK_rental_instrument PRIMARY KEY (id);


CREATE TABLE school (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 max_amount_of_students INT NOT NULL,
 street_name VARCHAR(500) NOT NULL,
 street_number VARCHAR(500) NOT NULL,
 apartment_number VARCHAR(500),
 floor_number VARCHAR(500),
 zip_code VARCHAR(500) NOT NULL,
 city VARCHAR(500) NOT NULL,
 school_id VARCHAR(500) NOT NULL
);

ALTER TABLE school ADD CONSTRAINT PK_school PRIMARY KEY (id);


CREATE TABLE teachable_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument VARCHAR(500)
);

ALTER TABLE teachable_instrument ADD CONSTRAINT PK_teachable_instrument PRIMARY KEY (id);


CREATE TABLE activity_info (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 activity_number VARCHAR(500) NOT NULL UNIQUE,
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL,
 lesson_price_table_id INT NOT NULL REFERENCES "lesson_price_table"
);

ALTER TABLE activity_info ADD CONSTRAINT PK_activity_info PRIMARY KEY (id);


CREATE TABLE person_details (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 pin VARCHAR(500) NOT NULL UNIQUE,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 email_address VARCHAR(500) UNIQUE,
 street_name VARCHAR(500) NOT NULL,
 street_number VARCHAR(500) NOT NULL,
 apartment_number VARCHAR(500),
 floor_number VARCHAR(500),
 zip_code VARCHAR(500) NOT NULL,
 city VARCHAR(500) NOT NULL,
 school_id INT NOT NULL REFERENCES "school"
);

ALTER TABLE person_details ADD CONSTRAINT PK_person_details PRIMARY KEY (id);


CREATE TABLE person_details_phone_number (
 phone_number_id INT NOT NULL REFERENCES "phone_number",
 person_details_id INT NOT NULL REFERENCES "person_details"
);

ALTER TABLE person_details_phone_number ADD CONSTRAINT PK_person_details_phone_number PRIMARY KEY (phone_number_id,person_details_id);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_number VARCHAR(500) NOT NULL UNIQUE,
 main_skill_level skill_level NOT NULL,
 person_details_id INT NOT NULL REFERENCES "person_details",
 teachable_instrument_id INT NOT NULL REFERENCES "teachable_instrument"
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_payment (
 student_id INT NOT NULL REFERENCES "student",
 period_start TIMESTAMP NOT NULL,
 period_end TIMESTAMP NOT NULL
);

ALTER TABLE student_payment ADD CONSTRAINT PK_student_payment PRIMARY KEY (student_id,period_start);


CREATE TABLE contact_person (
 student_id INT NOT NULL REFERENCES "student",
 email_address VARCHAR(500) NOT NULL UNIQUE,
 name VARCHAR(500) NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (student_id);


CREATE TABLE contact_person_phone_number (
 phone_number_id INT NOT NULL REFERENCES "phone_number",
 student_id INT NOT NULL REFERENCES "student"
);

ALTER TABLE contact_person_phone_number ADD CONSTRAINT PK_contact_person_phone_number PRIMARY KEY (phone_number_id,student_id);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 staff_id VARCHAR(500) NOT NULL UNIQUE,
 can_teach_ensembles BOOL NOT NULL,
 person_details_id INT NOT NULL REFERENCES "person_details"
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_teachable_instrument (
 instructor_id INT NOT NULL REFERENCES "instructor",
 teachable_instrument_id INT NOT NULL REFERENCES "teachable_instrument"
);

ALTER TABLE instructor_teachable_instrument ADD CONSTRAINT PK_instructor_teachable_instrument PRIMARY KEY (instructor_id,teachable_instrument_id);


CREATE TABLE lease_contract (
 student_id INT NOT NULL REFERENCES "student",
 rental_instrument_id INT NOT NULL REFERENCES "rental_instrument",
 start_time TIMESTAMP NOT NULL
);

ALTER TABLE lease_contract ADD CONSTRAINT PK_lease_contract PRIMARY KEY (student_id,rental_instrument_id);


CREATE TABLE salary_payout (
 instructor_id INT NOT NULL REFERENCES "instructor",
 start_time TIMESTAMP NOT NULL,
 end_time TIMESTAMP NOT NULL
);

ALTER TABLE salary_payout ADD CONSTRAINT PK_salary_payout PRIMARY KEY (instructor_id,start_time);


CREATE TABLE sibling (
 student_1_id INT NOT NULL REFERENCES "student",
 student_2_id INT NOT NULL REFERENCES "student"
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_1_id,student_2_id);


CREATE TABLE ensemble (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 min_student_amount INT NOT NULL,
 max_student_amount INT NOT NULL,
 instructor_id INT NOT NULL REFERENCES "instructor",
 activity_info_id INT NOT NULL REFERENCES "activity_info",
 ensemble_genre_id INT NOT NULL REFERENCES "ensemble_genre"
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


CREATE TABLE ensemble_teachable_instrument (
 teachable_instrument_id INT NOT NULL REFERENCES "teachable_instrument",
 ensemble_id INT NOT NULL REFERENCES "ensemble"
);

ALTER TABLE ensemble_teachable_instrument ADD CONSTRAINT PK_ensemble_teachable_instrument PRIMARY KEY (teachable_instrument_id,ensemble_id);


CREATE TABLE group_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(500) NOT NULL,
 min_student_amount INT NOT NULL,
 max_student_amount INT NOT NULL,
 instructor_id INT NOT NULL REFERENCES "instructor",
 activity_info_id INT NOT NULL REFERENCES "activity_info"
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id);


CREATE TABLE individual_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(500) NOT NULL,
 instructor_id INT NOT NULL REFERENCES "instructor",
 student_id INT NOT NULL REFERENCES "student",
 activity_info_id INT NOT NULL REFERENCES "activity_info"
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (id);


CREATE TABLE student_ensemble (
 student_id INT NOT NULL REFERENCES "student",
 ensemble_id INT NOT NULL REFERENCES "ensemble"
);

ALTER TABLE student_ensemble ADD CONSTRAINT PK_student_ensemble PRIMARY KEY (student_id,ensemble_id);


CREATE TABLE student_group_lesson (
 student_id INT NOT NULL REFERENCES "student",
 group_lesson_id INT NOT NULL REFERENCES "group_lesson"
);

ALTER TABLE student_group_lesson ADD CONSTRAINT PK_student_group_lesson PRIMARY KEY (student_id,group_lesson_id);


ALTER TABLE activity_info ADD CONSTRAINT FK_activity_info_0 FOREIGN KEY (lesson_price_table_id) REFERENCES lesson_price_table (id);


ALTER TABLE person_details ADD CONSTRAINT FK_person_details_0 FOREIGN KEY (school_id) REFERENCES school (id);


ALTER TABLE person_details_phone_number ADD CONSTRAINT FK_person_details_phone_number_0 FOREIGN KEY (phone_number_id) REFERENCES phone_number (id) ON DELETE CASCADE;
ALTER TABLE person_details_phone_number ADD CONSTRAINT FK_person_details_phone_number_1 FOREIGN KEY (person_details_id) REFERENCES person_details (id) ON DELETE CASCADE;


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_details_id) REFERENCES person_details (id);


ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE contact_person_phone_number ADD CONSTRAINT FK_contact_person_phone_number_0 FOREIGN KEY (phone_number_id) REFERENCES phone_number (id) ON DELETE CASCADE;
ALTER TABLE contact_person_phone_number ADD CONSTRAINT FK_contact_person_phone_number_1 FOREIGN KEY (student_id) REFERENCES contact_person (student_id) ON DELETE CASCADE;


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_details_id) REFERENCES person_details (id);


ALTER TABLE instructor_teachable_instrument ADD CONSTRAINT FK_instructor_teachable_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;
ALTER TABLE instructor_teachable_instrument ADD CONSTRAINT FK_instructor_teachable_instrument_1 FOREIGN KEY (teachable_instrument_id) REFERENCES teachable_instrument (id) ON DELETE CASCADE;


ALTER TABLE lease_contract ADD CONSTRAINT FK_lease_contract_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE lease_contract ADD CONSTRAINT FK_lease_contract_1 FOREIGN KEY (rental_instrument_id) REFERENCES rental_instrument (id);


ALTER TABLE salary_payout ADD CONSTRAINT FK_salary_payout_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_1_id) REFERENCES student (id) ON DELETE CASCADE;
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (student_2_id) REFERENCES student (id) ON DELETE CASCADE;


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (activity_info_id) REFERENCES activity_info (id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_2 FOREIGN KEY (ensemble_genre_id) REFERENCES ensemble_genre (id);


ALTER TABLE ensemble_teachable_instrument ADD CONSTRAINT FK_ensemble_teachable_instrument_0 FOREIGN KEY (teachable_instrument_id) REFERENCES teachable_instrument (id) ON DELETE CASCADE;
ALTER TABLE ensemble_teachable_instrument ADD CONSTRAINT FK_ensemble_teachable_instrument_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id) ON DELETE CASCADE;


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (activity_info_id) REFERENCES activity_info (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (activity_info_id) REFERENCES activity_info (id);


ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_ensemble ADD CONSTRAINT FK_student_ensemble_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id);


ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;
ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (id) ON DELETE CASCADE;


ALTER TABLE rental_instrument ADD CONSTRAINT FK_rental_instrument_0 FOREIGN KEY (instrument_brand_id) REFERENCES instrument_brand (id);
ALTER TABLE rental_instrument ADD CONSTRAINT FK_rental_instrument_1 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (id);


