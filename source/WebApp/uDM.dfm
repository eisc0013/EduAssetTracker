object dm: Tdm
  OldCreateOrder = False
  Height = 476
  Width = 857
  object XDataConn: TXDataWebConnection
    URL = 'https://eduassettracker.ynotwidgets.com/api/'
    OnConnect = XDataConnConnect
    Left = 16
    Top = 8
  end
  object XDataClient: TXDataWebClient
    Connection = XDataConn
    OnLoad = XDataClientLoad
    Left = 16
    Top = 56
  end
  object tAssetType: TXDataWebDataSet
    AfterOpen = tAssetTypeAfterOpen
    EntitySetName = 'tAssetType'
    Connection = XDataConn
    ServerRecordCountMode = smInlineCount
    Left = 248
    Top = 64
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
    Left = 312
    Top = 64
  end
  object dsEATClient: TWebDataSource
    DataSet = dbEATClient
    Left = 80
    Top = 428
  end
  object dbEATClient: TWebIndexedDbClientDataset
    IDBDatabaseName = 'YnotWidgets'
    IDBObjectStoreName = 'TGPEduAssetTracker'
    IDBKeyFieldName = 'name'
    IDBAutoIncrement = True
    Params = <>
    AfterOpen = dbEATClientAfterOpen
    Left = 16
    Top = 428
    object dbEATClientname: TStringField
      FieldName = 'name'
      Size = 128
    end
    object dbEATClientsettings: TStringField
      FieldName = 'value'
      Size = 8192
    end
  end
  object tTags: TXDataWebDataSet
    AfterOpen = tTagsAfterOpen
    EntitySetName = 'tTags'
    Connection = XDataConn
    Left = 248
    Top = 8
    object tTagsid: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object tTagstagText: TStringField
      FieldName = 'tagText'
      Size = 2047
    end
    object tTagsdeactivatedDate: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsTags: TWebDataSource
    DataSet = tTags
    Left = 312
    Top = 8
  end
  object tAsset: TXDataWebDataSet
    AfterOpen = tAssetAfterOpen
    EntitySetName = 'tAsset'
    Connection = XDataConn
    Left = 88
    Top = 8
    object tAssettagId: TXDataWebEntityField
      FieldName = 'tagId'
    end
    object tAssetroomId: TXDataWebEntityField
      FieldName = 'roomId'
    end
    object tAssettypeId2: TXDataWebEntityField
      FieldName = 'typeId'
    end
    object tAssetvendorId: TXDataWebEntityField
      FieldName = 'vendorId'
    end
    object tAssetid: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object tAssetmake: TStringField
      FieldName = 'make'
      Size = 50
    end
    object tAssetmodel: TStringField
      FieldName = 'model'
      Size = 50
    end
    object tAssetserialNumber: TStringField
      FieldName = 'serialNumber'
      Size = 50
    end
    object tAssetpurchaseDate: TDateTimeField
      FieldName = 'purchaseDate'
    end
    object tAssetpurchaseInvoice: TStringField
      FieldName = 'purchaseInvoice'
      Size = 50
    end
    object tAssetpurchasePrice: TIntegerField
      FieldName = 'purchasePrice'
    end
    object tAssetwarrantyDurationDays: TIntegerField
      FieldName = 'warrantyDurationDays'
    end
    object tAssetpurchaseNotes: TStringField
      FieldName = 'purchaseNotes'
      Size = 2047
    end
    object tAssetnotes: TStringField
      FieldName = 'notes'
      Size = 2047
    end
    object tAssetdeactivatedDate: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsAsset: TWebDataSource
    DataSet = tAsset
    Left = 144
    Top = 8
  end
end
