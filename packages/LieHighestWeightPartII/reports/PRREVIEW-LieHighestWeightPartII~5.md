# Review of LieHighestWeightPartII (pull request #2277 at c304311)

**Verdict:** accepted

Incremental re-review of 4 changed lines since `72812a6`, with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: README line 14 now reads "§2.1 constructs the explicit invariant form `β_n` … this is the only symmetry sign §2.2 needs"; line 314 ends at "no `w_j` pairs with itself." No `tits_sign` or LieHighestWeight §5.1 citation remains.
- R02 — repaired: the description reads "`Suggested.lean` states eleven headline theorems: triples determined up to inner automorphism by their neutral elements, … existence and uniqueness of the positive real part, and positive-real-part recognition."
- R03 — repaired: the description reads "Roadmaps on main, ReductiveGroupsPartIII (§0.3 and §0.5 …) and MotivesAndAlgebraicCycles (§§6.2–6.3 … used in §5.3 …) are cited by name and section as suppliers."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.1, `β_n` symmetric for even `n`, alternating for odd `n` (the changed bullet, line 314) | `n = 0, 1, 2, 3` | `n=0`: `[1]`. `n=1`: `β(w_1,w_0) = −1 = −β(w_0,w_1)`, zero diagonal. `n=2`: anti-diagonal `(1,−1,1)`, `β(w_1,w_1) = −1 ≠ 0`. `n=3`: `β(w_3,w_0) = −1 = −β(w_0,w_3)` | Holds; `(−1)^(n−j) = (−1)^n(−1)^j` | None |
| §2.1 nondegeneracy and invariance (the bullets the changed one sits with) | `n = 1, 2`; `f` at `j + k + 1 = n` | `det`: `n=1` gives `1`; `n=2` gives `(−1)·(−1) = 1`. `f`: `(−1)^(j+1) + (−1)^j = 0`. `e w_j = j!(n+1−j)v_(j−1) = j(n−j+1)w_(j−1)` from KIR (5.4) | Holds | None |
| §2.2 use of the sign (cites the changed passage, line 328) | `sp(2)`, `V = V(1)`; `so(3)`, `V = V(2)` | `β_1` alternating, so `γ_1` symmetric on `U_1 = K`: exists. `β_2` symmetric, `γ_2` symmetric on `K`: exists. Only the `sl₂` sign enters | Self-contained without the dropped citation | None |
| Scope sentence, line 14: "the only symmetry sign §2.2 needs" | every use of a form sign in §§2.2–2.4 | Forms on `V(n) ⊗ U_n` factor as `β_n ⊗ γ_n` (line 330); no module of a larger algebra carries a sign claim | True as stated | None |
| Description: "eleven headline theorems" | elaboration at this head | 11 `declaration uses sorry` warnings, at lines 72, 97, 114, 128, 145, 168, 195, 215, 234, 286, 298; `1+1+4+1+1+1+1+1 = 11` in the description's list | Agree | None |

Rows for the untouched statements stand as in the previous review, of `72812a6`.

- Description against the head, sentence by sentence: adds a roadmap (953 insertions, 48 headings, 16 Lean declarations, all new); two non-statable headlines match the module docstring (Layer 4 test family, group form of §5.2); suppliers named match the nine `### From …` headings; the three other roadmaps named (two consumers, NoncompactQuantumSymmetry Layer 3) are the only further roadmap names in the README; summary block's `q > 1`, "finite-dimensional or not", half-spin and adjoint clauses match README lines 62, 527, 363, 450.
- Cross-roadmap citations resolved: 7. LieHighestWeight Layer 7 with `serreLift_injective_of_base` and Layer 8 on main (README lines 1744, 2073, 2220); MotivesAndAlgebraicCycles §6.2, §6.3 at its open head (lines 1130, 1149); ReductiveGroupsPartIII §0.3, §0.5 at its open head (lines 433, 467); GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 at its head (line 1183).
- Source locators checked against the text: 1. KIR line 2369 (Theorem 5.6, equation (5.4)), which the changed bullet's basis `w_j = j! v_j` rests on: `f v_k = (k+1)v_(k+1)`, `e v_k = (n+1−k)v_(k−1)`.
- Gate rerun at this head: every scanner 0, `OK`; no file changed outside the folder. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 11 warnings, all `declaration uses sorry`, no error. The diff changes no Lean statement; signatures stand as compared in the previous review.
- Overlap check: read LieHighestWeight (main), ReductiveGroups (main), RootSystemsPartII (main), SpinRepresentations; nothing newly shared. The explicit form `β_n` on `V(n)` is owned here; LieHighestWeight §5.1 on main owns the sign for general self-dual `L(λ)`, which this roadmap no longer states or consumes.
- Source independence: changed passages only; 2 passages compared with 1 source (KIR), none shared (KIR states no invariant form at Theorem 5.6); largest share CH, 24 of 37 explicit line locators; no layer added, removed or reordered, so the contents comparison of the earlier review stands.

## Not verifiable

- The description's clause "on main and in the open revision of LieHighestWeight": no open pull request among the heads supplied revises LieHighestWeight, so only the main half was resolved (lines above). The citations are valid on main either way.
- Published CH, DG and KIR versions remain uncollated with the arXiv versions and author-page draft the README cites.
- The description's sentence on AI assistance and later author-side passes describes process, not the head; it was not checked.

## Source issues

- none

## For the human reviewers

- **Scope.** The four end theorems are Lemmas 2.4, 6.30, 10.9 and Proposition 10.2 of CH, read at arXiv v1; CH supplies 24 of the README's 37 explicit line-locator occurrences.
- **Scope.** §3.3 asserts injectivity on 7, 28, 34, 274, 245 candidate profiles. CH reports a computer calculation without a proof; an earlier review reproduced those counts by script.
- **Licence.** SOM is unpublished workshop notes (§3.2 unfinished, §4.1 empty), hosted on another mathematician's university page; the manifest classifies the copy as institutional.
- **Licence.** KIR is the author-page draft of a Cambridge University Press book; the manifest classifies the copy as author-page.
