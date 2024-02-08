// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:image_picker/image_picker.dart';


// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});
//   static String id = 'CameraScreen';
//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   XFile? images;
 
//  final imagePicker = ImagePicker();
//   Future getImage() async {
//     final image = await imagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       images = File(image!.path ) as XFile?;
//     });
//   }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: Center(
//           child:
//               images == null ? Text("No Image Selected") : Image.file(images! as File),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: getImage,
//           backgroundColor: Colors.amber,
//           child: Icon(Icons.camera_alt),
//         ),
//       );
//     }
//   }
  





// class CameraScreen extends StatefulWidget {
//   static String id = 'CameraScreen';
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   XFile? _image;
//   List? _output;
//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }

//   Future<void> loadModel() async {
//     await Tflite.loadModel(
//       model: 'model/model_unquant.tflite',
//       labels: 'model/labels.txt',
//     );
//   }
  
//    final imagePicker = ImagePicker();
//   Future getImage() async {
//     final image = await imagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _image = File(image!.path ) as XFile?;
//     });
//   }

//   Future<void> classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//       path: image.path,
//     );

//     setState(() {
//       _output = output;
//     });
//   }

//   @override
//   void dispose() {
//     Tflite.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Image Classification'),
//       ),
//       body: Column(
//         children: [
//           if (_image != null) Image.file(_image as File),
//           ElevatedButton(
//             onPressed: getImage,
//             child: Text('Pick Image'),
//           ),
//           if (_output != null) Text("Model Output: $_output"),
//         ],
//       ),
//     );
//   }
// }
