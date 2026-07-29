import EconomicsInternationalEconomicsCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure EconomicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EconomicsAdmittedObject where
  space : EconomicsSpace
  closedEconomy : Prop
  generalEquilibrium : Prop
  tradeModel : Type
  tradeTopology : TopologicalSpace tradeModel
  homeomorphicToFreeTrade : Prop
  conclusion : homeomorphicToFreeTrade

def EconomicsWitnessClosed (O : EconomicsAdmittedObject) : Prop :=
  O.homeomorphicToFreeTrade

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse
