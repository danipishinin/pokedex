import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/modules/pokemon_list/domain/usecases/usecase_ui.dart';

class CardPokemon extends StatelessWidget {
  UseCaseUI _useCaseUI = UseCaseUI();
  List? elements;
  String? name;
  String? id;

  CardPokemon({
    Key? key,
    this.elements,
    this.name,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? cardColor = _useCaseUI.getColorByType(elements![0]);
    return Container(
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
              '$name',
              style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 30,
                  child: ListView.builder(
                    itemCount: elements?.length ?? 0,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.all(3.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          '${elements![i]}',
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
                        'https://www.serebii.net/pokemon/art/${id}.png',
                        height: 80,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
