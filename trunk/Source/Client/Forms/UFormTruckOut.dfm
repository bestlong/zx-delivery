inherited fFormTruckOut: TfFormTruckOut
  Left = 294
  Top = 214
  Width = 486
  Height = 566
  BorderStyle = bsSizeable
  Caption = #36710#36742#20986#21378
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 15
  inherited dxLayout1: TdxLayoutControl
    Width = 478
    Height = 534
    inherited BtnOK: TButton
      Left = 296
      Top = 492
      Caption = #25918#34892
      TabOrder = 4
    end
    inherited BtnExit: TButton
      Left = 383
      Top = 492
      TabOrder = 5
    end
    object ListInfo: TcxMCListBox [2]
      Left = 29
      Top = 45
      Width = 392
      Height = 215
      HeaderSections = <
        item
          Text = #20449#24687#39033
          Width = 74
        end
        item
          AutoSize = True
          Text = #20449#24687#20869#23481
          Width = 314
        end>
      ParentFont = False
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 0
      OnClick = ListInfoClick
    end
    object ListBill: TcxListView [3]
      Left = 29
      Top = 361
      Width = 437
      Height = 144
      Columns = <
        item
          Caption = #20132#36135#21333#21495
          Width = 100
        end
        item
          Alignment = taCenter
          Caption = #20132#36135#37327'('#21544')'
          Width = 125
        end
        item
          Caption = #27700#27877#31867#22411
          Width = 100
        end>
      HideSelection = False
      ParentFont = False
      ReadOnly = True
      RowSelect = True
      SmallImages = FDM.ImageBar
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 3
      ViewStyle = vsReport
      OnSelectItem = ListBillSelectItem
    end
    object EditCus: TcxTextEdit [4]
      Left = 87
      Top = 293
      ParentFont = False
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 138
    end
    object EditBill: TcxTextEdit [5]
      Left = 87
      Top = 265
      ParentFont = False
      Properties.ReadOnly = True
      TabOrder = 1
      Width = 132
    end
    inherited dxLayout1Group_Root: TdxLayoutGroup
      inherited dxGroup1: TdxLayoutGroup
        Caption = #20132#36135#21333#20449#24687
        object dxLayout1Item3: TdxLayoutItem
          AutoAligns = [aaHorizontal]
          Caption = 'cxMCListBox1'
          ShowCaption = False
          Control = ListInfo
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Group2: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object LayItem1: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #20132#36135#21333#21495':'
            Control = EditBill
            ControlOptions.ShowBorder = False
          end
          object dxLayout1Item5: TdxLayoutItem
            Caption = #23458#25143#21517#31216':'
            Control = EditCus
            ControlOptions.ShowBorder = False
          end
        end
      end
      object dxGroup2: TdxLayoutGroup [1]
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Caption = #20132#36135#21333#21015#34920
        object dxLayout1Item7: TdxLayoutItem
          AutoAligns = [aaHorizontal]
          AlignVert = avClient
          Caption = 'cxListView1'
          ShowCaption = False
          Control = ListBill
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
end
