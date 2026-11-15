# Review of ModularityAndLanglandsExtensions (pull request #1180 at ef0ff5e)

**Verdict:** needs changes

Incremental re-review of the 17 lines changed since `e3a0748` (three reworded passages: §2.24, §4.22, §4.33), plus the pull request's title and description.

## R01 (P2) — §2.24 turns hypothesis (6)(b) into a consequence

**Location:** `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` line 1213: "The induced system `R_CM=Ind_{G_L}^{G_F}Ψ` then has `H_CM`,`τ={0,…,m−1}` and `det r_CM`,`λ=ε^{−m(m−1)/2}`".

**Claim:** The determinant of `R_CM` is presented as following from the formula for `Ψ` on `L^×`. In BCGNT Prop. 6.2.3 only the Hodge–Tate set follows; the determinant is the separate condition (6)(b), so the reworded list drops a hypothesis.

**Witness:** bcgnt-2025 lines 3045–3050. Twist `Ψ` by a finite-order Hecke character `χ` with `χ|𝔸_F^× ≠ 1`: the formula on `L^×` is unchanged, `det r_CM` is multiplied by `χ|𝔸_F^×`.

**Repair:** Replace the sentence by: "The induced system `R_CM=Ind_{G_L}^{G_F}Ψ` then has `H_CM`,`τ={0,…,m−1}`, and its bad places are exactly those ramified in L together with those over which `Ψ` ramifies; in addition `Ψ` is required to satisfy `det r_CM`,`λ=ε^{−m(m−1)/2}` for every λ (6)." (The twisted `Ψ` of the witness is then excluded by hypothesis.)

## R02 (P2) — §4.22 condition (8): S is the set, not any set containing it

**Location:** `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` line 2777: "let S be a set of primes containing neither `w₁` nor `w₂` but containing each prime at which `π′` is ramified or `E/ℚ` is ramified, as well as each prime of characteristic 2 or 3".

**Claim:** As written, the splitting of `w₁` in `H·E(S)` is asserted for every such S. Newton–Thorne Prop. 6.1(8) asserts it for exactly one S; enlarging S enlarges E(S) and strengthens the claim.

**Witness:** newton-thorne-hilbert lines 2146–2149. For S = all places other than `w₁`,`w₂`, E(S) contains a quadratic extension of E in which `w₁` is inert, so `w₁` does not split in `H·E(S)`.

