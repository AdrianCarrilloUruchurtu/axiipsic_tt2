import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          title: 'Bienvenido a AxiiPsic', body: 'Una aplicación para si'),
      PageViewModel(
          title: 'Bienvenido a AxiiPsic', body: 'Una aplicación para si'),
      PageViewModel(
          title: 'Bienvenido a AxiiPsic', body: 'Una aplicación para si'),
      PageViewModel(
          title: 'Bienvenido a AxiiPsic', body: 'Una aplicación para si'),
      PageViewModel(
          title: 'Bienvenido a AxiiPsic', body: 'Una aplicación para si'),
      PageViewModel(
          title: 'Bienvenido a AxiiPsic', body: 'Una aplicación para si'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      showBackButton: true,
      //showSkipButton: true,
      skip: const Text('Saltar'),
      next: const Text('Siguiente'),
      back: const Text('Anterior'),
      done: const Text(
        'Listo',
        style: TextStyle(color: Colors.black),
      ),
      onDone: () {},
      pages: getPages(),
      globalBackgroundColor: Colors.white,
    ));
  }
}
