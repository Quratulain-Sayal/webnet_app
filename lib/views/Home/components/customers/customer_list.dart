import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/models/customer_model.dart';
import 'package:webnet_app/views/Home/components/components.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';

class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  late Future<CustomerModel> _CustomerFuture;
  List<Data> _filteredCustomers = []; // Filtered data to display
  List<Data> _allCustomers = []; // Original data from API
  final TextEditingController _searchController = TextEditingController();
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  
  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _CustomerFuture = fetchCustomers();
  }

  Future<CustomerModel> fetchCustomers() async {
    final response =
        await http.get(Uri.parse('https://taazagosht.pk/api/get-users'));

    if (response.statusCode == 200) {
      final customers = CustomerModel.fromJson(json.decode(response.body));

      setState(() {
        _allCustomers = customers.data ?? [];
        _filteredCustomers = List.from(_allCustomers);
      });
      return customers;
    } else {
      throw Exception(
          'Failed to load customers. Status code: ${response.statusCode}');
    }
  }

  void _filterCustomers(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCustomers = List.from(_allCustomers);
      } else {
        _filteredCustomers = _allCustomers.where((customer) {
          final name = customer.firstName ?? '';
          final email = customer.email ?? '';
          final phone = customer.phone ?? '';
          final city = customer.city ?? '';
          final postal = customer.postal ?? '';
          final country = customer.country ?? '';

          return name.toLowerCase().contains(query.toLowerCase()) ||
              email.toLowerCase().contains(query.toLowerCase()) ||
              phone.toLowerCase().contains(query.toLowerCase()) ||
              city.toLowerCase().contains(query.toLowerCase()) ||
              postal.toLowerCase().contains(query.toLowerCase()) ||
              country.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //  double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: Sidemenu(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff782572),
          actions: const [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SvgIcon(
                    icon: SvgIconData('assets/images/notification.svg'),
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ProfileDropdown())
              ],
            ),
          ],
        ),
        body: FutureBuilder<CustomerModel>(
            future: _CustomerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child:
                        CircularProgressIndicator()); // Loader while fetching
              } else if (snapshot.hasError) {
                return Center(
                    child: SnackBar(content: Text(' ${snapshot.error}'), backgroundColor: Colors.red,)); // Error handling
              } else if (_filteredCustomers.isEmpty) {
                return const Center(
                    child: SnackBar(content: Text('No Customers found.'), backgroundColor: Colors.red,)); // No data case
              }
              return Padding(
                padding: const EdgeInsets.all(defaultpadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xfff4f6f8),
                            hintText: "Search Customers",
                            hintStyle: GoogleFonts.lato(color: Colors.black),
                            prefixIcon:
                                Icon(Icons.search, color: Colors.black),
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    icon:const  Icon(Icons.clear,
                                        color: Colors.black),
                                    onPressed: _clearSearch,
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 14.0),
                          ),
                          onChanged: _filterCustomers),
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    Padding(
                      padding: const EdgeInsets.all(
                          defaultpadding),
                      child: Text(
                        'Customers',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF797979),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight*0.01,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(defaultpadding),
                        child: SizedBox(
                     
                          child: Theme(
                            data: ThemeData.light().copyWith(cardColor: Theme.of(context).canvasColor),
                            child: PaginatedDataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.grey[300]!),
                              columns: [
                                DataColumn(label: Text('Name', style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold,
                                        color: Color(0xFF797979))))),
                                DataColumn(label: Text('Email', style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold,
                                        color: Color(0xFF797979))))),
                                DataColumn(label: Text('Phone', style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold,
                                        color: Color(0xFF797979))))),
                                DataColumn(label: Text('Address', style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold,
                                        color: Color(0xFF797979))))),
                                DataColumn(label: Text('City', style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold,
                                        color: Color(0xFF797979))))),
                                DataColumn(label: Text('Postal', style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold,
                                        color: Color(0xFF797979))))),
                                DataColumn(label: Text('Country', style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold,
                                        color: Color(0xFF797979))))),
                                DataColumn(label: Text('Updated at', style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold,
                                        color: Color(0xFF797979))))),
                              ],
                              source: CustomerDataTableSource(_filteredCustomers),
                              header: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                        'Customers List',
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        minimumSize: const Size(20, 40),
                                        ),
                                        child: Text(
                        'New',
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
                              rowsPerPage: _rowsPerPage,
                              availableRowsPerPage: const [5, 10, 20, 50, 100],
                              onRowsPerPageChanged: (value) {
                                setState(() {
                                  _rowsPerPage = value ?? PaginatedDataTable.defaultRowsPerPage;
                                });
                              },
                              showFirstLastButtons: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              );
            }),
        bottomNavigationBar: Responsive.isMobile(context)
            ? BottomNavigationBar(
                backgroundColor: Color(0xfff4f6f8),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/images/dashboard.png",
                      height: 20,
                      width: 20,
                      color: Color(0xFF752376),
                    ),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/images/content-writing.png",
                      height: 20,
                      width: 20,
                      color: Color(0xFF752376),
                    ),
                    label: 'Cms',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/images/user.png",
                      height: 20,
                      width: 20,
                      color: Color(0xFF752376),
                    ),
                    label: 'Account',
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
                  fontSize: 12,
                  // Color for selected label
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
class CustomerDataTableSource extends DataTableSource {
  final List<Data> _Customer;

  CustomerDataTableSource(this._Customer);

  @override
  DataRow getRow(int index) {
    final customer = _Customer[index];
    return DataRow(cells: [
      DataCell(Text(customer.firstName ?? '')),
      DataCell(Text(customer.email ?? '')),
      DataCell(Text(customer.phone ?? '')),
      DataCell(Text(customer.address ?? '')),
      DataCell(Text(customer.city ?? '')),
     DataCell(Text(customer.postal ?? '')),
      DataCell(Text(customer.country ?? '')),
      DataCell(Text(customer.updatedAt ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _Customer.length;

  @override
  int get selectedRowCount => 0;
}
