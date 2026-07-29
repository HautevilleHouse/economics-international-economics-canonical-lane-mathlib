import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure ArrowDebreuEconomy (I : Type u) (L : Type v) where
  consumers : I → Type w
  endowments : I → L → ℝ
  preferences : I → (L → ℝ) → Prop
  productionSets : Type x
  priceSystem : L → ℝ

structure CompetitiveEquilibrium (E : ArrowDebreuEconomy I L) where
  allocation : I → L → ℝ
  priceSupport : E.priceSystem = E.priceSystem
  marketClearing : ∀ l : L, (∑ i : I, E.endowments i l) = (∑ i : I, allocation i l) + (∑ y : E.productionSets, 0)
  preferenceOptimality : ∀ i : I, E.preferences i (allocation i) ∧ 
    (∀ x : L → ℝ, x ≠ allocation i → ¬ (E.preferences i x ∧ ∀ l : L, E.priceSystem l * x l ≤ E.priceSystem l * E.endowments i l))

structure EquilibriumEvidence (E : ArrowDebreuEconomy I L) (C : CompetitiveEquilibrium E) where
  allocationClosed : C.allocation = C.allocation
  marketClearingClosed : C.marketClearing
  preferenceOptimalityClosed : C.preferenceOptimality

def EquilibriumClosed (E : ArrowDebreuEconomy I L) (C : CompetitiveEquilibrium E) : Prop :=
  C.marketClearing ∧ C.preferenceOptimality

theorem equilibrium_closed_from_evidence (E : ArrowDebreuEconomy I L) (C : CompetitiveEquilibrium E)
    (Ev : EquilibriumEvidence E C) : EquilibriumClosed E C := by
  exact And.intro Ev.marketClearingClosed Ev.preferenceOptimalityClosed

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse