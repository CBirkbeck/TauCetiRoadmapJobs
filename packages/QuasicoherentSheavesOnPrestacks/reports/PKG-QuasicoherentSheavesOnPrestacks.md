# PKG-QuasicoherentSheavesOnPrestacks

Package of the accepted design, which was accepted at `REV-DESIGN-QuasicoherentSheavesOnPrestacks~16` with both of its P3 findings repaired by `FIX-DESIGN-QuasicoherentSheavesOnPrestacks~17`.

Files written:
- `packages/QuasicoherentSheavesOnPrestacks/README.md` (940 lines; the design had 910)
- `packages/QuasicoherentSheavesOnPrestacks/Suggested.lean` (87 lines)
- `packages/QuasicoherentSheavesOnPrestacks/metadata.toml` (`topic = "math.AG"`, the same as EnhancedDerivedSheaves and SchemeAndStackFoundations on main)
- `packages/QuasicoherentSheavesOnPrestacks/sources.toml` (two HA locators added)
- this report

`design/plan.json` is unchanged. Its `gaps` list already declares the only two supplier gaps the package needs, and both still hold on main (see "Supplier gaps").

## Headline theorems

| Headline (README) | At the pins |
| --- | --- |
| 8.5 in its homotopy-category form (8.6): for a field k of characteristic p and a finite group Γ whose order is divisible by p, the trivial representation in degree 0 of `DerivedCategory (Rep k Γ)` is not compact | **stated**: `TauCetiRoadmap.QuasicoherentSheavesOnPrestacks.not_preservesCoproducts_trivial` |
| 3.2 flat hyperdescent `Mod_A ≃ lim Mod_{A_n}` for every flat hypercover of a connective test ring (SAG Theorem D.6.3.1) | not statable: no `Mod_A` of a connective commutative algebra of `D(ℤ)`, no limits in `Cat∞`, no animated or `E∞` test rings |
| 2.4 and 3.3: `QCoh(u_! X) ≃ QCoh(X)`; invariance under fpqc hypersheafification; Čech descent | not statable: no `QCoh` and no hypersheafification of space-valued prestacks |
| 4.2 affine pushforward, projection formula and base change | not statable: no `QCoh` or pullback functors |
| 5.3 `QCoh(h_X) ≃ Dqc(X)` for every scheme | not statable: no `QCoh`; no `Dqc` (on homotopy categories it is SchemeAndStackFoundations' `DQCoh`, which is not at the pins either) |
| 6.2 and 6.3: the t-structure; perfect = dualizable | not statable: no `QCoh` and no symmetric monoidal ∞-categories |
| 7.2–7.4: quotients, `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}`, heart and `D⁺` of classical quotient stacks | not statable: no `QCoh`, no homotopy fixed points of ∞-categories, no quotient stacks |
| 8.1 qcqs schemes: compact = perfect = dualizable | not statable: no `QCoh`; the homotopy-category content is SchemeAndStackFoundations §2.18's `perfect_generator` |
| 8.2–8.4 perfect stacks, their permanence, `[X/G]` perfect in characteristic 0 (BZFN Corollary 3.22) | not statable: no `QCoh`, `Ind(Perf)` or quotient stacks |
| 8.5 in its ∞-categorical form (the structure sheaf is dualizable and not compact) | the non-compactness is stated through 8.6; dualizability needs the symmetric monoidal `QCoh`, which the pins lack |

The module docstring of `Suggested.lean` records each unstated headline with what it lacks. Mathlib has `SSet.Quasicategory`. Tau Ceti has cores, full simplicial subsets, Cartesian edges and the dg nerve. Neither pin has:
- limits of ∞-categories;
- stable, presentable or symmetric monoidal ∞-categories;
- module ∞-categories or animated rings;
- space-valued prestacks.

`Suggested.lean` has no definition of its own. Compactness of an object of a preadditive category is StableHomotopyKTheory §5.17's `IsCompactForCoproducts` (on main): `∀ J : Type v, PreservesColimitsOfShape (Discrete J) (preadditiveCoyoneda.obj (op G))`. The theorem writes that body out, since no other roadmap's module may be imported.

Why the 8.6 statement is the headline and not a stand-in:
- The homotopy category of `QCoh(BΓ × Spec k) = Fun(BΓ, Mod_k)` is `DerivedCategory (Rep k Γ)` (README 8.6, second API fact). The route is `barrBeckLurie`, then HA Remark 7.1.1.16 (p. 1206), then `Rep.equivalenceModuleMonoidAlgebra`.
- Compactness in a stable ∞-category with small colimits is detected by maps into coproducts in the homotopy category (HA Proposition 1.4.4.1(3), p. 154).

## What the README could not support, and notions moved down

- Nothing in the README depends on a missing text. Every cited work is in the manifest, `certified`. No `needs-references.toml` was written.
- No notion was moved down from a later roadmap. The only new supplier edge is to StableHomotopyKTheory, which is on main and is earlier in the merge order (line 18).

## Changes against the accepted design, and corrections

1. **New 8.6** (README only; `plan.json` keeps 33 targets, the README has 34). It is the README home of the Lean headline:
   - the statement, with exact hypotheses;
   - two API facts: compactness in the sense of §5.17 versus ∞-categorical compactness, and the homotopy category of `QCoh(BΓ × Spec k)`;
   - a classical route through `groupCohomologyIsoExt`, Shapiro's lemma and the cyclic computation;
   - five Checks;
   - a *Needs* line.

   Layer 8's Examples, Dependencies, the build table and the Layer 8 ownership bullet name it. The Layer 2 example now names the homotopy category.
2. **Correction in 8.3** (the remark of the last design review, which needed no change but stated an imprecise step). The route obtained the right adjoint of `Ind(C₀) → QCoh(Y)` from `adjointFunctorTheorem`, but `QCoh(Y)` is not known to be presentable at that point. The route now constructs the adjoint directly:
   - N goes to the exact presheaf `c ↦ Map(c, N)` on `C₀`.
   - Its values are small because `Map(f^*M ⊗ L_i^{⊗−n}, N) ≃ Map(M, f_*(L_i^{⊗n} ⊗ N))` is a mapping space of the presentable `QCoh(X)`.
   - The same smallness formula was added for (d): `Map(π₁^*M₁ ⊗ π₂^*M₂, N) ≃ Map(M₁, π_{1*}(π₂^*M₂^∨ ⊗ N))`.

   8.3's *Needs* line no longer lists E3.2.
3. **Supplier contracts.**
   - From Mathlib: a new 8.6 bullet listing every declaration with file and line. It also records that Mathlib has no compact objects of an additive or triangulated category: `CategoryTheory.IsFinitelyPresentable` is the different notion of commuting with filtered colimits.
   - From Tau Ceti: two new declarations (next section).
   - New section "From TauCetiRoadmap.StableHomotopyKTheory" (§5.17), also listed under "Stated by the suppliers and used unchanged".
4. **5.2** cites the pinned Tau Ceti declaration for the full subcategory (next section).
5. **1.3**, Lazard bullet: the discrete case is cited at the pin (next section).

Nothing else changed: every target, Check and worked example of the design is kept word for word.

## Duplication sweep and ownership

Removals and citations:
- **Compactness of objects of a preadditive category.** I first wrote a predicate for `Suggested.lean`. The sweep found StableHomotopyKTheory §5.17 `IsCompactForCoproducts` on main (README line 2189, `Suggested.lean` line 250), with its own API and Checks: the zero object, `ℤ[0]` compact, `⊕_ℕ ℤ` not. I deleted my predicate together with its API and Checks. The notion is cited in the supplier contracts, in "Scope and ownership" and in 8.6's *Needs* line.
- **Full subcategories of quasicategories.** 5.2 consumed EnhancedDerivedSheaves E0.3's `fullEnhancedSubcategory`, which is now at the pin as `SSet.fullEnhancedSubcategory` (TauCeti/AlgebraicTopology/Quasicategory/FullSubcategory.lean:53, quasicategory instance at line 157). It is cited there: in the Tau Ceti contract, in the E0.3 contract line, and in 5.2's text, *Needs* and Dependencies.
- **Lazard's theorem for ordinary modules.** It is `TauCeti.flatModuleFilteredFree` (TauCeti/Algebra/Category/ModuleCat/Flat/FilteredFree.lean:146, any commutative ring). It is cited as the discrete case of 1.3's statement for connective algebras (HA Theorem 7.2.2.15), which it does not replace.

Ownership checked by object, with no second owner found:
- **Search scope.** I searched with the roadmap tools: main (51d880d) and all 454 open roadmap pull requests of the index, which include the 236 of the brief's list. The board's package index lists two unrelated packages.
- **QCoh on prestacks and perfect stacks.** "perfect stack": nowhere. `Ind(Perf(` occurs only for rings (RefinedTraceMethods, GeometryOfNumbersAndQuadraticArithmetic). `QCoh(B…`: StackPointsAndResidualGerbes and SchemeAndStackFoundations use the abelian `QCoh(BG)` of SchemeAndStackFoundations §1.22, which 7.4(b)–(c) consume.
- **Descent of module categories.** The only other owner is LanglandsParameterStacks §1.7, the animated Čech case, which is already cited and extended. "flat hypercover" and "hyperdescent" elsewhere concern prismatic, arc, étale or fppf cohomology: PrismaticCohomology §1.27, ArcTopologyAndDescent, SchemeAndStackFoundationsPartII and PurityForFlatCohomology. None concerns module ∞-categories of connective test rings.
- **Compact objects of `D_QCoh` for qcqs schemes.** In SchemeKTheoryOperations this consumes SchemeAndStackFoundations §2.18, as 8.1 does.
- **Other "prestack" users.** FormalConnectionsOpers and AlgebraicModuliForArithmeticGeometry use 1-categorical prestacks and have no QCoh on prestacks.
- **Closest roadmaps** (`scratch/overlaps.md`): EnhancedDerivedSheaves (on main and in two open revisions), HypercompletenessAndCoherence, AnalyticStacks, InfinityCategoryTheory, SchemeAndStackFoundations and AlgebraicModuliForArithmeticGeometry. Their scope sections agree with the design's split. AnalyticStacks is a later consumer of 2.2.

Library claims checked at the pins (file:line read):
- the eleven Mathlib declarations added for 8.6;
- `CategoryTheory.IsFinitelyPresentable` (Presentable/Finite.lean:49);
- the absence of a Kan-complex instance for groupoid nerves (only `Quasicategory (nerve C)` at Quasicategory/Nerve.lean:32);
- the absence of compact objects of additive categories (no "compact object" or "compactly generated" in Mathlib/CategoryTheory);
- the two Tau Ceti declarations above.

## Citations resolved against main, the open heads and the pins

- **EnhancedDerivedSheaves (main).** All 67 backticked names of the contract occur in its README, and every E-label cited has its heading (E0.3–E0.8, E1.3, E1.4, E1.8, E1.8.DMA.1, E2.6–E2.8, E2:towers.1, E3.1–E3.4, E5:abstract.1–5, E5:presentability.1–4, E5:descent, E5:animation.1/.3/.4, E5). `descendableCover_zariski` is in E2.8 (line 2427), `homotopyFixedPoints` and `continuousDerivedInvariants` in E5:presentability.3.
- **SchemeAndStackFoundations (main).** All 34 names, and §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18.
- **Other suppliers on main.** DerivedModuleAlgebra: 4 names, §0.2, §1.E.0. ReductiveGroups: Layers 1, 3, 6. StableHomotopyKTheory: §5.17, `IsCompactForCoproducts`.
- **Suppliers at open heads.** PrismaticCohomologyPartII §4.0 (#1065): all 19 names. LanglandsParameterStacks §§1.7–1.8 (#1202). HabiroCohomologyFoundations §§1.27–1.28 (#1428). AnalyticStacks §§1.1–1.2 (#1687).
- **InfinityCategoryTheory family** (one pull request adding the Part folders, by another author, so admissible). Every labelled statement cited resolves to a `**k.n.n.**` statement with the content the README attributes to it. The Parts are InfinityCategoryFoundations, CartesianFibrations, PresheavesAndCompletions, LimitsAndKanExtensions, PresentableInfinityCategories, DerivedInfinityCategories, StableInfinityCategories, InfinityTopoi and HypercompletenessAndCoherence. For the "step" citations I read the proof routes of InfinityTopoi §§8.4.1, 9.1.1 and 9.2.3: the injectivity step, covering sieves as images, and local lifting for any topology.
- **`roadmaps resolve` on the package README:** no cross-roadmap citation and no Lean name found nowhere. The tool could not check names outside TauCetiRoadmap on this host ("no pinned Lake packages on this host"), so I checked the Mathlib and Tau Ceti names added in this package by hand (file and line above).

## Supplier gaps

Unchanged and still open on main:
- `gap:chevalley-quasiprojective-quotient` (ReductiveGroups, Layer 3): ReductiveGroups has no statement that `GL_n/H` is quasi-projective. The only "quasi-projective" hit is 3A.5e on complex Lie groups, and the only "Chevalley's theorem" is on constructibility of orbits.
- `gap:twist-quasiprojective` (SchemeAndStackFoundations §1.16): §1.16 proves `contractedProduct_isAlgebraicSpace` and nothing about quasi-projectivity or ampleness.

## Elaboration

`lake env lean` on the file, run from the content checkout: exit 0, **exactly 1 `sorry` warning**, no other message:

```
packages/QuasicoherentSheavesOnPrestacks/Suggested.lean:79:8: warning: declaration uses `sorry`
```

No `TauCeti.*` import is used.

`#check @` with universes printed, in one scratch copy, gives:

```
not_preservesCoproducts_trivial.{u_1, u_2} : ∀ (k : Type u_2) [Field k] (Γ : Type u_2) [Group Γ] [Finite Γ] (p : ℕ)
  [Fact (Nat.Prime p)] [CharP k p], p ∣ Nat.card Γ → ∀ [HasDerivedCategory.{u_1} (Rep.{u_2} k Γ)],
  ¬∀ (J : Type u_1), PreservesColimitsOfShape (Discrete J)
      (preadditiveCoyoneda.obj (op ((DerivedCategory.singleFunctor (Rep k Γ) 0).obj (Rep.trivial k Γ k))))
```

This matches README 8.6:
- field, finite group, prime p, characteristic p, `p ∣ |Γ|`;
- k and Γ in one universe (u-small);
- index types in the morphism universe, as in §5.17.

No hypothesis is lost to a section variable: every binder is in the signature. The first draft carried a predicate whose elaborated type I also checked; it was deleted in the duplication sweep, which changed the statement's form and not its content. Under the `module` header the declaration elaborates as private, as in AdelicAlgebraicGroups on main, which uses the same header.

## Gate and dependency check

The full gate (without `--build`) ran on a local clone of the content repository at main 51d880d, in the job's scratch directory, with the package folder committed:

```
gate QuasicoherentSheavesOnPrestacks: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check, with the command of the brief:

```
depcheck: 244 roadmaps, 2274 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line; the roadmap is listed at line 218 of the merge order. Shape checks by script:
- all 33 plan targets have their subsection;
- every subsection has at least 3 Checks and exactly one *Needs* line;
- all 8 layers end with Examples and Dependencies;
- no LaTeX delimiters, process words, pull-request numbers or machine paths.

## Adversarial pass

The rows cover every statement written or changed here, and the headline theorems.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 8.6 / `not_preservesCoproducts_trivial` | `Γ = ℤ/2`, `k = 𝔽₂`; `Γ = S₃`, `k = 𝔽₃`; `Γ = S₃`, `k = 𝔽₂` | `Hⁱ(ℤ/2; 𝔽₂) = 𝔽₂` for all i (`ρ(g) − 1 = 0`, norm `1 + g = 2 = 0`), so `Hom(k, ⊕k[i]) = ∏𝔽₂ ≠ ⊕𝔽₂`. `S₃`, `𝔽₃`: `C = C₃`, `V` of dimension 2, `Hⁱ(S₃; V) = Hⁱ(C₃; 𝔽₃) = 𝔽₃`; with trivial coefficients `H¹ = H² = 0` (abelianization of order 2; `C₂` acts on `H²(C₃; 𝔽₃)` by −1). `S₃`, `𝔽₂`: `C = ⟨(12)⟩`, `V` of dimension 3, `Hⁱ = 𝔽₂` | holds | — |
| same: degenerate and non-instances | Γ trivial; `Γ = ℤ/3`, `k = 𝔽₂`; `k = ℚ`; p = 4 or 1 | `p ∤ 1`, and k is compact since `Hom(k, X) = H⁰X`; `2 ∤ 3`, and k is projective over `𝔽₂[ℤ/3]` (Maschke), so `Hom = (H⁰X)^Γ` commutes with sums; `CharP ℚ p` is false; `Fact (Nat.Prime 4)` and `Fact (Nat.Prime 1)` are false | hypotheses exclude every compact case | — |
| same: junk value of `Nat.card` | `Γ = ℤ` with `[Finite Γ]` dropped | `Nat.card ℤ = 0` and `p ∣ 0`; yet k is the cokernel of the injective `t − 1` on `k[t^{±1}]`, perfect, hence compact, so the statement would be false | `[Finite Γ]` is needed and present | Check added to 8.6 |
| same: universes | the witness family | `J = ULift ℕ` in the morphism universe w; coproduct P = V in all degrees ≤ 0 with zero differentials; `Hom(k, P) = ∏ᵢ Ext^i(k, V)` | holds for every w | — |
| §5.17 compactness = ∞-compactness (8.6, first API fact) | ℤ, ℚ, `⊕_ℕ ℤ` in `D(ℤ)` | `Hom(ℤ, ⊕Xᵢ) = H⁰(⊕Xᵢ) = ⊕H⁰Xᵢ`, compact, and perfect (1.4); `ℚ → ℚ/ℤ = ⊕_ℓ ℤ[1/ℓ]/ℤ` sends `1/ℓ` into the ℓ-th summand for every ℓ, so ℚ is not compact, and ℚ is not perfect (1.4 Check); the identity of `⊕_ℕ ℤ` has infinitely many nonzero components | agrees with HA 1.4.4.1(3) and with 1.4 | — |
| homotopy category of `Fun(BΓ, Mod_k)` (8.6, second API fact) | Γ = 1; `Γ = ℤ/2`, `k = 𝔽₂`; shift sign | `Fun(pt, Mod_k) = Mod_k`, with homotopy category `D(k) = D(Rep k 1)`; `π₀ Map(O, O[1]) = H¹(ℤ/2; 𝔽₂) = 𝔽₂` (2.2 Check) and `Ext¹_{𝔽₂[ℤ/2]}(𝔽₂, 𝔽₂) = 𝔽₂`; `V[1]` sits in Mathlib degree −1, so `Hom(k, V[1]) = Ext¹` | consistent | — |
| 8.3(a)/(b), Ind argument | `Y = X = Spec A`, f = id, `L = O`; N = 0; `X = BG_m`, f = id, `L = O(1)` | `Map(M, N)`, small; constant presheaf on a point, the zero object of `Ind(C₀)`; `Map(M ⊗ O(−n), N) = Map(M, O(n) ⊗ N)`, a mapping space of the graded `Mod_R` | adjoint exists without assuming `QCoh(Y)` presentable | corrected (see above) |
| 8.3(d), smallness formula | `X₁ = X₂ = Spec ℤ`, Y final | `Map(ℤ ⊠ ℤ, N) = Map(ℤ, π_{1*}N)`; `M₂ = ℤ` is dualizable with `M₂^∨ = ℤ` | holds | added |
| 1.3, discrete Lazard | `M = ℚ` over ℤ; `M = ℤ/p` | `ℚ = colim(ℤ →² ℤ →³ ℤ → ⋯)`, finite free; `ℤ/p` is not flat and is not a filtered colimit of finite free modules, which are torsion-free | matches `TauCeti.flatModuleFilteredFree` (commutative ring R) | citation added |
| 5.2 through `SSet.fullEnhancedSubcategory` | Spec of a DVR, edge `O → j_!O_U` | a simplex lies in the subset iff all its vertices satisfy P; `j_!O_U ∉ Dqc` (5.2 Check), so the edge is excluded; a "some vertex" model would contain it | right model | citation added |
| Mathlib contract: "no compact objects" | Mathlib/CategoryTheory | no "compact object" or "compactly generated" hit; `IsFinitelyPresentable` (Presentable/Finite.lean:49) quantifies over filtered colimits, not over coproducts. I first wrote that derived categories lack filtered colimits; I did not justify that, so the README sentence now says only that the notion is different | holds as narrowed | added, then narrowed |
| 3.2 (headline) | ℤ → ℤ[1/2] × ℤ[1/3]; ℤ → 𝔽_p × ℤ[1/p]; `𝔽_p → 𝔽_p[ε]/ε²` | the affine line's equalizer is `ℤ[1/2] ∩ ℤ[1/3] = ℤ`; mixed factors 0, so the equalizer contains `(1, 0)`, outside the image of ℤ (no flatness, no descent); free of rank 2 descends | holds; flatness needed | — |
| 5.3 (headline) | `ℙ¹_k`; `⨿_ℕ Spec ℤ` | `π₀ Map(O, O(−2)[1])` is the cokernel of `k[t] ⊕ k[t⁻¹] → k[t^{±1}]` twisted by `t⁻²`, which is `k·t⁻¹ = H¹(ℙ¹, O(−2))`; both sides are `∏_ℕ D∞(ℤ)` | holds | — |
| 6.3 (headline) | (ℤ, ℤ²) and (ℤ, ℤ[1]) in `D∞(ℤ)²` | evaluation of `ℤ²` goes from rank 4 to rank 1, so the object is dualizable and not invertible; `ℤ[−1] ⊗ ℤ[1] → ℤ` is an equivalence, so invertible | holds | — |
| 8.2 / 8.5 (headlines) | `BG_m` over R; `B(ℤ/p)` over `𝔽_p` and ℚ | weight-n part `M ↦ M_n` preserves colimits, so `O(n)` is compact; `π₀ Map(O, ⊕O[i]) = ∏𝔽_p ≠ ⊕𝔽_p`; over ℚ, `Hⁱ = 0` for i > 0 | holds; consistent with 8.6 | — |

## Sources

- **HA, two new locators.** Proposition 1.4.4.1(3), p. 154 (`HA line 5809`), and Remark 7.1.1.16, p. 1206 (`HA line 46277`). Both are in the existing key `HA`, whose `cited_for` gains "8.6".
- **HR-perf.** Its `cited_for` gains "8.6", because the theorem's docstring cites its Introduction.
- No new work, no fetch and no request.

## Untrusted text

Nothing read in the supplier READMEs, the reviews or the sources gave instructions. There is nothing to quote.

## Merge order and open revisions

- **Merge order.** Every supplier is on main, earlier in the merge order, or the InfinityCategoryTheory family (new folders by another author).
- **Open revisions.** Three open pull requests revise suppliers this roadmap cites: two of EnhancedDerivedSheaves, and one revising several roadmaps including SchemeAndStackFoundations and ReductiveGroups. I cite those roadmaps as they are on main, and the overlap tool reports no id they drop.
- **Ownership.** Ownership was checked against all open roadmap pull requests in the tools' index, not only the brief's list.
