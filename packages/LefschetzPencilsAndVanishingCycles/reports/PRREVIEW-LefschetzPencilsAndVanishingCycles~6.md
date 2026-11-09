# Review of LefschetzPencilsAndVanishingCycles (pull request #873 at 306b5f0)

**Verdict:** accepted

This is an incremental re-review of the 129 README lines changed since `2c2c5ec` (87 insertions, 42 deletions, all in `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md`). The one finding of the previous review is repaired at every location it named, the repair introduced no new problem, the gate passes, and no finding remains. The roadmap folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: lines 170–182 add the Tau Ceti bullets for `IsNilpotent.log` (with `log_eq_sum`, `isNilpotent_log`, `exp_log`, `log_exp`), `Module.End.ker_pow_log`, `Module.End.jordanPartition_log` and `IsNilpotent.normedSpace_exp_eq_exp`; lines 135 and 165 name the manifest pins `1b1ccf4b…` and `2fd255d9…`; 1.6's *Needs:* (lines 1261–1263) reads “Tau Ceti `LinearMap.GeneralLinearGroup.IsUnipotent`, `IsNilpotent.log`, `Module.End.ker_pow_log`, `Module.End.jordanPartition_log`”; 5.7's *Needs:* (lines 3028–3031) and the LPV.5 Dependencies (lines 3294–3296) cite the Tau Ceti names; the contract bullet (lines 267–269) is narrowed to “the continuous `ℤ_ℓ` interpolation … in 1.2”; the scope sentence (49–52), the LPV.1 introduction (953–955) and the LPV.1 Dependencies (1469–1477) match.

## Verified sound

**Scope.**
- The whole diff since `2c2c5ec` was read. `git diff 2c2c5ec HEAD --stat` over the whole tree lists only `README.md`: `Suggested.lean`, `metadata.toml` and `lake-manifest.json` are unchanged.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/LefschetzPencilsAndVanishingCycles'` is empty.
- The added lines contain no process word, pull-request number, LaTeX delimiter, copied passage or algorithm. The two commit hashes in the contract headings are the pins of `lake-manifest.json` (lines 10 and 22), checked by `git rev-parse HEAD` in both package checkouts.
- `overlaps.md` lists no open pull request that changes this roadmap, no dropped id this README cites and no id this pull request drops.

**Gate.** The worker's gate at this head prints `OK` with every scanner at `0`, including `build=0`, `depcheck=0`, `outside-folder=0` and `stray-files=0`. An independent run from the worktree printed the same `OK` line with every scanner at `0`. The independent dependency check printed:

```text
depcheck: 236 roadmaps, 2278 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. In the merge order SmoothRepresentationsOfLocalGroups is line 25, EtaleCohomologyFoundations 42, AdelicAlgebraicGroups 52, ArithmeticGaloisRepresentations 58, NeronModelsAndSemistableAbelianVarieties 66, this roadmap 68. StableReduction is on main.

**Lean, at the pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.**
- `lake env lean` on `Suggested.lean` gives exactly five warnings, all `declaration uses 'sorry'` (lines 53, 85, 98, 114 and 135), and nothing else.
- `Suggested.lean` is byte-identical to the file the previous two reviews elaborated with `#check @` for all six declarations and probed with one tactic each; `signatures.md` for this head lists the same six elaborated types, none with a dropped binder. The headline list, the module docstring and the imports (`import Mathlib`, `import TauCeti.LinearAlgebra.GeneralLinearGroup.Unipotent`) are unchanged, so nothing in that file is re-reported.
- A scratch probe (`Probe57.lean`, importing `TauCeti.Analysis.Normed.Algebra.NilpotentExponential`, built first with `lake build` of that module, `TauCeti.LinearAlgebra.End.Exponential`, `TauCeti.RingTheory.Nilpotent.Exp` and `TauCeti.AlgebraicGeometry.Curves.DualGraph.Basic`) elaborates with no error or warning. On `A = Matrix (Fin n) (Fin n) ℚ_[ℓ]` it checks every step 5.7 now cites: `NormedSpace.exp (a • N) = exp (a • N)` for nilpotent `N` and `a : ℚ_[ℓ]` by `normedSpace_exp_eq_exp (hN.smul a)` (so `A` is a topological ℚ-algebra as the lemma needs); `TauCeti.exp_smul_eq_sum_smul_dividedPower hk a` with the scalar `a : ℚ_[ℓ]` (the `DistribMulAction`, `IsScalarTower` and `SMulCommClass` instances synthesize); the value of `TauCeti.expSMulHom ℤ hN` at `ofAdd 1` is `exp N` by `simp`; `isNilpotent_log hu` and `exp_log hu` for unipotent `h`; `PadicInt.denseRange_intCast`. It also proves the junk value `log (2 : ℚ) = 0` of 1.6's and 5.7's new Checks, the equivalence `(log T)^k = 0 ↔ (T − 1)^k = 0` of 1.6 by one rewrite with `Module.End.ker_pow_log`, and `G.firstBetti + #Vertex = #Edge + 1` for `G : TauCeti.DualGraph Empty` (the natural-number subtraction in `firstBetti` is not truncated).

