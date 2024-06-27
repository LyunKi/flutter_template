import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/business/constants.dart';

final options = BaseOptions(
  baseUrl: dotenv.env[baseUrl]!,
);

final api = Dio(options);
