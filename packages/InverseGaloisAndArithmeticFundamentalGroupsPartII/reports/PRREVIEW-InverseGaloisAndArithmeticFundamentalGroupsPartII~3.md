# Review of InverseGaloisAndArithmeticFundamentalGroupsPartII (pull request #2263 at 1a552d0)

**Verdict:** needs changes

Incremental re-review of the 64 lines changed since `5b96805` (README only, Layer 1), with the title and description read against this head. One finding.

## R01 (P3) — Eleven Layer 1 targets are no longer `### k.n` subsections

**Location:** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:835` "`**1.4 A balanced tensor estimate.**`", and likewise `:848` (1.5), `:880` (1.7), `:894` (1.8), `:910` (1.9), `:923` (1.10), `:969` (1.12), `:1009` (1.14), `:1018` (1.15), `:1055` (1.17), `:1069` (1.18).

**Claim:** The regrouping turned these eleven targets into bold run-in titles while every other target stays a `### k.n` heading. A README with `###` targets is read by them alone, so the eleven drop out of the target list; and `### 1.3`, `1.6`, `1.11`, `1.13`, `1.16` now title a group, so "§1.6" names both §§1.6–1.10 and the single bound `A(M) ≤ δ(M) + A1`.

**Witness:** The gate's target reader returns 46 targets at `5b96805` and 35 at this head; missing are 1.4, 1.5, 1.7–1.10, 1.12, 1.14, 1.15, 1.17, 1.18 (among them EVW16 Propositions 4.10 and 4.12 and (4.2.1)).

**Repair:** Keep the grouping sentences, restore the headings. Write the eleven titles as `### 1.4 A balanced tensor estimate` and so on (blank line after), and give 1.3, 1.6, 1.11, 1.13, 1.16 a title for their own statement again, with the group sentence as a paragraph above the heading, for example

    *§§1.3–1.5, change-of-rings estimates over the central quotient.* These provide the
    change-of-rings spectral sequence from `R` to `R̄` and the degree estimates for balanced tensor
    products and for `Tor` over `R̄`; §§1.6, 1.7, 1.9 and 1.10 consume them.

    ### 1.3 The change-of-rings spectral sequence for the central quotient

and the same for §§1.6–1.10, 1.11–1.12, 1.13–1.15, 1.16–1.18. Tested on a copy with the eleven headings restored: the target reader returns 46 again, 1.1–1.19 in order.

## Previous findings

- none: the review of `5b96805` had no finding (its R01 and R02, of `5cf2ffd`, were recorded there as repaired; `README.md:1119–1138` is unchanged since).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `:816–818` "§§1.6, 1.7, 1.9 and 1.10 consume them" (§§1.3–1.5) | the four *Needs:* lines | §1.6: §1.4; §1.7: §1.5; §1.9: §1.3, §1.4, §1.5; §1.10: §1.3, §1.5; §1.8 needs none of them | holds | none |
| `:862–864` group §§1.6–1.10 and its consumers | *Needs:* of §1.16, §1.19; `R = k[t]`, `U = t`, `M = k`; `M = k[t]/(t²)` | §1.16 needs §1.10; §1.19 needs §1.6, §1.9. `A(k) = 0 ≤ δ + A1 = 1 + 1`; `A = 1 ≤ δ + A1 = 2 + 1` | holds | none |
| §1.10 as cited at `:863` | `R = k[t]`, `N = M = k`, `i = 1, 2` | `deg Tor_1 = 1 ≤ 0 + 1 + 1 + 4 = 6`; `Tor_2 = 0`, degree `−∞` | holds | none |
| `:938–939` "§§1.13–1.17 and 3.3–3.5 consume it" (§§1.11–1.12) | the eight *Needs:* lines | §1.13: §1.11, §1.12; §1.14, §1.15, §1.16: §1.12; §1.17: §1.11; §3.3, §3.4: §1.11; §3.5: §1.11, §1.17 | holds | none |
| `:985–987` bound `deg H_q(K(R)) ≤ A2 + q` and consumers | `G` trivial; `G = C₂`, `c = {s}`; *Needs:* of §1.16, §1.19, §4.1, §4.2 | differential `K_(q+1) → K_q` is `Σ (−1)^i r`: `r` for `q` even, `0` for `q` odd; `H_q = k` in degree `q` (`q` even), `q ≤ 2 + q` and `q ≤ 4 + q`; all four list §1.15 | holds | none |
| `:1033–1035` group §§1.16–1.18 and its consumers | `G` trivial, `M = k`; *Needs:* of §4.1, §1.19, §3.5 | `h_0 = 0`, `h_1 = 1`, `h_q = q ≤ 1 + 7q`; §4.1 lists §1.18; §1.19 and §3.5 list §1.17 | holds | none |
| `:756` reworded sentence, locator EVW16 §4, p. 15 | EVW16 line 700 (page 15 is lines 658–703); `R = k[t]` | the source's slogan is at that line; `Tor_2^(k[t])(k, k) = 0`, `Tor_1 = k[1]` | locator right; own words | none |

