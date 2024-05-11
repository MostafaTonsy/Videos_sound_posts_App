import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:videos_sounds_app/core/crud/status_request_enum.dart';
import 'package:videos_sounds_app/core/functions/check_internet.dart';

class CRUD {
  Future postData(String url, Map<String, dynamic> data) async {
    StatusRequest statusRequest = StatusRequest.none;

    try {
      if (await check_internet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map datajson = jsonDecode(response.body);
          return datajson;
        } else {
          statusRequest = StatusRequest.server_failure;
          return statusRequest;
        }
      } else {
        statusRequest = StatusRequest.internet_failure;
        return statusRequest;
      }
    } catch (_) {
      statusRequest = StatusRequest.server_exception;
      return statusRequest;
    }
  }

  Future postData_with_FILE(String url, Map data, File file) async {
    StatusRequest statusRequest = StatusRequest.none;

    try {
      if (await check_internet()) {
        var request = http.MultipartRequest("POST", Uri.parse(url));
        var length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multipartFile = http.MultipartFile("file", stream, length,
            filename: basename(file.path)); //import path package//
        //   request.headers.addAll(myheaders);
        request.files.add(multipartFile);
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myRequest = await request.send();
        var response = await http.Response.fromStream(myRequest);
        if (myRequest.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          statusRequest = StatusRequest.server_failure;
          return statusRequest;
        }
      } else {
        statusRequest = StatusRequest.internet_failure;
        return statusRequest;
      }
    } catch (_) {
      statusRequest = StatusRequest.server_exception;
      return statusRequest;
    }
  }
}
