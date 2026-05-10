import 'package:final_project_flutter1/Widgets/profileTextField.dart';
import 'package:flutter/material.dart';
import '../prefsUser.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = true;
  bool isSaving = false;

  static const primaryColor = Color(0xffF4B844);

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final user = await PrefsUser.getUser();

    firstNameController.text = user['firstName'] ?? '';
    lastNameController.text = user['lastName'] ?? '';
    emailController.text = user['email'] ?? '';
    passwordController.text = user['password'] ?? '';

    setState(() => isLoading = false);
  }

  Future<void> saveChanges() async {
    final newFirstName = firstNameController.text.trim();
    final newLastName = lastNameController.text.trim();
    final newEmail = emailController.text.trim();
    final newPassword = passwordController.text;

    if (newFirstName.isEmpty ||
        newLastName.isEmpty ||
        newEmail.isEmpty ||
        newPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() => isSaving = true);

    await PrefsUser.updateUser(
      firstName: newFirstName,
      lastName: newLastName,
      email: newEmail,
      password: newPassword,
    );

    setState(() => isSaving = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated')),
    );
  }

  Future<void> logout() async {
    await PrefsUser.logout();
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/loginScreen',
          (route) => false,
    );
  }

  Future<void> deleteAccount() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Account"),
          content: const Text("Are you sure want to delete your account?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (confirm != true) return;

    await PrefsUser.deleteAccount();

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/onboardingScreen',
          (route) => false,
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fullName =
    "${firstNameController.text} ${lastNameController.text}".trim();

    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/homeScreen');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/categoriesScreen');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
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

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xffF4B844), Color(0xffFFC554)],
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 42,
                      backgroundImage:
                      AssetImage("images/avataruser21.png"),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      fullName.isEmpty ? "Your Profile" : fullName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      emailController.text.isEmpty
                          ? "example@email.com"
                          : emailController.text,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.person_outline),
                        SizedBox(width: 8),
                        Text(
                          "Personal Information",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    ProfileTextField(
                      label: "First Name",
                      controller: firstNameController,
                    ),
                    const SizedBox(height: 16),

                    ProfileTextField(
                      label: "Last Name",
                      controller: lastNameController,
                    ),
                    const SizedBox(height: 16),

                    ProfileTextField(
                      label: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),

                    ProfileTextField(
                      label: "Password",
                      controller: passwordController,
                      isPassword: true,
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: isSaving ? null : saveChanges,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: isSaving
                            ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
                            : const Text(
                          "Save Changes",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: OutlinedButton(
                        onPressed: logout,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          "Log Out",
                          style: TextStyle(
                            color: Color(0xffC9971E),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: TextButton(
                        onPressed: deleteAccount,
                        child: const Text(
                          "Delete Account",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}