# Review of ThetaLiftChainsAndTheSeesawIdentity (pull request #3160 at 8c6c8b8)
Folder: `TauCetiRoadmap/ShortGRH/ThetaLiftChainsAndTheSeesawIdentity/`
**Verdict:** needs changes

**Summary.** The roadmap needs changes: the seesaw identity and 21 other sections rest on thirteen "ShortGRH background" results that no roadmap, supplier section or pinned declaration owns (P1). Five further findings: 2.2–2.4 add the undoubled block `[d]` to doubled parameters, so 2.2 (a) is false as written; supply runs both ways with OneSidedPrimeSumBoundsAndAdmissibleData and with CompositeThetaLiftsAndShortForms, and 2.8 and Composite §2.9 form a cycle; several passages repeat [ShortProof]'s docstrings, and the layers follow its folders and file order; and the pull request edits the top-level README and the umbrella GRH. All 15 sampled sections agree with [ShortProof] at the pinned commit; there are three small corrections and one format note. The human reviewers have to decide the scope (an unpublished formal proof as the main source), the second route with the re-rooted umbrella, and the licence of [ShortProof].

## R01 (P1) — Twenty-two sections, among them the inputs of the seesaw identity, rest on thirteen "ShortGRH background" results that nothing owns

An implementer of 1.1–1.5, 1.7, 2.2–2.4, 2.7, 2.13, 2.15–2.17, 2.19, 3.1, 3.2, 3.5, 3.6, 3.8, 3.13 or 3.17 is blocked behind statements that no roadmap section, declared gap or pinned declaration provides. The umbrella's target list does not count them either: the family index (`TauCetiRoadmap/ShortGRH/README.md`, lines 210–216) calls such an entry "a result still to be stated as a numbered target" that "creates no dependency in the umbrella until then". This roadmap declares no gaps.

The Conventions and the *Needs:* lines carry 34 such entries of 13 kinds. Examples: the Weil representation in [ShortProof]'s realisation (lines 210, 254, 283, 319, 813, 871, 906); graded spaces and their Bessel subgroups (lines 977, 1016, 1041, 1110, 1129, 1293); the discrete-series edge of the block rule (lines 516, 560, 870, 932); and Schur orthogonality (line 1384), on which 3.17, and so 3.19 and 3.20, rest. Several of these have owners already:
- Schur orthogonality for a compact group is in the pinned Tau Ceti as `ContRepresentation.schur_orthogonality_self` (`TauCeti/RepresentationTheory/Compact/SchurOrthogonality.lean:104`).
- On main, ThetaKernelsForUnitaryDualPairs states the global Weil representation of a unitary pair (§4.4a), its Fock model (§3.45) and the archimedean correspondence of discrete series (§3.46a).
- GanGrossPrasadUnitaryGroups §1.2 states Bessel subgroups, and AutomorphicFormsOnReductiveGroups §2.4 states discrete series.
- SeesawForThetaChains §§6.2a–6.2d state the unfolding of Bessel periods of theta lifts for general unitary pairs.

The smallest change is to give each entry an owner before acceptance. Where a section above exists, cite it, and state the comparison between [ShortProof]'s realisation (one splitting character `υ`, characters `a`, `b` of `U(1)`) and the owner's as a numbered target, here or in a background roadmap placed before this one. State the rest as targets of a named background roadmap, and declare each one as a gap with its supplier and section.

## R02 (P2) — Supply runs both ways between this roadmap and two members of its family, and 2.8 and CompositeThetaLiftsAndShortForms §2.9 form a cycle

No merge order can put each supplier before its consumer, and the ramified source forms of 2.8 cannot be defined before Composite §2.9, which needs them.

- **OneSided.** The *Needs:* lines of 2.1, 2.4 and 2.6 (lines 446, 559, 612) cite OneSidedPrimeSumBoundsAndAdmissibleData §§3.2–3.4. In the other direction, OneSided §§5.1–5.3 cite this roadmap's §§1.1, 2.1, 2.5, 2.7, 2.8, 2.10, 2.15, 2.19 and 3.20 (that README, lines 793, 842, 878).
- **Composite.** In 2.8 (line 646) the scaling `z_w` is fixed because "one exists, by CompositeThetaLiftsAndShortForms §2.9 (a)". Composite §2.9 lists this roadmap's §2.8 (the scalings and the ramified source forms) on its *Needs:* line.

The dependency check reports no problem only because no member of the family is in the merge order.

The smallest change has two parts. First, state in 2.8 that a scaling exists at each `w ∈ P_N`, the first clause of Composite §2.9 (a). By Composite's own method this takes one line: take a unit at `w` that generates `𝔽_w^×` and divide its idele by its conjugate. Composite then cites 2.8. Second, either split OneSided so that the part used here (§§2–3) comes before this roadmap and the part that uses it (§§5–6) after it, or move §§5–6 into a member placed after this one.

## R03 (P2) — 2.2 (a), (b), 2.3 and 2.4 add the undoubled block `[d]` to doubled entries, so their parameters are wrong by a factor of two on the blocks

An implementer of the weights, grids and centre systems gets the wrong Harish-Chandra parameters, and these feed the block rule of every step of the chain.

The Conventions (line 137) define `[d] = ((d − 1)/2, …, (1 − d)/2)`. 2.2 (a) (line 469) gives the doubled parameter of `μ(X_j) + ρ` as "`[k] + (2a_τ, 0, …, 0)` followed by the blocks `−2κ_i + [t + 1]`". Take `k = 2` at a place outside `Φ_a` and `j = 0`: then `μ(X_0) = (0, 0)` and `ρ = (½, −½)`, so the doubled parameter is `(1, −1)`, but the formula gives `(½, −½)`. The source gives `(1, −1)`: `New.Data.paramX` uses `twiceBlockEntry k p = k − 1 − 2p` ([ShortProof] `New/UpperBound/Objects/Weights.lean` lines 101, 146). The blocks of a centre system there are `centredBlock e d = 2e + doubledBlock d` (`Lib/DiscreteSeries/Theta/BlockRule.lean` lines 40–45). The same slip appears in three more places:
- 2.3's "blocks `2c̃ + [l_c]`" (line 501): for even `l_c` these have half-integer entries, although the section calls them doubled entries.
- 2.2 (b) (line 472).
- 2.4 (lines 534, 538–539).

The fix: define the doubled block `2[d] = (d − 1, d − 3, …, 1 − d)` in the Conventions, and write it wherever a doubled parameter contains a block (2.2 (a), (b), 2.3, 2.4).

## R04 (P2) — Several statements and proof plans repeat the docstrings of [ShortProof] word for word

The principles ask for statements in the roadmap's own words, and the roadmap is published under the project's licence. A machine comparison with the comments of the cited files finds 53 runs of ten or more shared words. Read in context, the longest are these:
- The method of 3.11 (lines 1236–1238) against [ShortProof] `New/UpperBound/Seesaw/AdmissibleEvaluation.lean` lines 9–13: 24 consecutive words, with the same clauses in the same order.
- The origin of 3.17 (line 1369) against `New/UpperBound/Seesaw/SeesawIdentity.lean` lines 10–11: 21 words, and 13 more in the introduction of Layer 3 (line 988).
- 2.9 (a) (lines 676–678) against `New/UpperBound/Objects/LiftChains.lean` lines 74–77: 18 words.
- The origin of 3.11 (line 1233) against the title of `AdmissibleEvaluation.lean`: 16 words.
- 2.15 (d) (line 862) against `RowChain.lean` line 418, and the definition of a ramified vector in 2.11 (line 736) against `LiftLawsModuloN.lean` line 621: 15 words each.

The smallest change is to rewrite these passages in the roadmap's words. Two possible rewrites:
- For the method of 3.11: "The vacuum's lattice meets `I^⊥` in a lattice whose image modulo `I` is the neighbour lattice of 3.9. Hence the finite evaluation sends a translate of the vacuum to `0` or to a root of unity times a translate of the vacuum's zero term, and 3.10 expands that zero term as a nonzero multiple of a sum over representatives of the neighbour lattice."
- For the origin of 3.17: "here, by Schur orthogonality on the compact `U(Y_m)(F_∞)`, integrating a coefficient of a form on `X_m`, restricted to `Y_m`, against a form on `Y_m` gives a fixed multiple of its Petersson product with the restricted form."

