import EconomicsInternationalEconomicsCanonicalLaneLean.CommoditySpace

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure ConsumerTheoryPackage {G : CommoditySpacePackage}
    (P : PriceSystemPackage G) where
  preferenceRelation : Prop
  utilityFunction : Prop
  budgetConstraint : Prop
  demandFunction : Prop

structure ConsumerTheoryEvidence {G : CommoditySpacePackage}
    {P : PriceSystemPackage G} (C : ConsumerTheoryPackage P) where
  preferenceRelationClosed : C.preferenceRelation
  utilityFunctionClosed : C.utilityFunction
  budgetConstraintClosed : C.budgetConstraint
  demandFunctionClosed : C.demandFunction

def ConsumerTheoryClosed {G : CommoditySpacePackage}
    {P : PriceSystemPackage G} (C : ConsumerTheoryPackage P) : Prop :=
  C.preferenceRelation ∧ C.utilityFunction ∧
  C.budgetConstraint ∧ C.demandFunction

theorem consumer_theory_closed_from_evidence
    {G : CommoditySpacePackage} {P : PriceSystemPackage G}
    (C : ConsumerTheoryPackage P) (Ev : ConsumerTheoryEvidence C) :
    ConsumerTheoryClosed C := by
  exact And.intro Ev.preferenceRelationClosed
    (And.intro Ev.utilityFunctionClosed
      (And.intro Ev.budgetConstraintClosed Ev.demandFunctionClosed))

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse
