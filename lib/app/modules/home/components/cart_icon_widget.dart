import 'package:badges/badges.dart';
import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salgadar_app/app/controllers/cart_controller.dart';
import 'package:salgadar_app/app/modules/home/pages/cart_page.dart';


class CartIconWidget extends StatefulWidget {
  @override
  _CartIconWidgetState createState() => _CartIconWidgetState();
}

class _CartIconWidgetState extends State<CartIconWidget> {
  final controller = Modular.get<CartController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Modular.to.pushNamed(CartPage.routeName),
      child: Consumer<CartController>(
        builder: (context, value) {
          return controller.userCart != null
              ? Badge(
                  badgeColor: Colors.redAccent,
                  borderSide: BorderSide(width: 1),
                  badgeContent: Text('${controller.totalItems}'),
                  position: BadgePosition.topStart(
                      start: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.035 * -1),
                  animationType: BadgeAnimationType.slide,
                  child: Icon(Icons.shopping_cart),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
