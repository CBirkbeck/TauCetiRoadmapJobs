# Review of LocallyConvexDuality (pull request #1782 at 714da0c)

**Verdict:** needs changes

This is an incremental re-review of the 26 lines changed since 32064cd. Both findings of the previous review are repaired. Two P3 notes remain, both in the new text:

- the Hilbert-seminorm route for 5.4 is cited to the wrong text. The previous review proposed that citation, and this report corrects it.
- the two new "Not a target" paragraphs give in-scope mathematics no owner, and they leave uncited declarations that already exist at the pins.

Gate status:

- The gate passes on the candidate merge order.
- The dependency check has no UPWARD or CYCLE line.
- `Suggested.lean` is unchanged since 32064cd and elaborates with `sorry` as the only warning.

## R01 (P3) — Locator: the Hilbert-seminorm route of 5.4 is the Résumé's remark on p. 102, not Grothendieck 1955

**Location.** `TauCetiRoadmap/LocallyConvexDuality/README.md` lines 628–631, §5.4: "Route: the subspace clause from criterion (c) of 5.2 through Hilbert seminorms, … keep the nuclear factorisations (Grothendieck 1955, Ch. II, §2, no. 2; Pietsch 1972, Chapter 5)".

**Claim.** The README attributes the route (criterion (c), plus Hilbertian seminorms, plus restriction to a subspace) to the proof in *Produits tensoriels*, Ch. II, §2, no. 2. In fact that route is the Résumé's alternative to that proof.

- The remark that closes Ch. I, no. 7 (lines 580–588, p. 87) is the step the README calls "keep the nuclear factorisations".
- It says that restricting the codomain of a nuclear map to a complemented subspace, for instance one in a Hilbert space, keeps it nuclear.

The previous review's repair text proposed the Grothendieck 1955 locator; that suggestion was imprecise, and this finding corrects it.

**Witness.** grothendieck1952 lines 1175–1183 (Ch. II, no. 3, p. 102): the proof of 2° in *Produits tensoriels* uses finer techniques. It can be replaced by criterion (c), a fundamental family with `E′_A` Hilbert, and the remark closing Ch. I, no. 7.

**Repair.** Replace the parenthesis by "(Grothendieck 1952, Ch. II, no. 3, the remark after Théorème 3, p. 102, with the remark closing Ch. I, no. 7, p. 87; Pietsch 1972, Chapter 5)".

Tested on the instance below:

- **Setup.** Take `E = s` with the Hilbertian seminorms `p_k(x) = (Σ n^{2k}|xₙ|²)^{1/2}` and any subspace `M`, for instance the dense, non-closed `c₀₀`.
- **Nuclear step.** `Ê_{p_{k+2}} → Ê_{p_k}` is diagonal with entries `1/n²`, so it is nuclear with norm `π²/6`.
- **Restriction.** Restricting it to `M̂_{p_{k+2}}` and then projecting orthogonally onto `M̂_{p_k}` gives a nuclear map of norm at most `π²/6`.
- **Where Hilbert is used.** The only Hilbert-space input is that orthogonal projection, which is the step of lines 585–588.

## R02 (P3) — The "Not a target" paragraphs of 0.2 and 2.3 leave in-scope mathematics unowned and do not cite what the pins already state

**Location.**

- README lines 187–191, after 0.2: "Not a target: in a barrelled space with a Schauder basis, the partial-sum projections … converge uniformly on precompact sets, which is Grothendieck's approximation property".
- Lines 375–377, after 2.3: "Not a target: the test-function space `𝒟(Ω)` is an (LF) space, hence barrelled …".

**Claim.** The paragraph after 0.2 has three problems:

- **Scope.** It is a statement about an arbitrary barrelled locally convex space, which the boundary sentence (lines 58–59) puts in this roadmap. A "Not a target" label inside a target section contradicts that sentence. Exclusions belong in Scope and ownership, as lines 54–56 do for Eberlein–Šmulian.
- **Missing citations.** Its Banach case, and the 𝒟(Ω) carrier of the 2.3 paragraph, are already declared at the pins, and neither paragraph cites them.
- **Missing hypothesis.** It applies Corollaire 2 with codomain `E`, which needs `E` to be locally convex. Under the conventions (lines 63–66), "barrelled" alone means a topological vector space.

**Witness.**

- Mathlib `SchauderBasis.exists_norm_proj_le` (`Bases.lean`:319) and Tau Ceti `SchauderBasis.hasBoundedApproximationProperty` (`Bases/Approximation.lean`:64) state the Banach case.
- Mathlib `TestFunction.topologicalSpace` (`TestFunction.lean`:274) is the LF topology of `𝓓(Ω, F)`.
- bourbaki1950 lines 94–95 require a locally convex codomain.

