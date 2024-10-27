
Starting Scene + Bg
1. create parent node
2. Save and rename it to main.tscs - this is the main scene
3. create texture rect for bg
4. put the image for texture in texture rect
	a. filter: nearest
	b. stretch mode: tile

Creating tiles
1. add child node TileMap
	a. configure TileSet: new TileSet
	b. drag the terrain in the bottom tab -> tiles, tileset
	c. auto create tiles in the atlas - auto split tileset
	d. select a tile then long press in the tilemap
	e. node2d -> transform -> scale x = 3; scale y = 3
	f. Canvas Item -> filter -> nearest
2. Make now the tiles in your game
	
	
Create Your Character
1. Create characterbody2d as direct child of parent Node
2. Create sprite 2d as child of characterbody2d
3. Create collisionshape2d as child of characterbody2d -> configure the shape and put it in your character
4. save the characterbody2d as a subscene... then... it is now a whole object scene that you can double click to open in a new tab

Make your character move
1. Create script for the chracacterbody2d  subscene (root) - [there is default movement here... arrow keys l+r then spacebar]

Collision
1. click your tilemap -> physics layer ->  add element -> tileset in bottom tab -> physics layer 0 -> paint all img with collision

animate your character
1. change the sprite 2d type to animatedsprite2d 
2. click new sprite frame
3. at bottom panel, click add frame from sprite sheet
4. change fps and add more animations
5. click autoplay on load on left of fps of default animation -- we'll play other animations later 

turn left or right
1. notice the offset flip H property
2. do this code: 
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
- this check if player is going left and inverts the image

changing animation
	if (velocity.x > 1 || velocity.y < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
		
changing gravity 
	- project settings -> general -> physics

chaning input maps
	- project settings -> input maps
