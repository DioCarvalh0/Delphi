unit cAtualizacaoBancoDeDados;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     Data.DB,
     System.SysUtils;

type
  TAtualizaBancoDados = class

  private
  public
    ConexaoDB:TZConnection;
    constructor Create(aConexao:TZConnection);
    procedure ExecutaDiretoBancoDeDados(aScript:String);
  end;

type
  TAtualizaBancoDadosMSSQL = class
  private
    ConexaoDB: TZConnection;
  public
    function AtualizarBancoDeDadosMSSQL: Boolean;
    constructor Create(aConexao: TZConnection);
end;
implementation

uses
  cAtualizacaoTabelaMSSQL, cAtualizacaoCampoMSSQL;

{ TAtualizaBancoDados }

constructor TAtualizaBancoDados.Create(aConexao: TZConnection);
begin
  ConexaoDB:=aConexao;
end;

procedure TAtualizaBancoDados.ExecutaDiretoBancoDeDados(aScript: String);
var qry:TZQuery;
begin
  try
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add(aScript);
    try
      ConexaoDB.StartTransaction;
      qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
    end;

  finally
    qry.Close;
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

{ TAtualizaBancoDadosMSSQL }

function TAtualizaBancoDadosMSSQL.AtualizarBancoDeDadosMSSQL: Boolean;
var oAtualizarDB:TAtualizaBancoDados;
    oTabela:TAtualizacaoTabelaMSSQL;
    oCampo:TAtualizacaoCampoMSSQL;
begin
  try
    //Classe principal de atualização
    oAtualizarDB:=TAtualizaBancoDados.Create(ConexaoDB);
    //Classe filha (Herança) de atualização
    oTabela:=TAtualizacaoTabelaMSSQL.Create(ConexaoDB);
    oCampo:=TAtualizacaoCampoMSSQL.Create(ConexaoDB);
  finally
    if Assigned(oAtualizarDB) then
      FreeAndNil(oAtualizarDB);
    if Assigned(oTabela) then
      FreeAndNil(oTabela);
  end;
end;

constructor TAtualizaBancoDadosMSSQL.Create(aConexao: TZConnection);
begin
  ConexaoDB:=aConexao;
end;

end.
