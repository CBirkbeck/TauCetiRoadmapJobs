# Review of ModularCharactersAndBlocks (pull request #1775 at 534668f)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Incremental AI re-review of the 16 lines changed since `ae2f373`. The word-level diff of the folder shows a single textual change: the §2.3 parenthetical about `k̄/k₀` now reads “need not be algebraic, for instance when `k = 𝔽₄(T)`”, which is the repair the previous review asked for and is true; the other changed lines are re-wrapping of the same paragraph, and `Suggested.lean` is byte-identical to the head of the fifth review. One finding remains, P3 and not blocking: the family index is still main's copy and excludes what this roadmap owns. The repair comment on this head answered it again as outside a repair job's two files, which is true of the repair job and leaves the pull request as it was, so it is raised again for the author's own commit. The gate passes, the dependency check reports no problem, and the Lean file elaborates with exactly the eight `sorry` warnings. No pull-request file was changed outside the folder.

## R01 (P3) — The family index excludes the roadmap it now contains

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:11–63` (the list of the family's roadmaps) and `:111–117`, “the modular theory proper — Brauer characters, decomposition matrices, blocks with defect … — is out of scope for every roadmap here”.

**Claim:** The family index describes the family after this pull request.

**Witness:** At `534668f`, `git diff origin/main...HEAD -- TauCetiRoadmap/RepresentationTheory/README.md` is empty and `git diff --stat origin/main...HEAD` lists only the folder's two files (911 and 164 lines). `grep -c ModularCharactersAndBlocks` on the index gives `0` while the folder `ModularCharactersAndBlocks/` is in the family directory. The exclusion sentence at `:117` names exactly the objects `ModularCharactersAndBlocks/README.md:26` says this roadmap owns. The pull-request description says the index and the scope boundaries are updated.

**Re-raised: H01** (the repair comment on `534668f`, and the same answer on `ae2f373`). The reason given, that the index is outside the two files a repair job may edit, describes the repair job's allowance and not the pull request: the brief for this review names the files directly in `TauCetiRoadmap/RepresentationTheory/` as the pull request's own, the comment itself says the finding is correct as stated, and the defect is in the pull request the human will approve. No repair round can close it, so it needs the author's commit, which both repair comments name as the place for the edit.

**Repair:** On top of the index as it stands on the branch (main's copy, so that main's later entries, including the ArtinAlgebras ones, are kept), add a list entry for ModularCharactersAndBlocks after ModularInduction (Brauer characters, decomposition and Cartan matrices, projective characters, block idempotents, defect groups, Brauer's three main theorems, the principal-block and section-orthogonality interfaces); a dependency bullet under “How they depend on one another” saying it consumes CharacterTheory, ModularInduction, QuiverRepresentations Layer 3 and InductionRestriction Layer 6; and a scope bullet naming ModularCharactersAndBlocks as the owner of Brauer characters, decomposition matrices and blocks with defect, keeping the exclusion of the modular representation theory of symmetric groups. `git diff 5fe14341~1 4e18c0d3 -- TauCetiRoadmap/RepresentationTheory/README.md` shows three edits with this content; apply them to the current index, not to the older copy that commit edited.

## Previous findings

- R01 — not repaired: `git diff origin/main...HEAD -- TauCetiRoadmap/RepresentationTheory/README.md` is empty at `534668f`; the index has no entry for this roadmap and `:117` still reads “is out of scope for every roadmap here”. The repair comment answered it as not actionable in a repair round; raised again as R01 with the reason.
- R02 — repaired: `README.md:422–424` now reads “(`k̄/k₀` itself need not be algebraic, for instance when `k = 𝔽₄(T)`, so the descent is never run along it)”, the first of the two wordings the previous review offered; true for `k = 𝔽̄₂` (algebraic, `k̄₀ = k̄`) and for `k = 𝔽₄(T)` (transcendence degree `1`), and the route still runs only along `Gal(k̄₀/k₀)`. No new problem: the rest of the paragraph (`:424–435`) is re-wrapped with no word changed, checked with a word diff.

## Verified sound

**Scope of this round.** `git diff --stat ae2f373 HEAD` is `README.md | 16 ++++++++--------` (8 insertions, 8 deletions, one hunk at `:420–433`); `git diff --word-diff` of that hunk shows one change, “is not algebraic when `k` is infinite” → “need not be algebraic, for instance when `k = 𝔽₄(T)`”. `git diff ae2f373 HEAD -- Suggested.lean` is empty, so the Lean file is still that of `5c1a0d2`. The brief's command for changes outside the folder printed nothing; `git diff --stat origin/main...HEAD` lists only the folder's two files. The worktree head is `534668f67c5df6770fd30aa984509079aaccf3e1` and clean.

**Gate and build.** The worker's gate at `534668f` reads `… depcheck=0 … outside-folder=0 source-material=0 build=0 OK`; my own run of the gate command of the brief printed the same counters, every one `0`, `OK`, exit `0`. Independent `lake env lean TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean` from the pull-request worktree exited `0` in 18 s with exactly the eight `declaration uses sorry` warnings at lines 42, 56, 72, 99, 117, 127, 139, 153 and nothing else. The worker's separate signature elaboration failed on a missing object file in a shared lake directory, not on the file; since the file is unchanged since `5c1a0d2`, the r5 report's `#check @name` comparison (eleven declarations, each elaborated type agreeing with its README statement and carrying its own binders) and its padding probe (none of the eight theorems closes in one tactic) stand.

