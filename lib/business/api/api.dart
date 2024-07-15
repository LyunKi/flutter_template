import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/business/constants.dart';
import 'package:harmony/harmony.dart';


final options = BaseOptions(
  baseUrl: dotenv.env[baseUrl]!,
);

final api = Api(dioOptions: options);
