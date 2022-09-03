object frmRelCadProdutoGrupoCategoria: TfrmRelCadProdutoGrupoCategoria
  Left = 0
  Top = 0
  Caption = 'frmRelCadProdutoGrupoCategoria'
  ClientHeight = 381
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsProduto
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
        Width = 372
        Height = 24
        Caption = 'Listagem de Produtos por Categoria'
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
      Height = 186
      DataFields = 'categoriaId'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLDBText5: TRLDBText
          Left = 131
          Top = 0
          Width = 125
          Height = 16
          DataField = 'DescricaoCategoria'
          DataSource = dtsProduto
          Text = ''
        end
        object RLLabel7: TRLLabel
          Left = 1
          Top = 0
          Width = 84
          Height = 16
          Caption = 'CATEGORIA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText6: TRLDBText
          Left = 55
          Top = 0
          Width = 67
          Height = 16
          Alignment = taRightJustify
          DataField = 'categoriaId'
          DataSource = dtsProduto
          Text = ''
        end
        object RLLabel8: TRLLabel
          Left = 123
          Top = -1
          Width = 8
          Height = 16
          Alignment = taCenter
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
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
            Width = 115
            Height = 16
            Caption = 'Nome do Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel5: TRLLabel
            Left = 420
            Top = 0
            Width = 88
            Height = 16
            Caption = 'Qtde Estoque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel6: TRLLabel
            Left = 622
            Top = 0
            Width = 92
            Height = 16
            Alignment = taRightJustify
            Caption = 'Valor Unit'#225'rio'
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
          Width = 57
          Height = 16
          DataField = 'produtoId'
          DataSource = dtsProduto
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 76
          Top = 0
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsProduto
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 441
          Top = 0
          Width = 67
          Height = 16
          Alignment = taRightJustify
          DataField = 'quantidade'
          DataSource = dtsProduto
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 684
          Top = 0
          Width = 30
          Height = 16
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = dtsProduto
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
          Left = 608
          Top = 8
          Width = 106
          Height = 16
          Alignment = taRightJustify
          DataField = 'quantidade'
          DataSource = dtsProduto
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
        object RLDBResult2: TRLDBResult
          Left = 645
          Top = 28
          Width = 69
          Height = 16
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = dtsProduto
          Info = riSum
          Text = ''
        end
        object RLLabel9: TRLLabel
          Left = 420
          Top = 8
          Width = 183
          Height = 16
          Caption = 'Qtde Estoque por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 407
          Top = 28
          Width = 196
          Height = 16
          Caption = 'M'#233'dia de Valor por Categoria:'
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
  end
  object qryProduto: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT  produtos.produtoId,'
      '        produtos.nome,'
      '        produtos.descricao,'
      #9'      produtos.quantidade,'
      #9'      produtos.valor,'
      '        produtos.categoriaId,'
      '        categorias.descricao AS DescricaoCategoria'
      #9'FROM produtos'
      
        '        LEFT JOIN categorias on categorias.CategoriaId = produto' +
        's.CategoriaId'
      #9'ORDER BY produtos.categoriaId, produtos.produtoId')
    Params = <>
    Left = 112
    object qryProdutoprodutoId: TIntegerField
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object qryProdutonome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryProdutoquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = '###,###,##0'
    end
    object qryProdutovalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = 'R$ ###,###,##0.00'
    end
    object qryProdutodescricao: TWideStringField
      FieldName = 'descricao'
      Size = 255
    end
    object qryProdutocategoriaId: TIntegerField
      FieldName = 'categoriaId'
    end
    object qryProdutoDescricaoCategoria: TWideStringField
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object dtsProduto: TDataSource
    DataSet = qryProduto
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
