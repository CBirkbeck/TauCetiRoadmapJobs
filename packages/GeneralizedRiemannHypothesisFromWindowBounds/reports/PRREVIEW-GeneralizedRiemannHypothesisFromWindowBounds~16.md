# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of 118 changed lines since `2ac59b9`, all in the README's origin and method labels (0.6, 1.1, 1.2, 2.1–2.3, 3.1, 3.3, 3.5), the Summary and the References; no statement and no Lean declaration changed. The new attributions to the formal proof agree with its source at every locator added, and the derivations of the window theorems from the sign-change theorem of Kaczorowski and Pintz (1986) are sound as arguments, given that theorem as the README describes it. There are no findings, no small corrections and no format notes. The text of Kaczorowski and Pintz could not be read (paywalled), which is reported to the human reviewers with the earlier scope and licence questions.

## Previous findings

- The previous report, of `2ac59b9`, has no finding of its own.
- R01 (carried there from an earlier round) — repaired: settled by a decision of the human reviewers. This head still lacks Layer 6 and §§5.4–5.6 and nothing else; the change since `2ac59b9` touches only labels, the Summary and the References.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 Origin: the statement follows from the sign-change theorem applied to `f = G_w − C y^θ` | a zero with `Re ρ > θ`; `Θ = sup Re ρ`; `Θ` not a real zero, and `Θ` a real zero | transform of `f` is `Φ_w(s) − C/(s − θ)`, regular exactly on `Re s > Θ` since `θ < Θ`; sign change in `[Y^{1/λ}, Y]` gives `f > 0` in every far `[Y, Y^λ]`; real pole: subtracting `c y^Θ(1 − cos(t log y)) ≥ 0` trades `c/(s − Θ)` for poles `Θ ± it` | sound, given the theorem as described | none |
| 2.2 Origin: mean bound to pointwise bound by an average over `[y/e, y]` | `Ḡ(y) = ∫_{y/e}^y G(t) dt/t` on `[eY, Y^λ]` | `Ḡ(y) ≤ y^θ ∫ G⁺ t^{−θ−1} dt ≤ y^θ Y^η ≤ y^{θ+η}`; transform of `Ḡ` is `Φ_w(s)(1 − e^{−s})/s`, whose extra zeros `2πik` lie on `Re s = 0` | sound | none |
| 2.3 Origin: "large values of both signs" when `Θ` is not a real zero | `C > 0` and `C < 0` | sign change of `G_w − C y^θ` in every far window gives `G_w > C y^θ` (take `C` large) and `G_w < C y^θ` (take `C` very negative) | true | none |
| 3.1 Origin: `[Y^{1−ε}, Y]` "written from the left end" | `λ = 3/2` | `[Y′, Y′^λ]` with `Y′ = Y^{1−ε}`, `1 − ε = 1/λ = 2/3` | true | none |
| 3.5 Origin: "with nothing added" for `ζ` | RH false, `Θ > 1/2`, `1/2 + ε < Θ`; `Θ = 1` | poles of the transform in `Re s > 0` are the zeros, none real in `(0, 1)` (`ζ(s) = s/(s−1) − s∫{u}u^{−s−1} < 0` there), none at `1`; so the real point `Θ` is regular | true | none |
| 1.1 Method label against the formal proof | `landau_family`, `ChebyshevGrowthImpliesZeroFree`, `ZetaLandau` (sign `+1`) | weights `R ∈ ℕ`, `R ≠ 0`, on `ζ` and `1` per index of an inversion-closed finite set; `0 < θ < 1`; `Level.wt` is `1` or `(3o + 1)^{−1}`, bound `y^θ` (`C = 1`); conclusion zero-free only | as the label says | none |
| 1.2 Method label against the formal proof | `ZetaLandau` at sign `−1`; `LandauStep`, `LandauStepEps` | `−G ≤ C x^θ` gives `ζ ≠ 0` on `Re s > θ`; `LandauStep`: `Λ(n)(1 + Re χ(n))`, constant `1 + γ + Re(L′/L)(1, χ)`, i.e. weights `1, 1`; bound for `x ≥ 1`; no theorem of that type in the source | as the label says | none |
| 0.6 attribution of the residue | `poleData_char`, `PoleData.pole` | one character: `m·(−1/(ρ(ρ − 1))) = m/(ρ(1 − ρ))`, `m = 0 ↔ L(ρ) ≠ 0`; family: `c ≠ 0`, and `0 < Re c`, `Im c = 0` at real `ρ` | as the passage says | none |
| "its main theorems do not depend on these statements" (1.1, 1.2, Layer 1 preamble, Labels) | the dependency closure of the proof's main theorems | `landau_family`, `zero_free_of_Chebyshev_growth`, `zetaLandau`, `LandauStep`, `LandauEq` absent from it; `poleData`, `lemmaL`, `zeroFree_of_rpow_window` present | true | none |

The rows for the untouched statements stand as in the previous review, of `2ac59b9`.

