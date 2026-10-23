library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_decoder is
    Port (
        OPCODE  : in  STD_LOGIC_VECTOR(2 downto 0);
        LOAD    : out STD_LOGIC;
        ADD     : out STD_LOGIC;
        SUB     : out STD_LOGIC;
        JZ      : out STD_LOGIC;
        SHL     : out STD_LOGIC;
        INVALID : out STD_LOGIC
    );
end instruction_decoder;

architecture Structural of instruction_decoder is

begin
    process (OPCODE)
    begin
        -- Default outputs
        LOAD    <= '0';
        ADD     <= '0';
        SUB     <= '0';
        JZ      <= '0';
        SHL     <= '0';
        INVALID <= '0';

        case OPCODE is

            -- 000: LDI (Load Immediate)
            when "000" =>
                LOAD <= '1';

            -- 001: ADD
            when "001" =>
                ADD <= '1';
					  -- 010: SUB
            when "010" =>
                SUB <= '1';

            -- 011: JZ (Jump if Zero)
            when "011" =>
                JZ <= '1';

            -- 100: SHL (Shift Left)
            when "100" =>
                SHL <= '1';

            -- 101, 110, 111: Invalid opcodes
            when others =>
                INVALID <= '1';

        end case;
    end process;

end Structural;