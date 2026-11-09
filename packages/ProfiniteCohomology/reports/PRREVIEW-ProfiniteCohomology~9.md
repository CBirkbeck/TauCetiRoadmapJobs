# Review of ProfiniteCohomology (pull request #616 at fc1a80a)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines changed since `59d87d4`. `README.md:523` now cites Mathlib's `IsAddTorsion` instead of its deprecated alias `AddMonoid.IsTorsion`. That change is correct at both Mathlib revisions in play (see "Verified sound"). No Lean statement changed and no file outside the folder changed. The gate passes at this head.

The reply posted on the pull request at `fc1a80a` disputes the previous R01 and answers R02; the folder is unchanged on both points. I still hold both findings, for the reasons given under each.

## R01 (P2) — Nineteen Tau Ceti names cited as pinned are absent at the branch's pin; at main's pin, two `sorry`s restate proved theorems

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:38`–`:47` ("Most headline theorems of the roadmap are already proved at the Tau Ceti pin … `TauCeti.subsingleton_h1_abelianizationProP` and `TauCeti.abelianizationProPClass_generates`"); also `:78`–`:83`, `:304`–`:310` and `:563`–`:570`.
- `TauCetiRoadmap/ProfiniteCohomology/README.md:186` ("Every backticked entry in the declaration column is a Lean identifier at the pins"); also `:219`, `:221`, `:578`, `:1686`, `:2790`–`:2802`, `:2878`, `:2957`–`:2974`, `:3033`, `:3245`–`:3247`, `:3468`–`:3473`, `:3615`, `:3644`, `:37`–`:38` and `:615`–`:617`.

**Claim:** The facts are agreed. The reply counts 19 cited names that are absent at Tau Ceti `358314d4` (this branch's pin) and present at `2fd255d9` (main's pin), and my own check finds the same 19. Among them:
- `TauCeti.abelianizationProPClass_generates`
- `TauCeti.subsingleton_h1_abelianizationProP` and its `_of_isPGroup` and `_map` forms
- `TauCeti.galoisEvens_galoisRes`, `TauCeti.galoisEvens_add` and `TauCeti.galoisEvens_embedding_independent`
- `TauCeti.coindFunctor_preservesEpimorphisms`
- `TauCeti.ContCohomology.evensNormIndexTwo_trivialF2ResMap`

The reply's position is that main's manifest is the pin that governs. That fails for three reasons:

1. **The review and the build use the branch's pins.** They are the pins of the branch's `lake-manifest.json`. The gate's targeted build at this head ran against `358314d4`, and it leaves four `sorry`s. `README.md:615`–`:617` names only two as the remaining work.
2. **Main's pin reaches this folder only through a merge that has not been made.** GitHub reports #616 as `CONFLICTING` with main. Since the merge base `fa41b374`, main's #1800 (`a891cd19`) and two progress commits have edited this folder's `README.md` and `Suggested.lean`.
3. **Even at main's pin the folder contradicts itself.** `Suggested.lean:304` and `:563` state with `sorry` two theorems whose conclusions Tau Ceti proves verbatim at `2fd255d9` (`ClassModule/Sylow.lean:156`, `GaloisCohomology/EvensNorm.lean:143`). This contradicts the file's contract at `:33`–`:35` ("the headline theorems of the roadmap that the pinned libraries do not yet prove") and `README.md:37`–`:38`. It also breaks the file's own rule at `:75`–`:76` that a consumer-facing name is "a theorem proved by the Tau Ceti theorem".

So the finding holds whichever pin is meant, and both readings lead to the same repair.

**Witness:** `git grep` of the declarations at both Tau Ceti revisions: 19 cited names are absent at `358314d4` and all present at `2fd255d9`, and no name goes the other way. `Sylow.lean:156` and `EvensNorm.lean:143` at `2fd255d9` have the same conclusions as `Suggested.lean:304` and `:563`. GitHub reports #616 as `CONFLICTING`.

**Repair:** Merge `origin/main` into the branch. The pull request needs this merge anyway to clear the conflict.

- **Resolving the conflict.** In `README.md` and `Suggested.lean`, keep this branch's text. Main's #1800 hunks in those files are the `Subgroup.quotientOpenSubgroup` and `TauCeti.res_trivialF2_hom` renames and the split `ExactCochains`, `GroupCohomologyIso` and `Cup.ConnectingMap` imports. None of them occurs in this branch's files, and all 26 `TauCeti.*` imports of this head exist at `2fd255d9`.
- **After the merge**, the manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. Then:
  - replace the `sorry` at `Suggested.lean:310` with `TauCeti.abelianizationProPClass_generates Fact.out hG hV`;
  - replace the `sorry` at `:569` with `TauCeti.galoisEvens_galoisRes K L σ hdeg y`;
  - rewrite `:78`–`:83` to say that these two theorems are proved by Tau Ceti's theorems of the same name;
  - re-run the gate with the build, which should leave exactly two `sorry` warnings, at `:270` and `:278`.
- **Keep both names.** Do not delete them as padding: on main, `Completed/LocalGaloisGroups/Suggested.lean:1916` and `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:3078` apply them.
- **How far this is tested.** I compared the binders and conclusions with `Sylow.lean:54`–`:55` and `:156`–`:160` and with `EvensNorm.lean:143`–`:147` at `2fd255d9`. I did not elaborate the two terms, because main's pin is not built in this worktree.
- **If the branch cannot merge main,** use Route 2 of the previous R01 instead.

## R02 (P3) — The merge order against #1187 is still not chosen

Re-raised: H02

**Location:** the pull request's description, which still names only #354 and #618. The reply at `fc1a80a` says: "Whichever merges second is rebased: merging #1187 first costs this branch nothing … merging this branch first obliges #1187 to drop that hunk."

**Claim:** #1187 ("chore: bump TauCeti to ab00ba392") is still open and changes `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` and `lake-manifest.json`. The reply's analysis is correct: #1187's Tau Ceti target is an ancestor of main's `2fd255d9`, so #1800 has superseded it. But the reply describes both orders without choosing one, and choosing one is what the overlap rule asks for. Its reason, that the description cannot be edited, does not stop the order being stated: the analysis itself was posted as a reply.

**Witness:** `scratch/overlaps.md` lists #1187 as conflicting with #616 in eleven files, including this folder's `Suggested.lean`. `gh pr view 1187` shows `OPEN`, `CONFLICTING`. The reply names no order.

**Repair:** State the order in one sentence, in the description or in the worker's next reply. The natural order follows from the reply's own analysis: this branch merges first, after R01's merge of main. #1187, which has to be redone against main's newer pin anyway, then drops its hunk in this folder's `Suggested.lean`.

## Previous findings

- R01 — not repaired: the pin is still Tau Ceti `358314d4`. `Suggested.lean:38` ("already proved at the Tau Ceti pin"), `:79`–`:83` and `README.md:186`, `:221`, `:2790`–`:2796` are unchanged, and the reply disputes the finding. Written again as R01.
- R02 — partly repaired: the reply at `fc1a80a` analyses #1187 and both merge orders but chooses neither, and the description is unchanged. Written again as R02.

## Verified sound

**Scope and gate.**
- The worktree is clean at `fc1a80a2`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty.
- `git diff 59d87d40..HEAD` touches only `README.md`, with 1 insertion and 1 deletion. `Suggested.lean` is byte-identical to the previous head.
- My run of the gate without the build reports every key `0` and `OK`. The worker's run with the targeted build reports `build=0` and `OK` (`scratch/gate.md`).

**The changed line, `README.md:523`.**
- At the pinned Mathlib `f6090c70`, `Mathlib/GroupTheory/Torsion.lean:51`–`:57` declares `IsMulTorsion G := ∀ g : G, IsOfFinOrder g`. Its `to_additive` attribute generates `IsAddTorsion`.
- `:60` is `@[deprecated (since := "2026-07-01")] alias AddMonoid.IsTorsion := IsAddTorsion`.
- The same lines hold at main's Mathlib `1b1ccf4b` (`:56`, `:60`).
- The README's Layer 11 torsion interface, 11.1 at `:2599`–`:2601`, cites `TauCeti.cohomologicalDimensionLE_iff_torsion`. At the pinned Tau Ceti that theorem (`CohomologicalDimension/Torsion.lean:99`–`:103`) takes the hypothesis `IsAddTorsion M`. The entry now names the predicate the cited theorem uses.
- `grep IsTorsion` over the folder finds only the changed line, so no other deprecated torsion name remains.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The change adds no supplier.

**Elaboration and signatures.**
- `lake env lean` on `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`, run from the worktree, exits 0 with exactly four `declaration uses sorry` warnings, at `:270`, `:278`, `:304` and `:563`.
- A scratch probe importing the built module ran `#check @` on the four theorems. Their elaborated types are unchanged from the previous report:
  - `cohomologicalDimensionAt_universe_eq : ∀ p (G : Type u_1) [Group G] [TopologicalSpace G] [IsTopologicalGroup G], TauCeti.cohomologicalDimensionAt p G = TauCeti.cohomologicalDimensionAt p G`, at the two universe instances;
  - `strictCohomologicalDimensionAt_universe_eq`, likewise;
  - `abelianizationProPClass_generates : ∀ p [Fact (Nat.Prime p)] G … [CompactSpace G] [TotallyDisconnectedSpace G], scd_p p G ≤ 2 → ∀ V [V.Normal] (hV : IsOpen ↑V), zmultiples … = ⊤ ∧ Nat.card (H2 (G ⧸ V) …) = p ^ padicValNat p (Nat.card (G ⧸ V))`;
  - `galoisEvens_galoisRes : ∀ K L … [FiniteDimensional K L] σ (hdeg : finrank K L = 2) y, galoisEvens K L σ hdeg (galoisRes K L σ 1 y) = cup (f2Pairing _) 1 1 y y + cup (f2Pairing _) 1 1 (galoisCharacter K L σ hdeg) y`.

