library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end OR_gate;

architecture Structural of OR_gate is

    component NAND_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
	 signal N1 : STD_LOGIC;
    signal N2 : STD_LOGIC;

begin

    -- First NAND: NOT A
    NAND1: NAND_gate
        port map (
            A => A,
            B => A,
            Y => N1
        );

    -- Second NAND: NOT B
    NAND2: NAND_gate
        port map (
            A => B,
            B => B,
            Y => N2
        );
 -- Third NAND: OR operation
    NAND3: NAND_gate
        port map (
            A => N1,
            B => N2,
            Y => Y
        );

end Structural;