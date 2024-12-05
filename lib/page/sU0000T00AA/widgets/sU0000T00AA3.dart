part of '../sU0000T00AA.dart';

class _SU0000T00AA3 extends StatelessWidget {
  const _SU0000T00AA3();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SU0000T00AABloc>();
    return BlocBuilder<SU0000T00AABloc, SU0000T00AAState>(
      builder: (context, state) {
        return Column(
          children: [
            DisplayTabBar(
              tabs: const [
                '4. Đăng Ký Dịch Vụ',
                'Lịch Sử',
                'Đính Kèm File',
              ],
              currentTab: state.currentTab,
              onSelectedTab: (tab) {
                bloc.onSelectedTab(tab);
              },
            ),
            IntrinsicHeight(
              child: _contentTab(context),
            ),
          ],
        );
      },
    );
  }

  Widget _contentTab(BuildContext context) {
    final bloc = context.read<SU0000T00AABloc>();
    switch (bloc.state.currentTab) {
      case 0:
        return const SU0000T00AA4C0();
      case 1:
        return const SU0000T00AA4C1();
      case 2:
        return const SU0000T00AA4C2();
      default:
        return const SizedBox();
    }
  }
}
