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
      //TODO: Modify view. This is just for testing purposes
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Text("Description",
                    style: Theme.of(context).textTheme.headline4),
              ),
              Text(
                journal.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 16,bottom: 16),
                    alignment: Alignment.centerLeft,
                    child: Text("Editorial: ",
                        style: Theme.of(context).textTheme.headline4),
                  ),
                  Text(
                    journal.editorial,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16,bottom: 16),
                        alignment: Alignment.centerLeft,
                        child: Text("ISSN: ",
                            style: Theme.of(context).textTheme.headline4),
                      ),
                      Text(
                        journal.issn,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16,bottom: 16),
                        alignment: Alignment.centerLeft,
                        child: Text("ISSN-10: ",
                            style: Theme.of(context).textTheme.headline4),
                      ),
                      Text(
                        journal.issn10,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16,bottom: 16),
                        alignment: Alignment.centerLeft,
                        child: Text("ISSN-13: ",
                            style: Theme.of(context).textTheme.headline4),
                      ),
                      Text(
                        journal.issn13,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16,bottom: 16),
                        alignment: Alignment.centerLeft,
                        child: Text("Quartile: ",
                            style: Theme.of(context).textTheme.headline4),
                      ),
                      Text(
                        journal.quartile,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16,bottom: 16),
                        alignment: Alignment.centerLeft,
                        child: Text("Quartile Year: ",
                            style: Theme.of(context).textTheme.headline4),
                      ),
                      Text(
                        journal.quartileYear.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16,bottom: 16),
                        alignment: Alignment.centerLeft,
                        child: Text("Quartile Website: ",
                            style: Theme.of(context).textTheme.headline4),
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
            ],
          ),
        ),
      ),
    );
  }
}
