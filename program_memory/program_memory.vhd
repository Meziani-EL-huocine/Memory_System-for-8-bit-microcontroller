library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;


entity program_memory is
     port( clk: in std_logic;
           address:  in std_logic_vector(7 downto 0);
           data_out: out std_logic_vector(7 downto 0));
end entity;


architecture behavior of program_memory is

--declaration of set instructions as constants

constant LDA_IMM : std_logic_vector (7 downto 0) := x"86";
constant LDA_DIR : std_logic_vector (7 downto 0) := x"87";
constant LDB_IMM : std_logic_vector (7 downto 0) := x"88";
constant LDB_DIR : std_logic_vector (7 downto 0) := x"89";
constant STA_DIR : std_logic_vector (7 downto 0) := x"96";
constant STB_DIR : std_logic_vector (7 downto 0) := x"97";
constant ADD_AB  : std_logic_vector (7 downto 0) := x"42";
constant SUB_AB  : std_logic_vector (7 downto 0) := x"43";
constant AND_AB  : std_logic_vector (7 downto 0) := x"44";
constant OR_AB   : std_logic_vector (7 downto 0) := x"45";
constant INCA    : std_logic_vector (7 downto 0) := x"46";
constant INCB    : std_logic_vector (7 downto 0) := x"47";
constant DECA    : std_logic_vector (7 downto 0) := x"48";
constant DECB    : std_logic_vector (7 downto 0) := x"49";
constant BRA     : std_logic_vector (7 downto 0) := x"20";
constant BMI     : std_logic_vector (7 downto 0) := x"21";
constant BPL     : std_logic_vector (7 downto 0) := x"22";
constant BEQ     : std_logic_vector (7 downto 0) := x"23";
constant BNE     : std_logic_vector (7 downto 0) := x"24";
constant BVS     : std_logic_vector (7 downto 0) := x"25";
constant BVC     : std_logic_vector (7 downto 0) := x"26";
constant BCS     : std_logic_vector (7 downto 0) := x"27";
constant BCC     : std_logic_vector (7 downto 0) := x"28";

signal EN  : std_logic ;

--create a type for program_memory 

type ROM is array(0 to 127) of std_logic_vector(7 downto 0);

-- declaring a program_memory as a constant (ROM) and fill it with instructions and somme data

constant program_memory : ROM :=(0 =>LDA_IMM,
                                1 => x"AA",
                                2 =>LDA_DIR,
                                3 =>x"AB",
                                4 =>LDB_IMM,
                                5 =>x"1A",
                                6 =>LDB_DIR,
                                7 =>x"5A",
                                8 =>STA_DIR,
                                9 =>x"54",
                                10 =>STB_DIR,
                                11 =>x"E3",
                                12 =>ADD_AB,
                                13 =>SUB_AB,
                                14 =>AND_AB,
                                15 =>OR_AB,
                                16 =>INCA,
                                17 =>INCB,
                                18 =>DECA,
                                19 =>DECB,
                                20 =>BRA,
                                21 =>x"05",
                                22 =>BMI,
                                23 =>x"00",
                                24 =>BPL,
                                25 =>x"67",
                                26 =>BEQ,
                                27 =>x"A0",
                                28 =>BNE,
                                29 =>x"A4",
                                30 =>BVS,
                                31 =>x"AA",
                                32 =>BVC,
                                33 =>x"AA",
                                34 =>BCS,
                                35 =>x"AA",
                                36 =>BCC,
                                37 =>x"AA",
                                others=>x"00");

begin

-- enable process to enabling or not the program_memory depending of address input

enable : process (address)
begin
      if ((to_integer(unsigned(address)) >= 0) and
           (to_integer(unsigned(address)) <= 127)) then
             EN <= '1';
      else
             EN <= '0';
     end if;
end process;

--acceding to memory depending on address

memory: process(clk)
begin 
    if(clk'event and clk='1') then 
       if(EN='1') then 
             data_out <= program_memory(to_integer(unsigned(address)));
       end if;
    end if;
end process;

end architecture; 
