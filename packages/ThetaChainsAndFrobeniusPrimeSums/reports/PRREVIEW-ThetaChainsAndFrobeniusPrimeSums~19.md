# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #3027 at 2ac59b9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 43 lines changed since `f89b300`: the error budget of 10.5 is now stated with the formal proof's exponent (`x^{(e_D+e_L+3)ε}·ℰ ≤ x^{5ε}·ℰ`) and the sharper `x^{3ε}` is a remark, with `C = 5` carried through the overview, 10.6, 10.9, 10.10 and the docstring of `Suggested.lean`; 10.6d gains one cross-reference. Accepted: there is no finding. The new statement follows from the unchanged route, `C = 5` in FrobeniusRestrictedRieszSums §1.9 gives exactly the exponent `9` of 10.10, and every new sentence about the formal proof agrees with the declarations it names. There is one small correction (the description does not mention the corrected spread bound of 10.4) and three format notes carried from the previous review; nothing is left for the human reviewers.

## C01 — The description does not say that the spread bound `U_F` of 10.4 is corrected

A reader comparing with `main` meets a changed constant inside a stated inequality with no word about it. On `main` 10.4 has `U_F := C·|Φ_top|·a·La·(2 + m/k) + C·m·B₀ + C·A_top·log k + 𝔈₇`; this head has `(3 + m/k)` and `3C·m·B₀` (line 1019), the sum of the three brackets of its route. The previous review asked whether the part of the description it could not read mentions this; the description as it now stands names 10.5 and 9.4a for this roadmap and nowhere the spread bound.

A sentence such as "ThetaChainsAndFrobeniusPrimeSums 10.4: the spread bound `U_F` is corrected to the sum of the brackets of its route (`3 + m/k` and `3C·m·B₀`); the conclusion of 10.5 does not depend on the change" would complete it.

## N01 — The `*Sources:*` lines of 9.1, 9.3 and 9.4 still do not match their Origin lines

Unchanged (lines 409, 501 and 592): bare parenthesised lists; 9.1's omits Bost (1996) and names Gross, who has no entry in the References, and 9.3's keeps the word "instance" inside the list and omits Atiyah–Schmid, Sun and Bufetov–Gorin. They could be aligned with the Origin lines, or dropped where the Origin line already names the sources.

## N02 — The `*Needs:*` line of 9.4a names only 9.3

Unchanged: the statement of 9.4a takes `a` and `b` from ThetaChainsOnDefiniteUnitaryGroups §2.1, and the supplier contracts say so, but the `*Needs:*` line lists 9.3 alone. Adding §2.1 would match the contracts; whether 9.4 (c) should name 9.4a is the author's choice.

## N03 — 9.4a gives the file of the statement but not of its proof

Unchanged: the locator names the proposition `VandPlace`; its proof is `Formalism.LogVandermondeBounds.StandardLattice.VandPlace_holds`, in `Formalism/LogVandermondeBounds/LogVandermondeProofs/VandNSuccRight.lean`. The name could be added, as 9.2 does for `slopesN_at_of`.

## Previous findings

The previous review (of `f89b300`) raised no finding and no small correction. Its format notes and its question:

- N01 — not repaired: the three `*Sources:*` lines are unchanged; written again as N01.
- N02 — not repaired: "*Needs:* 9.3." (9.4a); written again as N02.
- N03 — not repaired: 9.4a does not name `VandPlace_holds`; written again as N03.
- Question (does the description state the correction of `U_F`) — settled by reading the description as it stands: it does not; now C01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 10.5, new statement | `e_D = 1, e_L = 0`; `e_D = 2, e_L = 0`; `e_D = 3` | exponents `e_D+e_L+3` = 4, 5, 6; `≤ 5` iff `e_D ≤ 2` at `e_L = 0`; `y = x^ε ≥ 200 > 1` so powers are monotone | holds as written | none |
| 10.5, route to the statement | last line of the route | `C_*y^{e_D} ≤ y^{e_D+1}/200`, `150Q·y² ≤ 3y³/4`; sum `≤ y^{max(e_D,2)+1}`; `max(e_D,2)+1 ≤ e_D+3` for `e_D ≥ 0`: 3 ≤ 4 at `e_D = 1` | route proves the statement | none |
| 10.5, remark | `e_D = 1` | `max(1,2)+1 = 3`; with 10.4, hypothesis (i) of §1.9 at `C = 3` | true; marked as this roadmap's only | none |
| 10.5 against `CErr`, `errX5at_le` | `CErr C := eDiv + eLoss + 3`; conclusion of `errX5at_le` | `ErrX5at ≤ x^{CErr·ε}·ErrText` at every `u0`, under `ErrWindows`, `LargeX` | as the README says | none |
| 10.5, "its chain has `e_D = 2`, `e_L = 0`" | `link_gl`, `LinkGLOBAL`, `ChainTied` | `LinkGLOBAL Fm 2 CH 3 2 0`, arguments `(Cabs CH C0 eD eL)`: `eD = 2`, `eL = 0`; `ChainTied` asks `C.eDiv ≤ eD`, `C.eLoss ≤ eL`; `2+0+3 = 5` | as written | none |
| 10.5, `CErr7` | `CErr7 C := max(eDiv+1, max(eLoss+2, 3))` | for `eLoss ≤ 1`: `max(eDiv+1, 3) = max(eDiv,2)+1`; at (2,0): 3 | as written | none |
| 10.5, "formulates and does not prove" | `ErrorFormsExponentThree` and the other propositions of its file | each a `def … : Prop`; no theorem of the source has `ErrorFormsExponentThree` in its type or proof (searched every file) | as written | none |
| 10.9, 10.10 route with `C = 5` | FrobeniusRestrictedRieszSums §1.9 (any `C ≥ 0`) | conclusion `x^{1/2+(C+3)ε} + 4o·x^{1/2+ε} ≤ x^{1/2+(C+4)ε}`; `C = 5`: `x^{1/2+9ε}`; threshold `x₁(ψ, 5, 4, ε)` | equals `e_W = 9`; `cyclicWindowedBound` unchanged | none |
| 10.10, sources line | `e_D+e_L+7` at (2,0) | 9 | agrees with `e_W` | none |
| 10.6d, new clause | CongruenceModulesOfThetaLifts §7.6 (a); ThetaChainsOnDefiniteUnitaryGroups §§2.3b, 2.3c | §7.6 (a) assumes `w_j(τ) ≤ a⁻_τ + b′/x + η_s`, "which the top window of §2.3b gives when `η_s := ϑ`"; §2.3c sets `η_s := ϑ` | consistent | none |

The rows of the statements this change does not touch stand as in the previous review, of `f89b300`.

- Seeded sample: 10.5 and 10.11 (through 10.10) fall in or beside changed passages and were checked there; 10.6, 10.6a, 10.6b and 10.7 are touched only by `x₁(ψ, 5, 4, ε)`; the other targets are untouched.
- Formal proof, at its first commit: the five files the change newly names exist there; opened and read `LErr7.CErr7`, `LErr7.ErrorFormsExponentThree`, `LErr.CErr`, `LChain.errX5at_le`, `MainNotions.ChainTied`, `GlobalTheory.Top.link_gl`, and `LinkGLOBAL` for the order of its arguments.
- Cross-roadmap citations resolved at the head: FrobeniusRestrictedRieszSums §§1.8, 1.9; GluedTargetAndDivisionInequality §8.22 (`e_D = 1`; the formal chain uses its clause with `e = 2`); CongruenceModulesOfThetaLifts §7.6 (a); ThetaChainsOnDefiniteUnitaryGroups §§2.3b, 2.3c.
- No other README of the family still quotes `x^{3ε}` or `C = 3` for this roadmap's inequality (searched the family).
- Record: against the merge base the head removes no heading, layer, section or Lean declaration; this change adds, removes and reorders none.
- Lean: only the module docstring of `Suggested.lean` changed (`x^{3ε}` to `x^{5ε}`); `lake env lean` gives the two `sorry` warnings only (lines 111, 122). No statement changed; nothing is padding.
- Automatic checks: every check of the worker's run passed. The dependency check printed `depcheck: 120 roadmaps, 1388 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The pull request changes nothing outside `TauCetiRoadmap/`.
- Description: "the total error `x^{5ε}` of the division inequalities (ThetaChainsAndFrobeniusPrimeSums 10.5)", with "the formal proof's form is the statement and the stronger form a remark", describes this change; 9.4a and the new supplier are named; C01 is what it leaves out.

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups and FrobeniusRestrictedRieszSums (all on main; the three closest-roadmap lists name only these); nothing shared. No open pull request changes this roadmap or drops an id it cites.

Source independence: 5 changed passages compared with 1 source (the statement, the remark and the two sentences on the formal proof in 10.5, and the overview sentence, with the Lean source of the formal proof), none shared (changed passages only); largest share [FormalProof], as in the previous review; contents not compared, because the change adds, removes and reorders no layer.

Research link: Layers 9–10 are the last stage of Alpöge's proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026 ([Announcement], [FormalProof]); they apply Bost's slope inequality (Bost 1996; Gaudron–Rémond 2014) and Harish-Chandra's formal degrees (1966). The line rests on the README's overview and References.

## Not verifiable

- Harish-Chandra (1966) and Atiyah–Schmid (1977), named in 9.3: not fetched, as in the previous review; cited by name and year only, and untouched by this change.
- "under size conditions that include `log|W| ≤ (k − 3)·log 2`" (10.5, untouched): the fields of `ErrWindows` were not reread in this round.

## Source issues

- none

## For the human reviewers

- none
