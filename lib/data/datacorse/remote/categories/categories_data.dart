import 'dart:developer';

import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  getCategories() async {
    var response = await crud.postData(Applink.categoriesView, {});
    //log('response form categories data  =============================================$response');
    return response.fold((l) => l, (r) => r);
  }
}
