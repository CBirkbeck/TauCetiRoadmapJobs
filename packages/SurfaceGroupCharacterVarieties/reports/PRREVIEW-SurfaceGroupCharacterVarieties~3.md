# Review of SurfaceGroupCharacterVarieties (pull request #2430 at f6c8f48)

**Verdict:** accepted

No finding. The folder is unchanged since the previous review (same head); the whole roadmap was reviewed again.

## Previous findings

- R01 — not repaired: deferred (D01)

## Deferred findings

- D01 — resolved: the description's `depends-on` block now lists `#2427 LieGroupsPartII` and its `merge-order` chain ends `#2273 → #2427 (LieGroupsPartII) → this pull request`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 `Γ/Z(Γ) ≃ Inn(Γ)`, transport of `Out`, inner `e` acts trivially | `Q₈`; `ℤ`; `S₃`; `e = conj g` | `8/2 = 4`, `24/4 = 6`; `Inn(ℤ) = 1`; `Inn(S₃)` order 6; `eφe⁻¹ = conj(gφ(g)⁻¹)∘φ = φ∘conj(φ⁻¹(g)g⁻¹)` | holds | none |
| §1.3 and `exists_outAction_iff_commute` | `Γ = 1`; `Γ = H = F₂`; `ℤ²` witness; both directions | trivial: both sides true. `a[conj γ] = 1` forces `ρ(γ⁻¹δγ) = ρ(δ)`. `(φψ)⁻¹` row `(1,−1)`, `(ψφ)⁻¹` row `(2,−1)` | iff holds; left action | none |
| §2.2, `existsUnique_homeomorph_extension` | `X = ∅`; `X = {p} = P`; `S²`, `P = {N,S}`; `S¹`, two points | empty: unique `e`. One point: `U∖{p} = ∅`, hypothesis fails. Cylinder swap extends to rotation. Arcs: punctured neighbourhoods disconnected, hypothesis fails | holds; `Pᶜ` dense by the hypothesis, giving uniqueness | none |
| `existsUnique_ambientIsotopy_extension` | `S²`, `P = {N}`; uniqueness | total map of `I × ℝ²` is proper, so `F_t(y_n) → ∞`; slice at `t = 0` gives `q = p`. `AmbientIsotopy.ext` is by the underlying map | holds | none |
| §2.5 change of model | `e = id`; `e ∈ Homeo⁺(Σ, P)`; `e = diag(1,−1)` on `T²` | identity; conjugation by `[e]`; conjugation of `SL₂(ℤ)` by a determinant `−1` matrix (excluded: orientation reversing) | holds | none |
| §3.1–3.3, `exists_outerAction` | composition law; change of path; `f = id`, `δ = σ`; shear on `T²` | `f_δ(g_ε γ) = δ·fε·fgγ·fε̄·δ̄`; `f_{δ'} = conj[δδ̄']∘f_δ`; `id_σ = conj[σ]⁻¹`; shear columns `(1,1),(0,1)` | homomorphism for `f * g = f ∘ g`; pinned by the `∀ δ` clause | none |
| §3.5 action, coverings, non-descent | torus shear `M = [[1,0],[1,1]]`, `ρ = v mod 3`; `(0,3)`, `S₃`; `(1,0)` | `M(ker ρ) = {b ≡ a}` = `ker(ρ∘M⁻¹)`; `(12)(23)(12) = (13) ≠ (23)`; `ℤ²`: both sides true; Burnside `(36+12+18)/6 = 11` | holds; LandesmanLitt2024 lines 41–50, 473–475 support the cited remark and index `n!` | none |
| §4.3 surface groups | `(1,0)`, `(0,3)`, `(0,0)`, `(1,1)` | commuting pairs; `G²` with `ρ(p₃) = (ρ(p₁)ρ(p₂))⁻¹`; a point; `G²` (rank `2g+n−1 = 2`) | holds; Sikora2012 lines 420–421 (Remark 24) | none |
| §5.2 uniqueness of the `ℝ`-form | `(𝔾_m, id)` and `(𝔾_m, inv)`; `z ↦ 2/z̄` | same conjugation `z ↦ z̄`, unique `α = inv`; `1 ↦ 2`, not an automorphism | holds; BCGGO2024 lines 467–470, 475–481 match | none |
| §5.3 polar decompositions | `SO(2)` conjugated by `[[1,1],[0,1]]`; `SL₂(ℝ)` | image `[[c+s,−2s],[s,c−s]]`; column lengths `1+s(2c+s)`, `1+2s(2s−c)`; `K = {±1}`, `𝔭 = 0` | transpose-stability is needed; BohmLafuente2021 lines 52–62 | none |
| §5.4 definition `IsRealReductiveLinearGroup` | `GL(V)`; `SO(V)`; unitriangular `N`; `{2^k}` on `ℝ`; irrational line; finite `G ⊂ O(V)` | yes; yes (`𝔭 = 0`); no (`K exp 𝔭 = 1`); no (`𝔭 = 0`, `K = 1`); not closed; yes | determines the object; equals LieGroupsPartII §7.1's class (`p^m ∈ G⁰` gives `X ∈ 𝔭`) | none |
| `minimalVectors_eq_normMinimizers` | `ℝ_{>0}` on `ℝ²`; `V = 0`; compact `G` | `d'(0) = 2⟨Av,v⟩`, `d'' ≥ 0`; `M = {|x| = |y|}` both sides; `{0}`; `M = V` both sides | holds; Lemma 5.1 at BohmLafuente2021 line 417 | none |
| `isClosed_linearOrbit_iff`, `linearOrbit_inter_minimalVectors` | `v = 0`; `ℝ_{>0}` scaling on `ℝ`; hyperbola action | `{0}` closed, `0 ∈ M`; half-line not closed, misses `M = {0}`; branch meets `M` in one point `= K w` | holds; Theorem 1.1 (i) at lines 79–80 | none |
| `exists_tendsto_closed_linearOrbit`, `existsUnique_closed_linearOrbit` | `(ℝ_{>0})²` on `ℝ²`, `v = (1,1)` | `diag(−1,0)`: limit `(0,1)`, orbit not closed; `diag(−1,−1)`: limit `0`, closed; only closed orbit in the quadrant is `{0}` | holds; lines 81–83, 568, 580–583 | none |
| §6.1 `IsReductiveRep` | trivial `ρ`; unipotent in `SL₂(ℝ)`; `diag(2,3)`; `GL₁` | semisimple; nontrivial unipotent `Ad`, not semisimple; eigenvalues `1,1,2/3,3/2`; always | BCGGO2024 lines 2708–2711 | none |
| §6.2 scalar extension | rotation on `ℝ²`; `[[1,1],[0,1]]`; `W_ℝ ⊗ ℂ` | irreducible over `ℝ`, two characters over `ℂ`; neither; `W ⊕ W̄` | holds; Sikora2012 lines 262–266 | none |
| §6.6 closed real orbit iff closed complex orbit | rotation, unipotent, `diag(2,1/2)` in `SL₂(ℝ)` | closed/closed; neither (identity in closure); closed/closed | holds | none |
| §6.7, `isReductiveRep_tfae` | `𝐆 = 1`; `Γ = ℤ` into `SO(1,1)⁰`; non-open `G = N ⊂ SL₂(ℝ)`, `ρ(1)` unipotent | all four true; all true; (a) false but `N`-orbit a point, closed | holds; `hG : IsOpen` is used | none |
| §7.1, `characterVariety_t2_locallyCompact_secondCountable` | `Γ = 1`; `Γ = ℤ`, `SL₂(ℝ)`; free of infinite rank, `ℝ^×` | point; tripod of semisimple classes (two elliptic arcs, one hyperbolic ray at `±1`), Hausdorff; `(ℝ^×)^ℕ` not locally compact | holds; `Group.FG` is used | none |
| §7.2, `characterVariety_universalHausdorffQuotient` | `Γ = ℤ`, `GL₂`, unipotent; `𝔾_m` on `𝔸¹`; `C₂` over `𝔽₂` | `q(ρ) = q(1)`; coinvariants `k`; `𝔽₂[x²] ≠ 𝔽₂[x]`. `q` is pinned: continuity and T2 force `q(ρ) = [ρ_ss]` | holds; Sikora2012 lines 823–837 | none |
| §7.3 functoriality | `SO(2) ⊆ SL₂(ℝ)`; `⟨a⟩ ≤ F₂`; `ℤ ↠ ℤ/2` | torus image reductive; restriction not reductive (infinite index); closed subset of order ≤ 2 classes | holds; Sikora2012 line 268 (Corollary 9) | none |
| §7.4, `exists_outAction_characterVariety` | `𝔾_a`, `Γ = ℤ`; `Γ = ℤ`, `SO(2)` | `x ↦ −x` on `ℝ`; complex conjugation, fixed points `±1`; `(φψ)·[ρ] = φ·(ψ·[ρ])` | holds | none |
| §7.5 trace coordinates | `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]` | `(2,2,3)`; Vieta `(2,2,1)`; `[φ]`: `(2,3,4)`; right move `(2,1,2)`; commutator trace `3` four times; `tr(ABA⁻¹B⁻¹) = 3` directly | holds | none |

- Source locators checked against the text: 49 distinct, in LandesmanLitt2024 (3), BCGGO2024 (6), Sikora2012 (10), BohmLafuente2021 (21) and BateMartinRohrle2005 (9); all correct.
- Library declarations located at the pins: 38 Tau Ceti and 10 Mathlib declarations of the contracts, none missing; 15 opened and read, among them `Topology/Homotopy/Isotopy/Basic.lean` lines 163 and 176 (`AmbientIsotopy`, `ext`), `Algebra/AlgebraicGroup/Tangent/Adjoint.lean` line 183, `Algebra/AlgebraicGroup/Reductive/Image.lean` line 44, `AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean` lines 44–85. Mathlib has no topology on `Γ →* G`.
- Cross-roadmap citations resolved: 37 sections or paragraphs at 10 open heads (8 suppliers, 2 comparisons; the TeichmullerGeometry names of §§0.0b–5.4a occur in its README) and 10 roadmaps on main; none missing.
- Gate: every check passes. Dependency check: `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder changed.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 warnings, all ``declaration uses `sorry` ``. One-tactic probe (`rfl`, `simp`, `infer_instance`, `constructor <;> simp`) on a scratch copy closes none of the 13 theorems.
- Signatures: the 24 elaborated types were compared with the README; none lost a binder (`FiniteDimensional`, `Group.FG`, `IsOpen`, `CompactSpace`, `T2Space`, `PathConnectedSpace` all present).
- Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, LieGroupsPartII, GroupActionsOnRiemannSurfaces, MordellLawrenceVenkatesh, ReductiveGroups, AdelicAlgebraicGroups, GeometricTopology. Fixed-determinant `R_r(Γ)_χ`, `M_r(Γ)_χ` and the `PMod` outer action: MappingClassGroupsAndCanonicalRepresentations §§1.4, 0.2. `OuterAut`, Dehn–Nielsen–Baer: TeichmullerGeometry §§4.2, 5.4. Covering action: MordellLawrenceVenkatesh §5.9. Self-adjoint linear groups: LieGroupsPartII §7.1. All cited; `Hom(Γ, G)` for a general affine group and `𝒳(Γ, G^ℝ)` are owned here only.
- Source independence: 12 passages compared with 5 sources, none shared beyond statements the mathematics forces (longest run 8 words, LandesmanLitt2024 line 49); largest share BohmLafuente2021, 26 of about 90 locators (repeats counted), all in §§5.3–5.4; contents compared with BohmLafuente2021 (§§1–9): independent.

## Not verifiable

- FarbMargalit2012 (waived): the locators of §§1.1, 2.1, 2.2, 2.3, 2.4, 2.5, 3.1–3.4 and Layer 2's Examples.
- RichardsonSlodowy1990 (waived): §§4, 7, 9, cited in §§5.4, 6.6, 6.7, 7.1.
- Knapp2002 (waived): Ch. VI §§1–2, in §5.1.
- Richardson1988 (uncertified): Theorem 3.6, in §6.5. Goldman1984 (uncertified): §1, in §7.1.

## Source issues

- **Misprint** in Sikora2012 at §11, p. 18 (line 836): the source cites Proposition 30 for the closed-orbit criterion; it should be Theorem 30 (line 572); affects nothing.

## For the human reviewers

- Not tested: FarbMargalit2012 (11 citing passages), RichardsonSlodowy1990 (4), Knapp2002 (1), Richardson1988 (1) and Goldman1984 (1) could not be read (waived or uncertified); wording and arrangement were not compared against them.
