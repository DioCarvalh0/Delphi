unit uRelClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RLFilters, RLPDFFilter,
  RLReport, RLXLSXFilter, RLXLSFilter, Vcl.Imaging.pngimage;

type
  TfrmRelClienteFicha = class(TForm)
    qryClientes: TZQuery;
    dtsClientes: TDataSource;
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    qryClientesclienteId: TIntegerField;
    qryClientesnome: TWideStringField;
    qryClientesemail: TWideStringField;
    qryClientestelefone: TWideStringField;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    qryClientescep: TWideStringField;
    qryClientesendereco: TWideStringField;
    qryClientesbairro: TWideStringField;
    qryClientescidade: TWideStringField;
    qryClientesdataNascimento: TDateTimeField;
    codigo: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText10: TRLDBText;
    RLLabel13: TRLLabel;
    RLDBText11: TRLDBText;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    RLDraw3: TRLDraw;
    RLImage1: TRLImage;
    RLAngleLabel1: TRLAngleLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClienteFicha: TfrmRelClienteFicha;

implementation

{$R *.dfm}

procedure TfrmRelClienteFicha.FormCreate(Sender: TObject);
begin
  qryClientes.Open;
end;

procedure TfrmRelClienteFicha.FormDestroy(Sender: TObject);
begin
  qryClientes.Close;
end;

end.
