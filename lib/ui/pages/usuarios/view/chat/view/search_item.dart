import 'package:flutter/material.dart';

import '../../../../auth/model/user_data.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, this.doc, this.onTap});
  final UserData? doc;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(doc!.nombre),
        subtitle: Text(doc!.email),
        trailing: IconButton(
          icon: const Icon(Icons.message),
          onPressed: onTap,
        ),
      ),
    );
  }
}
