library ieee;
use ieee.std_logic_1164.all;

entity datapath is
port(
	clk : in std_logic;
	rst : in std_logic;
	PCOut : out std_logic_vector (4 downto 0);
	Instruction : in std_logic_vector (31 downto 0);
	DataMemRead : out std_logic;
	DataMemWrite : out std_logic;
	DataMemAddr : out std_logic_vector (31 downto 0);
	DataMemDataIn : out std_logic_vector (31 downto 0);
	DataMemDataOut : in std_logic_vector (31 downto 0)
);
end datapath;

component CU
  port(
    Instruction : IN std_logic_vector (31 downto 0);
    MemRead     : OUT std_logic;
    MemWrite    : OUT std_logic;
    WBSel       : OUT std_logic_vector (1 downto 0);
    ImmSel      : OUT std_logic_vector (2 downto 0);
    ALUOp       : OUT std_logic_vector (1 downto 0);
    ALUSrcA     : OUT std_logic;
    ALUSrcB     : OUT std_logic;
	BrInstr		: OUT std_logic;
    RegWrite    : OUT std_logic
  );
end component;

component Register_
generic( N : natural := 32);
port(
      data_in  : in std_logic_vector (N-1 downto 0);
      clk      : in std_logic;
      reg_rst  : in std_logic;
      reg_en   : in std_logic;
      data_out : out std_logic_vector (N-1 downto 0)
);
end component;

component mux2to1
generic(N : natural := 32);
port(
  data_0_in : in std_logic_vector (N-1 downto 0);
  data_1_in : in std_logic_vector (N-1 downto 0);
  sel       : in std_logic;
  data_out  : out  std_logic_vector (N-1 downto 0)
);
end component;

component mux4to1
generic(N : natural := 32);
port(
  data_00_in : in std_logic_vector (N-1 downto 0);
  data_01_in : in std_logic_vector (N-1 downto 0);
  data_10_in : in std_logic_vector (N-1 downto 0);
  data_11_in : in std_logic_vector (N-1 downto 0);
  sel        : in std_logic_vector (1 downto 0);
  data_out   : out  std_logic_vector (N-1 downto 0)
);
end component;

component RegisterFile
port(
  clk         : in std_logic;
  data_in     : in std_logic_vector (31 downto 0);
  write_addr  : in std_logic_vector (4 downto 0);
  data_out_A  : out std_logic_vector (31 downto 0);
  data_out_B  : out std_logic_vector (31 downto 0);
  read_A_addr : in std_logic_vector (4 downto 0);
  read_B_addr : in std_logic_vector (4 downto 0);
  write_en    : in std_logic
);
end component;

component ALU
port(
  data_in_A : in std_logic_vector (31 downto 0);
  data_in_B : in std_logic_vector (31 downto 0);
  ALUCtrl   : in std_logic_vector (3 downto 0);
  data_out  : out std_logic_vector (31 downto 0)
);
end component;

component ALU_CU
port(
  ALUOp   : in std_logic_vector (1 downto 0);
  funct3  : in std_logic_vector (2 downto 0);
  ALUCtrl : out std_logic_vector (3 downto 0)
);
end component;

component ImmGen
port(
  Instruction : in std_logic_vector (24 downto 0);
  ImmSel      : in std_logic_vector (2 downto 0);
  Immediate   : out std_logic_vector (31 downto 0)
);
end component;

component PCInc
port(
  PC_in  : in std_logic_vector (31 downto 0);
  PC_out : out std_logic_vector (31 downto 0)
);
end component;

component BranchComp
port(
  data_in_A : in std_logic_vector (31 downto 0);
  data_in_B : in std_logic_vector (31 downto 0);
  BrEq      : out std_logic

);
end component;

component ForwardUnit
port(
  Rs1_ID : in std_logic_vector (4 downto 0);
  Rs2_ID : in std_logic_vector (4 downto 0);
  Rd_EX : in std_logic_vector (4 downto 0);
  Rd_MEM : in std_logic_vector (4 downto 0);
  RegWrite_EX : in std_logic;
  RegWrite_MEM : in std_logic;
  ForwardA : out std_logic_vector (1 downto 0);
  ForwardB : out std_logic_vector (1 downto 0)
);
end component;

