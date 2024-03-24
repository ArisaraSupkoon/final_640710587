import 'package:flutter/material.dart';
import 'api_caller.dart';
import 'dialog_utils.dart';
import 'my_list_tile.dart';
import 'my_text_field.dart';

void main() {
  runApp(WebbyFondueApp());
}

class WebbyFondueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webby Fondue',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 231, 191, 205),
      ),
      home: WebbyFondueHomePage(),
    );
  }
}

class WebbyFondueHomePage extends StatefulWidget {
  @override
  _WebbyFondueHomePageState createState() => _WebbyFondueHomePageState();
}

class _WebbyFondueHomePageState extends State<WebbyFondueHomePage> {
  TextEditingController urlController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  String? selectedWebType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Webby Fondue')),
        backgroundColor: Color.fromARGB(255, 102, 162, 211),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('ระบบรายงานเว็บเลวๆ', style: TextStyle(fontSize: 16.0)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(
              controller: urlController,
              hintText: 'URL *',
              hintStyle: TextStyle(color: Colors.grey), hintTextStyle: TextStyle(), 
            ),
            SizedBox(height: 20.0),
            MyTextField(
              controller: detailsController,
              hintText: 'รายละเอียด',
              hintStyle: TextStyle(color: Colors.grey), hintTextStyle: TextStyle(),
            ),
            SizedBox(height: 20.0),
            MyListTile(
              title: 'ระบุประเภทเว็บ *',
              subtitle: selectedWebType ?? 'เลือกประเภทเว็บ',
              imageUrl: '', 
              onTap: () {
                // ใส่โค้ดเลือกประเภทเว็บ
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // ตรวจสอบข้อมูลครบหรือไม่
                if (urlController.text.isEmpty || selectedWebType == null) {
                  // แสดง dialog หากข้อมูลไม่ครบ
                  showOkDialog(
                    context: context,
                    title: 'ข้อมูลไม่ครบ',
                    message: 'กรุณากรอก URL และเลือกประเภทเว็บ',
                  );
                } else {
                  // ส่งข้อมูลไปยัง API
                  // นำผลลัพธ์จาก response ของ API มาแสดงใน dialog
                  // ล้างฟอร์ม
                  // เรียก setState เพื่อ rebuild หน้าจอ
                }
              },
              child: Text('ส่งข้อมูล'),
            ),
          ],
        ),
      ),
    );
  }
}
