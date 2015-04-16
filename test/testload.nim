import assimp, os

var file = "cube.ply"
if paramCount() == 1: file = paramStr(1)

let scene = aiImportFile(file, 0)
assert(not scene.isNil)
assert(not scene.meshes.isNil)
echo scene.meshCount, " meshes"
let mesh = scene.meshes[0]

echo mesh.faceCount, " faces"
var indices = newSeq[cint](mesh.faceCount * 3)
for i in 0.. <mesh.faceCount:
    let face = mesh.faces[i]
    indices[i * 3 + 0] = face.indices[0]
    indices[i * 3 + 1] = face.indices[1]
    indices[i * 3 + 2] = face.indices[2]
