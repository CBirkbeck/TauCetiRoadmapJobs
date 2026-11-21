# Review of ThetaChainsOnDefiniteUnitaryGroups (pull request #2918 at ce7c6df)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsOnDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. Every lemma, Check and worked example I recomputed holds, and all 69 file-and-declaration locators into [FormalProof] exist; the declarations opened for the fifteen sampled sections state what the README records. The range of 3.1d and 3.3 is now stated truthfully: [FormalProof] covers the hosts with `d ≡ 7 (mod 16)`, and the wider form is marked as resting on steps with no proof. There are three small corrections and two format notes, none blocking. The human reviewers decide the scope and licence questions about the formal proof.

## C01 — The introduction of Layer 3 calls `𝕃` the coefficient field; it is the field of places

A reader of Layer 3 is told that "`𝕃` is the coefficient field of 2.6 read in `ℂ` through `σ₀`" (line 1483). The Conventions (line 29) and 2.6 (lines 1023, 1033) give that name to `𝕂`, the explicit field with the size bound, and call `𝕃` the field of places, for which "no bound … is asserted or used". Layer 3 does use `𝕃` throughout (`𝒪_𝕃`, the places `𝔭`, `c_𝕃`), so only the name is wrong; as written, the size bound of 2.6 appears to apply to the field in which the forms are rational. Replace "the coefficient field" by "the field of places" in that sentence.

## C02 — The skew element `δ_T` is the declaration cited in 2.2 only at the unit ideal

2.2 cites `Formalism/LocalRingCardinality/DataHost.lean` (`Formalism.BasicNotions.Host.xi0`) for the spaces and the lemma (line 454), and 2.2 (f) defines `δ_T := −1/√−d` with `(δ_T)·𝔞₀𝔞̄₀·𝔇_{E/ℚ} = 𝒪_E` (lines 419–420). In that file (line 149) the element is `−1/(N(𝔠)·√−d)` for an auxiliary ideal `𝔠` of `K` carried by the host, and the identity the proof records is for `𝔠𝒪_E·𝔞₀` in place of `𝔞₀`. The two agree because the construction takes `𝔠 = 𝒪_K` (`GlobalTheory.EX.HostVal`, `Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean`, line 83). A reader who matches 2.2 (f) with the declaration finds another element and no explanation.

The Conventions promise that the form the proof establishes is recorded at the target (lines 147–148). One clause at the locator would do it: `δ_T` and `𝔞₀` are `xi0` and its ideal at `𝔠 = 𝒪_K`, the value of the construction; the general `𝔠` gives a skew element in `ℚ_{>0}·δ_T`, which 2.2a already allows.

## C03 — The description says each statement is given "in the generality in which the statement holds"; for 3.1d and 3.3 the README says otherwise

The description reads: "each sub-roadmap states as targets what that proof establishes, in the generality in which the statement holds, and says so where a route is not written out." At this head 3.1d and 3.3 are stated for every prime `d ≡ 7 (mod 8)`, and the README says that outside the hosts of FrobeniusRestrictedRieszSums §0.4 they "rest on steps for which this roadmap gives no proof" (lines 260–263, 1780–1782, 1998–2000). The description also gives the host only as `d ≡ 7 (mod 8)`, while the Summary now adds that the chain is built on the cyclic hosts with `q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)` and layer `n ≥ 2`.

Text that would be right: "each sub-roadmap states as targets what that proof establishes; where a target is stated more widely than the proof (here 3.1d and 3.3, proved for the cyclic hosts with `d ≡ 7 (mod 16)`), the README names the steps that have no proof."

## N01 — "The mathematics of this roadmap follows [FormalProof]" (lines 142 and 2472; `Suggested.lean` line 28) reads as the statement the planning principles exclude. The arrangement is in fact the roadmap's own (the locators of consecutive sections jump between unrelated directories of the proof), so "states what [FormalProof] establishes" would say what is meant.

