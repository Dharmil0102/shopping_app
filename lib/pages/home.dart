import 'package:flutter/material.dart';
import 'package:shopping_app/widget/support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 238, 238),
      body: Container(
          margin: EdgeInsets.only(top: 50, left:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey, Dharmil", 
                        style: Appwidget.boldTextFeildStyle(),
                      ),
                      Text(
                        "Good Morning", style: Appwidget.lightTextFeildStyle(),
                        ),
                    ],
                  ),
                   ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.asset("images/profile.jpg", height: 70, width: 70,fit: BoxFit.cover,)
                    ),
                ],
              ),
              SizedBox(height: 30.0,),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none, hintText: "Search Product", hintStyle: Appwidget.lightTextFeildStyle(), prefixIcon: Icon(Icons.search, color: Colors.black,)),
                  ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories", style: Appwidget.semiBoldTextStyle(),
                  ),
                  Text(
                    "See all", style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          )
        ),
    );
  }
}