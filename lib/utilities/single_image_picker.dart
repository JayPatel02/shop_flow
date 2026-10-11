import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

Future<String?> pickImageFromGallery() async{
  try{
    final XFile? selectedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    return selectedImage?.path;
  }catch (e) {
    throw Exception("Error in image Picker");
  }
}