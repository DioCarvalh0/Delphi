unit cCadProdutos;

interface

uses System.classes,
     //lista de Units
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     System.ImageList,
     Vcl.ImgList,
     Vcl.Imaging.pngimage,
     Vcl.Imaging.jpeg,
     Vcl.ExtDlgs,
     Vcl.Graphics,
     System.StrUtils,


     //conectando o banco
     ZAbstractConnection,
     ZConnection,

     //conectando a Query
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,

     //FreeAndNil
     System.SysUtils;

Type TProduto = class
  private
    ConexaoDB:TZConnection;
    F_produtoId:Integer;
    F_nome:String;
    F_descricao:String;
    F_valor:Double;
    F_quantidade:Double;
    F_categoriaId:Integer;
    F_subCatId:Integer;
    F_descrSubCat:String;
    F_foto:TBitmap;


  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;
    class procedure CarregarImagem(aImage:TImage); static;
    class procedure LimparImagem(var aImage:TImage); static;

  published
    property codigo         :Integer        read F_produtoId       write F_produtoId;
    property nome           :String         read F_nome            write F_nome;
    property descricao      :String         read F_descricao       write F_descricao;
    property valor          :Double         read F_valor           write F_valor;
    property quantidade     :Double         read F_quantidade      write F_quantidade;
    property categoriaId    :Integer        read F_categoriaId     write F_categoriaId;
    property subCatId       :Integer        read F_subCatId        write F_subCatId;
    property foto           :TBitmap        read F_foto            write F_foto;
  end;

implementation

{$region 'Constructor and Destructor'}

constructor TProduto.Create(aConexao:TZConnection);
begin
   ConexaoDB := aConexao;
   F_foto := TBitmap.Create;
   F_foto.Assign(nil);
end;

destructor TProduto.Destroy;
begin
  if Assigned(F_foto) then begin
    F_foto.Assign(nil);
    F_foto.Free;
  end;
  inherited;
end;

{$endregion}

{$region 'Image'}
class procedure TProduto.CarregarImagem(aImage:TImage);
var
  Bmp, BmpTrans: TBitmap;
  Jpg: TJPEGImage;
  Pic: TPicture;
  Png: TPngImage;
  opdSelecionar:TOpenPictureDialog;
  iWidth:Integer;
  iHeight:Integer;
begin
  Try
    iWidth:=200;
    iHeight:=250;
    opdSelecionar:=TOpenPictureDialog.Create(nil);
    opdSelecionar.Filter:='All (*.bmp;*.jpg; *.jpeg;*.png)|*.jpg; *.jpeg; *.bmp;*.png|Bitmaps '+
                          '(*.bmp)|*.bmp|JPEG Image File (*.jpg;*.jpeg)|*.jpg; *.jpeg| '+
                          'PNG(*.png)|*.png';
    opdSelecionar.Title:='Selecione a Imagem';
    opdSelecionar.Execute;

    if opdSelecionar.FileName<>EmptyStr then begin
        if (Pos('.JPG',UpperCase(opdSelecionar.FileName))>0) or ( Pos('.JPEG',UpperCase(opdSelecionar.FileName))>0) then begin
        Bmp := TBitmap.Create;
        Jpg := TJPEGImage.Create;
        Pic := TPicture.Create;
        try
          Pic.LoadFromFile(opdSelecionar.FileName);
          Jpg.Assign(Pic);
          Jpg.CompressionQuality :=7;
          Bmp.Width  :=iWidth;
          Bmp.Height :=iHeight;
          Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), Jpg);
          aImage.Picture.Bitmap:=Bmp;
        finally
          Pic.Free;
          Jpg.Free;
          Bmp.Free;
        end
      End
      else if Pos('.PNG',UpperCase(opdSelecionar.FileName))>0 then begin
        Bmp := TBitmap.Create;
        png := TPngImage.Create;
        Pic := TPicture.Create;
        try
          Pic.LoadFromFile(opdSelecionar.FileName);
          png.Assign(Pic);
          Bmp.Width  :=iWidth;
          Bmp.Height :=iHeight;
          Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), png);

          aImage.Picture.Bitmap:=Bmp;
        finally
          Pic.Free;
          png.Free;
          Bmp.Free;
        end
      end
      else begin
        try
          Bmp := TBitmap.Create;
          BmpTrans:= TBitmap.Create;
          Pic := TPicture.Create;
          Pic.LoadFromFile(opdSelecionar.FileName);
          BmpTrans.Assign(Pic.Bitmap);
          Bmp.Width :=iWidth;
          Bmp.Height:=iHeight;
          Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), BmpTrans);
          aImage.Picture.Bitmap:=Bmp;
        finally
          Pic.Free;
          BmpTrans.Free;
          Bmp.Free;
        end;
      end;
    end;

  Finally
     FreeAndNil(opdSelecionar);
  End;

