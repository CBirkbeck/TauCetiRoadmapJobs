# Review of QuadraticFormInvariants (pull request #1215 at 693a416)

**Verdict:** needs changes

There are two findings, both P3, and nothing blocking. The first is the remainder of the previous review's R02. The second is a supplier attribution that the 6E repair introduced. The previous review's other five findings are repaired; the evidence is under "Verified sound".

## R01 (P3) — `Suggested.lean` still restates the Layer 6D headline, which its own docstring and the README say it does not

- **Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` lines 63–87, the section `Layer6D`. Its `example` ends `:= QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq Q hQ hR` (line 85).
  - The docstring at lines 11–12 says the five headlines are "cited here and not restated".
  - `README.md` lines 23–25 say `Suggested.lean` "names the declaration that proves each and does not restate it".
  - `README.md` lines 393–395 say "without restating them".
- **Claim.** This is the previous review's R02, partly repaired. The Layer 2, 7C and both Layer 9 `example`s were deleted, but the Layer 6D one was kept.
  - Its proof is the single pinned term, so the one-tactic probe closes it. That makes it padding.
  - It also makes the module docstring and two README passages false as written.
  - It is the only place in the file that uses the undeclared universe names `v` and `w` (line 75). They elaborate only because the lakefile leaves `autoImplicit` on.
- **Witness.** `#check @QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` at the pin prints the example's statement. The one difference is that Tau Ceti takes `R` implicitly.
- **Repair.** Delete lines 63–87, the comment `/-! ## Layer 6D: the classification and its corollaries -/` and the whole `section Layer6D … end Layer6D`.
  - Nothing else changes. The docstring already lists `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` as the Layer 6D headline proved at the pin.
  - No import is used only by the example.
  - Tested: a scratch copy without those lines elaborates under `lake env lean` with exit 0 and no warnings. After the deletion, the docstring and README lines 23–25 and 393–395 are true as written.

## R02 (P3) — `h2MuEquivZMod` is attributed to ClassFieldTheory Layer 5, which states only the characteristic-zero existence `h2MuEquivZMod_mixed`

- **Location.**
  - `README.md` lines 1780–1782, 6E Milestone 2 *Needs:* "TauCetiRoadmap.ClassFieldTheory Layer 5 for `Br K`, the local invariant `TauCeti.ClassFieldTheory.invMap`, the normalized invariant `TauCeti.ClassFieldTheory.h2MuEquivZMod` and the local symbol". This sentence is new at this head.
  - `README.md` lines 337–341, where the supplier contract lists `TauCeti.ClassFieldTheory.h2MuEquivZMod` among the names that ClassFieldTheory "and this roadmap" consume.
- **Claim.** This is supplier drift of the kind the previous R03 corrected for `brauerGroupEquivBr`.
  - ClassFieldTheory Layer 5 gives an identification `H²(F, μ_n) ≃ ZMod n` only in mixed characteristic, and only as the existence statement `h2MuEquivZMod_mixed`.
  - It never names the normalized equivalence `h2MuEquivZMod`.
  - 6E Milestone 2 uses `h2MuEquivZMod` for every nonarchimedean local field with `2` invertible. Layer 6's scope (lines 1290–1291) includes local fields of odd positive characteristic, where the cited supplier statement does not apply.
- **Witness.**
  - `TauCetiRoadmap/ClassFieldTheory/README.md` at this head, lines 1081–1082, says "`H²(F, μ_n) ≃ ZMod n` for every `n ≠ 0` in mixed characteristic (`h2MuEquivZMod_mixed`)". `h2MuEquivZMod` without the suffix occurs nowhere in that README, here or on main.
  - At the pin, `TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:145` is `h2MuEquivZMod_mixed [CharZero F] … : Nonempty (…)`.
  - The same file at line 89 defines `h2MuEquivZMod (hn : IsUnit (n : F))` for every local `F : Type`.
- **Repair.**
  1. In 6E Milestone 2's *Needs:*, cite ClassFieldTheory Layer 5 for `Br K`, `invMap` and the local symbol only. Cite `TauCeti.ClassFieldTheory.h2MuEquivZMod` as Tau Ceti's (`TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean`): the normalization of Layer 5's `invMap` through `TauCeti.ClassFieldTheory.h2MuToBr`, for every nonarchimedean local `F : Type` with `n` invertible.
  2. In the supplier contract, move `h2MuEquivZMod` out of the list of names both roadmaps consume. Add one clause: ClassFieldTheory states the characteristic-zero existence `h2MuEquivZMod_mixed`, and the normalized equivalence is Tau Ceti's `h2MuEquivZMod`.
  3. Tested at `K = 𝔽₃((t))`, which is in Layer 6's scope. Tau Ceti's hypothesis `IsUnit ((2 : ℕ) : K)` holds there, while `h2MuEquivZMod_mixed` requires `CharZero K`. After the change, every 6E citation has a supplier that states it at the milestone's generality.

## Verified sound

### The previous review's findings (r63 at 12aa8f1)

| Previous | What this head shows | Status |
|---|---|---|
| R01: vacuous "Brauer form" in 6E | Lines 1748–1753 now say that `hilbertSymbol_eq_hilbertSign_kummerBrauerClass` "reads the sign through an injective additive map `Br K →+ ZMod 2`, and over `K` there is none". The declaration is restricted to fields whose Brauer group has at most two elements. Checked at the pin: `MuTwo/LocalSymbol.lean:213` assumes `hf : Function.Injective f`, and `invMap : Br K ≃+ AddCircle (1 : ℚ)` (`Brauer/Invariant.lean:200`). | repaired |
| R02: five `example`s restate pinned theorems | Four were deleted and the docstring now cites all five. The Layer 6D `example` remains (lines 63–87). | partly repaired, now **R01** |
| R03: `brauerGroupEquivBr` attributed to ClassFieldTheory Layer 5 | 7B item 3 (lines 2081–2089) now owns the transport. It names the definition `brauerExplicitH2Equiv` followed by `unitsRepH2Equiv` (pin: `Brauer/CentralSimple/Basic.lean:55`). Its *Needs:* cite ClassFieldTheory Layer 5 only for the carrier `Br K`, and 6E's *Needs:* now point at 7B item 3. | repaired (the same edit adds R02 above) |
| R04: no order against the conflicting open pull requests | The description's merge-order block orders `QuadraticFormInvariants` as this pull request → #1411 → #617 → #1187. `roadmaps list` shows these are the only three other open pull requests touching the folder; #1797 no longer does. | repaired |
| R05: `Completed/LocalGaloisGroups/Suggested.lean` changed | The description names the file and says why it changes. Checked: it imports `TauCetiRoadmap.ClassFieldTheory.Suggested` (line 12) and uses `ClassFieldTheory.cyclotomicCharacter_artinMap` (line 345), so it must follow the ClassFieldTheory revision. Nothing in this folder changes. | repaired |
| R06: 6C item 13's dependency on 7C | The 6C *Needs:* (lines 1655–1657) now lists 7C for item 13. Layer 6's Dependencies (line 1830) say "6C's item 13 after Layer 7C; no other part of Layer 6 needs Layer 7". Layer 7's Dependencies (lines 2227–2228) take only item 1 from 6C. The edges 6C.13 → 7C → 6C.1 form no cycle. | repaired |

### Gate, build and dependency check

- The worker's gate passes every check. My own rerun of the gate reports `outside-folder=4`. All four hits are files in `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/GlobalQuadraticForms/`, which the brief names as this pull request's own folders, so they are not findings. Every other check is 0.
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output (no `sorry`, no warning). There is a single `import Mathlib`, four existing `TauCeti.*` imports, no `set_option` and no `lemma`.
- Dependency check output: `depcheck: 235 roadmaps, 2275 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. Every supplier is on main: ClassFieldTheory, ProfiniteCohomology, RepresentationTheory.SemisimpleAlgebras and Completed/LocalFieldsRamification.

### Lean signatures (`#check @`, one scratch file)

- The scratch file has 33 `#check @` lines: the three declarations of the file and 30 cited Tau Ceti and Mathlib declarations. Of those 30, 26 elaborated in the probe. The other 4 (`cliffordInvariant_eq_hasseInvariant_mul`, `cliffordInvariant_add_of_signedDiscr_eq_zero`, `cliffordHomI2`, `baseChange_quaternionClass`) live in modules the probe did not import, and I opened them in source at the pin.
- `hilbertSymbol`, `localHasse` and `hasseInvariant_eq_localHasse` carry every binder their README statements need. `hasseInvariant_eq_localHasse` carries `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [Invertible 2]`.
- The five headline theorems named in the docstring print exactly the README statements:
  - `nonempty_algEquiv_matrix_tfae`: five conditions, with `[Invertible 2]` only;
  - the 6D classification: all six instance binders on `V` and `W`;
  - `cup_kummerClass_eq_zero_iff`;
  - `galoisEvens2_kummerClass`: the hypotheses `x ∉ range`, `x² = d` and `t = Tr a`;
  - `sw2Class_formClass_traceTransfer_smul_sq`: `σ`, `finrank = 2`, `[Invertible (2 : L)]` and both nondegeneracy hypotheses, as in README lines 2629–2632.
