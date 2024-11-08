import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/const/constants.dart';
//import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/models/blog_model.dart';
import 'package:webnet_app/views/Home/components/components.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';



class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  late Future<BlogModel> _blogsFuture;
   List<Data> _filteredBlogs = []; // Filtered data to display
   List<Data> _allBlogs = []; // Original data from API
   final TextEditingController _searchController = TextEditingController();
    int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
   void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

   bool isDarkTheme = false; // Track the current theme state
    @override
  void initState() {
    super.initState();
    _blogsFuture = fetchBlogs();
  }
  Future<BlogModel> fetchBlogs() async {
  
    final response = await http.get(Uri.parse('https://www.glucorp.com/api/get-blogs'));

    if (response.statusCode == 200) {
    
      final blogs = BlogModel.fromJson(json.decode(response.body));
        
      setState(() {
        _allBlogs = blogs.data ?? [];
        _filteredBlogs = List.from(_allBlogs); 
      });
      return blogs;
    } else {
      throw Exception('Failed to load blogs. Status code: ${response.statusCode}');
    }
  }

  void _filterBlogs(String query) {
    setState(() {
      if (query.isEmpty) {
       
        _filteredBlogs = List.from(_allBlogs);
      } else {
        
        _filteredBlogs = _allBlogs.where((blog) {
          final title = blog.title ?? '';
      

          return title.toLowerCase().contains(query.toLowerCase());
             
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
        body: FutureBuilder<BlogModel>(
          future: _blogsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator()); // Loader while fetching
            } else if (snapshot.hasError) {
              return Center(child: SnackBar(content: Text('Error: ${snapshot.error}'), backgroundColor: Colors.red,)); // Error handling
            } else if (_filteredBlogs.isEmpty) {
              return Center(child: SnackBar(content: Text('No blogs found.'), backgroundColor: Colors.red,)); // No data case
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
                        hintText: "Search Blogs", hintStyle: GoogleFonts.lato(color: Colors.black),
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear, color: Colors.black),
                                onPressed: _clearSearch,
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                      ),
                      onChanged: _filterBlogs
                    ),
                  ),
                  SizedBox(height: screenHeight*0.02,),
                        Padding(
                          padding: const EdgeInsets.all(defaultpadding),
                          child: Text(
                            'Blogs',
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
                        Expanded(child: 
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(defaultpadding),
                            child: SizedBox(
                             
                                child: Theme(
                                  data: ThemeData.light().copyWith(
                                      cardColor: Theme.of(context).canvasColor),
                                  child: PaginatedDataTable(
                                    
                                    headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[300]!),
                                    columns: [
                                      DataColumn(label: Text('Image', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                      DataColumn(label: Text('Title', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                      DataColumn(label: Text('Author', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                      DataColumn(label: Text('Popular', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                      DataColumn(label: Text('Active', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                     // DataColumn(label: Text('Role', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                      DataColumn(label: Text('Created At', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                                    ],
                                    source: BlogDataTableSource(_filteredBlogs), 
                                    header: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ' Blogs',
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
                                                  availableRowsPerPage: const [5,10, 25, 50, 100 ],
                                                  onRowsPerPageChanged: (value) {
                            setState(() {
                              _rowsPerPage = value ?? PaginatedDataTable.defaultRowsPerPage;
                            });
                                                  },
                                    showFirstLastButtons: false, // Enable first and last buttons
                                  ),
                                ),
                              ),
                          ),
                        )),
                       
                   
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
class BlogDataTableSource extends DataTableSource {
  final List<Data> _blogs;

  BlogDataTableSource(this._blogs);

  @override
  DataRow getRow(int index) {
    final blog = _blogs[index];
    return DataRow(cells: [
       DataCell(blog.image!= null 
             ? Image.network(blog.image!)  // Display the image
            : Text('No Image')),  // Placeholder for no image
      DataCell(Text(blog.title ?? '')),
      DataCell(Text(blog.userId ?? '')),
       DataCell(Text(blog.isFeatured == '0' ? 'Yes' : 'No')),
        DataCell(Text(blog.isActive == '1' ? 'Yes' : 'No')),
         DataCell(Text(blog.createdAt ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _blogs.length;

  @override
  int get selectedRowCount => 0;
}