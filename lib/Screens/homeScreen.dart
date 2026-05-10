import 'package:flutter/material.dart';
import '../Widgets/horezantelCard.dart';
import '../Widgets/horezantelCategories.dart';
import '../Widgets/proudctCard.dart';
import '../Widgets/section.dart';
import '../prefsUser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  String fullName = "User";
  @override
  void initState() {
    super.initState();
    getUser();
  }
  Future<void> getUser() async {
    final user = await PrefsUser.getUser();

    final firstName = user['firstName'] ?? '';
    final lastName = user['lastName'] ?? '';


    setState(() {
      fullName = "$firstName $lastName".trim();
      if (fullName.isEmpty) {
        fullName = "User";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffF4B844),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/categoriesScreen');
          }else if(index==4){
            Navigator.pushNamed(context, '/profileScreen');
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: ""),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("images/avataruser21.png"),
            ),
            label: "",
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      fullName,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.notifications_none_outlined, size: 28),
              ],
            ),

            SizedBox(height: 25),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HorezantelCard("images/home11.png","Recommended\nRecipe Today",),
                  HorezantelCard("images/home22.png", "Fresh Food\nDelivery"),
                ],
              ),
            ),
            SizedBox(height: 25),
            Sections("Categories", () {
              Navigator.pushNamed(context, '/categoriesScreen');
            }),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HorezantelCategories("images/cat1.png"),
                  HorezantelCategories("images/cat2.png"),
                  HorezantelCategories("images/cat3.png"),
                  HorezantelCategories("images/cat4.png"),
                  HorezantelCategories("images/cat4.png"),
                ],
              ),
            ),

            SizedBox(height: 25),

            Sections("Trending Deals", () {}),

            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: [
                ProudctCard("images/home4.png", "Avocado", "\$6.7", Colors.red),
                ProudctCard("images/home3.png", "Brocoli", "\$8.7", Colors.white,),
                ProudctCard("images/home6.png", "Tomatoes", "\$4.9", Colors.white,),
                ProudctCard("images/home5.png", "Grapes", "\$7.2", Colors.white,),
              ],
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 55),
              ),
              child: Text(
                "More",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
