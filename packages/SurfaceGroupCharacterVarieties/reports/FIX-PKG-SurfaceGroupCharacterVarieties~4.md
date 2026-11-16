# FIX-PKG-SurfaceGroupCharacterVarieties~4

Findings of `REV-PKG-SurfaceGroupCharacterVarieties~3` (review of 3e002bb), each settled on the
mathematics. Files changed: `packages/SurfaceGroupCharacterVarieties/README.md` and
`packages/SurfaceGroupCharacterVarieties/sources.toml`. `Suggested.lean`, `metadata.toml` and
`design/plan.json` are unchanged: both findings concern README prose (a proof sketch of §5.4 and
two descriptions of a pinned declaration), no statement of `Suggested.lean` is affected, and no
supplier gap is needed.

## F01 (P3) — applied differently

§5.4 sketch: "the orbits are coordinate tori … monomials with nonnegative real exponents each
supported on one sign component of a coordinate stratum" → weights `α_i` in a simultaneous
eigenbasis; orbits are images of `𝔱`, homeomorphic to vector spaces, sign-preserving; separating
functions `∏_{i∈I} v_i^{w_i}` on the positive `I`-orthant with `w_i > 0`, `Σ w_i = 1`,
`Σ w_i α_i = 0`, and sign-change composites; then `Φ`, Lemma 5.3, Corollary 4.2, Urysohn.

Why differently: the review's replacement text is flawed in two ways, checked against
BohmLafuente2021.

- It asks only `w_i ≥ 0`. A zero exponent on `I` breaks continuity: for `𝔱 = 0` on `ℝ²`,
  `I = {1, 2}`, `w = (1, 0)`, the function is `x` on the open first quadrant and `0` elsewhere,
  so it is `0` at `(1, 0)` but tends to `1` along `(1, ε)`. The source picks `w` in `U_I^+`, so
  `w_i > 0` on `I` (BohmLafuente2021 lines 353–357).
- It leaves out the condition that makes the monomial `T`-invariant: `w ⊥ φ(𝔱)`, that is
  `Σ_{i∈I} w_i α_i = 0` (lines 339–343, 354, and the computation at lines 369–372). On the
  review's own witness, the exponent `(1, 0)` gives `x`, which `exp(s·diag(1, −1))` multiplies by
  `e^s`.

The normalisation `Σ w_i = 1` (line 356) is kept because Lemma 5.3 (line 437) uses the degree-one
homogeneity of `Φ`. The review's "Urysohn on their joint image" now says why the images are closed
and disjoint: Lemma 5.3 and Corollary 4.2, as in the proof of Corollary 5.5 (lines 448–460). The
§5.4 separation Check now also works through the sketch on `𝔱 = ℝ·diag(1, −1)` (see the table). No
other passage uses "tori", "sign component" or "coordinate stratum" (searched in the README,
`Suggested.lean` and `design/plan.json`). The new locators are recorded in `sources.toml` under
the existing key `BohmLafuente2021`.

## F02 (P3) — applied

Scope (Tau Ceti bullet): "locally compact for finite type over a locally compact ring" → "locally
compact for a finite-type algebra over a commutative ring and a commutative topological ring `R`
of values that is T1 and locally compact (`[IsTopologicalSemiring R] [T1Space R]
[LocallyCompactSpace R]`)". Same change in the Tau Ceti contract, which now also names both files.

Pinned evidence: `Topology/Algebra/PointTopology/Basic.lean` line 241 (section variables
`[TopologicalSpace R] [IsTopologicalSemiring R] [T1Space R]` with `CommRing k`, `CommRing A`,
`CommRing R` at line 221) and line 261 (`[LocallyCompactSpace R] [Algebra.FiniteType k A]`).

Same pattern: `TauCeti.PointTopology.isTopologicalGroup` (`Topology/Algebra/PointTopology/Group.lean`
line 102, with `[CommSemiring R] [IsTopologicalSemiring R]` and a Hopf algebra) is now described in
both places as holding "for a commutative topological semiring of values".
`reductiveCommHopfAlgProperty.linearlyReductive` (`Reductive/CompleteReducibility.lean` line 96),
`reductiveCommHopfAlgProperty_iff_linearlyReductive` (line 118, with geometric connectedness) and
`reductiveCommHopfAlgProperty.of_injective` (`Reductive/Image.lean` line 44, injective coordinate
map) agree with their descriptions; nothing changed there.

The ReductiveGroupsPartII contract's "locally compact Hausdorff `R`" describes §RG2.0.1 as that
section states it (ReductiveGroupsPartII README line 497: "Hausdorff and locally compact"). It is
accurate for that section and is a special case of the pinned T1 hypothesis, so it is unchanged.

Use in §4.2: `ℝ` and `ℂ` are commutative, locally compact and T1 topological rings, so the
declaration applies as §4.2 uses it.

## Checks

- **Elaboration.** From the content repository,
  `lake env lean packages/SurfaceGroupCharacterVarieties/Suggested.lean` gave exit 0 with 13
  warnings, all "declaration uses `sorry`" (lines 95, 113, 123, 144, 203, 211, 219, 229, 239, 273,
  323, 338, 360), and no error. The file is unchanged. No `TauCeti.*` object file was missing.
- **Signatures.** A scratch copy of `Suggested.lean` with `#check @name` added for all 24
  declarations was elaborated once: no error. The elaborated types are those of the worker's
  signature list, and each agrees with its README statement. Nothing changed. The four flagged
  "dropped binders" are `[FiniteDimensional ℝ V]` on the Layer 5 definitions `symmetricPart`,
  `IsRealReductiveLinearGroup`, `minimalVectors` and `linearOrbit`. Their bodies do not use it, and
  the five Layer 5 theorems carry it.
