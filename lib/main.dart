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
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      print(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          ),
          /*
          LayoutBuilder(
    builder: (context, size){
      TextSpan text = new TextSpan(
        text: yourTextController.text,
        style: yourTextStyle,
      );

      TextPainter tp = new TextPainter(
          text: text,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
      );
      tp.layout(maxWidth: size.maxWidth);

      int lines = (tp.size.height / tp.preferredLineHeight).ceil();
      int maxLines = 10;

      return TextField(
        controller: yourTextController,
        maxLines: lines < maxLines ? null : maxLines,
        style: yourTextStyle,
      );
    }
  )
           */
          Container(
            height:70.0,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                Image.asset("assets/btn_action.png", width: 60.0, fit: BoxFit.fill,)
              ],
            ),
          ),
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
