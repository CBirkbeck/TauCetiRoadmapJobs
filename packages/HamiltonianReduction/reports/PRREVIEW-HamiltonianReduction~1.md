# Review of HamiltonianReduction (pull request #2690 at ebc4543)
Folder: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/`
**Verdict:** needs changes

**Summary.** Needs changes. The mathematics holds: every Check and formula I recomputed (KKS areas and signs, the Morse indices, the flux signs, the shifting and cotangent signs, the gauge moment map, the dimension counts) agrees, and both statements of `Suggested.lean` are true, elaborate, and are not padding. The two findings are about support, not truth. First, no headline theorem has a locator in a source that states it as written: the flux theorem and the coadjoint-orbit theorems cite nothing, regular reduction is cited to a theorem that assumes a compact group at level zero, and the local normal form is cited to a paper with no section or theorem number. Second, two supplier citations (IntegrableSystems §I2.0, CotangentLagrangian C4) break when those roadmaps' open revisions merge. There are also three small corrections and no format notes; the human reviewers only need to note two sources that could not be read.

## R01 (P2) — No headline theorem has a locator in a source that states it as written

A reader cannot check the hypotheses of the roadmap's main results against the literature, and an implementer cannot tell which generality a proof in the literature covers. The README has 14 source locators, all in Layers 1, 3, 4 and 5. Layer 1a (the flux theorem, its topological and compactly supported forms, the torus flux group), Layer 2 (the KKS theorem, the closed-chamber classification, connected coadjoint stabilizers) and Layer 2a (Morse heights, `χ(O_μ) = |W / W_μ|`) cite no source anywhere. Bröcker–tom Dieck appears only in the two `Suggested.lean` docstrings, as "Chapter IV", and not in the References. Where a source is cited, the locator is not exact or does not support the statement as written:

- §3.0a (line 1158) cites "Cannas da Silva, Lectures on Symplectic Geometry, §§22–25" for the Marsden–Weinstein–Meyer theorem for an arbitrary Lie group `G` at a regular value `c` with `G_c` free and proper. Cannas da Silva's Theorem 23.1 (p. 141) assumes `G` compact, the level `0` and a free action. §24.4 (pp. 149–150) reaches other levels only through the shifted product `M × O⁻`, again for compact `G`.
- §3.1 and §3.2 cite Sjamaar–Lerman with no section or theorem. §1.2, §1.3, the Layer 3 introduction and §4.1 cite Marsden–Ratiu's "momentum-map chapters" and "cotangent-reduction chapters" with no chapter number. Layer 5 cites Atiyah–Bott with no section.

The fix is to give each headline target a theorem-level locator in a source that states it at the README's generality. Where the cited source assumes more (Cannas da Silva's compact `G`), either cite it for the compact case together with a second source for the general one, or say in the sentence that the general case has the same proof. Candidate sources follow; I have not opened these locators. For reduction at a regular value with `G_μ` free and proper: Marsden–Weinstein (Rep. Math. Phys. 5, 1974). For the flux theorem: Banyaga (Comment. Math. Helv. 53, 1978), or McDuff–Salamon's chapter on the group of symplectomorphisms. For §§2.4–2.5: Bröcker–tom Dieck, Chapter IV, with theorem numbers. For the normal form of proper actions of noncompact groups: Marle (1985) or Guillemin–Sternberg (1984). Cannas da Silva's Homework 17 (p. 139) already uses §2.2's conventions: `⟨X^# ξ, Y⟩ = ⟨ξ, [Y, X]⟩` and `ω_ξ(X, Y) = ⟨ξ, [X, Y]⟩`.

## R02 (P2) — Two supplier citations break when their suppliers' open revisions merge

§1a.3 and the contracts would then point at ids that no longer exist. The citations are: §1a.3 (lines 455, 466), its Dependencies (line 664), Scope (line 1871) and the contract heading (line 2017), all citing IntegrableSystems §I2.0; and §1a.2, §1a.4, §3.1, Scope and the contracts (lines 412, 440, 574, 591, 637, 1382, 1394, 1407, 1453, 1869, 2007), citing CotangentLagrangian C4.

