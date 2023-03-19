import 'package:gdg_peshawar/core/model/responses/get_Participants_response.dart';
import 'package:gdg_peshawar/core/service/api_services.dart';
import 'package:gdg_peshawar/screens/add_participant/add_participantview_model.dart';

import '../model/base_response/base_response.dart';

class DataBaseService {
  final _apiServices = ApiServices();
  Future<RequestResponse> addParticipantRequest(ParticipantBody body) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: 'participants',
      data: body.toJson(),
    );
    print('>>>>>>>>>>>> ${response.data}');
    return RequestResponse.fromJson(response.data);
  }

  Future<RequestResponse> deleteParticipant(String participantId) async {
    final RequestResponse response = await _apiServices.delete(
      endPoint: 'participants' + '/$participantId',
    );
    return RequestResponse.fromJson(response.data);
  }

  Future<GetParticipantsResponse> getParticipantsList() async {
    final RequestResponse response = await _apiServices.get(
      endPoint: 'participants',
    );
    return GetParticipantsResponse.fromJson(response.data);
  }
}
