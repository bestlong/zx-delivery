{*******************************************************************************
  作者: dmzn@163.com 2010-3-8
  描述: 系统业务处理
*******************************************************************************}
unit USysBusiness;

interface

uses
  Windows, Classes, Controls, DB, SysUtils, ULibFun, UAdjustForm, UFormCtrl,
  UDataModule, UDataReport, cxMCListBox, USysConst, USysDB;

//------------------------------------------------------------------------------
function AdjustHintToRead(const nHint: string): string;
//调整提示内容
function WorkPCHasPopedom: Boolean;
//验证主机是否已授权
function LoadSysDictItem(const nItem: string; const nList: TStrings): TDataSet;
//读取系统字典项
function LoadSaleMan(const nList: TStrings; const nWhere: string = ''): Boolean;
//读取业务员列表
function LoadCustomer(const nList: TStrings; const nWhere: string = ''): Boolean;
//读取客户列表
function LoadCustomerInfo(const nCID: string; const nList: TcxMCListBox;
 var nHint: string): TDataSet;
//载入客户信息

function IsZhiKaNeedVerify: Boolean;
//纸卡是否需要审核
function IsPrintZK: Boolean;
//是否打印纸卡
function DeleteZhiKa(const nZID: string): Boolean;
//删除指定纸卡
function LoadZhiKaInfo(const nZID: string; const nList: TcxMCListBox;
 var nHint: string): TDataset;
//载入纸卡
function GetCustomerValidMoney(const nCID: string;
 const nLimit: Boolean = True): Double;
//客户可用金额
function SaveXuNiCustomer(const nName,nSaleMan: string): string;
//存临时客户
function IsAutoPayCredit: Boolean;
//回款时冲信用
function SaveCustomerPayment(const nCusID,nCusName,nSaleMan: string;
 const nType,nPayment,nMemo: string; const nMoney: Double;
 const nCredit: Boolean = True): Boolean;
//保存回款记录
function SaveCustomerCredit(const nCusID,nMemo: string; const nCredit: Double;
 const nEndTime: TDateTime): Boolean;
//保存信用记录

//------------------------------------------------------------------------------
procedure PrintSaleContractReport(const nID: string; const nAsk: Boolean);
//打印合同
function PrintZhiKaReport(const nZID: string; const nAsk: Boolean): Boolean;
//打印纸卡
function PrintShouJuReport(const nSID: string; const nAsk: Boolean): Boolean;
//打印收据

implementation

//------------------------------------------------------------------------------
//Desc: 调整nHint为易读的格式
function AdjustHintToRead(const nHint: string): string;
var nIdx: Integer;
    nList: TStrings;
begin
  nList := TStringList.Create;
  try
    nList.Text := nHint;
    for nIdx:=0 to nList.Count - 1 do
      nList[nIdx] := '※.' + nList[nIdx];
    Result := nList.Text;
  finally
    nList.Free;
  end;
end;

//Desc: 验证主机是否已授权接入系统
function WorkPCHasPopedom: Boolean;
begin
  Result := gSysParam.FSerialID <> '';
  if not Result then
  begin
    ShowDlg('该功能需要更高权限,请向管理员申请.', sHint);
  end;
end;

//Date: 2010-4-13
//Parm: 字典项;列表
//Desc: 从SysDict中读取nItem项的内容,存入nList中
function LoadSysDictItem(const nItem: string; const nList: TStrings): TDataSet;
var nStr: string;
begin
  nList.Clear;
  nStr := MacroValue(sQuery_SysDict, [MI('$Table', sTable_SysDict),
                                      MI('$Name', nItem)]);
  Result := FDM.QueryTemp(nStr);

  if Result.RecordCount > 0 then
  with Result do
  begin
    First;

    while not Eof do
    begin
      nList.Add(FieldByName('D_Value').AsString);
      Next;
    end;
  end else Result := nil;
end;

