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