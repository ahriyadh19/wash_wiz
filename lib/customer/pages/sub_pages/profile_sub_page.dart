import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wash_wiz/main.dart';
import 'package:wash_wiz/customer/pages/main_pages/navigation_control_page.dart';
import 'package:wash_wiz/customer/pages/main_pages/sign_in_page_view.dart';

class ProfileSubPage extends StatefulWidget {
  const ProfileSubPage({super.key});

  @override
  State<ProfileSubPage> createState() => _ProfileSubPageState();
}

class _ProfileSubPageState extends State<ProfileSubPage> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ExpansionTileCard(
              expandedTextColor: Colors.green,
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('User Info'),
              subtitle: const Text('Here is your profile info'),
              children: [
                TextButton(
                  onPressed: () {},
                  child: const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                    subtitle: Text('123-456-7890'),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Email'),
                    subtitle: Text(''),
                  ),
                ),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ExpansionTileCard(
              expandedTextColor: Colors.green,
              leading: const CircleAvatar(child: Icon(Icons.location_on_rounded)),
              title: const Text('Location Info'),
              subtitle: const Text('Here is your location info'),
              children: [
                TextButton(
                  onPressed: () {},
                  child: const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Address'),
                    subtitle: Text(''),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('City'),
                    subtitle: Text(''),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('State'),
                    subtitle: Text(''),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Zip Code'),
                    subtitle: Text(''),
                  ),
                ),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ExpansionTileCard(
            expandedTextColor: Colors.green,
            leading: const CircleAvatar(child: Icon(Icons.car_crash_rounded)),
            title: const Text('Car Info'),
            subtitle: const Text('Here is your car info'),
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: const ListTile(
                  leading: Icon(Icons.car_rental),
                  title: Text('Car Type'),
                  subtitle: Text(''),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const ListTile(
                  leading: Icon(Icons.car_repair),
                  title: Text('Car Model'),
                  subtitle: Text(''),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const ListTile(
                  leading: Icon(Icons.car_repair),
                  title: Text('Car Color'),
                  subtitle: Text(''),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const ListTile(
                  leading: Icon(Icons.car_repair),
                  title: Text('Car Plate'),
                  subtitle: Text(''),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ExpansionTileCard(
              expandedTextColor: Colors.green,
              leading: const CircleAvatar(child: Icon(Icons.color_lens_rounded)),
              title: const Text('App Theme'),
              subtitle: const Text('Here is your app theme'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildColumn('lib/assets/1/bg1.jpg', 1),
                          buildColumn('lib/assets/2/bg2.jpg', 2),
                          buildColumn('lib/assets/3/bg3.jpg', 3),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: () {
              prefs.then((value) {
                value.setBool('session_started', false);
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SignInPageView()),
              );
            },
            child: const Text('Sign Out'),
          ),
        ),
      ],
    );
  }

  Padding buildColumn(String imagePath, int style) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => saveChange(op: style),
              child: Image.asset(
                fit: BoxFit.fill,
                imagePath,
                width: MediaQuery.of(context).size.width / 4.5,
                height: MediaQuery.of(context).size.width / 2.5,
              ),
            ),
            Radio(
              value: style,
              groupValue: MyApp.style,
              onChanged: (int? value) => saveChange(op: value!),
            ),
          ],
        ));
  }

  dynamic saveChange({required int op}) {
    MyApp.style = op;
    prefs.then((value) {
      value.setInt('style', op);
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const NavigationControlPage()),
    );
  }
}
