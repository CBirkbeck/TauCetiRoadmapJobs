# Review of DynamicalDegreesOfRationalMaps (pull request #2431 at 2635b0c)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README.md:597 now reads "Layers 1–3; CyclotomicClassGroupsAndStickelberger §4.3; SchemeAndStackFoundations §§5.2–5.3; Mathlib `AlgebraicGeometry.GeometricallyIntegral` (§4.3), `Scheme.PartialIso.symm`, `Scheme.RationalMap.comp_assoc`; Tau Ceti `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback` (§4.3)." The repair also carries over the previous round's `GeometricallyIntegral` remark.
- R02 — repaired: the description now reads "Its first equality, with the intersection number on the base-changed graph `(Γ_f)_{K'}`, follows term by term from … Its second equality … holds for geometrically integral `X` and `Y`, where README §1.4 identifies that base-changed graph with the graph of `f_{K'}`."

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| Layer 4 Dependencies (README.md:597) against the *Needs:* lines of §§4.1–4.5 (R01) | lines 498, 522, 538, 564, 582 | 4 of 4 library names, 2 of 2 roadmap sections listed; both `(§4.3)` tags match line 538 | complete |
| Layer 5 Dependencies (README.md:693) against §§5.1–5.4 | lines 609, 634, 654, 677 | 5 of 7 names verbatim; `Submultiplicative.lim`, `.tendsto_lim` under "its lemmas"; `(§5.1)`, `(§§5.3–5.4)` match 609, 654, 677 | complete |
| Layer 6 Dependencies (README.md:786) against §§6.1–6.4 | lines 710, 735, 750, 770 | 22 names: 14 verbatim, 3 without the `AlgebraicGeometry.` prefix, `IsFinite`/`IsAffineHom` inside the `iff` lemma, 3 under `MvPolynomial`; `(§6.1)`, `(§6.2)` match | complete |
| §5.1 `dynamicalDegree` (`Filter.limUnder`), `z ↦ z²` on `ℙ¹`, `d = k = 1`, `ω = O(1)` | `C_1(ω) = 1`, `v_n = 2^n` | `v_n^{1/n} = 2` for all `n ≥ 1`; `limUnder` value `2`; `⨅ n : ℕ+` value `2` | holds |
| §5.1 Fekete route (`Submultiplicative`), Cremona `σ` of `ℙ²`, `k = 1`, `ω = H` | `C_1 = 2/1 = 2` | `v_n = 4` (odd), `2` (even), `v_0 = 2 ≥ 1`; `v_2 = 2 ≤ v_1² = 16`; limit `1`, infimum `1`, not attained | holds |
| §5.1 Lean junk at `n = 0` (Suggested.lean:295) | `(1 / 0 : ℝ)` | `= 0`, so the term is `deg^0 = 1`; `atTop` ignores it; Mathlib's exponent `(n : ℝ)⁻¹ = 1/n` | harmless |
| §4.3 with `GeometricallyIntegral` (Layer 4 tag) | `ℙ¹_ℂ` over `ℝ`, `id`, `O(1)`; `ℙ²_ℚ`, `[x²:y²:z²]`, `K' = ℚ(√2)` | `2 = 1 + 1` on two diagonals, second equality excluded; `(1, 2, 4)` and `e = 4` on both sides | holds |
| §§5.3–5.4 with `GeometricallyIntegral` (Layer 5 tag) | Frobenius of `ℙ¹_{𝔽_p}`, `K' = 𝔽_p(t)` | `λ_1 = p` on both sides (relative Frobenius over `K'`); `h_alg = log max(1, p) = log p` on both | holds |
| §6.2 route with Tau Ceti `IsEffectiveCartier` (locally `span {a}`, `a` regular) | Cremona on `Γ_σ = Bl_3 ℙ²`; `z ↦ z²`; zero ideal | `E = ΣE_i`: `(A·E) = 0`, `(B·E) = 3`, so `deg_1 = 2`, `deg_2 = 1 ≤ 4`; `z²`: `span {1}`, empty; `span {0}` not regular | holds |
| Description's §4.3 sentence (R02) | README §1.4 (line 238), §4.3 (line 536) | §1.4 proves `Γ_{f_{K'}} = (Γ_f)_{K'}` for geometrically integral `X`, `Y`; real classes by §2.3 multilinearity, as stated | agrees |

The rows for the statements this change does not touch stand as in the previous review, of `6de2f8c`.

- Library declarations opened at the pins (18). Mathlib:
  - `Geometrically/Integral.lean:40`
  - `Topology/Defs/Filter.lean:270`
  - `Analysis/Subadditive.lean:35, 44, 89`
  - `Birational/Composition.lean:155, 182`
  - `Birational/Dominant.lean:74`
  - `Birational/RationalMap.lean:440, 562`
  - `Birational/Birational.lean:88`

  Tau Ceti:
  - `Cohomology/FlatBaseChange.lean:277`
  - `EffectiveCartierDivisor/Basic.lean:78`
  - `TwistingSheaf/Basic.lean:254`, `LocalTriviality.lean:212`, `TensorProduct.lean:257`
  - `ProjectiveSpectrum/GlobalCoordinates.lean:138`
  - `Birational/RationalMap.lean:93`

  Every name the three changed lines cite exists there.
- Source locators: the changed lines carry none, and no seeded target falls in them. 3 were spot-checked in sections they tag, and each supports its claim:
  - dangfavre2021 lines 461–463, p. 13;
  - dinhsibony2005 Corollaire 7, lines 256–259, p. 7;
  - russakovskiishiffman1997 Lemma 4.4, lines 516–541, p. 13.
- Cross-roadmap citations: the change adds and drops none. The description's supplier list still matches the README. `overlaps.md` reports no dropped id and no other open pull request changing this roadmap.
- Gate: rerun at `2635b0c`, all text checks pass; the worker's gate passes the build. Dependency check: `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 18 `sorry` warnings and nothing else. `Suggested.lean` is unchanged since `6de2f8c`. `signatures.md` shows no lost binder, and the one-tactic probe stands at 0 of 18 closed.
- Overlap check: the three closest lists are unchanged since `6de2f8c`:
  - open: NashBlowups, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, SchemeAndStackFoundations, K3SurfacesAndSymplecticBoundedness;
  - on main: AlgebraicModuliForArithmeticGeometryPartII, JacobianChallenge, SchemeAndStackFoundations;
  - by results: none.

  The change adds no object. A search of the open heads and main for "dynamical degree", "algebraic entropy" and "mixed degree" finds only intersection-number uses, in ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructions (and its Part II), TropicalAndBerkovichArithmetic and ArithmeticKTheoryPartII. Nothing is shared.
- Source independence: changed passages only. 3 passages compared (README.md:597, 693, 786) with 0 sources: they hold declaration names and section numbers and no source wording. Nothing is shared. No layer is added, removed or reordered. Largest share: dangfavre2021, 16 of 101 locators, unchanged. Contents: independent, as at `14cf9af`.

## Not verifiable

- `lazarsfeld2004` and `fulton1998`: recorded as uncertified (paywalled) and cited by locator. Neither is cited in the changed passages, and neither was read.

## Source issues

- **Error** in dinhsibony2005 at Corollaire 7, proof, p. 7: the source says the limit of `δ_l(f^n)^{1/n}` is `inf_n δ_l(f^n)^{1/n}`. That is false for `f = (z², w)` on `ℙ¹×ℙ¹` with `∫ω² = 1`, where `δ_1(f) = 3/2 < 2 = λ_1`. It should be `inf_n (c_X δ_l(f^n))^{1/n}`; affects the proof.

## For the human reviewers

- none