## R05 (P2) — The layers, and the order of the sections in Layers 1 and 3, are [ShortProof]'s folders and files, against this roadmap's own dependencies

The principles derive the organisation from what the seesaw identity needs. Here the plan is a source's arrangement, and two sections of Layer 2 rest on Layer 3.

The References (lines 1521–1523) define the scope as the folders `Kernels`, `Objects` and `Seesaw` of [ShortProof]. The layers are these folders, in the order of [ShortProof] `CONTENTS.md` lines 80–119:
- Layer 1 ↔ Kernels, Layer 2 ↔ Objects, Layer 3 ↔ Seesaw.
- Within Layer 1: 1.3–1.4 ↔ line 84, 1.5–1.6 ↔ 85, 1.7 ↔ 86.
- Within Layer 3: 3.1 ↔ 105, 3.2 ↔ 106, 3.3 ↔ 107, 3.4 ↔ 108, 3.5 ↔ 109, 3.6 ↔ 111, 3.7 ↔ 112, 3.8 ↔ 110, 3.9 ↔ 113, 3.10 ↔ 114, 3.11 ↔ 115, 3.12 ↔ 116, 3.13–3.15 ↔ 117, 3.16 ↔ 118, 3.17–3.20 ↔ 119. The only change of order is one swap.

Ten section titles repeat the file titles there: 1.5, 1.7, 2.3, 2.11, 2.19, 3.4, 3.9 and 3.10 word for word, 3.3 and 3.12 nearly so.

The dependencies do not force this order. The introduction of Layer 2 (lines 410–412) says that 2.1 rests on 3.2 and 2.19 on 3.7. And 3.1, 3.2, 3.4, 3.6, 3.9 and 3.16 use no earlier section of Layer 3. The description says the order of the formal proof's folders was kept.

No member of the family is on main yet, so the sections can be renumbered once, in this pull request, together with the family's citations:
- Put the glued lattices and the gradings of the `Y_k` (3.2–3.4, 3.7) before the spaces of 2.1.
- Order Layer 3 by what 3.18–3.20 need.
- Title the sections by their mathematics.
- Drop the sentence of the References that defines the scope by the source's folders.

## R06 (P2) — The pull request edits three files outside the roadmap folders: the roadmap list in the top-level README and the two files of the umbrella GRH

CONTRIBUTING.md (line 144) says that a roadmap pull request touches only its own directory. The "Roadmaps" list in `README.md` is regenerated by the sync bot after merge, and a hand edit conflicts with every other open roadmap pull request. Re-rooting the umbrella changes what work the project schedules, which no roadmap review can approve. The diff against main adds one line to `README.md` (line 499), changes `root` in `umbrellas/GRH.toml` from RiemannHypothesisForDirichletLFunctions to ShortGRH, and regenerates `umbrellas/GRH-targets.md`. The fix: drop the `README.md` line, and move the umbrella change into a pull request of its own.

## C01 — The description says that sections are acyclic and that the only cycle between sections is gone; 2.8 and Composite §2.9 still form one

The description says: "supply still runs both ways between some pairs of members (sections are acyclic)". It also says that turning DivisibilityOfThetaDerivatives 4.3 (d) into 4.3a "removes the only cycle between sections of the family". The head contradicts both sentences (R02). Until R02 is repaired, a correct text would be: "supply runs both ways between some pairs of members, and ThetaLiftChainsAndTheSeesawIdentity §2.8 and CompositeThetaLiftsAndShortForms §2.9 cite each other."

## C02 — Downstream consumers omits 1.1, 2.7 and 2.10 from the sections that OneSidedPrimeSumBoundsAndAdmissibleData uses