//Desc: 读取业务员列表到nList中,包含附加数据
function LoadSaleMan(const nList: TStrings; const nWhere: string = ''): Boolean;
var nStr,nW: string;
begin
  if nWhere = '' then
       nW := ''
  else nW := Format(' And (%s)', [nWhere]);

  nStr := 'S_ID=Select S_ID,S_PY,S_Name From %s ' +
          'Where IsNull(S_InValid, '''')<>''%s'' %s Order By S_PY';
  nStr := Format(nStr, [sTable_Salesman, sFlag_Yes, nW]);

  AdjustStringsItem(nList, True);
  FDM.FillStringsData(nList, nStr, -1, '.', DSA(['S_ID']));
  
  AdjustStringsItem(nList, False);
  Result := nList.Count > 0;
end;

//Desc: 读取客户列表到nList中,包含附加数据
function LoadCustomer(const nList: TStrings; const nWhere: string = ''): Boolean;
var nStr,nW: string;
begin
  if nWhere = '' then
       nW := ''
  else nW := Format(' And (%s)', [nWhere]);

  nStr := 'C_ID=Select C_ID,C_Name From %s ' +
          'Where IsNull(C_XuNi, '''')<>''%s'' %s Order By C_PY';
  nStr := Format(nStr, [sTable_Customer, sFlag_Yes, nW]);

  AdjustStringsItem(nList, True);
  FDM.FillStringsData(nList, nStr, -1, '.');

  AdjustStringsItem(nList, False);
  Result := nList.Count > 0;
end;

//Desc: 载入nCID客户的信息到nList中,并返回数据集
function LoadCustomerInfo(const nCID: string; const nList: TcxMCListBox;
 var nHint: string): TDataSet;
var nStr: string;
begin
  nStr := 'Select cus.*,S_Name as C_SaleName From $Cus cus ' +
          ' Left Join $SM sm On sm.S_ID=cus.C_SaleMan ' +
          'Where C_ID=''$ID''';
  nStr := MacroValue(nStr, [MI('$Cus', sTable_Customer), MI('$ID', nCID),
          MI('$SM', sTable_Salesman)]);
  //xxxxx

  nList.Clear;
  Result := FDM.QueryTemp(nStr);

  if Result.RecordCount > 0 then
  with nList.Items,Result do
  begin
    Add('客户编号:' + nList.Delimiter + FieldByName('C_ID').AsString);
    Add('客户名称:' + nList.Delimiter + FieldByName('C_Name').AsString + ' ');
    Add('企业法人:' + nList.Delimiter + FieldByName('C_FaRen').AsString + ' ');
    Add('联系方式:' + nList.Delimiter + FieldByName('C_Phone').AsString + ' ');
    Add('所属业务员:' + nList.Delimiter + FieldByName('C_SaleName').AsString);
  end else
  begin
    Result := nil;
    nHint := '客户信息已丢失';
  end;
end;

//Desc: 保存nSaleMan名下的nName为临时客户,返回客户号
function SaveXuNiCustomer(const nName,nSaleMan: string): string;
var nID: Integer;
    nStr: string;
    nBool: Boolean;
begin
  nStr := 'Select C_ID From %s ' +
          'Where C_XuNi=''%s'' And C_SaleMan=''%s'' And C_Name=''%s''';
  nStr := Format(nStr, [sTable_Customer, sFlag_Yes, nSaleMan, nName]);

  with FDM.QueryTemp(nStr) do
  if RecordCount > 0 then
  begin
    Result := Fields[0].AsString;
    Exit;
  end;

  nBool := FDM.ADOConn.InTransaction;
  if not nBool then FDM.ADOConn.BeginTrans;
  try
    nStr := 'Insert Into %s(C_Name,C_PY,C_SaleMan,C_XuNi) ' +
            'Values(''%s'',''%s'',''%s'', ''%s'')';
    nStr := Format(nStr, [sTable_Customer, nName, GetPinYinOfStr(nName),
            nSaleMan, sFlag_Yes]);
    FDM.ExecuteSQL(nStr);

    nID := FDM.GetFieldMax(sTable_Customer, 'R_ID');
    Result := FDM.GetSerialID2('KH', sTable_Customer, 'R_ID', 'C_ID', nID);

    nStr := 'Update %s Set C_ID=''%s'' Where R_ID=%d';
    nStr := Format(nStr, [sTable_Customer, Result, nID]);
    FDM.ExecuteSQL(nStr);

    nStr := 'Insert Into %s(A_CID,A_Date) Values(''%s'', %s)';
    nStr := Format(nStr, [sTable_CusAccount, Result, FDM.SQLServerNow]);
    FDM.ExecuteSQL(nStr);

    if not nBool then
      FDM.ADOConn.CommitTrans;
    //commit if need
  except
    Result := '';
    if not nBool then FDM.ADOConn.RollbackTrans;
  end;
