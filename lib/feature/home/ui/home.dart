import 'package:blocnew/feature/home/ui/product_tile_widget.dart';
import 'package:blocnew/feature/wishlist/ui/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cart_page.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        }
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WishlistPage()),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
            break;

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Grocery App",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                elevation: 5,
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_border_outlined,
                        color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeCartButtonNavigateEvent());
                    },
                    icon:
                        Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  ),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index){
                    return ProductTileWidget(
                        productDataModel: successState.products[index]
                    );
                  }
              ),
            );

            break;

          case HomeErrorState:
            return Scaffold(body: Center(child: Text("Error"),),);
            break;
          default: Container();

        }
        return SizedBox.shrink();
      },
    );
  }
}
