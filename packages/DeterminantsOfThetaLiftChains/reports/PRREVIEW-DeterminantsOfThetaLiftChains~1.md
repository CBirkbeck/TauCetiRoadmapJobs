# Review of DeterminantsOfThetaLiftChains (pull request #3160 at c12c899)
Folder: `TauCetiRoadmap/ShortGRH/DeterminantsOfThetaLiftChains/`
**Verdict:** needs changes

**Summary.** The sampled statements agree with the formal proof they point to and with the arithmetic of Theorem C, with one exception: 6.2 applies the `j`-th power of the twist twice. The blocking problems are in the supply. A supplier roadmap the proof of Theorem C relies on, `NormsOfThetaLiftsAndExchangeIdentities`, exists nowhere. The 27 prerequisites labelled "ShortGRH background" have no owner, although several are stated on main. Theorem C is stated as a target here and again in OneSidedPrimeSumBoundsAndAdmissibleData §5.5, and three sibling roadmaps both supply this one and consume it. The exchange identity restates ThetaLiftsForDefiniteUnitaryGroups §6.11. The layout and the method lines follow the formal proof's table of contents and docstrings, and the pull request also edits the umbrella outside its folders. There are four small corrections and three format notes; scope and licence questions are left to the human reviewers.

## R01 (P1) — Results this roadmap rests on are cited from a roadmap that does not exist, and one cited result is absent from its supplier

The proof of Theorem C takes its decisive input from `NormsOfThetaLiftsAndExchangeIdentities`: in 6.2 (line 1219), "along a regular family, `Z_j(1)/Z_j(ξ_ι^j)` has height at most `d·k·(log b·β_tot − h_dir)`", the bound through which the `m` lifts give back `h_main`. An implementer cannot find it anywhere. The name is also cited in the summary (line 19), in 1.3 (false lifts, test forms; lines 225–227, 237), in 5.4 (steep parameters; lines 972, 984) and in 5.5 (the pairing lower bound; line 1012). The Conventions (lines 31–32) say that a name outside ShortGRH is a roadmap of RiemannHypothesisForDirichletLFunctions. That family on main has no such roadmap. A search of main and of every open roadmap pull request finds the name only as a citation inside this pull request, whose index lists nine members and not this one.

Of the same kind: 2.2 (line 350) cites SecondMomentsOfPoincareSeries for "Hecke eigenforms span the forms of level `J_M`", but that README states no result about eigenforms (the word does not occur in it).

Smallest change: add the roadmap that states these results (false lifts, test forms and rank-one lifts of main pairs, steep parameters, the Laplace lower bound, the cost of one lift), or state them here as targets. Correct the Conventions sentence, and point 2.2 at a section that states the spanning by eigenforms, or state it here.

## R02 (P1) — The 27 prerequisites labelled "ShortGRH background" have no owner, and several of them are stated on main

The Conventions (lines 33–34) define the label as naming a result "that the family uses and does not state as a target of its own roadmaps". Some of these are substantial theorems: the Rallis inner product formula for sharp data (2.2, 4.2), the Weil representation and Fock model of unitary pairs (Conventions, 3.1), Tate integrals and the functional equation of `L^S(s, ν)` (3.6), Poincaré series on adelic unitary groups (5.4), and branching and integral duality of Weyl modules (5.10). Every one of them is needed by a target and owned by none: the label occurs 27 times, and the family index has no background roadmap or section.

Several are stated on main and should be cited:
- the Rallis formula in Weil's convergent range is ThetaKernelsForUnitaryDualPairs §6.13a;
- the global Weil representation and the Fock model are its §§4.4a and 3.45;
- constant terms along an isotropic line and the archimedean cone lemma (the tools of 3.6–3.7) are its §§5.7c and 5.7e;
- class sums for definite groups are ThetaLiftsForDefiniteUnitaryGroups §1.2.

Smallest change: replace the label by these section citations, and for each remaining item name a supplier section or state it as a target here.

## R03 (P2) — 6.2 (a) and (c) apply the `j`-th power of the twist twice, so (c) does not follow from (b)

Under the Conventions (line 116), `Z_j(ϑ) = vol(Θ_{j,ϑ^j}|𝒢(W_j))` already carries the power. So `Z_j(θ_ι^j)` in 6.2 (a) and (c) (lines 1209–1216) and in the *Needs:* line (1219) is the volume of the lift twisted by `θ_ι^{j²}`. But 6.2 (b), which is 4.4 (c), factors `Z(1)/Z(ϑ)` through `Z_j(1)/Z_j(ϑ)`. For `j ≥ 2` the hypothesis of (c) therefore bounds numbers that do not occur in (b).

Moreover `θ_ι^j` need not be an `m`-fold twist, the only twists for which `Z_j` is defined. For example, if the tame part has order `m + 2` at a place (`m` even), then `(θ²)^{(m+2)/2}` is trivial there.

The formal proof states the intended reading. Its statements are about `liftDeterminant (θ ι) j` (ShortProof-LongForms lines 143–146, 184–189), which ShortProof-NormOfChain lines 75–77 defines as the volume of the lift at `θ_ι^j`, that is, the README's `Z_j(θ_ι)`. Its docstring writes `Z_j(ξ_ι ^ j)` with a `Z_j` that takes the already-powered twist (ShortProof-LongForms line 27).

Smallest change: write `Z_j(1)/Z_j(θ_ι)` in 6.2 (a), in 6.2 (c) and in the 6.2 *Needs:* line.

## R04 (P2) — This roadmap and three sibling roadmaps supply each other, and Theorem C has two owners

No merge order can place every supplier of this roadmap before it, and the headline is planned twice:
- **OneSidedPrimeSumBoundsAndAdmissibleData.** Its §5.5 states Theorem C with the same hypotheses, the same conclusion and the same pointer (`New.Data.integral_forms_long`). Its *Needs:* line cites this roadmap for the auxiliary forms and the height of `Z(1)/Z(ξ_ι)`, and its §5.1 cites it as well. Meanwhile this roadmap takes the data, the heights (§1.2), the twisted lattices (§1.3) and the product formula (§1.4) from it.
- **CongruencesOfTwistedThetaLifts.** Its §§2.2, 2.7 and 7.3 need this roadmap's 1.1 and 1.3 (ramified and main pairs, regular families), while 6.2 here needs its §7.3.
- **SecondMomentsOfPoincareSeries.** Its §2.4 needs 2.2 here (the Rallis series), while 2.2 and 4.4 here need its §§2.3–2.4.

The dependency check reported no problem because these citations are written in words, not as section ids (C02).

Smallest change: keep Theorem C here and replace OneSided §5.5 by a citation of 6.3. OneSided's main inequality then consumes this roadmap, so that layer comes after it. Give the other two pairs a single direction by moving the shared definitions into the earlier roadmap: 1.1 and 1.3 into the roadmap that owns the data, and the Rallis series of 2.2 into SecondMomentsOfPoincareSeries or into a supplier of both.

## R05 (P2) — The exchange identity restates the complementary-space identity that ThetaLiftsForDefiniteUnitaryGroups §6.11 owns on main

On main, §6.11 proves the following. For a complementary triple `(V, V′, W)` with `dim V + dim V′ = dim W`, under its hypotheses 1–4, there is a unique `c ≠ 0` with `I_V(Φ) = c·I_{V′}(Φ′)` for every matched pair. Its §§6.3–6.6 and 6.12 supply the difference space, the constant terms, the descent of matching along planes and the constant.

3.9 here (lines 624–635) is the same identity between theta integrals of complementary spaces on matched data, and 3.4, 3.6 and 3.7 are the same steps. The README neither cites §6.11 nor says how its version differs; it has no scope section. The versions do differ: §6.11 needs `a′ < a` and `2(p + q) + 1 < ε₀`, while 3.9 allows `e = 0` and `b = 0` and adds the size `|c|² = C·L_*`.

Smallest change: cite §6.11 as the owner and state 3.9 as a variant, saying in one clause how it differs: matching by explicit functions modulo a modulus for tame characters at split places, the ranges `e ≥ 0` and `b = 0`, and the size of `c`. Alternatively, deduce 3.9 from §6.11 where their hypotheses overlap.

## R06 (P2) — The layers and sections follow the table of contents of [ShortProof]

