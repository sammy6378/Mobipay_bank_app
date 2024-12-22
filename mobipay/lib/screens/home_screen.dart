import 'package:flutter/material.dart';
import 'package:mobipay/screens/paybill_screen.dart';
import 'package:mobipay/screens/profile/profile_screen.dart';
// import 'package:mobipay/screens/transcations/recent_transcations.dart';
import 'package:mobipay/screens/transcations/transcation_report.dart';
import 'package:mobipay/screens/transcations/transfer_cash.dart';
import 'package:mobipay/screens/withdraw/withdraw_screen.dart';
import 'package:mobipay/widgets/ui_card.dart';
import 'package:mobipay/screens/messages.dart';
import 'settings/settings_page.dart';


  Widget _buildOption(String title, IconData icon, Color color, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 4),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32.0, color: color),
          const SizedBox(height: 8.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    const HomeScreen(),
    MessagesPage(),
   const ProfileScreen(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// Original home screen content refactored into HomeScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            const Text(
              "Good Morning,\nSamuel!",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade700, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Samuel Mwangi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "OverBridge Expert",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "4756  ••••  ••••  9018",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "\$3,469.52",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),


              // Options Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    _buildOption("Account\nand Card", Icons.account_balance_wallet, Colors.deepPurple,
                     (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreditCardsPage()),
                        );
                      }
                    ),
                    _buildOption("Transfer", Icons.swap_horiz, Colors.red,
                     (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TransferAmountScreen(recipientName: 'John Doe', accountNumber: '1234567890')),
                        );
                      }
                    ),
                    _buildOption("Withdraw", Icons.money, Colors.blue,
                     (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WithdrawScreen()),
                        );
                      }
                    ),
                    // _buildOption("Mobile\nrecharge", Icons.phone_android, Colors.orange,
                    //  (){
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => const RecentTransactionsScreen()),
                    //     );
                    //   }
                    // ),
                    _buildOption("Pay the bill", Icons.receipt, Colors.teal,
                     (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  PayBillsScreen()),
                        );
                      }
                    ),
                    _buildOption("Credit card", Icons.credit_card, Colors.amber,
                      (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreditCardsPage()),
                        );
                      }
                    ),
                    _buildOption("Transaction\nreport", Icons.list_alt, Colors.purple,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TransactionReportScreen()),
                      );
                },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

