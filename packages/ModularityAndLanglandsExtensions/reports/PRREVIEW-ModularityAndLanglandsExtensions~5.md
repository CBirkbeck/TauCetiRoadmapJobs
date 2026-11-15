# Review of ModularityAndLanglandsExtensions (pull request #1180 at 01bc07c)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since `ef0ff5e` (two passages of `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md`: §2.24 lines 1211–1215 and §4.22 line 2777), plus the pull request's title and description. No findings.

## Previous findings

- R01 — repaired: line 1213 "The induced system `R_CM` … then has `H_CM`,`τ={0,…,m−1}`, and its bad places are exactly those ramified in L … (6). In addition, `Ψ` must be such that `det r_CM`,`λ=ε^{−m(m−1)/2}` for every λ (6)."
- R02 — repaired: line 2777 "let S be the set of places of E, other than `w₁` and `w₂`, at which `π′` is ramified, or which are ramified over `ℚ`, or whose residue characteristic is 2 or 3."
- R03 — repaired: line 1215 "the restrictions `r̄_p|G_{F_v}`, `ρ̄_{2,m,0}|G_{F_v}` and `r̄_aux`,`p|G_{F_v}` are all trivial"; the gate's `tex` counter is 0.
- R04 — repaired: line 1211 "An embedding `M↪ℂ` is fixed." (no tag); tag (5) remains once, on "`F/ℚ` is Galois and F contains an imaginary quadratic field `F₀`".
- R05 — repaired: the description now reads "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; the roadmap has also been through author-side red-team passes."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result/change |
|---|---|---|---|
| §2.24 `R_CM`, condition (6) of BCGNT Prop. 6.2.3 (bcgnt-2025 lines 3035–3050) | m=2; Ψ twisted by finite-order χ with `χ|𝔸_F^× ≠ 1` | Exponents (1,0),(0,1): HT {0,1} both sides; twist keeps HT, multiplies det by `χ|𝔸_F^×`; README now requires det `ε^{−1}`, so the twist is excluded | Agrees: HT and bad set consequences (6)(a), det a hypothesis (6)(b) |
| §2.24 tags against the source's conditions (bcgnt-2025 lines 3028–3052) | Tags (1)–(17) | Source conditions 17; tags in the six bullets 17; tag (5) occurrences 1 (source: Galois and `F₀` only, line 3032; embedding untagged, line 3033) | Agrees |
| §4.22 condition (8), Newton–Thorne Prop. 6.1 (newton-thorne-hilbert lines 2146–2149) | S = all places other than `w₁`,`w₂` (the previous witness) | Source: 1 set S, three membership clauses; README: 1 set, the same three clauses, `w₁`,`w₂` excluded; the witness S is no longer admitted; S finite | Agrees |
| §4.22 E(S) and the splitting conclusions | S, S∪{w₁} | `w₁` splits in `H·E(S)`, `w₂` in `H·E(S∪{w₁})`: 2 of 2 as source line 2148–2149; E(S) as defined at lines 1799–1800 | Agrees |
| §4.23 route, consumer of the §4.22 tags (README line 2797) | "all [§4.22](1)–(8)" | Tags cited 8, tags present in §4.22 8 | Citation still resolves |

Rows for untouched statements stand as in the previous review, of `ef0ff5e`.

- Source locators checked against the text: 3 (BCGNT Prop. 6.2.3 conditions (5)–(6); Newton–Thorne Prop. 6.1(8); Newton–Thorne §5 definition of E(S)), all correct.
- Seeded sample: none of the 15 targets lies in or cites a changed passage; not reopened.
- Statements of `Suggested.lean` changed: 0. Elaboration with `lake env lean`: one warning, `sorry` at line 64.
- Gate rerun at this head: OK, every counter 0 (`tex=0`); the worker's run includes `build=0`.
- Dependency check: `depcheck: 239 roadmaps, 2293 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Cross-roadmap citations: the change adds or alters none; the resolver lists none missing. Files changed outside the folder against the base (`origin/main...HEAD`): none.
- Pull request text: title and description read against the head and the folder's change (adds the roadmap, 3 Lean declarations, no heading removed); no sentence contradicted.
- Overlap check: the change adds no object; the worker's overlap list has no dropped id, no second copy and no result-level match; the closest roadmaps' scopes (AutomorphicGaloisRepresentationsPartII, PotentialAutomorphyInfrastructurePartII, PotentialModularityAndCompatibleSystems) were not re-read this round; nothing shared by the changed passages.
- Source independence: changed passages only; 2 passages compared with 2 sources (bcgnt-2025, newton-thorne-hilbert), none shared beyond formulas, standard names and a hypothesis list that can be written one way; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
