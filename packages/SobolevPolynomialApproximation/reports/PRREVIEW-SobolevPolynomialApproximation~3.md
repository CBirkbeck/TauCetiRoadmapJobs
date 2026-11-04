# Review of SobolevPolynomialApproximation (pull request #1612 at 96e9520)

**Verdict:** accepted

🤖 Independent AI review of `TauCetiRoadmap/SobolevPolynomialApproximation/` at head `96e95203`, an incremental re-review of the 47 lines changed since `2516bbd` (the head the previous review read). No file of the pull request was changed. No finding survived: the five P3 findings of the previous review are repaired, the repairs introduced no new problem, the push gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning. The folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: `Suggested.lean:61` now declares `def toOrderL` in the roadmap's namespace, the three README occurrences (lines 174, 212, 539) read `toOrderL`, and the gate reports `readme-ids-missing=0`.
- R02 — repaired: README line 206 keeps the code span `W^{k,p}(Ω) →L[ℝ] W^{k,q}(Ω)` on one line; the gate reports `tex=0`.
- R03 — repaired: the nonexistent revision `a318838` is gone; lines 83–84 say the declarations are as Tau Ceti implements them on its main branch, some later than the pin, and that `Suggested.lean` uses only those at the pin; lines 117–120 attribute them to PDE Lane A by item (A.1, A.2, A.5, A.6) and say Tau Ceti provides `W1p.compL` and Peetre's estimate, which no roadmap plans; line 108 gives Peetre's estimate its file `Normed/Operator/Compact/Estimate.lean`. Each of these claims is re-verified below.
- R04 — repaired: `Suggested.lean:21` says the functional forms of §4.2 are corollaries of `exists_bramble_hilbert` and are not restated.
- R05 — repaired: section comments are `/-! ## Layer 1: … -/`, `## Layer 2`, `## Layer 4`, `## Layer 5` in README order (lines 34, 85, 115, 131), and the docstring's second sentence now says the file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti.

## Verified sound

**The changed passages.** The diff touches: the Tau Ceti supplier contract (README 83–84, 107–108), the PDE supplier paragraph (117–120), the rename `Wkp.toOrderL → toOrderL` (174–175, 180, 212, 539; `Suggested.lean:61, 68`), the reflow of §1.4's first sentence (206), and in `Suggested.lean` the docstring (7–9, 17–21) and the four section comments. Nothing else in the folder changed (`git diff 2516bbd..96e9520 --stat`: 22 and 25 lines in the two files). No file outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SobolevPolynomialApproximation'` is empty).

**Gate** (the worker's run at this head, data): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.

**Dependency check** (`gate --depcheck … --movable`, run for this review):

```text
depcheck: 204 roadmaps, 1654 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is in the merge order (line 374); its only supplier roadmap is PDE on main.

