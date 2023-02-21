import 'package:get/get.dart';
import 'package:research_support_tool/app/API/journal_provider.dart';
import 'package:research_support_tool/app/models/journal_model.dart';

class HomeController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    getJournals();
  }

  final JournalProvider _journalProvider = JournalProvider();
  var journals = [].obs;
  var isLoading = false.obs;

  getJournals() async {
    var response = await _journalProvider.getJournals();
    if (!response.status.hasError) {
      journals.value = journalModelFromJson(response.bodyString!);
    } else {
      //TODO: Handle error from call to API
    }
  }
}