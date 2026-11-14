# Review of SpectralSequencesAndConvergence (pull request #2302 at 00c2247)

**Verdict:** needs changes

## R01 (P3) — 5.4's comparison is narrower at the bounded end than the Tau Ceti theorem it is a kept variant of

**Location:** `TauCetiRoadmap/SpectralSequencesAndConvergence/Suggested.lean:285` `(hFa : ∀ m : ℤ, n ≤ m → m ≤ n + 1 → IsZero ((F a : CochainComplex C ℤ).X m))` (and `hGa`, line 286); README 5.4, lines 1411–1413 and 1436–1437; Scope, lines 68–71.

**Claim:** The Scope names one difference from `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive` (nothing asked in the exhaustive direction). At the other end the target asks termwise vanishing where the pin asks vanishing of `H^n`, `H^{n+1}` of the stages, and the route (4.3 cycle side; `F^p H^n = 0`) uses only the latter.

**Witness:** Pin, `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Exhaustive.lean:203`: `IsZero ((F i).homology m)` for `i ≤ a`. `K = L = (ℤ →(id) ℤ)` in degrees `n, n+1`, `F_i = K` for all `i`: the pin's hypotheses hold, `(F a).X n = ℤ ≠ 0`.

**Repair:** In `Suggested.lean` replace the two binders by

    (hFa : ∀ m : ℤ, n ≤ m → m ≤ n + 1 → ∀ i : ℤ, i ≤ a →
      IsZero ((F i : CochainComplex C ℤ).homology m))
    (hGa : ∀ m : ℤ, n ≤ m → m ≤ n + 1 → ∀ i : ℤ, i ≤ a →
      IsZero ((G i : CochainComplex C ℤ).homology m))