**Dependency check.** The command of the brief returned exactly:

```text
depcheck: 240 roadmaps, 2358 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. The diff adds no supplier citation and no Lean name; the worker's citation check at this head found no cross-roadmap citation and no Lean name unresolved.

**The changed sentence against the mathematics.** The parenthetical is a side remark inside the §2.3 route; the route itself (descent along `Gal(k̄₀/k₀)` with `k̄₀` the algebraic closure of `k₀ = 𝔽_p(ζ_{e'})` inside `k̄`, the Brauer-character stability of simples, the endomorphism-dimension count `[k₁ : k₀] = [k₁ : k₀]²`, the radical base change `k₀ → k`) is unchanged since `ae2f373`, where the r7 report checked each step, the three Mathlib names at the pin (`Mathlib/RingTheory/LittleWedderburn.lean:169`, `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:481`, `Mathlib/RingTheory/Jacobson/Radical.lean:166`) and the Webb locators (`webb` lines 6054–6056, 6057–6070, 6958–6966, 6974–6977, 7004–7008; printed = PDF − 7). The new sentence makes two claims: that `k̄/k₀` can fail to be algebraic, and that `𝔽₄(T)` is an instance. Both hold: with `p = 2` and `ζ_{e'} ∈ 𝔽₄` (so `e' ∈ {1, 3}`, `k₀ ∈ {𝔽₂, 𝔽₄}`), `k̄ ⊇ 𝔽₄(T)` has transcendence degree `1` over `k₀`. The instance agrees with the Check at `:454–459` on the same field (`k₀ = 𝔽₄`, `k[C₃] = k³`). “Need not” is also right in the other direction: for `k = 𝔽̄₂` the extension is algebraic, and the sentence no longer claims otherwise.

**Sampled targets.** Of the fifteen seeded targets, only “2.3 Residue-field splitting” falls in the changed hunk, and only in its side remark, checked above. The other fourteen (§§1.1, 1.3, 2.2, 2.4, 3.1, 5.2, 6.1, 6.2, 6.3, 7.1, 7.2, 7.3, 8.2, 8.3, 8.4 as seeded this round) are byte-identical to `5c1a0d2`, where the r5 report opened each at its locator (`webb`, `martinez`, `sambale`, `craven`, `axiom-third`, `axiom-section` line numbers in its “Sources: the seeded sample” table; page offsets `webb` PDF − 7, `martinez` PDF − 8, `sambale` = PDF, `craven` PDF − 5), and the r6 and r7 reports carried forward.

**Ownership and consumers.** The diff introduces no object and no citation, so the r5 ownership search stands (`IsDefectGroup`, `brauerProjection`, `IsBlockIdempotent`, `brauer_first_main` declared only here; GlaubermanZStar the only consumer among the open heads). Ownership against open pull requests whose files the brief does not supply was not re-searched.

**Adversarial computations.** The rows for the untouched statements are those of the r7 report (A01–A15, A16a–A16d, A16f, A16g, A17–A44, which cite r6 and r5), carried forward with their values; A16e is replaced by the row for the repaired sentence. Notation as in r5: `r = (123)` in `S₃`; `α² + α + 1 = 0` in `𝔽₄`.

| Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| A01–A15 (r7, unchanged text) | as in r7 | as in r7 (e.g. A14: `S₃`, `p = 3`: `2` simples, `2` regular classes; A15: `End_{𝔽₂[C₃]}` of the `2`-dimensional simple is `𝔽₄`, `𝔽₄[C₃] = 𝔽₄³`) | Pass | — |
| A16a §2.3 descent along `Gal(k̄₀/k₀)` (r7) | `C₃`, `p = 2`, `k₀ = 𝔽₄`; control `𝔽₂` for `k₀` | `T` with `r ↦ α`: `k₁ = 𝔽₄ = k₀`, `n = 1`, `End(𝔽̄₂ ⊗ T) = 𝔽̄₂`, `1 = 1²`; over `𝔽₂`: `T = 𝔽₄`, `k₁ = 𝔽₄`, `n = 2`, conjugates `r ↦ α`, `r ↦ α²` swapped by Frobenius, `End = 𝔽̄₂²`, `2 ≠ 4` | Pass | — |
| A16b–A16d §2.3 base change, `𝔽₄(T)` Check, subgroup clause (r7) | as in r7 | `rad = 0` both sides for `𝔽₄ → 𝔽₄(T)`; `rad(𝔽₂[C₂]) = (1 + t)` and its base change; `𝔽₂(T)[C₃]` simples of dimensions `1`, `2`; `2 ∣ 2`, `3 ∣ 3` | Pass | — |
| A16e §2.3 remark “`k̄/k₀` need not be algebraic, for instance `k = 𝔽₄(T)`” (repaired) | `k = 𝔽₄(T)`, `p = 2`, `e' = 3` (`C₃`) and `e' = 1` (`C₂`); `k = 𝔽̄₂`, `e' = 3` | `𝔽₄(T)`: `k₀ = 𝔽₄` resp. `𝔽₂`, `trdeg(k̄/k₀) = 1`, not algebraic, instance valid; `𝔽̄₂`: `k₀ = 𝔽₄`, `k̄ = k`, `trdeg = 0`, algebraic, `k̄₀ = k̄`, consistent with “need not” | Pass | — |
| A16f §2.3 bullet: bijection of simples under `k → k̄` (r7) | `C₃`, `p = 2`, `k = 𝔽₄`; control `𝔽₂` | `3` simples over `𝔽₄` and over `𝔽̄₂`, bijection; `2` simples over `𝔽₂` against `3`, no bijection | Pass | — |
| A16g §1.1 `k̄` convention, `μ_{e'}(k̄₀) = μ_{e'}(k₀)` (r7) | `e' = 3`, `p = 2`; `e' = 1`, `p = 5` | `3` elements each; `{1}` both | Pass | — |
| A17–A44 (r7, unchanged text) | as in r7 | as in r7 (e.g. A19: `DᵀD = [[2,1],[1,2]]` for `S₃`, `p = 3`; A35: `k[C₂]` one block of defect `⟨t⟩`; A42: `ker 1 ∩ ker sgn = C₃ = O_{2'}(S₃)`) | Pass | — |

## Not verifiable

- **Navarro, Theorem 6.10 (`navarro`)** and **Serre (`serre`)**: settled as uncertified; cited by locator; untouched by the diff.
- **Open pull requests without supplied files** were not re-searched this round; the diff introduces no new object.

## Source issues

- **Misprint** in webb at Theorem 9.2.7 and the remark after it, printed p. 144: the source says a field containing a primitive `m`-th root of unity, `m` the exponent of `G`, is a splitting field, and that `𝔽_p(ζ)` with `ζ` a primitive `m`-th root is the smallest for all subgroups; in characteristic `p` dividing `m` no such root exists, and it should be the prime-to-`p` part of `m`; affects nothing.
