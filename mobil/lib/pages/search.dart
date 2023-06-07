import 'package:assignment/pages/game_view.dart';
import 'package:flutter/material.dart';

import '../animation/FadeAnimation.dart';
import '../di/repository/games_repository.dart';
import '../di/service_locator.dart';
import '../models/Game.dart';
import '../models/Games.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final gamesRepository = getIt.get<GamesRepository>();
  List<Game> gameList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: 45,
          child: TextField(
            autofocus: true,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none
              ),
              hintText: "Oyun ara",
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            onChanged: (text) async {
              if (text.length > 3) {
                gameList = await gamesRepository.getGames(text, [], []);
                setState(() {});
              }
            },
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: gameList.isNotEmpty ? FadeAnimation(1.4,
          AnimatedList(
              scrollDirection: Axis.vertical,
              initialItemCount: gameList.length,
              itemBuilder: (context, index, animation) {
                return Container(
                  child: cartItem(gameList[index], index, animation),
                );
              }
          ),
        ) : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
                opacity: .7,
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image( image: AssetImage("assets/images/search.png")),
                )
            ),
            SizedBox(height: 40,),
            Text("Oyun ara ...", style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }

  cartItem(Game game, int index, animation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => GameViewPage(game: game)));
      },
      child: SlideTransition(
        position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero
        ).animate(animation),
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: game.backgroundImage != null ? Image.network(
                      game.backgroundImage ?? "",
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ) : const Icon(Icons.photo_size_select_actual_outlined, size: 100,),
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(game.rating.toString(), style: TextStyle(color: Colors.orange.shade400, fontSize: 14,),),
                        const SizedBox(height: 5,),
                        Text(game.name ?? "",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '${game.prices.first.price ?? 0.0}\₺',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ]
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}