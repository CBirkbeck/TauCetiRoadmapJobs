# Repair of SurfaceGroupCharacterVarieties (design, round 4)

Review settled: `reports/REV-DESIGN-SurfaceGroupCharacterVarieties~3.md` (six findings, R01–R06).
All six were verified on the mathematics and against the cited texts; all are repaired. Files
edited: `packages/SurfaceGroupCharacterVarieties/design/README.md` and
`packages/SurfaceGroupCharacterVarieties/design/plan.json`. `sources.toml` needed no change: no new
work is cited, and no fetch was needed.

## R01 (P2) — applied

Verified. TeichmullerGeometry's README at its open head defines `OuterAut G` in §4.2: `MulAut G`
modulo the range of `MulAut.conj`, with `innerAut_normal`, the `TauCeti.ContinuousOut` comparison and
the `Q₈` value `24/4 = 6`. Its `Suggested.lean` has the same quotient: an `abbrev` built from the
range of `MulAut.conj`. TeichmullerGeometry comes earlier in the merge order (the gate places this
roadmap after it).

Change. §1.1 "The outer automorphism group of an abstract group" (definition, normality,
ContinuousOut comparison, API bullets 1, 3, 5, three Checks) → §1.1 "Inner automorphisms and the
transport of outer automorphisms". This is a theorem section citing TeichmullerGeometry §4.2. It keeps
`Γ ⧸ Z(Γ) ≃* Inn(Γ)` and the transport `Out(Γ) ≃* Out(Γ')`, which is functorial and trivial for inner
`e`. It has a sketch and four new Checks.

Other places repaired:
- Conventions: a new bullet, "`Out(Γ)` is TeichmullerGeometry §4.2's `OuterAut Γ`".
- Scope: bullet 1 changed, the TeichmullerGeometry deferral gains §4.2's `OuterAut`, and the
  FiniteGroupInvariants sentence is deleted.
- The Tau Ceti contract drops the eight `TauCeti.ContinuousAut*`/`ContinuousOut*` names, which are no
  longer used. The TeichmullerGeometry contract gains `OuterAut` and `innerAut_normal`.
- Summary, How to read, and Layer 1 Dependencies.
- *Needs:* lines of §1.3 and §3.3 gain TeichmullerGeometry §4.2.
- `plan.json` 1.1 is now kind `theorem`, named `OuterAut.congr`, with prerequisite
  TeichmullerGeometry §4.2. 1.3 and 3.3 gain the same prerequisite.

## R02 (P2) — applied

Verified at the head of TeichmullerGeometry:
- §0.0h has `isotopicToIdSubgroup`/`MappingClassGroupFull`, based on `TauCeti.Isotopic`.
- §5.4 has `dehn_nielsen_baer`, whose hypotheses are a half-plane chart, empty boundary,
  `Surface.IsOrientable` and `1 ≤ Surface.genus`.
- §5.4a has `mcg_sphere_full` and `mcg_torus_full`.

Pins checked: `TauCeti.AmbientIsotopic.isotopic` is at `Topology/Homotopy/AmbientIsotopic/Basic.lean:94`.
`TauCeti.isotopic_iff_ambientIsotopic` is at `Topology/Homotopy/Isotopy/Compact.lean:123`; it needs
`ChartedSpace E Y` with `E` a finite-dimensional normed space, and `Y` compact, Hausdorff and
connected.

Changes:
1. §2.1 gains the variant clause, an API bullet and *Needs:* entries:
   - The variant clause says how `Mod^±(X)` differs from `MappingClassGroupFull X`.
   - The API bullet: `Mod^±(X) → MappingClassGroupFull X` is surjective
     (`TauCeti.AmbientIsotopic.isotopic`). It is an isomorphism for compact, connected, Hausdorff
     `X` charted on a finite-dimensional real normed space (`TauCeti.isotopic_iff_ambientIsotopic`),
     and for `Σ_g` through TeichmullerGeometry §0.0e.
   - *Needs:* gains those Tau Ceti names and TeichmullerGeometry §§0.0e, 0.0h.
