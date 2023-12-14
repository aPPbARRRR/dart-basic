import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:typed_data';

class ImgService {
  num imgBytes = 0;
  String imgUrl = 'https://alimipro.com/favicon.ico';

  // 문제3-1. 사진 다운로드, 문제 6 url 잘못된 경우 예외처리
  Future<Uint8List?> downloadImage(String url) async {
    try {
      Uint8List data = await http.readBytes(Uri.parse(url));
      return data;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 문제3-2. 이미지 파일 저장
  Future<File?> saveFile(Uint8List? bytes, String fileName) async {
    File newFile = File('lib/12_14/assignment2_img_download/$fileName');
    if (bytes == null) return null;
    await newFile.writeAsBytes(bytes);
    return newFile;
  }

  // 문제 5 병렬처리 비교 위한 함수
  Future<void> downLoadMultiple(
      {required int time, required String downloadUrl}) async {
    for (int i = 0; i < time; i++) {
      Uint8List? imageBytes = await downloadImage(downloadUrl);
      File? savedFile = await saveFile(imageBytes, 'icon$i.ico');
      if (savedFile != null) imgBytes += await savedFile.length();
    }
  }

  // 문제 5 병렬처리 비교 위한 함수
  Future<void> downLoadOnce({required String downloadUrl}) async {
    Uint8List? imageBytes = await downloadImage(downloadUrl);
    File? savedFile =
        await saveFile(imageBytes, 'icon${DateTime.now().microsecond}.ico');
    if (savedFile != null) imgBytes += await savedFile.length();
  }

  // 문제 5 병렬처리 비교 위한 출력함수
  Future<void> printDownloadInfo(
      {required bool isParallel, required int repeatTime}) async {
    print('다운로드 시작');
    final stopwatch = Stopwatch()..start();
    isParallel
        ? await Future.wait(List.generate(
            repeatTime, (index) => downLoadOnce(downloadUrl: imgUrl)))
        : await downLoadMultiple(time: repeatTime, downloadUrl: imgUrl);
    stopwatch.stop();
    print('다운로드 끝');
    print('========');
    print('소요시간 : ${stopwatch.elapsed}');
    print('용량 : $imgBytes');
  }
}

