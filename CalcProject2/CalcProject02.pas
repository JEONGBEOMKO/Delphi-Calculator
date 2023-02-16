unit CalcProject02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Btn0: TButton;
    Btn1: TButton;
    Btn2: TButton;
    Btn3: TButton;
    Btn4: TButton;
    Btn5: TButton;
    Btn6: TButton;
    Btn7: TButton;
    Btn8: TButton;
    Btn9: TButton;
    DivBtn: TButton;
    MulBtn: TButton;
    MinusBtn: TButton;
    DotBtn: TButton;
    PlusBtn: TButton;
    BackSpaceBtn: TButton;
    ClearBtn: TButton;
    EqualBtn: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    SubClearBtn: TButton;
    RootBtn: TButton;
    SquareBtn: TButton;
    ReciprocalBtn: TButton;
    procedure Btn1Click(Sender: TObject);  // ���� ���ڹ�ư  1
    procedure Btn2Click(Sender: TObject);  // ���� ���ڹ�ư  2
    procedure Btn3Click(Sender: TObject);  // ���� ���ڹ�ư  3
    procedure Btn4Click(Sender: TObject);  // ���� ���ڹ�ư  4
    procedure Btn5Click(Sender: TObject);  // ���� ���ڹ�ư  5
    procedure Btn6Click(Sender: TObject);  // ���� ���ڹ�ư  6
    procedure Btn7Click(Sender: TObject);  // ���� ���ڹ�ư  7
    procedure Btn8Click(Sender: TObject);  // ���� ���ڹ�ư  8
    procedure Btn9Click(Sender: TObject);  // ���� ���ڹ�ư  9
    procedure Btn0Click(Sender: TObject);  // ���� ���ڹ�ư  0
    procedure DotBtnClick(Sender: TObject);
    procedure Init();
    procedure EqualBtnClick(Sender: TObject);  // �ʱ�ȭ ���ν���
    procedure OperatorClick();                 //������ Ŭ��
    procedure Calculate();                     // ����
    procedure PlusBtnClick(Sender: TObject);       // ���ϱ� ��ư
    procedure MinusBtnClick(Sender: TObject);      // ���� ��ư
    procedure MulBtnClick(Sender: TObject);        //  ���ϱ� ��ư
    procedure DivBtnClick(Sender: TObject);        // ������ ��ư
    procedure BackSpaceBtnClick(Sender: TObject);
    procedure SubClearBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RootBtnClick(Sender: TObject);
    procedure SquareBtnClick(Sender: TObject);
    procedure ReciprocalBtnClick(Sender: TObject);
    
    

                        

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  result:Real=0; //�����
  val1:Real=0;  //�ǿ�����1
  val2:Real=0;  //�ǿ�����2
  temp:Real=0;
  flag:Boolean=True; // �ǿ�����2�� �ִ��� �����ϴ� �÷���
  check:Integer; // ������ ��ȣ üũ
  totalString:string; //�����ڿ� �ǿ����ڸ� ����ϴ� ���ڿ�
  delNum:string; // ���ڰ� ����� ���� �����ϴ� ���ڿ�
  RFlag:Boolean=True; //����� �����ϱ����� �÷���
  OFlag:Boolean=True; //ó�� �Է°��� �������� ���������� �����ϴ� �÷���
  dotFlag:Boolean=True; //dot�� �÷���
  saveTotal:string; //��� �׽�Ʈ
  KeyCheck:Boolean=True;


implementation

{$R *.dfm}

procedure TForm1.PlusBtnClick(Sender: TObject);
begin
  if(OFlag=True) then  // ���ڸ� ���� �Է����� ��
  begin
    Edit1.Text:='+';    // + �Է� 
    EqualBtn.SetFocus; // = ��ư�� ��Ŀ��
  end
  else if(OFlag=False) then  // ���� ���� �Է����� �ʾ��� ��
  begin
    OperatorClick(); //������ Ŭ�� ���ν��� ����
    check:=0; // ������ 0�� ���ϱ�� ����
    totalString := totalString + ConCat(FloatToStr(val2)); //�������� �Ǵ� ���ڿ� ����
    saveTotal := totalString;
    if(saveTotal=totalString) then 
    begin
      totalString := totalString+'+';
      Edit2.Text := totalString;     // Edit2 �� ����� ����
    end
    else
    begin
      Edit2.Text := totalString;
    end;
    //2023-01-25 jhj
    {
    temp := val1;
    Edit1.Text := FloatToStr(temp); // �ӽ�����
    }
    dotFlag := True;       // dotFlag=true�� �ϰ� = ��ư ������ false�� �ǵ��� ��    
    EqualBtn.SetFocus;      // = ��ư�� focus
  end;
end;

procedure TForm1.MinusBtnClick(Sender: TObject);
  begin
  if(OFlag=True) then // ���� ���� �Է����� ��
  begin
    Edit1.Text := '-';   // - �Է�
    EqualBtn.SetFocus;   // = ��ư�� ��Ŀ��
  end
  else if(OFlag=False) then // ���� ���� �Է����� ���� ��
  begin
    OperatorClick(); // ������ Ŭ�� ���ν��� ����
    check := 1; // ������ 1�� ����� ����
    totalString := totalString + ConCat(FloatToStr(val2)+'-'); //���� ����� �Ǵ� ���ڿ� ����
    Edit2.Text := totalString;    //Edit2�� ����� ����
    {
    temp := val1;
    Edit1.Text := FloatToStr(temp); // �ӽ�����
    }
    dotFlag := True;            // dotFlag=true�� �ϰ� = ��ư ������ false�� �ǵ��� ��
    EqualBtn.SetFocus;          // = ��ư�� focus

  end;               
end;

procedure TForm1.MulBtnClick(Sender: TObject);    // * ��ư
begin
  if(OFlag=True) then    // ���� ���� �Է����� ��
  begin
    Edit1.Text := '*';  // * �Է�
    EqualBtn.SetFocus; // = ��ư�� ��Ŀ��
  end
  else if(OFlag=False) then // ���� ���� �Է����� ���� ��
  begin
    OperatorClick();      //������ Ŭ�� ���ν��� ����
    check := 2; // ������ 2�� ���ϱ�� ����
    totalString := totalString + ConCat(FloatToStr(val2)+'*'); // ���� ����� �Ǵ� ���ڿ� ����
    Edit2.Text := totalString; // Edit2�� ����� ����
    {
    temp := val1;
    Edit1.Text := FloatToStr(temp); // �ӽ�����
    }
    dotFlag := True;  //    dotFlag=true�� �ϰ� = ��ư ������ false�� �ǵ��� ��    
    EqualBtn.SetFocus;          // = ��ư�� focus
  end;
end;

procedure TForm1.DivBtnClick(Sender: TObject);    // ������ ��ư
begin
  if(OFlag=True) then
  begin
    Edit1.Text:='/';   // / �Է�
    EqualBtn.SetFocus;       // = ��ư�� ��Ŀ��
  end
  else if(OFlag=False) then // ���� ���� �Է����� ���� ��
  begin
    OperatorClick(); // ������ Ŭ�� ���ν��� ����
    check := 3; // ������ 3�� ������� ����
    if(val1=0) or (Edit1.Text = '0') or (Edit1.Text = '/') then //0���� ���� �� ����
    begin
      ShowMessage('���� �� �����ϴ�');
      exit;
    end
    else
    begin
      totalString := totalString + Concat(FloatToStr(val2) +'/'); // ���� ����� �Ǵ� ���ڿ� ����
      Edit2.Text := totalString; // Edit2�� ����� ����
      {
      temp := val1;
      Edit1.Text := FloatToStr(temp); // �ӽ�����
      }
      dotFlag := True;  // dotFlag=true�� �ϰ� = ��ư ������ false�� �ǵ��� ��.
      EqualBtn.SetFocus; // = ��ư�� focus
    end;
  end;
end;

procedure TForm1.RootBtnClick(Sender: TObject);
begin
  if(OFlag=True) then    // ���� ���� �Է����� ��
  begin
      Edit1.Text:='��';   // / �Է�
      EqualBtn.SetFocus;       // = ��ư�� ��Ŀ��
  end
  else if(OFlag=False) then // ���� ���� �Է����� ���� ��
  begin
    OperatorClick(); // ������ Ŭ�� ���ν��� ����
    check := 4;    //������ 4�� ��Ʈ�� ����
    totalString := totalString + Concat('��('+FloatToStr(val1) +')');
    Edit2.Text := totalString;
    totalString := '';
    {
    temp := val1;
    Edit1.Text := FloatToStr(temp); // �ӽ�����
    }
    dotFlag := True;  //    dotFlag=true�� �ϰ� = ��ư ������ false�� �ǵ��� ��
    Calculate();
    Edit1.Text := FloatToStr(sqr(val1));
  end;
end;

procedure TForm1.SquareBtnClick(Sender: TObject);
begin
  if(OFlag=True) then    // ���� ���� �Է����� ��
  begin
      Edit1.Text:='sqr';   // / �Է�
      EqualBtn.SetFocus;       // = ��ư�� ��Ŀ��
  end
  else if(OFlag=False) then // ���� ���� �Է����� ���� ��
  begin
    OperatorClick(); // ������ Ŭ�� ���ν��� ����
    check := 5;     //������ 5��  ������ ����
    totalString := totalString + Concat('sqr('+FloatToStr(val1) +')');
    Edit2.Text := totalString;
    totalString := '';
    {
    temp := val1;
    Edit1.Text := FloatToStr(temp); // �ӽ�����
    }
    dotFlag := True;  //    dotFlag=true�� �ϰ� = ��ư ������ false�� �ǵ��� ��
    //EqualBtn.SetFocus; // = ��ư�� focus
    Calculate();
    Edit1.Text := FloatToStr(sqr(val1));
  end;
end;

procedure TForm1.ReciprocalBtnClick(Sender: TObject);
begin
  if(OFlag=True) then   // ���� ���� �Է����� ��
  begin
    Edit1.Text:='/';   // / �Է�
    EqualBtn.SetFocus;       // = ��ư�� ��Ŀ��
  end
  else if(OFlag=False) then // ���� ���� �Է����� ���� ��
  begin
    OperatorClick(); // ������ Ŭ�� ���ν��� ����
    check := 6; // ������ 6�� ������ ����
    if(val1=0) or (Edit1.Text = '0') then //0���� ���� �� ����
    begin
      ShowMessage('���� �� �����ϴ�');
      exit;
    end
    else
    begin
      totalString := totalString + Concat('1/('+FloatToStr(val1) +')'); // ���� ����� �Ǵ� ���ڿ� ����
      Edit2.Text := totalString; // Edit2�� ����� ����
      totalString := '';
      {
      temp := val1;
      Edit1.Text := FloatToStr(temp); // �ӽ�����
      }
      dotFlag := True;  // dotFlag=true�� �ϰ� = ��ư ������ false�� �ǵ��� ��.
      Calculate();
      Edit1.Text := FloatToStr(1 / val1);
      //EqualBtn.SetFocus; // = ��ư�� focus
    end;
  end;

end;

procedure TForm1.BackSpaceBtnClick(Sender: TObject);  // Backspace ��ư
begin
  delNum := Edit1.Text;
  Delete(delNum, Length(delNum), 1);  // Delete(���ڿ�, ���ۼ���, �� ��)
  Edit1.Text :=  delNum;
  if(length(delNum)=0) then
  begin
    Edit1.Text:='0';  // �ʱ�ȭ
  end
  else if(Length(delNum)=1) then
  begin
    dotFlag := True;
  end;
  EqualBtn.SetFocus;  // = ��ư�� focus
end;

procedure TForm1.SubClearBtnClick(Sender: TObject); // �κ� Clear
begin
  Edit1.Text:='0'; //�ʱ�ȭ
  dotFlag:=True;
  EqualBtn.SetFocus;
end;

procedure TForm1.ClearBtnClick(Sender: TObject); // Clear ��ư
begin
  Edit1.Text := '0';     //�ʱ�ȭ
  Init();               // ���� �ʱ�ȭ ���ν���
  EqualBtn.SetFocus;
end;

procedure TForm1.Btn1Click(Sender: TObject); // ��ư 1
begin
  if(Edit1.Text='0') then  //���� ���� ���ڰ� 0�� ��
  begin
  Edit1.Clear; // �ʱ�ȭ

  end;

  //2023-01-25 jhj
  if flag = False then
      Edit1.Text := '';

  Edit1.Text := Edit1.Text+'1';   // ��ư Ŭ�� �� 1 �Է�
  OFlag:=False;// �����ڹ�ư ���� �Է� ���� ����, ���ڰ� �ԷµǸ� ������ �÷��� ���� false //
  EqualBtn.SetFocus; // = ��ư�� ��Ŀ��
  if(RFlag=False) and (dotFlag=True) then  //  Reset �÷��� = false, dotflag=true �� ��,
  begin
    Edit1.Clear; // = ��ư�� ������ Rflag= flase, edit ��� clear �� �� �� �Է°� �޴´�.
    Edit1.Text := Edit1.Text+'1'; //��ư Ŭ���Ͽ� 1 �Է�
    RFlag := true; // RFlag=true�� �ϰ�  = ��ư�� ������ false�� �ǵ��� ��.
    OFlag := False; // OFlag = true �̸� �����ڸ� ���� �Է��� ��, OFlag =  false  ���� ���� �Է��� ��
  end;
end;

procedure TForm1.Btn2Click(Sender: TObject); //��ư 2
begin
  if(Edit1.Text='0') then
  begin
    Edit1.Clear; //���� ���ڰ� 0�̸� �ʱ�ȭ
  end;
  //2023-01-25 jhj
  if flag = False then
      Edit1.Text := '';

  Edit1.Text := Edit1.Text+'2'; //��ư Ŭ�� �� 2 �Է� 
  OFlag:=False;                 // ���� �Է½� OFlag = false; 
  EqualBtn.SetFocus;            // = ��ư�� ��Ŀ��    
  if(RFlag=False) and (dotFlag=True) then
  begin
    Edit1.Clear;                // ����� clear �� �Ŀ� �Է°� �޴´�.
    Edit1.Text := Edit1.Text+'2'; // ��ư Ŭ���Ͽ� 2 �Է�
    RFlag:=True;                  //= ��ư�� ���� flase�� �ǵ��� �Ѵ�.
  end;
end;

procedure TForm1.Btn3Click(Sender : TObject); // ��ư 3
begin
  if(Edit1.Text='0') then
  begin
    Edit1.Clear; // ���� ���� 0�� �� �ʱ�ȭ
  end;

  //2023-01-25 jhj
  if flag = False then
      Edit1.Text := '';

  Edit1.Text:=Edit1.Text+'3';  // 3�Է�

  OFlag:=False;                 //  ���� �Է½� OFlag = false
  EqualBtn.SetFocus;             // = ��ư�� ��Ŀ��
  if(RFlag=False) and (dotFlag=True) then         // RFlag=false, dotflag=true �� ��,
  begin
    Edit1.Clear;                         // edit1�� �ִ� ����� clear
    Edit1.Text:=Edit1.Text+'3';          // 3 �Է�
    RFlag:=True;                         // RFlag = true�� ��
  end;
end;


procedure TForm1.Btn4Click(Sender: TObject);  // ��ư 4
begin
  if(Edit1.Text='0') then
  begin
    Edit1.Clear;              // ���� ���� 0�� �� �ʱ�ȭ
  end;

  //2023-01-25 jhj
  if flag = False then
      Edit1.Text := '';
      
  Edit1.Text:=Edit1.Text+'4';     // 4 �Է�
  OFlag:=False;                   // ���� �Է½� ������ �÷��� ���� false
  EqualBtn.SetFocus;                // = ��ư�� ��Ŀ��
  if(RFlag=False) and (dotFlag=True) then             // RFlag=false, dot flag=true �� ��,
  begin
    Edit1.Clear;                     // = ��ư�� ������ RFlag = false�� �ǹǷ� edit �� clear ��
    Edit1.Text:=Edit1.Text+'4';      // ��ư 4 �Է�
    RFlag := True;                // RFlag = true�� �Ͽ� = ��ư�� ������ false�� �ǵ��� ��
  end;
end;




procedure TForm1.Btn5Click(Sender: TObject); // ��ư 5 
begin
  if(Edit1.Text='0') then
  begin
    Edit1.Clear;                 // ���� ���� 0�� �� �ʱ�ȭ
  end;

  //2023-01-25 jhj
  if flag = False then
      Edit1.Text := '';
  Edit1.Text:=Edit1.Text+'5';     // 5 �Է�
  OFlag:=False;                   // ���� �Է� �� ������ �÷��� �� false
  EqualBtn.SetFocus;                   // = ��ư�� ��Ŀ��
  if(RFlag=False) and (dotFlag=True) then    // RFlag=false, dot flag=true �� ��, 
  begin
    Edit1.Clear;                  // edit �� clear ��
    Edit1.Text:=Edit1.Text+'5';   // ��ư 5 �Է�
    RFlag := True;                // RFlag = true�� �Ͽ� = ��ư�� ������ false�� �ǵ��� ��
  end;
