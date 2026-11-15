# Review of ProetaleCohomologyOfPAdicCurvesAndTowers (pull request #2287 at 854686f)

**Verdict:** accepted

Incremental re-review of 4 changed lines since `adac797`. No finding.

## Previous findings

- R01 — repaired: README line 117 "§AI.6.2 (*Semistable AΩ complex*, with its local Koszul description by the *Integral semistable local edge comparison*)"; line 835 "the *Semistable AΩ complex* of §AI.6.2". Both targets are in AInfCohomology §AI.6.2.
- R02 — repaired: the description reads "`Suggested.lean` states the two headlines statable at the pins, both for `K/ℚ_p` finite", then irreducibility, non-isomorphism, multiplicity one in a series of length `2^d`, and the hyperplane-cocycle presentation.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.7 `AΩ_𝔛 = Lη_μ Rν_* A_inf,X` and its supplier names (lines 117, 835) | `𝔛 = Spf O_C`, `i = 0, 1`; smooth `𝔛`; semistable `𝔛` | `AΩ = A_inf`; `i = 0`: `A_inf^{φ⁻¹=1} = ℤ_p`; `i = 1`: on `μ⁻¹A_inf(1)` the map is `1 − ξφ⁻¹`, kernel `μℤ_p` giving `ℤ_p(1)`, cokernel `0 = H¹_ét` | holds; §AI.3.2 has `ν` to `𝔛_Zar`, §AI.6.2 to `𝔛_ét`, as the new clause says | none |
| §AI.6.2 Koszul description cited at line 117 | chart `Spf R` | AInfCohomology §AI.6.2: `RΓ(𝔘, AΩ^psh)` is `K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ)` by *Integral semistable local edge comparison* | citation states what the supplier states | none |
| Description, second paragraph, against `Suggested.lean` | the four sorried theorems, lines 131, 145, 159, 272 | `IsIrreducible`; `Nonempty (Equiv) ↔ J = J'`; `s.length = 2 ^ d` and multiplicity `= 1`; `r ≤ d`, cocycles vanishing on `¬ Projectivization.Independent` | description agrees with the head | none |

The rows for the untouched statements stand as in the previous review, of `adac797`.

- Supplier names resolved at the open head of AInfCohomology: 4 (*Semistable AΩ complex*, *Integral semistable local edge comparison*, both under heading AI.6.2; *The AΩ complex*, AI.3.2; *Derived décalage*, AI.1.2). `Semistable.aOmega` no longer occurs in the folder.
- Source locator read for the changed sentence: CDN-DUKE lines 357–373 (§2.4, Theorem 2.9: any flat formal model, `AΩ = Lη_μ Rν_* A_inf`); unchanged and correct.
- Pull request text against the head: title (adds a roadmap; not on main, 1318 insertions, 0 deletions); summary block; headline paragraph; folder contents (`README.md`, `Suggested.lean`, `metadata.toml`); the six roadmaps named as non-prerequisites are each a consumer or a Part II reference in the README and none is a supplier; every other roadmap the README names is on main or in the dependency list. No sentence contradicted, no change left unstated.
- Gate at `854686f`: every check passes (build included). Dependency check: `depcheck: 240 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration of `Suggested.lean`: four `sorry` warnings only (lines 131, 145, 159, 272); the file is unchanged since `adac797`, so signatures and the one-tactic probe stand.
- Declared gaps: 4, unchanged; the diff touches none.

Overlap check: read CstConjectureForDaggerVarieties, PadicHodgeTheory, CohomologyComparisons, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, CohomologyComparisonsPartII, FlagVarieties, AdicSpacesPartIV; nothing shared (no closest roadmap by results; the diff changes no ownership).

Source independence: changed passages only; 2 passages compared with 1 source (CDN-DUKE lines 357–373), none shared; largest share CDN-CURVES, 122 of 284 locators, unchanged; contents not compared again (the diff adds, removes or reorders no layer).

## Not verifiable

- SS91 §§3–4, IS01, DS01 Theorems 5.7 and 7.7, NAK84 Theorem 4, KM74 Theorem 2, BW00 Chapter X Theorem 4.11: settled as uncertified; not touched by this change.

## Source issues

- none

## For the human reviewers

- none
