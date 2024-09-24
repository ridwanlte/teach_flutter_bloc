import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/src/pages/pages.dart';
import 'package:flutter_bloc_test/src/product/bloc/product_bloc.dart';
import 'package:flutter_bloc_test/src/product/data/repository/product_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(productRepository: ProductRepository()),
        )
      ],
      child: MaterialApp(
          title: 'FLutter Bloc Api',
          builder: (context, child) {
            final mediaQuery = MediaQuery.of(context);
            return MediaQuery(
                data: mediaQuery.copyWith(textScaleFactor: 1.0), child: child!);
          },
          theme: ThemeData(useMaterial3: true),
          home: ProductView()),
    );
    // return MaterialApp(
    //   title: 'FLutter Bloc Api',
    //   builder: (context, child) {
    //     final mediaQuery = MediaQuery.of(context);
    //     return MediaQuery(
    //         data: mediaQuery.copyWith(textScaleFactor: 1.0), child: child!);
    //   },
    //   theme: ThemeData(useMaterial3: true),
    //   home: RepositoryProvider<ProductRepository>(
    //     create: (context) => ProductRepository(),
    //     child: BlocProvider(
    //       lazy: false,
    //       create: (BuildContext context) =>
    //           ProductBloc(productRepository: context.read<ProductRepository>()),
    //       child: const ProductView(),
    //     ),
    //   ),
    // );
  }
}
