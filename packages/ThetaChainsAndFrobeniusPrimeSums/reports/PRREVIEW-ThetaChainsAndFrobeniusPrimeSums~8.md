# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #2924 at bb48791)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the four lines changed since `c07a7dc`: the repointed locators of 10.9 and the forms of the formal proof now recorded at 9.6, 10.4 and 10.10 each agree with the declaration they name, and no statement changed. There is one small correction (a parenthesis of the description that the head contradicts) and one format note carried over; neither blocks. The scope and licence questions of the previous review stay with the human reviewers.

## C01 — The description says the exponent of the letter step is fixed before `ε`; the README chooses it after `ε` and `c_H`

A reader of the description expects a letter step whose exponent is among the constants of step (1) of 10.6, and then cannot follow why the thresholds of 10.6b depend on `c_H`. The description reads: "with the letter step in the range of ThetaChainsOnDefiniteUnitaryGroups §2.3 (its exponent a constant fixed before `ε`)". At this head the table of the Conventions (line 223) has "the exponent `c_Δ` chosen after `ε` and `c_H`", the order of the choices in 10.6 (lines 1006–1007) puts `c_Δ ≥ c_Δ⁰` after the band constant with "`c_Δ⁰` depends on `ε`, on the constants of (1) and on `c_H`", and 10.6b (line 1109) states the same dependence. ThetaChainsOnDefiniteUnitaryGroups §2.3 at its open head agrees with the README: "an exponent `c_Δ` chosen after `ε`".

The parenthesis would be right as: "(its exponent `c_Δ` chosen after `ε` and `c_H`, before the node spacing)".

## N01 — "The mathematics of this roadmap follows a complete formal proof"

The first sentence of **Routes** (line 146) is unchanged: it says the roadmap follows a source. The layers are organised by the mathematics, so only the wording is at stake; "The *NEW* targets of this roadmap are established by a complete formal proof ([FormalProof])" says the same without the verb.

## Questions for the author

- 10.6 (lines 967–969) says that in the construction of [FormalProof] the band constant "is the square of the last of its constants". The band `rhoP` and its condition are in `Formalism/LocalRingCardinality/DataParams.lean` with a constant `Crho`; I did not find where `Crho` is set to a square. Which declaration fixes it? The sentence has no locator. (Carried from the previous review; the other question there, on the window exponent `3/2`, is answered by the new locator of 10.10.)

## Previous findings

The previous report (of `c07a7dc`) had no finding; its four small corrections and its format note stand as follows.

- C01 (then) — repaired: 10.9 (b) now cites `Formalism.MainNotions.FamCore.level_primes_admissible` and `Formalism.MainNotions.S.StandingNumericalData` for the level primes, `Formalism.MainNotions.Lnk.Nodes_at` for the window of the step weights at the thick places.
- C02 (then) — repaired: 10.9 (a) now cites the structure `Formalism.MainNotions.FamCore`, whose fields are the equalities of the shared data; `Loss_at` is no longer cited there.
- C03 (then) — repaired: 9.6, 10.4 and 10.10 each name the declaration and say in one clause how its form differs from the README's.
- C04 (then) — repaired: the description now reads "and, where that proof states a target or a step, names the file and the declaration".
- N01 (then) — not repaired: line 146 still reads "The mathematics of this roadmap follows a complete formal proof"; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 9.6 (a), new locator | `Frame_at` (line 188), `FrameF` (line 258) of `QuadraticLogDerivCongr.lean` | source: `0 < HH`, `η ≤ etaB`, `e ≤ eB ≤ 1/4`, `(etaB + 4√eB)x^{CH} ≤ 6`, `log|W|` subtracted; README: `5 + x^{c_H}(3√ϑ_T + 4√(2e_diag)) ≤ 5 + 1 = 6`, no `log|W|` | recorded form matches; README form sharper, by SlopesOfHermitianVectorBundles §5.5 |
| 10.4, new locator | `MeanBoundSecondForm` (line 187), `ErrX` (line 176) of `MeanBoundSecondForm.lean` | source: `umean ASK ≤ umean Main + ErrX`, `ErrX` has the summand `umean log|W|`; README: inequality at every `u₀`, nine error terms, none `log|W|` | recorded difference is exact |
| 10.9 (a), new locator | fields of `FamCore` (`FamCore.lean`, line 71) | `R_eq`, `TT_eq`, torus, `q_eq`, `d_eq`, `rd_eq`, `g_eq`, `pde_eq` equal for all indices; `eW_code` one word code; `coverS` equal top weights `aT`, `bT` at every translate | matches "same host, ranks, tops, thick set, type and auxiliary primes, top weights and word code" |
| 10.9 (b), new locators | `SizeData₂.AdmT` (`DataParams₂.lean`, line 186); `StandingNumericalData`; `Nodes_at` (line 211) | `T` prime, `T* ≤ T ≤ (1 + 1/(fk))T*`, `T ≠ p_δ, p′_δ`; `T mod (g₀g₁)² = 1`, `T ≠ g₀, g₁`; thick places: `b ≤ w ≤ b + η + 1` | each declaration is about what the clause says |
| 10.10, new locator | `ChebyshevInequalityOnWindows` (`TopWin.lean`); `level_gm_le_on_family_scales`; `plugWin` | source exponent `1/2 + (e_D + e_L + 7)ε`; with `e_D = 1`, `e_L = 0`: `8ε ≤ 9ε`; `plugWin` passes `la := 3/2`; `o = 4`: weight `1/13` | recorded form matches; README's `9` and `3/2` consistent |