ShortProof-CONTENTS lines 273–321 divide `New/Determinant` into five groups: "A twist for each prime", "Norms of theta lifts", "The exchange identity", "The norm of a chain of lifts" and "Auxiliary forms".
- Layers 2–5 are these groups in the same order, and Layers 3, 4 and 5 carry the groups' titles.
- Layer 1 is `Twist/FitTwists` together with `Chain/Moduli`, and 6.3 carries the title of `Twist/LongForms` (line 278).
- Layer 5's eleven sections are the eleven files of lines 311–321, almost in the same order and with the same scope each.
- Several section titles are file titles unchanged (3.12 ↔ line 297, 5.7 ↔ 319, 5.10 ↔ 320, 6.3 ↔ 278) or nearly unchanged (3.6, 3.7, 3.10, 5.4, 5.9, 5.11).
- The Conventions (line 35) call [ShortProof] the formal proof "that the family follows".

The dependency lines force only part of this. 4.3 needs 3.12, 5.7 needs 4.1–4.3, and 6.1 and 6.2 need 5.11 and 4.4, so Layers 2 and 3 must come before 4, then 5, then 6. Nothing forces the split of Layer 5: 5.2 is used only by 5.10, 5.4 only by 5.5, and 5.8–5.9 do not use 5.7.

Smallest change:
- Keep the forced order of the layers.
- Group Layer 5 by what 6.1 needs: paths and path data (5.1 with 5.3); the deep-level criterion (5.4 with 5.5); the transfer of periods from the first path to the last (5.6–5.9); and the last path (5.2 with 5.10 and 5.11).
- Title the sections in the roadmap's own words.
- Cite [ShortProof] as a source, not as the plan the roadmap follows.
- Give the main results their published locators: Rallis (1984) Proposition 1.1 (Rallis1984 line 345, p. 149) and Gan–Qiu–Takeda Propositions 11.1–11.2 (GanQiuTakeda2014 lines 2588–2617, p. 53) for 2.2 and 4.4, and Gan–Qiu–Takeda Theorem 7.3 (line 1693, p. 34) for 3.9.

## R07 (P2) — The *Method* and *Origin* lines paraphrase [ShortProof]'s docstrings and proof comments, with verbatim runs

The witnesses:
- **3.7.** The *Method* line (lines 568–570) shares 15 consecutive words with ShortProof-VanishingDescends lines 15–16: "by analytic continuation, the theta integral of `(W, V)` times factors that do not vanish at". Its *Origin* line (565–566) follows that file's lines 12–13 clause by clause.
- **3.9.** The *Method* line (line 622) shares 11 words with ShortProof-TheoremForPartners line 1075: "other splitting characters multiply both sides by the same factor `α(det g)⁻¹`".
- **3.12.** The *Method* line (line 707) shares 8 words with ShortProof-OneSquare line 13.

The other *Method* lines I compared (5.5, 5.10, 6.1, 6.3) follow the source's comments step by step in the same way.

Rewritten, the 3.7 *Method* line would read: "Remove one plane at a time. For the vectors built in 3.6 (a), take the constant term of the larger theta integral along the added isotropic line. It is a Tate integral in an auxiliary complex variable, and its continuation to `rank V − rank W/2 + 1` (which is at least `1 − k`) is the integral for `(W, V)` multiplied by local and archimedean factors that do not vanish at that point, so vanishing above forces vanishing below."

The end of the 3.9 *Method* line would read: "replacing the two splitting characters by others with the same product multiplies each side by the same character value at `det g`."

The others need the same treatment. Whether the source's licence allows the reuse is a question for the human reviewers (below).

## R08 (P2) — The pull request changes files outside its roadmap folders

`umbrellas/GRH.toml` and `umbrellas/GRH-targets.md` are rewritten (2,132 insertions and 18,337 deletions), moving the root of the umbrella GRH from RiemannHypothesisForDirichletLFunctions to ShortGRH. CONTRIBUTING.md says a roadmap pull request touches only its own directory under `TauCetiRoadmap/`. Smallest change: move the umbrella change to a pull request of its own.

## C01 — At `z = 1` the Euler product that defines `L^S(z, ν)` does not converge absolutely

The Conventions (line 55) define `L^S(z, ν)` as "the Euler product of `ν̃`". Since `ν` is a character of the compact group `[U(1)]`, `ν̃` is unitary, and its Euler product converges absolutely only for `Re z > 1`. Yet `z = 1` enters every `L_*` and every ratio of 1.1 (b) and (c). Say that `L^S(z, ν)` is the value of the meromorphic continuation; it is finite and nonzero for `Re z ≥ 1` because `ν` has nonzero weight in every use, so `ν̃ ≠ 1`.

## C02 — Citations of sibling roadmaps are written in words, contrary to the family index

The Conventions (lines 31–34) cite sibling results as `Name (result in words)`, while the family index says citations are "by section number, `<Roadmap> §k.n`". Words cannot be resolved mechanically, which is why the dependency check missed R04. The numbers I resolved:
- ThetaLiftChainsAndTheSeesawIdentity §2.4 (the grids), §2.15 (the lower chain), §§2.16–2.18 (descent pairs);
- OneSidedPrimeSumBoundsAndAdmissibleData §1.2 (heights), §1.3 (twisted lattices), §1.4 (a twist for each prime);
- SecondMomentsOfPoincareSeries §§2.3–2.4 (multiplicities, the Rallis operator);
- CongruencesOfTwistedThetaLifts §7.3 (regular families).

## C03 — The published works are cited by author and year, with no list of references

Rallis (1984b), J.-S. Li (1992), Kudla and Rallis (1994), Gan, Qiu and Takeda (2014), Kudla (1984) and Ichino (2004) appear in *Origin* lines, but there is no `## References`, and "(1984b)" points at a list that does not exist. Add the entries, for example:
- S. Rallis, *Injectivity properties of liftings associated to Weil representations*, Compositio Math. 52 (1984) 139–169, Proposition 1.1, p. 149;
- W. T. Gan, Y. Qiu, S. Takeda, *The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula*, Invent. Math. 198 (2014), arXiv 1207.4709: Theorem 7.3 (v3, p. 34) and Propositions 11.1–11.2 (v3, p. 53).

## C04 — The description says existing sections are cited and not restated, which this roadmap does not yet do

The description says: "Where a section of an existing roadmap, or a theorem already in the library, gives what the route uses, it is cited and not restated." For this roadmap, the Rallis formula and the complementary-space identity of the RiemannHypothesisForDirichletLFunctions family are labelled background or restated (R02, R05); the sentence becomes true once those are repaired. The description also does not say that this roadmap and six other members cite `NormsOfThetaLiftsAndExchangeIdentities`, which the pull request does not contain. Add: "DeterminantsOfThetaLiftChains and six other members cite NormsOfThetaLiftsAndExchangeIdentities, which is not yet in this pull request."

## N01 — The README's shape

The title is not `# Roadmap: …`, and there is no `## Scope and ownership`, `## Exact supplier contracts` or `## References`, nor per-layer `### Examples` and `### Dependencies`.

## N02 — Notation

The letter `k` stands for `r + 1 − m` (Conventions), for a bound `k ≤ μ(τ)` (3.7, 3.8) and for matrices `k ∈ GL_n` (matched functions, 3.3). Also, 3.7 defines vanishing "for `𝔠` and `σ`" and then drops `σ`.

## N03 — File-by-file pointers

Every section ends with a pointer line naming [ShortProof] files and declarations. The repository README's porting guidance asks for such a file map to sit in a secondary provenance section.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 (f) ramified ratios | trivial twist; `R^turn` | `Λ(ν,z;1)=∏\|L^𝒞\|/\|L^𝒞\|=1`; tame part `ω^{i+j+2}`, `i+j+2 ≤ 2m < 8m < ord ω` | holds | none |
| 1.2 (b) | `ϑ = 1`; `C = 0` | `\|c(1)\|² = C`, so `\|c/c(1)\| = NmQ^{k/2}F`, `e = k`; `C = 0` excluded by `c(1) ≠ 0`; ShortProof-Moduli 181–189 | holds | none |
| 1.2 (c) | `s = ±1`; `e = 1` vs `e = 5` | `L_*(𝒞∪Q,·,z) = L_*(𝒞,ν,z)·NmQ^{z²}·Λ²` via `\|L(ν)\|=\|L(ν⁻¹)\|`; places of `𝔪` independent of `e`; Moduli 398–419 | holds | none |
| 1.3 | `θ_ι = 1` | `NmQ = 1` prime to `ℓ`, ratios `1`, height `0 ≤ x₁`; definitions match FitTwists 160–235 | holds | none |
| 1.4 | `m = 1`, `m = 2` | `m=1`: empty product, `NmQ^{e/2}` height 0; `m(m−1)/2 ≤ m²` pairs, `≤ t` ratios each, `≤ m²tx₁` | holds | none |
| 2.2 (c), `c_Q` (headline input) | `ϑ = 1`; one place `q` | `c_Q(1) = 1`; `q^{rt}∏_{t<i≤t+r}(1−q^{−i})` = #(rank-`r` maps `k^r→k^{r+t}`)/`q^{r²}` `> 0` | holds | cite §6.13a (R02) |
| 3.1 (e), 3.8 (b) | `X = H ⊕ W` | `rank X/2 = rk W/2 + 1`, as TheoremForPartners 812; weight `μ > 0` so `ν̃ ≠ 1`, `L_* ≠ 0` | holds | none |
| 3.7 | `j = 1, 2` | `rk V′ − rk W′/2 = rk V − rk W/2 + j`; hypotheses as VanishingDescends 145–162 (`j ≥ 1`, `k ≤ μ`) | holds | wording (R07) |
| 3.9 (headline input) | `b = 0`; `e = 0` | `e = (a−b)/2 = rk V − n/2` as 3.1 (d); `b=0`: `Φ = Ψ(∅)·χ⁻¹∘det`, as 3.5 (b); TheoremForPartners 1045–1073 | holds | cite §6.11 (R05) |
| 3.12 | `rk A − rk A′ = 2t` | 3.9 with `a = b + 2e` gives `e = t`, `\|c_i\|² = C·L_*(…,t)`; `κ` may vanish (OneSquare 19–21) | holds | none |
| 4.1 (a) | `R = 𝔽_q`, `N = T = j = 1` | upper triangular `2×2`: `(q−1)²q = #GL₁²·q^{NTj}`; `e = NTj + T²j(j−1)/2` | holds | none |
| 4.1 (c) with 4.4 (a) | row 0, `m = 3` | squares give `(ρ,k) = (1,2),(1,3),(2,3)` = `1 ≤ ρ < k ≤ 3`, the `R^quo` product of 4.4 (a) | holds | none |
| 4.4 (c) (headline input) | `ϑ = 1` | `R^quo(1) = 1`, `NmQ(1) = 1`, so ratio `1 = 1`; `Z = \|c\|^d c_Q^{md} ∏ det Ral_j`; NormOfChain 396–430 | holds | none |
| 5.2 | `n = 0`, `n = 1` | boxes `≤ #Φ·n·β = fnβ`; `\|e\| ≤ β` only for `n ≥ 1` (RegularParameters 80–83) | holds | none |
| 5.1, 5.3 | `m = 1` | first path (`l = 0`) and last (`l = 1`) differ by one diagonal turn; `m² = 1` square | holds | none |
| 5.5 (b) | — | matches DeepLevelVanishing 38–40: level-`𝔟` forms on `Ỹ^0_0`, restricted after one real translate, detect `J_M` forms | holds | none |
| 5.10 | — | (b), (c) match LastPath 28–33: periods proportional to `Ξ` over the index of `J(𝔪₀)`; controlled count | holds | none |
| 6.2 (a), (c) | `j = 2`; tame part of order `m+2` | README `Z_j(θ^j) = vol(Θ_{j,θ^{j²}})`; formal `vol(Θ_{j,θ^j})`; `(θ²)^{(m+2)/2} = 1`, not `m`-fold | fails | R03 |
| 6.2 (c) heights | — | scalar `d·m²tx₁ ≤ db`; `Σ_j d(fa(log b)⁴/m − kh_dir) = d(fa(log b)⁴ − h_main)`; total matches | holds | none |
| 6.3 Theorem C (headline) | `n′ = d − n ≤ 4d/b²` | `n′(2x₁²b²+b) ≤ 8dx₁² + 4d/b ≤ db`; `c+2δ ≥ d(h_main − fa(log b)⁴ − 2b) ≥ d(h_main − 3fa(log b)⁴)` | holds | two owners (R04) |
| Conventions `L^S(z,ν)` | `z = 1` | `ν̃` unitary, so absolute convergence only for `Re z > 1`; value at `1` by continuation, nonzero since `ν̃ ≠ 1` | ambiguous | C01 |
| `Suggested.lean` | elaboration | no declarations; the four Mathlib names in the docstring exist at the pin | holds | none |

