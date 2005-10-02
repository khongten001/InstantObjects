(*
 *   InstantObjects
 *   Zeos Database Objects Connection Editor
 *)

(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is: Joao Morais
 *
 * The Initial Developer of the Original Code is: Joao Morais
 *
 * Portions created by the Initial Developer are Copyright (C) 2005
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

unit InstantZeosDBOConnectionDefEdit;

interface

uses
  Forms, Dialogs, StdCtrls, Controls, ExtCtrls, SysUtils, Classes,
  ZConnection, InstantZeosDBO;

type
  TInstantZeosDBOConnectionDefEditForm = class(TForm)
    ClientPanel: TPanel;
    HostNameLabel: TLabel;
    PortLabel: TLabel;
    ProtocolLabel: TLabel;
    DatabaseLabel: TLabel;
    UserNameLabel: TLabel;
    PasswordLabel: TLabel;
    PropertiesLabel: TLabel;
    StreamFormatLabel: TLabel;
    IdDataTypeLabel: TLabel;
    IdSizeLabel: TLabel;
    HostNameEdit: TEdit;
    PortEdit: TEdit;
    ProtocolComboBox: TComboBox;
    DatabaseEdit: TEdit;
    DatabaseButton: TButton;
    UserNameEdit: TEdit;
    PasswordEdit: TEdit;
    LoginPromptCheckBox: TCheckBox;
    PropertiesEditor: TMemo;
    StreamFormatComboBox: TComboBox;
    IdDataTypeComboBox: TComboBox;
    IdSizeEdit: TEdit;
    UseDelimitedIdentsCheckBox: TCheckBox;
    BottomBevel: TBevel;
    BottomPanel: TPanel;
    OkButton: TButton;
    CancelButton: TButton;
    procedure FormCreate(Sender: TObject);
  private
    procedure UpdateControls;
  public
    procedure LoadData(ConnectionDef: TInstantZeosDBOConnectionDef);
    procedure SaveData(ConnectionDef: TInstantZeosDBOConnectionDef);
  end;

implementation

{$R *.dfm}

uses
  InstantPersistence, InstantClasses;

{ TInstantZeosDBOConnectionDefEditForm }

procedure TInstantZeosDBOConnectionDefEditForm.FormCreate(Sender: TObject);
begin
  AssignZeosDBOProtocols(ProtocolComboBox.Items);
  AssignInstantStreamFormat(StreamFormatComboBox.Items);
  AssignInstantDataTypeStrings(IdDataTypeComboBox.Items);
  UpdateControls;
end;

procedure TInstantZeosDBOConnectionDefEditForm.LoadData(
  ConnectionDef: TInstantZeosDBOConnectionDef);
begin
  HostNameEdit.Text := ConnectionDef.HostName;
  PortEdit.Text := InttoStr(ConnectionDef.Port);
  ProtocolComboBox.ItemIndex := ProtocolComboBox.Items.IndexOf(ConnectionDef.Protocol);
  DatabaseEdit.Text := ConnectionDef.Database;
  UserNameEdit.Text := ConnectionDef.UserName;
  PasswordEdit.Text := ConnectionDef.Password;
  LoginPromptCheckBox.Checked := ConnectionDef.LoginPrompt;
  PropertiesEditor.Lines.Text := ConnectionDef.Properties;
  StreamFormatComboBox.ItemIndex := Ord(ConnectionDef.BlobStreamFormat);
  IdDataTypeComboBox.ItemIndex := Ord(ConnectionDef.IdDataType);
  IdSizeEdit.Text := InttoStr(ConnectionDef.IdSize);
  UseDelimitedIdentsCheckBox.Checked := ConnectionDef.UseDelimitedIdents;
  UpdateControls;
end;

procedure TInstantZeosDBOConnectionDefEditForm.SaveData(
  ConnectionDef: TInstantZeosDBOConnectionDef);
begin
  ConnectionDef.HostName := HostNameEdit.Text;
  ConnectionDef.Port := StrtoInt(PortEdit.Text);
  ConnectionDef.Protocol := ProtocolComboBox.Text;
  ConnectionDef.Database := DatabaseEdit.Text;
  ConnectionDef.UserName := UserNameEdit.Text;
  ConnectionDef.Password := PasswordEdit.Text;
  ConnectionDef.LoginPrompt := LoginPromptCheckBox.Checked;
  ConnectionDef.Properties := PropertiesEditor.Lines.Text;
  ConnectionDef.BlobStreamFormat := TInstantStreamFormat(StreamFormatComboBox.ItemIndex);
  ConnectionDef.IdDataType := TInstantDataType(IdDataTypeComboBox.ItemIndex);
  ConnectionDef.IdSize := StrToInt(IdSizeEdit.Text);
  ConnectionDef.UseDelimitedIdents := UseDelimitedIdentsCheckBox.Checked;
end;

procedure TInstantZeosDBOConnectionDefEditForm.UpdateControls;
begin

end;

end.

