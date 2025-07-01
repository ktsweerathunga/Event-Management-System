import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/event.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 2,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                          Get.offAllNamed('/home');
                          // Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(top: 30, left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white ,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new, 
                            color: Colors.black, size: 30),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("BnS Music Festival",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined, 
                                  color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text("30 Nov 2025",
                                  style: TextStyle(
                                    color: const Color.fromARGB(151, 255, 255, 255),
                                    fontSize: 16,
                                  ),
                                ), 
                                SizedBox(width: 20),
                                Icon(
                                  Icons.location_on_outlined, 
                                  color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text("Colombo, Sri Lanka",
                                  style: TextStyle(
                                    color: const Color.fromARGB(151, 255, 255, 255),
                                    fontSize: 16,
                                  ),
                                ), 
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'About Event' , 
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'We bring you the ultimate BnS experience—celebrating Sri Lanka’s iconic pop duo with unforgettable live performances, vibrant culture, and pure musical energy. Join us and be part of the vibe!' , 
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Number of Tickets: ' , 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '+',
                          style: TextStyle(
                            color: Colors.black, fontSize: 25
                          ),),
                        Text(
                          '3',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 149, 19, 219), 
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text(
                          '-',
                          style: TextStyle(
                            color: Colors.black, fontSize: 25
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                children: [
                  Text(
                    'Amount : \$150.00',  
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 98, 12, 210),
                    ),),
                  SizedBox(width: 20),
                  Container(
                    width: 200,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 98, 12, 210),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Book now' , 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}