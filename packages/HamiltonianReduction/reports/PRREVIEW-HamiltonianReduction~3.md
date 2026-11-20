# Review of HamiltonianReduction (pull request #2690 at 1d8f3a7)
Folder: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/`
**Verdict:** accepted

**Summary.** Accepted: no findings. Every Check and sign I recomputed agrees, both statements of `Suggested.lean` elaborate with all their hypotheses and are not padding, and both earlier findings are repaired: each headline theorem now has a theorem-level locator that supports it at the stated generality, and the supplier edges are now the pinned `AddCircle` instances and CotangentLagrangian's revised §§4.1, 4.3 and 4.7, which the description names. There are four small corrections and no format notes, none blocking: two old heading anchors that roadmaps on main still link to, §3.2 stated more narrowly than its source, missing locators for §3.0e and Layer 5's analytic targets, and a Heisenberg carrier that has no Lie group structure. The human reviewers only need to note that one cited source is unpublished lecture notes.

## C01 — The two old heading anchors that roadmaps on main link to no longer exist

A reader who follows CotangentLagrangian's or IntegrableSystems' link to "R1", or ConvexityToric's link to "R2", lands at the top of this README instead of at Layer 1 or Layer 2. On main, CotangentLagrangian's README (line 741) and IntegrableSystems' README (line 337) link to `HamiltonianReduction/README.md#r1-smooth-actions-moment-maps-and-equivariance`. ConvexityToric's README (line 542, and line 428 at its open revision) links to `#r2-coadjoint-orbits-and-kks`. The head has no element with either id. The former-numbering paragraph (lines 66–69) maps the section ids but not the anchors.

The fix is to put `<a id="r1-smooth-actions-moment-maps-and-equivariance"></a>` on its own line, followed by a blank line, before `## Layer 1: smooth actions, moment maps and equivariance` (line 109), and `<a id="r2-coadjoint-orbits-and-kks"></a>` in the same way before `## Layer 2` (line 687).

## C02 — §3.2 states singular reduction only for compact groups at zero, while the theorems it cites cover proper actions of any Lie group

As written, an implementer builds only the compact case. Singular reduction for proper actions of noncompact groups then has no owner, although §3.1 already supplies their local model. Line 1465 reads "For compact `G` and singular reduction at zero, construct the orbit-type pieces of the level and the strata of the quotient". Bates–Lerman's Theorem 7 (p. 8), Corollary 14 (p. 14) and Theorem 15 (p. 15) assume only a proper Hamiltonian action of a Lie group and a locally closed coadjoint orbit. The README's own parenthesis says so.

Two repairs would work. The section could state the orbit-type decomposition, the symplectic pieces and the local model at that generality, with compact `G` at zero as the special case. Or, if the restriction is intended, "Not claimed" could exclude the proper noncompact case and give the reason.

## C03 — The orbifold presentation and Layer 5's analytic results have no source locator

Without locators a reader cannot check these targets' hypotheses against the literature. None of the following has one:

- §3.0e, the orbifold presentation of a locally free level;
- §5.3, regularity of weakly flat connections and gauges;
- §5.4, the flat quotient as a component of `Hom(π₁Σ, K)/K`;
- §5.5, the Euler formula for `dim H¹_A`;
- §§5.9–5.10.

Layer 5's only locators are for the moment map of §5.1 (line 1587) and for the local model of §5.8 (line 1764).

For §3.0e, Cannas da Silva §24.5, pp. 150–151, gives the torus case: a regular level has finite stabilizers and an orbifold quotient. It also computes the weighted examples that the Check of §3.0e uses. Layer 5 needs theorem-level locators in a source the author can read; I have not opened any candidate.

## C04 — §2.6 names a Heisenberg carrier that has no Lie group structure at the pin

As written, an implementer cannot apply §2.1's homogeneous coadjoint orbit to the real Heisenberg group, because nothing supplies the Lie group structure it needs. §2.6 lists Tau Ceti's `TauCeti.HeisenbergGroup` in its *Needs* for the orbits and forms of "the real Heisenberg group". At the pin that is a group over a ring (`GroupTheory/SpecificGroups/Heisenberg.lean`, line 58). The only further structure is the product topology and a topological-group instance (`Topology/Algebra/Group/Heisenberg.lean`, lines 62–130). No `ChartedSpace` or `LieGroup` instance exists for it, nor for the synonym `Nil`.

The smallest repair is to add, as a step of §2.6, the analytic Lie group structure on `HeisenbergGroup ℝ`, transported through `HeisenbergGroup.equivProd`. The multiplication and inversion are polynomial in the coordinates.

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result |
|---|---|---|---|
| §2.2 KKS (sample, headline) | `SO(3)`, Heisenberg; Meinrenken Thm 7.25, p. 92 | `ω = dA/r`, area `4πr`; `dp∧dq/r₀`; Meinrenken's `ξ_O` is minus ours, form `⟨μ,[ξ,η]⟩` unchanged | holds |
| §2.3 real root data (sample) | `U(n)` pairing; Tau Ceti `FundamentalDomain.lean` 247 | `−i tr(H·iY) = tr(HY)` real; `x_j − x_k` vanish on `iℝ·1`; theorem needs `[P.IsRootSystem]` | holds, no own locator |
| §2.4 Weyl-relatedness (sample, Lean) | `SU(2)`, `X = diag(i,−i)`; AB remark after Def 4.28 p. 84, Thm 4.31(ii) p. 85 | `nXn⁻¹ = −X` computed; `Ad(T)` trivial on `𝔱`; AB: W-orbits are `𝔱` ∩ adjoint orbits | holds |
| §2.5 connected stabilizers (sample, Lean) | `U(3)`, `diag(i,i,0)`; `O(2)`; AB Lemma 4.26 pp. 83–84 | `dim Z = 5 = 3 + 2`; `O(2)` stabilizer of 0 disconnected; `SO(3)` element centralizer `O(2)` | holds |
| §2.6 model orbits (sample) | `SU(2)` basis `−iσ_a/2` | bracket `ε_abc(−iσ_c/2)`; period `4π` vs `2π`; `HeisenbergGroup ℝ` only a topological group | holds; C04 |
| §3.0 level data (sample) | circle on `ℂ`, `c = −½`; Meinrenken Prop 8.1, Thm 8.2 pp. 100–101 | `i*ω = 0`, kernel `T S = 𝔤_c·x`; `ker dμ = (𝔤x)^ω`, image `𝔤_x⁰` | holds |
| §3.0a regular reduction (sample, headline) | `ℂⁿ` at `−½`; `SO(3)` on `T*ℝ³`; Meinrenken Thm 8.3, Rem 8.4 p. 101 | `2n−2`; `6−3−1 = 2`; `dμ(ξ_M) = ξ×c ≠ 0`; source: any `G`, free proper `G_μ` | holds |
| §3.0b shifting (sample) | tangent at `[1,z]`; abelian, other sign; Meinrenken Prop 8.6 p. 102; BL Prop 11 p. 10 | `ω(ξ_M,ξ'_M) = c([ξ,ξ'])` cancels KKS term; `μ⁻¹(½) = ∅` | holds |
| §3.0d discrete quotients (sample) | `ℤ²` on `ℝ²`; `−1` on `ℝ²`; Mathlib `CompactlyGenerated.lean` 95 | `T²` area 1; origin fixed; lemma needs discrete `G`, `ContinuousConstSMul`, `CompactlyCoherentSpace` | holds, no locator |
| §3.0e locally free levels (sample) | weights `(p,q)`, `(2,2)`; CdS §24.5 pp. 150–151 | stabilizers `ℤ/p`, `ℤ/q`, 1; `ℤ/2` everywhere; CdS football `(k,ℓ)` agrees | holds; C03 |
| §3.2 singular reduction (sample) | weights `(1,−1)`; BL Thm 7 p. 8, Cor 14 p. 14, Thm 15 p. 15 | cone `|z₁|=|z₂|`, quotient `ℂ` via `z₁z₂`; BL: proper `G`, locally closed orbit | holds; C02 |
| §4.2 groupoid reduction (sample) | `SO(3)` on `T*ℝ³`, `ν ≠ 0`; LGP §§G6.3, G7.2–G7.4 on main | `dim μ⁻¹(O) = 5`, `/SO(3) = 2 = 3 − 1` | holds |
| §5.1 gauge moment map (sample) | left and right conventions; Meinrenken Thm 7.46 p. 98; CdS §§25.3–25.4 | `[ξ,A] − dξ = −d_Aξ`; both sides `∫B(a∧d_Aξ)`; Meinrenken's generator `+d_Aξ` | holds |
| §5.3 weak flat regularity (sample) | round `S²`; disjoint sphere pair | `⟨Δf,f⟩ = ‖df‖²`, kernel constants; pair: kernel dimension 2 | holds; C03 |
| §5.10 framed quotient (sample) | `U(1)`, genus `g` | `(2g−1) + 1 = 2g = dim U(1)^{2g}`; lattice `2πH¹(Σ;ℤ)` | holds; C03 |
| Flux theorem (headline) | `T²`, `A dx∧dy`; Banyaga II.1.1, II.3.1, II.3.3, p. 191, Lemme III.6.1 p. 223 | flux `A(a[dy] − b[dx])`; Banyaga `J(x) = (−x₂, x₁)` at `A = 1`: same signs | holds |
| Morse heights (headline) | `S²`, `μ = rZ`, `X = aZ`; `U(3)`; Bott Prop 11.4, Thm III pp. 271–272 | index 2 north, 0 south; `6,4,4,2,2,0`; Bott: twice the walls crossed | holds |
| Local normal form (headline) | trivial `H`, `ν = 0`, `ν ≠ 0`; `S¹` on `ℂ`; BL §2 pp. 11–13 | `−dλ = b(ξ)−a(ζ)`; `ν([ξ,ζ])`; `μ_V = −½|z|²`; BL `F_Y = g·(α+j(λ)+i(F_V))` | holds |
| §4.1 cotangent shift | left action; Ortega–Ratiu pp. 1–3 | `(p+⟨c,A⟩)(ξ^left) = 0`; their `A_left = −A`, `Ω − B_μ = ω_can + pr*β_c` | holds |
| §2a.7 `Spin(7)` | supports 1234, 1256, 1357 | sums 3456, 2457, 2367, 1467; overlaps 2 commute; `16 > 8` | holds |
| `exists_mem_normalizer_Ad_eq` | `simp_all`, `exact?`, `rfl`, `infer_instance`; `#check @` | all fail; compact, connected, `T2Space`, finite-dimensional model present | not padding |
| `isConnected_stabilizer_coadjointRepresentation` | same probes | `simp_all` no progress; `exact?` fails; binders match §2.5 | not padding |
| Earlier R01 | "Meinrenken, Theorem 8.3 with Remark 8.4, p. 101, at this generality" | every headline locator opened; each states the README's generality | repaired |
| Earlier R02 | §1a.3 cites `AddCircle.instChartedSpace`; "CotangentLagrangian §4.7" | §I2.0 gone; at #2687 §4.1 l. 958, §4.3 l. 1009, §4.7 l. 1113, "C4 is now Layer 4" | repaired |
| Earlier C01 | "R1 is Layer 1; R1a is Layer 1a and R1a.k is §1a.k" | ids mapped; anchors linked from main at three places resolve nowhere | partly; C01 |
| Earlier C02, C03 | "stated five theorems that the pin already proves"; "2a.7 Model computations and range tests" | matches the 13 removed declarations; no source claimed | repaired |

