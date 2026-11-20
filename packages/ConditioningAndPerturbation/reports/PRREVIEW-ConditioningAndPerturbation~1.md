# Review of ConditioningAndPerturbation (pull request #2807 at e32b1a1)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, route and Check was recomputed (degenerate cases, both directions of each least-value statement, every number printed in a Check) and all hold; the nine Lean statements elaborate with `sorry` as the only warning, none closes with one tactic, and each matches its README statement. There are one small correction and four format notes, none blocking. One locator (Demmel 1987, Theorem 1) could not be read, and one point (the arXiv class in `metadata.toml`) is left for a human.

## C01 — Two parentheticals cite a section numbering that the cited roadmaps do not have on main

A reader who follows "§1.5 in its sectioned numbering" (Scope and ownership, line 505) into OperatorTheory/OperatorIdeals, or "Layer 4 in its sectioned numbering" (line 516) into OperatorTheory/SpectralSubspacePerturbation, finds no such section: on main the first roadmap is organised as Parts A–C with ids `OI-Axx` and the second as Parts A–D with ids `SSP-Dxx`. A section "1.5 Ky Fan gauges, Eckart–Young and perturbation (OI-A41–OI-A50)" and a "Layer 4: the Yu–Wang–Samworth variant" exist only at the heads of the open revisions of those two roadmaps. The primary ids given beside them (OI-A01, OI-A32, OI-A49; Part D) are main's and resolve, so no stated result is affected.

Smallest change: drop the two parentheticals (the main ids suffice and survive both revisions, which keep the `OI-A` ids in their headings), or keep them and name the two open revisions in the pull request description as the place where that numbering is defined.

## N01 — The distance-to-singularity bullet of the Summary does not say that `A` is invertible

In the Summary (lines 18–20) `A` is carried over silently from the preceding bullet; read alone the sentence is false for a non-invertible `A` (take `Δ = 0`: the greatest lower bound is `0`). Would read better as "for an invertible operator `A` on a nonzero Banach space …", as 1.2 has it.

## N02 — The docstring of `isGLB_norm_of_not_isUnit_add` is garbled

`Suggested.lean` line 43: "the perturbations `Δ` that make an invertible `A + Δ` fail to be invertible". Meant: "the perturbations `Δ` of an invertible `A` for which `A + Δ` is not invertible".

## N03 — "the example above" in the last Check of 4.2 points at the wrong Check

Line 444: the Check immediately above is the Jordan block, where simplicity already fails; the false value `f′(0) = 0` arises in the first Check (`A = [[1, 100], [0, 2]]`, where the unique analytic branch through `1` has derivative `−100`). Say "in the first Check".

## N04 — 2.1 and 2.2 carry attributions but no locator for the general statement

