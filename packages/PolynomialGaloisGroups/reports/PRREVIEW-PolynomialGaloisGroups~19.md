# Review of PolynomialGaloisGroups (pull request #986 at 645bf25)

**Verdict:** needs changes

:robot: AI review. Incremental re-review of the 30 lines of `TauCetiRoadmap/PolynomialGaloisGroups/` changed since `2e4a762` (12 insertions, 18 deletions, nothing outside the folder). The two nonblocking findings of the previous report are repaired and introduced nothing; the blocking finding, the folder's identity against the other open proposal for the same folder, is untouched by this head and is carried as R01 below. The gate passes, the dependency check reports no problem, and the file elaborates at the pins (Mathlib `f6090c70`, Tau Ceti `358314d4`).

## R01 (P2) — One owner for the radical criterion, with its own roadmap identity

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:3`, "This roadmap continues the completed Polynomial Galois Groups roadmap"; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:23`, `namespace TauCetiRoadmap.PolynomialGaloisGroups`.

**Claim:** two open pull requests by the same author propose a roadmap in the folder `PolynomialGaloisGroups`, and both build the radical criterion and the separation theorem; a construction has one owner. This proposal also reuses the completed base's folder name and namespace, so "PolynomialGaloisGroups, Layer 1" names both the base's permutation layer (which the open Part II proposal cites by that name) and this continuation's radical criterion.

**Witness:** `roadmaps list` this round: `#763 PolynomialGaloisGroups @kim-em 88bb69d` (the same head as last round) and `#986 PolynomialGaloisGroups @kim-em 645bf25`. `roadmaps grep --fixed 'isSolvable_gal_iff_forall_rootSet_mem_solvableByRad'` hits `Suggested.lean:52` here and `Suggested.lean:72` of the other proposal (namespace `TauCetiRoadmap.PolynomialGaloisGroupsPartIII`, its line 32); `roadmaps grep --fixed 'separable_specialize_quinticF20Spec'` hits line 73 here and line 84 there. `Completed/PolynomialGaloisGroups/Suggested.lean:60` on main (`929496d`) opens the namespace of line 23. The open Part II proposal's README cites "PolynomialGaloisGroups, Layers 0 and 1" (its line 26) and "PolynomialGaloisGroups, Layer 1" (its line 245) for the base's permutation layers. The pull request's own description (data) names the other proposal as "the complete single-owner proposal".

**Exact repair:** decide the owner. Either this folder becomes a Part roadmap with its own folder name and namespace (the next free Part number after the open Part II and the other proposal's Part III; the summary already says where the base stops) and the other proposal drops its radical and separation layers and imports this roadmap by section; or this proposal is withdrawn in favour of the other. Retest: the two greps above hit one open proposal each, and "PolynomialGaloisGroups, Layer 1" resolves only to the base. No mathematical statement changes. Carried from the previous report's R01, which this head does not touch.

## Previous findings

- R01 — not repaired: `README.md:3` ("continues the completed Polynomial Galois Groups roadmap") and `Suggested.lean:23` (`namespace TauCetiRoadmap.PolynomialGaloisGroups`) are unchanged, and the other proposal still states the same theorems at `88bb69d`. Carried as R01.
- R02 — repaired: `not_mem_solvableByRad_of_prime_degree_two_nonreal` is deleted from `Suggested.lean` (`roadmaps grep` finds the name nowhere, on main or at any open head); `README.md:205` now opens "Prove that if `q : ℚ[X]` is irreducible of prime degree `p ≥ 5`…" with no backticked name, and `README.md:211`–213 and `Suggested.lean:16`–18 say the statement follows from the three pinned Mathlib declarations and is a target, not an acceptance test. The three declarations exist at the pin with the hypotheses the README states (below). The gate's `readme-ids-missing=0` and my grep of the README's backticked names confirm no README name now lacks a declaration.
- R03 — repaired: `grep -n 'Checks' README.md` returns nothing; `README.md:56` reads "(Layer 1, Examples)" and `README.md:255` "(Examples)"; the controls referred to are the bullets at `README.md:164`–171 (ambient-field negative control) and `README.md:290`–294 (`5 ≠ 0` necessary), under the `### Examples` headings at lines 153 and 278.

No repair report marks any finding "not actionable in this package"; nothing settled is overridden.

## Verified sound

**The changed passages.** The diff deletes one theorem (and its docstring) from `Suggested.lean`, adds three sentences to its module docstring, rewrites the first sentence of `README.md` §2.3 to drop the Lean name and adds two sentences saying why, and changes two cross-references from "Checks" to "Examples". Nothing else in the folder changed (the five remaining theorem statements are byte-identical to the previous head, lines shifted by nine), and `git diff --stat origin/main...HEAD` outside the folder is empty.

- §2.3 as a target (`README.md:205`–216): the hypotheses (irreducible over `ℚ`, prime degree `p ≥ 5`, `Fintype.card (q.rootSet ℂ) = Fintype.card (q.rootSet ℝ) + 2`) and the route are unchanged and correct. Milne Proposition 4.16 at `milne-fields line 2217`–2218 (page 52, `line 2203`): irreducible of prime degree over ℚ, splits in ℂ with exactly two nonreal roots, then the group is `S_p`; the radical conclusion and `p ≥ 5` are the README's corollary, and the README says so ("for the group"). The three Mathlib declarations at the pin: `Polynomial.Gal.galActionHom_bijective_of_prime_degree` (`Mathlib/Analysis/Complex/Polynomial/Basic.lean:128`–131, the same three hypotheses), `Equiv.Perm.not_isSolvable` (`Mathlib/GroupTheory/Solvable.lean:297`, `5 ≤ Cardinal.mk X`), `isSolvable_gal_of_irreducible` (`Mathlib/FieldTheory/AbelRuffini.lean:313`, `x ∈ solvableByRad F E`, `Irreducible q`, `aeval x q = 0`). The claim "follows from these three Mathlib declarations alone" was established last round by a scratch proof at the pin (twelve lines, with `Group.isSolvable_of_surjective`, `Solvable.lean:167`) and is the reason the deletion is the right repair under the padding rule. The Scope line `README.md:20`–21 still lists the corollary as owned by Layer 2, which is consistent: it is a target of the README, not of the Lean file.
- Module docstring (`Suggested.lean:15`–18): says every headline is statable, and names which README target is not stated and why. This is the form the Lean rules ask for; no process word, no pull-request number.
- The two "(Examples)" references resolve to existing `### Examples` sections containing the controls they point to (lines above).

**Gate and dependency check.** The worker's gate at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. My dependency command printed

```text
depcheck: 204 roadmaps, 1654 edges, 0 problem(s)
```

with no UPWARD or CYCLE line. The six `*Needs:*` lines are unchanged: §2.3 cites Mathlib only; every other edge points down (Layer 1 → §2.1 → §2.2; §3.1 and Layer 2 → §3.2). The worker's citation resolver found no cross-roadmap citation and no Lean name missing; the only cross-roadmap citations are to the completed base on main and to Polynomial Galois Groups, Part II as a scope exclusion (not a supplier).

**Elaboration.** `lake env lean` of `Suggested.lean` from the worktree: exit 0, the `#check` output for `Group.IsSolvable.exists_normal_index_prime`, and exactly six `declaration uses sorry` warnings (lines 38, 52, 61, 73, 82, 91). The worker's `#check` of all six declarations (`signatures.md`) shows every binder of the README statements in the elaborated types: §1.1 `[CharZero F] [FiniteDimensional F E] [IsGalois F E]` and `ι`; §2.1, §2.2 `[CharZero F]`, §2.2 `Irreducible q`; §3.1 and the group form `Monic`, `Irreducible`, `natDegree = 5`, `(5 : F) ≠ 0`; the radical form `[CharZero F]` without `5 ≠ 0`, as `README.md:45`–46 states.

**Headlines and padding.** The README's headlines are §1.1, §2.1, §2.2, §3.1, §3.2 group form and §3.2 radical form, stated at lines 38, 52, 61, 73, 82, 91; §2.3 is a README target and the docstring names it as deliberately not stated. The file defines nothing. The one-tactic probe of the previous report (`first | rfl | simp | infer_instance | exact?` on a scratch copy at the same pin) covered these six statements unchanged: none closes; no new statement was added, so no new probe was needed.

**Adversarial table.** The statements are unchanged since the previous report, whose rows are carried; the one changed passage (§2.3, now a prose target) gets its rows recomputed.

| Statement | Instances tried | Values computed on each side | Result and change |
|---|---|---|---|
| §2.3, `X⁵ − 4X + 2` | values at `−2, −1, 0, 1, 2` are `−22, 5, 2, −1, 26` (three sign changes); `5X⁴ − 4` has two real zeros | complex roots 5, real roots 3, `5 = 3 + 2`; degree 5 prime, `5 ≤ 5`; group `S₅`, derived orders `120 → 60 → 60` | no root radical; holds |
| §2.3, bound `p ≥ 5` needed: `X² + 1`, `X³ − 2` | nonreal roots 2, 2; degrees 2, 3 prime | `5 ≤ 2`, `5 ≤ 3` false; roots `±i`, `2^{1/3} ζ₃ᵏ` radical; groups `C₂`, `S₃` solvable | hypothesis `p ≥ 5` necessary and stated (`README.md:205`) |
| §2.3, irreducibility needed: `(X² + 1)(X − 1)(X − 2)(X − 3)` | degree 5 prime; complex roots 5, real roots 3 | `5 = 3 + 2`; roots `i, −i, 1, 2, 3` radical; group `C₂` | `Irreducible q` necessary and stated; `README.md:229`–230 agrees |
| §2.3, route inputs | `Basic.lean:128`–131, `Solvable.lean:297`, `AbelRuffini.lean:313` | hypotheses of the three declarations equal the target's; `Cardinal.mk (q.rootSet ℂ) = p ≥ 5` from `h1` in the body of `Basic.lean:132` | route closes from Mathlib alone (previous report's scratch proof); hence not an acceptance test |
| §1.1 (trivial `E = F`; `S₃` splitting field of `X³ − 2`; `S₅` for `X⁵ − 4X + 2`; normality control `ℚ(α)`; ambient-closure control, cubic subfield of `ℚ(ζ₇)`; roots of unity `NeZero (N : F)`; induction step `ζ^{N/p}`) | as in the previous report | as in the previous report (`true ↔ true`, `true ↔ true`, `false ↔ false`, `true ↔ false` without `IsGalois`, `true ↔ false` with `solvableByRad ℚ E = ℚ`) | statement unchanged; carried |
| §2.1 (constants `0, 1, C a`; `X − 1`, `X² − 2`, `(X² − 2)²`; `(X⁵ − 4X + 2)(X − 1)`) | as in the previous report | root sets `∅`, `{1}`, `{±√2}`, `{±√2}`; six roots with `1` radical and `q.Gal ↠ S₅` | statement unchanged; carried |
| §2.2 (`X − 1`, `X² − 2`, `X⁵ − 4X + 2`; reducible control) | as in the previous report | `(true, true)`, `(true, true)`, `(false, false)`; some-root form `false ↔ true` without irreducibility | statement unchanged; carried |
| §3.1 (trinomial sextics for `(a, b) = (0, −2), (−5, −12), (−1, −1), (−1, 0)`; `gcd(R, R′)`; Chapman factorisation in ℤ/5 labelling; sign case; `𝔽₅` control; characteristics 2 and 3) | as in the previous report | `gcd` degrees 0, 0, 0, 3; orbit differences matched 10/10, 1/1, 10/10; `𝔽₅` sextic `(X − 3)(X − 2)⁵`; `C₅` in characteristics 2, 3 | statement unchanged; carried |
| §3.2 (inputs of `Solvable.lean:104`; radical form on `X⁵ − 2`, `X⁵ − 5X − 12`, `X⁵ − X − 1`; `b ↦ −b`) | as in the previous report | `R(0) = 0`, `R(40) = 0`, `R(1) = 6267`, `R(−1) = 13877`, `9631` prime; groups `F₂₀`, `D₅`, `S₅` | statement unchanged; carried |

