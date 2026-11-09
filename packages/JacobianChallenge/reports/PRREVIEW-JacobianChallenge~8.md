# Review of JacobianChallenge (pull request #1892 at 617bbe1)

**Verdict:** accepted

This is an incremental re-review of the 48 lines changed in `TauCetiRoadmap/JacobianChallenge/README.md` since e472503. There are no findings. Both findings of the previous review are repaired, and the repairs introduce no new problem. The gate passes, `Suggested.lean` (unchanged) elaborates with `sorry` as its only warning, and the dependency check reports no problem.

## Previous findings

- R01 — repaired: A.3 (lines 443–446) now reads "quasi-compact, its structure morphism being proper, hence quasi-compact, over the quasi-compact `Spec k` (Mathlib's `QuasiCompact.compactSpace_of_compactSpace` …)"; the name is also in A.3's *Needs:*, the Layer A Dependencies and the Mathlib contract (lines 150–155).
- R02 — repaired: D.2 (lines 882–885) cites Kleiman, Exercise 4.4, p. 27, with Answer 4.4, pp. 65–66; D.8 "Field base change" (lines 1081–1085) cites Exercise 4.4, Exercise 6.21, p. 60, with Answer 6.21, p. 72, and Milne III Remark 1.4(b), p. 86.

The D.8 repair cites Exercise 6.21 rather than the Proposition 5.3 that the previous review suggested. That is the better locator: 6.21 is about the degree pieces, which is what D.8 uses, while 5.3 is about the identity component.

## Verified sound

**Gate, build and dependency check at 617bbe1.**
- My gate run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also reports `build=0`.
- `lake env lean TauCetiRoadmap/JacobianChallenge/Suggested.lean` exits 0 with 14 warnings, all "declaration uses `sorry`". The file is byte-identical to the one the previous review read, so its signature comparison (27 declarations), padding probe (14 theorems, none closes) and headline list carry over unchanged.
- Dependency check with `--movable`: `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. JacobianChallenge is line 1 of the merge order.
- The change since e472503 is `README.md` only (33 insertions, 15 deletions). Nothing changes outside the folder.

**R01 repair, checked at the pins.**
- Mathlib `QuasiCompact.compactSpace_of_compactSpace` (`Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean:148`): `(f : X ⟶ Y) [QuasiCompact f] [CompactSpace Y] : CompactSpace X`. This matches the README's "a scheme with a quasi-compact morphism to a quasi-compact scheme is quasi-compact".
- The instance `[UniversallyClosed f] : QuasiCompact f` is at `Mathlib/AlgebraicGeometry/Morphisms/UniversallyClosed.lean:164`, as the README says.
- Tau Ceti `InvertibleSheaf.eulerDegree_pullback` and `LineBundleClass.eulerDegree_pullback` (`TauCeti/AlgebraicGeometry/LineBundle/BaseChange.lean:54, 73`) both take `[CompactSpace X]` and `[IsAffineHom (pullback.diagonal (terminal.from X))]`. Both names are now in A.3's *Needs:*.
- A scratch probe over a scheme `X` proper over `Spec k` confirms the route:
  - `QuasiCompact f` from `IsProper f` and `CompactSpace (Spec k)` are both found by instance.
  - `CompactSpace X` follows from the named lemma applied to the structure morphism.
  - With that and `Scheme.IsSeparated.of_isSeparated`, `LineBundleClass.eulerDegree_pullback H a` elaborates.
  - Negative control: `CompactSpace X` by `infer_instance` still fails, so the name is needed.

**R02 repair, checked against the sources.**
- Kleiman, Exercise 4.4 (`kleiman2005` line 1286, p. 27): if the Picard scheme exists, it exists after any base change and equals the fibre product with the new base.
- Answer 4.4 (`kleiman2005` lines 3131–3145, pp. 65–66): argues for the étale functor by comparing values on `S'`-schemes, and says the same analysis applies to the other relative Picard functors. The argument uses neither separatedness, finite type nor the Noetherian convention, so the README's sentence extending it to an arbitrary `f` is accurate.
- Kleiman's standing conventions (`kleiman2005` lines 749 and 760, p. 15): locally Noetherian schemes and a fixed separated map of finite type, as the README says.
- Exercise 6.21 (`kleiman2005` line 2868, p. 60): for `X/S` locally projective and flat with integral curves as geometric fibres, the degree-`m` loci are open and closed, disjoint, cover, and commute with changing `S`. Answer 6.21 (line 3455, p. 72) reduces this to Theorem 6.20. The README states the projective case, which is the one D.8 needs over `Spec k`.
- D.8 says the standing curve meets those hypotheses "by D.4". D.4 (lines 948–951) gives projectivity (Stacks 0A26) and geometric integrality (`Smooth.geometricallyIntegral`), so the reference is right.
- Milne, *Abelian Varieties*, III Remark 1.4(b) (`milne-av` line 3493, printed p. 86): the Jacobian commutes with extension of the base field. Part (a) of the same remark covers curves without a rational point.
- The References entry for Kleiman now lists Exercise 4.4 and Exercise 6.21 with their answers in Appendix A, in agreement with the body.

**Seeded sample.**
- "Field base change" falls in the changed text and is verified above.
- "Cohomology and base change", "Properness and geometric integrality" and "Jacobian" are untouched and were verified in the previous review (Stacks 02KH, 0B91, 0BDN, 0B9T, 056U, 0BA0; Kleiman Theorem 5.11 and Proposition 5.19; Milne III Proposition 2.1).

**Overlaps and citations.**
- `overlaps.md` reports no dropped id and no id that only an open revision defines. The one conflicting pull request is the Tau Ceti bump #1187, whose target commit is an ancestor of this branch's pin (checked in the previous review).
- The resolver's one lead, `Scheme.Modules.Cohomology.formalFunctionsIso` (line 343), is a planned name in SchemeAndStackFoundations §4.9, cited as such; it is unchanged and was resolved in the previous review.
- The changed passages add no cross-roadmap citation.

**Adversarial table.** The first four rows are computed this round. The others are carried forward from the previous review (r7, at e472503), whose statements this diff does not touch.

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| A.3: the standing curve is quasi-compact, so `eulerDegree_pullback` applies | Lean probe on `X` proper over `Spec k`; real conic `C` → `ℂ`; `𝔸¹_k` | probe closes with the named lemma and fails by instance alone; `deg_ℝ 𝒪(P) = 3 − 1 = 2 = deg_ℂ 𝒪(2)`; `𝔸¹` is quasi-compact but not proper, and the lemma still applies since `𝔸¹ → Spec k` is affine | holds | none |
| Mathlib contract: quasi-compact over quasi-compact is quasi-compact | `∐_ℕ Spec k → Spec k`; `Spec k → Spec k` | infinite disjoint union: morphism not quasi-compact, source not compact, so the hypothesis is needed; identity: compact | holds | none |
| D.2 base change of the Picard scheme (Kleiman Ex. 4.4) | conic `C/ℝ`, `Spec ℂ → Spec ℝ`; `f = 𝟙 S`; `S' = S` | `Pic_{C_ℂ/ℂ} = ∐_ℤ Spec ℂ = (∐_ℤ Spec ℝ) ×_ℝ ℂ`; `S' = S ×_S S'`; identity | holds | none |
| D.8 field base change (Kleiman Ex. 6.21, Milne III 1.4(b)) | conic → `ℂ`; elliptic `E/ℚ` → `ℚ(i)`; `K = k`; degree-2 piece of the conic | `(Spec ℝ)_ℂ = Spec ℂ = Jac ℙ¹_ℂ`; `E_{ℚ(i)}`, dimension `1 = 1`; identity; `Pic²` piece `Spec ℝ ↦ Spec ℂ`, the class of `𝒪(2)`, degree `2 = 2` on both sides (a `[K:k]` rule would give 4) | holds | none |
| `eulerDegree_mul_of_smooth` (r7) | `ℙ¹`, `𝒪(1) ⊗ 𝒪(−3)` | `−1 − 1 = −2 = 1 + (−3)` | holds | none |
| `equivCartierDivisor` (r7) | `ℙ¹`; cusp `y² = x³` | `[0] − [∞] ↔ div(t)`; cusp stalk not a DVR, excluded | holds | none |
| `connectedSpace_of_subsingleton` (r7) | `ℙ¹_L/k`, `[L:k] = 2`; real conic | 2 geometric components; 1 component | holds | none |
| C.2 flat base change, complex `K`, semicontinuity, Grauert (r7) | `ℙ¹_k`, `𝒪(−2)`; `ℙ¹_A`, `𝒪(n)`; three sections with `𝓘_Z(1)` | `H¹ ⊗ K = K`; `K = A^{n+1}`; `h⁰ = 1` at `t = 0`, else 0, `χ = 0` | holds | none |
| D.8 properness / geometric integrality (r7) | conic; `y² = x⁵ + 1` over `ℚ`; constant `ℤ/2` | `Spec ℝ`; abelian surface; 2 points, not geometrically connected, excluded | holds | none |
| `dim_jacobianVariety` (r7) | `ℙ¹`; `E`; `y² = x⁵ + 1` | `0 = 0`; `1 = 1`; `2 = 2` | holds | none |
| `finiteDimensional_cohomology` (r7) | `∅`; `ℙ²`, `𝒪(−3)`, `i = 2`; `𝔸¹` | `0`; `1`; `k[t]`, excluded by properness | holds | none |
| `serreDuality_exists_trace` (r7) | `ℙ¹`, `𝒪(n)`; `⊕_ℕ 𝒪` on `E` | `h⁰(𝒪(−2−n)) = max(−1−n, 0) = h¹(𝒪(n))`; `k^ℕ = (⊕_ℕ k)^∨` | holds | none |
| `isRepresentable_relativeEffectiveCartierDegreeSubfunctor` (r7) | `d = 0, 1`; `ℙ¹`, `d = 2`; `X = ∅` | `Spec k`, `X`; `ℙ²`; `∅` | holds | none |
| `hasPicardScheme_of_curve` (r7) | `ℙ¹`; conic | `∐_ℤ Spec k`; `Pic_{C/ℝ}(ℝ) = ℤ ⊋ Pic C = 2ℤ` | holds | none |
| `isRepresentable_picZeroSets` (r7) | conic; Selmer cubic; `ℙ¹` | `Spec ℝ`; an elliptic curve; `Spec k` | holds | none |
| `multiplication_isogeny` (r7) | dim 0; `E`, `n = −2`; `n = 0` | `id`; degree 4; constant, excluded by `n ≠ 0` | holds | none |
| `multiplication_etale_iff` (r7) | `E/𝔽₃`, `n = 2, 3, 0`; dim 0, `n = 3` | étale, `2 ≠ 0`; not étale, `3 = 0`; `[3] = id` étale with `3 = 0`, excluded by `0 < dim` | holds | none |
| `isAlbanese_abelJacobi` (r7) | `g = 0`; `E` with origin | unique `φ = 0`; `φ = f ∘ a⁻¹` | holds | none |
| `isClosedImmersion_abelJacobi` (r7) | `g = 1, 2, 3`; `g = 0` | `h⁰(Ω(−x)) = g − 1 < g`; constant map, excluded by `g ≥ 1` | holds | none |
| `isIso_abelJacobi_of_genus_eq_one` (r7) | `g = 1`; `g = 2` | `1 = 1`; curve in a surface, not an iso | holds | none |
| `isAlbanese_baseChange_abelJacobi` (r7) | `K = k`; `E/ℚ → ℂ`; `ℙ¹` | identity; iso; constant to `Spec K` | holds | none |
| B.2–B.4, C.4, E.1 Checks and D.1–D.7, E.2–E.6, F.1–F.3 (r7 and r4) | as recorded there | as recorded there | holds | none |

**Remark on untouched or cosmetic text (no change requested).** Line 1085 of the README is one unwrapped source line of about 150 characters; it renders correctly.

## Not verifiable

- **Mumford, *Abelian Varieties*, §5** (C.2, untouched): no manifest key, no cached copy and no legal open copy found, as in the previous review. Stacks 0B91, 0BDN and 0B9T cover the same statements.
- **Settled as uncertified:** Hartshorne, Serre, Bosch–Lütkebohmert–Raynaud, Stichtenoth, and Milne's *Jacobian Varieties*; cited by locator only. None is in a changed passage.
- **Ownership against open pull requests** was not re-run over every sibling checkout this round: the changed passages add locators and one Mathlib name and no new object, so the previous review's ownership check stands.

## Source issues

- none
