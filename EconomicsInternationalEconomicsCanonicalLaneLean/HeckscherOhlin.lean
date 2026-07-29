import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure HeckscherOhlinPackage where
  factorEndowments : Type u
  commodityPrices : Type v
  factorPriceEqualization : Prop
  tradePatternDetermined : Prop
  rybczynskiEffect : Prop

structure HeckscherOhlinEvidence (H : HeckscherOhlinPackage) where
  factorPriceEqualizationClosed : H.factorPriceEqualization
  tradePatternDeterminedClosed : H.tradePatternDetermined
  rybczynskiEffectClosed : H.rybczynskiEffect

def HeckscherOhlinClosed (H : HeckscherOhlinPackage) : Prop :=
  H.factorPriceEqualization ∧ H.tradePatternDetermined ∧ H.rybczynskiEffect

theorem heckscher_ohlin_closed_from_evidence (H : HeckscherOhlinPackage)
    (E : HeckscherOhlinEvidence H) : HeckscherOhlinClosed H := by
  exact And.intro E.factorPriceEqualizationClosed (And.intro E.tradePatternDeterminedClosed E.rybczynskiEffectClosed)

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse
