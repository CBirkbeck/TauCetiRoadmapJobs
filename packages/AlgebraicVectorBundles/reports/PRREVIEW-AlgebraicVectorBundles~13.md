# Review of AlgebraicVectorBundles (pull request #3170 at 4aaba98)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 95 changed lines since `87e7f72`. Checked: the new §4.2 and its two Checks, the five declarations it adds to `Suggested.lean`, every line that now points at §4.2 (the layer guide, the L1B label line, the Layer 4 heading and dependencies, the ownership list), the six Stacks locators it cites, the Tau Ceti and Mathlib declarations it names at the pins, the build, and the repair of the previous review's one finding, which is complete. No finding remains: accepted, with one small correction (the pull request's description is out of date for this folder) and no format note, neither blocking. Nothing is left for a human to decide.

## C01 — The description still says that data is listed as not statable and names no `Suggested.lean` declarations for this folder

The description says "data (categories, functors, equivalences) is listed there as not statable", and its AlgebraicVectorBundles bullet reads "new §4.2: relative Spec as a right adjoint on quasi-compact quasi-separated schemes over `X`, with hom-equivalence from `relativeSpecHomIso`", with no `Suggested.lean` list. At this head the folder's `Suggested.lean` defines the category `QcqsOver` and the functors `qcqsFunctions` and `relativeSpecQcqs` with real bodies (lines 183–203) and states `nonempty_adjunction_relativeSpecQcqs` and `isIso_unit_app_iff_isAffineHom` (lines 209–218); its not-statable list no longer mentions §4.2. A reader of the description would not expect these five declarations, nor that the Layer 4 heading now reads "linear schemes and relative Spec" (the old anchor is kept).

Text that would be right for the bullet: "AlgebraicVectorBundles, new §4.2 (Layer 4 retitled 'linear schemes and relative Spec', old anchor kept): relative Spec as a right adjoint on quasi-compact quasi-separated schemes over `X`, with hom-equivalence from `relativeSpecHomIso`, and the unit an isomorphism exactly for affine morphisms. `Suggested.lean`: `QcqsOver`, `qcqsFunctions`, `relativeSpecQcqs`, `nonempty_adjunction_relativeSpecQcqs`, `isIso_unit_app_iff_isAffineHom`." The general sentence would then say that data is listed as not statable except where it is a restriction of pinned functors, as here.

## Verified sound

### Repair of the previous review (at 57376f9)

- R01 (the §4.2 adjunction listed as not statable although it is): repaired. `Suggested.lean` lines 181–218 declare `QcqsOver`, `qcqsFunctions`, `relativeSpecQcqs`, `nonempty_adjunction_relativeSpecQcqs` and `isIso_unit_app_iff_isAffineHom`; the docstring's not-statable list (lines 37–56) has no §4.2 bullet.
- C01 (§4.2 cites no source): repaired. §4.2 now cites Stacks Tags 01LC, 01S7, 01LW, 01LY, 01LX and 01S8 at the claims (README lines 622–633).
- C02 ("fifteen roadmaps"): repaired. The description opens "This PR adds planned targets to sixteen roadmaps".
- N01 (`QcqsOver` declared nowhere): repaired, declared at `Suggested.lean` line 183.
- N02 (Layer 4 heading): repaired. "## Layer 4: linear schemes and relative Spec", preceded by the kept anchor line (README lines 580–582); §4.1 is unchanged, so the id keeps its subject.

### Adversarial table: the statements this diff adds

| Statement | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| `nonempty_adjunction_relativeSpecQcqs`: `Hom_X(T, Spec_X A) ≅ Hom(A, q_* 𝒪_T)` | `X = Spec k`, `T = ℙ¹_k`, `A = k[t]` | `ℙ¹ → 𝔸¹` over `k`: constants, `k` | `Hom_k(k[t], k) = k` | agree |
| same | `T = ∅` | one map `∅ → Spec_X A` | `q_* 𝒪_∅ = 0`; `Hom(A, 0)`: one | agree |
| same | `X = ∅` | `QcqsOver ∅` has one object, one map | algebras on `∅`: the zero algebra only | trivially adjoint |
| wrong model: `relativeSpecQcqs` as left adjoint | `T = ℙ¹_k`, `A = k` | `Hom(Spec k, ℙ¹_k)`: `|k| + 1` points | `Hom(q_* 𝒪_{ℙ¹}, k) = Hom(k, k)`: one | excluded |
| counit `A → p_* 𝒪_{Spec_X A}` invertible | `A = k[t]`; `A = 0` over `Spec k` | `k[t]`; `0` | `Γ(𝔸¹, 𝒪) = k[t]`; `Γ(∅, 𝒪) = 0` | iso; Stacks 01LX (3) |
| `isIso_unit_app_iff_isAffineHom`, ⇒ | `𝔸² ∖ 0 → Spec k`, qcqs, not affine | `Γ = k[x, y]`, reflection `𝔸²` | unit: open immersion missing the origin | not iso, not affine: consistent |
| same, ⇐ | `Spec k ⊔ Spec k → Spec k` | `Γ = k × k` | `Spec(k × k) = T` | iso, affine: consistent |
| same, dependence on the choice of `adj` | two adjunctions `adj`, `adj′` of the same pair | `unit′ = unit ≫ G(α)` for an automorphism `α` of the left adjoint | `G(α)` invertible | statement independent of `adj`, not vacuous |
| Check 1 (quasi-compactness needed) | `T = ⊔_ℕ Spec ℤ`, `p = 2` | `∏ ℤ[1/2] ∋ (2⁻ⁿ)ₙ` | `(∏ ℤ)[1/2]`: denominators bounded by some `2ᵏ`; coordinate `k + 1` fails | not quasi-coherent; Check true |
| Check 2 | `ℙ¹_k → Spec k` | `q_* 𝒪 = k`, reflection `Spec k` | unit `ℙ¹_k → Spec k`: dimensions `1` and `0` | not iso; Check true |
| `relativeSpecQcqs` well defined | affine ⇒ quasi-compact, separated ⇒ quasi-separated | Stacks 01S7 | the Lean body's `inferInstance` elaborates | holds |
| `qcqsFunctions` well defined | `q` qcqs, `𝒪_T` quasi-coherent | Stacks 01LC; Tau Ceti instance `isQuasicoherent_pushforward` | body elaborates, no `sorry` | holds |

### Sampled targets the diff does not touch (instances recomputed)

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| 1.1 stalks of a pullback | origin `↪ 𝔸¹_k`, `G = 𝒪` | `k[t]_(t) ⊗ k = k` on both sides | iso |
| 1.2 tensor comparison | `Spec 𝔽_p → Spec ℤ`, `E = F = ℤ/p` | `(ℤ/p ⊗ ℤ/p) ⊗ 𝔽_p = 𝔽_p`; `𝔽_p ⊗ 𝔽_p = 𝔽_p` | iso |
| 2.1 flat pullback exact | origin `↪ 𝔸¹`, `t : k[t] → k[t]` | injective upstairs; `0 : k → k` downstairs | flatness needed |
| 2.2 Hom base change | origin `↪ 𝔸¹`, `M = k[t]/(t)`, `N = k[t]` | `Hom(M, N) = 0`; `Hom(k, k) = k` | flatness needed |
| 3.1 powers and pullback | `𝒪²`, `n = 2, 3` | `Sym²` rank `3`, `∧²` rank `1`, `∧³ = 0`, before and after | iso |
| 3.2 determinant of an extension | `0 → 𝒪(−1) → 𝒪² → 𝒪(1) → 0` on `ℙ¹` | degree `0 = −1 + 1` | as stated |
| 3.3 graded lines | `P = A` on `Spec A` | `det = A` in degree `1` on both sides | agree |
| 4.1 recognition | `α_p` over `𝔽_p` | counit `𝔽_p[t] → 𝔽_p[t]/(tᵖ)` has kernel `(tᵖ) ≠ 0` | not linear, as the Check says |

### Counts

- Source locators checked against the text: 6, all in §4.2 (the only sampled target the change touches): Stacks 01LW, 01LX, 01LY (stacks-01LW line 286, stacks-01LX line 293, stacks-01LY line 303; Constructions pp. 7–8), 01LC (stacks-01LC line 2134), 01S7 and 01S8 (stacks-01S7 line 820, stacks-01S8 lines 826–837; Morphisms pp. 18–19). Each supports the claim it is attached to. The README flags no locator as unverified.
- Library declarations opened at the pins (Tau Ceti `2fd255d9`): `relativeSpecHomIso` (RelativeSpec/UniversalProperty.lean:455), `overFunctions` (Modules/Algebra/Functoriality.lean:314), `relativeSpecEquiv` (RelativeSpec/Equivalence.lean:114), `relativeSpec` and `AffineSchemeOver` (RelativeSpec/Functor.lean:219, :207), `Scheme.Modules.isQuasicoherent_pushforward` (Modules/Quasicoherent/Pushforward/QuasiSeparated.lean:107), `Scheme.Hom.isIso_relativeSpecFunctionsToScheme` (RelativeSpec/Counit.lean:139); Mathlib `Adjunction.mkOfHomEquiv` (CategoryTheory/Adjunction/Basic.lean) and `MorphismProperty.Comma.changeProp` (CategoryTheory/MorphismProperty/Comma.lean:332). No adjunction or reflectivity statement for relative Spec exists under RelativeSpec/ at the pin, so §4.2 duplicates nothing there.
- Record: the README at the merge base has four layers; the head keeps all four ids, removes no item, and retitles Layer 4 with its anchor kept. No roadmap, on main or open, links to that anchor.
- Cross-roadmap citations: the diff adds none. The citations of L1B and L2A in SchemeAndStackFoundations (main and its two open heads) and FunctorOfPoints still resolve, since the labels are unchanged.
- Dependency check (verbatim): `depcheck: 115 roadmaps, 1314 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` gives seven `declaration uses 'sorry'` warnings (lines 101, 121, 135, 153, 171, 209, 216) and nothing else; no `set_option`, no sorried data. `#check` of the three new definitions and the worker's elaborated types of the two new theorems match §4.2 (full subcategory of `Over X`; unit iso iff `IsAffineHom T.hom`); no binder lost.
- One-tactic probe on a copy: `nonempty_adjunction_relativeSpecQcqs` does not close by `infer_instance`, `simp` or `exact ⟨Adjunction.mkOfHomEquiv _⟩`; `isIso_unit_app_iff_isAffineHom` does not close by `simp`, `aesop` or `constructor <;> intro <;> infer_instance`. Neither is padding.
- Headlines: the four of the opening overview are unchanged (five theorems stated, four items named as not statable); §4.2 adds two stated theorems. Files changed outside the folder: only the fifteen other roadmap folders of this pull request.

Overlap check: read SchemeAndStackFoundations (main; open heads #2489 and #2531), FunctorOfPoints (#2465), LogPluricanonicalForms (#2122), AdicSpacesPartIII, NashBlowups, and by object search AlgebraicModuliForArithmeticGeometryPartII §2.2 and GroupSchemesOverABase §4.3 (both affinization over a field, built on relative Spec, not the adjunction). The adjunction and reflectivity of §4.2 are owned only here. The open revision of SchemeAndStackFoundations (#2531, §0.2a) names the canonical morphism `T → Spec_X(q_* 𝒪_T)` as its own definition for quasi-affine morphisms; that morphism is the unit of §4.2's adjunction, the two texts agree on it (the image of the identity under the universal property), and SchemeAndStackFoundations is the later roadmap, so any citation is its to add.

Source independence: 11 passages compared with 3 Stacks chapters (changed passages only: the six cited claims of §4.2, its two Checks, and the three new docstrings), none shared beyond forced terms; largest share The Stacks Project, 33 of 34 locators; contents not compared, since the diff adds, removes and reorders no layer.

Research link: Layer 3's determinant of a short exact sequence (Stacks Tags 0FJB–0FJE; Hartshorne 1977, II, Exercise 5.16) supplies the Picard-valued determinant on K₀ used by SchemeAndStackFoundations and KTheoryLowDegrees; Layers 1–2 serve AdicSpacesPartIII. Rests on the README's overview and its consumers section.

## Not verifiable

- Hartshorne, *Algebraic Geometry*, II, Exercise 5.16: recorded as uncertified; cited only in text the change does not touch.
- The open heads of SchemeAndStackFoundations, FunctorOfPoints and LogPluricanonicalForms were read through the roadmap search and display tools, not from full checkouts.

Automatic checks set aside as false positives: the scan for leftover anchor tags flagged the line that keeps the old Layer 4 anchor before the retitled heading, which is the form a retitled heading is meant to take; the check that nothing changes outside the folder flagged 29 files, all of them the README and `Suggested.lean` of the fifteen other roadmap folders this pull request itself revises.

## Source issues

- none

## For the human reviewers

- none
