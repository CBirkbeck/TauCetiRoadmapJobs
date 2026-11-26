# Review of DeterminantsOfThetaLiftChains (pull request #3160 at 8e155d4)
Folder: `TauCetiRoadmap/ShortGRH/DeterminantsOfThetaLiftChains/`
**Verdict:** needs changes

**Summary.** Changes are needed: three findings. On the mathematics, the fifteen sampled sections and Theorem C agree with the formal proof and with each other, with one exception: 3.11 (c) asserts that every `Ψ` supported on column blocks has a matched partner, which is false without the equivariance under `GL_b(R)` that the source assumes. The other two findings were raised before and are only partly repaired: the layers and sections still map one to one onto the formal proof's contents list, with four titles unchanged, and six passages still repeat its docstrings. There are four small corrections and two format notes. The scope, the licence of the source, the 25 background prerequisites and the two-way supply inside the family are left to the human reviewers.

## R01 (P2) — 3.11 (c) is false as stated: a `Ψ` supported on column blocks has a matched partner only if it is `χ`-equivariant under `GL_b(R)`

An implementer asked to prove 3.11 (c) (line 870: "every `Ψ` supported on column blocks has a match") is asked for a false statement, and 5.8, which needs 3.11, moves path data across a square by their matches.

A counterexample: `R = 𝔽₃`, `n = 2`, `b = a = 1`, `χ = 1`, and `Ψ` the indicator of the column `(1, 0)ᵀ`, which is the first column of the identity. For `k = 1` and `k = diag(2, 1)` the row `x_k` (the second row of `k⁻¹`) is `(0, 1)` in both cases, while `y_k` is `(1, 0)ᵀ` and `(2, 0)ᵀ`. A matched `Φ` would need `Φ(0, 1) = Ψ((1, 0)ᵀ) = 1` and `Φ(0, 1) = Ψ((2, 0)ᵀ) = 0`. In general `k` and `k·(h ⊕ 1)` have the same `x_k`, so a match forces `χ(det h)·Ψ(y h) = Ψ(y)` for `h ∈ GL_b(R)`.

The source has this hypothesis: ShortProof-SquareLaw lines 262–269 (`New.Exchange.areMatched_matchOf`) assume that `Ψ` vanishes off the column blocks and that `χ(det h)·Ψ(y h) = Ψ(y)` for every invertible `h`.

Smallest change: in 3.11 (c) write "every `Ψ` supported on column blocks with `χ(det h)·Ψ(y h) = Ψ(y)` for all `h ∈ GL_b(R)` has a match", and add the example above as a negative control.

## R02 (P2) — The layers and sections still map one to one onto the contents list of [ShortProof], and four section titles are its file titles unchanged

Re-raised: R06 of the first review. The description lists it as not done, "because section numbers are cited across the family". The reason does not cover the titles, which can be reworded without changing a number, and every citation of these numbers is inside this pull request, so a regrouping and its citations can change together.

The pairs, by number (ShortProof-CONTENTS lines 273–321):
- Layer 2 ↔ the group at lines 280–283, Layer 3 ↔ 285–298, Layer 4 ↔ 300–307, Layer 5 ↔ 309–321, in this order; Layers 1 and 6 ↔ 275–278 with line 304.
- Layer 5, section by section: 5.1 ↔ 311, 5.2 ↔ 312, 5.4 ↔ 313, 5.3 ↔ 314, 5.5 ↔ 315, 5.6 ↔ 316, 5.8 ↔ 317, 5.9 ↔ 318, 5.7 ↔ 319, 5.10 ↔ 320, 5.11 ↔ 321: eleven sections for eleven files, each with the file's scope.
- Titles unchanged: 3.12 ↔ 297, 5.7 ↔ 319, 5.10 ↔ 320, 6.3 ↔ 278. Nearly unchanged: 3.6 ↔ 294, 3.7 ↔ 295, 3.10 ↔ 298, 5.4 ↔ 313, 5.5 ↔ 315, 5.9 ↔ 318, 5.11 ↔ 321.

