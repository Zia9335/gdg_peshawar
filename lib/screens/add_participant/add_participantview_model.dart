import 'package:flutter/material.dart';
import 'package:gdg_peshawar/core/model/base_response/base_response.dart';

import 'package:gdg_peshawar/core/service/database_services.dart';
import 'package:get/get.dart';

class AddParticipantViewModel extends ChangeNotifier {
  final _databaseService = DataBaseService();
  ParticipantBody participantBody = ParticipantBody();
  final formKey = GlobalKey<FormState>();
  bool isloading = false;
  void updateIsloading(vlaue) {
    isloading = vlaue;
    notifyListeners();
  }

  // add participant to list and database both side
  addParticipant() async {
    updateIsloading(true);
    try {
      final RequestResponse response =
          await _databaseService.addParticipantRequest(participantBody);

      Get.dialog(
        AlertDialog(
          title: Text('Success',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          content: Text('Participant added successfully'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: Text('Ok',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint('_@AddParticipantViewModel => $e');
    }
    updateIsloading(false);
  }
}

class ParticipantBody {
  String? name;
  String? email;
  String? bio;

  ParticipantBody({
    this.name,
    this.email,
    this.bio,
  });

  ParticipantBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['bio'] = this.bio;
    return data;
  }
}
