library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity extender is
    Port ( i_data : in STD_LOGIC_VECTOR (22 downto 0);
           o_data : out STD_LOGIC_VECTOR (23 downto 0));
end extender;

architecture Behavioral of extender is

begin

o_data <= '1'&i_data;

end Behavioral;
