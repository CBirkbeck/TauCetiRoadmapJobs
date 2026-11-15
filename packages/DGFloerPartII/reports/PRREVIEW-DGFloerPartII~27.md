# Review of DGFloerPartII (pull request #1799 at 3cc4b39)

**Verdict:** accepted

Incremental re-review of the 24 lines changed since `a660fec`, all in
`TauCetiRoadmap/DGFloerPartII/README.md` (13 insertions, 11 deletions): 4.3's introduction, the
two run-in labels for Proposition 6.34, and the `S^(4k+1)` Check of 4.2. `Suggested.lean` is
unchanged and nothing changed outside the folder. The title and description were read against
this head. No finding.

## Previous findings

- R01 — repaired: "the compact connected Lie groups that are not tori, and the odd spheres `Sⁿ` with `n ≥ 3`, are cases (4.3)" (README lines 1856–1857); the labels at 1903 and 1911 and the Check at 1544 now carry the same bound.
- R02 — repaired: the description now reads "takes nothing from #1798; the task list below names #1798 only for the merge order this paragraph states", which agrees with the `depends-on` and `merge-order` blocks below it.

## Verified sound

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | 4.3 introduction: "the odd spheres `Sⁿ` with `n ≥ 3`, are cases" | `n = 1`, `n = 3` | `S¹ = T¹`: aspherical, excluded, capacity `∞` (line 2098). `S³`: `π₃ = ℤ`, a case under both clauses, no conflict. Source: `bdho-cotangent` line 5063, `n ≥ 3` | agrees | none |
| 2 | 4.2 Check: `S^(4k+1)` has no two independent fields; "for `k ≥ 1` … covered by 4.3" | `k = 0`, `k = 1` | `4k+2 = 2·odd`, Radon–Hurwitz number `2`, so one field. `k = 0`: `S¹`, not in 4.3's range `n ≥ 3`. `k = 1`: `S⁵`, odd `n = 5 ≥ 3`, in range | agrees | none |
| 3 | "First proof of covering for `Sⁿ`, odd `n ≥ 3`" against Lemma 6.35 and `isOfFinOrder_pi_SO` | `n = 3`, `n = 1`, `k = 0` | `n = 3`: `π₂(SO(3)) = 0`, boundary map zero, `ℓ = 1`. `n = 1`: `π₀(SO(1))` trivial, but `S¹` aspherical so 6.33 does not apply. Lean `k = 0`: `π_ 2 (SO 3)` | label, lemma and Lean share the range `n ≥ 3` | none |
| 4 | "Second proof of covering for `Sⁿ`, odd `n ≥ 3`": `(ev_p)_*A = (1 + (−1)^(n−1))[Sⁿ]` | `n = 3`, `n = 5`, `n = 2` | `n = 3`: `1 + 1 = 2`. `n = 5`: `2`. `n = 2`: `1 − 1 = 0`, so `ℓ > 0` fails for even `n` | agrees with 1.4 (line 938, degree `(−1)^(n−1)`) | none |
| 5 | Description: "Layer 10 item 5 keeps its number for Theorems A and C, and Layer 11 item 3 for the finite cover `T × K → G` and the torus criterion" | DGFloer on main; its open revision's numbering note | main: Layer 10 item 5 is "Theorems A, B, C", Layer 11 item 3 "Covering by diffeomorphisms"; the revision's note (its README lines 193–199) keeps both numbers for exactly these | agrees | none |
| 6 | Description: "cites DGFloer's sections by their numbering on main" | all 66 `DGFloer Layer …` citations of the README | every one is `Layer k` or `Layer k item j`; main has Layer 1 items 1–8, 2 items 1–3, 4 items 1–5, 5 items 1–7, 6 items 1–5, 10 items 1–5, 11 items 1–4 | agrees | none |

The rows for the untouched statements stand as in the previous review, of `a660fec`.

- Source locators checked against the text, 4: `bdho-cotangent` lines 5055–5057 (Definition 6.32), 5059–5062 (Proposition 6.33), 5063–5068 (Proposition 6.34, odd `n ≥ 3`, two proofs), 5073–5079 (Lemma 6.35, `n ≥ 3` odd; the printed `π₈(SO(9))`). No locator is flagged unverified.
- Seeded sample in the changed passages: 4.3 (rows 1, 3, 4); the Check of row 2 lies in 4.2. The other sampled targets are untouched.
- Library declarations opened: none changed; `isOfFinOrder_pi_SO` and `nonempty_pi_SO_mulEquiv_prod_stiefel` read in `Suggested.lean` lines 434–444 against 4.3.
- Cross-roadmap citations resolved, 3: DGFloer Layer 1 item 6, Layer 5 item 5 and Layer 11 on main (cited by the changed 4.3); GeneralizedCohomology G4.0b is on main (14 occurrences in its README at `c639cfaa`), so the `overlaps.md` lead is a false positive, as before. No text in the README, `Suggested.lean` or the open DGFloer revision refers to the renamed run-in labels.
- Gate, run on this head with the brief's command: every check 0, `OK`. Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `lake env lean` on `Suggested.lean`: exit 0, 27 diagnostics, all "declaration uses `sorry`". `git diff --stat origin/main...HEAD` outside the folder: empty.
- Title and description against the head: the folder is added (2831 insertions, 42 headings, 33 declarations); the Layer 1–4 bullets, the `Suggested.lean` list, the four not-statable items (module docstring lines 66–86) and the `roadmap-summary` block agree with the README and the Lean file; Theorem B's hypotheses match 3.2.
- Remark, no change asked: the README adds "(the base's §4.1)" beside "Layer 4 item 5" in four places (lines 430, 1121, 1135, 1221); that number exists only at the open DGFloer revision, which the description names as merging first.

Overlap check: read DGFloer (main and its open revision), HomotopySpheres, AlgebraicTopology; the changed passages add no object. Theorem B, the Layer 11 applications and the carriers move here by the open DGFloer revision's numbering note (owner after it merges: this roadmap); stable `O`/`SO` and real Bott periodicity are also in HomotopySpheres Layer 4 on main, which the merge rules bar as a supplier (see the last section).

Source independence: changed passages only; 1 paragraph, 2 run-in labels and 1 Check compared with 1 source (`bdho-cotangent` lines 5063–5073), longest shared run 3 words, forced by the mathematics; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Nothing in the changed passages. The texts the earlier reviews list as outside the cache (Milnor, Bott 1959, Ziller and the others) bear on no changed passage.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 117 (line 5076): the source says the group `π₈(SO(9))` is cyclic of order four; it should be `(ℤ/2)²`; affects nothing.

## For the human reviewers

- **Scope/ownership.** HomotopySpheres on main (its README lines 41, 1497–1646) plans stable `O`/`SO` and real Bott periodicity; this roadmap's 4.2a–4.2c plan them again, and the project's rules bar HomotopySpheres as a supplier.
