object fFormMain: TfFormMain
  Left = 362
  Top = 46
  BorderStyle = bsNone
  Caption = #29992#25143#33258#21161#26597#35810#31995#32479
  ClientHeight = 659
  ClientWidth = 931
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clRed
  Font.Height = -56
  Font.Name = #23435#20307
  Font.Style = [fsBold]
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 56
  object LabelStock: TcxLabel
    Left = 0
    Top = 285
    Align = alTop
    AutoSize = False
    Caption = #21697#31181#21517#31216':'
    ParentFont = False
    Style.Edges = [bLeft, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -64
    Style.Font.Name = #23435#20307
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 95
    Width = 931
    AnchorY = 333
  end
  object LabelNum: TcxLabel
    Left = 0
    Top = 475
    Align = alTop
    AutoSize = False
    Caption = #24320#25918#36947#25968':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -64
    Style.Font.Name = #23435#20307
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 95
    Width = 931
    AnchorY = 523
  end
  object LabelHint: TcxLabel
    Left = 0
    Top = 570
    Align = alClient
    AutoSize = False
    Caption = #35831#24744#21047#21345
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -64
    Style.Font.Name = #23435#20307
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.WordWrap = True
    Transparent = True
    Height = 89
    Width = 931
    AnchorX = 466
    AnchorY = 615
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 931
    Height = 95
    Align = alTop
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 3
    object LabelTruck: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      AutoSize = False
      Caption = #36710#29260#21495#30721':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -64
      Style.Font.Name = #23435#20307
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 95
      Width = 902
      AnchorY = 48
    end
    object LabelDec: TcxLabel
      Left = 902
      Top = 0
      Align = alRight
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -48
      Style.Font.Name = #23435#20307
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      OnDblClick = LabelTruckDblClick
      AnchorY = 48
    end
  end
  object LabelTon: TcxLabel
    Left = 0
    Top = 380
    Align = alTop
    AutoSize = False
    Caption = #25552#36135#25968#37327':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -64
    Style.Font.Name = #23435#20307
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 95
    Width = 931
    AnchorY = 428
  end
  object LabelBill: TcxLabel
    Left = 0
    Top = 95
    Align = alTop
    AutoSize = False
    Caption = #20132#36135#21333#21495':'
    ParentFont = False
    Style.Edges = [bLeft, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -64
    Style.Font.Name = #23435#20307
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 95
    Width = 931
    AnchorY = 143
  end
  object LabelOrder: TcxLabel
    Left = 0
    Top = 190
    Align = alTop
    AutoSize = False
    Caption = #38144#21806#35746#21333':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -64
    Style.Font.Name = #23435#20307
    Style.Font.Style = [fsBold]
    Style.TextColor = clWhite
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 95
    Width = 931
    AnchorY = 238
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Timeouts.ReadTotalMultiplier = 10
    Timeouts.ReadTotalConstant = 100
    OnRxChar = ComPort1RxChar
    Left = 466
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 494
    Top = 16
  end
end