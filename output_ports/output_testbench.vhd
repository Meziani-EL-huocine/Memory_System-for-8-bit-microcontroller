library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity tb_output_ports is
end entity;

architecture behavior of tb_output_ports is

  -- Component declaration
  component output_ports
    port(
      address : in std_logic_vector(7 downto 0);
      data_in : in std_logic_vector(7 downto 0);
      clk, reset, wr : in std_logic;
      port_out_00 : out std_logic_vector(7 downto 0);
      port_out_01 : out std_logic_vector(7 downto 0);
      port_out_02 : out std_logic_vector(7 downto 0);
      port_out_03 : out std_logic_vector(7 downto 0);
      port_out_04 : out std_logic_vector(7 downto 0);
      port_out_05 : out std_logic_vector(7 downto 0);
      port_out_06 : out std_logic_vector(7 downto 0);
      port_out_07 : out std_logic_vector(7 downto 0);
      port_out_08 : out std_logic_vector(7 downto 0);
      port_out_09 : out std_logic_vector(7 downto 0);
      port_out_10 : out std_logic_vector(7 downto 0);
      port_out_11 : out std_logic_vector(7 downto 0);
      port_out_12 : out std_logic_vector(7 downto 0);
      port_out_13 : out std_logic_vector(7 downto 0);
      port_out_14 : out std_logic_vector(7 downto 0);
      port_out_15 : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Testbench signals
  signal address   : std_logic_vector(7 downto 0);
  signal data_in   : std_logic_vector(7 downto 0);
  signal clk       : std_logic := '0';
  signal reset     : std_logic := '0';
  signal wr        : std_logic := '0';
  signal port_out_00 : std_logic_vector(7 downto 0);
  signal port_out_01 : std_logic_vector(7 downto 0);
  signal port_out_02 : std_logic_vector(7 downto 0);
  signal port_out_03 : std_logic_vector(7 downto 0);
  signal port_out_04 : std_logic_vector(7 downto 0);
  signal port_out_05 : std_logic_vector(7 downto 0);
  signal port_out_06 : std_logic_vector(7 downto 0);
  signal port_out_07 : std_logic_vector(7 downto 0);
  signal port_out_08 : std_logic_vector(7 downto 0);
  signal port_out_09 : std_logic_vector(7 downto 0);
  signal port_out_10 : std_logic_vector(7 downto 0);
  signal port_out_11 : std_logic_vector(7 downto 0);
  signal port_out_12 : std_logic_vector(7 downto 0);
  signal port_out_13 : std_logic_vector(7 downto 0);
  signal port_out_14 : std_logic_vector(7 downto 0);
  signal port_out_15 : std_logic_vector(7 downto 0);

  -- Clock generation
  constant clk_period : time := 10 ns;
  begin
    clk <= not clk after clk_period/2;

  -- Instantiate the Unit Under Test (UUT)
  uut: output_ports
    port map (
      address => address,
      data_in => data_in,
      clk => clk,
      reset => reset,
      wr => wr,
      port_out_00 => port_out_00,
      port_out_01 => port_out_01,
      port_out_02 => port_out_02,
      port_out_03 => port_out_03,
      port_out_04 => port_out_04,
      port_out_05 => port_out_05,
      port_out_06 => port_out_06,
      port_out_07 => port_out_07,
      port_out_08 => port_out_08,
      port_out_09 => port_out_09,
      port_out_10 => port_out_10,
      port_out_11 => port_out_11,
      port_out_12 => port_out_12,
      port_out_13 => port_out_13,
      port_out_14 => port_out_14,
      port_out_15 => port_out_15
    );

  -- Stimulus process
  stim_proc: process
  begin    
    -- Reset the UUT
    reset <= '0';
    wait for 20 ns;
    reset <= '1';
    wait for 20 ns;

    -- Write to each port with corresponding address
    for i in 0 to 15 loop
      address <= std_logic_vector(to_unsigned(i, 8)) + x"E0";
      data_in <= std_logic_vector(to_unsigned(i * 10, 8));
      wr <= '1';
      wait for clk_period;
      wr <= '0';
      wait for clk_period;
    end loop;

    -- Stop simulation
    wait;
  end process;
end architecture;