- Source locators checked against the text: 32 of the README's 33 (Cannas da Silva 9, Meinrenken 8, Banyaga 5, Bates–Lerman 4, Alexandrino–Bettiol 3, Bott 2, Ortega–Ratiu 1) and the two in `Suggested.lean`; Huebschmann (§5.8, outside the sample) was checked last round.
- Library declarations opened at the pins: Tau Ceti `EquivariantMomentMap/Basic.lean` 247, 280, 326, 355; `RootSystem/FundamentalDomain.lean` 201, 239, 247; `Lie/Subgroup/Torus.lean` 255, 272; `Hamiltonian/MomentMap.lean` 355, 388, 590, 689; `Symplectic/Manifold/Descent.lean` 78, 103; `Instances/Quotient.lean` 242, 253; `Spin/SimplyConnected.lean` 299; `TwoForm/Basic.lean` 37; both Heisenberg files; Mathlib `ProperAction/CompactlyGenerated.lean` 95, `ProperAction/Basic.lean` 113, `Dual/Lemmas.lean` 652, `LieGroup.lean` 183, `IsManifold/Basic.lean` 921.
- Cross-roadmap citations resolved: on main, SmoothBundlesConnections (9 sections), LieGroupoidsPoisson (11 ids, §G4.6A/B as targets of §G4.6), LieGroups 5A and 6, MorseTheory 2.3, 2.4, 5.1, MorseNovikov 6.4 (constructs the Lefschetz formula), DifferentialGeometry (11 items), DeRhamCohomologyAndDuality 2.4 and Layer 3, GeometricTopology 1.1, 1.3.1, 1.5, AlgebraicTopology Layer 4, 6.1, 6.4, Orbifolds O1 item 4, O2, O4, O7, ComplexKahlerGeometry 5.4, 5.7, PDE Layers 4–5, SpinGeometry 1.1, HeegaardFloer 4.1, ConvexityToric 1.1, 3.1, 4.2, SchubertGeometry 9.7; CotangentLagrangian §§4.1, 4.3, 4.7 at its open revision.
- Automatic checks: all passed. Dependency check: `depcheck: 182 roadmaps, 2075 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the two `sorry` warnings; `#check @` of both declarations shows every binder (compact, connected, Hausdorff, finite-dimensional model) explicit and matching §§2.4–2.5; nothing changed.
- Docstring's "not statable" claims checked at the pins: manifold quotients only by free properly discontinuous actions (Mathlib `Instances/Quotient.lean`, Tau Ceti `instIsManifoldQuotient`); no roots of compact Lie groups in `Geometry/Lie`; no flux or `Ham`.
- Ownership: `G/N` as a Lie group (§3.0c) is found on main nowhere and in no open roadmap pull request, so this roadmap owns it; no target restates a pinned declaration (Layer 1's group-level statements and §3.0d's nondegeneracy are absent at the pin).
- Overlap check: read ConvexityToric (main), GeometricQuantization (main), IntegrableSystems (main), CotangentLagrangian (#2687 head), the SymplecticGeometry index and HamiltonianReduction at #2696; nothing shared. ConvexityToric, GeometricQuantization, IntegrableSystems and QuantitativeOrbitMethod consume Layers 1–3; CotangentLagrangian supplies Layer 4; #2696 merges after this one.

Source independence: 31 passages compared with 7 sources (the locators above plus Conventions 1, §1.2, §3.1's model, §4.1's introduction and both `Suggested.lean` docstrings); nothing shared beyond forced formulas and statements of a dozen words. Largest share: CannasDaSilva2001, 9 of 33 locators. Contents compared with CannasDaSilva2001 (Lectures 22–25): independent. Layers 1a, 2a and 4 have no counterpart there, and the order Layer 1 → 3 → 5 is forced by §3.0's *Needs* (Layer 1) and §5.8's *Needs* (§§3.1–3.2).

Research link: Layer 1a is Banyaga's flux theorem (1978, after Calabi). Layer 3's local normal form and singular reduction are Bates–Lerman (1997, after Sjamaar–Lerman 1991). Layer 2a is Bott's Morse theory of orbits (1956). Layer 5's local model is Huebschmann (1995, after Atiyah–Bott 1983). This rests on the README's references and the texts I read.

## Not verifiable

- Banyaga1978 is an OCR text of an image scan: statements and running page numbers are legible, but formulas are partly garbled, so its formulas were not checked for misprints.

## Source issues

- **Misprint** in Meinrenken2024 at Theorem 8.3, p. 101: the source writes the defining identity with `ω` on both sides and calls `ι, π` the projection and inclusion; it should read `ι*ω = π*ω_μ`, with `ι` the inclusion and `π` the projection; affects nothing.
- **Gap** in AlexandrinoBettiol2010 at the proof of Theorem 4.31, p. 85: the source infers that `g` has finite order from compactness of `Ad(G)`; the step needs only that `Ad(g)` has finite order on `𝔱`, true because `g` normalizes `𝔱` and `W` is finite; affects the proof.
- **Error** in CannasDaSilva2001 at §25.4, Remark, p. 159: the source says the moduli space of flat connections is a finite-dimensional symplectic orbifold; it should say a stratified symplectic space, with non-orbifold singularities at reducible connections (for instance `SU(2)`, genus at least 2); affects nothing.
- **Misprint** in OrtegaRatiu2005 at formula (0.2), p. 3: the `∂/∂p_z` coefficient is written `e(B_y ẋ − B_z ẋ)`; it should be `e(B_y ẋ − B_x ẏ)`, the `z`-component of `v × B`; affects nothing.

## For the human reviewers

- Licence and status: Meinrenken2024 is unpublished lecture notes on the author's Toronto page (README line 2103). It carries 8 of the 33 locators, including the general-group statements of regular reduction and of the KKS theorem.