end;

//Desc: 汇款时冲信用额度
function IsAutoPayCredit: Boolean;
var nStr: string;
begin
  nStr := 'Select D_Value From $T Where D_Name=''$N'' and D_Memo=''$M''';
  nStr := MacroValue(nStr, [MI('$T', sTable_SysDict), MI('$N', sFlag_SysParam),
                           MI('$M', sFlag_PayCredit)]);
  //xxxxx

  with FDM.QueryTemp(nStr) do
  if RecordCount > 0 then
       Result := Fields[0].AsString = sFlag_Yes
  else Result := False;
end;

//Desc: 保存nCusID的一次回款记录
function SaveCustomerPayment(const nCusID,nCusName,nSaleMan: string;
 const nType,nPayment,nMemo: string; const nMoney: Double;
 const nCredit: Boolean): Boolean;
var nStr: string;
    nBool: Boolean;
    nVal,nLimit: Double;
begin
  Result := False;
  nVal := Float2Float(nMoney, cPrecision, False);
  //adjust float value

  if nVal < 0 then
  begin
    nLimit := GetCustomerValidMoney(nCusID, False);
    //get money value
    
    if (nLimit <= 0) or (nLimit < -nVal) then
    begin
      nStr := '客户: %s ' + #13#10#13#10 +
              '当前余额为[ %.2f ]元,无法支出[ %.2f ]元.';
      nStr := Format(nStr, [nCusName, nLimit, -nVal]);
      
      ShowDlg(nStr, sHint);
      Exit;
    end;
  end;

  nLimit := 0;
  //no limit

  if nCredit and (nVal > 0) and IsAutoPayCredit then
  begin
    nStr := 'Select A_CreditLimit From %s Where A_CID=''%s''';
    nStr := Format(nStr, [sTable_CusAccount, nCusID]);

    with FDM.QueryTemp(nStr) do
    if (RecordCount > 0) and (Fields[0].AsFloat > 0) then
    begin
      if FloatRelation(nVal, Fields[0].AsFloat, rtGreater) then
           nLimit := Float2Float(Fields[0].AsFloat, cPrecision, False)
      else nLimit := nVal;

      nStr := '客户[ %s ]当前信用额度为[ %.2f ]元,是否冲减?' +
              #32#32#13#10#13#10 + '点击"是"将降低[ %.2f ]元的额度.';
      nStr := Format(nStr, [nCusName, Fields[0].AsFloat, nLimit]);

      if not QueryDlg(nStr, sAsk) then
        nLimit := 0;
      //xxxxx
    end;
  end;

  nBool := FDM.ADOConn.InTransaction;
  if not nBool then FDM.ADOConn.BeginTrans;
  try
    nStr := 'Update %s Set A_InMoney=A_InMoney+%.2f Where A_CID=''%s''';
    nStr := Format(nStr, [sTable_CusAccount, nVal, nCusID]);
    FDM.ExecuteSQL(nStr);

    nStr := 'Insert Into %s(M_SaleMan,M_CusID,M_CusName,' +
            'M_Type,M_Payment,M_Money,M_Date,M_Man,M_Memo) ' +
            'Values(''%s'',''%s'',''%s'',''%s'',''%s'',%.2f,%s,''%s'',''%s'')';
    nStr := Format(nStr, [sTable_InOutMoney, nSaleMan, nCusID, nCusName, nType,
            nPayment, nVal, FDM.SQLServerNow, gSysParam.FUserID, nMemo]);
    FDM.ExecuteSQL(nStr);

    if (nLimit > 0) and (
       not SaveCustomerCredit(nCusID, '回款时冲减', -nLimit, Now)) then
    begin
      nStr := '发生未知错误,导致冲减客户[ %s ]信用操作失败.' + #13#10 +
              '请手动调整该客户信用额度.';
      nStr := Format(nStr, [nCusName]);
      ShowDlg(nStr, sHint);
    end;

    if not nBool then
      FDM.ADOConn.CommitTrans;
    Result := True;
  except
    Result := False;
    if not nBool then FDM.ADOConn.RollbackTrans;
  end;