2. §3.4 is restated:
   - New heading: "Closed surfaces: the Dehn–Nielsen–Baer isomorphism and the action on `H₂`".
   - The statement: `Ψ_x` corresponds to `dehn_nielsen_baer`, so it is an isomorphism for `g ≥ 1`.
     For `g = 0` it is the map from the group of order two (§5.4a) to the trivial group.
   - The `H₂` clause is kept.
   - The sketch gains the comparison step:
     - the genus and orientability of §0.0f via MordellLawrenceVenkatesh §5.4;
     - the change of model by §0.0e;
     - representatives fixing `x` by MordellLawrenceVenkatesh §5.17;
     - both maps send the class of `f` to the class of `FundamentalGroup.mapOfEq f`.
   - The sphere Check is reworded, and the torus Check now cites `mcg_torus_full`.
   - In *Needs:*, §§0.2, 3.1, 5.2 are replaced by §§0.0e, 0.0f, 0.0h, 5.4, 5.4a, plus MordellLawrenceVenkatesh §§5.4, 5.17 and `FundamentalGroup.mapOfEq`.
3. Scope:
   - The Part II sentence now keeps only the smooth punctured model and the punctured
     Dehn–Nielsen–Baer theorem.
   - The TeichmullerGeometry deferral is now §§0.0d, 0.0e, 0.0f, 0.0h, 4.2–4.5, 5.4, 5.4a, 6.1.
   - Scope bullets 2–3 are reworded.

Pattern:
- The TeichmullerGeometry contract is rewritten. §§0.2, 3.1, 5.2 and the diffeotopy assumption are
  dropped (unused now), and §§0.0e, 0.0f, 0.0h, 5.4, 5.4a are added with their statements.
- A Conventions isotopy note was added.
- How to read and the Layer 2–3 Dependencies are updated.
- `plan.json`: 2.1 (statement, hypotheses, prerequisites, new API entry), 3.4 (renamed
  `MappingClass.outerAction_closed`, statement, prerequisites, tests) and the TeichmullerGeometry
  supplier entry.

## R03 (P2) — applied

Verified. Counterexample: take `F_ℕ` and `ℝ^×`. Then `Ad` is trivial and `𝒳 = (ℝ^×)^ℕ`. This space is
not locally compact: the closure of a basic open set projects onto `ℝ^×` in a free coordinate.

Changes:
- §7.1 now reads "For a real reductive datum `(𝐆, G^ℝ)` and a finitely generated group `Γ`, define…",
  and gains a negative-control Check: `(ℝ^×)^ℕ` against the rank-`m` case, and the finite `S` needed
  by §5.3.
- §7.3: "for finitely generated groups `Γ`, `Γ'`", with finite-index subgroups finitely generated by
  Schreier's lemma. Mathlib `Subgroup.fg_of_index_ne_zero` (`GroupTheory/Schreier.lean:166`) is
  added to *Needs:* and to the contract.
- §7.4: "for a finitely generated group `Γ`".

