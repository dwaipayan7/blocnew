import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Cart Items",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            elevation: 5,
            backgroundColor: Colors.teal
        ),
        body: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container();
          },
        )

    );
  }
}
