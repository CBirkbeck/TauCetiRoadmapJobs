# GATE-HopfologicalAlgebra~1: answers to human review

Head reviewed: `ae6ce67`. Repairs are in commits `33c574d8` and `1cf5b3dc` (not pushed). The second commit rewrites `Suggested.lean` into acceptance-test form, with no sorry'd data and no import of another roadmap's module. Several declarations the reviewers discussed therefore now exist only as README targets; the sections below describe the final state. Points are numbered in the order they appear in the review thread. The author's two reply comments (kim-em) list changes rather than raise points. Each change they claim is checked against the head below (H03, H07–H09).

## H01 (CBirkbeck) — disputed
The categorical outputs are planned in the README: `H-StMod`, `H-stmod` and `K₀(H-stmod)` in Layers 2 and 6, `C(A,H)` in Layer 4, and `D(A,H)` with its Verdier comparison and compact generation in Layer 5. They are no longer Lean declarations. In Lean, each needed `sorry` data (60 `def`/`instance` bodies: `HStMod`'s monoidal instance, `relativeExactStructure`, `relativeDerivedComparison`, the `GradedVect` monoidal and braided instances, …) and an import of `TauCetiRoadmap.StablePeriodicCurved.Suggested`, and the acceptance-test contract refuses both. The one categorical headline statable at the pins is now stated: `hMod_abelian_isFrobenius` (`TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean` line 93) says that `ExactStructure.abelian (ModuleCat H)` is Frobenius for finite-dimensional `H`. With Tau Ceti's `ExactStructure.IsFrobenius.stableIsTriangulated` (`TauCeti/CategoryTheory/Exact/Stable/Triangulated.lean` line 205), this makes `H-StMod` triangulated. The module docstring names the rest as not statable and says which carrier each lacks.

## H02 (CBirkbeck) — answered
The README already separates the two conditions, in Layer 5 "Cofibrant and property-(P) modules" (README line 293 onward). Cellular property (P) is the strict split-filtration condition, Qi's homotopy-invariant property (P) is kept separately, and every strict cofibrancy conclusion is drawn from the cellular condition. The README states both negative tests (`H=k`, `M=A/(t)`, and the contractible summand `M⊗H`) and the positive test on the bar replacement. Lean no longer declares the cofibrancy predicates, because they live on `C(A,H)` (see H01). Rechecked instance: for `H=k` and `A=k[t]/(t²)`, a splitting of `A → A/(t)` sends `1` into `tA`, whose image in `A/(t)` is `0 ≠ 1`, so `A/(t)` is not cofibrant.

## H03 (kim-em) — answered
This comment reports the changes for H01–H02. Every declaration it names existed at `ae6ce67`. Since `1cf5b3dc`, the categorical ones are README targets rather than Lean declarations, for the reason given in H01.

## H04 (CBirkbeck) — answered
The finite-target pairing is already restricted at the head. README lines 414–432 give the `k=𝔽₂`, `A=k(t)` counterexample and allow only two forms of the pairing: a target in the large `H-StMod`, or a target in `Dᶠ(k,H)` with `A` finite-dimensional over `k`. `Dᶠ` keeps its finite-length meaning (line 370).

## H05 (CBirkbeck) — answered
"Smooth basic" is already pinned to Qi's split Definition 9.3 at README line 377: every simple module is one-dimensional, equivalently `A/J(A) ≅ k^r`. The README also says why the weaker reading does not give `Hom_A(P_i,S_i)=k`.

## H06 (CBirkbeck) — answered
README lines 676–680 already say that `H_n-gmod` carries the **monoidal** tensor product defined through the ambient braiding, and that it is not a braiding on the module or stable category. This follows Laugwitz–Qi §1.4. Lean states no monoidal target: the module docstring lists the graded `H_n`-module category and its monoidal structure as not statable at the pins. Nothing in either file asks for a braiding.

## H07 (kim-em) — answered
At `ae6ce67`, `GradedVect` had `Carrier : Type (max u x)`, and the round trips were stated for `BraidedHopfObject.{_, u, max u x}`. Since `1cf5b3dc` the `GradedVect`/`HopfObj` bridge is a README target only (Layer 7, "One-dimensional Nichols algebras and Taft algebras", README line 520 onward), because its monoidal and braided instances were sorry'd data. The README keeps the universe requirement: the carriers live in a universe containing that of `k`, so the unit `k` is an object.

## H08 (kim-em) — answered
`tensorH` is no longer a Lean declaration (see H01). The convention it encoded, `(a#h)·(n⊗l)=Σ a·(h₁·n) ⊗ h₂ l`, is the diagonal `B`-action on `N⊗H` of README line 234. It follows from the smash product convention fixed in README line 51, which `LeftModuleAlgebra.smashMulPure` (Suggested.lean line 237) implements.

## H09 (kim-em) — answered
Cells of the form `A⊗V` with arbitrary `V`, together with the radical-filtration converse, are in README Layer 5, line 304 onward (the radical-filtration converse is at line 309). That argument refines along `J^iV` with semisimple layers and never decomposes an arbitrary `H`-module.

## H10 (roed-math) — answered
`TauCetiRoadmap/HopfologicalAlgebra/metadata.toml` exists at the head with `topic = "math.KT"`. The gate reports `metadata=0`.

## H11 (CBirkbeck) — applied differently
The obstruction holds: for `n` with `t≥3` distinct prime factors, `K₀(O_n)` is not `ℤ[ν,ν⁻¹]/(Φ_n)`. The fix keeps a corrected general theorem and the full cyclotomic statement for `t≤2`, which is wider than the suggested restriction to prime powers. In the README, the old statement (no condition on `t`) becomes two theorems: `K₀(O_n) ≅ ℤ[ν,ν⁻¹]/(Φ_n)` for `t ≤ 2`, and `K₀(O_n) ≅ ℤ[ν,ν⁻¹]/(w_1,…,w_t)` for `t ≥ 2`, with `w_i=∏_{l≠i}[n]_ν/[n_l]_ν` and normalised so that `[k{1}] ↦ ν`. At `33c574d8` both were also Lean theorems. Since `1cf5b3dc` they are README targets only, because they rested on sorry'd monoidal and ring instances (see H01). The module docstring lists the Laugwitz–Qi `K₀` computation as not statable at the pins.

README Layer 8 (line 688 onward) gives the route, the `t=2` proof, the `t≥3` failure and four Checks: n=30, 6, 4 and 12. The source map (line 784) and the layer introduction are scoped the same way, and the `cyclotomicVerdierRelation` docstring now carries the `t≤2` condition.

The source was checked in LaugwitzQi2022 (arXiv 1804.01478v4):
- Definition 4.4 (line 926) and equation (4.5) (line 938) give `W_k = H_n ⊗_{H_{n_k}} k` with graded dimension `∏_{l≠k}(1−ν^n)/(1−ν^{n_l})`. These are the cells the review describes.
- The proof of Theorem 5.15 (line 1364) asserts that `gcd{[W_l] : l≠k} = [V_k]`. For `t≥3` this gcd is `[V_k]` times a further multiple of `Φ_n`.

Values computed with exact integer polynomial arithmetic:
- **n=30:** `Φ_30` divides each of `1+ν^15`, `1+ν^10+ν^20` and `1+ν^6+⋯+ν^24` exactly once, and each `w_k` exactly twice. Over ℚ the gcd of the `w_k` has degree 30, so `K₀(O_30)` has rank 30, not φ(30)=8.
- **Other t≥3 cases:** n=60 and n=105 give multiplicity 2, and n=210 gives multiplicity 3.
- **t=2 cases:** for n = 6, 10, 12, 18, 36, 45, 72 and 100, the gcd has degree φ(n) and the two cofactors have resultant 1. So `(w_1,w_2)=(Φ_n)` over ℤ, not only over ℚ.

The README proves the `t=2` case directly. A maximal ideal of `ℤ[ν]` containing `Φ_d` and `Φ_e` forces `d/e` to be a power of the residue characteristic, and that is impossible for `d=p^a q^j` and `e=p^i q^b` with `j<b` and `i<a`.

The degenerate case `t=1` is why the general theorem needs `2 ≤ t`. There the empty product gives `w_1=1`, which would make the ring zero, whereas `I_1` is the projectives and the ring is `ℤ[ν,ν⁻¹]/Φ_{p^a}`. The theorem's hypothesis and a README Check both record this.

## H12 (CBirkbeck) — applied
At `ae6ce67`, `homActionFormula` did not carry `[FiniteDimensional k H]`, so its type claimed an inverse antipode for every Hopf algebra; Takeuchi's free Hopf algebra on `M₂(k)*` is a counterexample. `33c574d8` added explicit binders to it, `homActionModule`, `hStModMonoidal` and `barReplacementFunctor`/`barReplacementCounit`. `1cf5b3dc` then deleted these sorry'd constructions (see H01). What remains is the structure `HomActionFormula` (Suggested.lean line 1095). It is not a construction: inhabiting it requires supplying the inverse antipode, so it makes no claim about Hopf algebras whose antipode is not bijective.

The binder check was rerun on the final file. A `#check @name` was elaborated for every changed or added declaration (`hMod_abelian_isFrobenius`, `LeftIntegral`, `RightIntegral`, `smashProduct_nonempty`, `GradedModuleDatum.shift`, `integerBicharacter`, `superBicharacter`, `TruncatedPrimitiveDatum.moduleDifferential`, `SmashModule.hAction`, `finrank_leftIntegral`):
- `hMod_abelian_isFrobenius` and `finrank_leftIntegral` carry `[FiniteDimensional k H]`, and `finrank_leftIntegral` also carries `[Nontrivial H]`;
- `SmashModule.hAction` has no finite-dimensionality binder, and needs none: its action is restriction along `S.includeH`;
- the other types are as stated in the README, and no binder was lost.

## H13 (CBirkbeck) — applied
README line 548 (534 at `ae6ce67`) changes from "Let `q` be a primitive `N`th root…" to "Let `N≥2` and let `q` be a primitive `N`th root…". It also notes that `N=1` collapses `k[d]/(d)` to `k`, and that `q=1` in characteristic zero gives the polynomial algebra `k[d]`, which is outside this construction. This matches `QNComplexDatum.order : 2 ≤ N` and `TaftDatum.order : 2 ≤ n` in Suggested.lean.

## H14 (CBirkbeck) — applied
`IsSymmetricFrobenius` (Suggested.lean line 188) changes from "∃ phi, `mulPairing` bijective ∧ trace" to `∃ phi : Module.Dual k H, phi.IsSymmetricFrobeniusFunctional`. That is Tau Ceti's `LinearMap.IsSymmetricFrobeniusFunctional`, in `TauCeti/Algebra/Algebra/Frobenius/Basic.lean` lines 95–99: a nondegenerate pairing `(a,b) ↦ φ(ab)` with `φ(ab)=φ(ba)`. It is imported as `TauCeti.Algebra.Algebra.Frobenius.Basic`. The native definition is in Tau Ceti, not Mathlib. For finite-dimensional `H` it agrees with the old bijectivity form, and the only theorem using it, `symmetric_iff_unimodular_and_antipodeSquare_inner`, assumes `[FiniteDimensional k H]`. The elaborated type was checked.

## Other edits made to clear gate findings
- **tex (2 → 0):** two multi-line displays (README lines 514, 645) became indented code blocks, and `H\text{-StMod}` became `H-StMod`.
- **readme-ids-missing (1 → 0):** "literal `Hom_B`" became "literal `Hom_B(M,N)`".

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `K₀(O_n) ≅ ℤ[ν±]/(Φ_n)` (old, all n) | n=30, 60, 105, 210 | multiplicity of Φ_n in each `w_k`: 2, 2, 2, 3; ℚ-rank of K₀(O_30) = 30 ≠ 8 | false for t≥3 | restricted to `t ≤ 2` |
| same, t≤2 | n=4, 8, 9 (t=1); n=6, 10, 12, 18, 36, 45, 72, 100 (t=2) | t=1: `v_1 = Φ_{p^a}` exactly; t=2: gcd degree = φ(n), cofactor resultant = 1 | holds over ℤ | kept |
| `K₀(O_n) ≅ ℤ[ν±]/(w_1..w_t)` | t=1 (n=4) | empty product ⇒ ideal = (1), zero ring, against `ℤ[ν±]/Φ_4` (rank 2) | false at t=1 | hypothesis `2 ≤ t` |
| same, t≥2 | n=6 | `(Φ_2Φ_6, Φ_3Φ_6) = (Φ_6)`, since `(1+ν+ν²)−ν(1+ν)=1` | agrees with the t≤2 theorem | — |
| Nichols `k[d]/(d^N)` | N=1, q=1 | `k[d]/(d)=k`, so the generator is lost | false at N=1 | `N≥2` |
| `homActionFormula` type | `A=k`, M=N=0, H = Takeuchi free Hopf algebra | the record provides `S⁻¹`, which does not exist there | type too wide | `[FiniteDimensional k H]` |
| `IsSymmetricFrobenius` | `H=k` (φ=id), Sweedler `H₄` (not unimodular) | `k`: symmetric on both definitions; `H₄`: not symmetric on both, by the unimodularity criterion | equivalent for finite-dimensional H | native definition |
| `hMod_abelian_isFrobenius` | `H=k`; `H=𝔽₂[d]/(d²)`, d primitive; `H=k[x]` (outside the binder) | `k`: every module is projective and injective, both sides true; `𝔽₂[d]/(d²)`: the trivial module `k` (dim 1 < 2, H local) is neither projective nor injective, both sides false; `k[x]`: `k[x]` is projective but not injective (`x·k[x] ≠ k[x]`), so the theorem fails without `[FiniteDimensional k H]` | holds, binder needed | new headline |
| `LeftIntegral`, `RightIntegral` | `k[C₂]` (char ≠ 2); Sweedler `H₄` | `g(1+g)=1+g=ε(g)(1+g)`, in; `g(1−g)=−(1−g)≠ε(g)(1−g)`, out; `H₄`: `(1+g)d` is left (`d(1+g)d=dgd=−gd²=0`) but `(1+g)d·g=−(1+g)d≠(1+g)d`, not right | matches the convention `hΛ=ε(h)Λ` | real proofs replace `sorry` |
| `integerBicharacter` | `q=−1`; `i=−1,j=1` | `χ(1,1)=−1`, `χ(2,1)=1=χ(1,1)²`; `χ(−1,1)=q⁻¹` needs `q≠0` (hypothesis present) | holds | real body `q^(ij)` |
| `superBicharacter` | `(1,1)`, `(1+1,1)`, char 2 | `χ(1,1)=−1`, `χ(0,1)=1=(−1)(−1)`; char 2: `−1=1`, trivial braiding, consistent with `SweedlerDatum`'s `char k ≠ 2` | holds | real body `(−1)^(ab)` |
| `GradedModuleDatum.shift` | `M` concentrated in degree 0, `r=1` | `M{1}_1=M_0=M`, `M{1}_0=M_{−1}=0`; `a∈H_g`, `m∈M{r}_h=M_{h−r}` ⇒ `am∈M_{g+h−r}=M{r}_{g+h}` | matches docstring | decomposition proved by reindexing along `g ↦ g−r` |
| `moduleDifferential` | `M=H=k[d]/(d^p)`; `M=k` trivial | multiplication by `d`, `(d·)^p=d^p·=0`; on `k`, `d` acts by `ε(d)=0` | holds | real body |
| `SmashModule.hAction` | `h=1`; product `hl` | `includeH 1 = 1`; `includeH(hl)=includeH h·includeH l` | action laws hold | real body |
| `smashProduct_nonempty` | `H=k`; `A=k`; `A=0` | `A#k≅A`; `k#H≅H`; `A=0` gives the zero ring on `0⊗H=0` | holds | `def … := sorry` becomes an existence theorem |

## Gate repairs to Suggested.lean (`1cf5b3dc`)
- **sorry-data (60 → 0).** Real bodies replace `sorry` in `LeftIntegral`, `RightIntegral`, `GradedModuleDatum.shift`, `integerBicharacter`, `superBicharacter`, `TruncatedPrimitiveDatum.moduleDifferential` and `SmashModule.hAction`. `mem_leftIntegral_iff` and `mem_rightIntegral_iff` are now `Iff.rfl`. `smashProduct` (a `def` with body `sorry`) becomes the theorem `smashProduct_nonempty`. Four blocks are deleted together with everything that mentions them, because every one rests on sorry'd instances or on the roadmap import: the `GradedVect`/`HopfObj` bridge, `HMod`/`HStMod`/`Hstmod`/`K0Hstmod`, the relative categories `C(A,H)` and `D(A,H)` with the cofibrancy tests, and the Laugwitz–Qi graded stable category, Verdier quotient and `K₀`.
- **imports (1 → 0).** `import TauCetiRoadmap.StablePeriodicCurved.Suggested` is removed. `TauCeti.CategoryTheory.Exact.Abelian` and `TauCeti.CategoryTheory.Exact.Frobenius` are added for the new headline. The three `DGAInfinity` build warnings came in through the removed import and no longer appear.
- **New headline.** `hMod_abelian_isFrobenius` is Layer 1 item 5, stated against Tau Ceti's `ExactStructure.abelian` (`TauCeti/CategoryTheory/Exact/Abelian.lean` line 123) and `ExactStructure.IsFrobenius` (`TauCeti/CategoryTheory/Exact/Frobenius.lean` line 52). Tau Ceti's `FGModuleCat.abelian_isFrobenius` (`TauCeti/Algebra/Category/FGModuleCat/Frobenius.lean` line 122) covers only finitely generated modules, and it assumes two-sided self-injectivity, which for a Hopf algebra is the Larson–Sweedler content. The README's existing API inventory now records these Tau Ceti declarations.
- **Module docstring.** A module docstring is added. It names the headlines that are not statable at the pins and the carrier each lacks: the monoidal structure on modules over a Hopf algebra, the relative exact structure, the graded `H_n`-module category, and a bicharacter braiding on graded vector spaces.
- **README.** Four edits keep it in agreement with Lean:
  - the closing sentence of "How to read the build" now says what Lean states;
  - Layer 1 item 5 names `hMod_abelian_isFrobenius`;
  - Layer 3 names `smashProduct_nonempty`;
  - "`smashProduct`" becomes "the smash product".
- Ownership: `hMod_abelian_isFrobenius` adds no carrier. `roadmaps grep` finds no other roadmap stating self-injectivity or Frobenius-ness for Hopf-module categories. Depcheck still passes; the README still names `StablePeriodicCurved` and `GrothendieckEulerForms` as suppliers of the README targets.

No sources outside LaugwitzQi2022 were needed. `sources.toml` is outside the files this job may edit, so the LaugwitzQi2022 fetch (arXiv 1804.01478v4, `open-repository`) is not recorded in a manifest. No text was found unreadable, so `needs-references.toml` was not written. No passage in the review comments asked for anything outside the job.

## Build and gate
- `lake build TauCetiRoadmap.HopfologicalAlgebra.Suggested`: `Build completed successfully (9008 jobs).` The only messages are 27 `declaration uses sorry` warnings.
- Gate, after `1cf5b3dc`: `gate HopfologicalAlgebra: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`. No UPWARD or CYCLE line.