end;

//Desc: 保存nCusID的一次授信记录
function SaveCustomerCredit(const nCusID,nMemo: string; const nCredit: Double;
 const nEndTime: TDateTime): Boolean;
var nStr: string;
    nVal: Double;
    nBool: Boolean;
begin
  nBool := FDM.ADOConn.InTransaction;
  if not nBool then FDM.ADOConn.BeginTrans;
  try
    nVal := Float2Float(nCredit, cPrecision, False);
    //adjust float value

    nStr := 'Insert Into %s(C_CusID,C_Money,C_Man,C_Date,C_End,C_Memo) ' +
            'Values(''%s'', %.2f, ''%s'', %s, ''%s'', ''%s'')';
    nStr := Format(nStr, [sTable_CusCredit, nCusID, nVal, gSysParam.FUserID,
            FDM.SQLServerNow, DateTime2Str(nEndTime), nMemo]);
    FDM.ExecuteSQL(nStr);

    nStr := 'Update %s Set A_CreditLimit=A_CreditLimit+%.2f Where A_CID=''%s''';
    nStr := Format(nStr, [sTable_CusAccount, nVal, nCusID]);
    FDM.ExecuteSQL(nStr);

    if not nBool then
      FDM.ADOConn.CommitTrans;
    Result := True;
  except
    Result := False;
    if not nBool then FDM.ADOConn.RollbackTrans;
  end;
end;

//------------------------------------------------------------------------------
//Desc: 纸卡是否需要审核
function IsZhiKaNeedVerify: Boolean;
var nStr: string;
begin
  nStr := 'Select D_Value From $T Where D_Name=''$N'' and D_Memo=''$M''';
  nStr := MacroValue(nStr, [MI('$T', sTable_SysDict), MI('$N', sFlag_SysParam),
                           MI('$M', sFlag_ZhiKaVerify)]);
  //xxxxx

  with FDM.QueryTemp(nStr) do
  if RecordCount > 0 then
       Result := Fields[0].AsString = sFlag_Yes
  else Result := False;
end;

//Desc: 是否打印纸卡
function IsPrintZK: Boolean;
var nStr: string;
begin
  nStr := 'Select D_Value From $T Where D_Name=''$N'' and D_Memo=''$M''';
  nStr := MacroValue(nStr, [MI('$T', sTable_SysDict), MI('$N', sFlag_SysParam),
                           MI('$M', sFlag_PrintZK)]);
  //xxxxx

  with FDM.QueryTemp(nStr) do
  if RecordCount > 0 then
       Result := Fields[0].AsString = sFlag_Yes
  else Result := False;
end;

//Desc: 删除编号为nZID的纸卡
function DeleteZhiKa(const nZID: string): Boolean;
var nStr: string;
    nBool: Boolean;
