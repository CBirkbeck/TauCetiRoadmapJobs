# Review of JacobianChallenge (pull request #1892 at 098e9fd)

**Verdict:** needs changes

This is an incremental re-review of the 113 changed lines since 9642df6. There is one finding, a P3, and nothing blocks. Both earlier findings are repaired. The new finding comes from B.3's rewrite: B.3 now lists every hypothesis of `eulerDegree_relativeDifferentials` as a pinned result, and the list misses one. The gate passes. `Suggested.lean` is unchanged and elaborates with `sorry` as its only warning. The dependency check reports no problems.

## R01 (P3) — B.3's list of hypotheses for `eulerDegree_relativeDifferentials` leaves out separatedness

**Location.** `TauCetiRoadmap/JacobianChallenge/README.md` lines 546–565: "Each hypothesis is a pinned result on the standing curve (Exact supplier contracts)." Integrality, constants, `Ω` invertible, DVR stalks and the `IsCurveOver` consequences follow, then the *Needs:* line, which ends with "`Scheme.IsCurveOver.of_smooth`."

**Claim.** The listed names, with their *Needs:* line, discharge every hypothesis of `eulerDegree_relativeDifferentials` on the standing curve.

**Witness.** The theorem also takes `[X.IsSeparated]` (Tau Ceti `Modules/Differentials/Canonical.lean` line 212, used at line 305). In a scratch probe with the standing-curve instances and every listed name in context, applying the theorem fails with "failed to synthesize `X.IsSeparated`". `IsProper` alone does not provide this instance.

**Repair.** Three edits, tested together on a scratch copy of the README:
- **B.3, line 558.** After "`IsCurveOver.valuativeCriterion_existence`)", add "; it is separated, its structure morphism being proper (`Scheme.IsSeparated.of_isSeparated`)".
- **B.3 *Needs:*, line 565.** Append Tau Ceti `Scheme.IsSeparated.of_isSeparated`.
- **From Tau Ceti, the bullet "The standing curve's structure", line 194.** Add "The source of a separated morphism to a separated scheme is separated, `Scheme.IsSeparated.of_isSeparated` (`Morphisms/Separated.lean`)."

**Tests of the repair.**
- With `have : X.IsSeparated := Scheme.IsSeparated.of_isSeparated (X ↘ Spec (.of k))` added, `eulerDegree_relativeDifferentials hF hk hdim hex` elaborates in the probe with no error.
- The negative control `example : X.IsSeparated := inferInstance` still fails.
- The declaration is at Tau Ceti 2fd255d, `TauCeti/AlgebraicGeometry/Morphisms/Separated.lean` line 83, with signature `(f : X ⟶ S) [IsSeparated f] [S.IsSeparated] : X.IsSeparated`.
- `roadmaps resolve` on the edited copy reports no unresolved citation. Run from the scratch path, it did not check Lean names against the pins, so I checked this name directly.

## Previous findings

- R01 — repaired: Conventions lines 88–93 now read "geometrically integral by Tau Ceti's instance `Smooth.geometricallyIntegral` …, applied through Mathlib's `SmoothOfRelativeDimension.smooth`; this is never assumed". A.3 (lines 383–388), D.4 (886–889) and D.8 (1043–1044) cite the instance. The contract bullet is at line 178. A.3 keeps its three Checks.
- R02 — repaired: B.3's *Needs:* (lines 558–565) and D.4's *Needs:* (lines 894–896) list Mathlib `SmoothOfRelativeDimension.smooth` and Tau Ceti `Smooth.geometricallyIntegral`. The B.3 rewrite introduced this report's R01.

## Verified sound

**Pinned declarations named by the changed passages.** I opened each one at Tau Ceti 2fd255d and Mathlib 1b1ccf4 and compared its hypotheses with the README's description. In the Tau Ceti rows, paths are under `TauCeti/AlgebraicGeometry/`.

