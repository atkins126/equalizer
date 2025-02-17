unit
  QMPMOD;

interface

uses
  QMPDCL,
  QMPEQU;

type
  PQMPMOD = ^TQMPMOD;
  TQMPMOD = record
  private
    class function Plugin(const Which: Integer): PPlugin; cdecl; static;
  public
    class function Module(): PModule; cdecl; static;
  end;

implementation

class function TQMPMOD.Plugin(const Which: Integer): PPlugin; cdecl;
begin
  case (Which) of
    0: begin
      Result := TQMPEQU.Plugin();
    end;
    else begin
      Result := nil;
    end;
  end;
end;

class function TQMPMOD.Module(): PModule; cdecl;
begin
  Result := New(PModule);
  Result.Instance := $0000;
  Result.Version := $0050;
  Result.Plugin := TQMPMOD.Plugin;
end;

begin
end.
