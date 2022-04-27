import 'dart:async';

import 'package:carros/api/carros_api.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/page/cart_details.dart';
import 'package:carros/util/app_navigator.dart';
import 'package:flutter/material.dart';

class CarListView extends StatefulWidget {
  final String? carType;

  const CarListView({Key? key, this.carType = "todos"}) : super(key: key);

  @override
  State<CarListView> createState() => _CarListViewState();
}

class _CarListViewState extends State<CarListView>
    with AutomaticKeepAliveClientMixin<CarListView> {
  final StreamController<List<Carro>> _streamController = StreamController();
  Future<List<Carro>>? _carros;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body(context);
  }

  @override
  void initState() {
    _loadData();
  }

  _loadData() async {
    List<Carro> _carros = await CarroApi.getByType(widget.carType!);
    _streamController.add(_carros);
  }

  _body(context) {
    return StreamBuilder<List<Carro>>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Ocorreu um erro ao buscar os carros"),
          );
        }
        return snapshot.hasData
            ? _listView(snapshot)
            : const Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(
                  child: LinearProgressIndicator(),
                ),
            );
      },
    );
  }

  Container _listView(AsyncSnapshot<List<Carro>> snapshot) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Carro car = snapshot.data![index];
          return Card(
            color: Colors.grey[200],
            child: Container(
              padding: const EdgeInsets.all(10),
              child: (Column(
                children: [
                  Center(
                    child: Image.network(
                      car.urlFoto ??
                          "https://autohub.ir/static/newapi/web/img/not_found.png",
                      width: 150,
                    ),
                  ),
                  Text(
                    car.nome ?? "não especificado",
                    style: const TextStyle(
                      fontSize: 24,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    car.descricao ?? "Não especificado",
                    style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                  ),
                  ButtonBarTheme(
                      data: ButtonBarTheme.of(context),
                      child: ButtonBar(
                        children: [
                          TextButton(
                            onPressed: () {
                              navigate(context, CarDetails(carro: car));
                            },
                            child: const Text("DETEALHES"),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("COMPARTILHAR"),
                          ),
                        ],
                      )),
                ],
              )),
            ),
          );
        },
        itemCount: snapshot.data?.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }
}
