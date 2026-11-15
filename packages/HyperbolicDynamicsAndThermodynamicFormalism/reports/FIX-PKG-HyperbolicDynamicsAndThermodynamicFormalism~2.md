# FIX-PKG-HyperbolicDynamicsAndThermodynamicFormalism~2

One review (REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism) with three findings, all P3. All three are applied, F02 in a corrected form. Files changed:
- `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md` (§§8.4, 8.5, 9.1)
- `packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean` (section `GeometricPotential`)
- `packages/HyperbolicDynamicsAndThermodynamicFormalism/sources.toml` (one `cited_for` list)

`design/plan.json` and `metadata.toml` are unchanged. No supplier gap was added.

## F01 (P3) — applied

Verified. The section `GeometricPotential` declared `[IsManifold I 1 M]`, but none of its three definitions used it. `mfderiv` needs only `ChartedSpace`. The elaborated types of `flowUnstableSubspace`, `unstableJacobian` and `geometricPotential` already had no `IsManifold` binder, and README §11.1 says the formulas define functions on all of M.

Change: `[ChartedSpace H M] [IsManifold I 1 M]` → `[ChartedSpace H M]` in the section's `variable` line.

The consumers `srb_of_isFlowAttractor` and `srb_of_isFlowBasicSet_univ` carry their own `[IsManifold I ∞ M]` in section `SRB`.

Same pattern elsewhere: I compared every section's `variable` instances with the binders of that section's elaborated declarations. No other section variable is unused by every declaration of its section:
- `MeasurableSpace` and `UniformSpace` are used by other declarations of their sections.
- `FiniteDimensional ℝ V` is used by `exists_isHadamardPerronFamily`.
- `SigmaCompactSpace M` is used by both local-product theorems.
- `IsContMDiffRiemannianBundle` is used by both SRB theorems.

## F02 (P3) — applied differently

The claim is right: §8.5 defined `IsFlowLocallyMaximal` inside the theorem's parenthesis, with no API and no Checks of its own. The suggested repair was correct mathematics with three gaps:
- **Invariance.** The `U_t` item needs Λ invariant: `IsFlowLocallyMaximal` is defined for any set, and U_t ⊇ Λ needs g^s(Λ) ⊆ Λ ⊆ U.
- **Wrong reading of "isolated".** "Isolated for the time-t map" must not be read as a locally maximal *hyperbolic* set of g^t. A nonempty Λ is never hyperbolic for g^t.
- **Too few Checks.** The definition needs three discriminating Checks of its own, not one.

Change in §8.5:
- **Definition paragraph.** The inline definition becomes its own paragraph, stated for any set Λ as the Lean is, with the locator BowenRuelle1975 line 29 (condition (d)).
- **API.** Three bullets (statements below).
- **Checks.** Three Checks (statements below).
- **Unchanged.** The theorem paragraph keeps its citation and its three Checks.
- ***Needs:*** gains Mathlib `Flow` and Layer 8.4 (`IsLocallyMaximal`) for the time-t item.

The API bullets:
- **Invariant subsets.** Λ is locally maximal with neighbourhood U iff every invariant subset of U lies in Λ.
- **Invariance under change of flow.** Local maximality is unchanged for the reversed flow and for g(at) with a > 0. It is carried by homeomorphic conjugacy to h(Λ) with neighbourhood h(U), and by a C¹ diffeomorphism to a locally maximal hyperbolic set (§7.2). It does not depend on the metric.
- **Time-t map.** For an invariant Λ and t > 0, U_t is open, contains Λ, and isolates Λ for the homeomorphism g^t. A nonempty Λ is not hyperbolic for g^t, so §8.4 does not apply.

The Checks:
- **The periodic orbit γ₀ is locally maximal.** In the cat-map suspension, the periodic orbit γ₀ of [0, 0] is isolated by every open U ⊆ W, where W is the set of points [s, w] with |w| < 1/4. A whole orbit in W lifts to a bounded orbit of the linear map A, because Aỹₙ − ỹₙ₊₁ is an integer vector of length below (5 + √5)/8 ≈ 0.905.
- **The shrinking to U_t is needed.** Take c = (4/5, 3/5), so Ac ≡ (1/5, 2/5) and A²c = c, both at distance √5/5 ≈ 0.447 > 1/4 from 0. Then U ∪ B isolates γ₀ for the flow but not for g², and (U ∪ B)_2 omits [0, c].
- **Not locally maximal (the review's example).** The suspension of {p} ∪ O is hyperbolic but not locally maximal, by the tube lemma over [0, 1] and §8.4's fourth Check.

Same construction in §8.4. Its definition sentence read "Call a hyperbolic set Λ of f locally maximal (`IsLocallyMaximal`)", but the Lean definition is for any set and any homeomorphism. It now reads "Call a set Λ locally maximal for a homeomorphism f …; … used here for hyperbolic sets", which matches the Lean and makes "in the sense of §8.4" in the new time-t item exact. The §8.4 API bullet "a C¹ diffeomorphism h carries it to a locally maximal hyperbolic set" now says "carries a locally maximal hyperbolic set Λ to …".

## F03 (P3) — applied

Verified. Layer 9 (§9.1 *Needs:* and the Layer 9 Dependencies) does not list Layer 10, while §10.4 *Needs:* lists Layer 9.1. The §9.1 bullet "by §10.2 it is the only one" therefore made the two layers use each other. The uniqueness is already owned by §10.4 (`isEquilibriumState_toralEndomorphism_zero_iff`).

Change: "…(ClassicalErgodicTheory §§1.4, 6.4, 8.1); by §10.2 it is the only one." → "…(ClassicalErgodicTheory §§1.4, 6.4, 8.1)."

**Same pattern in §9.1's prose.** The sentence "Haar measure has this entropy" cited "BowenPeriodicPoints1971, Proposition 7.1, line 667, for Haar measure as Bowen's measure". That identifies Haar measure with the unique measure of maximal entropy, which is §10.4's content, and §10.4 cites the same locator.
- **Change.** The citation is removed from §9.1. The claim stays supported by ClassicalErgodicTheory §6.4 (`measureEntropy_toralEndomorphism`, checked at its open head) and by BowenGroupEndomorphisms1971, Theorem 15 and Corollary 16 (lines 313–316, 332–336).
- **Manifest.** In `sources.toml`, BowenPeriodicPoints1971's `cited_for` loses "9.1"; no other §9.1 text cites it. Its References entry is unchanged, since §10.4 still cites Proposition 7.1.

**Other forward references, checked and left.** I scanned the README for every internal § reference to a later section:
- **API bullets.** Line 754 was the only API bullet whose stated fact rested on a later layer. The §7.1 bullet "Finite unions are treated in §7.4" is a pointer, not a claim.
- **Pointers in the prose.** §6.5 says §8.5 proves the axioms, which names the consumer. §10.3 has the parenthesis "the bound holds a fortiori for the closed balls B_x(ε, T) of §11.4": a monotonicity remark for the consumer, using no Layer 11 result. Closed flow Bowen balls already appear in §10.1's API.
- **Checks.** §2.2 → §6.6, §5.3 → §6.6, §7.6 → §9.3, §8.3 → §9.3, §8.7 → §11.1 and §10.4 → §11.6. These are unit tests that name where an example is treated. No target, route or consumer depends on a Check, so they create no cycle between layers.

## Checks run

- **Elaboration.** `lake env lean packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean`, run from the content checkout, exit 0. There are 15 warnings, all `declaration uses sorry` (lines 192, 209, 221, 284, 300, 404, 462, 473, 537, 555, 589, 599, 615, 666, 684), and no error. The imported Tau Ceti module's object file was present, so nothing needed building.
- **Signatures.** I put `#check @name` for all 50 declarations in one scratch copy and elaborated it once (exit 0, no error). I then compared each elaborated type, after whitespace normalisation, with the signatures recorded before this round: all 50 are identical. This includes the three `GeometricPotential` definitions: deleting the instance changed no type, because none had carried it. Each type still matches its README statement. The eight remaining "dropped" instances (`MeasurableSpace` and `UniformSpace` on the metric and pressure notions, `FiniteDimensional` on `hadamardPerronGraph` and `flowUnstableSubspace`) are ones the body does not need, as the review found.
- **Dependency direction.** Output: `depcheck: 239 roadmaps, 2258 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citations and no Lean names found nowhere. The only new backticked names are `IsLocallyMaximal` (declared in `Suggested.lean`) and Mathlib `Flow`.
- **Overlap lead.** "GeneralizedCohomology §G4.0b is defined only by an open revision" is refuted: main (c639cfa) defines G4.0b at line 1082 of `TauCetiRoadmap/GeneralizedCohomology/README.md`. No dependency on that revision arises.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §8.4 definition, now for any set (`IsLocallyMaximal`) | Λ = ∅; Λ = X; a non-invariant one-point Λ | ∅ with U = ∅: no whole orbit in ∅, so it holds, as §10.1's Check says. Λ = X with U = X: it holds. One point x, not fixed, U a small ball containing no whole orbit: locally maximal, but ⋂ fⁿ(U) = ∅ ≠ {x}, so the intersection form needs invariance | The intersection form is now stated "for an invariant Λ" | definition sentence |
| §8.5 API (1): invariant subsets of U | S an invariant subset of U; the orbit of x | Points of S have their whole orbit in S ⊆ U, so S ⊆ Λ. Conversely, the orbit of x is invariant and lies in U | Holds both ways, with no invariance of Λ needed | none |
| §8.5 API (2): reversal, rescaling, conjugacy | a = 1/2; reversal; h = rotation of 𝕋² conjugating a linear flow | The orbits of g(t/2) and g(−t) are the orbits of g as sets, so U is unchanged. h maps whole orbits in h(U) to whole orbits in U. For a C¹ h, §7.2 gives hyperbolicity of h(Λ) | Holds; hyperbolicity is only claimed for a C¹ h | none |
| §8.5 API (3): U_t | t = 1, r = −2.5 = (−3)·1 + 0.5; non-invariant Λ; nonempty Λ and hyperbolicity for g^t | g^(−2.5)x = g^0.5(g^(−3)x) ∈ U. For non-invariant Λ = {x}, U_t may omit x. X(x) has \|Dg^(nt)X\| in [min\|X\|, max\|X\|] on Λ, while a splitting sends v_u ≠ 0 to ∞ and v_s to 0 | Invariance is needed and is stated; the non-hyperbolicity remark holds | invariance hypothesis added |
| §8.5 Check 1: γ₀ in the cat suspension | w = 0; w ≠ 0 small; norm bound | ‖A‖ = (3 + √5)/2 ≈ 2.618 and 2.618/4 + 1/4 = 0.9045 < 1, so the lifts satisfy ỹₙ₊₁ = Aỹₙ. A bounded two-sided orbit of a linear map with eigenvalues 2.618 and 0.382 is 0 | Holds | new Check |
| §8.5 Check 2: the period-2 point | c = (4/5, 3/5) | Ac = (11/5, 7/5) ≡ (1/5, 2/5); A(1/5, 2/5) = (4/5, 3/5). \|det(A − I)\| = 1, so 0 is the only fixed point and the least period is 2. Distances √(1/25 + 4/25) = 0.4472 > 0.25. [1/2, c] ∉ W and ∉ B | U ∪ B fails for g² and (U ∪ B)_2 works | new Check |
| §8.5 Check 3: suspension of {p} ∪ O | V from the tube lemma; q a horseshoe point | The preimage of an open set ⊇ [0, 1] × K, with K compact, contains [0, 1] × V. The flow orbit of [0, q] is {[s, fⁿq]} ⊆ [0, 1] × V and misses K | Not locally maximal | new Check |
| §9.1 bullet after the edit | n = 0; cat map | n = 0: Haar = point mass, entropy 0 = h_top. Cat map: entropy 0.9624 = log 2.618 (ClassicalErgodicTheory §6.4) | Holds without §10.2 | sentence deleted |
| `GeometricPotential` without `IsManifold` | E^u = 0; Sol metric of §11.1 | E^u = 0: both Gram determinants are 1, λ_t = 1, φ^u = 0. Sol metric: λ_t = e^(at), φ^u = −a ≈ −0.9624. The values do not depend on the instance, which `mfderiv` does not use | Types identical | instance deleted |

## For the maintainer

- **Names.** No declaration name changed. No id cited by another roadmap was dropped or renumbered. The §8.5 heading is unchanged.
- **Ownership.** No new construction was introduced.
- **Supplier gaps.** None added. The two existing gaps (`gap:sphere-bundle-embedding`, `gap:connection-map-jacobi-derivative`) are untouched.
- **Missing texts.** No source text was needed beyond those cached, so no `needs-references.toml` was written.
- **Suspicious text.** The review text contained no instruction aimed at the worker.
