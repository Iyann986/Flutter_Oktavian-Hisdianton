import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mime_type/mime_type.dart';

class FileInfo {
  final String path;
  final String mimeType;

  FileInfo(this.path, this.mimeType);
}

class FileTypeHelper {
  static Future<String?> getFileMimeType(String filePath) async {
    final mimeType = lookupMimeType(filePath);
    if (mimeType != null) {
      return mimeType;
    }
    final fileExtension = filePath.split('.').last;
    switch (fileExtension) {
      case 'apk':
        return 'application/vnd.android.package-archive';
      case 'txt':
        return 'text/plain';
      default:
        return null;
    }
  }

  static String? lookupMimeType(String filePath) {
    final mimeType = mimeTypeMap[filePath.split('.').last.toLowerCase()];
    return mimeType ?? null;
  }

  static final Map<String, String> mimeTypeMap = {
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'gif': 'image/gif',
    'bmp': 'image/bmp',
    'webp': 'image/webp',
    'pdf': 'application/pdf',
    'doc': 'application/msword',
    'docx':
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'xls': 'application/vnd.ms-excel',
    'xlsx': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'ppt': 'application/vnd.ms-powerpoint',
    'pptx':
        'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'txt': 'text/plain',
    'mp3': 'audio/mpeg',
    'wav': 'audio/wav',
    'mp4': 'video/mp4',
    'avi': 'video/x-msvideo',
    'flv': 'video/x-flv',
    'wmv': 'video/x-ms-wmv',
  };
}
