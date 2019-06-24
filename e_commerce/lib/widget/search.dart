import 'package:flutter/material.dart';

class SearchButtom extends StatefulWidget {



  @override
  _SearchButtomState createState() => _SearchButtomState();
}

class _SearchButtomState extends State<SearchButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.only(left:10.0, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24)
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10.0,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Buscar',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey[400])
              ),
              autofocus: false,
            ),
          ),
          Icon(Icons.clear, color: Colors.grey,)
        ],
      ),
    );
  }
}
