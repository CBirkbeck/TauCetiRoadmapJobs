# Review of PositiveScalarCurvature (pull request #1766 at c429f01)

**Verdict:** needs changes

The pull request amends the roadmap that is already on main (content 929496d): the only change is the Toda normalization paragraph of §P6 (`TauCetiRoadmap/PositiveScalarCurvature/README.md` lines 301–317) and the Toda reference line (lines 459–460); `Suggested.lean` is unchanged. The review covers the whole folder as the brief asks. One finding (R01) is in the new text; every other finding is pre-existing on main and is listed because the gate fails on it at this head or because the citation no longer resolves. Nothing outside the roadmap folder is changed (`git diff --stat origin/main...HEAD` lists only the README).

## R01 (P2) — the σ₉ relation is stated in π₁₆(S⁹), where it is false, and the projection that makes it true is not named

Location: `README.md` lines 307–314: "let σ₂ be the 2-primary component of the stable image of this σ₈ … the 2-primary relation `2Eσ₈=E²σ′`, whose two sides lie in π₁₆(S⁹). Build the primary-component comparisons on native `AddCommGroup.primaryComponent` and transport … by its subgroup inclusion."

Claim: the relation between σ₈ and σ′ is an identity whose two sides are compared in π₁₆(S⁹), and the comparisons are built on the subgroup `AddCommGroup.primaryComponent`.

Witness (computed): π₁₆(S⁹) ≅ ℤ/240 with σ₉ = Eσ₈ a generator (HomotopySpheres §9A.1 at its open head, headline `sphere_homotopyGroup_seventhStem`, lines 2683–2686). Then 2Eσ₈ = 2σ₉ has order 120, while E²σ′ has order 8 (σ′ generates the ℤ/8 2-component of π₁₄(S⁷): wang-survey Theorem 3.2.60, lines 1148–1151, and Appendix row n = 7, line 4451). Two elements of different orders are unequal, so `2Eσ₈ = E²σ′` is false in π₁₆(S⁹). It is true only after projecting onto the 2-primary summand: with (σ₉)₂ := 225σ₉ (225 ≡ 1 mod 16, 225 ≡ 0 mod 15), 2(σ₉)₂ = 210σ₉ has order 240/gcd(210, 240) = 8 and equals E²σ′ (Toda's relation as restated in wang-survey line 4776, 2-components). Moreover 2σ₉ is not an element of the subgroup `AddCommGroup.primaryComponent (π₁₆(S⁹)) 2` at all: membership is "order a power of 2" (`AddCommGroup.mem_primaryComponent_iff_orderOf`, `Mathlib/GroupTheory/Torsion.lean` lines 450–467 at the pin), and 120 is not a power of 2. The same projection is what "the 2-primary component of the stable image of σ₈" means (σ₂ = 225σ, of order 16, not σ itself and not 15σ = −σ₂), and the roadmap names no carrier for it: the subgroup gives membership, not the component of an element.

Repair (tested on the instance above): replace the two sentences by: "Write (·)₂ for the projection of a finite abelian group onto its 2-primary component along its odd-torsion summand; for a finite ℤ-module this is the internal direct-sum decomposition into prime-power torsion submodules (Mathlib `Submodule.isInternal_prime_power_torsion_of_pid`, `Mathlib/Algebra/Module/PID.lean` line 75, with the projection of `DirectSum.IsInternal`). Set σ₂ := (E∞σ₈)₂ ∈ π₇ˢ, of order 16 (π₇ˢ ≅ ℤ/240 from HomotopySpheres §9A.1). Toda's relation holds between 2-primary components: (2Eσ₈)₂ = E²σ′ in π₁₆(S⁹), whose right side already lies in the 2-primary subgroup; the identities `E∞σ′=2σ₂`, `E∞σ′′=4σ₂`, `E∞σ′′′=8σ₂` are then equalities in π₇ˢ between elements of the subgroup `AddCommGroup.primaryComponent (π₇ˢ) 2`, and `8σ₂ = 120σ` is the order-two class." With (σ₉)₂ = 225σ₉ the displayed values are 2(σ₉)₂ = 210σ₉ (order 8 = order of E²σ′), 4σ₂ = 900σ = 180σ (order 4 = order of σ′′), 8σ₂ = 120σ (order 2 = order of σ′′′), each matching the order of the unstable class it is the image of.

## R02 (P2) — the four GeometricTopology Layer 1 names cited in P4 exist nowhere a supplier can be read

Location: `README.md` lines 225–227: "Apply GT Layer 1's `framedInteriorSphereSurgery`, `smoothWhitneyMove`, `smoothHandleCancellation` and `smoothHandleIndices_le_dim_sub_three`".

Claim: GeometricTopology Layer 1 declares these four targets.

Witness: GeometricTopology on main (content 929496d) has Layer 1 "manifold-library buildout" (README line 177) with tubular neighbourhoods and handle attachment (lines 42–63) but none of the four names; its open head (rev/903) has none either (its §1.6 "Handle decompositions, cancellation and the Whitney move", line 721, states the Milnor theorems without these names). `roadmaps grep` finds the four names only in this roadmap, on main and at this head. They exist only at commit 87f0ec5b (README lines 560–595), the commit the P4 link pins, and that commit is not an ancestor of main. The citation therefore resolves nowhere the brief allows.

Repair: cite by section what exists now: "GeometricTopology Layer 1 (tubular neighbourhoods and handle attachment)" for the surgery interface, and state the three remaining inputs as this roadmap's own hypotheses-carrying targets in P4 until a supplier on main owns them by section: (i) framed interior sphere surgery on a bordism rel boundary; (ii) the Whitney move in dimension n+1 ≥ 6 for complementary-dimensional transverse submanifolds with a framed embedded Whitney disc (Milnor, h-cobordism lectures, Theorem 6.6); (iii) handle cancellation (Milnor, Theorem 5.4) and the bound "handles of index ≤ (n+1)−3" for a two-connected inclusion. HomotopySpheres' own supplier list (rev/1287 lines 86–88) names GeometricTopology as the owner of framed surgery and handle attachment, so once GeometricTopology's §1.6 is on main the three targets move back there; record that in Scope.

## R03 (P1) — the worker's gate build fails on lake's module advisory

Location: `Suggested.lean` line 1; gate `build=1 FAIL` with the single line "imports `Mathlib.Geometry.Manifold.VectorBundle.Riemannian` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file".

Claim: the module elaborates. It does: `lake env lean` on the file at this head reports only the two `sorry` warnings (lines 39 and 44). The gate's build counter nevertheless fails on the advisory, and the brief admits no acceptance while it fails; by the brief's rule a failed build is P1.

Repair (tested): make the header

```lean
module
import Mathlib
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Scalar
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
```

A scratch copy of `Suggested.lean` with exactly this header and an otherwise unchanged body elaborates under `lake env lean` with the two `sorry` warnings only; both Tau Ceti modules exist at the pin (358314d4).

## R04 (P3) — the import header breaks three gate rules

Location: `Suggested.lean` lines 1–3: `import Mathlib.Geometry.Manifold.VectorBundle.Riemannian` and no `import Mathlib` line (gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`).

Repair: the header of R03 (single `import Mathlib`, then the two `TauCeti.*` modules). Tested as in R03.

## R05 (P3) — fifteen supplier links are pinned to commits, fourteen of them not on main

Location: `README.md` lines 25, 28, 30, 33, 38, 40, 41, 46, 53, 106, 110, 124, 282, 412, 422 (gate rule `blob`), plus the sentence at line 54 "at commit34167306…; the Stage references below refer to that fixed contract".

Witness: `git merge-base --is-ancestor` against content's main: only the HopfRinow commit 350e970c is on main; the other fourteen (ComplexKahlerGeometry 13b2335e, GeneralizedCohomology 1565ccc1, SmoothBundlesConnections 1c45ab40, BordismFormalGroups 269912e4, SpinGeometry 312e1bbe, HomotopySpheres 34167306, TangentialBordism 4a5e27d2, IndexTheory 592b12da, CharacteristicClasses 76a0952b, CompactGroups 77f1b53d, RiemannianGeometry 7d5cabbd, LieGroups 85f49c01, GeometricTopology 87f0ec5b, TopologicalKTheory f2c908de) are pull-request-branch commits. A citation is resolved against the supplier as it is now, and R02 is what happens when it is not.

Repair: replace each link by the roadmap name and section, with no commit: RiemannianGeometry R1/R4.7 (item 7 of R4, main line 717)/R5a (main line 1044); SmoothBundlesConnections B1/B5/B6.0 (main lines 221–498, 1072, 1306); ComplexKahlerGeometry K5a (main line 570); SpinGeometry G4–G6 with `realCliffordSpinorBundle` (G5.0, main line 506), `realSpinDiracClosedRealization` (G6, line 586), `realSpinDiracIndexClass` (line 655); TangentialBordism B3.0 = §7.1 (`spinABSDiracIndexComparison` line 1712, `spinABSComplexificationGenus` line 1740 at rev/942), B1–B3, B6 (§§6.5–6.6, HP² transfer line 147); GeneralizedCohomology G5/G5.5-ABS (main line 1767); TopologicalKTheory T7 (main line 1148); GeometricTopology Layer 1 (R02); HomotopySpheres §3C.3, Layers 6–8, §8.2, §8.3 (rev/1287 lines 972, 1724, 2372, 2384), §9A.1 for π₇ˢ; HopfRinow is `Completed/HopfRinow` on main (cite it as the completed roadmap); LieGroups and CompactGroups (main, closed-subgroup theorem line 11, Peter–Weyl line 1); BordismFormalGroups F4 (main line 329); CharacteristicClasses for Dold's theorem only (main line 324; the Dold-manifold conventions are TangentialBordism's, rev/942 lines 1653 and 2416); IndexTheory I7 Gauss–Bonnet (rev/1077 line 728). Delete the "at commit…fixed contract" sentence.

## R06 (P3) — pull-request numbers and process vocabulary in P6

Location: `README.md` lines 280, 374, 377 ("PR284 Stage3C.3", "PR284's Hopf class", "PR284 Stages6–8"; gate rule `prnum`), and "Stage8.2"/"Stage8.3" at lines 379, 391–392.

Witness: HomotopySpheres at its open head labels these §3C.3 (line 972), Layer 6 (line 1724), §8.2 (line 2372), §8.3 (line 2384); "Stage" is that roadmap's word for AlgebraicTopology's sections, not its own.

Repair: "HomotopySpheres §3C.3", "HomotopySpheres' Hopf class (§3C)", "HomotopySpheres Layers 6–8", "§8.2", "§8.3".

## R07 (P3) — the gate's dependency check prints an UPWARD line that the brief's supplier list contradicts

Location: gate `depcheck=1`: `UPWARD: PositiveScalarCurvature (on main) -> TangentialBordism (#8) at README lines [44]`. The movable run gives the same single line (`depcheck: 205 roadmaps, 1645 edges, 1 problem(s)`).

Witness: this roadmap is on main and absent from `ORDER.txt`, so the check treats every citation of an open-pull-request roadmap as upward; TangentialBordism is in the brief's list of roadmaps this roadmap may consume (it is at ORDER line 9, and HomotopySpheres at line 64 is consumed the same way without a line because its citations are link- and PR-number-form, which the check does not parse). I believe the line is a false positive produced by the placement of on-main roadmaps; it is the board's to settle (place the roadmap in the order after TangentialBordism and HomotopySpheres) and no edit of the README removes it except dropping the supplier. After R05 and R06 the HomotopySpheres edge becomes visible to the check and will print the same way; that is the same artifact, not a cycle: HomotopySpheres at rev/1287 does not cite this roadmap (grep of its README for "PositiveScalarCurvature": no match).

## R08 (P3) — house shape and acceptance-test form (pre-existing)

Location: whole README and `Suggested.lean` lines 5–10.

Witness: the README has no Scope, Conventions, Exact supplier contracts, numbered layers with `*Needs:*` lines, `**Checks.**` lists or `sources.toml`; the Lean docstring says "These are suggested forms, not an exhaustive checklist" and does not say that the roadmap's headline theorems (the Gromov–Lawson surgery theorem, the Spin/nonspin classification "PSC iff nonspin or α(M)=0", the Hitchin spheres) are not statable at the pins or what each lacks (Spin structures, α, structured bordism, Toda classes). The two stated theorems are P1 targets, fine as headlines of what is statable now. The roadmap predates the current form; the author may leave this for a later revision, but a `sources.toml` recording Toda as uncertified, Adams/Hitchin/Stolz 1992 as uncertified and the open texts below would let the worker verify locators next time.

## R09 (P3) — `[I.Boundaryless]` on the smoothness headline is narrower than P1

Location: `Suggested.lean` lines 17–20 and 39–41.

Witness: the elaborated type of `contMDiff_metricScalarCurvature` carries `[I.Boundaryless]`, while P1 asks for scalar-curvature smoothness also on the half-space models used for collared bordisms (README lines 97–99); `metricScalarCurvature` itself has no boundaryless hypothesis (dropped as a section variable, harmless since its type does not need it). Neither pinned Tau Ceti file imported (`Curvature/Scalar.lean`, `LeviCivita/Regularity.lean`) mentions `Boundaryless`. Either drop the instance from the theorem or say in the README that the boundary case is a separate P1 target.

## Verified sound

**Gate at c429f01** (worker's run, data): `set_option=0 sorry-data=0 sorry-examples=0 stray-files=0 outside-folder=0 dirty=0 lean-lines=0 readme-ids-missing=0`; failures `blob=15 prnum=3 imports=1 mathlib-subimports=1 no-import-mathlib=1 depcheck=1 build=1`, each above (R03–R07). `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (the four GT names of R02 are "found" only because this roadmap's own copy on main contains them; I grepped the suppliers themselves).

**Elaboration.** `lake env lean Suggested.lean` at the head: two `sorry` warnings (lines 39, 44), nothing else. Elaborated signatures (worker's `signatures.md`, five declarations) compared with the README: `SmoothMetric` = `Bundle.ContMDiffRiemannianMetric I ∞ E (TangentSpace I)` (README line 12); `metricScalarCurvature g` = scalar curvature of the Levi-Civita connection in `g`'s own `RiemannianBundle` instance (README line 15); `PositiveScalarMetrics` = `∀ x, 0 < Scal` (README line 74); `contMDiff_metricScalarCurvature` (README line 75, R09 on the boundary); `exists_uniform_scalar_gap` on `[CompactSpace M]` (README lines 78–79; the compact hypothesis is needed: on ℝ a warped-product metric with scalar curvature 1/(1+t²) is positive with no gap). Dropped section binders: `SmoothMetric` lost `[FiniteDimensional ℝ E]`, `[I.Boundaryless]`, `[T2Space M]`, and `metricScalarCurvature`/`PositiveScalarMetrics` lost `[I.Boundaryless]`; none of those types mentions them, so nothing is lost. At the Tau Ceti pin (358314d4, 2026-10-07) there is no `Geometry/Manifold/Riemannian/PositiveScalarCurvature` directory and no `HasPositiveScalarCurvature`, so the two theorems duplicate nothing at the pin (the declarations STATUS.md links landed later than the pin).

**One-tactic probe** (scratch copy, elaborated): `contMDiff_metricScalarCurvature` by `fun_prop` fails ("not a `fun_prop` goal"); `exists_uniform_scalar_gap` by `simp` makes no progress. Neither is padding. The repaired header of R03/R04 elaborates with the two `sorry` warnings only.

**Adversarial table.** Rows cover the P6 paragraph the pull request changes, the two Lean headlines, and the sampled targets.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| σ₂ := 2-primary component of E∞σ₈, order 16 (line 308) | π₇ˢ = ℤ/240 ≅ ℤ/16 ⊕ ℤ/15; candidates σ, 15σ, 225σ | 225 ≡ 1 (16), 225 ≡ 0 (15): σ₂ = 225σ, order 16; 15σ = −σ₂ (order 16, wrong sign); σ has order 240 | holds only with the projection; the subgroup alone leaves 8 candidates | R01 |
| `2Eσ₈ = E²σ′` "whose two sides lie in π₁₆(S⁹)" (line 311) | ℤ/240 = π₁₆(S⁹), σ₉ generator; σ′ of order 8 | ord(2σ₉) = 120, ord(E²σ′) = 8; (2σ₉)₂ = 210σ₉, order 8 | false in π₁₆(S⁹), true for 2-components | R01 |
| `E∞σ′=2σ₂`, `E∞σ′′=4σ₂`, `E∞σ′′′=8σ₂` (line 309) | orders of σ′, σ′′, σ′′′ = 8, 4, 2 (wang-survey lines 4445, 4448, 4451) | ord(2σ₂)=8, ord(4σ₂)=4, ord(8σ₂)=2; 8σ₂ = 1800σ = 120σ = the unique order-two class | consistent; matches "stabilizes to the order-two class" (line 304; cs13 lines 360–361) | none |
| `Eσ′′=2σ′`, `Eσ′′′=2σ′′` (line 310) | wang-survey lines 4774–4776, 1149 | 2σ′′′ = 0 ⇒ Eσ′′′ ∈ 2-torsion: 2σ′′ has order 2 ✓; Eσ′′ = 2σ′ has order 4 ✓ | consistent | none |
| H(σ₈) = ι₁₅ (line 305) | wang-survey line 4863; Hopf invariant one in dimension 15 | H: π₁₅(S⁸) → π₁₅(S¹⁵) = ℤ, value 1 | consistent | none |
| a₁ = Eσ′′′, 2ι₆∘a₁ = 2a₁ = 0 (lines 317–318) | a₁ = 2σ′′, σ′′ order 4 | 2a₁ = 4σ′′ = 0; postcomposition with 2ι₆ is additive, so 2ι₆∘a₁ = 2a₁ | consistent | none |
| Eσ′′′∘η₁₃ ∈ {2ι₆, Eσ′′′, 2ι₁₃} and the element is zero (lines 319–321, 338–339) | η₁₃ a suspension; 2η₁₃ = 0 | (2σ′′)∘η₁₃ = 2(σ′′∘η₁₃) = σ′′∘2η₁₃ = 0 (cs13 line 363) | consistent | none |
| π₁₄(S⁶) ≅ ℤ/8{ν̄₆} ⊕ ℤ/2{ε₆} ⊕ ℤ/3 (line 322) | kmnst line 469 (printed p. 117) | order 48 = \|ℤ/24 ⊕ ℤ/2\|; odd generator [ι₆,ι₆]∘α₁(11) | matches | none |
| indeterminacy 2ι₆∘π₁₄(S⁶) + 2π₁₄(S⁶) = 2π₁₄(S⁶) (lines 331–337) | Hilton–Hopf on ν̄₆, ε₆, and the ℤ/3 generator | (2ι₆)∘ν̄₆ = 2ν̄₆ ± 2ν̄₆ ∈ {0, 4ν̄₆}; (2ι₆)∘ε₆ = 2ε₆ = 0; on ℤ/3, (2ι₆)∘x = 2x ± 2x ∈ {0, x} ⊆ ℤ/3 = 2·ℤ/3; total 2π₁₄(S⁶) ≅ ℤ/4 ⊕ ℤ/3, order 12 | consistent, including the ℤ/3 summand | none |
| [ι₆,ι₆]∘ν₁₁^(2) = ±2ν̄₆ and the integral quaternionic-Hopf distinction (lines 327–330) | kmnst line 471: Δ(ι₁₃)∘h₁₁(H) = 2ν̄₆ + [ι₆,ι₆]∘α₁(11) | 2-part 2ν̄₆, 3-part the odd generator | matches the roadmap's split | none |
| e_C(a₁) = 1/2 (line 364) | a₁ ↦ 120σ; e_C(σ) = ±1/240 (HomotopySpheres rev/1287 line 2678) | 120·(±1/240) = 1/2 mod ℤ | consistent | none |
| Hitchin dimensions 8j+1, 8j+2, j ≥ 1 (lines 277–278, 386) | KO₁ = KO₂ = ℤ/2; "≥ 9" | 8·1+1 = 9 | consistent with "8j+1 or 8j+2 ≥ 9" (line 386) | none |
| Stage 8.3 criterion π_(n−1)(SO) = 0 fails here (lines 391–392) | n = 8j+1, 8j+2 | π_(8j)(SO) = ℤ/2, π_(8j+1)(SO) = ℤ/2 (Bott) | consistent with HomotopySpheres §8.3 (rev/1287 line 2388) | none |
| Scal(cg) = c⁻¹Scal(g); round Sⁿ(r) = n(n−1)/r² (lines 83–86) | c = 1; n = 2, r = 1 | 1·Scal = Scal; 2·1/1 = 2 = twice the Gauss curvature | consistent | none |
| Scal(CP^d) = 4d(d+1), Scal(HP^d) = 16d(d+2) with curvature-4 normalization (lines 88–89) | d = 1: CP¹ = S²(1/2), HP¹ = S⁴(1/2) | 4·1·2 = 8 = 2·4; 16·1·3 = 48 = 4·3·4 | consistent | none |
| O'Neill `Scal(g_ε)=Scal(g_B)+ε⁻²Scal(g_F)−ε²\|A\|²` (line 147) | product bundle, A = 0 | Scal(g_B + ε²g_F) = Scal(g_B) + ε⁻²Scal(g_F) | consistent | none |
| bending term `(n−1)(n−2)sin²θ/r² − 2(n−1)k_γ sinθ/r` (lines 175–176) | Gauss equation over ordered pairs with λ₁ = k, λ_j = −sinθ/r (gl80 lines 190–204) | Σ_{i≠j}λ_iλ_j = (n−1)(n−2)sin²θ/r² − 2(n−1)k sinθ/r | roadmap's factor 2 is right; the printed source has (n−1) | Source issues |
| belt-sphere arithmetic q ≥ 3 ⇔ n−λ ≥ 2 (lines 205–207) | n = 5, k = 2 | q = 3, λ = 3, n−λ = 2 | consistent | none |
| Dold P(1,2): oriented PSC, not nullbordant, ⟨w₂w₃,[P]⟩ = 1 (lines 405–409) | a = 1, b = 2 | dim 5; TangentialBordism rev/942 line 2416 gives w₁ = 0, w₂w₃ number 1 | consistent | none |
| p(THP^k) = (1+u)^(2k+2)/(1+4u), top Newton number 2k+2−4^k (lines 399–402) | k = 1, 2 | k=1: p = 1 (p₁(S⁴) = 0), s₁ = 0 = 4−4; k=2: p = 1+2u+7u², s₂ = 4−14 = −10 = 6−16 | consistent | none |
| KO_n table and Â(M) = 2r, α(K3) = a (lines 242–248) | n = 4, K3 | c(a) = 2u² (TopologicalKTheory T7 line 1263), Â(K3) = 2 = 2·1 | consistent | none |
| `exists_uniform_scalar_gap` | M = ∅; M = ℝ warped with Scal = 1/(1+t²) | ∅: ε = 1 vacuous ✓; ℝ: positive, infimum 0, no gap ⇒ `[CompactSpace M]` necessary | hypothesis needed and present | none |
| `contMDiff_metricScalarCurvature` | half-space model | theorem excludes it by `[I.Boundaryless]`, README includes it | narrower than README | R09 |

**Library declarations opened at the pins.** `AddCommGroup.primaryComponent` and `mem_primaryComponent_iff_orderOf` (`Mathlib/GroupTheory/Torsion.lean` 450–467, `namespace CommGroup` with `to_additive`); `Submodule.isInternal_prime_power_torsion_of_pid` (`Mathlib/Algebra/Module/PID.lean` 75); `Ideal.primaryComponent` (`Mathlib/Algebra/Module/Torsion/PrimaryComponent.lean` 48, a different object); `CovariantDerivative.scalarCurvature` (`TauCeti/.../Curvature/Scalar.lean` 53) and `contMDiffOn_leviCivitaConnection` (`TauCeti/.../LeviCivita/Regularity.lean` 163).

**Cross-roadmap citations resolved** (26): RiemannianGeometry R1 (main 179), R2 (300), R4 (607), R4.7 (item 7, 717), R5a (1044); SmoothBundlesConnections B1.0–B1.5 (221–498), B5.0–B5.2 (1072–1209), B6.0 (1306, strongly convex neighbourhoods at 1316+); ComplexKahlerGeometry K5a (570); SpinGeometry G4 (395), G5.0 `realCliffordSpinorBundle` (506), G6 `realSpinDiracClosedRealization` (586), `realSpinDiracIndexClass` (655), G6.7 `= α·a` (831), circle/torus η values (696–697); GeneralizedCohomology G5 (1373), G5.5-ABS (1767); TopologicalKTheory T7 (1148), `c(a)=2u²`, `c(b)=u⁴` (1263); BordismFormalGroups F4 (329, consumes HomotopySpheres §3C Toda brackets); CharacteristicClasses Dold's theorem (324); LieGroups closed-subgroup theorem (11); CompactGroups Peter–Weyl (1); Completed/HopfRinow (present on main); TangentialBordism rev/942 B3.0 = §7.1 (1700–1740), B6 (§§6.5–6.6, 1559–1612), HP² transfer (147, 2695), P(1,2) (2380, 2416); HomotopySpheres rev/1287 §3C.3 (972), Layer 6 (1724), §8.2 (2372), §8.3 (2384), §9A.1 π₇ˢ (2683–2686); IndexTheory rev/1077 I7 Gauss–Bonnet (728); StringOrientation (open, ORDER line 6) as a consumer only. Not resolved: the four GT names (R02).

**Direction of supply with the open suppliers.** TangentialBordism at rev/942 names this roadmap four times (lines 37–38, 2253, 2442, 2652) and each time as a consumer ("these consumers provide no prerequisite of the targets above"); its remark that Scal(HP²) = 16·2·4 = 128 in this roadmap's normalization agrees with the P1 formula 16d(d+2) at d = 2. HomotopySpheres at rev/1287 and StringOrientation at rev/948 do not mention this roadmap. No cycle.

**Ownership.** Toda's 7-stem classes and the Moore-space extension construction are owned here; HomotopySpheres owns the stable group π₇ˢ ≅ ℤ/240 and the Toda-bracket formalism (§3C.3), BordismFormalGroups F4 the stable comparison, and no roadmap on main or at the listed open heads states the σ′, σ′′, σ′′′ relations (`roadmaps grep` for σ′′′ and "Composition Methods": only HomotopySpheres' and StringOrientation's reference lists). Ownership against open pull requests whose files the brief does not give was not checked.

**Dependency check** (movable run, output): `UPWARD: PositiveScalarCurvature (on main) -> TangentialBordism (#8) at README lines [44]` / `depcheck: 205 roadmaps, 1645 edges, 1 problem(s)`; see R07.

**Seeded sample of 15 locators** (the worker found none by heading; chosen across the references): gl80 Theorem A (codimension ≥ 3 surgery, lines 48–55, printed p. 423) ✓; Theorem B (simply connected spin, dim ≥ 5, spin-cobordant, lines 66–71) ✓; Theorem C and Corollary C (nonspin, lines 94–99) ✓; formula (1) (lines 202–204, printed pp. 427–428) and (1′) (lines 259–262, p. 429): see Source issues; kmnst Proposition 4.4 (line 458, printed p. 117) and the π₁₄(S⁶) decomposition (469) ✓; cs13 §2.3 (line 280): Lemma 5.13 and Corollary 3.7 attributions (360–363), α₁ = Eσ′′′ = 2σ′′ with σ′′ of order 4 in ℤ/60 (364–365), Adams Theorem 11.1 formula and e_C(η) = 1/2 (356–358), Remark 2.15 on choices (366–369) ✓; stolz22 Corollary 1.5 (nonspin, line 149) ✓; wang-survey Theorem 3.2.60 (1148–1151) and Appendix A relations (4774–4776) and Hopf invariants (4860–4863) ✓ as the open corroboration of Toda's lemmas; Toda Lemmas 5.13–5.14, Proposition 5.15, pp. 48–50, Corollary 3.7: not verifiable (below); Adams J(X) IV Theorems 5.3(v), 11.1, 12.13, Lemma 12.5, §7: uncertified; Hitchin: uncertified; Stolz 1992: uncertified.

## Not verifiable

- Toda, *Composition Methods in Homotopy Groups of Spheres* (Lemmas 5.13–5.14, Proposition 5.15, "pp48–50", Corollary 3.7): the sources service finds no legal copy (Princeton University Press), and the worker's cache has none; recorded as the one `[[missing]]` entry. The mathematics was checked against cs13 (which attributes the σ′′′ stabilization to Lemma 5.13 and the bracket to Corollary 3.7) and wang-survey (which attributes the σ′, σ′′, σ₈ relations to Toda chapter 5); the lemma numbers 5.14/5.15 and the printed pages are unchecked.
- Adams, *On the groups J(X) IV* (Topology 5, 1966): DOI 10.1016/0040-9383(66)90004-8 is a paywalled publisher for the service; the Rochester copy the README links is not an author page. Uncertified.
- Hitchin, *Harmonic spinors* (Adv. Math. 14, 1974): paywalled DOI. Uncertified.
- Stolz, *Simply connected manifolds of positive scalar curvature* (Annals 136, 1992): JSTOR landing only. Uncertified.
- Lawson–Michelsohn, *Spin Geometry*: book, not fetched.

## Source issues

- **Error** in gl80 at formula (1), printed p. 427–428 (and (1′), p. 429): the source says the curvature-of-the-bending-curve term of the hypersurface scalar curvature is −(n−1)(1+O(r))k sinθ/r (and −(q−1) sinθ/r in (1′)); it should be −2(n−1)(1+O(r))k sinθ/r (and −2(q−1)k sinθ/r), the sum of λ₁λ_j over both orderings of the pairs (1, j), as its own sin² coefficient (n−1)(n−2) already counts; affects the proof (the constants of the bend), not the stated results. The roadmap's pinned term already carries the factor 2.
