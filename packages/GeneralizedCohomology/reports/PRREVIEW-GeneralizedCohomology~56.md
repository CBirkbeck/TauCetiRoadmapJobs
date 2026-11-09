# Review of GeneralizedCohomology (pull request #1807 at 5004f71)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/GeneralizedCohomology/` at 5004f71: `README.md` (4101 lines) and `Suggested.lean` (116 lines, four theorems).

**Checks re-run on this head.**

- **Gate.** The worker's gate passes. My re-run reports only `outside-folder` 24, and all 24 files are in the 14 folders this pull request owns, so that is not a finding.
- **Dependency check.** `depcheck: 236 roadmaps, 2292 edges, 0 problem(s)`: no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` gives 4 `sorry` warnings and no errors (21 s).

## Previous review (6d06f1d): status of R01–R13

| Id | Status at 5004f71 | Evidence |
|---|---|---|
| R01 upward/cyclic suppliers | repaired | depcheck clean; no HomotopySpheres, OperatorKTheory or PR284 text; TangentialBordism and StringOrientation appear only in consumer sentences (lines 3002, 3183, 4021, 4027) |
| R02 sorry'd data, `set_option` | repaired | four `theorem`s and no `def` (gate `sorry-data` 0, `set_option` 0) |
| R03 headlines | partly | four headlines stated; the Kan–Quillen headline is statable but called unstatable (R01 below) |
| R04 re-planned pinned objects | partly | "From Tau Ceti" contract (lines 191–236) added; G2.1 still builds Tau Ceti's SSet weak equivalences (R01) |
| R05 HigherToposTheory double ownership | not repaired | #1901 still owns the same objects (R02) |
| R06 `projectiveEMComparisons` | repaired | lines 278–280 cite CharacteristicClasses C1.5a |
| R07 commit-pinned blob links | repaired for roadmaps | three Mathlib commit links remain (R08) |
| R08 realization product comparison | repaired in this folder | old → new line at 81–82; declaration deleted; the description orders this pull request first |
| R09 padding | repaired | probe below: nothing closes in one tactic |
| R10 imports and names | repaired | `import Mathlib` plus two `TauCeti.*` modules; all four names occur in the README (961, 1926, 3674, 3678) |
| R11 PR numbers, process words | partly | Mathlib PR numbers remain at 4066–4068 (R08) |
| R12 wrong locators | partly | HTT A.2.6.15 (1371), 5.2.7.12 (1566) and HA 4.8.1.14 (1698) fixed; TeX labels and missing or partial locators remain (R05) |
| R13 README shape | partly | house shape now present; no API bullets, and several definitions have fewer than three Checks (R07) |

## R01 (P2) — The Kan–Quillen headline is statable at the pins but declared unstatable, and G2.1 re-plans Tau Ceti's weak equivalences

**Location.**
- `Suggested.lean` lines 24–27: "Mathlib has the generating classes … but no class of weak equivalences of simplicial sets and no `ModelCategory SSet`".
- README line 173–174: "Mathlib has no class of weak equivalences of simplicial sets … G2.1 builds them".
- README lines 521–522: "Define a simplicial weak equivalence to mean that its realization induces a bijection on path components and isomorphisms on all based homotopy groups".

**Claim.** Pinned Tau Ceti already defines this class. Mathlib supplies cofibrations and fibrations. Together these make the Kan–Quillen model structure and the unit half of the realization ⊣ Sing Quillen equivalence statable with no new definitions. The counit half is CharacteristicClasses C1.2's. Both are headlines by the docstring's own list, so both must be stated.

**Witness.**
- `TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean:60` declares the scoped instance `SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences`.
- `SSet.modelCategoryQuillen.weakEquivalence_iff` elaborates as `WeakEquivalence f ↔ (TopCat.Hom.hom (SSet.toTop.map f)).IsWeakHomotopyEquivalence`.

**Repair.** Add the following, with docstrings and the locator Quillen, *Homotopical Algebra*, Ch. II §3. I elaborated it on a scratch copy at the pins: two `sorry` warnings, no errors.

```lean
import TauCeti.AlgebraicTopology.SimplicialSet.WeakEquivalence
open HomotopicalAlgebra
open scoped SSet.modelCategoryQuillen

theorem kanQuillen_modelCategory :
    ∃ M : ModelCategory SSet.{0},
      M.categoryWithWeakEquivalences = SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences ∧
      M.categoryWithFibrations = (inferInstance : CategoryWithFibrations SSet.{0}) ∧
      M.categoryWithCofibrations = (inferInstance : CategoryWithCofibrations SSet.{0}) := by
  sorry

theorem sSetTopAdj_unit_weakEquivalence (X : SSet.{0}) :
    WeakEquivalence (sSetTopAdj.unit.app X) := by
  sorry
```

Then:
- Delete the Kan–Quillen bullet from the "not statable" list.
- Replace README 173–174 with a "From Tau Ceti" entry for `SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences` and `weakEquivalence_iff`.
- In G2.1, replace "Define a simplicial weak equivalence …" with "Consume …", keeping the Kan-group criterion as a target.

## R02 (P2) — Three objects have a second owner in an open pull request, and neither side's text settles it

**Location.**
- README lines 59–63 and 4029: "HigherToposTheory consumes G2.1's Kan–Quillen model structure and the G2.11 foundations".
- Lines 3230–3239: "Own here the complex graded Clifford conventions: ℤ/2-graded C*-algebras, graded Hilbert modules … Cl₂→M₂(ℂ) … Cl₁⊗̂Cl₁→Cl₂, e⊗1↦e₂".
- Line 961: "Prove `numerableFiberBundle_hurewicz`", with `Suggested.lean` line 59.

**Claim.** Each object below is owned here and also by an open pull request. Two of those pull requests point the hand-off the other way. GeneralizedCohomology is on main, and DGFloer is its consumer (line 4015), so this roadmap is the earlier owner. The other three must cite it.

**Witness.**
- **HigherToposTheory #1901**, README "It owns in particular" (lines 36–40): the Kan–Quillen model structure, the Bergner model, the Joyal model, straightening, Kan extensions and stable ∞-categories. Its "From other roadmaps" (196–197) cites only G2.1's `realizationProductKelleyComparison`.
- **OperatorKTheory #866**, README §5.1 (lines 1133–1152): the same graded C*-algebras, Clifford matrix model and swapped reduction. Its line 2332 says "GeneralizedCohomology consumes K5's graded Clifford conventions".
- **DGFloer #1798**, README lines 1442–1444, under "Own": "*Numerable bundles.* A locally trivial bundle … with an explicit numerable trivializing cover, is a Hurewicz fibration".

**Repair.** In the merge-order paragraph of this pull request's description, name #1901, #866 and #1798 as rebasing after this one, and state what each must cite instead of owning:
- #1901 cites G2.1 (Kan–Quillen) and G2.11 (Bergner, Joyal, straightening, Kan extensions, stable ∞-categories, Ind). Its `realizationProductKelleyComparison` citation follows the old → new line at 81–82.
- #866 cites G5.5's graded Clifford conventions, and its consumer line 2332 is reversed.
- #1798 cites G2.10's `numerableFiberBundle_hurewicz`.

## R03 (P3) — Supplier citations that do not resolve where they are cited

- **`diskBoundarySubset` (line 2325).** It is defined on main (AlgebraicTopology `Suggested.lean:1977`). This pull request's AlgebraicTopology drops it, and the former-name list at its README lines 538–561 does not map it. Its §4.4 (line 845) uses "native `TopCat.disk n`, its actual boundary-inclusion image". **Repair:** "`ordinaryPairQuotient` of `TopCat.disk 4` by the image of Mathlib's `TopCat.diskBoundaryInclusion 4`".
- **EM names (lines 261–263).** `ordinaryEMUniversalClass`, `ordinaryEMRepresentability` and `ordinaryEMRelativeRepresentability` are cited as Stage 8.8c's, as are `ordinaryEMLoopComparison` and `ordinaryCohomologySuspension`. AlgebraicTopology lines 557–561 place the first three in Stage 8.10 and the last two in Stage 8.11b. **Repair:** move each name to its stage.
- **LieGroups sphere fibrations (lines 302 and 894).** These cite "LieGroups Layer 2: … the sphere fibrations of the classical groups". Main's LieGroups Layer 2 (lines 356–445) is the closed-subgroup theorem and SU(2)≃S³, with no sphere fibrations. TopologicalKTheory T1.5a at this head (lines 423–428) constructs the last-vector Stiefel fibrations with sphere fibre. **Repair:** cite T1.5a for the fibrations. Keep LieGroups Layer 2 for closed matrix subgroups.
- **GeometricTopology smoothing comparison.** Lines 314–316 put "the smoothing-and-triangulation comparison" in GeometricTopology Layer 1. Line 2748 links `#the-smoothing-and-triangulation-comparison`, and lines 3875–3876 and 3919 use the same section. Main's GeometricTopology lines 776–778 map that section's item 1 to Layer 11.3, and Layer 11.3 is at line 7887. **Repair:** cite "GeometricTopology §11.3 (item 1, smooth implies PL)", with link `../GeometricTopology/README.md#113-smooth-triangulations-and-combinatorial-manifolds`, at all four places and in the G5.0 and G5.7 dependencies.
- **SpinGeometry `cliffordScalarTrace` (lines 307 and 3324).** The name resolves on main (SpinGeometry line 233). The open revision #1674 keeps §1.3's scalar trace τ and τ_ℂ (its lines 328–335) but names only `cliffordScalarTrace_exists`. **Repair:** cite "SpinGeometry G1.3's scalar-part trace τ and its ℂ-linear extension τ_ℂ" so the citation survives either head.

## R04 (P3) — The docstring's reason for Brown representability is inaccurate at the pins

**Location.** `Suggested.lean` lines 35–36: "there is no homotopy category of pointed connected CW complexes with its wedges and subcomplex triads".

**Claim.** The pinned Tau Ceti has both carriers named. The real missing carrier is a CW structure on a wedge of CW complexes. The README's G1.1 and G3.1 also do not consume these carriers.

**Witness.**
- `TauCeti.PointedHomotopyCat` (`AlgebraicTopology/Homotopy/PointedHomotopyCat.lean:122`) and `TauCeti.WedgeSum` (`Topology/WedgeSum.lean:78`).
- `Topology/CWComplex/Classical/` has a CW structure for a wedge of circles only (`WedgeCircles.lean`).

**Repair.**
- Reword the bullet: "Tau Ceti has `TauCeti.PointedHomotopyCat` and `TauCeti.WedgeSum`, but no CW structure on a wedge of CW complexes other than circles, so the wedge axiom on connected pointed CW complexes is not statable without an ad hoc encoding".
- Add both carriers to the "From Tau Ceti" contract and to G1.1's and G3.1's *Needs:* lines.

## R05 (P3) — Locators that do not support the statement, TeX labels, and seeded targets with no locator

- **G3.1, line 1853: Cohen, Theorem 10.3, p. 282.** This is Adams's variant for abelian-group-valued functors on finite based CW complexes (`CohenBMH` lines 10000–10004, 10035–10041). It does not support set-valued Brown on arbitrary connected CW complexes. Hatcher 4E.2 does. **Repair:** drop Cohen 10.3, or cite it as "the finite-complex variant".
- **G4.3, lines 2538–2539: Cohen, Theorem 10.40, p. 330.** It assumes "a connective ring spectrum" and a "connected space X" (`CohenBMH` lines 11933–11935). The target drops both. **Repair:** say Cohen proves the connective, connected-base case. Cite a source for the general case, or give the comparison-theorem route (G3.3) as the proof.
- **G2.2, lines 561–563: Hovey, Shipley and Smith, Sections 1–2.** These are symmetric spectra and their smash product only (`HSS` lines 10–18). Model structures are in §§3 and 5. Positive-flat is not in HSS. The S^(k) theory is Hovey 2001, which Tau Ceti's `Spectra/SphereMonoid.lean` cites. **Repair:**
  - HSS §3.4 (Theorem 3.4.4, p. 35) for the stable model;
  - `ShipleyConvenient` for positive flat;
  - Hovey, *Spectra and symmetric spectra in general model categories* (JPAA 165, 2001) for S^(k).
- **G5.1, lines 2879–2880: Cohen, Theorem 10.43, p. 334.** It gives the complement model DX ≃ Σ^−(n−1)Σ∞(Sⁿ−X) of a finite complex (`CohenBMH` lines 12109–12112). Biduality, DP∧E ≃ F(P,E) and "finite = compact = dualizable" have no locator. **Repair:** add a locator for each, or scope the citation to the complement model.
- **TeX labels.** Line 1298 ("HTT 2.2's simfun"), line 1320 ("HTT's weakcompatequiv") and line 1438 ("HTT spek3–spek5") are source labels. None occurs in `LurieHTT`'s text. Lines 1020, 1048, 1089, 1123 and 1189 write "HTTA.3.x". **Repair:** cite printed numbers, and write "HTT §A.3.x".
- **Homotopy excision narrowed.** Line 673–674 states it for m,n≥1. Hatcher, Theorem 4.23, allows m,n≥0 with C connected (`HatcherAT` lines 15681–15684). **Repair:** state m,n≥0 with a nonempty connected intersection.
- **Seeded targets with no locator at all.** G1.1, G1.2, G1.4, G1.6, G1.7, G2.4, G2.9, G3.9, G3.10 and G4.4. **Repair:** add one locator per theorem, for example:
  - Hatcher §2.3 axioms (p. 160) for G1.1;
  - Hatcher Theorem 4D.10 (p. 442) is already in the references;
  - Bousfield, *The localization of spectra with respect to homology* (Topology 18, 1979), §2 (Moore-spectrum localizations and completions), for G3.9's completion; this text is not in the sources cache, so verify the exact proposition before citing it.

## R06 (P3) — Build order: a Layer 2 ↔ Layer 4 cycle and incomplete *Needs:* lines

