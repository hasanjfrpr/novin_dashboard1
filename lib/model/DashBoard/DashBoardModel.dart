class DashBoardModel {
  ForoshAndReturnList? foroshAndReturnList;
  DayWeek7? dayWeek7;
  List<ForoshMojodiKala>? foroshMojodiKala;
  Result? result;
  List<Dashboardllist>? dashboardllist;
  String? methodName;
  String? id;
  String? totalpage;
  String? status;

  DashBoardModel(
      {this.foroshAndReturnList,
        this.dayWeek7,
        this.foroshMojodiKala,
        this.result,
        this.dashboardllist,
        this.methodName,
        this.id,
        this.totalpage,
        this.status});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    foroshAndReturnList = json['ForoshAndReturnList'] != null
        ? new ForoshAndReturnList.fromJson(json['ForoshAndReturnList'])
        : null;
    dayWeek7 = json['DayWeek7'] != null
        ? new DayWeek7.fromJson(json['DayWeek7'])
        : null;
    if (json['ForoshMojodiKala'] != null) {
      foroshMojodiKala = <ForoshMojodiKala>[];
      json['ForoshMojodiKala'].forEach((v) {
        foroshMojodiKala!.add(new ForoshMojodiKala.fromJson(v));
      });
    }
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    if (json['dashboardllist'] != null) {
      dashboardllist = <Dashboardllist>[];
      json['dashboardllist'].forEach((v) {
        dashboardllist!.add(new Dashboardllist.fromJson(v));
      });
    }
    methodName = json['methodName'];
    id = json['id'];
    totalpage = json['totalpage'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.foroshAndReturnList != null) {
      data['ForoshAndReturnList'] = this.foroshAndReturnList!.toJson();
    }
    if (this.dayWeek7 != null) {
      data['DayWeek7'] = this.dayWeek7!.toJson();
    }
    if (this.foroshMojodiKala != null) {
      data['ForoshMojodiKala'] =
          this.foroshMojodiKala!.map((v) => v.toJson()).toList();
    }
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    if (this.dashboardllist != null) {
      data['dashboardllist'] =
          this.dashboardllist!.map((v) => v.toJson()).toList();
    }
    data['methodName'] = this.methodName;
    data['id'] = this.id;
    data['totalpage'] = this.totalpage;
    data['Status'] = this.status;
    return data;
  }
}

class ForoshAndReturnList {
  String? totalOfSales;
  String? qSaleDoc;
  String? soodZian;
  String? retFactorTotalPrice;
  String? countgoods;
  String? countReturndocs;

  ForoshAndReturnList(
      {this.totalOfSales,
        this.qSaleDoc,
        this.soodZian,
        this.retFactorTotalPrice,
        this.countgoods,
        this.countReturndocs});

  ForoshAndReturnList.fromJson(Map<String, dynamic> json) {
    totalOfSales = json['TotalOfSales'];
    qSaleDoc = json['Q_SaleDoc'];
    soodZian = json['SoodZian'];
    retFactorTotalPrice = json['RetFactorTotal_price'];
    countgoods = json['countgoods'];
    countReturndocs = json['countReturndocs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalOfSales'] = this.totalOfSales;
    data['Q_SaleDoc'] = this.qSaleDoc;
    data['SoodZian'] = this.soodZian;
    data['RetFactorTotal_price'] = this.retFactorTotalPrice;
    data['countgoods'] = this.countgoods;
    data['countReturndocs'] = this.countReturndocs;
    return data;
  }
}

class DayWeek7 {
  String? retReportChartWeek7;
  String? retReportChartWeek7Name;
  String? retReportChartWeek6;
  String? retReportChartWeek6Name;
  String? retReportChartWeek5;
  String? retReportChartWeek5Name;
  String? retReportChartWeek4;
  String? retReportChartWeek4Name;
  String? retReportChartWeek3;
  String? retReportChartWeek3Name;
  String? retReportChartWeek2;
  String? retReportChartWeek2Name;
  String? retReportChartWeek1;
  String? retReportChartWeek1Name;
  String? foroshReportChartWeek7;
  String? foroshReportChartWeek7Name;
  String? foroshReportChartWeek6;
  String? foroshReportChartWeek6Name;
  String? foroshReportChartWeek5;
  String? foroshReportChartWeek5Name;
  String? foroshReportChartWeek4;
  String? foroshReportChartWeek4Name;
  String? foroshReportChartWeek3;
  String? foroshReportChartWeek3Name;
  String? foroshReportChartWeek2;
  String? foroshReportChartWeek2Name;
  String? foroshReportChartWeek1;
  String? foroshReportChartWeek1Name;

  DayWeek7(
      {this.retReportChartWeek7,
        this.retReportChartWeek7Name,
        this.retReportChartWeek6,
        this.retReportChartWeek6Name,
        this.retReportChartWeek5,
        this.retReportChartWeek5Name,
        this.retReportChartWeek4,
        this.retReportChartWeek4Name,
        this.retReportChartWeek3,
        this.retReportChartWeek3Name,
        this.retReportChartWeek2,
        this.retReportChartWeek2Name,
        this.retReportChartWeek1,
        this.retReportChartWeek1Name,
        this.foroshReportChartWeek7,
        this.foroshReportChartWeek7Name,
        this.foroshReportChartWeek6,
        this.foroshReportChartWeek6Name,
        this.foroshReportChartWeek5,
        this.foroshReportChartWeek5Name,
        this.foroshReportChartWeek4,
        this.foroshReportChartWeek4Name,
        this.foroshReportChartWeek3,
        this.foroshReportChartWeek3Name,
        this.foroshReportChartWeek2,
        this.foroshReportChartWeek2Name,
        this.foroshReportChartWeek1,
        this.foroshReportChartWeek1Name});

