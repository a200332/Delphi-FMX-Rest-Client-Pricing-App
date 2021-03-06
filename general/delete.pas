unit delete;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit;

type
  Tfmdelete = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Layout1: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Layout2: TLayout;
    updatebtn: TButton;
    closebtn: TButton;
    Layout3: TLayout;
    Label7: TLabel;
    Edit6: TEdit;
    procedure closebtnClick(Sender: TObject);
    procedure updatebtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmdelete: Tfmdelete;

implementation
uses
datamod,main;

{$R *.fmx}

procedure Tfmdelete.closebtnClick(Sender: TObject);
begin
   fmdelete.close;
end;

procedure Tfmdelete.FormShow(Sender: TObject);
begin
  edit6.Text:= inttostr(dm.FDMemTable1.FieldByName('id').AsInteger);
  edit1.Text:= dm.FDMemTable1.FieldByName('sku').Asstring;
  edit2.Text:= dm.FDMemTable1.FieldByName('skusize').Asstring;
  edit3.Text:= dm.FDMemTable1.FieldByName('barcode').Asstring;
  edit4.Text:= dm.FDMemTable1.FieldByName('description').Asstring;
  edit5.text:= dm.FDMemTable1.FieldByName('price').Asstring;
end;

procedure Tfmdelete.updatebtnClick(Sender: TObject);
begin
  dm.fdmemtable1.delete;
  dm.FDMemTable1.CommitUpdates;

  fmmain.SavetosimulatedDB(DM.FDmemtable1);
  fmmain.LoadfromsimulatedDB;
  fmdelete.close;
end;

end.
