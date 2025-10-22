import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';

class MyAlbumScreen extends StatelessWidget {
  const MyAlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Album'),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: SizedBox(
          width: double.infinity, // full width
          height: 56, // chiều cao nút
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Upload Photos'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Show your best self',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 2,
                  ),
                ),
                Text(
                  'Upload up to six of your best photos to make a fantastic first impression. Let your personality shine.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    // Create a grid with 2 columns.
                    // If you change the scrollDirection to horizontal,
                    // this produces 2 rows.
                    crossAxisCount: 2,
                    // Generate 100 widgets that display their index in the list.
                    children: List.generate(4, (index) {
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
