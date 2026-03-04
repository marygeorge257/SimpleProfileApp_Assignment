import 'package:flutter/material.dart';
import 'Greeting.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 String name="Guest";
  String entered_name="";
  int i=0;
  void updateName(){
    setState(() {
      if(entered_name.isEmpty){
        name="Guest";
      }
      else{
        name=entered_name;
      }
    });
  }
  void resetName(){
    setState(() {
      name="Guest";
      entered_name="";
    });
  }
  void count(){
    setState(() {
      i++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Simple Profile App", style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(
              onChanged: (value){
              entered_name=value;
            },
              decoration:
              InputDecoration(
                prefixIcon: Icon(Icons.person,size: 25,),
                labelText: "Enter Your First Name",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(
                    color: Colors.black45,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(
                    color: Colors.black45,
                    width: 2
                  )
                )
              ),
            ),
            SizedBox(height: 30,),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 65,
              child:Icon(Icons.person,size:60,color: Colors.white,) ,
            ),
            SizedBox(height: 20,),
            Greeting(name:name),
            SizedBox(height: 10,),
            Text(
              "Welcome to the profile app. Please enter your name above to see the greeting message",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed:(){
                      updateName();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.blueAccent
                    ),
                  child: Text("Update Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                TextButton(
                    onPressed: (){
                      resetName();
                    },
                    child: Text("Reset Name",
                    style: TextStyle(
                     fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    )
                )
              ],

            ),
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.lightBlue[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.lightBlue
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(
                  "Tap Count $i",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold

                  ),
                ),
                  Spacer(),

                  IconButton(
                      onPressed: (){
                        count();
                      },
                      icon: Icon(Icons.touch_app))
                ],
              ),
            )
              ],
        ),


      ),

    );
  }
}
