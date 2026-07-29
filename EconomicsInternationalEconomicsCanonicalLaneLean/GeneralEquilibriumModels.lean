import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure ArrowDebreuEconomy where
  goods : Nat
  households : Nat
  firms : Nat
  endowments : Vector ℝ (households × goods)
  preferences : Vector (ℝ → ℝ) households
  productionSets : Vector (Set ℝ) firms
  ownershipShares : Vector ℝ (households × firms)

define initialAllocation (E : ArrowDebreuEconomy) : Vector ℝ (E.households × E.goods) :=
  E.endowments

structure PriceVector (g : Nat) where
  prices : Vector ℝ g
  positivity : ∀ i, prices i > 0

structure ExcessDemand (E : ArrowDebreuEconomy) where
  demands : E.households → Vector ℝ E.goods
  supplies : E.firms → Vector ℝ E.goods

define marketClearingCondition (E : ArrowDebreuEconomy) (p : PriceVector E.goods) : Prop :=
  let totalEndowments := ∑_{h} E.endowments h
  let totalProduction := ∑_{f} E.productionSets f
  totalEndowments + totalProduction = totalDemand

structure EquilibriumState where
  economy : ArrowDebreuEconomy
  price : PriceVector economy.goods
  excessDemand : ExcessDemand economy
  marketClearing : marketClearingCondition economy price
  utilityMaximization : ∀ h, utilityMaximizing household h given price
  profitMaximization : ∀ f, profitMaximizing firm f given price

define utilityMaximizing (E : ArrowDebreuEconomy) (h : Fin E.households) (p : PriceVector E.goods) : Prop :=
  let budget := ∑_{g} p.prices[g] * E.endowments[h][g]
  let consumptionSet := {x : Vector ℝ E.goods | ∑_{g} p.prices[g] * x[g] ≤ budget ∧ ∀ g, x[g] ≥ 0}
  ∀ x ∈ consumptionSet, E.preferences[h] x ≤ E.preferences[h] (E.excessDemand.demands h)

define profitMaximizing (E : ArrowDebreuEconomy) (f : Fin E.firms) (p : PriceVector E.goods) : Prop :=
  let productionSet := E.productionSets[f]
  let y ∈ productionSet
  ∀ y' ∈ productionSet, Σ g p.prices[g] * y'[g] ≤ Σ g p.prices[g] * y[g]

structure ArrowDebreuEvidence (A : AdmissibleClass) where
  economy : ArrowDebreuEconomy
  equilibriumState : EquilibriumState
  closureBridge : bridgeClosed A
  closureGate : gateClosed A

define EquilibriumExistence (A : AdmissibleClass) : Prop :=
  ∃ (E : ArrowDebreuEconomy), ∃ (p : PriceVector E.goods), EquilibriumState.mk E p ...

theorem arrow_debreu_existence (A : AdmissibleClass) : bridgeClosed A → EquilibriumExistence A := by
  intro h
  exact ...

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse