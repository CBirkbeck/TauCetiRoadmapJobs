# Review of GrothendieckTeichmuller (pull request #1058 at 40010b5)

**Verdict:** needs changes

## R01 (P3) — Tag 0BNB paraphrased without its connectedness hypothesis

**Location:** `TauCetiRoadmap/GrothendieckTeichmuller/README.md:694–696`: "builds the étale fundamental group of a scheme through Galois categories: finite étale covers form a Galois category with the fibre functor at a geometric point (Tag 0BNB, `FiniteEtaleGaloisCategory.lean`)".

**Claim:** Tag 0BNB (Stacks, Lemma 58.5.5) and the docstring of the cited Lean file both assume that `X` is connected. The sentence leaves this out, and without it the statement is false.

**Witness:** Take `X = Spec(ℂ × ℂ)`, with `x̄` over the first factor and `Y = Spec ℂ` the second component. Then `F_x̄(Y) = ∅ = F_x̄(∅)`, so `F_x̄` sends the non-isomorphism `∅ → Y` to an isomorphism and does not reflect isomorphisms.

**Repair:** Replace the quoted passage with: "builds the étale fundamental group of a connected scheme through Galois categories: for a connected scheme `X`, the finite étale covers of `X` form a Galois category with the fibre functor at a geometric point (Tag 0BNB, `FiniteEtaleGaloisCategory.lean`)". The witness above is not connected, so the repaired sentence excludes it.

## Previous findings

- none: the report of `c77a80f` had no finding of its own. The R01 and R02 it lists belong to the review before it, and it records both as repaired.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §Provenance: finite étale covers form a Galois category with `F_x̄` (Tag 0BNB) | `X = Spec ℝ`; `X = Spec(ℂ × ℂ)` | Spec ℝ: `F(Spec ℂ)` has 2 points, `F(Spec ℝ)` has 1, `π₁ = ℤ/2`. Spec(ℂ×ℂ): `F(Y) = ∅ = F(∅)` for the other component | fails without "connected" | R01 |
| §Provenance: over a field, `π₁` is the absolute Galois group (`GaloisGroupIso.lean`, Tag 0BNE) | `K = ℝ`, `𝔽_q`, `ℂ` | `ℤ/2 = Gal(ℂ/ℝ)`; `ẑ = Gal(𝔽̄_q/𝔽_q)`; trivial = trivial. Lean: `Gal(L/K) ≃ₜ* π₁(Spec K, x)`, with `L` a separable closure | holds | none |
| §Provenance: "only the profinite integers appear" | `TameMultiplicativeGroup/Identification.lean` at c496df0 | `Ẑ^{(q)} ⋊ Ẑ ≃ₜ* π₁ᵗ(𝐆_{m,k})`. `Ẑ^{(q)} = ∏_{ℓ∤q} ℤ_ℓ` has no `ℤ/p` quotient for `p ∣ q`, so it is not free (agrees with README :681) | holds | none |
| §Provenance: no file name or tag covers free profinite groups, braid groups, Drinfeld's relations or `GT̂` | 482 directory entries at c496df0; code search for `FreeProfinite`, braid, Teichm, Drinfeld, "free profinite" | 0, 0, 0, 0 hits. The 2 "free profinite" hits are `isTorsionFree_quotient_under` and `Module.Free K A` | holds | none |
| §Provenance and References: Apache-2.0; Lean and Mathlib v4.35.0, earlier than our pin | `LICENSE`, `lean-toolchain` and `lake-manifest.json` at c496df0; our `lean-toolchain` | Apache License 2.0; `v4.35.0`, Mathlib `inputRev` `v4.35.0`; our pin is `v4.36.0-rc2` | holds | none |
| §Provenance: `StacksFrontier` is written by AI agents, has no `sorry`, and is recorded as unreviewed by humans | the repository README at c496df0, Structure section | Core is "human-reviewed"; Frontier is "written by AI agents", the tier where review is "most needed"; "no `sorry`" | holds | none |
| §Provenance: Scope leaves the outer Galois action to BelyiMaps §12.8 | README :55; BelyiMaps on main and at the head of its open revision | Scope :55 names §12.8. Main :4880 and revision :4081 both carry "12.8 The arithmetic extension and the outer action" | holds | none |
| Research context (the "Layer 0" clause cites it): open kernels of `F̂(X) → G` have rank `1 + |G|(|X| − 1)`; `∏_{ℓ≠p} ℤ_ℓ` is not free | `|X| = 2, G = ℤ/2`; `|X| = 1, G = ℤ/n`; `p = 2` | Rank 3, the Schreier rank of an index-2 subgroup of `F₂`; rank 1 (`nẑ ≅ ẑ`). `∏_{ℓ odd} ℤ_ℓ` has no `ℤ/2` quotient, unlike every nontrivial free profinite group | holds | none |
| Description: the Provenance paragraph, "adds the roadmap", "15 `sorry`s" | README §Provenance at the head; `origin/main...HEAD`; elaboration | Tag 0BNB, the field Galois group, BelyiMaps §12.8, nothing on free profinite or braid groups or `GT̂`, nothing adapted: all as at the head. Not on main; 15 warnings | holds | none |

