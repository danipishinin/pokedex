import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/modules/pokemon_list/infra/dtos/pokemon_dto.dart';

class CardPokemon extends StatefulWidget {
  final PokemonDTO pokemon;
  final Color color;

  CardPokemon({
    Key? key,
    required this.pokemon,
    required this.color,
  }) : super(key: key);

  @override
  _CardPokemonState createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon>
    with TickerProviderStateMixin {
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: new Duration(milliseconds: 3000),
      vsync: this,
    );
    _animation.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _animation.stop();
      });
    });
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/pokemon-details',
            arguments: widget.pokemon);
      },
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Container(
          margin: const EdgeInsets.all(6.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: widget.color,
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
                        AnimatedBuilder(
                            animation: _animation,
                            child: Image.asset(
                              'assets/images/pokeball10w.png',
                              height: 100,
                              width: 100,
                            ),
                            builder: (BuildContext context, Widget? child) {
                              return Transform.rotate(
                                angle: _animation.value * 2 * math.pi,
                                child: child,
                              );
                            }),
                        Image.network(
                          '${widget.pokemon.img}',
                          height: 80,
                        ),
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
