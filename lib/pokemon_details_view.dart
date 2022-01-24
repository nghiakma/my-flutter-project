import 'package:day17_pokedex_app_2/bloc/pokemon_details_cubit.dart';
import 'package:day17_pokedex_app_2/data/pokemon_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails?>(
        builder: (context, details) {
         return details != null
              ? Center(
                  child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(details.imageUrl),
                              Text(details.name),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: details.types
                                    .map((type) => _pokemonTypeView(type))
                                    .toList(),
                              ),
                              Text(
                                  'ID: ${details.id}  -  Weight: ${details.weight}  -  Height: ${details.height}')
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                details.description,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ))
                  ],
                ))
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _pokemonTypeView(String type) {
    Color color;

    switch (type) {
      case 'normal':
        color = const Color(0xFFbdbeb0);
        break;
      case 'poison':
        color = const Color(0xFF995E98);
        break;
      case 'psychic':
        color = const Color(0xFFE96EB0);
        break;
      case 'grass':
        color = const Color(0xFF9CD363);
        break;
      case 'ground':
        color = const Color(0xFFE3C969);
        break;
      case 'ice':
        color = const Color(0xFFAFF4FD);
        break;
      case 'fire':
        color = const Color(0xFFE7614D);
        break;
      case 'rock':
        color = const Color(0xFFCBBD7C);
        break;
      case 'dragon':
        color = const Color(0xFF8475F7);
        break;
      case 'water':
        color = const Color(0xFF6DACF8);
        break;
      case 'bug':
        color = const Color(0xFFC5D24A);
        break;
      case 'dark':
        color = const Color(0xFF886958);
        break;
      case 'fighting':
        color = const Color(0xFF9E5A4A);
        break;
      case 'ghost':
        color = const Color(0xFF7774CF);
        break;
      case 'steel':
        color = const Color(0xFFC3C3D9);
        break;
      case 'flying':
        color = const Color(0xFF81A2F8);
        break;
      case 'fairy':
        color = const Color(0xFFEEB0FA);
        break;
      default:
        color = Colors.black;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color, borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          type.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}