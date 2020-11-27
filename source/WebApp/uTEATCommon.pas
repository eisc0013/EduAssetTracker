unit uTEATCommon;

interface

uses
  System.SysUtils, System.Classes, JS, XData.Web.Connection,
  WEBLib.Modules, Data.DB, WEBLib.DB, XData.Web.JsonDataset,
  XData.Web.Dataset, XData.Web.Client, VCL.TMSFNCEdit;

type
  TEATUtil = class(TObject)
  protected
  private
    { Private declarations }
  public
    { Public declarations }
    function GetUUIDStr(): String;
  published
  end;

const
  UUID_STR_LEN = 36;


implementation

{ TEATUtil }

function TEATUtil.GetUUIDStr: String;
var
  lGUID: TGUID;
  lResult: NativeInt;
begin
  lResult := CreateGUID(lGUID);
  //Result := Copy(LowerCase(GUIDToString(lGUID)), 2, UUID_STR_LEN);
  Result := Copy(GUIDToString(lGUID), 2, UUID_STR_LEN);
end;

end.