end;


procedure TForm1.Btn6Click(Sender: TObject);    // ��ư 6
begin
  if(Edit1.Text='0') then
  begin
    Edit1.Clear;         // ���� ���� 6�� �� �ʱ�ȭ
  end;

  //2023-01-25 jhj
  if flag = False then
      Edit1.Text := '';
  Edit1.Text:=Edit1.Text+'6'; // 6 �Է�
  OFlag:=False;               // ���� �Է� �� ������ �÷��� �� false
  EqualBtn.SetFocus;                          // = ��ư ��Ŀ��
  if(RFlag=False) and (dotFlag=True) then     // RFlag=false. dot flag=true �� ��, 
  begin
    Edit1.Clear;                              // = ��ư ������ Rflag=false �� �� // edit1 �� �ִ� ��� �� clear �ϰ� �Է� �޾ƾ� ��
    Edit1.Text:=Edit1.Text+'6';               //6 �Է�
    RFlag := true;                            //flag= true  �ϰ� = ��ư�� ���� �� false�� �ǵ��� ��
  end;
end;

procedure TForm1.Btn7Click(Sender: TObject);  // ��ư 7
begin
  if(Edit1.Text='0') then
  begin
    Edit1.Clear;                             // ���� ���� 7�� �� �ʱ�ȭ
  end;

  //2023-01-25 jhj
  if flag = False then
      Edit1.Text := '';
  Edit1.Text:=Edit1.Text+'7';                // ��ư 7 �Է�
  OFlag:=False;                              // ���� �Է� �� ������ �÷���=false
  EqualBtn.SetFocus;                         // = ��ư�� ��Ŀ��
  if(RFlag=False) and (dotFlag=True) then    // reset flag = false, dot flag = true �� ��, 
  begin
    Edit1.Clear;                            // = ��ư�� ������ Rflag= false, edit ��� clear
    Edit1.Text:=Edit1.Text+'7';             // 7 �Է�
    RFlag := True;                          // flag = true �ϰ� = ��ư�� ���� �� false�� �ǵ���
  end;
end;

procedure TForm1.Btn8Click(Sender: TObject);    // ��ư 8
begin
  if(Edit1.Text='0') then
  begin
    Edit1.Clear;                               // ���� ���� 8�� �� �ʱ�ȭ
  end;

  //2023-01-25 jhj
  if flag = False then
      Edit1.Text := '';
  Edit1.Text:=Edit1.Text+'8';                 // ��ư 8 �Է�
  OFlag:=False;                               // ���� �Է½� ������ �÷���= false
  EqualBtn.SetFocus;                          // = ��ư�� ��Ŀ��
  if(RFlag=False) and (dotFlag = True) then   // reset flag = false, dot flag = true �� ��,
  begin
    Edit1.Clear;                              // = ��ư�� ������  Rflag=false, edit ��� clear
    Edit1.Text:=Edit1.Text+'8';               // 8 �Է�
    RFlag := True;                            // flag = true�� �ϰ�, = ��ư ���� �� false
  end;
end;




procedure TForm1.Btn9Click(Sender: TObject);    //  ��ư 9 
begin
  if(Edit1.Text='0') then
  begin
    Edit1.Clear;                          // ���� ���� 9�� �� �ʱ�ȭ
  end;

  //2023-01-25 jhj
  if flag = False then
      Edit1.Text := '';
  Edit1.Text:=Edit1.Text+'9';            //  ��ư 9 �Է�
  OFlag:=False;                          // ���� �Է� �� ������ flag = false
  EqualBtn.SetFocus;                      // = ��ư�� ��Ŀ��
  if(RFlag=False) and (dotFlag=True) then // ���� flag = false, dotflag= true �� ��
  begin
    Edit1.Clear;                      //  edit ��� clear
    Edit1.Text:=Edit1.Text+'9';       //  9 �Է�
    RFlag := True;                    // flag = true�� �ϰ� =  ��ư�� ���� �� false
  end;
end;


