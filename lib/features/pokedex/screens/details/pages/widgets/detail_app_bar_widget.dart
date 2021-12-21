import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({Key? key, required this.pokemom, required this.onBack}) : super(key: key);
final Pokemom pokemom;
final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: AppBar(
          elevation: 0,
          backgroundColor: pokemom.baseColor,
          leading: IconButton(onPressed: onBack, icon: Icon(Icons.chevron_left)),
        ));
  }
}
