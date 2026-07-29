import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure ParetoOptimumState where
  economy : ArrowDebreuEconomy
  allocation : economy.consumers -> Fin economy.commodities -> ℝ
  feasible : Prop
  noBetterAllocation : Prop

def ParetoCriterion (E : ArrowDebreuEconomy) (alloc : E.consumers -> Fin E.commodities -> ℝ) : Prop :=
  (∀ i, alloc i ∈ feasibleConsumptionSet E i) ∧
  (∀ alloc', (∀ i, alloc' i ∈ feasibleConsumptionSet E i) →
    (∀ i, ¬ (preferredSet (E.preferences i) (alloc i) alloc' i)) ∧
    (∃ i, preferredSet (E.preferences i) (alloc' i) (alloc i)) → False)

structure WelfareTheoremsEvidence (E : ArrowDebreuEconomy) where
  firstWelfareTheorem : ∀ (alloc : E.consumers -> Fin E.commodities -> ℝ),
    WalrasianEquilibrium E → ParetoCriterion E alloc
  secondWelfareTheorem : ∀ (alloc : E.consumers -> Fin E.commodities -> ℝ),
    ParetoCriterion E alloc → (∃ (p : Fin E.commodities -> ℝ) (transfers : E.consumers -> ℝ),
      WalrasianEquilibriumWithTransfers E p alloc transfers)
  welfareClosed : firstWelfareTheorem ∧ secondWelfareTheorem

def GeneralEquilibriumWelfareClosed (E : ArrowDebreuEconomy) : Prop :=
  ∀ (alloc : E.consumers -> Fin E.commodities -> ℝ),
    (WalrasianEquilibrium E → ParetoCriterion E alloc) ∧
    (ParetoCriterion E alloc → ∃ (p : Fin E.commodities -> ℝ) (transfers : E.consumers -> ℝ),
      WalrasianEquilibriumWithTransfers E p alloc transfers)

theorem general_equilibrium_welfare_closed_from_evidence (E : ArrowDebreuEconomy)
    (ev : WelfareTheoremsEvidence E) : GeneralEquilibriumWelfareClosed E :=
  λ alloc => (ev.firstWelfareTheorem alloc, ev.secondWelfareTheorem alloc)

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse