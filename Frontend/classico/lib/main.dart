import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:convert';
import 'package:video_player/video_player.dart';

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
// class SignUp extends StatefulWidget {
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("SignUp"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("SignUP",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
//           SizedBox(height: 20,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: TextFormField(
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 labelText: "mobile",
//                 hintText: "enter your mobile number",
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.verified_user),
//               ),
//             ),
//           ),
//           SizedBox(height: 20,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: TextFormField(
//               keyboardType: TextInputType.visiblePassword,
//               decoration: InputDecoration(
//                 labelText: "mobile",
//                 hintText: "enter your mobile number",
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.password),
//               ),
//             ),
//           ),
//           SizedBox(height: 20,),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.blue,
//                 minimumSize: Size(150, 50),
//               ),
//               onPressed: (){},
//               child: Text("Save",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//           ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login Page"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Login",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),),
//             SizedBox(height: 20,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: TextFormField(
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   labelText: "mobile",
//                   hintText: "enter your mobile number",
//                   prefixIcon: Icon(Icons.verified_user),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: TextFormField(
//                 keyboardType: TextInputType.visiblePassword,
//                 decoration: InputDecoration(
//                   labelText: "password",
//                   hintText: "enter your password",
//                   prefixIcon: Icon(Icons.password),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.blue,
//                 minimumSize: Size(150, 50),
//               ),
//               onPressed: (){
//
//               },
//               child: Text("Submit",style: TextStyle(fontSize: 20),),
//             ),
//             SizedBox(height: 20,),
//             InkWell(
//               onTap: (){
//                 Navigator.push(context,MaterialPageRoute(builder: (context)=> SignUp()),
//                 );
//               },
//               child: Text("Want to signUP?",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,decoration: TextDecoration.underline),),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


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
                  MaterialPageRoute(
                      builder: (context) => VisualAssistancePage()),
                );
              },
              child: Container(
                color: Colors.lightBlue.shade500,
                child: Center(
                  child: Text(
                    'Do you need visual assistance?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
                _speak("tap on the upper half for image processing");
                _speak("tap on the below half for video processing");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageAndVideoProcessing()),
                );
              },
              child: Container(
                color: Colors.lightBlue,
                child: Center(
                  child: Text(
                    'Image and Video Processor',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
class ImageAndVideoProcessing extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image And Video processing ",style: TextStyle(fontSize: 20),),
      ),
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                _speak("tap anywhere on the screen to capture an image");
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => ImageUploadScreen()),
                );
              },
              child: Container(
                color: Colors.lightBlue,
                child: Center(
                  child: Text(
                    'Image Processor',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                _speak("tap anywhere on the screen to capture a video");
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => VideoProcessingPage()),
                );
              },
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Video Processor',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoadConversations()),
                  ); // Navigate back to previous screen
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.blue.shade600,
                  foregroundColor: Colors.white,
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: Text('Images And Captions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -------------------------------
class LoadConversations extends StatefulWidget {
  @override
  _LoadConversationsState createState() => _LoadConversationsState();
}

class _LoadConversationsState extends State<LoadConversations> {
  Future<List<dynamic>> fetchConversations() async {
    final response =
        await http.get(Uri.parse('http://192.168.241.215:5000/conversations'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load conversations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image and Caption Display'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchConversations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data ?? [];
            if (data.isEmpty) {
              return Center(child: Text('No conversations found'));
            }
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final chat = data[index];
                final caption = chat['caption'];
                final imageBase64 = chat['image_file'];
                final imageBytes = base64Decode(imageBase64);

                return ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(caption ?? 'No Caption'),
                  subtitle: Image.memory(imageBytes),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// -----------------------------------

FlutterTts flutterTts = FlutterTts();

Future<void> _speak(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1.0);
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak(text);
}

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
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

    var url =
        'http://192.168.241.215:5000/caption'; // Update with your server URL

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
        _showSnackbar(
            'Failed to upload image. Status code: ${response.statusCode}');
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
        title: Text('Image Processing'),
      ),
      body: InkWell(
        onTap: _getImageAndUpload,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Text('No image selected',
                          style: TextStyle(fontSize: 18, color: Colors.grey))
                      : Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.8,
                            maxHeight: MediaQuery.of(context).size.height * 0.4,
                          ),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.contain,
                          ),
                        ),
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
      ),
    );
  }
}
class VideoProcessingPage extends StatefulWidget {
  @override
  _VideoProcessingPageState createState() => _VideoProcessingPageState();
}

class _VideoProcessingPageState extends State<VideoProcessingPage> {
  VideoPlayerController? _videoPlayerController;
  String? videoPath;
  String _responseMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        videoPath = pickedFile.path;
        _videoPlayerController = VideoPlayerController.file(File(videoPath!))
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController?.play();
          });
      });

      await _uploadVideo();
    }
  }

  Future<void> _uploadVideo() async {
    if (videoPath == null) return;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.241.215:5000/process_video'),
    );
    request.files.add(await http.MultipartFile.fromPath('video', videoPath!));
    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      setState(() {
        _responseMessage = responseBody;
        _speak(_responseMessage);
      });
      print('Video uploaded successfully');
    } else {
      setState(() {
        _responseMessage = 'Video upload failed';
      });
      print('Video upload failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Processing'),
      ),
      body: InkWell(
        onTap: _pickVideo,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_videoPlayerController == null ||
                      !_videoPlayerController!.value.isInitialized)
                    Text(
                      'No video selected',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  else
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8,
                        maxHeight: MediaQuery.of(context).size.height * 0.4,
                      ),
                      child: AspectRatio(
                        aspectRatio: _videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController!),
                      ),
                    ),
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
      ),
    );
  }
}
