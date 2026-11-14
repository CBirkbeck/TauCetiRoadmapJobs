# PKG-SpectralSequencesAndConvergence

Package of the accepted design of `SpectralSequencesAndConvergence`: `packages/SpectralSequencesAndConvergence/README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.KT"`), `sources.toml`, and the `gaps` list of `design/plan.json`. Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are the design's baseline pins.

The README keeps every target, Check, worked example and locator of the design (31 targets, seven layers). The accepted review (REV~8) had no findings. Its one note for human reviewers concerns the six settled uncertified sources; no text change follows from it.

## Headline theorems

| # | Headline (README) | Status | Lean name, or what is missing |
|---|---|---|---|
| 1 | Bounded below ⇒ regular, bounded above ⇒ coregular, with explicit pages (2.2; Stacks Lemma 24.8 (4), (5)) | stated | `dFrom_eq_zero_of_boundedBelow`, `dTo_eq_zero_of_boundedAbove` (needs `BidegreeAssignment`) |
| 2 | Euler characteristic of a filtered complex with a degreewise-finite filtration and a weak Serre class (5.3; Stacks Lemma 24.12) | stated | `sum_negOnePow_homology_eq_sum_negOnePow_page` |
| 3 | Convergence in one degree of the spectral sequence of a spectral object over `EInt` (4.3–4.4; Stacks Lemma 24.13 in spectral-object form) | stated in the form available at the pins: canonical page-to-`EInfty` maps are isomorphisms, the differentials vanish, the abutment filtration is finite | `HasConvergenceBounds`, `convergence_of_hasConvergenceBounds`. The convergence *structure* of 3.2 is not statable (row 7). |
| 4 | Stacks Lemma 24.13 for filtered complexes (5.3) | contained in 3 | Its hypotheses are `HasConvergenceBounds` for `CochainComplex.spectralObject (filtrationFunctor G hG)` with bounds `−p₀`, `−p₁`, through Tau Ceti `spectralObjectHIsoCokernel` (README 5.3 route) |
| 5 | Comparison theorem for spectral objects (4.6) | stated | `isIso_hom_app_abutment_of_hasConvergenceBounds` |
| 6 | Comparison for exhaustive filtrations bounded below, abelian category with exact sequential colimits (3.5 with 5.4; Weibel 5.2.12, 5.5.1) | stated | `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow` |
| 7 | Weak/ordinary/strong convergence of an arbitrary spectral sequence (3.2), general comparison (3.5), Euler identity for converging sequences (3.4), consequences (3.6: vanishing, dimension count, two rows, two columns, edge morphisms, five-term sequence) | not statable | Needs the limit page `E_∞` of a spectral sequence in Mathlib's carrier (1.4). That is the meet of the cycle tower modulo the join of the boundary tower of 1.2, a recursive construction over pages with transported subquotient presentations. Neither library has it. |
| 8 | Mathlib's first- and third-quadrant sequences converge (4.5) | not statable as a convergence structure (row 7) | The page-wise identification is at the pins already: Mathlib `spectralSequencePageXIso` plus `isoMapFourδ₁Toδ₀'`/`isoMapFourδ₄Toδ₃'`, with hypotheses from `IsFirstQuadrant`/`IsThirdQuadrant`. Restating it would be padding. |
| 9 | Classical convergence theorem for exhaustive filtrations bounded below (5.4; Weibel 5.5.1) | not statable | A regular, non-coregular position has a boundary tower with no last term, so `E_∞` (1.4) is needed. Its comparison consequence is row 6. |
| 10 | Spectral sequence of an exact couple, its towers, identification with spectral objects and filtered complexes (6.1–6.3) | not statable | No bigraded exact couples at the pins (planned in StableHomotopyKTheory §7.22). |
| 11 | Repleteness ⇔ `CountableAB4Star` + `lim¹ = 0` for epimorphic towers (7.2) | stated | `isReplete_iff_countableAB4Star_and_epi_towerDifference` |
| 12 | Mittag–Leffler towers have `lim¹ = 0` in a replete abelian category with countable products (7.2) | stated | `epi_towerDifference_of_isMittagLeffler` (needs `IsMittagLeffler`) |
| 13 | Boardman's conditional-convergence theorems and whole-plane obstruction (7.4) | not statable | Needs exact couples (row 10), `E_∞` (row 7), and `RE_∞ = lim¹` of the cycle tower (1.2). |
| 14 | Complete convergence theorem (7.5; Weibel 5.5.10) | not statable | Needs `E_∞` at regular, non-coregular positions and `W^n` of the couple of 6.3. |

