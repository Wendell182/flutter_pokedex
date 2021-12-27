import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';

import 'detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget(
      {Key? key,
      required this.pokemom,
      required this.list,
      required this.controller,
      required this.onChangePokemom})
      : super(key: key);

  final Pokemom pokemom;
  final List<Pokemom> list;
  final PageController controller;
  final ValueChanged<Pokemom> onChangePokemom;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemom.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemom.name,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    '#${pokemom.num}',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
                height: 300,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) => onChangePokemom(list[index]),
                  controller: controller,
                  children: list.map((e) {
                    bool dif = e.name != pokemom.name;
                    return DetailItemListWidget(
                      isDiff: dif,
                      pokemom: e,
                    );
                  }).toList(),
                ))
          ],
        ),
      ),
    );
  }
}
