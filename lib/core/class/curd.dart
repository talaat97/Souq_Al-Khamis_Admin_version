import 'dart:convert';
import 'dart:developer';
import 'dart:async'; // <— needed for TimeoutException
import 'package:dartz/dartz.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import '../function/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkinternet()) {
        // Set your desired timeout duration
        const timeoutDuration = Duration(seconds: 5);

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
}
