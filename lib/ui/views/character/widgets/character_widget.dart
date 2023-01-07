import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../character_controller.dart';
import '../character_page.dart';

class CharacterWidget extends State<CharacterPage> {
  final CharacterController _controller = CharacterController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.width = MediaQuery
        .of(context)
        .size
        .width;
    _controller.height = MediaQuery
        .of(context)
        .size
        .height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    width: _controller.width,
                    height: 400,
                    color: Colors.white,
                    child: Text("Rick and Morty",
                        style: GoogleFonts.amaticSc(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
