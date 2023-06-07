-- Stores tablosu
INSERT INTO stores (name, slug) VALUES
                                    ('PlayStation 4 Store', 'playstation4'),
                                    ('PlayStation 5 Store', 'playstation5'),
                                    ('PC Store', 'pc');

-- Games tablosu
INSERT INTO games (slug, name, released, background_image, rating, rating_top, price) VALUES
                                                                                          ('gta', 'Grand Theft Auto V', '2013-09-17', 'https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg', 4.47, 5, 245.9),
                                                                                          ('rdr', 'Red Dead Redemption', '2010-05-18', 'https://image.api.playstation.com/vulcan/img/rnd/202011/1215/WyHa1BM3ISDVqYSEUMB9VZJs.png?w=5000&thumb=false', 4.47, 5, 199.9),
                                                                                          ('gow', 'God Of War', '2018-04-20', 'https://image.api.playstation.com/vulcan/img/rnd/202010/2217/ax0V5TYMax06mLzmkWeQMiwH.jpg', 4.63, 5, 179.9),
                                                                                          ('fifa22', 'FIFA 22', '2021-10-01', 'https://cdn.akamai.steamstatic.com/steam/apps/1506830/capsule_616x353.jpg?t=1684248957', 3.91, 5, 299.9),
                                                                                          ('fifa23', 'FIFA 23', '2022-09-30', 'https://cdn1.epicgames.com/offer/f5deacee017b4b109476933f7dd2edbd/EGS_EASPORTSFIFA23StandardEdition_EACanada_S1_2560x1440-aaf9c5273c27a485f2cce8cb7e804f5c', 4.17, 5, 319.9),
                                                                                          ('spiderman', "Marvel's Spider-Man Remastered", '2021-11-12', 'https://cdn1.epicgames.com/offer/4bc43145bb8245a5b5cc9ea262ffbe0e/EGS_MarvelsSpiderManRemastered_InsomniacGamesNixxesSoftware_S1_2560x1440-73702d11161b29a0b7c40a8b489b1808', 4.62, 5, 149.9),
                                                                                          ('codmw2', 'Call of Duty: Modern Warfare II', '2019-10-25', 'https://image.api.playstation.com/vulcan/ap/rnd/202205/2800/iQGgKYUg9YwjPVNM0kE8jeRN.jpg', 3.62, 5, 199.9),
                                                                                          ('streetfighter6', 'Street Fighter 6', '2022-12-31', 'https://image.api.playstation.com/vulcan/ap/rnd/202211/1407/XFU0aPBvtm3W2od1ZvhByAOv.png', 4.0, 5, 79.9),
                                                                                          ('rust', 'Rust', '2013-12-11', 'https://image.api.playstation.com/vulcan/ap/rnd/202103/1501/enihR6QwSYiWCNl2HdPfV6R6.png', 3.83, 5, 129.9),
                                                                                          ('rainbowsixsiege', "Tom Clancy's Rainbow Six Siege", '2015-12-01', 'https://cdn1.epicgames.com/offer/carnation/Share_Image_1920x1080-3_1920x1080-6e2d079f24db0a35285007191358978b', 4.29, 5, 199.9);


-- Platforms
INSERT INTO platforms (name, slug) VALUES
                                       ('PC', 'pc'),
                                       ('PlayStation 5', 'playstation5'),
                                       ('PlayStation 4', 'playstation4'),
                                       ('Xbox', 'xbox');

-- GamesPlatforms tablosu
INSERT INTO games_platforms (game_id, platform_id) VALUES
                                                       (1, 3), (1, 1), (1, 2),
                                                       (2, 3), (2, 1), (2, 2),
                                                       (3, 3), (3, 1),
                                                       (4, 3), (4, 1), (4, 2),
                                                       (5, 3), (5, 1), (5, 2),
                                                       (6, 3), (6, 1),
                                                       (7, 3), (7, 4), (7, 2),
                                                       (8, 2),
                                                       (9, 2),
                                                       (10, 3), (10, 4);

