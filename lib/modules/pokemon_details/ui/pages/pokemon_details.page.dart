import 'package:flutter/material.dart';
import 'package:pokedex/modules/pokemon_details/ui/controllers/pokemon_details.controller.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemon_dto.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonDetailsController _controller = PokemonDetailsController();
    final args = ModalRoute.of(context)!.settings.arguments as PokemonDTO;
    Color? cardColor = _controller.getColorCard(args.type![0]);
    return Container(
      width: 100,
      color: cardColor,
      child: Column(
        children: [
          Text('${args.name}'),
          Text('${args.id}'),
          Text('${args.img}'),
          Container(
            width: 80,
            height: 110,
            child: ListView.builder(
              itemCount: args.type?.length ?? 0,
              itemBuilder: (context, i) {
                return Container(
                  margin: const EdgeInsets.all(3.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(
                    '${args.type![i]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
