import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valor_impact/blocs/benefit_cubit.dart';
import 'package:valor_impact/models/benefit.dart';

class BenefitList extends StatefulWidget {

  @override
  State<BenefitList> createState() => _BenefitList();

  const BenefitList({super.key});

}

class _BenefitList extends State<BenefitList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des récompenses'),
      ),
      body: BlocBuilder<BenefitCubit, List<Benefit>>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              final Benefit benefit = state[index];
              return ListTile(
                title: Text(benefit.benefitDescription),
                subtitle:
                Text(benefit.moneyCost.toString()),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 0);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCompany()),
          );*/
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}