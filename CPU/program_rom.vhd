library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_rom is
    Port (
        ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
        INSTRUCTION : out STD_LOGIC_VECTOR(7 downto 0)
    );
end program_rom;

architecture Structural of program_rom is
begin

    process (ADDRESS)
    begin
        case ADDRESS is
            when "0000" =>
                INSTRUCTION <= "00000001"; -- LDI
					 when "0001" =>
                INSTRUCTION <= "00100010"; -- ADD
            when "0010" =>
                INSTRUCTION <= "01000011"; -- SUB
            when "0011" =>
                INSTRUCTION <= "01100100"; -- JZ
            when "0100" =>
                INSTRUCTION <= "10000101"; -- SHL
            when "0101" =>
                INSTRUCTION <= "00000111"; -- LDI
            when "0110" =>
                INSTRUCTION <= "00101000"; -- ADD
            when "0111" =>
				INSTRUCTION <= "01000010"; -- SUB
            when "1000" =>
                INSTRUCTION <= "00000101"; -- LDI
            when "1001" =>
                INSTRUCTION <= "00100011"; -- ADD
            when "1010" =>
                INSTRUCTION <= "01000001"; -- SUB
            when "1011" =>
                INSTRUCTION <= "10000001"; -- SHL
					  when "1100" =>
                INSTRUCTION <= "00000000"; -- LDI 0
            when "1101" =>
                INSTRUCTION <= "00100001"; -- ADD
            when "1110" =>
                INSTRUCTION <= "01000001"; -- SUB
            when "1111" =>
                INSTRUCTION <= "00000000"; -- LDI 0
					 when others =>
                INSTRUCTION <= "00000000";
        end case;
    end process;

end Structural;