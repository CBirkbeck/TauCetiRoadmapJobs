# Review of GlobalQuadraticForms (pull request #1215 at 8089627)

**Verdict:** needs changes

This is a full review of the folder at `8089627`. It has two findings, both P3 and neither blocking. The mathematics, the supplier contracts, the sampled locators and the Lean signatures all check out (see Verified sound).

## R01 (P3) — #1200 still changes this folder and conflicts with this head, and no order is stated

**Location.** This pull request's description, and `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean`, which #1200 ("Fix rank-four discriminant sign comparison", head `40494aa`) also changes.

**Claim.** Two open pull requests change the same targets. Whichever merges second will either conflict or revert the first. The description of this pull request covers ClassFieldTheory only. It does not mention this folder or #1200.

**Witness.** `git merge-tree --write-tree HEAD 40494aa` reports `CONFLICT (content)` in both files. `git diff HEAD 40494aa` on the folder gives 82 README lines and 30 Lean lines. Every hunk is text that this head refines: the `H¹` owner (README:85–90), `invertibleTwo` (:102–104, :184–185), the `presentedForm` notes (:313–318, :571–574, :606–613), and the 8.3 statement (Suggested.lean:147–149). This head therefore already carries #1200's content.

**Repair.** In this pull request's description, say that it supersedes #1200's change to `TauCetiRoadmap/GlobalQuadraticForms/`, then close #1200. Alternatively, rebase #1200 on this head, which empties its diff in this folder. Check: afterwards the overlap report lists no other open pull request that changes GlobalQuadraticForms.

## R02 (P3) — `equivalent_of_locallyEquivalent` is padding: it restates one direction of `hasseMinkowski_equivalent`

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:133–140`: "theorem equivalent_of_locallyEquivalent … (h : Q.LocallyEquivalent R) : Q.Equivalent R := (hasseMinkowski_equivalent Q hQ R hR).2 h". It is also listed as a headline in the module docstring (:26–31).

**Claim.** `Suggested.lean` is the acceptance test. This declaration tests nothing beyond 6.3: it closes in one term from the sibling headline, with the same binders and hypotheses. The README already says so ("the reverse direction of 6.3", README:925–926).

**Witness.** The declaration is proved in place with the single term above. The elaborated type (signature check) equals the `.2` direction of `hasseMinkowski_equivalent` with the same nine binders. No `Suggested.lean` imports this module, so deleting it breaks no build (`grep` over all roadmap `.lean` files).

**Repair.**
- Delete the declaration from `Suggested.lean`, and drop 8.4 from the docstring's headline list.
- Keep 8.4 in the README as a target, but stop backticking the name. Write it the way README:73–74 already records an alias: "(the reverse direction of `hasseMinkowski_equivalent`; Integral Lattices cites it under the name equivalent_of_locallyEquivalent)".
- Make the same change in the Integral Lattices bullet of Downstream consumers (README:971–972). That keeps main's `TauCetiRoadmap/IntegralLattices/README.md:477, :916` resolvable.
- Check: the gate's readme-ids check passes with the unbackticked alias, as it does for `exists_hilbertSymbol_eq_neg_one_iff_pair` now.

## Verified sound

**Gate and build.**
- The worker's gate passes every check at `8089627`.
- The dependency check (`gate --depcheck … --movable`) gives `depcheck: 237 roadmaps, 2308 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The README declares no roadmap supplier. GlobalQuadraticForms is on main and is not listed in ORDER.txt.
- `lake env lean` on `Suggested.lean` exits with exactly 8 `sorry` warnings (lines 52, 69, 77, 85, 94, 112, 121, 147) and nothing else.
- `#check @` of all 9 declarations, elaborated by me, is identical to the signature listing. `K`, `V` and `W` sit in independent universes, `[FiniteDimensional K V]` / `[FiniteDimensional K W]` are explicit in each signature, `hQ` and `hR` are about `Q` and `R`, and 8.3 carries no stray `[Invertible (2 : K)]` binder. Each type matches its README statement in generality.
- One-tactic probe on a scratch copy, with `first | rfl | simp | infer_instance | trivial | exact?` replacing each `sorry`: none of the 8 sorried theorems closes. `simp` only unfolds the local predicates on 5.5, 6.1, 6.2 and 6.3, and `exact?` fails on 4.2, 7.3, 8.1 and 8.3.
- The edit outside the roadmap folders, `Completed/LocalGaloisGroups/Suggested.lean` (+62 −50, commit `1abcd32`), is a forced consumer adaptation. Main's copy imports `TauCetiRoadmap.ClassFieldTheory.Suggested` (line 11). The project's gate configuration allows exactly this path (`outside_folder_allow`), so it is settled and not a finding.

**Names at the pins.** All 124 backticked library names in the README resolve at the pins.
- 105 elaborate under `#check @` in a scratch file.
- 19 live in Tau Ceti modules without object files. I located those at their declaration line, with namespace: `PrescribedLocalForms.lean:67/140`, `CompletionTower.lean:217`, `ComplexPlaces.lean:66`, `ApproximateValue.lean:61`, `LocalValues.lean:51`, `Existence.lean:169`, `AnisotropicPlaces.lean:90`, `Hyperbolicity.lean:116`, `HigherRank.lean:87`, `Quaternary.lean:137`, `Approximation/SquareClass.lean:40`, `Nonabelian/Basic.lean:190`, `Sqrt5.lean:178`, `TernaryObstruction.lean:147/191`, `HyperbolicIsometry.lean:68`, `DefiniteObstruction.lean:68`, `BinaryObstruction.lean:80`, `Approximation/Vector.lean:127`.
- Every Mathlib path in the contracts is right: `Radical.lean:115` (Nondegenerate = radical ⊥ plus polar kernel of rank ≤ 1), `IsometryEquiv.lean:177`, `TensorProduct.lean`, `Ideal/Lemmas.lean:592`, `InfinitePlace/Ramification.lean:45/82/90`, `Completion/InfinitePlace.lean:336`, `AdeleRing.lean:104/130`, `CharP/Invertible.lean:125`.

**Supplier semantics read at the pin** (Tau Ceti paths under `TauCeti/NumberTheory/`).
- `GlobalFormInvariants` and `IsAdmissible` (`QuadraticForm/Global/Invariants.lean:90, :178`) have exactly the README's clauses: `1 ≤ n`, `p_w ≤ n`, real discriminant `q_w • [-1]`, finite support, the rank-one and rank-two clauses, and Hasse product one. `realHasse` is `(-1)^(q choose 2)`.
- `globalInvariants` (`FormInvariants.lean:77`) is defined in every rank. `isAdmissible_globalInvariants_iff` (:165) and `isAdmissible_globalInvariants` (`ProductFormula.lean:117`) are as quoted.
- `IsLocalRealization` (`LocalRealization.lean:108`), `isAdmissible_ofLocalForms` (:331) and `exists_isLocalRealization` (:405) match 7.2. `exists_locallyRepresents_prod` (`PrescribedLocalForms.lean:140`) has the conditional form the 7.2 route uses.
- The quaternary step (`Quaternary.lean:137`) asks for the ternary case over `L : Type u` on `presentedForm`. The step for `n ≥ 5` (`HigherRank.lean:87`) asks for rank `n − 1` on `presentedForm` over `K`.
- `globalToLocal` (`WittLocalization.lean:167`) is `W(K) → ∏_v W(K_v) × ∏_w W(ℝ)`. Line 40 of that file says injectivity is not proved there, so 8.3 is not a duplicate.
- `finrank_le_index_range_ideleClassNormMap` (`ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:103–109`) assumes `K L : Type`, `[IsGalois K L]` and `[IsCyclic Gal(L/K)]`.
- `exists_sq_sub_mul_sq_iff_forall_completion` (`HasseNorm/Quadratic.lean:41, :45`) is stated for `K : Type` and all infinite places.
- `exists_fieldUnit_isSquare_div_at_places` (`Approximation/SquareClass.lean:40`) and `mem_range_ideleNormMap_iff` (`Ideles/Norm/Range.lean:115`) are stated for `Type*`.
- So the README's count is exact: eight inputs are `Type`-only, at `PrescribedLocalForms.lean:69`, `ProductFormula.lean:61/100`, `SignPrescription.lean:72`, and the two class-field files.
- The transport inputs are right: `adicCompletionCongr` and `valuation_ringEquivOfRingEquiv` (`RingTheory/DedekindDomain/AdicValuation/Transport.lean:140, :119`) and `asIdeal_equivOfRingEquiv` (`Ideal/Basic.lean:279`).

