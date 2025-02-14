unit cCadCategoria;

interface

uses System.classes,
     //lista de Units
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,

     //conectando o banco
     ZAbstractConnection,
     ZConnection,

     //conectando a Query
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,

     //FreeAndNil
     System.SysUtils;

Type TCategoria = class //nome da classe
  private //Variaveis Privadas somente dentro da classe
    ConexaoDB:TZConnection; //objeto
    F_categoriaId:Integer;
    F_descricao:String;
    function getCodigo: Integer;
    function getDescricao: String;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: String);

  public //Variaveis p�blicas que pode ser trabalhada fora da classe
     constructor Create(aConexao:TZConnection); //construtor da classe
     destructor Destroy; override; //Destroi a Classe. Usar o Override por cause de sobreescrever
     function Inserir:Boolean; //criando fun��o para gravar
     function Atualizar:Boolean; //criando fun��o para atualizar
     function Apagar:Boolean; //criando fun��o para apagar
     function Selecionar(id:Integer):Boolean; //criando fun��o para selecionar os registros

  published //Variaveis Publicas utilizadas para propriedade da classe para fornecer informa��es de runtime
    property codigo:Integer     read getCodigo      write setCodigo;
    property descricao:String   read getDescricao   write setDescricao;

end;
implementation

{ TCategoria }

{$region 'Declarando os m�todos'}

//CRIANDO E DESTRUINDO
constructor TCategoria.Create(aConexao:TZConnection);
begin
   ConexaoDB := aConexao; //pegando a conexao interna com a chamada de onde pode criar
end;

destructor TCategoria.Destroy;
begin
  inherited;
end;

{$region 'CRUD'}
//CRUD - APAGAR, ATUALIZAR, GRAVAR E SELECIONAR
function TCategoria.Apagar:Boolean;
//aula 50
var Qry:TZQuery;
begin
   if MessageDlg('Apagar o Registro: '+#13+#13+
                 'C�digo: '+IntToStr(F_categoriaId)+#13+
                 'Descri��o: '+F_descricao,mtConfirmation,[mbYes,mbNo], 0)=mrNo then begin
   Result := false;
   abort;
   end;

   try
     Result := true;
     Qry := TZQuery.Create(nil);
     Qry.Connection := ConexaoDB;
     Qry.SQL.Clear;
     Qry.SQL.Add('DELETE FROM categorias WHERE categoriaId=:categoriaId');
     Qry.ParamByName('categoriaId').AsInteger := F_categoriaId;

     try
       ConexaoDB.StartTransaction;
       Qry.ExecSQL;
       ConexaoDB.Commit;
     except
       ConexaoDB.Rollback;
       Result := false;
     end;

   finally
     if Assigned(Qry) then
          FreeAndNil(Qry);
   end;
end;

function TCategoria.Atualizar:Boolean;
//aula 50
var Qry:TZQuery;
begin
   try
     Result := true;
     Qry := TZQuery.Create(nil);
     Qry.Connection := ConexaoDB;
     Qry.SQL.Clear;
     Qry.SQL.Add('UPDATE categorias SET descricao=:descricao WHERE categoriaId=:categoriaId');
     Qry.ParamByName('categoriaId').AsInteger := Self.F_categoriaId;
     Qry.ParamByName('descricao'). AsString   := Self.F_descricao;

     try
       ConexaoDB.StartTransaction;
       Qry.ExecSQL;
       ConexaoDB.Commit;
     except
       ConexaoDB.Rollback;
       Result := false;
     end;

   finally
     if Assigned(Qry) then
          FreeAndNil(Qry);
   end;
end;

function TCategoria.Inserir:Boolean;
//aula 48
var Qry:TZQuery;
begin
   try
     Result := true;
     Qry := TZQuery.Create(nil);
     Qry.Connection := ConexaoDB;
     Qry.SQL.Clear;
     Qry.SQL.Add('INSERT INTO categorias (descricao) VALUES (:descricao)');
     Qry.ParamByName('descricao').AsString := Self.F_descricao;
     try
       ConexaoDB.StartTransaction;
       Qry.ExecSQL;
       ConexaoDB.Commit;
     except
       ConexaoDB.Rollback;
       Result := false;
     end;
   finally
     if Assigned(Qry) then
          FreeAndNil(Qry);
   end;
end;

function TCategoria.Selecionar(id: Integer):Boolean;
//aula 49
var Qry:TZQuery;
begin
   try
     Result := true;
     Qry := TZQuery.Create(nil);
     Qry.Connection := ConexaoDB;
     Qry.SQL.Clear;
     Qry.SQL.Add('SELECT categoriaId, descricao FROM categorias WHERE categoriaId=:categoriaId');
     Qry.ParamByName('categoriaId').AsInteger := id;
     try
       Qry.Open;

       Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
       Self.F_descricao   := Qry.FieldByName('descricao').AsString;
     except
       Result := false;
     end;
   finally
     if Assigned(Qry) then
          FreeAndNil(Qry);
   end;
end;

{$endregion}

//MODIFICADORES DE ACESSOS GET E SET
function TCategoria.getCodigo: Integer;
begin
  Result := Self.F_categoriaId;
end;

function TCategoria.getDescricao: String;
begin
  Result := Self.F_descricao;
end;

procedure TCategoria.setCodigo(const Value: Integer);
begin
  Self.F_categoriaId := Value;
end;

procedure TCategoria.setDescricao(const Value: String);
begin
  Self.F_descricao := Value;
end;
{$endregion}

end.

