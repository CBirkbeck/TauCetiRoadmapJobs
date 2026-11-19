# Review of SurfaceGroupCharacterVarieties (pull request #2430 at 9f6200e)

**Verdict:** accepted

**Summary.** Accepted: the whole roadmap was reviewed again at this head and no statement, Check, proof sketch or Lean signature was found false, unsupported or unowned. Every locator into the five readable sources holds, every cited supplier section and pinned declaration exists and says what is claimed of it, and the Lean file elaborates with `sorry` as its only warning. There is one small correction (a Check whose "so" does not follow) and one format note, neither blocking. The locators into the five waived or uncertified texts could not be compared and are listed for the human reviewers.

## C01 — The Check of §2.2 exhibits one class of `Mod_{0,2}` that swaps the punctures; it does not show that the group has two elements

In the first Check of §2.2 (line 399) the text concludes "so `Mod_{0,2}` has two elements and `PMod_{0,2}` is trivial". The computation before it, that `(θ, s) ↦ (−θ, −s)` extends to a rotation exchanging `N` and `S`, shows only that the permutation map onto `Sym(P)` is onto, so the order is at least two. That the kernel is trivial (an orientation-preserving homeomorphism of the open annulus fixing both ends is isotopic to the identity) is a separate fact, which nothing in the Check proves. The third Check of §2.3 then uses "`Mod_{0,2}` has order two" to get that `σ` is an isomorphism, and Layer 2's Examples cite "§2.2's Check" as the source of `Mod_{0,2} ≅ ℤ/2`, so the order is supported only by this "so".

The statement is true; only its support is missing. The smallest change: in §2.2 write that the class is nontrivial and maps to the transposition, and state the triviality of `PMod_{0,2}` with its own reason or locator (as the Examples do for `Mod_{0,0}` and `Mod_{0,1}`), and let §2.3's Check and the Examples point there.

## N01 — The locator of §1.3's non-descent theorem points at a remark, not at the theorem

