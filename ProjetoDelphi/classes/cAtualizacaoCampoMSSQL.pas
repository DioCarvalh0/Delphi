unit cAtualizacaoCampoMSSQL;

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
     System.SysUtils,
     cAtualizacaoBancoDeDados;

type
  TAtualizacaoCampoMSSQL = class(TAtualizaBancoDados)

  private
    function CampoExisteNaTabela(aNomeTabela, aCampo: String): Boolean;
    procedure Versao1;

  protected

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;

end;

implementation

{ TAtualizacaoCampoMSSQL }

function TAtualizacaoCampoMSSQL.CampoExisteNaTabela(aNomeTabela, aCampo: String): Boolean;
var qry:TZQuery;
begin
  try
    result:=False;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add(' SELECT COUNT(COLUMN_NAME) AS Qtde ');
    qry.SQL.Add('   FROM INFORMATION_SCHEMA.COLUMNS ');
    qry.SQL.Add(' WHERE TABLE_NAME =:Tabela ');
    qry.SQL.Add('   AND COLUMN_NAME=:Campo ');
    qry.ParamByName('Tabela').AsString:=aNomeTabela;
    qry.ParamByName('Campo').AsString :=aCampo;
    qry.Open;

    if qry.FieldByName('Qtde').AsInteger>0 then
        result:=true;

  finally
    qry.Close;
    if Assigned(qry) then
        FreeAndNil(qry);
  end;
end;

constructor TAtualizacaoCampoMSSQL.Create(aConexao: TZConnection);
begin
  ConexaoDB:=aConexao;
  Versao1;
end;

destructor TAtualizacaoCampoMSSQL.Destroy;
begin

  inherited;
end;

procedure TAtualizacaoCampoMSSQL.Versao1;
begin
  if not CampoExisteNaTabela('categorias','teste') then
  begin
    ExecutaDiretoBancoDeDados('ALTER TABLE categorias ADD teste varchar(30) NULL ');
  end;

  if CampoExisteNaTabela('categorias','teste') then
  begin
    ExecutaDiretoBancoDeDados('ALTER TABLE categorias DROP COLUMN teste ');
  end;
end;

end.