begin
  nBool := FDM.ADOConn.InTransaction;
  if not nBool then FDM.ADOConn.BeginTrans;
  try
    nStr := 'Delete From %s Where Z_ID=''%s''';
    nStr := Format(nStr, [sTable_ZhiKa, nZID]);
    Result := FDM.ExecuteSQL(nStr) > 0;

    nStr := 'Delete From %s Where D_ZID=''%s''';
    nStr := Format(nStr, [sTable_ZhiKaDtl, nZID]);
    FDM.ExecuteSQL(nStr);

    nStr := 'Update %s Set M_ZID=M_ZID+''_d'' Where M_ZID=''%s''';
    nStr := Format(nStr, [sTable_InOutMoney, nZID]);
    FDM.ExecuteSQL(nStr);

    if not nBool then
      FDM.ADOConn.CommitTrans;
    //commit if need
  except
    Result := False;
    if not nBool then FDM.ADOConn.RollbackTrans;
  end;
end;

//Desc: 载入nZID的信息到nList中,并返回查询数据集
function LoadZhiKaInfo(const nZID: string; const nList: TcxMCListBox;
 var nHint: string): TDataset;
var nStr: string;
begin
  nStr := 'Select zk.*,sm.S_Name,cus.C_Name From $ZK zk ' +
          ' Left Join $SM sm On sm.S_ID=zk.Z_SaleMan ' +
          ' Left Join $Cus cus On cus.C_ID=zk.Z_Customer ' +
          'Where Z_ID=''$ID''';
  //xxxxx

  nStr := MacroValue(nStr, [MI('$ZK', sTable_ZhiKa),
             MI('$Con', sTable_SaleContract), MI('$SM', sTable_Salesman),
             MI('$Cus', sTable_Customer), MI('$ID', nZID)]);
  //xxxxx

  nList.Clear;
  Result := FDM.QueryTemp(nStr);

  if Result.RecordCount = 1 then
  with nList.Items,Result do
  begin
    Add('纸卡编号:' + nList.Delimiter + FieldByName('Z_ID').AsString);
    Add('业务人员:' + nList.Delimiter + FieldByName('S_Name').AsString+ ' ');
    Add('客户名称:' + nList.Delimiter + FieldByName('C_Name').AsString + ' ');
    Add('项目名称:' + nList.Delimiter + FieldByName('Z_Project').AsString + ' ');
    
    nStr := DateTime2Str(FieldByName('Z_Date').AsDateTime);
    Add('办卡时间:' + nList.Delimiter + nStr);
  end else
  begin
    Result := nil;
    nHint := '纸卡已无效';
  end;
end;

//Desc: 获取nCID用户的可用金额,包含信用额或净额
function GetCustomerValidMoney(const nCID: string; const nLimit: Boolean): Double;
var nStr: string;
    nVal: Double;
begin
  Result := 0;
  nStr := 'Select * From %s Where A_CID=''%s''';
  nStr := Format(nStr, [sTable_CusAccount, nCID]);

  with FDM.QueryTemp(nStr) do
  if RecordCount = 1 then
  begin
    nVal := FieldByName('A_InMoney').AsFloat -
            FieldByName('A_OutMoney').AsFloat -
            FieldByName('A_Compensation').AsFloat -
            FieldByName('A_FreezeMoney').AsFloat;
    //xxxxx

    if nLimit then
      nVal := nVal + FieldByName('A_CreditLimit').AsFloat;
    Result := Float2PInt(nVal, cPrecision) / cPrecision;
  end;
end;

//------------------------------------------------------------------------------
//  打印单据
//------------------------------------------------------------------------------
//Desc: 打印标识为nID的销售合同
procedure PrintSaleContractReport(const nID: string; const nAsk: Boolean);
var nStr: string;
    nParam: TReportParamItem;