In §1.3 (line 252) and in the docstring of `exists_outAction_iff_commute`, the equivalence "descends to `Out(Γ)` exactly when every homomorphism has commutative image" carries the locator "LandesmanLitt2024, §1.1, Definition 1.1.1 and the paragraph after it". That paragraph (LandesmanLitt2024 lines 47–50) only remarks that `Mod_{g,n}` does not naturally act on the representation variety; the equivalence is the roadmap's own. §3.5 already words this correctly ("the remark after it that …"); the same wording in §1.3 and the docstring would do.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 `Inn(Γ) ≃ Γ/Z(Γ)`, transport of `Out`, inner `e` trivial | `Q₈`, `ℤ`, `S₃`; `e = conj g` | `8/2 = 4`, `24/4 = 6`; `Inn(ℤ) = 1`; `eφe⁻¹(x) = gφ(g)⁻¹φ(x)φ(g)g⁻¹ = φ∘conj(φ⁻¹(g)g⁻¹)(x)` | holds | none |
| §1.2 `Rep(Γ, H)` | `Rep(ℤ, S₃)`; `Rep(ℤ/2, GL₂(ℂ))`; `H = 1` | 3 classes against 6 homomorphisms; eigenvalue multisets `{1,1},{1,−1},{−1,−1}`; one point | holds | none |
| §1.3, `exists_outAction_iff_commute` | `ℤ²` witness; `F₂`, `ρ = id`; `Γ = 1`; both directions | `(φψ)⁻¹ = [[1,−1],[−1,2]]`, `(ψφ)⁻¹ = [[2,−1],[−1,1]]`; `conj a · id = conj a⁻¹ ≠ id`; `ρ(γ⁻¹δγ) = ρ(δ)` forces centrality | iff holds, left action | none |
| §2.2, `existsUnique_homeomorph_extension` | `P = ∅`; `X = P = {p}`; `[0,1]`, `P = {0,1}`; `S¹`, two points; wedge of two spheres at `p` | `e = h`; `U∖{p} = ∅`, hypothesis fails; flip extends, swaps ends; punctured arcs disconnected, fails; fails | holds; `Pᶜ` dense gives uniqueness | none |
| `existsUnique_ambientIsotopy_extension` | `S²`, `P = {N}`; cluster set of `I × (U∖{p})` | connected subset of `I × P` meeting every slice is `I × {q}`; slice `t = 0` gives `q = p`; tube lemma gives continuity | holds | none |
| §2.3 permutation map `σ` | `n = 0, 1`; `(0,3)`; `(0,2)` | index `1 = 0! = 1!`; `S₃`, index `6 = 3!`; onto `Sym(P)` of order 2 (order exactly 2 not shown by the Check) | holds | C01 |
| §2.4 standard model | words `aba⁻¹b⁻¹`, `aabb`, `aa⁻¹`, `aa`; `nonorientable 5 0` | `d₂ = 0`, `H₂ = ℤ`, `H₁ = ℤ²`; `d₂ = 2a+2b`, `H₁ = ℤ ⊕ ℤ/2`; two vertices, `H₁ = 0`; `d₂ = 2a`; `H₁ = ℤ⁴ ⊕ ℤ/2` | holds | none |
| §3.1 `f_δ` and its laws | change of path; composition; inverse; `f = id`, `δ = σ` | `f_{δ'}[γ] = [δ'δ̄(δ fγ δ̄)δδ̄']`, `u = δδ̄'`; `δ·fε·fgγ·fε̄·δ̄`; `δ ⬝ f(rev(f⁻¹δ)) ≃ const`; `id_σ = conj[σ]⁻¹` | holds; `mul_def` at the pin is `p * q = q.trans p` | none |
| §3.2 inner-automorphism lemma | `f = id`; point push; torus translation | `g_{δη}[γ] = [δ η gγ η̄ δ̄] = [δ fγ δ̄]`; `f_η = 1` so `f_δ = conj[η δ̄]`; `f_const = conj[α]`; trivial on `ℤ²` | holds | none |
| §3.3, `exists_outerAction` | `S¹`; torus shear; `[0,1]`; `Homeomorph` product | `ℤ/2 ≅ Out(ℤ)`; columns `(1,1),(0,1)`; `π₁ = 1`, two classes; `(f * g) x = f (g x)` by `rfl` at the pin | homomorphism, pinned by the `∀ δ` clause | none |
| §3.4 DNB and `H₂` | torus; sphere; reflection `z ↦ e^{2πi/g} z̄` on the `4g`-gon | `det A` on `Λ²ℤ²`, image `SL₂(ℤ)`; `Out(1) = 1` against order 2; arc `j ↦ 3 − j`, `t ↦ 1 − t`, pairs `(4i,4i+2) ↦ (4j+3,4j+1)`, `j ≡ −i` | holds; `ε_f³ = ε_f` | none |
| §3.5 action, coverings, non-descent | torus shear `M = [[1,0],[1,1]]`, `ρ = v mod 3`; `(0,3)`, `S₃`; `(1,0)`; set-lift | `M(ker ρ) = {b ≡ a}` = `ker(ρ∘M⁻¹)`; `(12)(23)(12) = (13)`; both sides true; `(36+12+18)/6 = 11` | holds | none |
| §4.3 commutator pinned | `S₃` tuple `((23),(12),(23),(132))`; `(1,1)`; `(0,3)` | `[A₁,B₁] = (123)`, `[A₂,B₂] = (132)`, product 1; other commutator gives `(123)(123) = (132)`; transported tuple satisfies the other relator; `G²`; `G²` | holds | none |
| §5.1 real reductive data | `SO(p,q)`; `PGL₂`; `Res_{ℂ/ℝ} GL_n`; `𝔾_a` | two components for `p, q ≥ 1`; `PSL₂(ℝ) = PGL₂(ℝ)⁰`; `dim_ℝ = 2n²`; excluded, unipotent | holds; BCGGO2024 lines 466–474 | none |
| §5.2 `ℝ`-forms | `GL₂`, `τ = J ḡ J⁻¹`; `(𝔾_m, id)`, `(𝔾_m, inv)`; `z ↦ 2/z̄` | fixed set `[[a,−b̄],[b,ā]]` recomputed; same conjugation, unique `α = inv`; `1 ↦ 2` | holds; BCGGO2024 lines 475–481 | none |
| §5.3 polar decompositions | `SO(2)` conjugated by `[[1,1],[0,1]]` | image `[[c+s,−2s],[s,c−s]]`; column lengths `1+s(2c+s)`, `1+2s(2s−c)`; `K = {±1}`, `𝔭 = 0` | transpose-stability needed | none |
| §5.4 `IsRealReductiveLinearGroup`, `symmetricPart`, `minimalVectors` | `GL(V)`; `SO(V)`; unitriangular `N`; irrational line in `U(1)²`; `V = 0` | `M = {0}`; `𝔭 = 0`, `M = V`; `K exp 𝔭 = 1 ≠ N`; `K = G`, not closed; `M = {0}` | determines the object; BohmLafuente2021 lines 52–62 | none |
| `minimalVectors_eq_normMinimizers` | `ℝ_{>0}` on `ℝ²` by `(λx, λ⁻¹y)`; compact `G` | `d'(0) = 2⟨Av,v⟩`, `d'' ≥ 0`; both sides `{|x| = |y|}`; both `V` | holds; Lemma 5.1, line 417 | none |
| `isClosed_linearOrbit_iff`, `linearOrbit_inter_minimalVectors` | `v = 0`; scaling on `ℝ`; hyperbola branch | `{0}` closed, in `M`; half-line not closed, misses `M = {0}`; branch meets `M` in `K w`, one point | holds; Theorem 1.1 (i), lines 79–80 | none |
| `exists_tendsto_closed_linearOrbit`, `existsUnique_closed_linearOrbit` | `(ℝ_{>0})²` on `ℝ²`, `v = (1,1)` | `diag(−1,0)`: limit `(0,1)`, orbit not closed; `diag(−1,−1)`: limit `0`, closed; only closed orbit `{0}` | holds; lines 81–83, 568 | none |
| §5.4 (v) separation | `𝔱 = ℝ·diag(1,−1)`, two hyperbola branches | function is `0` and `1` on the branches, tends to `1/2` as `xy → 0`; weights `(1/2,1/2)` forced | holds; Corollary 5.5, line 445 | none |
| §6.1 `IsReductiveRep` | trivial `ρ`; unipotent in `SL₂(ℝ)`; `diag(2,3)`; `GL₁` | semisimple; nontrivial unipotent `Ad`; eigenvalues `1,1,2/3,3/2`; always | BCGGO2024 lines 2708–2711 | none |
| §6.2 scalar extension | rotation on `ℝ²`; `[[1,1],[0,1]]`; `W_ℝ ⊗ ℂ` | irreducible over `ℝ`, two characters over `ℂ`; neither; `W ⊕ W̄` via `(zw, z̄w)` | holds; Sikora2012 lines 262–266 | none |
| §6.3 adjoint semisimplicity | torus; unipotent of `SL₂`; `N(T)`; `O₂` | weight spaces; not semisimple; `Z⁰ = T`; `ker Ad = SO₂ ≠ {±1}` | holds; BateMartinRohrle2005 lines 183–187, 814–815 | none |
| §6.4 complete reducibility, finite generation | `(diag(2,1/2), [[1,1],[0,1]])`; `N(T)`; `𝔾_a` over `𝔽̄_p` | orbit dimension 3 to 2, fixed space `0` to `𝔱`; two generators; finitely generated subgroups finite | holds; lines 263–267, 300–309, 861–879 | none |
| §6.5 closed complex orbits | `Γ = ℤ`, `GL_n`; Borel-dense pair in `SL₂` | closed iff semisimple; limit `(diag(2,1/2), 1)` outside the orbit | holds; Sikora2012 lines 572–586, BateMartinRohrle2005 line 510 | none |
| §6.6 closed real orbits | rotation, unipotent, `diag(2,1/2)` in `SL₂(ℝ)`; the polar step | closed/closed; neither; closed/closed; `τZ = −Ad(u)Z` gives `exp(τZ/2) u exp(Z/2) = u` | holds | none |
| §6.7, `isReductiveRep_tfae` | `𝐆 = 1`; non-full open `G^ℝ ⊂ 𝐆(ℝ)`; `π₁(Σ₂)` with one unipotent | all true; a closed `𝐆(ℝ)`-orbit is a finite union of open `G^ℝ`-orbits; all fail | holds; `hG`, `Group.FG` present | none |
| §7.1, `characterVariety_t2_locallyCompact_secondCountable` | `Γ = 1`; `Γ = ℤ`, `SL₂(ℝ)`; infinite rank, `ℝ^×` | point; unipotent class absent, naive quotient not Hausdorff; `(ℝ^×)^ℕ` not locally compact | holds | none |
| §7.2, `characterVariety_universalHausdorffQuotient` | `𝔾_m` on `𝔸¹`; `C₂` over `𝔽₂`; `q` pinned? | coinvariants `k`; `𝔽₂[x²] ≠ 𝔽₂[x]`; continuity and T2 force `q(ρ) = [ρ_ss]`, `q` onto so `F'` unique | holds; Sikora2012 lines 823–837 | none |
| §7.3 functoriality | `SO(2) ⊆ SL₂(ℝ)`; `⟨a⟩ ≤ F₂`; `ℤ ↠ ℤ/2` | torus image reductive; restriction not reductive; closed subset of order ≤ 2 | holds; Sikora2012 line 268 | none |
| §7.4, `exists_outAction_characterVariety` | `𝔾_a`, `Γ = ℤ`; `SO(2)` | `x ↦ −x`; complex conjugation, fixed `±1`; `(φψ)·[ρ] = φ·(ψ·[ρ])` | holds; BCGGO2024 lines 2714–2718 | none |
| §7.5 trace coordinates | `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]` | `(2,2,3)`; Vieta `(2,2,1)`; `[φ]`: `(2,3,4)`, `A·AB = [[3,2],[1,1]]`; right move `(2,1,2)`; commutator trace 3 each time | holds | none |

