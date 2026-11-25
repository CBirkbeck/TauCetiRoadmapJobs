# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 22 lines changed since `2ac59b9`: the paragraph on the method of the formal proof in 9.3 now says that the formal proof has the formal degree formula for every Harish-Chandra parameter, by a moment argument along a ray, and names where it uses that form; the sources line of 10.9 now locates the properties of the level primes in the fields of the formal proof's structure of a point. Accepted: there is no finding. Every new sentence about the formal proof agrees with the declarations it names, and no statement changed. One small correction (the description still does not mention the corrected spread bound of 10.4) and three format notes are carried from the previous review; nothing is left for the human reviewers.

## C01 — The description does not say that the spread bound `U_F` of 10.4 is corrected

A reader comparing with `main` meets a changed constant inside a stated inequality with no word about it. On `main` 10.4 has `U_F := C·|Φ_top|·a·La·(2 + m/k) + C·m·B₀ + C·A_top·log k + 𝔈₇`; this head has `(3 + m/k)` and `3C·m·B₀` (line 1033). The description names 10.5 and 9.4a for this roadmap and nowhere the spread bound.

A sentence such as "ThetaChainsAndFrobeniusPrimeSums 10.4: the spread bound `U_F` is corrected to the sum of the brackets of its route (`3 + m/k` and `3C·m·B₀`); the conclusion of 10.5 does not depend on the change" would complete it.

## N01 — The `*Sources:*` lines of 9.1, 9.3 and 9.4 still do not match their Origin lines

Unchanged (lines 409, 515 and 606): bare parenthesised lists; 9.1's omits Bost (1996) and names Gross, who has no entry in the References, and 9.3's keeps the word "instance" inside the list and omits Atiyah–Schmid, Sun and Bufetov–Gorin. They could be aligned with the Origin lines, or dropped where the Origin line already names the sources.

## N02 — The `*Needs:*` line of 9.4a names only 9.3

Unchanged (line 650): the statement of 9.4a takes `a` and `b` from ThetaChainsOnDefiniteUnitaryGroups §2.1, and the supplier contracts say so, but the `*Needs:*` line lists 9.3 alone. Adding §2.1 would match the contracts.

## N03 — 9.4a gives the file of the statement but not of its proof

Unchanged: the locator names the proposition `VandPlace`; its proof is `Formalism.LogVandermondeBounds.StandardLattice.VandPlace_holds`, in `Formalism/LogVandermondeBounds/LogVandermondeProofs/VandNSuccRight.lean`. The name could be added, as 9.2 does for `slopesN_at_of`.

## Previous findings

The previous review (of `2ac59b9`) raised no finding. Its small correction and format notes:

- C01 — not repaired: the description still names no change to 10.4; `U_F := C·|Φ_top|·a·La·(3 + m/k) + 3C·m·B₀ + …` at the head; written again as C01.
- N01 — not repaired: the three `*Sources:*` lines are unchanged; written again as N01.
- N02 — not repaired: "*Needs:* 9.3." (9.4a); written again as N02.
- N03 — not repaired: 9.4a does not name `VandPlace_holds`; written again as N03.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 9.3, "for every Harish-Chandra parameter" | `GlobalTheory.Published.FormalDegreeCompactDual` | hypothesis `StrictAnti lam ∧ ∀ a, lam a − (N−1)/2 ∈ ℤ`, no gap condition; value `∏_{a<b}|lam a − lam b| / ∏_{a<b}(b − a)` | as the README says; equals `Vand/∏ i!` of the statement | none |
| 9.3, "proved as" | `PositivityTheory.RgFd.B.formalDegreeCompactDual` | `realMetaplectic_of_forall fdAll`, `fdAll` from the key identity and the Hilbert-space realisation; a theorem of the export | as written | none |
| 9.3, the ray | `lamT`, `Dvec`, `Dz` | `lamT lam t = lam + t·Dvec n`, `Dvec n a = n − 1 − a`: `n = 3` gives `δ = (2, 1, 0)`; gaps grow by `t(b − a) ≥ t` | `δ = (n − 1, …, 1, 0)` as written | none |
| 9.3, the moment argument | `norm_induction_of_estimates`, `MomW`, `PhiLe`, `CoefPow`, `PhiMul` | for `t ≥ ⌈h₀⌉`: `∫ h·U^t = c/∏(α_i + tβ_i)` with `h ≥ 0` fixed, `0 ≤ U ≤ 1`; conclusion `∫_{U>0} h = c/∏α_i` (`t = 0`) | as written | none |
| 9.3, uses of the form for every parameter | `formalDegreeUpperC_of_hypotheses`; `exists_isDS_isFdeg_trueDsig` | first takes `FormalDegreeCompactDual`; second takes `FormalDegreeFormula₂` (equal by `Iff.rfl`) at `lamSH R P = (v, −b)`, `2·(m/2 − 1) + k + 1 = k + m − 1` entries | as written; `h(τ)` has `r = k + m − 1` entries | none |
| 10.9 (b), the level primes | fields `T_prime`, `T_win`, `T_norm`, `T_ne_pde` | `T.Prime`; `Tstar ≤ T ≤ (1 + 1/(f·k))·Tstar`; `π ∈ 𝓞_E`, `π ∈ K`, `π·π̄ = T`, `π − 1 ∈ (Q_S·q·d·(g₀g₁)²)`; `T ≠ pde, pde′` | the four properties as the README lists them | none |

The rows of the statements this change does not touch stand as in the previous review, of `2ac59b9`.

- Seeded sample: 10.9 falls in a changed passage and was checked there; the other sampled targets are untouched by this change.
- Formal proof, at its first commit: the six files the change newly names exist at the paths given; opened `FormalDegreeCompactDual`, `formalDegreeCompactDual`, `formalDegreeUpperC_of_hypotheses`, `exists_isDS_isFdeg_trueDsig`, `D7.T_win`, `D7.T_norm`, `D7.T_ne_pde`, `ColumnsAtT.T_prime`, `norm_induction_of_estimates`, `MomW`, `lamT`, `lamSH`; all eight names of the new locators are among the declarations the main theorems reach.
- The locator the change removes (`FamCore.level_primes_admissible`) exists in the source but is not among the declarations the main theorems reach; its replacement by the fields is consistent with the README's practice.
- Cross-roadmap: DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3 names the same declaration `formalDegreeCompactDual` for the formula; the `*Needs:*` line of 10.9 is unchanged.
- Record: against the merge base the head removes no heading, layer, section or Lean declaration; this change adds, removes and reorders none.
- Lean: `Suggested.lean` is unchanged since `2ac59b9`; `lake env lean` gives the two `sorry` warnings only (lines 111, 122). No statement changed; nothing is padding.
- Automatic checks: every check of the worker's run passed. The dependency check printed `depcheck: 122 roadmaps, 1392 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The pull request changes nothing outside `TauCetiRoadmap/`.
- Description: its sentence that the family's statements about the formal proof were checked against the Lean source covers this change; C01 is what it leaves out.

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups, LocalGainOfThetaChains and FrobeniusRestrictedRieszSums (all on main; the three closest-roadmap lists name only these); nothing shared. No open pull request changes this roadmap or drops an id it cites.

Source independence: 3 changed passages compared with 1 source (the two insertions in 9.3 and the sources line of 10.9, with the Lean source of the formal proof), none shared (changed passages only); largest share [FormalProof], as in the previous review; contents not compared, because the change adds, removes and reorders no layer.

Research link: Layers 9–10 are the last stage of Alpöge's proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026 ([Announcement], [FormalProof]); they apply Bost's slope inequality (Bost 1996; Gaudron–Rémond 2014) and Harish-Chandra's formal degrees (1966). The line rests on the README's overview and References.

## Not verifiable

- Harish-Chandra (1966) and Atiyah–Schmid (1977), named in 9.3: not fetched, as in the previous review; cited by name and year only.
- "uses the first form through the two-sided bound of the formal degree by which it proves the bounds of 9.4 (c)" (9.3): the chain from the large-gap form to the bounds of 9.4 (c) was not traced in this round; the claim stood, as "the formula", in the text the previous review read.
- "`T(u) ≠ p_δ, p′_δ`" (10.9): that the fields `pde`, `pde'` of the host are the primes `p_δ, p′_δ` was read from their names and not traced.

## Source issues

- none

## For the human reviewers

- none
