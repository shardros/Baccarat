program PBaccarat;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  UCardClasses in '..\Downloads\UCardClasses.pas',
  UBaccarat in '..\Downloads\UBaccarat.pas';

type

  TGameUI = class
  public
    procedure Display(Game: TBaccarat);
    procedure DisplayDraw(Game: TBaccarat);
    procedure FinalResult(Game: TBaccarat);
  end;

  { TGameUI }

procedure TGameUI.Display(Game: TBaccarat);
//displays players' hands and scores
var
  c: TCard;
begin
  writeln('Player''s cards: ');
  for c in Game.PHand.Cards do
    writeln(c.GetRankAsString + ' of ' + c.GetSuitAsString);
  writeln;
  writeln('Banker''s cards: ');
  for c in Game.BHand.Cards do
    writeln(c.GetRankAsString + ' of ' + c.GetSuitAsString);
  writeln;
  writeln('Player Score: ', Game.PScore);
  writeln('Banker Score: ', Game.BScore);
  writeln;
end;

procedure TGameUI.DisplayDraw(Game: TBaccarat);
//displays outcome of draw phase of game
begin
  case Game.PHand.Size of
    2:
      writeln('The Player has stood');
    3:
      writeln('The Player has drawn the ' + Game.PHand.Cards[2].GetRankAsString
        + ' of ' + Game.PHand.Cards[2].GetSuitAsString);
  end;
  case Game.BHand.Size of
    2:
      writeln('The Banker has stood');
    3:
      writeln('The Banker has drawn the ' + Game.BHand.Cards[2].GetRankAsString
        + ' of ' + Game.BHand.Cards[2].GetSuitAsString);
  end;
  writeln;
end;

procedure TGameUI.FinalResult(Game: TBaccarat);
//displays outcome of game
begin
  if Game.PScore > Game.BScore then
    writeln('The Player has won');
  if Game.BScore > Game.PScore then
    writeln('The Banker has won');
  if Game.PScore = Game.BScore then
    writeln('It''s a tie');
end;

// main program
var
  GameUI: TGameUI;
  Game: TBaccarat;

begin
  GameUI := TGameUI.Create;
  Game := TBaccarat.Create;
  Game.Deal;
  GameUI.Display(Game);

  if (game.PScore or game.BScore) < 7 then begin
    Game.PhaseII;
    GameUI.DisplayDraw(Game);
    GameUI.Display(Game);
  end;


  GameUI.FinalResult(Game);
  readln;

  Game.Free;
  GameUI.Free;

end.
