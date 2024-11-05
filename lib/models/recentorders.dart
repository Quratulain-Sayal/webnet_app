class RecentOrderInfo {
  final String? orderNo, title, date, amount;

  RecentOrderInfo({this.orderNo, this.title, this.date, this.amount});
}

// Specify the type of list explicitly as List<RecentOrderInfo>
List<RecentOrderInfo> demoRecentFiles = [
  RecentOrderInfo(
    orderNo: "721874",
    title: "Maher Waqas",
    date: "22-09-2024",
    amount: "PKR 590",
  ),
  RecentOrderInfo(
    orderNo: "996485",
    title: "Usama Ahmed",
    date: "19-09-2024",
    amount: "PKR 1,225",
  ),
  RecentOrderInfo(
    orderNo: "839548",
    title: "Jasir Murad",
    date: "19-09-2024",
    amount: "PKR 795",
  ),
  RecentOrderInfo(
    orderNo: "7878",
    title: "Yasir Khan",
    date: "18-09-2024",
    amount: "PKR 590",
  ),
  RecentOrderInfo(
    orderNo: "785764",
    title: "Haris Lodhi",
    date: "18-09-2024",
    amount: "PKR 2,240",
  ),
];