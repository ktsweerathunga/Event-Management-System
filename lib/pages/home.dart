import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50 , left: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 217, 214, 228),
            const Color.fromARGB(255, 178, 185, 183),
            const Color.fromARGB(255, 255, 255, 255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight, ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(  // icon and the location
              children: [
                Icon(Icons.location_on_outlined),
                Text('Ratnapura' , style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
            SizedBox(height: 20),
            Text('Hello , Sandinu' , style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
            SizedBox(height: 8),
            Text('There are 20 events\naround your location' , style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
            SizedBox(height: 20),

            // Search bar
            Container(
              margin: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                //pading: EdgeInsets.only(left: 20),
                decoration: InputDecoration(
                  hintText: 'Search for events',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
              child: ListView( // to show categories
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 130,
                        height: 130,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/musical.png', height: 30, width: 30,fit: BoxFit.cover,),
                            Text('Music' , style: TextStyle(color: Colors.black , fontSize: 20),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 130,
                        height: 130,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/tshirt.png', height: 30, width: 30,fit: BoxFit.cover,),
                            Text('Clothing' , style: TextStyle(color: Colors.black , fontSize: 20),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 130,
                        height: 130,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/confetti.png', height: 30, width: 30,fit: BoxFit.cover,),
                            Text('Festival' , style: TextStyle(color: Colors.black , fontSize: 20),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 130,
                        height: 130,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/dish.png', height: 30, width: 30,fit: BoxFit.cover,),
                            Text('Food' , style: TextStyle(color: Colors.black , fontSize: 20),)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Upcoming Events' , style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                ],
              ),
            ),
            Container(
              
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}