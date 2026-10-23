library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_flag is
    Port (
        ACC      : in  STD_LOGIC_VECTOR(7 downto 0);
        ZERO     : out STD_LOGIC
    );
end zero_flag;

architecture Behavioral of zero_flag is

begin

    process (ACC)
    begin
        if ACC = "00000000" then
            ZERO <= '1';
        else
		              ZERO <= '0';
        end if;
    end process;

end Behavioral;