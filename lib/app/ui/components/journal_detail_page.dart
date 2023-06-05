//detail view
import 'package:flutter/material.dart';
import 'package:research_support_tool/app/models/journal_model.dart';
/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'package:url_launcher/url_launcher.dart';
import 'package:research_support_tool/app/ui/components/row_of_detail.dart';

class JournalDetailPage extends StatelessWidget {
  final JournalModel journal;

  const JournalDetailPage({
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

