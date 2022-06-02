import 'package:f6_ecommerce/model/cart_model.dart';
import 'package:f6_ecommerce/model/product.dart';
import 'package:f6_ecommerce/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //PEGANDO CONTEUDO PELO PROVIDER
    //
    final product = Provider.of<Product>(
      context,
      listen: false,
    );

    //final product = context.watch<Product>();
    final cart = context.watch<CartModel>();

    var isFavorite =
        context.select<Product, bool>((produto) => produto.isFavorite);
    var isInCart = context.select<CartModel, bool>(
      (cartList) => cartList.products.contains(product),
    );

    return ClipRRect(
      //corta de forma arredondada o elemento de acordo com o BorderRaius
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              //adicionando metodo ao clique do botão
              product.toggleFavorite();
            },
            //icon: Icon(Icons.favorite),
            //pegando icone se for favorito ou não
            icon: Consumer<Product>(
              builder: (context, product, child) => Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
            //isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              onPressed: () {
                cart.toogleIsInCart(product);
              },
              icon: Icon(Icons.shopping_cart),
              color: isInCart
                  ? Colors.green
                  : Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
