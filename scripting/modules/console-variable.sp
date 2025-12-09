static ConVar g_playerScale;

void Variable_Create() {
    g_playerScale = CreateConVar("sm_bonusroundresize_player_scale", "0.5", "Player scale");
}

float Variable_PlayerScale() {
    return g_playerScale.FloatValue;
}
