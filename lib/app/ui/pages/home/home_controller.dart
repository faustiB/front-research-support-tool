/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'package:get/get.dart';
import 'package:research_support_tool/app/API/journal_provider.dart';
import 'package:research_support_tool/app/API/landing_provider.dart';
import 'package:research_support_tool/app/API/special_issues_provider.dart';
import 'package:research_support_tool/app/models/journal_model.dart';
import 'package:research_support_tool/app/models/landing_model.dart';
import 'package:research_support_tool/app/models/special_issues_model.dart';

class HomeController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    getJournals();
    getNumbersByDocumentType();
  }

  final JournalProvider _journalProvider = JournalProvider();
  final LandingProvider _landingProvider = LandingProvider();
  final SpecialIssuesProvider _specialIssuesProvider = SpecialIssuesProvider();

  var section = "journals";

  var responseRows = [].obs;

  var failedCall = false.obs;

  var numbersByDocumentType = [].obs;
  var isLoadingNumbersByDocumentType = false.obs;

  /// Journals Section
  getJournals() async {
    var response = await _journalProvider.getJournals();
    if (!response.status.hasError) {
      responseRows.value = journalModelFromJson(response.bodyString!);
    } else {
      failedCall.value = true;
      responseRows.value = [];
    }
  }

  searchJournalsByTitle(String title) async {
    var response = await _journalProvider.searchJournalsByTitle(title);
    if (!response.status.hasError) {
      responseRows.value = journalModelFromJson(response.bodyString!);
    } else {
      failedCall.value = true;
      responseRows.value = [];
    }
  }

  getNumbersByDocumentType() async {
    var response = await _landingProvider.getNumbersByDocumentType();
    if (!response.status.hasError) {
      numbersByDocumentType.value = landingModelFromJson(response.bodyString!);
    } else {
      //TODO: Handle error from call to API
    }
  }

  /// Special Issues Section
  getSpecialIssues() async {
    var response = await _specialIssuesProvider.getSpecialIssues();
    if (!response.status.hasError) {
      responseRows.value = specialIssuesModelFromJson(response.bodyString!);
    } else {
      failedCall.value = true;
      responseRows.value = [];
    }
  }

  searchSpecialIssuesByTitle(String title) async {
    var response = await _specialIssuesProvider.searchSpecialIssuesByTitle(title);
    if (!response.status.hasError) {
      responseRows.value = specialIssuesModelFromJson(response.bodyString!);
    } else {
      failedCall.value = true;
      responseRows.value = [];
    }
  }
}