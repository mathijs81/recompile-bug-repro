import java.nio.charset.Charset

class HelloWorld {
    init {
        println(
            javaClass.classLoader.getResourceAsStream("resource_test").readBytes()
                .toString(Charsets.UTF_8)
        )
    }

    fun calculateSomething(): Int {
        return 123
    }
}

fun main() {
    HelloWorld()
}