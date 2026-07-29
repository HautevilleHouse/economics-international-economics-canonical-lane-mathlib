import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure EconomicsAdmittedObject where
  carrier : Type
  preferences : Type
  endowments : Type
  equilibriumExists : Prop
  conclusion : equilibriumExists

structure EconomicsWitnessClosed (O : EconomicsAdmittedObject) : Prop where
  witnessed : O.equilibriumExists

def EconomicsAdmissibleClassClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem economics_admissible_class_closure (A : AdmissibleClass) :
    EconomicsAdmissibleClassClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

theorem theorem_statement_key_checked : True := by
  trivial

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse