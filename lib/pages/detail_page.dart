import 'package:flutter/material.dart';
import 'package:lalafo/models/product_model.dart';
import '../constants/horisSpacer10.dart';
import '../constants/horisSpacer15.dart';
import '../constants/horisSpacer25h.dart';
import '../constants/horisSpacer5.dart';
import '../constants/textStyle1.dart';
import '../constants/textStyle2.dart';
import '../constants/textStyle3.dart';
import '../constants/textStyle4.dart';
import '../constants/vertSpacer5.dart';
import '../models/call_button.dart';
import '../models/chat_button.dart';

class DetailPage extends StatefulWidget {
  Product product;

  DetailPage({Key? key,required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(widget.product.picture),
                  ),
                  spacer10h,
                  Text(widget.product.product,
                      style: textStyle1),
                  spacer10h,
                  Text(
                    "${widget.product.price} ${widget.product.currency}",
                    style: textStyle2,
                  ),
                  spacer15h,
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        callButton,
                        spacer5v,
                        chatButton,
                      ],
                    ),
                  ),
                  spacer25h,
                  Text('New',
                      style: textStyle3),
                  spacer10h,
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 10,
              left: 10,
              right: 10),
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 5  horizontally
                  2.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.user.firstName,
                        style: textStyle4),
                    spacer5h,
                    Text(widget.product.user.phoneNumber)
                  ],
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/img_1.png"),
                radius: 25,
              )
            ],
          ),
        )
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