- Source locators checked against the text: 47 distinct, in LandesmanLitt2024 (3), BCGGO2024 (4), Sikora2012 (10), BohmLafuente2021 (21) and BateMartinRohrle2005 (9); all hold.
- Library declarations: 12 Mathlib names elaborated with `#check` at the pin (among them `FundamentalGroup.mul_def`, `QuotientGroup.congr`, `groupHomology.map`), 2 conventions proved by `rfl`; 40 Tau Ceti names located, 12 opened, among them `Topology/Homotopy/Isotopy/Basic.lean` line 163, `Topology/Homotopy/Isotopy/Compact.lean` line 123, `Algebra/AlgebraicGroup/Reductive/Basic.lean` line 71, `Topology/Algebra/PointTopology/Basic.lean` lines 83, 110 and 261, `Algebra/Bialgebra/ComoduleAlgebra/LinearlyReductive.lean` line 148.
- Cross-roadmap citations resolved: MordellLawrenceVenkatesh §§5.1, 5.4–5.6, 5.9, 5.15, 5.17, 5.19, 5.22, TeichmullerGeometry §§0.0e, 0.0f, 0.0h, 4.2, 4.3, 5.4, 5.4a, MappingClassGroupsAndCanonicalRepresentations §§0.1, 0.2, 1.4, 2.1 and NonabelianLevelStructures §§5.1, 5.2 read at their open heads; 14 roadmaps on main (26 sections or paragraphs); none missing.
- Earlier findings: the previous review made none; nothing to repair.
- Automatic checks: all pass. Dependency check: `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder changed.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 warnings, all ``declaration uses `sorry` ``. One-tactic probe (`rfl`, `simp`, `infer_instance`, `constructor <;> simp`, `tauto`) on a scratch copy closes none of the 13 theorems.
- Signatures: the 24 elaborated types were compared with the README; none lost a binder (`CompactSpace`, `T2Space`, `FiniteDimensional`, `Group.FG`, `IsOpen`, `PathConnectedSpace` present). The three declared supplier gaps are stated in the README with their suppliers and are provided nowhere on main or at the pins.
- Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, MordellLawrenceVenkatesh, GroupActionsOnRiemannSurfaces, NonabelianLevelStructures, LieGroupsPartII, RealSemisimpleLieGroups, AdelicAlgebraicGroups. `R_r(Γ)`, `M_r(Γ)`, the `PMod` outer action and MCG-finiteness: MappingClassGroupsAndCanonicalRepresentations §§1.4, 0.2, 2.1. `OuterAut`, Dehn–Nielsen–Baer: TeichmullerGeometry §§4.2, 5.4. Covering action: MordellLawrenceVenkatesh §5.9. Self-adjoint linear groups: LieGroupsPartII §7.1. Rank-two character scheme: NonabelianLevelStructures §5.1. All cited; `Hom(Γ, G)`, the real Kempf–Ness theorem and `𝒳(Γ, G^ℝ)` are owned here only.

Source independence: 16 passages compared with 5 sources, none shared beyond statements the mathematics forces (longest run 8 words, BohmLafuente2021 line 83); largest share BCGGO2024 and Sikora2012, 13 each of 71 locators; contents compared with Sikora2012 (§§1–14) and BCGGO2024: independent.

Research link: Layer 7's `𝒳(Γ, G^ℝ)` is the character variety of Bradlow–Collier–García-Prada–Gothen–Oliveira 2024 (Definition 8.1) and the space on which Landesman–Litt 2024 study finite mapping-class orbits (Definition 1.1.1); Layer 5 is the real Kempf–Ness theorem of Richardson–Slodowy 1990 and Böhm–Lafuente 2021. Rests on the README and these sources.

## Not verifiable

- FarbMargalit2012 (waived): the locators of §§1.1, 2.1, 2.2, 2.3, 2.4, 2.5, 3.1–3.4 and Layer 2's Examples.
- RichardsonSlodowy1990 (waived): §§4, 7, 9, cited in §§5.4, 6.6, 6.7, 7.1.
- Knapp2002 (waived): Ch. VI §§1–2, in §5.1.
- Richardson1988 (uncertified): Theorem 3.6, in §6.5 (Sikora2012 line 586 cites the same theorem for the same step). Goldman1984 (uncertified): §1, in §7.1.

## Source issues

- **Misprint** in Sikora2012 at §11, p. 18 (line 836): the source cites Proposition 30 for the closed-orbit criterion; it should be Theorem 30 (line 572); affects nothing.
- **Error** in BCGGO2024 at §2.3, p. 10 (lines 471–472): the source says `SO(p,q)` has two components whenever `p` or `q` is nonzero; it should be when both are nonzero, `SO(n)` being connected; affects nothing.
- **Misprint** in BohmLafuente2021 at Corollary 5.2, p. 9 (line 422): the source says the quantifier "for all `t ∈ ℝ`" twice in one sentence; it should be once; affects nothing.

## For the human reviewers

- Not tested: FarbMargalit2012 (11 citing passages), RichardsonSlodowy1990 (4), Knapp2002 (1), Richardson1988 (1) and Goldman1984 (1) could not be read (waived or uncertified); wording and arrangement were not compared against them.
