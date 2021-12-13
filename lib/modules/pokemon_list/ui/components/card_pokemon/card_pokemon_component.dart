import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/modules/pokemon_list/domain/usecases/usecase_ui.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemon_dto.dart';

class CardPokemon extends StatefulWidget {
  final PokemonDTO pokemon;

  CardPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  _CardPokemonState createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  UseCaseUI _useCaseUI = UseCaseUI();

  @override
  Widget build(BuildContext context) {
    Color? cardColor = _useCaseUI.getColorByType(widget.pokemon.type![0]);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/pokemon-details');
      },
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Container(
          margin: const EdgeInsets.all(6.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${widget.pokemon.name}',
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 110,
                    child: ListView.builder(
                      itemCount: widget.pokemon.type?.length ?? 0,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.all(3.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text(
                            '${widget.pokemon.type![i]}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Image.asset(
                          'assets/images/pokeball10w.png',
                          height: 100,
                        ),
                        Image.network(
                          '${widget.pokemon.img}',
                          height: 80,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
