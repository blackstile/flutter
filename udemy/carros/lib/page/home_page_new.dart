import 'package:carros/api/carros_api.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/util/shared_preferences_utils.dart';
import 'package:carros/widgets/car_list_view.dart';
import 'package:carros/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePageNew extends StatefulWidget {
  final bool isAdmin;

  const HomePageNew({Key? key, this.isAdmin = false}) : super(key: key);

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> with SingleTickerProviderStateMixin<HomePageNew> {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _initTabs();
  }

  _initTabs() async{
   final tabIdx = await SharedPreferencesUtils.getInt("tabIndex");
    setState(() {
      _tabController.index = tabIdx;
    });
    _tabController.addListener(() {
      SharedPreferencesUtils.setInt("tabIndex", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carros"),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text:"Todos"),
            Tab(text:"Clássicos"),
            Tab(text:"Esportivos"),
            Tab(text:"Luxo"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
          children: const [
        CarListView(),
        CarListView(carType: "classicos",),
        CarListView(carType: "esportivos",),
        CarListView(carType: "luxo",),
      ]),
      drawer: DrawerList(
        isAdmin: widget.isAdmin,
      ),
    );
  }
}
