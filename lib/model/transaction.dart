import 'package:hive/hive.dart';
part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  late String tweet;
  @HiveField(1)
  late DateTime createdAt;
  @HiveField(2)
  late String id;
}
