import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure GravityModelPackage where
  bilateralTradeFlows : Type u
  economicSize : Type v
  tradeCosts : Type w
  poissonPseudoMaxLikelihood : Prop
  multilateralResistance : Prop
  structuralGravityEstimated : Prop

structure GravityModelEvidence (G : GravityModelPackage) where
  poissonPseudoMaxLikelihoodClosed : G.poissonPseudoMaxLikelihood
  multilateralResistanceClosed : G.multilateralResistance
  structuralGravityEstimatedClosed : G.structuralGravityEstimated

def GravityModelClosed (G : GravityModelPackage) : Prop :=
  G.poissonPseudoMaxLikelihood ∧ G.multilateralResistance ∧ G.structuralGravityEstimated

theorem gravity_model_closed_from_evidence (G : GravityModelPackage)
    (E : GravityModelEvidence G) : GravityModelClosed G := by
  exact And.intro E.poissonPseudoMaxLikelihoodClosed (And.intro E.multilateralResistanceClosed E.structuralGravityEstimatedClosed)

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse
