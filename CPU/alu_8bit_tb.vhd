LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY alu_8bit_tb IS
END alu_8bit_tb;

ARCHITECTURE behavior OF alu_8bit_tb IS

    COMPONENT alu_8bit
    PORT(
        A      : IN  std_logic_vector(7 downto 0);
        B      : IN  std_logic_vector(7 downto 0);
        SEL    : IN  std_logic_vector(1 downto 0);
        RESULT : OUT std_logic_vector(7 downto 0);
        COUT   : OUT std_logic
    );
    END COMPONENT;
	     SIGNAL A      : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL B      : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL SEL    : std_logic_vector(1 downto 0) := (others => '0');
    SIGNAL RESULT : std_logic_vector(7 downto 0);
    SIGNAL COUT   : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: alu_8bit PORT MAP (
        A      => A,
        B      => B,
        SEL    => SEL,
        RESULT => RESULT,
        COUT   => COUT
    );
	     -- Stimulus process
    stim_proc: PROCESS
    BEGIN

        -- Test 1: Addition, 5 + 3 = 8
        A <= "00000101";
        B <= "00000011";
        SEL <= "00";
        WAIT FOR 100 ns;

        -- Test 2: Addition with carry, 255 + 1 = 256
        A <= "11111111";
        B <= "00000001";
        SEL <= "00";
        WAIT FOR 100 ns;
		          -- Test 3: NAND operation
        -- 11110000 NAND 00001111 = 11111111
        A <= "11110000";
        B <= "00001111";
        SEL <= "01";
        WAIT FOR 100 ns;

        -- Test 4: NAND operation
        -- 11111111 NAND 11111111 = 00000000
        A <= "11111111";
        B <= "11111111";
        SEL <= "01";
        WAIT FOR 100 ns;
        -- Test 5: NOT operation
        -- NOT 10101010 = 01010101
        A <= "10101010";
        B <= "00000000";
        SEL <= "10";
        WAIT FOR 100 ns;

        -- Test 6: NOT operation
        -- NOT 00000000 = 11111111
        A <= "00000000";
        B <= "00000000";
        SEL <= "10";
        WAIT FOR 100 ns;

        -- Test 7: SEL = 11, default output
        A <= "11111111";
        B <= "00000001";
        SEL <= "11";
        WAIT FOR 100 ns;
		  
        WAIT;
    END PROCESS;

END behavior;