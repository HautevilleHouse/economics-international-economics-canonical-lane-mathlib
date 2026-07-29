import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalEconomicsCanonicalLaneLean

structure SolowGrowthModel where
  capitalPerWorker : ℝ -> ℝ
  outputPerWorker : ℝ -> ℝ
  savingsRate : ℝ
  depreciationRate : ℝ
  populationGrowthRate : ℝ
  steadyStateCapital : ℝ
  steadyStateOutput : ℝ
  dynamicsConverge : Prop

structure SolowGrowthEvidence (M : SolowGrowthModel) where
  steadyStateCapitalClosed : M.steadyStateCapital = (M.savingsRate / (M.depreciationRate + M.populationGrowthRate)) ^ (1/(1-?))
  steadyStateOutputClosed : M.steadyStateOutput = (M.steadyStateCapital)^(?)
  dynamicsConvergeClosed : M.dynamicsConverge

def SolowGrowthClosed (M : SolowGrowthModel) : Prop :=
  M.dynamicsConverge

theorem solow_growth_closed_from_evidence (M : SolowGrowthModel) (E : SolowGrowthEvidence M) : SolowGrowthClosed M := by
  exact E.dynamicsConvergeClosed

end EconomicsInternationalEconomicsCanonicalLaneLean
end HautevilleHouse