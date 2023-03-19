import 'package:flutter/material.dart';
import 'package:gdg_peshawar/core/model/body/participants_body.dart';
import 'package:gdg_peshawar/core/model/responses/get_Participants_response.dart';
import 'package:gdg_peshawar/core/service/database_services.dart';
import 'package:get/get.dart';

class HomeViewModel extends ChangeNotifier {
  final _databaseService = DataBaseService();

  List<Participant> participants = [];

  HomeViewModel() {
    init();
  }
  bool isloading = false;
  void updateIsloading(value) {
    isloading = value;
    notifyListeners();
  }

  init() {
    _getParticipantsListData();
  }

  _getParticipantsListData() async {
    updateIsloading(true);
    try {
      GetParticipantsResponse response =
          await _databaseService.getParticipantsList();
      if (response.success) {
        participants = response.participants;
      } else {
        Get.dialog(
          AlertDialog(
            title: Text('Error'),
            content: Text(response.error!),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Ok'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      debugPrint('_@HomeViewModel => $e');
    }
    updateIsloading(false);
    notifyListeners();
  }

  // delete participant from list and database both side with id
  deleteParticipant(String participantId) async {
    updateIsloading(true);
    try {
      participants.removeWhere((element) => element.sId == participantId);
      final response = await _databaseService.deleteParticipant(participantId);
      if (response.success) {}
    } catch (e) {
      debugPrint('_@HomeViewModel => $e');
    }
    updateIsloading(false);
    notifyListeners();
  }
}
