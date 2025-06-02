% Rockstar Games
videojuego(root, rockstar_games).
videojuego(rockstar_games, grand_theft_auto).
videojuego(grand_theft_auto, gta_iii).
videojuego(gta_iii, claude).
videojuego(gta_iii, donald_love).
videojuego(grand_theft_auto, vice_city).
videojuego(vice_city, tommy_vercetti).
videojuego(vice_city, lance_vance).
videojuego(grand_theft_auto, san_andreas).
videojuego(san_andreas, cj).
videojuego(san_andreas, big_smoke).
videojuego(san_andreas, ryder).
videojuego(grand_theft_auto, gta_iv).
videojuego(gta_iv, nikko_bellic).
videojuego(gta_iv, roman_bellic).
videojuego(grand_theft_auto, gta_v).
videojuego(gta_v, michael).
videojuego(gta_v, franklin).
videojuego(gta_v, trevor).
videojuego(rockstar_games, red_dead_redemption).
videojuego(red_dead_redemption, rdr1).
videojuego(rdr1, john_marston).
videojuego(rdr1, dutch_van_der_linde).
videojuego(red_dead_redemption, rdr2).
videojuego(rdr2, arthur_morgan).
videojuego(rdr2, sadie_adler).
videojuego(rdr2, micah_bell).

% Valve
videojuego(root, valve).
videojuego(valve, half_life).
videojuego(half_life, half_life_1).
videojuego(half_life_1, gordon_freeman).
videojuego(half_life_1, g_man).
videojuego(half_life, half_life_2).
videojuego(half_life_2, gordon_freeman).
videojuego(half_life_2, alyx_vance).
videojuego(half_life_2, eli_vance).
videojuego(half_life, half_life_alyx).
videojuego(half_life_alyx, alyx_vance).
videojuego(half_life_alyx, russell).
videojuego(valve, portal).
videojuego(portal, portal_1).
videojuego(portal_1, chell).
videojuego(portal_1, glados).
videojuego(portal, portal_2).
videojuego(portal_2, chell).
videojuego(portal_2, glados).
videojuego(portal_2, wheatley).
videojuego(valve, counter_strike).
videojuego(counter_strike, cs_16).
videojuego(cs_16, terrorist).
videojuego(cs_16, counter_terrorist).
videojuego(counter_strike, cs_go).
videojuego(cs_go, phoenix).
videojuego(cs_go, seal_team).
videojuego(counter_strike, cs2).
videojuego(cs2, new_terrorist).
videojuego(cs2, new_ct).
videojuego(valve, left_4_dead).
videojuego(left_4_dead, left_4_dead_1).
videojuego(left_4_dead_1, bill).
videojuego(left_4_dead_1, zoey).
videojuego(left_4_dead_1, louis).
videojuego(left_4_dead_1, francis).
videojuego(left_4_dead, left_4_dead_2).
videojuego(left_4_dead_2, coach).
videojuego(left_4_dead_2, rochelle).
videojuego(left_4_dead_2, ellis).
videojuego(left_4_dead_2, nick).

% Nintendo
videojuego(root, nintendo).
videojuego(nintendo, super_mario).
videojuego(super_mario, super_mario_64).
videojuego(super_mario_64, mario).
videojuego(super_mario_64, bowser).
videojuego(super_mario_64, peach).
videojuego(super_mario, super_mario_odyssey).
videojuego(super_mario_odyssey, mario).
videojuego(super_mario_odyssey, cappy).
videojuego(super_mario_odyssey, bowser).
videojuego(nintendo, the_legend_of_zelda).
videojuego(the_legend_of_zelda, ocarina_of_time).
videojuego(ocarina_of_time, link).
videojuego(ocarina_of_time, zelda).
videojuego(ocarina_of_time, ganondorf).
videojuego(the_legend_of_zelda, breath_of_the_wild).
videojuego(breath_of_the_wild, link).
videojuego(breath_of_the_wild, zelda).
videojuego(breath_of_the_wild, revali).
videojuego(breath_of_the_wild, urbosa).
videojuego(nintendo, metroid).
videojuego(metroid, super_metroid).
videojuego(super_metroid, samus_aran).
videojuego(super_metroid, ridley).
videojuego(super_metroid, mother_brain).
videojuego(metroid, metroid_prime).
videojuego(metroid_prime, samus_aran).
videojuego(metroid_prime, metroid_prime).
videojuego(metroid_prime, space_pirates).
videojuego(metroid, metroid_dread).
videojuego(metroid_dread, samus_aran).
videojuego(metroid_dread, raven_beak).
videojuego(metroid_dread, emmi).

adivina :-
    adivina_videojuego(root).

% Recorre todos los hijos de un nodo
adivina_videojuego(Nodo) :-
    findall(Hijo, videojuego(Nodo, Hijo), Hijos),
    Hijos \= [],
    !,
    preguntar_hijos(Hijos).

% Si no tiene hijos es un personaje 
adivina_videojuego(Personaje) :-
    write("¿Es tu personaje "), write(Personaje), write("? (si/no)"), nl,
    read1(Respuesta),
    ( Respuesta = si ->
        write("Personaje encontrado: "), write(Personaje), write("!"), nl
    ;   fail
    ).

% Pregunta por cada hijo, pero solo si ese hijo tiene hijos
preguntar_hijos([Hijo | Resto]) :-
    ( videojuego(Hijo, _) ->
        write("Tu personaje se encuentra en "), write(Hijo), write("? (si/no)"), nl,
        read1(Respuesta),
        ( Respuesta = si ->
            adivina_videojuego(Hijo)
        ;   preguntar_hijos(Resto)
        )
    ;   adivina_videojuego(Hijo) 
    ).
preguntar_hijos([]).

read1(Atom) :-
    read_string(current_input, "\n", "\r", _, String),
    normalize_space(atom(Atom), String).