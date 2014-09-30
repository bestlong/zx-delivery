{*******************************************************************************
  ����: dmzn@ylsoft.com 2007-10-09
  ����: ��Ŀͨ�ó�,�������嵥Ԫ
*******************************************************************************}
unit USysConst;

interface

uses
  SysUtils, Classes, ComCtrls;

const
  cSBar_Date            = 0;                         //�����������
  cSBar_Time            = 1;                         //ʱ���������
  cSBar_User            = 2;                         //�û��������
  cRecMenuMax           = 5;                         //���ʹ�õ����������Ŀ��
  
  cShouJuIDLength       = 7;                         //�����վݱ�ʶ����
  cItemIconIndex        = 11;                        //Ĭ�ϵ�������б�ͼ��

const
  {*Frame ID*}
  cFI_FrameSysLog       = $0001;                     //ϵͳ��־
  cFI_FrameViewLog      = $0002;                     //������־
  cFI_FrameAuthorize    = $0003;                     //ϵͳ��Ȩ

  cFI_FrameCustomer     = $0004;                     //�ͻ�����
  cFI_FrameSalesMan     = $0005;                     //ҵ��Ա
  cFI_FrameSaleContract = $0006;                     //���ۺ�ͬ
  cFI_FrameZhiKa        = $0007;                     //����ֽ��
  cFI_FrameMakeCard     = $0012;                     //�����ſ�
  cFI_FrameBill         = $0013;                     //�������
  cFI_FrameBillQuery    = $0014;                     //������ѯ

  cFI_FrameShouJu       = $0020;                     //�վݲ�ѯ
  cFI_FrameZhiKaVerify  = $0021;                     //ֽ�����
  cFI_FramePayment      = $0022;                     //���ۻؿ�
  cFI_FrameCusCredit    = $0023;                     //���ù���
  cFI_FrameJSWeek       = $0024;                     //��������
  cFI_FrameSaleZZ       = $0025;                     //��������

  cFI_FrameLadingDai    = $0030;                     //��װ���
  cFI_FramePoundQuery   = $0031;                     //������ѯ
  cFI_FrameFangHuiQuery = $0032;                     //�ŻҲ�ѯ
  cFI_FrameZhanTaiQuery = $0033;                     //ջ̨��ѯ
  cFI_FrameZTDispatch   = $0034;                     //ջ̨����
  cFI_FramePoundManual  = $0035;                     //�ֶ�����

  cFI_FrameTruckQuery   = $0050;                     //������ѯ
  cFI_FrameCusAccountQuery = $0051;                  //�ͻ��˻�
  cFI_FrameCusInOutMoney   = $0052;                  //�������ϸ
  cFI_FrameSaleTotalQuery  = $0053;                  //�ۼƷ���
  cFI_FrameSaleDetailQuery = $0054;                  //������ϸ
  cFI_FrameZhiKaDetail  = $0055;                     //ֽ����ϸ
  cFI_FrameDispatchQuery = $0056;                    //���Ȳ�ѯ

  cFI_FrameProvider     = $0102;                     //��Ӧ
  cFI_FrameProvideLog   = $0105;                     //��Ӧ��־
  cFI_FrameMaterails    = $0106;                     //ԭ����

  cFI_FormMemo          = $1000;                     //��ע����
  cFI_FormBackup        = $1001;                     //���ݱ���
  cFI_FormRestore       = $1002;                     //���ݻָ�
  cFI_FormIncInfo       = $1003;                     //��˾��Ϣ
  cFI_FormChangePwd     = $1005;                     //�޸�����

  cFI_FormBaseInfo      = $1006;                     //������Ϣ
  cFI_FormCustomer      = $1007;                     //�ͻ�����
  cFI_FormSaleMan       = $1008;                     //ҵ��Ա
  cFI_FormSaleContract  = $1009;                     //���ۺ�ͬ
  cFI_FormZhiKa         = $1010;                     //ֽ������
  cFI_FormZhiKaParam    = $1011;                     //ֽ������
  cFI_FormGetZhika      = $1012;                     //ѡ��ֽ��
  cFI_FormMakeCard      = $1011;                     //�����ſ�

  cFI_FormBill          = $1016;                     //�������
  cFI_FormShouJu        = $1017;                     //���վ�
  cFI_FormZhiKaVerify   = $1018;                     //ֽ�����
  cFI_FormCusCredit     = $1019;                     //���ñ䶯
  cFI_FormPayment       = $1020;                     //���ۻؿ�
  cFI_FormTruckIn       = $1021;                     //��������
  cFI_FormTruckOut      = $1022;                     //��������
  cFI_FormVerifyCard    = $1023;                     //�ſ���֤
  cFI_FormAutoBFP       = $1024;                     //�Զ���Ƥ
  cFI_FormBangFangP     = $1025;                     //����Ƥ��
  cFI_FormBangFangM     = $1026;                     //����ë��
  cFI_FormLadDai        = $1027;                     //��װ���
  cFI_FormLadSan        = $1028;                     //ɢװ���
  cFI_FormJiShuQi       = $1029;                     //��������
  cFI_FormBFWuCha       = $1030;                     //�������
  cFI_FormZhiKaQuery    = $1031;                     //��Ƭ��Ϣ
  cFI_FormPayCustom     = $1032;                     //�����˹�
  cFI_FormZhiKaInfoExt1 = $1033;                     //ֽ����չ
  cFI_FormZhiKaInfoExt2 = $1034;                     //ֽ����չ
  cFI_FormZhiKaAdjust   = $1035;                     //ֽ������
  cFI_FormZhiKaFixMoney = $1036;                     //������
  cFI_FormSaleAdjust    = $1037;                     //���۵���
  cFI_FormEditPrice     = $1040;                     //�������

  cFI_FormGetTruck      = $1047;                     //ѡ����
  cFI_FormGetContract   = $1048;                     //ѡ���ͬ
  cFI_FormGetCustom     = $1049;                     //ѡ��ͻ�
  cFI_FormGetStockNo    = $1050;                     //ѡ����
  cFI_FormProvider      = $1051;                     //��Ӧ��
  cFI_FormMaterails     = $1052;                     //ԭ����
  cFI_FormProvideBF     = $1053;                     //����
  cFI_FormProvideBFP    = $1054;                     //������Ƥ
  cFI_FormProvideYS     = $1055;                     //����
  cFI_FormProvideCard   = $1056;                     //��Ӧ�ſ�
  cFI_FormProvidePreP   = $1057;                     //Ԥ��Ƥ��
  cFI_FormProvideHS     = $1058;                     //�����˷�
  cFI_FormProvideHS_P   = $1059;                     //��������
  cFI_FormProvideJS_P   = $1060;                     //��������
  cFI_FormProvideInOut  = $1061;                     //��Ӧ����

  cFI_FormStockParam    = $1065;                     //Ʒ�ֹ���
  cFI_FormStockHuaYan   = $1066;                     //�����鵥
  cFI_FormStockHY_Each  = $1067;                     //�泵����

  cFI_FormPaymentZK     = $1068;                     //ֽ���ؿ�
  cFI_FormFreezeZK      = $1069;                     //����ֽ��
  cFI_FormAdjustPrice   = $1070;                     //ֽ������

  cFI_FormInvoiceWeek   = $1075;                     //��������
  cFI_FormSaleInvoice   = $1076;                     //��Ʊ����
  cFI_FormMakeInvoice   = $1077;                     //���߷�Ʊ
  cFI_FormViewInvoices  = $1078;                     //��Ʊ�б�
  cFI_FormSaleZZALL     = $1079;                     //����(ȫ��)
  cFI_FormSaleZZCus     = $1080;                     //����(�ͻ�)
  cFI_FormInvGetWeek    = $1081;                     //ѡ������
  cFI_FormInvAdjust     = $1082;                     //�޸�������

  cFI_FormAuthorize     = $1090;                     //��ȫ��֤

  {*Command*}
  cCmd_RefreshData      = $0002;                     //ˢ������
  cCmd_ViewSysLog       = $0003;                     //ϵͳ��־

  cCmd_ModalResult      = $1001;                     //Modal����
  cCmd_FormClose        = $1002;                     //�رմ���
  cCmd_AddData          = $1003;                     //��������
  cCmd_EditData         = $1005;                     //�޸�����
  cCmd_ViewData         = $1006;                     //�鿴����

