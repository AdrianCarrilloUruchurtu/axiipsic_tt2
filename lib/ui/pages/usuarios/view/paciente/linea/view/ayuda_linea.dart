import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AyudaPage extends StatelessWidget {
  const AyudaPage({super.key});

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
      body: _body(),
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
}

Widget _body() {
  return SafeArea(
    child: Column(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                height: 50,
                color: Colors.transparent,
                child: const Center(
                    child: Text(
                        'En caso de necesitar ayuda inmediata por favor contacta con los siguientes medios:')),
              ),
              Container(
                height: 50,
                color: Colors.transparent,
                child: const Center(child: Text('Línea de la vida:')),
              ),
              Container(
                  height: 50,
                  color: Colors.lightBlue.shade50,
                  child: const Column(
                    children: [
                      Icon(Icons.phone),
                      Center(child: Text('800 911 2000')),
                    ],
                  )),
              Container(
                  height: 50,
                  color: Colors.lightBlue.shade50,
                  child: const Column(
                    children: [
                      Icon(Icons.facebook),
                      Center(child: Text('@LaLineaDeLaVidaMx')),
                    ],
                  )),
              Container(
                  height: 50,
                  color: Colors.lightBlue.shade50,
                  child: const Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.twitter,
                      ),
                      Center(child: Text('@LaLineaDe LaVida')),
                    ],
                  )),
              Container(
                  height: 50,
                  color: Colors.lightBlue.shade50,
                  child: const Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendarXmark,
                      ),
                      Center(child: Text('Lunes a domingo')),
                    ],
                  )),
              Container(
                  height: 50,
                  color: Colors.lightBlue.shade50,
                  child: const Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.clock,
                      ),
                      Center(child: Text('24 horas')),
                    ],
                  )),
              Container(
                  height: 150,
                  color: Colors.lightBlue.shade50,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FontAwesomeIcons.userGroup,
                      ),
                      Center(
                          child: Text(
                              overflow: TextOverflow.clip,
                              'Público general | Atención especialiazada sobre consumo de sustiancias | Riesgo suicida | Violencia')),
                    ],
                  )),
            ],
          ),
        )
      ],
    ),
  );
}
