import 'dart:convert';

import 'package:assignment/animation/FadeAnimation.dart';
import 'package:assignment/di/repository/games_repository.dart';
import 'package:assignment/models/Game.dart';
import 'package:assignment/models/PlatformEnum.dart';
import 'package:assignment/pages/allpage.dart';
import 'package:assignment/pages/game_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/Shared.dart';
import '../di/service_locator.dart';
import '../models/Games.dart';

class ExplorePage extends StatefulWidget {
  final Function callBack;

  const ExplorePage({ Key? key, required this.callBack }) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  final gamesRepository = getIt.get<GamesRepository>();

  List<PlatformEnum> platformList = [PlatformEnum.PC, PlatformEnum.PS4, PlatformEnum.PS5];
  int selectedPlatform = 0;
  var selectedRange = const RangeValues(150.00, 1500.00);

  List<Game> pcGameList = [];
  List<Game> ps4GameList = [];
  List<Game> ps5GameList = [];
  List<Game> actionGameList = [];

  @override
  void initState() { 
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getGames();
    });
    super.initState();
  }

  getGames() async {
    pcGameList = await gamesRepository.getGames("", [PlatformEnum.PC.value], []);
    ps4GameList = await gamesRepository.getGames("", [PlatformEnum.PS4.value], []);
    ps5GameList = await gamesRepository.getGames("", [PlatformEnum.PS5.value], []);
    actionGameList = await gamesRepository.getGames("", [], [1]);
    setState(() {});
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
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          expandedHeight: 300.0,
          elevation: 0,
          pinned: true,
          floating: true,
          stretch: true,
          backgroundColor: Colors.grey.shade50,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            titlePadding: const EdgeInsets.only(left: 20, right: 30, bottom: 100),
            stretchModes: const [
              StretchMode.zoomBackground,
              // StretchMode.fadeTitle
            ],
            title: AnimatedOpacity(
              opacity: _isScrolled ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: FadeAnimation(1, const Text("Playstation 4 & Playstation 5 & PC oyunları",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                ))),
            ),
            background: Image.asset("assets/images/background.png", fit: BoxFit.cover,)
          ),
          bottom: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Expanded(
                  child: FadeAnimation(1.4, Container(
                    height: 50,
                    child: FocusScope(
                        child: Focus(
                            onFocusChange: (focus) => widget.callBack(1),
                            child: TextField(
                              readOnly: true,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.search, color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
                                ),
                                hintText: "Oyun Ara",
                                hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
                              ),
                            ),
                        )
                    )
                  )),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 330,
              child: Column(
                children: [
                  FadeAnimation(1.4,  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Bilgisayar Oyunları', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AllPage(gameList: pcGameList)));
                          },
                          child: const Text('Tümü ', style: TextStyle(color: Colors.black, fontSize: 14),),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pcGameList.length,
                      itemBuilder: (context, index) {
                        return gameCard(pcGameList[index]);
                      }
                    )
                  )
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              height: 180,
              child: Column(
                children: [
                  FadeAnimation(1.4, Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Aksiyon', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AllPage(gameList: pcGameList)));
                          },
                          child: const Text('Tümü ', style: TextStyle(color: Colors.black, fontSize: 14),),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: actionGameList.length,
                      itemBuilder: (context, index) {
                        return actionGames(actionGameList[index]);
                      }
                    )
                  )
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              height: 330,
              child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('PlayStation 4', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AllPage(gameList: ps4GameList)));
                          },
                          child: const Text('Tümü ', style: TextStyle(color: Colors.black, fontSize: 14),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ps4GameList.length,
                      itemBuilder: (context, index) {
                        return gameCard(ps4GameList[index]);
                      }
                    )
                  )
                ]
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 330,
              child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('PlayStation 5', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AllPage(gameList: ps5GameList)));
                          },
                          child: const Text('Tümü ', style: TextStyle(color: Colors.black, fontSize: 14),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      reverse: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: ps5GameList.length,
                      itemBuilder: (context, index) {
                        return gameCard(ps5GameList[index]);
                      }
                    )
                  )
                ]
              )
            ),
          ]),
        )
      ]
    );
  }

  gameCard(Game game) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: FadeAnimation(1.5, GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => GameViewPage(game: game,)));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 20, bottom: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [BoxShadow(
              offset: const Offset(5, 10),
              blurRadius: 15,
              color: Colors.grey.shade200,
            )],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
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
                    // Add to cart button
                    Positioned(
                      right: 5,
                      bottom: 0,
                      child: MaterialButton(
                        color: Colors.orange,
                        minWidth: 45,
                        height: 45,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        onPressed: () {
                          addToCartModal(game);
                        },
                        padding: const EdgeInsets.all(5),
                        child: const Center(child: Icon(Icons.shopping_cart, color: Colors.white, size: 20,)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Text(game.name ?? "",
                style: const TextStyle(color: Colors.black, fontSize: 18,), maxLines: 1,
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                        width: 16,
                        child: Icon(Icons.star_border_purple500,size: 16, color: Colors.orange),
                      ),
                      Text(game.rating.toString(), style: TextStyle(color: Colors.orange.shade400, fontSize: 14,),),
                    ],
                  ),
                  Text("${game.prices.first.price ?? 0} \₺",
                    style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  actionGames(Game game) {
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: FadeAnimation(1.5, Container(
        margin: const EdgeInsets.only(right: 20, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(
            offset: const Offset(5, 10),
            blurRadius: 15,
            color: Colors.grey.shade200,
          )],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(game.backgroundImage ?? "", fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(game.name ?? "",
                    style: const TextStyle(color: Colors.black, fontSize: 18,),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                        width: 16,
                        child: Icon(Icons.star_border_purple500,size: 16, color: Colors.orange),
                      ),
                      Text(game.rating.toString(), style: TextStyle(color: Colors.orange.shade400, fontSize: 14,),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text("${game.prices.first.price ?? 0} \₺",
                    style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ]
              ),
            )
          ],
        ),
      )),
    );
  }

  showFilterModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Filtrele', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        minWidth: 40,
                        height: 40,
                        color: Colors.grey.shade300,
                        elevation: 0,
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Icon(Icons.close, color: Colors.black,),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text("Platform", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: platformList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPlatform = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: selectedPlatform == index ? Colors.yellow[800] : Colors.grey.shade200,
                              shape: BoxShape.circle
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text(platformList[index].name, style: TextStyle(color: selectedPlatform == index ? Colors.white : Colors.black, fontSize: 15),),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Slider Price Renge filter
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Fiyat aralığı', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('\₺ ${selectedRange.start.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12),),
                          Text(" - ", style: TextStyle(color: Colors.grey.shade500)),
                          Text('\₺ ${selectedRange.end.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  RangeSlider(
                    values: selectedRange, 
                    min: 0.00,
                    max: 2000.00,
                    divisions: 100,
                    inactiveColor: Colors.grey.shade300,
                    activeColor: Colors.yellow[800],
                    labels: RangeLabels('\$ ${selectedRange.start.toStringAsFixed(2)}', '\$ ${selectedRange.end.toStringAsFixed(2)}',),
                    onChanged: (RangeValues values) {
                      setState(() => selectedRange = values);
                    }
                  ),
                  const SizedBox(height: 20,),
                  button('Filtrele', () {})
                ],
              ),
            );
          }
        );
      },
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

  button(String text, Function onPressed) {
    return MaterialButton(
      onPressed: () => onPressed(),
      height: 50,
      elevation: 0,
      splashColor: Colors.yellow[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.yellow[800],
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18),),
      ),
    );
  }
}
