-- Games tablosu
CREATE TABLE games (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       slug VARCHAR(255),
                       name VARCHAR(255),
                       released DATE,
                       background_image VARCHAR(255),
                       rating DOUBLE PRECISION,
                       rating_top INT,
                       price DOUBLE PRECISION
);

-- GameDetails Tablosu
CREATE TABLE game_details (
                             game_id BIGINT PRIMARY KEY,
                             description VARCHAR(255),
                             developer VARCHAR(255),
                             publisher VARCHAR(255),
                             genre VARCHAR(255),
                             FOREIGN KEY (game_id) REFERENCES games(id)
);

-- Platforms tablosu
CREATE TABLE platforms (
                           id BIGINT AUTO_INCREMENT PRIMARY KEY,
                           name VARCHAR(255),
                           slug VARCHAR(255)
);

-- Games_Platforms ara tablosu (Games ve Platforms tabloları arasında ilişki)
CREATE TABLE games_platforms (
                                 game_id BIGINT,
                                 platform_id BIGINT,
                                 FOREIGN KEY (game_id) REFERENCES games (id),
                                 FOREIGN KEY (platform_id) REFERENCES platforms (id),
                                 PRIMARY KEY (game_id, platform_id)
);

-- Genres tablosu
CREATE TABLE genres (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(255),
                        slug VARCHAR(255)
);

-- Games_Genres ara tablosu (Games ve Genres tabloları arasında ilişki)
CREATE TABLE games_genres (
                              game_id BIGINT,
                              genre_id BIGINT,
                              FOREIGN KEY (game_id) REFERENCES games (id),
                              FOREIGN KEY (genre_id) REFERENCES genres (id),
                              PRIMARY KEY (game_id, genre_id)
);

-- Short_Screenshots tablosu
CREATE TABLE short_screenshots (
                                   id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                   game_id BIGINT,
                                   image VARCHAR(255),
                                   FOREIGN KEY (game_id) REFERENCES games (id)
);

-- Stores tablosu
CREATE TABLE stores (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(255),
                        slug VARCHAR(255)
);

-- GamePrices tablosu
CREATE TABLE game_prices (
                            id BIGINT AUTO_INCREMENT PRIMARY KEY,
                            game_id BIGINT,
                            store_id BIGINT,
                            price DOUBLE PRECISION,
                            FOREIGN KEY (game_id) REFERENCES games (id),
                            FOREIGN KEY (store_id) REFERENCES stores (id)
);

-- Users tablosu
CREATE TABLE users (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(255) NOT NULL,
                       email VARCHAR(255) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Wallets Tablosu
CREATE TABLE wallets (
                         wallet_id BIGINT PRIMARY KEY,
                         user_id BIGINT UNIQUE,
                         balance DOUBLE PRECISION,
                         FOREIGN KEY (user_id) REFERENCES users(id)
);

-- UserRatings tablosu
CREATE TABLE user_ratings (
                             id BIGINT AUTO_INCREMENT PRIMARY KEY,
                             user_id BIGINT,
                             game_id BIGINT,
                             rating DOUBLE PRECISION,
                             FOREIGN KEY (user_id) REFERENCES users (id),
                             FOREIGN KEY (game_id) REFERENCES games (id)
);



-- UserGames tablosu
CREATE TABLE user_games (
                           id BIGINT AUTO_INCREMENT PRIMARY KEY,
                           user_id BIGINT,
                           game_id BIGINT,
                           purchase_date DATE,
                           FOREIGN KEY (user_id) REFERENCES users (id),
                           FOREIGN KEY (game_id) REFERENCES games (id)
);



-- Comments tablosu
CREATE TABLE comments (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          game_id BIGINT,
                          user_id BIGINT,
                          comment VARCHAR(255),
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (game_id) REFERENCES games (id),
                          FOREIGN KEY (user_id) REFERENCES users (id)
);