**Library declarations opened at the pins (file and line).**
- Mathlib `Mathlib/RingTheory/Nilpotent/Exp.lean:51`: `IsNilpotent.exp` on `[Ring A] [Module ℚ A]`.
- Mathlib `Mathlib/NumberTheory/Padics/RingHoms.lean:513`: `PadicInt.denseRange_intCast : DenseRange (Int.cast : ℤ → ℤ_[p])`.
- Mathlib `Mathlib/Analysis/Normed/Algebra/Exponential.lean:128`: `NormedSpace.exp (x : 𝔸) : 𝔸`, with `exp_eq_tsum_rat` at `:169` for `[Algebra ℚ 𝔸]`; the pinned `exp` takes no field argument, as 5.7 writes it.
- Tau Ceti `TauCeti/RingTheory/Nilpotent/Log.lean`: `:48` `log`, defined as the sum over `range (nilpotencyClass (a − 1))` of `((−1)^(i+1)/i) • (a − 1)^i`, with the docstring stating the junk value `0`; `:57` `log_eq_sum` for any `n` with `(a − 1)^n = 0` (independence of the bound); `:84` `isNilpotent_log`; `:184` `log_exp`; `:189` `exp_log`. Context `[Ring A] [Module ℚ A]`, which the README's “ℚ-algebra” satisfies.
- Tau Ceti `TauCeti/LinearAlgebra/End/Exponential.lean`: `:70` `ker_pow_log` on `[Semiring R] [AddCommGroup V] [Module R V] [Module ℚ V]`, no finite dimension; `:95` `jordanPartition_log` under `[Field K] [FiniteDimensional K V]`. These are exactly the two generalities the contract bullet (lines 176–178) states.
- Tau Ceti `TauCeti/RingTheory/Nilpotent/Exp.lean`: `:176` `exp_smul_eq_sum_smul_dividedPower` (`exp (r • x) = Σ_{i<k} r^i • x^{(i)}` for `x^k = 0`, scalars a monoid acting compatibly); `:249` `expSMulHom R hx : Multiplicative R →* Aˣ` for `[CommRing R] [Algebra R A]`, with `:272` `expSMulHom_ofAdd_one` and `:296` `expSMulHom_ofAdd_natCast` (`h^m` at parameter `m`). The contract bullet (lines 169–172) states both correctly.
- Tau Ceti `TauCeti/Analysis/Normed/Algebra/NilpotentExponential.lean:85`: `normedSpace_exp_eq_exp` on `[Ring A] [Algebra ℚ A] [TopologicalSpace A] [IsTopologicalRing A]`.
- Tau Ceti `TauCeti/AlgebraicGeometry/Curves/DualGraph/Basic.lean:101–125`: `structure DualGraph (ι)` with `Vertex` (`Fintype`, `DecidableEq`, `Nonempty`), `Edge` (`Fintype`, `DecidableEq`), `endpoint : Edge → Fin 2 → Vertex`, `genus`, `marking : ι → Vertex`, `connected`; `:312` `firstBetti := #Edge + 1 − #Vertex`; `:319` `firstBetti_add_card_vertex`. The module docstring (lines 94–100) describes the dual graph of a proper nodal curve over an algebraically closed field, vertices the components of the normalization, edges the nodes. The contract bullet (lines 193–196) matches field by field; `Cycle.lean:39` builds `cycle r : DualGraph Empty`, so “without markings” is `ι = Empty`.
- Tau Ceti has no boundary map or cycle lattice on `DualGraph` (`Cycle.lean` is the cycle-of-rational-curves example; `Forget.lean` is reindexing of markings), so 7a.1's unchanged citation of NeronModelsAndSemistableAbelianVarieties §4.2 for `DualGraph.boundary` and `DualGraph.cycleLattice` is still the right owner.

**Cross-roadmap citations of the changed passages, resolved at the heads.**
- SmoothRepresentationsOfLocalGroups at its open head, SR.5.2 (heading at its README line 3841), item *nilpotent-exp-log* (lines 4516–4540): the last API bullet (lines 4536–4540) states, for a complete normed extension `E/ℚ_ℓ`, a finite-dimensional `E`-space `V` with its module topology and a continuous homomorphism `h : ℤ_ℓ → GL_E(V)` with `h(1)` unipotent, `h(x) = exp(x log h(1))` for every `x ∈ ℤ_ℓ`, by integer powers, density and continuity. The contract bullet at lines 267–269 and the 1.2 *Needs:* restate exactly this, and nothing else of SR.5.2.
- ArithmeticGaloisRepresentations at its open head, §2.4 (line 1979): lines 1981–1983 and 1997–1998 say its exp/log is Mathlib's `IsNilpotent.exp` and the calculus supplied by SR.5.2 *nilpotent-exp-log*. 1.2's sentence “These are the same finite sums as the exp/log of SR.5.2 that ArithmeticGaloisRepresentations Layer 2, §2.4 uses” is accurate.
- StableReduction on main (`3090489`), Layer 1 (its README lines 372–404): the fourth bullet builds the finite, nonempty, connected dual graph of a proper geometric nodal curve, vertices the components of the normalization, edges the nodes, loops allowed, with component genera, flags and `pₐ = Σ g_v + b₁`; the third bullet splits and labels every node and branch. That is the data of `TauCeti.DualGraph` with the branch labels as `endpoint e 0`, `endpoint e 1`. The former citation `TauCetiRoadmap.StableReduction.DualGraph`, a Lean name that exists neither in StableReduction's `Suggested.lean` nor anywhere on main, is gone.
- NeronModelsAndSemistableAbelianVarieties at its open head, §4.2 (line 2204): “Let `V` and `E` be finite types and `src, tgt : E → V` … For StableReduction Layer 1's dual graph, these are `endpoint e 0` and `endpoint e 1`”; `DualGraph.boundary src tgt = Finsupp.linearCombination ℤ (e ↦ δ_tgt(e) − δ_src(e))` (line 2221). With 7a.1's `tail e = endpoint e 0`, `head e = endpoint e 1` and `(da)(e) = a(tail e) − a(head e)`, the unchanged sentence `∂ᵗ = −d` holds: on the edge `0 → 1`, `d = [1, −1]` and `∂ = [−1, 1]`.
- AdelicAlgebraicGroups §4.2 is cited by 5.7 unchanged; its closed-subgroup item was resolved in the previous review and the diff does not touch that citation.

**Ownership.**
- *Dual-graph carrier.* Tau Ceti owns it at the pin. Among the 457 open pull requests, `roadmaps grep 'TauCeti\.DualGraph'` finds it cited only by this roadmap. NeronModelsAndSemistableAbelianVarieties at its head (line 2298) still writes “StableReduction Layer 1 (`DualGraph`, `firstBetti`)” for the same objects; that citation is that roadmap's to update, and it agrees with this one on every convention (ordered endpoints, loops kept, `firstBetti`). No open pull request revises StableReduction itself (`roadmaps list` shows only StableReductionPartII, which defers dual graphs to StableReduction Layer 1 at its line 11).
- *Finite logarithm.* Tau Ceti owns it; this roadmap now cites it, as ReductiveGroups and SmoothRepresentationsOfLocalGroups do.
- *Closed subgroups of ℓ-adic Lie groups.* AdelicAlgebraicGroups §4.2, unchanged.