**Duplication and ownership.**
- The Mathlib pin has no Hasse–Minkowski, local–global or Witt-ring result.
- Tau Ceti has no global square theorem, no unconditional Hasse–Minkowski, no form-level 72:1 and no Witt injectivity. Its quaternary and rank-at-least-five steps are conditional, and `WittLocalization.lean:40` says injectivity is not proved.
- `roadmaps grep` across main and all 460 open heads finds no second owner of these objects. The other folders of this pull request assign them here (ClassFieldTheory README:198–203 and :2046; QuadraticFormInvariants README:86–90 and :2683). No roadmap owns a general transport of number fields to `Type`, so 4.1 is owned here.

**Cross-roadmap citations, resolved.**
- On main:
  - `Completed/OrthogonalSpinGroups/README.md:925–947, :963–966` lists `hasseMinkowski_equivalent` among the successor's imports and leaves the `H¹(K, SO(Q))` translation to Orthogonal Tamagawa and Lattice Mass, as README:85–90 says.
  - `TauCetiRoadmap/IntegralLattices/README.md:477, :916` cite both 6.3 names.
  - ClassicalArithmeticCompletion :189 links `#layer-4-global-square-norm-and-approximation-lemmas`, which is still this heading's anchor, and its 4.4 citations (:601, :783, :793) resolve through the section map (README:68–72).
- At open heads:
  - #1181 OrthogonalSpinGroups links `#61-scalar-representation`, `#63-hasseminkowski-isometry` and `#84-the-form-theoretic-so-kernel-consequence`, all live headings. The Downstream line "Orthogonal and Spin Groups consumes 4.3 and 6.1" is true at that head (its :82–84), not on main.
  - #1063 Metaplectic cites "Layer 4.4" for the real symbol and Layer 3, both mapped by README:64–70.
  - #931 GL2Automorphic and #1722 QuaternionArithmetic cite `exists_hilbertSymbol_eq_neg_one_iff_pair`, mapped at README:73–74 to `exists_pair_hilbertSymbol_eq_ite`, which has the same content (`SignPrescription.lean:191`).
  - #1005 HilbertModular (§§5.5, 6.1), #1285 K3Surfaces (§5.5), #851 GeometryOfNumbers (Layers 5, 6) and #792 AdelicAlgebraicGroups (layer 5) all resolve.
- The dropped ids old 4.1 (vector weak approximation), 4.5, 5.2–5.4, 7.1 and Layer 9 are cited nowhere, on main or at any open head. The overlap report's only dropped id that others cite, Layer 3, is covered by the section map.

**Seeded source sample** (`milne-cft`, printed page = extraction page − 9).

| Target | Locator in README | Text | Supports as written |
|---|---|---|---|
| 4.1 | pinned Mathlib/Tau Ceti inputs, no literature locator (transport of structure) | — | inputs exist at the pins |
| 4.2 | Milne VIII Thm 1.1, `n = 2`, p. 229; Ex. 1.3 | `milne-cft` lines 10384–10386, 10397–10405 | yes: −1 is a primitive square root of 1, "all but finitely many"; Ex. 1.3 is the 8th-power counterexample |
| 4.3 | Milne VIII Thm 3.1, p. 234 | lines 10629–10631 | yes, cyclic `K(√d)/K` |
| 5.1 | Milne VIII Thm 3.5(b), Prop 3.7(b),(c), proof p. 237 | lines 10686–10689, 10700–10702, 10774–10778 | yes for `n = 2`; for `n = 3` the README's use of Thm 3.1 is the correct reading of a source misprint (Source issues) |
| 5.5 | O'Meara 66:1 | uncertified; Milne Thm 3.5(b) (line 10689) states the same | yes (via Milne) |
| 6.1 | O'Meara 66:3 | uncertified; Milne Cor 3.6, p. 236 (line 10694) states it for nondegenerate forms | yes (via Milne) |
| 6.2 | O'Meara 66:3 | uncertified | Not verifiable |
| 6.3 | O'Meara 66:4 | uncertified; Milne Thm 6.3, p. 252 (line 11619) | yes (via Milne) |
| 7.2 | O'Meara 72:1; Milne Thm 6.10, Prop 6.11, p. 255; p. 256 remarks | lines 11745–11763, 11781–11790; Milne Thm 6.12 (line 11792) is the same existence theorem with `i ≤ j` signs | yes |
| 7.3 | O'Meara 72:1 | uncertified; Milne 6.12 restatement (lines 11798–11807) matches the admissibility clauses after `S = ε·(−1, d)` | yes (via Milne) |
| 7.4 | Milne Thm 6.3, p. 252, with Thm 6.10, p. 255 | lines 11619–11628, 11745; `S = ε·(−1, d)` at line 11691 | yes |
| 8.1 | O'Meara 66:5 | uncertified; follows from Milne 6.3 and 6.10 | yes (via Milne) |
| 8.2 | Milne Thm 6.3, p. 252; Prop 6.2, p. 251 | lines 11619, 11574–11575 | yes |
| 8.3 | Milne Thm 6.3 through 8.2 | line 11619 | yes |
| 8.4 | Milne Thm 6.3, p. 252 | line 11619 | yes |

The README flags no locator as unverified.

**Adversarial table** (values computed; `L/R` = left and right sides of the statement).

