import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget({
    Key? key,
    required this.isDiff,
    required this.pokemom,
  }) : super(key: key);

  final bool isDiff;
  final Pokemom pokemom;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          tween:
              Tween<double>(begin: isDiff ? 300 : 150, end: isDiff ? 150 : 300),
          builder: (context, value, child) {
            return Image.network(
              pokemom.image,
              width: value,
              fit: BoxFit.contain,
              color: isDiff ? Colors.black.withOpacity(0.4) : null,
            );
          },
        ),
      ),
    );
  }
}
