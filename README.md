![Banner](/.github/images/banner.png)

Automatic Mod Loader for Multi Theft Auto: San Andreas:

- Robust, optimized and minimalistic
- Scans folders for DFF, TXD and COL files (e.g. infernus.dff)
- Adds and removes file nodes from meta.xml automatically
- Downloads mod files and replaces models on the client

⭐ **Star the repository if you like the project!**

## Support/Help

MTA forum topic: [Link](https://forum.multitheftauto.com/topic/139643-rel-automatic-mod-loader/)

If you need help with anything related to this project, please read the corresponding section on the MTA forum thread linked above.

## Setup

Below is everything you need to know about how to install, use and customize the `mod_downloader` resource.

**Installation** is simple:

- Download the [latest release ZIP](https://github.com/Fernando-A-Rocha/mta-auto-modloader/releases/latest)
- Extract the `auto_modloader` folder to your MTA server's `resources` folder
- Use command `refresh` in your server console to load the resource added
- Use command `start` in your server console to start the resource for the first time

**Mod files have to be stored in a separate resource** so that they can be managed by `auto_modloader` and that resource's **meta.xml file can be updated** accordingly.

You can configure [all settings here](/auto_modloader/main/config_shared.lua), such as the mod resource name, the folders you want to scan.

In the initial startup, if the storage resource doesn't exist, it will be created automatically.

🚀 All you have to do is **drag & drop your mod files** into the folders you defined (by default `file_storage/mods`) and they will be automatically added to the meta.xml file.

⚠️ If you make changes to the mod files, use the scanning command (by default `amlscan`) to rescan the folders and apply the mods again. You can also just restart the resource.

## Model IDs & Names

This is an extensive list of all usable MTA:SA model IDs.

⚠️ Weapon IDs range from 1-46 and are not included here because they collide with Skin IDs. If you want to replace a weapon, use the weapon's object model ID. They are all [listed on this page](https://wiki.multitheftauto.com/wiki/Weapons).

- Vehicles: [MTA:SA Wiki](https://wiki.multitheftauto.com/wiki/Vehicle_IDs)
- Skins: [MTA:SA Wiki](https://wiki.multitheftauto.com/wiki/All_Skins_Page)
- Objects: [Prineside.com](https://dev.prineside.com/gtasa_samp_model_id) (ignore the SA-MP IDs)

⚠️ The model names are as follows (**always lowercase**):

- Vehicles: default DFF/TXD file names AND vehicle names in English from the IDs wiki page (e.g. "landstal.dff" or "fbi rancher.txd")
- Skins: model names listed in the IDs wiki page under each image (e.g. "truth.dff" or "truth.txd")
- Objects: DFF, TXD and COL file names (e.g. "vegasnbball1.dff" or "vgnbasktball.txd")

## NandoCrypt

You can use [NandoCrypt (GitHub repository)](https://github.com/Fernando-A-Rocha/mta-nandocrypt) to encrypt your mods. This system will automatically decrypt the mod files when loading them. Don't forget that the `nando_decrypter` client script must be running, and you need to define the correct `decryption function name` in the resource config file.

The default setup comes with a few encrypted mods and a ready to use `nando_decrypter` client script.

## IMG Containers

GTA:SA uses [IMG containers/archives](https://gtamods.com/wiki/IMG_archive) to store files such as DFF, TXD and COL. This resource comes with a built-in IMG parser which lets you extract all files from a container using a single command. See the resource config file for more information.

## Credits

Several mods are also included for testing purposes:

- Bank Robbers - [SlingShot753's Workshop](https://gtaforums.com/topic/917058-slingshot753s-workshop/)
- Sentinel Sport Rally Edition - [LibertyCity.net](https://libertycity.net/files/gta-san-andreas/157270-sentinel-sport-rally-edition-sre.html)

## Acknowledgements

Thank you [@Haxardous](https://github.com/Haxardous) for the inspiration and for helping with testing the resource.

## Related Projects

- [mta-mod-downloader](https://github.com/Fernando-A-Rocha/mta-mod-downloader#readme): mod downloader system with GUI which supports **NandoCrypt**
- [mta-add-models](https://github.com/Fernando-A-Rocha/mta-add-models#readme): a library for adding new models (vehicles, skins, etc) to your server which also supports **NandoCrypt**

## Final Note

Feel free to contribute to the project by improving the code & documentation via Pull Requests. Thank you!
