import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemomItemWidget extends StatelessWidget {
  const PokemomItemWidget({
    Key? key,
    required this.pokemom,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  final Pokemom pokemom;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () => onTap('/details', DetailArguments(pokemom: pokemom, index: index)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: pokemom.baseColor!.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemom.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                      Text(
                        '#${pokemom.num}',
                         style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        
                        ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            pokemom.type.map((e) => TypeWidget(name: e)).toList(),
                      ),
                       Flexible(
                         child: Container(
                           width: 100,
                           height: 100,
                         )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
            Positioned(
              bottom: 20,
              right: pokemom.num != '042' ? 0 : -6,
              child: Image.network(
                pokemom.image,
               height: 100,
              )
            ),
        ],
      ),
    );
  }
}
