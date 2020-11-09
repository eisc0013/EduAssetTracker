unit uTGPQRCodePDF;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.TypInfo,
  DelphiZXingQRCode, VCL.Graphics, AdvPDFLib;

type
  /// <summary>Generates PDF sheet(s) of QR Codes.
  /// </summary>
  TTGPQRPDF = Class(TObject)
  private
    // Internal class field definitions - only accessible in this unit //
    FPages: NativeUInt;
    FBaseText: String;
    FFileName: String;
    FQRCodePixels: NativeUInt;
  protected
    // Fields and methods only accessible by this class and descendants //
    FQRCode: TDelphiZXingQRCode;
    FPDF: TAdvPDFLib;
    function UpdateQRCode: TBitmap;
  public
    // Externally accessible fields and methods //
    // 2 constructors - one for round fruit, the other long fruit //
    constructor Create(); overload;
    constructor Create(pPages: NativeUInt); overload;
    destructor Free(); overload;
    function GeneratePDF(): TStream;
    function GetGUID(): String;
  published
    // Externally accessible and inspectable fields and methods //
    // Note that properties must use different names to local defs //
    property Pages: NativeUInt read FPages write FPages;
    property BaseText: String read FBaseText write FBaseText;
    property FileName: String read FFileName write FFileName;
    property QRCodePixels: NativeUInt read FQRCodePixels write FQRCodePixels;
  end;


implementation

constructor TTGPQRPDF.Create;
begin
  inherited;

  FPages := 1; // ALE 20201029 default
  FBaseText := '';
  FFileName := '';
  FQRCodePixels := 50;

  FQRCode := TDelphiZXingQRCode.Create();
  FPDF := TAdvPDFLib.Create();
  FPDF.PageSize := TAdvPDFLibPageSize.psLetter;
end;

constructor TTGPQRPDF.Create(pPages: NativeUInt);
begin
  Create();  // ALE 20201029 do the basic setup
end;

destructor TTGPQRPDF.Free;
begin
  FPDF.Free;
  FQRCode.Free;
end;

function TTGPQRPDF.GeneratePDF: TStream;
var
  lBMP: TBitmap;
  lPicture: TPicture;
begin
  if ((FPages > 0) AND (FBaseText <> '') AND (FFileName <> '')
   AND (DirectoryExists(ExtractFilePath(FFileName), True))) then
  begin
    FPDF.BeginDocument(FFileName); // TODO ALE 20201029 if we don't provide a filename, output goes to a TMemoryStream on EndDocument
    FPDF.Header := '';
    FPDF.Footer := '';
    for var I: NativeUInt := 0 to FPages - 1 do
    begin
      FPDF.NewPage;
      // ALE 20201030 second - 1 for margin as is + 30
      for var R := 0 to (Trunc(FPDF.PageHeight) div 60) - 1 - 1 do
      begin
        for var C := 0 to (Trunc(FPDF.PageWidth) div 60) - 1 - 1 do
        begin
          lBMP := UpdateQRCode();
          lPicture := TPicture.Create;
          lPicture.Bitmap := lBMP;
          FPDF.Graphics.DrawImage(lPicture, PointF(C * 60 + 30, R * 60 + 30));
          lBMP.Free;
          lPicture.Free;
        end;
      end;
    end;
    Result := FPDF.EndDocument(True); // TODO ALE 20201029 set to False to prevent opening in PDF reader
  end;


end;

function TTGPQRPDF.GetGUID: String;
var
  lGUID: TGUID;
begin
  CreateGUID(lGUID);
  Result := Copy(LowerCase(GUIDToString(lGUID)), 2, 36);
end;

function TTGPQRPDF.UpdateQRCode: TBitmap;
var
  Row, Column: Integer;
  lBMP: TBitmap;
begin
  lBMP := TBitmap.Create();

  FQRCode.Data := FBaseText + GetGUID();
  FQRCode.Encoding := TQRCodeEncoding(qrUTF8BOM);
  FQRCode.ErrorCorrectionLevel := 3; // TODO ALE 20201024 High error correction level
  FQRCode.QuietZone := 4; // TODO ALE 20201029 should be a property
  lBMP.SetSize(FQRCode.Rows, FQRCode.Columns);
  for Row := 0 to FQRCode.Rows - 1 do
  begin
    for Column := 0 to FQRCode.Columns - 1 do
    begin
      if (FQRCode.IsBlack[Row, Column]) then
      begin
        lBMP.Canvas.Pixels[Column, Row] := clBlack;
      end else
      begin
        lBMP.Canvas.Pixels[Column, Row] := clWhite;
      end;
    end;
  end;
  result := lBMP;
  //lBMP.Free;
end;

end.
