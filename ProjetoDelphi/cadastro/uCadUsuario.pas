unit uCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, uEnum, cCadUsuario,
  System.ImageList, Vcl.ImgList;

type
  TfrmCadUsuario = class(TfrmTelaHeranca)
    qryListagemusuarioId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemsenha: TWideStringField;
    edtUsuarioId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    oUsuario:TUsuario;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

uses
  uDTMConexao, Enter, cAcaoAcesso;

{$R *.dfm}

{ TfrmCadUsuario }

{$region 'GRAVAR E APAGAR'}
function TfrmCadUsuario.Apagar: boolean;
begin
  if oUsuario.Selecionar(qryListagem.FieldByName('usuarioID').AsInteger) then begin
    Result:=oUsuario.Apagar;
  end;
end;

procedure TfrmCadUsuario.btnAlterarClick(Sender: TObject);
begin
  if oUsuario.Selecionar(qryListagem.FieldByName('usuarioId').AsInteger) then begin
    edtUsuarioId.Text:=IntToStr(oUsuario.codigo);
    edtNome.Text     :=oUsuario.nome;
    edtSenha.Text    :=oUsuario.senha;
  end
  else begin
    btnCancelar.Click;
    abort;
  end;

  inherited;
end;

procedure TfrmCadUsuario.btnGravarClick(Sender: TObject);
begin

  if oUsuario.UsuarioExiste(edtNome.Text) then begin
      MessageDlg('Usu�rio j� existe!',mtInformation,[mbOK],0);
      edtNome.SetFocus;
      abort;
  end;

  if edtUsuarioId.Text<>EmptyStr then
    oUsuario.codigo:=StrToInt(edtUsuarioId.Text)
  else
    oUsuario.codigo:=0;

    oUsuario.nome :=edtNome.Text;
    oUsuario.senha:=edtSenha.Text;

    inherited;

end;

procedure TfrmCadUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  grdListagem.Columns.SaveToFile('C:\Users\devmv\Documents\ProjetoDelphi\savegrid\grdUsuario.cfg');
  if Assigned(oUsuario) then
    FreeAndNil(oUsuario);
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  oUsuario:=TUsuario.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual:='nome';
end;

procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
  inherited;
  grdListagem.Columns.LoadFromFile('C:\Users\devmv\Documents\ProjetoDelphi\savegrid\grdUsuario.cfg');
end;

function TfrmCadUsuario.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadoDoCadastro=ecInserir then
    result:=oUsuario.Inserir
  else if EstadoDoCadastro=ecAlterar then
    result:=oUsuario.Atualizar;

  TAcaoAcesso.PreencherUsuariosVsAcoes(dtmPrincipal.ConexaoDB);
end;
{$endRegion}
end.
