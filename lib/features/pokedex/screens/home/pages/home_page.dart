import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/widgets/pokemom_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);

  final List<Pokemom> list;
  final Function(String, DetailArguments) onItemTap;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Pokedex',
            style: TextStyle(
            
              color: Colors.black
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(onPressed: () {},
            
            icon: Icon(Icons.menu,color: Colors.black,)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: list
                .map((e) => PokemomItemWidget(
                      pokemom: e,
                      onTap: onItemTap,
                      index: list.indexOf(e),
                    ))
                .toList()),
      ),
    );
  }
}
