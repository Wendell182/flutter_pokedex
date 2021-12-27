import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({
    Key? key,
    required this.pokemom,
    required this.onBack,
    required this.isOnTop,
  }) : super(key: key);
  final Pokemom pokemom;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: pokemom.baseColor,
      leading: IconButton(onPressed: onBack, icon: Icon(Icons.chevron_left)),
      centerTitle: false,
      title: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: isOnTop ? 0 : 1,
            child: Text(
                pokemom.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
          ),
    );
  }
}