procedure TForm1.Btn0Click(Sender: TObject);
begin
    if(Edit1.Text='0') then
    begin
      Edit1.Clear;                   // ���� ���� 0�� �� �ʱ�ȭ
    end;
    Edit1.Text:=Edit1.Text+'0';    // 0 �Է�
    OFlag:=False;
    EqualBtn.SetFocus;
    if(RFlag=False) and (dotFlag=True) then // ���� flag = false, dotflag=true �� ��
    begin
      Edit1.Clear;  //= ��ư�� ������ Rflag�� false�� �ǹǷ� edit ��� clear�ϰ� �Է°� �޴´�.
      Edit1.Text:=Edit1.Text+'0'; //0 �Է�
      RFlag := True; // RFlag=true�� �Ͽ�  = ��ư�� ���� �� false�� �ǵ��� ��.
    end;
end;



procedure TForm1.DotBtnClick(Sender: TObject);
begin
  if(dotFlag=True) then    // �Ҽ��� �Է� ����
  begin
  if not(Pos('.',Edit1.Text)=0) then //  �Ҽ��� ���� ��
    begin
      Edit1.Clear;
      Edit1.Text:=Edit1.Text+'0';
      dotFlag:=False;
      EqualBtn.SetFocus;
    end;

  //�Ҽ����� ���� ��
  Edit1.Text := Edit1.Text+'.';
  dotFlag := False; //�Ҽ����� �ԷµǸ� �ٽ� dotFlag�� false�Ͽ� �Ҽ����� �������� �� ������ ��

  EqualBtn.SetFocus;
  end;
end;

procedure TForm1.Init();   // ���� �ʱ�ȭ
begin
  result :=0;
  val1 :=0;
  val2 :=0;
  Edit2.Text:='';
  totalString:='';
  RFlag:=false;
  flag:=true;
  dotFlag:=true;  
end;

procedure TForm1.EqualBtnClick(Sender: TObject);  // ������ ��ȣ üũ
begin
  case check of
    0: Edit1.Text:=FloatToStr(val1+StrToFloat(Edit1.Text)); // check ���� 0�� ��  +
    1: Edit1.Text:=FloatToStr(val1-StrToFloat(Edit1.Text)); // check ���� 1�� �� -
    2: Edit1.Text:=FloatToStr(val1*StrToFloat(Edit1.Text)); // check ���� 2�� �� *
    3: if(val1 = 0) or (Edit1.Text = '0') then //val1 �� 0�϶� ������ ����
        begin
          ShowMessage('���� �� �����ϴ�!');
          exit
        end
       else
       begin
        Edit1.Text:=FloatToStr(val1/StrToFloat(Edit1.text));//check������ 3�̸� ������
       end;
    4: Edit1.Text:= FloatToStr(sqrt(val1)); //��Ʈ
    5: Edit1.Text:= FloatToStr(sqr(val1)); // ����
    6: if(val1 = 0) or (Edit1.Text = '0') then //val1 �� 0�϶� ������ ����
        begin
           ShowMessage('���� �� �����ϴ�!');
           exit
        end
       else
       begin
        Edit1.Text := FloatToStr(1 / val1); // ����
       end;

  end;
        Init();
end;

procedure TForm1.OperatorClick();        // ������ ��ư Ŭ��
begin                                    //���� ���� �Է��ϰ� ������ ��ư ������ ��
  if(flag=True) then                     //val1 ���� ���� ��
  begin
    val2:=StrToFloat(Edit1.Text);
    val1:=val2;                          //val2 ���� val1�� ����
    Edit1.Text:='';
    flag:=False;
  end
  else                                   //val1 �� ���� ��
  begin
    val2 := StrToFloat(Edit1.Text);
    Calculate();
    val1 := result;
    //2023-01-25 jhj
    {
    Edit1.Text := '';
    }
    Edit1.Text := FloatToStr(val1);
    
  end;
end;

procedure TForm1.Calculate();
begin
  case check of
    0: begin
      result := val1 + val2; // check�� 0�� �� +
    end;
    1: begin
      result := val1 - val2; // check�� 1�� �� -
    end;
    2: begin                           
      result := val1 * val2;  // check�� 2�� �� *
    end;
    3: begin
        if( val2 =0) or (Edit1.Text = '0') then // val2�� 0�̸� ������ x
        begin
          ShowMessage('���� �� �����ϴ�!');
          Exit;
        end 
        else
        begin
          result := val1 / val2;
        end;
      end;
    4: begin
        result := sqrt(val1);  // check�� 4�� �� ��Ʈ
      end;
    5: begin
        result := sqr(val1); // check�� 5�� �� ����
      end;
    6: begin
        result := 1 / val1; // check�� 5�� �� ����
      end;
  end;
