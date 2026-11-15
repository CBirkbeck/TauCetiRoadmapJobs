# Review of KloostermanMomentsAndPotentialAutomorphy (pull request #2301 at 954c294)

**Verdict:** accepted

Incremental re-review of the 30 lines changed since `399a75b`, and of the pull request's title and description against this head. No finding. The gate passes and the dependency check shows no UPWARD or CYCLE line.

## Previous findings

- R01 — repaired: `README.md:2738–2744` "The remaining case, `p = 2` with `k` even, also holds (Haessig-Hecke, Theorem 1.1, p. 1 …) … That case is outside this roadmap"; same clause at `README.md:60–63` and in the docstring at `Suggested.lean:208–211`.
- R02 — repaired: the description reads "whose coefficients satisfy `p^{n(n−1)} ∣ c_n` when `p` is odd or `k` is odd", and adds a sentence placing `p = 2`, even `k` outside the roadmap.
- R03 — repaired: `README.md:1069` "(FSY §2.2, p. 12)"; the definition, the rank and Proposition 2.7 all lie on p. 12 (FSY lines 506–533, page 13 starting at line 534).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §11.2 Check, `p = 2`, even `k` (new) | `Z₆(2; T)`, `Z₁₀(2; T)` from the Kloosterman sums over `𝔽_{2^n}`, `n ≤ 5` | coefficients `1, 7, −8, 0, 0, 0` and `1, 23, 2024, −2048, 0, 0`; valuations `0, 0, 3` and `0, 0, 3, 11`; bounds `0, 0, 2` and `0, 0, 2, 6` | holds |
| §11.2 Check against Haessig-Hecke Theorem 1.1 (new citation) | `k = 6, 10`, `Γ₁(4)`, `U₂` | `(1 − T)(1 + 8T) = 1 + 7T − 8T²`; `(1 − T)(1 + 24T + 2048T²) = 1 + 23T + 2024T² − 2048T³`, with `τ(2) = −24` | agrees |
| §11.2 Corollary / `momentSeries_coeff_dvd` (docstring changed, statement not) | `Z₃(2)`, `Z₁₂(2)`; `k = 0`; exponent at `n = 0, 1` | valuations `0, 0, 2` against `0, 0, 2`; `1, −1, −4096, 4096`: `0, 0, 12, 12` (excluded case, bound holds); `v_p(p² − p) = 1 < 2`; `n(n − 1) = 0, 0` in `ℕ` | holds |
| §11.2 reason for the exclusion (new sentence) | FSY lines 2671–2672 against §8.3 and §8.4 | source: divisibility for all `p` if `k` odd, `p ≠ 2` if `k` even; §8.3 treats `p = 2` for odd `k`, §8.4 assumes `p` odd | agrees |
| §2.4 locator (changed; sampled) | `r = 2`, `k = 2`; FSY p. 12 | rank `binomial(3, 2) = 3`; FSY lines 507–511 (definition), 524–528 (rank), 529 (Proposition 2.7), all before the page-13 marker at 534 | holds |
| Scope and ownership, Layer 11 bullet (changed) | against §11.2 Corollary and `hpk` | README `p` odd or `k` odd, `k ≥ 1`; Lean `0 < k`, `p ≠ 2 ∨ Odd k`; excluded case `p = 2`, even `k ≥ 2` in both | agrees |

The rows for the untouched statements stand as in the previous review, of `399a75b`.

- Source locators checked against the text: 7 (Haessig-Hecke Theorem 1.1 at line 52, p. 1; Theorem 4.1 at line 339, p. 5, used for the Newton polygon at line 285; FSY Remark 5.28 at lines 2312–2323, pp. 51–52; Remark 5.41 at lines 2660–2679, p. 59; FSY §2.2 at line 506, p. 12; FSY reference [26] at line 3330 is Haessig-Hecke); none wrong.
- Sampled targets falling in the diff: §2.4 only; checked above.
- Pull request text against the head: 14 claims of the summary block and the prose compared (adds a new roadmap; weights `0`, `k`, `k + 1`; divisibility with its hypothesis; Haessig's case outside; five headlines in `Suggested.lean`; three files; consumer KloostermanSheavesAndBesselIsocrystals; `s ↦ k + 2 − s`, sign `+1` for odd `k`, existential data at `2` for even `k`); none contradicted, no removal or renumbering to state.
- Gate, rerun: every check `0`, OK. Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`. Outside-folder diff: empty.
- Elaboration: `lake env lean` on `Suggested.lean`, five `sorry` warnings and nothing else. Elaborated type of `momentSeries_coeff_dvd` equals the §11.2 Corollary; no binder lost. The diff changes no Lean statement, so the one-tactic probe of `399a75b` stands.
- Cross-roadmap citations in the changed passages: none new; the internal references §8.3, §8.4, §9.1, §11.2 and "Scope and ownership" resolve to headings at this head. `Haessig-Hecke` is in the package manifest with the same locators.
- Overlap check: read KloostermanSheavesAndBesselIsocrystals, MixedHodgeModulesAndIrregularHodgeTheory, PadicDifferentialEquationsAndRigidCohomology; nothing shared (the change adds no object).
- Source independence: changed passages only; 5 passages compared with 2 sources (FSY, Haessig-Hecke), none shared beyond formulas and a title; largest share FSY, unchanged; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Saito-orthogonal: uncertified, as in the previous review.
- Haessig-Hecke's proof of Theorem 4.1 relies on its reference [20], not read; only the statement and its use for Theorem 1.1 were checked.

## Source issues

- none

## For the human reviewers

- The README has a section `## Corrections to the sources` (`README.md:2888`) with thirteen claims of slips in FSY, XZ and Yun-moments; the review of `399a75b` confirmed five against the texts and did not check the other eight.
- KloostermanSheavesAndBesselIsocrystals (open, `README.md:79` there) states that "scalar ordinarity at every prime and rank is a supplier gap" on this roadmap; this README has no such target.
- `momentSeries_coeff_dvd` keeps `hpk : p ≠ 2 ∨ Odd k` although the bound holds for `p = 2`, even `k` (Haessig-Hecke Theorem 1.1); `README.md:60–63` places that case outside the roadmap. Whether to plan Haessig's theorem is a scope decision.
