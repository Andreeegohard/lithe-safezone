
```markdown
# FiveM Safe Zone Script

This is a standalone FiveM script that creates a configurable safe zone with features such as god mode, no weapons allowed, and notifications when entering and exiting the safe zone.

## Features
- Configurable radius for the safe zone
- Optional map blip for the safe zone
- God mode within the safe zone
- Weapons disabled within the safe zone with notifications
- "SAFEZONE" text displayed on the screen when inside the safe zone

## Installation

1. **Download the Script**
   - Clone the repository or download the ZIP file and extract it.

   ```sh
   git clone [https://github.com/yourusername/fivem-safezone.git](https://github.com/Andreeegohard/lithe-safezone/)
   ```

2. **Place in Resources Folder**
   - Move the `my_safezone` folder into your FiveM server's `resources` directory.

3. **Configure the Script**
   - Open `config.lua` inside the `my_safezone` folder.
   - Edit the configuration to set the radius, coordinates, and blip settings for your safe zone.

   ```lua
   safezoneConfig = {
       radius = 100.0, -- Safe zone radius
       coords = vector3(200.0, -900.0, 30.0), -- Safe zone center coordinates
       blipEnabled = true -- Enable or disable the map blip
   }
   ```

4. **Add to Server Configuration**
   - Add the following line to your server's `server.cfg` to ensure the resource starts with the server.

   ```cfg
   start my_safezone
   ```

## Usage

Once the server is started, the safe zone will be active at the configured location with the specified radius. Players will experience god mode within the safe zone, and attempting to use weapons will be disabled with an on-screen notification.

## Contributing

If you want to contribute to this project, please fork the repository and create a pull request with your changes. All contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```
