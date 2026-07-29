import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure AssetPricingModel where
  assetPrice : ℝ -> ℝ
  dividend : ℝ -> ℝ
  discountFactor : ℝ
  riskFreeRate : ℝ
  pricingEquationHolds : Prop
  martingaleProperty : Prop

structure AssetPricingEvidence (M : AssetPricingModel) where
  pricingEquationHoldsClosed : M.pricingEquationHolds
  martingalePropertyClosed : M.martingaleProperty

def AssetPricingClosed (M : AssetPricingModel) : Prop :=
  M.pricingEquationHolds ∧ M.martingaleProperty

theorem asset_pricing_closed_from_evidence (M : AssetPricingModel) (E : AssetPricingEvidence M) : AssetPricingClosed M := by
  exact And.intro E.pricingEquationHoldsClosed E.martingalePropertyClosed

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse