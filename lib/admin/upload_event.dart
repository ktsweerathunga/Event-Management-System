import 'dart:io';

import 'package:event_management_system/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class UploadEvent extends StatefulWidget {
  const UploadEvent({super.key});

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController detailController = new TextEditingController();
  final List<String> _eventTypes = [
    'Music Concert',
    'Food Festival',
    'Clothing Sale',
    'Festival',
  ];
  String? _selectedEventType;
  final ImagePicker _imagePicker = ImagePicker();

  File? selectedImage;

  Future getImage() async {
    var image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      maxHeight: 600,
    );
    selectedImage = File(image!.path);
    setState(() {
      // Update the UI to reflect the selected image
    });
  }

  // Future<void> _pickImage() async {
  //   final XFile? image = await _imagePicker.pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 600,
  //     maxHeight: 600,
  //   );
  //   if (image != null) {
  //     // Handle the selected image
  //     print('Image selected: ${image.path}');
  //   } else {
  //     print('No image selected.');
  //   }
  // }  

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
            selectedImage != null
            ? Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  selectedImage! , 
                  height: 160 , 
                  width: 160,
                  fit: BoxFit.cover,),
              ),
            ):

            Center(
              child: GestureDetector(
                onTap: (){
                  getImage();
                },
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
                controller: nameController,
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
                controller: priceController,
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
                controller: detailController,
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
            GestureDetector(
              onTap: () async {
                // String addId = randomAlphaNumeric(10);
                // // Here you can add the logic to upload the event details
                // // For example, you can save the event details to Firestore or any other database
                // Reference storageReference = FirebaseStorage.instance
                //     .ref()
                //     .child('BlogImages') // a folder that be created in Firebase Storage
                //     .child(addId + '.jpg');

                // final UploadTask uploadTask = storageReference.putFile(selectedImage!);
                // //getting the url of the image that wea are uploading
                // var downloadUrl = storageReference.getDownloadURL();
                String id = randomAlphaNumeric(10);

                Map<String, dynamic> uploadeventData = {
                  'Mame': nameController.text,
                  'Price': priceController.text,
                  'EventType': _selectedEventType,
                  'Detail': detailController.text,
                  'ImageUrl': '',
                };

                await DatabaseMethods().addEvent(uploadeventData, id).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Event Uploaded Successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  // Clear the input fields after successful upload
                  nameController.clear();
                  priceController.clear();
                  detailController.clear();
                  setState(() {
                    selectedImage = null; // Reset the selected image
                    _selectedEventType = null; // Reset the selected event type
                  });
                }).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to upload event: $error'),
                      backgroundColor: Colors.red,
                    ),
                  );
                });
              },
              child: Center(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}