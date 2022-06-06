import 'package:catalog_app/models/catalog_model.dart';

class CartModel {
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
  List<Item> get _items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // To Total Values of Cart
  num get totalPrice =>
      _items.fold(0, (total, current) => total + current.price);

  // Add Items

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Items

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