The OneSided entry (line 1458) names 2.1, 2.5, 2.8, 2.15, 2.19 and 3.20. OneSided §5.1 also cites §§1.1, 2.7 and 2.10 (that README, line 793). Add them.

## C03 — 3.14 (a) does not say how long the string of the grading `Y′` is

The identity holds for a grading of `Y_{k+1}` whose string has `m − 2 − k` vectors. 3.18 (b) says so, and the source's statement assumes it ([ShortProof] `New.Data.integral_unfoldStageOn`, `New/UpperBound/Seesaw/UnfoldingStages.lean` line 688). Add "with a string of `m − 2 − k` vectors" after "a grading `Y′` of `Y_{k+1}`" in 3.14.

## N01 — The letter `N` names the level prime and three other quantities

Besides the level prime of the Conventions, `N` is a generic integer in 1.5 (c) and 1.6 (a), the norm of the middle vector of a grading (Conventions, 3.2), and the number of indices of a node in 2.4 (lines 541–551). In 2.4 a reader takes `⌊N/2⌋` for the level prime. Another letter for the local uses would remove the clash.

## Questions for the author

- Does 3.13, together with the background unfolding step it uses, follow from SeesawForThetaChains §§6.2b and 6.2d once the two realisations of the Weil representation are compared? Those sections cover Bessel to Fourier–Jacobi and back, one plane fewer, for general unitary pairs. If 3.13 does follow from them, the paragraph on SeesawForThetaChains in Scope and ownership (lines 1492–1497) would cite them, not only §6.2 and §6.14. I could not settle this: 3.13 is an identity of kernels integrated over Bessel quotients, 6.2b and 6.2d are stated for theta lifts of forms, and no section compares the realisations.

## Verified sound

