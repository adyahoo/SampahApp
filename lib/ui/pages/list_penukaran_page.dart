part of 'pages.dart';

class ListPenukaranPage extends StatelessWidget {
  const ListPenukaranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PenukaranCubit>().getPenukaran();

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: EdgeInsets.only(top: 80),
        child: BlocBuilder<PenukaranCubit, PenukaranState>(
          builder: (context, state) {
            if (state is PenukaranLoaded) {
              return Column(
                children: state.penukarans!
                    .map((e) => HistoryPenukaranCard(penukaran: e))
                    .toList(),
              );
            } else {
              return LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