**Sources.** Of the fifteen seeded targets, 1.2 and 1.6 fall in the changed passages.
- 1.2 (Illusie 1994, 1.5 and (1.5.1)–(1.5.4), pp. 12–13): Illusie1994 lines 142–169, cache pages 5–6 (the printed folio `12` is at line 151, page 6 is headed `EXPOSÉ I`, so these are printed pp. 12–13). Line 142 defines `N : V(1) → V` for a quasi-unipotent `ρ` by `ρ(g) = exp(N t_ℓ(g))` on an open `I₁` (1.5.2); lines 148–158 give the existence argument the README's proof sketch follows (kernel of `t_ℓ` profinite of order prime to `ℓ`, image finite and unipotent, hence trivial; `ρ|_{I₁}` factors through `t_ℓ(I₁)`); line 163 is the Galois equivariance (1.5.3) with the cyclotomic character, and lines 165–169 give `NF = qFN` for a lift of geometric Frobenius (1.5.4). Weil II, 1.6.14 and 1.7.2, pp. 169–172: WeilII lines 1287–1316 (1.6.14, printed pp. 169–170) and 1334–1345 (1.7.2 with (1.7.2.1)–(1.7.2.2), printed pp. 170–171): `ρ(σ) = exp(N t_ℓ(σ))` on a finite-index subgroup where `ρ` is unipotent, `N : V(1) → V` nilpotent, named the logarithm of the unipotent part of the local monodromy. Both support 1.2 as written; the `ℤ_ℓ`-linearity step the README attributes to SR.5.2 is the “clair” uniqueness/existence step of both sources made explicit.
- 1.6 (Qian 2023, Definition 3.6, PDF p. 21): the locator is unchanged and was checked in the previous review at Qian2023 lines 813–815; the changed text is the proof sketch and two Checks, whose values are computed in the table below.
- The other thirteen sampled targets are untouched since the reviews that verified them; their rows are carried below.

**Remarks (untouched or supplier text; no change requested).**
- StableReduction on main predates Tau Ceti's carrier and names no Lean type for its dual graph. This roadmap's contract (lines 223–226) identifies that graph with `TauCeti.DualGraph` without markings; the identification is faithful to StableReduction's data and is the convention NeronModelsAndSemistableAbelianVarieties §4.2 also uses.
- The 5.7 Check “`h = −1` is not unipotent” presumes `V ≠ 0`; on the zero space `−1 = 1`. The lemma's nondegenerate form does not exclude `V = 0`, but every Check of 5.7 is on a nonzero space and 5.8 excludes `V = 0` explicitly.
- The eight backticked Lean names `citations.md` lists as found nowhere at the pins (`ClassicalDerived.*`, `GaloisRep.grothendieck_quasiUnipotent`, `WeilDeligneRep.monodromyFiltration`, `ProjectiveBundles.IsRelativelyVeryAmple.completeMap`, `ClassicalAlgebraic.finiteTrace`) are other roadmaps' declarations cited by name in untouched contract text, not this roadmap's own; the cross-roadmap citations themselves all resolve.

**Adversarial table.** The first table has a row for every statement the diff changes, with values computed at this head. The second carries forward the rows of the review of `2c2c5ec` (r5) for statements the diff leaves untouched; rows marked `(r5)` were computed there, `(r4)` in the review of `f8c8b5b` and carried by r5, `(r2)` in the review of `dbf5ba2` and carried since. Notation: `J₂(e₁) = e₀`, `J₃(e₂) = e₁`, `J₃(e₁) = e₀`.

