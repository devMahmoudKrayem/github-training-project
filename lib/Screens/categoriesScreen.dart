import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {

  CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {"name": "Fruits", "image": "images/cat1111.png", "items": "87 Items"},
    {"name": "Vegetables", "image": "images/cat11.png", "items": "87 Items"},
    {"name": "Mushroom", "image": "images/cat22.png", "items": "87 Items"},
    {"name": "Dairy", "image": "images/cat33.png", "items": "87 Items"},
    {"name": "Oats", "image": "images/cat44.png", "items": "87 Items"},
    {"name": "Bread", "image": "images/cat55.png", "items": "87 Items"},
    {"name": "Rice", "image": "images/cat66.png", "items": "27 Items"},
    {"name": "Egg", "image": "images/cat77.png", "items": "120 Items"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Categories",
          style: TextStyle(fontFamily:'Poppins',color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffF4B844),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/homeScreen');
          }else if(index==4){
            Navigator.pushNamed(context, '/profileScreen');
          }
        },
        currentIndex: 1,
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
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          bool isSelected = index == 0;
          return Container(
            decoration: BoxDecoration(
              color: isSelected ? Color(0xffFFC554) : Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset:Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  categories[index]["image"],
                  height: 80,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                Text(
                  categories[index]["name"],
                  style:TextStyle(
                    fontFamily:'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSelected? Colors.black:Colors.orange,
                  ),
                ),
                Text(
                  categories[index]["items"],
                  style: TextStyle(
                    fontFamily:'Poppins',
                    fontSize: 12,
                    color: isSelected ? Colors.black54 : Color(0xffE67E22),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
