import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:convert';
import 'package:video_player/video_player.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;



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
                _speak("tap on the upper half for image processing and tap on the below half for video processing");
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
                _speak("now you can call your volunteer");
              },
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Call My Volunteer',
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
                child: Text('Images And Caption'),
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
        await http.get(Uri.parse('http://192.168.212.229:5000/conversations'));

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
bool checkHazardous(String s){
  List<String> words = ["knife", "fire", "water","flames","couch","pillow"];
  bool found = words.any((word) => s.contains(word));
  return found;
}
class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  String _responseMessage = '';
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  Future<void> _playAudio(String path) async {
    await _assetsAudioPlayer.open(
      Audio(path),
      autoStart: true,
      showNotification: true,
    );
  }

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
        'http://192.168.212.229:5000/caption'; // Update with your server URL

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
        if(checkHazardous(responseBody)){
          await _playAudio("assets/sound/Alarm.mp3");
        }

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
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _isSpeaking = false;

  late List<String> storedPassages;

  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    flutterTts = FlutterTts();
    flutterTts.setCompletionHandler(() {
      setState(() {
        _isSpeaking = false;
      });
    });
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
      Uri.parse('http://192.168.212.229:5002/process_video'),
    );
    request.files.add(await http.MultipartFile.fromPath('video', videoPath!));
    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      setState(() {
        _responseMessage = responseBody;
      });
      // Split the response message into sentences using multiple delimiters and optional whitespace
      storedPassages = responseBody.split(RegExp(r'[.!?]\s*'));

      // Print the sentences to verify
      print(responseBody);
      for (int i = 0; i < storedPassages.length; i++) {
        print('Sentence $i: "${storedPassages[i].trim()}"');
      }
      await _speak(_responseMessage);
      await _askForQueries(); // Wait for queries to finish
      print('Video uploaded successfully');
    } else {
      setState(() {
        _responseMessage = 'Video upload failed';
      });
      await _speak(_responseMessage);
      print('Video upload failed');
    }
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    setState(() {
      _isSpeaking = true;
    });
    await flutterTts.speak(text);
    while (_isSpeaking) {
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  Future<void> _askForQueries() async {
    bool validResponse = false;
    while (!validResponse) {
      await _speak("Do you have any queries? Please say yes or no.");
      validResponse = await _listenForResponse();
    }
  }

  Future<bool> _listenForResponse() async {
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );

    if (available) {
      setState(() => _isListening = true);
      String result = '';
      bool validResponse = false;
      _speech.listen(
        onResult: (val) => setState(() {
          result = val.recognizedWords.toLowerCase();
          _isListening = false;
          validResponse = _handleResponse(result);
        }),
      );
      while (_isListening) {
        await Future.delayed(Duration(milliseconds: 100));
      }
      return validResponse;
    } else {
      setState(() => _isListening = false);
      return false;
    }
  }

  bool _handleResponse(String response) {
    print("Response received: $response");
    if (response == 'yes' || response == 'no') {
      if (response.contains('yes')) {
        _handleYesResponse();
      } else if (response.contains('no')) {
        return true;
      } else {
        print("Invalid response: $response");
        return false;
      }
      return true;
    } else {
      _speak("I didn't catch that. Please say yes or no.");
      return false;
    }
  }

  void _handleYesResponse() async {
    bool furtherQueries = true;
    while (furtherQueries) {
      await _speak("Please state your query.");
      String query = await _getQuery();
      print("User query: $query");
      if (query.isNotEmpty) {
        await _makeApiRequest(query);
        await _speak("Do you have any further queries? Please say yes or no.");
        furtherQueries = await _listenForFurtherQueries();
      } else {
        furtherQueries = false;
      }
    }
  }

  Future<String> _getQuery() async {
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );

    if (available) {
      // await _speak("Please state your query.");
      setState(() => _isListening = true);
      String result = '';
      _speech.listen(
        onResult: (val) => setState(() {
          result = val.recognizedWords.toLowerCase();
          if (val.finalResult) {
            _isListening = false;
          }
        }),
        listenFor: Duration(seconds: 10),
      );

      while (_isListening) {
        await Future.delayed(Duration(milliseconds: 100));
      }

      return result.trim();
    } else {
      setState(() => _isListening = false);
      return '';
    }
  }

  Future<void> _makeApiRequest(String query) async {
    try {
      var request = http.Request(
        'POST',
        Uri.parse('http://192.168.212.229:5003/api/query'),
      );
      request.headers['Content-Type'] = 'application/json';
      request.body = jsonEncode({
        'query': query,
        'stored_passages': storedPassages,
      });
      var response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print("API Response: $responseBody");
        List<String> answers = _parseAnswers(responseBody);
        setState(() {
          _responseMessage = answers.join("\n");
        });
        print(_responseMessage);
        await _speak(_responseMessage);
      } else {
        setState(() {
          _responseMessage = 'Query processing failed';
        });
        await _speak(_responseMessage);
      }
    } catch (e) {
      setState(() {
        _responseMessage = 'An error occurred: $e';
      });
      await _speak(
          "Error occurred while querying... Could not complete your response");
      print('An error occurred: $e');
    }
  }

  List<String> _parseAnswers(String responseBody) {
    Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
    List<String> answers = List<String>.from(jsonResponse['answers']);
    return answers;
  }

  Future<bool> _listenForFurtherQueries() async {
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );

    if (available) {
      setState(() => _isListening = true);
      String result = '';
      _speech.listen(
        onResult: (val) => setState(() {
          result = val.recognizedWords.toLowerCase();
          _isListening = false;
        }),
      );
      while (_isListening) {
        await Future.delayed(Duration(milliseconds: 100));
      }
      if (result.contains('yes')) {
        return true;
      } else if (result.contains('no')) {
        return true;
      } else {
        print("Invalid response: $result");
        return await _listenForFurtherQueries();
      }
    } else {
      setState(() => _isListening = false);
      return false;
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