component HazardDetUnit
port( 
  Rs1_IF : in std_logic_vector (4 downto 0);
  Rs2_IF : in std_logic_vector (4 downto 0);
  Rd_ID : in std_logic_vector (4 downto 0);
  MemRead_ID : in std_logic;
  BrEq : in std_logic;
  BrInstr_ID : in std_logic;
  IF_RegEn : out std_logic;
  PC_RegEn : out std_logic;
  ID_RegSel : out std_logic;
  IF_RegSel : out std_logic;
  PCSel : out std_logic
);
end component;

architecture structure of datapath is

signal pipe_reg_rst : std_logic;
signal NOP_instruction : std_logic_vector (31 downto 0);

signal Instruction_IF : std_logic_vector(31 downto 0);
signal MemRead_IF, MemWrite_IF : std_logic;
signal WBSel_IF : std_logic_vector (1 downto 0);
signal ImmSel_IF : std_logic_vector (2 downto 0);
signal ALUOp_IF : std_logic_vector (1 downto 0);
signal ALUSrcA_IF : std_logic;
signal ALUSrcB_IF : std_logic;
signal BrInstr_IF : std_logic;
signal RegWrite_IF : std_logic;

signal PC_reg_in : std_logic_vector (31 downto 0);
signal PC_reg_rst : std_logic;
signal PC_RegEn : std_logic;
signal PC_reg_out : std_logic_vector (31 downto 0);

signal PC_inc_out : std_logic_vector (31 downto 0);
signal ALU_out : std_logic_vector (31 downto 0);
signal PCSel : std_logic;

signal IF_RegSel : std_logic;

---------------------------------
------- IF pipeline stage -------
---------------------------------

signal IF_RegEn : std_logic;
signal IF_pipe_PC_out : std_logic_vector (31 downto 0);
signal IF_pipe_instr_out : std_logic_vector (31 downto 0);

----------------------------------------------------
signal  Rs1_IF : std_logic_vector (4 downto 0);
signal  Rs2_IF : std_logic_vector (4 downto 0);
signal  Rd_IF : std_logic_vector (4 downto 0);
signal  Rd_ID : std_logic_vector (4 downto 0);
signal  MemRead_ID : std_logic;
signal  BrEq : std_logic;
signal  BrInstr_ID : std_logic;
signal  ID_RegSel : std_logic;

signal Instruction_imm_IF : std_logic_vector (24 downto 0);
signal Immediate_IF : std_logic_vector (31 downto 0);

signal MEM_pipe_data_out : std_logic_vector (31 downto 0);
signal MEM_pipe_addr_out : std_logic_vector (4 downto 0);
signal RegFile_dataA_out : std_logic_vector (31 downto 0);
signal RegFile_dataB_out : std_logic_vector (31 downto 0);
signal RegWrite_MEM : std_logic;


begin

pipe_reg_rst <= rst;
PC_reg_rst <= rst;

NOP_instruction (31 downto 7) <= (others=>'0');
NOP_instruction (6 downto 0) <= "0010011"; -- addi x0, x0, 0

ControlUnit : CU
port map(
	Instruction	=> Instruction_IF,
	MemRead 	=> MemRead_IF,
	MemWrite 	=> MemWrite_IF,
	WBSel 		=> WBSel_IF,
    ImmSel 		=> ImmSel_IF,
    ALUOp 		=> ALUOp_IF,
    ALUSrcA 	=> ALUSrcA_IF,
    ALUSrcB 	=> ALUSrcB_IF,
	BrInstr		=> BrInstr_IF,
    RegWrite 	=> RegWrite_IF
);

PC_reg : Register_
port map(
	data_in  => PC_reg_in
	clk      => clk,
	reg_rst  => PC_reg_rst,
	reg_en   => PC_RegEn,
	data_out => PC_reg_out
);

