import 'package:book_tickets/pages/authpage.dart';
import 'package:book_tickets/pages/home_page.dart';
import 'package:book_tickets/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if(auth.isLoading) {
      return loading();
    } else if(auth.usuario == null) {
      return const AuthPage();
    } else {
      return const HomePage();
    }
  }

  loading(){
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}