object dtmVendas: TdtmVendas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 195
  Width = 581
  object qryCliente: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT clienteId, nome FROM clientes')
    Params = <>
    Left = 40
    Top = 16
    object qryClienteclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryClientenome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
  end
  object qryProdutos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT produtoId, nome, valor, quantidade FROM produtos')
    Params = <>
    Left = 104
    Top = 16
    object qryProdutosprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object qryProdutosnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryProdutosvalor: TFloatField
      FieldName = 'valor'
    end
    object qryProdutosquantidade: TFloatField
      FieldName = 'quantidade'
    end
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 16
    object cdsItensVendaprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
    end
    object cdsItensVendaNomeProduto: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'NomeProduto'
      Size = 60
    end
    object cdsItensVendaquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object cdsItensVendavalorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'valorUnitario'
    end
    object cdsItensVendavalorTotalProduto: TFloatField
      DisplayLabel = 'Total do Produto'
      FieldName = 'valorTotalProduto'
    end
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 40
    Top = 72
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 104
    Top = 72
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 176
    Top = 72
  end
end
