# esx_npcnames

A lightweight FiveM script that allows you to add nametags above NPCs using a simple client-side export.

Perfect for immersive RP scenarios like shopkeepers, quest givers, or static NPCs with visible names.

---

## 🎥 Demo Video

Watch the script in action on YouTube:  
👉 [Click here to watch the video](https://youtu.be/tH9Pb0rBi6M)

---

## 🧠 Features

- 🏷️ Add nametags above any NPC (ped)
- ⚙️ Simple client-side export
- 🧩 ESX-compatible
- 💡 Minimal performance impact
- 🎨 Clean and customizable design

---

## 📌 Parameters
- `ped` - Entity | A valid ped handle (NPC entity)   |
- `name` - string | The name to display above the NPC |

## 🖼️ Preview
Here’s how the nametag looks in-game:
![Preview](https://bytefix.eu/imgs/meno.PNG)


## ⚙️ Usage

To add a nametag to any NPC (ped), use the following **client-side export**:

```lua 
exports['esx_npcnames']:addNametag(ped, "Name")
```
# 💡 Example
```lua
local ped = CreatePed(...) -- your own ped creation logic
exports['esx_npcnames']:addNametag(ped, "John the Shopkeeper")
```

# 📁 Installation
-Download or clone this repository into your `resources` folder.
-Add the resource to your `server.cfg`:
```cfg
ensure esx_npcnames
```

