import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/sign_in_page.dart';
import 'features/auth/presentation/pages/sign_up_page.dart';
import 'features/chat/presentation/pages/chat_list_page.dart';
import 'features/ecommerce/presentation/bloc/product_bloc/product_bloc.dart';
import 'features/ecommerce/presentation/pages/home_page.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => sl<AuthBloc>()..add(AuthGetUserEvent()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            canvasColor: Colors.white,
            useMaterial3: true,
          ),
          routes: {
            '/home': (context) => const HomePage(),
            '/chatlist': (context) => const ChatListPage(),
            '/chatroom': (context) => const ChatListPage(),
            '/signin': (context) => SignInPage(),
            '/signup': (context) => const SignUpPage(),
          },
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthGetUserLoading) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      value: 100,
                    ),
                  ),
                );
              } else if (state is AuthGetUserSuccess) {
                return BlocProvider(
                  create: (context) =>
                      sl<ProductBloc>()..add(LoadAllProductsEvent()),
                  child: const HomePage(),
                );
              } else {
                return SignInPage();
              }
            },
          ),
        ));
  }
}
