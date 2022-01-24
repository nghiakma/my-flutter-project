import 'package:day17_pokedex_app_2/bloc/nav_cubit.dart';
import 'package:day17_pokedex_app_2/bloc/pokemon_bloc.dart';
import 'package:day17_pokedex_app_2/bloc/pokemon_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('Pokedex'),
       ),
       body: BlocBuilder<PokemonBloc,PokemonState>(
         builder: (context,state){
           if(state is PokemonLoadInProgress){
             return   const Center(
               child: CircularProgressIndicator(),);
           }else if(state is PokemonPageLoadSuccess){
             return GridView.builder(
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
               itemCount: state.pokemonListings.length, 
               itemBuilder: (context, index){
                 return GestureDetector(
                   onTap: ()=> BlocProvider.of<NavCubit>(context).showPokemonDetails(state.pokemonListings[index].id),
                   child: Card(
                     child: GridTile(child: Column(children: [
                        Image.network(state.pokemonListings[index].imageUrl),
                        Text(state.pokemonListings[index].name)
                   ],),),),
                 );
               });
           }else if(state is PokemonPageLoadFailed){
             return Center(
               child: Text(state.error.toString()),
             );

           }else{
             return Container();
           }
         },
       ),
    );
  }
}