#include <3ds.h>

int main() {
    gfxInitDefault();
    consoleInit(GFX_TOP, NULL);

    aptInit();
    aptSetSleepAllowed(false); // disables sleep

    printf("Sleep mode disabled.\n");
    printf("Press START to exit.");

    while (aptMainLoop()) {
        hidScanInput();
        if (hidKeysDown() & KEY_START) break;

        gspWaitForVBlank();
    }

    aptExit();
    gfxExit();
    return 0;
}
