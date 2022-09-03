unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit, cCadProdutos, uEnum, uDTMConexao, System.ImageList,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.ExtDlgs;

type
  TfrmCadProduto = class(TfrmTelaHeranca)
    edtNome: TLabeledEdit;
    edtProdutoId: TLabeledEdit;
    edtDescricao: TMemo;
    Label1: TLabel;
    edtValor: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    lkpCategoria: TDBLookupComboBox;
    qryCategoria: TZQuery;
    dtsCategoria: TDataSource;
    qryCategoriacategoriaId: TIntegerField;
    qryCategoriadescricao: TWideStringField;
    Label4: TLabel;
    btnCarregarImg: TBitBtn;
    btnApagarImagem: TBitBtn;
    pnlImage: TPanel;
    imgProduto: TImage;
    Label5: TLabel;
    pnlImListagem: TPanel;
    Image1: TImage;
    Label6: TLabel;
    lkpSubcategoria: TDBLookupComboBox;
    qrySubcategoria: TZQuery;
    dtsSubcategoria: TDataSource;
    qrySubcategoriasubCatId: TIntegerField;
    qrySubcategoriadescrSubCat: TWideStringField;
    produtoId: TIntegerField;
    nome: TWideStringField;
    qryListagemdescricao: TWideStringField;
    qryListagemvalor: TFloatField;
    qryListagemquantidade: TFloatField;
    qryListagemcategoriaId: TIntegerField;
    qryListagemsubCatId: TIntegerField;
    qryListagemfoto: TBlobField;
    qryListagemcategoriaId_1: TIntegerField;
    qryListagemDescricaoCategoria: TWideStringField;
    qryListagemDescricaoSubCategoria: TWideStringField;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApagarImagemClick(Sender: TObject);
    procedure btnCarregarImgClick(Sender: TObject);
    procedure grdListagemCellClick(Column: TColumn);
    procedure qryListagemAfterScroll(DataSet: TDataSet);
    procedure lkpSubcategoriaEnter(Sender: TObject);
    procedure lkpCategoriaClick(Sender: TObject);
    procedure dtsListagemDataChange(Sender: TObject; Field: TField);
    procedure tabManutencaoShow(Sender: TObject);
  private
    { Private declarations }
    oProduto:TProduto;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    procedure selecionaSubCat;
    procedure VerificaLkpSubCat;
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

{$region 'CRUD'}

function TfrmCadProduto.Apagar: Boolean;
begin
  if oProduto.Selecionar(qryListagem.FieldByName('produtoId').AsInteger) then begin
    Result:=oProduto.Apagar;
  end;
end;

function TfrmCadProduto.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtProdutoId.Text<>EmptyStr then
     oProduto.codigo:=StrToInt(edtProdutoId.Text)
  else
     oProduto.codigo:=0;

  oProduto.nome              :=edtNome.Text;
  oProduto.descricao         :=edtDescricao.Text;
  oProduto.categoriaId       :=lkpCategoria.KeyValue;
  oProduto.valor             :=edtValor.Value;
  oProduto.quantidade        :=edtQuantidade.Value;
  oProduto.subCatId          :=lkpSubcategoria.KeyValue;
  if imgProduto.Picture.Bitmap.Empty then
    oProduto.foto.Assign(nil)
  else
    oProduto.foto.Assign(imgProduto.Picture);

  if (EstadoDoCadastro=ecInserir) then
    Result:=oProduto.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
    Result:=oProduto.Atualizar;
end;

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  begin
    if oProduto.Selecionar(qryListagem.FieldByName('produtoId').AsInteger) then begin
      edtProdutoId.Text:=IntToStr(oProduto.codigo);
      edtNome.Text               :=oProduto.nome;
      edtDescricao.Text          :=oProduto.descricao;
      lkpCategoria.KeyValue      :=oProduto.categoriaId;
      edtValor.Value             :=oProduto.valor;
      edtQuantidade.Value        :=oProduto.quantidade;
      lkpSubcategoria.KeyValue   :=oProduto.subCatId;
      imgProduto.Picture.Assign(oProduto.foto);
    end

    else begin
      btnCancelar.Click;
      Abort;
    end;
  end;

  selecionaSubCat;

  inherited;
end;

{$endregion}

{$region 'Button'}

procedure TfrmCadProduto.btnApagarImagemClick(Sender: TObject);
begin
  inherited;
  TProduto.LimparImagem(imgProduto);
end;

procedure TfrmCadProduto.btnCarregarImgClick(Sender: TObject);
begin
  inherited;
  TProduto.CarregarImagem(imgProduto);
end;

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  oProduto.LimparImagem(imgProduto);
  edtNome.SetFocus;
  VerificaLkpSubCat;
end;

procedure TfrmCadProduto.dtsListagemDataChange(Sender: TObject; Field: TField);
begin
  inherited;

end;

{$endregion}

{$region 'Eventos'}

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  grdListagem.Columns.SaveToFile('C:\Users\devmv\Documents\ProjetoDelphi\savegrid\grdProdutos.cfg');
  qryCategoria.Close;
  qrySubcategoria.Close;
  if Assigned(oProduto) then
    FreeAndNil(oProduto);
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  oProduto:=TProduto.Create(dtmPrincipal.ConexaoDB);

  IndiceAtual:='nome';
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  grdListagem.Columns.LoadFromFile('C:\Users\devmv\Documents\ProjetoDelphi\savegrid\grdProdutos.cfg');
  qryCategoria.Open;
  qrySubcategoria.Open;
end;

procedure TfrmCadProduto.grdListagemCellClick(Column: TColumn);
begin
  inherited;
    if oProduto.Selecionar(qryListagem.FieldByName('produtoId').AsInteger) then
      image1.Picture.Assign(oProduto.foto);

    if not qryListagemfoto.IsNull then
      pnlImListagem.Visible := true
    else
      pnlImListagem.Visible := false;
end;

procedure TfrmCadProduto.lkpCategoriaClick(Sender: TObject);
begin
  inherited;
  selecionaSubCat;
  VerificaLkpSubCat;
end;

procedure TfrmCadProduto.lkpSubcategoriaEnter(Sender: TObject);
var i:integer;
begin
  inherited;
  selecionaSubCat;
end;

procedure TfrmCadProduto.qryListagemAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if oProduto.Selecionar(qryListagem.FieldByName('produtoId').AsInteger) then
    image1.Picture.Assign(oProduto.foto);

  if not qryListagemfoto.IsNull then
    pnlImListagem.Visible := true
  else
    pnlImListagem.Visible := false;
end;

procedure TfrmCadProduto.tabManutencaoShow(Sender: TObject);
begin
  inherited;
  VerificaLkpSubCat;
end;

{$endregion}

{$region 'M�todos'}

procedure TfrmCadProduto.selecionaSubCat;
begin
  qrySubcategoria.Close;
  qrySubcategoria.SQL.Clear;
  qrySubcategoria.SQL.Add('SELECT subCatId, descrSubCat FROM subCategoria WHERE categoriaId=:categoriaId');
  qrySubcategoria.ParamByName('categoriaId').AsInteger := lkpCategoria.KeyValue;
  qrySubcategoria.Open;
end;

procedure TfrmCadProduto.VerificaLkpSubCat;
begin
  if lkpCategoria.KeyValue = Null then
    lkpSubcategoria.Enabled := false
  else
    lkpSubcategoria.Enabled := true;
end;

{$endregion}

end.
