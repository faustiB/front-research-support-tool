/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'package:flutter/material.dart';

class CustomMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomMenuItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
