unit cCadVendas;

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

Type TVenda = class
  private
    ConexaoDB:TZConnection;
    F_vendaId:Integer;
    F_clienteId:Integer;
    F_dataVenda:TDateTime;
    F_totalVenda:Double;

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    property VendaId        :Integer        read F_vendaId       write F_vendaId;
    property ClienteId      :Integer        read F_clienteId     write F_clienteId;
    property DataVenda      :TDateTime      read F_dataVenda     write F_dataVenda;
    property TotalVenda     :Double         read F_totalVenda    write F_totalVenda;
end;

implementation

{$region 'Constructor and Destructor'}
constructor TVenda.Create(aConexao:TZConnection);
begin
   ConexaoDB := aConexao;
end;

destructor TVenda.Destroy;
begin
  inherited;
end;
{$endregion}

{$region 'CRUD'}
//m�todo deletar (delete)
function TVenda.Apagar: Boolean;
var qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                 'C�digo: '+IntToStr(F_vendaId)+#13+
                 'Descri��o: '+F_nome,mtConfirmation,[mbYes,mbNo],0)=mrNo then begin
    Result:=False;
    abort;
  end;

  try
    Result:=true;
    ConexaoDB.StartTransaction;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    //Apaga os Itens Primeiro
    qry.SQl.Clear;
    qry.SQL.Add('DELETE FROM vendasItens WHERE vendaId=:vendaId');
    qry.ParamByName('vendaId').AsInteger := id;

    try
      qry.ExecSQL;
      //Apaga a Tabela Master
      qry.SQL.Clear;
      qry.SQL.Add('DELETE FROM vendas WHERE vendaId=:vendaId');
      qry.ParamByName('vendaId').AsInteger := id;
      qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      Result:=false;
    end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

//m�todo atualizar (update)
function TVenda.Atualizar: Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('UPDATE vendas SET clienteId=:clienteId, dataVenda=:dataVenda, totalVenda=:totalVenda WHERE vendaId=:vendaId');

    qry.ParamByName('vendaId').AsInteger      := Self.F_vendaId;
    qry.ParamByName('clienteId').AsInteger    := Self.F_clienteId;
    qry.ParamByName('dataVenda').AsDateTime    := Self.F_dataVenda;
    qry.ParamByName('totalVenda').AsFloat      := Self.F_totalVenda;

    try
      qry.ExecSQL;
    Except
      Result:=False;
    end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

//m�todo inserir (insert)
function TVenda.Inserir: Boolean;
var qry:TZQuery;
    IdVendaGerado:Integer;
begin
  try
    Result:=true;
    ConexaoDB.StartTransaction;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    //Faz a Inclus�o no Banco de Dados
    qry.SQl.Clear;
    qry.SQL.Add('INSERT INTO vendas (clienteId, dataVenda, totalVenda) VALUES (:clienteId, :dataVenda, :totalVenda)');

    qry.ParamByName('clienteId').AsInteger         := Self.F_clienteId;
    qry.ParamByName('dataVenda').TDateTime         := Self.F_dataVenda;
    qry.ParamByName('totalVenda').AsFloat          := Self.F_totalVenda;

    try
      qry.ExecSQL;
      //Recupera o ID Gerado no Insert
      qry.SQL.Clear;
      qry.SQL.Add('SELECT SCOPE_IDENTITY() AS ID');
      qry.Open;

      //Id da Tabela Master
      IdVendaGerado:=qry.FieldByName('ID').AsInteger;

      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=False;
    end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

//m�todo selecionar (select)
function TVenda.Selecionar(id:Integer):Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('SELECT vendaId, clienteId, dataVenda, totalVenda FROM vendas WHERE vendaId=:vendaId');
    qry.ParamByName('vendaId').AsInteger:=id;

    try
      qry.Open;

      Self.F_vendaId     := qry.FieldByName('vendaId').AsInteger;
      Self.F_clienteId   := qry.FieldByName('clienteId').AsInteger;
      Self.F_dataVenda   := qry.FieldByName('dataVenda').AsDateTime;
      Self.F_totalVenda  := qry.FieldByName('totalVenda').AsFloat;
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
