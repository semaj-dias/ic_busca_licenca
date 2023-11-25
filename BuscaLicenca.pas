unit BuscaLicenca;

interface

uses
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.MultiView, FMX.Effects, FMX.ListBox, FMX.Layouts, FMX.Objects, FMX.Edit,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  FMX.TabControl;

type
  TFrm_Inicial = class(TForm)
    ToolBar1: TToolBar;
    sb_pesquisa: TSpeedButton;
    lb_titulo: TLabel;
    Layout1: TLayout;
    edt_pesquisa: TEdit;
    MultiView1: TMultiView;
    ListView1: TListView;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ListBox1: TListBox;
    Rectangle1: TRectangle;
    SpeedButton2: TSpeedButton;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    SpeedButton3: TSpeedButton;
    Sair: TLabel;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    Image1: TImage;
    label2: TLabel;
    Image2: TImage;
    Label3: TLabel;
    ListBoxItem3: TListBoxItem;
    Label4: TLabel;
    Image3: TImage;
    ListBoxItem4: TListBoxItem;
    Image4: TImage;
    lb_usuario: TLabel;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Label1: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label7: TLabel;
    ComboBox1: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Label10: TLabel;
    Edit4: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Rectangle4: TRectangle;
    procedure sb_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   end;

var
  Frm_Inicial: TFrm_Inicial;
       originalObject: TJSONObject;
       jsArr: TJSONArray;
       jsPair : TJSONPair;
       jso : TJSONObject;
       i : Integer;
       pesquisaJson: TJSONValue;
       litem  : TListViewItem;
       txt : tlistitemtext;
       img : tlistitemimage;


implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure tfrm_Inicial.sb_pesquisaClick(Sender: TObject);

function aspas(s : string) : string;
begin
  Result := StringReplace(s,'"','',[rfReplaceAll]);
end;
function formatardata(s: string) : string;
var a,d,m : string;
begin
    ShowMessage(s);
    a:='';
    m:='';
    d:='';

      a := StringReplace(copy(s,1,4),'-','',[rfReplaceAll]);
      m := StringReplace(copy(s,5,6),'-','',[rfReplaceAll]);
      d := StringReplace(copy(s,8,9),'-','',[rfReplaceAll]);

    SHOWMESSAGE(a);
    SHOWMESSAGE(m);
    SHOWMESSAGE(d);


  //showmessage(dataformatada);
    s := d+'/'+m+'/'+a;
    ShowMessage(s);
    result := s ;
end;


var json : string;
    i : integer;
    jtest : TJSONObject;
    validade : tdatetime;

begin



   ListView1.Items.Clear;
   i := 0;

   if edt_pesquisa.Visible = false and lb_titulo.Visible = true then
    begin
     edt_pesquisa.Visible := true;
     edt_pesquisa.SetFocus;
     lb_titulo.Visible := false;
    end
    else if edt_pesquisa.Text = '' then
    begin
     edt_pesquisa.Visible := false;
     lb_titulo.Visible := true;
    end else
    begin
       i := 1;

      RESTRequest1.Params.ParameterByName('pesquisa').Value := edt_pesquisa.text;
      RESTRequest1.Execute;




     // ShowMessage('{"licenca":'+RESTResponse1.Content.Trim+'}' );

      originalObject := TJSONObject.Create;

      originalObject.Parse(

  //      TEncoding.ASCII.GetBytes(
  //      '{"result":[{"Nome":"DELMAR","Cidade":"AJURICABA","Bairro":"CENTRO"},'+
  //      '{"Nome":"DALVAN","Cidade":"IJUÍ","Bairro":"JARDIM"}]}'),0);

  //      TEncoding.ASCII.GetBytes(
  //'{"licenca":[{"rsocial" : "JAMES DIAS LOPES", "CNPJ_CPF" : "05487459355", "fantasia" : "JAMES", "id" : "8E0AB5BD",'+
  //' "descricao" : "NOVO NOTEBOOK", "validade" : "2020-10-31", "serial1" : "4990202004100607031089317085107X4X6911210209349" }, '+
  //'{ "rsocial" : "JAMES DIAS LOPES", "CNPJ_CPF" : "05487459355", "fantasia" : "JAMES", "id" : "EA6F2F8F", '+
  //'"descricao" : "SAMSUNG GAMER", "validade" : "2020-12-31", "serial1" : "906020204123795123199295499512046X69102273006X3" }, '+
  //'{ "rsocial" : "JAMES DIAS LOPES", "CNPJ_CPF" : "05487459355", "fantasia" : "JAMES", "id" : "2255B6B4", '+
  //'"descricao" : "NOTEBOOK SERVICO", "validade" : "2020-04-24", "serial1" : "1212202065831317024X6937702504694X6920224300135" }]}'),
  //0);

      TEncoding.ASCII.GetBytes('{"licenca":'+copy(RESTResponse1.Content.trim,  pos( '[',RESTResponse1.Content.trim))   +'}' ),0);


//      pesquisaJson := TJSONObject.ParseJSONValue(
//
//      '{"result":[{"Nome":"DELMAR","Cidade":"AJURICABA","Bairro":"CENTRO"},'+
//      '{"Nome":"DALVAN","Cidade":"IJUÍ","Bairro":"JARDIM"}]');



      try
             i := 2;
