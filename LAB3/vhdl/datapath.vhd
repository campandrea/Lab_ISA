library ieee;
use ieee.std_logic_1164.all;

entity datapath is
port(
	clk : in std_logic;
	rst : in std_logic;
	PCOut : out std_logic_vector (31 downto 0);
	Instruction : in std_logic_vector (31 downto 0);
	DataMemRead : out std_logic;
	DataMemWrite : out std_logic;
	DataMemAddr : out std_logic_vector (31 downto 0);
	DataMemDataIn : out std_logic_vector (31 downto 0);
	DataMemDataOut : in std_logic_vector (31 downto 0)
);
end datapath;
architecture structure of datapath is

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

component Register_std
port(
      data_in  : in std_logic;
      clk      : in std_logic;
      reg_rst  : in std_logic;
      reg_en   : in std_logic;
      data_out : out std_logic
);
end component;

component Register_vec
generic( N : natural := 32);
port(
      data_in  : in std_logic_vector (N-1 downto 0);
      clk      : in std_logic;
      reg_rst  : in std_logic;
      reg_en   : in std_logic;
      data_out : out std_logic_vector (N-1 downto 0)
);
end component;

component Register_PC
generic( N : natural := 32);
port(
      data_in  : in std_logic_vector (N-1 downto 0);
      clk      : in std_logic;
      reg_rst  : in std_logic;
      reg_en   : in std_logic;
      data_out : out std_logic_vector (N-1 downto 0)
);
end component;

component mux2to1_std
port(
  data_0_in : in std_logic;
  data_1_in : in std_logic;
  sel       : in std_logic;
  data_out  : out  std_logic
);
end component;

component mux2to1_vec
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

signal pipe_reg_en : std_logic;
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
signal funct3_IF : std_logic_vector (2 downto 0);

signal Instruction_imm_IF : std_logic_vector (24 downto 0);
signal Immediate_IF : std_logic_vector (31 downto 0);

signal MEM_pipe_data_out : std_logic_vector (31 downto 0);
signal RegFile_dataA_out : std_logic_vector (31 downto 0);
signal RegFile_dataB_out : std_logic_vector (31 downto 0);
signal RegWrite_MEM : std_logic;

signal ID_pipe_MemRead_in : std_logic;
signal ID_pipe_MemWrite_in : std_logic;
signal ID_pipe_ALUOp_in : std_logic_vector (1 downto 0);
signal ID_pipe_BrInstr_in : std_logic;
signal ID_pipe_RegWrite_in : std_logic;

---------------------------------
------- IF pipeline stage -------
---------------------------------

signal PC_ID : std_logic_vector (31 downto 0);
signal MemWrite_ID : std_logic;
signal ALUOp_ID : std_logic_vector (1 downto 0);
signal RegWrite_ID : std_logic;
signal WBSel_ID : std_logic_vector (1 downto 0);
signal ImmSel_ID : std_logic_vector (2 downto 0);
signal ALUSrcA_ID : std_logic;
signal ALUSrcB_ID : std_logic;

signal ID_pipe_dataA_out : std_logic_vector (31 downto 0);
signal ID_pipe_dataB_out : std_logic_vector (31 downto 0);
signal Rs1_ID : std_logic_vector (4 downto 0);
signal Rs2_ID : std_logic_vector (4 downto 0);

signal Immediate_ID : std_logic_vector (31 downto 0);
signal funct3_ID : std_logic_vector (2 downto 0);
signal Instruction_mux_out : std_logic_vector (31 downto 0);

-------------------------------------------------
-------------------------------------------------

signal ALUSrcA_mux_out : std_logic_vector (31 downto 0);
signal ALUSrcB_mux_out : std_logic_vector (31 downto 0);
signal ForwardA : std_logic_vector (1 downto 0);
signal ForwardB : std_logic_vector (1 downto 0);
signal ALUDataA_in, ALUDataB_in : std_logic_vector (31 downto 0);

signal ALUCtrl : std_logic_vector (3 downto 0);
signal ALUData_out : std_logic_vector (31 downto 0);


---------------------------------
------- EX pipeline stage -------
---------------------------------

signal MemRead_EX : std_logic;
signal MemWrite_EX : std_logic;
signal WBSel_EX : std_logic_vector(1 downto 0);
signal RegWrite_EX : std_logic;
signal PC_ID_inc : std_logic_vector (31 downto 0);
signal PCInc_ex : std_logic_vector (31 downto 0);
signal ALU_data_out_EX : std_logic_vector (31 downto 0);
signal EX_pipe_DataB_out : std_logic_vector (31 downto 0);
signal Rd_EX : std_logic_vector (4 downto 0);
signal EX_pipe_ALU_out : std_logic_vector (31 downto 0);

---------------------------------------------------------
---------------------------------------------------------