- `hilbertSymbol_eq_cohomological` takes `tr : H²(G_F, μ₂) ≃+ ZMod 2` as an argument over any `F : Type u` with `[Invertible 2]`, as the new text of 6C item 13 and 7C says.
- `h2MuEquivZMod`, `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff`, `h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one` and `quaternionSubgroup_eq_twoTorsion` are stated for `K : Type`. `quaternionSubgroupSignEquiv` and `brauerGroupEquivBr` are universe-polymorphic. This matches the universe remark at lines 1757–1765.
- `index_normGroup_of_isCyclic` is stated for `K L : Type` with the instances listed at lines 1530–1531.
- `isSimpleRing_of_j_sq_mul_discr_ne_zero` takes `c * QuadraticAlgebra.discr a b ≠ 0`, and Mathlib's `QuadraticAlgebra.discr a b = b ^ 2 + 4 * a` (`Mathlib/Algebra/QuadraticAlgebra/Discriminant.lean:52`), as at line 1119.

### Names, paths and citations

- **Names.** 712 distinct dotted backticked names in the README were swept against the declaration names of the pinned Mathlib and Tau Ceti. All resolve except:
  - file names;
  - Mathlib's `Algebra.GrothendieckAddGroup`, the `to_additive` form;
  - the two leads in `citations.md`, which resolve on main at `Completed/LocalFieldsRamification/Suggested.lean:857` (`map_norm_unitFiltration_zero`, with `ramificationIndex K L = 1`) and `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:5332` (`f2Pairing`). Both are prototypes, as README lines 326–333 and 360–364 say.
- **Paths.** Every `TauCeti/…` and `Mathlib/…` path cited in the README exists at the pins.
- **ClassFieldTheory at this head.**
  - Layer 5 (line 1054) states `Br F = H²(G_F, (Fˢ)ˣ)`, `invMap`, `kummerCupPairing` and `localSymbol`.
  - Layer 10 (line 1646) takes `index_normGroup_of_isCyclic` from Layer 5, as 6C's classical construction cites.
  - Lines 2179–2180 and 2214 say this roadmap consumes Layer 5's symbol and the product formula. So the supply runs ClassFieldTheory → QuadraticFormInvariants, and ClassFieldTheory never cites this roadmap's 7B.
- **QuadraticFormInvariantsPartII** (open head, lines 67–71 and 283–289) imports Layers 1, 4, 7A, 7B and 9 and the signature `W(ℝ) ≅ ℤ`, all present here, and owns only this roadmap's exclusions.
- **Lean consumers.** `Completed/OrthogonalSpinGroups/Suggested.lean:84–86` (main and this head) uses exactly the three names kept, and no example is referenced.
- **Overlaps.** `overlaps.md` lists no dropped ids and no ids that only an open revision defines.
- **Ownership.**
  - Every object is Tau Ceti's and cited by its pinned name.
  - GeometryOfNumbersAndQuadraticArithmeticPartII (open) credits Layers 4, 6 and 9 to this roadmap. Its gap `quadratic-extension-witt-exactness` is announced to this roadmap's job and is not a defect here.
  - GlobalQuadraticForms keeps Hasse–Minkowski, as the exclusions say.

### Sampled locators verified in readable sources (EKM printed page = PDF page − 8)

- **Quaternion algebras are central simple.** EKM §98.E, p. 389 (`ekm2008` line 20422), gives central simple of dimension 4 for a Galois quadratic `L`, that is `a` a nonsquare. Example 98.10, p. 390 (line 20446), gives the `(a,b)` presentation.
- **The quaternion symbol in `Br(K)`.** EKM Fact 98.13 (1)–(3), pp. 390–391 (lines 20478–20528).
- **The `I²` homomorphism.**
  - Example 14.1, p. 63 (`ekm2008` line 3432).
  - Lemma 14.2, p. 63 (line 3434), for both forms even-dimensional with trivial discriminant on one. The README cites it "for `r` of even rank", which is correct.
  - Theorem 14.3, pp. 63–64 (lines 3444–3456), with `I³ ⊂ ker`.
