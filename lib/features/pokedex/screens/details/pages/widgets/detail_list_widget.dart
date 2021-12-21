import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';

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
    return Positioned(
      top: 84,
      left: 0,
      right: 0,
      height: 350,
      child: Container(
        color: pokemom.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                height: 200,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) =>
                    onChangePokemom(list[index])
                  ,
                  controller: controller,
                  children: list
                      .map((e){ 
                        bool dif = e.name != pokemom.name;
                        return  AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: dif ? 0.4 : 1.0 ,
                        child: TweenAnimationBuilder<double>(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          tween: Tween<double>(
                            begin: dif ? 300 : 150,
                            end:  dif? 150 : 300),
                          builder: (context,value,child) {
                            return Center(
                              child: Image.network(
                                    e.image,
                                    width: value,
                                    fit:  BoxFit.contain,
                                    color:  dif ? Colors.black.withOpacity(0.4) : null,
                                  ),
                            );
                          }, 
                        ),
                      );}
                    )
                      .toList(),
                ))
          ],
        ),
      ),
    );
  }
}
