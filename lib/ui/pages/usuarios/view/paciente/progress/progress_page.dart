import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/paciente/progress/chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final _chart = const ChartPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlue.shade200,
                  foregroundColor: Colors.white,
                  heroTag: null,
                  onPressed: () {},
                  child: const Icon(
                    FontAwesomeIcons.house,
                    size: 24,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlue.shade200,
                  foregroundColor: Colors.white,
                  heroTag: null,
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlue.shade200,
                  foregroundColor: Colors.white,
                  heroTag: null,
                  onPressed: () {},
                  child: const Icon(
                    FontAwesomeIcons.noteSticky,
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: _appbar(),
      body: Hero(tag: 'progreso', child: _body()),
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(20),
          shadowColor: Colors.black,
          child: Column(
            children: [
              _chart,
            ],
          ),
        ),
        const Text("Progreso del año"),
      ],
    );
  }

  // Appbar
  AppBar _appbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.popRoute();
                },
              ));
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  // Appbar de navegación inferior, su uso realmente es hacer espacio
  Widget _bottomAppBar() {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      color: Colors.black,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Text(
                    "Casa",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