| Statement | Instances tried | Values computed (README / source or computation) | Result | Change |
|---|---|---|---|---|
| 1.1 (a), (d) | empty combination, `B = 0`; `c = 0` | empty sum `0 ≤ 0` admissible; zero datum raises by 0; Lean `raises` uses `max c 0`, README assumes `c ≥ 0` | agrees | none |
| 1.2 (a) | `z = r·v`, `v = r′·v′` | `dd′·rr′` integral; `Σ|σ(rr′)| ≤ BB′`; under `𝖯`, `B′ ≥ 0` so `|B′| = B′` | holds | none |
| 1.4 (b)–(c) | `L = 1` | README `B·e^{c_P(q₁|n′||n|+1)²+w}·4^{f|n′||n|}`; Lean `jetSizeBound` `B·exp(… + f|n′||n|·log 4 + w)` | equal | none |
| 1.5 (a), (d) | `p` split vs not; `L = 0` | (d) needs `χ_K(p) ≠ 1` (Lean `hp`); at `L = 0` exponent `−(D − f|n′|³)`; (a) factor `(|ι_p c|/|ι_p(δ̄d)|)^L` matches | agrees | none |
| 1.7 (a), (b) | `γ = γ′ = 1` | factor `∏τ(1) = 1`, `Q^{1,1} = Q`; Lean picks `c` before `a`, `b`, as "depending only on `L`, `N′`, data, `d`" says | agrees | none |
| 2.1 lemma | `j = 0`, `j = m`, `W_j` | rank `Y_0 = 2ϱ+k+1 = r`; negatives `m/2`; `W_j`: `r−(k+j−1) = m−j`; rank `Y_m = r+mt = n_m−1` | holds | none |
| 2.2 (a), `e_j` | `j = 0`, `j ≥ 1` | `j = 0`: `(k+t+1)/2 − κ₁ + c_τ(k) = 0 = e_0`; `j ≥ 1`: `c_τ(n_j) = Δ−t−1` gives `n_{j−1}/2 − κ_j` | holds | none |
| 2.2 (a), doubled parameter | `k = 2`, `τ ∉ Φ_a`, `j = 0` | true `(1, −1)` = Lean `paramX`; README `[2] + (0, 0)` with Conventions' `[d]` gives `(½, −½)` | false as written | R03 |
| 2.3 blocks | `c̃ = 0`, `l_c = 2` | README `2c̃ + [2] = (½, −½)`, half-integers; Lean `centredBlock 0 2 = (1, −1)` | false as written | R03 |
| 2.6 | `ϑ = 1` | `J_ϑ(Y_j) = J_M`; `χ_m^1 = 1` (reductions 1 at chosen places); Lean `principalLevel_le_levelX` | agrees | none |
| 2.7 gap | signs of `Y_0`, `W_j` | opposite-sign entries `−κ−iΔ`, `−κ−(i+1)Δ` differ by `Δ`; stem to `−κ−iΔ` at least `κ+Δ` | holds | none |
| 2.8 | `j = 0` | `μ(X_0) = (a,0,…,0)` on `Φ_a` (c(1) = a, `e_0 = 0`); Lean `liftKernel` scales by `π_M t₀`, `π_M = conj(π̄_M) ∈ 𝒪_K` | agrees; existence of `z_w` cited from a consumer | R02 |
| 2.10 | (b), (c) | (c) `p₀^f p₁^f = M^f` (Lean `prod_q_chosenPlace`); (b) Lean proof uses `2n_m ≤ rt`, true for the data | agrees | none |
| 2.12 | `Ψ = 0` | empty support, size `0 ≤ M^{3fmn_m²}`, `Glue(0) = 0` invariant: a chain datum; Lean `IsChainDatum` has the same fields | agrees | none |
| 2.15 | `ϑ = 1`; `k = k′ = 1` | level reduces to 1 at chosen places, character 1; (b) factor `ψ(1)/ψ(1) = 1`; Lean `algFormRep_lowerChain` matches (c) | agrees | none |
| 2.16 | `|r| = |n|` | excluded on both sides (Lean `rank_lt`); `c_O`, `e_O` equal Lean `mixedWeight`, `detExp` | agrees | none |
| 2.18 | `t` odd; `j = m` | `(t−1)/2` = Lean `t/2` in ℕ; weight `m − j = 0` = minus signs of the standard `W_m` | agrees | none |
| 3.2 string frame | `s = 2`, `s = 3` | `s = 2`: norms `−1`, `+1`, orthogonal; `s = 3`: two signs `−1` = `⌊4/2⌋` | holds | none |
| 3.14 (a) | string length of `Y′` | Lean `integral_unfoldStageOn` requires `m − 2 − k`; README silent, 3.18 (b) states it | incomplete | C03 |
| 3.15 | `ϑ = 1` | `q_Q` a unit: the bounds force `Λ_{r′x}⁻ = Λ⁻`; any generator of `Q` gives the same `Ô`-lattices | holds | none |
| 3.16 | `k = 0`; size | `Σ_0(S) = S(1, …)` (Lean `cutSum` at 0); size `B_M^k`, `B_M = M^{fn_m²}` = Lean `residueMatrixCount` | agrees | none |
| 3.17 | Schur input | background entry; pinned `ContRepresentation.schur_orthogonality_self` (unitary irreducible, compact group) supplies it | unowned as written | R01 |
| 3.20 (headline) | `c₀ = 0`; size | `c₀ = 0`: `Ψ = 0`, `c = 1`; `B_M^{2m}·B_M^{2ϱ+2} = B_M^{3m} = M^{3fmn_m²}`; Lean `seesaw_identity` has `∃ c : ℂˣ` | agrees | R01 for inputs |
| Conventions, `E/F` unramified | `ζ` of order 5040 | 5040 = 2⁴·3²·5·7 not a prime power, so `ℚ(ζ)/ℚ(ζ)⁺` unramified at finite places, hence `E = F(ζ)` over `F` | holds | none |
| Summary vs 3.20 | statement | support at `Mq_ϑ`, integral away from `q_ϑ`, bound `M^{3fmn_m²}` if trivial, glued tensor invariant: same as 2.12 | agrees | none |

