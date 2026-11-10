# Review of LocalPurity (pull request #1807 at 450496e)

**Verdict:** needs changes

Three P3 findings stand, and none is blocking. The mathematics, the locators of the seeded sample, the Lean signatures and the supplier order all check out. All ten findings of the review of `c271254` are repaired; the record is under Verified sound. The gate passes on this folder. Its only failing count, `outside-folder=26`, is the 13 sibling folders this pull request owns, two files each.

## R01 (P3) — The description says LocalPurity consumes SchemeAndStackFoundations §4.13; the README takes those facts from Tau Ceti

**Location.** Pull request description, the "Ownership moves" bullet, outside the generated blocks: "the regular-local-ring chain (global dimension, Auslander–Buchsbaum, Serre's theorem, Stacks 0AFS) from PurityOfBranchLocus §0.3 into SchemeAndStackFoundations §4.13, with LocalPurity and PurityOfBranchLocus consuming it."

**Claim.** The sentence says LocalPurity consumes the regular-local-ring chain from SchemeAndStackFoundations §4.13.

**Witness.**
- `TauCetiRoadmap/LocalPurity/README.md:75-77` and `:228-236` take 00NP, 00NQ, 0AFS, 0567 and depth = dimension straight from pinned Tau Ceti declarations.
- The README never cites §4.13.
- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5461-5463` says that §4.13 "restates none of it".

**Repair.**
- Replace "with LocalPurity and PurityOfBranchLocus consuming it" by a sentence saying that LocalPurity takes these facts from the pinned Tau Ceti: `TauCeti.isRegularRing_of_isRegularLocalRing`, `TauCeti.IsRegularLocalRing.quotient_span_singleton`, `TauCeti.IsRegularRing.isIntegrallyClosed` and `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`.
- Add one sentence on what the LocalPurity revision does. It replaces Layer 0 by a `From Tau Ceti` contract. §1.3 now owns formal glueing (05EL, 05ER, 05EU) and the formal-section results 0EII and 0EKP. `Suggested.lean` states 0BMA (1), 0BMA (2), 0EY7 and the codimension-two extension on Tau Ceti's carriers.

The sibling folder makes the same claim (`SchemeAndStackFoundations/README.md:5473` and `:7161`). That folder's own review has to settle it there.

## R02 (P3) — The §0.9 contract understates what *spread_from_localScheme* takes from it, and two Mathlib contract entries are never used

**Location.**
- `README.md:275-278`, the §0.9 contract: "schemes of finite presentation, their morphisms and the properties finite and étale descend to a finite stage".
- `README.md:743-748`, *spread_from_localScheme*: "if both are separated, proper, finite or étale, the glued scheme has the same property after shrinking `U'`".
- `README.md:158` (`IsRegularLocalRing.of_isRegularRing_of_isLocalRing`) and `:182` (`Algebra.HasGoingDown`).

**Claim.** The contract says only finiteness and étaleness descend, yet the target asserts descent of separatedness and properness too. The two Mathlib names are listed as consumed.

**Witness.**
- `SchemeAndStackFoundations/README.md:975-979` lists proper (081F) and closed immersion (01ZP), not separated.
- 0EY3's proof uses Limits Lemma 8.6 (01ZQ) (stacks-limits line 2640), which applies 01ZP to the diagonal (line 872).
- The two names occur only on lines 158 and 182.

**Repair.**
- Contract: write "…their morphisms, and the properties proper (Limits, Lemma 32.13.1 (081F)), finite (32.8.3 (01ZO)), étale (32.8.10 (07RP)) and closed immersion (32.8.5 (01ZP)) descend to a finite stage".
- *spread_from_localScheme*: add "separatedness descends by applying the closed-immersion clause to the diagonal (Limits, Lemma 32.8.6 (01ZQ), a step of this target)".
- Delete the two unused Mathlib names, or name the step that uses each.

Tested on the separated clause. For `X_i` of finite presentation over `S_i`, the diagonal `X_i → X_i ×_{S_i} X_i` is a morphism of finitely presented `S_i`-schemes whose limit is `Δ_X`. If `Δ_X` is a closed immersion, the §0.9 clause makes `Δ_{X_i}` one for `i ≫ 0`, which is 01ZQ's proof.