Rows for the untouched statements stand as in the previous review, of `5b96805`.

- Source locators checked against the text: 3, for the sampled targets in changed passages: EVW16 line 700 (§4, p. 15), lines 726–740 (§4.1 and (4.1.1), p. 16, the differential with suffix conjugation `g_i^(g_(i+1) ⋯ g_q)`), lines 815–832 ((4.5.1)–(4.5.3) and Lemma 4.6, p. 18). The other sampled targets lie in text unchanged since `5b96805`.
- Cross-roadmap citations resolved: none in the changed lines; the three open roadmaps that name this one (ArithmeticStatisticsPartVIII, HomologicalStabilityOfGeneralLinearGroups, SpectralSequencesAndConvergencePartII) cite no section number of it, so the retitled headings break no citation.
- Gate at this head: every check passed (`… layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`). No file changed outside the folder.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `sorry` at `Suggested.lean:475` and `:492` the only warnings; the Lean file is unchanged since `5cf2ffd`, so the signature comparison and the one-tactic probe stand.
- Pull request text read against this head, title, summary block and prose: no sentence contradicted. It adds the roadmap (not on main; 60 headings and 36 declarations added, none removed); the layer-by-layer account, the two stated headlines, the three named as not statable, the hypotheses of the étale bound (`G` centreless, `c` rational, `ℓ > max(|G|, q, n)`, `README.md:1732–1740`) and the open supplier (InverseGaloisAndArithmeticFundamentalGroups) agree with the head.
- Overlap check: read ArithmeticStatisticsPartVIII, InverseGaloisAndArithmeticFundamentalGroups, GeometricTopology; nothing shared in the changed passages (the chain shared with ArithmeticStatisticsPartVIII §5.16 is unchanged; last section).
- Source independence: changed passages only; 6 passages (the reworded sentence at `:756` and the five group paragraphs) compared with 1 source (EVW16 lines 690–725 and 815–827), none shared (two consecutive words at most with line 700); largest share EVW16, unchanged by this diff; no layer added, removed or reordered, so the contents comparison stands as in the previous review: independent.

## Not verifiable

- PAL60 Theorem A: settled as uncertified, cited by locator only.
- Agreement of EVW16's arXiv numbering with the published article: only the arXiv text is in the cache.
- The description's sentence on the review rounds behind the port: it describes the job board, not the folder.

## Source issues

- none

## For the human reviewers

- **Scope.** ArithmeticStatisticsPartVIII §5.16 (open pull request #1179) plans the same chain, from the component ring to the étale Betti bound; `README.md:110–121` says so and imports nothing. Earlier rounds left the choice of owner to a human.
- **Gap wording.** The plan's `gaps` entry for `geomtop-marked-disc-diffeomorphisms` asks GeometricTopology for more than `README.md:420–422` does (the comparison with the topological mapping class group); the announcement on the supplier's job would carry the longer sentence.
