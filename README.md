# Text Adventure

## Demons

### Demon Statistics

| Name            | Description                                                                                   |
|---------------- | --------------------------------------------------------------------------------------------- |
| ID              | A unique number assigned to a demon species.                                                  |
| Name            | A unique name given to demon species.                                                         |
| Description     | Flavour text surrounding the demon species.                                                   |
| Height          | The height of the demon in feet and inches (*2'04''*).                                        |
| Weight          | The weight of the demon in lbs (*15.2 lbs*).                                                  |
| XP              | The amount of e**xp**erience gained through battle which determines the demons overall level. |
| HP              | **H**it **P**oints determine how much damage a demon can receive before entering [Deaths Door.](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-deaths-door-state) |
| Attack          | Attack determines how much damage a demon deals when using a physical move.                   |
| Defence         | Defence determines how much damage a demon receives when hit with a physical move.            |
| Special Attack  | Special attack determines how much damage a demon deals when using a special move.            |
| Special Defence | Special defence determines how much damage a demon receives when hit with a special move.     |
| Speed           | Speed determines which demon may act first in battle.                                         |

> **Determination of stats:** Each demon species have predetermined **base stats**: HP, Attack, Defence, Special Attack, Special Defence, Speed and XP Yield. These determine what the stat should be set at for a given demons level. XP Yield is the amount of XP yielded from defeating that demon species in [combat](). Base stats range from 1 to 255.

### Demon Types

A demon will belong to at least one of these types. Some demons may have two types.

| Name        | Description |
|------------ | ----------- |
| Beast       | Beast demons focus on applying bleeds and cripples as a *tank / bruiser* class. They have high HP and Attack but low Magic and defence. Their Physical attacks increases Attack.  |
| Blood       | Blood demons focus on applying bleeds and healing as a *support* class. They have high magic damage and are immune to bleed effects. They receive a small heal when an enemy bleeds. |
| Bone        | Bone demons focus on generating physical shields and act as a *tank / buff* class along with their high physical defence. They are immune to bleed effects. (Possible: zombie status)  |
| Disease     | Disease demons spread plague among the team and act as a *controller / annoyer* class. They are immune to plagues. |
| Dragon      | Dragon demons vary and may take on the role of a support / specialist. They have great defence, can apply burns, heal the team and alter time itself. They are also immune to plagues.   |
| Flame       | Flame demons focus on high magic damage and applying burns as a *mage / nuke* class. Their flame weakens as time goes by which reduces magic attack. |
| Frost       | Frost demons focus on chilling the opposition, lowering both speed and defence as a *mage / CC* class. They are immune to chill effects. |
| Wraith      | Wraith demons focus on spreading fear and curses as an *assassin* class. The communicate with the spirit world and can cause instant death. They are immune to curses. |
| Insect      | Insect demons focus on quickly spreading plagues as a *controller* class. They get two attacks per turn due to their speed but have a weak attack. |

#### Demon Types Matrix

An attack / defence type matrix table, where 2 signifies super effective while 0 signifies no effect.  

```
    A/D       | Beast | Blood | Bone | Disease | Dragon | Flame | Frost | Wraith | Insect |
 -------------|-------|-------|------|---------|--------|-------|-------|--------|--------|
    Beast     |       |       |      |   0.5   |        |       |       |  0.5   |        |
 -------------|-------|-------|------|---------|--------|-------|-------|--------|--------|
    Blood     |   2   |  0.5  |   0  |   0.5   |        |  0.5  |  0.5  |        |    2   |
 -------------|-------|-------|------|---------|--------|-------|-------|--------|--------|
    Bone      |       |       |  0.5 |   0.5   |        |   2   |       |        |        |
 -------------|-------|-------|------|---------|--------|-------|-------|--------|--------|
    Disease   |   2   |   2   |   2  |    0    |    0   |  0.5  |       |        |   0.5  |
 -------------|-------|-------|------|---------|--------|-------|-------|--------|--------|
    Dragon    |       |       |      |         |    2   |       |       |   2    |        |
 -------------|-------|-------|------|---------|--------|-------|-------|--------|--------|
    Flame     |       |   2   |  0.5 |    2    |   0.5  |  0.5  |   2   |        |    2   |
 -------------|-------|-------|------|---------|--------|-------|-------|--------|--------|
    Frost     |       |       |   2  |         |    2   |  0.5  |  0.5  |        |        |
 -------------|-------|-------|------|---------|--------|-------|-------|--------|--------|
    Wraith    |   2   |       |      |         |        |       |       |   0    |        |
 -------------|-------|-------|------|---------|--------|-------|-------|--------|--------|
    Insect    |       |       |      |    2    |        |  0.5  |       |        |   0.5  |
```

### Moves

A demons overall moveset is a combination of their type movesets. For example, a Flame / Dragon demon has a moveset made up of the Flame and Dragon movesets below. 

* A demon may have *four* active moves.
* A demons active moves may be changed in [Lynchwood]() at the [Crypt]().
* Cost refers to the number of combat turns required for the move to come off cooldown.

#### Beast Moves

| Name              | Description                                                                           | Cost | Power | Status Effect | Type     |
| ----------------- | ------------------------------------------------------------------------------------- | ---- | ----- | ------------- | -------- |
| **Offensive**     |                                                                                       |      |       |               |          |
| Bite              | Small damage to enemy. Heals for 5% max hp.                                           | 1    |       | Heal          | Physical |
| Mutilate          | Medium damage to enemy. Reduces healing effectiveness of enemy by 25% for 3 turns.    | 2    |       | Debuff        | Physical |
| Frenzy            | Huge damage to enemy if enemies HP is less than 30%.                                  | 3    |       |               | Physical |
| **Defensive**     |                                                                                       |      |       |               |          |
| Demoralising Howl | Greatly reduces enemy physical defence for 3 turns.                                   | 1    |       | Debuff        | Physical |
| Vengeful Bite     | Deal double damage from last attack or 0 if moved first or last move did 0 damage.    | 2    |       |               | Physical |
| Last Stand        | Increase max HP by 30% for 3 turns. HP is lost when effect is cancelled.              | 3    |       | Heal          | Physical |
| **Utility**       |                                                                                       |      |       |               |          |
| Cannibalise       | Small damage to enemy. Heals for 50% of damage done then 5% every turn for 3 turns.   | 1    |       | Heal          | Physical |
| Intimidating Howl | Cause fear to the target making them unable to move for 1 turn.                       | 2    |       | Debuff        | Physical |
| Lick Wounds       | Takes two turns. Heals 30% of max HP per turn.                                        | 3    |       | Heal          | Physical |

#### Blood Moves

| Name          | Description                                                                                  | Cost  | Power | Status Effect | Type     |
| ------------- |--------------------------------------------------------------------------------------------- | ----- | ----- | ------------- | -------- |
| **Offensive** |                                                                                              |       |       |               |          |
| Siphon Blood  | Small blood damage to enemy. Small cooldown. Medium self heal.                               | 1     |       | Heal          | Magic    |
| Hemorrhage    | Medium blood damage to enemy. Medium cooldown. Inflicts weak bleed.                          | 2     |       | Bleed         | Physical |
| Open Vein     | Large blood damage to enemy. Big cooldown. Inflicts strong bleed.                            | 3     |       | Bleed         | Physical |
| **Defensive** |                                                                                              |       |       |               |          |
| Cold Blooded  | Grant immunity to chill effects for X turns.                                                 | 1     |       | Immunity      | Magic    |
| Transfusion   | Small blood damage to enemy. Medium cooldown. Removes all diseases to self. Small self heal. | 2     |       | Cleanse       | Physical |
| Blood Moon    | Double effect of blood heals for 3 turns.                                                    | 3     |       | Buff          | Magic    |
| **Utility**   |                                                                                              |       |       |               |          |
| Haemophilia   | Increases existing bleeds to maximum stacks and cannot be stopped.                           | 1     |       | Debuff        | Magic    |
| Blood Link    | As HP lowers, restore linked allys HP. Can be used to revive.                                | 2     |       | Heal          | Magic    |
| Blood Lust    | Greatly increase magic attack to full stack and reduces cooldowns by 1 for one turn.         | 3     |       | Buff          | Magic    |

#### Bone Moves

| Name          | Description                                                                         | Cost | Power | Status Effect | Type     |
| ------------- | ----------------------------------------------------------------------------------- | ---- | ----- | ------------- | -------- |
| **Offensive** |                                                                                     |      |       |               |          |
| Shatter       | Medium bone damage.                                                                 | 1    |       |               | Physical |
| Bone Spikes   | Small bone damage every turn. Stays in field. Affects switched in demons.           | 2    |       | Spike         | Physical |
| Dislocation   | High bone damage, inflicts cripple greatly reducing enemy speed.                    | 3    |       | Cripple       | Physical |
| **Defensive** |                                                                                     |      |       |               |          |
| Bone Prison   | Complete immunity to damage for X turns but cannot attack. Persists on ally switch. | 1    |       | Immunity      | Physical |
| Brittle Bones | Greatly reduces enemy physical defence.                                             | 2    |       | Debuff        | Magic    |
| Bone Armour   | Surrounds ally with 3 bones. Physical attacks absorb one bone.                      | 3    |       | Immunity      | Magic    |
| **Utility**   |                                                                                     |      |       |               |          |
| Deflection    | For one turn, physical attacks backfire to enemy.                                   | 1    |       | Immunity      | Physical |
| Soul Link     | Links soul with enemy for X turns. Enemy dies if self dies.                         | 2    |       | Debuff        | Magic    |
| Hex           | Turns enemy to undead for X turns. Heals / revives now damage enemy                 | 3    |       | Debuff        | Magic    |

#### Disease Moves

#### Dragon Moves

| Name              | Description                                                                              | Cost | Power | Status Effect | Type     |
| ----------------- | ---------------------------------------------------------------------------------------- | ---- | ----- | ------------- | -------- |
| **Offensive**     |                                                                                          |      |       |               |          |
| Starshards        | Small arcane damage for X turns. Stackable. Lowers targets speed.                        | 1    |       | Debuff        | Magic    |
| Solar Breath      | Medium fire damage. Damage doubled against burning target.                               | 2    |       |               | Magic    |
| Celestial Comet   | Medium arcane damage. Inflicts burn. Heal all party for 5% of damage.                    | 3    |       | Burn / Heal   | Magic    |
| **Defensive**     |                                                                                          |      |       |               |          |
| Phase Shift       | First turn. Switch with next demon in party. Heal active demon for 10% of max HP.        | 1    |       | Heal          | Magic    |
| Nature’s Gift     | Heal active demon for 20% of max HP after 3 turns.                                       | 2    |       | Heal          | Magic    |
| Borrowed Time     | Delay all healing and damage taken for 2 turns. Delayed healing is doubled.              | 3    |       | Immunity      | Magic    |
| **Utility**       |                                                                                          |      |       |               |          |
| Tranquility       | Resets stat changes back to default for all demons in play.                              | 1    |       | Debuff        | Magic    |
| Gift of Life      | Sacrifice 15% of current HP. Heal ally with lowest HP for 200% of the sacrificed amount. | 2    |       | Heal          | Magic    |
| Maleficent’s Omen | Increase all stats by 20% for 2 turns.                                                   | 3    |       | Buff          | Magic    |

#### Flame Moves

| Name             | Description                                                                                    | Cost | Power | Status Effect | Type     |
| ---------------- | ---------------------------------------------------------------------------------------------- | ---- | ----- | ------------- | -------- |
| **Offensive**    |                                                                                                |      |       |               |          |
| Conflagration    | Small fire damage. Damage is tripled against a burnt target.                                   | 1    |       |               | Magic    |
| Pyroclasm        | Charges for 1 turn then causes High damage. Inflicts burn. Interrupts causes backfire.         | 2    |       | Burn          | Magic    |
| Demonic Flare    | Consumes 50% of current HP and deals 100% as fire damage to enemy. Inflicts burn.              | 3    |       | Burn          | Magic    |
| **Defensive**    |                                                                                                |      |       |               |          |
| Cauterise        | Greatly reduce bleed and disease damage for X turns.                                           | 1    |       | Buff          | Magic    |
| Overheat         | Lowers targets speed and s.def for X turns.                                                    | 2    |       | Debuff        | Magic    |
| Molten Wall      | Absorbs magic attacks for X turns, increasing own magic attack. Physical attacks inflict burn. | 3    |       | Buff / Burn   | Magic    |
| **Utility**      |                                                                                                |      |       |               |          |
| Rebirth          | Sacrifice life and rebirth after 2 turns. Immune to DOT damage. Direct damage enters DDS.      | 1    |       | Revive        | Magic    |
| Engulfing Flames | Small fire damage for X turns. Target can’t escape.                                            | 2    |       | DOT / Trap    | Magic    |
| Infernal Bomb    | Small fire damage for 1-4 turns followed by explosion. Effects ALL in play. Inflicts burn.     | 3    |       | DOT / Burn    | Magic    |

#### Frost Moves

| Name          | Description                                                                           | Cost | Power | Status Effect | Type     |
| ------------- | ------------------------------------------------------------------------------------- | ---- | ----- | ------------- | -------- |
| **Offensive** |                                                                                       |      |       |               |          |
| Icicle        | Small frost damage. Damage is tripled against a chilled target.                       | 1    |       |               | Magic    |
| Ice Burn      | Small frost damage. Inflicts burn.                                                    | 2    |       | Burn          | Magic    |
| Blizzard      | Medium frost damage every turn for X turns. Chills enemy.                             | 3    |       | Chill         | Magic    |
| **Defensive** |                                                                                       |      |       |               |          |
| Ice Armour    | Greatly increases physical defence for X turns. Physical enemy attacks inflict chill. | 1    |       | Buff / Chill  | Magic    |
| Freeze Blood  | Greatly reduces bleed damage for X turns.                                             | 2    |       | Buff          | Magic    |
| Jagged Ice    | Physical attacks inflict medium frost damage to the enemy.                            | 3    |       | Buff          | Magic    |
| **Utility**   |                                                                                       |      |       |               |          |
| Frostbite     | Inflicts cripple if target is chilled.                                                | 1    |       | Cripple       | Magic    |
| Absolute Zero | Greatly increases magic attack. Stacks twice                                          | 2    |       | Buff          | Magic    |
| Chains of Ice | Enemy is unable to move for X turns.                                                  | 3    |       | Debuff        | Magic    |

#### Insect Moves

#### Wraith Moves

| Name                        | Description                                                                      | Cost | Power | Status Effect | Type     |
| --------------------------- | -------------------------------------------------------------------------------- | ---- | ----- | ------------- | -------- |
| **Offensive**               |                                                                                  |      |       |               |          |
| Malefic Claw                | Small wraith damage. Damage increased by 5% for each curse applied. Always hits. | 1    |       |               | Magic    |
| Malediction: Haunt I/IV     | DoT on target for 3/6/9/12% of max HP.                                           | 2    |       | Curse / DoT   | Magic    |
| Possess                     | Hides within target for 1 turn. User is unable to attack or switch.              | 3    |       |               | Magic    |
| **Defensive**               |                                                                                  |      |       |               |          |
| Hysteria                    | Target is driven insane and drops equipped fetish for 3 turns.                   | 1    |       |               | Magic    |
| Malediction: Necrosis I/IV  | Reduce healing effects by 10/30/50/70%.                                          | 2    |       | Curse         | Magic    |
| Panic Attack                | Fear for 1 turn.                                                                 | 3    |       |               | Magic    |
| **Utility**                 |                                                                                  |      |       |               |          |
| Paranoia                    | First strike. Targets last move is locked out. Max 1 lock.                       | 1    |       |               | Magic    |
| Malediction: Decrepify I/IV | Reduce Speed, p.att and p.def by 10/20/30/40%.                                   | 2    |       | Curse         | Magic    |
| Nevermore                   | Instant death if target suffers from a level IV curse.                           | 3    |       |               | Magic    |

#### Ultimate Moves

Each species of demon is equip with a unique ultimate move.

* May only be triggered when ultimate meter is full.
* Ultimate moves have a high cost (x). Starts battle inactive and becomes available after x moves.
* Possibly FF7 style with filling meter based on getting hit, persists throughout dungeon.

### Effects

Some [moves](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-moves) may apply an additional effect. Effects are not removed upon exiting combat and can only be cured / treated at the clinic, through items or dungeon events. Effects stack up to 5.

| Name        | Description |
|------------ | ----------- |
| Bleed       | Inflicts a set amount of damage every turn. Strong bleeds cannot be stopped. |
| Burn        | Inflicts a set amount of damage every turn. Physical damage reduced. |
| Chill       | Slightly reduces speed. |
| Cripple     | Greatly reduces speed. |
| Fear        | Unable to attack. |
| Plagued     | Inflicts an increasing amount of damage every turn. |
| Spike       | Inflicts a set amount of damage on switch in. |
| Zombie      | Heals and revives now cause harm. |

> **Note:** A demon will enter [Deaths Door](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-deaths-door-state) if their HP is reduced to zero or below.

#### Temporary Effects

Some moves may have additional effects which affect a demons base statistic (buffing physical attack, for example). The changes only remain in effect during combat and are removed afterwards.

### Passives / Permanent Quirks

Demons have predetermined passives. Only one passive ability may be active at a time. Passive abilities can only be changed during a special dungeon event (TODO link to event).

Passives are more specific to the species of demon than enchantments, some may only be found on certain species.

Types of passives:
Fun / unique quirks
Boosts move damage of specific type (1 for each type)
Reduces damage from a specific type (1 for each type)
Change the way a move works (1 for each type)
Moves that apply an effect are applied at max stacks (1 for each effect)
Physical contact applies an effect ((1 for each effect))
Increases a specific base stat given circumstance (1 for each base stat)
Permently increases a specific base stat but is weaker against certain types (1 per base stat)
Stat is increased given specific weather (1 per weather)
Stat is reduced given specific weather (1 per weather)
May apply an effect even if demon is immune (1 per effect)
Escaping / switching passives
Immunity passives like avoiding one damaging move.
Reduction or immunity to super effective moves
Increase a base stat / move type damage in specific dungeon type (increase speed in marshes, bone moves in graveyard)


| Name        | Description |
|------------ | ----------- |
| Aftermath   | Damages attacker if hit with a finishing move. |
| Analytic   | Boosts damage if attacks last. |
| Berserk   | Boosts attack when HP is below 50%. |
| Flame Body   | Physical contact applies burn to attacker. |
| Forewarn   | One move is disclosed on entering field. |
| Thick Fat   | ... |
| Wonderguard | ... |
| Air Lock | Stat effect changes have no effect (buffs and debuffs) |
| Anger Point | Demon is enrage when hit with super effective move. Maxs physical attack stat. |
| Battle Armour | Unable to recieve super effective hits |
| Boost | Demon increases highest stat to max after killing enemy |
| Berserk | Demons attack is increased when its HP is below 50% |
| Blaze | Powers up flame type moves |
| Pandemic | Plagues are applied at max stacks on hot days. |
| - | Eliminates the effects of weather. |
| Color Change | The demons type becomes that of the move last used on it |
| Comatose | The demon may not act until it is hit first in battle |
| Corrosion | Demon may apply plagues even to demons that are immune |
| Cursed Body | Locks out the first move used against this demon for combat duration. |
| Dark Aura | Powers up wraith type moves. |
| Disguise | The demon avoids the first damaging move against it per battle |
| Dry Skin | Small heals per turn when raining. Reduced HP on hot days. |
| Effect Spore | Physical combat with demon may apply an effect like plague (do one of these per effect type) |
| Emergency Exit | The demon switches out when it's HP becomes less than 25%. No nothing if only one left on team |
| Filter | Reduces the power of super effective moves slightly. |
| Flaming Body | Physical contact may apply a stack of burn to attacker. |
| Fluffy | Halves damage from physical attacks. But doubles flame based attacks |
| Friend Guard | Increases physical defence of all in team if alive (do one for other stats) |
| Frisk | When entering battle it can check out an opponents held item |
| Fur coat | Half physical damage |
| Gale Wings | Demon will always attack first if at 100% HP |
| Gluttony | Demon eats slain victim and restores half the max HP of defeated demon. |
| Gooey | Physical combat lowers speed of attacking demon |
| Grassy Ambush | Increases speed in grassy terrain |
| Guts | Attack and Special attack increased to max if suffering from any effect |
| Healer | Removes 1 stack of an effect per turn |
| Heatproof | Halves flame type damage |
| Heavy Metal | Doubles demons weight |
| Honey Gatherer | Demon may collect honey after battle (maybe a provision! or gold) |
| Hydration | Heals a stack of effect per turn if it's raining (or removes all effects during rain) |
| Ice body | Regain HP every turn in hailstorm |
| Illuminate | Increases likelyhood of finding rare items in dark dungeons |
| Immunity | Prevents getting poisoned |
| Imposter | Transform into the demon it's facing on entering combat with same moves and type |
| Insomnia | Demon is unable to sleep |
| Iron Barbs | Physical moves damage attacker |
| Klutz | Demon is unable to use an item (fetish) |
| Light metal | Halves demons weight |
| Liquid Ooze | Blood is infected - draining blood will infect attacker with plague |
| Long Reach | Can use physical moves without touching the target |
| Magic Bounce | Reflects status effects back to caster |
| Pickpocket | Steals held fetish from demon |
| Magma Armour | Unable to become frozen |
| Merciless | Attack is always super effective if affected by an effect |
| Lone Wolf / Minus | Boosts attacks if a demon in party is dead / missing |
| Party / Plus | Boosts attacks if team is full |
| Multiscale | Reduces damage slightly if it was at 100% HP |
| Mummy / Undead | Contact with demon changes its passive to also be mummy |
| Natural Cure | All effects are cured when leaving battle or switching |
| Neuroforce | Powers up supereffective moves |
| Normalise | All moves become typeless and attack power is slightly increased |
| Poison Heal | Heals demon for poison amount rather than damaging |
| Prankster | Give priority to a effect inducing move |
| Regenerator | Restore a little HP when switched in battle |
| Rivalry | Increased damage to demon of same class, less of different class |
| Run Away | May switch in battle without using a move |
| Sand Force | Increasing something (maybe speed) in a sandstorm |
| Dup | Increases all stats by x% for each same type of demon alive in party |
| Scrappy | May hit wraiths with physical attacks |
| Shed Skin | Removes an effect by shedding skin, reducing defence |
| Simple | stat changes (buffs or debuffs) are doubled |
| Slow Start | For 4 turns, the demons attack and defence are lowered |
| Soul Heart | Boosts attack for every demon defeated in team |
| Stall | Demon moves last |
| Sticky Hold | Demons fetish cannot be removed by other demons |
| Strong Jaw | Increases physical attack |
| Swarm | Power up insect moves when low on HP |
| Synchronise | Attacker will receive same status effect it inflicted |
| Technician | Powers up demons weakest move |
| Telepathy | Demon avoids a direct attack that would kill it once per battle |
| Thick Fat | Half damage from fire and ice |
| Toxic Boost | Power up physical attacks if target is poisoned |
| Trace | Demon copies the ability of opposing demon |
| Triage | Gives priority to healing moves |
| Unaware | When attacking, the demon ignores target stat changes |
| Unburden | Speed stat is maxed if demon looses held fetish |
| Water absorb | Restore HP if hit by water move rather than taking damage |
| Water Veil | Demon is encased in water and cannot be burnt |
| Wonder Guard | Demon has 1 HP but may only be hit with super effective moves and immune to all status effects |
| Counterbalance | If the cost of both played moves matches, cancels out |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |

TODO: Maybe rather than having types have quirks (like flame demons absorbing flame damage by default, these are passives that always appear on them or always in the possible passives available). Allows for 2 passives.

### Leveling

XP gained during battles is shared equally between the team.

### Necronomicon

| ID  | Name           | Description                                  | Type 1    | Type 2 | Passives  |
|---- | -------------- | -------------------------------------------- | --------- | -------| --------- |
| 001 |       ...      |                      ...                     | Insect    | Frost  |    ...    |
| 002 |       ...      |                      ...                     | Beast     |        |    ...    |

### Legendary Demons

Legendary demons may be found in various areas of the game as optional super bosses. Once defeated, you may imprison their soul
and call upon them once per battle. Only one legendary demon may be bound to at any point.

| ID  | Name      | Location   | Move                                                 |
|---- | --------- | ---------- | ---------------------------------------------------- |
|  95 | Asmodai   | Powerplant | **Thunder:** Deals large electric damage to opponent |
|  96 | Beelzebub | Cinnibar   | **Fire Blast:** Deals large fire damage to opponent  |
|  97 | Belial    | Cinnibar   | **Fire Blast:** Deals large fire damage to opponent  |
|  98 | Belphegor | Cinnibar   | **Fire Blast:** Deals large fire damage to opponent  |
|  99 | Leviathan | Cinnibar   | **Fire Blast:** Deals large fire damage to opponent  |
| 100 | Mammon    | Cinnibar   | **Fire Blast:** Deals large fire damage to opponent  |
---

## Items

### Gold

Given as a reward for completing regular and master dungeons. Used to purchase provisions.

### Provisions

* The player may not exceed the weight limit of their backpack while exploring dungeons.

| Name            | Decription                                    | Cost | Weight  |
|---------------- | --------------------------------------------- | ---- | ------- |
| Potion          | Restores health                               | 10   | 1.3 lbs |
| Food            | Remove debuff                                 | 10   | 1.3 lbs |
| Torch           | Remove debuff                                 | 10   | 1.3 lbs |
| Shovel          | Use to clear obstacles and break into things. | 10   | 1.3 lbs |
| Skeleton Key    | Opens chests                                  | 10   | 1.3 lbs |
| Iron Key        | Opens doors                                   | 10   | 1.3 lbs |
| Holy Water      | Remove debuff                                 | 10   | 1.3 lbs |
| Medicinal Herbs | Remove debuff by 1 level.                     | 10   | 1.3 lbs |
| Bandage         | Remove debuff                                 | 10   | 1.3 lbs |
| Antivenom       | Remove debuff                                 | 10   | 1.3 lbs |
| Laudanum        | Remove debuff                                 | 10   | 1.3 lbs |

### Artefacts

Given as a reward for completing regular and master dungeons. Used to increase reputations of Hub NPCs.

| Name                  | Upgrades         | Location       | Reputation |
|---------------------- | ---------------- | -------------- | ---------- |
| Skull                 | Crypt            | The Necropolis | 10         |
| Mojo                  | Jujibo's Shack   | The Necropolis | 10         |
| Parchment             | Archives         | The Necropolis | 10         |
| Adventurer’s Backpack | Hermit's Hovel   | The Aquaducts  | 10         |
| Ichor                 | Zed's Clinic     | The Cesspools  | 10         |
| Lantern               | Pack Rat’s Wagon | The Fleshwerks | 10         |
| Goblet                | Tavern           | The Fleshwerks | 10         |

### Souls

Souls are rewarded for defeating dungeon demons, or by completing regular and master dungeons. Souls aquired though
dungeon completion are random while defeating a demon will reward the player with that specific demon soul.

Souls are consumed to awaken, train or for evoke demons.

| Use             | Decription                            | Soul Cost (**G**eneric / **S**pecific) |
|---------------- | ------------------------------------- | -------------------------------------- |
| Awakening       | Awaken a demon to it's ultimate stage | 1G                                     |
| Skill           | Learn new skill                       | 1G                                     |
| Evocation       | Evoke a specific demon to join roster | 1S                                     |

#### Soulstone

A rare item used to revive a demon from the [graveyard]().

### Fetish

* Demons may attach one fetish. 
* Fetishes provide up to three [enchantments]().
* [Ancient]() fetishes have unique names and effects.
* Fetishes aquired through [dungeoneering]() or [fishing]() have random enchantments.
* Empty fetishes can be purchased from [Pack Rat's Wagon]() and [augmented]() at the [Jujibo's Shack]().
* Fetishes attached to defeated friendly demons may be retrieved if the battle is won.
* In the case of a dungeon wipe, all fetishes are lost.
* Lost fetishes may be recovered with gold from the [Pack Rat's Wagon]().

The rarity of the fetish is dependant on the number of [enchantments](). [Ancient]() fetishes are always orange. An enchantment provides a more generic buff to the demon, compared to species specific [passives]().

| Rarity | # of Enchantments | Vendor Sale |
|------- | ----------------- | ----------- |
| White  | Empty fetish      | 5           |
| Green  | 1                 | 20          |
| Blue   | 2                 | 30          |
| Purple | 3                 | 50          |
| Orange | Ancient fetish    | 100         |

#### Enchantments

An enchantment provides a permanent buff to the demon attached to the fetish.

SanctuaryRPG: 45 enemy affixes. 

Borderlands 2: 85 weapon prefixes.

Diablo 3: 25 enemy traits

| Enchantment     | Decription                            | Display Name |
|---------------- | ------------------------------------- | ------------ |
| Leech           | HP draining moves increased by 30%    | Ia           |
| Frozen          | Frost damage increased by 30%         | Bufu         |
| Fiery           | Fire damage increased by 30%          | Igni         |

Arcane      Spinning / rotating 
Desecrator
Electrified
Fast
Fire Chains
Frozen
Health Link
Illusionist Clone themselves
Jailer
Juggernaut  Immune to crowd control - reduced movement speed, increased damage taken
Molten      
Mortor      Fire grenades at player every end of turn
Nightmarish
Plagued
Reflects Damage
Shielding
Thunderstorm
Waller
Wormhole

Affluent	Yields double gold and experience rewards.
Barbed	    Enemy will deal immense damage to you if you use your ultimate attack.
Blinding	Enemy obscures your move list for a while.
Bloodrush	Bleeding stacks on player deal triple their normal damage.
Demonic	    Deals 50% more damage. Loses 5% current HP per turn.
Healthy	    Enemy has much more health than usual.
Immune	    Enemy is impervious to Ultimate attacks.
Insidious	Enemy attacks grow stronger every turn.
Ironclad	Takes 50% reduced damage from attacks.
Masochist	Enemy gains 1% ATK every time it takes damage.
Mirroring	Enemy gains 5% of player's ATK every turn.
Noxious	    Enemy is surrounded by a cloud of poison.
Numbing	    Player's health values are hidden.
Opportune	Enemy deals 50% more damage if player has the bleeding status.
Resilient	Enemy heals itself when the player heals.
Resistant	Enemy is immune to all status effects.
Shrouded	Enemy's hit point values are hidden.
Unstable	Enemy applies bleed status to itself and the player often.
Vampiric	Enemy heals continuously. (heal when bleeding)
Vicious	    Enemy has unusually high attack power.

#### Extraction

* The extraction process will **destroy** the fetish. 

Extracts enchantments from fetishes which are added to your enchantment collection within the necronomicon.

#### Augmentation

* Each augment costs one generic [soul]().
* Empty fetishes may be augmented up to three times.

Augment an empty fetish with additional enchantments from your collection.

#### Ancient Fetish

Ancient fetishes are rare items found from defeating powerful enemies. Therefore they are named after their masters and contain
unique enchanments. These enchantments **cannot** be extracted as part of the [extraction]() process. The master will be wearing this fetish during combat.

| Name            | Enchantment                           | Enchantment                           |
|---------------- | ------------------------------------- | ------------------------------------- |
| Mammons Fate    | HP draining moves increased by 30%    | Something else thats kwel             |

#### Naming

The name of a non-[ancient]() fetish is determined by the enchantments it contains. Each enchantment is associated with a demonic name.
Therefore, a name is generated by: 

```
[Enchantment 1 Name] Fetish of [Enchantment 2 Demon Forename] [Enchantment 3 Demon Surname]
```

**Example:** Enchantments <Festering> <Fiery> <Leech> creates** Festering Fetish of Esper Ra

The ordering of enchantments is determined by it's priority. This ensures a fetish with the same enchantments will have the same name.

---

## World

### Introduction

After the intro story has finished, the player is given a series of multiple choice questions on how the player arrived at Lynchwood.
Each choice relates to a specific demon type. After four choices the player will begin in Lynchwood with random demons from the selected types.

### Lynchwood Locations

A safe haven containing various buildings where you can learn demon scriptures, heal afflictions, upgrade skills and buy items.

#### Archives

> **Upgrade Artifact:** Parchment

The Archives enable the player to recruit new demons to their roster from the available demon scriptures found that week.
The player may express interest in a specific type of demon, increasing the chances of that type spawning the following week.
Upgrading the Archives increases the players roster size, number of available demons to choose from and the starting level of a new demon.

1. Talk.
    * Talk to librarian to learn about services
2. Express interest
    * Express interest in a type of demon increasing chances next week.
3. Demon Scriptures
    * Learn demon scriptures for necronomicon. Restocked weekly. Burn on use.
4. Hall of Fame
    * Contains information of the team used to defeat The Devil's Gate.
    
| Level     | Roster Size  | Available Demons | Demon Level |
|---------- | ------------ | ---------------- | ----------- |
| Feared    | 8            | 2                | 1           |
| Tolerated | 12           | 4                | 2           |
| Revered   | 16           | 6                | 4           |
| Hallowed  | 20           | 8                | 8           |

#### Crypt

> **Upgrade Artifact:** Skull

The Crypt houses an Ancient Pyre capable of awakening, evoking or upgrading demons at the cost of souls. 
The Crypt Keeper will revive the player upon death. 

1. Talk.
    * Talk to Crypt Keeper.
2. Awakening
    * Awaken a demon to it's ultimate stage.
3. Evocation
    * Evoke a specific demon to join roster if roster has space.
4. Skills
    * Alter demons skill set.

| Level     | Evocation Cost | Awakening Cost | Skill Cost |
|---------- | -------------- | -------------- | ---------- |
| Feared    | 4              | 4              | 4          |
| Tolerated | 3              | 3              | 3          |
| Revered   | 2              | 2              | 2          |
| Hallowed  | 1              | 1              | 1          |

#### Ferryman

> **Upgrade Artifact:** Not Upgradable

Talk to the ferryman Kharon to cross the river and enter dungeons. Prepare backpack before going / team. 
May give the ferryman a coin to provide you good luck. This sets the chances of finding legendary demon events to 100%.

1. Talk.
    * Talk to Kharon.
2. Prepare
    * Select provisions given weight limit and decide on team.
3. Travel [Locked if not prepared]
    * Select a dungeon to start quest.

#### Graveyard 

> **Upgrade Artifact:** Not Upgradable

The graveyard holds a log of all fallen demons, stating their name, level and circumstances of their death.
A soulstone can be used here to revive a single demon.

1. Talk.
    * Talk to the gravekeeper.
2. View History
    * See fallen demons, stating name, level and death.
3. Summon
    * Revive a fallen demon if a soulstone is available.

#### Hermit's Hovel

> **Upgrade Artifact:** Adventurer’s Backpack

The Hermit's Hovel is a place to improve bonfire skills...
An old weiry traveller who has seen the world unfold around him. Can train you on how to survive and be effcient.
Perhaps an old necromancer himself...like you but failed. Other player.

Perhaps select up to three active camping skills. At camp, can activate one skill. Skill strength based on skill tier.

Even if a skill tier is unlocked, player still needs to pay for training it each time with gold.

1. Talk.
    * Talk to the hermit.
2. Train
    * Train an available camping skill.

| Level     | Skill Tier | Skill Cost |
|---------- | ---------- | ---------- |
| Feared    | 1          | 4          |
| Tolerated | 2          | 3          |
| Revered   | 3          | 2          |
| Hallowed  | 4          | 1          |

##### Camping Skills

A player may have three active camping skills active at any one point, one of these can be activated at a campsite.

| Skill      | Description |
|----------- | ----------- |
| **Tier 1** |             |
| Something  | Description |
| **Tier 2** |             |
| Something  | Description |
| **Tier 3** |             |
| Something  | Description |
| **Tier 4** |             |
| Something  | Description |

#### Jujibo's Shack

> **Upgrade Artifact:** Mojo

Jujibo's Shack enables the player to augment and extract fetishes using Jujibo's Wuju.

1. Talk.
    * Talk to Jujibo.
2. Augmentation
    * Augment an empty fetish with additional enchantments from your collection.
3. Extraction
    * Extracts enchantments from a fetish and adds enchantment to collection within the necronomicon.

| Level     | Augmentation Cost |
|---------- | ----------------- |
| Feared    | 4                 |
| Tolerated | 3                 |
| Revered   | 2                 |
| Hallowed  | 1                 |

#### Pack Rat’s Wagon

> **Upgrade Artifact:** Lantern

The Pack Rat’s Wagon is...

1. Talk.
    * Talk to Pack Rat.
2. Buy
    * Buy purified / trash fetish.
3. Sell
    * Sell fetish for gold when no longer needed and enchantments have been extracted.
4. Trade
    * Trade artifacts for other artifacts at a ratio of 2:1.
5. Retrieve
    * Buy lost fetish back with gold. These will be rotated based on number of lost fetishes.

| Level     | Retrieve Stock     | Purified Cost
|---------- | ------------------ |
| Feared    | 4                  |
| Tolerated | 6                  |
| Revered   | 8                  |
| Hallowed  | 10                 |

#### Secluded Cove

A secluded bay in which the player may fish. Three locations are available which contain different species of fish.

1. Beach
2. River
3. Rock pool

> **Range:** When casting from the beach the player may choose a short, medium or long cast.

##### Fishing

###### Fishing Rods

| Rod   | Cost | Fishing Mastery Level |
| ----- | ---- | --------------------- |
| Old   | 10   | Beginner              |
| Good  | 200  | Intermediate          |
| Super | 500  | Advanced              |
| Ultra | 2000 | Master                |

###### Fishing Line

| Line        | Duration | Cost |
|------------ | -------- | ---- |
| 10 lbs      | 10       | 5    |
| 30 lbs      | 20       | 20   |
| 60 lbs      | 30       | 50   |

###### Fishing Hooks

| Hook  | Cost |
|------ | ---- |
| Dull  | 10   |
| Sharp | 200  |
| Razor | 500  |

###### Fishing Rigs

| Hook        | Cost |
|------------ | ---- |
| Float       | 5    |
| Spider      | 5    |
| Shiny Beads | 2    |
| Swivel      | 2    |
| Shockleader | 20   |

###### Fishing Bait

| Bait    | Cost |
|-------- | ---- |
| Maggot  | 5    |
| Lugworm | 15   |
| Crab    | 20   |

###### Fishing Mastery Value

The amount of mastery received when a fish / chest is caught is based on various factors shown in the table below.

| Catch       | Fishing Mastery Value |
|------------ | --------------------- |
| Normal      | 1                     |
| Rare        | 4                     |
| Exceptional | 6                     |
| Epic        | 8                     |
| New Species | 4                     |
| Large       | 2                     |
| Chest       | 4                     |

> **Example:** Catching a large, epic new species of fish will grant 14 mastery.

###### Fishing Mastery Level

Fishing mastery level determines which rod the player may purchase.

| Fishing Mastery Level | Fishing Mastery Value |
|---------------------- | --------------------- |
| Beginner I            | 0                     |
| Beginner II           | 80                    |
| Beginner III          | 160                   |
| Beginner IV           | 240                   |
| Intermediate I        | 320                   |
| Intermediate II       | 400                   |
| Intermediate III      | 480                   |
| Intermediate IV       | 560                   |
| Advanced I            | 640                   |
| Advanced II           | 720                   |
| Advanced III          | 800                   |
| Advanced IV           | 880                   |
| Master                | 1000                  |

###### Fishing Album

The fishing album holds information on all caught and uncaught species of fish.

* Displays current [Fishing Mastery Level]().
* Displays list of all fish names (??? if unknown).
    * Fish Name
    * Required Fishing Mastery Level
    * Rarity
    * Habitat
    * Description (if caught)
    * Total Caught (if caught else 0)
    * Large Catches (if caught else 0)
    * Heaviest (if caught else 0)
    
###### Fishing Mechanics

TODO

###### Fish

| ID  | Name     | Fishing Mastery Level | Rarity | Location | Notes        | Weight | Base Price | Effect |
| --- |--------- | --------------------- | ------ | -------- | ------------ | ------ | ---------- | ------ |
| 001 | Blowfish | Beginner              | Common | Beach    | Medium range | 1-2lbs | 2          | HP Up  |

#### Tavern

> **Upgrade Artifact:** Crest

The Tavern is...

1. Talk.
    * Talk to Tavern owner.
2. Buy Secret
    * Buy dungeon secrets. Maybe put giving dungeon chance to find chest to 100% and marks on map.
3. Cloaked Stranger
    * Talk to stranger to learn more about hub area. / game tutirial master.
3. Play Dungeon Solitaire
    * Play card mini-game.

| Level     | Secret Cost |
|---------- | ----------- |
| Feared    | 50          |
| Tolerated | 40          |
| Revered   | 20          |
| Hallowed  | 10          |

##### Tarokk

###### Rules

* Played on a 3x3 grid, initially all spaces are empty.
* Some spaces may contain an element placeholder.
* Each player starts with 5 chosen cards in their hand.
* A hand may not contain duplicates and contain only one Major card. 
* A coin flip at the start determines who goes first.
* During a players turn they must place a card from their hand on to the board.
* The power levels of the placed card will be a +1 or -1 effect if an elemental card is placed on a matching or non matching element placeholder respectivly.
* If a card is placed adjacent to an opponents card, the card with the highest power on the attacking side wins. This chains to the next card if that card would win.
* A defeated cards colour changes to the colour of the player / opponent.
* Blue cards are *owned* by the player. Red cards are *owned* by the opponent.
* The player with the most coloured cards on the board (plus the one left in the second players hand), wins.

###### Card

Cards are aquired through defeating demons, chests or quests / events. There are a total of 78 cards; 56 Minor Arcana cards 
and 22 Major Arcana cards. Cards with parenthesis after their level states how many sides are guarenteed to have max
power values in their range. Each card contains:

* A Title.
* An Illustration.
* Four power values for each side; top, right, bottom, left.
* An optional element.

| Card                                                                                                          | Level | Type  |
| ------------------------------------------------------------------------------------------------------------- | ----- | ----- |
| Ace of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)    | 1     | Minor |
| Two of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)    | 2     | Minor |
| Three of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)  | 2 (2) | Minor |
| Four of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)   | 3     | Minor |
| Five of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)   | 3 (2) | Minor |
| Six of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)    | 4     | Minor |
| Seven of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)  | 5     | Minor |
| Eight of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)  | 6     | Minor |
| Nine of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)   | 7     | Minor |
| Ten of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)    | 8     | Minor |
| Page of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)   | 9     | Minor |
| Knight of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit) | 9     | Minor |
| Queen of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)  | 9     | Minor |
| King of [Suit](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-card-suit)   | 9     | Minor |
| The Fool                                                                                                      | 10    | Major |
| The Magician                                                                                                  | 10    | Major |
| The High Priestess                                                                                            | 10    | Major |
| The Empress                                                                                                   | 10    | Major |
| The Emperor                                                                                                   | 10    | Major |
| The Hierophant                                                                                                | 10    | Major |
| The Lovers                                                                                                    | 10    | Major |
| The Chariot                                                                                                   | 10    | Major |
| Justice                                                                                                       | 10    | Major |
| The Hermit                                                                                                    | 10    | Major |
| Wheel of Fortune                                                                                              | 10    | Major |
| Strength                                                                                                      | 10    | Major |
| The Hanged Man                                                                                                | 10    | Major |
| Death                                                                                                         | 10    | Major |
| Temperance                                                                                                    | 10    | Major |
| The Devil                                                                                                     | 10    | Major |
| The Tower                                                                                                     | 10    | Major |
| The Star                                                                                                      | 10    | Major |
| The Moon                                                                                                      | 10    | Major |
| The Sun                                                                                                       | 10    | Major |
| Judgement                                                                                                     | 10    | Major |
| The World                                                                                                     | 10    | Major |

