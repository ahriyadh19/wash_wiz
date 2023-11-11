import 'package:flutter/material.dart';
import 'package:wash_wiz/pages/sign_in_page_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Wash Wiz'), centerTitle: true, actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ]),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.blueAccent,
                child: const Center(
                  child: Text(
                    'Wash Wiz',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Sign Out'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInPageView()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