(elaborates on a scratch copy, `sorry` the only warning; on the witness the hypotheses hold and `H^n(K) = 0 = H^n(L)`). In README 5.4 replace "bounded below on `K^n` and `K^{n+1}` (`F^s K^m = 0` for `s ≥ p₀(n)`)" by "`H^n(F^s K) = H^{n+1}(F^s K) = 0` for `s ≥ p₀(n)`, in particular when `F^s K^n = F^s K^{n+1} = 0` for `s ≥ p₀(n)`"; in the route read "the vanishing of `H^{n+1}(F^s K)` gives `Z_r = Zᵗ`" and "the vanishing of `H^n(F^s K)` makes the induced filtration vanish from `p₀(n)` on"; in the comparison bullet replace "the stage of index `a` of each filtration vanishes in degrees `n` and `n + 1`" by "the stages of index `i ≤ a` of each filtration have vanishing `H^n` and `H^{n+1}`". Add to the Scope sentence: "its hypothesis at the bounded end is Tau Ceti's".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 subquotient presentations | `A=ℤ, B=4ℤ, Z=ℤ`; `A=ℤ/4` two presentations; swap marking on `ℤ²` | `2ℤ/4ℤ ↦ 2ℤ ⊇ 4ℤ`; `(0,2ℤ/4)` and `(2ℤ/4,ℤ/4)` both give `ℤ/2`; axis `ℤ×0 ↦ 0×ℤ` | holds | none |
| 1.4 limit page | `×2` example; filtered `ℤ →(id) ℤ` with `F^p K^1 = ℓ^{p−1}ℤ`; vanishing bullet | `E_∞^{2,0}=ℤ/2`, `E_∞^{0,1}=0`; `Z_r(0,0)=ℓ^{r−1}ℤ`, `Z_∞=0`, every `E_r^{0,0}≅ℤ`; `Z_∞ ≤ Z_r = B_r ≤ B_∞` | holds | none |
| 2.2 `dFrom_eq_zero_of_boundedBelow`, `dTo_eq_zero_of_boundedAbove` | first quadrant `β(n)=n+1`, `α(n)=−1`; no relation at `pq`; 1.4 complex | leaving target `fil = f+r−e ≥ β(n+1)`; bounds `r ≥ q+2`, `r ≥ p+1`, i.e. `r > max(p,q+1)`; `dFrom = 0` by shape | holds | none |
| 2.3 `sum_negOnePow_page_eq_sum_negOnePow_page_add_one` | `ℤ/4 ↠ ℤ/2` with length; `×2 ⊗ ℚ`; `finrank` on `k^(ℕ)` with left shift | `−2+1 = −1 = −1+0`; `0 = 0`; `0 ≠ −1` exactly where additivity `0 ≠ 1+0` fails | holds | none |
| 3.2 convergence structures | `ℤ →(×2) ℤ`; `ℓ`-adic `ℤ`; zero sequence with constant `ℤ` | `E_∞^{1,0}=ℤ/2=gr^1 H^1`; converges, `lim ℤ/ℓ^p = ℤ_ℓ ≠ ℤ`; all `gr = 0`, meet `= ℤ ≠ 0` | holds | none |
| 3.3 morphisms | `ℓ`-adic structure with `f = 2`; `(−1, id)`; zero sequence | `gr^p(u) = u mod ℓ`: `2, 2+ℓ` allowed, `3` not; `1 ≠ −1`; every `h` allowed | holds | none |
| 3.4 finite filtrations, Euler identity | `ℤ/4` vs `ℤ/2⊕ℤ/2`; zero pages with `H^1=ℚ`; constant `ℚ` | length `2` both; sums `0` vs `−1` when degree 1 fails; `1` vs `0` without finiteness; degeneration page `max(r, f₊−f₋+e+1)` | holds | none |
| 3.5 comparison | page-iso ⇒ towers correspond under rebasing; `ℤ/4 → ℤ/2⊕ℤ/2`; `ℤ → ℤ_ℓ`; `ℤ → 0` | `ker d_s ≅ ker d′_s` inductively; `gr^1(h) = 0`; `h` not onto; `h` not mono without separation | holds | none |
| 3.6 consequences | two rows for `S¹→S³→S²`; two columns `ℤ/2, ℤ/2`; `m = 0` | `H^0=H^3=ℤ`, `H^1=H^2=0`; `ℤ/4` and `ℤ/2⊕ℤ/2` both fit; exactness at `H^0` fails | holds | none |
| 4.1 towers of a spectral object | `ℤ →(×2) ℤ` at native `(1,−1)`, `r=3`; `Fin 3`, `r=3`; `ℤ →(id) ℤ` on `ℕ×ℕ` | `Z_3 = ker(×2) = 0`; indices `(0,0,1,2)`, `(0,1,2,2)` = Mathlib `toNat`/`clamp`; `E^1(−1≤0≤1≤2)=0` vs page-2 homology `ℤ` | holds | none |
| 4.2 filtered abutment | `ℤ →(×2) ℤ`, degree 1; first quadrant | `F^3H^1 = ℤ/2`, `F^4H^1 = 0`, `gr^3` at `(3,−2)`; `F^0 = H^n`, `F^{n+1} = 0` | holds | none |
| 4.3 limit page and `EInfty` | single `i ≤ q`, single `j ≥ q+1`; `ℤ →(×2) ℤ`; non-exhaustive `ℤ →(id) ℤ` | maps factor through `H^{n+1}(⊥≤i)=0`; `x − w′ ↦ 0` in `H^n(⊥≤j)`; page `max(2,3)=3`; `Bᵗ=ℤ≠0=B_∞` | holds | none |
| 4.4 `HasConvergenceBounds`, `convergence_of_hasConvergenceBounds` | `ℤ →(×2) ℤ`: `a=−2, b=0`; zero object `a=5, b=0`; `G_j = 0` on `ℤ` | `F^p=H^1` for `p≤2`, `0` for `p≥4`; page `max(2,2,3)=3`; `max(2,−2,0)=2`; mono but `F` not exhaustive | holds | none |
| 4.5 quadrants | `IsFirstQuadrant`; `IsThirdQuadrant`, `m=−2` | `a=min(0,n+1)`, `b=n+1` from `isZero₁`, `isZero₂`; `a=−2, b=1`, positions `(p,2−p)`, `0≤p≤2` | holds | none |
| 4.6 `isIso_hom_app_abutment_of_hasConvergenceBounds` | `a > b`; pin's hypotheses; `ℤ → (ℤ →(id) ℤ)` | both abutments `0`; pin's vanishing ⇒ bounds by the four-term sequence; pages iso, `ℤ → 0`, top condition fails | holds | none |
| 5.1 classical indexing | `ℤ →(×2) ℤ`, stupid filtration | classical `(0,0),(1,0)` ↦ native `(1,−1),(3,−2)` on page 2; `d = +2`; `fil = −q−1`, `e = 1` | holds | none |
| 5.3 `hasConvergenceBounds_spectralObject_filtrationFunctor`, `sum_negOnePow_homology_eq_sum_negOnePow_page` | `K^m=ℤ`, `F^pK^m=ℤ ⇔ p≤m`; `ℚ →(×2) ℚ`; `𝔽₂` | `p₁=n`, `p₀=n+2`, `gr^nH^n=ℤ`; sums `1−1 = 0 = 0`; `0 = 1−1`; sign `(−1)^p` gives `−2` | holds | none |
| 5.4 classical convergence and comparison | exhaustive on `K^{n−1}` only used for `B_∞=Bᵗ`; `ℓ`-adic `ℤ → ℤ_ℓ`; constant filtration of `ℤ →(id) ℤ` | `x ∈ G_j^{n−1}` for some `j`; pages `id` on `ℤ/ℓ`, `H^0` not iso; cohomological vanishing holds, termwise fails | true, narrower than its route | R01 |
| 6.1 exact-couple sequence | `D=E=ℤ²` couple; cohomological degrees; shift by `k=1` | `(jk)²=0`, `i²=i`, page 2 `= 0`; `(1,0)−(r−1)(−1,1)=(r,1−r)`; offset `e−k=0` | holds | none |
| 6.2 towers of a couple | `r=0`; Bockstein couple; `D=ℤ/ℓ²`, `E=ℤ/ℓ⊕ℤ/ℓ` | `Z_1=E`, `B_1=0`; `E_∞=ℤ/ℓ`; `Z_2=E` vs wrong model `ℤ/ℓ⊕0` | holds | none |
| 6.3 couple of a spectral object | degrees; `ℤ →(×2) ℤ` | `c=(2,−1)`, `d_r` degree `(r+1,−r)`; `d_1 = ×2 : E(1,−1) → E(3,−2)`; tower `0, ℤ, ℤ/2`, images `= F^p` of 4.2 | holds | none |
| 7.1 lim, lim¹, completeness | complete ⇒ `lim¹=0`; cofinal subsequence without exact products; `×ℓ` tower | `(1−s)(Δc−σ)=id`; explicit homotopy equivalence of two-term complexes; `lim¹=ℤ_ℓ/ℤ` | holds | none |
| 7.2 `isReplete_iff_countableAB4Star_and_epi_towerDifference`, `IsMittagLeffler`, `epi_towerDifference_of_isMittagLeffler` | `P_n = F_n ⊕ ∏F_k`; kernel tower; zero-transition `ℤ/ℓ`; `μ_{ℓ^n}` over `Gal(ℚ̄/ℚ)` | limit `∏F_n`, projection `(π_0, 1−s)`; `lim F → F_0 → lim¹K = 0`; ML with `m=n+1`; limit `0`, not replete | holds | none |
| 7.3 double-tower sequence | constant `ℤ`; `×ℓ` on `ℤ` | all terms `0`; `0 → 0 → ℤ_ℓ/ℤ → ℤ_ℓ/ℤ → 0`, `×ℓ` bijective on `ℤ_ℓ/ℤ` | holds | none |
| 7.4 Boardman's theorems | limit and colimit step couples; whole-plane example; half-plane criteria; source proof steps in a replete `C` | `gr^0 A_1^{+∞}=ℤ=E_∞^{0,0}`, `A_0^{+∞}=0`; `W^0=∏k/⨁k=F^{+∞}`; `i` iso where `E_1=0`; steps use `CountableAB4Star`, exact `ℕ`-colimits, `epi_π_app` | holds | none |
| 7.5 complete convergence | `ℓ`-adic `ℤ_ℓ`, `ℤ`; first-quadrant filtration | `1−s` iso on `∏F^sK` ⇒ `lim=lim¹=0` on `H^n(F^sK)`; strong; not complete; agrees with 5.3 at `p₁=0`, `p₀=n+2` | holds | none |

- Source locators opened at the text: 66 (stacks-012K 42, helle-rognes2024 21, bhatt-scholze2015 2, browning-sawin2020 1), all matching number, hypotheses and statement.
- Library declarations opened at the pins: Mathlib `SpectralObject/HasSpectralSequence.lean:143,176,214,260,394,437`, `FirstPage.lean:47–64`, `EpiMono.lean:84,142,148,183,216`, `ObjectProperty/Kernels.lean:75`, `SerreClass/Basic.lean:45`, `ModuleCat/AB.lean:30,38`, `ModuleCat/Projective.lean:60`; Tau Ceti `Limits/Replete.lean:91,107,118,357`, `Preadditive/TowerDifference.lean:77,122,165`, `Functor/ProZero.lean:67`, `SpectralObject/Abutment.lean:92`, `SpectralObject/Comparison.lean:121`, `SpectralSequence/Comparison.lean:32`, `Filtered/SpectralObject.lean:304`, `Filtered/Exhaustive.lean:200`, `GrothendieckGroup/EulerCharacteristic.lean:165`.
- Duplication by object: no tower of subobjects, limit page, convergence structure, exact couple or abelian-category Mittag–Leffler predicate at either pin; `roadmaps grep` on the 13 Lean names and on "limit page", "morphisms of exact couples", "whole-plane": no second owner.
- Cross-roadmap citations resolved on main: 11 (StableHomotopyKTheory §§7.21–7.26, DGFloer Layer 1 items 2–3, AlgebraicTopology §6.0, DerivedModuleAlgebra §S.1, SchemeAndStackFoundations §§2.2, 2.17, ComplexKahlerGeometry K8, EnhancedDerivedSheaves E2:towers.1, E2.1, E2.2).
- Declared gap `gap:exact-couple-morphisms`: same slug in the plan and the README; StableHomotopyKTheory §7.22 states no morphisms of couples; precise and minimal.
- Gate: every check passed. Dependency check: `depcheck: 242 roadmaps, 2194 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 10 `sorry` warnings, nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp_all`, `tauto`) on a scratch copy: all 10 theorems stay open. The file has no `variable` block, so every binder is in its declaration; the elaborated types agree with the README statements.
- Headlines: the 10 stated ones are those statable at the pins; 3.2–3.6, 4.5, 5.4 (main), 6.1–6.3, 7.3–7.5 are named in the module docstring with the missing carrier.

Overlap check: read AlgebraicTopology (main and both open revisions), EnhancedDerivedSheaves (main and both open revisions), ArithmeticGaloisDuality, DerivedModuleAlgebra, StableHomotopyKTheory; exact couples and derived couples: StableHomotopyKTheory §7.22; Boardman convergence for towers of spectra: StableHomotopyKTheory §7.26; first-quadrant double complexes: DerivedModuleAlgebra §S.1; module towers: Tau Ceti; derived limits of towers: EnhancedDerivedSheaves; Hochschild–Serre: ArithmeticGaloisDuality; all cited or left as instances, nothing with two owners.

Source independence: 14 passages compared with 4 sources, none shared; largest share stacks-012K, 42 of 87 locators; contents compared with stacks-012K (§§19, 20, 21, 23, 24, 31 against Layers 1–7: Layer 1 ↔ §20, Layers 2, 3, 5 each part of §24, Layer 6 ↔ §21 after §24, Layer 4 no counterpart): independent.

## Not verifiable

- weibel1994, boardman1999, eilenberg-moore1962, mccleary2001, massey1952, cartan-eilenberg1956: uncertified, cited by locator; their 21 locators were not read (3.5, 3.6 and the main theorems of 5.4 and 7.5 cite only these).
- boardman1999 Theorems 7.1 and 8.2 for the two half-plane criteria of 7.4: helle-rognes2024 line 13–25 gives no theorem numbers.
- The agreement of the numbering of the helle-rognes2024 draft with the published version (Documenta Math. 24): the published text was not read.

## Source issues

- **Misprint** in stacks-012K at Lemma 24.13, proof, printed page 67 (line 3229–3232): the source says the boundary identity holds for `p − r + 1 < p₁(n − 1)` by the isomorphism on cohomology in degree `n − 1`; it should be `p − r + 1 ≤ p₁(n)` and injectivity on cohomology in degree `n`; affects the proof.

## For the human reviewers

- **Not tested.** Six cited works are uncertified (README References, lines 1942–1951); the comparison theorem 3.5 and the consequences 3.6 carry locators only into weibel1994, eilenberg-moore1962 and mccleary2001.
