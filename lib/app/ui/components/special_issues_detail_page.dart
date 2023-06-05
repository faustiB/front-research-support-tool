/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'package:flutter/material.dart';
import 'package:research_support_tool/app/models/special_issues_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:research_support_tool/app/ui/components/row_of_detail.dart';

class SpecialIssueDetailPage extends StatelessWidget {
  final SpecialIssuesModel specialIssue;

  const SpecialIssueDetailPage({
    super.key,
    required this.specialIssue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(specialIssue.title),
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
                specialIssue.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              RowOfDetail(
                title: "Journal: ",
                content: specialIssue.journal,
              ),
              RowOfDetail(
                title: "Section: ",
                content: specialIssue.section,
              ),
              RowOfDetail(
                title: "Submission deadline: ",
                content: specialIssue.submissionDeadline,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    alignment: Alignment.centerLeft,
                    child: Text("Webpage: ", style: Theme.of(context).textTheme.headline4),
                  ),
                  InkWell(
                    child: Text(
                      specialIssue.webpage,
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () async {
                      launchUrl(Uri.parse(specialIssue.webpage));
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

