//detail view
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