Treated as README targets rather than headlines: Boardman's double-tower sequence (7.3, a tool for 7.4), the page Euler step (2.3, the lemma behind row 2), "enough projectives ⇒ replete" (7.2), completeness through `lim¹` (7.1), and the constructions of Layer 1.

`Suggested.lean` declares three definitions with real bodies on native carriers: `BidegreeAssignment` (structure), `HasConvergenceBounds` and `IsMittagLeffler` (predicates). It declares eight theorems with `sorry`. It has a single `import Mathlib` plus five `TauCeti.*` modules, and no `set_option`, `lemma`, `#eval` or sorry'd data.

## Corrections to the design (all carried into the README)

1. **Euler identity at the source's generality.** Stacks Lemma 24.12 (stacks-012K line 3175–3177) assumes only that the filtration on each `K^n` is finite. The Lean statement and README 5.3 now assume degreewise finiteness, not `F a = ⊥`, `F b = ⊤` globally. An instance where the global form fails but the theorem applies is in the adversarial table. The target sits in 5.3, with a pointer from 3.4.
2. **4.4 and 5.3: no order between the bounds.** The design required `a ≤ b` and `p₁ ≤ p₀`; neither is used. The stabilisation page is now `max(2, q − a + 2, b − q + 1)`, which is at most `b − a + 1` when `a ≤ q < b`.
3. **7.2: enough projectives ⇒ replete needs no other hypothesis.** The design assumed an abelian category with countable products. The lifting argument works in any category, because `TauCeti.IsReplete` only constrains limit cones that exist.
4. **Supplier gap (StableHomotopyKTheory §7.22).** The design's contract listed "morphisms of exact couples" under §7.22, but §7.22 on main defines exact couples and derived couples only. Declared `gap:exact-couple-morphisms` in `design/plan.json` and in the README contract (needed for the functoriality in 6.1 and 6.3).
5. **Stacks numbering.** Bounded below ⇒ regular is Lemma 24.8 (4), bounded above ⇒ coregular is (5). The README now also notes that Stacks' "bounded" (Definition 24.7 (3)) is equivalent to "both" by Lemma 24.8 (3). The weak Serre class is cited as Definition 10.1 (2), tag 02MO, with its characterisation Lemma 10.3, tag 0754, matched to Mathlib's `ContainsZero`, `IsClosedUnderKernels`, `IsClosedUnderCokernels` and `IsClosedUnderExtensions`. All tags were checked in stacks-012K (lines 1151, 1177, 2966, 3010, 3107, 3120, 3175, 3202, 3715, 3725).
6. **New README material for the Lean definitions and theorems.**
   - `HasConvergenceBounds` (4.4) has four API facts and four Checks. The Checks cover: optimal bounds for `ℤ →(×2) ℤ`; a monomorphism at the top without convergence; the non-exhaustive complex; the shrinking-target complex.
   - `IsMittagLeffler` (7.2) has six API facts and two new Checks, alongside the existing ones.
   - The comparison theorem of 5.4 is now an explicit target, with a Check.
   - 4.6 states its theorem explicitly, gives a route that avoids Layer 3, and adds a negative Check (pages isomorphic, `H^0` not).
   - The Euler target has two Checks: signs over `ℚ` and `𝔽₂`, and finite support.
7. **Kept variants recorded in Scope and ownership.** 4.4 and 4.6 weaken Tau Ceti's endpoint vanishing to an isomorphism condition. The 5.4 comparison is the abelian-category form, with hypotheses that neither contain nor are contained in Tau Ceti's module theorem. Supplier text records that Mathlib has a weaker-than-vanishing criterion (`isIso_map_fourδ₄Toδ₃`) for the second canonical map, but not the `i₀ = ⊥` monomorphism criterion of 4.3.

Notions moved down from later roadmaps: none.

## Duplication sweep

Every object was searched by meaning in the pinned Mathlib and Tau Ceti sources, on main, and in the open roadmap pull requests (`roadmaps grep`). Search terms included: limit page, `CategoryTheory.SpectralSequence`, `towerDifference`, `IsReplete`, Mittag–Leffler, exact couple, bidegree assignment, whole-plane, conditional convergence.