## R03 (P3) — Layer 1 Example 3 drops "char k ≠ 2", and its reason fails in characteristic 2

**Location.** `README.md:668-671`: "The restriction of `Spec A[z]/(z² − x)` to `U` is not a finite étale cover of `U`, being ramified along the curve `x = 0`".

**Claim.** The cover is ramified along `x = 0` (and étale elsewhere), for every field `k`.

**Witness.** Take `char k = 2`. Then `d(z² − x)/dz = 2z = 0`, so `Ω_{B/A} = B·dz ≠ 0` at every prime. The generic fibre `k((x, y))(√x)` is purely inseparable. So `B` is étale at no prime, not merely ramified along `x = 0`.

**Repair.** Write "For `A = k⟦x, y⟧` with `char k ≠ 2`", as the second Check of §1.2 does (line 380). Optionally add that in characteristic 2 the algebra is étale nowhere and is excluded too.

Tested with `char k ≠ 2`:
- At `(z)`, which lies over `(x)`, the ramification index is 2.
- At a prime not containing `z`, `x` is a unit and `2z` is invertible, so `B` is étale there.
- So the ramification is exactly along `x = 0`, as the example says.

## Verified sound

**Repair status of the review of `c271254`.**
- R01 (0AFS via §4.13): repaired. Lines 75-77 now read "Tau Ceti (… it is a regular ring, 0AFS; a regular ring is integrally closed, 0567; its depth equals its dimension)". Lines 228-236 name the Tau Ceti declarations. The §2.1 *Needs:* line lists them. §4.13 is no longer cited.
- R02 (private stand-ins in `Suggested.lean`): repaired. The file imports `TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum` and states the headlines on `TauCeti.FiniteEtaleScheme.pullback` and `TauCeti.IsLocalRing.PurityHolds`. It has no local carriers.
- R03 (asking for what the pin proves): repaired.
  - The `From Tau Ceti` contract (lines 187-273) lists 00R4, 0BJF, 0BM8, 0BLK, 0BM9 (full faithfulness), the dimension-two case of 0BMA and the counterexample of Convention 5.
  - Layer 0 is gone. The summary no longer says the libraries lack these results.
  - The words "prototype" and "newer" are gone.
- R04 (unowned 05ER/05EU/0EII/0EKP): repaired. §1.3 states *FormalGlueData*, *formalGlueing_equiv* (05ER, 05EU), *formalSections_of_localCohomology* (0EII) and *completion_fullyFaithful_of_sections* (0EKP), each with hypotheses, a route and Checks. It cites `TauCeti.tensorProduct_mk_bijective_of_primaryComponent_eq_top` for 05E9. The phrase "not a second general gluing theory" is gone.
- R05 (padding): repaired. The four `exact`-closable declarations are deleted.
- R06 (`readme-ids-missing`, names): repaired. The gate count is `readme-ids-missing=0`, and the file declares `IsLocalRing.purityHolds_of_isRegularLocalRing` and `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` inside the namespace.
- R07 (docstring): repaired. The docstring is titled "…: target signatures" and says "All four are statable at the pins … No headline is unstatable".
- R08 (shape, Checks): repaired. The README has all required sections, and every layer ends with Examples and Dependencies. §1.1 has 3 Checks, §1.2 has 4 and *FormalGlueData* has 3, and the API is written as prose bullets.
- R09 (locators): repaired. The codimension-two result cites SGA 2 X 3.3 with 3.4 (i), and SGA 1 X Corollaires 3.2 and 3.3 replace Théorème 3.1. Lemma 58.20.6 (0BLS) is in the alignment table.
- R10 (order against #1854): repaired. The generated merge-order block reads "`LocalPurity`: **this pull request** → #1808 → #1854".

**Gate, build and dependency check.**
- The worker's gate passes, build included.
- My rerun reports 0 on every check except `outside-folder=26`, which is 13 owned folders × 2 files. `git diff --stat` outside them is empty.
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` gives 4 `sorry` warnings and nothing else.
- Dependency check output: `depcheck: 234 roadmaps, 2266 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. LocalPurity and its only roadmap supplier, SchemeAndStackFoundations, are both on main.

**Lean form, signatures and padding.**
- I elaborated `#check @` for all 4 declarations in one scratch file. Each type matches its README statement: same hypotheses, generality and conclusion, and no section binder lost. Nothing changed.
- One-tactic probe on a scratch copy: `simp` makes no progress on any of the four, `rfl` fails, `infer_instance` fails, and `exact?` finds nothing.
- The four declarations are the README's end theorems (line 37). None is padding.
- No headline is missing. The intermediate targets (0BM9, 0BLM, 05ER) are Layer 1 results, and stating them would need encodings beyond "simple definitions".

**Library declarations opened at the pins (by `#check`; 52 Tau Ceti, 36 Mathlib).**
- Tau Ceti:
  - `AlgebraicGeometry/FiniteEtale/{Basic:171, Fiber:51, MorphismProperty:39,46, PuncturedSpectrum:55,63,92,119, Extension:111, FiniteNormal:71,88,132,204, FullyFaithful:105,120}`.
  - `AlgebraicGeometry/PuncturedSpectrum.lean:52,81,99,111` and `PuncturedSpectrum/Sections.lean:110,129,190`.
  - `RingTheory/RegularLocalRing/{Basic:164,188, ProjectiveDimension:441, Normal:55, CohenMacaulay:110,125, MiracleFlatness:72,90,104, Purity:75}`.
  - `RingTheory/CohenMacaulay/{Normal:144, Basic:67, Ring:40}` and `SerreCondition/Normal:214`.
  - `RingTheory/Etale/{Discriminant:66,122,144, Purity:70, ProdResidueField:82,133,147,153}`.
  - `RingTheory/FormalGlueing/Torsion:143,258`, `Algebra/Module/PseudoCoherent/{Descent:121, Basic:205}`, `RingTheory/AdicCompletion/Principal:68` and `AlgebraicGeometry/LineBundle/Ample:71,107`.
  - The two missing object files (FormalGlueing.Torsion and PseudoCoherent.Descent) were built with `lake build`.
- Mathlib:
  - `IsRegularLocalRing` (`RegularLocalRing/Defs:52`, `spanFinrank = ringKrullDim`).
  - `IsLocalRing.depth` (`Depth/Basic:78`, `Ideal.depth` via Ext, `:70`) and `Ideal.depth_eq_sSup_length_isRegular` (`:337`).
  - `IsFinite extends IsAffineHom` (`Morphisms/Finite:41`) and the open-immersion instance for `toNormalization` (`ZariskisMainTheorem:358`, the four hypotheses as stated).
  - `Scheme.Hom.support_ker`, `Scheme.ker_morphismRestrict_ideal`, `Flat.isQuotientMap_of_surjective`, `Spec.stalkIso` and `Scheme.Opens.stalkIso`.
  - The `AdicCompletion` lemmas, `IsAdicComplete.henselianRing`, the faithfully flat descent lemmas, `IsIntegralClosure.finite` and the rest of the contract. All resolve with the stated hypotheses.
- Every README description of these declarations matches the elaborated type.

**Seeded source sample: all six targets, and every other cited locator in the cached texts. All 61 locators agree with the README; 0BM9 and 0BMA are themselves in error, see Source issues.**
- 1.1: SGA 2 X Définitions 3.1–3.2 (sga2 lines 3377-3384); 0BM7 (stacks-0BMA 2357); 0BL6 (529).
- 1.2: 0BM9 (2391-2418), with the torsion-free correction (source issue below); 0BLK (2380); 0BM8 (2366).
- 1.3, formal glueing:
  - 05EL (stacks-09ZL 11453-11470), 0H77 (11477), 05EN (11492), 05EP (11502), 05EQ (11511), 05ER (11528), 05EU (11624), 05E9 (11273), 05EC (11295, part (3)), 05EG (11375) and 05EK (11431).
  - The projectivity clause is limited to finitely generated modules, and the alignment table marks it as adapted.
- 1.3, formal sections and completion: 0EII (stacks-0EKS 1923), 0EKP (2094-2124, including the "repeat with the cokernel" step), 0EKS (2193) and 0BLD (153).
- 1.3, Stacks 58.17–58.19: 0BLF (stacks-0BMA 2245), 0BLH (2266), 0BLL (2421), 0BLI (2283-2316), 0EL8 (2028), 0BM6 (2342), 0BLJ (2351) and 0BL7 (613).
- 1.3, other chapters:
  - Properties: 01Q3 (1) ⇒ (8) (stacks-01Q3 1942-1963).
  - Cohomology: 0882 (stacks-0882 2935).
  - More on Morphisms: 05K0 (stacks-05K0 6247).
  - Morphisms: 01R8 (stacks-01R8 421), 02JY (2145) and 081I (2198).
  - Algebra: 00MA (10677), 0BNG (10578), 090T (10626), 03C4 (9297), 00U2 (17925) and 05A9 (10467).
  - More on Algebra: 0ALJ (stacks-09ZL 1331) and 09ZL (1758).
- 1.4: 0BLS (2449), 0BLM (2459), and the remark before 0EK6 (2431-2433), which gives the complete normal dimension-three example.
- 2.1: 0BMA (2503-2523); SGA 2 X Théorème 3.4 (i) (3390); SGA 1 X Corollaire 3.2 (sga1 8370-8388: quasi-finite local `B`, proof given only for dimension 2); 00NP (stacks-00R4 11920), 00NQ (11925), 0AFS (12566), 0567 (20195), 031S (20161), 00R4 (14937) and 0BJF (stacks-0BJF 269).
- 2.2: 0BQ5 (stacks-limits 2571), 0EY3 (2627); 0EY7 (stacks-0BMA 2604, Noetherian schemes, matching `[IsNoetherian X]`); SGA 2 X Proposition 3.3 (3386); SGA 1 X Corollaire 3.3 (8394, codimension ≥ 2 forces local dimension ≥ 2).

**Cross-roadmap citations resolved (10 supplier ids, 5 consumers).**
- SchemeAndStackFoundations ids, each resolved at this head, on main and at the heads of #1656 and #1276. All present, and the README describes each as its owner does:
  - §0.9 `finite_presentation_limits` (head line 968);
  - §0.14 *henselian_pair_characterisations* (1145) and *henselian_finiteEtale_equivalence* (1155);
  - §2.6 `serre_affineness_criterion` (3363);
  - §2.7 `supports_localization_triangle` (3390), `localCohomology_module_comparison` (3399), *localCohomology_flat_baseChange* (3407) and `depth_localCohomology_vanishing` (3412);
  - §4.8 `CoherentFormalModule` and `completionFunctor` (5210-5213).
- SchemeAndStackFoundations cites LocalPurity only as a consumer, so supply runs one way.
- Consumers, each confirmed at its source:
  - PurityOfBranchLocus §2.1 (this head, line 251);
  - AbhyankarLemma (main, lines 28, 56-57, 265-268);
  - PurityForFlatCohomology (#1840, lines 596-600 and 1227);
  - CrystallineCohomology (#857, line 439);
  - EtaleHomotopyTypes (#1806, line 155).
- No roadmap cites the Lean names this pull request drops from `Suggested.lean` (`FEt`, `PurityHolds`, `puncturedSpectrum`, the padding theorems). The overlap report lists no dropped ids.

**Ownership by object.** I searched main and the 450 open heads for 05EL, 05ER, 05EU, 0EII, 0EKP, 0EKS, 0BLD, "formal glueing" and Beauville–Laszlo, and for 0BQ5, 0EY3, 0EY7, 0BMA, 0EL8, 0BLH, 0BLI, 0BLL, 0BM6, 0BLJ, 0BLS, 0BLM and 0BM9.
- LocalPurity is the only owner of all of them.
- AdicSpacesPartIII (main, line 3866) owns 0ALK (15.91.17), a consequence of 05ER rather than 05ER itself.
- RelativeFarguesFontaine §6.5 and AInfCohomology own Beauville–Laszlo (15.92), a different statement.
- PurityForFlatCohomology §1.5's local Lefschetz theorem is étale-cohomological, not 0BLM.
- The pins have only steps: the 0BQ5 shrinking lemmas (`TauCeti/Algebra/Colimit/Isomorphism.lean:95`, `RingTheory/Localization/Isomorphism.lean:102`) and the torsion input to 05ER.

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 `PurityHolds`, restriction | a field `k`; `ℤ_(3)`; `k⟦x,y⟧` | field: `U = ∅`, purity holds; `faithful ⇔ 0 < dim = 0` is false; the two projections `k×k → k` agree over `∅`. `ℤ_(3)`: closure `ℤ_(3)[√3]`, Gram `[[2,0],[0,6]]`, disc `12 ∈ 3ℤ_(3)`, not étale, so no extension. `k⟦x,y⟧`: `Γ(U) = A` (depth 2), `U ≠ Spec A`, so not affine | Checks hold; SGA 2's *pur* fails for `k` (`k`, `k×k` both map to `∅`) | none |
| §1.2 *restrictPuncturedSpec_essSurj*, no dimension bound | dim 0, 1, 2 | dim 0: `Spec 0` is in the subcategory (finite, torsion free, normality and étaleness vacuous) and restricts to `∅`. dim 1: `ℤ_(3)[√3]` is étale at `(0)` and restricts to `Spec ℚ(√3)`; `Γ(V) = ℚ(√3)` is not finite, so no quasi-inverse. dim 2: `A×A ↦ U⊔U`, `Γ = A×A` | holds without a bound; quasi-inverse needs dim ≥ 2 | none |
| §1.2 exclusions | `A×A/𝔪`; `A[z]/(z²−x)`, char ≠ 2 | `x·(0,1) = 0`, not torsion free, restricts like `A`. `(z) ∩ A = (x) ≠ 𝔪`, `e = 2`, not `IsEtaleAt` | both excluded | none |
| §1.3 *FormalGlueData*, *Can*, *H⁰* | `S = 0, f = 1`; `ℤ_(p) → ℤ_p, f = p`; `α₁₂ = 1, α₂₁ = −1` | `H⁰ = M_1`; `H⁰ = ℤ_p ∩ ℚ = ℤ_(p) = Can(ℤ_(p))`; `α₂₁α₁₂ = −1 ≠ α₁₁`, `H⁰ = {(m,m) : m = −m} = 0` | definition discriminates | none |
| §1.3 *formalGlueing_equiv* | `k[x] → k`; `ℤ → ℚ, f = p`; `k[x] → k⟦x⟧`, `M = k[x]/(x−1)` | `H⁰(Can R) = k × k[x,x⁻¹] ≠ R`; `Can(𝔽_p) = (0,0) = Can(0)`; `M⊗S = 0` is flat but `M_x ≅ k` is not | flatness, bijectivity and components all needed; matches 05ER and 05EU | none |
| §1.3 0EII | `k⟦x,y,z⟧, g = z`; `k⟦x,y⟧, g = x`; `k[x,y,z]_(x,y,z)` | both sides `R`, depth `R/zⁿ = 2`; `xⁿ·x^(−n−1)y^(−1) = x^(−1)y^(−1) ≠ 0` and `lim = k((y))⟦x⟧ ∋ y⁻¹`; `∑z^(n²)` reduces mod `(x,y)` to a non-rational series, so it is not in `R` | both hypotheses needed | none |
| §1.3 0EKP | `Spec k[x]`, `Spec k⟦x⟧`, `Y = V(x)` | `k[x] → k⟦x⟧` is not onto and `1/(1−x) ∉ k[x]`, so (1) and (4) fail; for `k⟦x⟧`, (1) holds | consistent with (4) ⇒ (3) ⇒ (1) for `E = 𝒪` | none |
| §1.3 0BLI route | `dim A/fA = 0` | `U_0 = ∅`, closure `∅` (open and closed); the README says "empty otherwise" | the README is right, the source slips | source issue |
| §1.4 0BLS, 0BLM | `k⟦x,y,z⟧, f = z`; complete normal, dim 3, depth 2 | `H¹_𝔪 = H²_𝔪 = 0` and `(A,(z))` is henselian; `depth A_𝔭 + dim A/𝔭 ≥ 3` for `𝔭 ≠ 𝔪`, so `H²_𝔪` has finite length and is killed by `fⁿ` | Example 2 true | none |
| §2.1 headline (1) | `d = 1, 2, 3`; `k[x²,xy,y²]_0` | `d = 1`: disc 12, `ℚ(√3)` does not extend, excluded by `hd`. `d = 2`: Tau Ceti's case plus (2) ⇒ (1). `d = 3`: `A/z = k⟦x,y⟧` regular of dim 2, depth 3, 0BLM applies. Non-regular: closed fibre `k[x,y]/(x²,xy,y²)` has length `3 ≠ 2`, not flat, purity fails | `hd` and regularity both needed | none |
| §2.1 headline (2) | `B = 0`; `A×A`; `A×A/𝔪`; `A[z]/(z²−x)`; `ℤ_(3)[√3]` | `A → 0` is étale; `A×A` is étale; torsion-free binder fails; `hpunct` fails at `(z)`; disc 12 with `d = 1` excluded | consistent | none |
| §2.2 0EY7 headline | `Spec k ⊔ Spec k` with `U` one point; `Spec ℤ_(3), U = {η}`; `U = X` | Artinian stalk is pure, `V ⊔ ∅` extends; purity fails and `ℚ(√3)` does not extend; identity is essentially surjective | Noetherian as in the source | none |
| §2.2 codimension-two headline | `𝔸²∖0`; `𝔸³∖L`; `𝔸²∖V(x)`; `U = ∅` | dim 2 regular, extends; dims 2 and 3, extends; generic point of `V(x)` has dim 1, hypothesis fails, `t² = x` does not extend; generic points have dim `0 < 2`, so `X = ∅` | true; matches SGA 2 X 3.3 + 3.4 (i) | none |
| *spread_from_localScheme* | separated, proper, finite, étale | §0.9 gives 081F, 01ZO, 07RP, 01ZP; separatedness only via 01ZP on `Δ` (01ZQ) | contract understated | R02 |
| Layer 1 Example 3 | `char k = 2` | `∂(z²−x)/∂z = 0`, `Ω = B·dz ≠ 0` everywhere, generic fibre purely inseparable | étale nowhere, not just along `x = 0` | R03 |
| Convention 5 | `A = k⟦x,y⟧`, `B = A×A/𝔪` | finite, normal, étale off `𝔪`; `¬Flat` (`TauCeti.IsLocalRing.not_flat_prod_residueField`) | 0BM9 and 0BMA (2) false as printed; the correction is right | source issues |

## Not verifiable

- The Provenance repository (pcfawd-formalization) was not opened. That section prescribes nothing. At the pin, the two PuncturedSpectrum modules cite a port at commit `9a20b3f`, while the README cites `d28f90d`. `PuncturedSpectrum/Sections.lean` and `FiniteEtale/FullyFaithful.lean` carry no port note, so "sections and full faithfulness modules are ported from it" cannot be confirmed from the pin.
- #1808 and #1854: I did not compare their LocalPurity edits at the git level. Their order against this pull request is stated in the generated merge-order block.
- EtaleHomotopyTypes (#1806, lines 159-161) asks LocalPurity §2.2 for two gaps, `gap:relative-etale-depth` and `gap:relative-homotopical-purity` (SGA 2 XIV 1.19–1.20). They are that roadmap's requests through the intake and are not this pull request's subject. The consumer line on README line 862 is accurate for what EtaleHomotopyTypes consumes today.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says global sections are an equivalence onto all finite normal `A`-algebras étale over the punctured spectrum; it should restrict to `A`-torsion-free algebras, since `A × A/𝔪` is outside the image; affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal `B` étale over the punctured spectrum is étale; it should assume `B` torsion free over `A`, since `A × A/𝔪` is finite, normal and not flat; affects a stated result.
- **Gap** in stacks-0BMA at the proof of Lemma 58.21.3, case `d = 2`, p. 54: the source uses going down to get `dim B_𝔪′ = 2` at every maximal ideal; this fails for a factor `A/𝔪` of `B`, and needs `B` torsion free; affects the proof.
- **Misprint** in stacks-09ZL at Remark 15.91.10 (05EL), p. 249: the source gives condition (a) as `α_ij ∘ α_i = α_j` with target `(M_j)_{f_i}`; it should read `(α_ij ⊗ 1_S) ∘ α_i = α_j` with target `(M_j)_{f_i} ⊗_R S`; affects nothing.
- **Gap** in stacks-0BMA at the proof of Lemma 58.19.4 (0BLI), p. 49: the source says the closure of `s′_0(U′_0)` equals `X′_0`; it is empty when `U_0 = ∅` (`dim A/fA = 0`), a case in which the hypothesis forces `U = ∅`; affects nothing.
