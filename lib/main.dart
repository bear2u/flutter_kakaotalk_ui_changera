import 'package:flutter/material.dart';
import 'package:flutter_app/bubble_message.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter KaKaotalk UI Demo'),
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
  Widget build(BuildContext context) {
    final list = List<Widget>.generate(5, (index) => _buildChild(index)).reversed.toList();
    return Scaffold(
      backgroundColor: Color(0xff96bdce),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index) => list[index]
            ),
            flex: 9,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      child: TextField(
                        decoration: InputDecoration(
                        ),
                      ),
                    ),
                  ),
                  OutlineButton(
                    borderSide: BorderSide(color: Colors.black),
                    onPressed: (){},
                    child: Text('전송'),
                  )
                ],
              ),
            ),
            flex: 1,
          )
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildChild(int index) {
    if(index % 2 == 0){
      return _MySideWidget(index: index,);
    }
    return new _OtherSideWidget(index: index);
  }
}

class _OtherSideWidget extends StatelessWidget {
  final index;
  const _OtherSideWidget({
    this.index,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Image.asset("assets/profile.png", width: 60.0, height: 60.0,),
          SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("김태현"),
              SizedBox(
                height: 8.0,
              ),
              BubbleMessage(
                painter: BubblePainter(),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 250.0,
                    minWidth: 50.0,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                  child: Text(
                    'your text #$index variable your text variable your text variable your text variable',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class _MySideWidget extends StatelessWidget {
  final index;
  const _MySideWidget({
    this.index,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              BubbleMessage(
                painter: BubblePainter(),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 250.0,
                    minWidth: 50.0,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                  child: Text(
                    'your text #$index variable your text variable your text variable your text variable',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
