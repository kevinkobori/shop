import 'package:flutter/material.dart';
import 'package:shop/app/providers/product.dart';
import 'package:shop/app/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.images[0]),
      ),
      title: Text(
        product.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Container(
        width: 80, //MediaQuery.maybeOf(context).size.width,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit, color: Colors.black,),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Produto'),
                    content: Text('Tem certeza?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((value) async {
                  // if (value) {
                  //   try {
                  //     await Provider.of<Products>(context, listen: false)
                  //         .deleteProduct(product.id);
                  //   } on HttpException catch (error) {
                  //     scaffold.showSnackBar(
                  //       SnackBar(
                  //         content: Text(error.toString()),
                  //       ),
                  //     );
                  //   }
                  // }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