Pattern: Summary, the Scope Layer 7 bullet, and Downstream consumers ("general finitely generated
`Γ`"). In `plan.json`, 7.1's statement and tests and 7.3's hypotheses and prerequisites, plus the
summary. §6.1 (a definition) and §§7.2, 7.5 already carry finite generation or are about finitely
generated groups, so they are unchanged.

## R04 (P3) — applied

Verified: `TauCeti.isPreconnected_iInter_of_directed` is at `Topology/Continuum.lean:69`. It needs
`[T2Space X]`, `[Nonempty ι]`, `Directed (· ⊇ ·) t`, and each `t i` compact and preconnected.

Changes:
- Deleted the "Mathlib has no lemma … §2.2 proves it" sentence.
- Added the declaration to the Tau Ceti contract and to §2.2's *Needs:*.
- The §2.2 sketch now uses the family of closures of `h(U ∖ {p})`, with `U` in the basis and
  `U ∩ P = {p}`, directed by reverse inclusion, instead of a shrinking sequence. The added condition
  `U ∩ P = {p}` makes `h(U ∖ {p})` defined. Continuity holds because every neighbourhood of `q`
  contains a member of the family.
- The isotopy clause is restated the same way, which removes the unstated first countability.

## R05 (P3) — applied

Verified. MordellLawrenceVenkatesh §5.5 at its head states four things: the intersection form is
alternating, perfect for `∂S = ∅`, invariant under orientation-preserving homeomorphisms, and equal
to the signed count on transverse curves. It does not state `f_*[S] = [S]`.

Changes:
- The contract's "Assumed: … fixes the fundamental class" is deleted. The §5.5 entry now lists the
  four statements.
- §3.4's sketch derives the sign `ε_f` from `f_*[Σ] = ε_f[Σ]`:
  - The projection formula gives `f_*(a ∩ [Σ]) = ε_f (f⁻¹)^*a ∩ [Σ]`, so
    `î(f_*u, f_*v) = ε_f î(u, v)`.
  - The form is invariant (§5.5) and nonzero: `î(a₁, b₁) = ±1` for the transverse core curves of
    TeichmullerGeometry §4.3. Hence `ε_f = 1`.
- The torus Check gains the witness `î(Au, Av) = det(A) î(u, v)`: the shear gives `ε = 1` and
  `diag(1, −1)` gives `ε = −1`.

## R06 (P3) — applied

Changed "write `w_n = k_n t_n k'_n`" to "write `w_n = g_n v_n` with `g_n = k_n t_n k'_n`" (§7.1
sketch). Recomputed: then `k_n⁻¹ w_n = t_n k'_n v_n`, so `f(k'_n v_n) = f(k_n⁻¹ w_n)` for `T`-invariant
`f`. On `ℝ_{>0}` acting on `ℝ²` (`K = 1`), `f(v_n) = f(w_n)`.

## Checks

**Dependency gate** (final README):

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2118 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

**Citations** (`roadmaps resolve` on the final README): there are no cross-roadmap citations and no
Lean names that are found nowhere. Tau Ceti and Mathlib names are not checked by that tool, so every
new one was checked by hand at the pins:
- Tau Ceti:
  - `TauCeti.Isotopic` (`Topology/Homotopy/Isotopy/Basic.lean:114`);
  - `TauCeti.AmbientIsotopic.isotopic` (`AmbientIsotopic/Basic.lean:94`);
  - `TauCeti.isotopic_iff_ambientIsotopic` (`Isotopy/Compact.lean:123`);
  - `TauCeti.isPreconnected_iInter_of_directed` (`Topology/Continuum.lean:69`).
- Mathlib:
  - `FundamentalGroup.mapOfEq` (`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:85`);
  - `QuotientGroup.quotientKerEquivRange` (`GroupTheory/QuotientGroup/Basic.lean:134`);
  - `QuotientGroup.congr` (`GroupTheory/QuotientGroup/Defs.lean:397`, `e : G ≃* H`,
    `G'.map e = H'`);
  - `Subgroup.center` (`GroupTheory/Subgroup/Center.lean:30`);
  - `Subgroup.fg_of_index_ne_zero`;
  - `Directed`;
  - `IsPreconnected`.

Mathlib has no outer automorphism group: the only hit is a docstring in `KleinFour.lean`. Neither
Mathlib nor Tau Ceti has `ker MulAut.conj = center` for `MulAut`; Tau Ceti has it only for
`ContinuousAut`.

**Cited TeichmullerGeometry names**, all present in its `Suggested.lean` at the head: `OuterAut`,
`innerAut_normal`, `isotopicToIdSubgroup`, `MappingClassGroupFull`, `dehn_nielsen_baer`,
`mcg_sphere_full`, `mcg_torus_full`. The genus-two hyperelliptic example cited as
"TeichmullerGeometry Layer 5" is in its Layer 5 Examples.

**Suggested.lean / `#check` comparison:** not applicable. There is no `Suggested.lean` at the design
stage and no elaboration in this lane.

**Ownership:** the objects whose ownership moved (`Out` of an arbitrary group, the topological mapping
class group, the topological Dehn–Nielsen–Baer theorem) are now cited from TeichmullerGeometry, which
is earlier in the merge order. `Mod^±(X)` is kept as a variant with a stated difference, because
§2.2 needs the ambient relation off compact spaces. `scratch/overlaps.md` reports no open pull request
that changes this roadmap and no dropped ids. Other ownership was not re-searched this round beyond
the changed objects.

## Adversarial table (new or changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `ker MulAut.conj = Z(Γ)` | `Q₈`, `ℤ`, `S₃`, trivial group | `ord Inn(Q₈) = 8/2 = 4` (not `8`), `24/4 = 6`; `Inn(ℤ) = 1`; `ord Inn(S₃) = 6/1 = 6`; trivial | holds on non-abelian and cyclic groups | R01 |
| §1.1 transport, inner `e` | `e = MulAut.conj g`, pointwise; `Q₈`, `e = conj i` | both sides of `e∘φ∘e⁻¹ = φ∘conj(φ⁻¹(g)g⁻¹)` send `y ↦ g φ(g⁻¹yg) g⁻¹`; conjugation by `v ∈ V₄ ∖ 1` is nontrivial on `S₄` (centre `1`) and trivial on `S₄/V₄` | trivial on `Out`, not on `MulAut` | R01 |
| §1.1 transport, outer `e`; functoriality | `ℤ²`, `e = diag(1,−1)`; `e = id`; `e'∘e` | `D[[1,1],[0,1]]D⁻¹ = [[1,−1],[0,1]]`; identity; `(e'e)φ(e'e)⁻¹ = e'(eφe⁻¹)e'⁻¹` | "inner only" is needed | R01 |
| §2.1 comparison `Mod^± → MappingClassGroupFull` | `T²`, `S²`, `S¹`; final map of an ambient isotopy | `GL₂(ℤ)` in both; order `2` in both (`mcg_sphere_full`); order `2` in both; `Φ.final ∘ id` isotopic to `id` | surjective in general, bijective on compact connected boundaryless manifolds | R02 |
| §3.4 `Ψ_x` = `dehn_nielsen_baer` | torus shear; `S²`; genus two | `[[1,0],[1,1]]` in §3.3 and in §5.4a's Check; `2 → 1`, kernel of order `2`; hyperelliptic `↦ −1` on `H₁` in both | isomorphism for `g ≥ 1` only | R02 |
| §3.4 sign `ε_f` | torus `A = [[1,0],[1,1]]`, `diag(1,−1)`; `S²` | `î(Au,Av) = det A·î(u,v)`: `ε = 1`, `ε = −1`, matching `det A` on `Λ²ℤ²`; `H₁(S²) = 0`, `î = 0`, so the identity (`ε = 1`) and the antipode (`ε = −1`) are not separated | needs `g ≥ 1` | R05 |
| §3.4 projection step | general `f` | `f_*(f^*α ∩ c) = α ∩ f_*c` with `α = (f⁻¹)^*a` gives `ε_f(f⁻¹)^*a ∩ [Σ]`; `ε_f² · ε_{f⁻¹} = ε_f` | correct | R05 |
| §2.2 directed-family sketch | `S²`, `P = {N,S}`, caps `U_r`, end swap; a `U` that also contains `S`; `S¹` with two points | intersection `{S}`; `h(U ∖ {N})` undefined at `S`, hence `U ∩ P = {p}`; `U ∖ {p}` disconnected (the hypothesis fails, as in the Check) | correct with `U ∩ P = {p}` | R04 |
| §7.1 topology | `F_ℕ → ℝ^×`; `F_m → ℝ^×`; trivial `Γ` | `(ℝ^×)^ℕ` not locally compact; `(ℝ^×)^m` locally compact and second countable; a point | false without finite generation | R03 |
| §7.1 sketch | `ℝ_{>0}` on `ℝ²`, `K = 1` | `w_n = t_n v_n`, `f(v_n) = f(w_n)` tends to `0` and to `1` | contradiction as intended | R06 |
| §7.3 finite generation | index-2 subgroup of `F₂`; `[F₂, F₂]` | rank `1 + 2(2−1) = 3`; infinite rank (infinite index) | Schreier's lemma covers finite index only, as stated | R03 |
| §7.4 | `Out(ℤ)` on `𝒳(ℤ, SO(2))` | `g ↦ ḡ`, fixed points `±1` | unchanged value | R03 |

## For the maintainer

- This roadmap now consumes TeichmullerGeometry §§0.0d (named in Scope), 0.0e, 0.0f, 0.0h, 4.2–4.5,
  5.4, 5.4a, 6.1 at the head of its open pull request. It no longer uses §§0.2, 3.1, 5.2.
- TeichmullerGeometry §5.4 states `Mod⁺(Σ) ≃ Out⁺(Π)` without displaying `Out⁺`. This roadmap's §3.4
  characterizes the image of `Mod(Σ)` concretely: the outer classes acting trivially on
  `H₂(π₁(Σ, x); ℤ)`. If TeichmullerGeometry later defines `Out⁺` that way, §3.4's `H₂` clause can
  cite it.
- Names changed in `plan.json` (none is cited by another roadmap, and no `Suggested.lean` exists):
  - `MulOut` → `OuterAut.congr`;
  - `MappingClass.outerAction_surjective_closed` → `MappingClass.outerAction_closed`;
  - new API entry `Homeomorph.isotopyClasses.toMappingClassGroupFull`.
- No suspicious instructions were found in the review or in the fetched roadmap texts.
