LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Shameem_Azwad_majority IS
PORT ( x1, x2, x3 : IN STD_LOGIC;
f : OUT STD_LOGIC);
END Shameem_Azwad_majority;

ARCHITECTURE Behaviour OF Shameem_Azwad_majority IS
BEGIN
f <= (x1 AND x2) OR (x1 AND x3) OR (x2 AND x3);
END Behaviour;
