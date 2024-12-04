import 'package:flutter/material.dart';
import 'post_container.dart'; // PartyOfPostContainer 관련 코드 임포트

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  List<Map<String, String>> posts = []; // 포스트 데이터 저장

  void _uploadPost() {
    String title = titleController.text;
    String content = contentController.text;

    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('제목과 내용을 모두 작성해주세요!')),
      );
      return;
    }

    setState(() {
      posts.add({'title': title, 'content': content});
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PartyOfPostContainer(posts: posts),
      ),
    );

    titleController.clear();
    contentController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('포스트가 성공적으로 업로드되었습니다!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Create Post',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // 배경 원들
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * -0.3,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF7E3),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              right: MediaQuery.of(context).size.width * -0.3,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF7E3),
                ),
              ),
            ),
            // 메인 컨테이너와 입력 필드
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '제목',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: '제목 작성',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '내용',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: contentController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: '내용 작성',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _uploadPost,
                        child: const Text('포스트 업로드'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
