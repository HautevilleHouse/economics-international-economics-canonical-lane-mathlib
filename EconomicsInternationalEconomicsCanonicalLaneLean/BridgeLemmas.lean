import EconomicsInternationalEconomicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EconomicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse
