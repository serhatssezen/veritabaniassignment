import 'dart:async';

import 'package:assignment/di/repository/user_repository.dart';
import 'package:assignment/pages/payment_success.dart';
import 'package:flutter/material.dart';

import '../animation/FadeAnimation.dart';
import '../di/service_locator.dart';
import '../models/PaymentType.dart';

class PaymentPage extends StatefulWidget {
  double? totalPrice;
  List<int> gameId;
  PaymentPage({ Key? key, required this.totalPrice, required this.gameId }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentType activeCard = PaymentType.CREDIT_CARD;
  bool _isLoading = false;
  late Timer _timer;
  final userRepository = getIt.get<UserRepository>();
  String walletPrice = "0";

  pay() {
    setState(() {
      _isLoading = true;
    });
    userRepository.buyGame(1, widget.gameId, widget.totalPrice ?? 0, activeCard).then((value)  {
      setState(() {
        _isLoading = false;
        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSuccess()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Ödeme', style: TextStyle(color: Colors.black),),
        leading: const BackButton(color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              activeCard == PaymentType.CREDIT_CARD ?
              FadeAnimation(1.2, AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: activeCard == PaymentType.CREDIT_CARD ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.yellow.shade800,
                        Colors.yellow.shade900,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kredi kartı", style: TextStyle(color: Colors.white),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("**** **** **** 7890", style: TextStyle(color: Colors.white, fontSize: 30),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Aydın Serhat SEZEN", style: TextStyle(color: Colors.white),),
                              Image.network('https://img.icons8.com/color/2x/mastercard-logo.png', height: 50),
                            ],
                          )
                        ],
                      )
                    ]
                  ),
                ),
              )) :
              FadeAnimation(1.2, AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: activeCard == PaymentType.PayWallet ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.grey.shade200
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade200,
                        Colors.grey.shade100,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$walletPrice₺", style: const TextStyle(color: Colors.black, fontSize: 24)),
                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text("Aydın Serhat SEZEN", style: TextStyle(color: Colors.black, fontSize: 18),),
                              Image.network('https://img.icons8.com/ios/2x/sim-card-chip.png', height: 35,),
                            ],
                          )
                        ],
                      )
                    ]
                  ),
                ),
              )),
              const SizedBox(height: 50,),
              FadeAnimation(1.2, const Text("Ödeme Yöntemi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
              const SizedBox(height: 20,),
              FadeAnimation(1.3, Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        activeCard = PaymentType.CREDIT_CARD;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: activeCard == PaymentType.CREDIT_CARD ? Border.all(color: Colors.grey.shade300, width: 1)
                          : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
                      ),
                      child: Image.network('https://img.icons8.com/color/2x/mastercard-logo.png', height: 50,),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await userRepository.getWallet("1").then((value) {
                        walletPrice = value.toString();
                      });
                      setState(() {
                        activeCard = PaymentType.PayWallet;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: activeCard == PaymentType.PayWallet ? Border.all(color: Colors.grey.shade300, width: 1)
                          : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
                      ),
                      child: Image.network('https://www.citypng.com/public/uploads/preview/paytm-wallet-logo-icon-png-11664330254y205py9hdb.png', height: 50,),
                    ),
                  ),
                ]
              )),
              const SizedBox(height: 30,),
              const SizedBox(height: 100,),
              FadeAnimation(1.5, Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Toplam", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  Text("${widget.totalPrice!}\₺", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              )),
              const SizedBox(height: 30),
              FadeAnimation(1.4, 
                MaterialButton(
                  onPressed: _isLoading ? null : () { pay();  },
                  height: 50,
                  elevation: 0,
                  splashColor: Colors.yellow[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.yellow[800],
                  child: Center(
                    child: _isLoading ? Container(
                      width: 20,
                      height: 20,
                      child: const CircularProgressIndicator(
                        backgroundColor: Colors.white, 
                        strokeWidth: 3,
                        color: Colors.black,
                      ),
                    ) : const Text("Tamamla", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      )
    );
  }
}