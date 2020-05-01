-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY TB IS
    -- empty
    GENERIC(
        WORD_LENGTH : NATURAL := 32;
        MEM_PROG_SIZE : NATURAL := 1024;
        MEM_PROG_DIR_LENGTH : NATURAL := 10; -- log(MEM_PROG_SIZE)
        MEM_DATA_SIZE : NATURAL := 1024;
        MEM_DATA_DIR_LENGTH : NATURAL := 10; -- log(MEM_DATA_SIZE)
        REG_SIZE : NATURAL := 32;
        REG_DIR_LENGTH : NATURAL := 5;  -- log2(REG_SIZE)
        INSTRUCTION_LENGTH : NATURAL := 32;
        ALU_OPE_LENGTH : NATURAL := 3
    );
END TB;

ARCHITECTURE BEV OF TB IS
    -- Procedure for clock generation
    procedure clk_gen(signal clk : out std_logic; constant FREQ : real) is
      constant PERIOD    : time := 1 sec / FREQ;        -- Full period
      constant HIGH_TIME : time := PERIOD / 2;          -- High time
      constant LOW_TIME  : time := PERIOD - HIGH_TIME;  -- Low time; always >= HIGH_TIME
    begin
      -- Check the arguments
      assert (HIGH_TIME /= 0 fs) report "clk_plain: High time is zero; time resolution to large for frequency" severity FAILURE;
      -- Generate a clock cycle
      --for i in 0 to 99 loop
      loop
        clk <= '1';
        wait for HIGH_TIME;
        clk <= '0';
        wait for LOW_TIME;
      end loop;
    end procedure;

	-- COMPONENT
    component datapath is
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
               B : in STD_LOGIC_VECTOR (31 downto 0);
               Ope : in STD_LOGIC_VECTOR (1 downto 0);
               Result : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    -- SIGNALS
    SIGNAL A,B : STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL OPE : STD_LOGIC_VECTOR (1 downto 0);
    SIGNAL Result :  STD_LOGIC_VECTOR (31 downto 0);
BEGIN

	--clk_gen(CLK, 1.0E9);  -- Frecuencia: 1GHz

    floating_point_l : datapath PORT MAP(A,B,OPE,Result);

    PROCESS
    BEGIN
    	A <= "0" & "10000010" & "11100000000000000000000";  -- 15  01000001011100000000000000000000
    	B <= "0" & "10000001" & "11000000000000000000000";  -- 7  01000000111000000000000000000000
    	OPE <= "00";
    	--assert(O_DATA=x"00000001") report "Fail test 1" severity error;
        WAIT FOR 1 ns;
        
        A <= "0" & "10000011" & "01011000000000000000000";  -- 21.5
    	B <= "0" & "10000001" & "11000000000000000000000";  -- 7
    	OPE <= "00";
        WAIT FOR 1 ns;
        
        A <= "0" & "10000010" & "00101110011001100110011";  -- 9.45
        B <= "0" & "10000011" & "00101011100001010001111";  -- 18.72
    	OPE <= "00";
        WAIT FOR 1 ns;
        
        A <= "0" & "10000001" & "11000000000000000000000";  -- 7
        B <= "0" & "10000000" & "10000000000000000000000";  -- 3
        OPE <= "01";
        WAIT FOR 1 ns;
        
        A <= "0" & "10000011" & "00100000000000000000000";  -- 18
        B <= "0" & "10000010" & "00100000000000000000000";  -- 9
        OPE <= "10";
        WAIT FOR 1 ns;
        
        A <= "0" & "10000011" & "00101011100001010001111";  -- 18.72
        B <= "0" & "10000010" & "00101110011001100110011";  -- 9.45
        OPE <= "01";
        WAIT FOR 1 ns;
        
        A <= "0" & "10000101" & "10010000000000000000000";  -- 100.0
        B <= "0" & "01111101" & "10000000000000000000000";  -- 0.375
        OPE <= "00";
        
        A <= "0" & "10000101" & "10010000000000000000000";  -- 100.0
        B <= "0" & "01111101" & "10000000000000000000000";  -- 0.375
        OPE <= "10";
        WAIT FOR 1 ns;
        
        A <= "0" & "10000100" & "00101011110101110000101";  -- 37.48
        B <= "0" & "10000111" & "01110011000111111001101";  -- 371.12345
        OPE <= "10";
        WAIT FOR 1 ns;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        WAIT;
    END PROCESS;

END BEV;