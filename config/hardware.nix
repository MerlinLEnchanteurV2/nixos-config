{...}:
{
	services.printing.enable = true;
	services.pulseaudio.enable = false;
	services.pipewire = {
		wireplumber.enable = true;
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	services.logind.lidSwitch = "ignore";
	
	services.blueman.enable = true;
	hardware.bluetooth.enable = true; # enables support for Bluetooth
	hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
}
