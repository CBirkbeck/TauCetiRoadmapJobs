# Review of HamiltonianReduction (pull request #2696 at 2aba5a6)
Folder: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/`
**Verdict:** accepted

**Summary.** Accepted with no findings. The head is the one the previous review read: the folder is main's text plus a ten-line patch of `Suggested.lean` that replaces the family root's `HasHamiltonianField` by Tau Ceti's `SmoothTwoForm.IsHamiltonianVectorField`, and no statement changes meaning. I recomputed the mathematics of the whole README and found no false statement. Its out-of-date supplier attributions (HamiltonianSystems, RootSystems Layer 4) and the form of the Lean file are main's, and the open revision of this roadmap (#2690), which the description orders before this pull request, replaces both files; they are not restated as findings. Three small corrections and one format note, none blocking, all moot after the stated rebase. The human reviewers have two facts about the merge order.

## C01 — `equivariantMoment_infinitesimal` restates the two fields of its hypothesis, so as a target it asks an implementer for nothing

The patch rewrites this statement (`Suggested.lean`, lines 59–64). On a copy of the file the single step `exact ⟨hμ.smooth.clm_apply contMDiff_const, hμ.hamiltonian ξ⟩` closes it: the first conjunct is the `smooth` field of `IsEquivariantMomentMap` evaluated at `ξ`, the second is its `hamiltonian` field unchanged. If it is a sanity check of `algebraicMoment`, mark it as one; if the comparison with Tau Ceti's infinitesimal moment map is meant, state instead that `algebraicMoment μ` is a `TauCeti.SmoothTwoForm.IsMomentMap` of the fundamental action. Nothing is needed once this pull request is rebased onto the revision, whose file drops the declaration.

## C02 — The docstring of `PullsBackTo` sends an implementer to a predicate that exists nowhere

Lines 88–90 call `PullsBackTo` a temporary adapter of `SmoothTwoForm.IsSymplecticMap`, to be deleted "when importing HamiltonianSystems". The pinned Tau Ceti has no `IsSymplecticMap` (the name does not occur under `TauCeti/`), and the root README of this pull request writes a symplectic map as the equation `SmoothForm.mpullback f hf σ₂ = σ₁`. A true sentence: for smooth `p`, `PullsBackTo p σ τ` is the pointwise form of `SmoothForm.mpullback p hp τ = σ`. Moot after the stated rebase.

## C03 — The four remaining theorems and two of the definitions have counterparts in the pinned Tau Ceti that the file does not cite

A reader of the patched file, which now imports Tau Ceti's Hamiltonian module directly, would take `fundamentalField`, `fundamentalField_lie`, `cotangentMomentum_hamiltonian` and the two descent statements for open targets. At the pin: `TauCeti.fundamentalVectorField` has the same body as `fundamentalField` (`TauCeti/Geometry/Lie/FundamentalVectorField.lean`, line 83); `TauCeti.mlieBracket_fundamentalVectorField` (same file, line 248) is the bracket identity, under `ContMDiffSMul` and complete model spaces for both the group and the manifold; `isEquivariantMomentMap_momentMap` (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/MomentMap.lean`, line 171) is the cotangent-lift moment map, for Hausdorff boundaryless data; `IsSubmersion.exists_smoothForm_mpullback_eq_iff` with `SmoothForm.descendedForm` (`TauCeti/Geometry/Manifold/DifferentialForm/Pullback/Submersion.lean`, lines 113 and 160) and `isSymplectic_descendedForm_iff` (`TauCeti/Geometry/Symplectic/Manifold/Descent.lean`, line 103) give existence of the descended symplectic form. The library statements carry more hypotheses than the file's, so the file's versions are not literally proved there; a docstring line naming each counterpart and the hypothesis that differs would say what is left. The revision's file drops all of them and its README cites the library, so nothing is needed after the stated rebase.

## N01 — The patched import block has no `import Mathlib` line and keeps a Mathlib submodule import

`Suggested.lean` line 4 imports `Mathlib.Geometry.Manifold.IsManifold.InteriorBoundary`; putting `import Mathlib` first and dropping line 4 meets the import rule. The import of CotangentLagrangian's Lean file (line 1) has to stay while the file uses `Cotangent`, `cotangentModel` and `canonicalForm`; the revision's file needs none of them.

## Earlier findings