| declaration | file:line | hypotheses at the pin | README's description |
|---|---|---|---|
| `Smooth.geometricallyIntegral` (instance, low priority) | `Morphisms/Smooth/GeometricallyIntegral.lean:37` | `[Smooth f] [GeometricallyConnected f]` | matches |
| `Scheme.baseRingToGlobalSections_bijective_of_geometricallyIntegral` | `Geometrically/GlobalSections.lean:99` | `[UniversallyClosed]` (line 59), `[GeometricallyIntegral]`; `IsIntegral` omitted | "universally closed, geometrically integral": matches |
| `isIntegrallyClosedIn_functionField_of_geometricallyIntegral` | `Geometrically/FunctionField.lean:102` | `[IsIntegral X]` (line 77), `[GeometricallyIntegral]` | matches; integrality comes from the Mathlib lemma below |
| `isDiscreteValuationRing_stalk_of_smooth` | `Morphisms/Smooth/Regular.lean:59` | `[IsIntegral X] [Smooth]`, `y : CodimensionOnePoint X` | matches |
| `Scheme.IsCurveOver.of_smooth` | `Curves/Smooth.lean:39` | `[IsIntegral X] [IsProper] [SmoothOfRelativeDimension 1]` | matches |
| `IsCurveOver.isFunctionField`, `.coheight_le_one`, `.isNoetherian`, `.valuativeCriterion_existence` | `Curves/Basic.lean:53, 59, 65, 72` | `[X.IsCurveOver k]` (the class at line 36 extends `IsIntegral`, `IsProper`, with `topologicalKrullDim X = 1`) | matches |
| `isInvertible_relativeDifferentials` | `Modules/Differentials/Rank.lean:101` | any `CommRing R`, `[SmoothOfRelativeDimension 1]` | matches |
| `eulerDegree_relativeDifferentials` | `Modules/Differentials/Canonical.lean:305` | `IsIntegral`, `IsNoetherian`, `X.IsSeparated`, DVR stalks, `Ω` invertible, `hF`, `hk`, `hdim`, `hex`, `IsProper` | `X.IsSeparated` unlisted (R01) |
| Mathlib `GeometricallyIntegral.isIntegral_of_subsingleton` | `Geometrically/Integral.lean:99` | `[GeometricallyIntegral f] [Subsingleton S] [IsIntegral S]` | "over a field": matches |
| Mathlib `SmoothOfRelativeDimension.smooth` | `Morphisms/Smooth.lean:133` | a `lemma`, not an instance | "a lemma rather than an instance": matches |

**Lean probe.** The probe sets up the standing curve: `[SmoothOfRelativeDimension 1]`, `[IsProper]` and `[GeometricallyConnected]` over `Spec k`.
- `IsIntegral X ∧ X.IsCurveOver k` closes from `SmoothOfRelativeDimension.smooth`, `isIntegral_of_subsingleton` and `IsCurveOver.of_smooth`.
- Every hypothesis of `eulerDegree_relativeDifferentials` closes from the names B.3 cites, except `X.IsSeparated` (R01).
- Without `SmoothOfRelativeDimension.smooth` in context, `GeometricallyIntegral` is not found by `inferInstance`. This confirms the README's "applied through".

**Gate, build, dependency check.**
- My gate run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also reports `build=0`.
- `lake env lean TauCetiRoadmap/JacobianChallenge/Suggested.lean` exits 0 in 10.6 s with 14 warnings, all "declaration uses `sorry`". They are at lines 70, 83, 99, 130, 147, 185, 198, 224, 234, 242, 265, 273, 283 and 309.
- Dependency check with `--movable`: `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. JacobianChallenge is line 1 of the merge order.
- Nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty). The pins are Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b.

**Signatures and padding.**
- `Suggested.lean` is byte-identical to 9642df6: `git diff` shows only the README.
- A scratch copy with `#check @` for all 27 declarations elaborates in one run. All 27 elaborated types match `signatures.md` exactly; nothing changed.
- The earlier one-tactic padding probe and headline list still apply. Every headline is stated, or named in the module docstring as not statable.

