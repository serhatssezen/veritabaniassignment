import 'package:assignment/models/Game.dart';
import 'package:assignment/pages/game_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../animation/FadeAnimation.dart';

class AllPage extends StatefulWidget {
  List<Game> gameList = [];
  AllPage({ Key? key, required this.gameList }) : super(key: key);

  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Tümü', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: widget.gameList.isNotEmpty ? FadeAnimation(1.4,
            AnimatedList(
                scrollDirection: Axis.vertical,
                initialItemCount: widget.gameList.length,
                itemBuilder: (context, index, animation) {
                  return Container(
                    child: cartItem(widget.gameList[index], index, animation),
                  );
                }
            ),
          ) : Container(),
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
                    child: Container(
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
