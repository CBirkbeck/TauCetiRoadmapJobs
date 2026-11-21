# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #2924 at c07a7dc)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** Accepted: no statement I could compute, compare with its supplier section, or read at its locator in the formal proof came out false or unsupported, and the two Lean headlines say what 10.10 and 10.11 say. There are four small corrections (two locators into the formal proof that point at the wrong declaration, three headline targets with no locator although the formal proof's forms differ from the README's, and one out-of-date sentence in the description) and one format note; none blocks. The scope question is left to the human reviewers: every *NEW* target rests on a Lean formalization announced on 20 November 2026 and on no refereed text.

## C01 — The declaration cited for the level primes and the nodes in 10.9 (b) says nothing about either

A reader who opens the locator to confirm `T(u) > 2f·N_m + 1`, the congruence modulo `(g₀g₁)²` or the spacing `h₀` of the nodes finds an unrelated statement. The closing line of 10.9 (line 1500) reads "(b), the level primes and the nodes: [FormalProof], `Formalism/SharpRestriction/GrowthBounds/ProjectionLemmaBaseLevel.lean` (`Formalism.MainNotions.flipOneThree.AdmT`)". At line 235 of that file `AdmT` is a conjunction of twelve propositions, each a general statement about lattices in representations of `GL_n` over an arbitrary discrete valuation ring (comparison of the two integral forms, projectors, generation of sections by products, a Weyl dimension formula); I unfolded all twelve one level, and none mentions a level prime, a type prime or a node. Most do not use the chain datum at all.

What 10.9 (b) says is recorded elsewhere in the same source: the congruence of the level primes and their difference from `g₀, g₁` in `Formalism.MainNotions.S.StandingNumericalData` (already cited in 9.5), and the windows of the step weights in `Formalism.MainNotions.Lnk.Nodes_at` (`Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean`, line 215). Repoint the locator, or drop the attribution for (b).

## C02 — The declaration cited for 10.9 (a) is the loss inequality, not the sharing of the data

The same closing line gives "(a): [FormalProof], … (`Formalism.MainNotions.Lnk.Loss_at`)" for the clause "Shared data". `Loss_at` (`QuadraticLogDerivCongr.lean`, line 203) is the bound of 10.2 for one datum: the colength sum and `Σℛ − 𝒩` are at most `C·|Φ_top|·m·b·x^{e_L ε}`. The statement that one vector of top and bottom weights serves every index of the family is `LossF`, line 262 of the same file. Cite `LossF` for (a), and, if `Loss_at` is kept, attach it to 10.2 or to 10.9 (e), where the loss bound is used. The source proves it with `e_L = 0` (`Formalism/SharpRestriction/GlobalSchurBounds/LossesSmallShares.lean`, line 299), which agrees with the sentence of 10.5 that the loss carries no power of `x^ε`.

## C03 — 9.6, 10.4 and 10.10 name no declaration of the formal proof, and the forms it states for them are not the README's

The Conventions call [FormalProof] "the reference of every *NEW* target" (line 146) and promise that "the form that proof establishes is recorded at the target" (line 290). The three headline targets carry no locator, so for exactly these a reader cannot tell which form is the proof's and which is this roadmap's. The declarations exist, and their forms differ:

- 9.6 (a): `Formalism.MainNotions.Lnk.Frame_at` (`QuadraticLogDerivCongr.lean`, line 188) has the left side `s̄ − log|W| − (1 − δ_bad)^{−1}(…)`, with the logarithm of the number of words subtracted. The README's inequality has no such term, so it is the sharper one; it rests on SlopesOfHermitianVectorBundles §5.5, which has none either.
- 10.4: `Formalism.RankGapBounds.WeightedMeanData.Data.MeanBoundSecondForm` (`Formalism/RankGapBounds/MeanBoundSecondForm.lean`, the file cited for 10.2 and 10.3) concludes the inequality for the mean over the translates, with an error containing the mean of `log|W|`; the README states it at every translate.
- 10.10: `Formalism.HC.ChebyshevInequalityOnWindows` (`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean`) for the level `Formalism.HC.Level.cyc ψ` bounds the same weighted sum (`Level.Gm`: weight `1` at the trivial character, `1/(3o + 1)` elsewhere) by `x^{1/2 + (e_D + e_L + 7)ε}` on the windows of a family, with the window exponent left as a parameter; the README fixes `9ε` and `3/2`.

None of this makes a README statement false: `log|W| ≤ (k − 3)·log 2` is far below the budget, and `9 ≥ 3 + 4` by FrobeniusRestrictedRieszSums §1.9. Add the three locators with one clause each saying how the proof's form differs, as the README does at 10.6a.

## C04 — The description says the README attributes no individual statement to the formal proof; at this head it attributes about forty

The description reads: "The README cites the formal proof as the provenance of its *NEW* targets and attributes no individual statement to it." The head gives 43 locators of the shape "(a): [FormalProof], file (declaration)" in the README and eight more in the docstrings of `Suggested.lean`, and 10.6a opens "[FormalProof] establishes the size conditions of 10.6a–10.6d for one choice of constants". The sentence would be right as: "The README cites the formal proof as the provenance of its *NEW* targets and, where that proof states a target or a step, names the file and the declaration."

## N01 — "The mathematics of this roadmap follows a complete formal proof"

The first sentence of **Routes** (line 146) says the roadmap follows a source. The layers are organised by the mathematics and not by the source's directories, so nothing but the wording is at stake; "The *NEW* targets of this roadmap are established by a complete formal proof ([FormalProof])" would say the same without the verb.

## Questions for the author

- 10.6 (lines 967–969) says that in the construction of [FormalProof] the band constant "is the square of the last of its constants". I found the band `rhoP` and its condition `rho_le` in `Formalism/LocalRingCardinality/DataParams.lean` (lines 51 and 163), with a constant `Crho`, but not where `Crho` is set to a square. Which declaration fixes it? The sentence has no locator.
- Does the formal proof fix the window exponent `3/2` of 10.7 (b) and 10.10 anywhere? In `TopWin.lean` and `Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean` the exponent `la` is a variable with `1 < la`, and I did not trace its instantiation. If `3/2` is this roadmap's choice (from UniformWildKernelBounds §7.6), 10.7 could say so.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 9.1 (a), (d) | source `StdSlopeLow`, `Slopes`, `SlopeMaxC` | lower bound `−(Σν·log N + log c_ν)`; `−C·n_T·a·La(1 + m/k) ≤ μ`, `μ_max ≤ C·n_T·a·La`; `log(4k⁴v²)`, `v = rd_E/2`, equals `log(k⁴rd_E²)` | matches |
| 9.1 (b), (c) | index `T^f`, rank `k`, degree `2f` | `μ̂ = f·log T/(2fk)`, `μ = log T/k`; mean of `Σ_a⟨y_a,y_a⟩ ≤ k·2fk²rd_E²/(2f) = k³rd_E²` | holds |
| 9.2 (a)–(c) | `d^{all}/d ≤ 1 + 4f/T`, `T ≥ b³`, `b ≥ 4f` | `(4f/T)·b² ≤ 1`; loss `≤ S + 1 + 4𝔦_tot + ℓ_T + CX″` with `S = Σ sz(τ_N)` | equals `𝔏_u` plus `S` |
| 9.3 | `U(3)` | `∏_{a<b}(b − a) = 1·2·1 = 2 = 0!·1!·2!` | holds |
| 9.4 (b), Check | `r = k + m − 1`; `m = 2` | `r(r+1)/2 + k − k(k+1)/2 = m(2k+m−1)/2`; `2k + 1`; factorials `∏_{i=k}^{r−1}(i!)^f` both sides | holds |
| 9.4 (c) | source `Count_at`, `Sizes3b` | lower bound with `m·log(g₀g₁) − C(La + m²La/k)`, upper `C·m·L`; ratio `T(u)/T(u′) ≤ A`, `Vand ≤ A^k` | matches |
| 9.5 (a)–(c) | source `StandingNumericalData`; `M = ⌈3Γ₀²x^{c_H}⌉` | inner entries `v − ½` or `v − ½ − Δ`; gap in `[4kΔ, 8kΔ]` off tops; `Σd^{all} ≥ M·D*/(3Γ₀²) ≥ x^{c_H}D*` | matches |
| 9.6 (a) | SlopesOfHermitianVectorBundles §5.5; source `Frame_at` | `e_frame ≤ 2/1600 = 1/800`, `κ_e ≤ 4`; supplier form has no `log|W|`, source form has | holds; C03 |
| 10.1 Check | `χ_K(p^i)` inert, split, `d` | `1 − χ_K = 2` (inert, `i` odd), `0`, `1` at `d`; `w·Σ(1−χ_K)Λ(n)(y/n − 1) = Σ(a/n − w)₊` | holds |
| 10.2 | `2^n ≥ x²`, `d ≥ x²`; source `Loss_at … C 0` | short orbits `≈ 16x^{11ε/12 − 2} ≤ 1/x`; `2x·log d/d ≤ 4 log x/x ≤ 1`; exponent `e_L = 0` | matches |
| 10.3 | expand `ph`, `log Ω`; source `Main`, `logOm`, `DIV` | `−m·a·log(2π/rd_E) − m·a·log(rd_E/2π) = 0`; remainder `Σ_j a(log a − 1 − γ + L′/L − mean log w_j)` | exact; matches |
| 10.4 | ledger (A)–(D); source `MeanBoundSecondForm` | `F_tot` and `m·A_top·log(g₀g₁)` cancel; `u·log(1+H/u)` increasing; source in mean over `u₀` | holds; C03 |
| 10.5 | `e_D = 1`, `200Q ≤ y` | `𝔈₁..₇ ≤ C·yℰ + (12Cy + 4C + 1)ℰ`; `U_F ≤ (10y + 3)Cℰ + 1`; `𝔈₈ ≤ 120Qy²ℰ`; total `≤ (y²/200 + 3y³/4)ℰ` | holds |
| 10.6 Check | `ε₀ = 1/52` | `T_O`: `312+33+7.5−0.5 = 352`, `ε`-coefficient `1015.0625`, `371.52 < 377`; `n_W`: `21.5 + 58.0625ε`; `c_Θ = 15/8` | holds |
| 10.6a | margins; source `Ranks`, `SizesAt` | `SizeW`: `x^{21ε/16}`; `SizeK`: `x^{5ε}`; `r + 5 ≤ t`, `k, m` even, `t` odd, `m ≤ f ≤ k` in `Ranks` | matches |
| 10.6b | ThetaChainsOnDefiniteUnitaryGroups §§2.3a, 2.3b; source `lStar`, `LinkIRR` | off tops `u_0 − v_0 = Sc + ½ ∈ [Sc, 2Sc]`; `a⁻ ∈ [b′, 3b′/2]`; `δ_bad ≤ exp(−x^{e/7})` | matches |
| 10.6c | source `p0`, `rhoP`, `LinkG_at` | `p₀ = k²x^A`; `ρ_B = 4N*·x^ε·Λ/k + C·log x·Λ/k`, `4N* = 4fδ_top`; gain `≤ 4n_T·a/p` | matches |
| 10.6d | `L_th`; source `nW`, `DF_kaR_le` | `L_th ≤ 4050·log x + 60/ε + 34`; `n_W = C·r(f + f²(k−1)³L²/m)` | matches |
| 10.7 | pair `(19, 526679)`; `c_box` | `526679` prime, `≡ 7 (16)`; `d + 1 = 2³·3²·5·7·11·19`; `2.25·(ε/5)/c_box ≤ 3.6ε/ε₀ < 4` | holds |
| 10.8 (a), (b) | `e_diag < 1`, `T ≥ 3`; source `dall_pos` | `‖K − 1‖² = d^{all} > e_diag·d^{all}`; `d_u(T−1)^f = d^{all}(T−2)^f > 0` | holds |
| 10.9 (a), (b) | source `Loss_at`, `LossF`, `AdmT` | `Loss_at`: loss inequality; `LossF`: one weight vector for all indices; `AdmT`: twelve DVR statements | C01, C02 |
| 10.10 | `ω₀ = 3/4`, `o = 4`; FrobeniusRestrictedRieszSums §1.9 | `(1/4)/(1 + 3(o−1)/4) = 1/(3o+1) = 1/13`; `ν = 4/13, 3/13`, sum `1`; `(3 + 4)ε ≤ 9ε` | holds |
| 10.11 | `ε′ = min(ε₁/2, ε/10)` | `9ε′ ≤ 0.9ε`; windows lie in `[1, ∞)`; weights `1`, `1/(3o+1) > 0` | holds |
| Lean `HasWindows` | source `Formalism.HC.HasWindows` | source: `∃Y ≥ y`; Lean: `∃Y ≥ max(Y₀, 1)`; take `y = max(Y₀, 1)` | equivalent |
| Lean `rieszRemainder`, `cyclicFamily`, `familyWeight` | source `gChi`, `Gz`, `Level.cyc`, `Level.wt` | trivial case `Σ − y·log y + (1+γ)y`; family = image of `zpowers`; weight `(3o+1)⁻¹`, `o = card` | matches |

- Source locators: all 43 locators of the README and the 8 of `Suggested.lean` into [FormalProof] resolve to an existing file that declares the name; 27 declarations opened and compared with the README's statement; [Announcement] read (4 pages).
- Supplier sections read at their heads: ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.3, 2.3a, 2.3b; FrobeniusRestrictedRieszSums §1.9; SlopesOfHermitianVectorBundles §5.5; PositivityOfDirichletSeriesWithKernels §6.9 (a); GeneralizedRiemannHypothesisFromWindowBounds §4.2 (consumer); the sibling `Suggested.lean` files define the same bundle, remainder, family and windows.
- Library declarations opened at the pin: `Mathlib/NumberTheory/Chebyshev.lean:191`, `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:313`, `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean:131`, `Mathlib/NumberTheory/NumberField/CMField.lean:70`, `Mathlib/Algebra/Module/ZLattice/Covolume.lean:73`; no Hermitian lattice, Arakelov degree or algebraic modular form in the pinned Tau Ceti.
- Dependency check: `depcheck: 170 roadmaps, 1989 edges, 0 problem(s)`; no change outside the folder and the family index.
- Elaboration: `Suggested.lean` gives two `sorry` warnings and nothing else; `#check @` of both theorems equals the README statements; `simp` closes neither theorem; no section variables, no `set_option`.
- The worker's automatic checks all passed.

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups, FrobeniusRestrictedRieszSums; nothing shared (each names this roadmap as the owner of 9.2, 9.6, 10.0–10.7 and as consumer of its own sections; the word code is defined in ThetaChainsOnDefiniteUnitaryGroups §2.3 and counted here).

Source independence: 8 passages compared with 2 sources ([FormalProof], Lean code without prose; [Announcement]), none shared; largest share FormalProof, 43 of 43 located citations; contents compared with FormalProof (its directory tree): independent, the locators of each layer are spread over unrelated directories.

Research link: Layers 9–10 conclude the announced formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), assembling Bost's slope inequality (1996), the Chowla–Selberg period (1967), the mass formula of Gan–Hanke–Yu (2001), Harish-Chandra's formal degrees (1966) and Banaszczyk's transference (1993); README Summary and References, [Announcement] lines 9–13.

## Not verifiable

- That each cited proposition of [FormalProof] is proved there for the chain: many locators point at definitions of propositions (`Slopes`, `DIV`, `Count_at`, `SizesAt`, `StandingNumericalData`), and I compared their statements without tracing where each is discharged; the source was read, never built.
- The works of the References other than [FormalProof] and [Announcement] are cited without theorem or page, as provenance of *KNOWN* ingredients; there was no locator to check.
- The supplier sections not listed above were checked for existence at their heads by the citation resolver only.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets (9.6, 10.4, 10.10, 10.11) rest only on [FormalProof], an unrefereed Lean formalization announced 20 November 2026; [Announcement] lines 9–13 and 72–76 say only Lean is presented. No refereed source states them.
- Licence: the locally held copy of [FormalProof] (directory `src/` of the repository the README names) contains no licence file; the sources service does not classify the repository's host.
- Licence: `HasWindows`, the bundle `PrimitiveDirichletCharacter` and `rieszRemainder` of `Suggested.lean` have the shape of `Formalism.HC.HasWindows`, `Formalism.HC.PChar` and `Formalism.HC.An.gChi` of that repository (`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/`), with bodies rewritten.
- Not tested: the formal proof was not compiled or kernel-checked in this review; agreement was checked statement by statement at the locators.
