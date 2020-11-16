unit uTGPQRCodePDF;

interface

uses
  System.SysUtils, System.Classes, System.Types, System.TypInfo,
  DelphiZXingQRCode, VCL.Graphics, AdvPDFLib, AdvGraphicsTypes;

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
const
  QRSMSIZE = 30;
  QRTAILWIDTH = 60;
  QRLRGSIZE = 60;
  INDENT = 30;
  BORDERSIZE = 6;
  COLWIDTH = QRSMSIZE + QRTAILWIDTH + QRLRGSIZE + BORDERSIZE + BORDERSIZE;
  ROWHEIGHT = QRLRGSIZE + BORDERSIZE + BORDERSIZE;
var
  lBMP: TBitmap;
  lPicture: TPicture;
  lFileStream: TFileStream;
begin
  // ALE 20201115 The idea is to generate a sheet of QRCodes,
  //  three copies each QR code, two small with tails to wrap around cords,
  //  and one 'large' QR Code
  if ((FPages > 0) AND (FBaseText <> '') {AND (FFileName <> '')
   AND (DirectoryExists(ExtractFilePath(FFileName), True))}) then
  begin
    FPDF.BeginDocument(FFileName); // TODO ALE 20201029 if we don't provide a filename, output goes to a TMemoryStream on EndDocument
    FPDF.Header := '';
    FPDF.Footer := '';
    for var I: NativeUInt := 0 to FPages - 1 do
    begin
      FPDF.NewPage;
      // ALE 20201030 second - 1 for margin as is + 30
      for var R := 0 to (Trunc(FPDF.PageHeight) div ROWHEIGHT) - 1 - 1 do
      begin
        for var C := 0 to (Trunc(FPDF.PageWidth) div COLWIDTH) - 1 do
        begin
          // ALE 20201115 Draw a border around the like QR Codes
          FPDF.Graphics.Fill.Kind := gfkNone;
          FPDF.Graphics.Stroke.Width := 1;
          FPDF.Graphics.Stroke.Color := gcGrey;
          FPDF.Graphics.DrawRectangle(RectF(C * COLWIDTH + INDENT, R * ROWHEIGHT + INDENT, C * COLWIDTH + INDENT + COLWIDTH, R * ROWHEIGHT + INDENT + ROWHEIGHT));
          // ALE 2020115 Draw a boarder around first small QR code
          FPDF.Graphics.Stroke.Color := gcOrange;
          FPDF.Graphics.DrawRectangle(RectF(C * COLWIDTH + INDENT + 1, R * ROWHEIGHT + INDENT + 1, C * COLWIDTH + INDENT + QRSMSIZE + QRTAILWIDTH + BORDERSIZE - 1, R * ROWHEIGHT + INDENT + QRSMSIZE + BORDERSIZE));
          //FPDF.Graphics.DrawText(IntToStr(R * C + C), RectF(C * COLWIDTH + INDENT + 1 + 1, R * ROWHEIGHT + INDENT + 1 + 1, C * COLWIDTH + INDENT + 1 + 4,  R * ROWHEIGHT + INDENT + 1 + 4));
          // ALE 2020115 Draw a boarder around second small QR code
          FPDF.Graphics.Stroke.Color := gcGreen;
          FPDF.Graphics.DrawRectangle(RectF(C * COLWIDTH + INDENT + 1, R * ROWHEIGHT + INDENT + QRSMSIZE + BORDERSIZE div 2 + 4, C * COLWIDTH + INDENT + QRSMSIZE + QRTAILWIDTH + BORDERSIZE - 1, R * ROWHEIGHT + INDENT + QRSMSIZE + QRSMSIZE + BORDERSIZE + 5));
          // ALE 2020115 Draw a boarder around large QR code
          FPDF.Graphics.Stroke.Color := gcBlue;
          FPDF.Graphics.DrawRectangle(RectF(C * COLWIDTH + INDENT + QRSMSIZE + QRTAILWIDTH + BORDERSIZE, R * ROWHEIGHT + INDENT + 1, C * COLWIDTH + INDENT+ QRSMSIZE + QRTAILWIDTH + QRLRGSIZE + BORDERSIZE + BORDERSIZE - 1, R * ROWHEIGHT + INDENT + ROWHEIGHT - 1));

          lBMP := UpdateQRCode();
          lPicture := TPicture.Create;
          lPicture.Bitmap := lBMP;
          // ALE 20201115 Now we do two sub-columns
          // ALE 20201115 Draw the first small QR code with tail to the right
          //  in the first subcolumn
          FPDF.Graphics.DrawImage(lPicture, RectF(C * COLWIDTH + INDENT + BORDERSIZE div 2, R * ROWHEIGHT + INDENT + BORDERSIZE div 2 + 1, C * COLWIDTH + INDENT + BORDERSIZE div 2 + QRSMSIZE, R * ROWHEIGHT + INDENT + BORDERSIZE div 2 + QRSMSIZE + 1));
          // ALE 20201115 Draw the second small QR code with tail to the left
          //  in the first subcolumn
          FPDF.Graphics.DrawImage(lPicture, RectF(C * COLWIDTH + INDENT + QRTAILWIDTH + BORDERSIZE div 2, R * ROWHEIGHT + INDENT + QRSMSIZE + BORDERSIZE + 2, C * COLWIDTH + INDENT + QRSMSIZE + QRTAILWIDTH + BORDERSIZE div 2, R * ROWHEIGHT + INDENT + QRSMSIZE + BORDERSIZE + QRSMSIZE + 2));
          // ALE 20201115 Draw the large QR code
          FPDF.Graphics.DrawImage(lPicture, PointF(C * COLWIDTH + INDENT + QRSMSIZE + QRTAILWIDTH + BORDERSIZE + BORDERSIZE div 2 + 1, R * ROWHEIGHT + INDENT + BORDERSIZE + 1));

          {
          if C = 0 then
          begin
            FPDF.Graphics.DrawImage(lPicture, RectF(C * 60 + 30, R *60 + 30, C * 60 + 60, R *60 + 60));
          end
          else
          begin
            FPDF.Graphics.DrawImage(lPicture, PointF(C * 60 + 30, R * 60 + 30));
          end;
          }
          lBMP.Free;
          lPicture.Free;
        end;
      end;
    end;
    Result := FPDF.EndDocument(True); // TODO ALE 20201029 set to False to prevent opening in PDF reader

    if Result <> nil then
    begin
      lFileStream := TFileStream.Create('C:\Temp\QRCodes.pdf', fmCreate);
      lFileStream.CopyFrom(Result);
      lFileStream.Free;
    end;
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
  FQRCode.ErrorCorrectionLevel := 2; // TODO ALE 20201024 3=High error correction level
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