end;







procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
      VK_NUMPAD0: if(keycheck = false) then begin   //keycheck�� down�� press �� ��ġ�� �÷���
                  Btn0.click;   
                  end;      // ���� 0 ���� ��
      VK_NUMPAD1: if(keycheck = false) then begin
                  Btn1.click;
                  end;      // ���� 1 ���� ��
      VK_NUMPAD2: if(keycheck = false) then begin
                  Btn2.click;
                  end;      // ���� 2 ���� ��
      VK_NUMPAD3: if(keycheck = false) then begin
                  Btn3.click;
                  end;     // ���� 3 ���� ��
      VK_NUMPAD4: if(keycheck = false) then begin
                  Btn4.click;
                  end;     // ���� 4 ���� ��
      VK_NUMPAD5: if(keycheck = false) then begin
                  Btn5.click;
                  end;      // ���� 5 ���� ��
      VK_NUMPAD6: if(keycheck = false) then begin
                  Btn6.click;
                  end;      // ���� 6 ���� ��
      VK_NUMPAD7: if(keycheck = false) then begin
                  Btn7.click;
                  end;     // ���� 7 ���� ��
      VK_NUMPAD8: if(keycheck = false) then begin
                  Btn8.click;
                  end;     // ���� 8 ���� ��
      VK_NUMPAD9: if(keycheck = false) then begin
                  Btn9.click;
                  end;    // ���� 9 ���� ��
      VK_DECIMAL: if(keycheck = false) then begin
                  DotBtn.click;
                  end;   // ��
      VK_ADD:     if(keycheck = false) then begin
                      PlusBtn.click;                 
                      end;          // ���ϱ� ��ư
                       //  DELETE
      VK_SUBTRACT: if(keycheck = false) then begin
                      MinusBtn.click;
                      end;                  // ����
      VK_MULTIPLY: if(keycheck = false) then begin
                      MulBtn.click;
                      end;    // ���ϱ�
      VK_DIVIDE:   if(keycheck = false) then begin
                      DivBtn.click;
                      end;          // ������
      VK_BACK:    BackSpaceBtn.click;
      VK_RETURN:  EqualBtn.click;
      VK_DELETE:  ClearBtn.click;

  else
  end;
  keycheck := True;

end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if(KeyCheck = True) then begin
      case Key of
              #48: Btn0.Click;       // ������ �ƽ�Ű�ڵ� #48 = 0
              #49: Btn1.Click;       // ������ �ƽ�Ű�ڵ� #49 = 1
              #50: Btn2.Click;       // ������ �ƽ�Ű�ڵ� #50 = 1
              #51: Btn3.Click;       // ������ �ƽ�Ű�ڵ� #51 = 3
              #52: Btn4.Click;       // ������ �ƽ�Ű�ڵ� #52 = 4
              #53: Btn5.Click;       // ������ �ƽ�Ű�ڵ� #53 = 5
              #54: Btn6.Click;       // ������ �ƽ�Ű�ڵ� #54 = 6
              #55: Btn7.Click;       // ������ �ƽ�Ű�ڵ� #55 = 7
              #56: Btn8.Click;       // ������ �ƽ�Ű�ڵ� #56 = 8
              #57: Btn9.Click;       // ������ �ƽ�Ű�ڵ� #57 = 9
              #43: PlusBtn.Click;    // ������ �ƽ�Ű�ڵ� #43 = +
              #45: MinusBtn.Click;   // ������ �ƽ�Ű�ڵ� #45 = -
              #42: MulBtn.Click;     // ������ �ƽ�Ű�ڵ� #42 = *
              #47: DivBtn.Click;     // ������ �ƽ�Ű�ڵ� #47 = /
              #46: DotBtn.Click;     // ������ �ƽ�Ű�ڵ� #46 = .
              #61: EqualBtn.Click;   // ������ �ƽ�Ű�ڵ� #61 = =
          end;

    end;

end;

end.