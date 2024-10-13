import 'package:flutter/material.dart';

class CardPadrao extends StatelessWidget {
  CardPadrao({required this.cor, this.filhoCartao});

  final Color cor;
  final Widget? filhoCartao;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cor,
      ),
      child: filhoCartao,
    );
  }
}