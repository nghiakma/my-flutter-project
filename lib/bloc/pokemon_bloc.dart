


import 'dart:io';

import 'package:day17_pokedex_app_2/bloc/pokemon_event.dart';
import 'package:day17_pokedex_app_2/bloc/pokemon_state.dart';

import 'package:day17_pokedex_app_2/data/pokemon_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent,PokemonState>{
      final _pokemonRepository = PokemonRepository();
      PokemonBloc():super(PokemonInitial()){
        //dang ky xu ly event
        on<PokemonPageRequest>(_onPostEvent);
      }

         
   
      

  void _onPostEvent(PokemonEvent event, Emitter<PokemonState> emit) async {
    if(event is PokemonPageRequest){
      emit(PokemonLoadInProgress());
        
        try{
          // ignore: unused_local_variable
          final pokemonPageResponse = await _pokemonRepository.getPokemonPage(event.page);
          emit(PokemonPageLoadSuccess(pokemonListings: pokemonPageResponse.pokemonListings, canLoadNextPage: pokemonPageResponse.canLoadNextPage));
        }catch(e){
          emit(PokemonPageLoadFailed(error: exit(0)));
        }
    }
  }
}