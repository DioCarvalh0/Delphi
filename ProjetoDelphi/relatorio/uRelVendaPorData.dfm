object frmRelVendaPorData: TfrmRelVendaPorData
  Left = 0
  Top = 0
  Caption = 'frmRelVendaPorData'
  ClientHeight = 381
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsVenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 57
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 1
        Top = 16
        Width = 291
        Height = 24
        Caption = 'Listagem de Venda por Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 40
        Width = 718
        Height = 17
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 281
      Width = 718
      Height = 39
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 16
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 659
        Top = 16
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 696
        Top = 16
        Width = 20
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 688
        Top = 16
        Width = 17
        Height = 16
        Caption = '/'
      end
      object RLLabel3: TRLLabel
        Left = 621
        Top = 16
        Width = 53
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object BandaDeGrupo: TRLGroup
      Left = 38
      Top = 95
      Width = 718
      Height = 138
      DataFields = 'dataVenda'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel7: TRLLabel
          Left = 1
          Top = 0
          Width = 43
          Height = 16
          Caption = 'DATA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText6: TRLDBText
          Left = 50
          Top = 0
          Width = 66
          Height = 16
          DataField = 'dataVenda'
          DataSource = dtsVenda
          Text = ''
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 17
        Width = 718
        Height = 16
        BandType = btColumnHeader
        object RLPanel1: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 16
          Align = faClient
          Color = clInfoBk
          ParentColor = False
          Transparent = False
          object codigo: TRLLabel
            Left = 1
            Top = 0
            Width = 49
            Height = 16
            Caption = 'C'#243'digo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel4: TRLLabel
            Left = 76
            Top = 0
            Width = 110
            Height = 16
            Caption = 'Nome do Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel6: TRLLabel
            Left = 611
            Top = 0
            Width = 103
            Height = 16
            Alignment = taRightJustify
            Caption = 'Valor da Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 16
        object RLDBText1: TRLDBText
          Left = 4
          Top = 0
          Width = 52
          Height = 16
          DataField = 'clienteId'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 76
          Top = 0
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 648
          Top = 0
          Width = 66
          Height = 16
          Alignment = taRightJustify
          DataField = 'totalVenda'
          DataSource = dtsVenda
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 49
        Width = 718
        Height = 56
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 610
          Top = 8
          Width = 105
          Height = 16
          Alignment = taRightJustify
          DataField = 'totalVenda'
          DataSource = dtsVenda
          Info = riSum
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 0
          Width = 718
          Height = 8
          DrawKind = dkLine
        end
        object RLLabel9: TRLLabel
          Left = 506
          Top = 8
          Width = 98
          Height = 16
          Caption = 'Total por Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 233
      Width = 718
      Height = 48
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 610
        Top = 16
        Width = 105
        Height = 16
        Alignment = taRightJustify
        DataField = 'totalVenda'
        DataSource = dtsVenda
        Info = riSum
        Text = ''
      end
      object RLDraw4: TRLDraw
        Left = 0
        Top = 8
        Width = 718
        Height = 8
        DrawKind = dkLine
      end
      object RLLabel5: TRLLabel
        Left = 506
        Top = 16
        Width = 79
        Height = 16
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
  end
  object qryVenda: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT  vendas.vendaId,'
      '        vendas.clienteId,'
      '        clientes.nome,'
      '        vendas.dataVenda,'
      '        vendas.totalVenda'
      '  FROM vendas'
      
        '        INNER JOIN clientes on clientes.clienteId = vendas.clien' +
        'teId'
      '  WHERE vendas.dataVenda BETWEEN :DataInicio AND :DataFim'
      '  ORDER BY vendas.dataVenda, vendas.clienteId')
    Params = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/06/2022'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = '30/06/2022'
      end>
    Left = 112
    ParamData = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/06/2022'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = '30/06/2022'
      end>
    object qryVendavendaId: TIntegerField
      FieldName = 'vendaId'
      ReadOnly = True
    end
    object qryVendaclienteId: TIntegerField
      FieldName = 'clienteId'
      Required = True
    end
    object qryVendanome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryVendadataVenda: TDateTimeField
      FieldName = 'dataVenda'
      Required = True
    end
    object qryVendatotalVenda: TFloatField
      FieldName = 'totalVenda'
      Required = True
      DisplayFormat = 'R$ ###,###,##0.00'
    end
  end
  object dtsVenda: TDataSource
    DataSet = qryVenda
    Left = 256
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 192
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 312
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 360
    Top = 8
  end
end
