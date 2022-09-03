unit cCadSubCategoria;

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

Type TSubcategoria = class
  private
    ConexaoDB:TZConnection;
    F_subCatId:Integer;
    F_descrSubCat:String;
    F_categoriaId:Integer;

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    property codigo         :Integer        read F_subCatId        write F_subCatId;
    property descrSubCat    :String         read F_descrSubCat     write F_descrSubCat;
    property categoriaId    :Integer        read F_categoriaId     write F_categoriaId;
  end;

implementation

{$region 'Constructor and Destructor'}

constructor TSubcategoria.Create(aConexao:TZConnection);
begin
   ConexaoDB := aConexao;
end;

destructor TSubcategoria.Destroy;
begin
  inherited;
end;

{$endregion}

{$region 'CRUD'}
//m�todo deletar (delete)
function TSubcategoria.Apagar: Boolean;
var qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                 'C�digo: '+IntToStr(F_subCatId)+#13+
                 'Descri��o: '+F_descrSubCat,mtConfirmation,[mbYes,mbNo],0)=mrNo then begin
    Result:=False;
    abort;
  end;

  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('DELETE FROM subCategoria WHERE subCatId=:subCatId');
    qry.ParamByName('subCatId').AsInteger := F_subCatId;

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
function TSubcategoria.Atualizar: Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('UPDATE subCategoria SET descrSubCat=:descrSubCat, categoriaId=:categoriaId WHERE subCatId=:subCatId');

    qry.ParamByName('subCatId').AsInteger        := Self.F_subCatId;
    qry.ParamByName('descrSubCat').AsString      := Self.F_descrSubCat;
    qry.ParamByName('categoriaId').AsInteger     := Self.F_categoriaId;


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
function TSubcategoria.Inserir: Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('INSERT INTO subCategoria (descrSubCat, categoriaId) VALUES (:descrSubCat, :categoriaId)');

    qry.ParamByName('descrSubCat').AsString       := Self.F_descrSubCat;
    qry.ParamByName('categoriaId').AsInteger      := Self.F_categoriaId;

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
function TSubcategoria.Selecionar(id:Integer):Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('SELECT subCatId, descrSubCat, categoriaId FROM subCategoria WHERE subCatId=:subCatId');
    qry.ParamByName('subCatId').AsInteger:=id;

    try
      qry.Open;

      Self.F_subCatId      := qry.FieldByName('subCatId').AsInteger;
      Self.F_descrSubCat   := qry.FieldByName('descrSubCat').AsString;
      Self.F_categoriaId   := qry.FieldByName('categoriaId').AsInteger;
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
