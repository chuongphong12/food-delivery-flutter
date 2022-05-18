import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/vouchers/vouchers_bloc.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  static const String routeName = '/voucher';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const VoucherScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Voucher')),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                shape: const RoundedRectangleBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 50),
              ),
              onPressed: () {
                _textEditingController.clear();
              },
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your voucher code',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Voucher code',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Vouchers',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            BlocBuilder<VouchersBloc, VouchersState>(
              builder: (context, state) {
                if (state is VouchersLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is VouchersLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.vouchers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1x',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                state.vouchers[index].code,
                                style: Theme.of(context).textTheme.headline6!,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  visualDensity: VisualDensity.compact),
                              onPressed: () {
                                Navigator.pop(context);
                                context.read<VouchersBloc>().add(
                                      SelectVoucher(
                                          voucher: state.vouchers[index]),
                                    );
                              },
                              child: const Text('Apply'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No vouchers'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