- Source locators checked against the text: 9 new FormalProof locators (`Landau.lean`, `ExplicitFormulaErrorOfHostConditions.lean`, `StatementU.lean`, `ZetaNonvanishing/ZetaLandau.lean`, `Statement.lean`, `CharFamilyLFunctionNeZeroOfOneLeRe.lean`, `poleData.lean`, `LandauZeroFreeCriterion.lean`), each file identical at the repository's first commit, each declaration present with the statement described; both Landau proofs pass through `landauEq`, the statement PositivityOfDirichletSeriesWithKernels §6.3 names.
- Bibliographic data of the two new reference entries checked through Crossref: Kaczorowski–Pintz I, Acta Math. Hungar. 48 (1986), 173–185; II, 49 (1987), 441–453.
- Cross-roadmap citations resolved at this head: PositivityOfDirichletSeriesWithKernels §6.3 (its method label gives the `x = e^u` form) and §6.8 (its Origin gives the same derivation: average over `[u − 1, u]`, replacement of a real pole by two conjugate poles); ExplicitZetaBounds §0.3 (`ζ < 0` on `(0, 1)`, case `q = 1`, no record); ThetaChainsAndFrobeniusPrimeSums §10.11. None found nowhere; no open pull request drops a cited id or changes this folder.
- Seeded sample: its targets 0.6, 1.1, 1.2, 2.1, 2.2, 3.1, 3.3 and 3.5 have changed labels, checked above; 0.1, 1.3, 2.5, 3.4, 4.1, 5.1, 5.2 are untouched.
- Automatic checks: all passed for the folder. Dependency check: `depcheck: 122 roadmaps, 1391 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings only (lines 83, 143, 161, 171, 178, 188, 197); the file is unchanged since `2ac59b9`, so signatures and the one-tactic probe stand as before.
- Pull request's text against this head: the description says that the window form of Landau's theorem is credited to Kaczorowski and Pintz and gives the same derivation in its proof outline; its part 3 and the family index entry still describe the folder. Every path the pull request changes lies in a folder it owns.
- Overlap check: read RiemannHypothesisStatementsAndConsequences, PositivityOfDirichletSeriesWithKernels, RieszSumsOverPrimesAndExceptionalZeros and ZerosOfLFunctions; each shared object has one owner, cited here: the one-character remainder with its size bounds and Mellin clause (RiemannHypothesisStatementsAndConsequences §8.4a), the windowed Landau theorem (PositivityOfDirichletSeriesWithKernels Layer 6), the explicit formula (ZerosOfLFunctions §8.6a).

Source independence: changed passages only; 9 passages (the labels of 0.6, 1.1, 1.2, 2.1, 2.2, 2.3, 3.1, 3.5 and the Summary sentence) compared with 1 source, FormalProof at its new locators, none shared; Kaczorowski–Pintz (1986) could not be read, so the passages that describe it were not compared with it; largest share FormalProof, 42 of about 66 locators; no layer is added, removed or reordered since `2ac59b9`, so the arrangement was not compared again.

Research link: The headlines are the Riemann hypothesis and GRH for Dirichlet L-functions, announced as proved and formalised in Lean by Alpöge (2026) (README Summary; Announcement lines 9–13). Layers 1–3 put the Landau (1905) and Ingham (1932) equivalences in windowed form; the README derives the window theorem from Kaczorowski and Pintz (1986).

## Not verifiable

- Kaczorowski and Pintz, *Oscillatory properties of arithmetical functions* I (1986) and II (1987): publisher paywall, no legal open copy found, no restatement in the cached texts. Not checked: Theorem 1 and Corollary 1 at pp. 175–176, the Theorem of part II at pp. 441–442, their hypotheses, and the README's remark that the proof of part I uses regularity at the real point `Θ` without the statement displaying it.
- FormalProof: its locators other than those added since `2ac59b9`, and the untouched `*Method of the formal proof:*` labels, were not read in this round.
- Landau (1905), Pintz (1980), Ihara–Murty–Shimura (2009), Ihara (2006): not read in the earlier rounds and not fetched in this one; the change adds no locator into them.
- Ingham (1932), Davenport (2000), Montgomery–Vaughan (2007): books with no legal open copy. Knapowski–Turán (1962): publisher paywall.

## Source issues

- none

## For the human reviewers

- Decision applied: the move of Layer 6 (§§6.1–6.32) and §§5.4–5.6 to ConsequencesOfTheRiemannHypothesisForDirichletLFunctions Layers 0–4 was not raised; the head removes those sections, their supplier contracts and four declarations, and nothing else.
- Scope: the headline is the Riemann hypothesis. It rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on an unrefereed announcement (Announcement lines 9–13). No refereed source states it.
- Not tested: 2.1–2.3, 3.1, 3.3 and 3.5 now credit Kaczorowski and Pintz (1986), Theorem 1 and Corollary 1, and say its proof uses a hypothesis its statement omits (README lines 626–629, 1446–1451). The paper is paywalled and was not read.
- Licence: the README cites 42 file and declaration locators of an external Lean formalisation (FormalProof), and `Suggested.lean` says three declarations match it binder for binder. Its repository states no licence.
- Not tested: of FormalProof, the source with the largest share of locators, only the locators added since `094da69` were read in the incremental rounds; wording and arrangement of the untouched text were not compared with it again.
