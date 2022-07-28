import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../main_tab/main_tab_page.dart';
import 'package:health/health.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

// 进行输入的默认值
final inputProvider = StateProvider((ref) => '');

class GiftPage extends ConsumerWidget {
  const GiftPage({Key? key}) : super(key: key);

  Future<void> _getConataction() async {
    if (await FlutterContacts.requestPermission()) {
      // Get all contacts (lightly fetched)
      List<Contact> contacts = await FlutterContacts.getContacts();

      // Get all contacts (fully fetched)
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      //
    }else {
      // 如果用户不同意使用通讯录权限时怎么办
    }
  }

  void _getCameraPhoto() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // Capture a photo
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    // Pick a video
    // final XFile? image = await _picker.pickVideo(source: ImageSource.gallery);
    // Capture a video
    // final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    // Pick multiple images
    // final List<XFile>? images = await _picker.pickMultiImage();

    // print(image);
    print(photo);

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexState = ref.watch(indexProvider);
    final inputState = ref.watch(inputProvider);

    return Center(
        child: Column(
      children: [
        Text("プレゼント画面 $indexState"),
        TextFormField(
          autofocus: false,
          decoration: const InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)),
          onChanged: (v) {
            // Change the value of the input
            ref.read(inputProvider.notifier).state = v;
          },
          initialValue: inputState,
        ),
        // Button for health check
        ElevatedButton(
          child: const Text("Get Health Check"),
          onPressed: () {
            _getConataction();
          },
        ),
        ElevatedButton(
          child: const Text("Camera"),
          onPressed: () {
            // Pick an image
            _getCameraPhoto();
          },
        ),
      ],
    ));
  }
}
