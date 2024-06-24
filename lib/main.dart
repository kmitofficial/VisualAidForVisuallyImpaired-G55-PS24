// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }











// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:permission_handler/permission_handler.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Volunteer App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: VolunteerScreen(),
//     );
//   }
// }

// class VolunteerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Visual Aid App'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => VisualAssistancePage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(300, 100),
//                   backgroundColor: Colors.blue.shade600,
//                   foregroundColor: Colors.white,
//                   textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 child: Text('Do you need visual assistance?'),
//               ),
//               SizedBox(height: 100),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => VolunteerPage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(300, 100),
//                   backgroundColor: Colors.green.shade600,
//                   foregroundColor: Colors.white,
//                   textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 child: Text('I would like to volunteer.'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class VisualAssistancePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Visual Assistance Page'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ImageUploadScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(200, 50),
//                   backgroundColor: Colors.blue.shade600,
//                   foregroundColor: Colors.white,
//                   textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 child: Text('Image and Video Processor'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   print('Initiating Chat bot...');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(200, 50),
//                   backgroundColor: Colors.blue.shade600,
//                   foregroundColor: Colors.white,
//                   textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 child: Text('Talk with Chat bot'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   print('Calling My Volunteer...');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(200, 50),
//                   backgroundColor: Colors.blue.shade600,
//                   foregroundColor: Colors.white,
//                   textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 child: Text('Call My Volunteer'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class VolunteerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Volunteer Page'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'This is the Volunteer Page',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Navigate back to previous screen
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue.shade600,
//                   foregroundColor: Colors.white,
//                   textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 child: Text('Go Back'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// FlutterTts flutterTts = FlutterTts();

// Future<void> _speak(String text) async {
//   await flutterTts.setLanguage("en-US");
//   await flutterTts.setPitch(1.0);
//   await flutterTts.setSpeechRate(0.5);
//   await flutterTts.speak(text);
// }


// class ImageUploadScreen extends StatefulWidget {
//   @override
//   _ImageUploadScreenState createState() => _ImageUploadScreenState();
// }

// class _ImageUploadScreenState extends State<ImageUploadScreen> {
//   File? _image;
//   String _responseMessage = '';

//   Future<void> _getImage(ImageSource source) async {
//     await _requestPermissions(); // Request permissions
//     _speak("Please upload an image");
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);

//     setState(() {
//       _image = pickedFile != null ? File(pickedFile.path) : null;
//     });

//     _uploadImage();
//   }

//   Future<void> _uploadImage() async {
//     if (_image == null) {
//       _speak("No image has been selected");
//       _showSnackbar('Please select an image');
//       return;
//     }

//     // API endpoint URL
//     var url = 'http://10.0.2.2:5000/caption'; // Update with your server URL
//     // var url = 'http://192.168.1.x:5000/caption';

//     // Create a multipart request
//     var request = http.MultipartRequest('POST', Uri.parse(url));

//     // Add image to the request
//     request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

//     try {
//       // Send request
//       var response = await request.send();

//       if (response.statusCode == 200) {
//         // Image uploaded successfully
//         String responseBody = await response.stream.bytesToString();
//         _speak(responseBody);
//         setState(() {
//           _responseMessage = responseBody;
//         });
//         _showSnackbar('Image Uploaded Successfully :)');
//       } else {
//         // Handle other status codes
//         _showSnackbar('Failed to upload image. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions
//       _showSnackbar('Error uploading image: $e');
//     }
//   }

//   Future<void> _requestPermissions() async {
//     var statuses = await [
//       Permission.camera,
//       Permission.storage,
//     ].request();

//     var allGranted = statuses.values.every((status) => status.isGranted);

//     if (!allGranted) {
//       _showSnackbar('Permissions are required to use this feature');
//       openAppSettings();
//     }
//   }

//   void _showSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _image == null
//                 ? Text('No image selected')
//                 : Image.file(_image!),
//             SizedBox(height: 20),
//             Text(
//               _responseMessage,
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(vertical: 16.0),
//         color: Colors.blue, // Background color for the container
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             FloatingActionButton(
//               onPressed: () => _getImage(ImageSource.gallery),
//               tooltip: 'Select Image',
//               child: Icon(Icons.add_a_photo),
//             ),
//             FloatingActionButton(
//               onPressed: () => _getImage(ImageSource.camera),
//               tooltip: 'Take a Photo',
//               child: Icon(Icons.camera_alt),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }












import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
      body: Column(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                _speak("Entered visual assistance page");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VisualAssistancePage()),
                );
              },
              child: Container(
                color: Colors.lightBlue.shade500,
                child: Center(
                  child: Text(
                    'Do you need visual assistance?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VolunteerPage()),
                );
              },
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'I would like to volunteer.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
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
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                _speak("tap anywhere to capture an image");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageUploadScreen()),
                );
              },
              child: Container(
                color: Colors.lightBlue,
                child: Center(
                  child: Text(
                    'Image and Video Processor',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                _speak("Ask your questions by calling jarvis");
              },
              child: Container(
                color: Colors.white70,
                child: Center(
                  child: Text(
                    'Talk with Chat bot',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                _speak("now you can call your volunteer");
              },
              child: Container(
                color: Colors.lightBlue.shade500,
                child: Center(
                  child: Text(
                    'Call My Volunteer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class VolunteerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'This is the Volunteer Page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to previous screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: Text('History'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

FlutterTts flutterTts = FlutterTts();

Future<void> _speak(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1.0);
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak(text);
}


class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  String _responseMessage = '';

  Future<void> _getImageAndUpload() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      _showSnackbar('Please select an image');
      return;
    }
    var url = 'http://192.168.143.215:5000/caption'; // Update with your server URL
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        setState(() {
          _responseMessage = responseBody;
          _speak(_responseMessage);
        });
        _showSnackbar('Image uploaded successfully :)');
      } else {
        _showSnackbar('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
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
      body: InkWell(
        onTap: _getImageAndUpload,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _image == null
                    ? Text('No image selected', style: TextStyle(fontSize: 18, color: Colors.grey))
                    : Image.file(_image!),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: Text(
                    _responseMessage,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}