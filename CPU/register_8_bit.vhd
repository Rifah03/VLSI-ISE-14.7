library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_8_bit is
    Port (
        D     : in  STD_LOGIC_VECTOR(7 downto 0);
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end register_8_bit;

architecture Structural of register_8_bit is

    component D_flip_flop
	         Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC
        );
    end component;

begin

    FF0: D_flip_flop port map (D => D(0), CLK => CLK, RESET => RESET, Q => Q(0));
    FF1: D_flip_flop port map (D => D(1), CLK => CLK, RESET => RESET, Q => Q(1));
    FF2: D_flip_flop port map (D => D(2), CLK => CLK, RESET => RESET, Q => Q(2));
	 FF3: D_flip_flop port map (D => D(3), CLK => CLK, RESET => RESET, Q => Q(3));
    FF4: D_flip_flop port map (D => D(4), CLK => CLK, RESET => RESET, Q => Q(4));
    FF5: D_flip_flop port map (D => D(5), CLK => CLK, RESET => RESET, Q => Q(5));
    FF6: D_flip_flop port map (D => D(6), CLK => CLK, RESET => RESET, Q => Q(6));
    FF7: D_flip_flop port map (D => D(7), CLK => CLK, RESET => RESET, Q => Q(7));

end Structural;