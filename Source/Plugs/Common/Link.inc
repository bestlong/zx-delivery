{$DEFINE debug}
//����ģʽ

{.$DEFINE GenRODL}
//����RODL��Դ

{$DEFINE COM_MIT}
//����ϵͳģʽ

//ͨ���м��
{$IFDEF COM_MIT}
  {$DEFINE DBPool}
  //�������ݿ�֧��
  {.$DEFINE ChannelPool}
  //����ͨ��֧��
  {.$DEFINE AutoChannel}
  //����ͨ��ƽ��
  {.$DEFINE SAP}
  //����SAP֧��
  {.$DEFINE ClientMon}
  //֧���ػ�����
{$ENDIF}

{$DEFINE cxLibrary42}
//Ver4.2���뻷��