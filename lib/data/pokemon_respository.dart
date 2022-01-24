
import 'dart:convert';

import 'package:day17_pokedex_app_2/data/pokemon_info_response.dart';
import 'package:day17_pokedex_app_2/data/pokemon_page_response.dart';
import 'package:day17_pokedex_app_2/data/pokemon_species_info.dart';
import 'package:http/http.dart' as http;

class PokemonRepository{
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  //lay chi muc rieng biet cua trang

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async{
       //pokemon?limit = 200 & offset = 400

       final queryParameters = {
         'limit': '200',
         'offset': (pageIndex * 200).toString()
       };

       final uri = Uri.https(baseUrl,'/api/v2/pokemon',queryParameters );
//chung toi nhan dc phan hoi lai va bien no thanh json chuyen json do thanh cua chung toi
       final response = await client.get(uri);
       final json = jsonDecode(response.body);
       //tra ve phan hoi trang tu ham tao json
       return PokemonPageResponse.fromJson(json);
  }   


  Future<PokemonInfoRespone> getPokemonInfo(int pokemonId) async{
    final uri = Uri.http(baseUrl, '/api/v2/pokemon/$pokemonId');


      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      // ignore: avoid_print
      return PokemonInfoRespone.fromjson(json);

  } 


  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(int pokemonId) async{
    final uri = Uri.http(baseUrl, '/api/v2/pokemon-species/$pokemonId');


      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      // ignore: avoid_print
      return PokemonSpeciesInfoResponse.fromJson(json);

  }      


}