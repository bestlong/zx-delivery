inherited fFormJSWeek: TfFormJSWeek
  Left = 574
  Top = 431
  ClientHeight = 253
  ClientWidth = 449
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 15
  inherited dxLayout1: TdxLayoutControl
    Width = 449
    Height = 253
    inherited BtnOK: TButton
      Left = 267
      Top = 211
      TabOrder = 4
    end
    inherited BtnExit: TButton
      Left = 354
      Top = 211
      TabOrder = 5
    end
    object EditName: TcxTextEdit [2]
      Left = 87
      Top = 45
      Hint = 'T.W_Name'
      ParentFont = False
      Properties.MaxLength = 50
      TabOrder = 0
      Width = 218
    end
    object EditMemo: TcxMemo [3]
      Left = 87
      Top = 129
      Hint = 'T.W_Memo'
      ParentFont = False
      Properties.MaxLength = 50
      Properties.ScrollBars = ssVertical
      Style.Edges = [bBottom]
      TabOrder = 3
      Height = 56
      Width = 504
    end
    object EditStart: TcxDateEdit [4]
      Left = 87
      Top = 73
      Hint = 'T.W_Begin'
      ParentFont = False
      TabOrder = 1
      Width = 163
    end
    object EditEnd: TcxDateEdit [5]
      Left = 87
      Top = 101
      Hint = 'T.W_End'
      ParentFont = False
      TabOrder = 2
      Width = 152
    end
    inherited dxLayout1Group_Root: TdxLayoutGroup
      inherited dxGroup1: TdxLayoutGroup
        object dxLayout1Item4: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          Caption = #21608#26399#21517#31216':'
          Control = EditName
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item3: TdxLayoutItem
          Caption = #24320#22987#26085#26399':'
          Control = EditStart
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item5: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          Caption = #32467#26463#26085#26399':'
          Control = EditEnd
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item12: TdxLayoutItem
          AutoAligns = [aaHorizontal]
          AlignVert = avClient
          Caption = #22791#27880#20449#24687':'
          Control = EditMemo
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
end
