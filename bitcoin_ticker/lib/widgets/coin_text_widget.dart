import 'package:flutter/material.dart';

class CoinTextWidget extends StatelessWidget {
  CoinTextWidget({super.key,required this.money});

  String money;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ]
      ),
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      child: Text(
        money,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0
        ),
      ),
    );
  }
}
