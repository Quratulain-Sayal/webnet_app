import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webnet_app/components/responsive.dart';

import 'package:webnet_app/models/pages_model.dart' as pages_model;
//import 'package:webnet_app/views/Dashboard/components/header.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';


class PagesList extends StatefulWidget {
  @override
  _PagesListState createState() => _PagesListState();
}

class _PagesListState extends State<PagesList> {
  late Future<pages_model.PagesModel> _pagesFuture;
  List<pages_model.Data> _filteredPages = []; // Filtered data to display
  List<pages_model.Data> _allPages = []; // Original data from API

  final TextEditingController _searchController = TextEditingController();
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    _pagesFuture = fetchPages();
  }

 Future<pages_model.PagesModel> fetchPages() async {
  final response = await http.get(Uri.parse('https://nasachemicals.com/api/get-pages'));

  if (response.statusCode == 200) {
    final parsedJson = json.decode(response.body);
    final pages = pages_model.PagesModel.fromJson(parsedJson);

    setState(() {
      _allPages = pages.data ?? []; 
      
      _filteredPages = List.from(_allPages);
      
    });
    return pages;
  } else {
    throw Exception('Failed to load pages. Status code: ${response.statusCode}');
  }
}
  void _filterPages(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredPages = List.from(_allPages);
      } else {
        _filteredPages = _allPages.where((pages) {
          final title = pages.title ?? '';

          return title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: const Sidemenu(),
        appBar: AppBar(
          backgroundColor: const Color(0xFF770099),
          actions: const [
            Row(
              children: [
              //  Notifications(),
                SizedBox(width: 10),
             //   ProfileCard(),
              ],
            ),
          ],
        ),
        body: FutureBuilder<pages_model.PagesModel>(
            future: _pagesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:
                        CircularProgressIndicator()); // Loader while fetching
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}')); // Error handling
              } else if (_filteredPages.isEmpty) {
                return Center(
                    child: Text('No Pages found.')); // No data case
              }

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search Pages',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: _filterPages, // Use the method directly
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Text(
                        'Pages',
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
                       // width: double.infinity,
                        child: Theme(
                          data: ThemeData.light().copyWith(
                              cardColor: Theme.of(context).canvasColor),
                          child: PaginatedDataTable(
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey[300]!),
                            columns: [
                              
                             
                              DataColumn(
                                  label: Text('Title',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('URL',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              
                                              DataColumn(
                                  label: Text('Created at',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              
                            ],
                            source: PagesDataTableSource(_filteredPages),
                            header: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pages',
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
                                    'New Page',
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
                            columnSpacing: 10,
                            horizontalMargin: 10,
                            rowsPerPage: _rowsPerPage,
                            availableRowsPerPage: const [5, 10, 25, 50, 100],
                            onRowsPerPageChanged: (value) {
                              setState(() {
                                _rowsPerPage = value ??
                                    PaginatedDataTable.defaultRowsPerPage;
                              });
                            },
                            showFirstLastButtons:
                                false, // Enable first and last buttons
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: screenHeight * 0.03),
                    Divider(color: Colors.grey.withOpacity(0.3)),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      '2024 © Webnet Pakistan.',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF797979),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
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
class PagesDataTableSource extends DataTableSource {
 final List<pages_model.Data > _pages;
 


  PagesDataTableSource(this._pages);

  @override
  DataRow getRow(int index) {
    final pages = _pages[index];
    return DataRow(cells: [ 
      DataCell(Text(pages.title?? '')),
      DataCell(Row(children: [
        Text(pages.slug ?? ''), IconButton(
          icon: Icon(Icons.link, color: Colors.blue), // Link icon
  onPressed: () async {
    // Using the null-aware operator ?. to safely access the url
    final url = pages.seo?.canonical;

    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));  // Open the link in the browser
    } else {
     // You can handle the error appropriately
    }
  },
        ), ])),
      DataCell(Text(pages.createdAt ?? '')),
     
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _pages.length;

  @override
  int get selectedRowCount => 0;
}