The previous review of this head had no findings. Its two small corrections and its format note are unchanged, since the head is the same: `equivariantMoment_infinitesimal` (lines 59–64) still closes in one step (C01 here); the docstring "A temporary local adapter of PR480 `SmoothTwoForm.IsSymplecticMap`" (line 88) is still there (C02 here); line 4 still imports a Mathlib submodule (N01 here). Not repaired, none blocking.

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result | Change |
|---|---|---|---|---|
| Patch: `HasHamiltonianField` → `IsHamiltonianVectorField` | diff against main; elaboration | three uses renamed; file elaborates; `hμ.hamiltonian ξ` has the type of the new conjunct | same predicate | none |
| R1 group defect cocycle (l. 51–53) | expand `θ(gh)` at `x` | `μ(ghx) − Ad*_g μ(hx) + Ad*_g(μ(hx) − Ad*_h μ(x)) = θ(g) + Ad*_g θ(h)`; `dθ` in `x`: `ω(ξ_M, g_*v) − ω((Ad_{g⁻¹}ξ)_M, v) = 0` | holds | none |
| R1 freeness of the constant (l. 46–49) | `μ + c`; `O(2)` on `T*S¹` | equivariant iff `Ad*_g c = c`; reflection gives `−p + c` against `−p − c` | holds | none |
| R1 `f ↦ −X_f` Lie homomorphism (l. 63–64) | `(ℝ², dq∧dp)`, `f = q²`, `g = p` | `X_f = −2q∂_p`, `X_g = ∂_q`, `[X_f, X_g] = 2∂_p`, `{f,g} = 2q`, `X_{2q} = −2∂_p` | holds | none |
| R1 cotangent moment map (l. 59–60) | `ω = −dλ`, `μ_ξ = λ(ξ̃)` | `d(λ(ξ̃)) = L_ξ̃λ − ι_ξ̃dλ = ι_ξ̃ω`; rotations: `p·(ξ×q)` | holds | none |
| R1a.3 torus flux group (l. 107) | `ω = A dx∧dy`, velocity `a∂_x + b∂_y` | `ι ω = A(a dy − b dx)`; loop iff `(a,b) ∈ ℤ²`; sweep pairing `A·deg` | holds | none |
| R1a.4 cylinder (l. 125) | `(r,θ) ↦ (r, θ − t f(r−R))` | `ι_{∂θ}(dr∧dθ) = −dr`, so contraction `f(r−R) dr`, class `1 ∈ H¹_c`, `0 ∈ H¹`; `∂_tφ_t*λ = φ_t*ι_Xω + dφ_t*ι_Xλ` | holds | none |
| R2 KKS and the orbit moment map (l. 129–134) | `ξ_O(ν)(η) = −ν([ξ,η])` | `dμ_ξ(η_O) = η_O(ν)(ξ) = ν([ξ,η]) = ω(ξ_O, η_O)`; sharp: `π♯ξ = −ξ_O`, `ω(π♯ξ, π♯η) = ν([ξ,η]) = π(ξ,η)` | holds | none |
| R2 `SO(3)` sphere (l. 151–152) | `ν = r e₃` | `ξ_O = ξ×ν`; `ω(−re₂, re₁) = r`, so `ω(e₁,e₂) = 1/r`; area `4πr²/r = 4πr` | holds | none |
| R2 Weyl-relatedness (l. 145) | `Ad_g X = Y`, `X, Y ∈ 𝔱` | `T` and `gTg⁻¹` both centralize `Y = Ad_g X`; conjugate in `Z_G(Y)⁰`, `cg ∈ N_G(T)` | holds | none |
| R2a.2 root-plane formulas (l. 163–167) | `v = q_pA = −α(p)J_αA` | `B(J_αv, w)/α(p) = α(p)B(J_αA, C) = B(p,[A,C])`; `B([A,[A,p]],X) = −α(X)α(p)B(A,A)`; quotient form `−α(X)B(v,w)/α(p)` | holds | none |
| R2a.3 index formula (l. 173–175) | `SU(2)`, `S²`, `X`, `μ` dominant | `p = μ`: `α(X)α(p) > 0`, index 2 = `dim − 0`; `p = sμ`: index 0 = `2 − 2ℓ(s)` | holds | none |
| R2a.7 Heisenberg (l. 183) | `[X,Y] = Z` | `Ad_{exp(xX+yY)}(aX+bY+cZ) = aX + bY + (c + xb − ya)Z`: `c`-line iff `(a,b) ≠ 0`; coadjoint `r ≠ 0`: planes, `ω = dp∧dq/r` | holds | none |
| R2a.7 `Spin(7)` test (l. 185) | supports 1234, 1256, 1357 | `(e₁e₂e₃e₄)² = (+1)(−1)⁴ = 1`; overlaps 2, 2, 2 so they commute; order `2·2³ = 16 > 8 = 2^rank` | holds | none |
| R3 level and dimension (l. 197–206) | `S¹` on `ℂⁿ`; `SO(3)` on `T*ℝ³`, `c ≠ 0` | `g_x ⊂ g_c`, free ⇒ `g_x = 0` ⇒ `dμ_x` onto; `2n − 1 − 1`; `6 − 3 − 1 = 2` | holds | none |
| R3 orbit model `Φ` (l. 216–233) | `(gh, h⁻¹z)`; inverse | `Φ` gives `(gz, [g])`, `μ(gz) = Ad*_g c = ι_O[g]`; `μ(g⁻¹m) = c` for `μ(m) = Ad*_g c` | holds | none |
| R3.1 model tensor (l. 268–272) | `λ = ⟨ν + η + μ_V, θ_left⟩`, `dθ(ξ,ζ) = −[ξ,ζ]` | `−dλ = b(ξ_m) − a(ζ_m) + ν([ξ,ζ])`, and `ν([k, ·]) = 0` leaves `ν([ξ_q, ζ_q])`; `dim Y = dim M` | holds | none |
| R4 right action and shift (l. 289–291) | `q·g = g⁻¹q`; invariant `c` | `ξ^right = −ξ^left`; `(p + ⟨c,A⟩)(ξ^left) = c(ξ) − c(ξ) = 0`; `ω = s*ω_can + ⟨c, dA⟩`, `c([·,·]) = 0` | holds | none |
| R5 gauge moment map (l. 315–316) | `g = exp(tξ)`; Stokes | `[ξ,A] − dξ = −d_Aξ`; `∫B(ξ, d_Aa) = −∫B(d_Aξ ∧ a) = Ω(ξ_A, a)` | holds | none |
| R5 dimensions (l. 338, 344, 346, 356) | `U(1)`; irreducible `SO(3)`; framed | `h¹ = (2g−2)dim k + 2h⁰`: `2g`, `6g − 6`; framed `h¹ + dim k − h⁰ = (2g−1)dim k + h⁰` | holds | none |
| R5 ineffective kernel (l. 342) | `O(2)`; finite `K`; connected `K` | `ker Ad = C_K(K⁰)`: `SO(2)`, reflection acts by `−1`; finite: `𝒜(P)` a point; connected: `Z(K)` | holds | none |
| `equivariantMoment_infinitesimal` (C01) | one-step probe | the `exact` of C01 closes it | padding | C01 |
| `fundamentalField_lie`, `cotangentMomentum_hamiltonian`, `descendedForm_unique`, `descendedForm_exists` (C03) | `simp`, `simp_all`; `Q` a point; `M = ∅` | probes fail; point: `σ = 0`, `τ = 0` symplectic in dimension 0; `M = ∅` forces `Q = ∅`; pin counterparts carry extra hypotheses | true, not padding | C03 |
| `PullsBackTo` docstring (C02) | pin search | `IsSymplecticMap`: no occurrence in the pinned Tau Ceti | stale pointer | C02 |

