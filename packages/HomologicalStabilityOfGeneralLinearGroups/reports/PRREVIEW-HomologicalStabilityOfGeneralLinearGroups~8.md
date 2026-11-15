# Review of HomologicalStabilityOfGeneralLinearGroups (pull request #2036 at 2bf5d27)

**Verdict:** needs changes

## R01 (P3) — A pull-request status in the README

**Location:** `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/README.md` line 691: "K3BlochGroups (open pull request) consumes 1.3 and 2.3: its §4.8 uses their specialization to infinite fields".

**Claim:** The README is timeless: it cites a roadmap by name and section and carries no pull-request reference. "(open pull request)" is a status of the day, and it becomes false when K3BlochGroups merges.

**Witness:** The new parenthesis at line 691 is the only occurrence of "pull request" in the README; lines 76–79 and 519–520 cite the same roadmap as "K3BlochGroups 4.8", with no status.

**Repair:** Delete the parenthesis: "K3BlochGroups consumes 1.3 and 2.3: its §4.8 uses …". The description may keep "(open pull request)".

## Previous findings

- R01 — repaired: the description's `## Sources` now ends "…; Szymik 2020 and Quillen 1972 (the non-target after 2.2), Sprehn–Wahl 2020 and Schlichting 2017 (Research context), Bass 1968, Chapter V (References only)."

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Non-target after 3.4: `dim H¹(GL_n(𝔽₂); 𝔽₂ⁿ) = 0, 0, 1, 0, 0` (lines 667–671) | `n = 1, 2, 3, 4`, cocycles on the Cayley graph | `n = 1`: trivial group, `0`. `n = 2`: `dim Z¹ = 2`, `dim B¹ = 2`, `H¹ = 0`. `n = 3`: `4 − 3 = 1`. `n = 4`: `4 − 4 = 0`. `n = 5` from Dempwolff only | holds | — |
| Same passage: two classes of complements at `n = 3`; maps `0 → 𝔽₂`, `𝔽₂ → 0`, `0 → 0` | `n = 2, 3, 4` | Complement classes `= |H¹| = 2¹ = 2`. `dim H₁(GL_n; 𝔽₂ⁿ) = dim H¹`: `0, 1, 0` at `n = 2, 3, 4`, so not onto, onto and not injective, bijective | holds | — |
| Dempwolff 1973, Remark, p. 207 (line 668) | source text | Dempwolff1973 lines 19–22, printed page 207: `H¹(GL(n,2), V) = 0` except `n = 3`, of dimension `1`. Pages 207–209, three pages | locator exact | — |
| Research context: `H₂(GL_n(ℤ/9); ℤ) = 0`, `n = 1, 2, 3` (lines 724–731) | `n = 1`; `n = 2, 3` by the three terms | `n = 1`: `ℤ/6` cyclic, `H₂ = 0`. `H¹(GL_n(𝔽₃); 𝔤𝔩_n)`: `dim Z¹ − dim B¹ = 3 − 3` (`n = 2`), `8 − 8` (`n = 3`). `(Λ²𝔤𝔩_n)_G`: `0` of `6`, `0` of `36` | holds | — |
| Same: `H₂(GL_n(𝔽₃); ℤ) = 0`; `H₁` dual to `H¹` | `n = 2, 3` | `GL₂(𝔽₃)`: Sylow subgroups semidihedral of order 16 and cyclic of order 3, both with trivial multiplier. `GL₃(𝔽₃) = L₃(3) × ℤ/2`: Künneth gives `0`. Trace form on `𝔤𝔩_n` nondegenerate, so `𝔤𝔩_n ≅ 𝔤𝔩_n*` | holds | — |
| Same: `H₁(GL_n(ℤ/9); ℤ) = ℤ/6`, `n = 1, 2, 3` | `n = 2` | `[diag(−1, 1), e₁₂(x)] = e₁₂(−2x)`, `−2` a unit, so `E₂ = SL₂ ⊆ [GL₂, GL₂]` and `H₁ = (ℤ/9)ˣ = ℤ/6` | holds | — |
| Relation to K3BlochGroups, Layer 2 Examples, Downstream consumers (lines 76–79, 519–520, 691–695) | K3BlochGroups at cf5467c | Its README line 27 and §4.8 (lines 1372, 1388) consume §§1.3 and 2.3; §4.22 (lines 1786, 1792, 1807) consumes §2.3; `TauCeti.stabilizeGL` at line 27; `symmetricGroup_homology_stable` at 1595 | holds; R01 for the parenthesis | R01 |

The rows for statements this round leaves untouched stand as in the previous review, of `41c3fd5`.

- **Gate.** The worker's gate at this head: every counter 0, `build=0`, `OK`. Rerun here against the default order it reports only `depcheck: NOT IN ORDER`, expected (the candidate order lists the roadmap at line 39).
- **Dependency check** (the brief's command): `depcheck: 245 roadmaps, 2234 edges, 0 problem(s)`; no UPWARD and no CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: six `declaration uses sorry` warnings (lines 76, 98, 113, 130, 151, 166), nothing else. The diff changes no Lean file; nothing changes outside the folder against `origin/main`.
- **Source locators checked against the text:** 1 (Dempwolff 1973, the only locator the diff adds; it is in section 3.4 of the seeded sample). No other sampled target falls in a changed passage.
- **Cross-roadmap citations resolved:** K3BlochGroups 4.0, 4.3, 4.5–4.8, 4.15, 4.22 at cf5467c; SchemeKTheoryOperations §6.7 (heading at line 2511) and GeneralAlgebraicKTheory 3.2, 3.14 (lines 419, 646) at their open heads; AlgebraicKTheory 4.1–4.2 and StableHomotopyKTheory 1.30, 1.32, 3.12, 3.16, 3.25–3.27, 3.31, 4.14 on main (1a19c9f). The names `generalLinear_homology_stable` and `generalLinearStabilization` no longer occur.
- **Pull-request text** read against the head: the title, the supplier line, the three layer bullets, the ownership paragraph (K3BlochGroups consuming 1.3 and 2.3), the acceptance test (four definitions, six headlines), the sources (Dempwolff with its locator, the five works of the previous R01) and the machine checks. Nothing contradicted, nothing left unstated. No `<!-- roadmap-summary -->` block.
- **Remark, no change asked.** Line 40 cites "MotivicStructuresInModuliOfCurves §3.4" (untouched text): that roadmap is in the merge order (line 351) but neither on main nor in an open pull request, so the section could not be resolved. It is not cited as a supplier.
- **Remark, no change asked.** For `n = 2` the two generators `1 + E₁₂`, `1 + E₂₁` with their squares alone present `ℤ/2 * ℤ/2`, not `GL₂(𝔽₂)`; its `H¹` with values in `𝔽₂²` is also `0`, so the stated value stands.

Overlap check: read K3BlochGroups, SchemeKTheoryOperations (open) and AlgebraicKTheory (main) again for the changed passages; K2SymbolsBrauer, ProjectiveModulesOverPolynomialRings and CohomologyOfGroups stand as read at `41c3fd5`. Shared objects and owners: frames, hyperhomology and the `GL_n` theorem, SchemeKTheoryOperations §6.7 (cited here); stable range and `K₁`, AlgebraicKTheory 4.1–4.2 (cited here); Suslin's spectral sequence and the semilocal range, this roadmap's 1.3 and 2.3 (consumed by K3BlochGroups 4.8 and 4.22).

Source independence: changed passages only; 1 passage compared with 1 source (Dempwolff1973 lines 19–22), at most three consecutive words shared; largest share van der Kallen 1980, 27 of 52 source citations in the body; contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- The value `H¹(GL₅(𝔽₂); 𝔽₂⁵) = 0` was not recomputed (a group of order 9 999 360); it rests on Dempwolff 1973, which states it.
- Nesterenko–Suslin 1989 and Guin 1989 (2.3) were not opened, as in earlier rounds; they are cited through GKRW 2025, Theorem 9.4.
- Szymik 2020, Quillen 1972, Sprehn–Wahl 2020 and Schlichting 2017 were not opened: they are cited only in untouched text.

## Source issues

- none

## For the human reviewers

- README lines 724–731: the values `H₁`, `H₂` of `GL_n(ℤ/9)` for `n ≤ 3` have no published source; the README gives a method, and this review recomputed its terms.
- Licence: Dempwolff 1973 was read from the publisher's site (Cambridge Core), which served the PDF without a login; the sources service does not classify that host.
