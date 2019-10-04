--Simple Example
print("Starting Lua for Simple Example")

-- CameraPosX = -3.0
-- CameraPosY = 1.0
-- CameraPosZ = 0.0

-- CameraDirX = 1.0
-- CameraDirY = -0.0
-- CameraDirZ = -0.0

CameraPosX = -3.0
CameraPosY = 1.0
CameraPosZ = 0.0

CameraDirX = 0.0
CameraDirY = 0.0
CameraDirZ = 1.0

CameraUpX = 0.0
CameraUpY = 1.0
CameraUpZ = 0.0

animatedModels = {}
velModel = {}
rotYVelModel = {}

function frameUpdate(dt)
  for modelID,v in pairs(animatedModels) do
    --print("ID",modelID)
    local vel = velModel[modelID]
    if vel then 
      translateModel(modelID,dt*vel[1],dt*vel[2],dt*vel[3])
    end

    local rotYvel = rotYVelModel[modelID]
    if rotYvel then 
      --rotateModel(modelID,rotYvel*dt, 0, 1, 0)
    end

  end
end

function keyHandler(keys)
  if keys.left then
    CameraDirX = CameraDirX * math.cos(0.05) + CameraDirZ * math.sin(0.05)
    CameraDirZ = -CameraDirX * math.sin(0.05) + CameraDirZ * math.cos(0.05)
  end
  if keys.right then
    CameraDirX = CameraDirX * math.cos(0.05) - CameraDirZ * math.sin(0.05)
    CameraDirZ = CameraDirX * math.sin(0.05) + CameraDirZ * math.cos(0.05)
  end
  if keys.up then
    CameraPosX = CameraPosX + CameraDirX * 0.2
    CameraPosZ = CameraPosZ + CameraDirZ * 0.2
  end
  if keys.down then
    CameraPosX = CameraPosX - CameraDirX * 0.2
    CameraPosZ = CameraPosZ - CameraDirZ * 0.2
  end
  if keys.shift then
    CameraPosY = CameraPosY - 0.1
  end
  if keys.space then
    CameraPosY = CameraPosY + 0.1
  end
end

numObjects = 50
for i=0,numObjects,1 do
  for j=0,numObjects,1 do
    teapotID = addModel("Teapot",i,0,j)
    setModelMaterial(teapotID,"Shiny Red Plastic")
  end
end
--setModelMaterial(teapotID,"Steel")
animatedModels[teapotID] = true
rotYVelModel[teapotID] = 1

floorID = addModel("FloorPart",0,0,0)
placeModel(floorID,0,-.02,0)
scaleModel(floorID,3,1,3)
setModelMaterial(floorID,"Gold")

dinoID = addModel("Dino",0,0,-.15)
