import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_provider/Models/information.dart';
import 'package:test_provider/provider/action_provider.dart';
import 'package:test_provider/services/informationservice.dart';

void main() {
  //runApp(MyApp());
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ActionProvider>(create: (context) => ActionProvider()),
  ];
  runApp(
    MultiProvider(
      providers: providers,

      // [
      //   ChangeNotifierProvider<ActionProvider>(create: (context) {
      //     return ActionProvider();
      //   }), //Provider 1 ตัว
      // ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page <><><><><><><><>.'),
      //testtest
      //testtest
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final allinformation = Provider.of<ActionProvider>(context, listen: false);
    allinformation.callservice();
    allinformation.lendata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer(
          builder: (BuildContext context, ActionProvider allinformation,
              Widget child) {
            return ListView.builder(
              itemCount: allinformation.alllendata,
              itemBuilder: (BuildContext content, int index) {
                print(index);
                print("AAAAAAAAAAAA");
                //print(allinformation.alllendata);
                return ListTile(
                  title: Text(allinformation.user[index].id.toString()),
                );
              },
            );
          },
        ));
  }
}


// ListView.builder(
//         itemCount: 5,
//         itemBuilder: (BuildContext context,int index){
//           return ListTile(
//             leading: Icon(Icons.list),
//             trailing: Text("GFG",
//                            style: TextStyle(
//                              color: Colors.green,fontSize: 15),),
//             title:Text("List item $index")
//             );
//         }
//         ),