library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is

end test;

architecture Behavioral of test is
    component main is
        Port (CLK100MHZ, x: in std_logic; Q : out std_logic_vector(7 downto 0) );
    end component;

    signal clk_sim: std_logic := '0';
    signal inp_sim: std_logic := '0';
    signal q_sim: std_logic_vector(7 downto 0) := "00000000";
begin
    shift_reg: main PORT MAP (CLK100MHZ => clk_sim, x => inp_sim, Q => q_sim);
    process
    begin
        inp_sim <= '1';
        for i in 1 to 16 loop
            clk_sim <= '1'; wait for 10ps; clk_sim <= '0'; wait for 10ps;
        end loop;
        inp_sim <= '0';
        for i in 1 to 16 loop
            clk_sim <= '1'; wait for 10ps; clk_sim <= '0'; wait for 10ps;
        end loop;
        for i in 1 to 8 loop
            clk_sim <= '1'; wait for 10ps; clk_sim <= '0'; wait for 10ps;
            clk_sim <= '1'; wait for 10ps; clk_sim <= '0'; wait for 10ps;
            inp_sim <= not inp_sim;
        end loop;
    end process;
end Behavioral;