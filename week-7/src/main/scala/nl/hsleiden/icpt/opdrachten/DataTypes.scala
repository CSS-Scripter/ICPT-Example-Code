package nl.hsleiden.icpt.opdrachten

import scala.annotation.tailrec

sealed trait Dier

// Sum type en product type.
case class Kat(naam: String, leeftijd: Int) extends Dier
case class Hond(naam: String, ras: String, leeftijd: Int) extends Dier

/**
 * Gebruik voor de gehele klasse pattern matching en recursie
 * Bonus punten als je tail recursie kan toevoegen
 */
object DataTypes {

  /**
   * Bereken hoeveel honden in een gegeven sequentie zitten.
   * Gebruik hiervoor pattern matching en recursie
   *
   * @param dieren => De lijst met dieren
   * @return Hoeveelheid honden die hierin zitten
   */
  @tailrec
  def hoeveelheidHonden(dieren: Seq[Dier], acc: Int = 0): Int = dieren match {
    case Seq() => acc
    case Hond(_, _, _)::tail => hoeveelheidHonden(tail, acc + 1)
    case _::tail => hoeveelheidHonden(tail, acc)
  }

  /**
   * Tel hoeveel honden er in het lijstje zitten die 1 zijn.
   *
   * @param dier
   * @return
   */
  @tailrec
  def hoeveelHeidHondenZijnEen(dieren: Seq[Dier], acc: Int = 0) : Int = dieren match {
    case Seq() => acc
    case Hond(_, _, 1)::tail => hoeveelHeidHondenZijnEen(tail, acc + 1)
    case _::tail => hoeveelHeidHondenZijnEen(tail, acc)
  }

  /**
   * Tel de totale leeftijd van alle honden op.
   * @param dier
   * @return
   */
  @tailrec
  def totaleLeeftijdHonden(dieren: Seq[Dier], acc: Int = 0): Int = dieren match {
    case Seq() => acc
    case Hond(_, _, age)::tail => totaleLeeftijdHonden(tail, acc + age)
    case _::tail => totaleLeeftijdHonden(tail, acc)
  }

  /**
   * Reken de leeftijd van alle labradors bij elkaar!
   *
   * @param dier
   * @param resultaat
   * @return
   */
   @tailrec
  def totaleLeeftijdLabradors(dieren: Seq[Dier], acc: Int = 0): Int = dieren match {
    case Seq() => acc
    case Hond(_, "Labrador", age)::tail => totaleLeeftijdLabradors(tail, acc + age)
    case _::tail => totaleLeeftijdLabradors(tail, acc)
  }
}


