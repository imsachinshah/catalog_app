import 'package:catalog_app/core/my_store.dart';
import 'package:catalog_app/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;

  // catalog field
  late CatalogModel _catalog;

  // To store Items Ids of catalogModel
  final List<int> _itemIds = [];

  // Get Catalog

  CatalogModel get catalog => _catalog;

  // Set
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get the List of Items
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // To Total Values of Cart
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

// Add Items
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
    throw UnimplementedError();
  }
}

// Remove Items
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
    throw UnimplementedError();
  }
}
