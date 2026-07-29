import EconomicsInternationalEconomicsCanonicalLaneLean.ConsumerTheory

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure ArrowDebreuEquilibriumPackage {G : CommoditySpacePackage}
    {P : PriceSystemPackage G} (C : ConsumerTheoryPackage P) where
  marketClearing : Prop
  utilityMaximization : Prop
  profitMaximization : Prop
  walrasLaw : Prop

structure ArrowDebreuEquilibriumEvidence {G : CommoditySpacePackage}
    {P : PriceSystemPackage G} {C : ConsumerTheoryPackage P}
    (E : ArrowDebreuEquilibriumPackage C) where
  marketClearingClosed : E.marketClearing
  utilityMaximizationClosed : E.utilityMaximization
  profitMaximizationClosed : E.profitMaximization
  walrasLawClosed : E.walrasLaw

def ArrowDebreuEquilibriumClosed {G : CommoditySpacePackage}
    {P : PriceSystemPackage G} {C : ConsumerTheoryPackage P}
    (E : ArrowDebreuEquilibriumPackage C) : Prop :=
  E.marketClearing ∧ E.utilityMaximization ∧
  E.profitMaximization ∧ E.walrasLaw

theorem arrow_debreu_equilibrium_closed_from_evidence
    {G : CommoditySpacePackage} {P : PriceSystemPackage G}
    {C : ConsumerTheoryPackage P} (E : ArrowDebreuEquilibriumPackage C)
    (Ev : ArrowDebreuEquilibriumEvidence E) : ArrowDebreuEquilibriumClosed E := by
  exact And.intro Ev.marketClearingClosed
    (And.intro Ev.utilityMaximizationClosed
      (And.intro Ev.profitMaximizationClosed Ev.walrasLawClosed))

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse
