library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_gate is
    Port (
        A : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end NOT_gate;

architecture Structural of NOT_gate is

    component NAND_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
	 begin

    NAND1: NAND_gate
        port map (
            A => A,
            B => A,
            Y => Y
        );

end Structural;