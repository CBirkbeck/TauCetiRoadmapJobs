# Review of ArithmeticGaloisDuality (pull request #858 at 8180432)

**Verdict:** needs changes

## R01 (P3) — Document the new completion field instance

**Location:** `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean:220`, `instance (v : TauCeti.Place k F) : Field (Completion k F v)`.
**Claim:** This newly added declaration has no docstring, contrary to the required Lean form.
**Witness:** The docstring at lines 216–217 belongs to `Completion`; line 220 starts an undocumented instance. The next docstring, at lines 223–224, documents the separate algebra instance.
**Repair:** Insert immediately before line 220: ``/-- The field structure on each completion is inherited from `TauCeti.Place.Completion`. -/``. The documented scratch copy elaborates with only the twelve expected `sorry` warnings.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean:218–261` uses the named completion family with the canonical field and algebra structures; both Sha signatures contain no `letI`. The new documentation omission is R01 above.
- R02 — repaired: `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean:267–272` binds both the topology and `DiscreteTopology` explicitly. The latter forces exactly the previous discrete topology.
- R03 — repaired: the description now says “merge-order block below” and “DerivedModuleAlgebra (on main)”, with the repeated parenthesis removed.

## Verified sound

| Statement | Instances | Computed values | Comparison values | Result / change |
| --- | --- | --- | --- | --- |
| `GlobalFunctionField.Completion` | `F = 𝔽₇(t)`, places `t = 0` and infinity, `u = 1/t` | Completions `𝔽₇((t))`, `𝔽₇((u))` | The supplied place completions are the same fields; carrier equality closes by `rfl`. | Same carrier. |
| Completion `Field` instance | Constants in `𝔽₇((t))`; zero and nonzero inverses | `0⁻¹ = 0`; `2⁻¹ = 4`; `2·4 = 1` | Identical operations in the pinned field instance; structure equality closes by `rfl`. | Mathematics preserved; add docstring (R01). |
| Completion `Algebra F` instance | Same two places; image of `t` | At zero: `t`, order `1`; at infinity: `u⁻¹`, order `−1` | `completionEmbedding(t)` has those same values; algebra-map equality closes by `rfl`. | Canonical localization maps preserved. |
| `GlobalFunctionField.sha_duality` | `𝔽₇(t)`, trivial `M = ℤ/3`, `n = 3`; also `M = 0`, `n = 1` | `Ш¹(Mᴰ) = Ш²(M) = 0`; both cardinalities `1` | Each curried pairing is the unique bijection between singleton groups; both dual groups have cardinality `1`. | Finite perfect pairing retained. |
| `GlobalFunctionField.centralObstruction_localization` | `𝔽₇(t)`, `M = ℤ/3`; Brauer class at zero and infinity | Local invariants `1/3`, `−1/3`; sum `0`; global class nonzero | Localization is nonzero, hence class lies outside the kernel; kernel `0`, cardinality `1`. For `M = 0`, kernel also `0`. | Kernel vanishing does not assert global `H² = 0`. |
| `GlobalFunctionField.tate_vanishing` | `𝔽₇(t)`, `p = 3`; coefficient `A = (ℚ/ℤ)[3^∞]` | `3·[1/3] = 0`; `[1/2] ∉ A`; `H²(F,A) = 0` | Both topology presentations equal `⊥`; every singleton is open. The predicted cohomology cardinality is `1`. | Discrete coefficient and vanishing retained. |

The rows for untouched statements stand as in the previous review, of `77ae83a`.

- Increment: 45 changed lines, 3 changed theorems, 1 supporting definition and 2 instances; no layer changes, no removed headline or supplier, and no base-relative changes outside the folder.
- Sources: 2 affected locators checked, `milne-adt` I, Remark 1.12, printed p. 24/PDF p. 32 (lines 983–996), and Theorem 4.10(a), printed p. 57/PDF p. 65 (lines 2139–2144); the seeded all-place target's changed completion passage agrees with the pinned API.
- Pinned declarations opened: 6, `TauCeti.Place.Completion`, `completionEmbedding`, `ord_completionEmbedding` in `TauCeti/FieldTheory/FunctionField/Place/Completion/Basic.lean:45,53,93`; `ContinuousCohomology.tateShafarevich` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:72`; additive `primaryComponent` in `Mathlib/GroupTheory/Torsion.lean:446`; `DiscreteTopology.eq_bot` in `Mathlib/Topology/Order.lean:309`.
- Signatures: all 18 actual named definitions/theorems and both new instances checked with `#check @`; the scanner's `GlobalFunctionField.that` is text inside a docstring. Required theorem binders survive; the completion adapter needs only fields, an algebra and a place.
- Padding: none of the 3 changed theorems closes with `simp`, `rfl` or `infer_instance`; the pinned near-matches define primary components and localization kernels, not these arithmetic theorems. Four adapter/topology equalities were proved on a scratch copy.
- Dependency check: `depcheck: 245 roadmaps, 2222 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The added supplier citations resolve at the Tau Ceti pin; no cross-roadmap citation was added or changed.
- Gate: every scanner passes at `8180432`; the supplied targeted-build result is `build=0 OK`. Independent `lake env lean` elaboration succeeds with exactly twelve `declaration uses sorry` warnings. The worktree remains clean.
- PR text: title, summary block and prose checked against the added 7,751-line folder, eight layers, supplier contracts and Lean headlines; R03's sentence is corrected, and no further contradiction or omitted removal was found.

Overlap check: read SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa, EulerSystemsAndKolyvaginSystems, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticGaloisRepresentations, ProfiniteCohomology, ClassFieldTheory and DerivedModuleAlgebra; for this increment, place completions belong to pinned Tau Ceti, the localization-kernel carrier to Mathlib, and function-field finite Sha duality and Tate vanishing to ArithmeticGaloisDuality; no second owner found. No dropped id, second copy or conflicting head was reported.

Source independence: changed passages only; 5 prose passages compared with the pinned Tau Ceti completion source, with no copied expression or reused material. The largest literature source by author-led parenthetical citation groups is `milne-adt` (49 of 170 groups). No layer was added, removed or reordered, so the prior contents comparison stands.

## Not verifiable

- No newly required text is unavailable. The prior report's unavailable Neukirch–Schmidt–Wingberg and Rubin texts concern untouched passages; their locators were not re-certified.

## Source issues

- **Misprint** in milne-adt at Theorem 4.10(b), printed p. 57: the source says the image for coefficients M is the kernel of a gamma map labelled with the dual coefficients; it should label gamma with M, matching its domain; affects nothing.

## For the human reviewers

- none
