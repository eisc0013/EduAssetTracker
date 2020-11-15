object frmEAT: TfrmEAT
  Width = 456
  Height = 628
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object WebLabel1: TWebLabel
    Left = 8
    Top = 109
    Width = 72
    Height = 13
    Caption = '# of QR Codes'
    HeightPercent = 100.000000000000000000
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
  object pnlAssetType: TWebPanel
    Left = 0
    Top = 504
    Width = 456
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
  object edtQRCodeCount: TWebEdit
    Left = 86
    Top = 106
    Width = 121
    Height = 22
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    Text = '12'
    WidthPercent = 100.000000000000000000
  end
  object btnMakeQRCodes: TWebButton
    Left = 58
    Top = 144
    Width = 96
    Height = 25
    Caption = 'Create PDF'
    ChildOrder = 3
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnMakeQRCodesClick
  end
  object btnQRCodeGoogle: TWebButton
    Left = 272
    Top = 175
    Width = 96
    Height = 25
    Caption = 'btnQRCodeGoogle'
    ChildOrder = 4
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnQRCodeGoogleClick
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
  object btnQRCodeSheet: TWebButton
    Left = 239
    Top = 144
    Width = 129
    Height = 25
    Caption = 'Create QR Code Sheet'
    ChildOrder = 9
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnQRCodeSheetClick
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
  object edtAssetId: TWebEdit
    Left = 8
    Top = 308
    Width = 425
    Height = 22
    ChildOrder = 11
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebDBGrid1: TWebDBGrid
    Left = 8
    Top = 367
    Width = 437
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
    TabOrder = 9
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ColWidths = (
      24
      64
      64
      64
      64)
  end
  object QRCodeGoogleAPIs: TWebHttpRequest
    Headers.Strings = (
      'Cache-Control=no-cache, no-store, must-revalidate')
    OnResponse = QRCodeGoogleAPIsResponse
    Left = 256
    Top = 215
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
end
