import 'package:day17_pokedex_app_2/bloc/pokemon_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int?>{
   PokemonDetailsCubit pokemonDetailsCubit;

   NavCubit({required this.pokemonDetailsCubit}) : super(null);

   void showPokemonDetails(int pokemonId){
    
     pokemonDetailsCubit.getPokemonDetails(pokemonId);
       emit(pokemonId);
   }

   void popToPokedex(){
     emit(null);
     pokemonDetailsCubit.clearPokemonDetails();
   }
  
}