**Repair.** Delete both "Not a target" paragraphs and add the following.

- To Layer 0 `### Examples`: "In a barrelled locally convex space with a Schauder basis, the partial-sum projections are equicontinuous (0.2) and converge to the identity uniformly on precompact sets (Corollaire 2), which is Grothendieck's approximation property (Kalton 1970, p. 388); the Banach case is Mathlib's `SchauderBasis.exists_norm_proj_le` and Tau Ceti's `SchauderBasis.hasBoundedApproximationProperty`."
- To Layer 2 `### Examples`: "On Mathlib's `TestFunction` space `𝓓(Ω, F)`, an (LF) space, barrelled and bornological by 1.5, the topology is `τ(𝓓, 𝓓′)` by 2.3 (Dieudonné–Schwartz 1949, n° 7, Théorème 3 and its Corollaire, p. 76)."
- The "Not a target:" label on line 633 (the three-space remark of 5.4, on a line this diff rewrote) has the same form. Move that sentence into the "not in this roadmap" sentence of Scope and ownership (lines 54–56).

Tested on `ℓ²` with its unit-vector basis:

- `‖P_N‖ = 1`.
- On the compact set `K = {eₙ/n} ∪ {0}`, `sup_K ‖x − P_N x‖ = 1/(N+1) → 0`.
- On the unit ball, `‖e_{N+1} − P_N e_{N+1}‖ = 1`. So precompact sets, not bounded sets, are the right class, as the remark says.

## Previous findings

- R01 — repaired. Lines 575–578: "Prove that the completed injective tensor product respects subspaces (…) and commutes with arbitrary products, a direct check on the defining seminorms. These are not the route to 5.4". The 5.4 route (lines 628–633) now goes through criterion (c) and Hilbert seminorms. Its locator is new R01.
- R02 — repaired. Line 576: "(Grothendieck 1952, Ch. I, no. 6, Théorème 5, p. 83)". grothendieck1952 lines 441–445 lie on marker page 12, which is printed p. 83 (marker + 71).

## Verified sound

**Gate and dependency check.** The worker's gate at 714da0c passed every check, including `build=0`, `depcheck=0`, `statement-hygiene=0`, `readme-ids-missing=0` and `outside-folder=0`.

I reran the dependency check with the candidate merge order:

