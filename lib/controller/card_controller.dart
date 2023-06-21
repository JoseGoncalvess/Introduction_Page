import 'package:flutter/material.dart';

import '../data/data_introduction.dart';
import '../view/secundary_page.dart';

class CardController extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);
  int _page = 0;

  int get indexpage => _page;

  void goPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecundaryPage(),
        ));
  }

  void nextpage(BuildContext context) {
    if (indexpage == introduct.last.id) {
      goPage(context);
    }
    {
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      _page = pageController.page!.floor();
    }
  }

  void onchagepage(int value) {
    _page = value;
    pageController.animateToPage(indexpage,
        duration: const Duration(milliseconds: 700), curve: Curves.decelerate);
    notifyListeners();
  }
}
