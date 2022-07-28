# examples

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

**Flutter Examples**

打包
[https://flutter.cn/docs/deployment/android](https://flutter.cn/docs/deployment/android)
[https://flutter.cn/docs/deployment/ios](https://flutter.cn/docs/deployment/ios)

访问相机/相册
[https://pub.dev/packages/image_picker](https://pub.dev/packages/image_picker)
示例代码
```
import 'package:image_picker/image_picker.dart';
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

    print(photo);
  }

```
访问通讯录
[https://pub.dev/packages/flutter_contacts](https://pub.dev/packages/flutter_contacts)
示例代码

```
import 'package:flutter_contacts/flutter_contacts.dart';
  Future<void> _getConataction() async {
    if (await FlutterContacts.requestPermission()) {
      // Get all contacts (lightly fetched)
      List<Contact> contacts = await FlutterContacts.getContacts();

      // Get all contacts (fully fetched)
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
    }
  }
```

访问健康数据
[https://pub.dev/documentation/fit_kit/latest/](https://pub.dev/documentation/fit_kit/latest/)
需要企业账号，个人账号用不了。
示例代码

```
HealthFactory health = HealthFactory();
final now = DateTime.now();
final List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
    DateTime(now.year, now.month, now.day, 0, 0, 0),
    DateTime(now.year, now.month, now.day, 23, 59, 59),
    [HealthDataType.STEPS]
);
```

访问麦克风（录音）
[https://pub.dev/packages/record](https://pub.dev/packages/record)
暂无示例

Flutter环境切换
[https://pub.dev/packages/flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
[https://zenn.dev/someone7140/articles/2d0d65704a5b1e](https://zenn.dev/someone7140/articles/2d0d65704a5b1e)

flutter 多页面数据共享
[flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
```
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 定义值
final indexProvider =  StateProvider((ref) => 0);
// 引用值
final indexState = ref.watch(indexProvider);
// 改变值
onTap: (index) {
          ref.read(indexProvider.notifier).state = index;
        },
```
