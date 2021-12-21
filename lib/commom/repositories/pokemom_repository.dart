import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/commom/consts/api_consts.dart';
import 'package:flutter_pokedex/commom/error/failure.dart';
import 'package:flutter_pokedex/commom/models/pokemom.dart';

abstract class IPokemomRepository {
   Future<List<Pokemom>> getAllPokemom();
}

class PokemomRepository implements IPokemomRepository{
  final Dio dio;

  PokemomRepository({required this.dio});
  @override
  Future<List<Pokemom>> getAllPokemom () async{
      try {
        final response = await dio.get(ApiConsts.allPokemonsURL);
        final json = jsonDecode(response.data) as Map<String,dynamic>;
        final list = json['pokemon'] as List<dynamic>;
        return list.map((e) => Pokemom.fromMap(e)).toList();
      }catch(e){
        throw Failure(message: 'Não foi possível carregar os dados');
      }
  }
}




