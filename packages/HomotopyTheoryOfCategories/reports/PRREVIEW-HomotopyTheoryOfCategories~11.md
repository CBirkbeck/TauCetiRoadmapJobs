# Review of HomotopyTheoryOfCategories (pull request #1521 at 765f978)

**Verdict:** accepted

Incremental re-review of the 12 lines changed since 60cc318, all in `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md`: the Hirschhorn sentence of the 8.3 "Not a target" paragraph (lines 1035–1037), a rewrap of the first paragraph of 12.6 (lines 1445–1447), and the Hirschhorn References entry (lines 1596–1598). `Suggested.lean` and `metadata.toml` are byte-identical to 60cc318 (`git diff --stat 60cc318..HEAD` lists the README only). No file changed outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopyTheoryOfCategories'` is empty.

Of the seeded sample, only 8.3 ("The simplex categories") contains changed lines. It was checked in full below. The other fourteen sampled targets are untouched. Their checks stand from the earlier reports (PRREVIEW-HomotopyTheoryOfCategories~7 to ~10).

This report has no findings.

## Previous findings

- R01 — repaired: lines 1035–1037 read "Hirschhorn 2003 states it for `ℕ`-valued degrees (Theorem 15.6.27, with Definition 15.1.2) and extends Chapter 15 to small Reedy categories graded by an ordinal in Remark 15.1.4." The References entry (lines 1596–1598) lists "Definition 15.1.2, Remark 15.1.4, Theorem 15.6.27."

## Verified sound

**Gate and build.**

- The worker's gate at this head passes: every check is 0, including `build=0`, and the result is `OK`.
- I re-ran the gate (`gate … HomotopyTheoryOfCategories --base origin/main`). Every text scanner gives 0: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, metadata, stray-files, dirty, outside-folder and source-material. The one non-zero check is `depcheck=1`, "NOT IN ORDER: HomotopyTheoryOfCategories (insert it after its last supplier)". It reads the public merge order, which does not list this roadmap yet. By the brief, that is not a finding.
- The dependency check against the candidate order prints `depcheck: 245 roadmaps, 2467 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line. The candidate order has StableHomotopyKTheory at line 17 and this roadmap at line 18.
- `lake env lean` on `TauCetiRoadmap/HomotopyTheoryOfCategories/Suggested.lean`, run from the worktree, exits 0. It prints 52 `declaration uses 'sorry'` warnings and no other message.
- The Lean file is unchanged since 60cc318, so these earlier checks still apply:
  - the `#check @name` signature comparison against the README;
  - the one-tactic padding probe;
  - the treatment of the 41 "looks dropped" leads in `signatures.md` as universe renderings (PRREVIEW-HomotopyTheoryOfCategories~7 to ~10).
- Pins, from `lake-manifest.json`: Mathlib `1b1ccf4b`, which is also the checked-out commit, and Tau Ceti `2fd255d`.

**The changed passage of 8.3, against the sources.**

- **Definition 15.1.2 has `ℕ`-valued degrees.** `arxiv_1510_04392` lines 265–269 cite "[Hir03, Definition 15.1.2]" as the definition with a degree function to `ℕ`. Hirschhorn's later paper with Volić, `arxiv_1511_04809` lines 119–126, defines a Reedy category as a *small* category with nonnegative-integer degrees. So the README's "`ℕ`-valued" and "small" match the book's definition, as two secondary sources report it.
- **Remark 15.1.4 covers ordinal degrees.** `arxiv_1510_04392` lines 270–271 state that Remark 15.1.4 is where the results of Chapter 15 are said to generalise to ordinal-valued degrees. The README's "extends Chapter 15 to small Reedy categories graded by an ordinal in Remark 15.1.4" says the same thing in different words.
- **Theorem 15.6.27 is the cofibrant-generation result.** Two secondary sources cite it that way:
  - arXiv 1309.6997 cites "[Hirschhorn, 15.6.27]" for cofibrant generation of diagram model structures over Reedy categories;
  - arXiv 0707.1449 cites Theorems 15.3.4, 15.3.15 and 15.6.27 for the Reedy model structure being cofibrantly generated and proper.

  The book's own section list puts "Reedy diagrams in a cofibrantly generated model category" in Chapter 15.
- **The Riehl–Verity clause is untouched.** The `ℕ`-valued clause before the change (Definition 2.1, Lemma 3.17, Corollary 6.7, Proposition 7.7) and the smallness sentence after it were verified against the TAC text in PRREVIEW-HomotopyTheoryOfCategories~10.
- **Hirschhorn citations agree.** A grep of the README for `Hirschhorn`, `15.1.` and `15.6` finds lines 1035–1037 and 1596–1598 only. The text and the References entry cite the same three items.

**The rest of 8.3, the sampled target.**

- `SimplexCategory.reedyStructure` is at `Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean` line 42. Its type is `ReedyStructure (epimorphisms SimplexCategory) (monomorphisms _) ℕ` with `deg := len` (line 43), exactly as the README states.
- `HomotopicalAlgebra.ReedyStructure` is at `Reedy/Basic.lean` line 45, and `ReedyStructure.op` at line 64. `op` swaps the two classes, which matches the Check "on `Δᵒᵖ` the opposite structure has the monomorphisms of `Δ`, reversed, as its lowering class".
- `AugmentedSimplexCategory` is at `Mathlib/AlgebraicTopology/SimplexCategory/Augmented/Basic.lean` line 33, as `WithInitial SimplexCategory`. `SimplexCategory.Truncated` is at `SimplexCategory/Defs.lean` line 147. Both carriers named in 8.3 exist at the pin.
- The Riehl–Verity 2.6 locator for the augmented structure is unchanged and was checked in PRREVIEW-HomotopyTheoryOfCategories~9.

