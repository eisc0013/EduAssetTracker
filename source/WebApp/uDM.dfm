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
    Top = 64
  end
  object tAssetType: TXDataWebDataSet
    AfterOpen = tAssetTypeAfterOpen
    AfterPost = DataSetAfterPost
    EntitySetName = 'tAssetType'
    Connection = XDataConn
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
    AfterPost = DataSetAfterPost
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
  object tTagsList: TXDataWebDataSet
    AfterOpen = tTagsListAfterOpen
    EntitySetName = 'tTags'
    Connection = XDataConn
    Left = 512
    Top = 8
    object StringField1: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object StringField2: TStringField
      FieldName = 'tagText'
      Size = 2047
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsTagsList: TWebDataSource
    AutoEdit = False
    DataSet = tTagsList
    Left = 576
    Top = 8
  end
  object tAssetTypeList: TXDataWebDataSet
    AfterOpen = tAssetTypeListAfterOpen
    EntitySetName = 'tAssetType'
    Connection = XDataConn
    Left = 512
    Top = 64
    object StringField3: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object StringField4: TStringField
      FieldName = 'name'
      Size = 96
    end
    object StringField5: TStringField
      FieldName = 'description'
      Size = 2047
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsAssetTypeList: TWebDataSource
    AutoEdit = False
    DataSet = tAssetTypeList
    Left = 576
    Top = 64
  end
  object tPersonList: TXDataWebDataSet
    AfterOpen = tPersonListAfterOpen
    EntitySetName = 'tPerson'
    Connection = XDataConn
    Left = 512
    Top = 120
    object StringField6: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object StringField7: TStringField
      FieldName = 'name'
      Size = 96
    end
    object StringField8: TStringField
      FieldName = 'email'
      Size = 128
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsPersonList: TWebDataSource
    AutoEdit = False
    DataSet = tPersonList
    Left = 576
    Top = 120
  end
  object tRoomList: TXDataWebDataSet
    AfterOpen = tRoomListAfterOpen
    EntitySetName = 'tRoom'
    Connection = XDataConn
    Left = 512
    Top = 176
    object XDataWebEntityField1: TXDataWebEntityField
      FieldName = 'personId'
    end
    object XDataWebEntityField2: TXDataWebEntityField
      FieldName = 'buildingId'
    end
    object StringField9: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object StringField10: TStringField
      FieldName = 'nameplate'
      Size = 24
    end
    object StringField11: TStringField
      FieldName = 'grade'
      Size = 24
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsRoomList: TWebDataSource
    AutoEdit = False
    DataSet = tRoomList
    Left = 576
    Top = 176
  end
  object tBuildingList: TXDataWebDataSet
    AfterOpen = tBuildingListAfterOpen
    EntitySetName = 'tBuilding'
    Connection = XDataConn
    Left = 512
    Top = 232
    object StringField12: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object StringField13: TStringField
      FieldName = 'name'
      Size = 50
    end
    object StringField14: TStringField
      FieldName = 'phone'
      Size = 50
    end
    object StringField15: TStringField
      FieldName = 'address'
      Size = 1024
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsBuildingList: TWebDataSource
    AutoEdit = False
    DataSet = tBuildingList
    Left = 576
    Top = 232
  end
  object tVendorList: TXDataWebDataSet
    AfterOpen = tVendorListAfterOpen
    EntitySetName = 'tVendor'
    Connection = XDataConn
    Left = 512
    Top = 288
    object StringField16: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object StringField17: TStringField
      FieldName = 'name'
      Size = 128
    end
    object StringField18: TStringField
      FieldName = 'website'
      Size = 2047
    end
    object StringField19: TStringField
      FieldName = 'email'
      Size = 128
    end
    object StringField20: TStringField
      FieldName = 'phone'
      Size = 48
    end
    object StringField21: TStringField
      FieldName = 'notes'
      Size = 2047
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsVendorList: TWebDataSource
    AutoEdit = False
    DataSet = tVendorList
    Left = 576
    Top = 288
  end
  object tAssetNA: TXDataWebDataSet
    AfterOpen = tAssetNAAfterOpen
    AfterPost = DataSetAfterPost
    EntitySetName = 'tAssetNA'
    Connection = XDataConn
    Left = 88
    Top = 64
    object XDataWebEntityField3: TXDataWebEntityField
      FieldName = 'tagId'
    end
    object XDataWebEntityField4: TXDataWebEntityField
      FieldName = 'roomId'
    end
    object XDataWebEntityField5: TXDataWebEntityField
      FieldName = 'typeId'
    end
    object XDataWebEntityField6: TXDataWebEntityField
      FieldName = 'vendorId'
    end
    object StringField22: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object StringField23: TStringField
      FieldName = 'make'
      Size = 50
    end
    object StringField24: TStringField
      FieldName = 'model'
      Size = 50
    end
    object StringField25: TStringField
      FieldName = 'serialNumber'
      Size = 50
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'purchaseDate'
    end
    object StringField26: TStringField
      FieldName = 'purchaseInvoice'
      Size = 50
    end
    object IntegerField1: TIntegerField
      FieldName = 'purchasePrice'
    end
    object IntegerField2: TIntegerField
      FieldName = 'warrantyDurationDays'
    end
    object StringField27: TStringField
      FieldName = 'purchaseNotes'
      Size = 2047
    end
    object StringField28: TStringField
      FieldName = 'notes'
      Size = 2047
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsAssetNA: TWebDataSource
    DataSet = tAssetNA
    Left = 144
    Top = 64
  end
  object tRoomNA: TXDataWebDataSet
    AfterOpen = tRoomNAAfterOpen
    AfterPost = DataSetAfterPost
    EntitySetName = 'tRoomNA'
    Connection = XDataConn
    Left = 80
    Top = 176
    object XDataWebEntityField7: TXDataWebEntityField
      FieldName = 'personId'
    end
    object XDataWebEntityField8: TXDataWebEntityField
      FieldName = 'buildingId'
    end
    object StringField29: TStringField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object StringField30: TStringField
      FieldName = 'nameplate'
      Size = 24
    end
    object StringField31: TStringField
      FieldName = 'grade'
      Size = 24
    end
    object DateTimeField9: TDateTimeField
      FieldName = 'deactivatedDate'
    end
  end
  object dsRoomNA: TWebDataSource
    DataSet = tRoomNA
    Left = 144
    Top = 176
  end
end