- **No target deleted.** The design was already clean against the pins and the roadmaps, and no new duplicate has appeared since.
- **No other owner of the core material.** Nobody else plans a limit page, a convergence structure, an abelian `lim¹`/repleteness characterisation, or a categorical Mittag–Leffler condition. Tau Ceti has only `TauCeti.ModuleTower.IsMittagLeffler` for modules (a README Check now compares them).
- **Added to Scope and ownership: EnhancedDerivedSheaves E2:towers.1, E2.1, E2.2** (on main). These cover derived limits, countable products, the Milnor sequence and pro-zero vanishing for module sheaves on a replete topos, with the topos notion of repleteness. Layer 7 states no derived limit; its abelian `lim`/`lim¹` and Tau Ceti's categorical repleteness are distinct objects.
- **Added Tau Ceti `TauCeti.isReplete_lightCondMod`** (light condensed modules are replete) to the supplier contract and a Check.
- **Consumers, not owners:** InverseGaloisAndArithmeticFundamentalGroupsPartII and PerfectoidTowers (open) only use Mathlib's carrier. The Mittag–Leffler mentions in ArithmeticGaloisDuality, SelmerIwasawaCohomology and others are module towers.
- **Ownership against open pull requests** was checked with the roadmaps tool against all 464 open heads. Overlaps were rechecked: no other pull request changes this roadmap, and no cited id is dropped.
- **Name collisions:** no declaration of `Suggested.lean` shares a fully qualified name with a declaration in another roadmap; the namespace `TauCetiRoadmap.SpectralSequencesAndConvergence` occurs nowhere else.
- **Citation check:** `roadmaps resolve` on the final README reports no unresolved cross-roadmap citations. Its Lean-name check could not consult the pinned packages on this host, so every backticked library name (185 candidates) was checked by hand against the pinned sources. All resolve except `DoubleComplex.edgeBottom` and `DoubleComplex.edgeLeft`, which are DerivedModuleAlgebra's own §S.1 names (its name table, cited as such).

## Adversarial pass