-- Users tablosu
INSERT INTO users (username, email, password) VALUES
                                                  ('user1', 'user1@example.com', '123'),
                                                  ('user2', 'user2@example.com', '123'),
                                                  ('user3', 'user3@example.com', '123');

-- UserGames tablosu
INSERT INTO user_games (user_id, game_id, purchase_date) VALUES
                                                            (1, 1, '2022-03-10'),
                                                            (1, 3, '2022-06-15'),
                                                            (1, 5, '2022-09-20'),
                                                            (2, 2, '2022-05-05'),
                                                            (2, 4, '2022-08-10'),
                                                            (3, 1, '2022-07-01'),
                                                            (3, 3, '2022-09-15'),
                                                            (3, 6, '2022-12-20');

-- UserRatings tablosu
INSERT INTO user_ratings (user_id, game_id, rating) VALUES
                                                       (1, 1, 4.5),
                                                       (1, 3, 4.8),
                                                       (1, 5, 4.2),
                                                       (2, 2, 4.0),
                                                       (2, 4, 3.9),
                                                       (3, 1, 4.7),
                                                       (3, 3, 4.6),
                                                       (3, 6, 4.5);

-- GamePrices tablosu
INSERT INTO game_prices (game_id, store_id, price) VALUES
                                                      (1, 1, 49.9), (1, 2, 54.9), (1, 3, 59.9),
                                                      (2, 1, 39.9), (2, 2, 44.9), (2, 3, 49.9),
                                                      (3, 1, 49.9), (3, 2, 54.9),
                                                      (4, 1, 59.9), (4, 2, 64.9), (4, 3, 69.9),
                                                      (5, 1, 69.9), (5, 2, 74.9), (5, 3, 79.9),
                                                      (6, 1, 39.9), (6, 2, 44.9),
                                                      (7, 1, 49.9), (7, 2, 54.9), (7, 3, 59.9),
                                                      (8, 3, 79.9),
                                                      (9, 2, 109.9),
                                                      (10, 1, 49.9), (10, 2, 54.9);


-- Yorumlar tablosu
INSERT INTO comments (user_id, game_id, comment) VALUES
-- Grand Theft Auto V için yorumlar
(1, 1, 'Muhteşem bir açık dünya oyunu, kesinlikle denemelisiniz!'),
(2, 1, 'Grafikler çok etkileyici ve hikaye sürükleyici.'),
(3, 1, 'Harika bir oyun, çok eğlendim.');

-- Red Dead Redemption için yorumlar
INSERT INTO comments (user_id, game_id, comment) VALUES
                                                     (1, 2, 'Büyüleyici bir hikayesi var, karakterler çok gerçekçi.'),
                                                     (2, 2, 'Oyun dünyası inanılmaz detaylı, keşfetmekten keyif aldım.'),
                                                     (3, 2, 'Atmosferi muhteşem, sürükleyici bir deneyim yaşattı.');

-- God Of War için yorumlar
INSERT INTO comments (user_id, game_id, comment) VALUES
                                                     (1, 3, 'Efsanevi bir savaş deneyimi, grafikler harika.'),
                                                     (2, 3, 'Karakter gelişimi çok iyi düşünülmüş, sürükleyici bir hikayesi var.'),
                                                     (3, 3, 'Müthiş bir aksiyon oyunu, kesinlikle oynamalısınız.');

-- FIFA 22 için yorumlar
INSERT INTO comments (user_id, game_id, comment) VALUES
                                                     (1, 4, 'Gerçekçi futbol deneyimi, oynanışı çok akıcı.'),
                                                     (2, 4, 'Lisanslı takımlar ve oyuncular oyuna ayrı bir değer katıyor.'),
                                                     (3, 4, 'Multiplayer modu çok eğlenceli, arkadaşlarınızla oynamalısınız.');

-- FIFA 23 için yorumlar
INSERT INTO comments (user_id, game_id, comment) VALUES
                                                     (1, 5, 'Geliştirilmiş oynanış ve yeni özellikler ile harika bir futbol deneyimi.'),
                                                     (2, 5, 'Grafikler çok etkileyici, maçlar gerçekçi bir atmosfer sunuyor.'),
                                                     (3, 5, 'Yeni oyun modları ile oynaması çok eğlenceli hale gelmiş.');

-- Marvel's Spider-Man Remastered için yorumlar
INSERT INTO comments (user_id, game_id, comment) VALUES
                                                     (1, 6, 'Spider-Man hayranları için muhteşem bir yeniden yapım.'),
                                                     (2, 6, 'Heyecan verici bir süper kahraman deneyimi, öneririm.'),
                                                     (3, 6, 'Grafikler ve animasyonlar harika, sürükleyici bir hikayesi var.');

-- Call of Duty: Modern Warfare II için yorumlar
INSERT INTO comments (user_id, game_id, comment) VALUES
                                                     (1, 7, 'Aksiyon dolu bir FPS oyunu, çok heyecanlı anlar yaşattı.'),
                                                     (2, 7, 'Çok iyi tasarlanmış çoklu oyuncu modu ile bağımlılık yapıcı.'),
                                                     (3, 7, 'Geri dönüşü harika, nostaljik hisler uyandırdı.');

-- Street Fighter 6 için yorumlar
INSERT INTO comments (user_id, game_id, comment) VALUES
                                                     (1, 8, 'Street Fighter serisinin en yeni oyunu, dövüş mekaniği mükemmel.'),
                                                     (2, 8, 'Online modu çok rekabetçi ve eğlenceli.'),
                                                     (3, 8, 'Görsel efektler harika, karakterlerin hareketleri çok akıcı.');

-- Rust için yorumlar
INSERT INTO comments (user_id, game_id, comment) VALUES
                                                     (1, 9, 'Zorlu bir hayatta kalma oyunu, strateji ve işbirliği önemli.'),
                                                     (2, 9, 'Keşfetmekten keyif aldığım geniş bir açık dünya.'),
                                                     (3, 9, 'Düşmanlarla mücadele etmek ve savunma yapmak çok heyecan verici.');

-- Tom Clancy's Rainbow Six Siege için yorumlar
INSERT INTO comments (user_id, game_id, comment) VALUES
                                                     (1, 10, 'Taktiksel bir FPS oyunu, takım çalışması gerektiriyor.'),
                                                     (2, 10, 'Çoklu oyuncu modu ile uzun saatler geçirdim, sürükleyici bir deneyim.'),
                                                     (3, 10, 'Haritalar ve operatörlerin farklı yetenekleri oyunu zenginleştiriyor.');

-- GTA - GameDetails
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (1, 'Grand Theft Auto V is an action-adventure game developed by Rockstar North and published by Rockstar Games.', 'Rockstar North', 'Rockstar Games', 'Action, Adventure');

-- Red Dead Redemption - game_details
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (2, 'Red Dead Redemption is a Western action-adventure game developed by Rockstar San Diego and published by Rockstar Games.', 'Rockstar San Diego', 'Rockstar Games', 'Action, Adventure');

-- God of War - game_details
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (3, 'God of War is an action-adventure game developed by Santa Monica Studio and published by Sony Interactive Entertainment.', 'Santa Monica Studio', 'Sony Interactive Entertainment', 'Action, Adventure');

-- FIFA 22 - game_details
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (4, 'FIFA 22 is a football simulation game developed and published by EA Sports.', 'EA Sports', 'EA Sports', 'Sports, Simulation');

-- FIFA 23 - game_details
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (5, 'FIFA 23 is a football simulation game developed and published by EA Sports.', 'EA Sports', 'EA Sports', 'Sports, Simulation');

-- Marvel's Spider-Man Remastered - game_details
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (6, 'Marvel\'s Spider-Man Remastered is an action-adventure game developed by Insomniac Games and published by Sony Interactive Entertainment.', 'Insomniac Games', 'Sony Interactive Entertainment', 'Action, Adventure');

-- Call of Duty: Modern Warfare II - game_details
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (7, 'Call of Duty: Modern Warfare II is a first-person shooter game developed by Infinity Ward and published by Activision.', 'Infinity Ward', 'Activision', 'Action, Shooter');

-- Street Fighter 6 - game_details
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (8, 'Street Fighter 6 is a fighting game developed and published by Capcom.', 'Capcom', 'Capcom', 'Fighting');

-- Rust - game_details
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (9, 'Rust is a multiplayer survival game developed by Facepunch Studios.', 'Facepunch Studios', 'Facepunch Studios', 'Action, Adventure, Survival');

-- Tom Clancy's Rainbow Six Siege - game_details
INSERT INTO game_details (game_id, description, developer, publisher, genre)
VALUES (10, 'Tom Clancys Rainbow Six Siege is a tactical shooter game developed and published by Ubisoft.', 'Ubisoft', 'Ubisoft', 'Action, Shooter');

INSERT INTO genres (name, slug)
VALUES
  ('Action', 'action'),
  ('Adventure', 'adventure'),
  ('Role-Playing', 'role-playing'),
  ('Strategy', 'strategy'),
  ('Simulation', 'simulation'),
  ('Sports', 'sports'),
  ('Racing', 'racing'),
  ('Shooter', 'shooter'),
  ('Fighting', 'fighting'),
  ('Puzzle', 'puzzle');

INSERT INTO games_genres (game_id, genre_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 3),
    (3, 4),
    (3, 5),
    (4, 1),
    (4, 5),
    (5, 2),
    (5, 3);
    (6, 1),
        (7, 2),
        (8, 1),
        (9, 3),
        (10, 4),
        (6, 5),
        (7, 1),
        (8, 5),
        (9, 2),
        (10, 3);

INSERT INTO wallets (wallet_id, user_id, balance)
VALUES
  (1, 1, 1000.00);

-- User 2
INSERT INTO wallets (wallet_id, user_id, balance)
VALUES
  (2, 2, 500.00);

-- User 3
INSERT INTO wallets (wallet_id, user_id, balance)
VALUES
  (3, 3, 250.00);



INSERT INTO short_screenshots (game_id, image)
VALUES
(2, 'https://media.rawg.io/media/games/511/5118aff5091cb3efec399c808f8c598f.jpg'),
(2, 'https://media.rawg.io/media/screenshots/7b8/7b8895a23e8ca0dbd9e1ba24696579d9.jpg'),
(2, 'https://media.rawg.io/media/screenshots/b8c/b8cee381079d58b981594ede46a3d6ca.jpg'),
(2, 'https://media.rawg.io/media/screenshots/fd6/fd6e41d4c30c098158568aef32dfed35.jpg'),
(2, 'https://media.rawg.io/media/screenshots/2ed/2ed3b2791b3bbed6b98bf362694aeb73.jpg'),
(2, 'https://media.rawg.io/media/screenshots/857/8573b9f4f06a0c112d6e39cdf3544881.jpg'),
(2, 'https://media.rawg.io/media/screenshots/985/985e3e1f1d1af1ab0797d43a95d472cc.jpg');

INSERT INTO short_screenshots (game_id, image)
VALUES
(3, 'https://media.rawg.io/media/games/4be/4be6a6ad0364751a96229c56bf69be59.jpg'),
(3, 'https://media.rawg.io/media/screenshots/d68/d6868e5f7bce66e326bd48b11ba24b13.jpeg'),
(3, 'https://media.rawg.io/media/screenshots/928/928cdaf4ae204f202d177bbd65e911b3.jpeg'),
(3, 'https://media.rawg.io/media/screenshots/a54/a549a06ebe89c570cabb57308c4c42a5.jpeg'),
(3, 'https://media.rawg.io/media/screenshots/f02/f0279f8199da3e91134078e737e5fbcf.jpg'),
(3, 'https://media.rawg.io/media/screenshots/e87/e87c57660c7c37fe973c6dd6ebcc1ac6.jpeg'),
(3, 'https://media.rawg.io/media/screenshots/5b7/5b7280fe437c39d3ce501a867c46a998.jpeg');

