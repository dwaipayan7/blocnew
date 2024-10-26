import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      // listenWhen: (previous, current){
      //
      // },
      // buildWhen: (previous, current){
      //
      // },
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Grocery App",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            centerTitle: true,
            elevation: 5,
            backgroundColor: Colors.teal,
            actions: [
              IconButton(
                  onPressed: (){
                    HomeBloc().add(HomeWishlistButtonNavigateEvent());
                  },
                  icon:  Icon(Icons.favorite_border_outlined,color: Colors.white,)),
              IconButton(
                  onPressed: (){
                    HomeBloc().add(HomeCartButtonNavigateEvent());
                  },
                  icon:  Icon(Icons.shopping_bag_outlined, color: Colors.white,)),
            ],
          ),
        );
      },
    );
  }
}
