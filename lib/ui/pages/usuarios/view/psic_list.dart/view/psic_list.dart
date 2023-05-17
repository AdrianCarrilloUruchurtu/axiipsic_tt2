import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/psic_list.dart/view/psic_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListPsicPage extends StatelessWidget {
  const ListPsicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authMobx = getIt.get<AuthMobx>();
    return Observer(
        builder: ((context) => Scaffold(
              appBar: AppBar(
                leading: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: ListView.builder(
                itemBuilder: ((context, index) =>
                    Builder(builder: (BuildContext context) {
                      return authMobx.psicList != null
                          ? PsicItem(
                              psic: authMobx.psicList![index],
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    })),
                itemCount: authMobx.psicList?.length.toInt(),
              ),
            )));
  }

  _appBar(Function()? onTap) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            onTap;
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
