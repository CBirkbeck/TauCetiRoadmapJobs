# Review of DynamicalDegreesOfRationalMaps (pull request #2431 at 6de2f8c)

**Verdict:** needs changes

## R01 (P3) — Layer 4's dependency list omits the Tau Ceti input added to §4.3

**Location:** `TauCetiRoadmap/DynamicalDegreesOfRationalMaps/README.md:597`: "Layers 1–3; CyclotomicClassGroupsAndStickelberger §4.3; SchemeAndStackFoundations §§5.2–5.3; Mathlib `Scheme.PartialIso.symm`, `Scheme.RationalMap.comp_assoc`."

**Claim:** The repair added Tau Ceti's `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback` to the *Needs:* line of §4.3 but not to Layer 4's dependency list. Layers 1, 2, 3 and 6 each list the Tau Ceti inputs of their sections.

**Witness:** README.md:538 makes the theorem an input of §4.3. README.md:476 (Layer 3) lists `…IsEffectiveCartier` and `…intersectionNumber_eq_finrank_mul` from its *Needs:* lines. README.md:597 names no Tau Ceti declaration.

**Repair:** Replace line 597 with: "Layers 1–3; CyclotomicClassGroupsAndStickelberger §4.3; SchemeAndStackFoundations §§5.2–5.3; Mathlib `Scheme.PartialIso.symm`, `Scheme.RationalMap.comp_assoc`; Tau Ceti `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback` (§4.3)."

## R02 (P3) — The description credits all of §4.3's field-extension invariance to the Tau Ceti theorem

**Location:** Pull-request description: "Invariance of the degrees under extension of the field (README §4.3) is a README target, not a Lean headline: it follows term by term from Tau Ceti's `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback`, which the README cites."

**Claim:** README §4.3 (line 536) derives only the first equality term by term: the one with the intersection number on the base-changed graph `(Γ_f)_{K'}`. The equality with `deg_k(f_{K'}; L_{K'}, M_{K'})` also needs geometric integrality, and needs `Γ_{f_{K'}} = (Γ_f)_{K'}` from §1.4 (line 238).

**Witness:** Take `ℙ¹_ℂ` over `ℝ` with `f = id` (README.md:249, 542). Term by term, the count is `2 = 1 + 1` on two diagonals over `ℂ`. That union is the graph of no `f_ℂ`, because `X_ℂ` is not integral.

**Repair:** Replace the sentence with: "Invariance of the degrees under extension of the field (README §4.3) is a README target, not a Lean headline. Its first equality, with the intersection number on the base-changed graph `(Γ_f)_{K'}`, follows term by term from Tau Ceti's `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback`, which the README cites. For geometrically integral `X` and `Y`, README §1.4 identifies that graph with the graph of `f_{K'}`."

## Previous findings

- R01 — repaired: `mixedDegree_baseChange` is deleted from `Suggested.lean`, and README.md:536 now reads "The first equality holds term by term: … `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback`, applied to the quasi-compact separated `Γ_f`…". The theorem is added at :78 and :538, and :71 and :152 are trimmed. This round's R01 is a gap the repair left.
- R02 — repaired: the description now has "On main: CyclotomicClassGroupsAndStickelberger §4.3; AlgebraicModuliForArithmeticGeometry §§1.4, 5.4; … Open, earlier in the merge order: ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3; LefschetzPencilsAndVanishingCycles §5.1; ArithmeticDynamics §§0.18, 0.26 (Checks only)". This matches README.md:92–142.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| §4.3 first equality, term-by-term route (changed) | `ℙ¹_ℂ` over `ℝ`, `f = id`, `O(1)` and `O(−2)` | `h⁰_ℝ(O(1)) = 4 = 2 + 2` over `ℂ`; `(O(1)) = 4 − 2 = 2` on both sides; `(O(−2)) = (0−2) − (2−0) = −4` on both sides (`h¹ = 2 = 1+1`) | holds |
| §4.3 first equality, inseparable `K'/K` | `Spec 𝔽₂(t)(√t)` over `𝔽₂(t)`, `d = 0`, `K' = 𝔽₂(√t)` | `dim_K H⁰ = 2`; base change `Spec K'[ε]/ε²`, `dim_{K'} H⁰ = 2`; fundamental cycle `2·[pt]` gives `2·1 = 2` | holds |
| Tau Ceti theorem as README.md:78 states it, applied to `Γ_f` | elaborated `#check @`; `Γ_f` closed in `X × Y` with `X`, `Y` projective | fields `k → K`, `CompactSpace`, affine absolute diagonal, quasi-coherent `M`, every `n`: as stated. `Γ_f` is quasi-compact and separated, so its diagonal is a closed immersion, hence affine | holds |
| §4.3 multilinear step (§2.3) under `Finsupp.mapDomain` | `ω = a + b` with `a ≠ b`, `g^*a = g^*b`, `r = 1` | merged coefficient gives `2·(g^*a)`; `(a) + (b) = 2·(g^*a)`, since each equals `(g^*a)` term by term | holds |
| §4.3 second equality (R02) | `ℙ¹_ℂ` over `ℝ`, `f = id` | the base-changed graph is two diagonals, `2 = 1 + 1`; not `Γ_{f_ℂ}` for any `f_ℂ`, since `X_ℂ` is not integral | needs §1.4 and geometric integrality; R02 |
| `dynamicalDegree_baseChange` (cites §4.3) | Frobenius of `ℙ¹` over `𝔽_p`, `K' = 𝔽_p(t)`; `ℙ¹_ℂ/ℝ` | `λ₁ = p` on both sides; `ℙ¹_ℂ/ℝ` excluded by `GeometricallyIntegral`; hypothesis `f'.compHom π = π.toRationalMap.comp f` is `π∘f' = f∘π` | holds |

The rows for the other statements, which this change does not touch, stand as in the previous review, of `14cf9af`.

- Source locators checked against the text: 2 in the changed §4.3 (dang2020 lines 18–20; truong2020 §6.3, lines 1529–1533, p. 36), both as cited. The README flags no locator as unverified. The other sampled targets lie in text unchanged since `14cf9af`.
- Library declarations opened at the pins: `TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.lean:277`, whose statement and hypotheses agree with README.md:78. `CategoryTheory.IsPullback` (README.md:71) is still used at `Suggested.lean:401`. No use of `pullback (…)` or `canonicallyOverPullback` remains in the folder.
- Cross-roadmap citations resolved:
  - CyclotomicClassGroupsAndStickelberger §4.3 on main lists field-extension compatibility.
  - On main, JacobianChallenge README:285, 428 and SchemeAndStackFoundations README:5759 cite the same Tau Ceti theorem.
  - The description's dependency list matches the README's eight supplier sections.
- Gate: rerun at `6de2f8c`, all checks pass (the worker's gate passes the build). Dependency check: `depcheck: 249 roadmaps, 2363 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 18 `sorry` warnings and nothing else. `#check @` on all 31 declarations in one scratch copy shows no binder lost. The one-tactic probe stands as at `14cf9af` (0 of 19 closed; the 19th, `mixedDegree_baseChange`, is deleted).
- Overlap check: the three closest-roadmap lists are unchanged since `14cf9af` (NashBlowups, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, SchemeAndStackFoundations, K3SurfacesAndSymplecticBoundedness; on main AlgebraicModuliForArithmeticGeometryPartII, JacobianChallenge, SchemeAndStackFoundations; none by results). The change adds one object, field-extension invariance of `dim Hⁿ`, which pinned Tau Ceti owns; JacobianChallenge and SchemeAndStackFoundations cite it there too. No other roadmap mentions dynamical degrees, mixed degrees or algebraic entropy.
- Source independence: changed passages only. 3 passages compared (README.md:536 against dang2020 lines 18–20 and truong2020 lines 1529–1533; README.md:78 against the docstring at FlatBaseChange.lean:273), none shared beyond the forced hypothesis list. No layer is added, removed or reordered. Largest share: dangfavre2021, 16 of 101 locators, unchanged. Contents: independent, as at `14cf9af`.
- Remark, untouched text: Layer 4's dependency list (README.md:597) also omits Mathlib `AlgebraicGeometry.GeometricallyIntegral` from §4.3's *Needs:*, as at `14cf9af`.

## Not verifiable

- `lazarsfeld2004` and `fulton1998`: recorded as uncertified (paywalled) and cited by locator. Neither is cited in the changed passages, and neither was read.

## Source issues

- none

## For the human reviewers

- none
