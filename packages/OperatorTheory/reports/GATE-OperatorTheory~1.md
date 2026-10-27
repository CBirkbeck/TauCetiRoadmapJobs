# GATE-OperatorTheory~1: answers to human review

The review was posted against head `5b11d6d`. Both of its corrections are already in the pull-request head `5e40c73` (commit "Clarify normal-part domains and Nelson comparison corner"), so this round makes no edit for either point. The review's "ready for approval" recommendation and its list of substantive checks contain no request, so they are not numbered as findings. This round adds two commits, both outside the review points:
- `9eab1ec` adds the family-index `TauCetiRoadmap/OperatorTheory/Suggested.lean`, which the build target requires and which was missing.
- `27437a1` repairs the dependency cycle that the gate reported against the family README.

## H01 (roed-math) — applied

`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md` line 98 now reads "`(3,3)` is the regular corner of that target square", where it used to say `(2,2)`. The correction is right. All 16 points of the integer grid on `[0,3]²` lie in `M₁=[0,3]²\(1,2)²`, because the open hole contains no integer point. The 12 that are not outer corners are removed, and `(2,2)` is one of them. Of the corners of `(2,3)²`, only `(3,3)` is an outer corner.

Recomputed with the pullback convention `supp e^(tX)u = φ_(−t)(supp u)`, starting from u supported in `(0,1)²`:

| product | support |
| --- | --- |
| `e^X e^Y u` | `(0,1)²` → `(0,1)×(2,3)` → `(2,3)²` |
| `e^Y e^X u` | `(0,1)²` → `(2,3)×(0,1)` → `(2,3)²` |
| `e^(−X)e^(−Y)u` | `(0,1)²` → `(0,1)×(1,2)`, then stays there via `(0,y)~(1,y)` |
| `e^(−Y)e^(−X)u` | `(0,1)²` → `(1,2)×(0,1)`, then stays there via `(x,0)~(x,1)` |

The 32 square corners split 4 + 28, giving cone angles `2π` and `14π`. Then `V−E+F=2−16+8=−6`, and Gauss–Bonnet balances: `(2π−2π)+(2π−14π)=−12π=2π·(−6)`.

## H02 (roed-math) — applied

`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md` lines 71–75 now define `Re N=∫ Re z dP_N` and `Im N=∫ Im z dP_N`, each with its own second-moment domain. They add three obligations:
- `dom N=dom(Re N)∩dom(Im N)`, with recovery `N=Re N+i Im N` on that intersection;
- each part is the closure of `(N+N*)/2` or `(N−N*)/(2i)` on `dom N`, proved with the cutoffs `P_N({|z|≤n})x`;
- the regression case `N=iA`.

Checked:
- **`N=iA`.** `P_N` is the pushforward of `P_A` under `λ↦iλ`, so `Re z=0` `P_N`-a.e. Hence `Re N=0` on all of H and `Im N=A`. The algebraic `(N+N*)/2` is 0 only on `dom A`, which is the reason the closure is needed.
- **Closure direction.** On `dom N` the algebraic part agrees with `∫Re z dP_N`, so it is contained in `Re N`. For x in `dom(Re N)`, dominated convergence gives `x_n→x` and `Re N x_n→Re N x`, so the closure is all of `Re N`.

## Dependency repair (gate finding, not a review point)

`gate --depcheck` on `TauCetiRoadmap/OperatorTheory/README.md` reported `CYCLE among: CStarAlgebras, HilbertModules, OperatorKTheory, OperatorTheory`.

**Cause.** The family table "How they depend on one another" listed the external suppliers of individual children (`CStarAlgebras` C1/C5/C8 and `OperatorKTheory` K4 for `ToeplitzOperators`; `OneParameterSemigroups` and `BanachSpaceTheory` for `SelfAdjointSpectralTheory`) as prerequisites of the whole family. CStarAlgebras, HilbertModules and OperatorKTheory in turn consume OperatorTheory: they consume Hilbert-space geometry and `SelfAdjointSpectralTheory`.

**Change** (`TauCetiRoadmap/OperatorTheory/README.md` lines 74–92):
- The column header changes from "direct roadmap prerequisites" to "direct prerequisites within the family".
- The `SelfAdjointSpectralTheory` row becomes `OrthogonalGeometry`, and the `ToeplitzOperators` row becomes "none (Mathlib and Tau Ceti)".
- A new paragraph says that each child's external suppliers are fixed in that child's own supplier contracts and are not prerequisites of the family as a whole.

**What is kept.** No information is lost. The `SelfAdjointSpectralTheory` external inputs stay in the "Dependency-minimal material" paragraph. The Toeplitz inputs stay in the ownership paragraph (CStarAlgebras C8, OperatorKTheory K4) and in `ToeplitzOperators/README.md` lines 24–27. A grep of every child README confirms that only `ToeplitzOperators` names CStarAlgebras or OperatorKTheory.

**Residual defect, outside the files this job may edit.** At child level, `OperatorKTheory` (its index-pairing section, the `⟨[z],[2P_Hardy−1]⟩=−1` identity) consumes "ToeplitzOperators T1's projection onto nonnegative Fourier modes", while `ToeplitzOperators` consumes OperatorKTheory K4. That is a roadmap-level two-way relation between ToeplitzOperators and OperatorKTheory. It needs an ownership move in one of those two READMEs, for example OperatorKTheory defining the Hardy projection it pairs against. The depcheck does not see it, because `ToeplitzOperators` is not a node of its own in the graph.

## Suggested.lean

`TauCetiRoadmap/OperatorTheory/Suggested.lean` (restored from the earlier attempt) contains:
- `import Mathlib`;
- one module docstring, which says that the family README is an index owning no target and that every headline theorem is stated in its child's `Suggested.lean`;
- an empty `namespace TauCetiRoadmap.OperatorTheory`.

It declares nothing, so:
- there were no declarations to compare by `#check @name`;
- the adversarial pass has no statement to test;
- the README names no backticked declaration of the index.

The README edit changes dependency bookkeeping only and adds no mathematical statement. Ownership against open pull requests: this round adds no construction or statement, so there was nothing to check.

## Notes

- The family index lists neither `UnboundedOperators` (the child this pull request adds) in "The roadmaps" nor its row in the dependency table. No reviewer raised this, and it is left unchanged to keep the scope.
- The reviewed text contains no instructions beyond its mathematical requests.

## Build

`lake build TauCetiRoadmap.OperatorTheory.Suggested`: `Build completed successfully (8976 jobs).`

## Gate

`gate … OperatorTheory --base origin/main` at `27437a1`:

    gate OperatorTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK

## Depcheck

`gate --depcheck TauCetiRoadmap/OperatorTheory/README.md --name OperatorTheory --order … --movable`:

    depcheck: 148 roadmaps, 1002 edges, 0 problem(s)
