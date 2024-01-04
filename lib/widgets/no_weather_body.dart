import 'package:flutter/cupertino.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'There is no Weather...\n Start seaching now',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
