import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class Image_picker extends StatefulWidget {
  const Image_picker({super.key});
  @override
  State<Image_picker> createState() => _Image_pickerState();
}

class _Image_pickerState extends State<Image_picker> {

  File? _image;
  String image_name ='';

  Future gelleryImage()async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
      image_name = pickedFile.path.split('/').last;
    });
  }

  Future cameraImage()async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile!.path);
      image_name = pickedFile.path.split('/').last;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              gelleryImage();

    },
                child: Text("From Gallery")
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
              cameraImage();

            },
                child: Text("Camera")
            ),
            SizedBox(height: 20),
            _image != null
                ? Image.file(
              _image!,
              height: 250,
              width: 200,
            )
                : Text('No image selected'),
          ],
        ),
      ),
    );
  }
}