**Cited Tau Ceti names at both revisions (R01's evidence).**
- `README.md` and `Suggested.lean` contain 494 distinct backticked `TauCeti.*` tokens. I matched each by its last component against the declarations at both revisions with `git grep`.
- 19 are absent at `358314d4` and all present at `2fd255d9`, at `README.md:219`, `:1686`, `:2801`–`:2974`, `:3245`–`:3247` and `:3468`–`:3473`. None is present at `358314d4` and absent at `2fd255d9`.
- Three tokens are not declarations: the namespaces `TauCeti.ContCohomology` and `TauCeti.ContinuousCohomology`, and the prefix `TauCeti.TopPairing.resolutionCupPairing_`.
- All 26 `TauCeti.*` imports of `Suggested.lean` exist at both revisions.
- On main, `Sylow.lean:54`–`:55` (`{p} {G : Type u} … [CompactSpace G] [TotallyDisconnectedSpace G] {V} [V.Normal]`) and `:156`–`:160` match `Suggested.lean:304`–`:309`, with `scd_p` the abbreviation at `:253`. `EvensNorm.lean:143`–`:147` matches `:563`–`:569`, with `cup` and `f2Pairing` unfolding to `TopPairing.cup` and `trivialF2TopPairing`.

**Seeded sample.**
- None of the fifteen sampled targets lies in the changed line. Their README line ranges are 0.1 `637`–`653`, 0.2 `654`–`679`, 1.6 `857`–`864`, 2.1 `948`–`964`, 3.1 `1049`–`1063`, 5.1 `1321`–`1333`, 6.1 `1511`–`1527`, 6.5 `1594`–`1608`, 7.2 `1727`–`1743`, 7.4 `1758`–`1814`, 8.1 `1840`–`1858`, 8.3 `1876`–`1888`, 9.5 `2098`–`2113`, 9.6 `2114`–`2153` and 10.4 `2310`–`2359`.
- None of the 19 absent names falls in those ranges, so every Tau Ceti name they cite resolves at the branch pin.
- I opened the declarations behind two of them:
  - 7.2: `TauCeti.ContCohomology.explicitShapiro0` (`Shapiro/Basic.lean:142`, with no closedness hypothesis, matching "Degree `0` needs no closedness"); `explicitShapiro1` with `hU : IsClosed` (`:415`), `_apply` (`:421`) and `_symm_apply` (`:427`); `explicitShapiro2` (`:773`); `TauCeti.DiscreteCoind` (`Coinduced/Discrete.lean:93`); `TauCeti.ContinuousCohomology.shapiroIso` (`Shapiro/AllDegrees.lean:244`).
  - 9.5: `TauCeti.hilbert90` (`GaloisCohomology/Hilbert90.lean:245`), `TauCeti.subsingleton_H1_additive_units` (`:186`) and Mathlib's `groupCohomology.H1ofAutOnUnitsUnique` (`RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:107`).
- The source locators of the sampled sections are NSW, Ribes–Zalesskii and Koch (see "Not verifiable").

**Cross-roadmap citations and overlaps.**
- `scratch/overlaps.md` reports that no id this README cites is dropped by an open pull request, that no id it cites is defined only by an open revision, and that this pull request drops no id other roadmaps cite. The conflicting head #1187 is R02.
- The two names R01's repair keeps are applied on main at `Completed/LocalGaloisGroups/Suggested.lean:1916` and `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:3078`.
- The `citations` lead `WreathC2.sectionTable` is this roadmap's own definition (`Suggested.lean:458`), not a library name.
- Ownership against open pull requests whose files the brief does not supply was not checked.

**Adversarial table.** The rows for statements the diff leaves untouched are carried forward from PRREVIEW-ProfiniteCohomology~8, which carried them from ~7 and ~6; no statement changed. The last row is computed here for the changed entry.

| Statement / location | Instances | Values computed on the two sides | Result |
|---|---|---|---|
| 11.2 universe equalities, `Suggested.lean:270`, `:278` (carried from ~8) | `G = 1`, `ℤ_p`, `C_p`; `u = 0`, `u = 1` | `cd_p`: `0 = 0`, `1 = 1`, `⊤ = ⊤`; at `u = 1` the two `continuousCohomology` objects differ and `rfl` and `simp` fail | true, not padding |
| 11.8 class module, `:304` (carried from ~8) | `ℤ_p ⊇ pℤ_p` with `p = 2, 3`; `V = G`; `ℤ_p × C_ℓ ⊇ ℤ_p`; `C_p ⊇ 1` | `H² = pℤ_p/p²ℤ_p` has order `p = p^{v_p(p)}`; `V = G` gives `0` and `1 = p⁰`; index `ℓ` gives `0 = p^{v_p(ℓ)}`; for `C_p`, `0 ≠ p`, excluded by `scd_p C_p = ⊤` | hypotheses exact; at `2fd255d9` closed by one `exact` (R01) |
| 11.8 strict bound needed (carried from ~8) | `ℤ_p²` with `V = pG` | `cd = 2` and `scd = 3`; `H² = ((ℤ/p)²)²` has order `p⁴ ≠ p²` | `scd ≤ 2` needed |
| 11.7 strict criterion (carried from ~8) | `ℤ_p` with `n = 1, 2`; `1` with `n = 0`; `ℤ_q` with `n = 1` | `2 ≰ 1` ↔ `H²(p^rℤ_p, ℤ)(p) = ℚ_p/ℤ_p ≠ 0`; `2 ≤ 2` ↔ `H³ = 0`; `0 ≤ 0` ↔ `0`; `scd_p ℤ_q = 0` ↔ `0` | agrees with the pinned statement |
| 11.1, 11.3, 11.5 primary torsion and the invariants (carried from ~8) | `⊕_ℕ ℤ`, `ℚ_p/ℤ_p`; `p^rℤ_p ⊆ ℤ_p` | `H¹ = ∏ ℚ_p/ℤ_p ∋ (1/p^k)_k` is unbounded; `cd_p(p^rℤ_p) ≤ cd_p ℤ_p` reads `1 ≤ 1` | compactness needed; monotone |
| 13.1, `:563`, `N(res y) = y⌣y + χ⌣y` (carried from ~8) | `C₂×C₂ ⊇ ⟨a⟩` with `y = a*`, `χ`, `a* + χ` | via the `D₈` preimage, `N(res a*) = a*² + a*χ`; `y = χ` gives `0 = χ² + χ²`; `y = a* + χ` gives `a*² + χa*` on both sides | identity holds; at `2fd255d9` closed by one `exact` (R01) |
| 13.3 example `C₄ ⊇ C₂`, `α ≠ 0` (carried from ~8) | `Ind α(g) = r³`, `Ind α(g²) = r²` | preimage `C₈`, `N(α) ≠ 0`, `α` not a restriction | consistent |
| 13.1 wreath table `:458` (carried from ~8) | 8 elements | `r ↦ (1,0,1)`, `r² ↦ (1,1,0)`, `r³ ↦ (0,1,1)`, `r⁴ ↦ 1`, `sr⁷ ↦ (1,0,0)`, `sr⁶ ↦ (1,1,1)`, `sr⁵ ↦ (0,1,0)`, `s ↦ (0,0,1)` | agrees with `TauCeti.wreathSection` |
| Seeded sections 6.5, 7.2, 7.4, 8.1, 8.3, 9.5, 9.6 (carried from ~8) | as in ~8 | signs `(−1)^{mn}` on `(2,1)` and `(1,2)`; `cor⁰ 1 = 3` on `S₃ ⊇ C₂`; Shapiro direction on `C₂ ⊇ 1`; Hilbert 90 for `ℂ/ℝ`; `0 → ℤ → ℤ → ℤ/2` on `C₂` | consistent |
| `README.md:523`, `IsAddTorsion` (new) | `ℚ_p/ℤ_p`, `ℤ`, `0`, `∏ₙ ℤ/pⁿ`; wrong models: torsion-free, bounded exponent | `ℚ_p/ℤ_p`: `pᵏ·(a/pᵏ) = 0`, torsion, but no exponent, so it separates torsion from the bounded-exponent criterion `TauCeti.cohomologicalDimensionAt_le_iff_boundedExponent`; `ℤ`: `1` has infinite order, not torsion; `0`: torsion; `∏ₙ ℤ/pⁿ`: `(1,1,…)` has infinite order, not torsion; `IsAddTorsionFree` fails on `ℚ_p/ℤ_p` | names the hypothesis of `TauCeti.cohomologicalDimensionLE_iff_torsion` (`Torsion.lean:102`) at both Mathlib revisions |

**Headline theorems.**
- Statable at the pins and stated:
  - Layer 11's universe independence of `cd_p` and `scd_p` (`:270`, `:278`);
  - NSW (3.6.4) in degree two (`:304`);
  - the Evens restriction formula at a quadratic extension (`:563`).
- Not statable, and named in the docstring at `:58`–`:65`: the general Evens norm `H^{2q}(U, A) → H^{2lq}(G, A)` and its laws, which lack the cohomological norm map.
- Since `Suggested.lean` is unchanged, the previous one-tactic probe stands for the branch pin. At main's pin, `:304` and `:563` close with one `exact`; R01 turns them into proofs rather than deletions, because consumers apply them.

## Not verifiable

- **NSW**, *Cohomology of Number Fields*, 2nd ed., and **Ribes–Zalesskii**, **Koch**, **Serre** and **Brown**. These are Springer texts for which the sources service found no legal copy in earlier rounds. Their locators, including NSW (6.2.1) in 9.5, NSW (1.6.4), Ribes–Zalesskii Thm. 6.10.5 and Koch Thm. 3.9 in 7.2, and NSW (3.3.1), (3.6.4) in Layer 11, are uncertified. I checked them on the instances in the table and against the pinned declarations above.
- **Building at main's pin.** I did not run the repaired `Suggested.lean` against Tau Ceti `2fd255d9`, because the brief's Lean commands run only in this worktree, which is built at `358314d4`. R01's repair terms rest on the side-by-side comparison of binders and conclusions.
- **The pull request's description** cites a CI run against Tau Ceti `a91d3aa…`, which is neither this branch's pin nor main's. This report uses the worktree's manifest.

## Source issues

- none