begin
  if nAsk then
  begin
    nStr := '是否要打印销售合同?';
    if not QueryDlg(nStr, sAsk) then Exit;
  end;

  nStr := 'Select sc.*,S_Name,C_Name From $SC sc ' +
          '  Left Join $SM sm On sm.S_ID=sc.C_SaleMan ' +
          '  Left Join $Cus cus On cus.C_ID=sc.C_Customer ' +
          'Where sc.C_ID=''$ID''';

  nStr := MacroValue(nStr, [MI('$SC', sTable_SaleContract),
          MI('$SM', sTable_Salesman), MI('$Cus', sTable_Customer),
          MI('$ID', nID)]);

  if FDM.QueryTemp(nStr).RecordCount < 1 then
  begin
    nStr := '编号为[ %s] 的销售合同已无效!!';
    nStr := Format(nStr, [nID]);
    ShowMsg(nStr, sHint); Exit;
  end;

  nStr := 'Select * From %s Where E_CID=''%s''';
  nStr := Format(nStr, [sTable_SContractExt, nID]);
  FDM.QuerySQL(nStr);

  nStr := gPath + sReportDir + 'SaleContract.fr3';
  if not FDR.LoadReportFile(nStr) then
  begin
    nStr := '无法正确加载报表文件';
    ShowMsg(nStr, sHint); Exit;
  end;

  nParam.FName := 'UserName';
  nParam.FValue := gSysParam.FUserID;
  FDR.AddParamItem(nParam);

  FDR.Dataset1.DataSet := FDM.SqlTemp;
  FDR.Dataset2.DataSet := FDM.SqlQuery;
  FDR.ShowReport;
end;

//Desc: 打印纸卡
function PrintZhiKaReport(const nZID: string; const nAsk: Boolean): Boolean;
var nStr: string;
begin
  Result := False;

  if nAsk then
  begin
    nStr := '是否要打印纸卡?';
    if not QueryDlg(nStr, sAsk) then Exit;
  end;

  nStr := 'Select zk.*,C_Name,S_Name From %s zk ' +
          ' Left Join %s cus on cus.C_ID=zk.Z_Customer' +
          ' Left Join %s sm on sm.S_ID=zk.Z_SaleMan ' +
          'Where Z_ID=''%s''';
  nStr := Format(nStr, [sTable_ZhiKa, sTable_Customer, sTable_Salesman, nZID]);
  
  if FDM.QueryTemp(nStr).RecordCount < 1 then
  begin
    nStr := '纸卡号为[ %s ] 的记录已无效';
    nStr := Format(nStr, [nZID]);
    ShowMsg(nStr, sHint); Exit;
  end;

  nStr := 'Select * From %s Where D_ZID=''%s''';
  nStr := Format(nStr, [sTable_ZhiKaDtl, nZID]);
  if FDM.QuerySQL(nStr).RecordCount < 1 then
  begin
    nStr := '编号为[ %s ] 的纸卡无明细';
    nStr := Format(nStr, [nZID]);
    ShowMsg(nStr, sHint); Exit;
  end;

  nStr := gPath + sReportDir + 'ZhiKa.fr3';
  if not FDR.LoadReportFile(nStr) then
  begin
    nStr := '无法正确加载报表文件';
    ShowMsg(nStr, sHint); Exit;
  end;

  FDR.Dataset1.DataSet := FDM.SqlTemp;
  FDR.Dataset2.DataSet := FDM.SqlQuery;
  FDR.ShowReport;
  Result := FDR.PrintSuccess;
end;

//Desc: 打印收据
function PrintShouJuReport(const nSID: string; const nAsk: Boolean): Boolean;
var nStr: string;
begin
  Result := False;

  if nAsk then
  begin
    nStr := '是否要打印收据?';
    if not QueryDlg(nStr, sAsk) then Exit;
  end;

  nStr := 'Select * From %s Where R_ID=%s';
  nStr := Format(nStr, [sTable_SysShouJu, nSID]);
  
  if FDM.QueryTemp(nStr).RecordCount < 1 then
  begin
    nStr := '凭单号为[ %s ] 的收据已无效!!';
    nStr := Format(nStr, [nSID]);
    ShowMsg(nStr, sHint); Exit;
  end;

  nStr := gPath + sReportDir + 'ShouJu.fr3';
  if not FDR.LoadReportFile(nStr) then
  begin
    nStr := '无法正确加载报表文件';
    ShowMsg(nStr, sHint); Exit;
  end;

  FDR.Dataset1.DataSet := FDM.SqlTemp;
  FDR.ShowReport;
  Result := FDR.PrintSuccess;
end;

end.