- Source locators checked against the text: the 15 sampled sections plus 2.2, 3.17, 3.19 and 3.20, against [ShortProof] at commit 72fead1 (about 70 declarations read); the README flags no locator as unverified.
- Library declarations opened at the pins: Mathlib `NumberField.IsCMField` (`NumberTheory/NumberField/CMField.lean`), `NumberField.AdeleRing` (`AdeleRing.lean:56`), `IsDedekindDomain.FiniteAdeleRing` (`FiniteAdeleRing.lean:95`), `Matrix.unitaryGroup`; Tau Ceti `ZLattice.thetaSeries` (`ThetaSeries/Basic.lean:102`), `ContRepresentation.schur_orthogonality_self` (`Compact/SchurOrthogonality.lean:104`).
- Cross-roadmap citations resolved: 10 sections on main, unchanged at the head of #3027; 13 into the family (OneSided §§2.1–3.4, Divisibility §§1.4–4.11, Composite §2.9 (a), Composite 4.6 citing 2.13).
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; it sees no cycle because no member of the family is in the merge order (R02 read in the files).
- Elaboration: `lake env lean` on `Suggested.lean` prints nothing, exit 0; the file declares nothing, and its docstring's library names exist at the pins.
- `Suggested.lean`: the one headline (3.20) is not statable at the pins (no Weil representation, adelic unitary groups or automorphic forms on them); no padding to probe.

Overlap check: read SeesawForThetaChains, ThetaChainsOnDefiniteUnitaryGroups, ThetaLiftsForDefiniteUnitaryGroups, RowTowerAndRallisIdentities and ThetaKernelsForUnitaryDualPairs (on main; the cited sections are unchanged at #3027). None of this roadmap's numbered sections restates one of theirs. RowTower §5.3's good idempotent uses another goodness condition, and ThetaChains §3.7's operators are other operators. The Weil representation (ThetaKernelsForUnitaryDualPairs §§3.45, 4.4a, 3.46a) and the Bessel unfolding (SeesawForThetaChains §§6.2a–6.2d) are owned on main; this roadmap uses them only through background entries (R01).

Source independence: 11 passages compared with 1 source ([ShortProof] docstrings and `CONTENTS.md`); 53 shared runs of 10 or more words, six of 15–24 words read in context (R04). Largest share: [ShortProof], 46 of 59 section locators. Contents compared with [ShortProof] `CONTENTS.md`: the roadmap follows it (R05). The published sources of the *Origin* lines were not compared.

Research link: 3.20 is the upper-bound step of [ShortProof], an unpublished 2026 Lean proof of GRH for Dirichlet L-functions based on Alpöge's announced proof. Its unfolding is adapted from Wang (2025), Theorem 4.5, and its class sums from Gross (1999). This rests on the README and on the index of the RH family on main.

## Not verifiable

- The published works of the *Origin* lines (Shimura 1976, Bargmann 1961, Gross 1999, Wang 2025 Thm 4.5, Nikulin 1980, Li 1990, Minkowski 1887, Petersson 1930, Godement 1958, Goodman–Wallach Thm 8.1.1) were not opened. They were not in the sample, and the worker's disk was full during the review, so the sources service could not cache them.
- The proofs in [ShortProof] were not checked; only the statements were read, and the source was not built.

Automatic checks set aside as false positives: the TeX-syntax hits at lines 470–471, 603–604, 770–771, 857–858 and 1396–1397 are subscripts inside code spans that wrap across a line break, which Markdown keeps as one code span. The process-word hit "so far" at line 524 is mathematical ("the blocks of the steps taken so far").

## Source issues

- none

## For the human reviewers

- Scope: the main source, [ShortProof] (grh-lean at commit 72fead1), is an unpublished Lean proof. Its README says it has "passed machine checks only" and that no paper comes with it. Published works are cited only in *Origin* lines.
- Route: the pull request adds a second family for the end theorem of RiemannHypothesisForDirichletLFunctions on main, and moves the root of the umbrella GRH to it (`umbrellas/GRH.toml`, `root`).
- Licence: [ShortProof] is Apache-2.0, Copyright 2026 Anthropic, PBC, with a NOTICE file. The README follows its docstrings and file order closely (R04, R05) and carries no NOTICE.