**Cross-roadmap citations** (main 1bea835). D.4 and D.8 cite SchemeAndStackFoundations; every cited section is on main:

| Section | README line |
|---|---|
| §0.9 | 848 |
| §0.11 | 938 |
| §1.1 | 2071 |
| §3.6 | 4905 |
| §3.7 | 4937 |
| §4.9 (`formalFunctionsIso` at 5457) | 5448 |
| §4.14 | 5706 |

The resolver's one lead, `formalFunctionsIso`, is planned in §4.9.

**Overlaps.** `overlaps.md` reports no dropped id and no id that only an open revision defines. The open pull request #1187 conflicts in `Suggested.lean`, but it bumps Tau Ceti to ab00ba392, which is an ancestor of the pin 2fd255d (`git merge-base --is-ancestor`). That bump is therefore superseded. The changed passages add no object; they only cite pinned results.

**Seeded sample.**
- "Properness and geometric integrality" (D.8, line 1034) is the only sampled target the diff touches. Its new sentence uses `Smooth.geometricallyIntegral`, whose hypotheses are smoothness and geometric connectedness of `jacobianScheme X`; the paragraph supplies both.
- "Jacobian" (D.8):
  - Kleiman Theorem 5.11 (`kleiman2005` line 2002, page 42): if `Pic_{X/k}` exists and represents the étale Picard functor, its tangent space at 0 is `H¹(𝒪_X)`.
  - Milne III Proposition 2.1 (`milne-av` line 3702): the tangent space to `J` at 0 is `H¹(C, 𝒪_C)`, so `dim J = g`. The printed page is 91 (line 3686; PDF page 97). The README's "p. 91" is correct.
- "Cohomology and base change" (C.2, line 677) and "Field base change" (D.8, line 1017) are unchanged. The previous reports' checks of Stacks 02KH, 0B91, 0BDN, 0B9T and 056U stand.

**Remarks on untouched text** (no change requested):
- A.3, lines 392–397, plans "Prove that the degree is invariant under extension of the base field". Tau Ceti pins this as `InvertibleSheaf.eulerDegree_pullback` and `LineBundleClass.eulerDegree_pullback` (`LineBundle/BaseChange.lean` 54, 73). Their hypotheses are a quasi-compact scheme with affine diagonal, which covers every separated proper `k`-scheme, with no smoothness.
- A.3, line 382, says the remaining targets carry "no hypothesis beyond the standing curve". Additivity in that form is already pinned: `LineBundleClass.eulerDegree_mul_of_smooth` (`Curves/Degree.lean` 55), which needs only `IsProper`, `SmoothOfRelativeDimension 1` and `ConnectedSpace`.

