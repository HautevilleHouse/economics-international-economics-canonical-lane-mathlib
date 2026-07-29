import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure HeckscherOhlinModel where
  countries : Type u
  goods : Type v
  factors : Type w
  endowment : countries -> factors -> ℝ
  production : countries -> goods -> ℝ
  factorIntensity : goods -> factors -> ℝ
  tradePattern : Prop
  factorPriceEqualization : Prop
  heckscherOhlinPrediction : Prop

structure HeckscherOhlinEvidence (M : HeckscherOhlinModel) where
  tradePatternClosed : M.tradePattern
  factorPriceEqualizationClosed : M.factorPriceEqualization
  heckscherOhlinPredictionClosed : M.heckscherOhlinPrediction

def HeckscherOhlinClosed (M : HeckscherOhlinModel) : Prop :=
  M.tradePattern ∧ M.factorPriceEqualization ∧ M.heckscherOhlinPrediction

theorem heckscher_ohlin_closed_from_evidence (M : HeckscherOhlinModel) (E : HeckscherOhlinEvidence M) : HeckscherOhlinClosed M := by
  exact And.intro E.tradePatternClosed (And.intro E.factorPriceEqualizationClosed E.heckscherOhlinPredictionClosed)

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse