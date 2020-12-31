typedef struct player_info_s {
    int userid;
    char userinfo[256];
    char name[32];
    int spectator;
    int ping;
    int packet_loss;
    char model[64];
    int topcolor;
    int bottomcolor;
    int renderframe;
    int gaitsequence;
    float gaitframe;
    float gaityaw;
    vec3_t prevgaitorigin;
    customization_t customdata;
    char hashedcdkey[16];
    uint64 m_nSteamID;
} player_info_t;