**Repair:** "let S be the set of places of E, other than `w₁` and `w₂`, at which `π′` is ramified, or which are ramified over `ℚ`, or whose residue characteristic is 2 or 3." (This S is finite and is the source's; the witness S is no longer admitted.)

## R03 (P3) — gate failure `tex`: subscript outside a code span in §2.24

**Location:** `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` line 1215: "the restrictions `r̄_p|G_{F_v}`, `ρ̄_{2,m,0}|G_{F_v}` and `r̄_aux`,p|G_{F_v} are all trivial".

**Claim:** `|G_{F_v}` after `` `r̄_aux`,p `` is TeX-style syntax outside a code span; the gate's `tex` rule fails on this line and nothing else fails.

**Witness:** Gate at this head: `tex=1 … FAIL`, `tex: line 1215`; every other counter is 0.

**Repair:** Write the third restriction as `` `r̄_aux`,`p|G_{F_v}` `` (the form the file uses elsewhere for a subscript after a comma), so the line reads "… `ρ̄_{2,m,0}|G_{F_v}` and `r̄_aux`,`p|G_{F_v}` are all trivial".

## R04 (P3) — §2.24 tags the choice of `M↪ℂ` as condition (5)

**Location:** `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` line 1211: "An embedding `M↪ℂ` is fixed (5)."

**Claim:** Condition (5) of BCGNT Prop. 6.2.3 is only that `F/ℚ` is Galois and contains `F₀`; the embedding is fixed in the unnumbered sentence between (5) and (6).

**Witness:** bcgnt-2025 lines 3032–3034.

**Repair:** "An embedding `M↪ℂ` is fixed." (no tag).

## R05 (P3) — the description's assistance sentence is contradicted by the head

**Location:** pull request description: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** The red-team passes are not still to come: the branch already contains them and the later review repairs.

**Witness:** `git log origin/main..HEAD`: eight commits titled "red-team repairs" (from `c5099772` to `393335a9`), then `05a5276a`, `e3a07480` "review repairs" and `ef0ff5ec`.

**Repair:** "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; author-side red-team passes and review repairs have since been applied."

## Previous findings

- none: the review of `e3a0748` had no findings.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result/change |
|---|---|---|---|
| §2.24 hypothesis list against BCGNT Prop. 6.2.3 (bcgnt-2025 lines 3023–3096) | Tags (1)–(17) | Source conditions 17; tags present in the six bullets 17; conditions whose status changed 1: (6)(b) | R01; tag (5) misplaced once, R04 |
| §2.24 `R_CM` | m=2 | Exponents (m−i, i−1) = (1,0),(0,1); HT {0,1}; required det ε^{−1}; twisting Ψ by χ keeps HT, changes det by `χ|𝔸_F^×` | HT is a consequence, det is not: R01 |
| §2.24 auxiliary systems | n=m=2 | `R_aux`: HT sum 1 = m(m−1)/2; `S_UA`: rank 4, HT sum 0+1+2+3=6 = nm(nm−1)/2; weights 1 and 3 | Consistent |
| §2.24 prime bounds | n=1, m=2 | 2nm+1=5, so p,r ≥ 7; both bounds and both degree conditions kept, (11) and (12) | Consistent |
| §2.24 local conditions (13)–(17) | `Σ_ord`, `Σ_ss`, v above r | Trivial residual restrictions at p: 3, as in (15)–(16); crystalline-ordinary at `Σ_ord`: 3; connects at `Σ_ss`: 3; at r: trivial and ordinary, (17) | Agrees with source and with the proof route's tags (13)–(17) |
| §4.22 against Newton–Thorne Prop. 6.1 (newton-thorne-hilbert lines 2127–2149) | Conditions (1)–(8); p=5, r=1 | 8 conditions, 8 tags; power index p+r−1=5; `q_{v₀}` ∈ {4,9,19}, `q_{v₁}` ∈ {11,31}; S: source 1 set, README every superset | R02; the rest agrees |
| §4.22 E(S), `a₀(p)` | Locators | E(S) defined at lines 1799–1800 (p. 38); `a₀(p)≥3` at lines 478–479 (Lemma 2.3, p. 11) | Agree |
| §4.33 against BCGNT Thm. 7.2.1 (bcgnt-2025 lines 3412–3420, p. 69) | Strongly irreducible; induced from a Hecke character ψ, n=3 | Purity in both branches: 2 of 2; `Sym²Ind ψ = Ind ψ² ⊕ (ψψ^c)`, dimensions 2+1=3, each ≤ 2 | Agrees; hypothesis "irreducible" covers both branches |
| §4.23 route, the consumer of the §4.22 tags | "all [§4.22](1)–(8)" at line 2797 | Tags cited 8, tags present 8 | Citation still resolves |

Rows for untouched statements stand as in the previous review, of `e3a0748`.

- Source locators checked against the text: 5 (BCGNT Prop. 6.2.3 pp. 61–63; Thm. 7.2.1 p. 69; Thm. C p. 4; Newton–Thorne Prop. 6.1 pp. 45–46; §5 p. 38 with Lemma 2.3 p. 11), all correct in the arXiv versions the README links.
- Seeded sample: none of the 15 targets lies in or cites a changed passage; not reopened.
- Statements of `Suggested.lean` changed: 0. Elaboration with `lake env lean`: one warning, `sorry` at line 64.
- Gate rerun at this head: FAIL on `tex=1` (R03); every other counter 0, build included in the worker's run.
- Dependency check: `depcheck: 241 roadmaps, 2286 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Cross-roadmap citations: the change adds or alters none; the worker's resolver lists none missing. Files changed outside the folder: none.
- Pull request text: title and description read against the head and the folder's change (adds the roadmap, 3 Lean declarations, no headings removed); summary-block claims checked at README lines 49, 64, 66, 684, 896, 1944; one stale sentence (R05).
- Overlap check: the change adds no object and the worker's overlap list has no dropped id, no second copy and no result-level match; the closest roadmaps' scopes were not re-read this round.
- Source independence: changed passages only; 3 passages compared with 2 sources, none shared beyond formulas and standard names; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
