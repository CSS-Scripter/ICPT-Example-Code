package nl.hsleiden.icpt.opdrachten

import scala.annotation.tailrec

object Immutability {

  /**
   * Programmeer de faculteit.
   * Dit is door de reeks optellend met elkaar te vermenigvuldigen tot 2.
   * Bijvoorbeeld n = 5
   * Bonuspunten als je tailrecursie gebruikt
   * 5 * 4 * 3 * 2 => Antwoord  120
   * @param n
   * @return
   */
  def faculty(n: Int): Int = {
    if (n == 2) {
      n
    } else {
      n * faculty(n-1)
    }
  }

  /**
   * Met deze functie maken we onze eigen machten verheffen. Java (Math.pow)
   * Doe dit recursief.
   * * Bonuspunten. Zorg dat deze functie geannoteerd kan worden met @tailrec
   * @param n
   * @return
   */
   @tailrec
  def pow(lh: Int, rh: Int, acc: Int = 1): Double = {
    if (rh == 0) {
      acc
    } else {
      pow(lh, rh-1, acc * lh)
    }
  }

}