- Source locators checked against the text: the README has two, Cannas da Silva §§22–25 (CannasDaSilva2001 lines 185–209 for the contents, Def. 22.1 at line 5357, Thm 23.1 at line 5550, §24.4 at line 5856, §§25.3–25.4 at lines 6078 and 6122) and Huebschmann §§2.18–2.32 (Huebschmann1995 lines 360 and 498; compact group not necessarily connected, line 16). Both support what they are cited for.
- Library declarations opened at the pin: the six of C03; `TauCeti/Geometry/Symplectic/Hamiltonian/EquivariantMomentMap/Basic.lean` 170; `Hamiltonian/MomentMap.lean` 133; `Hamiltonian/Manifold.lean` 338; `Geometry/Diffeomorphism/Diffeotopy/Basic.lean` 78 and 234 (`trans` applies `Φ` then `Ψ`, as R1a.0 says); `Diffeomorphism/FixingSubgroup/Topology.lean` 41; `Diffeomorphism/Topology.lean` 87; `LinearAlgebra/RootSystem/FundamentalDomain.lean` 239.
- Cross-roadmap citations resolved on main: LieGroupoidsPoisson Conventions (positive Lie–Poisson, `β(π♯α) = π(α,β)`), G0.1, G4.2a, G4.3, G4.6A/B, G7.2–G7.4 and its ownership paragraph naming R1–R4 as consumers; SmoothBundlesConnections B1.1, B1.4, Layers 2–5; DifferentialGeometry `legacySmoothTwoFormEquiv`; Orbifolds O2, O4.2, O7; MorseTheory Layers 1, 2, 5; IntegrableSystems I2.0; CotangentLagrangian C1, C2, C4; SchubertGeometry S9.7; CompactGroups Layer 0; SpinRepresentations Layers 2 and 7. Two do not hold as cited, both in main's text and both replaced by the revision: HamiltonianSystems is not on main, and RootSystems Layer 4 is not the closed-wall theorem (Tau Ceti `existsUnique_mem_orbit_inter_dominantChamber` and `stabilizer_eq_closure_wallReflections` are).
- Automatic checks, rerun on this head: TeX subscripts outside code spans (README lines 83, 93), pull-request numbers (lines 37–350) and the HamiltonianSystems citations (README lines 16, 73; Lean lines 47, 90) are real and are all main's text, which the revision replaces; the import hits are N01.
- Dependency check: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives five `sorry` warnings and nothing else. `#check @` of all 13 declarations: every binder a statement needs is in its own signature (`[CompleteSpace E]`, `[FiniteDimensional ℝ E]`, the boundaryless instances), in agreement with R1 and with R3 lines 200–205; nothing changed against main except the predicate's name.
- Headlines: the README's are the flux exact sequence, KKS and the chamber quotient, the Morse index formula, regular reduction, the proper-orbit normal form and the gauge local model. None is stated in this file; the revision states the two statable at the pins and names the rest in its docstring. The description of the pull request describes the folder's change correctly ("its three uses read `TauCeti.SmoothTwoForm.IsHamiltonianVectorField` … none of its statements changed") and states the order with the revision.
- Overlap check: read LieGroupoidsPoisson, ConvexityToric, GeometricQuantization, Orbifolds and HeegaardFloer on main, the family root at this head and the open revision of this roadmap. KKS and its sharp identity: owner R2 (LieGroupoidsPoisson G4.6B consumes). Generic two-form descent and the orbit model `W_O`: owner R3 by LieGroupoidsPoisson's ownership paragraph, with the generic descent now in the pinned Tau Ceti (C03). Locally free level presentation: owner R3, Orbifolds owning O1–O4. Hamiltonian fields and infinitesimal moment maps: pinned Tau Ceti.