The rows for statements this change leaves untouched stand as in the previous review, of `c77a80f`.

- **Scope of the change.** The change is 23 inserted lines of `README.md`: the section `## Provenance: existing formalizations outside Tau Ceti` and one References entry. No layer, target, supplier or Lean declaration changed, and `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** Rerun at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- **Dependency check.** Output: `depcheck: 237 roadmaps, 2240 edges, 0 problem(s)`. It has no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 15 "declaration uses `sorry`" warnings, 0 errors. Pins: Lean `v4.36.0-rc2`, Tau Ceti 2fd255d9, Mathlib 1b1ccf4b. `Suggested.lean` is unchanged since `c77a80f`, and the worker's signature dump reports 0 lost section binders.
- **External texts checked:** AxiomMath Stacks at c496df0: its README, `LICENSE`, `lean-toolchain`, `lake-manifest.json`, the 482-entry listing of `StacksFrontier/AlgebraicGeometry/FundamentalGroup` (two levels plus `GaloisCategory/FieldFundamentalGroup`), and 9 Lean files opened. Also Stacks Tag 0BNB, which is Lemma 58.5.5 (§58.5).
- **Cross-roadmap citations resolved:** 1 new reference (BelyiMaps §12.8), found on main and at the head of the open revision of BelyiMaps. The overlaps tool finds no dropped id and no other pull request that changes this roadmap.
- **Seeded sample.** None of the 15 seeded targets lies in the changed passage, and the new section cites no locator of the roadmap's mathematical sources. They stand as in the earlier reviews.
- Remark: the repository's own README prose gives Lean `v4.34.0-rc2`. The README here follows the repository's `lean-toolchain` (`v4.35.0`) instead, which is correct.

Overlap check: the closest-roadmap lists are unchanged: ProfiniteArithmetic, ProfiniteProPGroups and PeripheralActions on main; ProfiniteArithmetic and InverseGaloisAndArithmeticFundamentalGroups open. Their scopes are as read in the previous review. A grep of every roadmap for `GT̂` and Grothendieck–Teichmüller finds only BelyiMaps and PeripheralActions, and both exclude it. InverseGaloisAndArithmeticFundamentalGroups maps the same external directory in its own provenance section (README :7548) but owns nothing there. Nothing is shared. Owners: BelyiMaps §12.8 owns the outer Galois action; Tau Ceti owns `ẑ`, `x ^ᶻ a` and `ContinuousOut`; this roadmap alone owns `GT̂`, `Param`, `β` and relations (I)–(III).

Source independence: changed passages only. 3 passages (the two paragraphs of §Provenance and the References entry) were compared with 3 texts: the AxiomMath Stacks README at c496df0, the docstrings of `FiniteEtaleGaloisCategory.lean` and `GaloisGroupIso.lean`, and Stacks Tag 0BNB. The longest shared run is 4 words ("written by AI agents"); nothing is copied. The framing paragraph repeats the project's own wording in DerivedDeRhamCohomology on main. No layer was added, removed or reordered, so the arrangement was not compared again. Largest share of locators: Schneps 1997, 17 README lines.

## Not verifiable

- Absence of free-profinite, braid or `GT̂` material inside file contents. The file names were read at c496df0, but GitHub code search covers only the default branch (last pushed 2026-11-11), not that commit.
- Mel'nikov 1978 (no legal copy) and the source-version limits recorded by earlier reviews still stand. They concern untouched text.

## Source issues

- **Misprint** in AxiomMath Stacks (c496df0) at README.md, opening paragraph: the source says the formalisation is on Lean v4.34.0-rc2; it should be v4.35.0, as its `lean-toolchain` and Mathlib `inputRev` record; affects nothing.

## For the human reviewers

- Licence: README §Provenance and References name AxiomMath, *The Stacks Project in Lean*, at commit c496df0, under the Apache 2.0 licence (the Stacks Project text itself is under the GFDL). `Suggested.lean` declares nothing on the étale fundamental group or Galois categories, the topics of the cited directory.
- Not tested this round: wording and arrangement were compared on changed passages only. Schneps 1997 holds the largest share of locators (17 README lines) and was not reopened.
