object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 305
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stbPrincipal: TStatusBar
    Left = 0
    Top = 286
    Width = 626
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object mainPrincipal: TMainMenu
    Left = 24
    Top = 16
    object CADASTRO1: TMenuItem
      Caption = 'CADASTRO'
      object mniCliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = mniCliente1Click
      end
      object mniN1: TMenuItem
        Caption = '-'
      end
      object Categoria1: TMenuItem
        Caption = 'Categoria'
        OnClick = Categoria1Click
      end
      object Subcategoria1: TMenuItem
        Caption = 'Subcategoria'
        OnClick = Subcategoria1Click
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
        OnClick = Produto1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Usurio1: TMenuItem
        Caption = 'Usu'#225'rio'
        OnClick = Usurio1Click
      end
      object AoAcesso1: TMenuItem
        Caption = 'A'#231#227'o Acesso'
        OnClick = AoAcesso1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object UsuriosVsAes1: TMenuItem
        Caption = 'Usu'#225'rios Vs A'#231#245'es'
        OnClick = UsuriosVsAes1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object AlterarSenha1: TMenuItem
        Caption = 'Alterar Senha'
        OnClick = AlterarSenha1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuFechar: TMenuItem
        Caption = 'Fechar'
        OnClick = mnuFecharClick
      end
    end
    object MOVIMENTAO1: TMenuItem
      Caption = 'MOVIMENTA'#199#195'O'
      object Venda1: TMenuItem
        Caption = 'Venda'
        OnClick = Venda1Click
      end
    end
    object RELATRIO1: TMenuItem
      Caption = 'RELAT'#211'RIOS'
      object Categoria2: TMenuItem
        Caption = 'Categoria'
        OnClick = Categoria2Click
      end
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object FICHADECLIENTE1: TMenuItem
        Caption = 'Ficha de Cliente'
        OnClick = FICHADECLIENTE1Click
      end
      object mniN2: TMenuItem
        Caption = '-'
      end
      object Produto2: TMenuItem
        Caption = 'Produto'
        OnClick = Produto2Click
      end
      object ProdutosporCategoria1: TMenuItem
        Caption = 'Produtos por Categoria'
        OnClick = ProdutosporCategoria1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Vendapordata1: TMenuItem
        Caption = 'Venda por data'
        OnClick = Vendapordata1Click
      end
    end
  end
end
