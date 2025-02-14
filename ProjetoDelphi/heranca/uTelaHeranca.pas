unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDTMConexao, uEnum,
  RxToolEdit, RxCurrEdit, ZAbstractConnection, ZConnection, Math, StrUtils,
  System.ImageList, Vcl.ImgList, System.UITypes;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    tabListagem: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    tabManutencao: TTabSheet;
    pnlRodape: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    dtsListagem: TDataSource;
    qryListagem: TZQuery;
    lblIndice: TLabel;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
              btnGravar, btnApagar:TBitBtn; Navegador:TDBNavigator;
              pgcPrincipal:TPageControl; Flag:Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
    function RetornarCampoTraduzido(Campo: String): String;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdit;
    procedure CarregarGrid;
    procedure SalvarGrid;
  public
    { Public declarations }
    EstadoDoCadastro:TEstadoDoCadastro;
    IndiceAtual: string;
    function Apagar:Boolean; virtual; // virtual: da a possibilidade de reescrever em outra tela
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; virtual;
    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
    function SomenteNumero(str: string): string;
    class function TenhoAcesso(aUsuarioId: Integer; aChave: String; aConexao: TZConnection): Boolean; static;
end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

uses uCadCategoria, uPrincipal, uCadCliente, cCadCliente;

{$region 'OBSERVA��ES'}
//TAG 1: Chave Prim�ria - PK
//Tag 2: Campos Obrigat�rios
{$endregion}

{$region 'FUN��ES E PROCEDURES'}

//Procedure de Controle de Tela
procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
          btnGravar, btnApagar:TBitBtn; Navegador:TDBNavigator;
          pgcPrincipal:TPageControl; Flag:Boolean);
begin
   btnNovo.Enabled         :=Flag;
   btnApagar.Enabled       :=Flag;
   btnAlterar.Enabled      :=Flag;
   Navegador.Enabled       :=Flag;
   pgcPrincipal.Pages[0].TabVisible := Flag; //indice 0 (aba Listagem)
   btnCancelar.Enabled     :=not(Flag); //se vier true no btnCancelar, ficara False
   btnGravar.Enabled       :=not(Flag); //se vier true no btnGravar, ficara False
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
begin
   if (pgcPrincipal.Pages[Indice].TabVisible) then
      pgcPrincipal.TabIndex:=Indice;
end;

function TfrmTelaHeranca.RetornarCampoTraduzido(Campo:String):String;
var i:Integer;
begin
   for I := 0 to qryListagem.Fields.Count-1 do
   begin
     if lowercase(qryListagem.Fields[i].FieldName)=lowercase(Campo) then
     begin
       Result := qryListagem.Fields[i].DisplayLabel;
       Break;
     end;
   end;
end;

class function TfrmTelaHeranca.TenhoAcesso(aUsuarioId: Integer; aChave: String;
  aConexao: TZConnection): Boolean;
var qry:TZQuery;
begin
  qry:=TZQuery.Create(nil);
  try
    result:=true;

    qry.Connection:=aConexao;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT usuarioId '+
                '   FROM usuariosAcaoAcesso '+
                ' WHERE usuarioId=:usuarioId '+
                '   AND acaoAcessoId=(SELECT TOP 1 acaoAcessoId FROM acaoAcesso WHERE chave=:chave)'+
                '   AND ativo=1');
    qry.ParamByName('usuarioId').AsInteger      :=aUsuarioId;
    qry.ParamByName('chave').AsString           :=aChave;

    qry.Open;

    if qry.IsEmpty then
        Result:=false;

  finally
    if Assigned(qry) then
        FreeAndNil(qry);
  end;
end;

procedure TfrmTelaHeranca.ExibirLabelIndice(Campo:string; aLabel:TLabel);
begin
   aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

//explica��o aula 41
function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
Var i:Integer;
begin
  Result := False;
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
      if (TLabeledEdit(Components[i]).Tag = 2) and
         (TLabeledEdit(Components[i]).Text=EmptyStr) then begin
           MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
                ' � um campo obrigat�rio',mtInformation,[mbOK],0);
           TLabeledEdit(Components[i]).SetFocus;
           Result := true;
           Break;
         end;
    end;
    if (Components[i] is TDBLookupComboBox) then begin
      if (TDBLookupComboBox(Components[i]).Tag = 2) and
         (TDBLookupComboBox(Components[i]).KeyValue=Null) then begin
           MessageDlg(TDBLookupComboBox(Components[i]).Hint +
                ' � um campo obrigat�rio',mtInformation,[mbOK],0);
           TDBLookupComboBox(Components[i]).SetFocus;
           Result := true;
           Break;
         end;
    end;
  end;
end;

//explica��o aula 42
procedure TfrmTelaHeranca.DesabilitarEditPK;
Var i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
      if (TLabeledEdit(Components[i]).Tag = 1) then begin
        TLabeledEdit(Components[i]).Enabled := false;
        break;
      end;
    end;
  end;
end;

procedure TfrmTelaHeranca.LimparEdit;
Var i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then
        TLabeledEdit(Components[i]).Text := EmptyStr
    else if(Components[i] is TEdit) then
      TEdit(Components[i]).Text := ''
    else if(Components[i] is TMemo) then
      TMemo(Components[i]).Text := ''
    else if(Components[i] is TDBLookupComboBox) then
      TDBLookupComboBox(Components[i]).KeyValue :=Null
    else if(Components[i] is TCurrencyEdit) then
      TCurrencyEdit(Components[i]).Value := 0
    else if(Components[i] is TDateEdit) then
      TDateEdit(Components[i]).Date := 0
    else if(Components[i] is TMaskEdit) then
      TMaskEdit(Components[i]).Text := '';
    end;
end;

{$endregion}

