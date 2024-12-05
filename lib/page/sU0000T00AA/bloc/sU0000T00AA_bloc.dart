import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';
import 'package:his_frontend/page/sU0000T00AA/models/sU0000T00AA4C0_item.dart';
import 'package:image_picker/image_picker.dart';

import 'sU0000T00AA_state.dart';

class SU0000T00AABloc extends Cubit<SU0000T00AAState> {
  SU0000T00AABloc() : super(const SU0000T00AAState());

  final imagePicker = ImagePicker();

  onStart() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    //
    emit(state.copyWith(
      dataDropdownList: [
        ItemBaseModel(id: 1, name: 'A'),
        ItemBaseModel(id: 2, name: 'B'),
        ItemBaseModel(id: 3, name: 'C'),
      ],
    ));
    try {} catch (e) {
      log(e.toString());
    } finally {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  onSelectedTab(int tab) {
    emit(state.copyWith(
      currentTab: tab,
    ));
  }

  onSelectServicePackage(ItemBaseModel? data) {
    emit(state.copyWith(
      servicePackageSelected: data,
    ));
  }

  enterServicePackage() {
    final serviceList = _serviceList(state.servicePackageSelected?.id ?? 0);
    emit(state.copyWith(
      serviceList: serviceList,
    ));
  }

  List<SU0000T00AA4C0Item> _serviceList(int id) {
    switch (id) {
      case 1:
        return [
          SU0000T00AA4C0Item(
            id: '0',
            serviceName: ItemBaseModel(id: 11, name: 'Thuoc A1'),
            room: ItemBaseModel(id: 12, name: 'P1.03 A'),
            unitPrice: 100000,
            unitPriceSI: 60000,
          ),
          SU0000T00AA4C0Item(
            id: '1',
            serviceName: ItemBaseModel(id: 21, name: 'Thuoc A2'),
            room: ItemBaseModel(id: 22, name: 'P2.03 A'),
            unitPrice: 90000,
            unitPriceSI: 55000,
          ),
          SU0000T00AA4C0Item(
            id: '2',
            serviceName: ItemBaseModel(id: 31, name: 'Thuoc A3'),
            room: ItemBaseModel(id: 32, name: 'P3.03 A'),
            unitPrice: 50000,
            unitPriceSI: 30000,
          ),
          SU0000T00AA4C0Item(
            id: '3',
            serviceName: ItemBaseModel(id: 41, name: 'Thuoc A4'),
            room: ItemBaseModel(id: 42, name: 'P4.03 A'),
            unitPrice: 92000,
            unitPriceSI: 40000,
          ),
        ];
      case 2:
        return [
          SU0000T00AA4C0Item(
            id: '4',
            serviceName: ItemBaseModel(id: 51, name: 'Thuoc A5'),
            room: ItemBaseModel(id: 52, name: 'P5.03 A'),
            unitPrice: 110000,
            unitPriceSI: 80000,
          ),
          SU0000T00AA4C0Item(
            id: '5',
            serviceName: ItemBaseModel(id: 61, name: 'Thuoc A6'),
            room: ItemBaseModel(id: 62, name: 'P6.03 A'),
            unitPrice: 95000,
            unitPriceSI: 50000,
          ),
          SU0000T00AA4C0Item(
            id: '6',
            serviceName: ItemBaseModel(id: 71, name: 'Thuoc A7'),
            room: ItemBaseModel(id: 72, name: 'P7.03 A'),
            unitPrice: 92000,
            unitPriceSI: 40000,
          ),
          SU0000T00AA4C0Item(
            id: '7',
            serviceName: ItemBaseModel(id: 81, name: 'Thuoc A8'),
            room: ItemBaseModel(id: 82, name: 'P8.03 A'),
            unitPrice: 52000,
            unitPriceSI: 30000,
          ),
        ];
      case 3:
        return [
          SU0000T00AA4C0Item(
            id: '8',
            serviceName: ItemBaseModel(id: 91, name: 'Thuoc A9'),
            room: ItemBaseModel(id: 92, name: 'P9.03 A'),
            unitPrice: 120000,
            unitPriceSI: 90000,
          ),
          SU0000T00AA4C0Item(
            id: '9',
            serviceName: ItemBaseModel(id: 100, name: 'Thuoc A10'),
            room: ItemBaseModel(id: 102, name: 'P10.03 A'),
            unitPrice: 95000,
            unitPriceSI: 50000,
          ),
          SU0000T00AA4C0Item(
            id: '10',
            serviceName: ItemBaseModel(id: 111, name: 'Thuoc A11'),
            room: ItemBaseModel(id: 112, name: 'P11.03 A'),
            unitPrice: 82000,
            unitPriceSI: 45000,
          ),
          SU0000T00AA4C0Item(
            id: '11',
            serviceName: ItemBaseModel(id: 121, name: 'Thuoc A12'),
            room: ItemBaseModel(id: 122, name: 'P12.03 A'),
            unitPrice: 62000,
            unitPriceSI: 32000,
          ),
        ];
      default:
        return [];
    }
  }

  onChangeItemServiceList({
    required int index,
    ItemBaseModel? serviceName,
    ItemBaseModel? room,
    double? unitPrice,
    double? unitPriceSI,
    bool? isEdit,
  }) {
    final serviceList = List<SU0000T00AA4C0Item>.from(state.serviceList);

    serviceList[index] = serviceList[index].copyWith(
      serviceName: serviceName ?? serviceList[index].serviceName,
      room: room ?? serviceList[index].room,
      unitPrice: unitPrice ?? serviceList[index].unitPrice,
      unitPriceSI: unitPriceSI ?? serviceList[index].unitPriceSI,
      isEdit: isEdit ?? serviceList[index].isEdit,
    );

    emit(state.copyWith(
      serviceList: serviceList,
    ));
  }

  onDeleteItemServiceList(int index) {
    emit(state.copyWith(
      serviceList: state.serviceList..removeAt(index),
    ));
  }

  onAddNewItemServiceList() {
    emit(state.copyWith(
      serviceList: [SU0000T00AA4C0Item(isEdit: true), ...state.serviceList],
    ));
  }

  onImagePicker() async {
    final selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    emit(state.copyWith(
      avatarChange: selectedImage,
    ));
  }

  onDeleteAvatar() {
    emit(state.copyWith(
      avatarChange: null,
    ));
  }
}