The dependency lines force only the order of the layers: 4.3 needs 3.12, 5.7 needs 4.1–4.3, 6.1 needs 5.11, 6.2 needs 4.4. Inside Layer 5 they force nothing of the split: 5.2 is used only by 5.10, 5.4 only by 5.5, and 5.8–5.9 do not use 5.7. The published locators asked for last time are now in the *Origin* lines (Rallis, Proposition 1.1; Gan–Qiu–Takeda, Theorem 7.3 and Propositions 11.1–11.2); that part is repaired.

Smallest change: reword the eleven titles above in the roadmap's own terms (no number changes), and group Layer 5 by what 6.1 needs: path data (5.1 with 5.3), the deep-level criterion (5.4 with 5.5), the transfer of periods (5.6–5.9), the last path (5.2 with 5.10 and 5.11). Whether a family that states the route of one formal proof may keep that proof's arrangement is a question for the human reviewers (below).

## R03 (P2) — Six passages still repeat the wording of [ShortProof]

The three *Method* lines named last time (3.7, 5.6, 5.9) and the end of 3.9 are rewritten. These remain, with the number of consecutive words shared:
- Conventions, lines 110–111 ↔ ShortProof-FitTwists lines 143–145: 15 words (the description of the family `ω`).
- 5.2 (a), line 1121 ↔ ShortProof-RegularParameters lines 124–126: 14 words (what the parameter "sees").
- 4.2 *Needs:*, lines 1002–1003 (and 971–972, 1139, 1166) ↔ ShortProof-CONTENTS line 100: 14 words, the title of a source file used as the description of a supplier section.
- 4.4 (d), lines 1068–1069 ↔ ShortProof-NormOfChain lines 490–492: 13 words, after 7 more with one word inserted.
- 1.3 (b), lines 243–244 ↔ ShortProof-FitTwists lines 165–167: 11 words, in a parenthesis that follows the source clause by clause.
- 5.5 *Method*, lines 1220–1223 ↔ ShortProof-DeepLevelVanishing lines 617–619: 6 words, and the same three clauses with the two cases exchanged.

Rewritten:
- lines 110–111: "(weight `−κ_j`; tame part `ω^j`, where `ω = (ω_w)` is the family of characters of the residue fields fixed with the data: `ω_w = 1` unless `w` is a chosen place, and there the order of `ω_w` exceeds `8m`)".
- line 1121: "(`l` is a function of `e` and of the numbers `κ_τ(h)` with `h < n` alone)".
- lines 1002–1003: "(the two grids with their index sets, signs and parameters; consecutive nodes carry corresponding parameters)".
- 4.4 (d): "every lift `Θ_{j,ϑ} y`, `y ∈ 𝒢(W_j)`, is a sum of lifts `Θ_{j,ϑ} y′` of good Hecke eigenforms `y′`, each `Θ_{j,ϑ} y′` fixed by the idempotent of some good family of labels".
- 1.3 (b): "the false lifts: the forms of `e₀𝒜(V_j)` in `Z^⊥` that `H_w(X_*(w))` annihilates for some split place `w` away from the level, `X_*(w)` the test value of NormsOfThetaLiftsAndExchangeIdentities §1.3".
- 5.5 *Method*: "A bound `|y| ≤ S` is improved to `|y| ≤ S/2`, in two regimes of the first minimum `λ` at the point. For small `λ` the cusp bound of the background entry applies, since `y` changes little under small real translations. Otherwise `y` is orthogonal to the restricted Poincaré series, whose period is by 5.4 (b) nearly the convolution of `y` with the translated coefficient, and the pairing bound of PairsOfFramesAtOnePlace §8.6 recovers `y` from that convolution."

## C01 — 2.1 gives a descent pair the rank condition `r′ + t′ > 2r′`, which the definition it cites does not have

2.1 (line 301) reads "the positive definite space `V` of rank `r′ + t′ > 2r′`" as part of "a descent pair (ThetaLiftChainsAndTheSeesawIdentity §2.16)". That section asks only `|r| < |n|`, and the source uses only `rank W < rank V` (ShortProof-AdjointThetaLift line 251). Nothing in 2.1 (a)–(d) uses the stronger bound; it is the convergent range of 2.2. Write "of rank `r′ + t′`, `t′ ≥ 1`" in 2.1 and keep `rank V > 2 rank W` in 2.2.

