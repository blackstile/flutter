import 'package:flutter/material.dart';
import 'package:flutter_essential/page/dog_details.dart';
import 'package:flutter_essential/utils/nav.dart';

class Dog {
  final String foto;
  final String nome;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  const HelloListView({Key? key}) : super(key: key);

  @override
  State<HelloListView> createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _isListview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Dogs",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _changeView("List");
              },
              color: _isListview ? Colors.yellow : Colors.white,
              icon: const Icon(Icons.format_list_bulleted)),
          IconButton(
              color: !(_isListview) ? Colors.yellow : Colors.white,
              onPressed: () {
                _changeView("Grid");
              },
              icon: const Icon(Icons.grid_on)),
        ],
      ),
      body: _body(),
    );
  }

  _changeView(String type) {
    print(type.toLowerCase() == "list");
    setState(() {
      _isListview = type.toLowerCase() == "list";
    });
  }

  _body() {
    return _listView();
  }

  _listView() {
    final List<Dog> imgs = [
      Dog("Jack Russel", 'dog1.png'),
      Dog("Labrador", 'dog2.png'),
      Dog("Pug", 'dog3.png'),
      Dog("Rottweiller", 'dog4.png'),
      Dog("Pastor", 'dog5.png'),
    ];
    return _isListview ?  _listViewBuilder(imgs) : _gridViewBuilder(imgs);

    // ignore: sized_box_for_whitespace
    // return ListView(
    //   itemExtent: 350,
    //   children: [
    //     _imageAssets(image: 'dog1.png'),
    //     _imageAssets(image: 'dog2.png'),
    //     _imageAssets(image: 'dog3.png'),
    //     _imageAssets(image: 'dog4.png'),
    //     _imageAssets(image: 'dog5.png'),
    //   ],
    // );
  }

  Widget _listViewBuilder(List<Dog> imgs) {
    return ListView.builder(
      itemExtent: 400,
      itemCount: imgs.length,
      itemBuilder: (BuildContext context, int idx) {
        return _itemBuilder(imgs, idx);
      },
    );
  }

  Widget _gridViewBuilder(List<Dog> imgs) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: imgs.length,
      itemBuilder: (BuildContext context, int index) {
        return _itemBuilder(imgs, index);
      },
    );
  }

  Widget _itemBuilder(List<Dog> imgs, int index) {
    final Dog dog = imgs[index];
    return GestureDetector(
      onTap: (){
        push(context, DogDetails(dog: dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          _imageAssets(image: dog.foto),
          Align(
            alignment: const Alignment(-1, -1),
            /**
                Eixo X: left= -1, center=0 , right=1,
                Eixo Y: top=-1, center=0, bottom=1
                Alignment.center = Alignment(0,0) | Aligment.topRight = Alignment(1,-1) | Alignment.bottomCenter = Alignment(0,1)
             **/
            child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  dog.nome,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                )),
          )
        ],
      ),
    );
  }

  _imageAssets({String image = 'dog1.png'}) {
    return Image.asset(
      'assets/images/$image',
      fit: BoxFit.cover,
    );
  }
}
