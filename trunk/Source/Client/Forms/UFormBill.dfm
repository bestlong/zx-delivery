inherited fFormBill: TfFormBill
  Left = 629
  Top = 274
  ClientHeight = 520
  ClientWidth = 496
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 15
  inherited dxLayout1: TdxLayoutControl
    Width = 496
    Height = 520
    AutoControlTabOrders = False
    inherited BtnOK: TButton
      Left = 314
      Top = 478
      Caption = #24320#21333
      TabOrder = 5
    end
    inherited BtnExit: TButton
      Left = 401
      Top = 478
      TabOrder = 9
    end
    object ListInfo: TcxMCListBox [2]
      Left = 29
      Top = 45
      Width = 439
      Height = 145
      HeaderSections = <
        item
          Text = #20449#24687#39033
          Width = 74
        end
        item
          AutoSize = True
          Text = #20449#24687#20869#23481
          Width = 361
        end>
      ParentFont = False
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 8
    end
    object ListBill: TcxListView [3]
      Left = 29
      Top = 347
      Width = 465
      Height = 143
      Columns = <
        item
          Caption = #27700#27877#31867#22411
          Width = 100
        end
        item
          Caption = #25552#36135#36710#36742
          Width = 88
        end
        item
          Caption = #21150#29702#37327'('#21544')'
          Width = 125
        end>
      ParentFont = False
      ReadOnly = True
      RowSelect = True
      SmallImages = FDM.ImageBar
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 6
      ViewStyle = vsReport
    end
    object EditValue: TcxTextEdit [4]
      Left = 87
      Top = 319
      ParentFont = False
      TabOrder = 3
      OnKeyPress = EditLadingKeyPress
      Width = 151
    end
    object EditTruck: TcxTextEdit [5]
      Left = 308
      Top = 223
      ParentFont = False
      Properties.MaxLength = 15
      TabOrder = 2
      OnKeyPress = EditLadingKeyPress
      Width = 145
    end
    object EditStock: TcxComboBox [6]
      Left = 87
      Top = 291
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.DropDownRows = 15
      Properties.ItemHeight = 18
      Properties.OnChange = EditStockPropertiesChange
      TabOrder = 0
      OnKeyPress = EditLadingKeyPress
      Width = 144
    end
    object BtnAdd: TButton [7]
      Left = 419
      Top = 291
      Width = 48
      Height = 22
      Caption = #28155#21152
      TabOrder = 4
      OnClick = BtnAddClick
    end
    object BtnDel: TButton [8]
      Left = 419
      Top = 319
      Width = 48
      Height = 22
      Caption = #21024#38500
      TabOrder = 7
      OnClick = BtnDelClick
    end
    object EditLading: TcxComboBox [9]
      Left = 87
      Top = 223
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ItemHeight = 18
      Properties.Items.Strings = (
        'T=T'#12289#33258#25552
        'S=S'#12289#36865#36135
        'X=X'#12289#36816#21368)
      TabOrder = 1
      OnKeyPress = EditLadingKeyPress
      Width = 158
    end
    object EditZK: TcxTextEdit [10]
      Left = 87
      Top = 195
      ParentFont = False
      TabOrder = 13
      Width = 152
    end
    inherited dxLayout1Group_Root: TdxLayoutGroup
      inherited dxGroup1: TdxLayoutGroup
        object dxLayout1Item3: TdxLayoutItem
          Control = ListInfo
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item5: TdxLayoutItem
          Caption = #32440#21345#32534#21495':'
          Control = EditZK
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Group2: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object dxLayout1Item12: TdxLayoutItem
            AutoAligns = [aaVertical]
            Caption = #25552#36135#26041#24335':'
            Control = EditLading
            ControlOptions.ShowBorder = False
          end
          object dxLayout1Item9: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #25552#36135#36710#36742':'
            Control = EditTruck
            ControlOptions.ShowBorder = False
          end
        end
      end
      object dxGroup2: TdxLayoutGroup [1]
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Caption = #25552#21333#26126#32454
        object dxLayout1Group5: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object dxLayout1Group8: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object dxLayout1Item7: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #27700#27877#31867#22411':'
              Control = EditStock
              ControlOptions.ShowBorder = False
            end
            object dxLayout1Item10: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = 'Button1'
              ShowCaption = False
              Control = BtnAdd
              ControlOptions.ShowBorder = False
            end
          end
          object dxLayout1Group7: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object dxLayout1Item8: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #21150#29702#21544#25968':'
              Control = EditValue
              ControlOptions.ShowBorder = False
            end
            object dxLayout1Item11: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = 'Button2'
              ShowCaption = False
              Control = BtnDel
              ControlOptions.ShowBorder = False
            end
          end
        end
        object dxLayout1Item4: TdxLayoutItem
          AutoAligns = [aaHorizontal]
          AlignVert = avClient
          Caption = 'New Item'
          ShowCaption = False
          Control = ListBill
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
end
