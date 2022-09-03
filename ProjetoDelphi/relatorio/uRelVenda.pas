unit uRelVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RLFilters, RLPDFFilter,
  RLReport, RLXLSXFilter, RLXLSFilter;

type
  TfrmRelVenda = class(TForm)
    qryVenda: TZQuery;
    dtsVenda: TDataSource;
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
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    BandaDeGrupo: TRLGroup;
    RLBand3: TRLBand;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText6: TRLDBText;
    RLBand5: TRLBand;
    RLDBResult2: TRLDBResult;
    RLDraw4: TRLDraw;
    RLLabel5: TRLLabel;
    qryVendaItens: TZQuery;
    dtsVendaItens: TDataSource;
    qryVendavendaId: TIntegerField;
    qryVendaclienteId: TIntegerField;
    qryVendanome: TWideStringField;
    qryVendadataVenda: TDateTimeField;
    qryVendatotalVenda: TFloatField;
    qryVendaItensvendaId: TIntegerField;
    qryVendaItensprodutoId: TIntegerField;
    qryVendaItensnome: TWideStringField;
    qryVendaItensquantidade: TFloatField;
    qryVendaItensvalorUnitario: TFloatField;
    qryVendaItenstotalProduto: TFloatField;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel10: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand2: TRLBand;
    RLBand4: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDraw3: TRLDraw;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVenda: TfrmRelVenda;

implementation

{$R *.dfm}

procedure TfrmRelVenda.FormDestroy(Sender: TObject);
begin
  qryVenda.Close;
  qryVendaItens.Close;
end;

end.
