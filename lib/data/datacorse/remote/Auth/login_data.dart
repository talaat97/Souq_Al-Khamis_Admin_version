import 'package:souq_al_khamis_admin_version/link_api.dart';

import '../../../../core/class/curd.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(Applink.loginLink, {
      "email": email,
      "password": password,
    });
    print(' login data page ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