###### Card Suit

A suit determines which element a card may spawn with.

| Suit      | Element |
| --------- | ------- |
| Wands     | Fire    |
| Cups      | Water   |
| Swords    | Air     |
| Pentacles | Earth   |

###### Card Level

The level of a card determines the power range of the cards four powers. 

| Level | Power Range |
| ----- | ----------- |
| 1     | 1-3         |
| 2     | 2-3         |
| 3     | 2-4         |
| 4     | 3-4         |
| 5     | 3-5         |
| 6     | 4-5         |
| 7     | 4-6         |
| 8     | 5-6         |
| 9     | 6-7         |
| 10    | 8-A         |

#### Zed's Clinic

> **Upgrade Artifact:** Ichor

The Clinic is a place to fix wounds of the demons host...

* **Upgrade Artifact:** ...

#### Upgrading Buildings

All town buildings (except the [cove](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-cove)
and [graveyard](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-graveyard)) 
may be upgraded once the required reputation level has been met. 

You may increase building reputation by handing in specific artifacts.

| Level     | Reputation |
|---------- | ---------- |
| Feared    | 0          |
| Tolerated | 125        |
| Revered   | 250        |
| Hallowed  | 500        |

### Lynchwood Events

After the hero has returned from a dungeon, a town event may occur. These effect the bonuses receieved from various buildings. 
Some events are triggered if the player chooses to pick up a key item in dungeon.

