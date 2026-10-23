LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY program_rom_tb IS
END program_rom_tb;

ARCHITECTURE behavior OF program_rom_tb IS

    COMPONENT program_rom
    PORT(
        ADDRESS     : IN  std_logic_vector(3 downto 0);
        INSTRUCTION : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;

    -- Input
    SIGNAL ADDRESS : std_logic_vector(3 downto 0) := (others => '0');
	 -- Output
    SIGNAL INSTRUCTION : std_logic_vector(7 downto 0);

BEGIN

    -- Instantiate the Unit Under Test
    uut: program_rom PORT MAP (
        ADDRESS     => ADDRESS,
        INSTRUCTION => INSTRUCTION
    );

    -- Stimulus process
    stim_proc: PROCESS
    BEGIN

        ADDRESS <= "0000";
        WAIT FOR 100 ns;

        ADDRESS <= "0001";
        WAIT FOR 100 ns;
 ADDRESS <= "0010";
        WAIT FOR 100 ns;

        ADDRESS <= "0011";
        WAIT FOR 100 ns;

        ADDRESS <= "0100";
        WAIT FOR 100 ns;

        ADDRESS <= "0101";
        WAIT FOR 100 ns;

        ADDRESS <= "0110";
        WAIT FOR 100 ns;
		  ADDRESS <= "0111";
        WAIT FOR 100 ns;

        ADDRESS <= "1000";
        WAIT FOR 100 ns;

        ADDRESS <= "1001";
        WAIT FOR 100 ns;

        ADDRESS <= "1010";
        WAIT FOR 100 ns;

        ADDRESS <= "1011";
        WAIT FOR 100 ns;

        ADDRESS <= "1100";
        WAIT FOR 100 ns;
		  ADDRESS <= "1101";
        WAIT FOR 100 ns;

        ADDRESS <= "1110";
        WAIT FOR 100 ns;

        ADDRESS <= "1111";
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;

END behavior;
