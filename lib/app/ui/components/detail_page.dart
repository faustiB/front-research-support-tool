//detail view
import 'package:flutter/material.dart';
import 'package:research_support_tool/app/models/journal_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final JournalModel journal;

  const DetailPage({
    super.key,
    required this.journal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(journal.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Text("Description", style: Theme.of(context).textTheme.headline4),
              ),
              Text(
                journal.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              RowOfDetail(
                title: "Editorial: ",
                content: journal.editorial,
              ),
              RowOfDetail(
                title: "ISSN: ",
                content: journal.issn,
              ),
              RowOfDetail(
                title: "ISSN-10: ",
                content: journal.issn10,
              ),
              RowOfDetail(
                title: "ISSN-13: ",
                content: journal.issn13,
              ),
              RowOfDetail(
                title: "Quartile: ",
                content: journal.quartile,
              ),
              RowOfDetail(
                title: "Quartile Year: ",
                content: journal.quartileYear.toString(),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    alignment: Alignment.centerLeft,
                    child: Text("Quartile Website: ", style: Theme.of(context).textTheme.headline4),
                  ),
                  InkWell(
                    child: Text(
                      journal.quartileWebpage,
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () async {
                      launchUrl(Uri.parse(journal.quartileWebpage));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