  DayWeek7.fromJson(Map<String, dynamic> json) {
    retReportChartWeek7 = json['RetReportChartWeek7'];
    retReportChartWeek7Name = json['RetReportChartWeek7Name'];
    retReportChartWeek6 = json['RetReportChartWeek6'];
    retReportChartWeek6Name = json['RetReportChartWeek6Name'];
    retReportChartWeek5 = json['RetReportChartWeek5'];
    retReportChartWeek5Name = json['RetReportChartWeek5Name'];
    retReportChartWeek4 = json['RetReportChartWeek4'];
    retReportChartWeek4Name = json['RetReportChartWeek4Name'];
    retReportChartWeek3 = json['RetReportChartWeek3'];
    retReportChartWeek3Name = json['RetReportChartWeek3Name'];
    retReportChartWeek2 = json['RetReportChartWeek2'];
    retReportChartWeek2Name = json['RetReportChartWeek2Name'];
    retReportChartWeek1 = json['RetReportChartWeek1'];
    retReportChartWeek1Name = json['RetReportChartWeek1Name'];
    foroshReportChartWeek7 = json['ForoshReportChartWeek7'];
    foroshReportChartWeek7Name = json['ForoshReportChartWeek7Name'];
    foroshReportChartWeek6 = json['ForoshReportChartWeek6'];
    foroshReportChartWeek6Name = json['ForoshReportChartWeek6Name'];
    foroshReportChartWeek5 = json['ForoshReportChartWeek5'];
    foroshReportChartWeek5Name = json['ForoshReportChartWeek5Name'];
    foroshReportChartWeek4 = json['ForoshReportChartWeek4'];
    foroshReportChartWeek4Name = json['ForoshReportChartWeek4Name'];
    foroshReportChartWeek3 = json['ForoshReportChartWeek3'];
    foroshReportChartWeek3Name = json['ForoshReportChartWeek3Name'];
    foroshReportChartWeek2 = json['ForoshReportChartWeek2'];
    foroshReportChartWeek2Name = json['ForoshReportChartWeek2Name'];
    foroshReportChartWeek1 = json['ForoshReportChartWeek1'];
    foroshReportChartWeek1Name = json['ForoshReportChartWeek1Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RetReportChartWeek7'] = this.retReportChartWeek7;
    data['RetReportChartWeek7Name'] = this.retReportChartWeek7Name;
    data['RetReportChartWeek6'] = this.retReportChartWeek6;
    data['RetReportChartWeek6Name'] = this.retReportChartWeek6Name;
    data['RetReportChartWeek5'] = this.retReportChartWeek5;
    data['RetReportChartWeek5Name'] = this.retReportChartWeek5Name;
    data['RetReportChartWeek4'] = this.retReportChartWeek4;
    data['RetReportChartWeek4Name'] = this.retReportChartWeek4Name;
    data['RetReportChartWeek3'] = this.retReportChartWeek3;
    data['RetReportChartWeek3Name'] = this.retReportChartWeek3Name;
    data['RetReportChartWeek2'] = this.retReportChartWeek2;
    data['RetReportChartWeek2Name'] = this.retReportChartWeek2Name;
    data['RetReportChartWeek1'] = this.retReportChartWeek1;
    data['RetReportChartWeek1Name'] = this.retReportChartWeek1Name;
    data['ForoshReportChartWeek7'] = this.foroshReportChartWeek7;
    data['ForoshReportChartWeek7Name'] = this.foroshReportChartWeek7Name;
    data['ForoshReportChartWeek6'] = this.foroshReportChartWeek6;
    data['ForoshReportChartWeek6Name'] = this.foroshReportChartWeek6Name;
    data['ForoshReportChartWeek5'] = this.foroshReportChartWeek5;
    data['ForoshReportChartWeek5Name'] = this.foroshReportChartWeek5Name;
    data['ForoshReportChartWeek4'] = this.foroshReportChartWeek4;
    data['ForoshReportChartWeek4Name'] = this.foroshReportChartWeek4Name;
    data['ForoshReportChartWeek3'] = this.foroshReportChartWeek3;
    data['ForoshReportChartWeek3Name'] = this.foroshReportChartWeek3Name;
    data['ForoshReportChartWeek2'] = this.foroshReportChartWeek2;
    data['ForoshReportChartWeek2Name'] = this.foroshReportChartWeek2Name;
    data['ForoshReportChartWeek1'] = this.foroshReportChartWeek1;
    data['ForoshReportChartWeek1Name'] = this.foroshReportChartWeek1Name;
    return data;
  }
}

class ForoshMojodiKala {
  String? sumQty;
  String? fLDTIFLFAC;
  String? total;

  ForoshMojodiKala({this.sumQty, this.fLDTIFLFAC, this.total});

  ForoshMojodiKala.fromJson(Map<String, dynamic> json) {
    sumQty = json['SumQty'];
    fLDTIFLFAC = json['FLD_TIF_LFAC'];
    total = json['Total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SumQty'] = this.sumQty;
    data['FLD_TIF_LFAC'] = this.fLDTIFLFAC;
    data['Total'] = this.total;
    return data;
  }
}

class Result {
  String? success;
  String? logStr;

  Result({this.success, this.logStr});

  Result.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    logStr = json['LogStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    data['LogStr'] = this.logStr;
    return data;
  }
}

class Dashboardllist {
  String? fLDSCRHEAD;
  String? tIF;
  String? sBED;
  String? sBES;
  String? bED;
  String? bES;

  Dashboardllist(
      {this.fLDSCRHEAD, this.tIF, this.sBED, this.sBES, this.bED, this.bES});

  Dashboardllist.fromJson(Map<String, dynamic> json) {
    fLDSCRHEAD = json['FLD_SCR_HEAD'];
    tIF = json['TIF'];
    sBED = json['S_BED'];
    sBES = json['S_BES'];
    bED = json['BED'];
    bES = json['BES'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FLD_SCR_HEAD'] = this.fLDSCRHEAD;
    data['TIF'] = this.tIF;
    data['S_BED'] = this.sBED;
    data['S_BES'] = this.sBES;
    data['BED'] = this.bED;
    data['BES'] = this.bES;
    return data;
  }
}