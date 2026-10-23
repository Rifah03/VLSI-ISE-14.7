library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_counter_4_bit is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        PC    : out STD_LOGIC_VECTOR(3 downto 0)
    );
end program_counter_4_bit;

architecture Behavioral of program_counter_4_bit is

    signal count : UNSIGNED(3 downto 0) := (others => '0');

begin

    process (CLK, RESET)
    begin
	         if RESET = '1' then
            count <= (others => '0');
        elsif rising_edge(CLK) then
            count <= count + 1;
        end if;
    end process;

    PC <= STD_LOGIC_VECTOR(count);

end Behavioral;