```
depcheck: 240 roadmaps, 2369 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The candidate order places the suppliers before this roadmap:

| Roadmap | Line in the candidate order |
|---|---|
| AutomorphicSpectralTheory | 85 |
| SpectralManifolds | 228 |
| LocallyConvexDuality | 229 |

I also reran the full gate with `--base origin/main`. It uses the configured merge order, which does not list this roadmap yet, so its only failure is `depcheck: NOT IN ORDER: LocallyConvexDuality (insert it after its last supplier)`. Under the brief, a roadmap the order does not yet list is placed after its last supplier, so this is not a finding; every other check was 0.

`git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/LocallyConvexDuality/` is empty.

**Lean.**

- `git diff 32064cd..HEAD -- Suggested.lean` is empty: the file is byte-identical to the one the previous review read.
- `lake env lean` exited 0 with thirteen `declaration uses 'sorry'` warnings (lines 73, 100, 108, 118, 152, 160, 167, 183, 193, 220, 228, 236, 243) and nothing else.
- The worker's listing of elaborated signatures matches the previous round. Its one "looks dropped `[TopologicalSpace E]`" lead, on `barrelledSpace_of_bornologicalSpace`, is false: that theorem binds `[UniformSpace E]` itself (its elaborated type lists `[UniformSpace E] [IsUniformAddGroup E] … [CompleteSpace E] [BornologicalSpace 𝕜 E]`).
- The three "found nowhere" Lean names in the worker's citation leads are false leads: `DFSpace.continuous_of_continuousOn`, `DFSpace.completeSpace_strongDual` and `DFSpace.firstCountableTopology_strongDual` are declared at `Suggested.lean` lines 228, 236 and 243.
- The module docstring still lists 5.1–5.4 as not statable (no locally convex `⊗̂ε` carrier at the pins), which covers the new 5.1 targets.
- Headline list and one-tactic probes: unchanged statements, carried forward from the previous reviews.

**Sources: changed passages and sampled targets they touch.**

Page offsets, printed page = marker page + offset:

- bourbaki1950: + 3.
- ds1949: + 59. Check: page 3 → 62, page 9 → 68, page 19 → 78, page 20 → 79. The "76" in the header of marker page 16 is an OCR misreading of 75.
- grothendieck1952: + 71.

| Target | Locator at this head | Source lines | Result |
|---|---|---|---|
| 0.2 remark | Bourbaki Corollaire 2, p. 7 | bourbaki1950 105–109 (marker page 4): a countable-basis filter of continuous linear maps from a barrelled space to a separated locally convex `F` converges uniformly on precompact sets | correct; needs `F = E` locally convex (R02) |
| 0.2 remark | Kalton 1970, Definition 2.2, Theorem 2.7, p. 388 | not readable (below) | not verifiable. The claim itself is Bourbaki's Théorème 1 (lines 94–96) applied to the partial-sum projections, which converge pointwise and so are pointwise bounded. This matches Mathlib's proof of `SchauderBasis.exists_norm_proj_le` by `banach_steinhaus`. |
| 2.3 | Bourbaki §2 Prop 2, p. 7; §4 Prop 5, p. 10 | bourbaki1950 123–126 (marker page 4), 240–243 (marker page 7) | correct |
| 2.3 remark | Bourbaki 1950, §2, p. 6: (LF) is barrelled | bourbaki1950 75–76 (marker page 3): separated inductive limits of barrelled spaces are barrelled, in particular every (LF) space | correct |
| 2.3 remark | D–S 1949, n° 7, Théorème 3 and Corollaire, p. 76 | ds1949 573 (n° 7 begins, p. 75), 621–634 (marker page 17, p. 76): for (F) and (LF) spaces, weakly bounded = equicontinuous, and the topology is `τ(E, E′)` | correct |
| 5.1 subspaces | G1952 Ch. I, no. 6, Théorème 5, p. 83 | grothendieck1952 441–445 | correct |
| 5.1 "π does not respect subspaces" | (no locator) | grothendieck1952 475–483 (p. 84) | correct |
| 5.4 statement | G1952 Ch. II, Théorème 3, p. 102 | grothendieck1952 1165–1174 | correct |
| 5.4 route | G1955 Ch. II §2 no. 2; Pietsch Ch. 5 | the route is grothendieck1952 1175–1183 and 580–588 | R01 |

The remaining seeded targets are untouched by the diff, and their locators carry forward from the earlier reviews' tables: 0.3, 1.1, 1.2, 1.3, 2.1, 2.2, 3.1, 3.2, 4.1, 4.3, 4.5 and 5.2.

**Adversarial table.** Rows for the changed statements carry computed values. Untouched statements cite the previous report.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 5.1 ε respects subspaces | `M = span{e₁} ⊆ ℓ²`, `F = ℓ²`; `M = ℓ²_n ↪ ℓ^∞` isometrically, `t = Σ_{i≤n} eᵢ ⊗ eᵢ` | `ε_M(e₁ ⊗ y) = ‖y‖ = ε_E(e₁ ⊗ y)`; `ε_M(t) = ‖id_{ℓ²_n}‖ = 1 = ε_E(t)`, since by Hahn–Banach the unit ball of `M′` is the set of restrictions from that of `E′` | true | none |
| 5.1 negative control, π | the same `t ∈ ℓ²_n ⊗ ℓ² ⊆ ℓ^∞ ⊗ ℓ²` | `π_M(t) = n` (trace duality). `π_E(t) = sup_{‖T : ℓ^∞ → ℓ²‖ ≤ 1} \|tr(T j)\| ≤ √n · π₂(T j) ≤ K_G √n` by Grothendieck's theorem. So `π_E\|_M ≠ π_M` once `n > K_G²`. | the sentence "π does not respect subspaces" holds | none |
| 5.1 ε commutes with products | `E = 𝕜^ℕ`, `F = ℓ²` | Equicontinuous subsets of `(𝕜^ℕ)′ = 𝕜^(ℕ)` lie in finite spans of coordinate forms, so each ε-seminorm is `C · max_{k≤N} ‖t_k‖`. The completion is `(ℓ²)^ℕ = ∏ (𝕜 ⊗̂ε ℓ²)`. | true | none |
| 5.1 "These are not the route to 5.4", product half | `∏ Eᵢ ⊗ F` | π also commutes with products. A continuous seminorm `p ≤ C max_{j∈J} p_j ∘ pr_j` vanishes on `∏_{i∉J} Eᵢ`, so `π_{p,q}` factors through `E_J ⊗ F`. A tensor route for products would need that π statement, which the N1 contract (lines 110–114) does not list. 5.4 names the definition route instead. | the sentence describes this roadmap's route; consistent | none |
| 5.4 subspace route | `E = s`, Hilbertian `p_k`; `M = c₀₀` (dense) or a closed subspace | `Ê_{p_{k+2}} → Ê_{p_k}` = diag(`1/n²`), nuclear norm `π²/6`. The restriction followed by orthogonal projection onto `M̂_{p_k}` is nuclear, norm ≤ `π²/6`. | the route reaches 2° | R01 (locator) |
| 5.4 product route | `𝕜^ℕ`, `p(x) = Σ_{j≤3} \|x_j\|`; negative control `ℓ² × 𝕜` | `p` factors through `𝕜³`; with `q = p`, `Ê_q → Ê_p` is the identity of `𝕜³`, of rank 3, so nuclear. For `ℓ² × 𝕜` and `p` the norm of the `ℓ²` factor, no `q` works (identity of `ℓ²` not nuclear), matching 5.4's third Check. | true | none |
| 0.2 remark | `ℓ²`, basis `(eₙ)`; `K = {eₙ/n} ∪ {0}`; unit ball | `‖P_N‖ = 1`; `sup_K ‖x − P_N x‖ = 1/(N+1) → 0`; on the unit ball the sup is `1` for every `N` | true for barrelled locally convex `E`; "precompact" is sharp | R02 |
| 2.3 remark | `𝒟((0,1)) = ⋃ 𝒟_{[1/n, 1−1/n]}` | Each `𝒟_K` is Fréchet (seminorms `sup \|φ^{(j)}\|`). The strict inductive limit is (LF), hence barrelled (bourbaki1950 75–76), hence `τ(𝒟, 𝒟′)` by 2.3. It is not metrizable (by Baire, along a strictly increasing sequence), so 1.2 does not apply, but 1.5 does. | true | R02 (label only) |
| 13 theorems and 7 definitions of `Suggested.lean`; 1.1–1.5, 2.1, 2.2, 2.4, 3.1–3.4, 4.1–4.5, 5.2, 5.3 and the 5.4 split with SM3 | as in the previous reports | Unchanged by the diff. The rows of the previous report (review of 32064cd: `dfSpace_strongDual`, `weakTopology`, 5.2, 5.4 split) and of the review of fb54a01 stand. | carried forward | none |

**Cross-roadmap citations resolved.**

- SpectralManifolds SM3 at its open head: README line 26 lists "the finite-sum, closed-subspace and Hilbert-scale criteria", and line 91 consumes §0.11 and uses the same definition over ℝ. This is what lines 124–125 and 625 attribute to it.
- AutomorphicSpectralTheory and SpectralManifolds are both open new-roadmap pull requests, named in the description's depends-on list.
- The overlap report: no open pull request changes or drops an id this roadmap cites.

**Duplication by object, for the new text.**

- `roadmaps grep` over main and the 466 open heads for "approximation property" and "Schauder basis" finds Banach-space ownership only: BanachSpaceTheory B3/B4 on main (README lines 177, 247–257) and its revision.
- At the pins:
  - Tau Ceti `TauCeti.HasApproximationProperty` (`ApproximationProperty/Basic.lean`:47, approximation on norm-compact sets).
  - Tau Ceti `SchauderBasis.hasBoundedApproximationProperty` (`Bases/Approximation.lean`:64, `[CompleteSpace E]`).
  - Mathlib `SchauderBasis` (`Mathlib/Analysis/Normed/Module/Bases.lean`:121, normed spaces only, with continuous `coord`) and `SchauderBasis.exists_norm_proj_le` (:319).
  - Mathlib `TestFunction` with `TestFunction.topologicalSpace` (`Mathlib/Analysis/Distribution/TestFunction.lean`:67, 274).
  - These are the uncited objects of R02.
- No pinned library has a locally convex injective tensor product: Mathlib's `PiTensorProduct/InjectiveSeminorm.lean` and Tau Ceti's `TensorProduct/*` are normed. The ε-product of 5.1 therefore keeps a single owner.
- Ownership against open pull requests was checked for these objects; the rest carries forward.

**House style of the changed lines.** None of the following appear: LaTeX delimiters, process words, pull-request numbers or paths. The Kalton entry in References carries its locator.

**Declared gaps.** None are declared, and none are needed.

## Not verifiable

- **Kalton 1970**, *Proc. Cambridge Philos. Soc.* 68, 377–392 (doi:10.1017/S0305004100046193), Definition 2.2 and Theorem 2.7, p. 388. Cambridge Core offers no open copy, and the sources service found no legal source. The mathematical claim is checked above from Bourbaki 1950, Théorème 1.
- **Grothendieck 1955**, Ch. II, §2, no. 2: no legal copy, as in the previous review.
- **Pietsch 1972**, Chapter 5: settled as uncertified. Springer's table-of-contents pages returned 404 and zbMATH returned 403, so the chapter numbering used at lines 631 and 636–637 could not be checked.
- **Grothendieck 1954; Grothendieck 1950 and 1950b; Köthe; Schaefer–Wolff; Trèves; Bourbaki volumes; Waelbroeck; Floret; Wengenroth; Dierolf–Roelcke**: as in the previous review.

## Source issues

- none
