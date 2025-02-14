unit uCadAcaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  cAcaoAcesso, uEnum, uDTMConexao, System.ImageList, Vcl.ImgList;

type
  TfrmCadAcaoAcesso = class(TfrmTelaHeranca)
    qryListagemacaoAcessoId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    qryListagemchave: TWideStringField;
    edtAcaoAcessoId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtChave: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oAcaoAcesso:TAcaoAcesso;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
  end;

var
  frmCadAcaoAcesso: TfrmCadAcaoAcesso;

implementation

{$R *.dfm}

{ TfrmCadAcaoAcesso }

function TfrmCadAcaoAcesso.Apagar: Boolean;
begin
  if oAcaoAcesso.Selecionar(qryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
    result:=oAcaoAcesso.Apagar;
  end;
end;

procedure TfrmCadAcaoAcesso.btnAlterarClick(Sender: TObject);
begin
  if oAcaoAcesso.Selecionar(qryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
     edtAcaoAcessoId.Text:=oAcaoAcesso.codigo.ToString();
     edtDescricao.Text   :=oAcaoAcesso.descricao;
     edtChave.Text       :=oAcaoAcesso.chave;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmCadAcaoAcesso.btnGravarClick(Sender: TObject);
begin

  if edtAcaoAcessoId.Text<>EmptyStr then
    oAcaoAcesso.codigo:=StrToInt(edtAcaoAcessoId.Text)
  else
    oAcaoAcesso.codigo:=0;

  oAcaoAcesso.descricao :=edtDescricao.Text;
  oAcaoAcesso.chave     :=edtChave.Text;

    if oAcaoAcesso.ChaveExiste(edtChave.Text, oAcaoAcesso.codigo) then begin
    MessageDlg('Chave j� cadastrada', mtInformation, [mbOK],0);
    edtChave.SetFocus;
    abort;
  end;

  inherited;

end;

procedure TfrmCadAcaoAcesso.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadAcaoAcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  grdListagem.Columns.SaveToFile('C:\Users\devmv\Documents\ProjetoDelphi\savegrid\grdAcaoAcesso.cfg');
  if Assigned(oAcaoAcesso) then
    FreeAndNil(oAcaoAcesso);
end;

procedure TfrmCadAcaoAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  oAcaoAcesso:=TAcaoAcesso.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual:='acaoAcessoId';
end;

procedure TfrmCadAcaoAcesso.FormShow(Sender: TObject);
begin
  inherited;
  grdListagem.Columns.LoadFromFile('C:\Users\devmv\Documents\ProjetoDelphi\savegrid\grdAcaoAcesso.cfg');
end;

function TfrmCadAcaoAcesso.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadoDoCadastro=ecInserir then
    result:= oAcaoAcesso.Inserir
  else if EstadoDoCadastro=ecAlterar then
    result:= oAcaoAcesso.Atualizar;
end;

end.
