object frmEAT: TfrmEAT
  Width = 640
  Height = 480
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object WebLabel1: TWebLabel
    Left = 8
    Top = 8
    Width = 72
    Height = 13
    Caption = '# of QR Codes'
  end
  object imgQRCode: TWebImageControl
    Left = 470
    Top = 208
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
  object QRCode: TWebQRCode
    Left = 160
    Top = 144
    Width = 50
    Height = 50
    Text = 'https://ynotwidgets.com'
  end
  object edtQRCodeCount: TWebEdit
    Left = 86
    Top = 5
    Width = 121
    Height = 22
    ChildOrder = 1
    Text = '12'
  end
  object btnMakeQRCodes: TWebButton
    Left = 64
    Top = 56
    Width = 96
    Height = 25
    Caption = 'Create PDF'
    ChildOrder = 3
    OnClick = btnMakeQRCodesClick
  end
  object btnQRCodeGoogle: TWebButton
    Left = 424
    Top = 160
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
  object QRCodeGoogleAPIs: TWebHttpRequest
    Headers.Strings = (
      'Cache-Control=no-cache, no-store, must-revalidate')
    OnResponse = QRCodeGoogleAPIsResponse
    Left = 408
    Top = 200
  end
end
