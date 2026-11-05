# Review of VonNeumannAlgebras (pull request #1041 at f153571)

**Verdict:** needs changes

Incremental re-review of the 14 lines of `TauCetiRoadmap/VonNeumannAlgebras/README.md` changed since 1fcec62 (the previous review's head): the parenthetical attribution in the definition of the inclusion matrix in V3.2 (`:809–812`), with the surrounding sentences re-wrapped and otherwise unchanged. `Suggested.lean` is byte-identical to the previous head. The two Jones locators the changed parenthetical cites were opened in the cached text; the gate passes on the worker's run and on mine; the dependency check reports no problem; the Lean file elaborates with exactly seven `sorry` warnings. R02 of the previous review is repaired and the repair introduced nothing new. R01 stands because nothing in this folder can repair it.

## R01 (P2) — Two open pull requests still build the same folder and the same objects

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:43` (`namespace TauCetiRoadmap.VonNeumannAlgebras`) and its seven theorems and four definitions; README V0–V4 and V4.0.Fields.

**Claim:** `roadmaps list` (index of 2026-11-05T06:44:40Z, 460 open pull requests) shows `#889 VonNeumannAlgebras (new) dee8088` and `#1041 VonNeumannAlgebras (new) f153571`, both by the same author. At dee8088, re-read this round, #889's README carries `## Layer 0` through `## Layer 4` (`:276`, `:393`, `:524`, `:906`, `:971`) with this folder's titles and `**V4.0.Fields — Hilbert and operator fields.**` (`:1182`), then Layers 5–13 (`:1340`–`:3689`); its `Suggested.lean` opens `namespace TauCetiRoadmap.VonNeumannAlgebras` (`:61`) and declares the same objects under other names: `exists_injective_nondegenerate_representation_lp` (`:72`), `double_commutant_iff_isClosed_image_ofCLM` (`:83`), `closure_unitBall_eq_unitBall_double_centralizer` (`:92`), `IsCyclic`/`IsSeparating`/`isCyclic_iff_isSeparating_commutant` (`:111–120`), `ProjectionEquivalent`/`ProjectionSubequivalent`/`equivalent_of_subequivalent` (`:128–140`). The pull request's description at this head still says the complete programme is retained in #889 and that this branch is its historical staged snapshot. Re-raised: R01 of the reviews at 1fcec62 (round 18), f2a0b88 (rounds 16 and 17), 95571ab (round 15), d9e53b3 (rounds 13 and 14), b35ea83 and 8b00f8a; the round-13 repair answered it without an edit, and the reason (nothing in this folder can change #889) is true but does not remove the second owner.

**Witness:** `roadmaps show VonNeumannAlgebras --pr 889 --file Suggested.lean` lines above; `roadmaps show VonNeumannAlgebras --pr 889` `:276–3689`.

**Repair:** One owner per object. Either #889 is cut down to a `VonNeumannAlgebrasPartII` folder starting at its Layer 5, citing V0–V4 and V4.0.Fields of this folder by section (its Layers 0–4 deleted, main's consumers of V5+ repointed to the Part II), or this pull request is closed. Control: exactly one open pull request declares a bicommutant theorem on `StarSubalgebra ℂ (H →L[ℂ] H)` in `namespace TauCetiRoadmap.VonNeumannAlgebras`, and exactly one has a section named V4.0.Fields.

## Previous findings

Review of this pull request at 1fcec62 (round 18):

- R01 — not repaired: `roadmaps list` still shows #889 at dee8088 and #1041 as `VonNeumannAlgebras (new)`; #889 at dee8088 carries Layers 0–4, V4.0.Fields and the same namespace, as quoted above. Nothing in this folder can repair it. Written again as R01.
- R02 — repaired: `:809–812` now reads "(Jones, Theorem 4.4.2 and the definition of `Λ` that follows its proof, pp. 28–29: the theorem itself is the factor case, with `k > 0`, and it is that definition which takes every corner `p_j q_i M q_i p_j` to be a factor and so tacitly nonzero)". Checked against the source: the theorem's statement (jones-vna lines 856–859, p. 28) is the factor case with `k > 0`; the corner-is-a-factor clause is in the definition of `Λ` after the proof (lines 872–874, p. 29). The attribution is now exact, the page range covers both, and the sentence is timeless. No new problem.

## Verified sound

**Gate.** The worker's run at f153571: `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. My own run this round (`gate … --base origin/main`) gives the same checks with `OK` and exit 0. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty; `git diff 1fcec62 HEAD --stat` is the README only (8 insertions, 6 deletions); `git diff 1fcec62 HEAD -- Suggested.lean` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; the worktree is clean. The changed lines contain no process word, no pull-request number and no local path.

**Dependency check** (run this round, verbatim):

```text
depcheck: 237 roadmaps, 2107 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 5. The diff adds no `*Needs:*` item and cites no roadmap (V3.2's `*Needs:*` line `:843`, "V3.1; V2.3–V2.4", is unchanged); the cross-roadmap citation resolver reports nothing found nowhere.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` from the worktree: exit 0 in 13 s, exactly seven `declaration uses sorry` warnings (`:52`, `:62`, `:71`, `:94`, `:106`, `:114`, `:131`), nothing else. The file is byte-identical to the one the previous two reviews probed, so their `#check @name` comparison of all eleven elaborated types with the README (none lost a section binder; the worker's signature file for this head lists the same eleven types with 0 dropped binders), their one-tactic probe (none of the seven closes) and their headline accounting (seven statable headlines stated, four non-statable ones named in the docstring `:17–37`) carry over; the changed README lines name no Lean declaration.

**Sources read this round** (jones-vna: V. F. R. Jones, *Von Neumann algebras*, lecture notes, 2009, the author's Berkeley page, through the cache; pdf page equals printed page at the markers of lines 833, 871 and 904). The two locators the changed parenthetical cites, none found by heading:

1. Jones Theorem 4.4.2, p. 28 (lines 856–859): `M` a type `I_n` factor; its type `I_m` subfactors are determined up to unitary conjugacy in `M` by the integer (or `∞`) `k > 0` with `pMp` of type `I_k` for `p` minimal in the subfactor, and `mk = n`. No `p_j`, `q_i` or corner appears in the statement, as the README's "the theorem itself is the factor case, with `k > 0`" says.
2. The definition of `Λ` after the proof, p. 29 (lines 868–874): for `N = ⊕ M_{k_i}(ℂ) ⊆ M = ⊕ M_{r_j}(ℂ)`, `p_j` minimal central in `M`, `q_i` in `N`, each corner `p_j q_i M q_i p_j` is taken to be a factor with `p_j q_i N` a subfactor, and `λ_{ij}` is the integer Theorem 4.4.2 attaches to that pair, as the README's "it is that definition which takes every corner … to be a factor and so tacitly nonzero" says. The rows are indexed by `N`, as the README's `λ_{ij}` and dimension formula `r_j = Σ_i λ_{ij} k_i` have them.

The other four locators of the passage (Theorem 4.4.1, Exercise 4.4.3, Example 4.4.4, Exercise 4.4.5, §4.5) are untouched by the diff and were verified at the previous two heads.

**Consumers of the changed passage.** The diff changes an attribution, not a statement; no roadmap on main or in an open pull request cites V3.2 by number, and the consumers by title (CStarClassification at its open head, Subfactors, TemperleyLiebOperatorAlgebras, TypeAHeckeAlgebras on main) were resolved at the previous head and import the classification, which is unchanged. Ownership against open pull requests was checked through `roadmaps list` and `roadmaps show` on the index of 2026-11-05T06:44:40Z; the only other open pull request carrying this folder or declaring its objects is #889 (R01).

**Computed adversarial pass.** The V3.2 rows were recomputed on the definition as worded at this head (the mathematics of `:806–812` is unchanged; only the parenthetical changed); the 39 rows of the review at f2a0b88 (round 17) for the untouched statements carry forward, each cited to that report.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| V3.2 definition of `λ_{ij}` as restated at `:806–812` against Jones Theorem 4.4.2 and the definition of `Λ` | Jones Example 4.4.4, `N = M₂(ℂ) ⊕ ℂ ⊆ M = M₅(ℂ) ⊕ M₃(ℂ)`, `X ⊕ z ↦ diag(X, X, z) ⊕ diag(X, z)` | `q₁ = 1 ⊕ 0`, `q₂ = 0 ⊕ 1` in `N`; `p₁ = 1₅ ⊕ 0`, `p₂ = 0 ⊕ 1₃`; `(1,1)`: `e = diag(e₁₁, e₁₁, 0) ⊕ 0` of rank 2, `e M e ≅ M₂(ℂ)`, `k = 2`; `(2,1)`: `p₁ q₂ = diag(0,0,0,0,1) ⊕ 0`, corner `ℂ`, `k = 1`; `(1,2)`: `p₂ q₁ = 0 ⊕ diag(1,1,0)`, `e = 0 ⊕ diag(e₁₁, 0)`, `e M e = ℂ`, `k = 1`; `(2,2)`: `k = 1`; `Λ = [[2, 1], [1, 1]]`, Jones line 887; theorem's `mk = n` on the factor sub-case `M₂ ⊆ M₄`, `X ↦ diag(X, X)`: `m = 2`, `k = 2`, `n = 4`; every corner here nonzero, so the tacit clause of lines 872–874 is never invoked | retain |
| V3.2 zero-corner clause and identity Check `:807`, `:833–837` | `ℂ ⊕ ℂ ⊆ ℂ ⊕ ℂ` by the identity | `q₁ = p₁ = (1, 0)`, `q₂ = p₂ = (0, 1)`; `p₁ q₂ = 0`, corner `p₁ q₂ M q₂ p₁ = 0`, not a factor (`:795`); clause gives `λ₂₁ = 0`, `λ₁₂ = 0`; `p₁ q₁ ≠ 0`, `e = p₁`, `e M e = ℂ` type `I₁`, `λ₁₁ = 1 = λ₂₂`; `Λ = I`; `r₁ = 1 = 1·1 + 0·1`; `Λ·Λ = I`; `e₂ = (0, 1)`, `p₁ e₂ = 0`, rank `0 = λ₂₁`; Jones's definition at lines 872–874 does not cover this instance (the corner `0` is not a factor), which is the gap the README's clause closes | retain |
| V3.2 entry formula, rank versus trace | `p_j e_i`, `e_i` minimal in `q_i N`, in Example 4.4.4 | `e₁ = diag(e₁₁, e₁₁, 0) ⊕ diag(e₁₁, 0)`: `tr(p₁ e₁) = 2 = λ₁₁`, `tr(p₂ e₁) = 1 = λ₁₂`; `e₂ = diag(0,0,0,0,1) ⊕ diag(0,0,1)`: `tr(p₁ e₂) = 1 = λ₂₁`, `tr(p₂ e₂) = 1 = λ₂₂`; `p_j` central in `M ⊇ N` so `p_j e_i` is a projection and its trace is its rank, so Jones's "trace" (line 876) and the README's "rank" (`:814–815`) agree | retain |
| V3.2 other Checks `:829–832`, `:838–841` and API bullets `:823–826` | as in the review at 1fcec62 (round 18) | the values computed there, unchanged: the diff touches none of these lines beyond re-wrapping | carried |
| 39 untouched statements (`exists_faithful_representation`, V0.1–V0.2, `bicommutant_eq_iff_isClosed_wot`, `kaplansky_closure_unitBall`, V1.1–V1.4, V2.1–V2.5, `MurrayVonNeumannEquiv`/`Subequiv`/`_of_subequiv`, V3.1, V3.3, `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv`, V4.Core, V4.PositivePredual, `IsCyclicVector`/`IsSeparatingVector`/the iff, V4.Normality, V4.0.Fields) | as in the review at f2a0b88 (round 17), the 39 rows of its table other than the V3.2 row | the values computed there, unchanged: the diff touches none of these statements and nothing in it cites them | carried |

3 rows recomputed this round, none leading to a finding; 40 carried.

## Not verifiable

- Dixmier, *Von Neumann algebras*, Part II, Chapters 1–2, and Takesaki, *Theory of Operator Algebras I*, Chapter IV §8 (`:1124`, `:1209–1211`): no legal full text is reachable (North-Holland and Springer, not in the cache, no author-page or institutional copy); cited by locator, as the README does; not touched by this change set.
- Ownership against open pull requests was checked on the index of 2026-11-05T06:44:40Z; pull requests outside that index were not searched.

## Source issues

- **Gap** in jones-vna at the definition of the inclusion matrix after the proof of Theorem 4.4.2, printed page 29: `λ_ij` is defined as the integer attached by Theorem 4.4.2 to the subfactor `p_j q_i N` of the factor `p_j q_i M q_i p_j`, which presupposes `p_j q_i ≠ 0`; it should set `λ_ij = 0` when `p_j q_i = 0`, as the trace formula of Exercise 4.4.3 does; affects a stated result (Exercise 4.4.5 realises Bratteli diagrams with absent edges).