The Rigal–Gaches and Oettli–Prager formulas are "attributed … proved here"; only special cases of 2.1 have locators. The routes given are complete (recomputed below), so nothing depends on it; the original papers could be cited by page as paywalled references, as Demmel 1987 is.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 absolute and relative bound | `ℝ`, `A=1`, `ΔA=−q`, `x=b=1`, `Δb=δ`; zero space; `ΔA=−1` | `x'−x=(δ+q)/(1−q)`; bound `(δ+q)/(1−q)`, relative `1/(1−q)·(q+δ)`; zero space `0 ≤ 0`; `q=1`: `0·x'=b+Δb` | holds, sharp; hypothesis needed | none |
| 1.1 derivation of relative form | general | `‖Δb‖/‖x‖ ≤ ‖A‖‖Δb‖/‖b‖`; `κ‖ΔA‖/‖A‖ = ‖A⁻¹‖‖ΔA‖` since `x≠0 ⇒ A≠0, b≠0` | holds; no junk division | none |
| 1.1 Check `[[1,100],[0,1]]` | `∞`-norm | `‖A‖=‖A⁻¹‖=101`, `κ=10201`; Saad Example 1.5 gives `(1+|α|)²` | agrees | none |
| 1.2 greatest lower bound `‖A⁻¹‖⁻¹` | zero space; `A=2·1`; `[[1,1],[0,1]]` | zero space: set `∅`, no GLB; `2` attained by `−2·1`; `‖A⁻¹‖∞=2`, `‖Δ‖∞=1/2`, `det(A+Δ)=0`; `σ_min=(√5−1)/2` | holds; `Nontrivial E` needed and present | none |
| 1.2 rank-one construction | general `ε` | `(A+Δ)x = y − (g x/‖x‖)y = 0`; `‖Δ‖=‖y‖/‖x‖ ≤ ((1−ε)‖A⁻¹‖)⁻¹` | holds | none |
| 1.2 approximation-number remark | `d=dim E`, library indexing | `aₙ` = inf over rank `≤ n` (zero-based); rank `≤ d−1` ⇔ singular; coercive bound with `V=⊤`, `n=d−1`, `c=‖A⁻¹‖⁻¹` | consistent with the pinned definition | none |
| 2.1 normwise backward error | `A=1,y=1,b=3,α=β=1`; `y=0`; `α=β=0` with `r=0` and `r≠0`; `α=0<β`, `y≠0` | `r=2`, value `1`, `(1+1)·1=3−1`; `y=0`: `‖b‖/β`; `0/0=0` least is `0`; `r≠0`: set empty; `‖Δb‖=‖r‖=εβ` | holds in both directions | none |
| 2.2 componentwise backward error | `I₂,(1,1),(2,1)`; zero row; `E i j<0` at `y j=0`; `m` empty; complex `y` | `r=(1,0)`, denominators `(3,2)`, value `1/3`; `(3,0)`: `1/3`; set `⊆{0}`; `sSup ∅=0`; `(ΔA y)ᵢ=dᵢ Σ E i j |y j|` | holds; `∑ … + f i` parses as `(∑ …) + f i` | none |
| 3.1 Bauer–Fike | `[[1,100],[0,2]]`, `Δ=0.01·E₂₁`; `ι` empty; `μ=lam i`; residual form | eigenvalues `(3±√5)/2`, shift `0.618 ≤ 102.01`; `κ∞(V)=10201`, `κ₂≈10002`; empty: spectrum `∅`; `(A+Δ)u=μu`, `‖Δ‖=‖Au−μu‖` | holds | none |
| 3.2 normal element | nilpotent `a`, `b=δE₂₁`; `a=0`, nilpotent `b`; `b=0`; trivial algebra | `±√δ` at distance `√δ>δ`; `{0}` within `δ`; `b=0`: `l=μ`; trivial: vacuous | holds; normality needed | none |
| 3.3 Gershgorin count | `[[0,1],[1,10]]`; `[[0,1],[−1,0]]`; `I=∅`, `I=univ`; `n` empty | `5±√26≈−0.099, 10.099`, one per disc; `±i` both in `|z|≤1`; counts `0` and `n`; charpoly `1`, `0=0` | holds; disjointness needed | none |
| 4.1 `w x ≠ 0` | Jordan block; `[[1,100],[0,2]]`; `𝔽₂` `[[1,1],[0,0]]` | `e₂·e₁=0` (not simple); `(1,−100)·e₁=1`; `(1,1)·e₁=1`, charpoly `t(t−1)` | holds; simplicity needed | none |
| 4.2 derivative `yᴴEx/yᴴx` | `[[1,100],[0,2]]`, `E=E₂₁`; Jordan block; `y=0` | branch `3/2−√(1/4+100t)`, derivative `−100`; formula `−100/1`; `±√t`; `0/0=0≠−100` | holds; sign as in Saad §3.3.1 | none |
| 4.2 adjugate step | general | `tr adj(λ−A)=charpoly′(λ)=c·yᴴx`; `∂ₜp=−tr(adj·E)`; `f′=tr(adj E)/tr adj` | holds | none |
| 4.2 Cauchy–Schwarz remark | `E=y xᴴ/(‖x‖‖y‖)` | `yᴴEx=‖x‖‖y‖`, `‖E‖₂=1`; condition number `√(1+100²)≈100.005` | equality attained | none |
| Layer examples | diagonal matrix; `V=I`, `p=∞`; Hermitian `y=x` | `κ=max/min`, distance `min|dᵢ|`; bound `‖Δ‖∞`; `xᴴEx/xᴴx` | hold | none |
| C01 citations | main and the two open heads | main: `OI-A49` line 245, Part D line 407; open heads: "1.5 … (OI-A41–OI-A50)", "Layer 4" | primary ids resolve; parentheticals do not on main | C01 |

