# FIX-PKG-RealSurfacePeriodIndex~11: repair report

One review: `REV-PKG-RealSurfacePeriodIndex~10`, four findings (one P2, three P3). I checked each one against B19, BEC05, the pinned Mathlib and Tau Ceti, and the roadmap's own statements. All four are correct and all four are applied. F04 is applied in a slightly corrected form: the Azumaya algebra is said to be pulled back from X, which is what step 3 needs. Only `packages/RealSurfacePeriodIndex/README.md` changed; `Suggested.lean`, `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged. I read the review's `## For the human reviewers` section and changed nothing because of it.

## F01 (P2) — applied

Verified: the §6.3 sentence is B19 lines 1123–1124 with two words changed, and the §9.12 sentence follows B19 lines 1811–1813 clause by clause.

Old → new: §6.3 "If ι satisfies Assumption 6.1, so does every ι′ close enough …" → "Assumption 6.1 is an open condition on the map: an embedding satisfying it has a strong-topology neighbourhood of embeddings satisfying it". §9.12 "S(K) has four … components, distinguished by the signs …" → "S(K) is the disjoint union of four semialgebraic 2-spheres, one for each pair of signs …".

The longest token runs still shared with B19 (measured mechanically) are "Assumption 6.1 is" (4 tokens) and "components of S(K) and" (5 tokens). Pattern: an 8-gram sweep of the whole README against B19 found only stock openings ("Let S be a connected smooth projective surface over"), formula fragments and bibliography titles.

## F02 (P3) — applied

Verified at the pinned Tau Ceti:

- `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension` (FieldTheory/RealClosure/QuadraticExtension.lean:63) and `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin` (line 144);
- `TauCeti.puiseuxField` (RingTheory/LaurentSeries/Puiseux/Basic.lean:70, any field);
- `TauCeti.puiseuxField.instIsAlgClosed` (Puiseux/AlgClosure.lean:63, under `[IsAlgClosed K] [CharZero K]`);
- `LaurentSeries.ramifiedEmbedding` (RingTheory/LaurentSeries/Ramified.lean:418).

Old → new:

- Added two "From Tau Ceti" bullets, and Mathlib `Algebra.IsQuadraticExtension` (StrongRankCondition.lean:666) to the Mathlib contract.
- The scope lines and the RealAlgebraicGeometry/FormalLaurentPuiseux contract now name the Tau Ceti forms.
- Added these names to the *Needs:* lines of §§0.3, 0.8, 2.10 and 9.11 and to the Dependencies of Layers 0, 2 and 9.
- §9.11 now uses `TauCeti.puiseuxField`, with the `isRealClosed_of_isAlgClosed_adjoin` route as an alternative.

## F03 (P3) — applied

Verified. BEC05 line 66 (§2, p. 2) works in characteristic ≠ 2, and §0.14 applies to 𝔽₃, where u was undefined.

Old → new (§0.6): "char F = 0." → "char F ≠ 2 (a field of positive characteristic has no orderings, so for it the signature condition is empty)."; "characteristic 0," → "characteristic ≠ 2,". I also added a Check: u(𝔽₃) = 2, consistent with §0.14.

Pattern: §§0.4–0.5 assume characteristic 0 only where orderings exist, and every ordered field has characteristic 0. No other occurrence.

## F04 (P3) — applied

Verified. W has finite type over k, so its function field is finitely generated over k. When K ≠ k it cannot contain K ⊂ L, because an algebraically closed K ⊋ k is not finitely generated over k.

Old → new (§1.5 step 2): "W of degree d with function field L, and an Azumaya algebra on V of class α" → "W of degree d whose base change along Spec K → Spec A is an integral finite étale cover of V_K ⊂ X_K with function field L, and an Azumaya algebra on V, pulled back from one representing α on a dense open of X".

