import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Utils/Shared.dart';
import '../models/Comment.dart';
import '../models/Game.dart';
import '../models/product.dart';

class GameViewPage extends StatefulWidget {
  final Game game;
  const GameViewPage({ Key? key, required this.game }) : super(key: key);

  @override
  _GameViewPageState createState() => _GameViewPageState();
}

class _GameViewPageState extends State<GameViewPage> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);
    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
            elevation: 0,
            snap: true,
            floating: true,
            stretch: true,
            backgroundColor: Colors.grey.shade50,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
                background: ListView(
                  physics: const PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      widget.game.shortScreenshots.length, (i) =>
                      Image.network(widget.game.shortScreenshots[i].image ?? "", fit: BoxFit.cover)
                  ),
                ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: Transform.translate(
                offset: Offset(0, 1),
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ),
                ),
              )
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.game.name ?? "-",
                              style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: widget.game.rating ?? 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                  },
                                ),
                                Text(widget.game.rating.toString(), style: TextStyle(color: Colors.orange.shade400, fontSize: 14,),),
                              ],
                            ),
                          ],
                        ),),
                        Text("\$ ${widget.game.prices.first.price}",
                          style: const TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.game.genres.isNotEmpty ? widget.game.genres.first.name ?? "" : "",
                          style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCommentView(widget.game.comments);
                          },
                          child: Text(" Yorumlar(${widget.game.comments.length})",
                            style: const TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: () {
                        addToCartModal(widget.game);
                      },
                      height: 50,
                      elevation: 0,
                      splashColor: Colors.yellow[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      color: Colors.yellow[800],
                      child: const Center(
                        child: Text("Sepete ekle", style: TextStyle(color: Colors.white, fontSize: 18),),
                      ),
                    )
                  ],
                )
              )
            ])
          ),
        ]
      ),
    );
  }

  addToCartModal(Game game) {
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: AnimationController(duration: Duration(milliseconds: 400), vsync: this),
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 350,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Satıcı seç", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  const SizedBox(height: 10,),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: game.prices.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              SharedPref.cartGameList[game] = game.prices[index];
                              Navigator.pop(context);
                              final snackbar = SnackBar(
                                content: const Text("Oyun sepete eklendi"),
                                duration: const Duration(seconds: 5),
                                action: SnackBarAction(
                                  label: 'Geri al',
                                  onPressed: () {
                                    SharedPref.cartGameList.remove(game);
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  game.prices[index].store?.image ?? "",
                                  fit: BoxFit.contain,
                                  height: 50,
                                  width: 50,
                                ),
                                Expanded(child: Text(game.prices[index].store?.name ?? "", style: const TextStyle(color: Colors.black, fontSize: 15),)),
                                Expanded(child: Text("${game.prices[index].price}₺" ?? "", style: const TextStyle(color: Colors.black, fontSize: 15),))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        )
    );
  }


  showCommentView(List<Comment> commentList) {
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: AnimationController(duration: Duration(milliseconds: 400), vsync: this),
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.65,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Yorumlar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 340,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: commentList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: Text(commentList[index].username ?? "", style: const TextStyle(color: Colors.black, fontSize: 15),)),
                              Expanded(child: Text(commentList[index].comment ?? "", style: const TextStyle(color: Colors.black, fontSize: 15),))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        )
    );
  }
}