| Statement (changed at this head) | Instances and values computed on each side | Result |
|---|---|---|
| Contract headings: pins | `lake-manifest.json` lines 10 and 22: Tau Ceti `2fd255d9…`, Mathlib `1b1ccf4b…`; `git rev-parse HEAD` in both package checkouts gives the same; README lines 135 and 165 name them. The previous `a91d3aaf` had none of the cited Tau Ceti files. | Pass |
| Contract: `IsNilpotent.log` bullet | `T = 1 + J₂`: `log_eq_sum` with `n = 2` gives `J₂`, with `n = 3` gives `J₂ − J₂²/2 = J₂` (independent of the bound). `T = 1 + J₃`: `J₃ − J₃²/2`; `exp(log T) = 1 + (J₃ − J₃²/2) + J₃²/2 = T` (`exp_log`); `log(exp J₃) = J₃` (`log_exp`). Junk: `log (2 : ℚ) = 0`, proved in the probe (`nilpotencyClass 1 = 0`, empty sum). `ker_pow_log` needs only `Module ℚ V`; `jordanPartition_log` needs `[Field K] [FiniteDimensional K V]`, as the bullet says. | Pass |
| Contract: `expSMulHom`, `exp_smul_eq_sum_smul_dividedPower` | `N = J₂`, `k = 2`: `exp(aJ₂) = 1 + aJ₂`, a polynomial of degree `1` in `a`; `a = 2`: `[[1,2],[0,1]] = (1 + J₂)²`, the value of `expSMulHom ℤ` at `ofAdd 2` (`expSMulHom_ofAdd_natCast`). `N = J₃`: `exp(aJ₃) = 1 + aJ₃ + a²J₃²/2`, degree `2`. `a = 0`: `exp 0 = 1` (`map_one`). Probe: both lemmas elaborate on `Matrix (Fin n) (Fin n) ℚ_[ℓ]` with `a : ℚ_[ℓ]`. | Pass |
| Contract: `normedSpace_exp_eq_exp` | `N = J₂` over `ℚ_ℓ`: `Σ_{i≥0} J₂^i/i! = 1 + J₂`, the terms `i ≥ 2` vanish, equal to `IsNilpotent.exp J₂`. `N = 0`: both sides `1`. Non-nilpotent `N = 1`: the series is `e·1`, the finite `exp 1` is the empty sum `0` (`nilpotencyClass 1 = 0`), so the hypothesis `IsNilpotent a` is needed and the README applies it only to `aN` with `N` nilpotent. Context `[Algebra ℚ A] [TopologicalSpace A] [IsTopologicalRing A]`, satisfied by matrices over `ℚ_ℓ` (probe). | Pass |
| Contract: `TauCeti.DualGraph`, `firstBetti` | One vertex, one loop: `#E + 1 − #V = 1`, `H¹` of a loop has rank `1`; two vertices, one edge: `0`; two vertices, three edges: `2`. One vertex, no edge: `0 + 1 − 1 = 0`, no truncation (`firstBetti_add_card_vertex`, probe). Wrong model `#E − #V` would give `0, −1, 1`, truncated to `0, 0, 1` in `ℕ`. Fields read at `Basic.lean:101–125`; `connected` is the reflexive-transitive closure of adjacency; `Nonempty Vertex` excludes the empty graph, as “nonempty” says. | Pass |
| Contract: StableReduction Layer 1 | StableReduction main lines 395–399: finite, nonempty, connected dual graph, vertices the components of the normalization, edges the nodes, loops allowed, genera and flags, `pₐ = Σ g_v + b₁`; lines 391–394 label every node and branch, which orders the two ends. NeronModels §4.2 line 2207–2208 uses `endpoint e 0`, `endpoint e 1` for the same graph. Tail/head convention agrees with 7a.1. | Pass |
| Contract: SR.5.2 interpolation bullet | SR head lines 4536–4540: `E/ℚ_ℓ` complete normed, `V` finite-dimensional, `h : ℤ_ℓ → GL_E(V)` continuous additive homomorphism with `h(1)` unipotent, `h(x) = exp(x log h(1))`. Instance `h(x) = [[1,x],[0,1]]`: `log h(1) = J₂`, `exp(xJ₂) = h(x)` ✓. Non-instance: `h(1) = 2` on `ℚ_ℓ¹` is not unipotent and `x ↦ 2^x` is not even defined on `ℤ_ℓ`; the bullet's hypothesis excludes it. README lines 267–269 restate the bullet with all four hypotheses. | Pass |
| 1.2 statement and proof sketch | `V = ℚ_ℓ²`, `ρ(σ) = [[1, t_ℓ(σ)],[0,1]]`: `N = J₂` is the unique nilpotent with `ρ(σ) = exp(t_ℓ(σ)N)`; uniqueness from `log_exp`: `log ρ(σ₀) = t_ℓ(σ₀)N` for a `σ₀` with `t_ℓ(σ₀)` a generator. Factoring: `t_ℓ(I₁)` is an open subgroup `ℓ^kℤ_ℓ(1) ≅ ℤ_ℓ`, and `h(x) := ρ(σ)` for `t_ℓ(σ) = xℓ^k` is a continuous homomorphism `ℤ_ℓ → GL(V)` with `h(1)` unipotent, so SR.5.2's bullet applies verbatim. Finite inertia image: `N = 0` (`log 1 = 0`, `log_one`). Illusie1994 lines 142–169, WeilII lines 1334–1345. AGR §2.4 lines 1997–1998 use the same `IsNilpotent.exp`. | Pass |
| 1.6 proof sketch and logarithm criterion | `T = 1 + J₃`: `log T = J₃ − J₃²/2`, `(log T)² = J₃²`, `(log T)³ = 0`, kernel dimensions `1, 2, 3 = min(j, 3)`, so `log T` is maximally nilpotent and `T` maximally unipotent. `T = 1 + (J₂ ⊕ 0)`: `log T = J₂ ⊕ 0`, kernel dimensions `2, 3, 3 ≠ 1, 2, 3`, neither maximal. At `k = n − 1 = 2`: `(log T)² = J₃² ≠ 0` and `(T − 1)² ≠ 0` agree; for `J₂ ⊕ 0` both squares are `0`. The probe closes `(log T)^k = 0 ↔ (T − 1)^k = 0` with one rewrite of `ker_pow_log`. `jordanPartition_log` gives the partitions `(3)` and `(2,1)`. | Pass |
| 1.6 new Checks | As the previous row, plus the junk case: `T = 2` on `ℚ¹`, `T − 1 = 1` not nilpotent, `log T = 0` (probe), `0` on `ℚ¹` satisfies `N¹ = 0`, `N⁰ = 1 ≠ 0`, so it is maximally nilpotent, while `minpoly T = X − 2 ≠ X − 1`; the Check's conclusion that the criterion needs `T` unipotent is correct. | Pass |
| 5.7 statement, `𝔏` through `NormedSpace.exp` | `X = J₂`, `t ∈ ℤ_ℓ`: `NormedSpace.exp(tJ₂) = 1 + tJ₂` (terminating series); `X = diag(1,−1) ∈ 𝔰𝔩₂`: `exp(tX) = diag(e^t, e^{−t})` converges for `|t| < ℓ^{−1/(ℓ−1)}`, so the neighbourhood of `0` is needed and present. `H = Sp(V)(ℤ_ℓ)`: `exp(tX) ∈ H` for `t ∈ ℓ^mℤ_ℓ`, `m` large, for every `X ∈ 𝔰𝔭`, so `𝔏 = 𝔰𝔭`; `H = {1}`: `exp(tX) = 1` near `0` forces `X = 0`. | Pass |
| 5.7 proof sketch (unipotent `h`) | `h = [[1,1],[0,1]]`: `N = log h = J₂` (bound `2`), `exp N = h` (`exp_log`), `exp(aN) = h^a` for `a ∈ ℤ` (`expSMulHom`), `= [[1,a],[0,1]]` a polynomial in `a` (`exp_smul_eq_sum_smul_dividedPower`), continuous on `ℤ_ℓ`; `ℤ` dense (`denseRange_intCast`) and `H` closed give `exp(aN) ∈ H` for `a ∈ ℤ_ℓ`; `ℤ_ℓ` is a neighbourhood of `0`, so `N ∈ 𝔏`. Counter-model with `H` not closed: `H = exp(ℤJ₂)` contains `h` but not `exp(aJ₂)` for `a ∈ ℤ_ℓ ∖ ℤ`, so `J₂ ∉ 𝔏`: closedness is used exactly once, as the sketch says. Non-unipotent `h = −1` (`V ≠ 0`): `h − 1 = −2` a unit, `log h = 0`, `exp 0 = 1 ≠ h`. | Pass |
| 5.7 new Check | `h = −1` on `ℚ_ℓ²`: junk `log = 0`, `exp 0 = 1 ≠ −1`. Transvection: `(h − 1)² = J₂² = 0`, `log h = J₂ = h − 1`, `exp(a(h − 1)) = [[1,a],[0,1]]`; at `a = −1` this is `h⁻¹`, at `a = 1/2 ∈ ℤ_ℓ` (`ℓ` odd) the unipotent square root of `h`. | Pass |
| 7a.1 carrier and connectedness | `uv = π^n` model: `X` is normal (`R[u,v]/(uv − π^n)`), `f_*𝒪_X = 𝒪_S`, so the special fibre of a proper flat curve with geometrically connected smooth generic fibre is connected, as the new clause says; `Y ≠ ∅` since `f` is flat and proper. Edge `0 → 1`: `d = [1, −1]`, NeronModels boundary `δ₁ − δ₀ = [−1, 1] = −dᵗ`. Loop: `d = 0`, cokernel `Λ`, `firstBetti = 1`. Two parallel edges: cokernel rank `1 = 2 + 1 − 2`. | Pass |
| LPV.1, LPV.5, LPV.7a Dependencies | Each lists exactly the union of the *Needs:* lines of its layer's changed targets: LPV.1 adds `IsNilpotent.exp`, `log`, `exp_log`, `log_exp`, `ker_pow_log`, `jordanPartition_log` (1.2 and 1.6); LPV.5 adds the six Tau Ceti names of 5.7 and `denseRange_intCast`; LPV.7a adds `TauCeti.DualGraph`, `firstBetti` (7a.1). No name appears in a Dependencies list without a target that needs it. | Pass |

