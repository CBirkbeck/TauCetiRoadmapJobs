# Review of TopologicalKTheory (pull request #1807 at 7408995)

**Verdict:** needs changes

This is a full review. The folder changed by 377 lines since 73914b5, all of them in `README.md`. T7.1 now proves real periodicity itself, through Real K-theory, (1,1)-periodicity and a Clifford product formula, instead of citing DGFloerPartII 4.2a–4.2c. I recomputed the new mathematics and found it sound. The adversarial table below gives the values.

Five findings remain:
- R01 (P2): the homotopy-group form of the real-periodicity headline, now owned by T7.1, is statable at the pins and missing from `Suggested.lean`.
- R02 (P2): O, SO and their stable homotopy groups now have three owners: this roadmap, DGFloerPartII and HomotopySpheres.
- R03–R05 (P3): a docstring claim that is false at the pin, a definition of "Real space" that excludes the spaces the section uses, and the previous R02, carried.

## Previous findings

- **R01 (DGFloerPartII as T7's supplier): repaired.**
  - A search of the README for `DGFloer`, `4.2a`, `4.2b`, `4.2c`, `Ω₇` and `cofibrationTower` finds nothing.
  - The supplier bullet now reads "T7.1 owns the stable orthogonal and special orthogonal groups O and SO, the colimits of Mathlib's `Matrix.orthogonalGroup (Fin n) ℝ` … real Bott periodicity as the product with the degree −8 class b … and the eightfold stable Bott equivalence on ℤ×BO. Its inputs are T1–T6, SpinRepresentations' Clifford classification and AlgebraicTopology" (lines 204–213).
  - The route is now T4's clutching proof with involutions (lines 1594–1600) plus the product formula `b·μ(N₈)=±β_R⁸` (lines 1655–1682). Neither passes through a quaternionic carrier, so the loop through GeneralizedCohomology G4.0b is gone.
  - GeneralizedCohomology at this head consumes the single eightfold equivalence (its lines 91–92, 399–401, 3580–3581, 3855), so the downstream wording changed with the route.
- **R02 (AlgebraicTopology consumer sentence): partly repaired.**
  - Line 127 now reads "used by T1.5 and T7.1".
  - AlgebraicTopology lines 1027–1028 still say "the target TopologicalKTheory T1.6d cites as cofibrationTowerHomotopyEquivalence". Carried as R05 below.

## R01 (P2) — The homotopy-group form of real Bott periodicity is statable at the pins but is neither stated nor named

- **Location.**
  - `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` lines 13–14 and 27–28: "The roadmap's headline theorems are not statable at the pins … real Bott periodicity with coefficient ring … (T7.1): no KO-group of a space."
  - README lines 1501–1503 ("π_i(O) is the colimit of the groups π_i(O(n))") and 1716–1718 ("π_i(O)≅a_(i+1) for every i≥0").
- **Claim.** This pull request makes T7.1 the owner of O, SO and π_i(O). Read on the finite stages in the stable range, π_i(O) is the classical form of Bott's theorem. Its carriers are at the pins: Mathlib's `HomotopyGroup.Pi` and `Matrix.orthogonalGroup (Fin n) ℝ` with the subspace topology. Yet the file states nothing for this headline, and the docstring names only the KO form. The space-level eightfold equivalence `ℤ×BO≃Ω⁸(ℤ×BO)` and KR's (1,1)-periodicity are not mentioned in the docstring either.
- **Witness.**
  - The declaration in the repair below elaborates in a copy of this `Suggested.lean`, with only `sorry` warnings.
  - DGFloerPartII `Suggested.lean` lines 374–395 and HomotopySpheres `Suggested.lean` lines 135–141 state the same family on finite `SO(m)` and `O(n)`.
- **Repair.**
  1. **Stable range in the README.** In T7.1's O/SO bullets (after line 1503), add: "For n≥i+2 the inclusion O(n)→O induces an isomorphism on π_i, and likewise for SO, by T1.5's (n−k−1)-connectivity of V_k(ℝ^n) at k=1 and AlgebraicTopology Stage 5.5's sequence for O(n−1)→O(n)→S^(n−1)."
  2. **The statement in `Suggested.lean`.** Add the following under `/-! ## T7.1: … -/`. The table is indexed by `k mod 8`, with `ZMod 0 = ℤ` and `ZMod 1` trivial.

         theorem homotopyGroup_orthogonalGroup_stable (i n : ℕ) (hn : i + 3 ≤ n) :
             Nonempty (HomotopyGroup.Pi (i + 1) (Matrix.orthogonalGroup (Fin n) ℝ) 1 ≃*
               Multiplicative (ZMod (![2, 2, 1, 0, 1, 1, 1, 0]
                 ⟨(i + 1) % 8, Nat.mod_lt _ (by norm_num)⟩))) := by
           sorry

     Name it in the README sentence at line 1718.
  3. **Docstring.** Say that this form is stated. Name as not statable:
     - the KO-group form: no KO-groups at the pins;
     - (1,1)-periodicity: no KR-groups;
     - the eightfold equivalence `ℤ×BO → Ω⁸(ℤ×BO)`: no stable Grassmannian BO.
- **Tested.**
  - The values agree with T7.1's table `π_i(O)≅a_(i+1)` = ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ:
    - `i=0, n=3`: `π₁(O(3))`, index 1, gives `ZMod 2`;
    - `i=1, n=4`: `π₂(O(4))`, index 2, gives `ZMod 1`, trivial;
    - `i=2, n=5`: `π₃(O(5))`, index 3, gives `ZMod 0 = ℤ`;
    - `i=6, n=9`: `π₇(O(9))`, gives ℤ;
    - `i=7, n=10`: `π₈(O(10))`, gives ℤ/2.
  - The bound `n ≥ i+3` excludes the unstable cases `π₁(O(2))=ℤ` (3≤2 fails) and `π₃(O(4))=ℤ²` (5≤4 fails).
  - One-tactic probe: `simp`, `aesop` and `exact?` do not close it.

## R02 (P2) — O, SO and their stable homotopy groups have three owners

- **Location.** README lines 204–208: "T7.1 owns the stable orthogonal and special orthogonal groups O and SO, the colimits of Mathlib's `Matrix.orthogonalGroup (Fin n) ℝ` … along the block inclusions with the new coordinate last". Also lines 1488–1493 (the definition) and 1716–1718 (π_i(O)).
- **Claim.** Two open pull requests own the same carriers and the same theorem:
  - DGFloerPartII (#1799) 4.2a defines O and SO as the same colimits, along the same `ι_r(A)=diag(A,1)`, in compactly generated spaces. Its 4.2c derives the same π_i(O) table.
  - HomotopySpheres (#1287) §4A–4B owns stable O/SO, the ΩBSO comparison and real Bott periodicity. It also names T1.6d and T7 as its consumers.

  TopologicalKTheory is on main, so it keeps these objects and the open roadmaps cite it. The pull request description, which sends three open pull requests to GeneralizedCohomology's objects, says nothing about these.
- **Witness.**
  - DGFloerPartII README (43d9b63), 4.2a, lines 1591–1606: `O`, `SO` are colimits along `diag(A, 1)`. Line 1799 gives the same π_i(O) table.
  - HomotopySpheres README line 41: "Stable `O`/`SO` … real Bott periodicity". Lines 3301–3302: "T7 uses 4B.1–4B.9".
- **Repair.**
  1. **DGFloerPartII 4.2a (same author).** Cite TopologicalKTheory T7.1 for O, SO, the finite-stage factorization and the stable range of R01. Keep U, Sp, the Clifford chain and the Morse-theoretic Bott maps of 4.2b–4.2c, and state their comparison with T7.1's eightfold equivalence. This is what this README's line 214–217 already assigns to "the roadmap that constructs such a chain". Its finite-rank Lean statements (lines 374–395) become citations of R01's theorem or are deleted. Its sentence "TopologicalKTheory consumes nothing from this roadmap" (line 2238) stays true.
  2. **The description.** Beside the paragraph that sends HigherToposTheory, OperatorKTheory and DGFloer to GeneralizedCohomology, add one sentence: DGFloerPartII 4.2a–4.2c and HomotopySpheres §4A–4B, with Layer 4 of HomotopySpheres' `Suggested.lean`, are to cite TopologicalKTheory T7.1 for O, SO, ΩBO≃O, ΩBSO≃SO and π_i(O), and HomotopySpheres' Downstream consumers paragraph no longer names T1.6d and T7.
- **Tested.**
  - With this repair, TopologicalKTheory has no edge into either roadmap, so there is no cycle. DGFloerPartII's 4.2a–4.2b inputs (GeneralizedCohomology G4.0b, which consumes T1.5–T1.6) and its new citation of T7.1 point the same way.
  - T7.1 needs neither roadmap. Its O/SO definition (lines 1488–1503), its loop comparison (lines 1517–1539) and its coefficients (lines 1700–1718) use only T1.5a, T1.6a, T4 and AlgebraicTopology Stages 4.5 and 5.5.

## R03 (P3) — The module docstring says the pin has no tautological line bundle on S² in the bundle category; it has one

- **Location.** `Suggested.lean` lines 19–21: "it has no tensor product of bundles, no external product and no tautological line bundle on `S²` as an object of that category, and no variable-rank bundle category".
- **Claim.** The README models S² ≅ ℂP¹ as `TauCeti.finiteGrassmannian ℂ 1 2` (T1.6d, line 822 and lines 829–831). On that carrier, the tautological line is an object of the pinned category and has a class in `SplitK0`. What makes the ring `ℤ[β]/(β²)` unstatable is the missing monoidal structure, not a missing line bundle.
- **Witness.** A scratch module elaborates with exit 0 and no warning: `FiniteRankBundleCore.ofBundle ℂ 1 (finiteGrassmannian.Tautological ℂ 1 2)` and its `SplitK0.of`. See `FiniteRank/Basic.lean:209` and the bundle instances at `Grassmannian/Tautological.lean:172,178`.
- **Repair.** Replace the clause with: "the tautological line on `TauCeti.finiteGrassmannian ℂ 1 2` ≅ ℂP¹ is an object by `TauCeti.FiniteRankBundleCore.ofBundle`, but the category has no tensor product or external product, so neither `β²=0` nor the periodicity map can be stated, and there is no variable-rank bundle category".
- **Tested.** The corrected clause agrees with the probe above. A search of `Topology/VectorBundle/FiniteRank/*.lean` finds no `MonoidalCategory`/tensor structure, while `SplitK0` has its ring structure only from a monoidal source category (`GrothendieckGroup/Monoidal/Basic.lean:249`).

## R04 (P3) — "Real space" is defined as compact and then applied to non-compact spaces

- **Location.** README line 1559: "A Real space is a compact Hausdorff space X with a continuous involution τ". Line 1567: "of locally compact Real spaces". Line 1586: "The Real space ℝ^(1,1) is ℂ with complex conjugation".
- **Claim.** By the definition, ℂ, the ℝ^(p,q) and "locally compact Real spaces" are not Real spaces. The compactly supported KR groups of line 1567 and the forgetful map to `K(ℂ⁸)` in the third product-formula Check (line 1695) therefore have no defined domain.
- **Witness.** ℝ^(1,1)=ℂ (line 1586) is not compact, yet it is called a Real space. Atiyah's definition of a Real space carries no compactness; KR is then defined for compact ones.
- **Repair.** Line 1559 should read: "A Real space is a locally compact Hausdorff space X with a continuous involution τ; KR(X), Real pairs and KR^(p,q) are taken over compact Real spaces, and compactly supported KR over locally compact ones".
- **Tested.**
  - After the edit, ℝ^(p,q), B^(p,q) and S^(p,q) are Real spaces.
  - `KR^(p,q)(X,Y)=KR(X×B^(p,q),X×S^(p,q)∪Y×B^(p,q))` still uses only the compact `X×B^(p,q)`.
  - `KR^(8,8)(pt)`, the compactly supported group of ℂ⁸ with conjugation, is now defined.

## R05 (P3) — AlgebraicTopology still names T1.6d as citing the cofibration-tower equivalence

Carried from the previous review, R02.

- **Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 1027–1028: "Own the cofibration-tower homotopy equivalence (the target TopologicalKTheory T1.6d cites as cofibrationTowerHomotopyEquivalence)".
- **Claim.** With the Ω₇ comparison gone, no section of TopologicalKTheory cites the tower equivalence. T1.6d never did, and T7.1's eightfold equivalence makes its stage maps strictly compatible by homotopy extension (lines 1761–1763).
- **Witness.** `grep cofibrationTowerHomotopyEquivalence TauCetiRoadmap/TopologicalKTheory/README.md` is empty. T1.6d (lines 809–821) names no AlgebraicTopology target. MorseTheory line 431 consumes AT4.5's `cofibrationTowerHomotopyEquivalence`.
- **Repair.** At AlgebraicTopology line 1027–1028, write "(the target MorseTheory consumes as cofibrationTowerHomotopyEquivalence)" or drop the parenthesis. At line 1628, "TopologicalKTheory T1.5 consumes the based homotopy sequence" becomes "TopologicalKTheory T1.5 and T7.1 consume …", matching this README's line 127.
- **Tested.** After the edit, every AlgebraicTopology sentence naming a TopologicalKTheory section matches a citation in this README:
  - lines 138 and 1628: T1.5 and T7.1;
  - line 154: T1.6;
  - lines 1098, 1106 and 2522: T7.0's `basedHomotopyInverseOfEquivalence`, `cwProductKelley` and `homotopyGroupKelleyProduct`, which this README cites at lines 1430, 1421 and 1422.

## Verified sound

**Gate and tooling.**
- **Gate re-run on 7408995.** Every check is 0 except `outside-folder=26`. `git diff --name-only origin/main...HEAD` shows exactly 2 files in each of the 14 folders the brief names as this pull request's own. The brief's filtered `git diff --stat` is empty, so this is not a finding. The worker's gate on this head passed, `build=0`.
- **Dependency check.** `tauceti-roadmap gate --depcheck … --movable --content … --pr 1807` printed `depcheck: 234 roadmaps, 2285 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/TopologicalKTheory/Suggested.lean` exits 0. Its only warning is `102:8: declaration uses 'sorry'`. The imports are `public import Mathlib` and `TauCeti.RingTheory.PowerSeries.Log`. There is no `set_option`, no sorry'd data and no `lemma`.
- **Signatures.** I elaborated a `#check @` of all four declarations:
  - `adamsValueOfLambdaSeries : (PowerSeries R)ˣ → ℕ → R` over `CommRing R`;
  - `_mul`, additivity on products;
  - `_eq_coeff_logDeriv`, with `[Algebra ℚ A]` and `constantCoeff a = 1`;
  - `exists_continuous_inside_projection`, which keeps `[CompactSpace X]` and the circle hypothesis `‖z‖=1 → IsUnit (z•1 − B x)`.

  These match the README's T2.5 (lines 950–957) and T4.4 (lines 1089–1095). No binder is lost.
- **Padding probe.**
  - `exists_continuous_inside_projection`: `simp`, `aesop` and `exact?` all fail.
  - The two proved Adams lemmas: `simp [adamsValueOfLambdaSeries, …]` and `exact?` fail.

  No library near-match proves T4.4 at the pin. Tau Ceti's `RieszProjection/*` is non-Archimedean only, and Mathlib's `cfc` needs a normal element, which a companion pencil is not.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d997). All 31 Tau Ceti names the README backticks resolve. Among them:
- `FiniteRankBundleCore` (`FiniteRank/Basic.lean:56`), `.ofBundle` (:209), `.isIso_iff_bijective` (:313).
- `pointIndexedCore` (`VectorBundle/Core.lean:49`), `pointIndexedCoreHomeomorph` (:160).
- `exists_bundleHomeomorph_of_bijective` (`VectorBundle/Hom.lean:313`).
- `bundleComplementHomeomorph` (`Complement.lean:223`).
- `exists_continuous_injective_fin_of_compactSpace` (`TrivialEmbedding.lean:137`), `…_pi_of_iUnion_baseSet` (:116).
- `rangeFiberBundle`, `rangeVectorBundle`, `rangeProdRangeOneSubHomeomorph` (`VectorBundle/IdempotentRange.lean:237, 261, 286`).
- `isLocallyConstant_finrank_range` (`Operator/IdempotentRange.lean:81`).
- `nonempty_continuousRiemannianMetric` (`Riemannian/Existence.lean:68`), `ContinuousFiberNorm` (`Riemannian/Hermitian.lean:56`).
- `OrthonormalFrameBundle` (`OrthonormalFrame/Basic.lean:109`), `.exists_trivialization` (:499).
- `PrincipalBundle` (`FiberBundle/Principal.lean:239`).
- `VectorBundleOrientation` (`Orientation/Basic.lean:192`), `VectorBundleOrientationCover` (`Cover.lean:84`), `deck` (:164).
- `finiteFullRankFrame`, `frameSpan`, `isEmpty_of_lt`, `equivModuleGrassmannian` (`Grassmannian/Basic.lean:57, 120, 181, 216`).
- `finiteOrthonormalFrame`, `isQuotientMap_frameSpan_toFullRankFrame`, `unitaryOrbitHomeomorph` (`Orthonormal.lean:54, 218, 254`).
- `finiteOrientedGrassmannian` (`Oriented.lean:44`).
- `PartitionOfUnity.gap` (`Gap.lean:67`), `eq_of_gap_pos_of_card_eq` (:195), `gapTrivialization` (`GapTrivialization.lean:73`), `exists_countable_locallyFinite_trivialization` (`Countable.lean:59`).
- `TopCat.mem_serreFibrations_of_exists_trivialization` and `mem_serreFibrations_proj` (`SerreFibration/FiberBundle.lean:365, 395`).
- `SplitK0` (`GrothendieckGroup/Split.lean:128`), `of_biprod` (:156), `liftEquiv` (:271), `grothendieckAddGroupEquiv` (:577); the `CommRing (SplitK0 C)` instance (`Monoidal/Basic.lean:249`).
- `Submodule.finConsEquiv` (`LinearAlgebra/Submodule/Fin.lean:27`).

Mathlib, for the names T7.1 adds or relies on:
- `Matrix.orthogonalGroup` and `Matrix.specialOrthogonalGroup` (`LinearAlgebra/UnitaryGroup.lean:318, 338`), both submonoids, so the subspace topology is the matrix one.
- `Projectivization.equivSubmodule` (`Projectivization/Basic.lean:180`).
- `MvPolynomial.psum_eq_mul_esymm_sub_sum` (`NewtonIdentities.lean:245`).
- `Orientation.eq_or_eq_neg_of_isEmpty` (:217) and `Orientation.map_of_isEmpty` (:116).

**Cross-roadmap citations resolved at this head or on main.**
- AlgebraicTopology Stage 4.5 (lines 142–149), Stage 4.6 and the Stage 5.5 sequence (lines 1620–1628).
- ComplexKahlerGeometry K7.1 (`### 7.1`, line 2321).
- CharacteristicClasses C1.1a–b and C1.5.
- GeneralizedCohomology G4.0b (lines 2799, 3080), defined at this pull request's own head, so the overlap tool's "only an open revision defines" lead is satisfied here. G5.0 and G5.4 consume T7.0 and T7.1 (lines 3553, 3580, 3855, 3899).
- BanachAlgebras A2 (line 15).
- CompactGroups Layer 5 (line 318).
- SpinRepresentations Layer 7 (line 881). Its `Cliff(p,q)` has p generators of square +1, so `Cliff(0,2)≅ℍ`, the same convention as T7.1's Cl(0,n) with generators of square −1.
- MorseTheory line 431.
- `roadmaps resolve` lists nothing missing.

**Ownership.**
- Real K-theory of spaces with involution, KR and (1,1)-periodicity: `roadmaps grep` over main and all 448 open heads finds no other owner (the only `KR` hits are FiniteFlatGroupsAndIntegralPadicHodgeTheory's unrelated `M_KR`). OperatorKTheory at its head consumes only T1–T6 and owns no real periodicity. T7.1 is the right owner.
- O, SO and the stable groups: see R02.

**Overlaps.**
- #1808 and #1854 also change this folder. The description fixes the order: this pull request → #1808 → #1854.
- No id cited here is dropped by an open pull request, and this pull request drops no cited id.

**Seeded sample.**
- **T2.0** (lines 849–865) checked against `hatcher-vbkt` lines 1504–1558, printed pp. 39–40:
  - the relation `E₁−E₁′=E₂−E₂′` iff `E₁⊕E₂′≈_s E₂⊕E₁′` is line 1541–1542;
  - transitivity needs cancellation, hence compactness (lines 1542–1545);
  - cancellation uses the complement from the proof of Proposition 2.1 (lines 1525–1537);
  - variable fibre dimension is lines 1510–1514.

  The README states the paracompact extension with an arbitrary common summand G as its own, and says it agrees with Hatcher's when G has a trivial complement. Supported as written.
- **T7.0** (lines 1409–1482): Sibson is uncertified. Recomputed below.

**Headline theorems** (README summary and T4–T7):
- complex Bott periodicity and `K(S²)=ℤ[β]/(β²)` (T4): not statable (no monoidal structure on `FiniteRankBundleCore`, no variable-rank category); docstring correct apart from R03;
- complex Thom (T5.3): not statable, named;
- equivariant Thom and `R(G)≃K_(G,c)(V)` (T6.7): not statable, named;
- real Bott periodicity with its coefficient ring (T7.1): KO form not statable and named; homotopy-group form statable, see R01;
- the eightfold equivalence and (1,1)-periodicity (T7.1): not statable, not named; see R01.

**Adversarial table.** Every row was computed at this head.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| T2.0 group completion | `X=∅`; `X=pt`; `X=ℕ` discrete | zero ring (`1=0`); ℤ; iso classes `ℕ^ℕ`, group completion `ℤ^ℕ=∏ℤ` | agrees with lines 865, 883–887 |
| T2.0 vs Hatcher | compact `X` | `∃G, E⊕F′⊕G≅E′⊕F⊕G` with G complemented in `1^m` ⇔ `E⊕F′≈_s E′⊕F` | matches `hatcher-vbkt` line 1541–1542 |
| T7.0 shear | `π_n(BO×BO)`, `n=1`: `(ℤ/2)²` | `sh_*=[[1,0],[1,1]]`, det 1; inverse `(a,b)↦(a,b−a)` | bijective |
| T7.0 complement class | `k=0`; `k=N`; general `k` | `ν=[1^N]−[1^N]=0`; `0−0=0`; `([γ]−[1^k])+([γ^⊥]−[1^(N−k)])=0` by `γ⊕γ^⊥≅1^N` | agrees |
| T7.0 basepoint track | `N=3`, `k=1` | `e₁→e₃→e₀`, then `e₂→e₄→e₁`; at each step the moving plane is orthogonal to the other frame vectors; endpoint `(e₀,e₁)` | frame stays orthonormal |
| O/SO Check 1 | `n=0,1` | `O(0)={1}↦1∈O(1)`; `|O(1)|=2`, det `±1`; `SO(1)={1}` | `π₀(O)=ℤ/2` |
| O/SO Check 2 | `A↦diag(A,−1)` | `1↦diag(1,…,1,−1)≠1`; `det` changes sign | not a homomorphism, as stated |
| Loop comparison, `i=0` | `n=1`, `N=2` | lift of `ℝ(cos θ,sin θ)` ends at `f₀·(−1)` | generator ↦ `−1∈O(1)` |
| ℝ^(p,q) spheres | `(1,0)`, `(0,1)`, `(1,1)`, `(2,0)` | `{±1}` swapped; `{±1}` fixed; fixed points `(0,±1)`; antipodal, free | as in Check 2 (line 1611) |
| KR Check 1 | `pt`; `pt×{±1}` swapped vs trivial | ℤ; `K(pt)=ℤ` vs `KO(2 pts)=ℤ²` | agrees |
| β_R restricted to ℝ^(0,1) | real points of `O(−1)` over ℝP¹ | Möbius line; `η∈KO^(−1)(pt)=ℤ/2`, nonzero | agrees (line 1615–1619) |
| μ(N) is Real | `τy=−y`, `w↦w̄` | `conj(i·c(y)w)=−i·c(y)w̄`; `i·c(−y)w̄=−i·c(y)w̄`; without `i`, `c(−y)w̄=−c(y)w̄≠c(y)w̄` | the `i` is needed, as written |
| Contour conjugation | `T=diag(0,2)` | `conj P(T)=P(conj T)` (two sign flips); both `diag(1,0)` | agrees |
| Real Laurent coefficients | `f(τx,z̄)=conj f(x,z)`, `f=Σa_k z^k` | `Σa_k(τx)z̄^k=Σconj(a_k(x))z̄^k` | `a_k(τx)=conj a_k(x)` |
| Complexification sequence | pair `(X×B^(1,0),X×S^(1,0))` in degree `−q` | `KR^(1,q)=KO^(1−q)→KO^(−q)→K^(−q)→KO^(2−q)` | matches the display (line 1630) |
| First map is η | restriction along `B^(0,1)⊂B^(1,1)` | `B^(1,0)` equivariantly contractible ⇒ forget support = restriction | η, as stated |
| `a_(−1)`, `a_(−2)`, `a_(−3)`, `a_(−4)` | `q=1,0,−1,−2` | `0→a_(−1)↪a_0≅K⁰`; c onto ⇒ `a_(−2)↪a_(−1)=0`; `0→a_(−3)→0`; `0→ℤ→a_(−4)→0` | `0,0,0,ℤ` |
| `a_3` | `q=3`; `q=−3` | `η:a_2↠a_3`; `K³=0` ⇒ `a_(−5)↪a_(−4)=ℤ` | torsion in ℤ: `a_3=0` |
| `η²≠0` | `q=2` | `η:a_0→a_1` has kernel 2ℤ = image of `δ:K^(−2)→a_0`; `δ` injective ⇒ `c|a_2=0` ⇒ `η:a_1↠a_2` | `η²` generates `ℤ/2` |
| `c(a)`, `c(b)` | `q=4`; `q=8` | `0→a_4→ℤ→ℤ/2→0` ⇒ `c(a)=±2u²`; `a_7=a_6=0` ⇒ `c:a_8≅K^(−8)` | agrees |
| Coefficient table vs π_i(O) | `i=0,…,7` | `a_(i+1)` = ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ | matches DGFloerPartII line 1799 |
| Ring relations | `2η`, `η³`, `ηa`, `a²` | `a_1=ℤ/2`; `a_3=0`; `a_5=0`; `c(a²)=4u⁴=4c(b)` with c injective on `a_8` | as stated (line 1730–1731) |
| `r` values | `x=u²`, `u⁴`, `u` | `conj β=[L⁻¹]−1=−β` (β²=0); `c r(u²)=2u²=c(a)`; `c r(u⁴)=2c(b)`; `c r(u)=0` | `r(u²)=a`, `r(u⁴)=2b`, `r(u)∈ker c=a_2` |
| Symbols A, B | general `s,t∈ℝ⁸` | `A²=−(ει+ιε)=−|s|²`; `B²=|t|²`; `AB+BA=⟨s,t⟩−⟨s,t⟩=0` | anticommute, as stated |
| n=1 symbol Check | `Λ(ℝ)=ℝ⊕ℝe` | `A:1↦e,e↦−1`; `B:1↦e,e↦1`; `AB+BA`: `1↦−1+1=0`, `e↦e−e=0`; sign-flipped `B=A` gives `2A²=−2` | agrees |
| Dimension count | `n=8`; `n=1`; `n=4` | `dim Cl(8,8)=2¹⁶=256²`, modules `16·16=256=dim Λ(ℝ⁸)`; `2·2=4>2`; `8·8=64>16` | agrees |
| Volume element | `n=8`, generators square −1 | `ω²=(−1)^(n(n+1)/2)=(−1)^36=1`; ω odd-anticommuting ⇒ opposite signs on `M⁰`, `M¹` | two parities, as stated |
| Periodicity logic | `μ∘b`, `b∘μ` | `=±β_R⁸` both ways; block swaps `(−1)^(8q)=(−1)^(8p)=1` | b injective everywhere, onto for `p≥8`, then all `(p,q)` |
| Eightfold equivalence | `π_n` | `π_n(ℤ×BO)=a_n → π_(n+8)(ℤ×BO)=a_(n+8)` by `·b` | iso by periodicity |
| R01 statement | `(i,n)=(0,3),(1,4),(2,5),(6,9),(7,10)`; `(0,2)`; `(2,4)` | `ZMod 2,1,0,0,2` = ℤ/2, 0, ℤ, ℤ, ℤ/2; excluded `π₁(O(2))=ℤ`, `π₃(O(4))=ℤ²` | values match `a_(i+2)` |
| R03 | `ofBundle ℂ 1 (Tautological ℂ 1 2)` | elaborates; `SplitK0.of` of it elaborates | docstring clause false |
| R04 | `ℝ^(1,1)=ℂ` | not compact; called a Real space at line 1586 | definition too narrow |
| `adamsValueOfLambdaSeries` | `1+Lt` over `ℤ[L]`; `1+t` | `(−1)^n·coeff_n(L(1+Lt)⁻¹)=L^(n+1)`; `1` | index n gives `ψ^(n+1)` |
| `_mul` | `1+Lt`, `1+Mt` | `L^(n+1)+M^(n+1)` on both sides | proved in file |
| `_eq_coeff_logDeriv` | `1+t` over ℚ | `(−1)^n·(−1)^n=1` on both sides | proved in file |
| `exists_continuous_inside_projection` | `diag(0,2)`; `[[0,1],[0,0]]`; `n=0`; `B=1` | `P=diag(1,0)`; `P=1`; `P=0`; excluded at `z=1` | not vacuous; P is unique, so `P(τx)=conj P(x)` holds in the Real route |
| T1.5a degree | `m=1`; `m=2` | `1−(−1)^m=2`; `0` | `π₁(SO(3))=ℤ/2`; `π₂(V₂(ℝ⁴))=ℤ` |
| T1.6c `ε_k` | `k=1,2,3` | inversions 0, 1, 3: `+,−,−`; `ε_kε_(k+1)(−1)^k=1` | agrees |
| T5.2 relation | `r=2`, `E=M⊕1` | `t²−(1+[M])t+[M]=(t−1)(t−[M])` | agrees (line 1184) |

## Not verifiable

- **Atiyah, *K-theory and reality* (1966).** T7.1 newly cites §2 for (1,1)-periodicity and Theorem 3.10 for eightfold periodicity, for which the README has no other source. The sources service found no legal copy: the DOI 10.1093/qmath/17.1.367 landing page returns HTTP 403. The manifest has no key for this work, so the worker should record it as `uncertified`, with that DOI and those two locators. The section and theorem numbers were not checked.
- **Settled as uncertified, cited by locator and not read:** `abs-1964` (§§6, 11, behind α_n and its multiplicativity), `atiyah-bott-1964`, `husemoller-fibre-bundles`, `atiyah-1968-bott-index`, `sibson-1969`, `eschenburg-hanke-bott`.
- **Ownership against open pull requests** was checked only through the sibling checkouts and `roadmaps grep`.

## Source issues

- none
