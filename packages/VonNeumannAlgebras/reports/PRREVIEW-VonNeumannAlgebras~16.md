# Review of VonNeumannAlgebras (pull request #1041 at f2a0b88)

**Verdict:** needs changes

Incremental re-review of the 10 lines of `TauCetiRoadmap/VonNeumannAlgebras/README.md` changed since 95571ab: in V2.5's classification paragraph the compact set carrying the nonatomic measure is renamed from `K` to `X`, and `K` is kept for the countable atom set. `Suggested.lean` is unchanged. The one P3 of the previous review is repaired, and the repair is consistent across the section and with the sources. The one blocking finding is unchanged because it cannot be repaired inside this folder: the same author's pull request #889, still open at dee8088, still builds this folder's Layers 0–4, V4.0.Fields and the same Lean namespace.

## R01 (P2) — Two open pull requests still build the same folder and the same objects

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:43` (`namespace TauCetiRoadmap.VonNeumannAlgebras`) and its seven theorems and four definitions; README Layers V0–V4 and V4.0.Fields.

**Claim:** `roadmaps list` (index of 2026-11-04T00:06:15Z) shows `#889 VonNeumannAlgebras (new) dee8088` and `#1041 VonNeumannAlgebras (new) f2a0b88`, both by the same author. At dee8088, #889's README carries `## Layer 0` through `## Layer 4` (`:276`, `:393`, `:524`, `:906`, `:971`) with this folder's titles and `**V4.0.Fields — Hilbert and operator fields.**` (`:1182`), then Layers 5–13 (`:1340`–`:3689`); its `Suggested.lean` opens `namespace TauCetiRoadmap.VonNeumannAlgebras` (`:61`) and declares the same objects under other names: `exists_injective_nondegenerate_representation_lp` (`:72`), `double_commutant_iff_isClosed_image_ofCLM` (`:83`), `closure_unitBall_eq_unitBall_double_centralizer` (`:92`), `IsCyclic`/`IsSeparating`/`isCyclic_iff_isSeparating_commutant` (`:111–120`), `ProjectionEquivalent`/`ProjectionSubequivalent`/`equivalent_of_subequivalent` (`:128–140`). The pull request's description at this head still says the complete programme is retained in #889 and that this branch is its historical staged snapshot. Re-raised: R01 of the reviews at 95571ab (round 15), d9e53b3 (rounds 13 and 14), b35ea83 and 8b00f8a.

**Witness:** `roadmaps show VonNeumannAlgebras --pr 889 --file Suggested.lean` lines above; `roadmaps show VonNeumannAlgebras --pr 889` `:276–3689`.

**Repair:** One owner per object. Either #889 is cut down to a `VonNeumannAlgebrasPartII` folder starting at its Layer 5, citing V0–V4 and V4.0.Fields of this folder by section (its Layers 0–4 deleted, main's consumers of V5+ repointed to the Part II), or this pull request is closed. Control: exactly one open pull request declares a bicommutant theorem on `StarSubalgebra ℂ (H →L[ℂ] H)` in `namespace TauCetiRoadmap.VonNeumannAlgebras`, and exactly one has a section named V4.0.Fields.

## Previous findings

Review of this pull request at 95571ab (round 15):

- R01 — not repaired: `roadmaps list` still shows #889 at dee8088 and #1041 as `VonNeumannAlgebras (new)`; #889 at dee8088 carries Layers 0–4, V4.0.Fields and the same namespace, as quoted above. Nothing in this folder can repair it. Written again as R01.
- R02 — repaired: `:719–722` now reads "a nonzero nonatomic finite Borel measure `μ` on a compact `X ⊆ ℝ` (so `μ(X) > 0`) … `θ(t) = μ(X ∩ (−∞, t])/μ(X)` … `L∞([0,1], λ) → L∞(X, μ)`", and the negative-control Check `:736–737` reads "`μ = 0` on `X = [0, 1]` … `L∞(X, 0) = 0`". Every remaining `K` in the paragraph and its Checks (`:724`, `:732–735`, `:740`) is the countable atom set, which is how Peterson's Theorem 2.8.9 uses the letter (peterson-notes lines 1532, 1539–1541). `X` is already the section's letter for the measure space (`:628`, "a σ-finite measure space `(X, μ)`"; Check `:693`, "`X = {1, 2}` with counting measure"), so the rename introduces no second clash. The repair introduced no new problem.