| Statement (carried from the review of `2c2c5ec`) | Instances and values computed on each side | Result |
|---|---|---|
| Consumer bullet: QuadraticFormsOverABase | `x² + xy + y²` over `ℤ[1/3]`: polar matrix `[[2,1],[1,2]]`, determinant `3`, a unit; centre `ℤ[1/3][u]/(u² − u + 1)`, discriminant `−3`, étale of rank `2`; over `𝔽₂` it is `𝔽₄`. `x² + y²` over `ℤ`: determinant `4`, fibre at `2` is `𝔽₂[t]/(t+1)²`, excluded by both roadmaps. `x² + yz` over `𝔽₂`: ordinary with polar kernel `𝔽₂e_x`, hence “even-rank”. | Pass (r5) |
| 1.3 Lean `IsMonodromyFiltration` with `asHom` | `N = 0`, `c = 0`: `M i = ⊥` for `i < 0`, `⊤` for `i ≥ 0`; at `r = 0`, `⊤ ⊔ ⊥ = ⊤ = M₀`, `⊤ ⊓ ⊥ = ⊥ = M₋₁`; `r ≥ 1`: `⊥ ⊔ ⊥ = ⊥`, `⊤ ⊓ pullback 0 ⊥ = ⊤`. `J₂`, `r = 1`: `N(M₁) ⊔ M₋₂ = ℚe₀ = M₋₁`, `M₁ ⊓ N⁻¹(M₋₂) = ℚe₀ = M₀`. | Pass (r4) |
| 1.3–1.4 Lean strictness conjunct | `N = 0`: `∃₀(M(i+2)) = ⊥ = imageSubobject 0 ⊓ M i`. `J₂`, `i = −1`: `N(M₁) = ℚe₀ = ℚe₀ ⊓ M₋₁`; `i = −2`: `0 = ℚe₀ ⊓ 0`. | Pass (r4) |
| 1.4 item 3, raising formula | `J₃`, `j = 2`: `a(j − a + 1)` at `a = 1, 2` is `2, 2`, Mathlib's `(k+1)(μ−k)` at `k = 0, 1`, `μ = 2` is `2, 2`; `[X,Y]u = 2u`, `[X,Y]Nu = 0`, `[X,Y]N²u = −2N²u`. `J₂`: `[X,Y]u = u`, `[X,Y]Nu = −Nu`. | Pass (r4) |
| 1.4 item 3, uniqueness | `J₃ ⊕ J₁`: `Du₀ ∈ gr₂` with `NDu₀ = 0` forces `Du₀ = 0`; wrong model `X′ = X + E` with `E(u₀) = u` has `[E,N]u₀ = −Nu ≠ 0`, excluded. `N = 0`: `X = 0`. | Pass (r4) |
| 1.9 without excellence | Non-excellent strictly henselian DVR, `xy = π`: grades `Λ_C(−1)[−1]`, `Λ_{D₁} ⊕ Λ_{D₂}`, `Λ_C[−1]`, `N` the identity, `N² = 0`; the purity input 0.10 is for every regular noetherian `X`. `C = ∅`: `N = 0`. | Pass (r4) |
| 2.2 polar criterion over a base | `ℤ`, `xy`: determinant `−1`; `x² + y²`: `4`, fibre at `2` zero; `x² + xy + y²`: `3`, `(x − y)²` mod `3`; over `ℤ[1/3]` bijective, centre étale. `x² + yz` over `𝔽₂`: `heven` needed. `ℚ × ℚ`, ranks `2, 4`: centre rank `2` at both primes. | Pass (r4) |
| 2.3 relative Picard citation | `X = Q × P¹ → P¹`: `ω_{X/P¹} ⊗ L^n = f^*𝒪(n)`, a base class killed by the §7.6a fppf sheafification. | Pass (r4) |
| 5.7 closed subgroups (unchanged clauses) | `exp(ℤN)` not closed: `exp(tN) ∉ H` for `t ∈ ℓ^kℤ_ℓ ∖ ℤ`, `𝔏 = 0`; closure `exp(ℤ_ℓN)`: `𝔏 = ℚ_ℓN`; `exp(ℚ_ℓN)`: `ℚ_ℓN`; diagonal torus: dimension `1 < 3`, not open; `SL₂(ℚ_ℓ)`: `𝔰𝔩₂`, open; `{±1}`: `𝔏 = 0`. Milne lines 7434–7446. | Pass (r4) |
| 5.8 compact, hence closed | `ρ(π₁)` compact in the Hausdorff `GL_d(ℚ_ℓ)`, hence closed (`Suggested.lean:118`); `d = 2`: `SL₂(ℤ_ℓ)` closed and open; one transvection fails `hirr`; `d = 0`: `{1}` open. Milne line 7433; WeilI line 756. | Pass (r4) |
| Conventions: Frobenius and `N` | `N = [[0,1],[0,0]]`, `F = diag(1,3)`: `NF = 3·FN`; geometric Frobenius on `(1)` is `1/3`, on `(−1)` is `3`. | Pass (r2) |
| Conventions: Picard–Lefschetz signs | `n = 0,1,2,3`: `(−1)^{m+1} = −,−,+,+`; `(δ,δ) = 2, 0, −2, 0`. | Pass (r2) |
| 0.1 tame character (sample) | `σ(π^{1/m}) = ζπ^{1/m}` gives `ζ` in both constructions; inverse convention gives `ζ⁻¹ ≠ ζ` for `m = 3`. Stacks0BU8 lines 15763, 15773. | Pass (r2) |
| 0.2 gluing triples (sample) | `(Λ,Λ,id)`; `j_*G = (G^I, G, incl)`, quadratic inertia: `(0,ℚ_ℓ,0)`; `Y = ∅`: one object. | Pass (r2) |
| 0.2 oriented product (sample) | `X = S`: specialization `id`, cone `0`; quadratic line: nearby dimension `1`, invariants `0`. Illusie2006 lines 92–160. | Pass (r2) |
| 0.3 `Ψ_η` (sample) | `X = S`: `Ψ_η F = F_η̄` (dimension `1`) versus `i^*j_*F = F_η̄^I` (dimension `0`); smooth `X`: `Ψ_η Λ = Λ`. | Pass (r2) |
| 0.4 cone and variation | Identity: cone `0`, `Var = 0`; swap: `Var ∘ q = T − 1`; `S₃` over `𝔽₅`: `F Var F⁻¹ = Var(σ²)`. | Pass (r2) |
| 0.5 stalks | Smooth: `(Λ, 0)`; node: nearby `(1,1)`, vanishing `(0,1)`; `n = 0`: nearby rank `2`, vanishing `1`. | Pass (r2) |
| 0.6 specialization sequence | `X = S`: `0 → Λ → Λ → 0`; two proper points: `H⁰ = Λ²` on both sides. | Pass (r2) |
| 0.7 constructibility and trait change (sample) | Illusie2006 lines 54–57; Illusie2021 lines 884–886; identity trait: `RΨΛ = Λ`, `RΦ = 0`; `ℤ/ℓ ⊗ᴸ ℤ/ℓ`: `H⁰ = H⁻¹ = ℤ/ℓ`; `e = 2`: `t_old = 2t_new`. | Pass (r2) |
| 0.8 adic realization (sample) | Node: `ℤ_ℓ(−1)`, `ℚ_ℓ(−1)` in degree `1`; torsion `ℤ/ℓ`: derived `H⁰ = H⁻¹ = ℤ/ℓ`, rationalization `0`. Illusie1994 line 1357. | Pass (r2) |
| 0.8a Betti comparison | `xy = t`: Milnor fibre `H⁰ = H¹ = Λ`, stalk ranks `1,1`, `H¹` twisted `(−1)`; `z² = t`: both loops swap. | Pass (r2) |
| 0.10 pointwise purity and alteration | Regular trait: `H²_s = ℤ/n`, `H¹_s = 0`; Stacks07QW line 6397; equal characteristic `p`: `S(π^{1/p})` radicial; ILO lines 7008, 12186. | Pass (r2) |
| 0.10 prime-to-ℓ descent and SNC | Degree `2`, `Λ = ℤ/3`: trace∘pullback `= 2` invertible; `ℤ/2`: `0`; two branches: `R¹j_*Λ = Λ_{D₁}(−1) ⊕ Λ_{D₂}(−1)`, `R²j_*Λ = Λ_C(−2)`. | Pass (r2) |
| 1.1 arithmetic headline (Lean) | `d = 0`: `I₁ = ⊤`; algebraically closed residue field: hypothesis fails, as intended; finite residue field: holds. Illusie1994 line 126. | Pass (r2) |
| 1.1 geometric theorem | `y² = π`: order `2`, `N = 0` after `K(√π)`; Tate curve: `T = 1 + J₂`. | Pass (r2) |
| 1.3 scalar invariance | `ℤ/4`, `N = 2`: `M₋₁ = M₀ = {0,2}`, `M₁ = X`; `2N = 0`: `M₋₁ = 0`; unit `3`: `3N = N`. | Pass (r2) |
| 1.4 strictness and primitive decomposition (sample) | `J₂`, `i = −1`: `N(M₁) = ℚe₀ = im N ∩ M₋₁`; WeilII lines 1143–1171; `J₃`: `P₋₂` one-dimensional, grades at `−2, 0, 2`; trivial line into `ker J₂`: not strict. | Pass (r2) |
| 1.4 tensor and dual rules | `J₂ ⊗ 1 + 1 ⊗ J₂` on `ℚ⁴`: ranks `2,1,0`, blocks `3 + 1`, weights `−2,0,2,0`; characteristic `2`: square `0`. Dual: weights `−1, 1`. WeilII lines 1205–1211. | Pass (r2) |
| 1.5 relative filtration (sample) | `J₂`, `W₀ = ℚe₀`, `W₁ = ℚ²`: none exists; `W₀ = W₁ = ℚe₀`, `W₂ = ℚ²`: `M₋₁ = 0`, `M₀ = M₁ = ℚe₀`, `M₂ = ℚ²`. WeilII line 1255. | Pass (r2) |
| 1.6 maximal unipotence (unchanged clauses) | `1 + J₃`: minimal polynomial `(X−1)³`, kernel dimensions `1,2,3`; `1 + (J₂ ⊕ 0)`: not maximal; identity on `ℚ²`: not maximal. Qian lines 813–815. | Pass (r2) |
| 1.7 normalized `var` | `J₂`: `P = 1`; `J₃`: `P = 1 + N/2`; nonseparating node: `Var(1) = 0`. | Pass (r2) |
| 1.8 tame restriction (sample) | Coordinate crossing: `ℤ_ℓ(1)²`, `[N₁,N₂] = 0`; constant system: residues `(0,0)`; Stacks0BMB line 2524, Stacks0EYG/0EYH lines 3334, 3403, SGA1 line 12533. | Pass (r2) |
| 1.9 two-component semistable (sample) | `xy = π`: grades `Λ_C(−1)[−1]`, `Λ_{D₁} ⊕ Λ_{D₂}`, `Λ_C[−1]`; `N` identity between outer grades, `N² = 0`. | Pass (r2) |
| 1.10 semisimple trace | `N = J₂`, `F = diag(1,3)`: invariant trace `1`, semisimple `4`; HainesNgo lines 470–487; KisinPappas line 3675. | Pass (r2) |
| 2.1 ordinary forms | `𝔽₂`, `xy`: determinant `1`; `x² + y²`: polar `0`; `x² + ay²`: `Nondegenerate` fails (Radical.lean:35, :115); normal forms `z²`, `xy`, `xy + z²`. | Pass (r2) |
| 2.3 quadrics (sample) | Betti ranks `(2)`, `(1,1)`, `(1,2,1)`; `#X(𝔽_q) = (1+q)²` split, `1 + q²` nonsplit; `𝔾_m`: `H⁰ = H¹ = 1`; `Tr(δ²) = 2, 0, −2`. | Pass (r2) |
| 2.4 quadratic points | Node: Tjurina `1`; `x²` in characteristic `2`: length `2`; cusp excluded; Hensel: unit `g′(x̄)` lifts. | Pass (r2) |
| 2.5 cones and Gysin | `𝔸¹`: `H²_0 = F(−1)`; `𝔸^r − 0`: `F` in degrees `0, 2r−1`; two boundary orders differ by sign. | Pass (r2) |
| 2.6 standard degenerations (sample) | `xy − π`: two points; `x² − π`: `Y = ∅`; `x² + y² − π` in characteristic `2`: excluded; `ℤ/15`: `4² ≡ 1`, `(4δ,4δ) = 2`; `19² ≡ 1 mod 60`. | Pass (r2) |
| 2.7 concentration | `Λ = ℤ/1`: support `∅ ⊆ {node}`; `ℤ/3`, residue characteristic `2`: stalk `ℤ/3(−1)`. | Pass (r2) |
| 2.7 even and odd local theorems | `x² = π`: swap; `xy = π`: `λ_X = −1`; `xy = π²`: `−2t_ℓ`; `x² + tx + t` in characteristic `2`: wild. Illusie2021 line 964. | Pass (r2) |
| 2.8 Picard–Lefschetz for a proper family (sample) | `y² = π`: `δ = e₁ − e₂`, `0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0`; genus `g`: nonseparating `2g − 1`, separating `δ = 0`. WeilI lines 568–619; Transvection/Basic.lean:209. | Pass (r2) |
| 3.1–3.3 pencils and blow-up (sample) | Line in `P²`: `S = ∅`; quadric surface: `|S| = 2`, `χ = 6`; cubic surface: `|S| = 12`; Hermitian curve: tangent multiplicity `≥ q`; characteristic `2` conic: Gauss degree `2`. | Pass (r2) |
| 3.4 existence (sample) | `N = 1`, `r = 2`: `P²`, binary quadratic, two critical members for `p ≠ 2`. WeilI lines 706–714, 803. | Pass (r2) |
| 3.5 finite-field descent | `P¹_{𝔽₂}` minus three points: no `𝔽₂`-point, `𝔽₄`-points exist; `α = 3 → 9`. WeilI lines 962–968. | Pass (r2) |
| 3.6 arithmetic specialization (sample) | `y² − y = 1/t` in characteristic `2`: wild inertia at `0`; WeilII lines 1854–1858. | Pass (r2) |
| 4.1 direct images (sample) | Conic pencil: `R⁰` rank `2`, critical stalk `1`; quadric surface: `ℚ_ℓ(−1)` at two points. WeilI lines 715–748, 804. | Pass (r2) |
| 4.2 vanishing subspace | Conic: `E = ℚ_ℓ(1,−1)`; shear: `gδ ≠ ±δ`; twisted cubic in characteristic `2`: image `S₃`. | Pass (r2) |
| 4.3 fixed space | Alternating: `Fix(T) = ℚδ = δ^⊥`; dot product, `c = −1`: `Fix = ℚ(1,1)`; `c = 0`: `Fix = V`; `δ = 0`: `T = id`. | Pass (r2) |
| 4.4 radical quotient | `ℚ⁴`: `E = span(e₀,e₁,e₂)` radical `ℚe₂`, quotient dimension `2`; `span(e₀,e₂)`: `0`. | Pass (r2) |
| 4.5 blow-up formulas (sample) | `(H − E)² = 0`; `+E` would give `2`; cubic surface ranks `(1,0,7,0,1)`; conic `(1,0,1)`. | Pass (r2) |
| 5.1 Bertini for images (sample) | Conic complement: image `C₂`; tangent line: image `1`; Frattini: dense iff surjective mod `ℓ`. | Pass (r2) |
| 5.2 conjugacy (sample) | Conic: transports `±(e₁ − e₂)`; quadric surface: `0`. WeilI lines 658–689, 743. | Pass (r2) |
| 5.3 normal and tame generation (sample) | `S₃`: normal closure of `⟨(12)⟩` has order `6`; `S = ∅`: `π₁(P¹) = 1`. SGA1 lines 11447–11458; Stacks0BQM line 1278. | Pass (r2) |
| 5.4 absolute irreducibility (sample) | Conic quotient: dimension `1`; plane cubic pencil: one transvection fixes a line; `V = 0` excluded. WeilI lines 685–689, 804–806. | Pass (r2) |
| 5.5 middle-degree reduction (sample) | `n = 1`, `m = 0`: `ℚ_ℓ(−1)`, eigenvalue `q`; quadric-surface pencil: `V = E = 0`. WeilI lines 1013–1026; (4.4) b) line 616. | Pass (r2) |
| 5.6 symplectic Lie algebra | `N(e₁) = −E₁₂`, `N(e₂) = E₂₁`, bracket `−H`; `N(cδ) = c²N(δ)`. WeilI lines 764–783. | Pass (r2) |
| 5.9 characteristic two | Twisted cubic: common fixed line the diagonal; standard `S₃` representation irreducible over every characteristic-zero field. WeilII lines 3203–3209. | Pass (r2) |
| 5.10 orthogonal alternative (Lean) | `d = 0`: finite; `d = 1`: `{±1}` or `hspan` false; `d = 2` hyperbolic, `a = 1 + ℓ`: `H ∩ SO = 1 + ℓℤ_ℓ`, open. WeilII lines 3444–3448. | Pass (r2) |
| 5.10 finite ADE and trace identity | `(δ,δ′) = 0, 1, 2`: `Tr(s_δ s_{δ′}) = dim − 4 + b²`; `A₂`: `−1`. WeilII lines 3544–3560. | Pass (r2) |
| 5.11 gcd lemma | `±Id`: spectra `{1}`, `{−1}`; `γ = ℓ`: no continuous character. WeilII lines 3568–3625. | Pass (r2) |
| 6.1 nearby duality (sample) | Point: dual of the line is the line; smooth curve: `DΛ = Λ(1)[2]`; node: twist `−1`. Illusie1994 lines 1278–1282, 1357. | Pass (r2) |
| 6.2 trait perversity | `Λ_S[1]` perverse; `Rj_*Λ_η[1]` not; `Λ_X[d]` fails the generic bound. Illusie1994 lines 1360–1392. | Pass (r2) |
| 6.2 exactness and vanishing cycles | Node: `RΦℚ_ℓ[2][−1] = ℚ_ℓ(−1)` in degree `0`; skyscraper: `RΦ[−1] = Λ`. Illusie2021 lines 887–893. | Pass (r2) |
| 6.3 intermediate extension (sample) | `𝔸¹_S ⊃ 𝔾_{m,S}`, skyscraper at `x = π`: the `!` exchange fails; identity immersion: identity. | Pass (r2) |
| 6.5 filtered colimits | Infinite sum of `Λ`: not constructible; `Λ[a]`, `a → ∞`: no bound; `(ℤ/ℓ, id)`: colimit `ℤ/ℓ`. CaraianiScholze lines 2613–2696. | Pass (r2) |
| 6.6 isolated singularities | Node: rank one in degree `1`; `H^n(X_s) → H^n(X_η̄)` injective; `n = 0`: `R⁰Φ` rank one. | Pass (r2) |
| 7a.1–7a.2 graph complex and nodes (unchanged clauses) | Edge: `d = [1,−1]`, `∂ = [−1,1] = −d`; loop: cokernel `Λ`; `uv = π`: `N_e = −1`; `uv = π²`: `−2`. Illusie1991 line 1331. | Pass (r2) |
| 7a.3 monodromy of a nodal curve | Rational loop: `rank N = 1 = b₁`; tree: `N = 0`; two parallel edges: `u₋ = −2`; grades `(1,0,1)`, `(0,2g,0)`, `(1,2,1)`. | Pass (r2) |
| 7a.4 Jacobian and pairing | Split multiplicative genus one: `u₋ = [−2]`, `u₊ = [2]`, cokernels `ℤ/2`. Illusie1991 lines 1401–1404. | Pass (r2) |
| 7a.5–7a.6 base change and `I₂` | Thickness `2` under index `3`: `6` unit edges, pairing `−6`; `y² = x³ + x² + π²`: `I₂`, `N² = 0`. | Pass (r2) |
| 7a.7 strictly semistable stalks | `a = 1,2,3`: ranks `(1)`, `(1,1)`, `(1,2,1)`; `d = 1`, `m = 2`: grades match 1.9. Saito lines 773, 831, 867. | Pass (r2) |
| 7a.8 weight spectral sequence (headline) | `d = 1`: `E₁^{−1,2} = H⁰(nodes)(−1)`, `E₁^{0,1} = ⊕H¹`, `E₁^{1,0} = H⁰(nodes)`, stable at page `4`; nonproper: nearby `H¹ = ℚ_ℓ(−1)`, generic `0`. Saito lines 885, 925, 974. | Pass (r2) |
| 7a.9 `N` on the sequence | `I₂`: `[−2]`; smooth: `0`. | Pass (r2) |
| 7b.1–7b.2 invariants and Wang | Shear: invariants `ℚ ⊕ 0`; `N = 0` line: `H⁰`, `H¹` ranks `1`; `J₂`: kernel and cokernel rank `1`. | Pass (r2) |
| 7b.3–7b.4 spreading and cross | Constant family: identity; `X = P¹ × S`: upper term `0`; duality degree `2d − i − 1`, twist `−d`. | Pass (r2) |
| 7b.5 local invariant cycles (headline) | `F = diag(1,q)`: spectra `{1}`, `{q}` disjoint, map onto; `F = 1`: image `0 ≠ k`. WeilII 3.6.1 (PDF 78). | Pass (r2) |
| 7b.6 complex theorem | Disk identity: `T = 1`; `T = [[1,1],[0,1]]`: Wang image `ℚe₀`; weights `≤ i`, `≥ i + 1` disjoint. | Pass (r2) |
| 7b.7 incidence and models | Nodal cubic: `Z → X` a `P¹`-bundle; dualizing `Λ(d−1)[2d−2]`; skyscraper: `h^!K = Λ ≠ Λ(−1)[−2]`. | Pass (r2) |
| 7b.9 support bound and weak Lefschetz | `DK[−2n−2] = ℚ_ℓ(n+1)`, bound `n + 1` attained; conic: `H⁰(X) → H⁰(Y)` injective not onto. | Pass (r2) |
| 7b.10 obstruction detection | Twisted cubic: `H¹(P¹ mod t, L)` of dimension `2`, common kernel the diagonal; conic: diagonal class extends. | Pass (r2) |
| 7b.11 global invariant cycles (headline) | Conic: `1 ↦ (1,1)` equals the swap-invariant line; `K = 0`; constant `K`: bound `n + 1`. WeilII 6.2.12 (PDF 115). | Pass (r2) |

