{*******************************************************************************
  ����: dmzn@163.com 2013-11-30
  ����: ����Ԫ���������ڴ������ѡ��.

  ��ע:
  *.�ڴ������FastMM4������.dpr��Ŀ�ĵ�һ��uses�Ż���Ч.
  *.FastMM4������Ĭ�ϵ�FastMM4Options.inc��,ʹ�ñ���Ԫ����������,����Ӧ����Ҫ��.
  *.ÿ�������"define"���ú�"undef"��������ѡ��.
  *.����"//+"��ʾĬ��������,"//-"��ʾĬ���ѹر�.
*******************************************************************************}

{-----------------------------Debugging Options-------------------------------}
//-
{.$define NoMessageBoxes}
{.$undef NoMessageBoxes}

//-
{.$define FullDebugMode}
{.$undef FullDebugMode}

  //+
  {.$define RawStackTraces}
  {.$undef RawStackTraces}

  //-
  {.$define CatchUseOfFreedInterfaces}
  {.$undef CatchUseOfFreedInterfaces}

  //+
  {.$define LogErrorsToFile}
  {.$undef LogErrorsToFile}

  //+
  {.$define LogMemoryLeakDetailToFile}
  {.$undef LogMemoryLeakDetailToFile}

  //-
  {.$define ClearLogFileOnStartup}
  {.$undef ClearLogFileOnStartup}

  //-
  {.$define LoadDebugDLLDynamically}
  {.$undef LoadDebugDLLDynamically}

    //-
    {.$define DoNotInstallIfDLLMissing}
    {.$undef DoNotInstallIfDLLMissing}

  //+
  {.$define AlwaysAllocateTopDown}
  {.$undef AlwaysAllocateTopDown}

  //-
  {.$define DisableLoggingOfMemoryDumps}
  {.$undef DisableLoggingOfMemoryDumps}

  //+
  {.$define SuppressFreeMemErrorsInsideException}
  {.$undef SuppressFreeMemErrorsInsideException}

  //-
  {.$define FullDebugModeCallBacks}
  {.$undef FullDebugModeCallBacks}

{---------------------------Memory Leak Reporting-----------------------------}
//+
{.$define EnableMemoryLeakReporting}
{.$undef EnableMemoryLeakReporting}

  //+
  {.$define HideExpectedLeaksRegisteredByPointer}
  {.$undef HideExpectedLeaksRegisteredByPointer}

  //-
  {.$define RequireIDEPresenceForLeakReporting}
  {.$undef RequireIDEPresenceForLeakReporting}

  //+
  {.$define RequireDebuggerPresenceForLeakReporting}
  {.$undef RequireDebuggerPresenceForLeakReporting}

  //-
  {.$define RequireDebugInfoForLeakReporting}
  {.$undef RequireDebugInfoForLeakReporting}

  //-
  {.$define ManualLeakReportingControl}
  {.$undef ManualLeakReportingControl}

  //-
  {.$define HideMemoryLeakHintMessage}
  {.$undef HideMemoryLeakHintMessage}

{-----------------------Memory Manager Sharing Options------------------------}
//-
{.$define ShareMM}
{.$undef ShareMM}

  //-
  {.$define ShareMMIfLibrary}
  {.$undef ShareMMIfLibrary}

//-
{.$define AttemptToUseSharedMM}
{.$undef AttemptToUseSharedMM}

//+
{.$define EnableBackwardCompatibleMMSharing}
{.$undef EnableBackwardCompatibleMMSharing}