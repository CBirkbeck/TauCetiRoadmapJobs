# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #3027 at f89b300)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 82 lines changed since `7b5fe43`: the new section 9.4a (a Vandermonde bound at a place), the corrected spread bound `U_F` of 10.4 with its use in 10.5, the new sentences on the formal proof in 9.2, 9.6 and 10.4, and the repairs of the four small corrections of the previous review. Accepted: there is no finding. The inequality of 9.4a is true as stated and agrees, hypothesis by hypothesis, with the statement of the formal proof it cites; the new `U_F` is the sum of the brackets of the route of 10.4, and 10.5 still closes with it. All four earlier small corrections are repaired. There are three format notes and one question for the author; nothing is left for the human reviewers.

## N01 — The `*Sources:*` lines of 9.1, 9.3 and 9.4 still do not match their Origin lines

Unchanged since the previous review (lines 409, 501 and 592): bare parenthesised lists; 9.1's omits Bost (1996) and names Gross, who has no entry in the References, and 9.3's keeps the word "instance" inside the list and omits Atiyah–Schmid, Sun and Bufetov–Gorin. They could be aligned with the Origin lines, or dropped where the Origin line already names the sources.

## N02 — The `*Needs:*` line of 9.4a names only 9.3, and nothing names 9.4a

The statement of 9.4a (line 604) takes `a` and `b` from ThetaChainsOnDefiniteUnitaryGroups §2.1, and its sentence on the formal proof takes the nodes, step weights and `Δ_w` from §2.3; the supplier contracts were updated to say that both sections are used in 9.4a, but the `*Needs:*` line (line 636) lists 9.3 alone. In the other direction, the overview says that the bound "enters the size" of the logarithm of the level prime, while the `*Needs:*` line of 9.4 does not list 9.4a (its route for (c) estimates the Vandermonde quotient directly). Adding §2.1 to the first line would match the contracts; whether 9.4 (c) should name 9.4a is the author's choice.

## N03 — 9.4a gives the file of the statement but not of its proof

The locator at the end of 9.4a (lines 632–635) names the proposition `VandPlace` and its ingredients. The method label says the formal proof follows the route written in the section; a reader who wants to see that finds the proof under another name in another file: `Formalism.LogVandermondeBounds.StandardLattice.VandPlace_holds`, in `Formalism/LogVandermondeBounds/LogVandermondeProofs/VandNSuccRight.lean` (it does follow the route: one lemma for `Vand(h) ≥ Vand(v)·∏_j e′_j^{k−1}`, one for `Vand(u) ≤ D^{2k−3}·Vand(v)`). The name could be added, as 9.2 does for `slopesN_at_of`.

## Questions for the author

- Does the description say that the statement of 10.4 changes? On `main` the spread bound is `U_F := C·|Φ_top|·a·La·(2 + m/k) + C·m·B₀ + C·A_top·log k + 𝔈₇`; this head has `(3 + m/k)` and `3C·m·B₀` (line 1019), which is what the route's three brackets add up to, so the change corrects a constant inside `𝔈₈`. The part of the description I could read (it was cut off after the paragraph on the new roadmap of consequences) names 9.4a and the new supplier of this roadmap but not this correction; if the remainder does not either, a sentence such as "ThetaChainsAndFrobeniusPrimeSums 10.4: the spread bound `U_F` is corrected to the sum of the brackets of its route; 10.5 is unchanged in its conclusion" would complete it.

## Previous findings

The previous review (of `7b5fe43`) raised no finding. Its small corrections and its format note:

- C01 — repaired: "the formal proof has the formula for Harish-Chandra parameters whose gaps exceed an explicit threshold, which the parameters of the chain satisfy" (9.3, lines 471–472); the clause on the extension to all parameters is gone.
- C02 — repaired: the reference entry now reads "the scalar by which the higher Casimir element `Tr(E^p)` acts on … `V_λ` … a sum over `i` of `(λ_i + N − i)^p` weighted by the quotients … `dim V_{λ−e_i}/dim V_λ`", and 9.3's label agrees.
- C03 — repaired: "`DF(κ_j)` of the weight `κ_j` is at most `4k²·b`" (10.6d, line 1447), the bound of the cited declaration.
- C04 — repaired: the description now says that ArakelovGeometryAndAbelianHeights newly supplies ThetaChainsAndFrobeniusPrimeSums, and names its new section 9.4a.
- N01 — not repaired: the three `*Sources:*` lines are unchanged; written again as N01 above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 9.4a against `VandPlace`/`PlaceData` | (i)–(v) against the nine conjuncts; `h` against `rowPar`; conclusion | each matches: `k·(4Δ)` = `4kΔ`, `2k·(4Δ)` = `8kΔ`, `|w−b| ≤ b/x` with `b<w` = `e ≤ e′+e′/x`; `2B` = `2b`; length `k−1+m` | same statement | none |
| 9.4a, numerically | `k=2, m=1, x=4, ε=1, Δ=1`: `v₀=4, u=(14, 3.5), e′₀=32, e₀=36` | left `log 36 − log 10.5 = 1.23`; right `log 32 − 4·log(1747.2) − 4(1+log 2) = −33.2` | holds | none |
| 9.4a, hypotheses satisfiable | `x=1, ε=1, k=2, Δ=1` | (v) asks `8 ≤ e′₀ < e₀ ≤ 2e ≈ 5.44`: empty, statement vacuous there; nonempty at `x=4` | no contradiction | none |
| 9.4a route, `Vand(h)` | factors of `h=(v, −e′)` | `Vand(v)`; `(k−1)m` cross factors `v_l+e′_j ≥ e′_j` (`v_l ≥ 0`); `e′_j−e′_i ≥ 1`; `e′₀ ≥ 4kΔx > 0` | `Vand(h) ≥ Vand(v)∏e′_j^{k−1}` | none |
| 9.4a route, `Vand(u)` | `k=3`, `k=4` | `k=3`: 3 factors, none matched, `2k−3=3`; `k=4`: 6 factors, 1 matched to `(v₀,v₂)`, 5 left; adjacent `v`-factors `4Δ ≥ 1` | `Vand(u) ≤ (8a)^{2k−3}Vand(v)` | none |
| 9.4a route, the bound `8a` | both cases of (iii) | first: `≤ 3a`; second: `8kΔ + v₀ + ½ ≤ 12kΔ + ½ ≤ 3e′₀/x + ½ ≤ 6b + ½ ≤ 8a` since `a ≥ b ≥ 1` | holds | none |
| 9.4a, wrong variant | drop `v_l ≥ 0`: `v₀ = −31`, `e′₀ = 32` | cross factor `1 < 32` | (i) is needed and is stated | none |
| 10.4, `U_F` | sum of the route's brackets | `(2+m/k) + 1 = 3 + m/k` copies of `C|Φ_top|aLa`; `2 + 1 = 3` copies of `C·m·B₀`; `C·A_top·log k`; `𝔈₇` | equals the new `U_F` | none |
| 10.4, sentence on `UBar5` | `UBar5`, `Vvar` in the formal proof | `cSlope·nT·a·La·(2+m/k) + Vvar + cSl1·m·B₀ + MLo5`; `Vvar = 2m·cE·B₀ + cH(nT·a·La + m·B₀) + sumA·cCount·log k` | three brackets, one further `C·m·B₀`, source loss: as written | none |
| 10.5, `U_F ≤ C_*(12y+5)ℰ + 1` | term by term | `8y` (`La ≤ 2y`, `m ≤ k`) `+ 3 + 2y + (2 + 2y)`; `≤ 13C_*yℰ + 1` iff `y ≥ 5`; `U_F + b ≤ 15(1+C_*)yℰ`; `𝔈₈ ≤ 120Qy²ℰ` | holds; conclusion unchanged | none |
| 9.2, sentence on (b), (c) | `SlopesN_at`, `LoU`, `slopesN_at_of` | (c) with `+ C·m·B₀`; loss `C·IOsum + C·nT·m(a/k+b′)log T + C·X″ + 1`; proof gets (c) without the term, then adds it | as written | none |
| 9.6, sentence on (a) without `log|W|` | `ramification_condition_holds` | conclusion is a conjunction; second conjunct is the first without `log(card I)`, same `η = 5sg + 3√de`, `e = 2e₀` | as written | none |
| 9.3 reference entry, weights | `N=2`, `λ=(1,0)` | `w = (1/2, 3/2)`; `dim V_{(0,0)}/dim V_{(1,0)} = 1/2`, `dim V_{(1,−1)}/dim V_{(1,0)} = 3/2`; exponent base `λ_i + N − i` | matches Theorem 1.6 | none |
| 10.10, 10.11 (`cyclicWindowedBound`, `cyclicWindowedBound_forEveryEpsilon`) | file unchanged | elaborates with the two `sorry` warnings only | stand | none |

The rows of the statements this change does not touch stand as in the previous review, of `7b5fe43`.

- Source locators checked against the text: Bufetov–Gorin, Theorem 1.6 (BufetovGorin lines 389–404). Of the seeded sample, 9.3, 9.4, 10.4, 10.5 and 10.6d fall in or beside changed passages and were checked there; the others are untouched.
- Formal proof, at the commit the README cites: the ten declarations the change newly names are each declared in the file cited with them (`VandPlace`, `PlaceData`, `vandN`, `rowPar`, `SlopesN_at`, `slopesN_at_of`, `ramification_condition_holds`, `UBar5`, `Vvar`; `Places_at` is named without a file and is declared in `TopDensityNGeSixteen.lean`, beside `slopesN_at_of`). Opened and read: all ten, and `VandPlace_holds` with its two lemmas.
- Cross-roadmap citations resolved at the head: ThetaChainsOnDefiniteUnitaryGroups §2.1 (`a`, `b`) and §2.3 (nodes `e′_i`, step weights `w_j = e_{j−1}`, letter step `Δ_w`, `v_l − v_{l+1} = 4Δ_w`), as 9.4a uses them.
- Record: against the merge base the head removes no heading, layer, section or Lean declaration; it adds 9.4a and the contract for ArakelovGeometryAndAbelianHeights. No other roadmap states the bound of 9.4a (searched the open heads and main by the object and by the name of the formal statement).
- Lean: `Suggested.lean` is unchanged; `lake env lean` on it gives only the two `sorry` warnings (lines 111, 122). 9.4a is an auxiliary inequality, not a headline; nothing is padding.
- Automatic checks: every check of the worker's run passed; my own run agrees, apart from listing the pull request's other roadmap folders, which are its own. The dependency check printed `depcheck: 124 roadmaps, 1410 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Description: names 9.4a and the new supplier of this roadmap; the correction of `U_F` is the question above. No decision of the human reviewers bears on this folder: it removes no section.

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups and FrobeniusRestrictedRieszSums (all on main; the three closest-roadmap lists name only these); nothing shared. 9.4a is owned here; no open pull request changes this roadmap or drops an id it cites.

Source independence: 6 changed passages compared with 2 sources (the statement, route and method label of 9.4a and the new sentences of 9.2, 9.6 and 10.4 with the source of the formal proof; the reference entry and the label of 9.3 with BufetovGorin §1.4), none shared (changed passages only); largest share [FormalProof], as in the previous review; contents not compared, because the change adds, removes and reorders no layer.

Research link: Layers 9–10 are the last stage of Alpöge's proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026 ([Announcement], [FormalProof]); they apply Bost's slope inequality (Bost 1996; Gaudron–Rémond 2014) and Harish-Chandra's formal degrees (1966). The line rests on the README's overview and References.

## Not verifiable

- The description of the pull request was available only in part (cut off after the paragraph on the new roadmap of consequences), so whether it mentions the correction of `U_F` could not be settled; it is a question above.
- "[FormalProof] applies it at every place … under hypotheses that contain (i)–(v)" (9.4a): checked on the statement `LogRatioLowerBound`, which asks `PlaceData` at every place and is proved from `VandPlace`; the chain's verification of `PlaceData` further down was not traced.
- Harish-Chandra (1966) and Atiyah–Schmid (1977), named in 9.3: not fetched, as in the previous review; cited by name and year only.

## Source issues

- none

## For the human reviewers

- none
