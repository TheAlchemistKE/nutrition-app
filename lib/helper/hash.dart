import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

final uuid = Uuid(options: {'grng': UuidUtil.cryptoRNG});

String hash() => uuid.v4();
