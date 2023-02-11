
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery2/cartpage.dart';

import 'package:provider/provider.dart';
import 'package:grocery2/groceryitem.dart';



class intropage extends StatelessWidget {
  const intropage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(onPressed: ()=>Navigator.push(context,
          MaterialPageRoute(builder: (context){
            return cartpage();
          })),
        backgroundColor: Colors.grey,
        child: Icon(Icons.shopping_bag_rounded),
      ) ,

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:24.0),
              child: Text("Good morning,"),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Let's order fresh item for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight:FontWeight.bold,
                ),),),
            const SizedBox(height: 24),

            const Padding(
              padding: const EdgeInsets.symmetric(horizontal:24.0),
              child: Divider(),
            ),

            const SizedBox(height: 24),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal:24.0),
              child: Text("Fresh Items.....!",
                style: TextStyle(fontSize:16),),
            ),
            Expanded(child: Consumer<cartmodel>(builder: (context,value,child){
              return GridView.builder(
                itemCount: value.shopItems.length,
                padding: EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: 1/1.3,),
                itemBuilder:(context,index){
                  return groceryitem(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    imagePath: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    onPressed: (){
                      Provider.of<cartmodel>(context,listen:false).addItemToCart(index);
                    },
                  );
                },
              );
            },
            ),
            ),
          ],
        ),
      ),);
  }
}


