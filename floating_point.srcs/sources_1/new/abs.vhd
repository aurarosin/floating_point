library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity absol is
generic(
 size : integer := 32
);
  
  Port ( 
   i_data : in STD_LOGIC_VECTOR(size-1 downto 0);
   o_data : out STD_LOGIC_VECTOR(size-1 downto 0)
   
  );
end absol;

architecture Behavioral of absol is

begin

o_data <= std_logic_vector(abs(signed(i_data)));

end Behavioral;
