import 'dart:convert';
import 'dart:developer';
import 'dart:async'; // <— needed for TimeoutException
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import '../function/check_internet.dart';
import 'package:http/http.dart' as http;

//String _basicAuth = 'Basic ${base64Encode(utf8.encode('talaat:talaat12345'))}';

Map<String, String> _myheaders = {
  'Accept': 'application/json',
  'Content-Type': 'application/json',
  //'authorization': _basicAuth
};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkinternet()) {
        // Set your desired timeout duration
        const timeoutDuration = Duration(seconds: 7);

        // Attempt the HTTP request with timeout
        var response = await http
            .post(Uri.parse(linkurl), body: data)
            .timeout(timeoutDuration);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          log('Data sent to HTTP request: $data');
          log('Response from HTTP request: ${response.body}');
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } on TimeoutException catch (_) {
      // Handle timeout specifically
      log('HTTP request timed out');
      return const Left(StatusRequest.timeoutfailure);
    } catch (e) {
      log('Exception during HTTP request: $e');
      return const Left(StatusRequest.serverExaption);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      String url, Map data, File? file,
      [String? namerequest]) async {
    namerequest ??= "file";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (file != null) {
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log('Data sent to HTTP request: $data');
      log('Response from HTTP request: ${response.body}');
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
