import 'package:e_commerce/model/app_state_model.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../item_list_product.dart';


// Favoritos
class FavoritoScreen extends StatelessWidget {
  List<Product> product ;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppStateModel>(
        builder: (context, child, model){
          this.product = model.getProductFav();
          return _buildListView();
        }
    );
  }

  _buildListView(){
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: product.length,
        itemBuilder: (context, index){
          return ItemListProducts(product: product[index]);
        }
    );
  }


}
