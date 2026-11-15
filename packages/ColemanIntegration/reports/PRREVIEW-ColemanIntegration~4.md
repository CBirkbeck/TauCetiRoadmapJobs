# Review of ColemanIntegration (pull request #1043 at c35168f)

**Verdict:** needs changes

Incremental re-review of the 12 lines changed since 4903670 (6 insertions, 6 deletions, all in `TauCetiRoadmap/ColemanIntegration/README.md`), and a first check of the title and description against this head.

## R01 (P3) — `noLowWeightKTheory_numberField` for every number field still cites an injectivity that L3.Fc.1 states only for `k/ℚ` Galois

**Location.** `TauCetiRoadmap/ColemanIntegration/README.md` line 2416: "a number field `k`, and more generally a subfield of `ℚ̄` … follows from the injectivity of the complex regulator `(Φ_∞ ∘ σ)_σ` proved in L3.Fc.1"; *Needs:* line 2419; L3.Fc.1 line 2655: "Let `n ≥ 2, k/ℚ` be finite Galois".

**Claim.** L3.Fc.1 supplies injectivity of the regulator on `K_(2n−1)(k)_ℚ` for every number field `k`.

**Witness.** `k = ℚ(2^(1/3))`, `n = 2`: `r₁ = r₂ = 1`, `dim K_3(k)_ℚ = 1`, `k/ℚ` not Galois, so L3.Fc.1 (line 2655, and line 39 "for finite Galois `k/ℚ`") is silent. Lines 2416, 2419, 2655 are unchanged since 4903670.

