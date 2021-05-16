import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queuey/3%20-Nasr/Profile/Profile%20Controller.dart';
import 'package:queuey/3%20-Nasr/Profile/Profile%20Model.dart';

import '../31-settings.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Setting(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1, 0); //Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

PickedFile _imageFile;
imageFunction() {
  return _imageFile;
}

class _ProfileViewState extends State<ProfileView> {
  _card({
    IconData icon,
    String name,
  }) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.black54),
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _icon({int color, IconData icon, Function onPressed}) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(color: Color(color), shape: BoxShape.circle),
      child: Center(
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        builder: (builder) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 180.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Profile Photo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _icon(
                          color: 0xffE65454,
                          icon: Icons.delete,
                          onPressed: () {
                            setState(() {
                              _imageFile = null;
                            });
                          }),
                      _icon(
                          color: 0xffB47CB4,
                          icon: CupertinoIcons.photo,
                          onPressed: () {
                            getImage(source: ImageSource.gallery);
                          }),
                      _icon(
                          color: 0xffDBB436,
                          icon: CupertinoIcons.camera_fill,
                          onPressed: () {
                            getImage(source: ImageSource.camera);
                          }),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  imageFunction() {
    return _imageFile;
  }

  final _picker = ImagePicker();

  Future getImage({ImageSource source}) async {
    final pickedFile = await _picker.getImage(
        source: source, maxWidth: 200.0, maxHeight: 200.0);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  ProfileModel _model = new ProfileModel();
  ProfileController _controller = new ProfileController();
  _getdata() async {
    _model = await _controller.getUserData();
  }

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(11),
                  child: Image(
                    image: AssetImage('assets/images/MyAppBar/list.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(7),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Color.fromRGBO(50, 157, 156, .25)),
                child:
                    Image(image: AssetImage('assets/images/Queue-amico.png')),
              ),
            ]),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Container(
                width: 125,
                height: 125,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage: _imageFile == null
                          ? AssetImage('assets/images/MyAppBar/profile.png')
                          : FileImage(File(_imageFile.path)),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                          child: IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                _modalBottomSheetMenu();
                              })),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 0.5, color: Colors.black54),
                            ),
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${_model.user[1]}",
                                  style: TextStyle(fontSize: 19),
                                ),
                                Icon(
                                  Icons.create_outlined,
                                  color: Colors.grey[700],
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _card(
                  icon: CupertinoIcons.phone_fill,
                  name: "${_model.user[2]}",
                ),
                _card(
                  icon: CupertinoIcons.mail,
                  name: "${_model.user[3]}",
                ),
                InkWell(
                  onTap: () {},
                  child: _card(
                    icon: CupertinoIcons.lock_fill,
                    name: 'Change Password',
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text('Powered By',
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                Text('QueueY',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