- **Dependency check** (output, verbatim): `depcheck: 235 roadmaps, 2237 edges, 0 problem(s)`. No
  UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name
  "found nowhere". The worker's four Lean-name leads (`StandardSurface.eulerChar_model`,
  `StandardSurface.homeomorph_unique`, `StandardSurface.isSurface_model`, `Surface.IsOrientable`)
  are TeichmullerGeometry declarations, stated at its head (`homeomorph_unique` at its
  `Suggested.lean` line 317). They are cited as that supplier's names and are not touched here.
- **Ownership.** No new object, target or supplier is introduced. The added citations are locators
  in BohmLafuente2021 (already in the manifest) and two pinned Tau Ceti files already in the
  contracts.
- **Sources.** No text was missing, and `needs-references.toml` was not written.
  BohmLafuente2021 was read at lines 236–475 of its cached extraction.
- **Style.** The README has no LaTeX delimiter (searched for `\(`, `\[` and `$`), no process word
  and no machine path in the new text.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.4 sketch, action in the eigenbasis | `𝔱 = ℝ·diag(1, −1)`; `𝔱 = 0`; `v = 0` | `exp(s·diag(1,−1))(x, y) = (e^s x, e^{−s} y)`, `α_1 = s`, `α_2 = −s`; all `α_i = 0`, orbits points; orbit `{0}` | factors `e^{α_i(λ)} > 0` | stated |
| §5.4 sketch, orbit shape | `(1, 1)`, `(1, 0)`, `0` under `ℝ·diag(1, −1)` | `{(e^s, e^{−s})}`, log-abs `(s, −s)`, a line; `{(e^s, 0)}`, log-abs `s`, a line; a point, `ℝ⁰` | vector spaces, not tori; signs kept (zeros stay zero) | "coordinate tori" removed |
| §5.4 sketch, exponents positive on `I` | `𝔱 = 0`, `ℝ²`, `I = {1, 2}`, `w = (1, 0)`; `w = (1/2, 1/2)` | `f(1, 0) = 0`, `f(1, ε) = 1`: jump; `(xy)^{1/2} → 0` at the boundary of the quadrant | positivity needed | `w_i > 0` stated |
| §5.4 sketch, invariance condition | `ℝ·diag(1, −1)`, `w = (1, 0)`; `w = (1/2, 1/2)`; `I = {1}` | `x ↦ e^s x`, not invariant; `(e^s x e^{−s} y)^{1/2} = (xy)^{1/2}`, invariant; `w_1 α_1 = 0` forces `w_1 = 0`, no function | `Σ w_i α_i = 0` needed; singletons inadmissible, as the half-axis orbits are not closed (Lemma 4.3) | condition stated |
| §5.4 sketch, sign-change composites | `σ = (−1, −1)`, `(1, −1)`, `(−1, 1)` | `(xy)^{1/2}` on Q3; `(−xy)^{1/2}` on Q4; `(−xy)^{1/2}` on Q2; diagonal sign changes commute with `T` | invariant and continuous | stated |
| §5.4 sketch, `Φ` and Urysohn | the two branches of `xy = 1`; `𝔱 = 0` on `ℝ` | `Φ = (1, 0, 0, 0)` and `(0, 1, 0, 0)`, closed and disjoint; `Φ(v) = (v⁺, v⁻)`, `‖Φ(v)‖ = |v|` on `M_T = ℝ` | Lemma 5.3's bound holds; images separated | stated with Lemma 5.3, Corollary 4.2 |
| §5.4 separation Check, added clause | same as the rows above | `w = (1/2, 1/2)`; values `(1, 0)` and `(0, 1)` on the branches; the Check's own function is `d ∘ Φ` with `d(a, b) = 1/2 − min(a², 1)/2 + min(b², 1)/2` on the first two coordinates (Q1: `1/2 − min(xy, 1)/2`; Q3: `1/2 + min(xy, 1)/2`; elsewhere `1/2`) | agrees with (v) and with the sketch | clause added |
| Scope and contract, `locallyCompactSpace_of_finiteType` | pinned signature; `ℝ`, `ℂ`; `ℚ_p`; `ℚ` | `CommRing k A R`, `[IsTopologicalSemiring R] [T1Space R] [LocallyCompactSpace R] [Algebra.FiniteType k A]`; `ℝ`, `ℂ` T1 and locally compact; applies; `ℚ` not locally compact, no conclusion | description now matches the pin | T1 and commutativity added |
| Scope and contract, `isTopologicalGroup` | pinned signature | `[CommSemiring R] [IsTopologicalSemiring R]`, `HopfAlgebra k H` | description now matches the pin | commutative topological semiring stated |

## For the maintainer

- No name that other roadmaps cite changed. No Lean declaration was added, renamed or removed, and
  no section, layer or target id moved.
- No new supplier and no new gap. The `BohmLafuente2021` entry in `sources.toml` gains the locators
  the sketch now uses (Corollary 4.2, line 300; the exponents, lines 353–357; Proposition 4.8,
  line 396; Lemma 5.3, line 437; the proof of Corollary 5.5, lines 448–460).
- The review's "For the human reviewers" items are for humans and are not acted on here: the
  `Out⁺(Π)` ownership against TeichmullerGeometry, the shared `gap:adjoint-kernel` with
  AdmissiblePairsAndPadicHodgeStructures, the §5.20 entry in `design/plan.json`, the
  BohmLafuente2021 version, and the waived and uncertified sources.
- The review text contained no instructions; there is nothing suspicious to report.
