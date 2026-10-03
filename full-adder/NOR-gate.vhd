library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOR_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end NOR_gate;

architecture Structural of NOR_gate is

    component NAND_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal N1 : STD_LOGIC;
    signal N2 : STD_LOGIC;
    signal N3 : STD_LOGIC;
	 
begin

    NAND1: NAND_gate
        port map(A => A, B => A, Y => N1);

    NAND2: NAND_gate
        port map(A => B, B => B, Y => N2);

    NAND3: NAND_gate
        port map(A => N1, B => N2, Y => N3);

    NAND4: NAND_gate
        port map(A => N3, B => N3, Y => Y);

end Structural;