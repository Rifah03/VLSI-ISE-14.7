library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end xor_gate;

architecture Structural of xor_gate is

    component NAND_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal N1 : STD_LOGIC;
    signal N2 : STD_LOGIC;
    signal N3 : STD_LOGIC;
begin

    NAND1: NAND_gate
        port map (
            A => A,
            B => B,
            Y => N1
        );

    NAND2: NAND_gate
        port map (
            A => A,
            B => N1,
            Y => N2
        );

    NAND3: NAND_gate
        port map (
            A => B,
            B => N1,
            Y => N3
        );

    NAND4: NAND_gate
        port map (
            A => N2,
            B => N3,
            Y => Y
        );

end Structural;