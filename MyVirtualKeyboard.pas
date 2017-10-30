unit MyVirtualKeyboard;
{******************************************}
{*									      *}	
{* Delphi FMX Virtual Keyboard Management *}
{* Author: Abdullah Ilgaz   		      *}
{* Created on 18.05.2017			      *}
{*									      *}
{******************************************}

interface

uses
  FMX.Platform, FMX.Types, FMX.Controls, FMX.VirtualKeyboard;

procedure ShowKeyboardOn(AControl: TControl);
procedure HideKeyboardOn(AControl: TControl);
procedure ShowKeyboardOnForm;
procedure HideKeyboardOnForm;

implementation

procedure ShowKeyboardOn(AControl: TControl);
var
  FService: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> nil) then
  begin
    FService.ShowVirtualKeyboard(AControl);
    AControl.SetFocus;
  end;
end;

procedure HideKeyboardOn(AControl: TControl);
var
  FService: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> nil) then
  begin
    FService.HideVirtualKeyboard;
    AControl.SetFocus;
  end;
end;

procedure ShowKeyboardOnForm;
var
  FService: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> nil) then
  begin
    VKAutoShowMode := TVKAutoShowMode.Always;
  end;
end;

procedure HideKeyboardOnForm;
var
  FService: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> nil) then
  begin
    VKAutoShowMode := TVKAutoShowMode.Never;
  end;
end;

end.
