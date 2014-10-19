{*******************************************************************************
  ����: dmzn@163.com 2009-6-22
  ����: �������
*******************************************************************************}
unit UFrameBill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrameNormal, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxContainer, cxLabel,
  dxLayoutControl, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, ToolWin, cxTextEdit, cxMaskEdit, cxButtonEdit, Menus,
  UBitmapPanel, cxSplitter, cxLookAndFeels, cxLookAndFeelPainters;

type
  TfFrameBill = class(TfFrameNormal)
    EditCus: TcxButtonEdit;
    dxLayout1Item1: TdxLayoutItem;
    EditCard: TcxButtonEdit;
    dxLayout1Item2: TdxLayoutItem;
    cxTextEdit1: TcxTextEdit;
    dxLayout1Item3: TdxLayoutItem;
    cxTextEdit2: TcxTextEdit;
    dxLayout1Item4: TdxLayoutItem;
    cxTextEdit4: TcxTextEdit;
    dxLayout1Item6: TdxLayoutItem;
    cxTextEdit3: TcxTextEdit;
    dxLayout1Item5: TdxLayoutItem;
    EditDate: TcxButtonEdit;
    dxLayout1Item7: TdxLayoutItem;
    PMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    EditLID: TcxButtonEdit;
    dxLayout1Item8: TdxLayoutItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Edit1: TcxTextEdit;
    dxLayout1Item9: TdxLayoutItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure EditIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure EditDatePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  protected
    FStart,FEnd: TDate;
    //ʱ������
    FUseDate: Boolean;
    //ʹ������
    procedure OnCreateFrame; override;
    procedure OnDestroyFrame; override;
    function FilterColumnField: string; override;
    function InitFormDataSQL(const nWhere: string): string; override;
    procedure AfterInitFormData; override;
    {*��ѯSQL*}
  public
    { Public declarations }
    class function FrameID: integer; override;
  end;

implementation

{$R *.dfm}
uses
  ULibFun, UMgrControl, UDataModule, UFormBase, UFormInputbox, USysPopedom,
  USysConst, USysDB, USysBusiness, UFormDateFilter;

//------------------------------------------------------------------------------
class function TfFrameBill.FrameID: integer;
begin
  Result := cFI_FrameBill;
end;

procedure TfFrameBill.OnCreateFrame;
begin
  inherited;
  FUseDate := True;
  InitDateRange(Name, FStart, FEnd);
end;

procedure TfFrameBill.OnDestroyFrame;
begin
  SaveDateRange(Name, FStart, FEnd);
  inherited;
end;

//Desc: ���ݲ�ѯSQL
function TfFrameBill.InitFormDataSQL(const nWhere: string): string;
var nStr: string;
begin
  EditDate.Text := Format('%s �� %s', [Date2Str(FStart), Date2Str(FEnd)]);

  Result := 'Select * From $Bill ';
  //�����

  if (nWhere = '') or FUseDate then
  begin
    Result := Result + 'Where (L_Date>=''$ST'' and L_Date <''$End'')';
    nStr := ' And ';
  end else nStr := ' Where ';

  if nWhere <> '' then
    Result := Result + nStr + '(' + nWhere + ')';
  //xxxxx

  Result := MacroValue(Result, [MI('$Bill', sTable_Bill),
            MI('$ST', Date2Str(FStart)), MI('$End', Date2Str(FEnd + 1))]);
  //xxxxx
end;

procedure TfFrameBill.AfterInitFormData;
begin
  FUseDate := True;
end;

function TfFrameBill.FilterColumnField: string;
begin
  if gPopedomManager.HasPopedom(PopedomItem, sPopedom_ViewPrice) then
       Result := ''
  else Result := 'L_Price';
end;

