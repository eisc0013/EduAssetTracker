object frmEAT: TfrmEAT
  Width = 1900
  Height = 1000
  Caption = 'EduAssetTracker'
  OnCreate = WebFormCreate
  OnDestroy = WebFormDestroy
  OnResize = WebFormResize
  OnShow = WebFormShow
  OnUnload = WebFormUnload
  object pc: TWebPageControl
    Left = 0
    Top = 0
    Width = 1900
    Height = 1000
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alClient
    ChildOrder = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabIndex = 0
    ParentFont = False
    TabOrder = 0
    object tsWelcome: TWebTabSheet
      Left = 0
      Top = 20
      Width = 1900
      Height = 980
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Welcome'
      DesignSize = (
        1900
        980)
      object lblFirstAccess: TWebLabel
        Left = 8
        Top = 957
        Width = 1756
        Height = 13
        Anchors = [akLeft, akRight, akBottom]
        AutoSize = False
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitTop = 456
        ExplicitWidth = 314
      end
      object btnWelcomeContinue: TWebButton
        Left = 159
        Top = 5
        Width = 1538
        Height = 38
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Continue'
        ChildOrder = 4
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnWelcomeContinueClick
      end
      object btnWelcomeResetFirstAccess: TWebButton
        Left = 1770
        Top = 952
        Width = 105
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Reset First Access'
        ChildOrder = 1
        Enabled = False
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnWelcomeResetFirstAccessClick
      end
      object lblWelcomeMessage: TTMSFNCHTMLText
        Left = 3
        Top = 48
        Width = 1886
        Height = 903
        ParentDoubleBuffered = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        TabOrder = 2
        Fill.Kind = gfkNone
        Stroke.Kind = gskNone
        Stroke.Color = -1
        Text = 
          '<B><U><FONT size="16">Welcome to the TGP Educational Asset Track' +
          'er.</FONT></U></B>'#13#10#13#10'<FONT size="12">This App allows users to v' +
          'iew and if authorized, edit information about items that are tag' +
          'ged with QR codes generated via the App.'#13#10#13#10'In order to scan QR ' +
          'Codes, the App needs access to your device camera.  When you vis' +
          'it the "Scan Asset" tab or click the "Continue" button above, th' +
          'e App will attempt to access your camera.  Please give camera ac' +
          'cess when prompted.  '#13#10#13#10'None of the images leave your device.  ' +
          'The App interprets the QR code entirely on your device and extra' +
          'cts the AssetId embedded in the QR code.</FONT> '
        WordWrapping = True
      end
    end
    object tsScanAsset: TWebTabSheet
      Left = 0
      Top = 20
      Width = 1900
      Height = 980
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Scan Asset'
      ChildOrder = 1
      OnHide = tsScanAssetHide
      OnShow = tsScanAssetShow
      object pnlCam: TWebPanel
        Left = 0
        Top = 33
        Width = 1900
        Height = 224
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Align = alTop
        BorderColor = clSilver
        BorderStyle = bsSingle
        object cam: TWebCamera
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 1892
          Height = 216
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
          Align = alClient
          BaseFormat = cbfPNG
          CameraType = ctRear
          OnCameraPause = camCameraPause
          OnCameraResume = camCameraResume
          OnCameraStreamPlay = camCameraStreamPlay
          OnCameraStop = camCameraStop
        end
      end
      object pnlScanMemo: TWebPanel
        Left = 0
        Top = 257
        Width = 1900
        Height = 697
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Align = alClient
        BorderColor = clSilver
        BorderStyle = bsSingle
        Caption = 'pnlScanMemo'
        ChildOrder = 1
        Padding.Left = 8
        Padding.Top = 8
        Padding.Right = 8
        Padding.Bottom = 8
        DesignSize = (
          1900
          697)
        object WebLabel1: TWebLabel
          Left = 13
          Top = 511
          Width = 32
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'TagId:'
          Color = clBtnFace
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
          ExplicitTop = 10
        end
        object WebLabel6: TWebLabel
          Left = 13
          Top = 535
          Width = 44
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'TagText:'
          Color = clBtnFace
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
          ExplicitTop = 34
        end
        object memScanAsset: TWebMemo
          Left = 8
          Top = 589
          Width = 1884
          Height = 100
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Align = alBottom
          AutoSize = False
          HeightPercent = 100.000000000000000000
          Lines.Strings = (
            'WebMemo1')
          SelLength = 0
          SelStart = 0
          WidthPercent = 100.000000000000000000
        end
        object btnTagAdd: TWebButton
          Left = 328
          Top = 11
          Width = 96
          Height = 25
          Caption = 'Add Tag'
          ChildOrder = 4
          Enabled = False
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
          OnClick = btnTagAddClick
        end
        object edtTagText: TWebDBEdit
          Left = 61
          Top = 531
          Width = 230
          Height = 22
          Anchors = [akLeft, akBottom]
          ChildOrder = 3
          HeightPercent = 100.000000000000000000
          Text = 'edtTagText'
          WidthPercent = 100.000000000000000000
        end
        object edtTagId: TWebDBEdit
          Left = 61
          Top = 507
          Width = 230
          Height = 22
          Anchors = [akLeft, akBottom]
          ChildOrder = 3
          HeightPercent = 100.000000000000000000
          Text = 'edtTagId'
          WidthPercent = 100.000000000000000000
        end
        object tvScan: TTMSFNCTableView
          AlignWithMargins = True
          Left = 12
          Top = 39
          Width = 1876
          Height = 465
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ParentDoubleBuffered = False
          Anchors = [akLeft, akTop, akRight, akBottom]
          DoubleBuffered = True
          TabOrder = 4
          Stroke.Color = 13420488
          ItemAppearance.Font.Charset = DEFAULT_CHARSET
          ItemAppearance.Font.Color = clBlack
          ItemAppearance.Font.Height = -11
          ItemAppearance.Font.Name = 'Tahoma'
          ItemAppearance.Font.Style = []
          ItemAppearance.Fill.Color = -1
          ItemAppearance.Stroke.Color = 13420488
          ItemAppearance.SelectedFill.Color = 14277081
          ItemAppearance.SelectedStroke.Color = 14277081
          ItemAppearance.DisabledFill.Kind = gfkNone
          ItemAppearance.DisabledFill.Color = 11119017
          ItemAppearance.DisabledStroke.Kind = gskNone
          ItemAppearance.DisabledStroke.Color = 11119017
          ItemAppearance.FixedHeight = 25.000000000000000000
          ItemAppearance.AccessoryDetailBitmaps = <>
          ItemAppearance.AccessoryFont.Charset = DEFAULT_CHARSET
          ItemAppearance.AccessoryFont.Color = 139
          ItemAppearance.AccessoryFont.Height = -11
          ItemAppearance.AccessoryFont.Name = 'Tahoma'
          ItemAppearance.AccessoryFont.Style = [fsBold]
          ItemAppearance.AccessoryStroke.Color = clBlack
          ItemAppearance.AccessoryFill.Color = 3329434
          DefaultItem.HTMLTemplateItems.Strings = (
            '<table><tr><td>#FIELDDESC</td><td>#FIELDVALUE</td></tr></table>')
          DefaultItem.VerticalTextAlign = gtaCenter
          DefaultItem.SelectedTextColor = clBlack
          Items = <
            item
              Text = 'Mercedes'
              HTMLTemplateItems.Strings = (
                '1'
                '2'
                '3')
              VerticalTextAlign = gtaCenter
              SelectedTextColor = clBlack
              AccessoryWidth = 32.000000000000000000
            end
            item
              Text = 'Audi'
              HTMLTemplateItems.Strings = (
                '<table><tr><td>#FIELDDESC</td><td>#FIELDVALUE</td></tr></table>')
              VerticalTextAlign = gtaCenter
              SelectedTextColor = clBlack
            end
            item
              Text = 'BMW'
              HTMLTemplateItems.Strings = (
                '<table><tr><td>#FIELDDESC</td><td>#FIELDVALUE</td></tr></table>')
              VerticalTextAlign = gtaCenter
              SelectedTextColor = clBlack
            end
            item
              Text = 'Land Rover'
              HTMLTemplateItems.Strings = (
                '<table><tr><td>#FIELDDESC</td><td>#FIELDVALUE</td></tr></table>')
              VerticalTextAlign = gtaCenter
              SelectedTextColor = clBlack
            end
            item
              Text = 'Bugatti'
              HTMLTemplateItems.Strings = (
                '<table><tr><td>#FIELDDESC</td><td>#FIELDVALUE</td></tr></table>')
              VerticalTextAlign = gtaCenter
              SelectedTextColor = clBlack
            end>
          Header.Text = 'Tag:'
          Header.Fill.Color = 16382457
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Stroke.Color = 11711154
          Header.Height = 30.000000000000000000
          Footer.Fill.Color = 16382457
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clBlack
          Footer.Font.Height = -11
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.Stroke.Color = 11711154
          Footer.Height = 30.000000000000000000
          LookupBar.Font.Charset = DEFAULT_CHARSET
          LookupBar.Font.Color = clWindowText
          LookupBar.Font.Height = -11
          LookupBar.Font.Name = 'Tahoma'
          LookupBar.Font.Style = []
          LookupBar.InActiveFont.Charset = DEFAULT_CHARSET
          LookupBar.InActiveFont.Color = clSilver
          LookupBar.InActiveFont.Height = -11
          LookupBar.InActiveFont.Name = 'Tahoma'
          LookupBar.InActiveFont.Style = []
          LookupBar.Stroke.Color = clWhite
          LookupBar.DownFill.Color = 16382457
          LookupBar.DownStroke.Color = 16382457
          Reload.Stroke.Color = 11119017
          Reload.Stroke.Width = 2.000000000000000000
          Categories = <>
          MoreOptions = <>
          MoreOptionAppearance.Font.Charset = DEFAULT_CHARSET
          MoreOptionAppearance.Font.Color = clWhite
          MoreOptionAppearance.Font.Height = -11
          MoreOptionAppearance.Font.Name = 'Tahoma'
          MoreOptionAppearance.Font.Style = []
          MoreOptionAppearance.Fill.Color = 11829830
          MoreOptionAppearance.Stroke.Color = 11829830
          CategoryAppearance.Font.Charset = DEFAULT_CHARSET
          CategoryAppearance.Font.Color = clWindowText
          CategoryAppearance.Font.Height = -11
          CategoryAppearance.Font.Name = 'Tahoma'
          CategoryAppearance.Font.Style = []
          CategoryAppearance.Fill.Color = 16053492
          CategoryAppearance.Stroke.Color = 11119017
          VerticalScrollBarVisible = True
        end
        object WebButton1: TWebButton
          AlignWithMargins = True
          Left = 11
          Top = 3
          Width = 96
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'WebButton1'
          ChildOrder = 7
          HeightPercent = 100.000000000000000000
          Visible = False
          WidthPercent = 100.000000000000000000
          OnClick = WebButton1Click
        end
      end
      object pnlScanHeader: TWebPanel
        Left = 0
        Top = 0
        Width = 1900
        Height = 33
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Align = alTop
        BorderColor = clSilver
        BorderStyle = bsSingle
        Caption = 'Scan an asset tag to retrieve or set information'
        ChildOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object pnlAssetTagText: TWebPanel
        Left = 0
        Top = 954
        Width = 1900
        Height = 26
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Align = alBottom
        BorderColor = clSilver
        BorderStyle = bsSingle
        ChildOrder = 3
        DesignSize = (
          1900
          26)
        object lblAssetTagText: TWebLabel
          AlignWithMargins = True
          Left = 8
          Top = 7
          Width = 77
          Height = 13
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Caption = 'Asset Tag Text:'
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
        end
        object edtAssetTagText: TTMSFNCEditButton
          Left = 88
          Top = 1
          Width = 1799
          Height = 22
          ParentDoubleBuffered = False
          Anchors = [akLeft, akTop, akRight, akBottom]
          DoubleBuffered = True
          TabOrder = 0
          OnButtonClick = edtAssetTagTextButtonClick
          Text = ''
        end
      end
    end
    object tsSignIn: TWebTabSheet
      Left = 0
      Top = 20
      Width = 1900
      Height = 980
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Sign In'
      ChildOrder = 2
      object imgWebProfile: TWebImageControl
        Left = 16
        Top = 389
        Width = 100
        Height = 65
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        AutoSize = True
        ChildOrder = 2
      end
      object WebSignIn1: TWebSignIn
        Left = 3
        Top = 25
        Width = 297
        Height = 113
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnGoogleSignedIn = WebSignIn1GoogleSignedIn
        OnGoogleSignedOut = WebSignIn1GoogleSignedOut
      end
      object memSignIn: TWebMemo
        Left = 3
        Top = 241
        Width = 442
        Height = 133
        AutoSize = False
        HeightPercent = 100.000000000000000000
        SelLength = 0
        SelStart = 0
        WidthPercent = 100.000000000000000000
      end
      object btnSignOut: TWebButton
        Left = 3
        Top = 144
        Width = 96
        Height = 25
        Caption = 'Sign Out'
        ChildOrder = 3
        Enabled = False
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnSignOutClick
      end
    end
    object tsLog: TWebTabSheet
      Left = 0
      Top = 20
      Width = 1900
      Height = 980
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Log'
      ChildOrder = 3
      object memLog: TWebMemo
        Left = 0
        Top = 0
        Width = 1900
        Height = 980
        Align = alClient
        AutoSize = False
        HeightPercent = 100.000000000000000000
        Lines.Strings = (
          'memLog')
        SelLength = 0
        SelStart = 0
        WidthPercent = 100.000000000000000000
        WordWrap = False
      end
    end
    object tsDev: TWebTabSheet
      Left = 0
      Top = 20
      Width = 1900
      Height = 980
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Development'
      ChildOrder = 4
      DesignSize = (
        1900
        980)
      object WebLabel3: TWebLabel
        Left = 16
        Top = 0
        Width = 371
        Height = 23
        Caption = 'Mel, click the button below and wait for PDF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        HeightPercent = 100.000000000000000000
        ParentFont = False
        WidthPercent = 100.000000000000000000
      end
      object imgQRCode: TWebImageControl
        Left = 318
        Top = 223
        Width = 50
        Height = 50
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ChildOrder = 5
        URL = 
          'https://chart.googleapis.com/chart?cht=qr&chs=50x50&chl=https%3A' +
          '%2F%2Ftgp.net%2FXYZCde%2Fabc%2F123e4567-e89b-12d3-a456-426614174' +
          '000'
      end
      object btnQRCodeSheet_1Big2Small_FullURI: TWebButton
        Left = 16
        Top = 29
        Width = 249
        Height = 36
        Caption = 'Create QR Code Sheet JSON 1Big2Small_FullURI'
        ChildOrder = 9
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnQRCodeSheet_1Big2Small_FullURIClick
      end
      object btnQRCodeSheet: TWebButton
        Left = 239
        Top = 144
        Width = 178
        Height = 25
        Caption = '[Deprecated]Create QR Code Sheet'
        ChildOrder = 9
        Enabled = False
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnQRCodeSheetClick
      end
      object btnQRCodeGoogle: TWebButton
        Left = 239
        Top = 175
        Width = 178
        Height = 25
        Caption = '[Deprecated]btnQRCodeGoogle'
        ChildOrder = 4
        Enabled = False
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnQRCodeGoogleClick
      end
      object WebDBGrid1: TWebDBGrid
        Left = 3
        Top = 370
        Width = 1881
        Height = 120
        Anchors = [akLeft, akTop, akRight]
        Columns = <
          item
            DataField = 'id'
            Title = 'id'
          end
          item
            DataField = 'name'
            Title = 'name'
          end
          item
            DataField = 'description'
            Title = 'description'
          end
          item
            DataField = 'deactivatedDate'
            Title = 'deactivatedDate'
          end>
        DataSource = dm.dsAssetType
        FixedCols = 1
        TabOrder = 3
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ColWidths = (
          24
          64
          64
          64
          64)
      end
      object pnlAssetType: TWebPanel
        Left = 0
        Top = 856
        Width = 1900
        Height = 124
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Align = alBottom
        BorderColor = clSilver
        BorderStyle = bsSingle
        ChildOrder = 12
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 4
        object WebLabel2: TWebLabel
          Left = 8
          Top = 8
          Width = 8
          Height = 13
          Caption = 'id'
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
        end
        object WebLabel4: TWebLabel
          Left = 8
          Top = 46
          Width = 26
          Height = 13
          Caption = 'name'
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
        end
        object WebLabel5: TWebLabel
          Left = 3
          Top = 79
          Width = 52
          Height = 13
          Caption = 'description'
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
        end
        object WebDBEdit2: TWebDBEdit
          Left = 40
          Top = 36
          Width = 328
          Height = 25
          ChildOrder = 13
          HeightPercent = 100.000000000000000000
          Text = 'WebDBEdit2'
          WidthPercent = 100.000000000000000000
          DataField = 'name'
          DataSource = dm.dsAssetType
        end
        object WebDBEdit1: TWebDBEdit
          Left = 40
          Top = 5
          Width = 273
          Height = 25
          ChildOrder = 12
          HeightPercent = 100.000000000000000000
          Text = 'WebDBEdit1'
          WidthPercent = 100.000000000000000000
          DataField = 'id'
          DataSource = dm.dsAssetType
        end
        object WebDBEdit3: TWebDBEdit
          Left = 61
          Top = 75
          Width = 384
          Height = 25
          ChildOrder = 12
          HeightPercent = 100.000000000000000000
          Text = 'WebDBEdit3'
          WidthPercent = 100.000000000000000000
          DataField = 'description'
          DataSource = dm.dsAssetType
        end
        object WebButton2: TWebButton
          Left = 353
          Top = 5
          Width = 96
          Height = 25
          Caption = 'WebButton2'
          ChildOrder = 6
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
          OnClick = WebButton2Click
        end
      end
      object QRCode: TWebQRCode
        Left = 88
        Top = 241
        Width = 50
        Height = 50
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Text = 'https://ynotwidgets.com'
      end
      object btnQRCodeSheet_2Big_FullURI: TWebButton
        Left = 16
        Top = 71
        Width = 249
        Height = 36
        Caption = 'Create QR Code Sheet JSON 2Big_FullURI'
        ChildOrder = 9
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnQRCodeSheet_2Big_FullURIClick
      end
      object btnQRCodeSheet_1BigFullURI_1BigUUID: TWebButton
        Left = 16
        Top = 113
        Width = 249
        Height = 36
        Caption = 'Create QR Code Sheet JSON 1BigFullURI_1BigUUID'
        ChildOrder = 9
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnQRCodeSheet_1BigFullURI_1BigUUIDClick
      end
      object btnQRCodeSheet_1BigTGPURI_1BigUUID: TWebButton
        Left = 16
        Top = 155
        Width = 249
        Height = 36
        Caption = 'Create QR Code Sheet JSON 1BigTGPURI_1BigUUID'
        ChildOrder = 9
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnQRCodeSheet_1BigTGPURI_1BigUUIDClick
      end
      object btnTagTest: TWebButton
        Left = 291
        Top = 29
        Width = 96
        Height = 25
        Caption = 'TEATTag Test'
        ChildOrder = 13
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnTagTestClick
      end
      object edtAssetTagTextTest: TTMSFNCEditButton
        Left = 8
        Top = 308
        Width = 425
        Height = 36
        ParentDoubleBuffered = False
        DoubleBuffered = True
        TabOrder = 10
        ButtonSize = 24
        OnButtonClick = edtAssetTagTextTestButtonClick
        Text = ''
      end
      object btnFlushAudit: TWebButton
        Left = 291
        Top = 60
        Width = 96
        Height = 25
        Caption = 'Flush Audit Log'
        ChildOrder = 13
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnFlushAuditClick
      end
      object btnQRCodeSheet_1BigTGPURI_1BigUUID_GSalePup: TWebButton
        Left = 16
        Top = 199
        Width = 249
        Height = 36
        Caption = 'Create QR Code Sheet JSON GarageSalePup'
        ChildOrder = 9
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnQRCodeSheet_1BigTGPURI_1BigUUID_GSalePupClick
      end
    end
    object tsAssetInfo: TWebTabSheet
      AlignWithMargins = True
      Left = 0
      Top = 20
      Width = 1900
      Height = 980
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Asset Information'
      ChildOrder = 5
      object pnlAITagText: TWebPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 1892
        Height = 60
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Align = alTop
        BorderColor = clSilver
        BorderStyle = bsSingle
        Caption = 'Tag Text: <no active tag>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object pnlAIAssetInfo: TWebPanel
        AlignWithMargins = True
        Left = 4
        Top = 68
        Width = 1892
        Height = 908
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 4
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Align = alClient
        BorderColor = clSilver
        BorderStyle = bsSingle
        ChildOrder = 1
        object scAI: TWebScrollBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 1884
          Height = 900
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
          Align = alClient
          AutoScroll = True
          BorderStyle = bsSingle
          object pnlAIAsset: TWebPanel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 377
            Height = 626
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 0
            HeightPercent = 100.000000000000000000
            WidthPercent = 100.000000000000000000
            BorderColor = clSilver
            BorderStyle = bsSingle
            object pnlAIAssetHeader: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 377
              Height = 32
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              object WebLabel7: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Alignment = taCenter
                Caption = 'Assets'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                HeightPercent = 100.000000000000000000
                ParentFont = False
                WidthPercent = 100.000000000000000000
                ExplicitWidth = 51
              end
            end
            object pnlAIAssetId: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 73
              Width = 377
              Height = 152
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 1
              DesignSize = (
                377
                152)
              object WebLabel15: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 44
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Asset Id:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel16: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 38
                Width = 22
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Tag:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel17: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 98
                Width = 38
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Vendor:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel18: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 125
                Width = 31
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Room:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel22: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 68
                Width = 28
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Type:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIAssetId: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 4
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetId'
                WidthPercent = 100.000000000000000000
                DataField = 'id'
                DataSource = dm.dsAssetNA
              end
              object edtAITagId: TWebDBLookupComboBox
                AlignWithMargins = True
                Left = 55
                Top = 33
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                DataField = 'tagId'
                DataSource = dm.dsAssetNA
                KeyField = 'id'
                ListField = 'tagText'
                ListSource = dm.dsTagsList
              end
              object edtAIVendorId: TWebDBLookupComboBox
                AlignWithMargins = True
                Left = 55
                Top = 93
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                DataField = 'vendorId'
                DataSource = dm.dsAssetNA
                KeyField = 'id'
                ListField = 'name'
                ListSource = dm.dsVendorList
              end
              object edtRoomId: TWebDBLookupComboBox
                AlignWithMargins = True
                Left = 55
                Top = 120
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                DataField = 'roomId'
                DataSource = dm.dsAssetNA
                KeyField = 'id'
                ListField = 'nameplate'
                ListSource = dm.dsRoomList
              end
              object WebDBLookupComboBox1: TWebDBLookupComboBox
                AlignWithMargins = True
                Left = 55
                Top = 63
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                DataField = 'typeId'
                DataSource = dm.dsAssetNA
                KeyField = 'id'
                ListField = 'name'
                ListSource = dm.dsAssetTypeList
              end
            end
            object pnlAIAssetsDBNav: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 32
              Width = 377
              Height = 41
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              object dbnAsset: TWebDBNavigator
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 33
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                Align = alClient
                DataSource = dm.dsAssetNA
                Hints.Strings = (
                  'First'
                  'Prior'
                  'Next'
                  'Last'
                  'Edit'
                  'Post'
                  'Insert'
                  'Delete'
                  'Cancel')
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
              end
            end
            object pnlAIAssetDetail: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 225
              Width = 377
              Height = 401
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alClient
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 3
              DesignSize = (
                377
                401)
              object WebLabel35: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 7
                Width = 29
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Make:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel36: TWebLabel
                AlignWithMargins = True
                Left = 3
                Top = 39
                Width = 32
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Model:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel37: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 68
                Width = 70
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Serial Number:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel38: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 98
                Width = 74
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Purchase Date:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel39: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 128
                Width = 86
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Purchase Invoice:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel40: TWebLabel
                AlignWithMargins = True
                Left = 3
                Top = 156
                Width = 74
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Purchase Price:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel41: TWebLabel
                AlignWithMargins = True
                Left = 3
                Top = 186
                Width = 129
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Warranty Duration (Days):'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel42: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 218
                Width = 88
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Deactivated Date:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel43: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 240
                Width = 79
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Purchase Notes:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel44: TWebLabel
                AlignWithMargins = True
                Left = 8
                Top = 318
                Width = 32
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Notes:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIAssetMake: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 4
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetMake'
                WidthPercent = 100.000000000000000000
                DataField = 'make'
                DataSource = dm.dsAssetNA
              end
              object edtAIAssetModel: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 34
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetModel'
                WidthPercent = 100.000000000000000000
                DataField = 'model'
                DataSource = dm.dsAssetNA
              end
              object edtAIAssetSN: TWebDBEdit
                AlignWithMargins = True
                Left = 82
                Top = 64
                Width = 291
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetSN'
                WidthPercent = 100.000000000000000000
                DataField = 'serialNumber'
                DataSource = dm.dsAssetNA
              end
              object edtAIAssetDateDeactivated: TWebDBEdit
                AlignWithMargins = True
                Left = 100
                Top = 214
                Width = 273
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetDateDeactivated'
                WidthPercent = 100.000000000000000000
                DataField = 'deactivatedDate'
                DataSource = dm.dsAssetNA
              end
              object edtAIAssetPurchaseDate: TWebDBEdit
                AlignWithMargins = True
                Left = 98
                Top = 94
                Width = 275
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetPurchaseDate'
                WidthPercent = 100.000000000000000000
                DataField = 'purchaseDate'
                DataSource = dm.dsAssetNA
              end
              object edtAIAssetPurchaseInvoice: TWebDBEdit
                AlignWithMargins = True
                Left = 98
                Top = 124
                Width = 275
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetPurchaseInvoice'
                WidthPercent = 100.000000000000000000
                DataField = 'purchaseInvoice'
                DataSource = dm.dsAssetNA
              end
              object edtAIAssetPurchasePrice: TWebDBEdit
                AlignWithMargins = True
                Left = 98
                Top = 154
                Width = 275
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                EditType = weNumeric
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetPurchasePrice'
                WidthPercent = 100.000000000000000000
                DataField = 'purchasePrice'
                DataSource = dm.dsAssetNA
              end
              object edtAIAssetWarrantyDurationDays: TWebDBEdit
                AlignWithMargins = True
                Left = 140
                Top = 184
                Width = 233
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                EditType = weNumeric
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetWarrantyDurationDays'
                WidthPercent = 100.000000000000000000
                DataField = 'warrantyDurationDays'
                DataSource = dm.dsAssetNA
              end
              object edtAIAssetPurchaseNotes: TWebDBMemo
                AlignWithMargins = True
                Left = 16
                Top = 256
                Width = 356
                Height = 61
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                AutoSize = False
                HeightPercent = 100.000000000000000000
                Lines.Strings = (
                  'edtAIAssetPurchaseNotes')
                SelLength = 0
                SelStart = 0
                WidthPercent = 100.000000000000000000
                DataField = 'purchaseNotes'
                DataSource = dm.dsAssetNA
              end
              object edtAIAssetNotes: TWebDBMemo
                AlignWithMargins = True
                Left = 17
                Top = 336
                Width = 356
                Height = 61
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                AutoSize = False
                HeightPercent = 100.000000000000000000
                Lines.Strings = (
                  'edtAIAssetNotes')
                SelLength = 0
                SelStart = 17
                WidthPercent = 100.000000000000000000
                DataField = 'notes'
                DataSource = dm.dsAssetNA
              end
            end
          end
          object pnlAIAssetType: TWebPanel
            AlignWithMargins = True
            Left = 385
            Top = 4
            Width = 377
            Height = 311
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 0
            HeightPercent = 100.000000000000000000
            WidthPercent = 100.000000000000000000
            BorderColor = clSilver
            BorderStyle = bsSingle
            ChildOrder = 1
            object pnlAIAssetTypeHeader: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 377
              Height = 31
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              object WebLabel8: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Alignment = taCenter
                Caption = 'Asset Types'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                HeightPercent = 100.000000000000000000
                ParentFont = False
                WidthPercent = 100.000000000000000000
                ExplicitWidth = 98
              end
            end
            object pnlAIAssetTypeDBNav: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 31
              Width = 377
              Height = 41
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              object dbnAssetType: TWebDBNavigator
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 33
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                Align = alClient
                DataSource = dm.dsAssetType
                Hints.Strings = (
                  'First'
                  'Prior'
                  'Next'
                  'Last'
                  'Edit'
                  'Post'
                  'Insert'
                  'Delete'
                  'Cancel')
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
              end
            end
            object pnlAIAssetTypeId: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 72
              Width = 377
              Height = 33
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              DesignSize = (
                377
                33)
              object WebLabel23: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 71
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Asset Type Id:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIAssetTypeId: TWebDBEdit
                AlignWithMargins = True
                Left = 83
                Top = 4
                Width = 290
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetTypeId'
                WidthPercent = 100.000000000000000000
                DataField = 'id'
                DataSource = dm.dsAssetType
              end
            end
            object pnlAIAssetTypesDetail: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 105
              Width = 377
              Height = 206
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alClient
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 3
              DesignSize = (
                377
                206)
              object WebLabel29: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 31
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Name:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel30: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 184
                Width = 88
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akBottom]
                Caption = 'Deactivated Date:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel31: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 36
                Width = 57
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Description:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIAssetTypeName: TWebDBEdit
                AlignWithMargins = True
                Left = 73
                Top = 4
                Width = 300
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetTypeName'
                WidthPercent = 100.000000000000000000
                DataField = 'name'
                DataSource = dm.dsAssetType
              end
              object edtAIAssetTypeDeactivatedDate: TWebDBEdit
                AlignWithMargins = True
                Left = 100
                Top = 180
                Width = 101
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akBottom]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIAssetTypeDeactivatedDate'
                WidthPercent = 100.000000000000000000
                DataField = 'deactivatedDate'
                DataSource = dm.dsAssetType
              end
              object edtAIAssetTypesDescription: TWebDBMemo
                AlignWithMargins = True
                Left = 4
                Top = 56
                Width = 369
                Height = 116
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight, akBottom]
                AutoSize = False
                HeightPercent = 100.000000000000000000
                Lines.Strings = (
                  'edtAIAssetTypesDescription')
                SelLength = 0
                SelStart = 0
                WidthPercent = 100.000000000000000000
                DataField = 'description'
                DataSource = dm.dsAssetType
              end
            end
          end
          object pnlAIPerson: TWebPanel
            AlignWithMargins = True
            Left = 766
            Top = 4
            Width = 377
            Height = 311
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 0
            HeightPercent = 100.000000000000000000
            WidthPercent = 100.000000000000000000
            BorderColor = clSilver
            BorderStyle = bsSingle
            ChildOrder = 2
            object WebPanel4: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 377
              Height = 31
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              object WebLabel9: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Alignment = taCenter
                Caption = 'People'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                HeightPercent = 100.000000000000000000
                ParentFont = False
                WidthPercent = 100.000000000000000000
                ExplicitWidth = 55
              end
            end
            object pnlAIPersonDBNav: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 31
              Width = 377
              Height = 41
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              object dbnPerson: TWebDBNavigator
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 33
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                Align = alClient
                DataSource = dm.dsPerson
                Hints.Strings = (
                  'First'
                  'Prior'
                  'Next'
                  'Last'
                  'Edit'
                  'Post'
                  'Insert'
                  'Delete'
                  'Cancel')
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
              end
            end
            object pnlAIPersonId: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 72
              Width = 377
              Height = 33
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              DesignSize = (
                377
                33)
              object WebLabel24: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 50
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Person Id:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIPersonId: TWebDBEdit
                AlignWithMargins = True
                Left = 62
                Top = 4
                Width = 311
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIPersonId'
                WidthPercent = 100.000000000000000000
                DataField = 'id'
                DataSource = dm.dsPerson
              end
            end
            object pnlAIPersonDetail: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 105
              Width = 377
              Height = 206
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alClient
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 3
              DesignSize = (
                377
                206)
              object WebLabel32: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 31
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Name:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel33: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 68
                Width = 88
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Deactivated Date:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel34: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 38
                Width = 32
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'E-mail:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIPersonName: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 4
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIPersonName'
                WidthPercent = 100.000000000000000000
                DataField = 'name'
                DataSource = dm.dsPerson
              end
              object edtAIPersonDateDeactivated: TWebDBEdit
                AlignWithMargins = True
                Left = 100
                Top = 64
                Width = 101
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIPersonDateDeactivated'
                WidthPercent = 100.000000000000000000
                DataField = 'deactivatedDate'
                DataSource = dm.dsPerson
              end
              object edtAIPersonEmail: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 34
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                AutoCompletion = acEmail
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIPersonEmail'
                WidthPercent = 100.000000000000000000
                DataField = 'email'
                DataSource = dm.dsPerson
              end
            end
          end
          object pnlAIRoom: TWebPanel
            Left = 1147
            Top = 4
            Width = 377
            Height = 311
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 0
            HeightPercent = 100.000000000000000000
            WidthPercent = 100.000000000000000000
            BorderColor = clSilver
            BorderStyle = bsSingle
            ChildOrder = 3
            object WebPanel6: TWebPanel
              Left = 0
              Top = 0
              Width = 377
              Height = 31
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              object WebLabel10: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Alignment = taCenter
                Caption = 'Rooms'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                HeightPercent = 100.000000000000000000
                ParentFont = False
                WidthPercent = 100.000000000000000000
                ExplicitWidth = 56
              end
            end
            object pnlAIRoomDBNav: TWebPanel
              Left = 0
              Top = 31
              Width = 377
              Height = 41
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              object dbnRoom: TWebDBNavigator
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 33
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                Align = alClient
                DataSource = dm.dsRoomNA
                Hints.Strings = (
                  'First'
                  'Prior'
                  'Next'
                  'Last'
                  'Edit'
                  'Post'
                  'Insert'
                  'Delete'
                  'Cancel')
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
              end
            end
            object pnlAIRoomId: TWebPanel
              Left = 0
              Top = 72
              Width = 377
              Height = 33
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              DesignSize = (
                377
                33)
              object WebLabel25: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 44
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Room Id:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIRoomId: TWebDBEdit
                AlignWithMargins = True
                Left = 62
                Top = 4
                Width = 311
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIRoomId'
                WidthPercent = 100.000000000000000000
                DataField = 'id'
                DataSource = dm.dsRoomNA
              end
            end
            object pnlAIRoomDetail: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 105
              Width = 377
              Height = 206
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alClient
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 3
              DesignSize = (
                377
                206)
              object WebLabel45: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 101
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Nameplate (room #):'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel46: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 128
                Width = 88
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akBottom]
                Caption = 'Deactivated Date:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel47: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 38
                Width = 37
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Person:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel48: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 68
                Width = 40
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Building:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel49: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 96
                Width = 33
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Grade:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIRoomNameplate: TWebDBEdit
                AlignWithMargins = True
                Left = 113
                Top = 4
                Width = 260
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIRoomNameplate'
                WidthPercent = 100.000000000000000000
                DataField = 'nameplate'
                DataSource = dm.dsRoomNA
              end
              object edtAIRoomDeactivatedDate: TWebDBEdit
                AlignWithMargins = True
                Left = 100
                Top = 124
                Width = 101
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akBottom]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIRoomDeactivatedDate'
                WidthPercent = 100.000000000000000000
                DataField = 'deactivatedDate'
                DataSource = dm.dsRoomNA
              end
              object edtAIRoomBuilding: TWebDBLookupComboBox
                AlignWithMargins = True
                Left = 55
                Top = 64
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                DataField = 'buildingId'
                DataSource = dm.dsRoomNA
                KeyField = 'id'
                ListField = 'name'
                ListSource = dm.dsBuildingList
              end
              object edtAIRoomPerson: TWebDBLookupComboBox
                AlignWithMargins = True
                Left = 55
                Top = 34
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                DataField = 'personId'
                DataSource = dm.dsRoomNA
                KeyField = 'id'
                ListField = 'name'
                ListSource = dm.dsPersonList
              end
              object edtAIRoomGrade: TWebDBEdit
                AlignWithMargins = True
                Left = 45
                Top = 94
                Width = 328
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIRoomNameplate'
                WidthPercent = 100.000000000000000000
                DataField = 'grade'
                DataSource = dm.dsRoomNA
              end
            end
          end
          object pnlAIBuilding: TWebPanel
            Left = 1528
            Top = 4
            Width = 377
            Height = 311
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 0
            HeightPercent = 100.000000000000000000
            WidthPercent = 100.000000000000000000
            BorderColor = clSilver
            BorderStyle = bsSingle
            ChildOrder = 4
            object WebPanel8: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 377
              Height = 31
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              object WebLabel11: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Alignment = taCenter
                Caption = 'Buildings'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                HeightPercent = 100.000000000000000000
                ParentFont = False
                WidthPercent = 100.000000000000000000
                ExplicitWidth = 75
              end
            end
            object pnlAIBuildingDBNav: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 31
              Width = 377
              Height = 41
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              object dbnBuilding: TWebDBNavigator
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 33
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                Align = alClient
                DataSource = dm.dsBuilding
                Hints.Strings = (
                  'First'
                  'Prior'
                  'Next'
                  'Last'
                  'Edit'
                  'Post'
                  'Insert'
                  'Delete'
                  'Cancel')
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
              end
            end
            object pnlAIBuildingId: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 72
              Width = 377
              Height = 33
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              DesignSize = (
                377
                33)
              object WebLabel26: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 53
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Building Id:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIBuildingId: TWebDBEdit
                AlignWithMargins = True
                Left = 62
                Top = 4
                Width = 311
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIBuildingId'
                WidthPercent = 100.000000000000000000
                DataField = 'id'
                DataSource = dm.dsBuilding
              end
            end
            object pnlAIBuildingDetail: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 105
              Width = 377
              Height = 206
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alClient
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 3
              DesignSize = (
                377
                206)
              object WebLabel50: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 31
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Name:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel51: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 182
                Width = 88
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Deactivated Date:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel52: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 40
                Width = 34
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Phone:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel53: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 60
                Width = 43
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Address:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIBuildingName: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 4
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIBuildingName'
                WidthPercent = 100.000000000000000000
                DataField = 'name'
                DataSource = dm.dsBuilding
              end
              object edtAIBuildingDeactivatedDate: TWebDBEdit
                AlignWithMargins = True
                Left = 100
                Top = 178
                Width = 101
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIBuildingDeactivatedDate'
                WidthPercent = 100.000000000000000000
                DataField = 'deactivatedDate'
                DataSource = dm.dsBuilding
              end
              object edtAIBuildingPhone: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 34
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                AutoCompletion = acTelephone
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIBuildingPhone'
                WidthPercent = 100.000000000000000000
                DataField = 'phone'
                DataSource = dm.dsBuilding
              end
              object edtAIBuildingAddress: TWebDBMemo
                AlignWithMargins = True
                Left = 8
                Top = 80
                Width = 369
                Height = 90
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight, akBottom]
                AutoSize = False
                HeightPercent = 100.000000000000000000
                Lines.Strings = (
                  'edtAIBuildingAddress')
                SelLength = 0
                SelStart = 22
                WidthPercent = 100.000000000000000000
                WordWrap = False
                DataField = 'address'
                DataSource = dm.dsBuilding
              end
            end
          end
          object pnlAIVendor: TWebPanel
            AlignWithMargins = True
            Left = 385
            Top = 319
            Width = 377
            Height = 311
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 0
            HeightPercent = 100.000000000000000000
            WidthPercent = 100.000000000000000000
            BorderColor = clSilver
            BorderStyle = bsSingle
            ChildOrder = 4
            object WebPanel10: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 377
              Height = 31
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              object WebLabel12: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Alignment = taCenter
                Caption = 'Vendors'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                HeightPercent = 100.000000000000000000
                ParentFont = False
                WidthPercent = 100.000000000000000000
                ExplicitWidth = 68
              end
            end
            object pnlAIVendorDBNav: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 31
              Width = 377
              Height = 41
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              object dbnVendor: TWebDBNavigator
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 33
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                Align = alClient
                DataSource = dm.dsVendor
                Hints.Strings = (
                  'First'
                  'Prior'
                  'Next'
                  'Last'
                  'Edit'
                  'Post'
                  'Insert'
                  'Delete'
                  'Cancel')
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
              end
            end
            object pnlAIVendorId: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 72
              Width = 377
              Height = 33
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              DesignSize = (
                377
                33)
              object WebLabel27: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 51
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Vendor Id:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIVendorVendorId: TWebDBEdit
                AlignWithMargins = True
                Left = 62
                Top = 4
                Width = 311
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIVendorVendorId'
                WidthPercent = 100.000000000000000000
                DataField = 'id'
                DataSource = dm.dsVendor
              end
            end
            object pnlAIVendorDetail: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 105
              Width = 377
              Height = 206
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alClient
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 3
              DesignSize = (
                377
                206)
              object WebLabel54: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 31
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Name:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel55: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 184
                Width = 88
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Deactivated Date:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel56: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 38
                Width = 43
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Website:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel57: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 68
                Width = 34
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Phone:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel58: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 98
                Width = 32
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'E-mail:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel59: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 118
                Width = 32
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Notes:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIVendorName: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 4
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIVendorName'
                WidthPercent = 100.000000000000000000
                DataField = 'name'
                DataSource = dm.dsVendor
              end
              object edtAIVendorDeactivatedDate: TWebDBEdit
                AlignWithMargins = True
                Left = 100
                Top = 180
                Width = 101
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIVendorDeactivatedDate'
                WidthPercent = 100.000000000000000000
                DataField = 'deactivatedDate'
                DataSource = dm.dsVendor
              end
              object edtAIVendorWebsite: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 34
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                AutoCompletion = acURL
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIVendorWebsite'
                WidthPercent = 100.000000000000000000
                DataField = 'website'
                DataSource = dm.dsVendor
              end
              object edtAIVendorPhone: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 64
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                AutoCompletion = acTelephone
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIVendorPhone'
                WidthPercent = 100.000000000000000000
                DataField = 'phone'
                DataSource = dm.dsVendor
              end
              object edtAIVendorEmail: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 94
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                AutoCompletion = acEmail
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIVendorEmail'
                WidthPercent = 100.000000000000000000
                DataField = 'email'
                DataSource = dm.dsVendor
              end
              object edtAIVendorNotes: TWebDBMemo
                AlignWithMargins = True
                Left = 8
                Top = 136
                Width = 365
                Height = 36
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                AutoSize = False
                HeightPercent = 100.000000000000000000
                Lines.Strings = (
                  'edtAIVendorNotes')
                SelLength = 0
                SelStart = 18
                WidthPercent = 100.000000000000000000
                DataField = 'notes'
                DataSource = dm.dsVendor
              end
            end
          end
          object pnlAIDocument: TWebPanel
            AlignWithMargins = True
            Left = 766
            Top = 319
            Width = 377
            Height = 311
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 0
            HeightPercent = 100.000000000000000000
            WidthPercent = 100.000000000000000000
            BorderColor = clSilver
            BorderStyle = bsSingle
            ChildOrder = 4
            object WebPanel12: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 377
              Height = 31
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              object WebLabel13: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Alignment = taCenter
                Caption = 'Documents'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                HeightPercent = 100.000000000000000000
                ParentFont = False
                WidthPercent = 100.000000000000000000
                ExplicitWidth = 94
              end
            end
            object pnlAIDocumentDBNav: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 31
              Width = 377
              Height = 41
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              object dbnDocument: TWebDBNavigator
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 33
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                Align = alClient
                DataSource = dm.dsDocuments
                Hints.Strings = (
                  'First'
                  'Prior'
                  'Next'
                  'Last'
                  'Edit'
                  'Post'
                  'Insert'
                  'Delete'
                  'Cancel')
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
              end
            end
            object pnlAIDocumentsId: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 72
              Width = 377
              Height = 33
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              DesignSize = (
                377
                33)
              object WebLabel28: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 70
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Documents Id:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAIDocumentsId: TWebDBEdit
                AlignWithMargins = True
                Left = 82
                Top = 4
                Width = 291
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAIDocumentsId'
                WidthPercent = 100.000000000000000000
                DataField = 'id'
                DataSource = dm.dsDocuments
              end
            end
          end
          object pnlAITag: TWebPanel
            AlignWithMargins = True
            Left = 1147
            Top = 319
            Width = 377
            Height = 311
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 0
            HeightPercent = 100.000000000000000000
            WidthPercent = 100.000000000000000000
            BorderColor = clSilver
            BorderStyle = bsSingle
            ChildOrder = 4
            object WebPanel3: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 377
              Height = 31
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              DesignSize = (
                377
                31)
              object WebLabel14: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Alignment = taCenter
                Caption = 'Tags'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                HeightPercent = 100.000000000000000000
                ParentFont = False
                WidthPercent = 100.000000000000000000
                ExplicitWidth = 40
              end
              object btnAITagsFlush: TWebButton
                AlignWithMargins = True
                Left = 278
                Top = 3
                Width = 96
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akTop, akRight]
                Caption = 'Flush Updates'
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                OnClick = btnAITagsFlushClick
              end
            end
            object pnlAITagDBNav: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 31
              Width = 377
              Height = 41
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              object dbnTag: TWebDBNavigator
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 369
                Height = 33
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
                Align = alClient
                DataSource = dm.dsTags
                Hints.Strings = (
                  'First'
                  'Prior'
                  'Next'
                  'Last'
                  'Edit'
                  'Post'
                  'Insert'
                  'Delete'
                  'Cancel')
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
              end
            end
            object WebPanel1: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 72
              Width = 377
              Height = 33
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alTop
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 2
              DesignSize = (
                377
                33)
              object WebLabel19: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 35
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Tag Id:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAITagTagId: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 4
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAITagId'
                WidthPercent = 100.000000000000000000
                DataField = 'id'
                DataSource = dm.dsTags
              end
            end
            object pnlAITagDetail: TWebPanel
              AlignWithMargins = True
              Left = 0
              Top = 105
              Width = 377
              Height = 206
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              HeightPercent = 100.000000000000000000
              WidthPercent = 100.000000000000000000
              Align = alClient
              BorderColor = clSilver
              BorderStyle = bsSingle
              ChildOrder = 3
              DesignSize = (
                377
                206)
              object WebLabel20: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 8
                Width = 47
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Tag Text:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object WebLabel21: TWebLabel
                AlignWithMargins = True
                Left = 4
                Top = 38
                Width = 88
                Height = 13
                Margins.Left = 4
                Margins.Top = 0
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Deactivated Date:'
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object edtAITagText: TWebDBEdit
                AlignWithMargins = True
                Left = 55
                Top = 4
                Width = 318
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akLeft, akTop, akRight]
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAITagId'
                WidthPercent = 100.000000000000000000
                DataField = 'tagText'
                DataSource = dm.dsTags
              end
              object WebDBEdit4: TWebDBEdit
                AlignWithMargins = True
                Left = 100
                Top = 34
                Width = 101
                Height = 22
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ChildOrder = 1
                HeightPercent = 100.000000000000000000
                Text = 'edtAITagDeactivatedDate'
                WidthPercent = 100.000000000000000000
                DataField = 'deactivatedDate'
                DataSource = dm.dsTags
              end
            end
          end
        end
      end
    end
  end
  object pnlBusy: TWebPanel
    Left = 72
    Top = 32
    Width = 150
    Height = 60
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    BorderColor = clSilver
    BorderStyle = bsSingle
    ChildOrder = 1
    object indBusy: TTMSFNCWaitingIndicator
      Left = -270
      Top = -228
      Width = 412
      Height = 286
      Margins.Left = 40
      Margins.Top = 40
      Margins.Right = 40
      Margins.Bottom = 40
      AdaptToStyle = True
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 0
      Visible = False
      Active = True
      Appearance.IndicatorFill.Color = 16297243
      Appearance.IndicatorStroke.Color = 13882323
      Appearance.IndicatorShape = wisProgress
      Appearance.MoveShape = wmsCircle
      Appearance.OverlayStroke.Kind = gskNone
      Appearance.OverlayStroke.Color = clGray
      AnimationSpeed = 4.000000000000000000
    end
  end
  object QRCodeGoogleAPIs: TWebHttpRequest
    Headers.Strings = (
      'Cache-Control=no-cache, no-store, must-revalidate')
    OnResponse = QRCodeGoogleAPIsResponse
    Left = 208
    Top = 799
  end
  object qrDecode: TWebQRDecoder
    Camera = cam
    OnDecoded = qrDecodeDecoded
    Left = 24
    Top = 797
  end
  object tmrQRDetectPause: TWebTimer
    Enabled = False
    Interval = 3000
    OnTimer = tmrQRDetectPauseTimer
    Left = 104
    Top = 797
  end
end
