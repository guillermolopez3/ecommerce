import 'package:flutter/material.dart';
import 'model/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  
  ProductDetail({this.product});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int talleSelected = -1;
  List<String> _ListTalles = ['S','M','L'];
  double anchoPantalla;

  @override
  Widget build(BuildContext context) {
    anchoPantalla = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Producto'),
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_shopping_cart),
          onPressed: (){ bottomSheet(context);}
      ),
    );
  }

  _body(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            height: 200.0,
            child: Hero(
                tag: widget.product.id,
                child: Image.asset(
                  widget.product.assetName,
                  fit: BoxFit.cover,
                ),
            ),
          ),
          _tituloYBtnFav(context),
          _precios(context),
          _talles(),
          _colores(),
          _descripcion(),
          SizedBox(height: 80,)
        ],
      );

  _tituloYBtnFav(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left:8.0, right: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              widget.product.name,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      )
  );

  _precios(BuildContext context)=> Padding(
      padding: const EdgeInsets.only(left:8.0, right: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            'Precio: \$${widget.product.price}',
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0),
          ),
          SizedBox(width: 10.0,),
          Text(
            "\$200",
            style: Theme.of(context).textTheme.caption.copyWith(decoration: TextDecoration.lineThrough),
          ),
          SizedBox(width: 10.0,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
                color: Colors.deepOrange[100]
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('-50%', style: Theme.of(context).textTheme.caption.copyWith(color: Colors.deepOrange[400]),),
            ),
          )
        ],
      )
  );

  _talles() => Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            'Talles Disponibles',
            style: TextStyle(color: Colors.grey[400], fontSize: 14.0),
        ),
        Row(
          children: <Widget>[
            Chip(
              label: Text('S'),
            ),
            SizedBox(width: 8),
            Chip(
              label: Text('M'),
            ),
            SizedBox(width: 8),
            Chip(
              label: Text('L'),
            ),
          ],
        )
      ]
    ),
  );

  _colores()=> Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Colores Disponibles',
            style: TextStyle(color: Colors.grey[400], fontSize: 14.0),
          ),
          Row(
            children: <Widget>[
              Chip(
                label: Text('Azul'),
              ),
              SizedBox(width: 8),
              Chip(
                label: Text('Rojo'),
              ),
              SizedBox(width: 8),
              Chip(
                label: Text('Naranja'),
              ),

            ],
          )
        ]
    ),
  );

  _descripcion() => Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Talles Disponibles',
            style: TextStyle(color: Colors.grey[400], fontSize: 14.0),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.',
            style: TextStyle(height: 1.5),
          )
      ]
    ),
  );

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            color: Color(0xFF737373),
            child: Container(
              child: _detailBottomSheet(context),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                )
              ),
            ),
          );
        }
    );
  }

  //TODO poner la opcion para que agreguen la cantidad que quieran comprar
  _detailBottomSheet(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: anchoPantalla /2,
              height: 80.0,
              child: Image.asset(
                widget.product.assetName,
                fit: BoxFit.scaleDown,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(widget.product.name, style: Theme.of(context).textTheme.display1.copyWith(fontSize: 18),),
                SizedBox(height: 10,),
                Text('\$${widget.product.price}', style: Theme.of(context).textTheme.title,),
              ],
            )
          ],
        ),
        _talles(),
        _colores(),
        Container(
          width: 150,
          child: RaisedButton(
            shape: StadiumBorder(),
            onPressed: (){},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.add_shopping_cart),
                  Text('Agregar')
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}



//como hacer un selector de Chip
/*children: _ListTalles.asMap()
.map((index,value)=>
MapEntry(index, ChoiceChip(
selected: talleSelected == index,
label: Text(value),
onSelected: (selected){
setState(() {
talleSelected=index;
});
},
)
)
).values.toList()*/