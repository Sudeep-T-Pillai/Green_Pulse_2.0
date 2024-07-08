import 'package:flutter/material.dart';
import 'package:greenpulse/Text/text_info.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            // Profile photo
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://thumbs.dreamstime.com/z/cute-cartoon-cactus-eyes-flower-pot-flat-design-vector-illustration-69325447.jpg',
                     fit: BoxFit.cover,
                     loadingBuilder: (context, child, progress){
                      return progress==null
                             ? child
                             : LinearProgressIndicator(
                               value: progress.expectedTotalBytes != null
                                     ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                                     : null,
                               valueColor: 
                                const AlwaysStoppedAnimation<Color>(Color.fromRGBO(255, 190, 152, 100)),
                             );
                     },
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 55,
            ),

            // Name of the user
            Center(
              child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                   border: Border.all(color: Colors.blueAccent),
                   borderRadius: BorderRadius.circular(14)
                ),
                child: const TextInfo('Mr.Cactus'),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // Email of the user
            Center(
              child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                   border: Border.all(color: Colors.blueAccent),
                   borderRadius: BorderRadius.circular(14)
                ),
                child: const TextInfo('Cactus@dsrt.com'),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // Edit button
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: const Color.fromRGBO(140, 195, 250, 0.612)
                ),
                onPressed: () {},
                child: const Text('Edit'),
              ),
            ),

            const SizedBox(height: 20,),
            //Delete Button
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Color.fromRGBO(251, 101, 101, 0.612)
                ),
                onPressed: () {},
                child: const Text('Delete'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}