package net.copper;

import net.copper.api.ModInitializer;

public class Test implements ModInitializer {

    @Override
    public void onInitialize() {
        System.out.println("Test mod loaded by Copper!");
    }
}