import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:kanban_flutter/data/card/card.dart';

part 'board.g.dart';

@injectable
@HiveType(typeId: 0)
class Board {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<BoardCard> cards;

  @HiveField(2)
  final int index;

  @HiveField(3, defaultValue: 0)
  final int backgroundIndex;

  Board({
    required this.title,
    required this.cards,
    required this.index,
    this.backgroundIndex = 0,
  });
}
