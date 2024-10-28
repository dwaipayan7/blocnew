import 'package:blocnew/feature/cart/bloc/cart_bloc.dart';
import 'package:blocnew/feature/home/bloc/home_bloc.dart';
import 'package:blocnew/feature/home/ui/home.dart';
import 'package:blocnew/feature/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> HomeBloc()),
        BlocProvider(create: (_)=> CartBloc()),
        BlocProvider(create: (_)=> WishlistBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Practice',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

