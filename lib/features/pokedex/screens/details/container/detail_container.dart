import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/error/failure.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';
import 'package:flutter_pokedex/commom/repositories/pokemom_repository.dart';
import 'package:flutter_pokedex/commom/widgets/po_error.dart';
import 'package:flutter_pokedex/commom/widgets/po_loading.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/pages/detail_page.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/home_error.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/home_loading.dart';

class DetailArguments {
  DetailArguments({this.index = 0, required this.pokemom});
  final Pokemom pokemom;
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer(
      {Key? key,
      required this.repository,
      required this.arguments,
      required this.onBack})
      : super(key: key);
  final IPokemomRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<Pokemom>> _future;
  Pokemom? _pokemom;

  @override
  void initState() {
    _controller = PageController(
        viewportFraction: 0.6, initialPage: widget.arguments.index!);
    _future = widget.repository.getAllPokemom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemom>>(
        future: _future,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return PoLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            _pokemom ??= widget.arguments.pokemom;
            return DetailPage(
              pokemom: _pokemom!,
              list: snapshot.data!,
              onBack: widget.onBack,
              controller: _controller,
              onChangePokemom: (Pokemom value) {
                setState(() {
                  _pokemom = value;
                });
              },
            );
          }

          if (snapshot.hasError) {
            return PoError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
