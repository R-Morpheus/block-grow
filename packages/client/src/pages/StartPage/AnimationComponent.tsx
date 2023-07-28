import { useState } from 'react'
import { useSpring, animated } from '@react-spring/three'
import { MeshDistortMaterial } from '@react-three/drei'
import { Canvas } from '@react-three/fiber'

const AnimatedMeshDistortMaterial = animated(MeshDistortMaterial)

const MyScene = () => {
  const [clicked, setClicked] = useState(false)

  const springs = useSpring({
    color: clicked ? '#3c3d3f' : '#9a9a9a',
  })

  const handleClick = () => setClicked(s => !s)

  return (
    <mesh onClick={handleClick}>
      <sphereGeometry args={[1.5, 20, 32]} />
      <AnimatedMeshDistortMaterial
        speed={5}
        distort={0.5}
        color={springs.color}
      />
    </mesh>
  )
}

export default function AnimationComponent() {
  return (
    <Canvas>
      <ambientLight intensity={0.8} />
      <pointLight intensity={1} position={[10, 10, 10]} />
      <MyScene/>
    </Canvas>
  )
}