{*******************************************************************************
  作者: dmzn@163.com 2012-02-03
  描述: 业务常量定义

  备注:
  *.所有In/Out数据,最好带有TBWDataBase基数据,且位于第一个元素.
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
  cBC_ModifyPoundLog          = $0027;                   //增加称重修改 20131112

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
    FType     : Integer;           //类型
    FData     : string;            //数据
  end;

  PWorkerBusinessCommand = ^TWorkerBusinessCommand;
  TWorkerBusinessCommand = record
    FBase     : TBWDataBase;
    FCommand  : Integer;           //命令
    FData     : string;            //数据
    FExtParam : string;            //参数
  end;

resourcestring
  {*common function*}  
  sSys_BasePacker             = 'Sys_BasePacker';       //基本封包器

  {*business mit function name*}
  sBus_ServiceStatus          = 'Bus_ServiceStatus';    //服务状态
  sBus_CreateSaleBill         = 'Bus_Create_SaleBill';  //创建交货单
  sBus_ModifySaleBill         = 'Bus_Modify_SaleBill';  //修改交货单
  sBus_DeleteSaleBill         = 'Bus_Delete_SaleBill';  //删除交货单

  sBus_GetQueryField          = 'Bus_GetQueryField';    //查询的字段
  sBus_BusinessCommand        = 'Bus_BusinessCommand';  //业务指令
  sHM_BusinessCommand         = 'HH_BusinessCommand';   //硬件守护

  {*client function name*}
  sCLI_ServiceStatus          = 'CLI_ServiceStatus';    //服务状态
  sCLI_CreateSaleBill         = 'CLI_Create_SaleBill';  //创建交货单
  sCLI_ModifySaleBill         = 'CLI_Modify_SaleBill';  //修改交货单
  sCLI_DeleteSaleBill         = 'CLI_Delete_SaleBill';  //删除交货单
  sCLI_ReadSaleBill           = 'CLI_Read_SaleBill';    //读取交货单

  sCLI_GetQueryField          = 'CLI_GetQueryField';    //查询的字段
  sCLI_BusinessCommand        = 'CLI_BusinessCommand';  //业务指令
  sCLI_HardwareMonitor        = 'CLI_Hardware_Monitor'; //硬件守护
  sCLI_TruckQueue             = 'CLI_TruckQueue';       //车辆排队

implementation

end.