The rows for the untouched statements stand as in the previous review, of `c07a7dc`.

- Source locators checked against the text: the 10 declarations the four changed lines name, each opened in [FormalProof] at the file given (7 files); all exist and say what the README attributes to them.
- Cross-roadmap citations resolved: ThetaChainsOnDefiniteUnitaryGroups §2.3 at its open head (the exponent `c_Δ`); the changed lines add no supplier citation and change no `*Needs:*` list.
- Library declarations: none touched by the change; `Suggested.lean` is unchanged since `c07a7dc`.
- Dependency check: `depcheck: 4 roadmaps, 45 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 111 and 122), nothing else; no `set_option`, single `import Mathlib`.
- Changes outside the folder and the family index: none. The worker's automatic checks all passed.
- Description read against the head: adds a roadmap (2047 lines, 7 declarations: 2 theorems, 5 definitions) as it says; one sentence out of date (C01).

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups, FrobeniusRestrictedRieszSums; nothing shared (unchanged since the previous review: the change adds no object, only locators).

Source independence: changed passages only; 4 passages compared with 1 source ([FormalProof], Lean code without prose), none shared; largest share FormalProof, all located citations; contents not compared again (the change adds, removes or reorders no layer).

Research link: Layers 9–10 conclude the announced formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), assembling Bost's slope inequality (1996), the Chowla–Selberg period (1967), the mass formula of Gan–Hanke–Yu (2001), Harish-Chandra's formal degrees (1966) and Banaszczyk's transference (1993); README Summary and References, [Announcement] lines 9–13.

## Not verifiable

- That each cited proposition of [FormalProof] is discharged there for the chain: `FrameF`, `Nodes_at`, `StandingNumericalData` and `MeanBoundSecondForm` are definitions of propositions; I compared statements and did not trace or build the proofs.
- `T(u) > 2f·N_m + 1` and `T(u) ≥ X′` of 10.9 (b) were not traced to the lower end `T*` of the window in the cited declaration.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets (9.6, 10.4, 10.10, 10.11) rest only on [FormalProof], an unrefereed Lean formalization announced 20 November 2026; [Announcement] lines 9–13 and 72–76 say only Lean is presented. No refereed source states them.
- Licence: the locally held copy of [FormalProof] (directory `src/` of the repository the README names) contains no licence file; the sources service does not classify the repository's host.
- Licence: `HasWindows`, the bundle `PrimitiveDirichletCharacter` and `rieszRemainder` of `Suggested.lean` have the shape of `Formalism.HC.HasWindows`, `Formalism.HC.PChar` and `Formalism.HC.An.gChi` of that repository (`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/`), with bodies rewritten.
- Not tested: the formal proof was not compiled or kernel-checked in this review; agreement was checked statement by statement at the locators.
