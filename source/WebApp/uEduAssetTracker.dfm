object frmEAT: TfrmEAT
  Width = 458
  Height = 499
  Caption = 'EduAssetTracker'
  OnCreate = WebFormCreate
  OnDestroy = WebFormDestroy
  OnShow = WebFormShow
  OnUnload = WebFormUnload
  object pc: TWebPageControl
    Left = 0
    Top = 0
    Width = 458
    Height = 499
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alClient
    ChildOrder = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabIndex = 1
    ParentFont = False
    TabOrder = 0
    object tsWelcome: TWebTabSheet
      Left = 0
      Top = 20
      Width = 458
      Height = 479
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Welcome'
      DesignSize = (
        458
        479)
      object lblFirstAccess: TWebLabel
        Left = 8
        Top = 456
        Width = 314
        Height = 13
        Anchors = [akLeft, akRight, akBottom]
        AutoSize = False
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object btnWelcomeContinue: TWebButton
        Left = 159
        Top = 5
        Width = 96
        Height = 38
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Continue'
        ChildOrder = 4
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnWelcomeContinueClick
      end
      object btnWelcomeResetFirstAccess: TWebButton
        Left = 328
        Top = 451
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
        Width = 444
        Height = 402
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
      Width = 458
      Height = 479
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Scan Asset'
      ChildOrder = 1
      OnHide = tsScanAssetHide
      OnShow = tsScanAssetShow
      object pnlCam: TWebPanel
        Left = 0
        Top = 33
        Width = 458
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
          Width = 450
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
        Width = 458
        Height = 196
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
          458
          196)
        object WebLabel1: TWebLabel
          Left = 13
          Top = 10
          Width = 32
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'TagId:'
          Color = clBtnFace
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
        end
        object WebLabel6: TWebLabel
          Left = 13
          Top = 34
          Width = 44
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'TagText:'
          Color = clBtnFace
          HeightPercent = 100.000000000000000000
          WidthPercent = 100.000000000000000000
        end
        object memScanAsset: TWebMemo
          Left = 8
          Top = 88
          Width = 442
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
          Top = 30
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
          Top = 6
          Width = 230
          Height = 22
          Anchors = [akLeft, akBottom]
          ChildOrder = 3
          HeightPercent = 100.000000000000000000
          Text = 'edtTagId'
          WidthPercent = 100.000000000000000000
        end
      end
      object pnlScanHeader: TWebPanel
        Left = 0
        Top = 0
        Width = 458
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
        Top = 453
        Width = 458
        Height = 26
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Align = alBottom
        BorderColor = clSilver
        BorderStyle = bsSingle
        ChildOrder = 3
        DesignSize = (
          458
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
          Width = 357
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
      Width = 458
      Height = 479
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
      Width = 458
      Height = 479
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Log'
      ChildOrder = 3
      object memLog: TWebMemo
        Left = 0
        Top = 0
        Width = 458
        Height = 479
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
      Width = 458
      Height = 479
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Development'
      ChildOrder = 4
      DesignSize = (
        458
        479)
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
        Left = 8
        Top = 367
        Width = 439
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
        Top = 355
        Width = 458
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
    end
  end
  object QRCodeGoogleAPIs: TWebHttpRequest
    Headers.Strings = (
      'Cache-Control=no-cache, no-store, must-revalidate')
    OnResponse = QRCodeGoogleAPIsResponse
    Left = 256
    Top = 215
  end
  object qrDecode: TWebQRDecoder
    Camera = cam
    OnDecoded = qrDecodeDecoded
    Left = 32
    Top = 389
  end
  object tmrQRDetectPause: TWebTimer
    Enabled = False
    Interval = 3000
    OnTimer = tmrQRDetectPauseTimer
    Left = 64
    Top = 349
  end
  object toastAsset: TWebToast
    Items = <>
    Position = tpTopLeft
    Left = 360
    Top = 444
  end
end
