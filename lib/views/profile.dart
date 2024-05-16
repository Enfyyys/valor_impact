import 'package:flutter/material.dart';
import 'package:valor_impact/enums/role_enum.dart';
import 'package:valor_impact/themes/theme.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../ui/screens/home.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _Profile();

  const Profile({super.key});
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final selectedRole =
        Provider.of<UserProvider>(context, listen: false).selectedRole;
    return Scaffold(
      body: Column(
        children: [
          // En-tête avec les images
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 33.0,),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white, size: 33.0,),
                  onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );*/
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectedRole == RoleEnum.responsable ?
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3.0), // Contour blanc
                    ),
                    width: 180.0,
                    height: 180.0,
                    child: Image.asset('assets/images/responsable.png'),
                  )
                  :
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3.0), // Contour blanc
                    ),
                    width: 180.0,
                    height: 180.0,
                    child: Image.asset('assets/images/employe.png'),
                  ),
                  Text(selectedRole.role, style: AppStyles.textStyleBase16,),
                  Text("bababoyy", style: AppStyles.textStyleBase,),
                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 179,
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/medaille.png', scale: 0.5,),
                            const SizedBox(height: 30),
                            Text("Nombre de tâches complétés", style: AppStyles.textStyleBaseViolet8,),
                            const SizedBox(height: 30),
                            Text("35", style: AppStyles.textStyleTitreViolet24,)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/sablier.png', scale: 0.5,),
                            const SizedBox(height: 30),
                            Text("Nombre de tâches en cours", style: AppStyles.textStyleBaseViolet8,),
                            const SizedBox(height: 30),
                            Text("3", style: AppStyles.textStyleTitreViolet24,)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/monnaie.png', scale: 0.9,),
                            const SizedBox(height: 30),
                            Text("Quantité de monnaie gagnée", style: AppStyles.textStyleBaseViolet8,),
                            const SizedBox(height: 30),
                            Text("500", style: AppStyles.textStyleTitreViolet24,)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
