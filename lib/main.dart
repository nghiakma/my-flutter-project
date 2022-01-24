import 'package:day17_pokedex_app_2/app_navigator.dart';
import 'package:day17_pokedex_app_2/bloc/nav_cubit.dart';
import 'package:day17_pokedex_app_2/bloc/pokemon_bloc.dart';
import 'package:day17_pokedex_app_2/bloc/pokemon_details_cubit.dart';
import 'package:day17_pokedex_app_2/bloc/pokemon_event.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   final pokemonDetailCubit = PokemonDetailsCubit();

     MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context)
      .copyWith(primaryColor: Colors.red, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.redAccent)),
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PokemonBloc()..add(PokemonPageRequest(page: 0))),
        BlocProvider(create: (context)=> NavCubit(pokemonDetailsCubit: pokemonDetailCubit)),
        BlocProvider(create: (context) => pokemonDetailCubit)
        ],
        child: const AppNavigator(),
      ),
    );
  }
}
