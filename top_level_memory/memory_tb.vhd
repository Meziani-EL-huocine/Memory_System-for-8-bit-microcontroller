library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity memory_tb is
end entity;

architecture behavior of memory_tb is

    -- Component declaration for the unit under test (UUT)
    component memory
        port(
            address        : in std_logic_vector(7 downto 0);
            data_in        : in std_logic_vector(7 downto 0);
            clk            : in std_logic;
            reset          : in std_logic;
            rw             : in std_logic;
            data_out       : out std_logic_vector(7 downto 0);
            in_port_00     : in std_logic_vector(7 downto 0);
            in_port_01     : in std_logic_vector(7 downto 0);
            in_port_02     : in std_logic_vector(7 downto 0);
            in_port_03     : in std_logic_vector(7 downto 0);
            in_port_04     : in std_logic_vector(7 downto 0);
            in_port_05     : in std_logic_vector(7 downto 0);
            in_port_06     : in std_logic_vector(7 downto 0);
            in_port_07     : in std_logic_vector(7 downto 0);
            in_port_08     : in std_logic_vector(7 downto 0);
            in_port_09     : in std_logic_vector(7 downto 0);
            in_port_10     : in std_logic_vector(7 downto 0);
            in_port_11     : in std_logic_vector(7 downto 0);
            in_port_12     : in std_logic_vector(7 downto 0);
            in_port_13     : in std_logic_vector(7 downto 0);
            in_port_14     : in std_logic_vector(7 downto 0);
            in_port_15     : in std_logic_vector(7 downto 0);
            port_out_00    : out std_logic_vector(7 downto 0);
            port_out_01    : out std_logic_vector(7 downto 0);
            port_out_02    : out std_logic_vector(7 downto 0);
            port_out_03    : out std_logic_vector(7 downto 0);
            port_out_04    : out std_logic_vector(7 downto 0);
            port_out_05    : out std_logic_vector(7 downto 0);
            port_out_06    : out std_logic_vector(7 downto 0);
            port_out_07    : out std_logic_vector(7 downto 0);
            port_out_08    : out std_logic_vector(7 downto 0);
            port_out_09    : out std_logic_vector(7 downto 0);
            port_out_10    : out std_logic_vector(7 downto 0);
            port_out_11    : out std_logic_vector(7 downto 0);
            port_out_12    : out std_logic_vector(7 downto 0);
            port_out_13    : out std_logic_vector(7 downto 0);
            port_out_14    : out std_logic_vector(7 downto 0);
            port_out_15    : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Testbench signals
    signal address_tb        : std_logic_vector(7 downto 0);
    signal data_in_tb        : std_logic_vector(7 downto 0);
    signal clk_tb            : std_logic := '0';
    signal reset_tb          : std_logic := '0';
    signal rw_tb             : std_logic := '0';
    signal data_out_tb       : std_logic_vector(7 downto 0);
    signal in_port_00_tb     : std_logic_vector(7 downto 0) := x"01";
    signal in_port_01_tb     : std_logic_vector(7 downto 0) := x"02";
    signal in_port_02_tb     : std_logic_vector(7 downto 0) := x"03";
    signal in_port_03_tb     : std_logic_vector(7 downto 0) := x"04";
    signal in_port_04_tb     : std_logic_vector(7 downto 0) := x"05";
    signal in_port_05_tb     : std_logic_vector(7 downto 0) := x"06";
    signal in_port_06_tb     : std_logic_vector(7 downto 0) := x"07";
    signal in_port_07_tb     : std_logic_vector(7 downto 0) := x"08";
    signal in_port_08_tb     : std_logic_vector(7 downto 0) := x"09";
    signal in_port_09_tb     : std_logic_vector(7 downto 0) := x"0A";
    signal in_port_10_tb     : std_logic_vector(7 downto 0) := x"0B";
    signal in_port_11_tb     : std_logic_vector(7 downto 0) := x"0C";
    signal in_port_12_tb     : std_logic_vector(7 downto 0) := x"0D";
    signal in_port_13_tb     : std_logic_vector(7 downto 0) := x"0E";
    signal in_port_14_tb     : std_logic_vector(7 downto 0) := x"0F";
    signal in_port_15_tb     : std_logic_vector(7 downto 0) := x"10";
    signal port_out_00_tb    : std_logic_vector(7 downto 0);
    signal port_out_01_tb    : std_logic_vector(7 downto 0);
    signal port_out_02_tb    : std_logic_vector(7 downto 0);
    signal port_out_03_tb    : std_logic_vector(7 downto 0);
    signal port_out_04_tb    : std_logic_vector(7 downto 0);
    signal port_out_05_tb    : std_logic_vector(7 downto 0);
    signal port_out_06_tb    : std_logic_vector(7 downto 0);
    signal port_out_07_tb    : std_logic_vector(7 downto 0);
    signal port_out_08_tb    : std_logic_vector(7 downto 0);
    signal port_out_09_tb    : std_logic_vector(7 downto 0);
    signal port_out_10_tb    : std_logic_vector(7 downto 0);
    signal port_out_11_tb    : std_logic_vector(7 downto 0);
    signal port_out_12_tb    : std_logic_vector(7 downto 0);
    signal port_out_13_tb    : std_logic_vector(7 downto 0);
    signal port_out_14_tb    : std_logic_vector(7 downto 0);
    signal port_out_15_tb    : std_logic_vector(7 downto 0);

    -- Clock generation
    constant clk_period : time := 10 ns;
   

begin
    -- UUT instantiation
    uut: memory
        port map(
            address        => address_tb,
            data_in        => data_in_tb,
            clk            => clk_tb,
            reset          => reset_tb,
            rw             => rw_tb,
            data_out       => data_out_tb,
            in_port_00     => in_port_00_tb,
            in_port_01     => in_port_01_tb,
            in_port_02     => in_port_02_tb,
            in_port_03     => in_port_03_tb,
            in_port_04     => in_port_04_tb,
            in_port_05     => in_port_05_tb,
            in_port_06     => in_port_06_tb,
            in_port_07     => in_port_07_tb,
            in_port_08     => in_port_08_tb,
            in_port_09     => in_port_09_tb,
            in_port_10     => in_port_10_tb,
            in_port_11     => in_port_11_tb,
            in_port_12     => in_port_12_tb,
            in_port_13     => in_port_13_tb,
            in_port_14     => in_port_14_tb,
            in_port_15     => in_port_15_tb,
            port_out_00    => port_out_00_tb,
            port_out_01    => port_out_01_tb,
            port_out_02    => port_out_02_tb,
            port_out_03    => port_out_03_tb,
            port_out_04    => port_out_04_tb,
            port_out_05    => port_out_05_tb,
            port_out_06    => port_out_06_tb,
            port_out_07    => port_out_07_tb,
            port_out_08    => port_out_08_tb,
            port_out_09    => port_out_09_tb,
            port_out_10    => port_out_10_tb,
            port_out_11    => port_out_11_tb,
            port_out_12    => port_out_12_tb,
            port_out_13    => port_out_13_tb,
            port_out_14    => port_out_14_tb,
            port_out_15    => port_out_15_tb
        );
 
    -- Process to generate clock signal
   process
    begin
        clk_tb <= '0';
        wait for clk_period / 2;
        clk_tb <= '1';
        wait for clk_period / 2;
    end process;

    -- Test stimulus process
    process
    begin
        -- Reset the system
        reset_tb <= '0';
        wait for clk_period;
        reset_tb <= '1';
        wait for clk_period;


     for j in 0 to 3 loop
        address_tb <= std_logic_vector(to_unsigned(j,8));
        wait for clk_period ;
     end loop;
    
 for i in 128 to 132 loop
     rw_tb<='0';
     wait for clk_period;
     data_in_tb <= std_logic_vector(to_unsigned(i,8));
     address_tb <= std_logic_vector(to_unsigned(i,8));
     wait for clk_period;
     rw_tb<='1';
     address_tb <= std_logic_vector(to_unsigned(i,8));  
     wait for clk_period;
   end loop;

 -- Write to each port with corresponding address
    for s in 0 to 15 loop
      address_tb <= std_logic_vector(to_unsigned(s, 8)) + x"E0";
      data_in_tb <= std_logic_vector(to_unsigned(s * 10, 8));
      rw_tb <= '1';
      wait for clk_period;
      rw_tb <= '0';
      wait for clk_period;
    end loop;

 for m in 0 to 15 loop
      address_tb <= std_logic_vector(to_unsigned(m, 8)) + x"F0";
      wait for clk_period;
  end loop; 
  end process;

end architecture;

