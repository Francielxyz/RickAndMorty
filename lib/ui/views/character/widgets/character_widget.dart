import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/ui/shared/utils/validation.dart';

import '../../../shared/styles/app_colors.dart';
import '../../../shared/widgets/loading/loading_animation.dart';
import '../character_controller.dart';
import '../character_page.dart';

class CharacterWidget extends State<CharacterPage> {
  late ScrollController _scrollController;
  late CharacterController _controller;
  final scrollLoading = ValueNotifier(true);
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _controller = CharacterController();
    _scrollController = ScrollController();
    _scrollController.addListener(infiniteScrolling);
    findAllCharacters();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void infiniteScrolling() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !loading) {
      findAllCharacters();
    }
  }

  Future<void> findAllCharacters() async {
    scrollLoading.value = true;
    await _controller.findAllCharacter().then((value) => setState(
          () {
            _controller.characters.addAll(value!);
            loading = false;
            scrollLoading.value = false;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Column(
                children: [
                  title(constraints),
                  loading
                      ? const LoadingAnimation()
                      : gridView(constraints, size),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget title(BoxConstraints constraints) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 25),
      width: constraints.maxWidth,
      height: constraints.maxHeight / 12,
      child: Text(
        "Rick and Morty",
        style: GoogleFonts.amaticSc(
          fontSize: 55,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget gridView(BoxConstraints constraints, Size size) {
    return Expanded(
      child: SizedBox(
        width: constraints.maxWidth,
        child: AnimatedBuilder(
          animation: _scrollController,
          builder: (context, snapshot) {
            return Stack(
              children: [
                ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: _controller.characters!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withOpacity(0.12),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            photoCharacter(index),
                            infoCharacter(index),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                loadingIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget photoCharacter(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        _controller.characters![index].image,
        height: 140,
        width: 140,
      ),
    );
  }

  Widget infoCharacter(int index) {
    return Flexible(
      flex: 1,
      child: Container(
        height: 110,
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _controller.characters![index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Validation.verifyStatus(
                        _controller.characters![index].status,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    _controller.characters![index].status,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingIndicator() {
    return ValueListenableBuilder(
      valueListenable: scrollLoading,
      builder: (context, bool isLoading, _) {
        return (isLoading)
            ? Container(
                padding: const EdgeInsets.only(bottom: 30),
                alignment: Alignment.bottomCenter,
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                      ),
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