end;

class procedure TProduto.LimparImagem(var aImage: TImage);
begin
  aImage.Picture.Assign(nil);
end;

{$endregion}

{$region 'CRUD'}
//m�todo deletar (delete)
function TProduto.Apagar: Boolean;
var qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                 'C�digo: '+IntToStr(F_produtoId)+#13+
                 'Descri��o: '+F_nome,mtConfirmation,[mbYes,mbNo],0)=mrNo then begin
    Result:=False;
    abort;
  end;

  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('DELETE FROM produtos WHERE produtoId=:produtoId');
    qry.ParamByName('produtoId').AsInteger := F_produtoId;

     try
       ConexaoDB.StartTransaction;
       Qry.ExecSQL;
       ConexaoDB.Commit;
     except
       ConexaoDB.Rollback;
       Result := false;
     end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

//m�todo atualizar (update)
function TProduto.Atualizar: Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('UPDATE produtos SET nome=:nome, descricao=:descricao, valor=:valor, quantidade=:quantidade, categoriaId=:categoriaId, subCatId=:subCatId, foto=:foto WHERE produtoId=:produtoId');

    qry.ParamByName('produtoId').AsInteger      := Self.F_produtoId;
    qry.ParamByName('nome').AsString            := Self.F_nome;
    qry.ParamByName('descricao').AsString       := Self.F_descricao;
    qry.ParamByName('valor').AsFloat           := Self.F_valor;
    qry.ParamByName('quantidade').AsFloat      := Self.F_quantidade;
    qry.ParamByName('categoriaId').AsInteger     := Self.F_categoriaId;
    qry.ParamByName('subCatId').AsInteger     := Self.F_subCatId;
    if Self.F_foto.Empty then
      qry.ParamByName('foto').Clear
    else
      qry.ParamByName('foto').Assign(Self.F_foto);

     try
       ConexaoDB.StartTransaction;
       Qry.ExecSQL;
       ConexaoDB.Commit;
     except
       ConexaoDB.Rollback;
       Result := false;
     end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

//m�todo inserir (insert)
function TProduto.Inserir: Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('INSERT INTO produtos (nome, descricao, valor, quantidade, categoriaId, subCatId, foto) VALUES (:nome, :descricao, :valor, :quantidade, :categoriaId, :subCatId, :foto)');

    qry.ParamByName('nome').AsString              := Self.F_nome;
    qry.ParamByName('descricao').AsString         := Self.F_descricao;
    qry.ParamByName('valor').AsFloat              := Self.F_valor;
    qry.ParamByName('quantidade').AsFloat         := Self.F_quantidade;
    qry.ParamByName('categoriaId').AsInteger      := Self.F_categoriaId;
    qry.ParamByName('subCatId').AsInteger         := Self.F_subCatId;
    if Self.F_foto.Empty then
      qry.ParamByName('foto').Clear
    else
      qry.ParamByName('foto').Assign(Self.F_foto);

     try
       ConexaoDB.StartTransaction;
       Qry.ExecSQL;
       ConexaoDB.Commit;
     except
       ConexaoDB.Rollback;
       Result := false;
     end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

//m�todo selecionar (select)
function TProduto.Selecionar(id:Integer):Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('SELECT produtoId, nome, descricao, valor, quantidade, categoriaId, subCatId, foto FROM produtos WHERE produtoId=:produtoId');
    qry.ParamByName('produtoId').AsInteger:=id;

    try
      qry.Open;

      Self.F_produtoId     := qry.FieldByName('produtoId').AsInteger;
      Self.F_nome          := qry.FieldByName('nome').AsString;
      Self.F_descricao     := qry.FieldByName('descricao').AsString;
      Self.F_valor         := qry.FieldByName('valor').AsFloat;
      Self.F_quantidade    := qry.FieldByName('quantidade').AsFloat;
      Self.F_categoriaId   := qry.FieldByName('categoriaId').AsInteger;
      Self.F_subCatId      := qry.FieldByName('subCatId').AsInteger;
      Self.F_foto.Assign(qry.FieldByName('foto'));
    Except
      Result:=False;
    end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;
{$endregion}

end.
