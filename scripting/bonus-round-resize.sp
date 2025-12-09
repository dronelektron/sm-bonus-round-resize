#include <sourcemod>

#include "bonus-round-events/api"
#include "player-resize/api"

#include "modules/console-variable.sp"

#define BASE_SCALE 1.0

public Plugin myinfo = {
    name = "Bonus round resize",
    author = "Dron-elektron",
    description = "Allows you to change the size of the players in the bonus round",
    version = "1.1.0",
    url = "https://github.com/dronelektron/sm-bonus-round-resize"
};

public void OnPluginStart() {
    Variable_Create();
    AutoExecConfig(_, "bonus-round-resize");
}

public void BonusRound_OnReset(int client) {
    Player_Resize(client, BASE_SCALE);
}

public void BonusRound_OnLoser(int client) {
    float scale = Variable_PlayerScale();

    Player_Resize(client, scale);
}

public void BonusRound_OnWinner(int client) {
    Player_Resize(client, BASE_SCALE);
}
