import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/commom/repositories/pokemom_repository.dart';
import 'package:flutter_pokedex/features/pokedex/route.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
     
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(repository: PokemomRepository(
        dio: Dio(),
        ),
      )
    );
  }
}