- **Base change and the remaining API.** EKM §98.C, p. 388 (`ekm2008` lines 20352–20372): `[A] ↦ [A_L]` is a homomorphism.
- **Milestone 1.** EKM Fact 98.13(3) and (4), p. 391 (`ekm2008` lines 20523–20534). Item (4) is the norm criterion, in the opposite orientation, which symmetry makes harmless.
- **Compatibility with the cup product.** EKM Example 99.5, p. 395 (`ekm2008` lines 20851–20877). Also Example 99.1 (3)–(4), p. 394 (lines 20800–20821), and Example 99.7, p. 395 (line 20901).
- **The value of the Evens norm on a Kummer class.**
  - Kahn Lemme II.2.1, p. 241 (`kahn1984` lines 763–765), gives exactly the two branches with `Tr a ≠ 0` and `Tr a = 0`.
  - The proof (lines 776–788) uses the basis `1, √d/a`, as in "Kahn's basis".
  - Serre CMH Théorème 1′ (`serre1984cmh` line 560) adds the remark that `d_E` enters and not `d(Q_{E,α})` (line 562). The second proof is at line 582.
- **Also checked.**
  - Serre CMH §1.2 names `w₂` the Witt invariant (`serre1984cmh` line 54); Théorème 1 is at lines 146–147.
  - Kahn Théorème 2 is at `kahn1984` line 55, and Prop. II.3.5 (quadratic extension, rank one) at line 1044.
  - Kozlowski Thm 1.1 (2-coverings) is at `kozlowski1984` line 34.