## N02 — 2.3a carries no locator (line 777), although its construction is `GlobalTheory.EX.HCVal` in the file already cited in 2.1 (`…/GlobalTwisting/PairRowIffQdRows.lean`, line 104): the same `v_l = (k − 2 − l)·4Δ_w`, `u_0`, `u_{k−1} = −½`, `e′_i = b₁ + i·h₀`, `e_i = e′_i + h₀/2` and the three base points. Naming it would give the existence statement its reference.

## Verified sound

| Statement | Instances | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 2.1 ranks, lemma | general; `ε = 1/6`, `x = 32, 64` | `n_j − N_j = m − 1 − j`; `t ≥ 7fr`; `m ≥ 4`; `k ≥ 100` | `r + jt − k − j(t+1)`; `(8f−1)r + 4 ≥ 7fr`; `64^{1/3} = 4`; `32^{4/3} = 101.6` | holds; `Ranks`, `RankVal` agree | — |
| 2.1 `rd_E` bound | `ψ` modulo 4; general `H₂` | `rd_E ≤ (Q_S/2)√(qd)`, equality for `ψ` mod 4 | `Σe(χ) ≤ (v−1)\|H₂\|`; for all characters mod `2^v`: `Σ_{j<v}\|H₂^{(j)}\| = 2^{v−1} = \|H₂\|` | holds; `FactRd` agrees | — |
| 2.1 construction | `ε₀ = 1/52` | `A_max = 28/13`; margin `x^{0.30ε}` in `SizeW` | `2 + 8/52 = 28/13`; exponent `4.5 + 9.6975ε` against `4.5 + 10ε` | holds; `Scale.eps_lt` is `1/52` | — |
| 2.2 spaces | `j` odd, even; `j = 0, m−1`; `ℚ(√−3, √−7)` | signature `(n_j − ⌊(m−j)/2⌋, ⌊(m−j)/2⌋)`; `Y_0`: `(k+m/2−1, m/2)` | odd: `h_j = (m−1−j)/2`; even: `h_j + 1 = (m−j)/2`; `−7 ≡ 2 (mod 3)`: `3` inert | holds; `Ranks.sigY0 = (k + r_S, r_S + 1)` | C02 |
| 2.2a (d), Checks | ranks 1/1; ranks 2/3, `m_S = −20`, `m_T = −21` | `a = b = ½ − w`; `a = b = −9`; descent `(9/2, −7/2)` | `(1 − 2w)/2`; `(3−21)/2 = (2−20)/2`; `(4,−3) + ρ₂`; shift `(m_T − m_S)/2 = −½` | holds | — |
| 2.3 separation | general `j`; last row of first block | `ν_j` rows `(w_j − w_i) − (j−i)(t+1)`; last row `> (4j−3)/2` | block `i`: `(N_{i−1} − N_j)/2 − (j−1−i)(t+1)/2`; `[2(j−1)(t+3) + t + 2 − (2j−1)(t+1)]/2` | holds; `HCParam` has the gaps `(t+3)/2` | — |
| 2.3 (g), (h), Check (iv) | `ζ` of order `n ≥ 3`; top row step | `N_{E/K}(ζ) = 1`; distance `≥ t + 2N_m³ + 3`; shift `−½` at odd stages | `K ⊄ ℚ(ζ)` since `d − 1 > 2`; `(W3) + (t+3)/2 − (t−1)/2`; `b = n_{m−1}/2 − w_m` | holds; `Host.MuCond` is `(U_j)` | — |
| 2.3b lemma (f) | top, thin, thick places | `λ_0 = a_τ`, `λ_{k−1} = −a⁻_τ`; `w_j ≤ 2b′`; `η_w ≤ 2ϑ + t + 1` | `u_0 − (k−1)/2`; `3b′/2 + b′/x + b′/4`; `(w₀ + ϑ + 1) − (w₀ − ϑ)` | holds | — |
| 2.3c thresholds | `r = 12, 13`; `m = 2`; general | `100r⁴ > 1000(r+1)³` for `r ≥ 13`; `r ≥ 1801`; `a(h_gap/4) > 2.6r^{18.5}` | `2856100 > 2744000`, fails at 12; `29·32·16 = 14848`; `120/(32√2) = 2.65` | holds; `szlStar`, `SizeLstar` agree | — |
| 2.3a existence | every kind of place | windows of width `m·h₀`; `\|μ_E\| ≤ 8f²`; one `s₁` | `w_m ≤ w₀ + h₀/2 + (m−½)h₀`; `n ≤ 2φ(n)² ≤ 2(2f)²`; `τ₁(ζ_E)` of order `\|μ_E\|` | holds; `HCVal` is this construction | N02 |
| 2.4 (a), (b), Checks | `x ∈ F^×`; `x = √−d`; `x = 1 + ζ`; `ℚ(√−3, √−7)`; `o_δ = 6` | `(★)`; `i^f = 1`; phases cancel; fails at `√−7` | product formula; `4 \| f`; `Σθ_τ = 0`; `−3 ≡ 2² (mod 7)` so `η = 1`, `i² = −1` | holds; `nonempty_hFrame` gives `μ_j`, `η̃`, `δ`, `δ′` | — |
| 2.4 Check (vi) | `𝔓 = (α)` of norm `p` | `η̃(ϖ_𝔓) = √p/N_{E/K}(α)` | `∏\|τ(α)\| = N_{E/ℚ}(α)^{1/2} = √p` | holds | — |
| 2.6 size | `L ≥ 4`, `f ≥ 8`; three curves | `log h_E ≤ 10fL`; `log h* ≤ 51fL`; `(√−3(x₁−x₂)(x₃−x₄))³ = ±Δ` | `6fL`; `50fL + 4f`; `±368`, `±4400`, `±1404928` for all pairings | holds | — |
| 2.7 exceptional sets | `𝔅(3, 11)`, `𝔅(3, 19)` | `{2,5,7,11,19}`, `{2,3,5,19,127}` | `10, 120, 1330 = 2·5·7·19`; `18, 360, 6858 = 2·3³·127` | holds | — |
| 2.8 level prime | general `T` | `1/2 ≤ ď^{all}Γ₀²/D* ≤ e`; `3/8 ≤ ď_uΓ₀²/D* ≤ e`; `log(dM²) ≤ 73x^ε` | `(T/T*)^{fk}(1 − T^{−k})^f`; factor `≥ 3/4`; `6x^{ε/5}log²x + 72x^ε` | holds; `VandermondeCountExplicit` has `1/2` and `e` | — |
| 2.9 Check, 2.9c | `h = (A B; 0 D)`; parahoric `(r, n − r)` | `ω̄(1, h)Φ = χ(A)^{−1}c(det D)^{−1}Φ`; `ω̄(g, 1)Φ^Q = c(det g₄)Φ^Q` | `c(det A det D)^{−1}χ(A)^{−1}c(det A)`; `c(det g)c(det g₁)^{−1}` | holds; `LocE.JQ` is the two-lattice stabiliser | — |
| 2.9a lemma (a), (c) | general `k, m`; `ℓ ∉ 𝔅(r, g)` | exponent `m(2k+m−1)/2`; quotients of order `> g^{1/4}` | `k + (m−1)k + m(m−1)/2`; `(g−1)/(4m) > g^{1/4} ≥ ℓ^{v_ℓ(g−1)}` | holds | — |
| 3.1 lattices | `GL₂`, `λ = (2, 0)`; `N = 1` | `⟨xy, xy⟩ = 1/2`; `Δ_ℤ = ℤx² + 2ℤxy + ℤy²` | `1!1!/2!`; dual of `ℤx² + ℤxy + ℤy²` | holds; `Forms.IntSpan` spans integral polynomials | — |
| 3.1a theta data | `E = K`, `ω = (1+√−d)/2` | `Q_A = N(x)`; `Im H_A = ±1`; semicharacter product `−1` | `\|x\|²`; `Im ω̄/(√d/2) = −1`; `((9+d) − 4 − (1+d))/4 = 1` | holds; `Hf`, `al` agree | — |
| 3.1c constant `s₂` | `d = 7, 11, 19, 43, 67, 163`; `d = 7` at `ω₀/2` | `√−d·s₂ = 1/4, 2/3, 2, 12, 38, 724`; `θ₀″(0) = ±2√−7/7` | `0.25, 0.6667, 2, 12, 38, 724`; `\|℘ + s₂\| = 0.7559 = 2/√7`, `\|s₂\| = 1/(4√7)` | holds; `HalfValuation` is `v_d(s₂) ≥ −1/2` | — |
| 3.1d family | range of hosts | [FormalProof] for `d ≡ 7 (mod 16)`; wider form on steps not given | `exists_thetaVectorFamily_of_curveDatum` quantifies over `D7`; `HostHyp` has `d % 16 = 7`, `q % 8 = 3` | as stated | C03 |
| 3.2 dictionary | `N_{j−1} = 2`, `N_j = 4`; general | `a_v = −s♯_j`, `b_v = −s_div,j`; output `(λ − (1,1), (1−w)²)` | `(N_j − 2w_j)/2`; `(ν,0,0) − (w−1)`; `ν_j − s♯ = Λ_{j−1}` | holds; `sSharp`, `sDiv` agree | — |
| 3.5 chain lift | unramified `ξ`; index `ι` | `col_ξ = (m^{(m)})^s col (m^{(0)})^{−s}`; factor `ι` | `ρ^ξ/ρ¹ = ξ̃^{−s}`, `ρ′^ξ/ρ′¹ = ξ̃^{s}` cancel; class sum over `K′` is `ι` times | holds; `ColumnChain.col`, `wt` agree | — |
| 3.6, 3.10 (H3) | `Γ = {±1}`; `m` steps | `K_j1 = 1/2`; `D_Γ^m·col_ξ` integral; primes `≤ 2fN_m + 1` | `\|Γ\|^{−1}·1`; one weight per level `0, …, m−1`; `p \| M(n)` iff `p − 1 ≤ n` | holds; `DGamDvdF`, `log_minkM_fN` agree | — |
| 3.7 operators | `q_v = 3`, `N_j = 1`; general | `Gs_vGs_v^D = q_v − Tr_v`; `Σ\|FF*φ\|² = 6`; `U_vD_v = q_v^{N_j−1}` | `Σ_{a′}χ(a′(b−1)) = q−1` or `−1`; `2·3`; `n(fn) = q^{N−1}`, others cancel | holds | — |
| 3.8 (H4) | `T = 3`, one orbit; general | rank `1`; slope `−log 2`; `\|Cl_0\| = mass·i_col·(T^k − 1)^f` | `2·(1/2)`; Gram of `ℤ(1,−1)` is `2`, `μ = 2μ̂`; `T^k − 1` functionals | holds; `ClassNumberFormula₂` agrees | — |
| 3.9 branching | `N = 6`, `λ = (1⁵, 0)`; `GL₂ ↓ GL₁`; norm-`T` vectors | `c_Br = −120`, `> 64`, `< 7⁵`; `(−1)^{D₀}D₀!`; only `ζz_u` | `∏_{j=0}^{4}(j−5)`; `2⁶`, `16807`; `T·Tr⟨a,a⟩ ≥ Tf > f` forces `a = 0` | holds | — |
| H1 (2.4 (a)) | `E = K`; `x = −1` | no unramified `χ` at `d`; `(−1)^f = 1` | `χ_K` nontrivial on `ℤ_d^×`; `f` even | holds | — |
| H2 (3.3, 3.4) | scaling; weights | `\|s_Λ\|² = area/π`; `s_div − s♯ = (t+1)/2` | `\|δ_K\|²√d/(2π)`; `(N_j − N_{j−1})/2`; `FactSDivSharp` | holds for the hosts of [FormalProof] | C03 |
| Layer 3 introduction | name of `𝕃` | "the coefficient field of 2.6" | 2.6 and Conventions: `𝕂` coefficient field, `𝕃` field of places | mislabelled | C01 |

