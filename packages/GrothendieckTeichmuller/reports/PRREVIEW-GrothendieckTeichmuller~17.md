# Review of GrothendieckTeichmuller (pull request #1058 at 2742151)

**Verdict:** accepted

Incremental re-review of 3 changed lines since 4b88d9b. No findings.

## Previous findings

- R01 — repaired: README:86–88 now reads "if it mentions a Galois group, a curve or a configuration space, it is not here." This is the requested replacement, word for word. The Scope paragraph (:47–74) still names the roadmaps that supply the inputs. The repair introduced no new problem.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| README:86–88, boundary sentence, "not here" half | Brown 2012 faithfulness; Deligne–Ihara (:67–71) | Both mention a Galois group, so they are "not here". Scope :64–73 also excludes them. The sentence no longer names an owner for their inputs | consistent | none |
| same, "not here" half | `Gal(ℚ̄/ℚ) → GT̂`; Harbater–Schneps `Out♯ₙ ≅ GT̂`; HMM `Out(Πₙ)` | Galois group; `π̂₁(M_{0,n})`; configuration space. Each is "not here", and Scope :47–53 excludes each | consistent | none |
| same, "not here" half | Hatcher–Lochak–Schneps tower `Γ̂_{g,n}^m` | Positive-genus surfaces, which are curves, so "not here". Scope :74 excludes the tower | consistent | none |
| same, "here" half | §3.5 five-term relation; §4.3 `c = (−1, 1)` | §3.5: `ρ⁴(f̃)…f̃ = 1` in `K̂(0,5)`, so "here". §4.3: `β_c(x) = x⁻¹`, `β_c(y) = 1⁻¹y⁻¹1 = y⁻¹`, so "here". "Gal(" in §§3.5, 4.3: 0 occurrences | consistent | none |
| Text that relied on the deleted clause | grep of README for BelyiMaps, InverseGalois, "boundary" | Remaining hits are :55 and :57 in Scope, plus references. No other passage cites the deleted clause | nothing broken | none |
| Description, paragraph 2: "the README's Scope records them as outside this roadmap" | README :47–57 at 2742151 | BelyiMaps §12.8: main 7342e8f :4880. IG §IG.1.2: #850 :1026. IG §IG.5.1: #850 :5424 | holds | none |
| Description, paragraph 3: "nothing is consumed from another roadmap" | README :179 | "Nothing is consumed from another roadmap." The change adds no `*Needs:*` line | holds | none |
| Description, paragraph 4: "its only warnings are the 15 `sorry`s" | `lake env lean` on `Suggested.lean` | exit 0; 0 errors; 15 warnings, all "declaration uses `sorry`"; 6 s. `Suggested.lean` is unchanged since 4b88d9b | holds | none |

The rows for statements this change leaves untouched stand as in the previous review, of 4b88d9b. They cover the sample of §§0.1–4.5, the headline theorems, the 43 signatures and the padding probe.

- **Scope of the change.** The folder diff since 4b88d9b is `README.md` only (1 insertion, 2 deletions, at head :87–88). No Lean declaration changed. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** Rerun at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- **Dependency check.** Output: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. It has no UPWARD, CYCLE or moved line.
- **Pins.** Tau Ceti 2fd255d9, Mathlib 1b1ccf4b, Lean v4.36.0-rc2.
- **Cross-roadmap citations resolved.** The changed passage now cites none. The description has 3, resolved as in row 6. The overlaps tool finds no dropped id, no id defined only by an open revision, and no other pull request that changes this roadmap.
- **Overlap check:** read ProfiniteArithmetic (main, #775), PeripheralActions and ProfiniteProPGroups (main), InverseGaloisAndArithmeticFundamentalGroups (#850) and BelyiMaps (main). The change adds and drops no object. BelyiMaps §12.8 owns the outer Galois action. ProfiniteArithmetic and Tau Ceti own `ẑ`, `x ^ᶻ a` and `ContinuousOut`. This roadmap alone owns `GT̂`, `Param`, `β` and relations (I)–(III).
- **Pull request text.** Title and description checked against 2742151. No sentence is contradicted, and the 3-line change alters nothing the description states.
- Remark on untouched text: the two halves of the boundary sentence both apply to `Gal(ℚ̄/ℚ) → GT̂`, which is about pairs `(λ, f)` and mentions a Galois group. Scope :47 settles it as "not here".

## Not verifiable

- No new items. Mel'nikov 1978 (no legal copy) and the source-version limits from earlier reviews still stand. They concern untouched text.

## Source issues

- none
