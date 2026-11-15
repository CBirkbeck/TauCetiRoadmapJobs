# Review of HodgeTateAndCanonicalSubgroups (pull request #1084 at a8b6690)

**Verdict:** needs changes

Incremental re-review of the 42 lines changed since `06ce518`, and of the pull request's title and description. Two P3 findings; nothing blocking.

## R01 (P3) — 759 backticked Lean names of this roadmap's own are still not declared in `Suggested.lean`

**Location:** `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md`, API bullets, Checks and opening sentences of every target, e.g. line 170 (`` `TauCeti.HodgeTate.conormal`: `ω_H := e*Ω¹_{H/S}` ``) and line 183 (`` `TauCeti.HodgeTate.conormal_eq_cotangentSpace_test`: … ``).

**Claim:** a backticked name of the roadmap's own claims that `Suggested.lean` declares it; a Check never names a Lean counterpart.

**Witness:** at this head 764 occurrences of 759 distinct names (`TauCeti.HodgeTate.` 298, `TauCeti.LogAdic.` 423, `ShimuraTower.` 38); 233 label Check bullets. `Suggested.lean` declares two names; the pinned Tau Ceti has no `HodgeTate` or `LogAdic` namespace.

**Repair:** unchanged from the previous review's R01: delete the leading `` `TauCeti.HodgeTate.…`: ``, `` `TauCeti.LogAdic.…`: `` and `` `ShimuraTower.…`: `` from each bullet, keeping its prose, and rewrite "Prove/Construct/Record `TauCeti.…`." as "Prove that …". Add nothing to `Suggested.lean`. The gate's `readme-ids-missing=0` does not test these prefixes.

## R02 (P3) — The description's AI-assistance sentence was written for an earlier head

**Location:** pull request description: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** the models used are GPT-6 (Codex) only, and the red-team passes are still to come.

**Witness:** the branch has two red-team repair commits (`12d0891e`, `c024ddcf`) and three later repair commits whose trailers name Claude Fable 5.1 (`06ce5183`, `d6aad635`) and Claude Opus 5.5 (`a8b66901`). `CONTRIBUTING.md` asks the description to say which models were used.

**Repair:** replace the sentence by "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and the headline statement; Claude Fable 5.1 and Claude Opus 5.5 for the red-team and review repairs."

## Previous findings

- R01 — not repaired: line 170 still reads `` `TauCeti.HodgeTate.conormal`: `ω_H := e*Ω¹_{H/S}` ``; 759 distinct names remain (R01 above).
- R02 — repaired: lines 2897, 2913, 2962, 2977 read `` `AutomorphicBundles` §§8.2–8.3 (`canonicalKummerCoefficient`, the associated, graded and tensor comparisons) ``; `B3.log` has 0 hits.
- R03 — repaired: line 2041 "the open comparison for a strict-normal-crossings complement"; lines 2342, 2421 "étale ℓ-torsion cohomological dimension bound"; both invented names have 0 hits.
- R04 — repaired: References gain SW20, CON14, OGU18 (lines 3085–3087); 3.7 cites `[FAR11], §7.5, Thm. 6 (5), pp.38–39`; 6.29 cites Lemmas 5.3.7–5.3.8, Cor. 5.3.9, Props. 5.3.11–5.3.13; 6.22 cites Def. 5.1.2, p. 70.
- R05 — repaired: line 243 reads "For C the completed algebraic closure of `ℚ_p(T)` with the Gauss valuation"; `widehat` has 0 hits.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.15 (reworded) | `g = 0`; ordinary and supersingular E over `𝔽̄_p` | `g = 0`: `p⁰ = 1` point, Ha = 1 a unit; ordinary: p points, Ha ≠ 0; supersingular: 1 ≠ p points, Ha = 0 | both directions hold; same statement as before |
| 3.2 (reworded) | SCH15 line 1078; `ε = 0`, H étale | same base, `0 ≤ ε < 1/2`, conclusion mod `p^{1−ε}`; `ℓ̌_H ≃ 0`, lift exists | matches the source; no hypothesis lost |
| 3.7 nesting, functoriality (reworded) | SCH15 line 1177 (i), (ii), (iv); `p = 2, m = 2, w = 1/7` | `D_m` is now introduced before use; weak `3/7 < 1/2`, strong `4/7 ≥ 1/2` | matches; Check still discriminates |
| 3.7 duality, new locator | FAR11 Thm. 6 (5), line 2047; `G = A[p^m]`, `h = 2g`, `d = g` | dual step has rank `h − d = g`; `p^{mg}·p^{mg} = p^{2mg} = #A[p^m]`; `p^m w < 1/2` gives `w < 1/(2p^{m−1})`, and `< 1/3^m` at `p = 3` | holds for `p ≠ 2`, as stated |
| 3.8 (1) (reworded) | SCH15 line 1183 (iii); `p = 3`, `m₁ = m₂ = 1`, `w = 1/20` and `1/18` | `Ha(B) = 3w`; A level 2: `9w`, B level 1: `3·3w = 9w`; `9/20 < 1/2` both hold, `9/18 = 1/2` both fail | equivalence holds |
| 3.8 (2) (reworded) | `p = 5`; `w = 1/10`, `w = 1/6` | `5·(1/10) = 1/2`; at `1/(p+1)`: `p·w = 5/6 = 1 − w`, the two branches agree | holds |
| 3.8 (3) (reworded) | `Ha(A′) = 1/(2p)` | `Ha(A′/D) = 1/(2p²)`; its canonical quotient returns A′ with `p·1/(2p²) = 1/(2p)` | consistent |
| 0.5 Lean headline (cited by the description) | `#check @` on both declarations; one-tactic probe | types as in the previous review, all five field instances and four Hopf instances present; `first \| rfl \| simp \| infer_instance \| exact …` fails | statable, not padding |
| Title and summary block | README line 1, lines 7, 563–565, 2915, 3044, 3058 | title equals the README's; rank-one valuation ring "no completeness, discreteness or noetherianity" at 0.24; consumers named at line 3058 | agree with the head |
| "adds a roadmap" | worker's diff: 3188 insertions, 0 deletions, folder absent on main | description: "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)", "port from the accepted explorer package" | stated |

