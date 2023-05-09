import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:flutter/material.dart';

class SingleMessageItem extends StatelessWidget {
  final String message;
  final String messageSenderId;
  const SingleMessageItem(
      {super.key, required this.message, required this.messageSenderId});
  @override
  Widget build(BuildContext context) {
    final authMobx = getIt.get<AuthMobx>();
    return Row(
      mainAxisAlignment: authMobx.user?.id == messageSenderId
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 200),
            decoration: BoxDecoration(
                color: authMobx.user?.id == messageSenderId
                    ? Colors.blueGrey
                    : Colors.blueAccent,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