| Name                         | Description                                                  | Impacts    | Triggered |
| ---------------------------- | ------------------------------------------------------------ | ---------- | --------- |
| **Town Activities: Positive**|                                                              |            |           |
| Books from Beyond            | Choice of demons scripts available increased by 2.           | Archive    |           |
| Hallow's Eve                 | You can awaken one demon for free.                           | Crypt      |           |
| Night of the Comet           | You can evoke one demon for free.                            | Crypt      |           |
| A Fallen Star                | You can alter any demons skillset for free.                  | Crypt      |           |
|                              |                                                              | Ferryman   |           |
| Abra Cadaver                 | Summon one fallen demon at graveyard for free.               | Graveyard  |           |
| Excavation Progress Report   |                                                              | Hermit     |           |
| A Jar of Souls               | You can augment one fetish for free.                         | Jujibo     |           |
| Supply and Demand            | Fetishes cost half as much.                                  | Pack Rat   |           |
| Overstocked                  | Pack Rat trades artifacts at 1:1.                            | Pack Rat   |           |
| What’s in the Box?!          | High chance of chests.                                       | Fishing    |           |
| Message in a Bottle          | High chance of legendary demon spawn event.                  | Fishing    |           |
| Word on the Street           | Tavern secrets are free this week.                           | Tavern     |           |
| Dealer's Choice              | Cards todo.                                                  | Tavern     |           |
| Placebo Effect               | Zed heals full stacks of status effects this week.           | Zed        |           |
| Medical Mystery              | Demons who stay in town have 2 stacks of effects cured.      | Demons     |           |
| **Town Activities: Negative**|                                                              |            |           |
| Soaked Pages                 | Pages are smugged. Demons spawn with status effects.         | Archive    |           |
| Powering the Pyre            | Crypt is closed this week.                                   | Crypt      |           |
| Leaky Boat                   | May only carry half your supply capacity.                    | Ferryman   |           |
| Sacred Congregation          | Unable to summon demons at graveyard this week.              | Graveyard  |           |
|                              |                                                              | Hermit     |           |
| Enraged Spirits              | Jujibo's Shack is closed this week.                          | Jujibo     |           |
| Lost Wagon                   | Pack Rat is missing this week.                               | Pack Rat   |           |
| Under New Management         | Tavern is closed this week.                                  | Tavern     |           |
| Corpse Trader                | Zed's Clinic is closed this week.                            | Zed        |           |
| Testing the Antidote         | You will gain a stack of another effect this week.           | Zed        |           |
| **Quest Activities: Positive** |                                                            |            |           |
| Carnival of Souls            | Soul gains doubled on the next quest                         | Souls      |           |
| Harvest Moon                 | Provisions are free.                                         | Provisions |           |
| Supply Run                   | Provisions cost half as much.                                | Provisions |           |
| Battle of The Necropolis     | +33% XP and +15% DMG on the next quest to the Necropolis.    | Dungeon    |           |
| Drought in the Aquaducts     | +33% XP and +15% DMG on the next quest to the Aquaducts.     | Dungeon    |           |
| Draining the Cesspools       | +33% XP and +15% DMG on the next quest to the Cesspools.     | Dungeon    |           |
| 30 Days Without and Accident | +33% XP and +15% DMG on the next quest to the Fleshwerks.    | Dungeon    |           |
| Unlikely Aid                 | Level of enemy demons reduced by 1 for next quest.           | Demons     |           |
| **Quest Activities: Negative** |                                                            |            |           |
| Dampened Spirits             | No soul gains on the next quest                              | Souls      |           |
| **Weather Activities**       |                                                              |            |           |
| Volcanic Activity            | Increase power of Flame moves by 50%.                        | Types      |           |
| Snowstorm                    | Increase power of Frost moves by 50%.                        | Types      |           |
| Pollen Season                | Increase power of Disease and Insect moves by 50%.           | Types      |           |
| Deity Aurora                 | Increase power of Dragon moves by 50%.                       | Types      |           |
| Bad Moon                     | Increase power of Bone and Wraith moves by 50%.              | Types      |           |
| Blood Moon                   | Increase power of Blood moves by 50%.                        | Types      |           |
| **Special Activities**       |                                                              |            |           |
| A Thief in the Night         | Demon has stolen fetish from party member. Start battle.     | Archive    |           |
| A Pretty Boring Week         | Nothing happens this week.                                   | N/A        |           |