type
  TSysParam = record
    FProgID     : string;                            //�����ʶ
    FAppTitle   : string;                            //�����������ʾ
    FMainTitle  : string;                            //���������
    FHintText   : string;                            //��ʾ�ı�
    FCopyRight  : string;                            //��������ʾ����

    FUserID     : string;                            //�û���ʶ
    FUserName   : string;                            //��ǰ�û�
    FUserPwd    : string;                            //�û�����
    FGroupID    : string;                            //������
    FIsAdmin    : Boolean;                           //�Ƿ����Ա
    FIsNormal   : Boolean;                           //�ʻ��Ƿ�����

    FRecMenuMax : integer;                           //����������
    FIconFile   : string;                            //ͼ�������ļ�
    FUsesBackDB : Boolean;                           //ʹ�ñ��ݿ�

    FLocalIP    : string;                            //����IP
    FLocalMAC   : string;                            //����MAC
    FLocalName  : string;                            //��������
    FFactNum    : string;                            //�������
    FSerialID   : string;                            //���Ա��
    FIsManual   : Boolean;                           //�ֶ�����
    FHardMonURL : string;                            //Ӳ���ػ�

    FPoundDaiZ  : Double;                            //��װ�����
    FPoundDaiF  : Double;                            //��װ�����
    FPoundSanF  : Double;                            //ɢװ�����
  end;
  //ϵͳ����

  TModuleItemType = (mtFrame, mtForm);
  //ģ������

  PMenuModuleItem = ^TMenuModuleItem;
  TMenuModuleItem = record
    FMenuID: string;                                 //�˵�����
    FModule: integer;                                //ģ���ʶ
    FItemType: TModuleItemType;                      //ģ������
  end;

//------------------------------------------------------------------------------
var
  gPath: string;                                     //��������·��
  gSysParam:TSysParam;                               //���򻷾�����
  gStatusBar: TStatusBar;                            //ȫ��ʹ��״̬��
  gMenuModule: TList = nil;                          //�˵�ģ��ӳ���

//------------------------------------------------------------------------------
ResourceString
  sProgID             = 'DMZN';                      //Ĭ�ϱ�ʶ
  sAppTitle           = 'DMZN';                      //�������
  sMainCaption        = 'DMZN';                      //�����ڱ���

  sHint               = '��ʾ';                      //�Ի������
  sWarn               = '����';                      //==
  sAsk                = 'ѯ��';                      //ѯ�ʶԻ���
  sError              = 'δ֪����';                  //����Ի���

  sDate               = '����:��%s��';               //����������
  sTime               = 'ʱ��:��%s��';               //������ʱ��
  sUser               = '�û�:��%s��';               //�������û�

  sLogDir             = 'Logs\';                     //��־Ŀ¼
  sLogExt             = '.log';                      //��־��չ��
  sLogField           = #9;                          //��¼�ָ���

  sImageDir           = 'Images\';                   //ͼƬĿ¼
  sReportDir          = 'Report\';                   //����Ŀ¼
  sBackupDir          = 'Backup\';                   //����Ŀ¼
  sBackupFile         = 'Bacup.idx';                 //��������

  sConfigFile         = 'Config.Ini';                //�������ļ�
  sConfigSec          = 'Config';                    //������С��
  sVerifyCode         = ';Verify:';                  //У������

  sFormConfig         = 'FormInfo.ini';              //��������
  sSetupSec           = 'Setup';                     //����С��
  sDBConfig           = 'DBConn.ini';                //��������
  sDBConfig_bk        = 'isbk';                      //���ݿ�

  sExportExt          = '.txt';                      //����Ĭ����չ��
  sExportFilter       = '�ı�(*.txt)|*.txt|�����ļ�(*.*)|*.*';
                                                     //������������ 

  sInvalidConfig      = '�����ļ���Ч���Ѿ���';    //�����ļ���Ч
  sCloseQuery         = 'ȷ��Ҫ�˳�������?';         //�������˳�

implementation

//------------------------------------------------------------------------------
//Desc: ���Ӳ˵�ģ��ӳ����
procedure AddMenuModuleItem(const nMenu: string; const nModule: Integer;
 const nType: TModuleItemType = mtFrame);
var nItem: PMenuModuleItem;
begin
  New(nItem);
  gMenuModule.Add(nItem);

  nItem.FMenuID := nMenu;
  nItem.FModule := nModule;
  nItem.FItemType := nType;
end;

//Desc: �˵�ģ��ӳ���
procedure InitMenuModuleList;
begin
  gMenuModule := TList.Create;

  AddMenuModuleItem('MAIN_A01', cFI_FormIncInfo, mtForm);
  AddMenuModuleItem('MAIN_A02', cFI_FrameSysLog);
  AddMenuModuleItem('MAIN_A03', cFI_FormBackup, mtForm);
  AddMenuModuleItem('MAIN_A04', cFI_FormRestore, mtForm);
  AddMenuModuleItem('MAIN_A05', cFI_FormChangePwd, mtForm);
  AddMenuModuleItem('MAIN_A07', cFI_FrameAuthorize);

  AddMenuModuleItem('MAIN_B01', cFI_FormBaseInfo, mtForm);
  AddMenuModuleItem('MAIN_B02', cFI_FrameCustomer);
  AddMenuModuleItem('MAIN_B03', cFI_FrameSalesMan);
  AddMenuModuleItem('MAIN_B04', cFI_FrameSaleContract);

  AddMenuModuleItem('MAIN_C01', cFI_FrameZhiKaVerify);
  AddMenuModuleItem('MAIN_C02', cFI_FramePayment);
  AddMenuModuleItem('MAIN_C03', cFI_FrameCusCredit);
  AddMenuModuleItem('MAIN_C06', cFI_FrameJSWeek);
  AddMenuModuleItem('MAIN_C07', cFI_FrameShouJu);

  AddMenuModuleItem('MAIN_D01', cFI_FormZhiKa, mtForm);
  AddMenuModuleItem('MAIN_D02', cFI_FrameMakeCard);
  AddMenuModuleItem('MAIN_D03', cFI_FormBill, mtForm);
  AddMenuModuleItem('MAIN_D04', cFI_FormPayCustom, mtForm);
  AddMenuModuleItem('MAIN_D05', cFI_FrameZhiKa);
  AddMenuModuleItem('MAIN_D06', cFI_FrameBill);
  AddMenuModuleItem('MAIN_D08', cFI_FormSaleAdjust, mtForm);

  AddMenuModuleItem('MAIN_E01', cFI_FramePoundManual);
  AddMenuModuleItem('MAIN_E03', cFI_FramePoundQuery);

  AddMenuModuleItem('MAIN_F01', cFI_FormLadDai, mtForm);
  AddMenuModuleItem('MAIN_F02', cFI_FormJiShuQi, mtForm);
  AddMenuModuleItem('MAIN_F03', cFI_FrameZhanTaiQuery);

  AddMenuModuleItem('MAIN_G01', cFI_FormLadSan, mtForm);
  AddMenuModuleItem('MAIN_G02', cFI_FrameFangHuiQuery);

  AddMenuModuleItem('MAIN_L01', cFI_FrameTruckQuery);
  AddMenuModuleItem('MAIN_L02', cFI_FrameCusAccountQuery);
  AddMenuModuleItem('MAIN_L03', cFI_FrameCusInOutMoney);
  AddMenuModuleItem('MAIN_L05', cFI_FrameDispatchQuery);
  AddMenuModuleItem('MAIN_L06', cFI_FrameSaleDetailQuery);
  AddMenuModuleItem('MAIN_L07', cFI_FrameSaleTotalQuery);
  AddMenuModuleItem('MAIN_L08', cFI_FrameZhiKaDetail);

  AddMenuModuleItem('MAIN_H01', cFI_FormTruckIn, mtForm);
  AddMenuModuleItem('MAIN_H02', cFI_FormTruckOut, mtForm);
  AddMenuModuleItem('MAIN_H03', cFI_FrameTruckQuery);

  AddMenuModuleItem('MAIN_M01', cFI_FrameProvider);
  AddMenuModuleItem('MAIN_M02', cFI_FrameMaterails);
  AddMenuModuleItem('MAIN_M04', cFI_FrameProvideLog);
  AddMenuModuleItem('MAIN_M05', cFI_FormProvideBF, mtForm);
  AddMenuModuleItem('MAIN_M06', cFI_FormProvideYS, mtForm);
  AddMenuModuleItem('MAIN_M08', cFI_FormProvidePreP, mtForm);
end;

//Desc: ����ģ���б�
procedure ClearMenuModuleList;
var nIdx: integer;
begin
  for nIdx:=gMenuModule.Count - 1 downto 0 do
  begin
    Dispose(PMenuModuleItem(gMenuModule[nIdx]));
    gMenuModule.Delete(nIdx);
  end;

  FreeAndNil(gMenuModule);
end;

initialization
  InitMenuModuleList;
finalization
  ClearMenuModuleList;
end.

