import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
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
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;
  bool isOnTop = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
            setState(() {
              if (scrollController.position.pixels > 27) {
                isOnTop = false;
              } else if (scrollController.position.pixels <= 36) {
                isOnTop = true;
              }
            });
          return false;
        },
      child: CustomScrollView(
        controller: scrollController,
        physics: ClampingScrollPhysics(),
        slivers: [
          DetailAppBarWidget(
            pokemom: widget.pokemom,
            onBack: widget.onBack,
            isOnTop: isOnTop,
          ),
          DetailListWidget(
            pokemom: widget.pokemom,
            list: widget.list,
            controller: widget.controller,
            onChangePokemom: widget.onChangePokemom,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    color: widget.pokemom.baseColor,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    )

        /*  body: Stack(
      children: [
        DetailAppBarWidget(
          pokemom: pokemom,
          onBack: onBack,
        ),
       
      ],
    ) */

        );
  }
}
