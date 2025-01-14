unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    btnFechar: TBitBtn;
    btnAcessar: TBitBtn;
    edtLogin: TEdit;
    lblUsuario: TLabel;
    Label1: TLabel;
    edtSenha: TEdit;
    imgPassword: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure imgPasswordClick(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
//    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    bFechar:boolean;
    procedure FecharAplicacao;
    procedure FecharFormulario;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  cCadUsuario, uDTMConexao, uCadUsuario, uPrincipal;

{$R *.dfm}

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  try
    oUsuario:=TUsuario.Create(dtmPrincipal.ConexaoDB);
    if oUsuario.Logar(edtLogin.Text,edtSenha.Text) then begin
      oUsuarioLogado.codigo := oUsuario.codigo;
      oUsuarioLogado.nome   := oUsuario.nome;
      oUsuarioLogado.senha  := oUsuario.senha;
      FecharFormulario
    end
    else begin
      MessageDlg('Usu�rio Inv�lido',mtInformation,[mbOK],0);
      edtLogin.SetFocus;
    end;
  finally
    if Assigned(oUsuario) then
      FreeAndNil(oUsuario);
  end;
end;

procedure TfrmLogin.FecharAplicacao;
begin
  bFechar := true;
  Application.Terminate;
end;

procedure TfrmLogin.FecharFormulario;
begin
  bFechar := true;
  Close;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  FecharAplicacao; //Fecha a aplica��o
end;

//procedure TfrmLogin.CheckBox1Click(Sender: TObject);
//begin
//  if CheckBox1.State = cbUnchecked then
//    edtSenha.PasswordChar := '*'
//  else if CheckBox1.State = cbChecked then
//    edtSenha.PasswordChar := #0;
//end;

procedure TfrmLogin.edtSenhaChange(Sender: TObject);
begin

end;

//procedure TfrmLogin.edtSenhaExit(Sender: TObject);
//begin
//  btnAcessar.SetFocus;
//end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=bFechar;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
var btm :TBitmap;
begin
  bFechar:=False;
  edtLogin.SetFocus;
  imgPassword.Picture.LoadFromFile('C:\Users\devmv\Documents\ProjetoDelphi\Images\hide (2).png');
end;

procedure TfrmLogin.imgPasswordClick(Sender: TObject);
begin
  if edtSenha.PasswordChar = '*' then begin
    imgPassword.Picture.Bitmap.FreeImage;
    imgPassword.Picture.LoadFromFile('C:\Users\devmv\Documents\ProjetoDelphi\Images\show (2).png');
    edtSenha.PasswordChar := #0;
  end
  else if edtSenha.PasswordChar = #0 then begin
    imgPassword.Picture.Bitmap.FreeImage;
    imgPassword.Picture.LoadFromFile('C:\Users\devmv\Documents\ProjetoDelphi\Images\hide (2).png');
    edtSenha.PasswordChar := '*';
  end;
end;

end.
