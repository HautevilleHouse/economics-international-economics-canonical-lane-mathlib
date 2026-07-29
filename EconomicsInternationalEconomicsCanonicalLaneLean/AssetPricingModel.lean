import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure FinancialMarket where
  states : Type u
  assets : Nat
  returns : Fin assets -> states -> ℝ
  prices : Fin assets -> ℝ
  agentUtility : ℝ -> ℝ
  initialWealth : ℝ

def ArbitrageFree (M : FinancialMarket) : Prop :=
  ∄ (θ : Fin M.assets -> ℝ), (∀ s, (∑ a, θ a * M.returns a s) ≥ 0) ∧
    (∃ s, (∑ a, θ a * M.returns a s) > 0) ∧ (∑ a, θ a * M.prices a) ≤ 0

def RiskNeutralMeasure (M : FinancialMarket) : Prop :=
  ∃ (π : M.states -> ℝ), (∀ s, π s ≥ 0) ∧ (∑ s, π s = 1) ∧
    (∀ a, M.prices a = (∑ s, π s * M.returns a s))

structure AssetPricingEvidence (M : FinancialMarket) where
  arbitrageFreeImpliesRNMeasure : ArbitrageFree M → RiskNeutralMeasure M
  rnMeasureImpliesArbitrageFree : RiskNeutralMeasure M → ArbitrageFree M
  equivalenceClosed : arbitrageFreeImpliesRNMeasure ∧ rnMeasureImpliesArbitrageFree

def AssetPricingClosed (M : FinancialMarket) : Prop :=
  ArbitrageFree M ↔ RiskNeutralMeasure M

theorem asset_pricing_closed_from_evidence (M : FinancialMarket)
    (ev : AssetPricingEvidence M) : AssetPricingClosed M :=
  ⟨ev.arbitrageFreeImpliesRNMeasure, ev.rnMeasureImpliesArbitrageFree⟩

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse