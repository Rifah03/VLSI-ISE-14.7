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

    signal X : STD_LOGIC;
    signal Z : STD_LOGIC;
begin

    -- NOT A
    NAND1: NAND_gate
        port map (
            A => A,
            B => A,
            Y => X
        );

    -- NOT B
    NAND2: NAND_gate
        port map (
            A => B,
            B => B,
            Y => Z
        );

    -- OR = (NOT A) NAND (NOT B)
    NAND3: NAND_gate
        port map (
            A => X,
            B => Z,
            Y => Y
        );

end Structural;