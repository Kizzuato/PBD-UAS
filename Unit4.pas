unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, OleServer, PowerPointXP;

type
  TDM_perpus127 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    UserID: Char;
    UserRole: string;
  end;
                            
var
  DM_perpus127: TDM_perpus127;

implementation

{$R *.dfm}

end.
