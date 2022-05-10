import java.io.File
import kotlin.math.pow
import kotlin.math.sqrt


fun parseLine(normals: List<Normal>, line: String): List<Normal> =
  when {
    line.startsWith("facet normal") -> addNormal(normals,line)
    line.startsWith("vertex") -> addVertex(normals,line)
    else -> normals
  }

fun addNormal(normals: List<Normal>, line: String): List<Normal> =
  normals + Normal(line.replace("facet normal","").trim().split(" ").map { it.toDouble() })

fun addVertex(normals: List<Normal>, line: String): List<Normal> =
  normals.mapIndexed { i,normal -> if (i == normals.lastIndex) Normal(normal.vector,normal.vertices + listToVertex(line.replace("vertex","").trim().split(" ").map { it.toDouble() })) else normal }

fun listToVertex(coords: List<Double>) = Vertex(coords[0],coords[1],coords[2])

fun normalizedDistance(v: Vertex) = distance(Vertex(v.x, v.y, v.z*5))
fun distance(v: Vertex) = sqrt(v.x.pow(2) + v.y.pow(2) + v.z.pow(2))

File(args[0]).useLines {
  lines -> lines.map { it.trim() }.fold(listOf<Normal>()) { normals, line -> parseLine(normals, line) }
}  
.forEach { 
 it.vertices.forEach { v -> println("${ distance(v) } -- ${ normalizedDistance(v) }") } 
 
}
  



data class Normal(val vector: List<Double>, val vertices: List<Vertex> = listOf<Vertex>())
data class Vertex(val x: Double, val y: Double, val z: Double)
//data class Vertex(val position: List<Double>)