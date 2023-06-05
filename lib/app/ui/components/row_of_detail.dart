/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'package:flutter/material.dart';

class RowOfDetail extends StatelessWidget {
  final String title;
  final String content;

  const RowOfDetail({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          alignment: Alignment.centerLeft,
          child: Text(title, style: Theme.of(context).textTheme.headline4),
        ),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}