"Pulled back from X" replaces the review's "class is the pullback of α". It makes the fibre restriction in step 3 equal α without assuming V regular. The review's instance is added as a negative-control Check. There is no other spreading-out construction in the README.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §6.3 openness | Ξ = S², R(ℝ) = ∅, one circle; 𝒮 = ∅; torus with a null-homotopic circle | perturbed circle is still embedded (𝒮 compact, embeddings open), bounds two discs, class 0 = cl_R(R), so (i)–(iv) hold; C^∞(∅, Ξ) is one point; torus: ι fails (iii), so the statement is empty for it | holds |
| §9.12 real locus | chart w = 1; points at infinity; affine critical points | z² = g − t, g = (1 − u² − v²)u²v² ≤ 1/27 (attained at u² = v² = 1/3). {g ≥ t} is one disc per open quadrant, so 4 spheres. [1:0:0], [0:1:0] are A₅: z² + v′² + t w⁶. Conjugation reverses the exceptional chain, and the middle conic z² + v² + t = 0 has no real point. Critical points have g = 1/27 ≠ t or g = 0 ≠ t. H¹(S²) = 0 | holds |
| `isAlgClosed_of_isQuadraticExtension` as used in §§0.3, 0.8, 2.10, 9.11 | R = ℝ; real algebraic numbers; `TauCeti.puiseuxField` ℝ; ℚ (not real closed) | ℂ, ℚ̄, `TauCeti.puiseuxField` ℂ are algebraically closed; ℚ(i) is not, and `[IsRealClosed R]` excludes it | holds |
| `isRealClosed_of_isAlgClosed_adjoin` route in §9.11 | K = `TauCeti.puiseuxField` ℝ; R = ℂ; R = ℚ | in K, −1 has leading coefficient −1 < 0, so it is not a square; K(i) = `TauCeti.puiseuxField` ℂ (f = g + i·h at one level), which is algebraically closed, so K is real closed. ℂ: −1 is a square, hypothesis fails. ℚ: ℚ(i) is not algebraically closed | holds; agrees with the Checks: X³ − t has one root t^{1/3} in K and two in K(i) ∖ K |
| `TauCeti.puiseuxField.instIsAlgClosed` hypotheses | K = ℝ(i); K = 𝔽̄_p | char 0 and algebraically closed: applies. 𝔽̄_p: X^p − X − t⁻¹ has no Puiseux root, excluded by `[CharZero K]` | carried in §9.11 step 3 |
| §0.6 domain char ≠ 2 | 𝔽₃; 𝔽₉; ℝ; ℂ; ℝ(t); characteristic 2 | 𝔽₃: ⟨1, 1⟩ anisotropic (squares mod 3 are 0, 1), ternary forms isotropic, so u = 2. 𝔽₉: u = 2 ≤ 4, so §0.14 applies and 2 ∈ {0, 1, 2, 4, 6}; I³ = 0. u(ℝ) = 0, u(ℂ) = 1, u(ℝ(t)) = 2 unchanged. Characteristic 2 is excluded | holds |
| §1.5 step 2 | ℚ̄ ⊂ ℂ, X = 𝔸², α = (x, y), L = ℂ(x, y)(√x); k = K | A = ℚ̄, W = Spec ℚ̄[x, y, z, (xy)⁻¹]/(z² − x) is étale of degree 2 (x a unit). Its base change has function field L. It splits (x, y), so d = 2 = ind. For k = K: A = k and W_K = W has function field L, consistent with the Check's "k ≠ K" | holds |

## Checks

- `lake env lean packages/RealSurfacePeriodIndex/Suggested.lean`, run from the content checkout: exit 0. Output is eight `declaration uses sorry` warnings (lines 80, 89, 101, 112, 123, 133, 141, 154) and nothing else. The file is unchanged.
- Signatures: I put `#check @name` for all nine declarations (and `Algebra.IsQuadraticExtension`) into one scratch file and elaborated it: exit 0. I compared each elaborated type with its README statement. Every binder is present (`[Invertible 2]`, `[FiniteDimensional K V]`, `[Algebra.EssFiniteType ℝ K]`, `Algebra.trdeg … = 2` or `= 1`), and nothing changed.
- The five newly cited Tau Ceti declarations are in modules the content checkout has not built. Only modules that `Suggested.lean` imports may be built, so I did not build them. Each was checked by reading the pinned file at the line cited.
- Dependency check, whole output:

      depcheck: 251 roadmaps, 2391 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. That tool does not check names outside TauCetiRoadmap, so I checked those by hand at the pins (above).

## Gate failures

- tex=1, README §1.5, proof step 2: the fibre product `V ×_{Spec A} Spec K` had a TeX-style braced subscript outside a code span. It is now in a code span (`` `V_K = V ×_{Spec A} Spec K` ``), as the README does elsewhere. The mathematics is unchanged. I scanned the whole README for braced `_{`/`^{`, backslash commands and `$` outside code spans and found nothing else. The dependency check was run again after the edit and gave the same output: `depcheck: 251 roadmaps, 2391 edges, 0 problem(s)`. `Suggested.lean` was not touched.

## For the maintainer

- No new supplier, gap or target, and no notion moved. The repairs add only citations of pinned Tau Ceti and Mathlib declarations; no construction is newly owned here, so there was no new ownership question to check against the open pull requests.
- No name that other roadmaps cite changed. FormalLaurentPuiseux L4/L5 and RealAlgebraicGeometry Layer 1 are still cited, now with their Tau Ceti forms.
- No suspicious instructions were found in the review text.
