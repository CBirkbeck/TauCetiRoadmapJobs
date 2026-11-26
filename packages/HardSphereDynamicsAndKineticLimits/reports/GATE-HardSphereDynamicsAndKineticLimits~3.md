# GATE-HardSphereDynamicsAndKineticLimits~3: answers to human review

One comment needed an answer: kim-em's follow-up review at head `621c77c`, recommending approval. It makes five checkable points. Each was verified against the README and Lean file at `621c77c`, BGSS2023, main (`1d48986`) and the open roadmap pull requests (index of 2026-11-26T06:10:04Z). All five hold, and none of them asks for an edit. **Neither `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/README.md` nor `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/Suggested.lean` was changed, and there is no commit.**

## H01 (kim-em) — answered

Confirmed: neither the README nor `Suggested.lean` contains the strings `BoltzmannGradLimitAndLanford`, `2467` or any `#NNNN` pull-request number. The proof of Lanford's proposition is left to "a roadmap on the BBGKY and Boltzmann hierarchies and Lanford's proof" in the overview (README line 13), §10.4 (line 893, pointing to Scope), Downstream consumers (line 935) and Scope and ownership (line 954). No roadmap on main or in an open pull request mentions BBGKY or Lanford (a search of all open heads and main finds only this roadmap), so there is no existing owner to name. The pull request that used to be cited (BoltzmannGradLimitAndLanford) is closed (2026-11-20).

## H02 (kim-em) — answered

Confirmed: the second Check of §10.4 (README line 905) says that a proof needs a hypothesis excluding `d = 0`, "such as the standing `d ≥ 2` of BGSS2023 (line 119)". BGSS2023 line 119 is the opening sentence of §1.1, which puts the spheres in the d-dimensional torus with d ≥ 2. The counterexample in the Check was recomputed and holds. In `d = 0`, with `f⁰ = 1` and `μ_ε = Real.toNNReal (ε⁻¹ ^ 0) = 1`, the partition function is `1 + 1 = 2` (𝒟̄_N is empty for N ≥ 2), so `F^ε_1(t) = 1/2`. The unit sphere of `E` is empty, so `Q = 0` and every mild solution is `f(t) = 1`. The first conclusion with `g = 1` would therefore need `1/2 → 1`.

## H03 (kim-em) — answered

Confirmed: the first Downstream bullet (README line 935) lists what the hierarchy roadmap consumes, and each item is a target of this README: the flow §7.1 (line 538), the weak Liouville equation §8.2 (line 651), correlation functions §9.5 (line 787), initial chaos §9.6 (line 811), the collision operator §10.2 (line 852), mild solutions §10.3 (line 873) and the proposition §10.4 (line 891). Of these, `HardSphere.flow`, `HardSphere.weak_liouville`, `HardSphere.correlation`, `HardSphere.collisionOperator`, `HardSphere.IsMildBoltzmannSolution` and `HardSphere.LanfordStatement` are also declared in `Suggested.lean`.

## H04 (kim-em) — answered

Agreed: hard-sphere dynamics on a flat torus is specified in full generality by Layers 1–8 together with §10.1, for every lattice `L` and every real ε. The definitions in `Suggested.lean` carry no hypothesis on `d`, and the dynamical theorems assume `0 < ε < ρ` only where the Diameter convention (README line 26) requires it. One point is deliberately a README target rather than a declaration: the flat-position-space instance on `FlatTorus L`. Its lift, injectivity and local-measure fields are theorems of §1.3, so `Suggested.lean` takes the structure on `UnitFlatTorus d` as an instance argument (README line 21), and §10.4 proves that every such structure gives the same proposition.

## H05 (kim-em) — answered

The prerequisite named in the recommendation is already met. TauCetiRoadmap pull request 2231 (ClassicalErgodicTheory) was merged on 2026-11-25T12:57:22Z (merge commit `06d435b`), which is an ancestor of main `1d48986`. ClassicalErgodicTheory §3.5 on main has items 1 (conull flows), 3 (disjoint unions) and 4 (transport of densities), exactly as `### From TauCetiRoadmap.ClassicalErgodicTheory — §3.5` consumes them (README lines 1007–1013). So this roadmap now depends only on main, and the merge order has no pending entry for it: neither ClassicalErgodicTheory nor any other open roadmap is in the merge order ahead of it.

