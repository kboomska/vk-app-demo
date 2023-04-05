import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HeaderWidget(),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 128,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 119, 255, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'VK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Вход ВКонтакте',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              print('Войти');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Color.fromRGBO(38, 136, 235, 1),
              ),
              foregroundColor: MaterialStatePropertyAll(
                Colors.white,
              ),
              overlayColor: MaterialStatePropertyAll(
                // Color.fromRGBO(38, 136, 235, 0.64),
                Color.fromRGBO(255, 255, 255, 0.34),
              ),
              splashFactory: NoSplash.splashFactory,
              minimumSize: MaterialStatePropertyAll(
                Size.fromHeight(44),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              side: MaterialStatePropertyAll(BorderSide.none),
              // textStyle: MaterialStatePropertyAll(
              //   TextStyle(
              //     color: Colors.green,
              //   ),
              // ),
            ),
            child: Text(
              'Войти',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
