library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator_8bit is
    Port (
        CLK     : in  STD_LOGIC;
        RESET   : in  STD_LOGIC;
        DATA_IN : in  STD_LOGIC_VECTOR(7 downto 0);
        LOAD    : in  STD_LOGIC;
        ACC_OUT : out STD_LOGIC_VECTOR(7 downto 0)
    );
end accumulator_8bit;

architecture Structural of accumulator_8bit is

    component register_8_bit
        Port (
            D     : in  STD_LOGIC_VECTOR(7 downto 0);
				CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal REG_INPUT : STD_LOGIC_VECTOR(7 downto 0);
    signal REG_OUTPUT : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Input selection logic
    process (DATA_IN, REG_OUTPUT, LOAD)
    begin
        if LOAD = '1' then
            REG_INPUT <= DATA_IN;
				else
            REG_INPUT <= REG_OUTPUT;
        end if;
    end process;

    -- 8-bit register
    REG1: register_8_bit
        port map (
            D     => REG_INPUT,
            CLK   => CLK,
            RESET => RESET,
            Q     => REG_OUTPUT
        );

    -- Accumulator output
    ACC_OUT <= REG_OUTPUT;

end Structural;