## Checks run

**Signatures.** All 31 declarations of `Suggested.lean` were elaborated once: temporary `#check @name` lines were appended, the permitted `lake build` was run, and the file was restored byte for byte. Each elaborated type was compared with its README statement.
- Every declaration that uses the cover, short lift or flow (`shortLift`, `contactScatter`, `reversal`, `freeFlow`, `IsTrajectory`, `goodSet`, `flow`, `correlation`, `empirical`, `IsMildBoltzmannSolution` and all ten theorems on a general `X`) carries `[NormedAddCommGroup X] [ProperSpace X] [MeasureSpace X] [BorelSpace X] [FlatPositionSpace d X]`.
- `hardCoreSet` carries only `[NormedAddCommGroup X]`, and `partitionFunction`, `grandCanonicalDensity` and `grandCanonical` carry `[NormedAddCommGroup X] [MeasureSpace X]`. That is exactly the generality README §3.1 and §9.3 state ("uses only the norm", "use only the norm and the measure of `X`").
- `LanfordStatement` and `LanfordStatement.tendsto_empirical` carry `[FlatPositionSpace d (UnitFlatTorus d)]`, and the latter also carries `2 ≤ d`. `boltzmannGrad_scaling` carries `1 ≤ d`.

The 23 "looks dropped" leads in the worker's `signatures.md` are false positives: their elaborated types do contain `[inst_2 : MeasureTheory.MeasureSpace X]` and `[FlatPositionSpace d X]`. Nothing changed.

**Adversarial pass.** No statement was added or changed. The rows below are for the statements the comment relies on.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §10.4 Check: proposition false for `d = 0` | `d = 0`, `f⁰ = 1`, `C₀ = 1`, any β₀ > 0, `g = 1`, `n = 1`, `t = 0` | `μ_ε = 1`; `Z = 1 + 1 = 2`; `F^ε_1 = W⁰_1 = 1/2`; `Q = 0` (empty sphere); `f(t) = 1`; `∫F^ε_1 g = 0.5` against `∫ f g = 1` | holds | none |
| §10.4 Check: `d ≥ 2` locator | BGSS2023 line 119 | spheres of diameter ε > 0 in `T^d` with `d ≥ 2` | matches | none |
| Downstream bullet 1: consumed items are targets | §7.1, §8.2, §9.5, §9.6, §10.2, §10.3, §10.4 | headings at README lines 538, 651, 787, 811, 852, 873, 891 | all present | none |
| ClassicalErgodicTheory §3.5 items 1, 3, 4 | main `1d48986` | items 1, 3, 4 present with the conull-flow, disjoint-union and `withDensity` transport statements | match the contract | none |

**Ownership against open work.** A search of every open roadmap head and of main for `BBGKY` and `Lanford` finds only this roadmap. There is therefore no second owner of the hierarchy proof and no roadmap to cite for it.

**Suspicious text.** None. The comment contains no instruction outside the review.

## Build and gate

`lake build TauCetiRoadmap.HardSphereDynamicsAndKineticLimits.Suggested` at the unchanged head `621c77c` succeeded: "Build completed successfully (18239 jobs)", exit 0, with 11 `declaration uses 'sorry'` warnings, one per theorem.

Gate summary line:

    gate HardSphereDynamicsAndKineticLimits: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable --pr 2448`), with no UPWARD, CYCLE or `moved:` line:

    depcheck: 112 roadmaps, 1287 edges, 0 problem(s)

**For the worker.** The branch's merge base (`2b655a8`) predates ClassicalErgodicTheory reaching main, but the README cites it as it stands on main, where §3.5 resolves. If the pull request description's merge-order paragraph still names pull request 2231 as pending, it can say that ClassicalErgodicTheory is on main.