### Adversarial pass (values on each side)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Four-fold criterion (L2 headline) | `ℚ_2`: `(2,5)` and `(5,5)`; any `K`: `a = 1` | Serre exponent `α·ω(5) = 1·1`, so `(2,5)_2 = −1` and all five conditions fail. `5 = 5² − 5·2² = 25 − 20`, so all five hold. `b = ((b+1)/2)² − ((b−1)/2)²` | holds |
| Local classification (6D headline, R01's target) | `ℚ_2`: `⟨1,1⟩` vs `⟨−1,−1⟩`; `ℝ`: `⟨1⁴⟩` vs `⟨(−1)⁴⟩`; rank 0 | `ℚ_2`: `(2,[1],+1)` vs `(2,[1],−1)`; not isometric, since `−1 ≠ x²+y²` as `(−1,−1)_2 = −1`. `ℝ`: both `(4,[1],+1)` (six factors `(−1,−1)`), not isometric, so `[IsNonarchimedeanLocalField K]` is needed, and it is in the signature. Rank 0: both sides true | holds |
| Cup-norm (7C headline) | `ℚ_2 (2,5)`, `ℝ (−1,−1)`, `a = 1` | `(2)∪(5) ≠ 0` and `5 ≠ x² − 2y²`. `(−1)∪(−1) ≠ 0` and `−1 ≠ x² + y²`. `(1) = 0` and `b = x² − y²` is solvable. The zero pairing fails the `ℝ` row | holds |
| Evens value (L9 headline) | `ℚ_2`, `d = −1`, `a = 1+2i`; `a = c ∈ Kˣ`; `a = √d` | `Tr = 2`, `N = 5`: `(2)∪(5) + (2)∪(−1) = (2)∪(5) ≠ 0`. `a = c`: `(2c)∪(−dc²) + (2)∪(d) = (c)∪(−d)`, which equals 7A's `N(res y) = (c)∪(c) + (d)∪(c)`. `Tr √d = 0`: `(2)∪(d)` | holds |
| Relative SW, degree 2 (L9 headline) | `a = 1`; `Tr a ≠ 0`; `Tr a = 0` | `a = 1`: `N^Ev(0) = 0` and `cor = 0`, so both sides equal `w₂(Tr⟨1⟩)`. `Tr a ≠ 0`: RHS `(2)∪(d) + [(Tr a)∪(−dNa) + (2)∪(d)] + (d)∪(Na)`, where `(d)∪(Na) = 0` since `Na = u² − dv²`; this equals LHS `(Tr a)∪(−dNa)`. `Tr a = 0`: LHS `w₂⟨1,−1⟩ = 0`, RHS `2·(2)∪(d) + 0 = 0` | holds |
| `hasseInvariant_eq_localHasse` | ranks 0, 1; `![−1,−1]` over `ℚ_2` and `ℚ_3`; `ε` trivial | `ε(1) = 1` = empty product. `ℚ_2`: `ε[(−1,−1)] = −1 = (−1,−1)_2`. `ℚ_3`: split, `+1 = +1`. The trivial `ε` is excluded by `Function.Injective ε` | holds |
| `localHasse` vs O'Meara's `∏_{i≤j}` | `ℚ_2`: `![−1,2]`, `![−1]` | `s = (−1,2)_2 = +1` (`2 = 1² + 1²`). O'Meara gives `(−1)(+1)(+1) = −1 = s·(−2,−1)_2`, with `(−2,−1)_2 = −1` because `x² + 2y² ≡ 1, 3 (mod 8)` never reaches `7`. `![−1]`: `s = 1`, O'Meara gives `−1` | wrong model excluded |
| Quaternion algebras central simple | `ℍ[K,a,b,c]`; `c = 0`; two-parameter | `(2i − b)² = b² + 4a = discr a b`. `c = 0`: `span{j,k}` is a proper two-sided ideal (`j² = jk = kj = k² = 0`), so `c ≠ 0` is needed. `ℍ[K,a,0,b]`: `b·4a ≠ 0` for units | holds |
| Symbol in `Br(K)`, binary invariance | `⟨2,−1⟩ ≅ ⟨1,−2⟩`; 𝔽₂-pairing `B([2],[−1]) = 1` on `ℚ` | `⟨2,−1⟩` represents `1`, so `[(2,−1)] = [(1,−2)] = 1`, consistent with `(2,−1)_2 = +1`. `B` is symmetric, bilinear and 2-torsion but violates binary invariance, so the ⚠ is correct | holds |
| Hasse invariant formulas | `s(λq)`; `⟨a⟩⊥⟨b⟩`; rank 0 | `∏(λaᵢ,λaⱼ) = (λ,−1)^{C(n,2)}·(λ,d)^{n−1}·s`. `(a,b) = 1·1·(a,b)`. Tau Ceti's `x.rank − 1` truncates to `0` at rank 0, the integer gives `−1`, and both are harmless since `d = [1]` | holds |
| Classification, dim ≤ 3 | `ℝ` dims 3 and 4 | Dim 3: `(d,s) = (1,1), (−1,1), (1,ℍ), (−1,ℍ)`, all distinct. Dim 4: `⟨±1⁴⟩` collide, so `x.rank ≤ 3` is needed, and it is in Lean | holds |
| Clifford invariant (Lam V.3.20) | `ℝ ⟨1ⁿ⟩`, `n = 1..8`; `⟨−1,−1,−1⟩`; `I²`, `m = 1..6` | `C(n+1,4) = 0,0,1,5,15,35,70,126` gives `1,1,ℍ,ℍ,ℍ,ℍ,1,1`, the classes of `ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ`. `C₀ ≅ ℍ` and the formula gives `ℍ·ℍ·ℍ = ℍ`. Parity of `C(2m+1,4)` is `0,1,1,0,0,1`, the parity of `m(m−1)/2` | holds |
| `I²` homomorphism, step 1 | `ℝ`: `⟨1⁴⟩⊥⟨1³⟩`, `⟨1,1⟩⊥⟨1⟩`, `⟨1,−1⟩⊥⟨1⟩` | `c(⟨1⁷⟩) = 1 = ℍ·ℍ`. `c(⟨1³⟩) = ℍ ≠ 1·1`, so the hypothesis is needed (`Even x.rank`, `signedDiscr x = 0`). `C₀` of signature `(2,1)` is `M₂ℝ`: `1 = 1·1` | holds |
| Base change and remaining API | rank ≤ 1; `ℍ_q` | `s = 1` (empty product). `c⟨a⟩ = [C₀] = [K] = 1`. `s(ℍ_q) = (1,−1) = 1` and `c = [M₂K] = 1` | holds |
| The symbol (6C) | any `K`; `(a,a)`; `ℚ`, `a = −1` | `−a = 0² − a·1²`. `a(1+y²) = x² ⟺ −1 = y² − a(x/a)²`, so `(a,a) = (a,−1)`. `3`, `7` and `21` are not sums of two rational squares, so the ⚠ on general fields is correct | holds |
| Classical construction | `ℚ_2(i)`; `ℚ_3(i)`; norm matrix | Norms are `1, 2, 5, 10` (as sums of two squares), 4 of 8 classes, so index 2. Unramified `ℚ_3(i)`: even valuations, index 2. `det [[x, ay], [y, x]] = x² − ay²` | holds |
| Milestone 1 | `Q(ℚ_2)` | `{1, [ℍ]}`; `ε[ℍ] = −1 = (−1,−1)_2`; `#Q = 2 = #Br[2]` | holds |
| Milestone 2 (R02's target) | `ℚ_2`, `ℚ_3`, `(−1,−1)`; `𝔽₃((t))` | `ℚ_2`: `invMap = 1/2` and `(−1,−1)_2 = −1`. `ℚ_3`: `0` and `+1`. ⚠ form: an injective `f : ℚ/ℤ → ZMod 2` would have `f(1/2) = 2f(1/4) = 0`. `𝔽₃((t))` is in scope, but ClassFieldTheory's `h2MuEquivZMod_mixed` needs `CharZero` | holds; attribution **R02** |
| 6C item 13 instances | `ℝ`, `𝔽_q`, number field | `H²(C₂, ℤ/2) = ℤ/2`, so a `tr` exists. `H²(Ẑ, ℤ/2) = 0`, so none. `Br(K)[2]` of a number field is infinite, so none | holds |
| Compatibility with the cup product | `ℝ`; `ℚ_2 (2,5)` | `ι[ℍ] = (−1)∪(−1) ≠ 0`; `(2)∪(5) ≠ 0 ⟺ (2,5)_2 = −1` | holds |
| Wrong Evens candidate (L9 ⚠) | `ℚ_2`, `d = −1`, `t = 2` | `(2)∪(5) + (−1)∪(−1)`: two nonzero elements of a group of order 2 sum to `0`, while the value is `(2)∪(5) ≠ 0` | excluded |
| Kahn basis | `a = 1+2i` | `⟨2, −2/5⟩`; discriminant `−4/5 ≡ −5 = d·Na` | holds |
| 6B defects | `ℚ_2`: `1, 5, −1, −5, 5/4`; `ℚ_2(√2)`, `d = 1` | `δ = ⊤, 2, 1, 1, 0` (`5/4 − (1/2)² = 1`). `𝔡(−5) = 2ℤ_2 ≠ 8ℤ_2`. `U(K,4)(𝒪ˣ)²` has index `8/2 = 4`, not `2` | holds |
| 6C Gram matrix and `ε`, `ω` | basis `{−1, 2, 5}`; `1, 3, 5, 7` | Rows `(1,0,0), (0,0,1), (0,1,0)`, `det ≡ 1`. `ε = 0,1,0,1`; `ω = 0,1,1,0` | holds |
| 6D isotropy and realization | `ℚ_2`: `⟨1,1,1⟩`, `⟨1⁴⟩`, `⟨−1,−1⟩` | `s = 1 ≠ (−1,−1) = −1`, so both are anisotropic. `⟨−1,−1⟩` realizes `(2,[1],−1)`. `⟨a,−a⟩` forces `s = +1` | holds |
| Ramified-base control | `ℚ_2(π)`, `a = 5` | `(π + 1/2)² − 5/4 = 2 + π − 1 = 1 + π` | holds |
| Clifford vs `w₂`, `n = 3` (L8) | `ℝ ⟨−1,−1,−1⟩` | `A₃ = C(2,2) = 1`, `B₃ = C(4,4) = 1`. Three copies of `(−1)∪(−1)` sum to `(−1)∪(−1) = ι[ℍ]` | holds |
| Discriminant Checks (L3) | `⟨1,−1⟩`, `⟨1,1⟩` | `d = [−1], [1]`; `d± = [1], [−1]` | holds |

## Not verifiable

These texts are settled `uncertified` in the manifest and none is in the sources cache. I cited them by locator and did not request them.

- Lam 2005: III.2.7, III.2.11, III.4.2, V.3.4, V.3.12, V.3.16–V.3.21, p. 119, and the Wall caution on p. 120.
- Serre, *A Course in Arithmetic*: III.1.1–1.2, Thms 1–2, IV Thms 5–7, Prop. 6.
- Serre, *Local Fields*: X; XIV §2, Props. 4–5.
- O'Meara 1963: 63:1, 63:2, 63:11–13, 63:17–23.
- Gille–Szamuely: 1.1.9, 1.5.2, 4.4, 4.7.
- Scharlau: Ch. 2 §5.
- Delzant 1962.
- Milnor 1970 §4.

The sampled targets that rest partly on these are "The Hasse invariant", "Classification in dimension at most three", "The Clifford invariant", "The `I²` homomorphism" (step 3), "The classical construction" (index theorem), "Milestone 1" (63:17–18) and "Milestone 2" (XIV §2). Their mathematical content is recomputed in the table above.

## Source issues

- none