**Adversarial table.** Rows marked (r5) are carried from `PRREVIEW-JacobianChallenge_r5`, and rows marked (r4) were carried there from r4; the diff leaves their statements untouched. The other rows are computed this round and replace r5's rows for the Conventions, B.3 and D.4.

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| Conventions / A.3: geometric integrality by `Smooth.geometricallyIntegral` | Lean probe; `ℙ¹_ℂ/ℝ`; `ℙ¹_{k'}/k`, `k = 𝔽_p(t)`, `k' = k(t^{1/p})`; real conic | probe closes `IsIntegral X ∧ IsCurveOver`; `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`, 2 components, `GeometricallyConnected` fails; `Ω_{X/k}` has rank `1 + 1 = 2 ≠ 1`, `Smooth` fails; conic `≅ ℙ¹_ℂ` after base change, integral | holds | none |
| Mathlib `isIntegral_of_subsingleton` | `𝟙 : Spec(k × k) → Spec(k × k)` | every field-valued fibre is `Spec K`, integral; `X` has 2 points, not integral; `Subsingleton S` fails | hypothesis needed and present | none |
| `baseRingToGlobalSections_bijective_…` | `𝔸¹_k`; `ℙ¹_ℂ/ℝ`; real conic | `Γ = k[t] ⊋ k`, excluded by `UniversallyClosed`; `Γ = ℂ`, `dim_ℝ = 2`, not geometrically integral; `Γ = ℝ`, dimension 1 | holds | none |
| `isIntegrallyClosedIn_functionField_…` | real conic; `ℙ¹_ℂ/ℝ` | `i ∈ ℝ(X)` would make `ℝ(X) ⊗_ℝ ℂ ⊇ ℂ × ℂ`, not a domain, so `ℝ` is closed in `ℝ(X)`; `i ∈ ℂ(t)` integral over `ℝ`, excluded | holds | none |
| `isDiscreteValuationRing_stalk_of_smooth` | `ℙ¹_k` at `t = 0`; node `y² = x²(x + 1)`; generic point | `k[t]_(t)`, DVR; `𝔪 = (x, y)` needs 2 generators, excluded by `Smooth`; stalk `k(t)` is a field, excluded by `CodimensionOnePoint` | holds | none |
| A.3: codimension-one points are the closed points | `ℙ¹_k` | closed point coheight 1; generic point coheight 0 (`IsCurveOver.coheight_le_one`) | holds | none |
| `Scheme.IsCurveOver.of_smooth` | `ℙ¹_k`; `ℙ²_k`; `∅` | `topologicalKrullDim = 1`; relative dimension 2 ≠ 1; `IsIntegral ∅` fails | holds | none |
| `isInvertible_relativeDifferentials` | `ℙ¹_k`; `ℙ²_k`; cusp `y² = x³` | `Ω = 𝒪(−2)`, rank 1; rank 2; `Ω ⊗ κ(0) = ⟨dx, dy⟩`, dimension 2, excluded by smoothness | holds | none |
| B.3: hypotheses of `eulerDegree_relativeDifferentials` | Lean probe; `ℙ¹_k`; elliptic `E`; `ℙ¹_L/k` | all close except `X.IsSeparated`; `−2 = 2·0 − 2`; `0 = 2·1 − 2`; `−4 ≠ −2`, excluded by `GeometricallyConnected` | holds; list incomplete | R01 |
| D.4: standing curve via the instance | real conic; `ℙ¹_k` | geometrically integral, projective (0A26), `∐_ℤ Spec ℝ`; `∐_ℤ Spec k` | holds | none |
| D.8: `jacobianScheme` geometrically integral via the instance | `ℙ¹`; `E`; constant `ℤ/2` over `k` | `Spec k`, integral; `E`, integral; `ℤ/2` is smooth with 2 points, not geometrically connected: the instance does not apply, and it is not integral | holds | none |
| A.3 Checks 1–3 (r5) | `ℙ¹_ℂ/ℝ`; `ℙ¹_{k'}/𝔽₂(t)`; real conic | `dim_ℝ H⁰ = 2`; `ε² = 0`, `ε ≠ 0`; `H⁰ = ℝ` | holds | none |
| Mathlib contract: 0BFD (r5) | Stacks 03RO; constant `S₃` | same hypotheses; `S₃` not geometrically connected | holds | none |
| Picard law commutative, D.2 (r5) | `Pic(X_T)/Pic(T)` | `L ⊗ M ≅ M ⊗ L` | holds | none |
| `finiteDimensional_cohomology` (r4) | `∅`; `ℙ¹`, `𝒪(−2)`; `ℙ²`, `𝒪(−3)`; `𝔸¹` | `0`; `h¹ = 1`; `h² = 1`; excluded | holds | none |
| `serreDuality_exists_trace` (r4) | `ℙ¹`, `𝒪(n)`; `∅`; `ℙ¹ ⊔ E` | `max(−1−n, 0)`; `0`; `1 + 1` | holds | none |
| B.2 negative control (r4) | `𝔽_p(t)`, `x^p = t` | `res_∞ = −1`, `res_P = 1`, `Tr = 0` | holds | none |
| B.4 Riemann–Roch (r4) | conic, `deg P = 2` | `χ = 3 = 2 + 1 − 0` | holds | none |
| A.3 base-field Check (r4) | conic to `ℂ` | `2`; `2`; `6 − 2 = 4 = 2·2` | holds | none |
| `isRepresentable_relativeEffectiveCartierDegreeSubfunctor` (r4) | `d = 0, 1`; `ℙ¹`, `d = 2`; `ℙ¹ ⊔ ℙ¹` | `Spec k`, `X`; `ℙ²`; 3 components | holds | none |
| D.2 Checks (r4) | `𝟙 S`; fold on `ℙ¹_k` | `S`; `ℤ`, sheafified `0` | holds | none |
| `hasPicardScheme_of_curve` (r4) | `ℙ¹_k`; `C/ℝ` | `∐_ℤ Spec k`; `2ℤ ⊊ ℤ` | holds | none |
| D.1 sequence (r4) | `C/ℝ`; pointed `ℙ¹` | `ℤ → ℤ/2 → Br`; split | holds | none |
| `isRepresentable_picZeroSets` (r4) | `C/ℝ`; Selmer cubic; `ℙ¹` | `Spec ℝ`; elliptic curve; `Spec k` | holds | none |
| D.8 field base change (r4) | `K = k`; `C → ℂ`; `E → ℂ` | `𝟙`; `Spec ℂ`; `E_ℂ` | holds | none |
| `isProper_`/`geometricallyIntegral_jacobianScheme` (r4) | `ℙ¹`; `E`; genus 2; `C/ℝ` | `Spec k`; `E`; a surface; `Spec ℝ` | holds | none |
| `dim_jacobianVariety` (r4) | `ℙ¹`; `E`; Selmer; `y² = x⁵ + 1` | `0`; `1`; `1`; `2` | holds | none |
| `multiplication_isogeny` (r4) | dim 0; `n = −2`; `n = p`; `n = 0` | `id`; 4; `p²`; fails | `n ≠ 0` needed | none |
| `multiplication_etale_iff` (r4) | `E/𝔽₃`, `n = 2, 3, 6, 0`; dim 0 | iff holds; `[3] = id` with `3 = 0` | `0 < dim` needed | none |
| E.1 cube Checks, square (r4) | `ℙ¹³`; `Spec k ⊔ Spec k`; `A × A × {0}` | as recorded | holds | none |
| `abelJacobi`, `isAlbanese_abelJacobi` (r4) | `E`, `O`, `P`; `g = 0, 1` | `a_P = t ∘ a_O`; `0`; `f ∘ a⁻¹` | holds | none |
| `isClosedImmersion_abelJacobi` (r4) | `g = 1, 2, 3` | `h⁰(Ω(−x)) = g − 1 < g` | holds | none |
| `isIso_abelJacobi_of_genus_eq_one` (r4) | `g = 1, 2` | `1 = 1`; `1 ≠ 2` | holds | none |
| `isAlbanese_baseChange_abelJacobi` (r4) | `K = k`; `E → ℂ`; `ℙ¹` | `ε` invertible; iso; constant | holds | none |
| E.5–E.7, C.2–C.4, D.4–D.5 Checks, F.2 (r4) | as recorded there | as recorded there | holds | none |

## Not verifiable

- The Stacks tags 056T, 033M, 0BUG, 0A26 and 056U are not in the sources cache. They were read on the Stacks project site in earlier rounds. This round's changed text cites 056T and 033M only for "the classical argument", and the 0BUG and 0A26 citations are unchanged.
- Hartshorne, Serre, Stichtenoth, Bosch–Lütkebohmert–Raynaud and Milne's *Jacobian Varieties* are settled as uncertified. No changed passage cites them.
- Ownership against open pull requests: the changed passages add no object. I checked them with `overlaps.md` and the resolver over the 456 open heads, not by re-reading every sibling checkout.

## Source issues

- none
