import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';

import '../function/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkinternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(
              'gave to HTTP reqest====================================== $data');
          print(
              'response from HTTP request ============================= ${response.body}');
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverExaption);
    }
  }
}
