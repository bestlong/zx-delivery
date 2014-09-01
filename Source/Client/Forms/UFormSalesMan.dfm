inherited fFormSalesMan: TfFormSalesMan
  Left = 316
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 500
  ClientWidth = 485
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 120
  TextHeight = 15
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 485
    Height = 500
    Align = alClient
    TabOrder = 0
    TabStop = False
    AutoContentSizes = [acsWidth, acsHeight]
    LookAndFeel = FDM.dxLayoutWeb1
    object EditName: TcxTextEdit
      Left = 87
      Top = 45
      Hint = 'T.S_Name'
      ParentFont = False
      Properties.MaxLength = 30
      TabOrder = 0
      OnKeyDown = FormKeyDown
      Width = 173
    end
    object EditMemo: TcxMemo
      Left = 87
      Top = 120
      Hint = 'T.S_Memo'
      ParentFont = False
      Properties.MaxLength = 50
      Properties.ScrollBars = ssVertical
      Style.Edges = [bBottom]
      TabOrder = 3
      Height = 62
      Width = 460
    end
    object InfoList1: TcxMCListBox
      Left = 29
      Top = 281
      Width = 496
      Height = 132
      HeaderSections = <
        item
          Text = #20449#24687#39033
          Width = 105
        end
        item
          AutoSize = True
          Text = #20869#23481
          Width = 387
        end>
      ParentFont = False
      Style.BorderStyle = cbsOffice11
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 8
    end
    object InfoItems: TcxComboBox
      Left = 87
      Top = 227
      ParentFont = False
      Properties.DropDownRows = 15
      Properties.ImmediateDropDown = False
      Properties.IncrementalSearch = False
      Properties.ItemHeight = 20
      Properties.MaxLength = 30
      TabOrder = 4
      Width = 94
    end
    object EditInfo: TcxTextEdit
      Left = 87
      Top = 254
      ParentFont = False
      Properties.MaxLength = 50
      TabOrder = 6
      Width = 112
    end
    object BtnAdd: TButton
      Left = 400
      Top = 227
      Width = 56
      Height = 22
      Caption = #28155#21152
      TabOrder = 5
      OnClick = BtnAddClick
    end
    object BtnDel: TButton
      Left = 400
      Top = 254
      Width = 56
      Height = 22
      Caption = #21024#38500
      TabOrder = 7
      OnClick = BtnDelClick
    end
    object BtnOK: TButton
      Left = 290
      Top = 456
      Width = 88
      Height = 27
      Caption = #20445#23384
      TabOrder = 10
      OnClick = BtnOKClick
    end
    object BtnExit: TButton
      Left = 383
      Top = 456
      Width = 88
      Height = 27
      Caption = #21462#28040
      TabOrder = 11
      OnClick = BtnExitClick
    end
    object cxTextEdit3: TcxTextEdit
      Left = 87
      Top = 70
      Hint = 'T.S_Phone'
      ParentFont = False
      Properties.MaxLength = 15
      TabOrder = 1
      OnKeyDown = FormKeyDown
      Width = 199
    end
    object EditArea: TcxButtonEdit
      Left = 87
      Top = 95
      Hint = 'T.S_Area'
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaxLength = 50
      Properties.OnButtonClick = EditAreaPropertiesButtonClick
      TabOrder = 2
      OnKeyDown = FormKeyDown
      Width = 152
    end
    object Check1: TcxCheckBox
      Left = 14
      Top = 456
      Hint = 'T.S_InValid'
      Caption = #26080#25928#20154#21592': '#27491#24120#26597#35810#26102#19981#20104#26174#31034'.'
      ParentFont = False
      TabOrder = 9
      Transparent = True
      Width = 227
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      ShowCaption = False
      Hidden = True
      ShowBorder = False
      object dxLayoutControl1Group1: TdxLayoutGroup
        Caption = #22522#26412#20449#24687
        object dxLayoutControl1Group9: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object dxLayoutControl1Item2: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #20154#21592#21517#31216':'
            Control = EditName
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item14: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #32852#31995#26041#24335':'
            Control = cxTextEdit3
            ControlOptions.ShowBorder = False
          end
        end
        object dxLayoutControl1Item12: TdxLayoutItem
          Caption = #25152#22312#21306#22495':'
          Control = EditArea
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item4: TdxLayoutItem
          Caption = #22791#27880#20449#24687':'
          Control = EditMemo
          ControlOptions.ShowBorder = False
        end
      end
      object dxLayoutControl1Group2: TdxLayoutGroup
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Caption = #38468#21152#20449#24687
        object dxLayoutControl1Group4: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object dxlytgrpLayoutControl1Group6: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object dxLayoutControl1Item6: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #20449' '#24687' '#39033':'
              Control = InfoItems
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl1Item8: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = 'Button1'
              ShowCaption = False
              Control = BtnAdd
              ControlOptions.ShowBorder = False
            end
          end
          object dxLayoutControl1Group6: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object dxLayoutControl1Item7: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #20449#24687#20869#23481':'
              Control = EditInfo
              ControlOptions.ShowBorder = False
            end
            object dxLayoutControl1Item9: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = 'Button2'
              ShowCaption = False
              Control = BtnDel
              ControlOptions.ShowBorder = False
            end
          end
        end
        object dxLayoutControl1Item5: TdxLayoutItem
          AutoAligns = [aaHorizontal]
          AlignVert = avClient
          Control = InfoList1
          ControlOptions.ShowBorder = False
        end
      end
      object dxLayoutControl1Group5: TdxLayoutGroup
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        ShowCaption = False
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object dxLayoutControl1Item1: TdxLayoutItem
          Caption = 'cxCheckBox1'
          ShowCaption = False
          Control = Check1
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item10: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahRight
          Caption = 'Button3'
          ShowCaption = False
          Control = BtnOK
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item11: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahRight
          Caption = 'Button4'
          ShowCaption = False
          Control = BtnExit
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
end
