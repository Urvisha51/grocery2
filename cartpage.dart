import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery2/cartmodel.dart';
import 'package:provider/provider.dart';

import 'cartmodel.dart';
class cartpage extends StatelessWidget {
  const cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor:Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),),
        body: Consumer<cartmodel>(builder: (context,value,child){
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight:FontWeight.bold,
                  ),),),
              Expanded(child: ListView.builder(
                itemCount: value.cartItems.length,
                padding: EdgeInsets.all(12),
                itemBuilder: (context,index){
                  return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(value.cartItems[index][2],
                            height:36 ,),
                          title: Text(value.cartItems[index][0]),
                          subtitle: Text("Rs."+ value.cartItems[index][1]),
                          trailing: IconButton(icon:Icon(Icons.cancel),
                            onPressed:() => Provider.of<cartmodel>(context,listen:false)
                                .removeItemFormCart(index),
                          ),),)
                  );
                },),),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Price",
                          style: TextStyle(color: Colors.green[10]),),
                        const SizedBox(height:4),
                        Text("Rs." + value.calculateTotal(),
                          style:const  TextStyle(color: Colors.white,fontSize: 18,
                              fontWeight: FontWeight.bold),),
                      ],),
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(200)),
                        padding: EdgeInsets.all(12),
                        child:Row(
                          children: [
                            Text("Pay Now....",style:TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_forward_ios_outlined,
                              size: 16,
                              color: Colors.white,)
                          ],
                        ),)

                    ],
                  ),
                ),
              ),

            ],);
        })
    );
  }
}
