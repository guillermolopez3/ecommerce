import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/app_state_model.dart';
import 'model/product.dart';

class CategoryMenuPage extends StatelessWidget {
  final List<Category> _categories = Category.values;
  final VoidCallback onCategoryTap;

  const CategoryMenuPage({
    Key key,
    this.onCategoryTap,
  }) : super(key: key);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString =
    category.toString().replaceAll('Category.', '').toUpperCase();
    final ThemeData theme = Theme.of(context);
    return ScopedModelDescendant<AppStateModel>(
      builder: (context, child, model) => GestureDetector(
        onTap: () {
          model.setCategory(category);
          if (onCategoryTap != null) onCategoryTap();
        },
        child: model.selectedCategory == category
            ? Column(
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              categoryString,
              style: theme.textTheme.body2.copyWith(color: Colors.amber),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 14.0),
            Container(
              width: 70.0,
              height: 2.0,
              color: Colors.blue,
            ),
          ],
        )
            : Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            categoryString,
            style: theme.textTheme.body2
                .copyWith(color: Colors.white.withAlpha(153)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.90),
      body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: IconButton(icon: Icon(Icons.clear), color: Colors.white, onPressed: (){ Navigator.pop(context);}),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: _categories
                        .map((Category c) => _buildCategory(c, context))
                        .toList() ,
                  ),

                )
              ],
        ),
      )),
    );
  }
}
