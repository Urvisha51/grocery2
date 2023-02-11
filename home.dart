import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'intropage.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        Padding(padding: const EdgeInsets.only(left: 80.0,right: 80,bottom: 40,top:160),
          child: Image.asset('lib/images/avocado.png'),
        ),
        Padding(padding: const EdgeInsets.all(24.0),
          child:Text("We Delever Groceries at your doorstep  ",
            textAlign:TextAlign.center,
            style:GoogleFonts.notoSerif(
              fontSize: 36,fontWeight: FontWeight.bold,
            ),), ),
        const SizedBox(height: 24),
        Text("Fresh items everyday",style: TextStyle(color: Colors.grey[600]),),
        const Spacer(),
        GestureDetector(onTap:()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
          return const intropage();
        },)),
          child: Container(
            decoration: BoxDecoration(color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(12)),
            padding:const EdgeInsets.all(24),
            child:const Text("Get Started",style:TextStyle(color: Colors.white),),
          ),
        ),
        const Spacer(),
      ],
    ),);
  }
}


