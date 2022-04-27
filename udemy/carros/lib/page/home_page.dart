import 'package:carros/api/carros_api.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/widgets/car_list_view.dart';
import 'package:carros/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final bool isAdmin;

  const HomePage({Key? key, this.isAdmin = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carros"),
        centerTitle: true,
      ),
      body: const CarListView(),
      drawer: DrawerList(
        isAdmin: isAdmin,
      ),
    );
  }
}
