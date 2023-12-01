import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jsonserialization/usermodel.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  //User Object
  UserModel userObject =  UserModel(id: "001", fullname: "Krishna Rao", email: "krao6652@gmail.com");

  //User JSON
  String userJSON = '{"id": "001", "fullname": "Krishna Rao", "email": "krao6652@gmail.com"}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ElevatedButton(
                  onPressed: (){
                    // Serialize -- Object(Class) -> Map -> Encode -> JSON
                    Map<String, dynamic> userMap = userObject.toMap(); //Convert Object to Map
                    var json = jsonEncode(userMap);  // Encode Map to JSON
                    print(json.toString());  //Print
                  },
                  child: const Text('Serialize(Object-JSON)')
              ),

              ElevatedButton(
                  onPressed: (){
                    // De-Serialize -- Json -> Decode -> Map --> Object
                    var decoded = jsonDecode(userJSON); // Decode Json string
                    Map<String, dynamic> userMap = decoded;  // convert Decoded to Map
                    UserModel newUser = UserModel.fromMap(userMap); // convert Map to Object
                    print(newUser.fullname.toString());  // Print
                  },
                  child: const Text('De-Serialize(JSON-Object')
              )
            ],
          ),
        ),
      ),
    );
  }

}

