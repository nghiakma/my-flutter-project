import 'package:day17_pokedex_app_2/data/pokemon_details.dart';
import 'package:day17_pokedex_app_2/data/pokemon_info_response.dart';
import 'package:day17_pokedex_app_2/data/pokemon_respository.dart';
import 'package:day17_pokedex_app_2/data/pokemon_species_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails?>{

  final _pokemonRepository = PokemonRepository();
      PokemonDetailsCubit():super(null);

      void getPokemonDetails(int pokemonId) async{
        final responses = await Future.wait([
          _pokemonRepository.getPokemonInfo(pokemonId),
          _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
        ]);
       final pokemonInfo = responses[0] as PokemonInfoRespone;
       final speciesInfo = responses[1]  as PokemonSpeciesInfoResponse;

     emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
      }

      void clearPokemonDetails() => emit(null);
}