library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port (
        OPCODE  : in  STD_LOGIC_VECTOR(2 downto 0);
        LOAD    : out STD_LOGIC;
        ADD     : out STD_LOGIC;
        SUB     : out STD_LOGIC;
        JZ      : out STD_LOGIC;
        SHL     : out STD_LOGIC;
        INVALID : out STD_LOGIC
    );
end control_unit;

architecture Structural of control_unit is

    component instruction_decoder
        Port (
            OPCODE  : in  STD_LOGIC_VECTOR(2 downto 0);
				LOAD    : out STD_LOGIC;
            ADD     : out STD_LOGIC;
            SUB     : out STD_LOGIC;
            JZ      : out STD_LOGIC;
            SHL     : out STD_LOGIC;
            INVALID : out STD_LOGIC
        );
    end component;

begin

    DECODER1: instruction_decoder
        port map (
            OPCODE  => OPCODE,
				LOAD    => LOAD,
            ADD     => ADD,
            SUB     => SUB,
            JZ      => JZ,
            SHL     => SHL,
            INVALID => INVALID
        );

end Structural;