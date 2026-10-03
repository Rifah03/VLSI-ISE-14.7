library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end XOR_gate;

architecture Structural of XOR_gate is

    component NAND_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal X1 : STD_LOGIC;
    signal X2 : STD_LOGIC;
    signal X3 : STD_LOGIC;

begin

    -- First NAND
	     NAND1: NAND_gate
        port map (
            A => A,
            B => B,
            Y => X1
        );

    -- Second NAND
    NAND2: NAND_gate
        port map (
            A => A,
            B => X1,
            Y => X2
        );
    -- Third NAND
    NAND3: NAND_gate
        port map (
            A => B,
            B => X1,
            Y => X3
        );

    -- Fourth NAND
    NAND4: NAND_gate
        port map (
            A => X2,
            B => X3,
            Y => Y
        );

end Structural;