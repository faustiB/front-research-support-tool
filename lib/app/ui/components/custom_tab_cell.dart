import 'package:flutter/material.dart';
import 'package:research_support_tool/app/models/journal_model.dart';
import 'package:research_support_tool/app/models/special_issues_model.dart';


class CustomTabCell extends StatefulWidget {
  const CustomTabCell({
    Key? key,
    required this.journal,
    required this.specialIssue,
  }) : super(key: key);

  final JournalModel? journal;
  final SpecialIssuesModel? specialIssue;

  @override
  State<CustomTabCell> createState() => _CustomTabCellState();
}

class _CustomTabCellState extends State<CustomTabCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: handleCell()
    );
  }

  Column? handleCell() {
    if (widget.journal != null) {
      return Column(
        children: [
          ListTile(
            title: Text(widget.journal!.title),
            subtitle: Text(widget.journal!.description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Quartile: ${widget.journal!.quartile}"),
              Text("Year: ${widget.journal!.quartileYear}"),
              Text("ISSN: ${widget.journal!.issn}"),
            ],
          ),
        ],
      );
    } else if (widget.specialIssue != null) {
      return Column(
        children: [
          ListTile(
            title: Text(widget.specialIssue!.title),
            subtitle: Text(widget.specialIssue!.description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Journal: ${widget.specialIssue!.journal}"),
              Text("section: ${widget.specialIssue!.section}"),
            ],
          ),
        ],
      );
    }
    return null;
  }
}
