inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 435
  ClientWidth = 879
  ExplicitWidth = 895
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 452
    Top = 181
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label7: TLabel [1]
    Left = 452
    Top = 84
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label8: TLabel [2]
    Left = 456
    Top = 105
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  inherited pgcPrincipal: TPageControl
    Width = 879
    Height = 397
    ExplicitWidth = 879
    ExplicitHeight = 397
    inherited tabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 871
      ExplicitHeight = 369
      inherited pnlListagemTopo: TPanel
        Width = 871
        ExplicitWidth = 871
        inherited btnPesquisar: TBitBtn
          Left = 199
          Top = -8
          ExplicitLeft = 199
          ExplicitTop = -8
        end
        object GroupBox1: TGroupBox
          Left = 642
          Top = -3
          Width = 234
          Height = 72
          Anchors = [akTop, akRight]
          TabOrder = 2
          object Image1: TImage
            Left = 16
            Top = 6
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              0000100000000100180000000000000300001017000010170000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0E3
              902AB419009900019A00019A000099002AB419A1E391FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF44BF31019A000DA60025BE0037D00034CD0022BB00
              0EA700019A0043BE31FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF43BE31059E0025BE
              0035CE0033CC0031CA0031CA0031CA0031CA001EB700049D0041BD31FFFFFFFF
              FFFFFFFFFF9EE091019A0021BA002FC8002AC30026BF0024BD0023BC0024BD00
              26BF002AC3001BB400019A009CDE91FFFFFFFFFFFF26B0190CA50028C10023BC
              001DB60019B20017B00016AF0017B00019B2001DB60022BB0007A00024AE19FF
              FFFFFFFFFF00990018B1001EB70017B00011AA000CA5000AA30009A2000AA300
              0CA50011AA0017B00010A900009900FFFFFFFFFFFF00990019B20014AD000CA5
              00059E000199010B9D0B0E9F0E0B9D0B019901059E000CA50012AB00009900FF
              FFFFFFFFFF00990013AC000AA300019A0015A11527A92733AD3337AF3733AD33
              27A92715A115019A0009A200009900FFFFFFFFFFFF00990008A100019A001CA4
              1C37AF374DB84D5CBE5C61C0615CBE5C4DB84D37AF371CA41C019A00009900FF
              FFFFFFFFFF1DA719019A0015A11537AF3757BC5771C67183CD838AD08A83CD83
              71C67157BC5735AE35059B051AA419FFFFFFFFFFFF92D5900099001AA41A4DB8
              4D71C67191D391AADDAAB3E1B3AADDAA91D39171C6712FAC2F00990091D391FF
              FFFFFFFFFFFFFFFF33AD33059B053EB23E81CC81AADDAACCEBCCDDF1DDCCEBCC
              A6DBA654BA54069B063EB13EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FB23F029A
              0226A82678C978CDEACDEFF9EF8CD18C29AA29029A0249B649FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFA1DAA135AE35019901019901019901019901
              3EB13EA9DDA9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
          end
          object Image2: TImage
            Left = 16
            Top = 26
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              0000100000000100180000000000000300001017000010170000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABF2
              FF36DBFF01CCFF01CCFF01CCFF01CCFF35DAFFABF2FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF51E0FF01CCFF16D3FF41E2FF5FECFF59EAFF3ADFFF
              18D4FF01CCFF4FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FDFFF08CFFF40E1
              FF5EEBFF5BEAFF58E9FF57E9FF58E9FF57E9FF36DEFF06CEFF4CDFFFFFFFFFFF
              FFFFFFFFFFA7F0FF02CDFF3ADFFF54E8FF4DE6FF47E4FF44E3FF43E2FF44E3FF
              47E4FF4DE6FF31DCFF01CCFFA4EFFFFFFFFFFFFFFF2FD8FF15D3FF4AE4FF42E2
              FF3ADFFF34DDFF31DCFF2FDCFF31DCFF34DDFF3ADFFF40E1FF0ED1FF2CD7FFFF
              FFFFFFFFFF00CCFF2CDBFF3BE0FF31DCFF28D9FF21D7FF1DD6FF1BD5FF1DD6FF
              21D7FF28D9FF31DCFF20D7FF00CCFFFFFFFFFFFFFF00CCFF33DDFF2BDAFF1FD6
              FF16D3FF0ED1FF09CFFF07CEFF09CFFF0ED1FF16D3FF1FD6FF26D8FF00CCFFFF
              FFFFFFFFFF00CCFF28D9FF1DD6FF0FD1FF04CDFF0BCEFF18D1FF1DD2FF18D1FF
              0BCEFF04CDFF0FD1FF19D5FF00CCFFFFFFFFFFFFFF00CCFF14D2FF0FD1FF00CC
              FF1DD2FF35D7FF45DAFF4ADBFF45DAFF35D7FF1DD2FF00CCFF09CFFF00CCFFFF
              FFFFFFFFFF22D4FF05CEFF04CDFF1DD2FF3FD9FF5CDEFF70E2FF77E4FF70E2FF
              5CDEFF3FD9FF1CD2FF01CCFF1ED3FFFFFFFFFFFFFF96EBFF00CCFF07CDFF35D7
              FF5CDEFF7FE5FF9AEBFFA5EDFF9AEBFF7FE5FF5CDEFF20D3FF00CCFF94EAFFFF
              FFFFFFFFFFFFFFFF33D7FF02CDFF2ED5FF6EE2FF9AEBFFBFF2FFD2F6FFBFF2FF
              96EAFF48DAFF05CDFF37D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF38D7FF01CC
              FF21D3FF6FE2FFC2F3FFEFFCFF85E7FF26D4FF01CCFF44DAFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF9DEBFF31D6FF01CCFF01CCFF01CCFF01CCFF
              3AD7FFA5EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
          end
          object Image3: TImage
            Left = 16
            Top = 46
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              0000100000000100180000000000000300001017000010170000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90B0
              E6193CB900019900019A00019A000199193BB991B0E7FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF3157C600029A001AAD004DD50070F30069EE0044CF
              001CAF00029A3155C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3155C6000AA1004A
              D8006CFD0069FF0065FF0063FF0065FF0065FB003ED200089F3151C6FFFFFFFF
              FFFFFFFFFF91ABE600029B0043D9005FFF0056FF004EFF004AFF0049FF004AFF
              004EFF0056FF0037D400019A91A8E6FFFFFFFFFFFF1932B90018B20053FD0047
              FF003DFF0035FF0030FF002EFF0030FF0035FF003DFF0044FB000FAB192FB9FF
              FFFFFFFFFF0000990031D9003EFF0030FF0024FF001BFF0016FF0013FF0016FF
              001BFF0024FF0030FF0022D1000099FFFFFFFFFFFF0000990035F5002AFF0019
              FF000CFF0002FF0707FF0B0BFF0707FF0002FF000CFF0019FF0025F3000099FF
              FFFFFFFFFF0000990027F90016FF0004FF1212FF2424FF3030FF3434FF3030FF
              2424FF1212FF0004FF0013F1000099FFFFFFFFFFFF0000990010D90004FF1919
              FF3434FF4A4AFF5858FF5D5DFF5858FF4A4AFF3434FF1919FF0002D4000099FF
              FFFFFFFFFF1921B90003B11212FD3434FF5454FF6E6EFF8080FF8787FF8080FF
              6E6EFF5454FF3232FC0404AF191CB9FFFFFFFFFFFF9095E600009A1818DD4A4A
              FF6E6EFF8E8EFFA6A6FFB0B0FFA6A6FF8E8EFF6E6EFF2D2DD700009A9191E6FF
              FFFFFFFFFFFFFFFF3333C60505A33B3BDD7E7EFDA6A6FFC8C8FFD9D9FFC8C8FF
              A2A2FD5252DB0606A03D3DC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3EC60101
              9B2626B57676DDC9C9F7EFEFF98989D92929B102029A4848C6FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFA1A1E63535B9010199010199010199010199
              3D3DB9A8A8E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
          end
          object Image4: TImage
            Left = 120
            Top = 6
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              0000100000000100180000000000000300001017000010170000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBA
              90FD4819FF0100FF0200FF0200FF0100FC4619FDBB91FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFC6531FF0200FC2500F46C00EE9F00EF9600F56100
              FB2700FF0200FC6231FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6131FE0E00F36B
              00E9A100E79E00E69A00E59900E69A00E89800F25D00FE0B00FA5E31FFFFFFFF
              FFFFFFFFFFFCB591FF0300F06500E49500E28B00E08400DF8000DF7E00DF8000
              E08400E28B00EF5600FF0200FBB291FFFFFFFFFFFFFA3D19F92500E38600DE7D
              00DC7100DA6A00D86500D86300D86500DA6A00DC7100DF7900FA1900FA3A19FF
              FFFFFFFFFFFF0100EC5200DC7300D86500D65900D35000D24B00D14900D24B00
              D35000D65900D86500EC3F00FF0100FFFFFFFFFFFFFF0000DF6600D75E00D34E
              00CF4100CD3600CD3604CE3908CD3604CD3600CF4100D34E00DC5300FF0000FF
              FFFFFFFFFFFF0000DA5800D24B00CD3900CF3F0FD34D21D5572DD65A31D5572D
              D34D21CF3F0FCD3900D84100FF0000FFFFFFFFFFFFFF0000E33100CD3900D045
              16D65A31DA6C47DD7755DE7B5ADD7755DA6C47D65A31D04516E22100FF0000FF
              FFFFFFFFFFF62C19F40F00D03E0FD65A31DC7350E1886AE5977DE69C83E5977D
              E1886ADC7350D7572FF40E03F52719FFFFFFFFFFFFF79F90FE0100E23316DA6C
              47E1886AE8A28BEDB5A3EFBDADEDB5A3E8A28BE1886AE9412BFE0100F69B91FF
              FFFFFFFFFFFFFFFFF33F32FB0905E85039E5957BEDB5A3F3D1C5F7DED6F3D1C5
              EDB19FEE6150FD0806F4473CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4483DFE02
              01F82B24F47F74F8CDC6FFEFEFFA8C87FB2C28FF0202F75048FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A7A0FA3934FF0101FF0101FF0101FF0101
              FB403CFAADA8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
          end
          object Image5: TImage
            Left = 120
            Top = 26
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              0000100000000100180000000000000300001017000010170000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A
              9A2424240000000000000000000000002424249B9B9BFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF3E3E3E0101010A0A0A1E1E1E2D2D2D2B2B2B1B1B1B
              0B0B0B0101013E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3E0404042020
              203232323333333333333333333333333131311D1D1D0303033E3E3EFFFFFFFF
              FFFFFFFFFF9A9A9A010101202020333333333333333333333333333333333333
              3333333333331E1E1E0101019A9A9AFFFFFFFFFFFF2424240C0C0C3232323333
              33333333333333333333333333333333333333333333313131090909242424FF
              FFFFFFFFFF000000202020333333333333333333333333333333333333333333
              3333333333333333331C1C1C000000FFFFFFFFFFFF0000002E2E2E3333333333
              333333333333333333333333333333333333333333333333332D2D2D000000FF
              FFFFFFFFFF000000303030333333333333333333393939444444484848444444
              3939393333333333332C2C2C000000FFFFFFFFFFFF0000002020203333333333
              334848485B5B5B6868686D6D6D6868685B5B5B4848483333331D1D1D000000FF
              FFFFFFFFFF2424240C0C0C3232324848486464647B7B7B8B8B8B9191918B8B8B
              7B7B7B6464644646460B0B0B242424FFFFFFFFFFFF9A9A9A0101012626265B5B
              5B7B7B7B989898ADADADB6B6B6ADADAD9898987B7B7B3737370101019A9A9AFF
              FFFFFFFFFFFFFFFF3E3E3E070707464646898989ADADADCCCCCCDBDBDBCCCCCC
              A9A9A9595959070707424242FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4343430202
              022828287A7A7ACBCBCBEFEFEF8A8A8A2A2A2A0202024C4C4CFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4373737010101010101010101010101
              3E3E3EABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
          end
          object Label6: TLabel
            Left = 38
            Top = 7
            Width = 31
            Height = 13
            Caption = 'ATIVO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 38
            Top = 27
            Width = 48
            Height = 13
            Caption = 'ATEN'#199#195'O'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 38
            Top = 47
            Width = 62
            Height = 13
            Caption = 'BLOQUEADO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 142
            Top = 7
            Width = 60
            Height = 13
            Caption = 'PROSPECTO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 142
            Top = 27
            Width = 42
            Height = 13
            Caption = 'INATIVO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
        end
        object btnFiltro: TButton
          Left = 375
          Top = 23
          Width = 96
          Height = 21
          Caption = 'Filtrar por:'
          DoubleBuffered = False
          DropDownMenu = ppmFiltro
          ParentDoubleBuffered = False
          Style = bsSplitButton
          TabOrder = 3
          OnClick = btnFiltroClick
        end
        object Panel2: TPanel
          Left = 477
          Top = 23
          Width = 24
          Height = 21
          TabOrder = 4
          object imgFiltro: TImage
            Left = 1
            Top = 1
            Width = 22
            Height = 19
            Align = alClient
            AutoSize = True
            Center = True
            ExplicitLeft = 9
            ExplicitTop = 0
          end
        end
      end
      inherited grdListagem: TDBGrid
        Width = 871
        Height = 304
        Columns = <
          item
            Expanded = False
            FieldName = 'statusDescricao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpfCnpj'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      OnShow = tabManutencaoShow
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 871
      ExplicitHeight = 369
      object Label1: TLabel
        Left = 448
        Top = 108
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label3: TLabel
        Left = 448
        Top = 203
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label4: TLabel
        Left = 8
        Top = 253
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
      end
      object Label5: TLabel
        Left = 268
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object Label14: TLabel
        Left = 141
        Top = 16
        Width = 34
        Height = 13
        Caption = 'Pessoa'
      end
      object lblCPFCNPJ: TLabel
        Left = 448
        Top = 59
        Width = 48
        Height = 13
        Caption = 'CPF/CNPJ'
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 8
        Top = 75
        Width = 405
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 3
      end
      object edtClienteId: TLabeledEdit
        Tag = 1
        Left = 8
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtCEP: TMaskEdit
        Left = 448
        Top = 123
        Width = 254
        Height = 21
        MaxLength = 9
        TabOrder = 6
        Text = ''
        OnChange = edtCEPChange
      end
      object edtEndereco: TLabeledEdit
        Left = 8
        Top = 123
        Width = 405
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 5
      end
      object edtBairro: TLabeledEdit
        Left = 448
        Top = 171
        Width = 254
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 8
      end
      object edtCidade: TLabeledEdit
        Left = 8
        Top = 171
        Width = 405
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 7
      end
      object edtEmail: TLabeledEdit
        Left = 8
        Top = 219
        Width = 405
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Email'
        MaxLength = 100
        TabOrder = 9
      end
      object edtDataNascimento: TDateEdit
        Left = 8
        Top = 267
        Width = 153
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a Data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 11
      end
      object lkpStatus: TDBLookupComboBox
        Tag = 3
        Left = 268
        Top = 32
        Width = 115
        Height = 21
        KeyField = 'statusId'
        ListField = 'descricao'
        ListSource = dtsStatus
        TabOrder = 1
        OnClick = lkpStatusClick
      end
      object lkpPessoa: TDBLookupComboBox
        Tag = 3
        Left = 141
        Top = 32
        Width = 115
        Height = 21
        KeyField = 'pessoaId'
        ListField = 'descricao'
        ListSource = dtsPessoa
        TabOrder = 2
        OnClick = lkpPessoaClick
      end
      object edtCPFCNPJ: TEdit
        Left = 448
        Top = 75
        Width = 254
        Height = 21
        NumbersOnly = True
        TabOrder = 4
        OnChange = edtCPFCNPJChange
        OnEnter = edtCPFCNPJEnter
      end
      object edtTelefone: TEdit
        Left = 448
        Top = 219
        Width = 254
        Height = 21
        MaxLength = 15
        NumbersOnly = True
        TabOrder = 10
        OnChange = edtTelefoneChange
      end
      object Panel1: TPanel
        Left = 389
        Top = 32
        Width = 24
        Height = 21
        TabOrder = 12
        object imgLkpStatus: TImage
          Left = 1
          Top = 1
          Width = 22
          Height = 19
          Align = alClient
          AutoSize = True
          Center = True
          ExplicitLeft = 0
          ExplicitWidth = 25
        end
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 397
    Width = 879
    ExplicitTop = 397
    ExplicitWidth = 879
    inherited btnFechar: TBitBtn
      Left = 791
      ExplicitLeft = 791
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT c.clienteId,c.nome, c.endereco, c.cpfCnpj,'
      '       c.cidade, c.bairro, c.cep,'
      '       c.telefone, c.email, c.dataNascimento,'
      '       s.descricao AS statusDescricao,'
      '       p.descricao AS pessoaDescricao'
      '   FROM clientes AS c'
      '  INNER JOIN statusClientes as s ON s.statusId = c.statusId'
      '  INNER JOIN pessoa as p ON p.pessoaId = c.pessoaId')
    Left = 516
    Top = 328
    object qryListagemstatusDescricao: TWideStringField
      DisplayLabel = ' '
      FieldName = 'statusDescricao'
      Required = True
      OnGetText = qryListagemstatusDescricaoGetText
      Size = 30
    end
    object qryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object qryListagemendereco: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 60
    end
    object qryListagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object qryListagembairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 40
    end
    object qryListagemcep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object qryListagemtelefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
    object qryListagememail: TWideStringField
      DisplayLabel = 'Email'
      FieldName = 'email'
      Size = 100
    end
    object qryListagemdataNascimento: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'dataNascimento'
    end
    object qryListagempessoaDescricao: TWideStringField
      FieldName = 'pessoaDescricao'
      Size = 30
    end
    object qryListagemcpfCnpj: TWideStringField
      FieldName = 'cpfCnpj'
      Size = 30
    end
  end
  inherited dtsListagem: TDataSource
    Left = 588
    Top = 328
  end
  object qryStatus: TZQuery [7]
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT statusId, descricao FROM statusClientes')
    Params = <>
    Left = 660
    Top = 328
    object qryStatusdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
    object qryStatusstatusId: TIntegerField
      FieldName = 'statusId'
      ReadOnly = True
    end
  end
  object dtsStatus: TDataSource [8]
    DataSet = qryStatus
    Left = 716
    Top = 320
  end
  inherited ImageList1: TImageList
    Left = 780
    Top = 136
  end
  object qryPessoa: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT pessoaId, descricao FROM pessoa')
    Params = <>
    Left = 724
    Top = 256
    object qryPessoapessoaId: TIntegerField
      FieldName = 'pessoaId'
      ReadOnly = True
    end
    object qryPessoadescricao: TWideStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dtsPessoa: TDataSource
    DataSet = qryPessoa
    Left = 780
    Top = 256
  end
  object ppmFiltro: TPopupMenu
    Images = ImageList1
    Left = 596
    Top = 40
    object NENHUM1: TMenuItem
      Caption = 'NENHUM'
      OnClick = NENHUM1Click
    end
    object ATIVO1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000010170000101700000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0E3902AB41900990001
        9A00019A000099002AB419A1E391FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF44BF31019A000DA60025BE0037D00034CD0022BB000EA700019A0043BE
        31FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF43BE31059E0025BE0035CE0033CC0031
        CA0031CA0031CA0031CA001EB700049D0041BD31FFFFFFFFFFFFFFFFFF9EE091
        019A0021BA002FC8002AC30026BF0024BD0023BC0024BD0026BF002AC3001BB4
        00019A009CDE91FFFFFFFFFFFF26B0190CA50028C10023BC001DB60019B20017
        B00016AF0017B00019B2001DB60022BB0007A00024AE19FFFFFFFFFFFF009900
        18B1001EB70017B00011AA000CA5000AA30009A2000AA3000CA50011AA0017B0
        0010A900009900FFFFFFFFFFFF00990019B20014AD000CA500059E000199010B
        9D0B0E9F0E0B9D0B019901059E000CA50012AB00009900FFFFFFFFFFFF009900
        13AC000AA300019A0015A11527A92733AD3337AF3733AD3327A92715A115019A
        0009A200009900FFFFFFFFFFFF00990008A100019A001CA41C37AF374DB84D5C
        BE5C61C0615CBE5C4DB84D37AF371CA41C019A00009900FFFFFFFFFFFF1DA719
        019A0015A11537AF3757BC5771C67183CD838AD08A83CD8371C67157BC5735AE
        35059B051AA419FFFFFFFFFFFF92D5900099001AA41A4DB84D71C67191D391AA
        DDAAB3E1B3AADDAA91D39171C6712FAC2F00990091D391FFFFFFFFFFFFFFFFFF
        33AD33059B053EB23E81CC81AADDAACCEBCCDDF1DDCCEBCCA6DBA654BA54069B
        063EB13EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FB23F029A0226A82678C978CD
        EACDEFF9EF8CD18C29AA29029A0249B649FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA1DAA135AE350199010199010199010199013EB13EA9DDA9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'ATIVO'
      Hint = 'Ativo'
      ImageIndex = 0
      OnClick = ATIVO1Click
    end
    object BLOQ1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000010170000101700000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90B0E6193CB900019900
        019A00019A000199193BB991B0E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF3157C600029A001AAD004DD50070F30069EE0044CF001CAF00029A3155
        C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3155C6000AA1004AD8006CFD0069FF00
        65FF0063FF0065FF0065FB003ED200089F3151C6FFFFFFFFFFFFFFFFFF91ABE6
        00029B0043D9005FFF0056FF004EFF004AFF0049FF004AFF004EFF0056FF0037
        D400019A91A8E6FFFFFFFFFFFF1932B90018B20053FD0047FF003DFF0035FF00
        30FF002EFF0030FF0035FF003DFF0044FB000FAB192FB9FFFFFFFFFFFF000099
        0031D9003EFF0030FF0024FF001BFF0016FF0013FF0016FF001BFF0024FF0030
        FF0022D1000099FFFFFFFFFFFF0000990035F5002AFF0019FF000CFF0002FF07
        07FF0B0BFF0707FF0002FF000CFF0019FF0025F3000099FFFFFFFFFFFF000099
        0027F90016FF0004FF1212FF2424FF3030FF3434FF3030FF2424FF1212FF0004
        FF0013F1000099FFFFFFFFFFFF0000990010D90004FF1919FF3434FF4A4AFF58
        58FF5D5DFF5858FF4A4AFF3434FF1919FF0002D4000099FFFFFFFFFFFF1921B9
        0003B11212FD3434FF5454FF6E6EFF8080FF8787FF8080FF6E6EFF5454FF3232
        FC0404AF191CB9FFFFFFFFFFFF9095E600009A1818DD4A4AFF6E6EFF8E8EFFA6
        A6FFB0B0FFA6A6FF8E8EFF6E6EFF2D2DD700009A9191E6FFFFFFFFFFFFFFFFFF
        3333C60505A33B3BDD7E7EFDA6A6FFC8C8FFD9D9FFC8C8FFA2A2FD5252DB0606
        A03D3DC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3EC601019B2626B57676DDC9
        C9F7EFEFF98989D92929B102029A4848C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA1A1E63535B90101990101990101990101993D3DB9A8A8E6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'BLOQUEADO'
      Hint = 'Bloqueado'
      ImageIndex = 1
      OnClick = BLOQ1Click
    end
    object ATEN1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000010170000101700000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABF2FF36DBFF01CCFF01
        CCFF01CCFF01CCFF35DAFFABF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF51E0FF01CCFF16D3FF41E2FF5FECFF59EAFF3ADFFF18D4FF01CCFF4FDF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FDFFF08CFFF40E1FF5EEBFF5BEAFF58
        E9FF57E9FF58E9FF57E9FF36DEFF06CEFF4CDFFFFFFFFFFFFFFFFFFFFFA7F0FF
        02CDFF3ADFFF54E8FF4DE6FF47E4FF44E3FF43E2FF44E3FF47E4FF4DE6FF31DC
        FF01CCFFA4EFFFFFFFFFFFFFFF2FD8FF15D3FF4AE4FF42E2FF3ADFFF34DDFF31
        DCFF2FDCFF31DCFF34DDFF3ADFFF40E1FF0ED1FF2CD7FFFFFFFFFFFFFF00CCFF
        2CDBFF3BE0FF31DCFF28D9FF21D7FF1DD6FF1BD5FF1DD6FF21D7FF28D9FF31DC
        FF20D7FF00CCFFFFFFFFFFFFFF00CCFF33DDFF2BDAFF1FD6FF16D3FF0ED1FF09
        CFFF07CEFF09CFFF0ED1FF16D3FF1FD6FF26D8FF00CCFFFFFFFFFFFFFF00CCFF
        28D9FF1DD6FF0FD1FF04CDFF0BCEFF18D1FF1DD2FF18D1FF0BCEFF04CDFF0FD1
        FF19D5FF00CCFFFFFFFFFFFFFF00CCFF14D2FF0FD1FF00CCFF1DD2FF35D7FF45
        DAFF4ADBFF45DAFF35D7FF1DD2FF00CCFF09CFFF00CCFFFFFFFFFFFFFF22D4FF
        05CEFF04CDFF1DD2FF3FD9FF5CDEFF70E2FF77E4FF70E2FF5CDEFF3FD9FF1CD2
        FF01CCFF1ED3FFFFFFFFFFFFFF96EBFF00CCFF07CDFF35D7FF5CDEFF7FE5FF9A
        EBFFA5EDFF9AEBFF7FE5FF5CDEFF20D3FF00CCFF94EAFFFFFFFFFFFFFFFFFFFF
        33D7FF02CDFF2ED5FF6EE2FF9AEBFFBFF2FFD2F6FFBFF2FF96EAFF48DAFF05CD
        FF37D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF38D7FF01CCFF21D3FF6FE2FFC2
        F3FFEFFCFF85E7FF26D4FF01CCFF44DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9DEBFF31D6FF01CCFF01CCFF01CCFF01CCFF3AD7FFA5EDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'ATEN'#199#195'O'
      Hint = 'Aten'#231#227'o'
      ImageIndex = 2
      OnClick = ATEN1Click
    end
    object INATIVO1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000010170000101700000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A24242400000000
        00000000000000002424249B9B9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF3E3E3E0101010A0A0A1E1E1E2D2D2D2B2B2B1B1B1B0B0B0B0101013E3E
        3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3E04040420202032323233333333
        33333333333333333131311D1D1D0303033E3E3EFFFFFFFFFFFFFFFFFF9A9A9A
        0101012020203333333333333333333333333333333333333333333333331E1E
        1E0101019A9A9AFFFFFFFFFFFF2424240C0C0C32323233333333333333333333
        3333333333333333333333333333313131090909242424FFFFFFFFFFFF000000
        2020203333333333333333333333333333333333333333333333333333333333
        331C1C1C000000FFFFFFFFFFFF0000002E2E2E33333333333333333333333333
        33333333333333333333333333333333332D2D2D000000FFFFFFFFFFFF000000
        3030303333333333333333333939394444444848484444443939393333333333
        332C2C2C000000FFFFFFFFFFFF0000002020203333333333334848485B5B5B68
        68686D6D6D6868685B5B5B4848483333331D1D1D000000FFFFFFFFFFFF242424
        0C0C0C3232324848486464647B7B7B8B8B8B9191918B8B8B7B7B7B6464644646
        460B0B0B242424FFFFFFFFFFFF9A9A9A0101012626265B5B5B7B7B7B989898AD
        ADADB6B6B6ADADAD9898987B7B7B3737370101019A9A9AFFFFFFFFFFFFFFFFFF
        3E3E3E070707464646898989ADADADCCCCCCDBDBDBCCCCCCA9A9A95959590707
        07424242FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4343430202022828287A7A7ACB
        CBCBEFEFEF8A8A8A2A2A2A0202024C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA4A4A43737370101010101010101010101013E3E3EABABABFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'INATIVO'
      Hint = 'Inativo'
      ImageIndex = 3
      OnClick = INATIVO1Click
    end
    object PROSPECTO1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000010170000101700000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBA90FD4819FF0100FF
        0200FF0200FF0100FC4619FDBB91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFC6531FF0200FC2500F46C00EE9F00EF9600F56100FB2700FF0200FC62
        31FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6131FE0E00F36B00E9A100E79E00E6
        9A00E59900E69A00E89800F25D00FE0B00FA5E31FFFFFFFFFFFFFFFFFFFCB591
        FF0300F06500E49500E28B00E08400DF8000DF7E00DF8000E08400E28B00EF56
        00FF0200FBB291FFFFFFFFFFFFFA3D19F92500E38600DE7D00DC7100DA6A00D8
        6500D86300D86500DA6A00DC7100DF7900FA1900FA3A19FFFFFFFFFFFFFF0100
        EC5200DC7300D86500D65900D35000D24B00D14900D24B00D35000D65900D865
        00EC3F00FF0100FFFFFFFFFFFFFF0000DF6600D75E00D34E00CF4100CD3600CD
        3604CE3908CD3604CD3600CF4100D34E00DC5300FF0000FFFFFFFFFFFFFF0000
        DA5800D24B00CD3900CF3F0FD34D21D5572DD65A31D5572DD34D21CF3F0FCD39
        00D84100FF0000FFFFFFFFFFFFFF0000E33100CD3900D04516D65A31DA6C47DD
        7755DE7B5ADD7755DA6C47D65A31D04516E22100FF0000FFFFFFFFFFFFF62C19
        F40F00D03E0FD65A31DC7350E1886AE5977DE69C83E5977DE1886ADC7350D757
        2FF40E03F52719FFFFFFFFFFFFF79F90FE0100E23316DA6C47E1886AE8A28BED
        B5A3EFBDADEDB5A3E8A28BE1886AE9412BFE0100F69B91FFFFFFFFFFFFFFFFFF
        F33F32FB0905E85039E5957BEDB5A3F3D1C5F7DED6F3D1C5EDB19FEE6150FD08
        06F4473CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4483DFE0201F82B24F47F74F8
        CDC6FFEFEFFA8C87FB2C28FF0202F75048FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF8A7A0FA3934FF0101FF0101FF0101FF0101FB403CFAADA8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'PROSPECTO'
      Hint = 'Prospecto'
      ImageIndex = 4
      OnClick = PROSPECTO1Click
    end
  end
end
