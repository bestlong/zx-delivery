{*******************************************************************************
  ����: dmzn@163.com 2012-02-03
  ����: ҵ��������

  ��ע:
  *.����In/Out����,��ô���TBWDataBase������,��λ�ڵ�һ��Ԫ��.
*******************************************************************************}
unit UBusinessConst;

interface

uses UBusinessPacker, Classes;

const
  {*channel type*}
  cBus_Channel_Connection     = $0002;
  cBus_Channel_Business       = $0005;

  {*query field define*}
  cQF_Bill                    = $0001;

  {*business command*}
  cBC_GetSerialNO             = $0001;   //��ȡ���б��
  cBC_ServerNow               = $0002;   //��������ǰʱ��
  cBC_IsSystemExpired         = $0003;   //ϵͳ�Ƿ��ѹ���

  cBC_GetCustomerMoney        = $0010;   //��ȡ�ͻ����ý�
  cBC_GetZhiKaMoney           = $0011;   //��ȡֽ�����ý�
  cBC_CustomerHasMoney        = $0012;   //�ͻ��Ƿ������

  cBC_PrintCode               = $0056;
  cBC_PrinterEnable           = $0057;
  cBC_PrintFixCode            = $0058;

  cBC_JSStart                 = $0060;
  cBC_JSStop                  = $0061;
  cBC_JSPause                 = $0062;
  cBC_JSGetStatus             = $0063;

  cBC_IsTunnelOK              = $0065;
  cBC_TunnelOC                = $0066;

type
  PWorkerQueryFieldData = ^TWorkerQueryFieldData;
  TWorkerQueryFieldData = record
    FBase     : TBWDataBase;
    FType     : Integer;           //����
    FData     : string;            //����
  end;

  PWorkerBusinessCommand = ^TWorkerBusinessCommand;
  TWorkerBusinessCommand = record
    FBase     : TBWDataBase;
    FCommand  : Integer;           //����
    FData     : string;            //����
    FExtParam : string;            //����
  end;

resourcestring
  {*plug module id*}
  sPlug_ModuleBus             = '{DF261765-48DC-411D-B6F2-0B37B14E014E}';
                                                        //ҵ��ģ��
  {*common function*}  
  sSys_BasePacker             = 'Sys_BasePacker';       //���������

  {*business mit function name*}
  sBus_ServiceStatus          = 'Bus_ServiceStatus';    //����״̬
  sBus_GetQueryField          = 'Bus_GetQueryField';    //��ѯ���ֶ�

  sBus_CreateSaleBill         = 'Bus_Create_SaleBill';  //����������
  sBus_ModifySaleBill         = 'Bus_Modify_SaleBill';  //�޸Ľ�����
  sBus_DeleteSaleBill         = 'Bus_Delete_SaleBill';  //ɾ��������
  sBus_BusinessCommand        = 'Bus_BusinessCommand';  //ҵ��ָ��

  {*client function name*}
  sCLI_ServiceStatus          = 'CLI_ServiceStatus';    //����״̬
  sCLI_GetQueryField          = 'CLI_GetQueryField';    //��ѯ���ֶ�

  sCLI_CreateSaleBill         = 'CLI_Create_SaleBill';  //����������
  sCLI_ModifySaleBill         = 'CLI_Modify_SaleBill';  //�޸Ľ�����
  sCLI_DeleteSaleBill         = 'CLI_Delete_SaleBill';  //ɾ��������
  sCLI_BusinessCommand        = 'CLI_BusinessCommand';  //ҵ��ָ��

implementation

end.


