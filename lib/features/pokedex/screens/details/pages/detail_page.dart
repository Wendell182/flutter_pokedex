import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.pokemom,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemom,
  }) : super(key: key);

  final Pokemom pokemom;
  final List<Pokemom> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemom> onChangePokemom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DetailAppBarWidget(
          pokemom: pokemom,
          onBack: onBack,
        ),
        DetailListWidget(
          pokemom: pokemom,
          list: list,
          controller: controller,
          onChangePokemom: onChangePokemom,
        )
      ],
    ));
  }
}
