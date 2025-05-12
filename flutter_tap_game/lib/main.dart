import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final double halfHeight = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                color: Colors.yellow,
                height: halfHeight,
                width: double.infinity,
              ),
              Container(
                color: Colors.lightBlueAccent,
                height: halfHeight,
                width: double.infinity,
              ),
            ],
          ),
          Positioned(
            top: halfHeight - 100, // 100 is half of button's height
            left: (MediaQuery.of(context).size.width / 2) - 100, // 100 is half of button's width
            child: MaterialButton(
              color: Colors.white,
              shape: CircleBorder(),
              height: 200,
              minWidth: 200,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text("START"),
            ),
          ),
        ],
      ),
    );
  }
}
class FinalPage extends StatelessWidget{

  final int score;
  final String winner;
  final Color color;
  final Color bgcolor;
  
  const FinalPage(this.score, this.winner, this.color,this.bgcolor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgcolor,
            
          ),
          height: 400,
          width: 400,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
            "Game Over!",
            style: TextStyle(fontSize: 24,color: Colors.black87),
          ),
          Text(
            "Scored: $score",
            style: TextStyle(fontSize: 24,color: Colors.white),
          ),
          Text(
            "Player $winner Won",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: color),
          ),
          MaterialButton(
            
            shape: CircleBorder(),
            height: 100,
            minWidth: 100,
            color: Colors.greenAccent,
            child: Text("Play Again"),
            onPressed: (){
            Navigator.pop(context);
            Navigator.pop(context);
          })
            ],
          ),
        )
      ),
    );
  }
}

class SecondPage extends StatefulWidget{
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
    int scoreA = 0;
    int scoreB = 0;
    double heightA=0;
    double heightB=0;
    

    bool initialized = false;
  @override
  Widget build(BuildContext context) {
    double screenheight =MediaQuery.of(context).size.height;
    if (initialized==false) {
    heightA = MediaQuery.of(context).size.height / 2;
    heightB = MediaQuery.of(context).size.height / 2;
    
    }
    initialized=true;
    
       return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.all(0),
             onPressed: () {
              if(heightA >= screenheight-66 || heightB >= screenheight-66){
               Navigator.push(context, MaterialPageRoute(builder: (context) => FinalPage(scoreB, "B", Colors.yellowAccent,Colors.lightBlueAccent)));
               }
              setState(() {
                  heightB += 20;
                  heightA-=20;
                  scoreB += 5;
              });
            
            },
           
            child: Container(
              
              color: Colors.yellowAccent,
              height:heightB,
              width: double.infinity, 
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(25),
              child: Row(
                children: [                 
                     Expanded(
                     child: Text("Player B", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                     ),
                     Text(scoreB.toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),   
                ],
              ),
            ),
          ),
    MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        if (heightA >= screenheight - 66 || heightB >= screenheight - 66) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FinalPage(scoreA, "A", Colors.lightBlueAccent,Colors.yellowAccent)));
          return;
        }
        setState(() {
          heightA += 20;
          heightB -= 20;
          scoreA += 5;
        });
      },
      child: Container(
        color: Colors.lightBlueAccent,
        height: heightA,
        width: double.infinity, 
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(25),
        
        child:Row(
          children: [                 
               Expanded(
               child: Text("Player A", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
               ),
               Text(scoreA.toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),   
          ],
        ),
      ),
    ),
        ],
      ),
    ); 
    }
   
  }
