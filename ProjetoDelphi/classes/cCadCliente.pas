unit cCadCliente;

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

Type TCliente = class
  private
    ConexaoDB:TZConnection;
    F_clienteId:Integer;
    F_nome:String;
    F_endereco:String;
    F_cidade:String;
    F_bairro:String;
    F_cep:String;
    F_telefone:String;
    F_cpfCnpj:String;
    F_email:String;
    F_dataNascimento: TDateTime;
    F_statusId:integer;
    F_pessoaId:integer;
  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    property codigo         :Integer        read F_clienteId        write F_clienteId;
    property nome           :String         read F_nome             write F_nome;
    property endereco       :String         read F_endereco         write F_endereco;
    property cidade         :String         read F_cidade           write F_cidade;
    property bairro         :String         read F_bairro           write F_bairro;
    property cep            :String         read F_cep              write F_cep;
    property telefone       :String         read F_telefone         write F_telefone;
    property cpfCnpj        :String         read F_cpfCnpj          write F_cpfCnpj;
    property email          :String         read F_email            write F_email;
    property dataNascimento :TDateTime      read F_dataNascimento   write F_dataNascimento;
    property statusId       :Integer        read F_statusId         write F_statusId;
    property pessoaId       :Integer        read F_pessoaId         write F_pessoaId;
  end;

implementation

{$region 'Constructor and Destructor'}
constructor TCliente.Create(aConexao:TZConnection);
begin
   ConexaoDB := aConexao;
end;

destructor TCliente.Destroy;
begin
  inherited;
end;
{$endregion}

{$region 'CRUD'}
//m�todo deletar (delete)
function TCliente.Apagar: Boolean;
var qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                 'C�digo: '+IntToStr(F_clienteId)+#13+
                 'Descri��o: '+F_nome,mtConfirmation,[mbYes,mbNo],0)=mrNo then begin
    Result:=False;
    abort;
  end;

  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('DELETE FROM clientes WHERE clienteId=:clienteId');
    qry.ParamByName('clienteId').AsInteger := F_clienteId;

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
function TCliente.Atualizar: Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('UPDATE clientes SET nome=:nome, cpfCnpj=:cpfCnpj, statusId=:statusId, '+
                ' pessoaId=:pessoaId, endereco=:endereco, cidade=:cidade, bairro=:bairro, '+
                ' cep=:cep, telefone=:telefone, email=:email, '+
                ' dataNascimento=:dataNascimento WHERE clienteId=:clienteId');

    qry.ParamByName('clienteId').AsInteger       := Self.F_clienteId;
    qry.ParamByName('nome').AsString             := Self.F_nome;
    qry.ParamByName('endereco').AsString         := Self.F_endereco;
    qry.ParamByName('cidade').AsString           := Self.F_cidade;
    qry.ParamByName('bairro').AsString           := Self.F_bairro;
    qry.ParamByName('cep').AsString              := Self.F_cep;
    qry.ParamByName('telefone').AsString         := Self.F_telefone;
    qry.ParamByName('cpfCnpj').AsString          := Self.F_cpfCnpj;
    qry.ParamByName('email').AsString            := Self.F_email;
    qry.ParamByName('dataNascimento').AsDateTime := Self.F_dataNascimento;
    qry.ParamByName('statusId').AsInteger        := Self.F_statusId;
    qry.ParamByName('pessoaId').AsInteger        := Self.F_pessoaId;

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
function TCliente.Inserir: Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('INSERT INTO clientes (nome, cpfCnpj, statusId, pessoaId, endereco, cidade, bairro, cep, telefone, email, dataNascimento) VALUES (:nome, :cpfCnpj, :statusId, :pessoaId, :endereco, :cidade, :bairro, :cep, :telefone, :email, :dataNascimento)');

    qry.ParamByName('nome').AsString             := Self.F_nome;
    qry.ParamByName('endereco').AsString         := Self.F_endereco;
    qry.ParamByName('cidade').AsString           := Self.F_cidade;
    qry.ParamByName('bairro').AsString           := Self.F_bairro;
    qry.ParamByName('cep').AsString              := Self.F_cep;
    qry.ParamByName('telefone').AsString         := Self.F_telefone;
    qry.ParamByName('cpfCnpj').AsString          := Self.F_cpfCnpj;
    qry.ParamByName('email').AsString            := Self.F_email;
    qry.ParamByName('dataNascimento').AsDateTime := Self.F_dataNascimento;
    qry.ParamByName('statusId').AsInteger        := Self.F_statusId;
    qry.ParamByName('pessoaId').AsInteger        := Self.F_pessoaId;

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
function TCliente.Selecionar(id:Integer):Boolean;
var qry:TZQuery;
begin
  try
    Result:=true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQl.Clear;
    qry.SQL.Add('SELECT clienteId, nome, cpfCnpj, statusId, pessoaId, endereco, cidade, bairro, cep, telefone, email, dataNascimento FROM clientes WHERE clienteId=:clienteId');
    qry.ParamByName('clienteId').AsInteger:=id;

    try
      qry.Open;

      Self.F_clienteId      := qry.FieldByName('clienteId').AsInteger;
      Self.F_nome           := qry.FieldByName('nome').AsString;
      Self.F_endereco       := qry.FieldByName('endereco').AsString;
      Self.F_cidade         := qry.FieldByName('cidade').AsString;
      Self.F_bairro         := qry.FieldByName('bairro').AsString;
      Self.F_cep            := qry.FieldByName('cep').AsString;
      Self.F_telefone       := qry.FieldByName('telefone').AsString;
      Self.F_cpfCnpj        := qry.FieldByName('cpfCnpj').AsString;
      Self.F_email          := qry.FieldByName('email').AsString;
      Self.F_dataNascimento := qry.FieldByName('dataNascimento').AsDateTime;
      Self.F_statusId       := qry.FieldByName('statusId').AsInteger;
      Self.F_pessoaId       := qry.FieldByName('pessoaId').AsInteger;
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
