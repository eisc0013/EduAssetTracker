object frmEAT: TfrmEAT
  Width = 458
  Height = 946
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object WebPageControl1: TWebPageControl
    Left = 0
    Top = 0
    Width = 458
    Height = 497
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ChildOrder = 13
    TabIndex = 1
    TabOrder = 0
    object tsDev: TWebTabSheet
      Left = 0
      Top = 20
      Width = 458
      Height = 477
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Development'
      DesignSize = (
        458
        477)
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
      object WebButton1: TWebButton
        Left = 104
        Top = 29
        Width = 169
        Height = 36
        Caption = 'Create QR Code Sheet JSON'
        ChildOrder = 9
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = WebButton1Click
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
      object edtAssetId: TWebEdit
        Left = 8
        Top = 308
        Width = 425
        Height = 22
        ChildOrder = 11
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object btnRegExTest: TWebButton
        Left = 56
        Top = 336
        Width = 96
        Height = 25
        Caption = 'btnRegExTest'
        ChildOrder = 8
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnRegExTestClick
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
        DataSource = dsAssetType
        FixedCols = 1
        TabOrder = 5
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 437
        ColWidths = (
          24
          64
          64
          64
          64)
      end
      object pnlAssetType: TWebPanel
        Left = 0
        Top = 353
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
        ExplicitTop = 504
        ExplicitWidth = 456
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
          DataSource = dsAssetType
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
          DataSource = dsAssetType
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
          DataSource = dsAssetType
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
        Left = 160
        Top = 144
        Width = 50
        Height = 50
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Text = 'https://ynotwidgets.com'
      end
    end
    object tsScanAsset: TWebTabSheet
      Left = 0
      Top = 20
      Width = 458
      Height = 477
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
          ExplicitLeft = 47
          ExplicitTop = 5
          ExplicitWidth = 400
          ExplicitHeight = 300
        end
      end
      object WebPanel2: TWebPanel
        Left = 0
        Top = 257
        Width = 458
        Height = 220
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        Align = alClient
        BorderColor = clSilver
        BorderStyle = bsSingle
        Caption = 'WebPanel2'
        ChildOrder = 1
        Padding.Left = 8
        Padding.Top = 8
        Padding.Right = 8
        Padding.Bottom = 8
        ExplicitLeft = 3
        ExplicitTop = 308
        ExplicitWidth = 150
        ExplicitHeight = 60
        object WebMemo1: TWebMemo
          Left = 8
          Top = 8
          Width = 442
          Height = 204
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Align = alClient
          AutoSize = False
          HeightPercent = 100.000000000000000000
          Lines.Strings = (
            'WebMemo1')
          SelLength = 0
          SelStart = 0
          WidthPercent = 100.000000000000000000
          ExplicitLeft = 16
          ExplicitTop = 6
          ExplicitWidth = 185
          ExplicitHeight = 89
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
    end
    object WebPageControl1Sheet3: TWebTabSheet
      Left = 0
      Top = 20
      Width = 458
      Height = 477
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'WebPageControl1Sheet3'
      ChildOrder = 2
    end
  end
  object WebButton3: TWebButton
    Left = 160
    Top = 520
    Width = 96
    Height = 25
    Caption = 'WebButton3'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton3Click
  end
  object XDataWebClient1: TXDataWebClient
    Connection = XDataWebConnection1
    OnLoad = XDataWebClient1Load
    Left = 200
    Top = 400
  end
  object XDataWebConnection1: TXDataWebConnection
    URL = 'https://eduassettracker.ynotwidgets.com/api/'
    Left = 80
    Top = 408
  end
  object tAssetType: TXDataWebDataSet
    AfterOpen = tAssetTypeAfterOpen
    EntitySetName = 'tAssetType'
    Connection = XDataWebConnection1
    ServerRecordCountMode = smInlineCount
    Left = 304
    Top = 416
    object tAssetTypeid: TStringField
      FieldName = 'id'
      ReadOnly = True
      Required = True
      Size = 38
    end
    object tAssetTypename: TStringField
      FieldName = 'name'
      Size = 96
    end
    object tAssetTypedescription: TStringField
      FieldName = 'description'
      Size = 2047
    end
    object tAssetTypedeactivatedDate: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsAssetType: TWebDataSource
    DataSet = tAssetType
    Enabled = False
    Left = 360
    Top = 416
  end
  object QRCodeGoogleAPIs: TWebHttpRequest
    Headers.Strings = (
      'Cache-Control=no-cache, no-store, must-revalidate')
    OnResponse = QRCodeGoogleAPIsResponse
    Left = 256
    Top = 215
  end
  object WebQRDecoder1: TWebQRDecoder
    Camera = cam
    EnableTimer = True
    OnDecoded = WebQRDecoder1Decoded
    Left = 56
    Top = 581
  end
end
