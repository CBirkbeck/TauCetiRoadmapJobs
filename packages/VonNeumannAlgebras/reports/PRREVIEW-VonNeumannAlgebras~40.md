# Review of VonNeumannAlgebras (pull request #1041 at 44dcd32)

**Verdict:** needs changes

This is an incremental re-review of the 38 lines of `TauCetiRoadmap/VonNeumannAlgebras/README.md` changed since `8b1713a`; `Suggested.lean` is byte-identical. The change repairs R02 and R03 of the previous review correctly and introduces no new problem. One finding remains, the carried R01 (P3, not blocking). The gate, the dependency check and the elaboration pass.

## R01 (P3) — The branch is still at the old pins and conflicts with the roadmap on main

**Location:**
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:231–326`, the "From Tau Ceti" contract, which ends "Each is used as stated at the pin."
- `lake-manifest.json`, which this head leaves unchanged.

**Claim:** Main already carries this roadmap folder. This branch adds the same folder from an older merge base, so it cannot merge as it stands, and the supplier contract is true only at main's Tau Ceti pin, not at the pin this branch builds against.

**Witness:**
- `lake-manifest.json` at this head pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main (`3090489`) pins `2fd255d9` and `1b1ccf4b`.
- `git merge-tree --write-tree origin/main HEAD` reports "CONFLICT (add/add)" for `README.md` and `Suggested.lean` of this folder.
- `TauCeti/LinearAlgebra/Matrix/Trace/Duality.lean` (cited for `LinearMap.existsUnique_trace_mul_eq`) is absent at `a91d3aaf` and present at `2fd255d9`; the previous review counted 15 such files.

**Repair:**
1. Merge main into the branch, or rebase onto it.
2. Resolve the two add/add conflicts in favour of this head's `README.md` and `Suggested.lean`.
3. Keep main's `PROGRESS.md`, `STATUS.md`, `metadata.toml` and `lake-manifest.json`.
4. Re-run the gate and `lake env lean` at main's pins. The three names this head corrected already resolve there (see below), but only the build at that pin decides whether `Suggested.lean` elaborates.
5. Update the description, which still calls this branch a "historical staged snapshot" and sends review to #889, which is merged.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; the merge with main still conflicts add/add on both files. Carried above as R01.
- R02 — repaired: `README.md:4948–4975` adds one bullet each for FactorRigidity, Subfactors, NoncommutativeIntegration, FreeProbability, HilbertModules, NoncommutativeGeometry, QuantumGroups and PseudodifferentialOperators, naming the layers consumed.
- R03 — repaired: `:874` and `:876` read `MeasureTheory.measurePreserving_piFinTwo`; `:3727` reads `TauCeti.PontryaginDual.continuous_coe_eval_const`.

## Verified sound

**Gate, dependencies, scope**
- I ran `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main` on this head: every check reports 0, then `OK`, exit 0.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty; `git diff --stat 8b1713a HEAD` shows only `README.md` (33 insertions, 5 deletions).
- The dependency check exits 0 with no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 235 roadmaps, 2265 edges, 0 problem(s)
  ```

  The eight new bullets are under `## Downstream consumers`; they add no supplier edge for this roadmap.
