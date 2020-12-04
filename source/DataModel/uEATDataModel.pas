unit uEATDataModel;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy, 
  Aurelius.Criteria.Dictionary;

type
  TtAsset = class;
  TtAssetNA = class; // ALE 20201203 associations skipped so we can post easily
  TtAssetDocuments = class;
  TtAssetType = class;
  TtBuilding = class;
  TtDocuments = class;
  TtLog = class;
  TtPerson = class;
  TtRoom = class;
  TtTags = class;
  TtVendor = class;
  TtLogTableDictionary = class;
  TtTagsTableDictionary = class;
  TtAssetTableDictionary = class;
  TtDocumentsTableDictionary = class;
  TtAssetDocumentsTableDictionary = class;
  TtPersonTableDictionary = class;
  TtBuildingTableDictionary = class;
  TtRoomTableDictionary = class;
  TtAssetTypeTableDictionary = class;
  TtVendorTableDictionary = class;
  
  [Entity]
  [Table('tAsset')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtAsset = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;

    [Column('make', [], 50)]
    [Description('')]
    Fmake: Nullable<string>;

    [Column('model', [], 50)]
    [Description('')]
    Fmodel: Nullable<string>;

    [Column('serialNumber', [], 50)]
    [Description('')]
    FserialNumber: Nullable<string>;

    [Column('purchaseDate', [])]
    [Description('')]
    FpurchaseDate: Nullable<TDateTime>;

    [Column('purchaseInvoice', [], 50)]
    [Description('')]
    FpurchaseInvoice: Nullable<string>;

    [Column('purchasePrice', [])]
    [Description('To calculate cost/month or similar metrics over the lifetime of various makes and models')]
    FpurchasePrice: Nullable<Integer>;

    [Column('warrantyDurationDays', [])]
    [Description('')]
    FwarrantyDurationDays: Nullable<Integer>;

    [Column('purchaseNotes', [], 2047)]
    [Description('Meant for information such as "used Scholastic bucks for purchase"')]
    FpurchaseNotes: Nullable<string>;

    [Column('notes', [], 2047)]
    [Description('')]
    Fnotes: Nullable<string>;

    [Column('deactivatedDate', [])]
    [Description('')]
    FdeactivatedDate: Nullable<TDateTime>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('tagId', [], 'id')]
    [Description('')]
    FtagId: Proxy<TtTags>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('roomId', [], 'id')]
    [Description('')]
    FroomId: Proxy<TtRoom>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('typeId', [], 'id')]
    [Description('')]
    FtypeId: Proxy<TtAssetType>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('vendorId', [], 'id')]
    [Description('')]
    FvendorId: Proxy<TtVendor>;
    function GettagId: TtTags;
    procedure SettagId(const Value: TtTags);
    function GetroomId: TtRoom;
    procedure SetroomId(const Value: TtRoom);
    function GettypeId: TtAssetType;
    procedure SettypeId(const Value: TtAssetType);
    function GetvendorId: TtVendor;
    procedure SetvendorId(const Value: TtVendor);
  public
    property id: TGuid read Fid write Fid;
    property make: Nullable<string> read Fmake write Fmake;
    property model: Nullable<string> read Fmodel write Fmodel;
    property serialNumber: Nullable<string> read FserialNumber write FserialNumber;
    property purchaseDate: Nullable<TDateTime> read FpurchaseDate write FpurchaseDate;
    property purchaseInvoice: Nullable<string> read FpurchaseInvoice write FpurchaseInvoice;
    property purchasePrice: Nullable<Integer> read FpurchasePrice write FpurchasePrice;
    property warrantyDurationDays: Nullable<Integer> read FwarrantyDurationDays write FwarrantyDurationDays;
    property purchaseNotes: Nullable<string> read FpurchaseNotes write FpurchaseNotes;
    property notes: Nullable<string> read Fnotes write Fnotes;
    property deactivatedDate: Nullable<TDateTime> read FdeactivatedDate write FdeactivatedDate;
    property tagId: TtTags read GettagId write SettagId;
    property roomId: TtRoom read GetroomId write SetroomId;
    property typeId: TtAssetType read GettypeId write SettypeId;
    property vendorId: TtVendor read GetvendorId write SetvendorId;
  end;

  [Entity]
  [Table('tAsset')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtAssetNA = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;

    [Column('make', [], 50)]
    [Description('')]
    Fmake: Nullable<string>;

    [Column('model', [], 50)]
    [Description('')]
    Fmodel: Nullable<string>;

    [Column('serialNumber', [], 50)]
    [Description('')]
    FserialNumber: Nullable<string>;

    [Column('purchaseDate', [])]
    [Description('')]
    FpurchaseDate: Nullable<TDateTime>;

    [Column('purchaseInvoice', [], 50)]
    [Description('')]
    FpurchaseInvoice: Nullable<string>;

    [Column('purchasePrice', [])]
    [Description('To calculate cost/month or similar metrics over the lifetime of various makes and models')]
    FpurchasePrice: Nullable<Integer>;

    [Column('warrantyDurationDays', [])]
    [Description('')]
    FwarrantyDurationDays: Nullable<Integer>;

    [Column('purchaseNotes', [], 2047)]
    [Description('Meant for information such as "used Scholastic bucks for purchase"')]
    FpurchaseNotes: Nullable<string>;

    [Column('notes', [], 2047)]
    [Description('')]
    Fnotes: Nullable<string>;

    [Column('deactivatedDate', [])]
    [Description('')]
    FdeactivatedDate: Nullable<TDateTime>;

    [Column('tagId', [])]
    [Description('')]
    FtagId: Nullable<TGuid>;

    [Column('roomId', [])]
    [Description('')]
    FroomId: Nullable<TGuid>;

    [Column('typeId', [])]
    [Description('')]
    FtypeId: Nullable<TGuid>;

    [Column('vendorId', [])]
    [Description('')]
    FvendorId: Nullable<TGuid>;
  public
    property id: TGuid read Fid write Fid;
    property make: Nullable<string> read Fmake write Fmake;
    property model: Nullable<string> read Fmodel write Fmodel;
    property serialNumber: Nullable<string> read FserialNumber write FserialNumber;
    property purchaseDate: Nullable<TDateTime> read FpurchaseDate write FpurchaseDate;
    property purchaseInvoice: Nullable<string> read FpurchaseInvoice write FpurchaseInvoice;
    property purchasePrice: Nullable<Integer> read FpurchasePrice write FpurchasePrice;
    property warrantyDurationDays: Nullable<Integer> read FwarrantyDurationDays write FwarrantyDurationDays;
    property purchaseNotes: Nullable<string> read FpurchaseNotes write FpurchaseNotes;
    property notes: Nullable<string> read Fnotes write Fnotes;
    property deactivatedDate: Nullable<TDateTime> read FdeactivatedDate write FdeactivatedDate;
    property tagId: Nullable<TGuid> read FtagId write FtagId;
    property roomId: Nullable<TGuid> read FroomId write FroomId;
    property typeId: Nullable<TGuid> read FtypeId write FtypeId;
    property vendorId: Nullable<TGuid> read FvendorId write FvendorId;
  end;

  [Entity]
  [Table('tAssetDocuments')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtAssetDocuments = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('assetId', [], 'id')]
    [Description('')]
    FassetId: Proxy<TtAsset>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('documentId', [], 'id')]
    [Description('')]
    FdocumentId: Proxy<TtDocuments>;
    function GetassetId: TtAsset;
    procedure SetassetId(const Value: TtAsset);
    function GetdocumentId: TtDocuments;
    procedure SetdocumentId(const Value: TtDocuments);
  public
    property id: TGuid read Fid write Fid;
    property assetId: TtAsset read GetassetId write SetassetId;
    property documentId: TtDocuments read GetdocumentId write SetdocumentId;
  end;
  
  [Entity]
  [Table('tAssetType')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtAssetType = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;
    
    [Column('name', [], 96)]
    [Description('')]
    Fname: Nullable<string>;
    
    [Column('description', [], 2047)]
    [Description('Has microphone, 4GB RAM, ...')]
    Fdescription: Nullable<string>;
    
    [Column('deactivatedDate', [])]
    [Description('')]
    FdeactivatedDate: Nullable<TDateTime>;
  public
    property id: TGuid read Fid write Fid;
    property name: Nullable<string> read Fname write Fname;
    property description: Nullable<string> read Fdescription write Fdescription;
    property deactivatedDate: Nullable<TDateTime> read FdeactivatedDate write FdeactivatedDate;
  end;
  
  [Entity]
  [Table('tBuilding')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtBuilding = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;
    
    [Column('name', [], 50)]
    [Description('')]
    Fname: Nullable<string>;
    
    [Column('phone', [], 50)]
    [Description('')]
    Fphone: Nullable<string>;
    
    [Column('address', [], 1024)]
    [Description('')]
    Faddress: Nullable<string>;
    
    [Column('deactivatedDate', [])]
    [Description('')]
    FdeactivatedDate: Nullable<TDateTime>;
  public
    property id: TGuid read Fid write Fid;
    property name: Nullable<string> read Fname write Fname;
    property phone: Nullable<string> read Fphone write Fphone;
    property address: Nullable<string> read Faddress write Faddress;
    property deactivatedDate: Nullable<TDateTime> read FdeactivatedDate write FdeactivatedDate;
  end;
  
  [Entity]
  [Table('tDocuments')]
  [Description('This table is meant to store references to files hosted elsewhere such as photos of the assets, invoices, etc.')]
  [Id('Fid', TIdGenerator.Guid)]
  TtDocuments = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;
    
    [Column('private', [])]
    [Description('Has this tag been retired? 0 = No, 1 = Yes')]
    Fprivate_: Nullable<Integer>;
    
    [Column('url', [], 2047)]
    [Description('Reference to the document')]
    Furl: Nullable<string>;
    
    [Column('sizeBytes', [])]
    [Description('Size of the document in Bytes')]
    FsizeBytes: Nullable<Integer>;
    
    [Column('deactivatedDate', [])]
    [Description('')]
    FdeactivatedDate: Nullable<TDateTime>;
  public
    property id: TGuid read Fid write Fid;
    property private_: Nullable<Integer> read Fprivate_ write Fprivate_;
    property url: Nullable<string> read Furl write Furl;
    property sizeBytes: Nullable<Integer> read FsizeBytes write FsizeBytes;
    property deactivatedDate: Nullable<TDateTime> read FdeactivatedDate write FdeactivatedDate;
  end;
  
  [Entity]
  [Table('tLog')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtLog = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;
    
    [Column('table_name', [], 50)]
    [Description('Table with row that was changed')]
    Ftable_name: Nullable<string>;
    
    [Column('id_row', [])]
    [Description('')]
    Fid_row: Nullable<TGuid>;
    
    [Column('audit', [], 2047)]
    [Description('Lists the changes to the rows')]
    Faudit: Nullable<string>;
  public
    property id: TGuid read Fid write Fid;
    property table_name: Nullable<string> read Ftable_name write Ftable_name;
    property id_row: Nullable<TGuid> read Fid_row write Fid_row;
    property audit: Nullable<string> read Faudit write Faudit;
  end;
  
  [Entity]
  [Table('tPerson')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtPerson = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;
    
    [Column('name', [], 96)]
    [Description('')]
    Fname: Nullable<string>;
    
    [Column('email', [], 128)]
    [Description('')]
    Femail: Nullable<string>;
    
    [Column('deactivatedDate', [])]
    [Description('')]
    FdeactivatedDate: Nullable<TDateTime>;
  public
    property id: TGuid read Fid write Fid;
    property name: Nullable<string> read Fname write Fname;
    property email: Nullable<string> read Femail write Femail;
    property deactivatedDate: Nullable<TDateTime> read FdeactivatedDate write FdeactivatedDate;
  end;
  
  [Entity]
  [Table('tRoom')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtRoom = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;
    
    [Column('nameplate', [], 24)]
    [Description('Room number (101, 208, Media, Gym)')]
    Fnameplate: Nullable<string>;
    
    [Column('grade', [], 24)]
    [Description('K, 1, 2, 3, ...')]
    Fgrade: Nullable<string>;
    
    [Column('deactivatedDate', [])]
    [Description('')]
    FdeactivatedDate: Nullable<TDateTime>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('personId', [], 'id')]
    [Description('')]
    FpersonId: Proxy<TtPerson>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('buildingId', [], 'id')]
    [Description('')]
    FbuildingId: Proxy<TtBuilding>;
    function GetpersonId: TtPerson;
    procedure SetpersonId(const Value: TtPerson);
    function GetbuildingId: TtBuilding;
    procedure SetbuildingId(const Value: TtBuilding);
  public
    property id: TGuid read Fid write Fid;
    property nameplate: Nullable<string> read Fnameplate write Fnameplate;
    property grade: Nullable<string> read Fgrade write Fgrade;
    property deactivatedDate: Nullable<TDateTime> read FdeactivatedDate write FdeactivatedDate;
    property personId: TtPerson read GetpersonId write SetpersonId;
    property buildingId: TtBuilding read GetbuildingId write SetbuildingId;
  end;
  
  [Entity]
  [Table('tTags')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtTags = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;
    
    [Column('tagText', [], 2047)]
    [Description('')]
    FtagText: Nullable<string>;
    
    [Column('deactivatedDate', [])]
    [Description('')]
    FdeactivatedDate: Nullable<TDateTime>;
  public
    property id: TGuid read Fid write Fid;
    property tagText: Nullable<string> read FtagText write FtagText;
    property deactivatedDate: Nullable<TDateTime> read FdeactivatedDate write FdeactivatedDate;
  end;
  
  [Entity]
  [Table('tVendor')]
  [Description('')]
  [Id('Fid', TIdGenerator.Guid)]
  TtVendor = class
  private
    [Column('id', [TColumnProp.Required])]
    [Description('')]
    Fid: TGuid;
    
    [Column('name', [], 128)]
    [Description('')]
    Fname: Nullable<string>;
    
    [Column('website', [], 2047)]
    [Description('')]
    Fwebsite: Nullable<string>;
    
    [Column('email', [], 128)]
    [Description('')]
    Femail: Nullable<string>;
    
    [Column('phone', [], 48)]
    [Description('')]
    Fphone: Nullable<string>;
    
    [Column('notes', [], 2047)]
    [Description('')]
    Fnotes: Nullable<string>;
    
    [Column('deactivatedDate', [])]
    [Description('')]
    FdeactivatedDate: Nullable<TDateTime>;
  public
    property id: TGuid read Fid write Fid;
    property name: Nullable<string> read Fname write Fname;
    property website: Nullable<string> read Fwebsite write Fwebsite;
    property email: Nullable<string> read Femail write Femail;
    property phone: Nullable<string> read Fphone write Fphone;
    property notes: Nullable<string> read Fnotes write Fnotes;
    property deactivatedDate: Nullable<TDateTime> read FdeactivatedDate write FdeactivatedDate;
  end;
  
  TDicDictionary = class
  private
    FtLog: TtLogTableDictionary;
    FtTags: TtTagsTableDictionary;
    FtAsset: TtAssetTableDictionary;
    FtDocuments: TtDocumentsTableDictionary;
    FtAssetDocuments: TtAssetDocumentsTableDictionary;
    FtPerson: TtPersonTableDictionary;
    FtBuilding: TtBuildingTableDictionary;
    FtRoom: TtRoomTableDictionary;
    FtAssetType: TtAssetTypeTableDictionary;
    FtVendor: TtVendorTableDictionary;
    function GettLog: TtLogTableDictionary;
    function GettTags: TtTagsTableDictionary;
    function GettAsset: TtAssetTableDictionary;
    function GettDocuments: TtDocumentsTableDictionary;
    function GettAssetDocuments: TtAssetDocumentsTableDictionary;
    function GettPerson: TtPersonTableDictionary;
    function GettBuilding: TtBuildingTableDictionary;
    function GettRoom: TtRoomTableDictionary;
    function GettAssetType: TtAssetTypeTableDictionary;
    function GettVendor: TtVendorTableDictionary;
  public
    destructor Destroy; override;
    property tLog: TtLogTableDictionary read GettLog;
    property tTags: TtTagsTableDictionary read GettTags;
    property tAsset: TtAssetTableDictionary read GettAsset;
    property tDocuments: TtDocumentsTableDictionary read GettDocuments;
    property tAssetDocuments: TtAssetDocumentsTableDictionary read GettAssetDocuments;
    property tPerson: TtPersonTableDictionary read GettPerson;
    property tBuilding: TtBuildingTableDictionary read GettBuilding;
    property tRoom: TtRoomTableDictionary read GettRoom;
    property tAssetType: TtAssetTypeTableDictionary read GettAssetType;
    property tVendor: TtVendorTableDictionary read GettVendor;
  end;
  
  TtLogTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Ftable_name: TDictionaryAttribute;
    Fid_row: TDictionaryAttribute;
    Faudit: TDictionaryAttribute;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property table_name: TDictionaryAttribute read Ftable_name;
    property id_row: TDictionaryAttribute read Fid_row;
    property audit: TDictionaryAttribute read Faudit;
  end;
  
  TtTagsTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    FtagText: TDictionaryAttribute;
    FdeactivatedDate: TDictionaryAttribute;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property tagText: TDictionaryAttribute read FtagText;
    property deactivatedDate: TDictionaryAttribute read FdeactivatedDate;
  end;
  
  TtAssetTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Fmake: TDictionaryAttribute;
    Fmodel: TDictionaryAttribute;
    FserialNumber: TDictionaryAttribute;
    FpurchaseDate: TDictionaryAttribute;
    FpurchaseInvoice: TDictionaryAttribute;
    FpurchasePrice: TDictionaryAttribute;
    FwarrantyDurationDays: TDictionaryAttribute;
    FpurchaseNotes: TDictionaryAttribute;
    Fnotes: TDictionaryAttribute;
    FdeactivatedDate: TDictionaryAttribute;
    FtagId: TDictionaryAssociation;
    FroomId: TDictionaryAssociation;
    FtypeId: TDictionaryAssociation;
    FvendorId: TDictionaryAssociation;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property make: TDictionaryAttribute read Fmake;
    property model: TDictionaryAttribute read Fmodel;
    property serialNumber: TDictionaryAttribute read FserialNumber;
    property purchaseDate: TDictionaryAttribute read FpurchaseDate;
    property purchaseInvoice: TDictionaryAttribute read FpurchaseInvoice;
    property purchasePrice: TDictionaryAttribute read FpurchasePrice;
    property warrantyDurationDays: TDictionaryAttribute read FwarrantyDurationDays;
    property purchaseNotes: TDictionaryAttribute read FpurchaseNotes;
    property notes: TDictionaryAttribute read Fnotes;
    property deactivatedDate: TDictionaryAttribute read FdeactivatedDate;
    property tagId: TDictionaryAssociation read FtagId;
    property roomId: TDictionaryAssociation read FroomId;
    property typeId: TDictionaryAssociation read FtypeId;
    property vendorId: TDictionaryAssociation read FvendorId;
  end;
  
  TtDocumentsTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Fprivate_: TDictionaryAttribute;
    Furl: TDictionaryAttribute;
    FsizeBytes: TDictionaryAttribute;
    FdeactivatedDate: TDictionaryAttribute;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property private_: TDictionaryAttribute read Fprivate_;
    property url: TDictionaryAttribute read Furl;
    property sizeBytes: TDictionaryAttribute read FsizeBytes;
    property deactivatedDate: TDictionaryAttribute read FdeactivatedDate;
  end;
  
  TtAssetDocumentsTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    FassetId: TDictionaryAssociation;
    FdocumentId: TDictionaryAssociation;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property assetId: TDictionaryAssociation read FassetId;
    property documentId: TDictionaryAssociation read FdocumentId;
  end;
  
  TtPersonTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Fname: TDictionaryAttribute;
    Femail: TDictionaryAttribute;
    FdeactivatedDate: TDictionaryAttribute;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property name: TDictionaryAttribute read Fname;
    property email: TDictionaryAttribute read Femail;
    property deactivatedDate: TDictionaryAttribute read FdeactivatedDate;
  end;
  
  TtBuildingTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Fname: TDictionaryAttribute;
    Fphone: TDictionaryAttribute;
    Faddress: TDictionaryAttribute;
    FdeactivatedDate: TDictionaryAttribute;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property name: TDictionaryAttribute read Fname;
    property phone: TDictionaryAttribute read Fphone;
    property address: TDictionaryAttribute read Faddress;
    property deactivatedDate: TDictionaryAttribute read FdeactivatedDate;
  end;
  
  TtRoomTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Fnameplate: TDictionaryAttribute;
    Fgrade: TDictionaryAttribute;
    FdeactivatedDate: TDictionaryAttribute;
    FpersonId: TDictionaryAssociation;
    FbuildingId: TDictionaryAssociation;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property nameplate: TDictionaryAttribute read Fnameplate;
    property grade: TDictionaryAttribute read Fgrade;
    property deactivatedDate: TDictionaryAttribute read FdeactivatedDate;
    property personId: TDictionaryAssociation read FpersonId;
    property buildingId: TDictionaryAssociation read FbuildingId;
  end;
  
  TtAssetTypeTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Fname: TDictionaryAttribute;
    Fdescription: TDictionaryAttribute;
    FdeactivatedDate: TDictionaryAttribute;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property name: TDictionaryAttribute read Fname;
    property description: TDictionaryAttribute read Fdescription;
    property deactivatedDate: TDictionaryAttribute read FdeactivatedDate;
  end;
  
  TtVendorTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Fname: TDictionaryAttribute;
    Fwebsite: TDictionaryAttribute;
    Femail: TDictionaryAttribute;
    Fphone: TDictionaryAttribute;
    Fnotes: TDictionaryAttribute;
    FdeactivatedDate: TDictionaryAttribute;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property name: TDictionaryAttribute read Fname;
    property website: TDictionaryAttribute read Fwebsite;
    property email: TDictionaryAttribute read Femail;
    property phone: TDictionaryAttribute read Fphone;
    property notes: TDictionaryAttribute read Fnotes;
    property deactivatedDate: TDictionaryAttribute read FdeactivatedDate;
  end;
  
function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ TtAsset }

function TtAsset.GettagId: TtTags;
begin
  result := FtagId.Value;
end;

procedure TtAsset.SettagId(const Value: TtTags);
begin
  FtagId.Value := Value;
end;

function TtAsset.GetroomId: TtRoom;
begin
  result := FroomId.Value;
end;

procedure TtAsset.SetroomId(const Value: TtRoom);
begin
  FroomId.Value := Value;
end;

function TtAsset.GettypeId: TtAssetType;
begin
  result := FtypeId.Value;
end;

procedure TtAsset.SettypeId(const Value: TtAssetType);
begin
  FtypeId.Value := Value;
end;

function TtAsset.GetvendorId: TtVendor;
begin
  result := FvendorId.Value;
end;

procedure TtAsset.SetvendorId(const Value: TtVendor);
begin
  FvendorId.Value := Value;
end;

{ TtAssetDocuments }

function TtAssetDocuments.GetassetId: TtAsset;
begin
  result := FassetId.Value;
end;

procedure TtAssetDocuments.SetassetId(const Value: TtAsset);
begin
  FassetId.Value := Value;
end;

function TtAssetDocuments.GetdocumentId: TtDocuments;
begin
  result := FdocumentId.Value;
end;

procedure TtAssetDocuments.SetdocumentId(const Value: TtDocuments);
begin
  FdocumentId.Value := Value;
end;

{ TtRoom }

function TtRoom.GetpersonId: TtPerson;
begin
  result := FpersonId.Value;
end;

procedure TtRoom.SetpersonId(const Value: TtPerson);
begin
  FpersonId.Value := Value;
end;

function TtRoom.GetbuildingId: TtBuilding;
begin
  result := FbuildingId.Value;
end;

procedure TtRoom.SetbuildingId(const Value: TtBuilding);
begin
  FbuildingId.Value := Value;
end;

{ TDicDictionary }

destructor TDicDictionary.Destroy;
begin
  if FtVendor <> nil then FtVendor.Free;
  if FtAssetType <> nil then FtAssetType.Free;
  if FtRoom <> nil then FtRoom.Free;
  if FtBuilding <> nil then FtBuilding.Free;
  if FtPerson <> nil then FtPerson.Free;
  if FtAssetDocuments <> nil then FtAssetDocuments.Free;
  if FtDocuments <> nil then FtDocuments.Free;
  if FtAsset <> nil then FtAsset.Free;
  if FtTags <> nil then FtTags.Free;
  if FtLog <> nil then FtLog.Free;
  inherited;
end;

function TDicDictionary.GettLog: TtLogTableDictionary;
begin
  if FtLog = nil then FtLog := TtLogTableDictionary.Create;
  result := FtLog;
end;

function TDicDictionary.GettTags: TtTagsTableDictionary;
begin
  if FtTags = nil then FtTags := TtTagsTableDictionary.Create;
  result := FtTags;
end;

function TDicDictionary.GettAsset: TtAssetTableDictionary;
begin
  if FtAsset = nil then FtAsset := TtAssetTableDictionary.Create;
  result := FtAsset;
end;

function TDicDictionary.GettDocuments: TtDocumentsTableDictionary;
begin
  if FtDocuments = nil then FtDocuments := TtDocumentsTableDictionary.Create;
  result := FtDocuments;
end;

function TDicDictionary.GettAssetDocuments: TtAssetDocumentsTableDictionary;
begin
  if FtAssetDocuments = nil then FtAssetDocuments := TtAssetDocumentsTableDictionary.Create;
  result := FtAssetDocuments;
end;

function TDicDictionary.GettPerson: TtPersonTableDictionary;
begin
  if FtPerson = nil then FtPerson := TtPersonTableDictionary.Create;
  result := FtPerson;
end;

function TDicDictionary.GettBuilding: TtBuildingTableDictionary;
begin
  if FtBuilding = nil then FtBuilding := TtBuildingTableDictionary.Create;
  result := FtBuilding;
end;

function TDicDictionary.GettRoom: TtRoomTableDictionary;
begin
  if FtRoom = nil then FtRoom := TtRoomTableDictionary.Create;
  result := FtRoom;
end;

function TDicDictionary.GettAssetType: TtAssetTypeTableDictionary;
begin
  if FtAssetType = nil then FtAssetType := TtAssetTypeTableDictionary.Create;
  result := FtAssetType;
end;

function TDicDictionary.GettVendor: TtVendorTableDictionary;
begin
  if FtVendor = nil then FtVendor := TtVendorTableDictionary.Create;
  result := FtVendor;
end;

{ TtLogTableDictionary }

constructor TtLogTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Ftable_name := TDictionaryAttribute.Create('table_name');
  Fid_row := TDictionaryAttribute.Create('id_row');
  Faudit := TDictionaryAttribute.Create('audit');
end;

{ TtTagsTableDictionary }

constructor TtTagsTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  FtagText := TDictionaryAttribute.Create('tagText');
  FdeactivatedDate := TDictionaryAttribute.Create('deactivatedDate');
end;

{ TtAssetTableDictionary }

constructor TtAssetTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Fmake := TDictionaryAttribute.Create('make');
  Fmodel := TDictionaryAttribute.Create('model');
  FserialNumber := TDictionaryAttribute.Create('serialNumber');
  FpurchaseDate := TDictionaryAttribute.Create('purchaseDate');
  FpurchaseInvoice := TDictionaryAttribute.Create('purchaseInvoice');
  FpurchasePrice := TDictionaryAttribute.Create('purchasePrice');
  FwarrantyDurationDays := TDictionaryAttribute.Create('warrantyDurationDays');
  FpurchaseNotes := TDictionaryAttribute.Create('purchaseNotes');
  Fnotes := TDictionaryAttribute.Create('notes');
  FdeactivatedDate := TDictionaryAttribute.Create('deactivatedDate');
  FtagId := TDictionaryAssociation.Create('tagId');
  FroomId := TDictionaryAssociation.Create('roomId');
  FtypeId := TDictionaryAssociation.Create('typeId');
  FvendorId := TDictionaryAssociation.Create('vendorId');
end;

{ TtDocumentsTableDictionary }

constructor TtDocumentsTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Fprivate_ := TDictionaryAttribute.Create('private_');
  Furl := TDictionaryAttribute.Create('url');
  FsizeBytes := TDictionaryAttribute.Create('sizeBytes');
  FdeactivatedDate := TDictionaryAttribute.Create('deactivatedDate');
end;

{ TtAssetDocumentsTableDictionary }

constructor TtAssetDocumentsTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  FassetId := TDictionaryAssociation.Create('assetId');
  FdocumentId := TDictionaryAssociation.Create('documentId');
end;

{ TtPersonTableDictionary }

constructor TtPersonTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Fname := TDictionaryAttribute.Create('name');
  Femail := TDictionaryAttribute.Create('email');
  FdeactivatedDate := TDictionaryAttribute.Create('deactivatedDate');
end;

{ TtBuildingTableDictionary }

constructor TtBuildingTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Fname := TDictionaryAttribute.Create('name');
  Fphone := TDictionaryAttribute.Create('phone');
  Faddress := TDictionaryAttribute.Create('address');
  FdeactivatedDate := TDictionaryAttribute.Create('deactivatedDate');
end;

{ TtRoomTableDictionary }

constructor TtRoomTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Fnameplate := TDictionaryAttribute.Create('nameplate');
  Fgrade := TDictionaryAttribute.Create('grade');
  FdeactivatedDate := TDictionaryAttribute.Create('deactivatedDate');
  FpersonId := TDictionaryAssociation.Create('personId');
  FbuildingId := TDictionaryAssociation.Create('buildingId');
end;

{ TtAssetTypeTableDictionary }

constructor TtAssetTypeTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Fname := TDictionaryAttribute.Create('name');
  Fdescription := TDictionaryAttribute.Create('description');
  FdeactivatedDate := TDictionaryAttribute.Create('deactivatedDate');
end;

{ TtVendorTableDictionary }

constructor TtVendorTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Fname := TDictionaryAttribute.Create('name');
  Fwebsite := TDictionaryAttribute.Create('website');
  Femail := TDictionaryAttribute.Create('email');
  Fphone := TDictionaryAttribute.Create('phone');
  Fnotes := TDictionaryAttribute.Create('notes');
  FdeactivatedDate := TDictionaryAttribute.Create('deactivatedDate');
end;

initialization
  RegisterEntity(TtLog);
  RegisterEntity(TtTags);
  RegisterEntity(TtAsset);
  RegisterEntity(TtAssetNA);
  RegisterEntity(TtDocuments);
  RegisterEntity(TtAssetDocuments);
  RegisterEntity(TtPerson);
  RegisterEntity(TtBuilding);
  RegisterEntity(TtRoom);
  RegisterEntity(TtAssetType);
  RegisterEntity(TtVendor);

finalization
  if __Dic <> nil then __Dic.Free

end.
