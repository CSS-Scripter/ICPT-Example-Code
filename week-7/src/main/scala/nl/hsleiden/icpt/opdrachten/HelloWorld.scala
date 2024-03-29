package nl.hsleiden.icpt.opdrachten

/**
 * Test de methodes in de test folder.
 */
object HelloWorld {


  /**
   * Maak de functie af.
   * Geef terug hallo <naam>
   * @param name
   * @return
   */
  def appendHi(name: String): String = {
    "hallo " + name
  }

  /**
   * Maak de functie af.
   * Maak het getal n negatief.
   * Als het getal al negatief is, hou het getal dan negatief
   * bijv: n = 1 => -1, n = -1 => -1
   * @param n
   * @return
   */
  def maakNegatief(n: Int): Int = {
   if (n < 0) {
    n
   } else {
    -n
   }
  }

  /**
   * Maak de functie af.
   * Maak het getal n positief.
   * Als het getal al positief is, hou het getal dan positief
   * bijv: n = -1 => 1, n = 1 => 1
   *
   * @param n
   * @return
   */
  def maakPositief(n: Int): Int = {
    -maakNegatief(n)
  }

  /**
   * Maak de functie af.
   * Vermenigvuldig lh met rh, zolang geen van beide 0 is.
   * Indien een van beide 0 is. Geef 1 terug
   * @param lh
   * @param rh
   * @return
   */
  def vermenigvuldigGeenNul(lh: Int, rh: Int): Int = {
    if (lh == 0 || rh == 0) {
      1
    } else {
      lh * rh
    }
  }

  def main(args: Array[String]) = {
    println("Hallo Wereld")
  }
}