CREATE TABLE users ( id INTEGER PRIMARY KEY, 
        username VARCHAR ( 255 ) UNIQUE NOT NULL,
        password VARCHAR ( 255 ) NOT NULL,
        email VARCHAR ( 255 ) UNIQUE NOT NULL
        );

CREATE TABLE reservations ( id INTEGER PRIMARY KEY, 
        start_date DATE NOT NULL,
        end_date DATE NOT NULL,
        property_id INTEGER NOT NULL,
        guest_id INTEGER NOT NULL
        )
CREATE TABLE property_reviews ( id INTEGER PRIMARY KEY, 
        guest_id INTEGER NOT NULL,
        poperty_id INTEGER NOT NULL,
        reservation_id INTEGER NOT NULL,
        rating SMALLINT NOT NULL,
        message TEXT
        );
CREATE TABLE properties ( id INTEGER PRIMARY KEY, 
        owner_id INTEGER NOT NULL,
        title VARCHAR ( 255 ) NOT NULL,
        desciption TEXT NOT NULL,
        thumbnail_photo_url VARCHAR(255) NOT NULL,
        cover_photo_url VARCHAR(255) NOT NULL,
        cost_per_night INTEGER NOT NULL,
        parking_spaces INTEGER NOT NULL,
        number_of_bathrooms INTEGER NOT NULL,
        number_of_bedrooms INTEGER NOT NULL,
        country VARCHAR ( 255 ) NOT NULL,
        street VARCHAR ( 255 ) NOT NULL,
        city VARCHAR ( 255 ) NOT NULL,
        province VARCHAR ( 255 ) NOT NULL,
        post_code VARCHAR ( 255 ) NOT NULL,
        active BOOLEAN NOT NULL
        );