- Source locators checked against the text: 12 of 13 (saad-eig Example 1.2, §3.1.5, Theorem 3.6, Corollary 3.3, Proposition 3.4, §3.3.1, Definition 3.1, Theorems 3.11–3.12, all at the stated printed pages; saad-iter §1.13.2, (1.76), Example 1.5; demmel-lecture3 lines 416, 449–461, 479); 1 not readable.
- Library declarations opened at the pins: 31 Mathlib and 19 Tau Ceti names of the supplier contracts, each present in the file the README names (for example `Units.add` at `Mathlib/Analysis/Normed/Ring/Units.lean` line 47, `NormedRing.norm_inverse_add_le` at `TauCeti/Analysis/Normed/Ring/Units.lean` line 62, `ContinuousLinearMap.singularValue` at `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.lean` line 77); the statements of the eight used in routes were read and match their descriptions.
- Cross-roadmap citations resolved on main: ToeplitzOperators 4.2 (line 571), UnboundedOperators 5.5 / UO-E04a (line 814), PolarDecomposition PD-A53 (line 260), OperatorIdeals OI-A01, OI-A32, OI-A49, OI-A50, SpectralSubspacePerturbation Part D, Majorization.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line; no `*Needs:*` line names another roadmap.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ConditioningAndPerturbation/Suggested.lean` exits 0 with nine `sorry` warnings and nothing else; single `import Mathlib` plus one existing `TauCeti` module; no `set_option`, no definitions, no sorry'd data.
- One-tactic probe on a copy of the file (`simp`, `rfl`, `infer_instance`, `aesop`): 0 of 9 close. Elaborated signatures compared with the README: 9 of 9 agree, no binder lost.
- Headlines: the nine README headline theorems are all stated; the module docstring says none is unstatable. Automatic checks: all passed. No change outside the roadmap folder.
- Duplication: the pinned libraries and all roadmaps on main and at open heads were searched for Bauer–Fike, Oettli–Prager, Rigal–Gaches, Gastinel, backward error, distance to singular operators, a Gershgorin count and left eigenvectors of a simple eigenvalue; no owner found.

Overlap check: read IterativeMethodsForLinearSystems (open), OperatorIdeals and SpectralSubspacePerturbation (main and open heads), SNumbers and OperatorTheory (main); nothing shared. Approximation numbers and Eckart–Young: OperatorIdeals; elementary properties of `κ`: ToeplitzOperators 4.2; Weyl's bound: PolarDecomposition PD-A53; all cited, none restated. IterativeMethodsForLinearSystems places the eigenvector-condition-number bound for GMRES outside its scope and owns nothing here.

Source independence: 17 passages compared with 3 sources (12 at locators, 5 further: the routes of 1.1, 3.1, 3.3 and 4.2 and the docstring of 3.3), none shared; largest share saad-eig, 9 of 16 locators; contents compared with saad-eig: independent (Layers 1 and 2 have no counterpart in its Chapter 3; 3.1 ↔ §3.2.1, 3.3 ↔ §3.4, Layer 4 ↔ §3.3.1 with §3.1.5, not in its order). demmel-1987 could not be read.

Research link: Saad (2011), Chapter 3, uses Bauer–Fike, the residual backward error (Proposition 3.4) and eigenvalue condition numbers as the a posteriori error theory for eigenvalue computations; the README cites Demmel (1987), Theorem 1, for the distance to singularity. Rests on saad-eig §§3.2–3.4 and the README's references.

## Not verifiable

- 1.2, Demmel 1987, Theorem 1, p. 257 (and its attribution to Gastinel and to Eckart–Young): the DOI resolves only to the publisher's paywalled page and the README gives no address for the author's copy. The matrix statement is supported by demmel-lecture3 lines 438–446 (relative distance `1/κ(A)`, proved there for the 2-norm); the Banach-space statement was verified by computation.
- The original papers of Bauer–Fike, Rigal–Gaches, Oettli–Prager and Gastinel: attributed in prose without locators; not looked for.

## Source issues

- **Misprint** in saad-eig at the proof of Theorem 3.6, p. 59: the source says the exact eigenvalue `λ` is assumed not to lie in the spectrum; it should be the approximate eigenvalue `λ̃`; affects nothing.

## For the human reviewers

- Scope: `TauCetiRoadmap/ConditioningAndPerturbation/metadata.toml` files the roadmap under `math.CA`; the subject (conditioning, backward error) is numerical analysis, arXiv class `math.NA`, which no roadmap on main uses.
- Licence: demmel-1987 (Numer. Math. 51) is described as available from the author's course page; the copy was not located, so its host was not classified.