The rows for the untouched statements stand as in the previous review, of `06ce518`.

- Source locators checked against the text: 9 (FAR11 line 2035 Thm. 6 and line 2047 item (5), p. 38; DLLZ-adic line 3585 Def. 5.1.2, p. 70; lines 3837, 3852, 3880, 3898, 3907 on pp. 76–77; line 3925 Prop. 5.3.13, p. 78; SW20 line 3295 Thm. 10.5.1, PDF p. 92 = printed p. 82; CON14 lines 6512, 6551 Cor. 5.2.8–5.2.9, pp. 155–156 in its own pagination). The SHA-256 values of SW20 and CON14 match the cached files.
- Seeded sample: none of the fifteen sampled targets lies in a changed passage.
- Cross-roadmap citations resolved at the open heads: AutomorphicBundles §8.2 (l.2727) and §8.3 (l.2787, comparisons at ll.2830–2834); ClassicalAdicEtaleCohomology §11.1 (l.5667, open comparison at l.5672) and §11.2 (l.5697); CohomologyComparisons §6.2 strong-family API (ll.1141–1143).
- Gate at `a8b6690`: every counter 0 (`set_option=0 … readme-ids-missing=0 … depcheck=0 … outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`). No file outside the folder is changed.
- Dependency check: `depcheck: 245 roadmaps, 2246 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is line 186 of the merge order, after CohomologyComparisons (183) and AutomorphicBundles (185).
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses sorry` at line 54. The file is unchanged since `06ce518`.
- Remark (untouched text): 7.6 gives pp. 82–88 for the proof of SW20 Thm. 10.5.1; in the cached copy the proof ends on printed p. 89 (line 3596).
- Overlap check: read PerfectoidShimuraVarieties, AutomorphicBundles, CohomologyComparisons; nothing shared (PerfectoidShimuraVarieties l.14 and l.88 import §§2.1–2.3 and 2.12–2.13; AutomorphicBundles l.3268 leaves the estimates to §§3.6–3.9; CohomologyComparisons l.1444 keeps §6.2 and is consumed by 3.7–3.8). No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 5 passages compared with 2 sources (0.15, 3.2, 3.7, 3.8 with SCH15 lines 1078–1190 and 1126; 6.22 with DLLZ-adic line 3585), none shared; largest share DLLZ-adic, 43 of the bracketed source keys; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- OGU18 (Ogus, Chapter I, Prop. 4.1.2, p. 73): the book is behind the publisher's paywall and is not in the sources cache; the new References entry cites the published book by locator only.
- HALO author-copy page numbers and ZIE v2 numbering: as in the previous review (the cache holds the Numdam version and arXiv v4).

## Source issues

- none

## For the human reviewers

- none
