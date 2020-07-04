import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => CounterBloc(0),

      child: Scaffold(
        appBar: AppBar(

          title: Text("test"),
        ),
        body: BodyWidget(),


        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CounterBloc>(context);
    return Center(

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          BlocBuilder<CounterBloc,dynamic>(

            builder: (context, counter ) {
              return Text(
                '$counter',
                style: Theme.of(context).textTheme.headline4,
              );
            }
          ),


         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              FloatingActionButton(
                onPressed: ()=> bloc.add(COUNTER_EVENTS.increment),
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              SizedBox(width: 24,),
              FloatingActionButton(
                onPressed:()=> bloc.add(COUNTER_EVENTS.decrement),
                tooltip: 'Decrement',
                child: Icon(Icons.minimize),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
