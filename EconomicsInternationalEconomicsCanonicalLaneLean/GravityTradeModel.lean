import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure GravityTradeData where
  countries : Nat
  gdp : Vector ℝ countries
  distanceMatrix : Matrix ℝ countries countries
  bilateralTradeFlows : Matrix ℝ countries countries
  tradeBarriers : Matrix ℝ countries countries

define gravityEquation (data : GravityTradeData) : Matrix ℝ data.countries data.countries := by
  let T : Matrix ℝ data.countries data.countries := ...
  exact T

define gravityResiduals (data : GravityTradeData) : ℝ := ...

structure GravityTradeEvidence (A : AdmissibleClass) where
  data : GravityTradeData
  fittedFlows : Matrix ℝ data.countries data.countries
  residuals : ℝ
  closureBridge : bridgeClosed A
  closureGate : gateClosed A

theorem gravity_model_fits (A : AdmissibleClass) : bridgeClosed A → gateClosed A → ... := by
  intro hBridge hGate
  exact ...

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse