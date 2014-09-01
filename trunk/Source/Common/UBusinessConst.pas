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
  cBC_ReadBillInfo            = $0001;
  cBC_ReadOrderInfo           = $0002;
  cBC_ReadTruckInfo           = $0003;

  cBC_LoadMaterails           = $0021;
  cBC_SavePoundData           = $0022;
  cBC_GetPostBills            = $0023;
  cBC_SavePostBills           = $0025;
  cBC_SaveBillCard            = $0026;
  cBC_LogoutBillCard          = $0028;
  cBC_DeletePoundLog          = $0029;
  cBC_ModifyPoundLog          = $0027;                   //���ӳ����޸� 20131112

  cBC_GetPoundCard            = $0050;
  cBC_GetQueueData            = $0051;
  cBC_SaveCountData           = $0052;
  cBC_RemoteExecSQL           = $0055;
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
  {*common function*}  
  sSys_BasePacker             = 'Sys_BasePacker';       //���������

  {*business mit function name*}
  sBus_ServiceStatus          = 'Bus_ServiceStatus';    //����״̬
  sBus_CreateSaleBill         = 'Bus_Create_SaleBill';  //����������
  sBus_ModifySaleBill         = 'Bus_Modify_SaleBill';  //�޸Ľ�����
  sBus_DeleteSaleBill         = 'Bus_Delete_SaleBill';  //ɾ��������

  sBus_GetQueryField          = 'Bus_GetQueryField';    //��ѯ���ֶ�
  sBus_BusinessCommand        = 'Bus_BusinessCommand';  //ҵ��ָ��
  sHM_BusinessCommand         = 'HH_BusinessCommand';   //Ӳ���ػ�

  {*client function name*}
  sCLI_ServiceStatus          = 'CLI_ServiceStatus';    //����״̬
  sCLI_CreateSaleBill         = 'CLI_Create_SaleBill';  //����������
  sCLI_ModifySaleBill         = 'CLI_Modify_SaleBill';  //�޸Ľ�����
  sCLI_DeleteSaleBill         = 'CLI_Delete_SaleBill';  //ɾ��������
  sCLI_ReadSaleBill           = 'CLI_Read_SaleBill';    //��ȡ������

  sCLI_GetQueryField          = 'CLI_GetQueryField';    //��ѯ���ֶ�
  sCLI_BusinessCommand        = 'CLI_BusinessCommand';  //ҵ��ָ��
  sCLI_HardwareMonitor        = 'CLI_Hardware_Monitor'; //Ӳ���ػ�
  sCLI_TruckQueue             = 'CLI_TruckQueue';       //�����Ŷ�

implementation

end.


