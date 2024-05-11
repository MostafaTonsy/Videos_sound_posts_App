import 'package:videos_sounds_app/core/crud/status_request_enum.dart';

handling_Data_function(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
