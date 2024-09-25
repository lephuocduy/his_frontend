import 'entry_input.dart';

class CreateVisitInput {
  int? patientId;
  DateTime? visitOn;
  int? rxTypeIn;
  int? insBenefitType;
  int? receiveType;
  int? rcvState;
  String? ptName;
  int? ptAge;
  int? ptGender;
  DateTime? ptDob;
  String? ptAddress;
  String? ptDistrict;
  String? ptWard;
  String? ptEthnic;
  String? ptNationality;
  int? attribute;
  int? createById;
  DateTime? createOn;
  int? status;
  EntryInput? entry;

  CreateVisitInput({
    this.patientId,
    this.visitOn,
    this.rxTypeIn,
    this.insBenefitType,
    this.receiveType,
    this.rcvState,
    this.ptName,
    this.ptAge,
    this.ptGender,
    this.ptDob,
    this.ptAddress,
    this.ptDistrict,
    this.ptWard,
    this.ptEthnic,
    this.ptNationality,
    this.attribute,
    this.createById,
    this.createOn,
    this.status,
    this.entry,
  });
}