**Elaboration.** The olean of `TauCeti.Analysis.Sobolev.Wkp.Basic` was absent in the shared package directory and was built with `lake build TauCeti.Analysis.Sobolev.Wkp.Basic` from the worktree (the worker's gate builds it through the targeted build). `lake env lean` on `Suggested.lean` then printed exactly ten `declaration uses sorry` warnings (lines 47, 51, 71, 75, 79, 89, 104, 119, 135, 147) and nothing else. A scratch copy with `#check @name` for all fifteen declarations (`E`, `evalₗ`, `polynomialsDegLE`, `finrank_polynomialsDegLE`, `exists_pderiv_eq`, `toOrderL`, `seminorm`, `norm_le_sqrt_two_mul`, `sqrt_le_sqrt_two_mul_norm`, `seminorm_top_eq_zero_iff`, `exists_norm_comp_le`, `exists_affine_scaling`, `exists_bramble_hilbert`, `exists_continuous_representative`, `dense_contDiff_restrict`) was elaborated the same way: `toOrderL` and `seminorm` carry exactly `{n} {Ω} {p} [Fact (1 ≤ p)] {j k}` and `j ≤ k`, as their types require; every theorem keeps the binders the README states (`IsPreconnected`, `Bornology.IsBounded`, `0 < ρ`, the star-convexity family, `diam ≤ γ·ρ`, `p ≠ ⊤`, `1 ≤ k`, the `hkp` disjunction). The elaborated types agree with the README statements and are unchanged from the previous review except for the name. Nothing in the worktree was changed.

**One-tactic probes** (same scratch copy): `rfl` fails on `toOrderL le_rfl = ContinuousLinearMap.id`; `simp [toOrderL]` closes it (through `Nat.leRec_self`), which concerns the README's API bullet at line 180, not a declaration of `Suggested.lean`, so no padding. `simp` makes no progress on `norm_le_sqrt_two_mul`, `sqrt_le_sqrt_two_mul_norm`, `seminorm_top_eq_zero_iff`, `dense_contDiff_restrict`, `exists_pderiv_eq`; `simp [polynomialsDegLE]` leaves `finrank_polynomialsDegLE` open. No declaration restates a definition, mirrors a Check or computes a value.

**The supplier contract, claim by claim.**

| Claim at this head | Checked where | Result |
| --- | --- | --- |
| Fourteen Tau Ceti declarations "as Tau Ceti implements them on its main branch, some later than the pinned revision" | Pinned Tau Ceti `a91d3aa` (worktree) and `358314d4` (content's manifest): absent at both; Tau Ceti main (fetched as data): `Wkp.exists_hasWeakLineDerivOn_value`, `Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn`, `Wkp.inner_iteratedGradient_one_apply_ae_eq` (`Sobolev/Wkp/LineDeriv.lean`, namespace `TauCeti`), `HasWeakLineDerivOn.comm` (`WeakDeriv/Symmetry.lean`), `Wkp.dense_contDiffOn_representatives` (`Wkp/MeyersSerrin.lean`, `p ≠ ⊤`, every `k`), `W1p.norm_le_norm_value_add_norm_gradient` (`W1p/Basic.lean`), `W1p.compL`, `value_compL_ae`, `gradient_compL_ae` (`W1p/ChangeOfVariables.lean`: `p ≠ ⊤`, `‖fderiv Φ‖ ≤ L`, `0 < c ≤ |det|`), `W1p.exists_value_ae_eq_const_of_gradient_eq_zero` (`Poincare/Wirtinger/W1p.lean`, `IsPreconnected`), `Set.IsLipschitzDomainWith` (`LipschitzDomain/Basic.lean`, on `Set (WithLp 2 (ℝ × E))`), `W1p.isCompactOperator_valueL_of_isLipschitzDomainWith` (`LipschitzDomain/RellichKondrachov.lean`, `p ≠ ∞`, bounded, `volume`), `W1p.exists_eLpNorm_value_sub_setAverage_le_of_isCompactOperator` (`Poincare/Wirtinger/Compactness.lean`) | all present on main with the hypotheses the README attributes to them; `Suggested.lean` imports only `Wkp/Basic` and uses only `Wkp`, `lowerOrderL`, `iteratedGradient`, `value`, which exist at the pin (`Wkp/Basic.lean:175, 221, 236, 328`) |
| Peetre's estimate at `Normed/Operator/Compact/Estimate.lean` | Tau Ceti main `TauCeti/Analysis/Normed/Operator/Compact/Estimate.lean` | file exists; `ContinuousLinearMap.exists_pos_mul_norm_le_of_compact_estimate` is its third theorem (`[CompleteSpace E]`, compact `K`, a priori estimate, closed `M` disjoint from `ker T` ⇒ `∃ c > 0, ∀ x ∈ M, c‖x‖ ≤ ‖Tx‖`); `Compactness.lean` imports it (line 10) and applies it at line 108 |
| Lane A.1 owns weak derivatives, the line-derivative bridge and symmetry | PDE README on main, lines 227–230 | A.1 is `W^{k,p}` via weak derivatives with completeness; the line-derivative bridge and symmetry are part of that weak-derivative theory and are planned nowhere else |
| Lane A.2 owns Meyers–Serrin in every order | lines 231–234 | A.2 is density and Meyers–Serrin, `H = W` |
| Lane A.5 owns the constant-on-connected lemma and the Wirtinger estimate by compactness | lines 239–240 | A.5 is Poincaré and Poincaré–Wirtinger; the kernel lemma and the compactness proof are its implementation |
| Lane A.6 owns the Lipschitz predicate and Rellich | lines 241–256 | A.6 owns the Lipschitz-domain predicate and Rellich–Kondrachov |
| "`W1p.compL` and Peetre's estimate, which no roadmap plans" | PDE README on main (no "change of variables", "Peetre" or "compL"); `roadmaps grep` over main and the open heads | `W1p.compL` is cited only as a Tau Ceti supplier (here and in SobolevDifferentialForms §3); Peetre's estimate is cited as a Tau Ceti supplier here and in the open PDE revision, and elsewhere only in the unrelated senses (K-functional, Peetre's theorem on local operators) |

**Ownership.** `roadmaps grep 'toOrderL'` over main and the 441 open heads hits only this pull request, so the renamed definition collides with nothing; the pinned Tau Ceti has no `toOrderL`. The ownership conclusions of the previous review (Layers 1–5 owned here; PDE Lane A owns the first-order layer) are unchanged by the diff.

**Sources.** The sampled targets fall in the changed passages only at §1.3 (the rename; pin-only, no source) and §4.1 (the rename). Brenner–Scott, Lemma 4.3.8, was re-opened at `brenner-scott` lines 4935–4948 (printed pp. 102–103): `p ≥ 1`, `k = 0, …, m`, bound `C_{m,n,γ} d^{m−k}`, and `|u − Q^m u|_{W^{m,p}} = |u|_{W^{m,p}}` at `k = m`, matching §4.1 after the index shift `m = r − 1`. The other thirteen sampled targets (§1.1, §1.2, §1.5, §1.8, §2.1, §2.3, §3.1, §3.2, §3.3, §3.5, §4.2, §4.4, §5.3) are untouched by the diff and were verified against the texts in the previous review (its source table, lines 141–152).

**Adversarial pass.** Rows for untouched statements carry forward from the previous review (its table, lines 108–137), which computed them; the rows marked "this review" were recomputed on the changed statements.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `toOrderL` at equal orders (this review) | `j = k`; `j = k = 1`, `u = x` on `(0,1)`, `p = 2` | `Nat.leRec` at `le_refl` reduces to `ContinuousLinearMap.id` (`simp [toOrderL]` closes it; `rfl` does not); identity keeps `u`, `|u|_{1,2} = ‖1‖_{L²(0,1)} = 1`; a zero map gives `0` | README Check (line 197) holds; API bullet `toOrderL le_rfl = id` is a real but easy lemma |
| `toOrderL` composition (this review) | `k = 2 → 1 → 0`, `u = x²` on `(0,1)` | `toOrderL (0 ≤ 2) = (toOrderL (0 ≤ 1)).comp (lowerOrderL 1)` by the `leRec` step; value `x²` kept at each stage, `lowerOrderL 0 = W1p.valueL` at the pin (`Wkp/Basic.lean:175`) | consistent with §1.3's "compatibility with composition" |
| `seminorm` through `toOrderL` (this review) | `u = x²`, `(0,1)`, `p = 2`, `k = 2`, `j = 0, 1, 2` | `‖value u‖ = √(∫x⁴) = 1/√5`; `‖iteratedGradient 0 (toOrderL (1 ≤ 2) u)‖ = ‖2x‖ = 2/√3`; `‖iteratedGradient 1 u‖ = ‖2‖ = 2` | matches the Check at line 199; the rename changes no value |
| §1.4 change of exponent (reflow only; this review) | `u = 1`, `(0,2)`, `p = 2 → q = 1`; `q = p` | `‖1‖_{L¹} = 2 ≤ 2^{1/2}·√2 = 2`; identity | unchanged, Checks hold |
| §4.1 Bramble–Hilbert with `Q^m u` of `toOrderL _ u` (this review) | `(−1,1)`, `m = 1`, `u = x²`, `p = ∞` | `toOrderL (1 ≤ 2) u = x²` in `W^{1,∞}`, `Q¹ x² = −μ₂` (§3.3), error `x² + μ₂`: `j = 1`: `‖2x‖_∞ = 2 ≤ C·2^{1}·2`, so `C ≥ 1/2`; top `j = 2`: `2 = 2` | the truncation feeds `Q^m` the right order and the bound is consistent |
| Supplier hypotheses vs. uses (this review) | `W1p.compL` at `p = ∞`; `isCompactOperator_valueL_of_isLipschitzDomainWith` at `p = ∞`; `dense_contDiffOn_representatives` at `p = ∞` | each is stated for `p ≠ ⊤` on main; the README uses them only at `p ≠ ∞` (§2.1 line 333, §4.3 line 603, §5.1 line 670 with the finite-`r` detour at `p = ∞`) | no hypothesis dropped |
| §1.1, §1.2, §1.5–§1.8, §2.1–§2.3, §3.1–§3.5, §4.2–§4.4, §5.1–§5.3, the Lean degenerate cases | as in the previous review | as computed there (its table rows 1–28) | carried forward unchanged; the diff touches none of these statements |

**Headline inventory.** Unchanged from the previous review: stated are §1.7, §2.1, §2.2, §4.1, §5.1, §5.2; named as not statable with the missing carrier are §3.3/§3.5 (contractions and the kernel) and §4.3/§4.4 (`Set.IsLipschitzDomainWith`, confirmed absent at both pins); §4.2 is now named as a corollary of `exists_bramble_hilbert` (docstring line 21). No statable headline is absent and none is forced through a stand-in.

**Style of the changed prose.** Lines 83–84 and 117–120 are timeless (they describe where the library's declarations live and which Lane A item owns them, not a process); no pull-request number, round label or path appears; the gate's `round-labels`, `prnum` and `private-paths` scanners pass.

## Not verifiable

- **Ciarlet**, *The Finite Element Method for Elliptic Problems*, SIAM 2002, Theorem 3.1.3 (cited at §2.3, untouched by the diff): no legal copy was found by the previous review (DOI landing page returns HTTP 403) and none was sought again here; the §2.3 bounds were checked directly in the previous review's table. Listed again in `needs-references.toml`.
- **Dupont–Scott** 1980 and **Evans** Chapter 5 are cited as works without a claim-level locator; nothing depends on them.
- Ownership against open pull requests was checked through the roadmap service's index (`roadmaps grep`) for `toOrderL`, `W1p.compL`, Peetre's estimate and the previous review's terms; the board's packages were checked through its index only.

## Source issues

- **Gap** in brenner-scott at Lemma 4.3.8, printed p. 102 (lines 4941–4944): the proof reduces to functions in `C^m(Ω) ∩ W^{m,p}(Ω)` by density although the lemma allows `p = ∞`, where smooth functions are not dense in the Sobolev norm; it should apply Proposition 4.2.8 a.e. to every `u ∈ W^{m,1}(Ω)` directly, as the roadmap's §4.1 does; affects the proof.