- **IntegrableSystems §I2.0.** At the head of IntegrableSystems' open revision (#2691) the content is "§2.0 Positive-period circles and families". The string "I2.0" occurs nowhere, and there is no former-numbering sentence.
- **CotangentLagrangian C4.** At the head of CotangentLagrangian's open revision (#2687), C4 is "Layer 4: relative symplectic germs" (§§4.1–4.8). Again "C4" occurs nowhere and there is no former-numbering sentence. That revision's own consumer list (its line 1178) already describes this roadmap's use as §§4.1–4.3.

The Orbifolds citations (O1.4, O2.4, O4.2) are safe, because Orbifolds' open revision (#2624) maps its old ids.

For §I2.0 the smallest fix is to drop the edge: what §1a.3 takes from it is already at the pins. `AddCircle p` as an analytic manifold and Lie group for every `p > 0` is Tau Ceti's `AddCircle.instChartedSpace`, `AddCircle.instIsManifold` and `AddCircle.instLieAddGroup` (`TauCeti/Geometry/Manifold/Instances/AddCircle.lean`, lines 254–388). The torus product is Mathlib's `IsManifold.prod` (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean`, line 921) and `Prod.instLieAddGroup` (`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`, line 183). Citing these also removes the two-way citation between this roadmap and IntegrableSystems, which consumes Layers 1 and 3 here (its README on main, lines 20 and 337).

For C4, cite both numberings, e.g. "CotangentLagrangian C4 (§§4.1–4.3 and §4.7 in its revised numbering)", and name that revision in the description's merge-order paragraph.

## C01 — The README drops the R-numbering that roadmaps on main cite, without saying where it went

Roadmaps on main cite this one as R1, R1a.k, R2, R2a.2–4, R3, R3.1, R4 and R5, and through the anchors `#r1-smooth-actions-moment-maps-and-equivariance` and `#r2-coadjoint-orbits-and-kks`. The citing roadmaps are ConvexityToric (e.g. lines 32, 390, 542), GeometricQuantization, LieGroups Layer 6, LieGroupoidsPoisson §§G4.6B and G7.2–G7.4, SchubertGeometry §9.7, Orbifolds, IntegrableSystems (line 337) and CotangentLagrangian (line 741). The family's own `README.md` (lines 66–80) and `STATUS.md` (line 32) do too.

The head has no R-label and no former-numbering sentence, yet the description says that existing citations such as "R1a.3" "still resolve". Lines 1118–1119 ("…numbered `3.0` and `3.0a`–`3.0e` so that §3.1 and §3.2 keep their numbers") could become that sentence. For example: "In the numbering other roadmaps cite, R1 is Layer 1, R1a.k is §1a.k, R2 is Layer 2, item k of R2a is §2a.k, R3 is Layer 3 with R3.1 and R3.2 unchanged, R4 is Layer 4 and R5 is Layer 5."

## C02 — The description undercounts the theorems removed from `Suggested.lean`

The description says the old file "stated four theorems that the pin already proves: the bracket identity, the cotangent moment map, and existence and uniqueness of descended forms. All of these are removed." Five sorried theorems are removed. The fifth, `equivariantMoment_infinitesimal`, says that a group-level moment map has smooth Hamiltonian components; it is at the pin as `IsEquivariantMomentMap.toIsMomentMap`. Suggested text: "stated five theorems that the pin already proves: the bracket identity, that a group-level moment map is an infinitesimal one, the cotangent moment map, and existence and uniqueness of descended forms."

## C03 — §2a.7's heading credits its items to a source it does not name

"Source exercises and range tests" (line 1052) tells the reader the items come from a source, but no source or locator is given anywhere in §2a.7. Either name the source with locators, or retitle the section, for example "Model computations and range tests". See also the second question below.

## Questions for the author

- Does Sjamaar–Lerman (1991) state the local normal form at the generality of §3.1 and the overview: proper actions of noncompact, possibly disconnected groups, at `ν = μ(p) ≠ 0`, with the `𝔪*` factor? The secondary descriptions I found place the paper in the compact-group setting. I could not read it: the Annals page links only to JSTOR.
- Which source are §2a.7's "source exercises" from? Are its items (the lower-triangular trace-pairing model of the Heisenberg dual, the `SO(3)`, `SU(2)` and `U(n)` normalizations, the `Spin(7)` subgroup) that source's exercises? A source's exercise list reproduced as targets would need restating in the roadmap's own form. No source is named, so I could not compare.
- Which chapters of Marsden–Ratiu, *Introduction to Mechanics and Symmetry*, does §4.1 mean for cotangent reduction with the magnetic term at invariant and non-invariant values? I could not read the book (paywalled), and the README gives no chapter.

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result |
|---|---|---|---|
| Headline: regular reduction (§3.0a) | `S¹` on `ℂⁿ`, `c = −½`; `SO(3)` on `T*ℝ³`, `c ≠ 0` | `dim Q = 2n − 2` / `2n − 1 − 1`; `6 − 3 − 1 = 2`; `dμ(ξ_M) = ξ × c ≠ 0`, level not coisotropic | holds |
| Headline: flux theorem (§§1a.0–1a.3) | `T²`, `ω = A dx ∧ dy`; loops `(x+t, y)`, `(x, y+t)` | flux `A[dy]`, pairing `A` = swept area `A`; `−A[dx]`; `A = 2`: period 1 ∉ 2ℤ | holds |
| Headline: KKS (§2.2) | `SO(3)`, Heisenberg, sharp convention | `ω = dA / r`, area `4πr`; `ω = dp ∧ dq / r₀`; `π♯dℓ_ξ = −ξ_O`, both sides `ν([ξ, η])` | holds |
| Headline: chamber, connected stabilizers (§§2.4–2.5, both Lean statements) | `SU(2)`, `SO(3)`, `U(3)`, `O(2)` | `n = [[0,1],[−1,0]]`: `X ↦ −X`, `Ad(T)` trivial on 𝔱; `dim Z(diag(i,i,0)) = 5 = 3 + 2`; `O(2)` stabilizer of 0 disconnected | holds |
| Headline: Morse heights (§§2a.2–2a.5) | `S²` radius `r`, `X = aZ`; `U(3)` regular and `diag(i,i,0)` | Hess `−a/r` (tangent), `−ar` (quotient); indices `2, 0`; `6,4,4,2,2,0`; `3 · χ(ℂP¹) = 6` | holds |
| Headline: local normal form (§3.1) | trivial `H`, `ν = 0` and `ν ≠ 0`; fixed point of `S¹` on `ℂ` | `−dλ = b(ξ) − a(ζ)`; `ν([ξ, ζ])` term; `μ_V = ½ω(iz, z) = −½|z|²` | holds |
| §1.2 component criterion | `O(2)` on `T*S¹`, `μ + c` | reflection: `−p + c` vs `Ad*_r = −p − c`; `θ(g e^{tξ})' = Ad*_g c(ξ,·) = 0`, locally constant | holds |
| §1.3 model actions | translations of `ℝ²`; `SO(3)` lift; `Sp(V)` | defect `ω(Z, v)`, derivative `ω(ξ, η)` = Tau Ceti `mvfderiv_momentDefect_one`; `p·(ξ×q) = ξ·(q×p)`; `μ(gv)(A) = μ(v)(g⁻¹Ag)` | holds |
| §1a.0 two-parameter identity | `φ = (x + t, y + ux)` | `β_t = dy + u dx`, `β_u = −x dx`; `∂_uβ_t − ∂_tβ_u = dx = d(x)` | holds |
| §1a.4 cylinder | `ℝ × S¹`, `ω = dr ∧ dθ` | `ι_X ω = f(r−R) dr`; `H¹_c` class `∫f = 1`, ordinary class 0; `Γ_(ω,c) = 0` via `λ = r dθ` | holds |
| §2.3 / §2.6 model orbits | `U(n)` pairing; `−iσ_a/2` | `−i tr(H·iY) = tr(HY)` real; bracket `ε_abc(−iσ_c/2)`; `exp` period `4π` vs `2π` | holds |
| §3.0 level data | Cannas da Silva §23.2 (p. 142); `S¹` on `ℂ` at `−½` | `ker dμ = (T O)^ω`, `im = 𝔤_p⁰`, same sign; `i*ω = 0`, kernel `= T S` | holds |
| §3.0b shifting | `Φ`, `q_Y` at `g = 1`; opposite sign | `(gh, h⁻¹z) ↦ (gz, [g])`; cross terms vanish, `ω(ξ_M, ξ'_M) = c([ξ, ξ'])`; `μ⁻¹(½) = ∅` | holds |
| §3.0c stages | `T*U(2)` by `SU(2)` then `U(1)`; `T²` on `ℂ²` | `8 → 2 → 0` vs `8 − 2·4 = 0`; point both ways; `Ad_{n⁻¹}ξ − ξ ∈ 𝔫` | holds |
| §3.0e orbifold level | weights `(p, q)`, `(2, 2)`; Cannas da Silva §24.5 | stabilizers `ℤ/p`, `ℤ/q`, trivial; `ℤ/2` everywhere; source example `(k, 1)` agrees | holds |
| §3.2 singular level | weights `(1, −1)` | cone `|z₁| = |z₂|`, quotient `ℂ` via `z₁z₂`, strata `{0}`, `ℂ ∖ 0` | holds |
| §4.1 cotangent shift | left action, `A(ξ^left) = −ξ`; Hopf | `c(ξ) − c(ξ) = 0`; minus sign → `μ⁻¹(2c)`; `τ_α*ω = ω − π*dα` gives `+pr*β_c` | holds |
| §5.1 gauge moment map | left and right conventions | `[ξ, A] − dξ = −d_Aξ`; both sides `∫B(a ∧ d_Aξ)`; right convention `+d_Aξ` | holds |
| §5.2 Sobolev scale | `s > 1`, `s = 1` on a surface | `H^s ⊂ C⁰` algebra for `s > 1`; `H¹` not an algebra | holds |
| §5.4 flat quotient | `U(1)` over `T²` | `Hom(ℤ², U(1)) = U(1)²`, conjugation trivial | holds |
| §§5.5, 5.9 dimensions | `U(1)`, irreducible `SO(3)`, regular semisimple locus | `2g`; `6g − 6`; Kuranishi map `[η, η] = 0` there, dimension `= dim H¹` | holds |
| §5.7 ineffective kernel | `O(2)`, finite `K` | `C = SO(2)`; not central (rotation vs reflection); `𝒜(P)` a point | holds |
| §5.10 framed space | `U(1)` | `(2g − 1)·1 + 1 = 2g = dim U(1)^{2g}`; lattice `2πH¹(Σ; ℤ)` | holds |
| §2a.7 `Spin(7)` | supports `1234, 1256, 1357` | sums `3456, 2457, 2367, 1467`; overlaps 2, commute; `16 > 8 = |T[2]|`, rank 3 | holds |
| `exists_mem_normalizer_Ad_eq` | one-tactic probe; `#check @` | `simp_all` fails; `exact?` returns only itself; binders match §2.4 | not padding |
| `isConnected_stabilizer_coadjointRepresentation` | one-tactic probe; `#check @` | `simp` fails; `exact?` returns only itself; binders match §2.5 | not padding |
| R01 (MWM locator) | Cannas da Silva Thm 23.1, p. 141 | source: compact `G`, level 0, free; README: any `G`, regular `c`, free proper `G_c` | finding |
| R02 (supplier ids) | heads of the two open revisions | "I2.0", "C4" absent, no mapping; `AddCircle` instances at Tau Ceti pin | finding |

- Source locators checked against the text: Cannas da Silva Def. 22.1 (pp. 133–134), §22.3 (p. 136), §22.4 (pp. 137–138), Homework 17 (p. 139), Thm 23.1 (p. 141), §23.2 (p. 142), §§24.4–24.5 (pp. 149–150); Huebschmann Lemma 2.18 to Thm 2.32 (arXiv v1, pp. 9–11), matching the cited range.
- Library declarations opened at the pins: Tau Ceti `MomentMap.lean` 575–600 and 680–695, `EquivariantMomentMap/Basic.lean` 106–114, 170, 300–335, `Diffeotopy/Basic.lean` 234–252, `Diffeomorphism/Inversion.lean` 236–244, `Lie/Subgroup/Torus.lean` 76–95 and 214, `Instances/AddCircle.lean` 1–75 and 254–388, `Symplectic/Coadjoint.lean`, `DifferentialForm/Quotient.lean`, `TwoForm/Basic.lean` 37; Mathlib `LieGroup.lean` 183, `IsManifold/Basic.lean` 921. About 70 further Tau Ceti names cited by the README are located at the pin.
- Cross-roadmap citations resolved on main: SmoothBundlesConnections (9 sections), LieGroupoidsPoisson (11 ids), LieGroups 5A and 6, MorseTheory (3), MorseNovikov §6.4, CotangentLagrangian C4, HeegaardFloer §4.1, IntegrableSystems §I2.0, DifferentialGeometry (10 items), DeRhamCohomologyAndDuality (2), GeometricTopology (3), AlgebraicTopology (3), Orbifolds (5), ComplexKahlerGeometry (2), PDE, SpinGeometry §1.1, ConvexityToric (3), SchubertGeometry §9.7; all exist and say what is cited.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 191 roadmaps, 2126 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` gives only the two `sorry` warnings. `#check @` of both declarations shows every binder (compact, connected, Hausdorff, finite-dimensional model) explicit and matching the README; nothing changed.
- `Suggested.lean` docstring's "not statable" claims checked at the pin: no manifold quotient by non-discrete groups, no compact-group roots, no flux or `Ham`, no principal connections or gauge group.
- Ownership: `G/N` as a Lie group (§3.0c) has no owner on main or in the open roadmap pull requests I searched; this roadmap owns it. LieGroups Layer 6 assigns the compact chamber and centralizer application to this roadmap.
- Overlap check: read ConvexityToric (main and open revision), GeometricQuantization, HamiltonianSystems (open), IntegrableSystems (main and open revision), CotangentLagrangian (main and open revision) and the SymplecticGeometry index. Nothing shared: ConvexityToric, GeometricQuantization and IntegrableSystems consume Layers 1–3 here; CotangentLagrangian supplies C4; HamiltonianSystems' moment maps are Tau Ceti's at the pin and are not owned here.

Source independence: 10 passages compared with 2 sources (Cannas da Silva Def. 22.1, §§22.3–22.4, Homework 17, Thm 23.1, §23.2, §§24.4–24.5; Huebschmann abstract and §§2.18–2.32); nothing shared beyond forced formulas. Largest share: CannasDaSilva2001, 5 of 14 locators. Contents compared with CannasDaSilva2001 (Lectures 21–29): independent. Layers 1a, 2, 2a and 4 have no counterpart there, and the order Layer 1 → 3 → 5 is forced by §3.0's *Needs* (Layer 1) and §5.8's *Needs* (§§3.1–3.2).

Research link: Layer 3's singular reduction and local normal form are the framework of Sjamaar–Lerman (1991). §5.8's finite-dimensional local model of flat-connection moduli over a surface is Huebschmann (1995, §§2.18–2.32), which builds on Atiyah–Bott (1983). This rests on the README's references and on Huebschmann's text, which I read.

## Not verifiable

- Sjamaar–Lerman 1991 (§§3.1–3.2): JSTOR only; the Annals page links no PDF, and the search found no author copy.
- Atiyah–Bott 1983 (Layer 5): the Royal Society site returned HTTP 403; no open copy found.
- Marsden–Ratiu, *Introduction to Mechanics and Symmetry* (§§1.2, 1.3, Layer 3, §4.1): paywalled; the sources service found no legal copy.
- Bröcker–tom Dieck, *Representations of Compact Lie Groups*, Ch. IV (`Suggested.lean` docstrings): paywalled.
- Huebschmann's published numbering (Math. Z. 220): I read arXiv v1, whose numbering matches the cited range.

## Source issues

- none

## For the human reviewers

- Not tested: Sjamaar–Lerman (3 of 14 locators) and Marsden–Ratiu (4 of 14) could not be read, so wording and arrangement were not compared with them. The largest-share source, Cannas da Silva, was read.