- Source locators checked against the text: 16 [ShortProof] passages (13 source files plus `README.md`, `CONTENTS.md` and `INDEX.md` at commit 72fead1), Gan–Qiu–Takeda Theorem 7.3 and Propositions 11.1–11.2, and Rallis Proposition 1.1. All support the README's statements or *Origin* notes, except 6.2 (R03).
- Pointer declarations: 40 names from the sampled sections, all found in the fetched [ShortProof] files.
- Library declarations opened at the pin: Mathlib `NumberField/CMField.lean:22`, `NumberField/AdeleRing.lean:56`, `DedekindDomain/FiniteAdeleRing.lean:95` and `LinearAlgebra/UnitaryGroup.lean:105`. Tau Ceti was searched for hermitian spaces over number fields, unitary automorphic forms and theta lifts: none, so the docstring's claim that nothing is statable holds.
- Cross-roadmap citations resolved: ThetaLiftChainsAndTheSeesawIdentity §§2.4, 2.15–2.18; OneSided §§1.2–1.4, 5.1, 5.5; SecondMoments §§2.3–2.4 (eigenform spanning not found); Congruences §§2.2, 2.7, 7.3; HermitianFormsAndLattices §1.1. `NormsOfThetaLiftsAndExchangeIdentities` was found nowhere.
- Sections of main read and compared: ThetaLiftsForDefiniteUnitaryGroups §§1.2, 6.1–6.3, 6.11–6.12; ThetaKernelsForUnitaryDualPairs §§3.45, 4.4a, 5.7c, 5.7e, 6.13a; RowTowerAndRallisIdentities summary and §5.7; the summary of SeesawForThetaChains. The cited ids also exist at the head of the open revision #3027.
- Automatic checks: the change outside the folders is real (R08). The dependency check printed `depcheck: 43 roadmaps, 319 edges, 0 problem(s)`; it does not see the citations written in words (R04, C02).
- Elaboration: `lake env lean` on `Suggested.lean` exited 0 with no output. The file has no declarations, so no `#check` comparison was needed.

Overlap check: read ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities and SeesawForThetaChains (on main; #3027 revises them). Objects shared with this roadmap: the complementary-space identity (owner ThetaLiftsForDefiniteUnitaryGroups §6.11; R05) and the Rallis formula in Weil's range (owner ThetaKernelsForUnitaryDualPairs §6.13a; R02). RowTowerAndRallisIdentities §§5.7 and 5.8b–d treat the analogous lifts `W_j → V_j` and square constants for that family's own data, so they are distinct objects. Theorem C is shared with OneSidedPrimeSumBoundsAndAdmissibleData §5.5 in this pull request (R04).

Source independence: 19 passages compared with 3 sources (ShortProof, GanQiuTakeda2014, Rallis1984); the *Method* and *Origin* lines share wording with ShortProof (R07). Largest share: ShortProof, 36 of 44 locators. Contents compared with ShortProof-CONTENTS: Layers 2–5, and Layer 5's sections, follow it (R06).

Research link: Theorem C is the lower bound in the route of an unpublished formal proof of GRH for Dirichlet L-functions ([ShortProof] README, crediting Levent Alpöge). Its inputs adapt the Rallis inner product formula (Rallis 1984, Prop. 1.1; Gan–Qiu–Takeda 2014, Props. 11.1–11.2) and the first term identity (Gan–Qiu–Takeda 2014, Thm 7.3). This rests on the README and those sources.

## Not verifiable

- 4.1's pointer file, `New/Determinant/Chain/TriangleNorms.lean`: the sources service could not read it (it was rejected as an unrecognised file), so 4.1 was checked by computation only.
- J.-S. Li (1992), Kudla and Rallis (1994), Kudla (1984) and Ichino (2004) are cited without locators, so there was no locator to check; they were not fetched.
- 3.1, 3.8 (a), 3.12 and 5.3 were compared with their declarations' names and module docstrings only, not with the full Lean statements.

## Source issues

- none

## For the human reviewers

- **Scope.** The family's end theorem is GRH for Dirichlet L-functions, an open problem. The statements labelled "particular to this proof" (most sections of the README) rest only on [ShortProof], an unpublished GitHub repository (lsernau/grh-lean) that calls itself a "research artifact"; no refereed source states Theorem C (6.3).
- **Licence.** [ShortProof] states the Apache 2.0 licence (its `README.md`, line 48) and credits the proof to Levent Alpöge with Claude. I read it as its owner's own publication; whether the account lsernau is an author is unconfirmed. Whether the paraphrased docstrings of R07 may be reused is for you to decide.
- **Umbrella.** The pull request re-roots the umbrella GRH from RiemannHypothesisForDirichletLFunctions to ShortGRH (`umbrellas/GRH.toml`): a project decision.
