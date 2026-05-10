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

  static const primaryColor = Color(0xffF4B844);

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
      if (fullName.isEmpty) fullName = "User";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/categoriesScreen');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/profileScreen');
          }
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: ""),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart),
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            label: "",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          const BottomNavigationBarItem(
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [

            const SizedBox(height: 20),

            // 🌟 HEADER MODERN CARD
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Good Morning 👋",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications_none_outlined, size: 28),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🎯 HERO CARDS
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HorezantelCard(
                    "images/home11.png",
                    "Recommended\nRecipe Today",
                  ),
                  HorezantelCard(
                    "images/home22.png",
                    "Fresh Food\nDelivery",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Sections("Categories", () {
              Navigator.pushNamed(context, '/categoriesScreen');
            }),

            const SizedBox(height: 10),

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

            const SizedBox(height: 25),

            Sections("Trending Deals", () {}),

            const SizedBox(height: 10),

            // 🛒 PRODUCT GRID MODERNIZED
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.78,
              children: [
                ProudctCard("images/home4.png", "Avocado", "\$6.7", Colors.red),
                ProudctCard("images/home3.png", "Broccoli", "\$8.7", Colors.white),
                ProudctCard("images/home6.png", "Tomatoes", "\$4.9", Colors.white),
                ProudctCard("images/home5.png", "Grapes", "\$7.2", Colors.white),
              ],
            ),

            const SizedBox(height: 25),

            // 🔘 MORE BUTTON MODERN
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                "More",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}