ℓ is a prime (2 and 3 checked); "native" positions are those of Tau Ceti's `CochainComplex.spectralSequence`; `G_t = F^{−t}`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `BidegreeAssignment` (2.1) | `(p,q) ↦ (p,p+q)` on `up' (r,1−r)`, r = 2, 3; classical assignment on native positions; `(p,q) ↦ (q,p+q)`; `(p,q) ↦ (p,p)` | Δfil = r, Δdeg = 1, e = 0. Native classical: `−(q+1−r)−1 = fil + r − 1`, so e = 1. `(q,p+q)`: Δfil = 1−r, giving e = 3 at r = 2 and e = 5 at r = 3, not constant. `(p,p)` sends (0,0) and (0,1) to the same pair. | Fields fix the convention; non-examples are excluded | none |
| `dFrom_eq_zero_of_boundedBelow` (2.2) | E₂ example `E^{0,1}=E^{2,0}=ℤ`, `d₂=×2`; first quadrant; wrong model with `β(n)` in place of `β(n+1)`; κ empty | β(1)=1, β(2)=3. At (0,1): r ≥ 3−0+0 = 3, so page 2 (d₂ ≠ 0) is excluded and d₃ = 0. First quadrant β(n) = n+1 gives r ≥ q+2, matching Stacks' r > max(p,q+1). The wrong model gives r ≥ 1 and would claim d₂ = 0, which is false. κ empty: vacuous. | correct | docstring cites Lemma 24.8 (4) |
| `dTo_eq_zero_of_boundedAbove` (2.2) | same E₂ example; wrong model `α(n)` in place of `α(n−1)` | α(1) = −1: at (2,0), r ≥ 2+1 = 3, so the entering d₂ = ×2 is excluded. Wrong model: α(2) = 1 gives r ≥ 1 and claims d₂ = 0, which is false. First quadrant α = −1: r ≥ p+1. | correct | Lemma 24.8 (5) |
| `sum_negOnePow_homology_eq_sum_negOnePow_page` (5.3) | `ℚ →(×2) ℚ` stupid filtration; same over `𝔽₂`; sign `(−1)^p`; s = ∅; doubly infinite acyclic `⊕_k (ℚ →id ℚ)` in degrees (2k, 2k+1) with `F^pK^m = K^m` iff `p ≤ m` | Over ℚ: page 2 has ℚ at (1,−1), (3,−2); sum 1 − 1 = 0; H⁰ = H¹ = 0, sum 0. Over 𝔽₂: d = 0, page sum 0, H sum 1 − 1 = 0. Sign `(−1)^p`: −1 − 1 = −2 ≠ 0, excluded. s = ∅: all zero, 0 = 0. Infinite complex: degreewise finite, not globally finite; E₁^{p,0} = ℚ, d₁ = id from 2k to 2k+1, native page 3 is zero, so s = ∅ and H = 0, 0 = 0. The global-finiteness form does not apply there. | correct after widening | global finiteness → degreewise finiteness (Stacks' hypothesis) |
| `HasConvergenceBounds` (4.4) | ×2 complex, n = 1; zero filtration of ℤ, n = 0; non-exhaustive identity complex, n = 0; shrinking-target complex of 1.4, n = 0; first quadrant | ×2: a = −2, b = 0 hold. a = −1 fails (`H¹(G₋₁) = ℤ`); b = −1 fails (`ℤ → ℤ/2`). Zero filtration: top `0 → ℤ` is mono, not iso, so it fails. Non-exhaustive: `ℤ → 0`, not mono. Shrinking target: `H¹(G_i) = ℓ^{−i−1}ℤ ≠ 0` for all i, so the bottom fails. First quadrant: `isZero₁` gives i ≤ 0; `isZero₂` kills `H^{n−1}(j ≤ ⊤)` and `H^n(j ≤ ⊤)` for j ≥ n+1. | determines intended class; positive and negative examples | a ≤ b dropped |
| `convergence_of_hasConvergenceBounds` (4.4) | ×2 complex at q = −2, −1, 5; zero filtration; check of the boundary-side step | q = −2: r ≥ max(2,2,3) = 3, page object ℤ/2 = EInfty = F₋₁H¹/F₋₂H¹. q = −1: page 0 = EInfty = ℤ/2 / ℤ/2. q = 5: both 0. Page 2 (entering ×2) is excluded. Zero filtration: the mono condition gives page = EInfty = 0, but abutment ℤ is not reached, so the iso condition is needed. Boundary step: B_⊤ ⊆ Z(⊥) by δ∘δ = 0, and Z(⊥) ∩ B_⊤ ⊆ B_j by mono, so B_j = B_⊤. | correct | stabilisation page formula restated |
| `isIso_hom_app_abutment_of_hasConvergenceBounds` (4.6) | identity; `K′ = ℤ` (deg 0) → non-exhaustive identity complex; Tau Ceti endpoint hypotheses; zero morphism | Identity: iso = iso. K′ → K: E₁⁰⁰ = ℤ → ℤ identity on every page, H⁰: ℤ → 0 not iso, and the top condition fails for K (`ℤ → 0` for j ≥ 0). Tau Ceti hypotheses ⇒ ours via the exact sequence `H^{n−1}(j≤⊤) → H^n(⊥≤j) → H^n(⊥≤⊤) → H^n(j≤⊤)` with outer terms 0. Zero morphism from a nonzero page: page hypothesis fails. | correct; contains Tau Ceti's | negative Check added |
| `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow` (5.4) | ℤ → ℤ_ℓ ℓ-adic; K′ → non-exhaustive complex; identity on the ×2 stupid filtration; complexes zero in degrees n−1..n+1 | ℤ → ℤ_ℓ: E₁ = identity of ℤ/ℓ, H⁰ not onto, bounded-below fails (ℓ^pℤ ≠ 0). K′ → K: pages iso, H⁰ not; exhaustiveness fails in degree −1 (all stages 0 there). Identity: a = −2, G₀ = K, conclusion iso. Zero complexes: H^n = 0 both sides. | correct; neither contains nor is contained in Tau Ceti's module theorem | explicit target, Check added |
| `isReplete_iff_countableAB4Star_and_epi_towerDifference` (7.2) | ModuleCat ℤ; trivial category; discrete Gal(ℚ̄/ℚ)-modules; light condensed modules | ModuleCat: tower ℤ/ℓ^{n+1}, 1 − s onto (x₀ = 0, x_{n+1} lifts x_n − y_n). Trivial category: both sides true. Discrete modules: lim of μ_{ℓ^n} = 0, so not replete; the right side must fail and the statement does not contradict this. Light condensed modules: replete (Tau Ceti), so the right side holds. Shear: `f_n x_{n+1} + (x_n − f_n x_{n+1}) = x_n`. | correct | none |
| enough projectives ⇒ replete (7.2, README) | Type; ModuleCat with `Small.{v} R`; category with a tower lacking a limit | Type: all sets projective, Type replete, consistent. Missing limit: IsReplete is vacuous on cones that do not exist. The proof uses only lifting along epimorphisms and the universal property of the given limit cone. | correct without abelian/products | hypotheses removed |
| `IsMittagLeffler` (7.2) | ×ℓ on ℤ; zero transitions on ℤ/ℓ; ℤ/ℓ^{n+1} ↠ ℤ/ℓ^n; ModuleCat agreement; Stacks Def 31.2 | ×ℓ: images ℓ^{k−n}ℤ strictly decrease, so no m. Zero transitions: images 0 for k > n, so m = n+1. Epi tower: m = n. Mathlib's `Functor.IsMittagLeffler` (range of `F_m → F_n` contained in every range) is equivalent for k ≥ m by antitonicity. Stacks: "c(i) ≥ i, Im(A_k → A_i) = Im(A_c → A_i) for k ≥ c", the same. | determines object; wrong model "eventually epimorphic" rejects the zero tower | none |
| `epi_towerDifference_of_isMittagLeffler` (7.2) | zero-transition tower; ×ℓ; finite groups | Zero transitions: s = 0, 1 − s = id, epi. ×ℓ: not ML, lim¹ = ℤ_ℓ/ℤ ≠ 0, consistent. Finite groups: ML, lim¹ = 0, agrees with Tau Ceti's module theorem. Neeman's category: exact products, not replete; the hypothesis excludes it. | correct | none |
| 4.4 stabilisation page | a ≤ q < b; ×2 example | `max(q−a+2, b−q+1) ≤ b−a+1` ⇔ q ≤ b−1 and q ≥ a; ×2 at q = −2: max(2,3) = 3 = b−a+1 | correct | formula made explicit |
| 5.3 route | translation of bounds | `H^m(⊥ ≤ i) = H^m(G_i) = H^m(F^{−i}K)`; i ≤ −p₀ ⇔ −i ≥ p₀; j ≥ −p₁ ⇔ −j ≤ p₁ | correct | route added |
| Supplier claim: Mathlib criteria for `mapFourδ₄Toδ₃'` | Mathlib `EpiMono.lean` | `isIso_map_fourδ₄Toδ₃`: map `H^{n−1}(i₂ ≤ i₄) → H^{n−1}(i₃ ≤ i₄)` zero; `isIso_mapFourδ₄Toδ₃'`: `H^{n−1}(i₃ ≤ i₄) = 0`; no `i₀ = ⊥` monomorphism criterion | README text matches the pin | wording corrected before submission |
| Gap `exact-couple-morphisms` | StableHomotopyKTheory §7.22 on main | The section defines couples, derived couples and pages; it has no morphism notion (§7.23's naturality concerns filtered spectra) | genuine gap | declared |
| Context of every Lean statement | `#check @` of all 11 declarations | All binders explicit in each signature (`[Abelian C]`, `[HasColimitsOfShape ℕ C]`, `[HasExactColimitsOfShape ℕ C]`, `[HasCountableProducts C]`, `[TauCeti.IsReplete C]`, the four `ObjectProperty` classes); no section `variable` is used | nothing lost | none |

