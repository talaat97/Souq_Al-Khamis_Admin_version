import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);

  view() async {
    var response = await crud.postData(Applink.itemsView, {});
    return response.fold((l) => l, (r) => r);
  }

  delete() async {
    var response = await crud.postData(Applink.categoriesDelete, {});
    return response.fold((l) => l, (r) => r);
  }

  edit() async {
    var response = await crud.postData(Applink.categoriesEdit, {});
    return response.fold((l) => l, (r) => r);
  }

  add() async {
    var response = await crud.postData(Applink.categoriesAdd, {});
    return response.fold((l) => l, (r) => r);
  }
}