- **G2.9 ↔ G4.0a.** G2.9's *Needs:* line (922) lists G4.0a. G4.0a in turn uses "G2.9's general-topological extension" and CharacteristicClasses C1.1b (2294–2295), and line 2725 says G4.0a "precedes G2.9's computations". **Repair:** split G2.9:
  - G2.9a, the classifier, with *Needs:* C1.1b;
  - G2.9b, the GL_k(ℝ) low-rank table and stabilization maps, placed after G4.0a with *Needs:* G4.0a and TopologicalKTheory T1.5a.
- **G4.0 *Needs:* (2479).** It omits G2.9a and C1.1b (2294), SpinRepresentations Layer 7 (2259), SpinGeometry G4.1 (2361) and AlgebraicTopology Stages 2.5 and 4.4 (2311, 2315).
- **G5.7 *Needs:* (3990).** It omits DifferentialGeometry 12.1 (3938) and AlgebraicTopology Stages 5.5, 6.4 and 8.2 (3745, 3887, 3728). It also omits TopologicalKTheory T1.5 and ComplexKahlerGeometry K7.1 (3879), although the layer's dependencies paragraph (4005) lists the last two.
- **G2.7 before G2.10.** G2.7 (774–776, 801) needs G2.10, which comes later in the same layer. **Repair:** move G2.10 before G2.7, or split its fibration-LES application.

## R07 (P3) — A false Check in G5.5, a Check outside its definition in G5.3, and definitions without API or Checks

- **G5.5, line 3635 (false).** "For n = 0 the operator classifier … represents KO⁰ of a point, ℤ". The section proves representability for n≥1 only (3256). It defines K_op,0 = S⁰ (3262, 3479), and S⁰ has π₀ of two points, not ℤ. **Repair:** "For p = q = 0 the classifier `realMixedCliffordOperatorClassifier 0 0` on the ample universe has π₀ = KO⁰(*) = ℤ, while K_op,0 = S⁰ is the two-point unit level".
- **G5.3, line 2952.** "The diagram of rank-zero bundles gives the sphere spectrum". The definition (2925–2927) requires r_i "increasing cofinally", so constant rank 0 is not an object. **Repair:** "the diagram of trivial bundles εⁱ over a point, r_i = i, gives colim Σ⁻ⁱΣ∞Sⁱ = S".
- **No API bullets, and too few Checks.** No definition carries an API bullet list. Definitions with fewer than three Checks:
  - G3.10's nonabelian lim¹: none;
  - G3.5 and G3.7: none;
  - G3.2's representing spectra: 2;
  - G5.0's stable BSpin: 2;
  - G5.7's Mod_R∞, A_R(B), C_c,R and D_R: 2;
  - G2.11: Bergner, Joyal and marked models, Cat∞, stable ∞-categories, ∞-operads, Ind_κ, C/D and LM^⊗ share 3.

  **Repair:** add API bullets and three Checks per definition. Examples:
  - lim¹ of the constant tower of any group is a point;
  - lim¹ of ℤ ←2 ℤ ←2 ⋯ is ℤ₂/ℤ;
  - Cat∞'s terminal object is Δ[0];
  - in a stable ∞-category Σ is an equivalence, and Σ⁻¹ΣS ≅ S in Sp∞.

## R08 (P3) — Policy and style: Mathlib PR numbers, off-pin commit links, undefined abbreviations and stale item numbers

**Location.**
- Lines 4066–4068: Mathlib "#41744, #44464 and #41735".
- Lines 1139, 3727 and 3733: links to `mathlib4/blob/1e75e9d…` and `6b7abb3…`, not the pin 1b1ccf4.
- Undefined roadmap abbreviations: "TB" (2179, 2817, 3529), "Index" (3185), "Elliptic E2" (1825), "SpinG1.3" (3328) and "DG12.1" (3938).
- Stale item numbers: "item 6" (740), "item 4" (1929), "item8" (2157) and "item4" (3115).

**Claim.** These break the rules against pull-request numbers and against undefined vocabulary. The dependency check cannot see an abbreviated supplier such as "DG12.1".

**Witness.** `SimplexCategory.reedyStructure`, `TopCat.toSSet` and `CategoryTheory.SimplicialNerve` all elaborate at the pin, so the commit links are unnecessary.

**Repair.**
- Cite those declarations by name.
- Drop the PR numbers.
- Write TangentialBordism, IndexTheory, EllipticCohomology E2, SpinGeometry G1.3 and DifferentialGeometry 12.1 in full.
- Replace the item numbers by G2.6, G3.4, G3.8 and G5.4.

## Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `numerableFiberBundle_hurewicz` (G2.10) | B×F with one trivialization and ρ≡1; Möbius band; ι=∅; F=∅; continuity of p | product: `Prod.fst` is Hurewicz (Tau Ceti `HurewiczFibration/Basic.lean:115`); Möbius band: two arcs with a two-function partition; ι=∅ forces B=∅, so Z=∅, vacuous; F=∅: base sets cover B (Σρ=1), so Z=∅; p is continuous on the open p⁻¹(baseSet), which cover Z | true; no hidden hypothesis | none |
| May Ch. 7 §4 Theorem, p. 51 | locator | `MayConcise` lines 2181–2183, printed p. 51: fibration iff fibration over each member of a numerable cover | matches; May works in compactly generated spaces, but the proof uses only path-lifting functions, valid in Top since I is locally compact | none |
| `homologyComparison` (G3.3) | f=id; X=∅; ∏ℕH_* versus H_*(−;∏ℤ) on ∨ℕS¹; ℤ→ℚ | ∅: `IsAdditive` (EilenbergSteenrod.lean:303) makes both sides 0; non-additive pair: ⊕ℕ∏ℤ ≠ ∏ℕ⊕ℕℤ, excluded by additivity; Hom includes δ-compatibility `w` (line 79), so the five lemma applies; ℤ→ℚ fails `hpt` | true | none |
| Hatcher Prop 3.17, p. 217 | locator | `HatcherAT` line 9415, PDF p. 226 = printed 217; infinite-dimensional case "left for the reader" (9437–9441) | matches; see Source issues | none |
| `stableStem_isOfFinOrder` (G5.6) | (n,k)=(0,3),(2,5),(0,2); Hopf case | π₄S³=ℤ/2, π₈S⁵=ℤ/24, both torsion; (0,2): π₃S²=ℤ, excluded since 2≥3 fails; π_(4m−1)S^(2m) needs 2m≥2m+1, excluded | true, range sharp | none |
| Hatcher SSAT Thm 1.21, p. 32; Cohen 10.19, p. 294 | locators | `HatcherSSAT` line 1946 (PDF 32); `CohenBMH` line 10477 (PDF 306 = printed 294), "finite for q>0" | match | none |
| `rationalHurewicz` (G5.6) | k=0; k=1,n=0; S² with k=2; S³ with k=3; CP∞ with k=2 | k=0: 2k−1=0 in ℕ, vacuous; k=1: π₁→H₁(X;ℚ) onto (abelianization); S²: ℚ→ℚ iso in degree 2, ℤ→0 onto in degree 3 (3>2k−2, so the kernel is not asserted); S³: π₄=ℤ/2 in kernel, torsion; CP∞: π₂=ℤ→ℚ iso, π₃=0 | true, matches Klaus–Kreck ranges | none |
| Kan–Quillen headline (G2.1) | Δ[1]→Δ[0]; ∂Δ[1]→Δ[0]; probe | Δ[1]→Δ[0] is a weak equivalence (Tau Ceti `weakEquivalence_of_stdSimplex`); ∂Δ[1]→Δ[0]: |∂Δ[1]| has 2 components; probe elaborates | statable, absent | R01 |
| G1.1 Checks | wedge W of ℕ circles; f_n=(−1)ⁿ | H̃¹(W)=∏ℕℤ is uncountable, ⊕ℕℤ is countable; f_(n+1)σ=(−1)ⁿ⁺¹σ versus σf_n=(−1)ⁿσ | hold; no locator | R05 |
| G1.2 Checks | ∅, *, S⁰ | Eⁿ(∅)=0=Ẽⁿ(∅₊); Eⁿ(*)≅Eⁿ(*)⊕0; Eⁿ(S⁰)=Eⁿ(*)² | hold; no locator | R05 |
| G1.4 suspension and Koszul laws | twist on S¹∧S¹ and S²∧S²; a×σ(b) | degree −1 = (−1)^(1·1); degree +1 = (−1)^(2·2); a×(ι×b)=(−1)^p ι×a×b | hold; no locator | R05 |
| G1.6 δ(i*a∪b)=(−1)^p a∪δb | (D¹,S⁰), p=0 | sign (−1)⁰=+1, δ(1∪b)=δb | holds; no locator | R05 |
| G1.7 circle ring | E=KU; E=HF₂ | KU⁰(S¹)=ℤ⊕KU⁻¹(*)=ℤ; KU¹(S¹)=0⊕ℤ=ℤ; over F₂, 2σ²=0 is vacuous, and the null diagonal gives σ²=0 | hold; no locator | R05 |
| G2.1 Checks | horn Λ²₀→Δ[1] with vertices 0,1,0; ∂Δ[2] | the missing edge would be 1→0, absent; π₁|∂Δ[2]|=ℤ | hold | none |
| G2.2 Day square and F₁S¹ | level 2 of S⊗S; level n of F₁S¹ | (0,2)+(2,0)+(1,1)=1+1+2 copies of S²; Σ_n/Σ_(n−1) gives n copies of Sⁿ (`HSS` line 1089) | hold; HSS §§1–2 locator does not support the model claims | R05 |
| G2.4 Checks | S/2; ΣS | LES: ℤ→2ℤ→π₀(S/2)→π₋₁S=0, so ℤ/2; π₋₁(S/2) sits between π₋₁S=0 and π₋₂S=0, so 0; π₁ΣS=π₀S=ℤ | hold; no locator | R05 |
| G2.5 Freudenthal and signs | S², S¹; grid (2,2),(4,n); interleave n=2,3 | π₂S²≅π₃S³; π₃S²→π₄S³=ℤ/2 onto; k=1 iso range empty; C(2,2)C(2,2)=1 gives −1; C(4,2)=6 gives +1; inversions 1 and 3 give −1, −1 | hold; Hatcher 4.23 narrowed | R05 |
| G2.9 GL_k(ℝ) table | k=0…6; stabilization; actions | GL₀ trivial; ℝˣ gives ℤ/2,0; SO(2)=S¹; SO(3)=RP³ gives ℤ/2,ℤ; SO(4) gives ℤ²; diagonal then sum gives ×2 on π₃; reflection swaps (q_L,q_R); [S¹,GL₂]=ℤ⋊ℤ/2=D∞; for odd k the reflection acts as −r∈SO(k), trivially | hold; supplier and order defects | R03, R05, R06 |
| G2.10 Checks | {0,1}→[0,1] | no local trivialization near ½, and the path 0→1 has no lift | holds | none |
| G2.11 Checks | N[1] | quasicategory, not Kan; core is 2 points; Λ²₀ with edges 0→1 and id₀ has no filler | holds; too few Checks | R07 |
| G3.1 Brown | Hatcher 4E.2; Cohen 10.3 | `HatcherAT` 19338–19342, printed p. 449: connected, set-valued, wedge and MV axioms; `CohenBMH` 10000–10041: finite complexes, group-valued | Hatcher matches; Cohen does not | R05 |
| G3.1 Checks | S¹, CP∞, empty wedge | K(ℤ,1)=S¹, K(ℤ,2)=CP∞; ∏ over ∅ is a singleton; H̃⁰(S⁰)=ℤ=π₀ΩS¹ | hold | none |
| G3.4 Milnor | constant tower; ℤ←2ℤ←3ℤ←⋯; Hatcher 3F.8 | lim¹=0; lim=0 (n!∣a) and lim¹=Ext(ℚ,ℤ)≠0; `HatcherAT` line 13729, printed p. 314 | hold | none |
| G3.6 phantom | [S,ΣHZ]; lim¹[ΣS,ΣHZ] | π₋₁HZ=0; lim¹(ℤ,·n)=Ext(ℚ,ℤ) | holds | none |
| G3.9 completion | HZ, HQ, S_ℚ | Ext(ℤ/p^∞,ℤ)=ℤ_p; Ext(ℤ/p^∞,ℚ)=Hom(ℤ/p^∞,ℚ)=0 while ℚ⊗ℤ_p=ℚ_p; S_ℚ=HQ | hold; no locator | R05 |
| G3.10 nonabelian lim¹ | abelian tower | (g)·(h)=g+h−r(g′), the orbits of coker(1−shift) | holds; no locator, no Checks | R05, R07 |
| G4.0 dimensions | Sp(N); V_r; Gr_r; (1,j) basis | 3N+4·C(N,2)=N(2N+1); N(2N+1)−(N−r)(2N−2r+1)=r(4N−2r+1); 4r(N−r); 1, i, j, ji=−k | hold | none |
| G4.4 Euler | TS²; odd rank r; U∪U | e=2·gen (χ=2); −1 on ℝʳ has degree (−1)ʳ=−1, so e=−e; π*e∪U | hold; no locator | R05 |
| G4.5 quaternionic classes | p₁; torus restriction | p₁=−(a₀a₁+a₁a₀)=−2c₂(Cξ); c(Cξ)=Π(1−x_j²), so a_i↦(−1)ⁱe_i(x²) | hold | none |
| G5.0 BSpin | π₁…π₈; w₂(−ξ); ε_kε_(k+1)(−1)^k | 0,0,0,ℤ,0,0,0,ℤ = π_iBO for i≥4; (1+w)⁻¹ gives w₂+w₁²; (−1)^(k²+k)=1 | hold | none |
| G5.1 duality | DΣⁿS; E^q(S); Cohen 10.43 | Σ⁻ⁿS; π₋qE=E₋q(DS); `CohenBMH` 12109–12112 is the complement model only | holds; locator partial | R05 |
| G5.2 Atiyah | point; Sⁿ | S=D(pt₊); Σ⁻ⁿ(S∨Sⁿ)=S∨S⁻ⁿ=D(S∨Sⁿ) | hold | none |
| G5.3 Thom diagram Check | rank 0 constant | excluded by "r_i increasing cofinally" | Check outside definition | R07 |
| G5.4 KSp and MSp unit | [ℍ]=ab⁻¹; (a,b,c,d) | real: a²b⁻¹=4; complex: 2u²·u⁻⁴·u²=2; z₁+jz₂=a+bi+cj−dk | hold | none |
| G5.5 Clifford Checks | e₁,e₂; n=0 | e₁e₂=diag(−i,i)=−e₂e₁, e₂²=1; K_op,0=S⁰ has 2 points, not ℤ | first holds; n=0 Check false | R07 |
| G5.7 Check | free circle action on S¹ | ES¹×_(S¹)S¹=ES¹≃* | holds | none |

## Verified sound

- **Binder check.** `#check @` on all four declarations (`scratch/signatures.md`). No section binder is lost, and each elaborated type matches its README statement: G2.10 at 961, G3.3 at 1924–1926, G5.6 at 3667–3680.
- **Padding probe.** Each theorem was tried with `simp`, `infer_instance`, `rfl` and `aesop` on a scratch copy. None closes. `simp` and `aesop` leave unsolved goals on the stem and Hurewicz statements.
- **Library declarations opened at the pins (36).**
  - Mathlib 1b1ccf4, via one `#check` file:
    - `TopPair.HomologyPretheory` and `Hom` with field `w` (`AlgebraicTopology/EilenbergSteenrod.lean:50, 69, 79`);
    - `IsExtraordinaryEilenbergSteenrod` with `isAdditive` (297–306);
    - `SSet.modelCategoryQuillen.I`/`J`; `HomotopicalAlgebra.ModelCategory` (`ModelCategory/Basic.lean:43`); `ReedyStructure.op`;
    - `SimplexCategory.reedyStructure`; `ForgetEnrichment.enrichedOrdinaryCategory`; `Enriched.FunctorCategory.enrichedHom`;
    - `TopologicalSpace.compactlyGenerated`; `Topology.CWComplex`; `TopCat.diskBoundaryInclusion` (`Topology/Category/TopCat/Sphere.lean:58`);
    - `OnePoint.equivProjectivization`; `onePointHyperplaneHomeoUnitSphere`; `Projectivization.instTopologicalSpace`;
    - `Matrix.linftyOpNormedRing`; `Polynomial.hermite`; `ContinuousLinearMap.instStarOrderedRingRCLike`; `IsPositive.spectrumRestricts`;
    - `EMetricSpace.ofRiemannianMetric`; `ContAction`; `instCStarModuleComplex` (`CStarAlgebra/Module/Constructions.lean:353`).
  - Tau Ceti 2fd255d:
    - `PointedSSet.monoidalCategory` and `symmetricCategory` (`Pointed/Smash/Basic.lean:65, 69`); `monoidalClosed` (`Closed.lean:215`); `circle` (`Circle.lean:115`); `suspensionLoopAdjunction` (`Suspension.lean:47`);
    - `SymmetricSequence.sphereMonoid` (`SphereMonoid.lean:60`); `freeEvaluationAdjunction` (`Free.lean:56, 178`);
    - `Mod.monoidalCategory` (`Mod/Tensor.lean:121`) and `Mod.symmetricCategory` (`Mod/Symmetric.lean:99`); the wedge formula `DayFunctor.isColimitShuffleCofan` (`SymmetricSequence.lean:30`);
    - `IsHurewiczFibration.mem_serreFibrations` (`HurewiczFibration/Basic.lean:90`); `TopCat.serreFibrations` (`SerreFibration/Basic.lean:107`);
    - `HasHomotopyLiftingProperty.zeroSetSDR_liftingInclusion` (`Lifting/Relative.lean:44`); `exists_lift_of_ndrPair` (`RelativeLifting.lean:47`); fibre transport (`Transport.lean:66, 205`);
    - `EmbeddedLieSubgroupData` (`Lie/Subgroup/Embedded.lean:73`); `exists_isSliceChart_of_isClosed_subgroup` (`Atlas.lean:56`);
    - `isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` (`Spin/Covering.lean:108`); `instCompactSpaceRealCliffordSpinGroupZero` (`Spin/Compact.lean:265`); `realSpinThreeEquivQuaternionUnitary` (`Spin/Real/Three.lean:192`);
    - `ContinuousLinearMap.complexify` (`Analysis/Normed/Module/Complexification.lean:409`); `Matrix.linftyOpTopologicalSpace` (`Analysis/Matrix/Normed.lean:33`);
    - `SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences` (R01); `PointedHomotopyCat` and `WedgeSum` (R04).
- **Sources: seeded sample.** All 15 seeded targets are in the table.
  - Verified locators:
    - `HatcherAT`: Prop 3.17 p. 217, Thm 3F.8 p. 314, Thm 4.23 and Cor 4.24 p. 360, Thms 4E.1–4E.2 pp. 448–449, Thm 4D.10 p. 442 (PDF page = printed + 9);
    - `CohenBMH`: Thm 10.3 p. 282, 10.16 p. 290, 10.19 p. 294, 10.40 p. 330, 10.43 p. 334, 10.46 p. 339 (PDF page = printed + 12);
    - `HSS`: Ex. 3.1.10 p. 23, Thm 3.4.4 p. 35, Thm 4.3.2 p. 42, Def. 5.6.1 p. 61;
    - `HatcherSSAT` Thm 1.21 p. 32; `MayConcise` Ch. 7 §4 p. 51;
    - `LurieHTT`: A.2.6.15, 5.2.7.12, 1.2.4.3, 1.2.9.3, 2.2.1.2, 2.4.2.4, 3.3.1.8, 4.2.4.4, and §§A.3.2–A.3.6 by title (A.3.4.13 is the internal-hom bijection, A.3.6 contains the homotopy-limit results);
    - `LurieHA`: 4.8.1.10, 4.8.1.13, 4.8.1.14, 7.3.2.6/7, and §§4.1.8, 4.3.3.
  - Mismatches and missing locators are in R05.
- **Cross-roadmap citations resolved.**
  - AlgebraicTopology at this head: Stages 4.4, 4.5, 4.7, 4.8, 5.0, 5.5, 6.0, 8.2, 8.8c, 8.8d, 8.10 and 8.11b, and the former-name list (538–561).
  - TopologicalKTheory: T1.5a (423), T1.6c `stableOrientedGrassmannianWhitneySum` (762), T7.0 `stableOrientedGrassmannianInverse` (1471), T7.1 (1545–1600).
  - CharacteristicClasses: C1.1b, C1.2, C1.5, C1.5a, C2.1, C2.4, C2.5, C3.2, C3.5.
  - Main: DifferentialGeometry 12.1 (915); SpinGeometry G1.3, G4.1, G5.0, G6.0; HilbertModules H1–H6; CStarAlgebras C5; SelfAdjointSpectralTheory SA-D15–D17 (1099–1103); GeometricTopology Layer 1 and §11.3.
  - Failures are in R03.
- **Overlaps.**
  - #1187 (pin bump), #1808 (stacked) and #1854 change this roadmap. The description's "No open pull request must merge before this one" orders all three after it.
  - #1854's head already carries the R03 and R04 rewordings, so a rebase can take them over.
  - No id that this roadmap cites is dropped by an open pull request, apart from the `cliffordScalarTrace` name in R03. The overlap tool reports no id dropped here that another roadmap cites.
  - #1652's AlgebraicTopology still consumes the realization product comparison from G2.1 (its lines 3810 and 3830). This pull request's AlgebraicTopology Stage 4.5 owns it, and #1652 must rebase on this pull request in any case.
- **Ownership against open pull requests.** I checked by object, with `roadmaps grep`/`show` and the given checkouts, against HigherToposTheory #1901, OperatorKTheory #866, DGFloer #1798, StableHomotopyKTheory #1227 (consumer only), TangentialBordism #942 and StringOrientation #948 (consumers, lines 120 and 61–67), and SpinGeometry #1674 and #1780. Serre finiteness of sphere stems and the rational K(ℤ,n) computation have no other owner; AlgebraicTopology `Suggested.lean:740` states only Hurewicz modulo a Serre class. The notions that moved down into this roadmap are G5.5's graded Clifford conventions (formerly OperatorKTheory K5) and G2.11 (formerly BordismFormalGroups F6.5). Ownership against the other open pull requests was not checked.

## Not verifiable

- `QuillenHA` (G2.1), `JoachimKO`, `McDuffSegal`, `SegalCategories`, `ABSClifford`: settled as uncertified; cited by locator only.
- HSS: I read the arXiv text. The JAMS numbering behind the README's "JAMS 13 (2000)" was not compared; it is paywalled.
- `MillerCobordism` Ch. 1–2 and `SchwedeSymSpec` Examples 1.17–1.20 are cited at chapter or example level. They were not re-read this round; the previous review matched the Schwede examples.

## Source issues

- **Gap** in HatcherAT at Proposition 3.17, printed p. 217: the source proves only the finite-dimensional case and leaves the infinite-dimensional telescope step to the reader; it should carry out the telescope argument (as in Theorem 3F.8); affects the proof.
