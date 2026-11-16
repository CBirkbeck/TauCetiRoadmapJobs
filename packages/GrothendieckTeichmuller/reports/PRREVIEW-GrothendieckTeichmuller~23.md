# Review of GrothendieckTeichmuller (pull request #1058 at 03c1ca7)

**Verdict:** accepted

## Previous findings

- R01 — repaired: "builds the étale fundamental group of a connected scheme through Galois categories: for a connected scheme `X`, the finite étale covers of `X` form a Galois category with the fibre functor at a geometric point (Tag 0BNB, `FiniteEtaleGaloisCategory.lean`)" (README :693–696). The repair introduces no new problem.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §Provenance (repaired): for connected `X`, finite étale covers form a Galois category with `F_x̄` (Tag 0BNB) | `Spec ℝ`; `Spec(ℂ × ℂ)`; empty scheme; `Spec ℂ[ε]/(ε²)` | `Spec ℝ`: `F(Spec ℂ)` has 2 points, `π₁ = ℤ/2`. `Spec(ℂ×ℂ)` and `∅` are not connected, so both are excluded. `ℂ[ε]/(ε²)`: `FÉt ≃ FinSet`, `π₁ = 1` | holds | none |
| Same, Lean side at c496df0 | `isGaloisCategory_finiteEtaleFiberFunctor`, `@[stacks 0BNB]` | binders `{X : Scheme} [ConnectedSpace X] (x : GeometricPoint X)`. Mathlib's `ConnectedSpace` includes nonemptiness, like Stacks Def. 5.7.1, so it matches the README's hypothesis exactly | holds | none |
| §Provenance (new): `StacksFrontier` is kept apart from the human-reviewed `StacksCore` tier | the AxiomMath README at c496df0 | two directories, `StacksCore/` ("human-reviewed") and `StacksFrontier/` ("written by AI agents"). `import Stacks` imports both. The README states "no `sorry`" | holds | none |
| §Provenance (only rewrapped): over a field, `π₁` is the absolute Galois group | `K = ℝ`, `𝔽_q`, `ℂ` | `ℤ/2`, `ẑ`, trivial. `Spec K` is connected, so this agrees with the hypothesis just added | holds | none |
| §Provenance (only rewrapped): Lean and Mathlib v4.35.0, earlier than our pin | `lean-toolchain` at c496df0; ours | `leanprover/lean4:v4.35.0` against `v4.36.0-rc2` | holds | none |
| Description: the Provenance paragraph; "15 `sorry`s"; "adds the roadmap" | the head's §Provenance; elaboration; `origin/main...HEAD` | Tag 0BNB, the field Galois group, BelyiMaps §12.8 (main :4881 and the open BelyiMaps revision :4081), nothing on free profinite or braid groups or `GT̂`: all as at the head. 15 warnings. Not on main | holds | none |

The rows for statements this change leaves untouched stand as in the previous review, of `40010b5`.

- **Scope of the change.** `README.md` changes by 14 insertions and 13 deletions, all inside `## Provenance`. `Suggested.lean` is unchanged, and so are every layer, target, supplier and Lean declaration. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** Rerun at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- **Dependency check.** Output: `depcheck: 257 roadmaps, 2433 edges, 0 problem(s)`. It has no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 15 "declaration uses `sorry`" warnings, 0 errors. Pins: Lean `v4.36.0-rc2`, Tau Ceti 2fd255d9, Mathlib 1b1ccf4b. Because `Suggested.lean` is unchanged, the signature dump (0 lost section binders) still applies.
- **External texts checked:** at AxiomMath Stacks c496df0, the `README.md`, the `lean-toolchain`, and the docstring and main instance of `StacksFrontier/AlgebraicGeometry/FundamentalGroup/FiniteEtaleGaloisCategory.lean`.
- **Cross-roadmap citations resolved:** BelyiMaps §12.8 resolves on main and at the head of the open BelyiMaps revision. The overlaps tool reports no dropped id and no other pull request that changes this roadmap. `citations.md` lists 3 Lean names (`GTHat.isGT0`, `GTHat.injective_mk_betaEquiv`, `GTHat.isClosedEmbedding_betaEquiv`). All three are declared in `Suggested.lean`, so these are false leads.
- **Seeded sample.** None of the 15 seeded targets lies in the changed passage, and the change cites no locator of the roadmap's mathematical sources. Those targets stand as in the earlier reviews.

Overlap check: I read ProfiniteArithmetic, ProfiniteProPGroups and PeripheralActions on main, and ProfiniteArithmetic and InverseGaloisAndArithmeticFundamentalGroups open. A grep of every roadmap for `GT̂` or Grothendieck–Teichmüller finds only BelyiMaps (main :5616 and the open revision :4725) and PeripheralActions, and both exclude the subject. Nothing is shared. Owners: BelyiMaps §12.8 owns the outer Galois action; Tau Ceti owns `ẑ`, `x ^ᶻ a` and `ContinuousOut`; this roadmap alone owns `GT̂`, `Param`, `β` and relations (I)–(III).

Source independence: changed passages only. I compared 2 passages (the two rewritten paragraphs of §Provenance) with 3 texts: the AxiomMath README at c496df0, the docstring of `FiniteEtaleGaloisCategory.lean`, and Stacks Tag 0BNB. The longest shared run is 5 words, "for a connected scheme `X`", a phrase the mathematics forces; nothing is copied. The new clause on `StacksCore` also appears word for word in the same author's LefschetzStructures (README :565) and GrothendieckTopoi (README :1636); that is project text, not a source. No layer was added, removed or reordered, so the arrangement was not compared again. Largest share of locators: Schneps 1997, 17 README lines.

## Not verifiable

- Absence of free-profinite, braid or `GT̂` material inside file contents at c496df0: GitHub code search covers only the repository's default branch, not that commit.
- Mel'nikov 1978 (no legal copy), and the source-version limits recorded by earlier reviews, still stand. They concern untouched text.

## Source issues

- **Misprint** in AxiomMath Stacks (c496df0) at README.md, opening paragraph: the source says the formalisation is on Lean v4.34.0-rc2; it should be v4.35.0, as its `lean-toolchain` records; affects nothing.

## For the human reviewers

- Licence: README §Provenance and References name AxiomMath, *The Stacks Project in Lean*, at commit c496df0, under the Apache 2.0 licence (the Stacks Project text itself is under the GFDL). `Suggested.lean` declares nothing on the étale fundamental group or Galois categories, the topics of the cited directory.
- Not tested this round: wording and arrangement were compared on changed passages only. Schneps 1997 holds the largest share of locators (17 README lines) and was not reopened.