**Repair.** Either (a) state L3.Fc.1's regulator theorem (injectivity and lattice image of `(Φ_∞ ∘ τ)_τ`, `τ` over the embeddings `k → ℂ`) for every number field, as BBdJR Theorem 2.2, p. 5, does, keeping "Galois" only for `G`, `M^E_π` and the pairings, and change line 39 to match; or (b) add to the bullet at line 2416: "for `k` not Galois over `ℚ`, with Galois closure `k'`, the pullback `K_(2n−1)(k)_ℚ → K_(2n−1)(k')_ℚ` commutes with every `ψ^a` and is injective, since its composite with the transfer is multiplication by `[k' : k]`; so each weight-`j` eigenspace embeds in that of `k'`, which is zero for `j ≠ n`", with the transfer of finite field extensions added as a target of L3.Fa.1. Tested on the witness: `k' = ℚ(2^(1/3), ζ_3)`, `[k' : k] = 2`, `r₂(k') = 3`, `dim K_3(k')_ℚ = 3`, pure of weight 2 by the Galois case; the weight-`j ≠ 2` part of `K_3(k)_ℚ` injects into `0`.

## R02 (P3) — the description says the red-team passes are still to come

**Location.** Pull request description, the paragraph "Validation": "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim.** No red-team or review pass has been applied to the roadmap at this head.

**Witness.** `git log origin/main..HEAD`: sixteen commits titled "red-team repairs" (from `6c97efa2` to `71569c06`) and three titled review repairs (`507972bc`, `4903670a`, `c35168fa`) precede this head.

**Repair.** Replace the sentence by: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; the red-team and review repairs since are in the branch's commits."

## Previous findings

- R01 — repaired: lines 34, 89, 99, 2800, 2810 read `TauCeti.indClassFun_indClassFun_subgroupOf`; line 88 reads "equals `TauCeti.indClassFun H (λ ·)`". No `Subgroup.indClassFun` remains in the README.
- R02 — not repaired: line 2416 "follows from the injectivity of the complex regulator `(Φ_∞ ∘ σ)_σ` proved in L3.Fc.1"; line 2655 "Let `n ≥ 2, k/ℚ` be finite Galois with group `G`". R01 of this report.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `TauCeti.indClassFun_indClassFun_subgroupOf` as cited at line 89 (`L ≤ T`, `L` of finite index, `f` a class function on `L`) | `L = C₄ ≤ T = Q₈ ≤ G = Q₈ × C₃`, `λ(i) = ζ_4`, at `g = −1` and `g = 1` | iterated: `Ind_L^T λ(−1) = −2`, then `3·(−2) = −6`; direct: six cosets, each `λ(−1) = −1`, sum `−6`; at `1`: `3·2 = 6 = [G:L]` | both sides agree; pinned statement has exactly these hypotheses | none |
| `FDRep.exists_character_eq_indClassFun_of_isNilpotent` as cited at line 88 (value `TauCeti.indClassFun H (λ ·)`) | `E = Q₈`, 2-dim irreducible `ψ`; `E = C_n` | `Ind_{C₄}^{Q₈} λ`: `±2` at `±1`, `ζ_4 − ζ_4 = 0` at `±i`, `0` off `C₄`; `ψ = (2, −2, 0, 0, 0)`; cyclic: `H = ⊤`, `λ = ψ` | matches; conclusion of the pinned theorem is stated with `indClassFun` in namespace `TauCeti` | none |
| `brauer_induction_linear` (line 2804) through the renamed step at lines 2800, 2810 | `G = S₃`, standard character; trivial `G` | `Ind_{C₃}^{S₃} ω = (2, 0, −1)` (`ω + ω̄ = −1`); `1 = Ind_1^1 1` | holds; nilpotency used only for the elementary subgroups | none |
| `noLowWeightKTheory_numberField` route (line 2416) | `k = ℚ(i)`, `n = 2`; `k = ℚ(2^(1/3))`, `n = 2` | Galois: `dim K_3 = r₂ = 1`, weight-1 part killed since `(2² − 2¹) ch = 0`; non-Galois: L3.Fc.1 silent, transfer to degree-6 closure gives injection into `0` | statement true; cited route short for non-Galois `k` | R01 |

The rows for the untouched statements stand as in the previous review, of `4903670`.

- Gate at this head (worker's run and mine): every check 0, `build=0`, OK. `lake env lean` on `TauCetiRoadmap/ColemanIntegration/Suggested.lean`: five `declaration uses sorry` warnings (lines 52, 68, 76, 97, 118), nothing else; the file is unchanged since 4903670.
- Dependency check: `depcheck: 247 roadmaps, 2246 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Library declarations opened at the Tau Ceti pin `a91d3aaf` (source read; the object files of these modules are not built here, so no `#check` this round): `TauCeti/RepresentationTheory/Induction/ClassFunction.lean:92` `namespace TauCeti` (closed at 479), `:178` `indClassFun`, `:325` `indClassFun_indClassFun_subgroupOf`; `TauCeti/RepresentationTheory/Induction/Monomial.lean:71` `namespace FDRep`, `:81` `exists_character_eq_indClassFun_of_isNilpotent`, conclusion `W.character = indClassFun H fun h => (χ h : k)`.
- Cross-roadmap citations in the changed passages: none changed (the six edits are identifier prefixes); `brauer_induction_linear` occurs only in this roadmap across the open heads and main (`roadmaps grep`), so it has one owner.
- Source locators: the changed passages change no locator. Of the seeded sample only the Construction of L3.Fd.2(d) falls in them; its BBdJR locators are untouched and were verified in the earlier reviews, not re-read now.
- Pull request text against the head: the summary block's and prose's claims checked against README lines 3 (odd `p`, `N = Dp^n`, twist kept, parts (1)–(3)), 13–41 (imports of annulus carriers, Bloch groups, complex polylogarithms; analysis over complete ultrametric characteristic-zero fields), 52 (`p = 2` for analytic statements), 3260 (`D = 1` not an Amice transform), 3341–3343 (the six consumers named), and the folder's three files and nine Lean declarations; one stale sentence (R02).
- Overlap check: `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy; the scopes of PadicHodgeRegulators, ColemanIntegrationPartII and PolylogarithmFunctions were not re-read, since the diff adds no object; nothing shared in the changed passages.
- Source independence: changed passages only; 6 changed lines compared, all replacements of a declaration prefix, no prose from any source; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Serre, *Linear Representations of Finite Groups*, §8.5 Theorem 16 and §10.5 (cited at lines 88 and 2804): a book, not in the sources cache, not fetched; unchanged from the previous review.
- Kedlaya, *p-adic Differential Equations*; Quillen, LNM 341; RJW published pages; BHYY OCR formulas: unchanged from the previous reviews.

## Source issues

- none

## For the human reviewers

- none
