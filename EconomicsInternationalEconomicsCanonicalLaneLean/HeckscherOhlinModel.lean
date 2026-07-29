import EconomicsInternationalEconomicsCanonicalLaneLean.FactorEndowment

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure HeckscherOhlinPackage {F : FactorEndowmentPackage}
    (T : TechnologyPackage F) where
  factorAbundance : Prop
  factorIntensity : Prop
  tradePattern : Prop
  factorPriceEqualization : Prop

structure HeckscherOhlinEvidence {F : FactorEndowmentPackage}
    {T : TechnologyPackage F} (H : HeckscherOhlinPackage T) where
  factorAbundanceClosed : H.factorAbundance
  factorIntensityClosed : H.factorIntensity
  tradePatternClosed : H.tradePattern
  factorPriceEqualizationClosed : H.factorPriceEqualization

def HeckscherOhlinClosed {F : FactorEndowmentPackage}
    {T : TechnologyPackage F} (H : HeckscherOhlinPackage T) : Prop :=
  H.factorAbundance ∧ H.factorIntensity ∧
  H.tradePattern ∧ H.factorPriceEqualization

theorem heckscher_ohlin_closed_from_evidence
    {F : FactorEndowmentPackage} {T : TechnologyPackage F}
    (H : HeckscherOhlinPackage T) (Ev : HeckscherOhlinEvidence H) :
    HeckscherOhlinClosed H := by
  exact And.intro Ev.factorAbundanceClosed
    (And.intro Ev.factorIntensityClosed
      (And.intro Ev.tradePatternClosed Ev.factorPriceEqualizationClosed))

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse
