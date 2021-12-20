import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      backgroundColor: cardColor,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Text(
                        '${args.name}',
                        style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 100,
                      child: ListView.builder(
                        itemCount: args.type?.length ?? 0,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
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
                    Text(
                      'Height: ${args.height}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Text(
                      'Weight: ${args.weight}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Image.asset(
                'assets/images/pokeball10w.png',
                height: 200,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.network(
                '${args.img}',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
