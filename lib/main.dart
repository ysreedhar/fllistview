import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  List<bool> _data = new List<bool>();

  @override
  void initState() {
    setState(() {
      for (int i = 0; i < 10; i++) {
        _data.add(false);
      }
    });
  }
void _onChange(bool value, int index){
    setState((){
      _data[index]= value;
    });
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter ListView'),
      ),
      body: new ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Container(
                padding: new EdgeInsets.all(5.0),
                child: new Column(
                  children: <Widget>[
                    new Text('This is Item ${index}'),
                    new CheckboxListTile(
                        value: _data[index],
                        controlAffinity: ListTileControlAffinity.leading,
                        title: new Text('Click This item ${index}'),
                        onChanged: (bool value){_onChange(value, index);})
                  ],
                ),
              ),
            );
          }),
    );
  }
}