---------------------------------
------ MEM pipeline stage -------
---------------------------------
signal MEM_data_out_MEM : std_logic_vector (31 downto 0);
signal Rd_MEM : std_logic_vector (4 downto 0);
signal MEM_pipe_data_in : std_logic_vector (31 downto 0);


begin

pipe_reg_en <= not rst;
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

PC_reg : Register_PC
port map(
	data_in  => PC_reg_in,
	clk      => clk,
	reg_rst  => PC_reg_rst,
	reg_en   => PC_RegEn,
	data_out => PC_reg_out
);

PCOut <= PC_reg_out;

PC_sel_mux : mux2to1_vec
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

IF_instr_sel_mux : mux2to1_vec
port map(
  data_0_in => Instruction,
  data_1_in => NOP_instruction,
  sel       => IF_RegSel,
  data_out  => Instruction_mux_out
);

---------------------------------
------- IF pipeline stage -------
---------------------------------

IF_pipe_PC : Register_vec
port map(
	data_in  => PC_reg_out,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => IF_RegEn,
	data_out => IF_pipe_PC_out
);

IF_pipe_instr : Register_vec
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
funct3_IF <= IF_pipe_instr_out (14 downto 12);

Register_afile : RegisterFile
port map(
  clk         => clk,
  data_in     => MEM_pipe_data_out,
  write_addr  => Rd_MEM,
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

ID_MemRead_sel_mux : mux2to1_std
port map(
  data_0_in => MemRead_IF,
  data_1_in => '0',
  sel       => ID_RegSel,
  data_out  => ID_pipe_MemRead_in
);

ID_MemWrite_sel_mux : mux2to1_std
port map(
  data_0_in => MemWrite_IF,
  data_1_in => '0',
  sel       => ID_RegSel,
  data_out  => ID_pipe_MemWrite_in
);

ID_ALUOp_sel_mux : mux2to1_vec
generic map (N => 2)
port map(
  data_0_in => ALUOp_IF,
  data_1_in => "11", -- Bypass A
  sel       => ID_RegSel,
  data_out  => ID_pipe_ALUOp_in
);

ID_BrInstr_sel_mux : mux2to1_std
port map(
  data_0_in => BrInstr_IF,
  data_1_in => '0',
  sel       => ID_RegSel,
  data_out  => ID_pipe_BrInstr_in
);

ID_RegWrite_sel_mux : mux2to1_std
port map(
  data_0_in => RegWrite_IF,
  data_1_in => '0',
  sel       => ID_RegSel,
  data_out  => ID_pipe_RegWrite_in
);

---------------------------------
------- ID pipeline stage -------s
---------------------------------

ID_pipe_PC : Register_vec
generic map(N => 32)
port map(
	data_in  => IF_pipe_PC_out,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => PC_ID
);

ID_pipe_MemRead : Register_std
port map(
	data_in  => ID_pipe_MemRead_in,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => MemRead_ID
);

ID_pipe_MemWrite : Register_std
port map(
	data_in  => ID_pipe_MemWrite_in,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => MemWrite_ID
);

ID_pipe_ALUOp : Register_vec
generic map(N => 2)
port map(
	data_in  => ID_pipe_ALUOp_in,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => ALUOp_ID
);

ID_pipe_BrInstr : Register_std
port map(
	data_in  => ID_pipe_BrInstr_in,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => BrInstr_ID
);

ID_pipe_RegWrite : Register_std
port map(
	data_in  => ID_pipe_RegWrite_in,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => RegWrite_ID
);

ID_pipe_WBSel : Register_vec
generic map(N => 2)
port map(
	data_in  => WBSel_IF,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => WBSel_ID
);

ID_pipe_ImmSel : Register_vec
generic map(N => 3)
port map(
	data_in  => ImmSel_IF,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => ImmSel_ID
);

ID_pipe_ALUSrcA : Register_std
port map(
	data_in  => ALUSrcA_IF,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => ALUSrcA_ID
);

ID_pipe_ALUSrcB : Register_std
port map(
	data_in  => ALUSrcB_IF,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => ALUSrcB_ID
);

ID_pipe_dataA : Register_vec
generic map(N => 32)
port map(
	data_in  => RegFile_dataA_out,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => ID_pipe_dataA_out
);

ID_pipe_dataB : Register_vec
generic map(N => 32)
port map(
	data_in  => RegFile_dataB_out,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => ID_pipe_dataB_out
);

ID_pipe_Rs1 : Register_vec
generic map(N => 5)
port map(
	data_in  => Rs1_IF,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => Rs1_ID
);

ID_pipe_Rs2 : Register_vec
generic map(N => 5)
port map(
	data_in  => Rs2_IF,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => Rs2_ID
);

ID_pipe_Rd : Register_vec
generic map(N => 5)
port map(
	data_in  => Rd_IF,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => Rd_ID
);

ID_pipe_Immediate : Register_vec
generic map(N => 32)
port map(
	data_in  => Immediate_IF,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => Immediate_ID
);

ID_pipe_funct3 : Register_vec
generic map(N => 3)
port map(
	data_in  => funct3_IF,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => funct3_ID
);


---------------------------------------
---------------------------------------

ALUSrcA_mux : mux2to1_vec
port map(
  data_0_in => ID_pipe_dataA_out,
  data_1_in => Immediate_ID,
  sel       => ALUSrcA_ID,
  data_out  => ALUSrcA_mux_out
);

ALUSrcB_mux : mux2to1_vec
port map(
  data_0_in => ID_pipe_dataB_out,
  data_1_in => PC_ID,
  sel       => ALUSrcB_ID,
  data_out  => ALUSrcB_mux_out
);

ForwardA_mux : mux4to1
generic map(N => 32)
port map(
  data_00_in => ALUSrcA_mux_out,
  data_01_in => (others => '0'),
  data_10_in => ALU_data_out_EX,
  data_11_in => MEM_data_out_MEM,
  sel        => ForwardA,
  data_out   => ALUDataA_in
);

ForwardB_mux : mux4to1
generic map(N => 32)
port map(
  data_00_in => ALUSrcB_mux_out,
  data_01_in => (others => '0'),
  data_10_in => ALU_data_out_EX,
  data_11_in => MEM_data_out_MEM,
  sel        => ForwardB,
  data_out   => ALUDataB_in
);

ALU_a : ALU
port map(
  data_in_A => ALUDataA_in,
  data_in_B => ALUDataB_in,
  ALUCtrl   => ALUCtrl,
  data_out  => ALUData_out
);


ALU_CU_a : ALU_CU
port map(
  ALUOp   => ALUOp_ID,
  funct3  => funct3_ID,
  ALUCtrl => ALUCtrl
);

Branch_Comp : BranchComp
port map(
  data_in_A => ID_pipe_dataA_out,
  data_in_B => ID_pipe_dataB_out,
  BrEq      => BrEq
);


Forward_Unit : ForwardUnit
port map(
  Rs1_ID 		=> Rs1_ID,
  Rs2_ID		=> Rs2_ID,
  Rd_EX  		=> Rd_EX,
  Rd_MEM 		=> Rd_MEM,
  RegWrite_EX 	=> RegWrite_EX,
  RegWrite_MEM	=> RegWrite_MEM,
  ForwardA 		=> ForwardA,
  ForwardB 		=> ForwardB
);

PCInc_1 : PCInc
port map(
	PC_in  => PC_ID,
	PC_out => PC_ID_inc
);

---------------------------------
------- EX pipeline stage -------
---------------------------------

EX_pipe_MemRead : Register_std
port map(
	data_in  => MemRead_ID,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => MemRead_EX
);

EX_pipe_MemWrite : Register_std
port map(
	data_in  => MemWrite_ID,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => MemWrite_EX
);

EX_pipe_WBSel : Register_vec
generic map(N => 2)
port map(
	data_in  => WBSel_ID,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => WBSel_EX
);

EX_pipe_RegWrite : Register_std
port map(
	data_in  => RegWrite_ID,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => RegWrite_EX
);

EX_pipe_PC_inc : Register_vec
generic map(N => 32)
port map(
	data_in  => PC_ID_inc,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => PCInc_EX
);

EX_pipe_ALU_out_reg : Register_vec
generic map(N => 32)
port map(
	data_in  => ALUData_out,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => ALU_data_out_EX
);

EX_pipe_DataB : Register_vec
generic map(N => 32)
port map(
	data_in  => ID_pipe_dataB_out,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => EX_pipe_DataB_out
);

EX_pipe_Rd : Register_vec
generic map(N => 5)
port map(
	data_in  => Rd_ID,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => Rd_EX
);

-----------------------------------------------
-----------------------------------------------
DataMemRead <= MemRead_EX;
DataMemWrite <= MemWrite_EX;
DataMemAddr <= EX_pipe_ALU_out;
DataMemDataIn <= EX_pipe_DataB_out;

WBSel_mux : mux4to1
generic map(N => 32)
port map(
  data_00_in => EX_pipe_ALU_out,
  data_01_in => DataMemDataOut,
  data_10_in => PCInc_EX,
  data_11_in => (others => '0'),
  sel        => WBSel_EX,
  data_out   => MEM_pipe_data_in
);

---------------------------------
------ MEM pipeline stage -------
---------------------------------

MEM_pipe_data : Register_vec
generic map(N => 32)
port map(
	data_in  => MEM_pipe_data_in,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => MEM_pipe_data_out
);

MEM_pipe_Rd : Register_vec
generic map(N => 5)
port map(
	data_in  => Rd_EX,
	clk      => clk,
	reg_rst  => pipe_reg_rst,
	reg_en   => pipe_reg_en,
	data_out => Rd_MEM
);


end architecture;
