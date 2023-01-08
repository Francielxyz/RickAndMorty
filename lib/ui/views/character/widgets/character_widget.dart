import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../character_controller.dart';
import '../character_page.dart';

class CharacterWidget extends State<CharacterPage> {
  final ScrollController _scrollController = ScrollController();
  final CharacterController _controller = CharacterController();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    findAllCharacters(context);
  }

  Future<void> findAllCharacters(BuildContext context) async {
    await _controller.findAllCharacter(context).then((value) => setState(
          () {
            _controller.characters = value;
            loading = false;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: loading
            ? Center(
                child: LoadingAnimationWidget.discreteCircle(
                  color: Colors.red,
                  secondRingColor: Colors.blue,
                  thirdRingColor: Colors.green,
                  size: 40,
                ),
              )
            : SizedBox(
                width: size.width,
                height: size.height,
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 25),
                          width: constraints.maxWidth,
                          height: constraints.maxHeight / 12,
                          child: Text(
                            "Rick and Morty",
                            style: GoogleFonts.amaticSc(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: constraints.maxWidth,
                            child: GridView.count(
                              controller: _scrollController,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics(),
                              ),
                              crossAxisCount: 2,
                              children: List.generate(
                                _controller.characters!.length,
                                (index) {
                                  return Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        _controller.characters![index].name,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