## C02 — 1.2 (a) inverts a function that 1.1 (e) allows to vanish

1.1 (e) allows `C = 0`, so `c` may be identically `0`, and 1.2 (a) then says "`c⁻¹` [has] modulus `F⁻¹`" of a function with no inverse. 4.1 (b) and 4.3 (a) say how such a scalar is read. Add the same clause here ("`c⁻¹` is read as `0` where `c = 0`"), or assume in that clause that `c` and `F` vanish nowhere.

## C03 — 3.6 (a) is stated with a "cone integral" that the roadmap does not define

The term occurs in the statement of 3.6 (a) and in its background entry; the only description is in the *Method* line ("an integral over the maximal compact subgroup and the archimedean scalings"). An implementer cannot write the target down. Define the cone integral of a real vector at `z` in 3.6, or, if it is the local cone map of ThetaKernelsForUnitaryDualPairs §5.7c that the *Origin* line mentions, say so in the statement.

## C04 — The description's count of background entries is out of date

"They appear on `*Needs:*` lines as `ShortGRH background (…)`, 169 entries at this commit". At this head the eleven READMEs carry 164, of which 25 are in this roadmap; the later rounds of the description speak of 152. Give one number for the head.

## N01 — Notation

The skew element is `ȷ` in the Conventions and `j` in the table of symbols, 3.2 (b) and 3.4 (b), where `j` is also the index of a lift; 3.4 (b) writes the Gram matrix of `V′` as `V′.J`. In the Conventions `k` is both `r + 1 − m` and a matrix of `GL_n(R)`; 5.4 (b) uses `d` and `a` for local numbers while `d = dim 𝒯` and `a = x·b`. 4.1 (a) needs `R` finite.

## N02 — Layer 1 is not wholly before Layer 2 in build order

1.3 needs 2.1 (and, through NormsOfThetaLiftsAndExchangeIdentities §1.3 and §2.5, 2.2). The guide to the layers would say so, or 1.3 and 1.4 would follow Layer 2.

## Questions for the author

- In 2.2 (e), is `α` the number `χ_W(ϖ_w)·q^{r/2}` of 2.1 (d)? The text says "the Frobenius value at `w` of the character of `W_j`" without the factor `q^{r/2}`. With the `α` of 2.1 (d) the factor `1 − q^{t−1}αX` of 2.1 (d) vanishes at `X = (αq^{t−1})⁻¹`, as (e) needs. I could not open the definition (`New.AutChar.frobValue` is in a file outside those I read).

## Earlier findings

