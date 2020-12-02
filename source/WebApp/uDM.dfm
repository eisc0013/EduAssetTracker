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
    ReferenceSolvingMode = rsNone
    Left = 16
    Top = 56
  end
  object tAssetType: TXDataWebDataSet
    AfterOpen = tAssetTypeAfterOpen
    AfterPost = DataSetAfterPost
    EntitySetName = 'tAssetType'
    Connection = XDataConn
    ServerRecordCountMode = smInlineCount
    Left = 248
    Top = 64
    object tAssetTypeid: TStringField
      FieldName = 'id'
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
    AfterPost = DataSetAfterPost
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
  object tPerson: TXDataWebDataSet
    AfterOpen = tPersonAfterOpen
    AfterPost = DataSetAfterPost
    EntitySetName = 'tPerson'
    Connection = XDataConn
    ServerRecordCountMode = smInlineCount
    Left = 248
    Top = 120
    object tPersonid: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object tPersonname: TStringField
      FieldName = 'name'
      Size = 96
    end
    object tPersonemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object tPersondeactivatedDate: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsPerson: TWebDataSource
    DataSet = tPerson
    Left = 312
    Top = 120
  end
  object tRoom: TXDataWebDataSet
    AfterOpen = tRoomAfterOpen
    AfterPost = DataSetAfterPost
    EntitySetName = 'tRoom'
    Connection = XDataConn
    ServerRecordCountMode = smInlineCount
    Left = 248
    Top = 176
    object tRoompersonId: TXDataWebEntityField
      FieldName = 'personId'
    end
    object tRoombuildingId: TXDataWebEntityField
      FieldName = 'buildingId'
    end
    object tRoomid: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object tRoomnameplate: TStringField
      FieldName = 'nameplate'
      Size = 24
    end
    object tRoomgrade: TStringField
      FieldName = 'grade'
      Size = 24
    end
    object tRoomdeactivatedDate: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsRoom: TWebDataSource
    DataSet = tRoom
    Left = 312
    Top = 176
  end
  object tBuilding: TXDataWebDataSet
    AfterOpen = tBuildingAfterOpen
    BeforeInsert = DataSetBeforeInsertEdit
    AfterPost = DataSetAfterPost
    EntitySetName = 'tBuilding'
    Connection = XDataConn
    ServerRecordCountMode = smInlineCount
    Left = 248
    Top = 232
    object tBuildingid: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object tBuildingname: TStringField
      FieldName = 'name'
      Size = 50
    end
    object tBuildingphone: TStringField
      FieldName = 'phone'
      Size = 50
    end
    object tBuildingaddress: TStringField
      FieldName = 'address'
      Size = 1024
    end
    object tBuildingdeactivatedDate: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsBuilding: TWebDataSource
    DataSet = tBuilding
    Left = 312
    Top = 232
  end
  object tVendor: TXDataWebDataSet
    AfterOpen = tVendorAfterOpen
    BeforeInsert = DataSetBeforeInsertEdit
    AfterPost = DataSetAfterPost
    EntitySetName = 'tVendor'
    Connection = XDataConn
    ServerRecordCountMode = smInlineCount
    Left = 248
    Top = 288
    object tVendorid: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object tVendorname: TStringField
      FieldName = 'name'
      Size = 128
    end
    object tVendorwebsite: TStringField
      FieldName = 'website'
      Size = 2047
    end
    object tVendoremail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object tVendorphone: TStringField
      FieldName = 'phone'
      Size = 48
    end
    object tVendornotes: TStringField
      FieldName = 'notes'
      Size = 2047
    end
    object tVendordeactivatedDate: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsVendor: TWebDataSource
    DataSet = tVendor
    Left = 312
    Top = 288
  end
  object tDocuments: TXDataWebDataSet
    AfterOpen = tDocumentsAfterOpen
    BeforeInsert = DataSetBeforeInsertEdit
    AfterPost = DataSetAfterPost
    EntitySetName = 'tDocuments'
    Connection = XDataConn
    ServerRecordCountMode = smInlineCount
    Left = 248
    Top = 344
    object tDocumentsid: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object tDocumentsprivate_: TIntegerField
      FieldName = 'private_'
    end
    object tDocumentsurl: TStringField
      FieldName = 'url'
      Size = 2047
    end
    object tDocumentssizeBytes: TIntegerField
      FieldName = 'sizeBytes'
    end
    object tDocumentsdeactivatedDate: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsDocuments: TWebDataSource
    DataSet = tDocuments
    Left = 312
    Top = 344
  end
  object tAssetDocuments: TXDataWebDataSet
    AfterOpen = tAssetDocumentsAfterOpen
    AfterPost = DataSetAfterPost
    EntitySetName = 'tAssetDocuments'
    Connection = XDataConn
    ServerRecordCountMode = smInlineCount
    Left = 248
    Top = 400
    object tAssetDocumentsassetId: TXDataWebEntityField
      FieldName = 'assetId'
    end
    object tAssetDocumentsdocumentId: TXDataWebEntityField
      FieldName = 'documentId'
    end
    object tAssetDocumentsid: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
  end
  object dsAssetDocuments: TWebDataSource
    DataSet = tAssetDocuments
    Left = 312
    Top = 400
  end
end
