# Review of BesselPoincareSeriesAndGramBounds (pull request #2916 at a6f6af2)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 51 lines changed since `d9dfbbf` found no false or unsupported statement. The two repairs in the README are correct: "level" (the sum of the block sizes) now carries the hypotheses of 5.17b and 5.17c that the formal proof states, and the 21 new file-and-declaration citations at 5.15, 5.16, 5.18a, 5.18b, 5.18d, 5.18e, 5.20b, 5.20c and 5.20 all resolve and state what the README states. One small correction (the validation paragraph of the description, unchanged since the previous review) and two format notes remain, none blocking; scope and licence are left to the human reviewers as before.

## C01 — The validation paragraph of the pull-request description still describes an earlier state

The description was not changed with this head. Its paragraph "Validation at this head" says that every automatic check passes except one, the check that a pull request changes nothing outside its roadmap folder, and that this one "lists only the three files of the family index". A reader concludes that one check fails. At this head none does: the three files of the family index are counted as this pull request's own, since the roadmap is nested in that family; the dependency check reports no upward or cyclic edge; the targeted build succeeds with only Lake's note about the module system.

A wording that would be right: "Validation at this head: the automatic checks pass; the targeted build succeeds; the dependency check reports no upward or cyclic edge. Outside the folder the pull request changes only the three files of the family index." The rest of the description agrees with the head (a new roadmap folder; `Suggested.lean` declares nothing and its docstring names `ContRepresentation` and `ContRepresentation.IsUnitary`; ten suppliers still open; the merge order lists this roadmap directly after GanGrossPrasadUnitaryGroups).

## N01 — In (St) of 5.20a, "`m⁴ ≤ f ≤ k` (`SizeMf`)" still attributes both inequalities to `SizeMf`

Line 1443. `SizeMf` of ThetaChainsOnDefiniteUnitaryGroups §2.1 is `m⁴ ≤ f` only; `f ≤ k` follows from `SizeW`. Would read correctly as "`m⁴ ≤ f` (`SizeMf`), `f ≤ k`".

## N02 — The Check of 5.20a still does not say how the nodes are spaced

Line 1517 ("nodes near `10¹⁵`"). The values depend on the spacing: with nodes `10¹⁵ + j·10³` the previous review computed `−18.0` to `−18.2` and `+1.5` to `+1.8`, with `10¹⁵ + j·10¹⁴` it computed `−17.2` to `−17.5` and `+2.2` to `+2.6`. Naming the spacing would make the Check reproducible; its conclusion does not depend on it.

## Previous findings

The previous report had no finding (R); its small corrections and format notes are accounted for here.

