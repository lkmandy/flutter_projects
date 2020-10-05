import 'package:flutter/material.dart';
import 'package:navigation_demo/art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  const ArtRoute({this.art});
  static int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Choose your art',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('http://bit.ly/fl_sky'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              title: Text(ArtUtil.CARAVAGGIO),
              onTap: () => changeRoute(context, ArtUtil.CARAVAGGIO),
              trailing: Icon(
                Icons.art_track,
              ),
            ),
            ListTile(
              title: Text(ArtUtil.MONET),
              onTap: () => changeRoute(context, ArtUtil.MONET),
              trailing: Icon(
                Icons.art_track,
              ),
            ),
            ListTile(
              title: Text(ArtUtil.VANGOGH),
              onTap: () => changeRoute(context, ArtUtil.VANGOGH),
              trailing: Icon(
                Icons.art_track,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Navigating art'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return ArtUtil.menuItems.map((String item) {
                return PopupMenuItem<String>(
                  child: Text(item),
                  value: item,
                );
              }).toList();
            },
            onSelected: (value) => changeRoute(context, value),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(art),
          fit: BoxFit.cover,
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lime[900],
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text(
              ArtUtil.CARAVAGGIO,
            ),
            icon: Icon(
              Icons.art_track,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              ArtUtil.MONET,
            ),
            icon: Icon(
              Icons.art_track,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              ArtUtil.VANGOGH,
            ),
            icon: Icon(
              Icons.art_track,
            ),
          ),
        ],
        onTap: (value) {
          String _artist = ArtUtil.menuItems[value];
          _currentIndex = value;
          changeRoute(context, _artist);
        },
      ),
    );
  }

  void changeRoute(BuildContext context, String menuItem) {
    String image;
    switch (menuItem) {
      case ArtUtil.CARAVAGGIO:
        {
          image = ArtUtil.IMG_CARAVAGGIO;
          break;
        }
      case ArtUtil.MONET:
        {
          image = ArtUtil.IMG_MONET;
          break;
        }
      case ArtUtil.VANGOGH:
        {
          image = ArtUtil.IMG_VANGOGH;
          break;
        }
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ArtRoute(
                  art: image,
                )));
  }
}
