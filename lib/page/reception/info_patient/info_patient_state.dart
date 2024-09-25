import 'package:copy_with_extension/copy_with_extension.dart';

part 'info_patient_state.g.dart';

@CopyWith()
class InfoReceptionState {
  final bool isLoading;

  const InfoReceptionState({
    this.isLoading = false,
  });
}
