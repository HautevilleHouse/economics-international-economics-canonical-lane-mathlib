import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure TradeEquilibriumPackage where
  endowment : Type u
  preferences : Type v
  prices : Type w
  excessDemand : Prop
  walrasLaw : Prop
  competitiveEquilibrium : Prop

structure TradeEquilibriumEvidence (T : TradeEquilibriumPackage) where
  excessDemandClosed : T.excessDemand
  walrasLawClosed : T.walrasLaw
  competitiveEquilibriumClosed : T.competitiveEquilibrium

def TradeEquilibriumClosed (T : TradeEquilibriumPackage) : Prop :=
  T.excessDemand ∧ T.walrasLaw ∧ T.competitiveEquilibrium

theorem trade_equilibrium_closed_from_evidence (T : TradeEquilibriumPackage)
    (E : TradeEquilibriumEvidence T) : TradeEquilibriumClosed T := by
  exact And.intro E.excessDemandClosed (And.intro E.walrasLawClosed E.competitiveEquilibriumClosed)

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse
