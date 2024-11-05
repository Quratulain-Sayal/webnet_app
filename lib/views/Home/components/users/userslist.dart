import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/models/user_model.dart';
//import 'package:webnet_app/views/Dashboard/components/header.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';

class Userslist extends StatefulWidget {
  const Userslist({Key? key}) : super(key: key);

  @override
  _UserslistState createState() => _UserslistState();
}

class _UserslistState extends State<Userslist> {
  late Future<UserModel> _usersFuture;
  List<Data> _allUsers = []; // Original data from API
  List<Data> _filteredUsers = []; // Filtered data to display
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usersFuture = fetchUsers();
  }

  // API call to fetch users
  Future<UserModel> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://bppa.webecommbuilder.com/api/users'));
    if (response.statusCode == 200) {
      final users = UserModel.fromJson(json.decode(response.body));

      // Ensure that `users.data` is not null before accessing it
      setState(() {
        _allUsers = users.data ?? []; // If `data` is null, initialize an empty list
        _filteredUsers = List.from(_allUsers); // Initialize filtered list with all users
      });
      return users;
    } else {
      throw Exception('Failed to load users. Please try again later.');
    }
  }

  // Method to filter the users based on the search query
  void _filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the query is empty, show all users
        _filteredUsers = List.from(_allUsers);
      } else {
        // Filter the users based on the query
        _filteredUsers = _allUsers.where((user) {
          final firstName = user.firstName ?? '';
          final lastName = user.lastName ?? '';
          final email = user.email ?? '';
          final phone = user.phone ?? '';
          final id = user.id.toString();

          return firstName.toLowerCase().contains(query.toLowerCase()) ||
                 lastName.toLowerCase().contains(query.toLowerCase()) ||
                 email.toLowerCase().contains(query.toLowerCase()) ||
                 phone.toLowerCase().contains(query.toLowerCase()) ||
                 id.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const Sidemenu(),
        appBar: AppBar(
          backgroundColor: const Color(0xFF770099),
          actions: const [
            Row(
              children: [
              //  Notifications(),
                SizedBox(width: 10),
               // ProfileCard(),
              ],
            ),
          ],
        ),
        body: FutureBuilder<UserModel>(
          future: _usersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && _allUsers.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search users',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: _filterUsers, // Use the method directly
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Text(
                        'Users',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF797979),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: double.infinity,
                          child: Theme(
                            data: ThemeData.light().copyWith(
                                cardColor: Theme.of(context).canvasColor),
                            child: PaginatedDataTable(
                              headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[300]!),
                              columns: [
                                DataColumn(label: Text('ID', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                DataColumn(label: Text('First Name', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                DataColumn(label: Text('Last Name', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                DataColumn(label: Text('Email', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                DataColumn(label: Text('Phone', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                DataColumn(label: Text('Role', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                DataColumn(label: Text('Created At', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                              ],
                              source: UserDataTableSource(_filteredUsers), // Use filtered users
                              header: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'User List',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF505458),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF188AE2),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                      minimumSize: const Size(20, 40),
                                    ),
                                    child: Text(
                                      'Add Users',
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              columnSpacing: 40,
                              horizontalMargin: 40,
                              rowsPerPage: _filteredUsers.length < 10 ? _filteredUsers.length : 10, // Dynamic rowsPerPage
                              showFirstLastButtons: false, // Enable first and last buttons
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Divider(color: Colors.grey.withOpacity(0.3)),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      '2024 © Webnet Pakistan.',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 16, color: Color(0xFF797979),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No users found'));
            }
          },
        ),
        bottomNavigationBar: Responsive.isMobile(context)
            ? BottomNavigationBar(
                backgroundColor: const Color(0xFFF4F6F8),
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/side nav icons/dashboard-layout-svgrepo-com.svg",
                      height: 18,
                      width: 18,
                      colorFilter: const ColorFilter.mode(
                          Color(0xFF782572), BlendMode.srcIn),
                    ),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/side nav icons/category-svgrepo-com.svg",
                      height: 18,
                      width: 18,
                      colorFilter: const ColorFilter.mode(
                          Color(0xFF782572), BlendMode.srcIn),
                    ),
                    label: 'Categories',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/side nav icons/settings-svgrepo-com.svg",
                      height: 18,
                      width: 18,
                      colorFilter: const ColorFilter.mode(
                          Color(0xFF782572), BlendMode.srcIn),
                    ),
                    label: 'Settings',
                  ),
                ],
                currentIndex: 0, // Set the initial index
                selectedItemColor: const Color(0xFF505458), // Active item color
                unselectedItemColor:
                    const Color(0xFF505458), // Inactive item color
                showSelectedLabels: true, // Show labels for selected items
                showUnselectedLabels: true, // Show labels for unselected items
                selectedLabelStyle: const TextStyle(
                    fontFamily: 'Lato', // Specify Lato font family
                    fontWeight: FontWeight.w400, // Bold for selected
                    color: Color(0xFF505458),
                    fontSize: 12 // Color for selected label
                    ),
                unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Lato', // Specify Lato font family
                    color: Color(0xFF505458),
                    fontWeight: FontWeight.w400,
                    fontSize: 12 // Color for unselected label
                    ),
                onTap: (index) {
                  // Handle navigation here
                },
              )
            : null, 
      ),
    );
  }
}

// DataTable source
class UserDataTableSource extends DataTableSource {
  final List<Data> _users;

  UserDataTableSource(this._users);

  @override
  DataRow getRow(int index) {
    final user = _users[index];
    return DataRow(cells: [
      DataCell(Text(user.id.toString())),
      DataCell(Text(user.firstName ?? '')),
      DataCell(Text(user.lastName ?? '')),
      DataCell(Text(user.email ?? '')),
      DataCell(Text(user.phone ?? '')),
      DataCell(Text(user.userType ?? '')),
      DataCell(Text(user.createdAt ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _users.length;

  @override
  int get selectedRowCount => 0;
}