| Statement | Instance | Values | Result | Change |
|---|---|---|---|---|
| Conventions: discriminants | `H = ⟨1,−1⟩`; `⟨1,1⟩` | plain `[−1]`, signed `(−1)^1·[−1] = [1]`; plain `[1]`, signed `[−1]` | holds | none |
| Conventions: `i<j` vs `i≤j` | `H` over ℝ | `(1,−1)_ℝ = 1`; `(1,1)(1,−1)(−1,−1) = −1` | differ as stated | none |
| Conventions: product formula | `(−1,3)` | `ℚ₂: −1` (ε(−1)ε(3) = 1), `ℚ₃: −1` (`3 = x²+y²` impossible, odd valuation), `ℝ: 1`, `p ≥ 5: 1`; product `1` | holds | none |
| 4.1 places follow σ | conjugation on ℚ(i), `𝔭 = (2+i)` | mod `𝔭̄`: `i ≡ 2`, `2+i ≡ 4 = 2²`, so square in `K_𝔭̄`; `v_𝔭(2+i) = 1`, nonsquare in `K_𝔭`; `σ(2+i) = 2−i` square in `K_𝔭 = K_{σ𝔭̄}` | holds | none |
| 4.1 records | ℚ(√5), `⟨1,θ,θ⟩` | `θ ↦ (1+√5)/2`: `p = 3`; `θ ↦ (1−√5)/2 < 0`: `p = 1`; same under `θ ↦ X̄` | holds | none |
| 4.2 | ℚ, `a = 4`, `S = ∅`; `a = −1`; ℚ(i), `a = −1` | true/true; hypothesis fails at every `p ≡ 3 (4)`, conclusion false; true/true (`−1 = i²`) | holds | none |
| 4.2, 8th powers | 16 over ℚ | `x⁸−16 = (x²−2)(x²+2)(x²+2x+2)(x²−2x+2)`: a root at every odd `p` and in ℝ; none in ℚ | analogue false, so the restriction to squares is needed | none |
| 4.3 | `(d,a) = (−1,5), (−1,3), (2,−1), (−1,−1)` | `5 = 1+4`: T/T; F/F (fails at 3); `1−2 = −1`: T/T; F/F (fails at ℝ) | holds | none |
| 5.1 binary | `⟨1,1⟩` over ℚ(i) and over ℚ | `d = [1] = [−1]`, `1+i² = 0`: T/T; F/F (anisotropic at `ℚ₃`) | holds | none |
| 5.1 ternary | `⟨1,1,−2⟩`; `⟨1,1,−3⟩` | `(1,1,1)`, `d = −1`, `a = 2 = 1+1`: T/T; F/F (anisotropic exactly at `ℚ₂, ℚ₃`) | holds | none |
| 5.5 `hasseMinkowski_isotropic` | rank 0; `⟨a⟩`; `H`; `⟨1,1,1,1,1⟩` | F/F (number fields have finite places); F/F; T/T; F/F (definite; anisotropic at ℝ) | holds | none |
| 5.5, `hQ` | `⟨1,0⟩` (excluded) | radical vector `(0,1)`: T/T | holds without `hQ`, as README:646 says; source states it for regular forms | none |
| 6.1 `represents_iff_locallyRepresents` | `⟨1,1⟩` with `a = 3, −1, 2`; zero space with `a = 1` | F/F (`ℚ₃`); F/F (`ℝ`, `ℚ₂`); T/T; F/F; for `a = 0` (excluded) T/T | holds | none |
| 6.2 `represented_iff_locallyRepresented` | `⟨1,1⟩ → ⟨1,1,1,1⟩`; `⟨3⟩ → ⟨1,1⟩`; rank 3 → rank 2; `⟨c⟩ → H` | T/T; F/F (`ℚ₃`); F/F; `((1+c)²−(1−c)²)/4 = c`: T/T | holds | none |
| 6.3 `hasseMinkowski_equivalent` | `H` vs `⟨2,−2⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩`; zero vs zero | T/T; F/F (ℝ); F/F (`ℚ₃`: anisotropic vs isotropic); T/T | holds | none |
| 7.2 | ℚ, rank 3, `d = [1]`, `R = ⟨1,1,1⟩`, `s = −1` only at 2 | product `(−1)·1 = −1`, hypotheses fail; `⟨1,1,1⟩` has `s_2 = 1` | consistent | none |
| 7.2 | `⟨−1,−1,−1⟩` | `s_2 = (−1,−1)_2³ = −1`, real `(−1)^(3·2/2) = −1`, product `1`; realized by itself | holds | none |
| 7.2, real classes | rank 4, `d = [1]` | `q ∈ {0,2,4}`: signs `1, −1, 1` | `p_w` must be carried | none |
| 7.3 `exists_globalForm_of_isAdmissible` | rank-0 record; rank-1 record with `s = −1` at two places; ℚ(√5) record | `1 ≤ n` fails (realized, not admissible); product `1` but the rank-one clause fails; `(−1)·1·(−1) = 1`, admissible, realized by `⟨1,θ,θ⟩` (`Sqrt5.lean:178`) | holds | none |
| 7.4 / 8.1 `equivalent_iff_globalInvariants_eq` | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩` | both `(3, [−1], s ≡ 1, p = 2)` since `(2,−2) = 1`; isometric | holds | none |
| 8.1 | `⟨1,1⟩` vs `⟨2,2⟩` | both `(2, [1], (2,2)_v = 1 since 2 = 2²−2·1², 2)`; `(x+y)²+(x−y)² = 2x²+2y²` | holds | none |
| 8.1 | `⟨1,1,1⟩` vs `⟨−1,−1,−1⟩`; zero vs `⟨1⟩` | `(3,[1],1,3)` vs `(3,[−1],s_2 = −1,0)`, F/F; rank `0 ≠ 1`, F/F | holds | none |
| 7.4, Milne's convention | rank `n`, discriminant `d` | `S = ε·(−1,d)` (line 11691): the same factor on both sides | holds | none |
| 8.2 | `2H = ⟨1,−1,2,−2⟩`; `⟨1,1⟩` | locally `2•H`, globally hyperbolic; at `ℚ₃` `[1] ≠ [−1]` and `p_∞ = 2 ≠ 1`, not hyperbolic | holds | none |
| 8.3 `injective_wittRing_baseChange_places` | `⟨1,1⟩`; `H`; `⟨1,1,−3⟩ ⊥ ⟨−1,−1,1⟩` | real signature `2 ≠ 0`, class ≠ 0; `0`/`0`; nonzero at `ℚ₃` (same rank, not isometric there), class ≠ 0 | holds | none |
| 8.3, complex places | any class with image 0 | vanishes at a finite place ⇒ even dimension ⇒ 0 in `W(ℂ) = ℤ/2` | omission justified | none |
| 8.4 `equivalent_of_locallyEquivalent` | one-tactic probe | closed by `(hasseMinkowski_equivalent Q hQ R hR).2 h` (line 140) | padding | R02 |

**Route checks.**
- In 4.2's idele argument, steps 2 to 5 use only `exists_fieldUnit_isSquare_div_at_places`, `mem_range_ideleNormMap_iff` and the first inequality. A square `c²` is the norm of `c ⊗ 1`, and a local square forces the split algebra. The ⚠ example (`√2` at the real place) is correct.
- 6.2's induction needs only Witt extension (an isometry of the lines `⟨u⟩ → ⟨e_R⟩` extends) to carry `e_Q^⊥` into `e_R^⊥`.
- In 5.1, the ternary scaling reduces correctly to 4.3 at the places where `d` is a local nonsquare.

## Not verifiable

- `omeara` (O'Meara, *Introduction to Quadratic Forms*): uncertified in the manifest (paywalled). The locators 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1 were not read. Of the sampled targets, only 6.2 rests on O'Meara alone; the others are supported by the Milne passages in the table.
- `serre` (Serre, *A Course in Arithmetic*): uncertified. The locators III §1.2 Thm 1, III §2.2 Thm 3, IV §2.1 and IV §3.2 Thm 8 were not read. They are used only for the `ℚ` examples and the `i < j` convention, which I checked against Tau Ceti's `localHasse` (`LocalField/QuadraticForm/Hasse.lean:89–93`) and `hilbertSymbol_real` (`HilbertSymbol/Archimedean.lean:59`).
- Open Mathlib pull requests on Hasse–Minkowski were not searched (no network search in this review). The Mathlib pin has none.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the cases with three and four variables follow from 3.7(c),(d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem over `K` and over `K[√ab]`; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source calls the induction hypothesis for `n − 1` variables "Theorem 3.1b"; it should be Theorem 3.5(b); affects the proof.
- **Gap** in milne-cft at VIII, proof of Theorem 3.5(b), case `n ≥ 5`, p. 237: the source picks any common value `c_v` of the two summands, possibly `0`, then needs `c/c_v` to be a square; it should choose `c_v ≠ 0`, possible because an isotropic regular summand is universal; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 6.3, p. 252: the source names the rank `n − 1` complements `q₁`, `q₁′` and then `q₁`, `q₂`; it should be `q₁` and `q₁′` throughout; affects nothing.
- **Misprint** in milne-cft at VIII, proof of Theorem 1.4, Step 3, p. 230: inside Step 3 the source appeals to "Step 3" for the cyclic `p`-power case; it should be Step 2; affects nothing.
