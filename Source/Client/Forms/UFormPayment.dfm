inherited fFormPayment: TfFormPayment
  Left = 715
  Top = 285
  ClientHeight = 500
  ClientWidth = 485
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 15
  inherited dxLayout1: TdxLayoutControl
    Width = 485
    Height = 500
    inherited BtnOK: TButton
      Left = 303
      Top = 458
      TabOrder = 12
    end
    inherited BtnExit: TButton
      Left = 390
      Top = 458
      TabOrder = 13
    end
    object EditType: TcxComboBox [2]
      Left = 87
      Top = 358
      ParentFont = False
      Properties.IncrementalSearch = False
      Properties.ItemHeight = 18
      Properties.MaxLength = 20
      TabOrder = 8
      Width = 132
    end
    object EditMoney: TcxTextEdit [3]
      Left = 282
      Top = 358
      ParentFont = False
      TabOrder = 9
      Text = '0'
      Width = 157
    end
    object EditDesc: TcxMemo [4]
      Left = 87
      Top = 388
      Lines.Strings = (
        #38144#21806#22238#27454#25110#39044#20184#27454)
      ParentFont = False
      Properties.MaxLength = 200
      Properties.ScrollBars = ssVertical
      TabOrder = 11
      Height = 56
      Width = 462
    end
    object cxLabel2: TcxLabel [5]
      Left = 425
      Top = 358
      AutoSize = False
      Caption = #20803
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 25
      Width = 31
      AnchorY = 371
    end
    object ListInfo: TcxMCListBox [6]
      Left = 29
      Top = 45
      Width = 534
      Height = 138
      HeaderSections = <
        item
          Text = #20449#24687#39033
          Width = 85
        end
        item
          AutoSize = True
          Text = #20449#24687#20869#23481
          Width = 445
        end>
      ParentFont = False
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 0
    end
    object EditID: TcxButtonEdit [7]
      Left = 87
      Top = 192
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EditIDPropertiesButtonClick
      TabOrder = 1
      OnKeyPress = OnCtrlKeyPress
      Width = 156
    end
    object EditSalesMan: TcxComboBox [8]
      Left = 306
      Top = 192
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.DropDownRows = 20
      Properties.ImmediateDropDown = False
      Properties.ItemHeight = 18
      Properties.OnChange = EditSalesManPropertiesChange
      TabOrder = 2
      Width = 152
    end
    object EditName: TcxComboBox [9]
      Left = 87
      Top = 220
      ParentFont = False
      Properties.DropDownRows = 20
      Properties.ImmediateDropDown = False
      Properties.IncrementalSearch = False
      Properties.ItemHeight = 18
      Properties.OnEditValueChanged = EditNamePropertiesEditValueChanged
      TabOrder = 3
      OnKeyPress = EditNameKeyPress
      Width = 232
    end
    object EditIn: TcxTextEdit [10]
      Left = 87
      Top = 288
      ParentFont = False
      Properties.ReadOnly = True
      TabOrder = 4
      Text = '0'
      Width = 113
    end
    object EditOut: TcxTextEdit [11]
      Left = 299
      Top = 288
      ParentFont = False
      Properties.ReadOnly = True
      TabOrder = 6
      Text = '0'
      Width = 94
    end
    object cxLabel1: TcxLabel [12]
      Left = 205
      Top = 288
      AutoSize = False
      Caption = #20803
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 25
      Width = 31
      AnchorY = 301
    end
    object cxLabel3: TcxLabel [13]
      Left = 425
      Top = 288
      AutoSize = False
      Caption = #20803
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 25
      Width = 31
      AnchorY = 301
    end
    inherited dxLayout1Group_Root: TdxLayoutGroup
      inherited dxGroup1: TdxLayoutGroup
        Caption = #23458#25143#20449#24687
        object dxLayout1Item7: TdxLayoutItem
          AutoAligns = [aaHorizontal]
          AlignVert = avClient
          Control = ListInfo
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Group4: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object dxLayout1Item8: TdxLayoutItem
            AutoAligns = [aaVertical]
            Caption = #23458#25143#32534#21495':'
            Control = EditID
            ControlOptions.ShowBorder = False
          end
          object dxLayout1Item9: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #19994#21153#20154#21592':'
            Control = EditSalesMan
            ControlOptions.ShowBorder = False
          end
        end
        object dxLayout1Item10: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          Caption = #23458#25143#21517#31216':'
          Control = EditName
          ControlOptions.ShowBorder = False
        end
      end
      object dxGroup3: TdxLayoutGroup [1]
        Caption = #36134#25143#20449#24687
        LayoutDirection = ldHorizontal
        object dxLayout1Item12: TdxLayoutItem
          Caption = #20837#37329#24635#39069':'
          Control = EditIn
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item14: TdxLayoutItem
          ShowCaption = False
          Control = cxLabel1
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item13: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          Caption = #20986#37329#24635#39069':'
          Control = EditOut
          ControlOptions.ShowBorder = False
        end
        object dxLayout1Item15: TdxLayoutItem
          ShowCaption = False
          Control = cxLabel3
          ControlOptions.ShowBorder = False
        end
      end
      object dxGroup2: TdxLayoutGroup [2]
        Caption = #36135#27454#22238#25910
        object dxLayout1Group3: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object dxLayout1Item3: TdxLayoutItem
            Caption = #20184#27454#26041#24335':'
            Control = EditType
            ControlOptions.ShowBorder = False
          end
          object dxLayout1Item4: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #32564#32435#37329#39069':'
            Control = EditMoney
            ControlOptions.ShowBorder = False
          end
          object dxLayout1Item6: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            ShowCaption = False
            Control = cxLabel2
            ControlOptions.ShowBorder = False
          end
        end
        object dxLayout1Item5: TdxLayoutItem
          Caption = #22791#27880#20449#24687':'
          Control = EditDesc
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
end