PCOut <= PC_reg_out;

PC_sel_mux : mux2to1
port map(
  data_0_in => PC_inc_out,
  data_1_in => ALU_out,
  sel       => PCSel,
  data_out  => PC_reg_in
);

PC_inc : PCInc
port map(
  PC_in  => PC_reg_out,
  PC_out => PC_inc_out
);

IF_instr_sel_mux : mux2to1
port map(
  data_0_in => Instruction,
  data_1_in => NOP_instruction,
  sel       => IF_RegSel,
  data_out  => Instruction_mux_out
);

---------------------------------
------- IF pipeline stage -------
---------------------------------

IF_pipe_PC : Register_
port map(
	data_in  => PC_reg_out,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => IF_RegEn,
	data_out => IF_pipe_PC_out
);

IF_pipe_instr : Register_
port map(
	data_in  => Instruction_mux_out,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => IF_RegEn,
	data_out => IF_pipe_instr_out
);


-----------------------------------

-----------------------------------

HazardDetectionUnit : HazardDetUnit
port map( 
  Rs1_IF 		=> Rs1_IF,
  Rs2_IF 		=> Rs2_IF,
  Rd_ID 		=> Rd_ID,
  MemRead_ID	=> MemRead_ID,
  BrEq 			=> BrEq,
  BrInstr_ID 	=> BrInstr_ID,
  IF_RegEn 		=> IF_RegEn,
  PC_RegEn 		=> PC_RegEn,
  ID_RegSel 	=> ID_RegSel,
  IF_RegSel 	=> IF_RegSel,
  PCSel 		=> PCSel
);

Rs1_IF <= IF_pipe_instr_out (19 downto 15);
Rs2_IF <= IF_pipe_instr_out (24 downto 20);
Rd_IF <= IF_pipe_instr_out (11 downto 7);

Register_file : RegisterFile
port map(
  clk         => clk,
  data_in     => MEM_pipe_data_out,
  write_addr  => MEM_pipe_addr_out,
  data_out_A  => RegFile_dataA_out,
  data_out_B  => RegFile_dataB_out,
  read_A_addr => Rs1_IF,
  read_B_addr => Rs2_IF,
  write_en    => RegWrite_MEM
);

Instruction_imm_IF <= Immediate_IF (31 downto 7);

Imm_gen : ImmGen
port map(
  Instruction => Instruction_imm_IF,
  ImmSel      => ImmSel_IF,
  Immediate   => Immediate_IF
);

ID_MemRead_sel_mux : mux2to1
generic map (N => 1)
port map(
  data_0_in => MemRead_IF,
  data_1_in => '0',
  sel       => ID_RegSel,
  data_out  => ID_pipe_Memread_in
);

ID_MemWrite_sel_mux : mux2to1
generic map (N => 1)
port map(
  data_0_in => MemWrite_IF,
  data_1_in => '0',
  sel       => ID_RegSel,
  data_out  => ID_pipe_MemWrite_in
);


ID_ALUOp_sel_mux : mux2to1
generic map (N => 2)
port map(
  data_0_in => ALUOp_IF,
  data_1_in => "11", -- Bypass A
  sel       => ID_RegSel,
  data_out  => ID_pipe_ALUOp_in
);

ID_BrInstr_sel_mux : mux2to1
generic map (N => 1)
port map(
  data_0_in => BrInstr_IF,
  data_1_in => '0',
  sel       => ID_RegSel,
  data_out  => ID_pipe_BrInstr_in
);

ID_RegWrite_sel_mux : mux2to1
generic map (N => 1)
port map(
  data_0_in => RegWrite_IF,
  data_1_in => '0',
  sel       => ID_RegSel,
  data_out  => ID_pipe_RegWrite_in
);

 : mux2to1
port map(
  data_0_in => 
  data_1_in => 
  sel       => ID_RegSel,
  data_out  => 
);



 : Register_
generic map(N => )
port map(
	data_in  => 
	clk      => clk,
	reg_rst  => 
	reg_en   => 
	data_out => 
);


end architecture;