{$region 'M�TODO VIRTUAL'}
function TfrmTelaHeranca.Apagar: Boolean;
begin
   ShowMessage('DELETADO');
   Result := True;
end;

function TfrmTelaHeranca.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
   if (EstadoDoCadastro=ecInserir) then
    showmessage('Inserir')
   else if (EstadoDoCadastro=ecAlterar) then
    ShowMessage('Alterado');

   Result := True;
end;
{$endregion}

{$region 'PROCEDURES DOS BOT�ES'}
procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin

   ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                    btnApagar, btnNavigator, pgcPrincipal,false);
   EstadoDoCadastro := ecInserir;
   LimparEdit;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
   ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                    btnApagar, btnNavigator, pgcPrincipal,false);
   EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin

    try
     if (Apagar) then begin
       ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                          btnApagar, btnNavigator, pgcPrincipal,true);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparEdit;
      qryListagem.Refresh;
    end
    else begin
       MessageDlg('Erro na Exclus�o', mtError, [mbOK], 0);
    end
    finally
       EstadoDoCadastro := ecNenhum;
    end;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
   ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                    btnApagar, btnNavigator, pgcPrincipal,true);
   ControlarIndiceTab(pgcPrincipal, 0);
   EstadoDoCadastro := ecNenhum;
   LimparEdit;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close; //fechara a janela
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin

   if (ExisteCampoObrigatorio) then
    abort;

   try
     if Gravar(EstadoDoCadastro) then //m�todo virtual
     begin
       ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                        btnApagar, btnNavigator, pgcPrincipal,true);
       ControlarIndiceTab(pgcPrincipal, 0);
       EstadoDoCadastro := ecNenhum;
       LimparEdit;
       qryListagem.Refresh;
     end
     else begin
       MessageDlg('Erro na Grava��o', mtError, [mbOK], 0);
     end;
   finally
   end;
end;

{$endregion}

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvarGrid;
  qryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin

    qryListagem.Connection := dtmPrincipal.ConexaoDB;
    dtsListagem.DataSet    := qryListagem;
    grdListagem.DataSource := dtsListagem;
    grdListagem.Options    := [dgTitles,dgIndicator,dgColumnResize,dgColLines,
                                dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,
                                dgCancelOnExit,dgTitleClick,dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
   if (qryListagem.SQL.Text<>EmptyStr) then
   begin
     qryListagem.IndexFieldNames := IndiceAtual;
     ExibirLabelIndice(IndiceAtual, lblIndice);
     qryListagem.Open;
   end;

   ControlarIndiceTab(pgcPrincipal, 0);
   DesabilitarEditPK;
   ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                      btnApagar, btnNavigator, pgcPrincipal,true);
  CarregarGrid;                      
end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
   btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
          Column: TColumn; State: TGridDrawState);
var
  i, j, k: integer;
  btm: TBitmap;
begin
  for j := 0 to grdListagem.Columns.Count - 1 do
  begin
    grdListagem.Columns[j].Title.Alignment := taCenter;
  end;

  //zebrar
  if not (gdSelected in State) then
  begin
    if Odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
      (Sender as TDBGrid).Canvas.Brush.Color := clWhite
    else
      (Sender as TDBGrid).Canvas.Brush.Color := $C0C0C0; // leve cinza

    // Aplicando prto para a cor da fonte
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    //Utiliza o desenho padr�o dos componentes
    grdListagem.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  //seta a img dos status nas colunas
  if Column.FieldName = 'statusDescricao' then
  begin
    grdListagem.Canvas.FillRect(Rect);
    btm := TBitmap.Create;
    try
      if Column.Grid.Fields[0].AsString = 'Ativo' then
        ImageList1.GetBitmap(0, btm)
      else if Column.Grid.Fields[0].AsString = 'Bloqueado' then
        ImageList1.GetBitmap(1, btm)
      else if Column.Grid.Fields[0].AsString = 'Aten��o' then
        ImageList1.GetBitmap(2, btm)
      else if Column.Grid.Fields[0].AsString = 'Inativo' then
        ImageList1.GetBitmap(3, btm)
      else if Column.Grid.Fields[0].AsString = 'Prospecto' then
        ImageList1.GetBitmap(4, btm);

      grdListagem.Canvas.Draw(Rect.Left, Rect.Top, btm);
    finally
      btm.Free;
    end;
  end;
end;

function TfrmTelaHeranca.SomenteNumero(str : string) : string;
var
  I : Byte;
begin
   Result := '';
   for I := 1 To Length(str) do
       if str [I] In ['0'..'9'] Then
            Result := Result + str [I];
end;

procedure TfrmTelaHeranca.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
   IndiceAtual := Column.FieldName;
   qryListagem.IndexFieldNames := IndiceAtual;
   ExibirLabelIndice(IndiceAtual, lblIndice);
end;

//procedure para fazer a pesquisa na lista
procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
   qryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmTelaHeranca.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
begin
  //Bloqueia o CTRL + DEL
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TfrmTelaHeranca.CarregarGrid;
var
  cCaminho, cArquivo: String;
begin
  cCaminho := ExtractFilePath(ParamStr(0)) + '\Grid\';
  cArquivo := Self.Name + '_' + grdListagem.Name + '.abobrinha';
  if(FileExists(cCaminho + cArquivo))then
    grdListagem.Columns.LoadFromFile(cCaminho + cArquivo);
end;

procedure TfrmTelaHeranca.SalvarGrid;
var
  cCaminho, cArquivo: String;
begin
  cCaminho := ExtractFilePath(ParamStr(0)) + '\Grid\';
  ForceDirectories(cCaminho);
  cArquivo := Self.Name + '_' + grdListagem.Name + '.abobrinha';
  grdListagem.Columns.SaveToFile(cCaminho + cArquivo);
end;

end.
