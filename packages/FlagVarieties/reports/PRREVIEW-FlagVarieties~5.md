# Review of FlagVarieties (pull request #1762 at 3ce938d)

**Verdict:** accepted

🤖 Independent AI review (incremental re-review of 6 changed lines since 77cc723). No finding. The two P3 findings of the previous review are repaired by exactly the repairs it asked for, the change touches nothing else, the gate passes, the dependency check is clean, and `Suggested.lean` elaborates with only its two `sorry` warnings. The changed statements were recomputed on their instances (rows I and J of the table below); the untouched statements carry forward.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/FlagVarieties/README.md:153` now reads "*Needs:* `gap:standard-parabolic-scheme`, ReductiveGroups 7/7b Bruhat and root-cell inputs, 0.1."; "Chevalley constructibility" survives only at line 147, attributed to the supplier's proof.
- R02 — repaired: `TauCetiRoadmap/FlagVarieties/Suggested.lean:16–17` now reads "the actual reductive-group `TitsSystem` on `G(k)`, the `B W_J B` classification of subgroups containing `B`, and the scheme bridge `P_J`"; `standardParabolicOrderIso` is gone.

## Verified sound

**What was read.** The whole README (302 lines) and `Suggested.lean` (68 lines) at 3ce938d; the change set (3 insertions, 3 deletions, two files, nothing outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FlagVarieties'` is empty); the worker's gate, citations and signature files; the previous report. Pins from the worktree's `lake-manifest.json`: Tau Ceti `358314d4`, Mathlib `f6090c70`. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`. The two changed passages contain no LaTeX delimiters, process words, pull-request numbers, `set_option`, sorry'd data, `lemma`, algorithms, local paths or copied text.

**The changed `*Needs:*` line (README 153).** Its three items resolve: `gap:standard-parabolic-scheme` is declared at line 65 under `### From TauCetiRoadmap.ReductiveGroups` with its hypotheses (`P_J(k) = B(k) W_J B(k)`, smooth, connected, `P_∅ = B`, `P_S = G`); ReductiveGroups on main (`a0ad405`) has `### Layer 7: structure theory` (its README line 627, the Bruhat covering and the minimal-parabolic two-cell equality at line 686) and `### Layer 7b: algebraic parabolics and Levi intersections` (line 732); §0.1 is the point-separation adapter the rank-one comparison of line 143 uses. The line now agrees with the Layer 2 Dependencies line (170: "actual Tits system, Bruhat/root cells and scheme bridge; Layer 0 supplies point separation") and with line 147, which attributes constructibility to the supplier's proof. No other passage cites §2.1's needs.

**The changed docstring lines (Lean 16–17).** Each name is either a pinned declaration or a declared gap: `TauCeti.TitsSystem` is `GroupTheory/TitsSystem/Basic.lean:50` at the pin, with fields `subgroupB` (line 52) and `subgroupN` (line 54) as `gap:tits-system-of-points` (README 61) assumes; `HopfIdeal.IsParabolicOverAlgClosed` occurs nowhere at the pin (grep of `TauCeti/` and `Mathlib/`) and is the declared `gap:parabolic-predicate` (README 31, 67), which is what "still need the following declarations" asserts; the `B W_J B` classification is `gap:tits-standard-parabolic` (README 63); the scheme bridge `P_J` is `gap:standard-parabolic-scheme` (README 65). `standardParabolic` occurs nowhere at the pin, so the docstring no longer names a phantom. The worker's one `roadmaps resolve` lead (README 31, `IsParabolicOverAlgClosed`) is this declared gap, not a missing citation. Line 17 is 140 characters and line 19 (unchanged) 101; neither `README.md` nor `CONTRIBUTING.md` sets a line-length rule and the gate's `lean-lines` counter is 0, so this is not a finding.

**Gate and dependency check.** The worker's gate at 3ce938d (data): every counter 0, `build=0`, `OK`. My own run of the gate command as given in the brief printed

```text
gate FlagVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: FlagVarieties (insert it after its last supplier)
```

That `depcheck=1` is a false positive of the invocation without the candidate order: the roadmap is not on main's merge order yet, which the brief says is never a finding, and the dependency check run as instructed with the candidate order printed exactly