### Dungeon

* Defeating demons rewards the player with a demon specific [soul](https://bitbucket.org/stephen_cathcart/text-adventure/src/master/#markdown-header-souls). 
* Retreating from a dungeon is possible on normal difficulty only. All gold and items aquired so far are safe.
* Dungeon layouts and contents are randomised each time.
* Dungeon has 50% chance of spawning a secret room containing a chest.

#### Dungeon Modifier

Each dungeon has a modifer, which corresponds to a specific goal the player needs to complete.
Once the goal is met, the player *may* then leave the dungeon and claim their reward.

| Modifier        | Decription              |
|---------------- | ----------------------- |
| Assassinate     | Kill the dungeon boss   |
| Gather          | Find the relic          |
| Activate        | Activate three alters   |
| Cleanse         | Kill all demons         |
| Explore         | Explore 90% of dungeon  |

#### Dungeon Difficulty

The player may choose to start any regular dungeon in various difficulties, which have a high risk / high reward bonus.

Move hints are only shown on normal difficulty and show how effective a move will be.

| Difficulty | Escape Rope | Move Hints | Demon Level    | Size        | XP Gains     | Souls Reward | Gold Reward | Provisions Reward | Artifacts Reward | Bonfires | Chests |
|----------- | ----------- | ---------- | -------------- | ----------- | ------------ | ------------ | ------------| ----------------- | ---------------- | --------- | ------ |
| Normal     | Enabled     | Enabled    | +1             | Small       | 100%         | +1           | 100%        | x1                | x1               | +0        | +1     |
| Nightmare  | Disabled    | Disabled   | +2             | Medium      | 160%         | +2           | 160%        | x2                | x2               | +1        | +2     |
| Hell       | Disabled    | Disabled   | +3             | Large       | 260%         | +3           | 260%        | x3                | x3               | +2        | +3     |
| Inferno    | Disabled    | Disabled   | +4             | Extra Large | 420%         | +4           | 420%        | x4                | x4               | +2        | +4     |

#### Dungeon Location

Depending on the location of the dungeon, only certain demon types may be found. Type 1 demons are more likely to spawn while type 3 demons are more rare.

| Area           | Type #1 | Type #2 | Type #3 |
|--------------- | ------- | ------- | ------- |
| The Necropolis | Bone    | Wraith  | Dragon  |
| The Aquaducts  | Frost   | Beast   | Dragon  |
| The Cesspools  | Insect  | Disease | Dragon  |
| The Fleshwerks | Flame   | Blood   | Dragon  |

#### Dungeon Map Structure

* A dungeon map is made up of a number of rooms connected by corridors, based on the dungeon size.
* Upon entering the dungeon, the position of all rooms and corridors are known but grey.
* A corridor is always connected to two rooms and never leads to a deadend.
* A scroll may be obtained revealing the contents of all rooms and corridors.

##### Dungeon Room

Rooms are the same as corridors however they may also contain:

| Contains   | Description | Color | 
|----------- | ------ | --------- |
| Entrance   | +1     | Red |
| Boss       | +1     | Red |
| Chest      | +1     | Yellow |

##### Dungeon Corridor

| Contains   | Description | Color | 
|----------- | ------ | --------- |
| Battle     | +1     | Red |
| Curios     | +1     | Blue |
| Obstacle   | +1     | Blue |
| Trap       | +1     | Purple |
| Secret     | +1     | Yellow |
| Empty      | +1     | Grey |

#### Dungeon Events

Dungeons contain random events.

TODO: someone who allows to to alter passive move for souls.
Broken Well
Maybe take events from old folklore / grimm tales like troll under bridge
Chamber of Suffering
Lair of the Witch
Cave of Temptation - player may take any item but by doing so something really bad happens.
Fetid Pool
Graven Decent
Quicksand


##### Event: Vampires

> You come across a hooded figure in the midst of some dark ritual. As you approach, it turns to you and you see it bares fanged teeth and extends a long, pale hand towards you.

1. [Offer Blood]
    * > The tall figure grabs your arm and pulls you forward, sinking it's fangs into your neck. You feel a dark force pour into your neck and course through your body.
    * Your teams HP is reduced by 20% however, their diseases are cured.
1. [Refuse]
    * > You step back and raise your weapon in defiance. The tall figure sighs. "Very well". The figure morphs into a thick black fog that floats away.
    * Nothing happens.

##### Event: Ancient Sarcophagus

> You come across a hooded figure in the midst of some dark ritual. As you approach, it turns to you and you see it bares fanged teeth and extends a long, pale hand towards you.

1. [Open]
    * > You push the stone lib filling the air with age old dust. A chill runs down your spine as you see a dark apperition appear before you.
    * Chance: 50%. You encounter a high level wraith demon.
    * > You push the stone lid filling the air with age old dust. You catch a glimpse of a rare object and reach out to pick it up.
    * Chance: 50%. You find a rare fetish
1. [Leave]
    * > You circle the sarcophagus but after much debate, leave it be and continue forth.
    * Nothing happens.

##### Event: Azul's Shrine

> You find yourself standing in front of a old shrine. It looks as though it was created to worship Azul the Fortunate.

1. [Pray]
    * > You kneel and ask Azul for good fortune.
    * Gain 5 gold.
2. [Desecrate]
    * > You kick the shrine over and discover a bag of gold hidden under it. A feeling of instant regret runs through your body.
    * Gain 25 gold. Add stack of curse to party.
3. [Leave]
    * >
    * Nothing happens.

##### Event: Hell Spring Fountain

> You come upon a blood red spring. It's presense incites your captive demons.

1. [Drink]
    > You demons start to drink from the fountain and become refreshed.
    * Removes all status effects from demon.
2. [Leave]
    > Hesitant of the outcome, you walk away from the fountain.
    * Nothing happens.

##### Event: A Woman in Blue

> A frail woman stands before you, arms crossed with a smirk on her face. "I have in my possesion an array of provisions which may be of use to you, you may have as many as you'd like...for a price of course".

1. [Buy 1 Provision: 5 gold]
    > Ah young adventurer, I see you play on the side of caution. Enjoy.
    * You receive 1 random provision.
2. [Buy 2 Provisions: 15 gold]
    > Oh the suspense! You have no idea how good the next item would have been.
    * You receive 2 random provisions.
3. [Buy 3 Provisions: 30 gold]
    > A high spender, I like it. Come back any time brave adventurer.
    * You receive 3 random provisions.
4. [Leave]
    > You tell the woman you have no interest and she 
    * Nothing happens.

##### Event: Tar Pit

> You find yourself wading through thick sludge and notice you've drop a handful of gold.

1. [Find Gold]
    > You find your how bag of gold and extra from past adventurers. However, the sludge has started to affect your demons.
    * Find 75 gold. Demons take 15% damage of max HP.
2. [Leave behind]
    > You decided hunting for lost gold isn't worth the risk.
    * Loose 20-50 gold.

##### Event: N'loth

> A small, strange creature stands before you. Sensing a strong aura radiating from the entity, you proceed with caution. "and I shall bestow upon you the blessing of N'loth the trickser".

1. [Trade Relic]
    > You hand over the relic. N'loth begins to talk in riddles and you feel yourself going faint. As you awake you notice the creature has gone. You have a strange feeling you'll find items of great value going forth.
    * Gain blessing of N'loth, which doubles amount of chest rewards and provides rare fetishes.
2. [Leave]
    >
    * Nothing happens

##### Event: Begger

> Laying in the corner of the room you notice a man dressed in old rags. He begs you for gold.

1. [Give 15 Gold]
    >
    * Loose 15 gold. Retrieve fetish.
2. [Rob Begger]
    > You tear away the bag the begger was holding. Too weak to fight back, the begger pleads you to stop. You chose not to listen and continue to assault the man. 
    * Retrieve fetish. Possibly apply stack of curse.
3. [Leave]
    > The begger, in a weaken voice, wishes you well on your journey ahead.
    * Nothing happens.

##### Event: Merchant

> Hello, need any provisions weary traveller?

* **Probability:** low

The merchant sells basic provisions at a high price.

* **Probability:** low

The beggar event allows the player to donate coins...

##### Event: Fortune Teller

> We will all die one day.

* **Probability:** low

The fortune teller...

##### Event: Gamble with the Devil

> You make mistakes, it is only natural.

* **Probability:** low

Gambling with the devil enables the player to start a card game. Rare cards.
Is actually a legendary demon who you can bond with if you win.

##### Event: Banana

> A banana is on the ground.

* **Probability:** low

1. Peel it.
    * You peel the banana. Bugs start crawling out from inside. (Nothing)
    * You peel the banana and eat it! (Heal)
2. Eat it.
    * You eat the banana, choking on it because it's not peeled. (Damage)
    * You eat the banana, peeled and all! (Nothing)
3. Smash it.
    * You smash the banana so hard that heals you! (Heal)
    * You smash the banana, but makes you all sticky. (Nothing)
    
##### Event: Hell Spring

> You appear in front of a blood red spring.

* **Probability:** low

1. (Bulbasaur) Drink.
    * Bulbasaurs status effects are cured! (Heal)
2. (Charmander) Drink.
    * Charmanders status effects are cured! (Heal)

#### Dungeon Bonfire

* Bonfires are found in harder dungeons.
* They may only be used once.
* Restores 20% HP of party, may be improved by upgrading [Survivalist]().
* May provide other benefits depending on Survivalist skills learned.
* There is a 33% chance of a night-time ambush by a random dungeon demon.
* Extingushing a Bonfire (not using it) acts as an added multiplier for dungeon rewards.

#### Dungeon Completion Rewards

* Gold
* Provisions
* Normal / Hardcore Fetish
* Souls
* Artifacts

### The Devil's Gate

* Consists of defeating 4 masters consecutivly.
* Each master is selected from a random pool.
* Each master will have a random Affix.
* Time between each battle to use items.
* Cannot escape once entered.

#### Masters

| Name       | Demon #1 | Demon #2 | Demon #3 | Demon #4 | Demon #5 | Demon #6 |
|----------- | -------- | -------- | -------- | -------- | -------- | -------- |
| Lucifer    |    ...   |    ...   |    ...   |    ...   |    ...   |    ...   |
| Mammon     |    ...   |    ...   |    ...   |    ...   |    ...   |    ...   |
| Leviathan  |    ...   |    ...   |    ...   |    ...   |    ...   |    ...   |

#### Master Affix

| Name       | Description                                                   |
|----------- | ------------------------------------------------------------- |
| Tyrannical | Demons have 40% more HP and deal 15% additional damage        |
| Raging     | Demons will enrage at 30% HP, dealing 100% additional damage  |

#### The Devil's Gate Completion Rewards

* Name and Team in Hall of Fame
* Title
* Gold
* Provisions
* Legendary Fetish
* Souls
* Artifacts

---

## Combat

### Combat Formula

#### Statistics

##### HP

![HP](https://latex.codecogs.com/svg.latex?floor%28%5Cfrac%7B%28base*2%29*lvl_%7Bcurr%7D%7D%7Blvl_%7Bmax%7D%7D&plus;lvl_%7Bcurr%7D&plus;10%29)

##### Other

![Other](https://latex.codecogs.com/svg.latex?floor%28%5Cfrac%7B%28base*2%29*lvl_%7Bcurr%7D%7D%7Blvl_%7Bmax%7D%7D&plus;5%29)

#### Damage

![Damage](https://latex.codecogs.com/svg.latex?%28%5Cfrac%7B%28%5Cfrac%7B2*lvl%7D%7B5%7D&plus;2%29*Power*%28%5Cfrac%7BA%7D%7BD%7D%29&plus;2%7D%7B50%7D&plus;2%29*Modifier)

where:

* *lvl* is the level of the attacking demon.
* *Power* is the effective power of the used move.
* *A* is the effective Attack or Special Attack stat of the attacking demon.
* *D* is the effective Defence or Special Defence stat of the defending demon.

and *Modifier* is:

![Modifier](https://latex.codecogs.com/svg.latex?Weather*Type*Burn)

where:

* *Weather* is 1.5 if type of move matches environmental effect, 0.5 if type of move doesn't match environmental effect, otherwise 1.
* *Type* is the type effectivness; ineffective (0), not very effective (0.25, 0.5), effective (1) or super effective (2, 4) depending on the move's and target's type.
* *Burn* is 0.5 if attacker is burned and using a physical move, otherwise 1.

#### Leveling

* Experience is gained equally among the team regardless of which demons fought.
* A lookup table should be created for determining levels to prevent slowdown.

##### Required Experience

The required experience for a given demons level *n* is given by the following cubic function:

![Required](https://latex.codecogs.com/svg.latex?%5Cfrac%7B4n%5E3%7D%7B5%7D)

##### Gained Experience

The amount of experience gained after defeating the opponent is determined by their level and species.

![Gained](https://latex.codecogs.com/svg.latex?%5CDelta%20XP%3D%5Cfrac%7Bbase*lvl*mod%7D%7B5*n%7D%3Bbase%5Cgeq20%3B1%5Cleq%20n%5Cleq4)

where:

* *base* is the base experience yield of the defeated demon species.
* *lvl* is the level of the defeated demon.
* *mod* is any modifications, currently set to 1. A lucky egg would yeild 1.5, for example.
* *n* is the number of alive demons remaining in party.

> **Note:** Do not calculate XP gains when whole team is defeated as this would cause *n = 0* and throw an exception.

##### Experience Table

| Level | To Next | Total |
|------ | ------- | ----- |
| 1     | 6       | 0     |
| 2     | 15      | 6     |
| 3     | 30      | 21    |
| 4     | 49      | 51    |
| 5     | 72      | 100   |
| 6     | 102     | 172   |
| 7     | 135     | 274   |
| 8     | 174     | 409   |
| 9     | 217     | 583   |
| 10    | 264     | 800   |

### Combat AI

An encountered NPC demon contains a hidden personality trait which affects how they will behave in combat. Based on this personality trait, each move is weighted best to worst. This weight increases the chance of picking a good move. Harder dungeon demons are more likely to pick the 'best' move each turn.

| Personality | Description                                | Player Hint                            |
|------------ | ------------------------------------------ | -------------------------------------- |
| Aggressive  | More likely to use direct damaging moves.  | [Demon Name] is lashing out violently. |
| Defensive   | More likely to use defensive moves.        | [Demon Name] seems to be hesitating.   |
| Annoyer     | More likely to use status effecting moves. | [Demon Name] is acting cocky.          |

### Deaths Door State.

When a demons HP is reduced to 0, enter DDS. One more hit will kill. Any healing will remove DDS.

### Defeat

> So, how was dying?

When all demons on the team roster are defeated, the player will be respawned back in the town hub area by a voodoo lady. All gold and items
taken into the dungeon and also found within are lost.

---

## Menu

### Manual

An in-game manual will be provided containing most of the information in this README.

## Technical Documentation

### God Mode

To enable max provisions, gold, artifacts, souls, soulstones and unlock all enchantments type:

```
> ilikefishsticksinmymouth
```

The player will gain a non-removable title of: <Name> the gay fish.

### CLI

#### Run Game

```
#Run on mac
cd {workspace}
love .

#Run on non-admin mac
cd {workspace}
~/Bin/lua/love.app/Contents/MacOS/love .
```

#### Unit Tests

```
# Runs luaunit on all files that match *_test.lua.
cd {workspace}
find . -name "*_test.lua" -print | while read filename; do lua $filename -v ; done
```

#### Distribution

```
# Removes unnecessary artefacts such as test scripts and project files.
cd {workspace}
zip -r -x=*.DS_Store* -x=*.git* -x=*README.md* -x=*.code-workspace* -x=*_test.lua* -x=flot/* Game.love .
```

#### Flot Graphs

```
# Runs flot on all files that match *_flot.lua. HTML outputs to flot folder.
cd {workspace}
find . -name "*_flot.lua" -print | while read filename; do lua $filename ; done
```

#### Tail App Data

```
# Create symlink to application save data.
cd {workspace}
ln -s /Users/stephencathcart/Library/Application\ Support/LOVE/GtGLG/save.json save.json
unlink save.json
```