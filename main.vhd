library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
  Port (CLK100MHZ, x: in std_logic; Q : out std_logic_vector(7 downto 0) );
end main;

architecture Behavioral of main is
    component custom_clk is
        port ( clk,reset: in std_logic; clock_out: out std_logic);
    end component;

    signal clk1Hz: std_logic;
    signal Q_calc: std_logic_vector(7 downto 0);
begin
    clk1: custom_clk PORT MAP (clk => CLK100MHZ, reset => '0', clock_out => clk1Hz);
    process(clk1Hz)
    begin
        if (rising_edge(clk1Hz)) then
            Q_calc <= x & Q_calc(7 downto 1);
            Q <= Q_calc;
        end if;
    end process;
end Behavioral;