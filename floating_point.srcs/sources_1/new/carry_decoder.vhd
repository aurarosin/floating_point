----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2020 23:03:48
-- Design Name: 
-- Module Name: carry_decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity carry_decoder is
    Port ( mantissa : in STD_LOGIC_VECTOR (23 downto 0);
           exponent : in STD_LOGIC_VECTOR (7 downto 0);
           carry : in STD_LOGIC;
           o_mantissa : out STD_LOGIC_VECTOR (22 downto 0);
           o_exponent : out STD_LOGIC_VECTOR (7 downto 0));
end carry_decoder;

architecture Behavioral of carry_decoder is

begin


end Behavioral;