**The 12.6 rewrap.**

- A word-by-word comparison of lines 1441–1453 at this head with lines 1440–1452 at 60cc318 shows no difference: the change is only where the lines break.
- The 102-character line (old line 1445) became lines 1445–1447, which are 91, 92 and 92 characters long. All the changed lines are at most 97 characters.
- The names in the paragraph (`TwoTerm.eqHom`, `TwoTerm.eqIso`, `TwoTerm.comp_label`, `TwoTerm.eqIso_hom_label`, `TwoTerm.eqIso_inv_label`, `nonempty_skeletonTwoTerm_mulEquiv`) are the same as before. The gate's `readme-ids-missing=0` confirms each one is declared in `Suggested.lean`.

**Ownership and overlaps.**

- The overlap report lists no other pull request that changes this roadmap, no id it cites that an open pull request drops, and no id that only an open revision defines.
- No other roadmap cites Hirschhorn's Chapter 15 through this roadmap, so the changed sentence breaks no consumer.
- HigherToposTheory, an open pull request adding a new roadmap, still owns the general Reedy model structure. 8.3 builds none, as its last sentence says.

**Remark on untouched text** (no change requested): in 8.3, line 1018 holds the single word "its", between "On top of it:" (line 1017) and "opposite on `Δᵒᵖ`" (line 1019). The paragraph renders correctly.

**Adversarial table.** Rows for statements the diff leaves untouched are carried forward from earlier reports:

- the 49 rows of PRREVIEW-HomotopyTheoryOfCategories~7 (0.1–13.3);
- the 1.4, 4.1, 4.6 and 12.6 rows of ~8;
- the 1.4 and 8.3 Check rows of ~9;
- the 8.3-remark, Out-of-scope and boundary-sentence rows of ~10.

The rows below cover the changed statements, recomputed at this head.

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| 8.3, Hirschhorn `ℕ` clause (Thm 15.6.27 with Def 15.1.2) | `C = Δ`, Mathlib degree `len` | Small with an `ℕ`-valued degree, so Def 15.1.2 applies directly. `∂Δ([n], −)` = maps out of `[n]` that factor through some `[k]`, `k < n` = the non-injective maps. The generators are `Δ([n], −) ⊗ (∂Δ[m] ↪ Δ[m])` pushout-products, the same as in the Riehl–Verity clause. | consistent with the Riehl–Verity clause |
| 8.3, Hirschhorn ordinal clause (Rem 15.1.4) | `C = ω + 1` direct, degree = rank | An `ℕ`-valued degree would need `deg ω > deg n` for every `n`, so none exists, and Def 15.1.2 and Riehl–Verity Def 2.1 both exclude this `C`. Every arrow out of `c` raises the degree, so `∂C(c, −) = ∅`. The generators are `C(c, −) ⊗ I`, `c ∈ ω + 1`, a set. Only the Rem 15.1.4 clause covers this case, and the sentence now cites it. | true; locator now complete |
| 8.3, ordinal clause on an `ℕ`-graded input | `C = [1]` direct, degrees `0, 1` read as ordinals | Both clauses give `∂C(0, −) = ∅` and `∂C(1, −) = ∅`, so the generators are `C(c, −) ⊗ I` in both: the projective ones. | the clauses agree where both apply |
| 8.3, "small" in the ordinal clause | `C` large discrete, all degrees `0` | `∂C(c, −) = ∅` for each `c`, which gives one generator per object, a proper class. "small Reedy categories" excludes this `C`. So does Hirschhorn–Volić Def 2.1, where a Reedy category is small (`arxiv_1511_04809` line 119). | true |
| References entry vs text | Hirschhorn items cited | Text: 15.6.27, 15.1.2, 15.1.4 (lines 1036–1037). Entry: 15.1.2, 15.1.4, 15.6.27 (lines 1597–1598). | same set |
| 12.6 first paragraph | word-by-word comparison with 60cc318 | Word sequences are identical. Line lengths changed from 91 / 102 / 82 to 91 / 92 / 92. | pure rewrap |

## Not verifiable

- Hirschhorn 2003 (Definition 15.1.2, Remark 15.1.4 and Theorem 15.6.27) has no legal copy available to this review. The AMS edition is paywalled, and the author's page carries only errata. A web search returned a scan hosted on a third party's university page. It was not used, because it is neither the author's nor the publisher's copy.
- The three locators rest on secondary sources:
  - `arxiv_1510_04392` lines 265–271, for 15.1.2 and 15.1.4;
  - `arxiv_1511_04809` lines 119–126, for the `ℕ`-valued, small definition in Hirschhorn's own later paper;
  - arXiv 1309.6997 and arXiv 0707.1449, which cite 15.6.27 for cofibrant generation of Reedy structures.
- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993 are `uncertified` in the manifest and cited by locator. No changed line cites them.

## Source issues

- none
