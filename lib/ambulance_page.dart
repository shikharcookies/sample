import 'package:flutter/material.dart';

class AmbulancePage extends StatefulWidget {
  @override
  _AmbulancePageState createState() => _AmbulancePageState();
}

class _AmbulancePageState extends State<AmbulancePage> {
  String _paymentMode = 'Cash';
  bool _payNowEnabled = true;
  int _selectedStatus = 0;

  final List<String> _statusList = ['Verified', 'Paid', 'Finished'];

  @override
  Widget build(BuildContext context) {
    double payNowElevation = _paymentMode == 'Online' && _payNowEnabled ? 4.0 : 0.0;
    double payNowOpacity = _paymentMode == 'Cash' ? 0.3 : 1.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ambulance'),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffeef1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Go back icon
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFFf83d5b)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.chat, color: Color(0xFFf83d5b)),
                  onPressed: () {},
                ),
                Icon(Icons.phone, size: 24),
              ],
            ),
            SizedBox(height: 16),

            // Ambulance details
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius:40,
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/8942631/pexels-photo-8942631.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Avinash Singh',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('LIC No. 124568'),
                        Text('RJ-19 FE 7651 | BASIC'),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 18),
                        SizedBox(width: 4),
                        Text('4.3', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Details container
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(color: Colors.grey[300]),
                  SizedBox(height: 16),
                  Row(
                    children:[
                      Text('Pickup:'),
                      Spacer(),
                      Text('Jodhpur central, Rajasthan'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Drop off:'),
                      Spacer(),
                      Text('Ambika Multispeciality Hospital'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Amount:'),
                      Spacer(),
                      Text('₹450'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Payment Mode:'),
                      Spacer(),
                      DropdownButton<String>(
                        value: _paymentMode,
                        items: ['Cash', 'Online'].map((e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _paymentMode = value!;
                            _payNowEnabled = value == 'Online';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('CANCEL'),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Color(0xFFffeef1)),
                      foregroundColor: MaterialStateProperty.all(Color(0xFFf83d5b)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: Color(0xFFf83d5b)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _payNowEnabled ? () {} : null,
                    child: Text('PAY NOW'),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(payNowElevation),
                      backgroundColor: MaterialStateProperty.all(Color(0xFFf83d5b).withOpacity(payNowOpacity)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: Color(0xFFf83d5b)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Status container
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: List.generate(
                      _statusList.length,
                          (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedStatus = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedStatus == index ? Color(0xFFffeeef1) : Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: _selectedStatus == index ? Color(0xFFf83d5b) : Colors.grey[300]!,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _selectedStatus == index
                                  ? Icon(Icons.check, color: Color(0xFFf83d5b), size: 16)
                                  : Container(width: 16, height: 16),
                              SizedBox(width: 8),
                              Text(_statusList[index]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _statusList[_selectedStatus],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFf83d5b),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Add a bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFFf83d5b).withOpacity(0.5),
        unselectedItemColor: Color(0xFFf83d5b).withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}