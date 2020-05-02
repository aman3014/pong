library ieee;
use ieee.std_logic_1164.all;

entity collision is
port(x_dir   : in std_logic;
     y_dir   : in std_logic;
     x_pos   : in std_logic_vector(11 downto 0);
     y_pos   : in std_logic_vector(8 downto 0);
     bat     : in std_logic_vector(8 downto 0);
     change  : out std_logic);
end entity collision;