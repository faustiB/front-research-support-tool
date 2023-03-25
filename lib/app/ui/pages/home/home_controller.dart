import 'package:get/get.dart';
import 'package:research_support_tool/app/API/journal_provider.dart';
import 'package:research_support_tool/app/API/landing_provider.dart';
import 'package:research_support_tool/app/models/journal_model.dart';
import 'package:research_support_tool/app/models/landing_model.dart';

class HomeController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    getJournals();
    getNumbersByDocumentType();
  }

  final JournalProvider _journalProvider = JournalProvider();
  final LandingProvider _landingProvider = LandingProvider();

  var journals = [].obs;
  var specialIssues = [].obs;
  var conferences = [].obs;

  var isLoading = false.obs;

  var numbersByDocumentType = [].obs;
  var isLoadingNumbersByDocumentType = false.obs;

  /// Journals Section
  getJournals() async {
    var response = await _journalProvider.getJournals();
    if (!response.status.hasError) {
      journals.value = journalModelFromJson(response.bodyString!);
    } else {
      //TODO: Handle error from call to API
    }
  }

  searchJournalsByTitle(String title) async {
    var response = await _journalProvider.searchJournalsByTitle(title);
    if (!response.status.hasError) {
      journals.value = journalModelFromJson(response.bodyString!);
    } else {
      //TODO: Handle error from call to API
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
}