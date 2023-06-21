import 'package:flutter/material.dart';
import 'package:introducty/controller/card_controller.dart';

import '../../data/data_introduction.dart';
import 'widgets/card_info_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = CardController();

  @override
  void initState() {
    _controller.pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _controller.indexpage == 2
                      ? Container()
                      : GestureDetector(
                          onTap: () => _controller.goPage(context),
                          child: Container(
                              child: Text(
                            'Pular',
                            style: TextStyle(
                                color: const Color(0xFF5A0F8F),
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold),
                          )))
                ],
              ),
            ),
            Expanded(
                child: PageView.builder(
                    onPageChanged: (value) => _controller.onchagepage(value),
                    controller: _controller.pageController,
                    itemCount: introduct.length,
                    padEnds: true,
                    itemBuilder: (context, index) {
                      return CardInfoWidget(
                        index: index,
                        img: introduct[index].img,
                        texto: introduct[index].text,
                        titulo: introduct[index].titulo,
                      );
                    })),
            _tongle(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * 0.7,
                height: height * 0.06,
                child: ElevatedButton(
                    onPressed: () => _controller.nextpage(context),
                    child: Text(
                        _controller.indexpage == 2 ? 'Finalizar' : 'Proximo')),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tongle() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: introduct
            .map((e) => AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  margin: const EdgeInsets.all(3),
                  width: _controller.indexpage == e.id ? 25 : 12,
                  height: _controller.indexpage == e.id ? 10 : 12,
                  decoration: BoxDecoration(
                      color: _controller.indexpage == e.id
                          ? const Color(0xFF5A0F8F)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(30)),
                ))
            .toList());
  }
}
