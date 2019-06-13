import 'package:scoped_model/scoped_model.dart';
import 'product.dart';
import 'products_repository.dart';

double _iva = 0.21;
double _shippingCost = 7.0;

class AppStateModel extends Model{
  List<Product> _avaiableProducts; //productos disponibles

  Category _selectedCategory = Category.all; //categ actual

  Map<int,int> _productsInCart = {}; //id y cantidad de productos en el carrito

  Map<int,int> get productsInCart => Map.from(_productsInCart);

  //numero total de items en el carrito
  int get totalCartQuantity => _productsInCart.values.fold(0, (v,e) => v + e);

  Category get selectedCategory => _selectedCategory;

  //precio total de los items del carrito
  double get subTotalCost => _productsInCart.keys
      .map((id) => _avaiableProducts[id].price * _productsInCart[id])
      .fold(0.0, (sum,e)=> sum + e);

  //costo de envio
  double get shippingCost => _shippingCost * _productsInCart.values.fold(0.0, (sum,e)=> sum + e);

  //iva
  double get iva => subTotalCost * _iva;

  //Total de la compra
  double get totalCost => subTotalCost + shippingCost + iva;

  //retorno una copia de la lista de los productos disponibles filtrados x categoria
  List<Product> getProducts() {
    if (_avaiableProducts == null) return List<Product>();

    if(_selectedCategory == Category.all){
      return List.from(_avaiableProducts);
    }else{
      return _avaiableProducts.where((p)=> p.category == _selectedCategory).toList();
    }
  }

  List<Product>getProductFav(){
    if (_avaiableProducts == null) return List<Product>();

    List<Product> lista = _avaiableProducts.sublist(5,8);

    return List.from(lista);

  }

  //agrego un producto al carrito
  void addProductsToCart(int productId){
    if(!_productsInCart.containsKey(productId)){
      _productsInCart[productId] = 1;
    }else{
      _productsInCart[productId]++;
    }
    notifyListeners();
  }

  //quito un producto del carrito
  void removeItemFromcart(int productId){
    if(_productsInCart.containsKey(productId)){
      if(_productsInCart[productId] == 1){
        _productsInCart.remove(productId);
      }else{
        _productsInCart[productId]--;
      }
    }
    notifyListeners();
  }

  //Regresa la instancia del producto que coincide con el product id
  Product getProductById(int id){
    return _avaiableProducts.firstWhere((p) => p.id == id);
  }

  //quito todos los productos del carrito
  void clearCart(){
    _productsInCart.clear();
    notifyListeners();
  }

  //Cargo la lista de productos disponibles desde el repo
  void loadProducts(){
    _avaiableProducts = ProductsRepository.loadProducts(Category.all);
  }

  //cambio de categoria
  void setCategory(Category newCategory){
    _selectedCategory = newCategory;
    notifyListeners();
  }




}