# Review of EtaleDualityAndPerverseSheaves (pull request #3027 at 3bddf73)

**Verdict:** accepted

**Summary.** An incremental re-review of the 4 lines changed since `a4d9b5d`: two `*Needs:*` lines, in §0.3 (the curve duality statement) and §5.8 (the universal hyperplane lemma), now name the exact supplier section instead of a whole layer. Accepted: both new citations resolve to sections that state what the proof routes use, no statement changed, and there is no finding and no small correction; one format note carried from the previous review does not block. The earlier deferred point (the stabilizer lemma stated twice) is settled at this head, and one point is left for the human reviewers: the Deligne–Lusztig paper has no legal open copy.

## N01 — The Check of the quotient formula has every term equal to zero, so it does not see the factor `|Π|⁻¹`

In the second Check of lefschetzDevissage in §7.6 (line 7492), `Lef(1, X/Π) = ½(Lef(1, X) + Lef(−1, X))` reads `0 = ½(0 + 0)`, which also holds without the `½`. A Check that would fail for the unnormalised sum: `Π = ℤ/2` exchanging the two points of `X`, where `X/Π` is a point and `1 = ½(2 + 0)`.

## Deferred findings

- D02 — resolved: FiniteReductiveGroups 3.4 at this head states (a)–(d) as EtaleDualityAndPerverseSheaves §7.6 (lefschetzGroupActions, finitelyManyStabilizers) and gives no route of its own.

## Previous findings

- R01 — repaired: FiniteReductiveGroups 3.4 (lines 1238–1242) now reads "This is EtaleDualityAndPerverseSheaves §7.6: (a)–(c) are *lefschetzGroupActions* … (d) is the case `F = k̄`, `W = X` of *finitelyManyStabilizers*"; §7.6 is the single owner (D02).
- N01 of the previous report (not a finding) is unchanged at this head and is written again above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| curveH1Duality (§0.3), degree-1 step, against AbelianSchemesAndArithmeticModuli §A3.7 | principal `λ` on `J`, `n` invertible; elliptic curve, `n = 2`; negative control type `(1, 2)`, `n = 2` | A3.7: perfect iff `ker λ` has no `n`-primary part; `deg λ = 1` gives `gcd(n, 1) = 1`, perfect; `H¹(X, μ₂) = J[2]`, `Hom(J[2], ℤ/2)`, both rank 2; type `(1, 2)` on `A[2]` not perfect | A3.7 supplies exactly the perfect alternating pairing used | none |
| universalHyperplaneLemma (§5.8), (i)–(iii), against §2.10 | `Y` a point, `X = ℙ¹`, `d = 1`, `K = ℚ̄_ℓ[1]`; `H` the diagonal, `h` an isomorphism | (i) `u^*pH^{−1}Rf_*K[1] = ℚ̄_ℓ[1] = pH⁰(Rf′_*u^*K)`; (iii) `pH⁰`: `ℚ̄_ℓ[1] → ℚ̄_ℓ[1]` injective, image constant, so all of it comes from `Y` | holds | none |
| same, the input "largest perverse subsheaf coming from `Y`" | where the README states it | §2.10 (lines 2529–2531): for `f` smooth surjective with geometrically connected fibres and field coefficients, largest subobject `f^*[d] pH^{−d}Rf_*`; §2.7 (line 2096) defers these assertions to §2.10; `u : ℙ^{d∨} × X → X` and `ℚ̄_ℓ` meet the hypotheses | §2.10 is the owner; the former "Layer 2" covered it only implicitly | none |

The rows for the untouched statements stand as in the previous review, of `a4d9b5d`.

- Source locators checked against the text: 0 new. The diff changes no locator, and none of the 15 seeded targets (§§0.1, 0.2, 0.6, 2.4, 2.5, 2.11, 3.4, 3.5, 3.6, 4.1, 4.2, 4.7, 5.9, 6.5, 7.6) lies in a changed passage; §7.6 was checked in the previous review and its text is unchanged. The README flags no locator as unverified.
- Library declarations opened at the pins: 0 new; the diff names none and `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved: 2. AbelianSchemesAndArithmeticModuli §A3.7 (*Polarized Weil pairings*), heading at line 1189 on main and at this head (the pull request does not change that roadmap), title as cited; FiniteReductiveGroups 3.4 at this head for D02. Internal: §2.10 (line 2433).
- Record: no heading, layer or Lean declaration added, removed or renamed since `a4d9b5d`; 9 layers as at the merge base.
- Dependency check: `depcheck: 130 roadmaps, 1463 edges, 0 problem(s)`; no UPWARD or CYCLE line. AbelianSchemesAndArithmeticModuli is on main and earlier in the merge order; the change adds or drops no supplier roadmap.
- Automatic checks: all passed in the worker's run. Elaboration of `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/Suggested.lean` with `lake env lean`: 7 `sorry` warnings, no error. Every file the pull request changes lies under `TauCetiRoadmap/`, in a folder it owns.
- Description: read against this head. It names §7.6 as the addition to this roadmap and DeligneLusztigTheory as its consumer; the two `*Needs:*` refinements change nothing it describes.
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations, DeligneWeightsAndPurity, SheafTheoreticSmithTheory, GlobalShtukasAndFunctionFieldLanglands, SheafConvolutionOnAbelianVarieties; nothing shared by the changed passages. The polarized Weil pairing is owned by AbelianSchemesAndArithmeticModuli §A3.7 and cited here; the stabilizer lemma and Lefschetz numbers are owned by §7.6, which FiniteReductiveGroups 3.4 now cites.

Source independence: changed passages only. The 2 changed lines are dependency lists (section numbers and one section title of another roadmap) with no prose to compare with a source; 0 passages compared; no layer was added, removed or reordered, so the contents were not compared.

Research link: §7.6 is the Lefschetz-number calculus of Deligne–Lusztig 1976 §3 (as in Serre 1977 and Dudas–Michel 2015 §13) on which Deligne–Lusztig induction rests; the roadmap's headlines (decomposition theorem; Fujiwara–Varshavsky trace formula, Varshavsky 2023, Hansen–Kaletha–Weinstein 2022) serve geometric Satake and local Langlands. Rests on the README and the three sources read.

## Not verifiable

- Deligne-Lusztig-1976, Proposition 3.3, Theorem 3.2 with the first step of its proof, and Proposition 6.4: the paper has no legal open copy (JSTOR only). The locators were checked in the previous review through the attributions in Serre-1977 and Illusie-Zheng-2013; the text is unchanged.

## Source issues

- none

## For the human reviewers

- Deligne-Lusztig-1976 (Ann. of Math. 103) has no legal open copy; its four locators in §7.6 of `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` (lines 7431, 7481, 7510, 7606) were checked only through Serre-1977 and Illusie-Zheng-2013.