//Desc: ִ�в�ѯ
procedure TfFrameBill.EditIDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if Sender = EditLID then
  begin
    EditLID.Text := Trim(EditLID.Text);
    if EditLID.Text = '' then Exit;

    FUseDate := Length(EditLID.Text) <= 3;
    FWhere := 'L_ID like ''%' + EditLID.Text + '%''';
    InitFormData(FWhere);
  end else

  if Sender = EditCus then
  begin
    EditCus.Text := Trim(EditCus.Text);
    if EditCus.Text = '' then Exit;

    FWhere := 'L_CusPY like ''%%%s%%'' Or L_CusName like ''%%%s%%''';
    FWhere := Format(FWhere, [EditCus.Text, EditCus.Text]);
    InitFormData(FWhere);
  end else

  if Sender = EditCard then
  begin
    EditCard.Text := Trim(EditCard.Text);
    if EditCard.Text = '' then Exit;

    FUseDate := Length(EditCard.Text) <= 3;
    FWhere := Format('L_Card=''%s''', [EditCard.Text]);
    InitFormData(FWhere);
  end;
end;

//Desc: δ��ʼ����������
procedure TfFrameBill.N4Click(Sender: TObject);
begin
  FUseDate := False;
  FWhere := Format('(L_Status=''%s'')', [sFlag_BillNew]);
  InitFormData(FWhere);
end;

//Desc: ����ɸѡ
procedure TfFrameBill.EditDatePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if ShowDateFilterForm(FStart, FEnd) then InitFormData('');
end;

//------------------------------------------------------------------------------
//Desc: �������
procedure TfFrameBill.BtnAddClick(Sender: TObject);
var nP: TFormCommandParam;
begin
  CreateBaseFormItem(cFI_FormBill, PopedomItem, @nP);
  if (nP.FCommand = cCmd_ModalResult) and (nP.FParamA = mrOK) then
  begin
    InitFormData('');
  end;
end;

//Desc: ɾ��
procedure TfFrameBill.BtnDelClick(Sender: TObject);
var nStr: string;
begin
  if cxView1.DataController.GetSelectedCount < 1 then
  begin
    ShowMsg('��ѡ��Ҫɾ���ļ�¼', sHint); Exit;
  end;

  nStr := 'ȷ��Ҫɾ�����Ϊ[ %s ]�ĵ�����?';
  nStr := Format(nStr, [SQLQuery.FieldByName('L_ID').AsString]);
  if not QueryDlg(nStr, sAsk) then Exit;

  if DeleteBill(SQLQuery.FieldByName('L_ID').AsString) then
  begin
    InitFormData(FWhere);
    ShowMsg('�������ɾ��', sHint);
  end;
end;

//Desc: ��ӡ�����
procedure TfFrameBill.N1Click(Sender: TObject);
var nStr: string;
begin
  if cxView1.DataController.GetSelectedCount > 0 then
  begin
    nStr := SQLQuery.FieldByName('L_ID').AsString;
    PrintBillReport(nStr, False);
  end;
end;

//Desc: �޸�δ�������ƺ�
procedure TfFrameBill.N5Click(Sender: TObject);
var nStr,nTruck: string;
begin
  if cxView1.DataController.GetSelectedCount > 0 then
  begin
    nStr := SQLQuery.FieldByName('L_Truck').AsString;
    nTruck := nStr;
    if not ShowInputBox('�������µĳ��ƺ���:', '�޸�', nTruck, 15) then Exit;

    if (nTruck = '') or (nStr = nTruck) then Exit;
    //��Ч��һ��

    nStr := SQLQuery.FieldByName('L_ID').AsString;
    if ChangeLadingTruckNo(nStr, nTruck) then
    begin
      InitFormData(FWhere);
      ShowMsg('���ƺ��޸ĳɹ�', sHint);
    end;
  end;
end;

//Desc: �޸ķ�ǩ��
procedure TfFrameBill.N7Click(Sender: TObject);
var nStr,nID,nSeal: string;
begin
  if cxView1.DataController.GetSelectedCount > 0 then
  begin
    nStr := SQLQuery.FieldByName('L_Seal').AsString;
    nSeal := nStr;
    if not ShowInputBox('�������µķ�ǩ���:', '�޸�', nSeal, 100) then Exit;

    if (nSeal = '') or (nStr = nSeal) then Exit;
    //��Ч��һ��
    nID := SQLQuery.FieldByName('L_ID').AsString;

    nStr := 'ȷ��Ҫ��������[ %s ]�ķ�ǩ�Ÿ�Ϊ[ %s ]��?';
    nStr := Format(nStr, [nID, nSeal]);
    if not QueryDlg(nStr, sAsk) then Exit;

    nStr := 'Update %s Set L_Seal=''%s'' Where L_ID=''%s''';
    nStr := Format(nStr, [sTable_Bill, nSeal, nID]);
    FDM.ExecuteSQL(nStr);

    nStr := '�޸ķ�ǩ��[ %s -> %s ].';
    nStr := Format(nStr, [SQLQuery.FieldByName('L_Seal').AsString, nSeal]);
    FDM.WriteSysLog(sFlag_BillItem, nID, nStr, False);

    InitFormData(FWhere);
    ShowMsg('��ǩ���޸ĳɹ�', sHint);
  end;
end;

//Desc: ���������
procedure TfFrameBill.N3Click(Sender: TObject);
var nStr,nTmp: string;
    nP: TFormCommandParam;
begin
  if cxView1.DataController.GetSelectedCount > 0 then
  begin
    nP.FCommand := cCmd_AddData;
    CreateBaseFormItem(cFI_FormGetZhika, PopedomItem, @nP);
    if (nP.FCommand <> cCmd_ModalResult) or (nP.FParamA <> mrOK) then Exit;

    nStr := SQLQuery.FieldByName('L_ZhiKa').AsString;
    if nStr = nP.FParamB then
    begin
      ShowMsg('��ֽͬ�����ܵ���', sHint);
      Exit;
    end;

    nStr := 'Select C_ID,C_Name From %s,%s ' +
            'Where Z_ID=''%s'' And Z_Customer=C_ID';
    nStr := Format(nStr, [sTable_ZhiKa, sTable_Customer, nP.FParamB]);

    with FDM.QueryTemp(nStr) do
    begin
      if RecordCount < 1 then
      begin
        ShowMsg('ֽ����Ϣ��Ч', sHint);
        Exit;
      end;

      nStr := 'ϵͳ��ִ�������������,��ϸ����: ' + #13#10#13#10 +
              '��.�ӿͻ�: %s.%s' + #13#10 +
              '��.���ͻ�: %s.%s' + #13#10 +
              '��.Ʒ  ��: %s.%s' + #13#10 +
              '��.������: %.2f��' + #13#10#13#10 +
              'ȷ��Ҫִ������"��".';
      nStr := Format(nStr, [SQLQuery.FieldByName('L_CusID').AsString,
              SQLQuery.FieldByName('L_CusName').AsString,
              FieldByName('C_ID').AsString,
              FieldByName('C_Name').AsString,
              SQLQuery.FieldByName('L_StockNo').AsString,
              SQLQuery.FieldByName('L_StockName').AsString,
              SQLQuery.FieldByName('L_Value').AsFloat]);
      if not QueryDlg(nStr, sAsk) then Exit;
    end;

    nStr := SQLQuery.FieldByName('L_ID').AsString;
    if BillSaleAdjust(nStr, nP.FParamB) then
    begin
      nTmp := '���۵�����ֽ��[ %s ].';
      nTmp := Format(nTmp, [nP.FParamB]);

      FDM.WriteSysLog(sFlag_BillItem, nStr, nTmp, False);
      InitFormData(FWhere);
      ShowMsg('�����ɹ�', sHint);
    end;
  end;
end;

initialization
  gControlManager.RegCtrl(TfFrameBill, TfFrameBill.FrameID);
end.