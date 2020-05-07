/*
 * Contains:
 *		Security
 *		Detective
 *		Star Vigil Commander
 */

/*
 * Security
 */
/obj/item/clothing/under/rank/warden
	desc = "It's made of a slightly sturdier material than standard jumpsuits, to allow for more robust protection. It has the words \"Star Vigil Sergeant\" written on the shoulders."
	name = "Star Vigil Sergeant's jumpsuit"
	icon_state = "warden"
	item_state = "r_suit"
	item_color = "warden"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0, telepathy = 0)
	flags = ONESIZEFITSALL
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/security
	name = "Star Vigil Officer's jumpsuit"
	desc = "It's made of a slightly sturdier material than standard jumpsuits, to allow for robust protection."
	icon_state = "security"
	item_state = "r_suit"
	item_color = "secred"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0, telepathy = 0)
	flags = ONESIZEFITSALL
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/dispatch
	name = "dispatcher's uniform"
	desc = "A dress shirt and khakis with a security patch sewn on."
	icon_state = "dispatch"
	item_state = "dispatch"
	item_color = "dispatch"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0, telepathy = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/security2
	name = "Star Vigil Officer's uniform"
	desc = "It's made of a slightly sturdier material, to allow for robust protection."
	icon_state = "redshirt2"
	item_state = "r_suit"
	item_color = "redshirt2"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0, telepathy = 0)
	flags = ONESIZEFITSALL
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/security/corp
	icon_state = "sec_corporate"
	item_state = "sec_corporate"
	item_color = "sec_corporate"
	flags = ONESIZEFITSALL

/obj/item/clothing/under/rank/warden/corp
	icon_state = "warden_corporate"
	item_state = "warden_corporate"
	item_color = "warden_corporate"
	flags = ONESIZEFITSALL

/obj/item/clothing/under/tactical
	name = "tactical jumpsuit"
	desc = "It's made of a slightly sturdier material than standard jumpsuits, to allow for robust protection."
	icon_state = "swatunder"
	item_state = "swatunder"
	item_color = "swatunder"
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0, rad = 0, telepathy = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/tactical/marinad
	name = "marine jumpsuit"
	desc = "Boots and Utes"
	icon_state = "marinad"
	item_state = "johnny"
	item_color = "marinad"
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0, rad = 0, telepathy = 0)
	siemens_coefficient = 0.9

/*
 * Detective
 */
/obj/item/clothing/under/det
	name = "hard-worn suit"
	desc = "Someone who wears this means business."
	icon_state = "detective"
	item_state = "det"
	item_color = "detective"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0, telepathy = 0)
	flags = ONESIZEFITSALL
	siemens_coefficient = 0.9

/obj/item/clothing/under/det/black
	icon_state = "detective2"
	item_color = "detective2"
	flags = ONESIZEFITSALL

/obj/item/clothing/under/det/slob
	icon_state = "polsuit"
	item_color = "polsuit"
	flags = ONESIZEFITSALL

/obj/item/clothing/under/det/slob/verb/rollup()
	set name = "Roll suit sleeves"
	set category = "Object"
	set src in usr
	item_color = item_color == "polsuit" ? "polsuit_rolled" : "polsuit"
	if (ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.update_inv_w_uniform()

/obj/item/clothing/head/det_hat
	name = "hat"
	desc = "Someone who wears this will look very smart."
	icon_state = "detective"
	allowed = list(/obj/item/weapon/reagent_containers/food/snacks/candy_corn, /obj/item/weapon/pen)
	armor = list(melee = 50, bullet = 5, laser = 25,energy = 10, bomb = 0, bio = 0, rad = 0, telepathy = 0)
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/det_hat/black
	icon_state = "detective2"


/*
 * Star Vigil Commander
 */
/obj/item/clothing/under/rank/head_of_security
	desc = "It's a jumpsuit worn by those few with the dedication to achieve the position of \"Star Vigil Commander\". It has additional armor to protect the wearer."
	name = "Star Vigil Commander's jumpsuit"
	icon_state = "hos"
	item_state = "r_suit"
	item_color = "hosred"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0, telepathy = 0)
	flags = ONESIZEFITSALL
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/head_of_security/turtleneck
	name = "Star Vigil Commander's turtleneck"
	icon_state = "hos_turtleneck"
	item_color = "hos_turtleneck"
	item_state = "hos_turtleneck"
	flags = 0

/obj/item/clothing/under/rank/head_of_security/corp
	icon_state = "hos_corporate"
	item_state = "hos_corporate"
	item_color = "hos_corporate"
	flags = ONESIZEFITSALL

//Jensen cosplay gear
/obj/item/clothing/under/rank/head_of_security/jensen
	desc = "You never asked for anything that stylish."
	name = "Star Vigil Commander's jumpsuit"
	icon_state = "jensen"
	item_state = "jensen"
	item_color = "jensen"
	siemens_coefficient = 0.6

/obj/item/clothing/suit/armor/hos/jensen
	name = "armored trenchcoat"
	desc = "A trenchcoat augmented with a special alloy for some protection and style."
	icon_state = "jensencoat"
	item_state = "jensencoat"
	flags_inv = 0
	siemens_coefficient = 0.6
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
