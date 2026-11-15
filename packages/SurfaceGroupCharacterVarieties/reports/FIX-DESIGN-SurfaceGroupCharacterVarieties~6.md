# Repair of SurfaceGroupCharacterVarieties (design, round 6)

Review settled: the comments of `REV-DESIGN-SurfaceGroupCharacterVarieties~5` (three findings, F01–F03,
all P3). I checked each one against the supplier texts the roadmap tool serves now:
TeichmullerGeometry and MordellLawrenceVenkatesh at the heads of their open pull requests,
RepresentationTheory/LieGroups on main. I also checked the pinned Mathlib and Tau Ceti and the cached
BohmLafuente2021 text. All three findings hold. F01 and F02 are applied as asked. F03 is applied
differently: it also fills two gaps the suggested sentence left open.

Files edited:
- `packages/SurfaceGroupCharacterVarieties/design/README.md`
- `packages/SurfaceGroupCharacterVarieties/design/plan.json`

`sources.toml` is unchanged. No new work is cited, and the one new locator (BohmLafuente2021
Corollary A.2, line 1050) was already cited in §5.4.

## F01 (P3) — applied

§5.3, third Check. Old: "`SL₂(ℝ)` conjugated by `[[1,1],[0,1]]` is not transpose-stable", false since
`u ∈ SL₂(ℝ)`. New: `SO(2)` embedded as `u SO(2) u⁻¹` has image `{[[c+s, −2s],[s, c−s]]}`, not
transpose-stable; `K = {±1}`, `𝔭 = 0`, `K exp(𝔭) ≠ G^ℝ`, `‖u r_{π/2} u⁻¹ e₁‖² = 2`. Mirrored in the
`plan.json` test `non_stable_embedding`.

## F02 (P3) — applied

§5.4 (v) now proves only the `T`-invariant separation. `G = K T K` is cited to LieGroups Layer 9,
**Restricted roots and KAK** (`kakDecomposition`). The old parenthesis "(proved from the conjugacy …)"
becomes a check that `G` is a Layer 9 model with `π = id`. Contract, Scope, *Needs:*, §7.1 and
`plan.json` 5.4 updated.

## F03 (P3) — applied differently

New §2.1 bullet: `Σ_g` gets a PL structure (§0.0b) and a compatible smooth structure (§0.0e), with
empty boundary by `image_boundary`, then §0.0e's comparison. `Σ_g ∖ P` inherits the charts
(`TopologicalSpace.Opens.instChartedSpace`). The suggested sentence skipped both steps. §0.0b is added
to the contract, Scope, the *Needs:* of §§2.1, 2.4 and 3.4, Layers 2–3 and `plan.json`.

## Details of the repairs

**F01.** The witness was recomputed. Write `r_θ = [[c,−s],[s,c]]`; then
`u r_θ u⁻¹ = [[c+s, −2s],[s, c−s]]`.
- At `θ = π/2` the element is `[[1,−2],[1,−1]]`. Its transpose `[[1,1],[−2,−1]]` would need `s = −2` and
  `−2s = 1` at once, so it is not in the image.
- Orthonormal columns force `s(2c + s) = 0` and `2s(2s − c) = 0`. With `s ≠ 0` this gives `s = −2c` and
  `c = 2s`, hence `s = 0`, a contradiction. So `K = {±1}`.
- The Lie algebra is `ℝ·[[1,−2],[1,−1]]`, and `t[[1,−2],[1,−1]]` is symmetric only for `t = 0`. So
  `𝔭 = 0`.

Pattern search: no other passage uses a conjugated embedding. `[[1,1],[0,1]]` appears elsewhere only
as a unipotent matrix (Conventions, §§1.1, 3.3, 5.4, 6.1–6.7, 7.1–7.3), and each of those uses is
correct.

**F02.** LieGroups Layer 9 (main, `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`, bullets
**Global real-reductive inputs** and **Restricted roots and KAK**) takes as its model a closed
transpose-stable `H ≤ GL_N(ℝ)` with finitely many components and a finite central cover `π`. Its
Cartan involution is the lift of `h ↦ (hᵀ)⁻¹`, and it proves `Ad(K)𝔞 = 𝔭` and
`G = K exp(𝔞₊) K` (`kakDecomposition`, in that roadmap's `Suggested.lean`, on an `IwasawaData`).

§5.4's `G` meets this model with `π = id`:
- `(k exp X)ᵀ = exp(Xᵀ) kᵀ = exp(X) k⁻¹ ∈ G`.
- `K = G ∩ O(V)` is compact, so it has finitely many components. `G` is the continuous image of
  `K × 𝔭` with `𝔭` connected, so `G` has at most as many components as `K`.
- `θ(g) = (gᵀ)⁻¹` fixes exactly `G ∩ O(V) = K`, and `dθ(X) = −Xᵀ` has `−1`-eigenspace `𝔤 ∩ Sym(V) = 𝔭`.

Since `exp(𝔱₊) ⊆ T`, `G = K exp(𝔱₊) K ⊆ K T K ⊆ G`.

The other user of `K T K` is §7.1's sketch, which now points to §5.4. §7.1 applies it to `G^ℝ ⊆ GL_N`,
which satisfies §5.4's hypotheses by §5.3.

**F03.** TeichmullerGeometry §0.0e, at its head, states the comparison of the two models only for
smooth surfaces (`[IsManifold (𝓡∂ 2) ∞ M]`). The converse direction asks for empty boundary. The PL
structure of a compact topological surface is §0.0b's (Radó, from GeometricTopology Layer 11.2.1
item 3). MordellLawrenceVenkatesh §5.1 gives `Σ_g` only a topological atlas, with boundary charts as
data. `TauCeti.isotopic_iff_ambientIsotopic` (pin, `Topology/Homotopy/Isotopy/Compact.lean:103–124`)
needs `[ChartedSpace E Y]` with `E` a finite-dimensional real normed space.

The repaired chain is:
1. Radó gives a PL structure (§0.0b).
2. §0.0e smooths it.
3. `image_boundary` (TeichmullerGeometry `Suggested.lean`, `e '' (𝓡∂ 2).boundary M = (𝓡∂ 2).boundary N`),
   applied to the identity of `Σ_g`, shows that the smooth half-plane atlas has empty boundary.
4. §0.0e's converse gives an atlas on `EuclideanSpace ℝ (Fin 2)`.

The same gap affected every use of "the boundaryless surface `Σ_{g,n}`": the Conventions (Isotopy),
§2.2, the MordellLawrenceVenkatesh contract's "Used" clause and `plan.json` 2.1's
`of_boundaryless_manifold`. All of these rest on §2.1's manifold bullet, which needs an `ℝ²` atlas. The
new bullet supplies it: `Σ_g ∖ P` is open (`P` finite, `Σ_g` Hausdorff), and Mathlib's
`TopologicalSpace.Opens.instChartedSpace` (`Geometry/Manifold/HasGroupoid.lean:284`) restricts the
charts. The manifold bullet now says that it applies to `Σ_{g,n}`.

§3.4's old sketch said that §0.0e "exchanges" the two atlases. The new sketch says three things:
- `dehn_nielsen_baer` is stated on `Σ_g`'s own half-plane atlas with empty boundary.
- The boundaryless atlas serves only the bijectivity in §2.1.
- `Mod^±` and `MappingClassGroupFull` depend on the topological space alone (TeichmullerGeometry §0.0h
  defines the latter for any topological space).

## Checks

Dependency check:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2236 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. I checked
the names outside TauCetiRoadmap by hand at the pins: `TopologicalSpace.Opens.instChartedSpace`,
`TauCeti.isotopic_iff_ambientIsotopic`. The style grep found no LaTeX delimiters, process words,
pull-request numbers or machine paths.

No gate failures were listed for this round.

## Suggested.lean

There is none at the design stage, so the `#check` comparison and the padding probe do not apply.

## Ownership

No new owned construction is introduced.
- `G = K T K` moves from this roadmap to its owner on main, LieGroups Layer 9. A roadmap on main is
  earlier than every open one.
- The charting of `Σ_g` on `ℝ²` is derived from TeichmullerGeometry §§0.0b and 0.0e as they are
  stated, not planned again.
