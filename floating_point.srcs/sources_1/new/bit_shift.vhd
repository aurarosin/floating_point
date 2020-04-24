library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity bit_shift is
    Port ( i_data : in STD_LOGIC_VECTOR (23 downto 0);
           n : in STD_LOGIC_VECTOR (7 downto 0);
           o_data : out STD_LOGIC_VECTOR (23 downto 0));
end bit_shift;

architecture Behavioral of bit_shift is

--variable tmp : std_logic_vector(15 downto 0);

begin
    
    o_data <= STD_LOGIC_VECTOR(unsigned (i_data) srl to_integer(unsigned(n)));


end Behavioral;
