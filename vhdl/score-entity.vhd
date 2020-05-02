library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity score is
port(x_pos  : in std_logic_vector(11 downto 0);
     enable : in std_logic;
     reset  : in std_logic;
     clock  : in std_logic;
     user   : out std_logic_vector(7 downto 0);
     sys    : out std_logic_vector(7 downto 0);
     over   : out std_logic);
end entity score;