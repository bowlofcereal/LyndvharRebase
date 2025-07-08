/datum/book_entry/magic1
	name = "Gathering Materials"
	category = "Instructions"

/datum/book_entry/magic1/inner_book_html(mob/user)
	return {"
	<div>
	<h2>Gathering Materials:</h2>
	To summon creatures and enchant items, you must gather the appropriate materials. This includes:
	<ul>
		<li> Manacrystals - Obtained from using prestidigitation on manafountains & spawn randomly around map</li>
		<li> Manabloom flowers - Randomly spawn in the swamp, can be grown,</li>
		<li> Obsidian shards - Obtained from using prestidigitation on lava turfs,</li>
		<li> Runed Artifacts - Can be randomly found in the swamp.</li>
		<li> Leyline Shards - inactive leylines spawn around the map. interact with them to activate them, and again to recieve a shard (Potentially getting attacked by a leyline lycan)</li>
	</ul>
	<p>
		Rumors has it that there is a mana fountain in the western part of the swamp, and a leyline in the eastern part of the swamp.
	</p>
	<p>
		Then you can use them to create various arcana items and summons, which can be used in turn to make Arcanic meld that unlock accesses to more powerful summons and enchantments.
	</p>
	</div>
	"}
