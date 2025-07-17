import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_management_system/services/database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream? eventStream;


  //so user don't need to sign up again and again
  //this function will be called when the home page is loaded
  ontheway() async {
    eventStream = await DatabaseMethods().getEventList();
    setState(() {});
  }

  @override
  void initState() { 
    super.initState();
    ontheway();
  }

  // Widget allEvents() {
  //   return StreamBuilder(stream: eventStream, builder: (context, AsyncSnapshot snapshot) {
  //     if (snapshot.hasData) {
  //       return ListView.builder(
  //         itemCount: snapshot.data?.length,
  //         itemBuilder: (context, index) {
  //           var event = snapshot.data[index];
  //           return ListTile(
  //             title: Text(event['name']),
  //             subtitle: Text(event['date']),
  //             trailing: Text('Rs. ${event['price']}'),
  //             onTap: () {
  //               // Navigate to event details
  //             },
  //           );
  //         },
  //       );
  //     } else {
  //       return Center(child: CircularProgressIndicator());
  //     }
  //   });
  // }

  Widget allEVENTS() {
    return StreamBuilder(stream: eventStream, builder: (context, AsyncSnapshot snapshot) {
      return snapshot.hasData
          ? ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];

                String inputDate= ds['Date']; // Example date, replace with actual date from ds if needed
                DateTime parsedDate = DateTime.parse(inputDate);
                String formattedDate = "${parsedDate.day}/${parsedDate.month}/${parsedDate.year}";

                return Column(
                  children: [
                    Container(
                                  margin: EdgeInsets.only(right: 20),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                  color: Colors.white,
                                  ),
                                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/event.png', fit: BoxFit.cover, height: 200, width: MediaQuery.of(context).size.width, ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(ds['date'] ,
                          textAlign: TextAlign.center, 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      )
                    ]
                                ),
                                ),
                  
            SizedBox(height: 5), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ds['name'] ,
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        color: const Color.fromARGB(255, 73, 41, 128),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                 Padding(
                   padding: const EdgeInsets.only(right: 20),
                   child: Text(ds['price'] ,
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      color: const Color.fromARGB(255, 58, 47, 78),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                 ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on_outlined, color: Colors.black,),
                Text(ds['location'] ,
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        color: const Color.fromARGB(255, 73, 41, 128),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
              ],
            ),
                ],
            );
              },
            )
          : Center(child: CircularProgressIndicator());
    });
  }

  

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
                  color: const Color.fromARGB(255, 73, 41, 128),
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
                      child: Container(
                        width: 130,
                        height: 130,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(20),),
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
                      child: Container(
                        width: 130,
                        height: 130,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(20)), 
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
                        decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(20),),
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
                      child: Container(
                        width: 130,
                        height: 130,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(20),),
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
                  Padding(padding: EdgeInsets.only(right: 20),    // see all with some padding from right
                    child: Text('See all' , style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),),
                  )
                ],
              ),
            ),

            SizedBox(height: 20),

            allEvents()
            // Expanded(
            //   child: allEVENTS(), // Displaying the events
            // ),              
           
          ],
        ),
      ),
    );
  }
}