# Review of PotentialAutomorphyDworkMotivesPartII (pull request #2291 at b4c3b80)

**Verdict:** needs changes

## R01 (P3) — The supplier contracts omit the pinned declarations the new §9.14 headline is stated on

**Location:** `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md` line 80, “Hecke characters (TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean, InfinityType.lean, Algebraic.lean and Purity.lean)”, against line 1684, “`χ.infinityType = TauCeti.GlobalNumberFields.AlgebraicInfinityType.toContinuous (-a)`”.
**Claim:** The changed §9.14 states its headline on `AlgebraicInfinityType`, `AlgebraicInfinityType.toContinuous` and Mathlib's `NumberField.ComplexEmbedding.conjugate`; §9.13's on Mathlib's `WeierstrassCurve.IsElliptic`. `## Exact supplier contracts` lists none of the four, nor the convention of `toContinuous` that fixes the sign `-a`.
**Witness:** Pinned Tau Ceti `TauCeti/NumberTheory/NumberField/Global/InfinityType/Basic.lean:273` (`AlgebraicInfinityType`) and `:325` (`toContinuous`: complex exponent `a + b`, angular frequency `a − b`); that file is not among those line 80 names. `AlgebraicInfinityType` occurs in the README at line 1684 only.
**Repair:** Append to the Hecke bullet of `### From Tau Ceti`: “The integer exponents are `TauCeti.GlobalNumberFields.AlgebraicInfinityType K`, the functions `(K →+* ℂ) → ℤ`, and `TauCeti.GlobalNumberFields.AlgebraicInfinityType.toContinuous` (TauCeti/NumberTheory/NumberField/Global/InfinityType/Basic.lean) sends exponents `a`, `b` at the chosen embedding of a complex place and at its conjugate to the modulus exponent `a + b` and the angular frequency `a − b`, so that `toContinuous (-a)` is the infinity type of `z ↦ z^{−a} z̄^{−b}`.” Add to `### From Mathlib`: “`WeierstrassCurve.IsElliptic` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean), the unit-discriminant condition of §9.13; `NumberField.IsCMField` (Mathlib/NumberTheory/NumberField/CMField.lean) and `NumberField.ComplexEmbedding.conjugate` (Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean), the CM hypothesis and the conjugate embedding of §9.14.”

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: `Suggested.lean` lines 208 and 218 state `exists_ellipticCurve_frobeniusTrace` and `exists_heckeCharacter_infinityType` with the requested hypotheses; module docstring and README §§9.13–9.14 name both. The repair leaves R01 above.
- R02 — not repaired: deferred (D01)

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §9.13 `exists_ellipticCurve_frobeniusTrace` | `p=2`, `b=±2`; `b=3`; singular `y²=x³` over `𝔽₂` | `y²+y=x³+x+1`: 0 affine solutions, count 1, trace 2. `y²+y=x³+x`: 4, count 5, trace −2. `b=3`: `9>8`, would need count 0 < 1. Cusp: count 3, trace 0, excluded by `IsElliptic`. | True as stated | none |
| §9.13 trace convention (contract line 79) | `frobeniusTrace_def` at the pin | `Nat.card F + 1 − pointCount`, `pointCount` = affine solutions + 1; on `IsElliptic` equals `Nat.card E.toAffine.Point`. README formula `p + 1 − #E(𝔽_p)` agrees. | Agrees | none |
| §9.14 `exists_heckeCharacter_infinityType` | `ℚ(i)`, `a=(1,0)`, `w=1`; `a=0`; unequal pair sums | `toContinuous(-a)`: exponent `−1−0=−1`, frequency `−1`, i.e. `z ↦ z⁻¹`, the README's `∏σ(x)^{−a_σ}`. `a=0`: `χ=1` (proved by `simp`). Unequal sums: contradicts pinned purity lemma, hypothesis needed. | True as stated | R01 (contract only) |
| §9.14 README against Lean generality | imaginary CM `L` against `[NumberField K] [IsCMField K]` | Mathlib `IsCMField`: totally complex, quadratic over the maximal real subfield; no real place, so `toContinuous` has no parity component to fix. | Same generality | none |
| Scope line 21, ownership of the prime-field case | `q = 2` | This roadmap: traces `−2..2`; AbelianVarietiesOverFiniteFields §4.6 at its open head has no citation of §9.13. | D01 stands | outside this folder |

The adversarial rows for untouched statements stand as in the previous review, of `d167976`.

- One-tactic probe on a scratch copy of both new theorems (`simp`, `rfl`, `infer_instance`, `aesop`, `exact?`): neither closes; no padding.
- Sources: 2 locators of the changed passages reread: WAT69 line 619 (Theorem 4.1; at `q = p` its cases give every integer with `β² ≤ 4p`); BLGGT14 line 4110 (Lemma A.2.4). No seeded target lies in a changed passage; §§9.7, 9.10, 9.11 cite §9.13 with its statement unchanged.
- Pins: 7 declarations opened: Tau Ceti `AlgebraicGeometry/EllipticCurve/PointCount.lean:73,101,115`, `NumberTheory/NumberField/Global/InfinityType/Basic.lean:273,325`, `HeckeCharacter/Purity.lean:98`; Mathlib `NumberTheory/NumberField/CMField.lean:70`, `AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366`.
- Gate: every check passes at `b4c3b80` (`build=0 OK`). Direct elaboration: seven `sorry` warnings, nothing else.
- Dependency check: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE line. No path changed outside the folder.
- Signatures: the elaborated types of both new theorems agree with README §§9.13–9.14; both take all binders explicitly, none lost. Both new imports exist at the pinned Tau Ceti.
- Pull request text: 12 declarations, 7 theorems, 5 definitions, as the description says; it names §§9.13–9.14, both new headlines and the ownership sentence; no sentence contradicted by this head.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, EllipticCurveModularityImaginaryQuadratic, PotentialModularityAndCompatibleSystems, HypergeometricMotives and AbelianVarietiesOverFiniteFields §4.6; the change shares only the prime-field trace classification, owned here by Scope line 21 (D01); no `Suggested.lean` name of another roadmap is reused.

Source independence: changed passages only; 6 passages (4 README, 2 docstrings) compared with 2 sources, none shared; largest share QIAN23, 54 of 183 locators; no layer added, removed or reordered, the previous comparison of contents stands: independent.

## Not verifiable

- KIS99, ZS76, ARTIN55, KATZ90, KM74 and LEWIS82: settled as uncertified; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- **Scope.** `packages/PotentialAutomorphyDworkMotivesPartII/design/plan.json` still lists `equivariant-toroidal-semistable-reduction`; the README instead consumes ModularityAndLanglandsExtensions §2.10.
- **Scope.** The plan's `curve-crystalline-companions` includes Kedlaya's full faithfulness; the README cites PadicDifferentialEquationsAndRigidCohomology §RD.5.8 for it separately and asks only for the companion.
- **Scope.** `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md:1` calls this Part II of PotentialAutomorphyInfrastructure; `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:17` also identifies itself as that parent's Part II.
- **Licence.** QIAN21 and ACAMPO24 are cited as arXiv preprints only (References of the README); they support §8.1's attribution and one Check.
- **Scope.** `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md:21` says AbelianVarietiesOverFiniteFields §4.6 consumes §9.13; that roadmap's open head does not cite it yet (D01).