- C01 — repaired: 5.17b now defines "its *level* the sum `Σs_j` of the block sizes (as in 5.19)" and writes "of the same level" in (b-i), (b-ii), (b-iv) and "points of one level" in 5.17c (b-v); "size" is kept for `𝔰`.
- C02 — repaired: 5.15, 5.16, 5.18a, 5.18b, 5.18d, 5.18e, 5.20b, 5.20c (a) and 5.20 each name a file and declarations of [FormalProof]; all 21 resolve (table below).
- C03 — not repaired: the description still says that every automatic check passes except the one on changes outside the roadmap folder; written again as C01.
- N01 — not repaired: line 1443 still reads "`m⁴ ≤ f ≤ k` (`SizeMf`)"; written again as N01.
- N02 — not repaired: the Check of 5.20a still says "nodes near `10¹⁵`" with no spacing; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 5.17b (b-i), (b-ii), (b-iv), "same level" | `BlockKernelSupport`, `BaseKernelOne`, `Th1Eq` in `BlockKernelPropertiesOfSteps.lean` | source hypothesis: equal sums of block sizes (`h.1.sum = h'.1.sum`); 5.19: level `= Σs_j`; unimodular `h`: `𝔰 = 1`, so level is the non-empty condition | agree | none |
| 5.17c (b-v), "points of one level" | `ThetaExists`, `A13` | source: all `h ∈ F` with block-size sum `m`; hypothesis "every nonzero integer a unit" present | agree | none |
| 5.15 (a), (b) locators | `KExpansionC`, `AbsConvC`, `IdCellOffC`, `IdCellDiagC` | all four declared in `PoincareConstantEq.lean`, namespace `Formalism.L2.SG.Full`; expansion under absolute convergence; identity cell off-diagonal and diagonal | agree | none |
| 5.16 (headline) | `CountingTheorem`, `CountHyp`, `count_unbundled` | source: `q² ≤ n`, `log rd ≤ e^n`, `log f ≤ √n`, `b ≥ 2`, `g ≤ b^{C_g}`, `g₀ > 4n`, gap `8·10¹⁴(C_g+4)n^{19}f⁵log(b·rd)`, error `exp(−nf log n/16)`, finite dimension | agree | none |
| 5.18a (b) | `RTTLevel`, `DetLevel` in `StatementQ.lean` | exchange: `(u−v)[t(u)_{ab}, t(v)_{cd}] = t(u)_{cb}t(v)_{ad} − t(v)_{cb}t(u)_{ad}` both sides; `(𝔱(Y+1)^T𝐉𝔱(Y))_{cd} = t_{0c}t_{1d} − t_{1c}t_{0d} = qdet·𝐉_{cd}` | agree | none |
| 5.18b (d), (e) | `LetterPlus`, `LetterMinus`, `ThmPActual` | plus letter: `𝐓 ↦ 𝐓(Y)R(Y−y)`, `𝐑 ↦ 𝐑·𝐓(y)`, `qdet ↦ qdet·(Y−y+1)/(Y−y)` both sides; classes `𝒦_i` contain restrictions with `Gr ≥ ε` | agree | none |
| 5.18d (g) | `GermRate`, `d = m + 2` | sign `(−1)^{m+3} = (−1)^{d+1}`; weights `\|t\|^{(d−1)²}`, `\|z\|^{(d−1)²}`, factor `d^{−1}`, `ψ(dz/t)`; bound `C·κ·\|t\|`; `A ≥ C₁d²`, order `≥ C₂d²` | agree | none |
| 5.18e (h) | `LemmaEModel` | `r_S + 1 ≤ N`; words of `2N + 2` letters; `β − α ≥ C(kN(r_S+1)² + N²(r_S+1)²)`; limit `∏\|P(y)\|·∫Σ\|j_ρ\|²dμ₀` | agree | none |
| 5.20b | `RowLoopsEv`, `Cnt.Hyp`, `Stand`, `epsL` | `ε_L = exp(−kf log k/3)`; `T′/T, T/T′ ≤ A`; `C_lm⁶L ≤ k log k`; `(log f)² ≤ Am²L`; `log f ≤ Ar_S²`; Vandermonde within `A^k`; `r_S ≥ 1`, `g₀ ≠ g₁` | agree | none |
| 5.20c (a) | `JointNormBoundUniform`, `jointNormBoundUnrotated` | quantifiers `∀A ∃C_b, C_{g,0} ∀C_g ≥ C_{g,0}`; gaps `≥ C_g m⁴`, `m = 2r_S+2`; bound `exp(C_b m⁵ f log b)`; exponent `A(r_S+1)²` | agree | none |
| 5.20 (headline) | `SizesAt`, `SizeNumbers`, `PairBound` | `b ≥ 16`, `k ≥ 32`, `f ≤ k`, `4r_S+12 ≤ k`, `2r_S+7+f ≤ k`, `70 log b ≤ k`, `8C_n m⁵f log b ≤ k`, `g ≥ (kb)^8`; `δ ≤ b^{−7}`; `1 + b^{−6}`; `5·⅓·f·log 32 = 5.8 ≥ 1` | agree | none |

The rows for the untouched statements stand as in the previous review, of `d9dfbbf`.

- Source locators checked against the text: the 21 new citations of [FormalProof] (14 files), each declared in the cited file under the cited namespace, each statement read against the README; the four equal-level declarations of `Formalism/HermitianCurvature/BlockKernelPropertiesOfSteps.lean`.
- Library declarations opened at the pins: none new; the change cites no library declaration.
- Cross-roadmap citations resolved: the change adds none; "(as in 5.19)" resolves to the definition of points of level `i` in 5.19.
- Dependency check, run again at this head against the merge order: `depcheck: 170 roadmaps, 1995 edges, 0 problem(s)`; the merge order lists this roadmap directly after GanGrossPrasadUnitaryGroups.
- Automatic checks: all passed in the worker's run. Elaboration of `Suggested.lean`: exit 0, no output; targeted build: completed, its only warning Lake's note on the module system. The file declares nothing, so there was no signature to compare and no one-tactic probe to run.
- Outside the folder the pull request changes only the three files of the family index; the change since `d9dfbbf` touches nothing outside the folder.
- Seeded sample: of the fifteen targets, 5.16, 5.17b, 5.18a, 5.18b, 5.18e, 5.20b and 5.20c fall in changed passages and are in the table; the others are untouched.
- Headlines: 5.15a, 5.16, 5.20 with 5.21; none statable at the pins, each named in the module docstring with what it lacks (unchanged).

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, ThetaChainsAndFrobeniusPrimeSums, SeesawForThetaChains, AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactorsPartII, AnalyticNumberTheoryPartII (scopes as read for the previous review; the change adds no object and no layer) and GluedTargetAndDivisionInequality (its scope section read at its head: it uses the Bessel–Poincaré series only through the hypotheses of SeesawForThetaChains §6.14 and owns none of it); the Bessel–Poincaré series: owned here, cited by SeesawForThetaChains; `vol([U(Y_0)]) = mass(𝒪_E^r)`: owned by HermitianFormsAndLattices §6.2 (c), cited here; multiplicity one and existence of Bessel models: GanGrossPrasadUnitaryGroups §§2.6, 3.9, cited here; nothing else shared. No open pull request changes this roadmap folder or drops an id it cites.

Source independence: changed passages only: 10 passages compared with 1 source ([FormalProof], which is Lean code without prose), none shared: the additions are file paths, declaration names and one definition in the roadmap's own words; largest share [FormalProof], 97 distinct declarations (19 of them new, in 71 files) against 7 locators into the five papers; contents not compared again (the change adds, removes and reorders no layer; the previous review found them independent).

Research link: 5.16 is a uniform-error form of the limit multiplicity theorems of DeGeorge–Wallach (1978), Clozel (1986), Savin (1989); 5.13c–5.13d specialise the archimedean Gan–Gross–Prasad theory (Sun–Zhu 2012, Jiang–Sun–Zhu 2010, He 2017, Beuzart-Plessis 2020, Xue 2023); 5.20–5.21 serve Alpöge's formal proof (2026). Rests on the README's References and the six texts read.

## Not verifiable

- The proofs of [FormalProof] were not replayed: its files are not built on this host, so statements were compared, not proofs. Of the newly cited declarations, `RowLoopsEv` and `JointNormBoundUniform` are statements that the cited files derive or use under further named statements; I did not trace those to closed theorems.
- The public repository of [FormalProof] could not be read through the sources service; I read the copy of its Lean source that the operator holds.
- In 5.17b (b-ii) I checked the equal-level hypothesis and the first conclusion (`t^{−1} − t′^{−1} ∈ 𝔒`) at `BlockKernelSupport`; the two conclusions on `det 𝐏(h)·t` stand in the neighbouring statement of the same file and were only read, not recomputed (untouched text, passed by the previous review).

Automatic checks set aside as false positives: none; every automatic check passed at this head.

## Source issues

- none

## For the human reviewers

- **Scope.** Most of the 28 targets are marked *NEW* and rest on [FormalProof], a Lean development announced on 20 November 2026 (README, References); no refereed text states them. The inputs marked *KNOWN* cite refereed papers.
- **Licence.** The copy of [FormalProof] read here is the source directory alone, with no licence file; the sources service places the repository's host in no licence class.
- **Not tested.** [FormalProof] has no prose and no table of contents; wording and arrangement were compared with its statements and its directory layout only.
- **Order of merge.** The family index is carried by every pull request of the family; the description says the versions are reconciled before merge, not which merges first. No conflicting head was reproduced here.