Source independence: 8 passages compared with 2 sources (Cannas da Silva Def. 22.1, Thm 23.1, §24.4, §24.5, §25.3 and §25.4 against README lines 41, 191–199, 234–235, 258, 307–311 and 315–317; Huebschmann's abstract and Thm 2.32 against lines 307 and 324–336); nothing shared beyond forced formulas. Largest share: a tie, one locator each for CannasDaSilva2001 and Huebschmann1995, among five referenced works. Contents compared with CannasDaSilva2001 (Lectures 21–26): independent; R1a, R2, R2a, R3.1 and R4 have no counterpart there, and the order R1 → R3 → R5 is forced by R3's use of R1's moment maps and R5's use of R3.1–R3.2.

Research link: R3 and R3.1–R3.2 are Marsden–Weinstein–Meyer reduction and the singular reduction of Sjamaar–Lerman (1991); R5's local model of flat-connection moduli is Huebschmann (1995, §§2.18–2.32), after Atiyah–Bott (1983). Rests on the README's references and on Huebschmann's and Cannas da Silva's texts, which I read.

## Not verifiable

- Atiyah–Bott 1983, Sjamaar–Lerman 1991 and Marsden–Ratiu (References): no target cites any of them at a locator, and none is among this head's readable texts; nothing in the review rests on them.
- R2a items 1 and 6 speak of "the source" without naming it; the References at this head list no text for the Morse theory of orbit heights, so that wording was compared with nothing.

## Source issues

- none

## For the human reviewers

- The folder at this head is main's text plus a ten-line Lean patch. Rebased onto #2690 as the description states, this pull request changes nothing in the folder; #2690 was reviewed separately.
- If this pull request merged before #2690, main would keep README lines 16–24 and 73 (HamiltonianSystems, not on main, as supplier) and line 143 (RootSystems Layer 4 for a theorem that is in Tau Ceti).
- Not tested: Marsden–Ratiu, Atiyah–Bott and Sjamaar–Lerman were not read, so wording and arrangement were not compared with them.
