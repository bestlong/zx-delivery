inherited fFormAuthorize: TfFormAuthorize
  Left = 438
  Top = 418
  Caption = #25509#20837#30003#35831
  ClientHeight = 244
  ClientWidth = 438
  Position = poDesktopCenter
  PixelsPerInch = 120
  TextHeight = 15
  inherited dxLayout1: TdxLayoutControl
    Width = 438
    Height = 244
    inherited BtnOK: TButton
      Left = 256
      Top = 202
      TabOrder = 5
    end
    inherited BtnExit: TButton
      Left = 343
      Top = 202
      TabOrder = 6
    end
    object EditName: TcxTextEdit [2]
      Left = 87
      Top = 73
      Properties.MaxLength = 100
      Properties.ReadOnly = False
      TabOrder = 1
      Width = 121
    end
    object EditMAC: TcxTextEdit [3]
      Left = 87
      Top = 45
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 121
    end
    object EditFact: TcxTextEdit [4]
      Left = 87
      Top = 101
      Properties.MaxLength = 32
      TabOrder = 2
      Width = 121
    end
    object EditSerial: TcxTextEdit [5]
      Left = 87
      Top = 129
      Properties.MaxLength = 32
      TabOrder = 3
      Width = 121
    end
    object EditDepart: TcxTextEdit [6]
      Left = 87
      Top = 157
      Properties.MaxLength = 32
      TabOrder = 4
      Width = 121
    end
    inherited dxLayout1Group_Root: TdxLayoutGroup
      inherited dxGroup1: TdxLayoutGroup
        object dxLayout1Item4: TdxLayoutItem
          Caption = #30005#33041#26631#35782':'
          Control = EditMAC
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item3: TdxLayoutItem
          Caption = #30005#33041#21517#31216':'
          Control = EditName
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item5: TdxLayoutItem
          Caption = #24037#21378#32534#21495':'
          Control = EditFact
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item6: TdxLayoutItem
          Caption = #30005#33041#32534#21495':'
          Control = EditSerial
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item7: TdxLayoutItem
          Caption = #25152#23646#37096#38376':'
          Control = EditDepart
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
end
