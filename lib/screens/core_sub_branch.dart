import 'package:demo_connect/screens/domain_page.dart';
import 'package:flutter/material.dart';

import '../widgets/domain_card.dart';
import 'category_screen.dart';

class CoreSubBranch extends StatefulWidget {
  final String drive;
  final String driveID;
  const CoreSubBranch({
    required this.drive,
    required this.driveID,
  });
  @override
  State<CoreSubBranch> createState() => _CoreSubBranchState();
}

class _CoreSubBranchState extends State<CoreSubBranch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F4F5B),
      // key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF4F4F5B),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    DomainPage(drive: widget.drive, driveID: widget.driveID),
              ),
            );
          },
        ),
        actions: [],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 100, 0),
                child: Text(
                  'Core',
                  style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  child: DomainCard(
                    domainName: 'Mechanical',
                  ),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? 'ReeI3ycdhEsS0Q1r8M3c'
                        : 'SxFVzTZxERdMgHMUR3TY';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domain: "CoreMech",
                          title: 'Core - Mech',
                          domainID: domainID,
                        ),
                      ),
                    );
                  }),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                  child: DomainCard(
                    domainName: 'Electrical, Electronics & Telecommunication',
                  ),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? 'YsJTEtikj6qQfYcyIXBI'
                        : '9GEpxEK8YG5XjPNg977C';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domainID: domainID,
                          domain: 'CoreElec',
                          title: 'Core - Elec',
                        ),
                      ),
                    );
                  }),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                  child: DomainCard(
                    domainName: 'Civil',
                  ),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? 'oEA0QPyC3TgDy4mBV83m'
                        : 'dFuNPFCUyb6V3ASUK23b';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domainID: domainID,
                          domain: 'CoreCivil',
                          title: 'Core - Civil',
                        ),
                      ),
                    );
                  }),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                  child: DomainCard(domainName: 'Textile'),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? 'Hslxc3eJea7BiC1mRtov'
                        : '5BCKTdvYOxbNQRYSWjmJ';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          drive: widget.drive,
                          driveID: widget.driveID,
                          domainID: domainID,
                          domain: 'CoreText',
                          title: 'Core - Textile',
                        ),
                      ),
                    );
                  }),
              SizedBox.fromSize(
                size: Size(20.0, 15.0),
              ),
              GestureDetector(
                  child: DomainCard(
                    domainName: 'Production',
                  ),
                  onTap: () {
                    String domainID = widget.driveID == 'jt4whg5R0mxaJVbAphVd'
                        ? '5YCFacz2O5PBij2nYvIZ'
                        : 'W67CN1YAXYgHVYcg6OjR';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          driveID: widget.driveID,
                          domainID: domainID,
                          drive: widget.drive,
                          domain: 'CoreProd',
                          title: 'Core - Prod',
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
