import 'dart:typed_data';

import 'img_service.dart';

void main() async {
  // 연습문제 3-1. 사진 다운로드하여 Unit8List?로 받음
  Uint8List? imageBytes =
      await ImgService().downloadImage('https://alimipro.com/favicon.ico');

  // 연습문제 3-2. 사진 저장하여 File? 리턴
  await ImgService().saveFile(imageBytes, 'icon.ico');

  // 연습문제 4, 5
  await ImgService()
      .printDownloadInfo(isParallel: false, repeatTime: 5); // 병렬처리 안함
  ImgService().printDownloadInfo(isParallel: true, repeatTime: 5); // 병렬로 처리함
}
