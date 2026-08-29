package net.copper;

import net.copper.api.ClientModInitializer;
import net.minecraft.client.Minecraft;
import net.minecraft.client.gui.GuiGraphicsExtractor;
import net.minecraft.client.gui.screens.TitleScreen;

public class CopperClient implements ClientModInitializer {

    public static final String VERSION = "26.2.0";

    @Override
    public void onInitializeClient() {
        System.out.println("Copper " + VERSION + " initialized!");
    }

    public static void renderCopperVersion(GuiGraphicsExtractor graphics) {
        Minecraft minecraft = Minecraft.getInstance();

        if (minecraft.screen instanceof TitleScreen) {
            graphics.text(
                    minecraft.font,
                    "Copper " + VERSION,
                    5,
                    minecraft.getWindow().getGuiScaledHeight() - 15,
                    0xFFFFFF
            );
        }
    }
}