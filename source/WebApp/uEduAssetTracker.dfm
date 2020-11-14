object frmEAT: TfrmEAT
  Width = 456
  Height = 480
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object WebLabel1: TWebLabel
    Left = 8
    Top = 109
    Width = 72
    Height = 13
    Caption = '# of QR Codes'
  end
  object imgQRCode: TWebImageControl
    Left = 318
    Top = 223
    Width = 50
    Height = 50
    ChildOrder = 5
    URL = 
      'https://chart.googleapis.com/chart?cht=qr&chs=50x50&chl=https%3A' +
      '%2F%2Ftgp.net%2FXYZCde%2Fabc%2F123e4567-e89b-12d3-a456-426614174' +
      '000'
  end
  object WebLabel2: TWebLabel
    Left = 40
    Top = 296
    Width = 41
    Height = 13
    Caption = 'AssetId:'
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
    ParentFont = False
  end
  object QRCode: TWebQRCode
    Left = 160
    Top = 144
    Width = 50
    Height = 50
    Text = 'https://ynotwidgets.com'
  end
  object edtQRCodeCount: TWebEdit
    Left = 86
    Top = 106
    Width = 121
    Height = 22
    ChildOrder = 1
    Text = '12'
  end
  object btnMakeQRCodes: TWebButton
    Left = 58
    Top = 144
    Width = 96
    Height = 25
    Caption = 'Create PDF'
    ChildOrder = 3
    OnClick = btnMakeQRCodesClick
  end
  object btnQRCodeGoogle: TWebButton
    Left = 272
    Top = 175
    Width = 96
    Height = 25
    Caption = 'btnQRCodeGoogle'
    ChildOrder = 4
    OnClick = btnQRCodeGoogleClick
  end
  object edtAssetId: TWebEdit
    Left = 87
    Top = 293
    Width = 345
    Height = 22
    ChildOrder = 6
    Text = 'edtAssetId'
  end
  object btnRegExTest: TWebButton
    Left = 56
    Top = 336
    Width = 96
    Height = 25
    Caption = 'btnRegExTest'
    ChildOrder = 8
    OnClick = btnRegExTestClick
  end
  object btnQRCodeSheet: TWebButton
    Left = 239
    Top = 144
    Width = 129
    Height = 25
    Caption = 'Create QR Code Sheet'
    ChildOrder = 9
    OnClick = btnQRCodeSheetClick
  end
  object WebButton1: TWebButton
    Left = 104
    Top = 29
    Width = 169
    Height = 36
    Caption = 'Create QR Code Sheet JSON'
    ChildOrder = 9
    OnClick = WebButton1Click
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
    Left = 200
    Top = 400
  end
  object XDataWebConnection1: TXDataWebConnection
    URL = 'https://eduassettracker.ynotwidgets.com/api/'
    Left = 80
    Top = 408
  end
end