- Source locators: all 69 file-and-declaration locators into [FormalProof] resolved (file present, declaration declared in it); 31 declarations opened and compared with the README; [Announcement] read in full (190 lines).
- Library declarations opened at the pins: `NumberField.exists_ideal_in_class_of_norm_le` (Mathlib/NumberTheory/NumberField/ClassNumber.lean:78), `Matrix.unitaryGroup` (Mathlib/LinearAlgebra/UnitaryGroup.lean:105), `NumberField.IsCMField` (Mathlib/NumberTheory/NumberField/CMField.lean:70; no CM type), Tau Ceti `HeckeCharacter` (NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70), `finiteComponent` (…/FiniteComponent.lean:85), `complexComponent` (…/InfinityType.lean:150), `globalArtinMap` (NumberTheory/ClassFieldTheory/Global/Reciprocity.lean:151).
- Cross-roadmap citations: none unresolved; opened RieszSumsOverPrimesAndExceptionalZeros §1.7b (iii) and §2.9b (iv)(c′), FrobeniusRestrictedRieszSums §§0.3, 0.4, 0.9, and the charts of SeesawForThetaChains.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 1996 edges, 0 problem(s)`. No change outside the folder and the family index.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no messages; it declares nothing, so there is no `#check` comparison and no one-tactic probe to run.
- Headlines: four, none stated; the docstring names each with its missing carriers (CM types and the unit identification at split places; algebraic modular forms on unitary groups; Weyl lattices; Hermitian lattices with slopes), which the pins lack as checked above.
- Numerical work (plain Python): `√−d·s₂` for six `d`, `θ₀″(0)` at `d = 7`, the cube identity of 2.6 on three curves, the sets `𝔅(3, 11)`, `𝔅(3, 19)`.

Overlap check: read SeesawForThetaChains, ThetaChainsAndFrobeniusPrimeSums, GluedTargetAndDivisionInequality, LocalGainOfThetaChains, RowTowerAndRallisIdentities, CongruenceModulesOfThetaLifts (open; none close on main). Each assigns the chain data, levels, CM theta functions, step operators, chain lift, source lattices and periods to this roadmap's Layers 2–3; SeesawForThetaChains owns the charts, which this roadmap only points to; nothing shared.

Source independence: 9 passages (the Summary, the Conventions on routes, 2.1, 2.3a, 2.8, 3.1d, 3.5, 3.8 and the `Suggested.lean` docstring) compared with 2 sources, none shared ([FormalProof] is Lean code without prose; [Announcement] lines 32–38 and 158–169 share only "theta lifts" and "definite unitary groups"); largest share [FormalProof], 69 of 69 file locators; contents compared with the directory tree of [FormalProof]: independent (2.1, 2.4, 2.8 and 3.8 each draw on three or more unrelated directories, and no run of sections follows one directory).

Research link: Layers 2–3 build the chain of theta lifts between totally definite unitary groups on which Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026) rests ([Announcement] lines 158–169), with the theta correspondence (Kashiwara–Vergne 1978; Howe 1989) and Gross's algebraic modular forms (1999) as inputs; README References and [Announcement].

## Not verifiable

- 2.9c: the exponents `p^{2m}` and `p^{4m+1}` of the column levels against `GlobalTheory.T.congruent_one_mem_step_levels_character_one`, which is stated for an abstract exponent `cst.D`; I did not trace its value.
- 3.1d (o), (a), the bound of (c), the eighth-power law of (f), and the identification of 3.3 (i), for hosts with `d ≢ 7 (mod 16)`: no source and no route, as the README says.
- Gross1999, KashiwaraVergne1978: settled as uncertified and cited without theorem numbers; not opened. Weil 1955, Howe 1989, Mumford, Shimura 1976, Linnik: cited as credits; not opened.
- [FormalProof] was read as source text only; it is not built here, so that its declarations are proved was not checked.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof] (README line 2472), an unrefereed Lean formalisation by one author announced 2026-11-20 with no paper; [Announcement] lines 45–49 say a write-up is to follow. The family's end theorem is the Riemann hypothesis for Dirichlet L-functions.
- Scope: 3.1d and 3.3 are stated for every prime `d ≡ 7 (mod 8)`; outside `d ≡ 7 (mod 16)` the README (lines 260–263, 1780–1782, 1998–2000) says they rest on steps with no proof, here or in any source.
- Licence: the licence of [FormalProof] is not established here. The README links its public repository (line 2472); `Suggested.lean` declares nothing, so no declaration is taken from it.
