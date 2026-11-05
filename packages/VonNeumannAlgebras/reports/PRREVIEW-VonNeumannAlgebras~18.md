# Review of VonNeumannAlgebras (pull request #1041 at 1fcec62)

**Verdict:** needs changes

Incremental re-review of the 29 lines of `TauCetiRoadmap/VonNeumannAlgebras/README.md` changed since f2a0b88 (the previous review's head): the zero-corner clause in the definition of the inclusion matrix in V3.2 (`:806–810`) and the new identity-inclusion Check (`:831–835`). `Suggested.lean` is unchanged. The six Jones locators the changed passage cites were opened in the cached text; the gate passes on the worker's run and on mine; the dependency check reports no problem; the Lean file elaborates with exactly seven `sorry` warnings and a `#check` probe of all eleven declarations agrees with the worker's signature file. R02 of the previous review is repaired. R01 stands because nothing in this folder can repair it. The repair introduced one P3: its parenthetical attributes a clause to the statement of Jones's Theorem 4.4.2 that is in the unnumbered definition of `Λ` after the proof.

## R01 (P2) — Two open pull requests still build the same folder and the same objects

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:43` (`namespace TauCetiRoadmap.VonNeumannAlgebras`) and its seven theorems and four definitions; README V0–V4 and V4.0.Fields.

**Claim:** `roadmaps list` (index of 2026-11-04T22:35:25Z, 453 open pull requests) shows `#889 VonNeumannAlgebras (new) dee8088` and `#1041 VonNeumannAlgebras (new) 1fcec62`, both by the same author. At dee8088, re-read this round, #889's README carries `## Layer 0` through `## Layer 4` (`:276`, `:393`, `:524`, `:906`, `:971`) with this folder's titles and `**V4.0.Fields — Hilbert and operator fields.**` (`:1182`), then Layers 5–13 (`:1340`–`:3689`); its `Suggested.lean` opens `namespace TauCetiRoadmap.VonNeumannAlgebras` (`:61`) and declares the same objects under other names: `exists_injective_nondegenerate_representation_lp` (`:72`), `double_commutant_iff_isClosed_image_ofCLM` (`:83`), `closure_unitBall_eq_unitBall_double_centralizer` (`:92`), `IsCyclic`/`IsSeparating`/`isCyclic_iff_isSeparating_commutant` (`:111–120`), `ProjectionEquivalent`/`ProjectionSubequivalent`/`equivalent_of_subequivalent` (`:128–140`). The pull request's description at this head still says the complete programme is retained in #889 and that this branch is its historical staged snapshot. Re-raised: R01 of the reviews at f2a0b88 (rounds 16 and 17), 95571ab (round 15), d9e53b3 (rounds 13 and 14), b35ea83 and 8b00f8a; the round-13 repair answered it without an edit, and the reason (nothing in this folder can change #889) is true but does not remove the second owner.

**Witness:** `roadmaps show VonNeumannAlgebras --pr 889 --file Suggested.lean` lines above; `roadmaps show VonNeumannAlgebras --pr 889` `:276–3689`.

**Repair:** One owner per object. Either #889 is cut down to a `VonNeumannAlgebrasPartII` folder starting at its Layer 5, citing V0–V4 and V4.0.Fields of this folder by section (its Layers 0–4 deleted, main's consumers of V5+ repointed to the Part II), or this pull request is closed. Control: exactly one open pull request declares a bicommutant theorem on `StarSubalgebra ℂ (H →L[ℂ] H)` in `namespace TauCetiRoadmap.VonNeumannAlgebras`, and exactly one has a section named V4.0.Fields.

## R02 (P3) — The "every corner is a factor" clause is not in the statement of Jones's Theorem 4.4.2

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:809–810`: "(Jones, Theorem 4.4.2, pp. 28–29, whose statement takes every corner `p_j q_i M q_i p_j` to be a factor and so tacitly nonzero)".

**Claim:** The statement of Theorem 4.4.2 (jones-vna lines 856–859, p. 28) is the factor case only: `M` a type `I_n` factor, its type `I_m` subfactors determined by the integer `k > 0` with `pMp` of type `I_k`; it mentions no `p_j`, `q_i` or corner. The clause the README describes is the unnumbered definition of `Λ` after the proof (lines 872–874, p. 29): for each `(i, j)` the corner `p_j q_i M q_i p_j` is taken to be a factor and `p_j q_i N` a subfactor, and `λ_{ij}` is "the integer associated by Theorem 4.4.2". A reader sent to the theorem's statement for the tacit nonzero assumption does not find it there; the theorem's own guard is `k > 0`.

**Witness:** jones-vna line 856 (the statement begins "If `M` is a type `I_n` factor"), line 858 (`k > 0`), lines 872–874 (the corner-is-a-factor clause, in the paragraph beginning "Now we can do the general (non-factor) case").

**Repair:** Replace the parenthetical by "(Jones, Theorem 4.4.2 and the definition of `Λ` that follows its proof, pp. 28–29; that definition takes every corner `p_j q_i M q_i p_j` to be a factor, so tacitly nonzero, while the theorem itself is the factor case with `k > 0`)". Tested on the instance: with this wording the identity-inclusion Check `:831–835` still refutes a definition confined to nonzero corners, and the Source issues entry below names the same paragraph.

## Previous findings

Review of this pull request at f2a0b88 (round 17):

- R01 — not repaired: `roadmaps list` still shows #889 at dee8088 and #1041 as `VonNeumannAlgebras (new)`; #889 at dee8088 carries Layers 0–4, V4.0.Fields and the same namespace, as quoted above. Nothing in this folder can repair it. Written again as R01.
- R02 — repaired: `:807` now reads "`λ_{ij} = 0` when `p_j q_i = 0`, and otherwise `λ_{ij}` is the integer `k` …", and the Check `:831–835` (`ℂ ⊕ ℂ ⊆ ℂ ⊕ ℂ` by the identity, `Λ` the identity matrix, `1 = 1·1 + 0·1`, `Λ² = Λ`, `p₁ e₂ = 0` of rank zero) is the requested negative control; recomputed in the table. The repair's parenthetical introduced the new R02 above.

## Verified sound

**Gate.** The worker's run at 1fcec62: `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. My own run this round (`gate … --base origin/main`) gives the same line with `OK` and exit 0. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty; `git diff f2a0b88 HEAD --stat` is the README only (18 insertions, 11 deletions); the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; the worktree is clean. A grep of the README for process words (so far, to be checked, checkpoint, handoff, packet, optional, deferred, for later, removed, round, pull request, current) finds none; the new sentences are timeless.

**Dependency check** (run this round, verbatim):

```text
depcheck: 234 roadmaps, 2042 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 5. The changed passage adds no `*Needs:*` item and cites no roadmap (V3.2's `*Needs:*` line `:837`, "V3.1; V2.3–V2.4", is unchanged).

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` from the worktree: exit 0 in 13 s, exactly seven `declaration uses sorry` warnings (`:52`, `:62`, `:71`, `:94`, `:106`, `:114`, `:131`), nothing else. A scratch copy with `#check @name` for all eleven declarations elaborated this round with no error; each type equals the one in the worker's signature file and the one the previous review compared with the README (`exists_faithful_representation` with `:217–218`, `bicommutant_eq_iff_isClosed_wot` with `:349–352`, `kaplansky_closure_unitBall` with `:394–399`, the Murray–von Neumann definitions and theorem with `:489–498`, `exists_predual` and `exists_vonNeumannAlgebra_starAlgEquiv` with `:900–908`, the cyclic and separating definitions and the iff with `:1083–1086`); none lost a section binder, and nothing changed. The file is byte-identical to the one the previous review probed, so its one-tactic result (none of the seven closes) and its headline accounting (seven statable headlines stated, four non-statable ones named in the docstring `:17–37`) carry over; the changed README lines name no Lean declaration.

**Sources read this round** (jones-vna, Jones, *Von Neumann algebras*, 2009, through the cache; pdf page equals printed page at the markers of lines 871 and 903). The six locators of the changed passage, none found by heading:

1. V3.2 structure theorem, Jones Theorem 4.4.1, p. 28 (lines 840–845): finite-dimensional `M` on any `H` is `⊕ M_{n_i}(ℂ)` with multiplicity spaces `K_i` and a unitary `u : ⊕ ℓ²(X_i, K_i) → H`, `u* M u = ⊕ B(ℓ²(X_i)) ⊗ 1`, `|X_i| = n_i`, no finiteness of `H` (line 838), as `:801–805`.
2. V3.2 inclusion matrix, Jones Theorem 4.4.2 and the definition of `Λ`, pp. 28–29 (lines 856–874): the factor case with `k > 0` and `mk = n`, then `Λ = (λ_{ij})` with `p_j` minimal central in `M`, `q_i` in `N`, rows indexed by `N` as the README's `λ_{ij}` has them; the corner-is-a-factor clause at lines 872–874 (R02).
3. V3.2 entry formula, Jones Exercise 4.4.3, p. 29 (lines 875–877): `λ_{ij}` is the trace of the matrix `p_j e_i ∈ M_{r_j}(ℂ)` for `e_i` minimal in `q_i N`; `p_j e_i` is a projection (`p_j` is central in `M ⊇ N`), so its trace is its rank, as `:813–814` say.
4. V3.2 worked example, Jones Example 4.4.4, p. 29 (lines 878–887): `M₅(ℂ) ⊕ M₃(ℂ)`, `N` the matrices `diag(X, X, z) ⊕ diag(X, z)`, `Λ = [[2, 1], [1, 1]]`, as `:814–815` and the first Check `:826–827`.
5. V3.2 realisation, Jones Exercise 4.4.5, p. 29 (lines 893–895): an inclusion for any Bratteli diagram with any dimensions of the simple components of `N`, as `:815–816`; this is the target that needs zero entries, now covered by `:807`.
6. V3.2 free module, Jones §4.5, p. 29 (lines 896–902): for type I factors `N ⊆ M` with `k < ∞`, `M` is the `k × k` matrices over `N` and a free left `N`-module of rank `k²`, as `:816–819`.

**Consumers of the changed passage.** No roadmap on main or in an open pull request cites V3.2 by number (`roadmaps grep`). CStarClassification at its open head (`TauCetiRoadmap/CStarClassification/README.md:59–62`, `:172–175`, `:236–244`) consumes the Layer 3 section by title for the classification of unital inclusions and states its own matrix `(h_ji)` with rows indexed by the target (Rørdam's orientation, the transpose of Jones's), with its own realisation criterion and explicit zero rows and columns; it imports the classification, not the orientation, so the two conventions do not collide, and the zero-corner clause is what its zero blocks need. Subfactors at its open head (`:899`) and TemperleyLiebOperatorAlgebras (`:1176`) build inclusion matrices of their own towers without citing V3.2. TypeAHeckeAlgebras on main (`:419`) cites V3 generally. Ownership against open pull requests was checked through `roadmaps list`, `roadmaps grep` and `roadmaps show` on the index of 2026-11-04T22:35:25Z; the only other open pull request carrying this folder or declaring its objects is #889 (R01).

**Computed adversarial pass.** The rows for V3.2 were recomputed this round on the changed definition; the other 39 rows of the previous review's table (`exists_faithful_representation` through V4.0.Fields decomposable operators, review at f2a0b88, round 17) cover statements the diff leaves untouched and carry forward unchanged, each cited to that report.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| V3.2 zero-corner clause and identity Check `:807`, `:831–835` | `ℂ ⊕ ℂ ⊆ ℂ ⊕ ℂ` by the identity | `q₁ = p₁ = (1, 0)`, `q₂ = p₂ = (0, 1)`; `p₁ q₂ = 0`, corner `p₁ q₂ M q₂ p₁ = 0`, not a factor by `:79`; clause gives `λ₂₁ = 0`, `λ₁₂ = 0`; `p₁ q₁ ≠ 0`, `e = p₁`, `e M e = ℂ` type `I₁`, `λ₁₁ = 1 = λ₂₂`; `Λ = I`; `r₁ = 1 = 1·1 + 0·1`, `r₂ = 1 = 0·1 + 1·1`; `Λ·Λ = I = Λ_{N⊆N}`; `e₂ = (0, 1)`, `p₁ e₂ = 0`, rank `0 = λ₂₁`; no zero row or column | retain |
| V3.2 composition and entry formula with genuine zero entries | `ℂ ⊆ ℂ ⊕ ℂ` by `z ↦ (z, z)`, then `ℂ ⊕ ℂ ⊆ M₂(ℂ) ⊕ ℂ` by `(z₁, z₂) ↦ z₁·1₂ ⊕ z₂` | first matrix `[1, 1]`; second: `p₂ q₁ = 0`, `p₁ q₂ = 0`, so `Λ' = [[2, 0], [0, 1]]`; dimension formula `2 = 2·1 + 0·1`, `1 = 0·1 + 1·1`; product `[1, 1]·Λ' = [2, 1]`; direct inclusion `z ↦ z·1₂ ⊕ z` has `e = 1`, `p₁ e` of rank `2`, `p₂ e` of rank `1`: `[2, 1]`, equal; entry formula for `λ₁₂` of `Λ'`: `p₂ e₁ = p₂ q₁ = 0`, rank `0` | retain |
| V3.2 "no zero row and no zero column" with the clause | general `N ⊆ M` | `q_i = Σ_j p_j q_i ≠ 0` forces some `p_j q_i ≠ 0`, where `λ_{ij} ≥ 1` (`k > 0`, Jones line 858); symmetric for columns; on `Λ = I` every row and column has the entry `1` | retain |
| V3.2 rank versus trace in the entry formula | `p_j e_i` for `e_i` minimal in `q_i N` | `p_j` central in `M`, `e_i ∈ N ⊆ M`, so `p_j e_i` is a projection; trace of a projection in `M_{r_j}(ℂ)` equals its rank; Jones's "trace" (line 876) and the README's "rank" (`:813`) agree | retain |
| V3.2 other Checks `:826–830`, `:836–840` | `M₂ ⊕ ℂ ⊆ M₅ ⊕ M₃`; `ℂ ⊕ ℂ ⊆ M₃`; `ℂ ⊆ M₂ ⊆ M₄`; `M₂(ℂ) ⊗ 1`; `B(ℓ²) ⊆ B(ℓ²) ⊗ M₂` | `Λ = [[2, 1], [1, 1]]`, `5 = 4 + 1`, `3 = 2 + 1`; `[[2], [1]]`, `3 = 2 + 1`; `[2][2] = [4]`; `k = 1`, `n₁ = 2`, `K₁ = ℓ²(ℕ)`; rank `2² = 4` on `e_{ij} ⊗ 1`; every corner nonzero, so the clause is never invoked and the values are those of the previous report | retain |
| 39 untouched statements (`exists_faithful_representation`, V0.1–V0.2, `bicommutant_eq_iff_isClosed_wot`, `kaplansky_closure_unitBall`, V1.1–V1.4, V2.1–V2.5, `MurrayVonNeumannEquiv`/`Subequiv`/`_of_subequiv`, V3.1, V3.3, `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv`, V4.Core, V4.PositivePredual, `IsCyclicVector`/`IsSeparatingVector`/the iff, V4.Normality, V4.0.Fields) | as in the review at f2a0b88 (round 17), the 39 rows of its table other than the V3.2 row | the values computed there, unchanged: the diff touches none of these statements and nothing in it cites them | carried |

5 rows recomputed this round, none leading to a finding; 39 carried.

## Not verifiable

- Dixmier, *Von Neumann algebras*, Part II, Chapters 1–2, and Takesaki, *Theory of Operator Algebras I*, Chapter IV §8 (`:1124`, `:1209–1211`): no legal full text is reachable (North-Holland and Springer, not in the cache, no author-page or institutional copy); cited by locator, as the README does; not touched by this change set.
- Ownership against open pull requests was checked on the index of 2026-11-04T22:35:25Z; pull requests outside that index were not searched.

## Source issues

- **Gap** in jones-vna at the definition of the inclusion matrix after the proof of Theorem 4.4.2, printed page 29: `λ_ij` is defined as the integer attached by Theorem 4.4.2 to the subfactor `p_j q_i N` of the factor `p_j q_i M q_i p_j`, which presupposes `p_j q_i ≠ 0`; it should set `λ_ij = 0` when `p_j q_i = 0`, as the trace formula of Exercise 4.4.3 does; affects a stated result (Exercise 4.4.5 realises Bratteli diagrams with absent edges).
