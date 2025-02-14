unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, cCadCliente, uEnum, System.ImageList, Vcl.ImgList,
  Datasnap.DBClient, Math, StrUtils, Vcl.Menus;

type
  TfrmCadCliente = class(TfrmTelaHeranca)
    edtNome: TLabeledEdit;
    edtClienteId: TLabeledEdit;
    edtCEP: TMaskEdit;
    Label1: TLabel;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtEmail: TLabeledEdit;
    edtDataNascimento: TDateEdit;
    Label4: TLabel;
    qryListagemclienteId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemendereco: TWideStringField;
    qryListagemcidade: TWideStringField;
    qryListagembairro: TWideStringField;
    qryListagemcep: TWideStringField;
    qryListagemtelefone: TWideStringField;
    qryListagememail: TWideStringField;
    qryListagemdataNascimento: TDateTimeField;
    lkpStatus: TDBLookupComboBox;
    Label5: TLabel;
    qryStatus: TZQuery;
    qryStatusdescricao: TWideStringField;
    dtsStatus: TDataSource;
    qryListagemstatusDescricao: TWideStringField;
    qryStatusstatusId: TIntegerField;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lkpPessoa: TDBLookupComboBox;
    qryPessoa: TZQuery;
    dtsPessoa: TDataSource;
    qryPessoapessoaId: TIntegerField;
    qryPessoadescricao: TWideStringField;
    lblCPFCNPJ: TLabel;
    edtCPFCNPJ: TEdit;
    edtTelefone: TEdit;
    qryListagempessoaDescricao: TWideStringField;
    qryListagemcpfCnpj: TWideStringField;
    Panel1: TPanel;
    imgLkpStatus: TImage;
    btnFiltro: TButton;
    ppmFiltro: TPopupMenu;
    ATIVO1: TMenuItem;
    BLOQ1: TMenuItem;
    ATEN1: TMenuItem;
    INATIVO1: TMenuItem;
    PROSPECTO1: TMenuItem;
    NENHUM1: TMenuItem;
    Panel2: TPanel;
    imgFiltro: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryListagemstatusDescricaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure lkpPessoaClick(Sender: TObject);
    procedure edtCPFCNPJEnter(Sender: TObject);
    procedure edtTelefoneChange(Sender: TObject);
    procedure edtCPFCNPJChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCEPChange(Sender: TObject);
    procedure tabManutencaoShow(Sender: TObject);
    procedure lkpStatusClick(Sender: TObject);
    procedure ATIVO1Click(Sender: TObject);
    procedure BLOQ1Click(Sender: TObject);
    procedure ATEN1Click(Sender: TObject);
    procedure INATIVO1Click(Sender: TObject);
    procedure PROSPECTO1Click(Sender: TObject);
    procedure NENHUM1Click(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
  private
    { Private declarations }
    oCliente:TCliente;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    function formataCnpj(cnpj: string): string;
    function formataTelefone(tel: string): string;
    function formataCep(cep: string): string;
    procedure filtro(Sender: TObject);
  public
    { Public declarations }
    function formataCpf(cpf:string): string;
    function validaCNPJ(num:String): Boolean;
    function validaCPF(num:String): Boolean;
    procedure mudaImgLkpStatus;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses
  uDTMConexao;

{$R *.dfm}

{ TfrmCadCliente }

function TfrmCadCliente.Apagar: Boolean;
begin
  if oCliente.Selecionar(qryListagem.FieldByName('clienteId').AsInteger) then begin
    Result:=oCliente.Apagar;
  end;
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtClienteId.Text<>EmptyStr then
     oCliente.codigo:=StrToInt(edtClienteId.Text)
  else
     oCliente.codigo:=0;

  oCliente.statusId           :=lkpStatus.KeyValue;
  oCliente.pessoaId           :=lkpPessoa.KeyValue;
  oCliente.nome               :=edtNome.Text;
  oCliente.cep                :=edtCEP.Text;
  oCliente.endereco           :=edtEndereco.Text;
  oCliente.bairro             :=edtBairro.Text;
  oCliente.cidade             :=edtCidade.Text;
  oCliente.telefone           :=edtTelefone.Text;
  oCliente.email              :=edtEmail.Text;
  oCliente.dataNascimento     :=edtDataNascimento.Date;
  oCliente.cpfCnpj            :=edtCPFCNPJ.Text;

  if (EstadoDoCadastro=ecInserir) then
    Result:=oCliente.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
    Result:=oCliente.Atualizar;
end;

procedure TfrmCadCliente.lkpPessoaClick(Sender: TObject);
begin
  inherited;
  if lkpPessoa.KeyValue = 1 then begin
    lblCPFCNPJ.Caption := 'CPF';
    edtCPFCNPJ.MaxLength := 14;
    edtCPFCNPJ.Clear;
  end
  else begin
    lblCPFCNPJ.Caption := 'CNPJ';
    edtCPFCNPJ.MaxLength := 18;
    edtCPFCNPJ.Clear;
  end;
end;

procedure TfrmCadCliente.lkpStatusClick(Sender: TObject);
begin
  inherited;
  mudaImgLkpStatus;
end;

procedure TfrmCadCliente.mudaImgLkpStatus;
  var
  bmp :TBitMap;
begin
  inherited;
  bmp := TBitMap.Create;
  if lkpStatus.KeyValue = 1 then begin
    try
      ImageList1.GetBitmap(0, bmp);
      if bmp.Handle > 0 then
      begin
        imgLkpStatus.Picture.Bitmap.Assign(bmp);
        imgLkpStatus.Refresh;
      end;
    finally
      bmp.Free;
    end;
  end
  else if lkpStatus.KeyValue = 2 then begin
    try
      ImageList1.GetBitmap(1, bmp);
      if bmp.Handle > 0 then
      begin
        imgLkpStatus.Picture.Bitmap.Assign(bmp);
        imgLkpStatus.Refresh;
      end;
    finally
      bmp.Free;
    end;
  end
  else if lkpStatus.KeyValue = 3 then begin
    try
      ImageList1.GetBitmap(2, bmp);
      if bmp.Handle > 0 then
      begin
        imgLkpStatus.Picture.Bitmap.Assign(bmp);
        imgLkpStatus.Refresh;
      end;
    finally
      bmp.Free;
    end;
  end
  else if lkpStatus.KeyValue = 4 then begin
    try
      ImageList1.GetBitmap(3, bmp);
      if bmp.Handle > 0 then
      begin
        imgLkpStatus.Picture.Bitmap.Assign(bmp);
        imgLkpStatus.Refresh;
      end;
    finally
      bmp.Free;
    end;
  end
  else begin
    try
      ImageList1.GetBitmap(4, bmp);
      if bmp.Handle > 0 then
      begin
        imgLkpStatus.Picture.Bitmap.Assign(bmp);
        imgLkpStatus.Refresh;
      end;
    finally
      bmp.Free;
    end;
  end;
end;

{$region 'FILTRO'}

procedure TfrmCadCliente.filtro(Sender: TObject);
var
  cStatus: String;
begin

  if ppmFiltro = ATIVO1 then begin
    cStatus := '';
  end
  else if Sender = ATIVO1 then begin
    cStatus := 'Ativo';
  end
  else if Sender = BLOQ1 then begin
    cStatus := 'Bloqueado';
  end
  else if Sender = ATEN1 then begin
    cStatus := 'Aten��o';
  end
  else if Sender = INATIVO1 then begin
    qryListagem.Close;
    qryListagem.SQL.Clear;
    qryListagem.SQL.Add('SELECT c.clienteId, c.nome, c.endereco, c.cpfCnpj, '+
                              'c.cidade, c.bairro, c.cep, '+
                              'c.telefone, c.email, c.dataNascimento, s.descricao AS statusDescricao, '+
                              'p.descricao AS pessoaDescricao '+
                               'FROM clientes as C '+
                               'INNER JOIN statusClientes as s ON s.statusId = c.statusId '+
                               'INNER JOIN pessoa as p ON p.pessoaId = c.pessoaId '+
                               'WHERE s.descricao = :statusDescricao');
    qryListagem.ParamByName('statusDescricao').AsString := INATIVO1.Hint;
    qryListagem.Open;
  end
  else if Sender = PROSPECTO1 then begin
    qryListagem.Close;
    qryListagem.SQL.Clear;
    qryListagem.SQL.Add('SELECT c.clienteId, c.nome, c.endereco, c.cpfCnpj, '+
                              'c.cidade, c.bairro, c.cep, '+
                              'c.telefone, c.email, c.dataNascimento, s.descricao AS statusDescricao, '+
                              'p.descricao AS pessoaDescricao '+
                               'FROM clientes as C '+
                               'INNER JOIN statusClientes as s ON s.statusId = c.statusId '+
                               'INNER JOIN pessoa as p ON p.pessoaId = c.pessoaId '+
                               'WHERE s.descricao = :statusDescricao');
    qryListagem.ParamByName('statusDescricao').AsString := PROSPECTO1.Hint;
    qryListagem.Open;
  end;


    qryListagem.Close;
    qryListagem.SQL.Clear;
    qryListagem.SQL.Add('SELECT c.clienteId, c.nome, c.endereco, c.cpfCnpj, '+
                              'c.cidade, c.bairro, c.cep, '+
                              'c.telefone, c.email, c.dataNascimento, s.descricao AS statusDescricao, '+
                              'p.descricao AS pessoaDescricao '+
                               'FROM clientes as C '+
                               'INNER JOIN statusClientes as s ON s.statusId = c.statusId '+
                               'INNER JOIN pessoa as p ON p.pessoaId = c.pessoaId '+
                               IfThen(cStatus = '', '', 'WHERE s.descricao = :statusDescricao'));
    if(cStatus <> '')then
      qryListagem.ParamByName('statusDescricao').AsString := cStatus;
   qryListagem.Open;
end;


{$endregion}

{$region 'btnFiltro Clique'}
procedure TfrmCadCliente.INATIVO1Click(Sender: TObject);
var bmp :TBitmap;
begin
  inherited;

  filtro(Sender);

  btnFiltro.Caption := 'INATIVO';

  if imgFiltro.Visible = false then
    imgFiltro.Visible :=  true;
  bmp := TBitmap.Create;
  try
      ImageList1.GetBitmap(3, bmp);
      if bmp.Handle > 0 then
      begin
        imgFiltro.Picture.Bitmap.Assign(bmp);
        imgFiltro.Refresh;
      end;
  finally
      bmp.Free;
  end;
end;

procedure TfrmCadCliente.NENHUM1Click(Sender: TObject);
begin
  inherited;
  filtro(Sender);
  btnFiltro.Caption := 'Filtrar por:';
  imgFiltro.Visible := false;
end;

procedure TfrmCadCliente.PROSPECTO1Click(Sender: TObject);
var bmp: TBitmap;
begin
  inherited;

  filtro(Sender);

  btnFiltro.Caption := 'PROSPECTO';
  if imgFiltro.Visible = false then
    imgFiltro.Visible :=  true;
  bmp := TBitmap.Create;
  try
      ImageList1.GetBitmap(4, bmp);
      if bmp.Handle > 0 then
      begin
        imgFiltro.Picture.Bitmap.Assign(bmp);
        imgFiltro.Refresh;
      end;
  finally
      bmp.Free;
  end;
end;

procedure TfrmCadCliente.ATEN1Click(Sender: TObject);
var bmp :TBitmap;
begin
  inherited;

  filtro(Sender);

  btnFiltro.Caption := 'ATEN��O';
  if imgFiltro.Visible = false then
    imgFiltro.Visible :=  true;
  bmp := TBitmap.Create;
  try
      ImageList1.GetBitmap(2, bmp);
      if bmp.Handle > 0 then
      begin
        imgFiltro.Picture.Bitmap.Assign(bmp);
        imgFiltro.Refresh;
      end;
  finally
      bmp.Free;
  end;
end;

procedure TfrmCadCliente.ATIVO1Click(Sender: TObject);
var bmp :TBitmap;
begin
  inherited;

  filtro(Sender);

  btnFiltro.Caption := 'ATIVO';
  if imgFiltro.Visible = false then
    imgFiltro.Visible :=  true;

  bmp := TBitmap.Create;
  try
      ImageList1.GetBitmap(0, bmp);
      if bmp.Handle > 0 then
      begin
        imgFiltro.Picture.Bitmap.Assign(bmp);
        imgFiltro.Refresh;
      end;
  finally
      bmp.Free;
  end;
end;

procedure TfrmCadCliente.BLOQ1Click(Sender: TObject);
var bmp :TBitmap;
begin
  inherited;

  filtro(Sender);

  btnFiltro.Caption := 'BLOQUEADO';
  if imgFiltro.Visible = false then
    imgFiltro.Visible :=  true;
  bmp := TBitmap.Create;
  try
      ImageList1.GetBitmap(1, bmp);
      if bmp.Handle > 0 then
      begin
        imgFiltro.Picture.Bitmap.Assign(bmp);
        imgFiltro.Refresh;
      end;
  finally
      bmp.Free;
  end;
end;

{$endregion}

procedure TfrmCadCliente.qryListagemstatusDescricaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text := '';
end;

procedure TfrmCadCliente.tabManutencaoShow(Sender: TObject);
begin
  inherited;
  lkpStatus.KeyValue := 1;
  mudaImgLkpStatus;
end;

{$region 'VALIDA CPF E CNPJ'}
function TfrmCadCliente.validaCNPJ(num: string): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: Integer;
  d1, d2: Integer;
  digitado, calculado: string;
begin
  num := SomenteNumero(Trim(num));
  if length(num) <> 14 then begin
    validaCNPJ := false;
    exit;
  end;
  if num = '' then
    result := true
  else
  begin
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    n10 := StrToInt(num[10]);
    n11 := StrToInt(num[11]);
    n12 := StrToInt(num[12]);
    d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    calculado := IntToStr(d1) + IntToStr(d2);
    digitado := num[13] + num[14];
    if calculado = digitado then
      validaCNPJ := true
    else
      validaCNPJ := false;
  end;
end;

function TfrmCadCliente.validaCPF(num: string): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
  d1, d2: Integer;
  digitado, calculado: string;
begin
  begin
    num := SomenteNumero(Trim(num));
    if ((num = '00000000000') or (num = '11111111111') or
      (num = '22222222222') or (num = '33333333333') or
      (num = '44444444444') or (num = '55555555555') or
      (num = '66666666666') or (num = '77777777777') or
      (num = '88888888888') or (num = '99999999999') or
      (length(num) <> 11))
    then begin
      validaCPF := false;
      exit;
    end;

    if num = '' then
      result := true
    else
    begin
      n1 := StrToInt(num[1]);
      n2 := StrToInt(num[2]);
      n3 := StrToInt(num[3]);
      n4 := StrToInt(num[4]);
      n5 := StrToInt(num[5]);
      n6 := StrToInt(num[6]);
      n7 := StrToInt(num[7]);
      n8 := StrToInt(num[8]);
      n9 := StrToInt(num[9]);
      d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
      d1 := 11 - (d1 mod 11);
      if d1 >= 10 then
        d1 := 0;
      d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
      d2 := 11 - (d2 mod 11);
      if d2 >= 10 then
        d2 := 0;
      calculado := IntToStr(d1) + IntToStr(d2);
      digitado := num[10] + num[11];
      if calculado = digitado then
        validaCPF := true
      else
        validaCPF := false;
    end;
  end;
end;

{$endregion}

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  if oCliente.Selecionar(qryListagem.FieldByName('clienteId').AsInteger) then begin
    edtClienteId.Text       :=IntToStr(oCliente.codigo);
    lkpStatus.KeyValue      :=oCliente.statusId;
    lkpPessoa.KeyValue      :=oCliente.pessoaId;
    edtNome.Text            :=oCliente.nome;
    edtCEP.Text             :=oCliente.cep;
    edtEndereco.Text        :=oCliente.endereco;
    edtBairro.Text          :=oCliente.bairro;
    edtCidade.Text          :=oCliente.cidade;
    edtTelefone.Text        :=oCliente.telefone;
    edtEmail.Text           :=oCliente.email;
    edtDataNascimento.Date  :=oCliente.dataNascimento;
    edtCPFCNPJ.Text         :=oCliente.cpfCnpj;
  end

  else begin
    btnCancelar.Click;
    Abort;
  end;

  if lkpPessoa.KeyValue = 1 then begin
    lblCPFCNPJ.Caption := 'CPF';
    edtCPFCNPJ.MaxLength := 14;
  end
  else begin
    lblCPFCNPJ.Caption := 'CNPJ';
    edtCPFCNPJ.MaxLength := 18;
  end;

  inherited;

end;

procedure TfrmCadCliente.btnFiltroClick(Sender: TObject);
var P1, P2: TPoint;
begin
  inherited;
  P1.X := btnFiltro.Left +4;
  P1.Y := btnFiltro.Top + btnFiltro.Height +24;
  P2 := ClientToScreen(P1);
  ppmFiltro.PopUp(P2.X, P2.Y);
end;

procedure TfrmCadCliente.btnGravarClick(Sender: TObject);
begin
  if lkpPessoa.KeyValue = 1 then
  begin
    if not validaCPF(edtCPFCNPJ.Text) then
    begin
      ShowMessage('CPF INCORRETO');
      edtCPFCNPJ.SetFocus;
      abort;
    end;
  end
  else begin
    if not validaCNPJ(edtCPFCNPJ.Text) then
    begin
      ShowMessage('CNPJ INCORRETO');
      edtCPFCNPJ.SetFocus;
      abort;
    end;
  end;
  inherited;
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.Date:=Date;
  lkpStatus.KeyValue:=qryStatus.FieldByName('statusId').Value;
  lkpPessoa.KeyValue:=qryPessoa.FieldByName('pessoaId').Value;
  edtNome.SetFocus;

  if lkpPessoa.KeyValue = 1 then begin
    lblCPFCNPJ.Caption := 'CPF';
    edtCPFCNPJ.MaxLength := 14;
  end
  else begin
    lblCPFCNPJ.Caption := 'CNPJ';
    edtCPFCNPJ.MaxLength := 18;
  end;

end;

procedure TfrmCadCliente.edtCPFCNPJEnter(Sender: TObject);
begin
  inherited;
  if lkpPessoa.KeyValue = 1 then begin
    lblCPFCNPJ.Caption := 'CPF';
    edtCPFCNPJ.MaxLength := 14;
  end
  else begin
    lblCPFCNPJ.Caption := 'CNPJ';
    edtCPFCNPJ.MaxLength := 18;
  end;
end;

procedure TfrmCadCliente.edtCEPChange(Sender: TObject);
begin
  inherited;
  edtCEP.Text := formataCep(edtCEP.Text);
  edtCEP.SelStart := Length(edtCEP.Text);
end;

procedure TfrmCadCliente.edtCPFCNPJChange(Sender: TObject);
begin
  inherited;

    if lkpPessoa.KeyValue = 1 then
      edtCPFCNPJ.Text := formataCpf(edtCPFCNPJ.Text)
    else
      edtCPFCNPJ.Text := formataCnpj(edtCPFCNPJ.Text);


    edtCPFCNPJ.SelStart := Length(edtCPFCNPJ.Text);
  //Formatar(edtCPFCNPJ, TFormato.CNPJorCPF);
end;

procedure TfrmCadCliente.edtTelefoneChange(Sender: TObject);
begin
  inherited;
  edtTelefone.Text := formataTelefone(edtTelefone.Text);

  edtTelefone.SelStart := Length(edtTelefone.Text);
  //Formatar(edtTelefone, TFormato.TELorCEL);
end;

{$region 'FORMATA��O'}
//Formata CPF
function TfrmCadCliente.formataCpf(cpf: string): string;
var cpfSomenteNumero : string;
    tamanhoDigitado : integer;
begin
  cpfSomenteNumero := (SomenteNumero(cpf));
  tamanhoDigitado := Length(cpfSomenteNumero);

  case tamanhoDigitado of
    1,2,3:Result := Copy(cpfSomenteNumero,1,3);
    4,5,6:Result := Copy(cpfSomenteNumero,1,3)+'.'+Copy(cpfSomenteNumero,4,3);
    7,8,9:Result := Copy(cpfSomenteNumero,1,3)+'.'+Copy(cpfSomenteNumero,4,3)+'.'+Copy(cpfSomenteNumero,7,3);
    10,11:Result := Copy(cpfSomenteNumero,1,3)+'.'+Copy(cpfSomenteNumero,4,3)+'.'+Copy(cpfSomenteNumero,7,3)+'-'+Copy(cpfSomenteNumero,10, 2);
  end;

end;

//Formata CNPJ
function TfrmCadCliente.formataCnpj(cnpj: string): string;
var cnpjSomenteNumero : string;
    tamanhoDigitado : integer;
begin
  cnpjSomenteNumero := (SomenteNumero(cnpj));
  tamanhoDigitado := Length(cnpjSomenteNumero);

  case tamanhoDigitado of
  1,2:Result := Copy(cnpjSomenteNumero,1,2);
  3,4,5:Result := Copy(cnpjSomenteNumero,1,2)+'.'+Copy(cnpjSomenteNumero,3,3);
  6,7,8:Result := Copy(cnpjSomenteNumero,1,2)+'.'+Copy(cnpjSomenteNumero,3,3)+'.'+Copy(cnpjSomenteNumero,6,3);
  9,10,11,12:Result := Copy(cnpjSomenteNumero,1,2)+'.'+Copy(cnpjSomenteNumero,3,3)+'.'+Copy(cnpjSomenteNumero,6,3)+'/'+Copy(cnpjSomenteNumero,9, 4);
  13,14:Result := Copy(cnpjSomenteNumero,1,2)+'.'+Copy(cnpjSomenteNumero,3,3)+'.'+Copy(cnpjSomenteNumero,6,3)+'/'+Copy(cnpjSomenteNumero,9, 4)+'-'+Copy(cnpjSomenteNumero,13,2);
  end;

end;

//Formata CEP
function TfrmCadCliente.formataCep(cep: string): string;
var cepSomenteNumero : string;
    tamanhoDigitado : integer;
begin
  cepSomenteNumero := (SomenteNumero(cep));
  tamanhoDigitado := Length(cepSomenteNumero);

  case tamanhoDigitado of
    1,2,3,4,5:Result := Copy(cepSomenteNumero,1,5);
    6,7,8:Result := Copy(cepSomenteNumero,1,5)+'-'+Copy(cepSomenteNumero,6,3);
  end;

end;

//Formata TELEFONE
function TfrmCadCliente.formataTelefone(tel: string): string;
var telSomenteNumero : string;
    tamanhoDigitado : integer;
begin
  telSomenteNumero := (SomenteNumero(tel));
  tamanhoDigitado := Length(telSomenteNumero);

  if (LeftStr(telSomenteNumero,1) = '0') and (Copy(telSomenteNumero,3,2) = '00') then begin
    edtTelefone.MaxLength := 13;
    case tamanhoDigitado of
      1,2,3,4:Result := Copy(telSomenteNumero,1,4);
      5,6,7:Result := Copy(telSomenteNumero,1,4)+' '+Copy(telSomenteNumero,5,3);
      8,9,10,11:Result := Copy(telSomenteNumero,1,4)+' '+Copy(telSomenteNumero,5,3)+' '+Copy(telSomenteNumero,8,4);
    end;
  end
  else begin
    case tamanhoDigitado of
      1,2:Result := '('+Copy(telSomenteNumero,1,2);
      3,4,5,6:Result := '('+Copy(telSomenteNumero,1,2)+') '+Copy(telSomenteNumero,3,4);
      7,8,9,10:Result :='('+Copy(telSomenteNumero,1,2)+') '+Copy(telSomenteNumero,3,4)+'-'+Copy(telSomenteNumero,7,4);
      11:Result :='('+Copy(telSomenteNumero,1,2)+') '+Copy(telSomenteNumero,3,5)+'-'+Copy(telSomenteNumero,8,4);
    end;
  end;
end;

{$endregion}

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  grdListagem.Columns.SaveToFile('C:\Users\devmv\Documents\ProjetoDelphi\savegrid\grdClientes.cfg');
  qryPessoa.Close;
  qryStatus.Close;
  if Assigned(oCliente) then
    FreeAndNil(oCliente);
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente:=TCliente.Create(dtmPrincipal.ConexaoDB);

  IndiceAtual:='nome';
end;



procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
  grdListagem.Columns.LoadFromFile('C:\Users\devmv\Documents\ProjetoDelphi\savegrid\grdClientes.cfg');
  qryStatus.Open;
  qryPessoa.Open;
end;


end.
