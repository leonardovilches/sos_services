import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async{
  runApp(MyApp());

  await Parse().initialize(
    'aOvfAv7ymNduniHTnn1Id7vw4lfdIC4oXDUFCwVf', 
    'https://parseapi.back4app.com/',
    clientKey: 'ux1TZWB0r4HuFHQiMtpvHiZtzu6lcZllxGnojiLI',
    autoSendSessionId: true,
    debug: true);

//Salvar
    // final category = ParseObject('Categories')
    // ..set<String>('Title', 'Meias')
    // ..set<int>('Position', 1);
    // final response = await category.save();
    // print(response.success);

//Alterar
    // final category = ParseObject('Categories')
    // ..objectId = 'qyFwgEH22C'
    // ..set<int>('Position', 3);

    // final response = await category.save();
    //print(response.success);
  
  //Deletar
    // final category = ParseObject('Categories')
    //  ..objectId = 'qyFwgEH22C';

    // category.delete();


  //Busca Especifica
  // final response = await ParseObject('Categories').getObject('b7fblayOs8');
  // if(response.success) {
  //   print(response.result);
  // }

  //Busca todos
    // final response = await ParseObject('Categories').getAll();
    // if(response.success) {
    //   for(final object in response.result){
    //     print(object);
    //   }
    // }

    final query = QueryBuilder(ParseObject('categories'));

    // query.whereEqualTo('Position', 2);
    query.whereEqualTo('Title', 'Meias');

    final response = await query.query();
    if(response.success){
      print(response.result);
    }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
