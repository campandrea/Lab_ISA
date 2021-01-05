library ieee;
use ieee.std_logic_1164.all;

component CU
  port(
    Instruction : IN std_logic_vector (31 downto 0);
    PCSel       : OUT std_logic;
    BrEq        : IN std_logic;
    MemRead     : OUT std_logic;
    MemWrite    : OUT std_logic;
    WBSel       : OUT std_logic_vector (1 downto 0);
    ImmSel      : OUT std_logic_vector (2 downto 0);
    ALUOp       : OUT std_logic_vector (1 downto 0);
    ALUSrcA     : OUT std_logic;
    ALUSrcB     : OUT std_logic;
    RegWrite    : OUT std_logic
  );
end component;

component Register
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
  Immediate   : out std_logic_vector (31 downto 0)
);
end component;

component PCInc
port(
  PC_in  : in std_logic_vector (31 downto 0);
  PC_out : out std_logic_vector (31 downto 0)
);
end component;