```text
depcheck: 205 roadmaps, 1666 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. FlagVarieties is at position 105 of the candidate order, directly after ShimuraData (104). Every other counter of my run equals the worker's.

**Elaboration and signatures.** `lake env lean TauCetiRoadmap/FlagVarieties/Suggested.lean` from the worktree: exit 0, two warnings (`sorry` at lines 49 and 59), 14 s. A scratch copy with `#check @name` for all three declarations elaborated; the types are identical to the worker's signature file and to the previous report's (`standardWeight : {n} → Set (Fin n) → Fin (n+1) → ℤ`; `exists_unique_standardWeight_eq` with `[Field k] [IsAlgClosed k]`, `I ≤ definingHopfIdeal k (n+1)`, `[IsReduced …]`, `∃! J : Finset (Fin n)`; `conjugate_eq_of_borel_le` with `[IsAlgClosed k]`, geometric connectedness, `IsBorelOverAlgClosed`, `P ≤ B`, `Q ≤ B`, `Q = P.conjugate g`), and each matches its README statement (lines 119 and 21). No binder lost. One-tactic probe on a scratch copy: `simp_all` leaves both sorried goals unsolved (the `∃!` goal unchanged; the Borel goal unchanged with `hB` unfolded to `Minimal (IsBorelCandidate k G) B`); no padding. No Lean process left running.

**Pinned declarations opened** (Tau Ceti `358314d4`): `TauCeti.TitsSystem` `GroupTheory/TitsSystem/Basic.lean:50`; `TauCeti.smoothCommHopfAlgProperty_of_charZero` `Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`, which lies after `end HopfAlgebra` (line 143) and before `end TauCeti` (line 173), so the README's fully qualified name at lines 53, 85 and 157 is exact; `exists_conjugate_eq_of_isBorelOverAlgClosed` `Borel/Conjugation.lean:144` with its `hcontain` hypothesis, as `gap:borel-conjugacy-connected` (README 57) says.

**Seeded sample.** Of the fourteen sampled targets only §2.1 falls in the changed passages, and the change adds no locator; §2.1's only source locator (Humphreys §§29.1–29.3, README line 300) is cited by locator alone and stays under Not verifiable. The other sampled locators are unchanged since PRREVIEW-FlagVarieties~3 and ~4 and were not re-read.

**Ownership.** `roadmaps grep --lean-only` for `namespace TauCetiRoadmap.FlagVarieties` was done in the previous review against the index of 2026-11-04; the diff declares no new name, so it was not repeated.

**Adversarial values.** Rows I and J are new for the changed lines. Rows A–H of PRREVIEW-FlagVarieties~4 and rows 01–25 of PRREVIEW-FlagVarieties~3 cover the untouched statements and are carried forward unchanged.

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| I. §2.1 `*Needs:*` (153) | the inputs the §2.1 route uses (lines 141–149) against the items listed | route uses: closed generation and minimality (ReductiveGroups 7/7b), rank-one two-cell comparison (7C/7b), `P_J(k) = B(k) W_J B(k)` (`gap:standard-parabolic-scheme`), point comparison (0.1) = 3 named items; constructibility used 0 times in the route (only inside the supplier's proof, line 147) | line lists exactly the route's inputs; agrees with line 170 |
| J. Lean docstring (16–17) | the four named carriers against the pin and the gap list | `TitsSystem`: 1 hit at the pin (`Basic.lean:50`); `IsParabolicOverAlgClosed`: 0 hits at the pin, 1 gap (`gap:parabolic-predicate`); `B W_J B`: `gap:tits-standard-parabolic`; `P_J`: `gap:standard-parabolic-scheme`; `standardParabolicOrderIso`: 0 hits anywhere, 0 occurrences in the file | every missing carrier is a declared gap; no invented name |
| A–H | as in PRREVIEW-FlagVarieties~4 | as recorded there | carried forward; statements untouched |
| 01–25 | as in PRREVIEW-FlagVarieties~3 | as recorded there | carried forward; statements untouched |

**Headline inventory** (unchanged): headline 1 in `GL_{n+1}` form (`exists_unique_standardWeight_eq`), the uniqueness half of headline 2 (`conjugate_eq_of_borel_le`), headlines 3–5 and the general form of 1 named in the docstring as not statable, each with the carrier it lacks; the grep at the pin for `IsParabolicOverAlgClosed` and `standardParabolic` confirms the lack.

## Not verifiable

- **Humphreys, *Linear Algebraic Groups*:** paywalled; not in the sources cache. Cited by locator alone (uncertified), as the README states at line 302.
- **Bourbaki, *Lie*, Ch. IV §2.5 Theorem 3** (in `gap:tits-standard-parabolic`): paywalled; not in the cache. Cited by locator alone.
- **`plan.json`:** no design or package on the board, so the `gaps` list the intake reads could not be compared with the README's ten slugs.
- Ownership against open pull requests was not re-checked this round beyond the roadmap service's index used in the previous review; the diff declares no new object.

## Source issues

- none
