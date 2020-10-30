import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: FloatingButton(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int number = Provider.of<_NotificationModel>(context).number;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone), label: "Bones"),
        BottomNavigationBarItem(
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0,
                  right: 0,
                  // child: Icon(
                  //   Icons.brightness_1,
                  //   size: 8,
                  //   color: Colors.redAccent,
                  // )
                  child: BounceInDown(
                    from: 10,
                    animate: (number > 0) ? true : false,
                    child: Bounce(
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              .bounceController = controller,
                      from: 10,
                      child: Container(
                        alignment: Alignment.center,
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                        child: Text(
                          "$number",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 7,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            label: "Notifications"),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cat), label: "My Cat"),
      ],
    );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        int number =
            Provider.of<_NotificationModel>(context, listen: false).number;
        number++;

        Provider.of<_NotificationModel>(context, listen: false).number = number;

        if(number >= 2){
          final controller =
              Provider.of<_NotificationModel>(context, listen: false).bounceController;
          controller.forward(from: 0.0);

        }
      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  AnimationController _bounceController;

  int get number => this._number;

  AnimationController get bounceController => this._bounceController;

  set number(int number) {
    this._number = number;
    notifyListeners();
  }

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }
}