- R01 of the first review (the missing supplier roadmap): repaired. NormsOfThetaLiftsAndExchangeIdentities §1.3, §2.5 and §7.5 (d) exist at this head and state what is cited; 2.2 cites SecondMomentsOfPoincareSeries §2.1a for the spanning by eigenforms.
- R02 (background prerequisites): partly. Five are now citations (ThetaKernelsForUnitaryDualPairs §3.45, §4.4a; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; HermitianFormsAndLattices §1.1; IntegralWeylModulesOfGeneralLinearGroups §1.1), and each of the 25 that remain states its form and names its declaration. None has an owner. Not raised again: see the human reviewers' section.
- R03 (the doubled power in 6.2): repaired. 6.2 (a), (c) read `Z_j(1)/Z_j(θ_ι)`, as ShortProof-LongForms lines 143–146 and 184–189.
- R04 (mutual supply, two owners of Theorem C): partly. Theorem C is stated only in 6.3, and OneSidedPrimeSumBoundsAndAdmissibleData §6.1 cites it. Supply still runs both ways with four siblings; the sections are acyclic. See the human reviewers' section.
- R05 (the complementary-space identity): repaired. The *Origin* of 3.9 and the scope section name ThetaLiftsForDefiniteUnitaryGroups §6.11 and say how 3.9 differs.
- R06 (arrangement): not repaired (R02 above). R07 (wording): partly (R03 above).
- R08 (files outside the folder): settled by a maintainer's comment on the pull request (below).
- C01–C03: repaired (the value at `z = 1`; citations by section number; a list of references). C04: the sentence now holds for this roadmap.
- The finding of the review of 8c6c8b8 on 5.11 (a): repaired; the size bound now carries the bound on the path datum.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 (sample) | `θ_ι = 1`; definitions vs FitTwists 160–235 | `Nm Q = 1`, ratios `1`, height `0 ≤ x₁`; main pair `z ≥ 10` from `20 + (2z − 20) = 2z` | holds | wording (R03) |
| 1.4 (sample) | `m = 1`; `#A = m²` | empty product, height `0`; `≤ t` ratios each `≤ x₁`, total `m²tx₁`; Moduli 231–235 | holds | none |
| 1.1 (f), 1.2 (c) | `R^turn` tame part; `s = ±1` | `ω^{i+j+2}`, `i+j+2 ≤ 2m < 8m`; both sides `(∏q)^{z²}∏\|L^{𝒞∪Q}\|²` via `L(ν⁻¹) = L(ν)` | holds | none |
| 1.2 (a) | `C = 0` | `c ≡ 0`, `c⁻¹` undefined | ambiguous | C02 |
| 2.1 (sample) | (d) against 2.2 (e) | factor `i = t−1` of `∏(1 − q^iαX)` is `0` at `X = (αq^{t−1})⁻¹`; AdjointThetaLift 225–234 | holds | C01 |
| 2.2 (c), `c_Q` (headline input) | `ϑ = 1`; one place | `c_Q(1) = 1`; `∏_{i<r}(q^{r+t} − q^i)/q^{r²} = q^{rt}∏_{t<i≤t+r}(1 − q^{−i})` | holds | none |
| 3.1 (sample) | (c) standard data matched | `(z; x_k)·k = [[z y_k, *],[0, 1]]`, so `det(z; x_k)·det k = det(z y_k)`: `Φ(x_k) = χ(det k)Ψ(y_k)` | holds | none |
| 3.3 (sample) | (b), (c) vs MatchingPartners 432–437, 606–607 | hypotheses agree: invariance under `GL_a(F)`; tame `χ`, `Ψ` locally constant | holds | none |
| 3.4 (sample) | (a), (c) vs EquivariantDifference 285–297, TheoremForPartners 245–254 | `𝒟Ψ = I_large − c·I_small`; conclusion includes support on left invertible matrices | holds | none |
| 3.7 (sample) | `j = 1`; VanishingDescends 157–163 | `rk V′ − rk W′/2 = rk V − rk W/2 + j`; `−k₀ ≤ rk V − rk W/2`, `k₀ ≤ μ` | holds | none |
| 3.9 (headline input) | `b = 0`; `e = 0` | `e = (a−b)/2 = rk V − n/2`; `e = 0`: `L_* = 1`, `\|c\|² = C`; `k₀ = n/2 − q ∈ [1, μ]` fits 3.8 (b) | holds | none |
| 3.10 (sample) | normalised form from first form | `α₀ = α/υ₁^l`: `(α₀/υ₁^{s₀})⁻¹ = α⁻¹υ₁^{l+s₀}`, `l + s₀ = n/2 = b + d` | holds | none |
| 3.11 (a), (b) (sample) | SquareLaw 189–194, 481–491 | `#GL_a·Σ pL′ = c·#GL_{n⊔b}·Σ next(p)L`; `\|γ\|²·#R^{#T(#T+2#N)} = 1` | holds | none |
| 3.11 (c) (sample) | `𝔽₃`, `n = 2`, `b = a = 1`, `χ = 1`, `Ψ = 1_{(1,0)ᵀ}` | `k = 1`, `diag(2,1)`: same `x_k = (0,1)`, `Ψ(y_k) = 1` and `0` | fails | R01 |
| 4.1 (sample) | (a) `R = 𝔽_q`, `N = T = j = 1`; (b) `β = 0`; (c) `n = 1, 2` | `(q−1)²q`; `β = 0` contradicts injectivity unless `V = 0`; weight `w(0)`, `w(0)w(1)²/w(2)` | holds | N01 |
| 4.1 (c) with 4.3, 4.4 (a) | row `0` | squares `(i′, n′)` give `L(i′+1, i′+n′+2)`: all `1 ≤ ρ < k ≤ m`, the `R^quo` product | holds | none |
| 4.3 (sample) | ChainNorms 208–220, 547–557, 594–599 | `β` of modulus `R^quo_{i+1,i+n+2}`; `κ` of modulus `1`; factor `(β̄)⁻¹`, `0` where `β = 0` | holds | none |
| 4.4 (b), (c) (headline input) | `ϑ = 1`; `d = 0` | `Q(ϑ^j) = Q(ϑ)` so `c_Q(ϑ^j) = c_Q(ϑ)`; `c_Q^{md}` cancels; ratio `1 = 1`; `d = 0`: all `1` | holds | none |
| 5.1, 5.8, 5.9 (sample 5.9) | `m = 1`; count of turns | `2·m(m−1)/2` off-diagonal `+ m` diagonal `= m²`; pairs `(a,b)`, `(b,a)`, `(j,j)`; DiagonalTurns 631–657 | holds | none |
| 5.2 (sample) | `n = 1`; `n = 0` | `l = 2e`, `\|e\| ≤ β/2`; boxes below height `1`: `0`; RegularParameters 127–132, 60–62, 82–83 | holds | wording (R03) |
| 5.3, table of symbols | ranks | `Ỹ^j_j = r+1+2jt = rk Y^j_j + 1`; `Ỹ^{j+1}_j = r+(2j+1)t = Y^{j+1}_j`; `2n_m = 2r+2+2mt ≥` every rank | holds | none |
| 5.5 (sample) | DeepLevelVanishing 597–616, 643–669, 698–705 | the eight size conditions, the gaps `500n³+4A`, `500(n+1)³+2A` and the pairing bound agree | holds | wording (R03) |
| 5.6, 5.9 (b), 5.11 (a) | bounds at `ϑ = 1` | `#(O/𝔟)^{2n_m·m²}·(#(O/𝔟)^{(2n_m)²})^{2m}` is the product of the two | holds | none |
| 6.2 | Norms §7.5 (d) | `d·k(log b·β_tot − h_dir) = d(fa(log b)⁴/m − k·h_dir)`; sum over `j`: `d(fa(log b)⁴ − h_main)`; scalar `≤ db` | holds | none |
| 6.3 Theorem C (sample, headline) | `n′ ≤ 4d/b²`; LongForms 218–252 | `n′(2x₁²b²+b) ≤ d·4(2x₁²+1/b) ≤ db`; `c+2δ ≥ d(h_main − fa(log b)⁴ − 2b) ≥ d(h_main − 3fa(log b)⁴)` | holds | none |
| `L^S(z, ν)` at `z = 1` | weights in 1.1, 3.1, 3.10 | weights `−c ≤ −1`, `μ > 0`, `#ι + s₀ ≥ 1`; `#ι + b − l + d ≥ 1` when `d ≥ 1` | holds | none |
| `Suggested.lean` | elaboration | no declarations; the four Mathlib names of the docstring exist at the pin | holds | none |

