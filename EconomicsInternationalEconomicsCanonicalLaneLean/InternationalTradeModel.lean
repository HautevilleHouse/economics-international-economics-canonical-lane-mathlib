import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure HeckscherOhlinEconomy where
  countries : Type u
  factors : Nat
  goods : Nat
  endowments : countries -> Fin factors -> ℝ
  technologies : countries -> Fin goods -> Fin factors -> ℝ
  preferences : countries -> (Fin goods -> ℝ) -> Prop

def FreeTradeEquilibrium (E : HeckscherOhlinEconomy) : Prop :=
  ∃ (p : Fin E.goods -> ℝ) (w : Fin E.factors -> ℝ)
    (alloc : E.countries -> Fin goods -> ℝ)
    (production : E.countries -> Fin goods -> ℝ),
    (∀ c, ∀ y, y ∈ productionSet E c → p • y ≤ p • production c) ∧
    (∀ c, ∀ x, x ∈ preferredSet (E.preferences c) (alloc c) → p • x > p • alloc c) ∧
    (∀ c, ∀ f, factorDemand c f p w = E.endowments c f) ∧
    (∀ g, (∑ c, alloc c g) = (∑ c, production c g))

structure InternationalTradeEvidence (E : HeckscherOhlinEconomy) where
  tradeEquilibriumExists : FreeTradeEquilibrium E
  tradeEquilibriumClosed : tradeEquilibriumExists

def InternationalTradeClosed (E : HeckscherOhlinEconomy) : Prop :=
  FreeTradeEquilibrium E

theorem international_trade_closed_from_evidence (E : HeckscherOhlinEconomy)
    (ev : InternationalTradeEvidence E) : InternationalTradeClosed E :=
  ev.tradeEquilibriumExists

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse