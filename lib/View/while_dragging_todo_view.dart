import 'package:flutter/material.dart';
import 'package:todo_app/UseCase/Dto/todo_dto.dart';

class WhileDraggingTodoView extends StatelessWidget {
  const WhileDraggingTodoView({super.key, required this.todoDto});

  final TodoDto todoDto;
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape; // 縦or横を取得
    final screenWidth = MediaQuery.of(context).size.width; // 画面幅の取得
    return Opacity(
      opacity: 0.7,
      child: Material(
        child: SizedBox(
          width: screenWidth * 0.8,
          height: 60,
          child: Card(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black38, //色
                width: 0.5, //太さ
              ),
            ),
            child: ListTile(
              title: Text(todoDto.title),
              trailing: FractionallySizedBox(
                widthFactor: 0.2,
                child: Center(
                  child: Row(
                    mainAxisAlignment: isLandscape
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xfff7a3a3),
                        ),
                        child: Center(
                          child: Text(
                            todoDto.emergencyPoint.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xfff7d092),
                        ),
                        child: Center(
                          child: Text(
                            todoDto.priorityPoint.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
