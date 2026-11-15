# Review of HalfIntegralWeightModularForms (pull request #1721 at a6d185b)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since a6d185b. This round reads the pull request's title and description against the head; the folder is unchanged.

## R01 (P3) — the description says three Layer 5 theorems are only stated

**Location:** pull request description, prose paragraph after the summary block: “Kohnen's plus space with Kohnen–Zagier, Waldspurger and Shintani stated”.

**Claim:** At this head the three are proof targets, not statements without proof. The sentence was written for the first commit, whose §§5.5–5.7 opened with “**State**”.

**Witness:** `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md` 33–34: “Every theorem in the eight layers is a proof target, including the higher-level plus-space theory, special-value identities, cycle formulas”; 1505 and 1531 open with “**Prove**”; 1589 “are proof targets here”.

**Repair:** Replace the clause by: “Kohnen's plus space with the Kohnen–Zagier formula, Waldspurger's theorem and the Shintani lift with its cycle-integral formula, all as proof targets”. The summary block's “The upper layers establish …” already agrees with the head and needs no change.

## Previous findings

- none: the previous report (of a6d185b) had no finding; its two repaired findings of the round before stay repaired, since the folder did not change.

## Verified sound

| Statement | Instances and computed values | Result | Change |
|---|---|---|---|
| Description: “8 layers and 38 milestones” | README headings `## Layer 0` … `## Layer 7`: 8; numbered `### k.n` subsections: 6+3+4+4+7+7+4+3 = 38 | agrees | none |
| Description: “positive level divisible by four and even Dirichlet nebentypus” (README 45, 228) | `γ = −I ∈ Γ₀(N)`: `θ(γz) = θ(z)`, so `j(−I, z) = 1` and the law gives `f = χ(−1) f`; `χ(−1) = −1` forces `f = 0` | agrees with “the spaces for odd `χ` are `0`” | none |
| `finrank_four`, cited by the description's “LMFDB dimensions” (0.6) | basis `θ^{2k+1−4j} F^j`, `0 ≤ j ≤ ⌊(2k+1)/4⌋`: `k = 0,1,2,3,4` give `⌊(2k+1)/4⌋ = 0,0,1,1,2 = ⌊k/2⌋`; count `1,1,2,2,3 = k/2 + 1` | Lean right side equals the basis count | none |
| `finrank_plusSpace` (5.3; the description's “plus-space isomorphism with integral-weight forms”) | `k = 1`: `M_{3/2}(4) = ⟨θ³⟩`, `θ³ = 1 + 6q + …`, index `1` has `−1 mod 4 = 3 ∉ {0,1}` and coefficient `6`, so `dim = 0 = dim M₂(SL₂(ℤ))`. `k = 2`: `θ⁵ − 20θF = 1 − 10q + 0q² + 0q³ + …` (`40 − 20·2`, `80 − 20·4`), `θ⁵` alone has `40q²`, so `dim = 1 = dim M₄` | holds at both instances; `Int` `%` by `4` is nonnegative, so the predicate reads residues `0, 1` as intended | none |
| R01: §§5.5–5.7 “stated” against the head | first commit of the branch: “**State** (Kohnen–Zagier, Theorem 1)”, “**State** (Waldspurger 1981 …)”; head: “**Prove**” at 1505, 1531, proof scope at 33 | description contradicted | R01 |

The rows for every statement of the folder stand as in the previous review, of a6d185b.

- The title, the three paragraphs of the summary block, the prose paragraph and the three file bullets of the description were each read against the head; 1 clause is contradicted (R01). “Γ₀(4N)” in the prose and “Γ₀(N), 4 ∣ N” in the README denote the same levels. The pull request adds the roadmap (not on main; 0 headings and 0 declarations removed), as the title says. `metadata.toml` has `topic = "math.NT"`, as stated.
- Suppliers: the README's open suppliers are AutomorphicBundles, GeometryOfNumbersAndQuadraticArithmetic, MetaplecticAutomorphicForms and QSeriesPartitionsAndMockModularForms (README 399–413); all four are open new-roadmap pull requests and precede this roadmap in the candidate order; ModularForms, ThetaSeries and IntegralLattices are on main.
- Gate: the worker's gate at a6d185b passes every check (`build=0 OK`). The dependency check against the candidate order: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The gate rerun without the candidate order reports every text check `0` and `depcheck: NOT IN ORDER` (the roadmap is placed after its last supplier; not a finding).
- Elaboration: `lake env lean` on `Suggested.lean`: exit 0, 17 warnings, all `declaration uses sorry`, no error. The supplied signatures file reports 0 of 42 declarations with a lost binder.
- Outside the folder: the pull request's diff against main is empty; the worktree is clean.
- Seeded sample: none of the 15 targets is in a changed passage (the folder did not change); no source was fetched this round.
- Remark on untouched text (no change requested in this round): ModularForms on main, `TauCetiRoadmap/ModularForms/README.md` 24–34, says its §0.2 owns Dedekind sums, their reciprocity law, the Dedekind-sum and Kronecker-symbol values of the eta multiplier and the cusp orders of eta quotients, and that this roadmap takes them from §0.2; README 55–60 and §3.3 here list the same objects as owned, with `dedekindSum`, `dedekindSum_reciprocity`, `eta_smul_eq_dedekind`, `eta_smul_eq_of_odd`, `eta_smul_eq_of_even` in `Suggested.lean`.

Overlap check: read SiegelModularForms (open, 93–101, 196, 447–459), ThetaSeries (main, 29–30, 156), ModularForms (main, 24–34), QSeriesPartitionsAndMockModularForms (open, scope paragraphs); Jacobi carrier in classical form: this roadmap (SiegelModularForms declares none); odd-rank theta modularity: this roadmap (ThetaSeries excludes it); eta multiplier `ν_η`: QSeriesPartitionsAndMockModularForms §5.2; Dedekind sums and the eta closed forms: see the remark above. `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id only an open revision defines. The heads of AutomorphicBundles, GeometryOfNumbersAndQuadraticArithmetic and MetaplecticAutomorphicForms were not among the supplied checkouts; ownership against them was not rechecked.

Source independence: changed passages only; 0 passages changed, so none compared this round; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Source access, inherited for untouched material: Shimura 1973, Serre–Stark, Kohnen 1980/1982/1985, Waldspurger 1981 and the Cohen, Apostol, Knopp and Koblitz locators were not certified in full; the Eichler–Zagier citation is to the 1983 preprint.
- “One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts” (description): a statement about other pull requests, not checkable from this folder.

## Source issues

- none

## For the human reviewers

- **Not tested.** No source text was read in this round (the folder did not change); the wording and arrangement comparisons rest on the earlier full review, whose report lists the paywalled sources it could not certify.