Rows for design targets that this package did not change (1.1–1.4, 2.3, 3.1–3.6, 4.1–4.3, 4.5, 5.1–5.2, 6.1–6.3, 7.1, 7.3–7.5) are the accepted review's computed rows (REV~8). Their statements are unchanged here, apart from the locator and wording fixes listed above.

## Elaboration

`lake env lean packages/SpectralSequencesAndConvergence/Suggested.lean`, run from the content checkout. The Tau Ceti module `TauCeti.CategoryTheory.Preadditive.TowerDifference` had no object file and was built first with `lake build TauCeti.CategoryTheory.Preadditive.TowerDifference`. Outcome: **8 warnings, all `declaration uses 'sorry'`** (lines 96, 108, 144, 169, 188, 218, 244, 264), and no other message.

`#check @` comparison: all 11 declarations were checked in one scratch copy of the file. Each elaborated type matches its README statement. No binder had been dropped, because every declaration carries its binders in its own signature and there is no section `variable`. Nothing changed as a result.

## Dependency check

```
depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 18 of the merge order, right after StableHomotopyKTheory. Its other suppliers (DGFloer, AlgebraicTopology, DerivedModuleAlgebra) are on main.

## Sources

No source was fetched and `needs-references.toml` was not written: every cited text is in the manifest, and the uncertified ones are settled. `sources.toml` changes:

- the `stacks-012K` locator gains tags 02MO and 0754 (weak Serre classes);
- `bhatt-scholze2015.authors` is now a list.

What the README cannot support from a read text: the statements whose only direct locators are settled uncertified works. These are 3.5 and 4.6 (Weibel 5.2.12, Eilenberg–Moore §7), 5.4 (Weibel 5.5.1), the 5.4 comparison (Weibel 5.2.12, 5.5.1), 6.1 (Massey, Weibel 5.9) and 7.5 (Weibel 5.5.10). Their mathematics was checked independently (table above and REV~8). StableHomotopyKTheory's references point to a copy of Boardman's paper on Ravenel's departmental page; since `boardman1999` is settled as uncertified, it was not fetched.

No suspicious instruction was found in any text read.
