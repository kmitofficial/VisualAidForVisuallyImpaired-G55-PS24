import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volunteer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VolunteerScreen(),
    );
  }
}

class VolunteerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visual Aid App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VisualAssistancePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 100),
              ),
              child: Text(
                'Do you need visual assistance?',
                style: TextStyle(color: Colors.black,fontSize: 20,),
              ),
            ),
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VolunteerPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 100),
              ),
              child: Text(
                'I would like to volunteer.',
                style: TextStyle(color: Colors.black,fontSize: 20,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VisualAssistancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visual Assistance Page'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100,),
              ElevatedButton(
                onPressed: () {
                  // Placeholder: Implement functionality for Image and Video Processor
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>ImageUploadScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Text('Image and Video Processor',
                  style: TextStyle(color: Colors.black,fontSize: 18,),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Placeholder: Implement functionality for Talk with Chat bot
                  print('Initiating Chat bot...');
                },
                child: Text('Talk with Chat bot',
                  style: TextStyle(color: Colors.black,fontSize: 18,),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Placeholder: Implement functionality for Call My Volunteer
                  print('Calling My Volunteer...');
                },
                child: Text('Call My Volunteer',
                  style: TextStyle(color: Colors.black,fontSize: 18,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// **********************************************

class VolunteerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Volunteer Page'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
// **********************************************
class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  String _responseMessage = '';

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      _showSnackbar('Please select an image');
      return;
    }

    // API endpoint URL
    var url = 'http://10.0.2.2:5000/caption'; // Update with your server URL

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add image to the request
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

    try {
      // Send request
      var response = await request.send();

      if (response.statusCode == 200) {
        // Image uploaded successfully
        String responseBody = await response.stream.bytesToString();
        setState(() {
          _responseMessage = responseBody;
        });
        _showSnackbar('Image uploaded successfully :)');
      } else {
        // Handle other status codes
        _showSnackbar('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      _showSnackbar('Error uploading image: $e');
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image and Video Processing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text('No image selected')
                : Image.file(_image!),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: Text(
                _responseMessage,
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _getImage(ImageSource.camera),
            tooltip: 'Capture Image',
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => _getImage(ImageSource.gallery), // Specify ImageSource.gallery
            tooltip: 'Select Image',
            child: Icon(Icons.add_a_photo),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _uploadImage,
            tooltip: 'Upload Image',
            child: Icon(Icons.cloud_upload),
          ),
        ],
      ),
    );
  }
}
