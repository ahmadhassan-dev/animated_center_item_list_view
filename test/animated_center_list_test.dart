import 'package:animated_center_list/animated_center_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CenterAnimatedList centers an item', (WidgetTester tester) async {
    // Create a CenterAnimatedList with a known item count
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CenterAnimatedList(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index, bool isCentered) {
            return ListTile(
              title: Text('Item $index'),
              tileColor: isCentered ? Colors.black : Colors.transparent,
            );
          },
        ),
      ),
    ));

    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pumpAndSettle();
    expect(
      tester.widgetList(find.byType(ListTile)).where((tile) {
        if (tile is ListTile && tile.tileColor == Colors.black) {
          return true;
        }
        return false;
      }),
      isNotEmpty,
    );
  });
}
