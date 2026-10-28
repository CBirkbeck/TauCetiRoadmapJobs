# GATE-RicciFlow~1 — answers to human review

The review covers head `f851900`. The PR branch is now at `67f77a4` plus one repair commit. The review makes two distinct requests. Its "Mathematical and interface checks" and "Verification and limits" sections report audit results and ask for no change, so they are not numbered as findings.

## H01 (roed-math) — applied

The endpoint restriction is in `TauCetiRoadmap/RicciFlow/README.md` R5.4, lines 536–547 (arrived in `67f77a4`, after the reviewed head). The old text was "Use Lemmas 3.4 and 3.5 for ODE invariance and strict inward transversality away from zero on these paths". It now reads: invariance of `D_b` for `0≤b≤1/2`; strict inward transversality at nonzero boundary tensors only for `0<b≤1/2`; Lemma 3.5 gives both properties for `E_u`, every `u≥0`. The `S²×ℝ^(n−2)` counterexample, with `Q(R)=2R`, is recorded there, and so is the fact that strictness at the `D_0` join comes from `A_(b_*)` because `b_*>0`. I checked this against BohmWilking2008 (arXiv v1): Lemma 3.4 (line 363) gives invariance for `b∈[0,1/2]` but transversality only for `b∈(0,1/2]` (lines 369–370), and Lemma 3.5 (lines 429–436) gives transversality for all `s≥0`. I also recomputed the counterexample with the roadmap's own contraction formula (`reactionTensorContraction`, `Suggested.lean` lines 108–114), in n=4 with `r(u,v,z,w)=(u∧v)₁₂(z∧w)₁₂`. All 256 components satisfy `Q=2r`: `Q(e1,e2,e1,e2)=2`, `r(e1,e2,e1,e2)=1`, and `Q(e1,e3,e1,e3)=0`. So the reaction is zero on the supporting null plane, which confirms that `Q(R)` is not interior to the tangent cone of `{R≥0}`.

## H02 (roed-math) — applied differently

The supplier links stay relative and carry no PR numbers or commit-pinned URLs. House style cites a cross-roadmap supplier by roadmap name and section, never by pull-request number, and the gate rejects GitHub blob URLs. So the reviewer's requested PR or immutable links would be wrong here. The commit-pinned VariationalMethods link (line 107) is changed to `[VariationalMethods V1–V6](../VariationalMethods/README.md)`, the same form as the CKG and PDO links; it resolves once that supplier folder lands. The cited sections exist at the supplier's open head: VariationalMethods §V3 (README line 324), §V4 (line 376) and §V5 (line 433).

## Additional repair (form, not raised by the reviewer)

`Suggested.lean` lines 1–4 imported two `Mathlib.<submodule>` files and had no `import Mathlib`, which the gate rejects. The file now starts with `import Mathlib` followed by the two `TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.*` modules. No declaration changed. The six `sorry` warnings are the same declarations as before, with line numbers shifted by −1. No `#check` scratch elaboration was run, because no declaration signature changed and this brief permits only the build command.

## Adversarial pass on the statements touched

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `D_b` invariant, `0≤b≤1/2` | b=0 (`D_0={R≥0}`), b=1/2 | b=0: rank-one `R=proj(e1∧e2)`, `Q(R)=2R` stays on the ray, so invariance holds; source line 369 covers `[0,1/2]` | holds | none |
| `D_b` strictly transversal, `0<b≤1/2` | b=0 excluded; n=4 rank-one R | at b=0, functional `H↦⟨H e13,e13⟩` gives `Q(e1,e3,e1,e3)=0`, so it is not strict; source line 370 restricts to `(0,1/2]` | holds with the stated range | already at head |
| `E_u` invariant and strict, `u≥0` | u=0 (`=D_(1/2)`: `p_0=1−4/(n+2)`, while `p_(1/2)=(n−2)/4/(1+(n−2)/4)=(n−2)/(n+2)=1−4/(n+2)`) | agree; source lines 435–436 state strictness for every `s≥0` | holds | none |
| Join `A_(b_*)∩D_0=A_(b_*)` strict | n=4: `b_*=(sqrt(20)−2)/8≈0.309>0` | `b_*>0`, so Proposition 3.2's strictness applies to `A_(b_*)` | holds | none |
| Import change | elaboration | build passes; the 6 `sorry` warnings are on the same 6 declarations | holds | imports only |

No new construction or citation was added, so the ownership check is unchanged. The roadmap folder has no `sources.toml`, and this brief permits edits only to README and `Suggested.lean`. BohmWilking2008 was fetched from arXiv (math/0606187v1) for verification and is not recorded in a manifest. Its published Annals numbering (Lemma 3.4, p. 1089) matches the reviewer's locator. I did not compare the page numbers with the arXiv copy.

## Build

`lake build TauCetiRoadmap.RicciFlow.Suggested`: Build completed successfully (8992 jobs), with 6 `declaration uses 'sorry'` warnings (lines 52, 58, 119, 128, 150, 159).

## Gate

`gate RicciFlow: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The only remaining item is `depcheck: NOT IN ORDER: RicciFlow (insert it after its last supplier)`. The roadmap is at the design stage and not yet in the merge order, which the brief says is not a defect. Before this commit the gate also reported `blob=1 imports=1 mathlib-subimports=2 no-import-mathlib=1`.

## Direction check

```
NOT IN ORDER: RicciFlow (insert it after its last supplier)
depcheck: 148 roadmaps, 1006 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line.

Commit: `544d4ff5 RicciFlow: review repairs (relative VariationalMethods link; import Mathlib instead of Mathlib submodules)`, not pushed.