- `roadmaps overlaps`: no other open pull request changes this roadmap, no cited id is dropped, and no cited id is defined only by an open revision. The ownership comparison with the closest open roadmaps (#1137, #1771, #1015, #888) is unchanged from the previous report, since no owned object changed.

**The changed passages, one by one**
- **`:874`, `:876` (V2.RectangularL2).** `MeasureTheory/Constructions/Pi.lean` declares `theorem measurePreserving_piFinTwo` at line 849 (branch pin `6b7abb3c`) and line 850 (main pin `1b1ccf4b`), after `end Measure` (657 / 658) and inside `namespace MeasureTheory` (67). The name `MeasureTheory.measurePreserving_piFinTwo` is exact at both pins. `Measure.prod_eq` is at `MeasureTheory/Measure/Prod.lean:615` with both `[SigmaFinite]` hypotheses, as the sentence uses it.
- **`:3092` (V10 arithmetic Hecke pair).** `structure Module.Basis.SmithNormalForm` is at `LinearAlgebra/FreeModule/PID.lean:407` (branch pin) and `:383` (main pin). The previous `Basis.SmithNormalForm` resolved only under `open Module`; the new name is exact at both pins.
- **`:3727` (V11.DoubleDualEmbedding).** `TauCeti/Analysis/Fourier/Pontryagin/DualEval.lean:29` declares `continuous_coe_eval_const` under `namespace TauCeti.PontryaginDual` (line 23): complex evaluation of a character at a fixed element is continuous on `_root_.PontryaginDual G`. That is the fact the proof uses.
- **`:3356` (CentralizerCornerRestriction Check).** Only the backticks were removed. The name is this roadmap's own prose target (`:3327`, "Own **CentralizerCornerRestriction**"), not a declaration of `Suggested.lean`, and it now matches the six other unbackticked uses (`:3430`–`:3565`).
- **`:4948–4975` (eight consumer bullets).** I compared each bullet with the consumer's README on main (`3090489`):
  - FactorRigidity: line 39 "§§V2–V13b"; the contract row at line 87 lists V2 (corners, spatial tensors, Borel logarithms of unitaries), V3, V4 (Lusin–Novikov), V5–V7, V8 with `V8.BernoulliArbitraryDiscrete`, V11, V12, V13a–V13b; lines 606 and 744 use the selection and the logarithms. This README has them at `:835–837` (logarithm of a unitary, Layer 2) and `:1546` (Lusin–Novikov, Layer 4).
  - Subfactors: cites V1, V2, V4.Core, V4.PositivePredual, V4.Normality, V5, V6, V7.StandardAmplifications, V7.Dimension, V7.SumsAndCorners, V7.CountableAndTypeI, V7.Index, V8, V10.ModularTheory, V10.KMS, V11 and V13 (lines 52, 251–267, 970). The bullet lists exactly these.
  - NoncommutativeIntegration: cites V2, V4.Core, V4.PositivePredual, V4.Normality, V5, V6, V7.Index, V8, V10.ClosedOperators, V10.Affiliation, V10.TracialLp, V10.ModularTheory and Layer 11 (lines 40–46, 159–161); its line 1479 names I4 as owner of the Lp inclusions, agreeing with `:3607–3608` here.
  - FreeProbability lines 58–61: V0–V4, V6, V8, V10–V11, V13a.
  - HilbertModules lines 56–77, 570: V0, V4.Core, V4.Normality, V7.StandardAmplifications.
  - NoncommutativeGeometry line 60: V0, V4, V6, V10.
  - QuantumGroups lines 40, 281–287, 461: V0–V4 with V1's bicommutant, V10–V11.
  - PseudodifferentialOperators lines 1757, 1885, 1930: V2's completed Hilbert tensor product.
  - All 14 named sub-ids (`V4.Core` … `V10.KMS`, `V8.BernoulliArbitraryDiscrete`) are targets of this README, and all eight relative links resolve on main.

**Lean, at the branch pins**
- `lake env lean` on `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` exits 0 in 33 s with exactly 24 "declaration uses `sorry`" warnings and nothing else.
- The file is unchanged since `8b1713a`, so the previous report's `#check @name` comparison of all 41 declarations, its one-tactic probe (no declaration closes) and its headline coverage stand.

**Seeded sample**
- Targets 13.1 and 13.2 lie outside the changed passages. The previous report read their locators (Hiai Theorem 6.5, Peterson 6.2.1 and 6.3.8, Anantharaman–Popa 10.2.1–10.3.4, 11.1.1–11.2.4) and they are untouched.

**Adversarial table**

Rows marked "previous report" are carried from the review at `8b1713a`, whose table holds the computed values; the statements are untouched. The other rows were computed this round.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| V2.RectangularL2 σ-finite comparison (name changed) | counting measure on ℕ×ℕ; `∞·Leb` on the diagonal of [0,1]² | `e_i⊗e_j↦e_(i,j)`, κ({(i,j)})=1=`μ.prod ν`; a finite-cost rectangle cover of the diagonal needs a null factor in each rectangle, so cost ∞, against bind-product `∫ν({x})dμ=0` | agrees with `Measure.prod` exactly when σ-finite; `prod_eq` carries both `SigmaFinite` | none |
| V10 arithmetic Hecke pair *Needs:* (name changed) | `(SL₂(ℚ),SL₂(ℤ))`, `g=[[1,1/2],[0,1]]`, N=2 | `Ng=[[2,1],[0,2]]`: entry gcd 1, det 4, Smith form `diag(1,4)`; `Ngᵀ=[[2,0],[1,2]]` has the same gcd 1 and det 4, so the same form `diag(1,4)` | transpose fixes the double coset; Smith normal form over ℤ is the input named | none |
| V11.DoubleDualEmbedding *Needs:* (name changed) | G=ℤ, χ=z∈𝕋, g=n | `χ↦zⁿ` is continuous; with K=𝕋, ε<2 and n≠0, `z=e^(iπ/n)` gives `|zⁿ−1|=2≥ε`, so the neighbourhood is `{0}` | evaluation continuity is what is cited | none |
| CentralizerCornerRestriction Check (`:3356`) | `M₂`, `φ=Tr(h·)`, `h=diag(2/3,1/3)`, `p=e₁₁` | `σ_t(e₁₁)=h^(it)e₁₁h^(−it)=e₁₁`; `φ(λe₁₁)=(2/3)λ`; `pMp=ℂ` has trivial modular group; with `p=(1/2)[[1,1],[1,1]]`, `σ_t(p)` has off-diagonal `2^(it)/2≠1/2` | centralizer hypothesis needed; value 2/3 | none |
| Downstream consumers (`:4948–4975`) | 8 roadmaps, 14 sub-ids | every id cited by the consumer on main is in its bullet and resolves here (table above the Lean section) | holds | none |
| `tomiyama` (13.1), Arveson Checks, `IsInjective` | previous report | carried | holds | none |
| `IsHyperfinite`, `isInjective_iff_isHyperfinite`, Følner and semidiscreteness Checks, V13b.SpatialNorm (13.2) | previous report | carried | holds | none |
| II₁/II∞ uniqueness of the injective factor | previous report | carried | holds | none |
| `double_commutant_iff_isClosed_image_ofCLM`, both Kaplansky forms | previous report | carried | holds | none |
| `exists_faithful_nondegenerate_representation` and its `lp` form, `IsNormalFunctional` and its `tsum` characterisation | previous report | carried | holds | none |
| `isCyclic_iff_isSeparating_commutant`, `equivalent_of_subequivalent`, `existsUnique_typeDecomposition` | previous report | carried | holds | none |
| `tracialState_unique`, `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne`, `exists_isNormalSemifiniteTrace_of_isFactor` | previous report | carried | holds | none |
| `exists_conj_commutant_eq_of_isCyclic`, `existsUnique_isKMS_flow`, `ergodicSMul_dense_subgroup` | previous report | carried | holds | none |
| `HasTypeITwoSummand`, `exists_unique_extension_of_finitelyAdditive`, `dye` | previous report | carried | holds | none |
| Checks of V4.0.Multiplication, V8, V9, V10.ModularTheory, V10.FiniteComplexPowers, V11 Pedersen–Takesaki, V12 | previous report | carried | holds | none |

## Not verifiable

Unchanged from the previous report; none of these texts is cited by a changed passage.

- **tomiyama-1957:** the cached text is an access-denied page and the J-STAGE scan has no text layer; no OCR on this worker. Hiai 6.5 and Anantharaman–Popa §A.4 carry the attribution.
- **wassermann-1988:** image-only scan, no OCR.
- **Uncertified and settled, cited by locator:** Arveson 1969, Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- **Not in the cache:** Takesaki I–III, Sakai, Reed–Simon I, Rudin, Runde, Goodman–de la Harpe–Jones, Gleason 1957, Bost–Connes, Laca–Raeburn, Neshveyev, Connes 1973 and 1975, Araki–Woods, Connes–Woods, Connes–Takesaki.

## Source issues

- none
