import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocnew/data/cart_items.dart';
import 'package:blocnew/feature/home/models/home_product_models.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {

    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);

  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {

    emit(CartSuccessState(cartItems: cartItems));

  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {

    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));

  }
}