## Verified sound

**Gate** (run this round at f2a0b88, verbatim): `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate at the same head also reports `build=0 OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only; the worktree is clean.

**Dependency check** (verbatim, run this round):

```text
depcheck: 204 roadmaps, 1660 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The diff adds no `*Needs:*` item and cites no new roadmap or declaration: V2.5's `*Needs:*` (`:742–743`) is unchanged (V1.3–V1.4, V2.1–V2.2, SelfAdjointSpectralTheory SA-B05–SA-B13, SA-B30, SA-B46, SA-B49, SA-B53, Mathlib `MeasureTheory.Lp`), all resolved on main by the review at d9e53b3 and all earlier in the supply direction. The worker's citation check found no cross-roadmap citation or Lean name of the README unresolved.

**Lean.** `Suggested.lean` has no changed line since d9e53b3. `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`, run this round from the worktree: exit 0, exactly seven `declaration uses sorry` warnings (`:52`, `:62`, `:71`, `:94`, `:106`, `:114`, `:131`), nothing else. The worker's elaborated signatures (eleven declarations, none with a dropped binder) are identical to the previous two rounds' and were compared again with the README statements of `exists_faithful_representation` (`:218`), `bicommutant_eq_iff_isClosed_wot` (`:352`), `kaplansky_closure_unitBall` (`:399`), `MurrayVonNeumannEquiv`/`MurrayVonNeumannSubequiv`/`murrayVonNeumannEquiv_of_subequiv` (`:490–498`), `exists_predual` (`:882`), `exists_vonNeumannAlgebra_starAlgEquiv` (`:889`), `IsCyclicVector`/`IsSeparatingVector`/`isCyclicVector_iff_isSeparatingVector_commutant` (`:1065–1067`): the generality agrees. The diff touches no Lean statement and no README passage that a Lean statement depends on (the classification of abelian algebras is a README-only target; the module docstring `:21–24` names it among the headlines not statable, lacking the bounded Borel calculus and spectral projection-valued measure of a normal operator and an algebra structure on `MeasureTheory.Lp ℂ ∞ μ`). The headline list, the not-statable headlines named in the docstring and the one-tactic padding probe are those of the review at d9e53b3 (round 14): nothing in the file changed, so the probe result (none of the seven theorems closes in one tactic, none restates a definition or a Check) carries over.

**Sources opened this round** (through the cache; pdf page equals printed page): peterson-notes (Peterson, *Notes on von Neumann algebras*, 2013) Theorem 2.8.9, pp. 38–39, lines 1531–1557: a separable abelian von Neumann algebra is `ℓ∞K` or `L∞([0,1], λ) ⊕ ℓ∞K` for a countable, possibly empty `K`, which the proof defines as the set of spectral atoms of the single generator (line 1539); the nonatomic part is handled by a `θ` on `[0, 1]` built from a full-support nonatomic probability measure. The README's `X` is the compact carrying the measure and its `K` is Peterson's `K`. jones-vna (Jones, *Von Neumann algebras*, 2009) p. 23, lines 713–726: EP10 (the single generator) and the abstract classification as `ℓ∞({0, …, n})`, `L∞([0,1], dx)` or their direct sum, without a letter for the atom set. The seeded sample's fifteen targets were verified by the review at d9e53b3 at the same locators; none of them falls in the changed lines except the two above.

**Ownership.** `roadmaps list` (index of 2026-11-04T00:06:15Z, 440 open pull requests): #889 at dee8088 is the only other open pull request carrying this folder or declaring its objects (R01); its head is the one the previous three reviews read, so their ownership grep stands.

**Computed adversarial pass.** Rows computed this round on the changed statement and every Check that uses the renamed letters; the rows for the untouched statements are those of the review at 95571ab (round 15, 9 rows on V2.5's single generator, weight condition, `θ`, and case split), the review at d9e53b3 (round 14, 35 rows) and the round-13 table at the same head (35 rows), cited and not repeated.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `θ(t) = μ(X ∩ (−∞, t])/μ(X)` on a compact `X ⊆ ℝ`, `μ ≠ 0` nonatomic finite | `X = [0, 2]`, `μ = λ`; `X = [0, 1] ∪ [2, 3]`, `μ = λ` | `μ(X) = 2`, `θ(t) = t/2`, `θ_*(λ/2) = λ` on `[0, 1]`, `K = ∅`; `μ(X) = 2`, `θ(t) = t/2` on `[0, 1]`, constant `1/2` on the gap, `(t − 1)/2` on `[2, 3]`: one degenerate fibre `[1, 2] ∩ X = {1, 2}`, `μ`-null, `θ_*(μ/2) = λ`, `L∞(X, λ) ≅ L∞([0,1], λ)`; the letter `X` names the compact in every occurrence (`:719–722`, `:736–737`) | retain |
| Atom set `K` after the rename | diagonal `ℂ³`; `λ` on `[0, 1]`; `L∞([0,1], λ) ⊕ ℂ`; zero algebra; `(δ₀ + λ)/2` | `K = {0, 1, 2}`, algebra `ℓ∞(K)`; `P_a({t}) = 1_{{t}} = 0` for every `t`, `K = ∅`; one atom, `K` a point; `H = 0`, `σ(a) = ∅`, `K = ∅`, `ℓ∞(∅) = 0`; `P_a({0}) = (δ₀-part) ≠ 0`, `P_a({t}) = 0` for `t > 0`, `K = {0}`; in each Check (`:732–735`, `:740`) `K` is the atom set, matching peterson-notes line 1539 | retain |
| Negative control `μ = 0` on `X = [0, 1]` | `μ = 0` | nonatomic (no `t` with `μ({t}) > 0`), finite, `μ(X) = 0`, `θ = 0/0` undefined; `L∞(X, 0)` is the zero algebra (every function is null), `L∞([0,1], λ) ≠ 0` (contains `1 ≠ 0`); no isomorphism; the classification gives `ℓ∞(∅)` through the atomic part since `H = 0` | retain |
| No clash of `X` within V2.5 | `:628` `(X, μ)` σ-finite; `:693` `X = {1, 2}`; `:719` `X ⊆ ℝ` compact | all three are the measure space carrying `L∞`; the compact `X ⊆ ℝ` of the classification is the case `X = σ(a)` of the section's opening letter; `X` is not used for anything else in `:626–745` (grep of every code span containing `X` or `K`: 11 occurrences of `X`, all the measure space; 8 of `K`, all the atom set) | retain |

4 rows computed this round, none false, none leading to a finding. The R01 object comparison (namespace and declarations of #889 at dee8088) was re-read this round at the lines quoted.

## Not verifiable

- Dixmier, *Von Neumann algebras*, Part II, Chapters 1–2, and Takesaki, *Theory of Operator Algebras I*, Chapter IV §8 (`:1099`, `:1184–1186`): no legal full text is reachable (North-Holland and Springer, not in the cache); cited by locator, as the README does. Not touched by the diff.
- Ownership against open pull requests was checked through `roadmaps list` and `roadmaps show` on the index of 2026-11-04T00:06:15Z and the previous reviews' grep over the sibling checkouts; pull requests outside that index were not searched.

## Source issues

- none
