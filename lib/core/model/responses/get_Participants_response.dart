import '../body/participants_body.dart';

class GetParticipantsResponse {
  late bool success;
  String? error;
  late List<Participant> participants = [];

  GetParticipantsResponse(this.success, {this.error});

  GetParticipantsResponse.fromJson(json) {
    success = json['success'];
    error = json['error'];

    if (json['body'] != null) {
      json['body'].forEach((v) {
        participants.add(Participant.fromJson(v));
      });
    }
  }
}