- The open roadmap pull requests listed in the brief were reached through the roadmap tool
  (`roadmaps show`, `roadmaps resolve`). No other open roadmap owns either object.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.3 Check (new) | `u SO(2) u⁻¹`, `θ = π/2`; orthogonality; Lie algebra; norm; `u SL₂(ℝ) u⁻¹` | `[[1,−2],[1,−1]]`, transpose `[[1,1],[−2,−1]]` not of the form; `s(2c+s) = 0`, `2s(2s−c) = 0` ⇒ `s = 0`, `K = {±1}`; `𝔭 = 0`; `‖(1,1)‖² = 2`; image `SL₂(ℝ)`, `K = SO(2)` | true non-example; old version false | F01 |
| §5.4 (v), `G = KTK` from Layer 9 | `ℝ_{>0}` on `ℝ`; `SL₂(ℝ)`; compact `G`; `GL₁(ℝ)` | `K = 1`, `𝔱 = ℝ`, no roots, chamber `= 𝔱`, `T = G`; `𝔱 = ℝ·diag(1,−1)`, chamber `t ≥ 0`, `g = k₁ diag(eᵗ, e⁻ᵗ) k₂`; `𝔭 = 0`, `T = 1`, `G = K`; `K = {±1}`, `G = {±1}·ℝ_{>0}`, 2 components | holds | F02 |
| Layer 9 model check | transpose; components; `θ` | `(k exp X)ᵀ = exp(X)k⁻¹`; `#π₀(G) ≤ #π₀(K) < ∞`; `Fix θ = K`, `ker(dθ+1) = 𝔭` | holds | F02 |
| §5.4 hypotheses vs §5.3 non-example | `u SO(2) u⁻¹` | `K exp(𝔭) = {±1} ≠ G` | excluded by hypothesis, consistent | none |
| §7.1 use of `KTK` | `G^ℝ ⊆ GL_N` from §5.3 | `G^ℝ = K exp(𝔭)` closed | §5.4 applies | pointer |
| §2.1 new bullet | `g = 0`; `g = 1`; closed disc; `P = ∅`; `(0, 3)` | tetrahedral PL, smoothed after one subdivision, `∂ = id(∅) = ∅`, `ℝ²` atlas; seven-vertex torus, flat smoothing; disc: `∂ ≠ ∅`, not a closed surface, excluded; `Σ_g ∖ ∅ = Σ_g`; `S² ∖ 3` points open, inherits | holds | F03 |
| §2.1 comparison bullet | `S²`; `T²` | `Mod^±(S²)`, `MappingClassGroupFull S²` order `2, 2`; `GL₂(ℤ)` both | holds with chart from new bullet | F03 |
| §2.1 manifold bullet on `Σ_{g,n}` | `Σ_{1,1}`; `ℝ × Σ_{g,n}` | charted on `ℝ²`; `finrank(ℝ × ℝ²) = 3` both sides | holds | F03 |
| §3.4 atlas sentence | `dehn_nielsen_baer` signature; `g = 1` | half-plane atlas, `hb : boundary = ∅`, `Surface.genus`, `Surface.IsOrientable` topological; torus genus `1` | holds | F03 |
| Contract §§0.0b, 0.0e | text at head | carrier, `image_boundary`, Radó; smoothing, converse comparison with empty boundary | matches supplier | F03 |

## Sources

- No fetch was needed. All locators are against cached texts (BohmLafuente2021 line 1050, Corollary A.2;
  lines 101, 465 and 560 use `G = KTK`) or are unchanged.
- No `needs-references.toml` was written.

## For the maintainer

- No id this roadmap defines changed, and no id other roadmaps cite was dropped. Plan target 5.4 keeps
  its name, and (v) now cites `G = K T K` instead of proving it.
- `plan.json` gains one API item under 2.1, `SurfaceGroup.closedSurface_boundarylessChart`.
- The roadmap now consumes TeichmullerGeometry §0.0b in addition to §0.0e, and LieGroups Layer 9's
  paragraph **Restricted roots and KAK**. Both are existing suppliers, so the merge-order placement does
  not change.
