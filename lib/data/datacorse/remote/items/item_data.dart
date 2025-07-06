import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);

  getItems(categoryId) async {
    var response = await crud.postData(Applink.items, {
      'categoriesid': categoryId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
