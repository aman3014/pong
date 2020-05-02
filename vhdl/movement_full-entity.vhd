library ieee;
use ieee.std_logic_1164.all;

entity movement_full is
generic(WIDTH : natural;
        INIT  : std_logic_vector);
port(ext_change : in std_logic;
     enable     : in std_logic;
     reset      : in std_logic;
     clock      : in std_logic;
     pos        : out std_logic_vector(WIDTH - 1 downto 0);
     dir_o      : out std_logic);
end entity movement_full;