**Duplication and ownership.** As in the previous report: `solvableByRad` occurs in Mathlib only in `AbelRuffini.lean` (no converse of Abel–Ruffini at the pin) and in Tau Ceti only in docstrings; no `Separable` theorem about `quinticF20Spec.specialize` beyond `separable_X_pow_five_sub_X` (`Collision.lean:75`). The only duplicate owner is the other open proposal for this folder, R01; `PolynomialGaloisGroupsPartII` (open head `285e665`) states no radical criterion.

**Finding witnesses as checks.** R01: two `roadmaps list` entries for the folder, two grep hits per name, the Part II README's two citations of "PolynomialGaloisGroups, Layer 1".

## Not verifiable

- The six theorems are admitted. Elaboration verifies their signatures and export; the computed instances and the sources' proofs do not constitute formal proofs.
- Ownership against open pull requests was checked through the `roadmaps list` and `grep` tools (index of 2026-11-03) and the sibling checkouts the brief names; the board's package list carries no `PolynomialGaloisGroups` package beyond its reports.
- Chapman's note is read from the author's page copy; I have no published version to compare.

## Source issues

- none new this round; the four items of the previous report (the gap in dummit-quintics Theorem 1 on distinctness of the six resolvent roots, the `+20000` misprint in dummit-quintics example 2, the `F× → F×` misprint in milne-fields Proposition 5.27, the "Theorem 5.27" misprint in milne-fields Theorem 5.34) stand and were not re-derived here.
