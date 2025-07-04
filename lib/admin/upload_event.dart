import 'package:flutter/material.dart';

class UploadEvent extends StatefulWidget {
  const UploadEvent({super.key});

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  final List<String> _eventTypes = [
    'Music Concert',
    'Food Festival',
    'Clothing Sale',
    'Festival',
  ];
  String? _selectedEventType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40 , left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.black, size: 30),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 5,),
                Text('Upload Event',
                  style: TextStyle(
                    color:const Color.fromARGB(255, 98, 12, 210),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: 90,
                width:90,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.add_a_photo,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 22,),
            Text('Enter Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Event Name',
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text('Ticket price',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Ticket Price',
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text('Select Event Category',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Select Event Type',
                  ),
                  value: _selectedEventType,
                  items: _eventTypes.map((String eventType) {
                    return DropdownMenuItem<String>(
                      value: eventType,
                      child: Text(eventType,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedEventType = newValue;
                    });
                  },
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  hint: Text(
                    'Select Event Type',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  iconSize: 24,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text('Event Detail',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Describe the event details here',
                ),
              ),
            ),
            // Container(decoration: BoxDecoration(
            //   color: const Color.fromARGB(255, 98, 12, 210),
            //   borderRadius: BorderRadius.circular(10),
            // ),child: ElevatedButton(
            //   onPressed: () {
            //     // Handle upload event logic here
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(
            //         content: Text('Event Uploaded Successfully!'),
            //         backgroundColor: Colors.green,
            //       ),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color.fromARGB(255, 98, 12, 210),
            //     padding: EdgeInsets.symmetric(vertical: 15),
            //   ),
            //   child: Text(
            //     'Upload Event',
            //     style: TextStyle(fontSize: 18, color: Colors.white),
            //   ),
            // ),
            // ),
            Center(
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 98, 12, 210),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}