The first table has 14 rows computed at this head; the second carries 87 rows (1 from r5, 9 from r4, 77 from r2, each reduced to its values). Together they cover the fifteen sampled targets, the six declarations of `Suggested.lean`, the headline theorems, and every statement the diff touches (the four changed contract bullets, the two changed supplier bullets, 1.2, 1.6, 5.7, 7a.1 and the three Dependencies lists).

## Not verifiable

- **Schneider 2011** (*p-Adic Lie Groups*), cited in 5.7: paywalled, cited by locator only. This round changes 5.7's own route (now through Tau Ceti's finite logarithm and the `ℤ`-to-`ℤ_ℓ` density step), not the clauses that rest on Schneider; those were checked in earlier reviews through Milne, Lemma 32.7, and AdelicAlgebraicGroups §4.2.
- The other unreadable texts of earlier reviews (SGA 7 I–II, Fujiwara 2002, Illusie 2002, BBD, Jouanolou 1983, SGA 4, SGA 4½, SGA 5, Huber 1996, BLR, Illusie 2003, Vidal 2004b) back targets this diff does not touch and were not attempted again.
- Qian 2023 was not reopened: the 1.6 locator is unchanged, and the previous review read Definition 3.6 at PDF p. 21 of the NSF Public Access Repository manuscript; that the published *Invent. Math.* numbering agrees was not checked then or now.

## Source issues

- none
