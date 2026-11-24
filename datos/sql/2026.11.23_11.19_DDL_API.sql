-- USERS
CREATE TABLE users(
    id INTEGER AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    website VARCHAR(255) NOT NULL,

    CONSTRAINT pk_users PRIMARY KEY (id)
) COMMENT = 'Tabla de usuarios de JsonPlaceholder';

CREATE TABLE address(
    id INTEGER AUTO_INCREMENT,
    userId INTEGER NOT NULL,
    street VARCHAR(255) NOT NULL,
    suite VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    zipcode VARCHAR(20) NOT NULL,

    CONSTRAINT pk_address PRIMARY KEY (id),
    CONSTRAINT uq_address_user UNIQUE (userId),
    CONSTRAINT fk_address_users FOREIGN KEY (userId) REFERENCES users(id)
) COMMENT = 'Direcciones de usuarios de JsonPlaceholder';

CREATE TABLE geo(
    addressId INTEGER NOT NULL,
    lat DECIMAL(10, 6) NOT NULL,
    lng DECIMAL(10, 6) NOT NULL,

    CONSTRAINT pk_geo PRIMARY KEY (addressId),
    CONSTRAINT fk_geo_address FOREIGN KEY (addressId) REFERENCES address(id)
) COMMENT = 'Coordenadas geográficas de las direcciones';

CREATE TABLE company(
    id INTEGER AUTO_INCREMENT,
    userId INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    catchPhrase VARCHAR(255) NOT NULL,
    bs VARCHAR(255) NOT NULL,

    CONSTRAINT pk_company PRIMARY KEY (id),
    CONSTRAINT uq_company_user UNIQUE (userId),
    CONSTRAINT fk_company_users FOREIGN KEY (userId) REFERENCES users(id)
) COMMENT = 'Empresas asociadas a usuarios de JsonPlaceholder';

-- POSTS
CREATE TABLE posts(
    id INTEGER AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    body TEXT,
    userId INTEGER NOT NULL,

    CONSTRAINT pk_posts PRIMARY KEY (id),
    CONSTRAINT fk_posts_users FOREIGN KEY (userId) REFERENCES users(id)
) COMMENT = 'Tabla de publicaciones de JsonPlaceholder';


-- COMMENTS