- Source locators checked against the text: 24 [ShortProof] files read at commit 72fead1 (22 Lean files, `CONTENTS.md`, `README.md`), about 60 declarations compared with the sections that point to them; Rallis, Proposition 1.1 (Rallis1984 line 345); Gan–Qiu–Takeda, Theorem 7.3 (GanQiuTakeda2014 line 1693) and Propositions 11.1–11.2 (lines 2588–2617).
- Library declarations opened at the pin: Mathlib `NumberTheory/NumberField/CMField.lean:70`, `NumberTheory/NumberField/AdeleRing.lean:56`, `RingTheory/DedekindDomain/FiniteAdeleRing.lean:95`, `LinearAlgebra/UnitaryGroup.lean:105`; Tau Ceti searched for theta lifts, Weil representations and automorphic forms on unitary groups: none.
- Cross-roadmap citations resolved: 37 section ids in eight sibling roadmaps at this head and 12 in six roadmaps on main (ThetaLiftsForDefiniteUnitaryGroups §1.2, §2.2, §6.11; ThetaKernelsForUnitaryDualPairs §3.45, §4.4a, §5.7c, §6.13a; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; IntegralWeylModulesOfGeneralLinearGroups §1.1; HermitianFormsAndLattices §1.1; RowTowerAndRallisIdentities §§5.5–5.8). All exist; the ones read state what is taken.
- Section graph of the family, from the *Needs:* lines: 412 sections, 1417 edges, no cycle.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exited 0 with no output; the file has no declaration, so there was nothing to compare by `#check` and no one-tactic probe to run.
- Headlines: Theorem C (6.3) and its inputs 2.2, 3.9, 4.4; none is statable at the pins, and the module docstring names each with the carriers it lacks.

Overlap check: read ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities, SeesawForThetaChains and ThetaChainsOnDefiniteUnitaryGroups (on main; an open revision changes them and drops no id cited here). Shared objects: the complementary-space identity (owner ThetaLiftsForDefiniteUnitaryGroups §6.11; 3.9 is a stated variant) and the Rallis formula in Weil's range (owner ThetaKernelsForUnitaryDualPairs §6.13a; 2.2 and 4.2 are stated variants for sharp data). RowTowerAndRallisIdentities Layer 5 treats that family's own chain by eigensystems; nothing else is shared.

Source independence: 24 passages compared with 3 sources (ShortProof, GanQiuTakeda2014, Rallis1984); six share wording with ShortProof (R03); largest share ShortProof, 36 of 46 locators; contents compared with ShortProof-CONTENTS: Layers 2–5 and the sections of Layer 5 follow it (R02).

Research link: Theorem C is the lower bound in the route of an unpublished formal proof of GRH for Dirichlet L-functions ([ShortProof], credited to Levent Alpöge). Its inputs adapt the Rallis inner product formula (Rallis 1984; Gan, Qiu and Takeda 2014) and the first term identity (Kudla and Rallis 1994). Rests on the README and those sources.

## Not verifiable

- 4.1 and 5.11: their pointer files (`New/Determinant/Chain/TriangleNorms.lean`, `New/Determinant/AuxiliaryForms/SpanningForms.lean`) could not be read through the sources service; 4.1 was checked by computation, 5.11 for consistency with 5.6, 5.9 and 6.1 only.
- 5.4, 5.6, 5.7, 5.10 and the 25 background entries were not compared with their declarations.
- J.-S. Li (1992), Kudla and Rallis (1994), Kudla (1984, 1986), Ichino (2004), Rallis (1982), Muić (2015), Prasad and Schulze-Pillot (2008) are cited without locators; Goodman and Wallach, Theorem 8.1.1, and Zhelobenko, Chapter X, are not readable from a legal open copy.

Automatic checks set aside as false positives: the TeX-syntax check at line 320, where a code span that begins on line 319 continues over the line break; the 211 Lean names "found nowhere", which are declarations of [ShortProof] on pointer lines and not names of this roadmap; the change outside the roadmap folders (the umbrella GRH and one line of the top-level roadmap list), which a maintainer's comment on the pull request of 2026-11-26 records as decided by the human reviewers to belong to it.

## Source issues

- none

## For the human reviewers

- **Scope.** The statements labelled "particular to this proof" rest only on [ShortProof], an unpublished repository (lsernau/grh-lean) whose end theorem is an open problem; no refereed source states Theorem C (6.3).
- **Licence.** [ShortProof] states the Apache 2.0 licence (its `README.md`). Whether that covers keeping its arrangement and titles (R02) and the phrases of R03 is yours to read.
- **Background entries.** 25 `ShortGRH background (…)` prerequisites of this roadmap (164 in the family) name no owning section. The description says the human reviewers decided they go to separate pull requests; no comment on the pull request records it.
- **Two-way supply.** This roadmap both supplies and consumes OneSidedPrimeSumBoundsAndAdmissibleData, SecondMomentsOfPoincareSeries, CongruencesOfTwistedThetaLifts and NormsOfThetaLiftsAndExchangeIdentities; the section graph is acyclic. The description says this was decided; only the umbrella decision is recorded.
- **Not tested.** `TriangleNorms.lean` and `SpanningForms.lean` of [ShortProof] could not be read, so 4.1 and 5.11 were not compared with the source's wording.
