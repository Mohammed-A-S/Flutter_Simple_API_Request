import 'package:api_project/models/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class product_screen extends StatefulWidget 
{
  product_screen
  (
    {
      super.key, 
      required this.productTitle, 
      required this.productDiscribtion, 
      required this.productPrise, 
      required this.productRating,
      required this.productImage
    }
  );
  
  final String productTitle;
  final String productDiscribtion;
  final String productPrise;
  final String productRating;
  final String productImage;

  @override
  State<product_screen> createState() => _product_screenState();
}

class _product_screenState extends State<product_screen> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text(widget.productTitle),
        backgroundColor: Colors.black,
      ),

      body: 
      Column
      (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: 
        [
          Image.network(widget.productImage),
          
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                Text(widget.productTitle, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),),
                SizedBox(height: 20,),
                Text(widget.productDiscribtion, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 73, 73, 73))),
                SizedBox(height: 30,),
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                  [
                    Row
                    (
                      children: 
                      [
                        Text("Price: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                        Text("\$" + widget.productPrise, style: TextStyle(fontSize: 25)),
                      ],
                    ),
                    Row
                    (
                      children: 
                      [
                        const Icon(Icons.star, color: Color.fromARGB(255, 232, 209, 0), size: 35,),
                        Text(widget.productRating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                      ],
                    ),
                  ],
                ),
              ],
            ) 
          ),
        ],
      ),
    );
  }
}