INSERT INTO sys.short_screenshots (game_id, image)
VALUES
(4, 'https://media.rawg.io/media/games/355/355d2ec5d6b87518228dc30a9bb0e70d.jpg'),
(4, 'https://media.rawg.io/media/screenshots/955/9557c44f07a713d9b97776a19bbcd968.jpg'),
(4, 'https://media.rawg.io/media/screenshots/0bf/0bfbf381171613bf7bf6e2e4eabd8f29.jpg'),
(4, 'https://media.rawg.io/media/screenshots/fac/fac7b9405c7767558de8639bb44a0156.jpg'),
(4, 'https://media.rawg.io/media/screenshots/d17/d17014c92b468bb850d882f646f8c5fb.jpg'),
(4, 'https://media.rawg.io/media/screenshots/ed8/ed8e23ab0522a264ae0756d80a14c521.jpg');

INSERT INTO sys.short_screenshots (game_id, image)
VALUES
(5, 'https://fifauteam.com/images/fifa22/screenshots/big/34.jpg'),
(5, 'https://fifauteam.com/images/fifa22/screenshots/big/33.jpg'),
(5, 'https://fifauteam.com/images/fifa22/screenshots/big/35.jpg'),
(5, 'https://fifauteam.com/images/fifa22/screenshots/big/39.jpg'),
(5, 'https://fifauteam.com/images/fifa22/screenshots/big/41.jpg'),
(5, 'https://fifauteam.com/images/fifa22/screenshots/big/54.jpg');

INSERT INTO sys.short_screenshots (game_id, image)
VALUES
(6, 'https://steamuserimages-a.akamaihd.net/ugc/2031732569392643809/592ED563EEDC522C98D05EC1E5424723BC1F59E7/?imw=1920&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false'),
(6, 'https://steamuserimages-a.akamaihd.net/ugc/2024977169946932497/B32172173B39E235F538D7641484F09D0CB3F075/?imw=1920&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false'),
(6, 'https://steamuserimages-a.akamaihd.net/ugc/2024977169951053263/73D4B11958E759C1716D35CA804D93AF17E5BBC8/?imw=1920&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false'),
(6, 'https://steamuserimages-a.akamaihd.net/ugc/2027229228001616192/0229E088B48D90BD45A28BFDFCACDD263610D901/?imw=1920&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false'),
(6, 'https://steamuserimages-a.akamaihd.net/ugc/2033984369184311699/6DE1A0072C2BB3238CF2A431F1BE978370EE6C97/?imw=2560&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false');


INSERT INTO sys.short_screenshots (game_id, image)
VALUES
(7, 'https://sm.ign.com/t/ign_za/gallery/c/call-of-du/call-of-duty-modern-warfare-2-2022-campaign-screenshots_xh9v.1080.jpg'),
(7, 'https://sm.ign.com/t/ign_za/photo/default/nvg-closeup-1654638459496_1dqq.1080.jpg'),
(7, 'https://sm.ign.com/t/ign_za/photo/default/dark-water-01-unbranded-1654638459492_1ryx.1080.jpg'),
(7, 'https://sm.ign.com/t/ign_za/photo/default/gaz-unbranded-1654638459493_t8b9.1080.jpg'),
(7, 'https://sm.ign.com/t/ign_za/photo/default/nightwar-01-1654638459494_97a8.1080.jpg');

INSERT INTO sys.short_screenshots (game_id, image)
VALUES
(8, 'https://www.fightersgeneration.com/news2023/news2/Remy-StreetFighter6-TFG-Hoodie.png'),
(8, 'https://www.fightersgeneration.com/news2023/game2/streetfighter6-character-select-4k.png'),
(8, 'https://www.fightersgeneration.com/news2023/news/streetfighter6-stage-select-march2023.png'),
(8, 'https://www.fightersgeneration.com/news2022/news3/sf6/deejay-streetfighter6-screenshot.jpg'),
(8, 'https://www.fightersgeneration.com/news2023/news/deejay-sf6-screen.jpg');




