import 'package:flutter/material.dart';

class StarNowPageProvider extends ChangeNotifier {
  int _paginaActual = 0;
  int get getPaginaActual => _paginaActual;
  set setPaginaActual(int paginaActual) {
    if (paginaActual > 2) {
      _paginaActual = 2;
      moverPageController(2);
      moverPageControllerView2(2);
      moverPageControllerView3(2);
      moverPageControllerView4(2);

      moverPageControllerText1(2);
      moverPageControllerText2(2);
      moverPageControllerText3(2);
      notifyListeners();
    } else if (paginaActual < 0) {
      _paginaActual = 0;
      moverPageController(0);
      moverPageControllerView2(0);
      moverPageControllerView3(0);
      moverPageControllerView4(0);

      moverPageControllerText1(0);
      moverPageControllerText2(0);
      moverPageControllerText3(0);
      notifyListeners();
    } else {
      _paginaActual = paginaActual;
      moverPageController(paginaActual);
      moverPageControllerView2(paginaActual);
      moverPageControllerView3(paginaActual);
      moverPageControllerView4(paginaActual);

      moverPageControllerText1(paginaActual);
      moverPageControllerText2(paginaActual);
      moverPageControllerText3(paginaActual);
      notifyListeners();
    }
  }

  final PageController _pageControllerView1 = PageController(initialPage: 0);
  PageController get getPageControllerView1 => _pageControllerView1;
  void moverPageController(int pagina) async {
    Future.delayed(
      const Duration(milliseconds: 1050),
      () => _pageControllerView1.animateToPage(pagina,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
    );
  }

  final PageController _pageControllerView2 = PageController(initialPage: 0);
  PageController get getPageControllerView2 => _pageControllerView2;
  void moverPageControllerView2(int pagina) async {
    Future.delayed(
      const Duration(milliseconds: 700),
      () => _pageControllerView2.animateToPage(pagina,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
    );
  }

  final PageController _pageControllerView3 = PageController(initialPage: 0);
  PageController get getPageControllerView3 => _pageControllerView3;
  void moverPageControllerView3(int pagina) {
    _pageControllerView3.animateToPage(pagina,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  final PageController _pageControllerView4 = PageController(initialPage: 0);
  PageController get getPageControllerView4 => _pageControllerView4;
  void moverPageControllerView4(int pagina) async {
    Future.delayed(
      const Duration(milliseconds: 350),
      () => _pageControllerView4.animateToPage(pagina,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
    );
  }

  //!                                      Inicio de los pagecontroller de TEXTO
  final PageController _pageControllerText1 = PageController(initialPage: 0);
  PageController get getPageControllerText1 => _pageControllerText1;
  void moverPageControllerText1(int pagina) {
    _pageControllerText1.animateToPage(pagina,
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

  final PageController _pageControllerText2 = PageController(initialPage: 0);
  PageController get getPageControllerText2 => _pageControllerText2;
  void moverPageControllerText2(int pagina) async {
    Future.delayed(
      const Duration(milliseconds: 150),
      () => _pageControllerText2.animateToPage(pagina,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut),
    );
  }

  final PageController _pageControllerText3 = PageController(initialPage: 0);
  PageController get getPageControllerText3 => _pageControllerText3;
  void moverPageControllerText3(int pagina) async {
    Future.delayed(
      const Duration(milliseconds: 300),
      () => _pageControllerText3.animateToPage(pagina,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut),
    );
  }
}
