// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

enum TipoItens { Calcinha, Sutia, Maio, Camisola, Cueca, Pijama }
enum Tamanho { P, PP, M, G, GG, XG, XGG }

extension TipoItensExtension on TipoItens {
  String get name {
    switch (this) {
      case TipoItens.Calcinha:
        return 'Calcinha';
      case TipoItens.Sutia:
        return 'Sutia';
      case TipoItens.Maio:
        return 'Maio';
      case TipoItens.Camisola:
        return 'Camisola';
      case TipoItens.Cueca:
        return 'Cueca';
      case TipoItens.Pijama:
        return 'Pijama';
      default:
        return "";
    }
  }
}

extension TamanhoExtension on Tamanho {
  String get name {
    switch (this) {
      case Tamanho.P:
        return 'P';
      case Tamanho.PP:
        return 'PP';
      case Tamanho.M:
        return 'M';
      case Tamanho.G:
        return 'G';
      case Tamanho.GG:
        return 'GG';
      case Tamanho.XG:
        return 'XG';
      case Tamanho.XGG:
        return 'XXG';
      default:
        return "";
    }
  }
}

class PedidoItemModel {
  String id = "";
  String idPedido = "";
  String obs = "";
  int qnt = 0;
  int extraSuperior = 0;
  int extraInferior = 0;
  ValueNotifier<Tamanho> tamSuperior = ValueNotifier(Tamanho.M);
  ValueNotifier<Tamanho> tamInferior = ValueNotifier(Tamanho.P);
  ValueNotifier<TipoItens> tipo = ValueNotifier(TipoItens.Calcinha);
  ValueNotifier<bool> renda = ValueNotifier(false);
  double valor = 0.0;

  PedidoItemModel();
}