//        ShowMessage( pesquisaJson.Value);

        //ShowMessage(originalObject.Value);


         //if pesquisaJson = nil then  ShowMessage('Esta vazio') else ShowMessage('Nao esta vazio');


        //json := pesquisaJson.Format;

//        if pesquisaJson IS TJSONNull then ShowMessage('NULL') ELSE
//        ShowMessage( pesquisaJson.Value);


        try

            i := 3;

            //originalObject := pesquisaJson as TJSONOBject;


            i := 31;


           jsPair := originalObject.Get('licenca');
//           jsPair := originalObject.Get('result');

             i := 4;

           jsArr := jsPair.JsonValue as TJSONArray;

           for I := 0 to jsArr.size -1 do
            begin

              jso := jsArr.get(i) as TJSONObject;

              for jsPair in jso do
                begin


//
//                    if jsPair.JsonString.value = 'Nome' then
//                    begin
//                      ListView1.BeginUpdate;
//                      Litem := form1.ListView1.Items.Add;
//                      Litem.Detail := jso.GetValue('Nome').ToString;
//                      Litem.Text := jso.GetValue('Nome').ToString;
//                      Litem.IndexTitle := jso.GetValue('Nome').ToString;
//                      ListView1.EndUpdate;
//                    end;


                    //ShowMessage(jsPair.JsonString.value);
//
//
                    if jsPair.JsonString.value = 'rsocial' then
                    //preenchendo o listView
                    begin
                      ListView1.BeginUpdate;
                       Litem := ListView1.Items.Add;
                      //Litem.detail := jso.GetValue('fantasia');
                      with Litem do
                      begin
                      // RAZÃO SOCIAL DO CLIENTE
                      txt := TListItemText(Objects.FindDrawable('Text1'));
                      txt.Text := 'EMPRESA : '+aspas( jso.GetValue('rsocial').ToString);
                      txt.Font.Size:= 12;
                      txt.Font.Style:= [TFontStyle.fsBold];
                      // IMAGEM COMPUTADOR
                      img := TListItemImage(Objects.FindDrawable('Image6'));
//                      img.Bitmap :=  ;

                      //CNPJ / CPF DO CLIENTE
                      txt := TListItemText(Objects.FindDrawable('Text2'));
                      txt.Text := aspas( jso.GetValue('CNPJ_CPF').ToString);
                      txt.Font.Size:= 10;
                      txt.Font.Style:= [TFontStyle.fsItalic];
                      // NOME FANTASIA
                      txt := TListItemText(Objects.FindDrawable('Text3'));
                      txt.Text := aspas( jso.GetValue('fantasia').ToString);
                      txt.Font.Size:= 10;
                      txt.Font.Style:= [TFontStyle.fsItalic];
                      // NOME DA MÁQUINA
                      txt := TListItemText(Objects.FindDrawable('Text4'));
                      txt.Text := aspas( jso.GetValue('descricao').ToString);
                      txt.Font.Size:= 10;
                      txt.Font.Style:= [TFontStyle.fsItalic];
                      //ID DA MÁQUINA
                      txt := TListItemText(Objects.FindDrawable('Text5'));
                      txt.Text := aspas( jso.GetValue('id').ToString);
                      txt.Font.Size:= 10;
                      txt.Font.Style:= [TFontStyle.fsItalic];
                      // ICONE DE COPIAR

                      //SERIAL      6031202025125904413X 080095700639371120222500357
                      txt := TListItemText(Objects.FindDrawable('Text8'));
                      txt.Text :=  copy(aspas( jso.GetValue('serial1').ToString),1,20) +#13+ copy(aspas( jso.GetValue('serial1').ToString),21,47);
                      txt.Font.Size:= 10;
                      txt.Font.Style:= [TFontStyle.fsBold];
                      txt.WordWrap := true;
                      //DATA VALIDADE
                      txt := TListItemText(Objects.FindDrawable('Text9'));
                      txt.Text := 'Data de Validade: ';
                      txt.Font.Size:= 8;
                      txt.Font.Style:= [TFontStyle.fsBold];
                      //VALIDADE
                      txt := TListItemText(Objects.FindDrawable('Text10'));
                      //ShowMessage('validade: '+datetostr(validade));
                      txt.Text := formatardata(aspas(jso.GetValue('validade').ToString));
                      txt.Font.Size:= 10;
                      txt.Font.Style:= [TFontStyle.fsBold];



                     // Litem.data[TMultiDetailAppearanceNames.Detail2] := aspas(jso.GetValue('validade').ToString);
                     // Litem.data[TMultiDetailAppearanceNames.Detail3] := aspas(jso.GetValue('id').ToString);
                     // Litem.data[TMultiDetailAppearanceNames.Detail4] := aspas(jso.GetValue('fantasia').ToString);
                      //Litem. := jso.GetValue('serial1').ToString;
                      Listview1.EndUpdate;
                      end;
                    end;



                end;



            end;

              i := 5;

        finally
          pesquisaJson.Free;
        end;

      except
              On E: exception do
              ShowMessage('Erro:'+inttostr(i)+#13+E.Message);

      end;

      end;



end;

end.
