#include <sourcemod>

#include "bonus-round-events/api"
#include "player-resize/api"

#include "modules/console-variable.sp"

#define AUTO_CREATE_YES true

public Plugin myinfo = {
    name = "Bonus round resize",
    author = "Dron-elektron",
    description = "Allows you to resize players at the end of the round",
    version = "1.0.2",
    url = "https://github.com/dronelektron/bonus-round-resize"
};

public void OnPluginStart() {
    Variable_Create();
    AutoExecConfig(AUTO_CREATE_YES, "bonus-round-resize");
}

public void BonusRound_OnLoser(int client) {
    if (Variable_PluginEnabled()) {
        float scale = Variable_PlayerScale();

        Player_Resize(client, scale);
    }
}

public void BonusRound_OnWinner(int client) {
    if (Variable_PluginEnabled()) {
        Player_Resize(client, 1.0);
    }
}
