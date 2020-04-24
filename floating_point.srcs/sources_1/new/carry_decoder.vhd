library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;               -- Needed for shifts

entity carry_decoder is
    Port ( i_mantissa : in STD_LOGIC_VECTOR (23 downto 0);
           i_exponent : in STD_LOGIC_VECTOR (7 downto 0);
           carry : in STD_LOGIC;
           o_mantissa : out STD_LOGIC_VECTOR (22 downto 0);
           o_exponent : out STD_LOGIC_VECTOR (7 downto 0));
end carry_decoder;

architecture Behavioral of carry_decoder is

begin

    CARRY_PROC : PROCESS (i_mantissa, i_exponent, carry)
        variable mantissa: std_logic_vector(23 downto 0);
        variable exponent : std_logic_vector(7 downto 0);
    BEGIN
        IF carry = '1' THEN
            mantissa := std_logic_vector(unsigned(i_mantissa) srl 1);
            exponent := i_exponent + 1;
        ELSE
            mantissa := i_mantissa;
            exponent := i_exponent;
        END IF;
        
        o_mantissa <= mantissa(22 downto 0);
        o_exponent <= exponent;
    END PROCESS;

end Behavioral;
