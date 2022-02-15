// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
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
  double valor = 0.0;
  DateTime dataInclusao = DateTime.now();
  ValueNotifier<Tamanho> tamSuperior = ValueNotifier(Tamanho.M);
  ValueNotifier<Tamanho> tamInferior = ValueNotifier(Tamanho.P);
  ValueNotifier<TipoItens> tipo = ValueNotifier(TipoItens.Calcinha);
  ValueNotifier<bool> renda = ValueNotifier(false);

  PedidoItemModel();

  Tamanho setTam(String tam) {
    switch (tam) {
      case 'P':
        return Tamanho.P;
      case 'PP':
        return Tamanho.PP;
      case 'M':
        return Tamanho.M;
      case 'G':
        return Tamanho.G;
      case 'GG':
        return Tamanho.GG;
      case 'XG':
        return Tamanho.XG;
      case 'XXG':
        return Tamanho.XGG;
      default:
        return Tamanho.P;
    }
  }

  TipoItens setType(String type) {
    switch (type) {
      case 'Calcinha':
        return TipoItens.Calcinha;
      case 'Sutia':
        return TipoItens.Sutia;
      case 'Maio':
        return TipoItens.Maio;
      case 'Camisola':
        return TipoItens.Camisola;
      case 'Cueca':
        return TipoItens.Cueca;
      case 'Pijama':
        return TipoItens.Pijama;
      default:
        return TipoItens.Calcinha;
    }
  }

  PedidoItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPedido = json['idPedido'];
    obs = json['obs'];
    extraSuperior = json['extraSuperior'];
    extraInferior = json['extraInferior'];
    tamSuperior.value = setTam(json['tamSuperior']);
    tamInferior.value = setTam(json['tamInferior']);
    tipo.value = setType(json['tipo']);
    renda.value = json['renda'];
    valor = json['valor'];
    dataInclusao = json['dataInclusao'] != null
        ? (json['dataInclusao'] as Timestamp).toDate()
        : DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idPedido": idPedido,
      "obs": obs,
      "extraSuperior": extraSuperior,
      "extraInferior": extraInferior,
      "tamSuperior": tamSuperior.value.name,
      "tamInferior": tamInferior.value.name,
      "tipo": tipo.value.name,
      "renda": renda.value,
      "valor": valor,
      "dataInclusao": dataInclusao.toIso8601String()
    };
  }
}
