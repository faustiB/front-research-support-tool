import 'package:flutter/material.dart';
import 'package:research_support_tool/app/models/journal_model.dart';

class CustomTabCell extends StatefulWidget {
  const CustomTabCell({
    Key? key,
    required this.journal,
  }) : super(key: key);

  final JournalModel journal;

  @override
  State<CustomTabCell> createState() => _CustomTabCellState();
}

class _CustomTabCellState extends State<CustomTabCell> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(widget.journal.title),
              subtitle: Text(widget.journal.description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Quartile: ${widget.journal.quartile}"),
                Text("ISSN: ${widget.journal.issn}"),
              ],
            ),
          ],
        )
      ),
    );
  }
}
