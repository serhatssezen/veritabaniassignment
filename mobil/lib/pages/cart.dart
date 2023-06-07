import 'dart:convert';

import 'package:assignment/Utils/Shared.dart';
import 'package:assignment/models/Game.dart';
import 'package:assignment/models/GamePrices.dart';
import 'package:assignment/pages/payment.dart';
import 'package:assignment/pages/game_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../animation/FadeAnimation.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  late List<Game> cartItems = [];
  late List<GamePrices> cartPrices = [];
  List<int> cartItemCount = [1, 1, 1, 1];
  double totalPrice = 0;

  Future<void> fetchItems() async {
    cartItems = SharedPref.cartGameList.keys.toList();
    cartPrices = SharedPref.cartGameList.values.toList();
    sumTotal();
  }

  sumTotal() {
    for (var item in cartPrices) {
      totalPrice = (item.price ?? 0) + totalPrice;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchItems().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Sepetim', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.5,
            child: cartItems.isNotEmpty ? FadeAnimation(1.4,
              AnimatedList(
                scrollDirection: Axis.vertical,
                initialItemCount: cartItems.length,
                itemBuilder: (context, index, animation) {
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        MaterialButton(
                          color: Colors.red.withOpacity(0.15),
                          elevation: 0,
                          height: 60,
                          minWidth: 60,
                          shape: CircleBorder(),
                          child: const Icon(Icons.delete, color: Colors.red, size: 30,),
                          onPressed: () {
                            setState(() {
                              SharedPref.cartGameList.remove(index);
                              totalPrice = totalPrice - (cartPrices[index].price ?? 0);
                              AnimatedList.of(context).removeItem(index, (context, animation) {
                                return cartItem(cartItems[index], index, animation);
                              });
                              cartItems.removeAt(index);
                              cartItemCount.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                    child: cartItem(cartItems[index], index, animation),
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
                      child: Image( image: AssetImage("assets/images/cart_empty.png")),
                    )
                ),
                SizedBox(height: 40,),
                Text("Sepet boş\n Oyunları keşfet...", style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(1.3, Padding(
            padding: const EdgeInsets.all(20.0),
            child: DottedBorder(
              color: Colors.grey.shade400,
              dashPattern: [10, 10],
              padding: EdgeInsets.all(0),
              child: Container()
            ),
          )),
          FadeAnimation(1.3, Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Toplam', style: TextStyle(fontSize: 20)),
                Text('$totalPrice\₺', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          )),
          const SizedBox(height: 10),
          FadeAnimation(1.4, Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
              },
              height: 50,
              elevation: 0,
              splashColor: Colors.yellow[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.yellow[800],
              child: const Center(
                child: Text("Ödeme", style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            ),
          ))
        ]
      )      
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
          margin: EdgeInsets.only(bottom: 20),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${SharedPref.cartGameList[game]?.store?.name ?? "-"} ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          '${SharedPref.cartGameList[game]?.price ?? 0.0}\₺',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
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
