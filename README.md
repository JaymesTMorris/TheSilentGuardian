# 👻 The Silent Guardian

**A supernatural tower defense game made for Rowan Game Jam Fall '24.**  
**Theme:** _“Unsung Heroes”_  
**Duration:** Nov 7 – Dec 5, 2024  
**Team:** 2 developers  
**Engine:** [Godot Engine](https://godotengine.org/)  
**Language:** GDScript  
**Platform:** PC (Windows/Linux)

---

## 🎮 Game Overview

In *The Silent Guardian*, you play as a **ghost**, silently protecting a quiet village from **unseen supernatural threats**. By night, you defend the villagers—who remain blissfully unaware of your presence—using haunted wards, totems, and ghostly tricks.

> ⚠️ *Note:* The **day cycle (exploration and ally recruitment)** will be introduced in **future updates** post-jam. The current version focuses on **night defense gameplay**.

You can’t directly interact with the living. Instead, you must use your spectral powers to *haunt objects, create distractions, and ward off evil spirits*—all while managing your **limited energy**.

---

## 🌀 Core Gameplay Loop

### 🌙 Night Cycle (Defense)
- **Objective:** Defend the village until sunrise
- Place **wards and totems** using **mana**
- Manage energy efficiently to survive escalating waves
- Defeat spirits to earn **doubloons**

<!-- Future feature -->
<!--
### ☀️ Day Cycle (Exploration)
*Coming soon in a future update!*
-->

---

## ⚙️ Key Mechanics

- **Warding Spirits:** Use placed defenses to defeat incoming enemies  
- **Energy Conservation:** Mana is limited each night—use wisely!  
- **Scaling Difficulty:** Nights grow longer and spirits stronger each cycle  

---

## 🌲 Setting

A secluded forest village plagued by nightly spirit invasions. The villagers never see you. But they survive because of you.

---

## 🧠 Game Systems (Tech Breakdown)

We use **Singleton Managers** and **Utility/Data Classes** for organized game architecture:

### 🗂️ Singletons

| System            | Purpose                                                 |
|-------------------|----------------------------------------------------------|
| `GameStateManager`| Tracks overall game state (nights, score, progress)      |
| `EnergyManager`   | Tracks player's energy & usage                           |
| `CurrencyManager` | Manages doubloons (currency)                             |
| `ScoreManager`    | Handles score and high score tracking                    |
| `AudioManager`    | Controls music and SFX                                   |
| `LevelManager`    | Controls difficulty scaling and night progression        |
| `SpawnManager`    | Spawns spirits and resources                             |
| `UIManager`       | Updates UI elements like health, energy, and alerts      |

### 🧰 Utility & Data Classes

- `Attack`: Defines attack types, damage, effects  
- `Projectile`: Represents moving attacks (like orbs)  
- `DefenseUnit`: Wards & totems used in night defense  

---

## 👻 Spirits

### Friendly Spirits *(coming with future day cycle update)*:
- 🐕 Dog  
- 🦉 Owl  
- 🦊 Fox  

### Enemy Spirits (night threats):
- 🍄 Mushroom  
- 🐻 Bear  
- 🐇 Bunny  
- 🦇 Bat  

### Other:
- 🛍️ Merchant Spirit: Planned for the day cycle *(future update)*

---

## 🎨 Assets & Art Credits

Sprites used from:
- [Kenney Platformer Art - Enemies](https://kenney.nl/assets/platformer-art-extended-enemies)
- [Kenney Tiny Town](https://kenney.nl/assets/tiny-town)
- [Kenney UI Pack - Adventure](https://kenney.nl/assets/ui-pack-adventure)
- [Kenmi Cute Fantasy RPG](https://kenmi-art.itch.io/cute-fantasy-rpg)
- [Pimen Magical Effects](https://pimen.itch.io/magical-animation-effects)

All assets are under permissive licenses suitable for game jam use.

---

## 🛠️ Tools & Tech

- **Engine:** Godot 3.5+  
- **Language:** GDScript  
- **Platform:** PC  
- **Graphics:** 2D Pixel Art  
- **Development Time:** 4 weeks  

---

## ✨ Future Plans (Post-Jam Ideas)

- Day cycle exploration & friendly spirits  
- Boss spirits  
- New wards/totems with elemental effects  
- Weather and environmental modifiers  
- Lore-rich endings based on performance  

---

## 💡 About the Team

Built by a two-person team for Rowan Game Jam Fall '24.  
Focused on showcasing the power of small, unseen acts of protection.  
Unsung, but never unimportant.

---

## 📥 Installation

1. Download the latest PC build from the itch.io page: [The Silent Guardian](https://sagaciouspangolin.itch.io/the-silent-guardian) *(or itch.io if you upload there)*  
2. Unzip the archive  
3. Run `TheSilentGuardian.exe`

---

**🕯️ Thank you for playing.**
