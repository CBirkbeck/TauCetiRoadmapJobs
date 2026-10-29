# Review of HopfologicalAlgebra (pull request #222 at 48f2f48)

**Verdict:** needs changes

Five findings, two blocking (P2). The recorded gate passes, the independent elaboration of `Suggested.lean` passes with exactly ten `sorry` warnings, the dependency check reports no problem, and no file outside the roadmap folder changes. All eleven findings of the previous review are repaired (the per-finding record is under **Verified sound**). The two blocking findings are a missing Artinian hypothesis in the smooth-basic comparison and a supplier contract that names GrothendieckEulerForms for a Verdier-quotient `K₀` sequence that roadmap excludes.

## R01 (P2) — The smooth-basic comparison and its `K₀` formula drop Qi's Artinian hypothesis

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:511–514`, “For `A` smooth (…), basic in Qi's split sense (all simple modules one-dimensional, Qi, Definition 9.3) and with trivial `H`-action, `Dᶜ(A,H) ≃ Dᶠ(A,H)`”; the same hypothesis list at `README.md:545–546` for `K₀(A,H) ≅ K₀(A) ⊗_ℤ K₀(H-stmod)`.

**Claim:** smoothness, one-dimensional simples and trivial action suffice for Qi's Proposition 9.8 and Proposition 9.10.

**Witness:** Qi's Definition 9.3 opens with an Artinian (or graded finite-dimensional) algebra (`qi` line 2254), and “smooth basic” is defined to include Artinian (`qi` lines 2266–2271); Lemma 9.6, which both proofs use, assumes Artinian (`qi` line 2282). Counterexample without it: `k = ℂ`, `A = ℂ[t]` (smooth, every simple one-dimensional, trivial action), `H = H₄`. The object `A = A ⊗ k` is compact (Qi, Lemma 7.3). Its restriction to `H₄` is `⊕_ℕ k`, and in `H₄-StMod` the stable endomorphism ring of `k` is `k` (every map `k → H₄ → k` sends `Λ` to `ε(Λ)c = 0`), so `Hom(k, ⊕_ℕ k) ≅ ⊕_ℕ k` is infinite-dimensional, while every finite-length `ℂ[t]`-module is finite-dimensional and has finite-dimensional stable Hom from `k`. Hence `A` is isomorphic in `D(A,H)` to no finite-length module and `Dᶜ(A,H) ≠ Dᶠ(A,H)`. The Check at `README.md:522–523` already treats Artinian as a hypothesis separate from basic, so the omission is in the two statements, not in the Checks.

**Repair:** in §5.3 and §6.1 state the hypothesis as “`A` Artinian (or graded finite-dimensional), smooth and basic with trivial `H`-action”, and add `A = ℂ[t]` with `H = H₄` as a negative-control Check. On the retained instance `A = k × k`, `H = k[d]/(d²)` in characteristic two, `A` is Artinian, `K₀(A) = ℤ²`, `K₀(H-stmod) = ℤ/2`, and both sides of the `K₀` formula are `(ℤ/2)²`.

## R02 (P2) — GrothendieckEulerForms is cited for a Verdier-quotient `K₀` sequence it excludes

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:143–145`, “Layer 2: the exact and triangulated Grothendieck groups and the quotient sequence for a Verdier quotient by a thick subcategory”; used at `README.md:694–695`, “`K₀` of the Verdier quotient by a thick subcategory is `K₀(H_n-gmod)` modulo the classes of `I` (GrothendieckEulerForms, Layer 2)”, the step on which both `K₀(O_n)` formulas of §8.2 rest.

**Claim:** GrothendieckEulerForms, Layer 2 supplies `K₀(T/S) ≅ K₀(T)/⟨[S]⟩` for a thick subcategory `S` of a triangulated category `T`.

**Witness:** on main, `TauCetiRoadmap/GrothendieckEulerForms/README.md:34` lists “Verdier quotients, derived localization, or singularity categories” among what that roadmap does not construct or use, and its Layer 2 (`README.md:238–281`) contains split, exact, abelian and triangulated `K₀`, bounded-complex comparisons and graded `K₀`, but no localization sequence. The right-exact sequence `K₀(B) → K₀(C) → K₀(C/B) → 0` for the raw Verdier quotient is stated by DGAInfinity, Layer 7 (`TauCetiRoadmap/DGAInfinity/README.md:505–509`), a roadmap this README already consumes for Verdier quotients.

**Repair:** replace the contract and the §8.2 route by DGAInfinity, Layer 7 (raw Verdier quotient, no idempotent completion, which is the form Laugwitz–Qi use at `laugwitz-qi` line 1342), or, if that statement is read as restricted to DG quotients, state the right-exact sequence for a Verdier quotient of a triangulated category by a thick subcategory as a target of §6.1 with its own locator and route (objects of the quotient are objects of `T`; every distinguished triangle of `T/S` is isomorphic to the image of one of `T`). Keep GrothendieckEulerForms, Layer 2 for the triangulated `K₀` itself. On the instance `n = 4`, `t = 1`: `I_1` is the projectives, the sequence gives `K₀(O₄) = ℤ[ν,ν⁻¹]/(1 + ν²)`, as the Check at `README.md:713` states.

## R03 (P3) — Two conventions for the internal Hom action, one attributed to a source that writes the other

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:280–282`, “internal Hom action `(h·f)(m) = Σ h₁ f(S(h₂)m)` … (Khovanov, Proposition 2; Qi, Lemma 2.3)”; compare `README.md:409`, “`(h·g)(m) = Σ h₂·g(S⁻¹(h₁)·m)` (Qi, Definition 5.1)” and the Check at `README.md:425`.

**Claim:** §2.1 and §4.1 use the same `H`-module structure on `Hom_k(M,N)`, the one of Qi's Lemma 2.3.

**Witness:** Qi's Lemma 2.3 writes `(h·f)(m) = Σ h₍₂₎ f(S⁻¹(h₍₁₎) m)` (`qi` lines 269–271), the §4.1 form; Khovanov's Proposition 2 mentions no Hom. The two formulas are different module structures: in `H₄` with `M = H₄`, `N = k` trivial and `f = (gx)*`, the §2.1 form gives `(x·f)(1) = −f(gx) = −1`, the §4.1 form gives `(x·f)(1) = +f(gx) = +1`. Both have the `H`-linear maps as invariants and both make `Λ·Hom` the null ideal, so no statement is false; the roadmap names two objects by one phrase and cites the wrong one at §2.1. The §2.1 Check with `C₂` (`S = S⁻¹`) cannot separate them.

**Repair:** use the `S⁻¹` form of Qi, Lemma 2.3 and Definition 5.1 throughout Layer 2, or state both forms with the identification `Hom_k(M,N) ≅ N ⊗ M*` versus `N ⊗ *M` and a Check on `H₄` such as the one above.

## R04 (P3) — Locator and wording slips

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:488–489`, “the bar resolution is functorial, cellular, and surjects by quasi-isomorphisms (Qi, Theorem 6.6)”; `README.md:508`, the Noetherian equivalence without a locator; `README.md:11`, “the Laugwitz–Qi multi-differential construction `O_n` in every characteristic”.

**Claim:** each cited result is at its locator and the Summary's scope matches §8.1.

**Witness:** Qi's Theorem 6.6 gives the short exact sequence `0 → M → aM → p̃M → 0` (`qi` lines 1266–1271); the surjective quasi-isomorphism `p_M ↠ M` is Corollary 6.7 (`qi` lines 1277, 1306). The Noetherian equivalence is asserted without proof at `qi` line 2228 (§9.1, p. 56). §8.1 requires a primitive `N`-th root of unity, so `char k ∤ N` (`laugwitz-qi` lines 511–512, 631).

**Repair:** cite Theorem 6.6 and Corollary 6.7; attach “(Qi, §9.1, p. 56, asserted there; proved here by the two-sided freeness)” to the Noetherian equivalence; write “in every characteristic prime to `N`” in the Summary.

## R05 (P3) — Redundant `CharP k p` hypothesis on the slash-homology headline

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean:307`, `[Fact p.Prime] [CharP k p] (P : TruncatedPrimitive (k := k) H p)`.

**Claim:** the characteristic hypothesis is needed for the statement.

**Witness:** `TruncatedPrimitive` supplies a primitive `d` with the monomial basis `1, d, …, d^(p−1)` and `d^p = 0`. By `TauCeti.Bialgebra.comul_pow_of_primitive`, `0 = Δ(d^p) = Σ binom(p,i) d^i ⊗ d^(p−i)`, and `d ⊗ d^(p−1)` is a basis element of `H ⊗ H`, so `p = 0` in `k`: for prime `p` the record already forces `char k = p`. Instance: `p = 2`, `𝔽₂[d]/(d²)` admits the record; `ℚ[d]/(d²)` admits none.

**Repair:** drop `[CharP k p]` from the theorem (and the matching “`char k = p`” can stay in the README as a derived fact), or keep it and say in the docstring that it is implied. Nothing else changes.

## Verified sound

**Gate and build.** The worker's gate at `48f2f48` records every scanner, the dependency check and the targeted build passing. Independently, `lake env lean` on `TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean` exited 0 with exactly ten `declaration uses sorry` warnings (lines 80, 88, 100, 107, 117, 143, 207, 219, 257, 304) and nothing else. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. No `set_option`, no `lemma`, no sorry'd data, no admitted `example`, imports are `import Mathlib` plus five `TauCeti.*` modules that exist at the pin.

**Supplier direction.** The dependency check with `--movable` printed exactly

```text
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. Every `*Needs:*` line names Mathlib, Tau Ceti, a layer of this roadmap, or one of QuantumGroups, StablePeriodicCurved, DGAInfinity, GrothendieckEulerForms, all on main. Cross-roadmap citations resolved on main: QuantumGroups Q8 item 5 (`TauCetiRoadmap/QuantumGroups/README.md:701–734`: `FiniteHopfModuleCat k H`, tensor through the coproduct, right duals via `S`, left duals given `Function.Bijective (HopfAlgebra.antipode)`); StablePeriodicCurved Layer 0 (`README.md:154–197`: additive quotient by an ideal with universal property, Frobenius exact categories, `λ(a*b)=λ(b*ν(a))`) and Layer 1 (`README.md:199–228`: Happel triangulation, exact functors descend to triangle functors, extension-closed Frobenius subcategories), and its own statement that HopfologicalAlgebra owns the hopfological quotient (`README.md:38–41`, `147`), which makes the Downstream-consumers paragraph true; DGAInfinity Layers 0, 1, 5, 7 (`README.md:263–316`, `431–466`, `490–519`); GrothendieckEulerForms Layers 0, 2, 6 (`README.md:178–214`, `238–281`, `437–479`), except the Verdier `K₀` sequence of R02. The shift conventions agree: Tau Ceti `(M{n})ₚ = M_{p−n}` (`TauCeti/Algebra/Category/GradedModuleCat/Basic.lean:237–251`), GrothendieckEulerForms `[M{n}] = qⁿ[M]`, this README `[M{1}] = q[M]` and `[W_k{r}] = ν^r w_k`; the Nakayama convention `φ(b ν(a)) = φ(ab)` of Tau Ceti agrees with StablePeriodicCurved Layer 0 and with Fischman–Montgomery–Schneider's `η`.

**Ownership.** Searched by object with `roadmaps grep` over the 430 open pull requests and main for smash product, module algebra, hopfological, Nichols, Taft, Sweedler, slash homology, bosonization, left integral, cointegral and comodule algebra. Hits outside this roadmap are topological smash products (RefinedTraceMethods, BordismFormalGroups, StableHomotopyKTheory), the derived module algebra of DerivedModuleAlgebra (unrelated meaning), QuantumEnvelopingAlgebras' Sweedler notation and root-datum bosonization, and McKaySkewGroup's skew product of a finite group action, which this roadmap lists only as an example. No second owner of integrals, the relative category, cofibrancy, the finite-dual comparison or `O_n`; no declaration of `Suggested.lean` carries a fully qualified name declared elsewhere. The board's packages index lists no package for these objects.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`):

| Declaration | File and line at the pin | What it gives, and does not |
|---|---|---|
| `LinearMap.IsFrobeniusFunctional`, `IsSymmetricFrobeniusFunctional` | `TauCeti/Algebra/Algebra/Frobenius/Basic.lean:90`, `95` | nondegenerate `(a,b) ↦ φ(ab)`; symmetry added |
| `IsFrobeniusFunctional.nakayamaAut`, `apply_mul_nakayamaAut`, `coe_nakayamaAut_eq`, `moduleInjective_self` | same file `308`, `326`, `338`, `367` | `φ(b ν a) = φ(a b)`, uniqueness, self-injectivity; finite-dimensional over a field |
| `TauCeti.ConvolutionDual`, `instHopfAlgebra`, `antipode_apply` | `TauCeti/Algebra/HopfAlgebra/FiniteDual/Basic.lean:55`, `510`, `538` | Hopf dual for `CommRing k`, `Module.Finite`, `Module.Projective`; antipode is precomposition |
| `WithConv.toConv`, `WithConv.linearEquiv` | `Mathlib/Algebra/WithConv.lean:29`, `139` | `linearEquiv : WithConv A ≃ₗ A`, so `evalConv` composes correctly |
| `TauCeti.Comodule` | `TauCeti/Algebra/Coalgebra/Comodule/Basic.lean:56` | right coaction, coassociativity and counit; no multiplicativity |
| `ExactStructure.abelian`, `IsFrobenius`, `IsFrobenius.stableIsTriangulated` | `TauCeti/CategoryTheory/Exact/Abelian.lean:123`; `Exact/Frobenius.lean:52`; `Exact/Stable/Triangulated.lean:205` | all short exact sequences; enough projectives = injectives; Happel |
| `FGModuleCat.abelian_isFrobenius` | `TauCeti/Algebra/Category/FGModuleCat/Frobenius.lean:122` | finitely generated modules only, Noetherian hypotheses |
| `TauCeti.Bialgebra.comul_pow_of_primitive` | `TauCeti/Algebra/Bialgebra/Primitive.lean:43` | binomial `Δ(aⁿ)` over any commutative semiring |
| `TauCeti.InternalGrading`, `GradedModuleCat`, `shiftFunctor`, abelian instance | `TauCeti/Algebra/Module/GradedModule/Internal.lean:85`; `Category/GradedModuleCat/Basic.lean:60`, `256`; `Abelian.lean` | `(M{n})ₚ = M_{p−n}`; no coproduct tensor |
| `CategoryTheory.HopfObj`, `ObjectProperty.triangEnvelope`, `ObjectProperty.trW` | `Mathlib/CategoryTheory/Monoidal/Hopf_.lean:37`; `Triangulated/Generators.lean:132`; `Triangulated/Subcategory.lean:458` | as cited |
| `Polynomial.cyclotomic_prime`, `IsGroupLikeElem`, `Module.Dual.eval`, `Module.Basis.dualBasis` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:366`; `RingTheory/Coalgebra/GroupLike.lean:37`; `LinearAlgebra/Dual/Defs.lean:79`; `Dual/Basis.lean:132` | as cited |

Mathlib at the pin has no antipode-bijectivity theorem for finite-dimensional Hopf algebras (only `antipode_antipode` for primitive and group-like elements) and no Grothendieck group of a triangulated category, so `antipode_bijective` and the `K₀` headlines are not library duplicates.

**Signatures.** All 26 declarations were printed with `#check @name` in one scratch file importing the built module (`Probe.lean`, elaborated once). Every elaborated type carries the binders its README statement needs: `[FiniteDimensional k H]` on the six Layer 1 headlines and on the finite-dual equivalence, `[FiniteDimensional k M]`, `[Fact p.Prime]`, `[CharP k p]` on the slash headline, `Λ ≠ 0` and `phi ≠ 0` where the README says nonzero. No definition lost a section variable: `LeftAction`, `LeftModuleAlgebra`, `SmashProduct`, `IsRightComoduleAlgebra`, `evalConv`, `TruncatedPrimitive`, `moduleDifferential`, `SlashHomology` mention exactly the instances their bodies use. Nothing changed as a result.

**Padding.** Each of the ten `sorry`'d theorems was retried in the same scratch file with `first | rfl | simp | infer_instance` (plus `simp_all`, `simp [defs]`, `exact ⟨_⟩` where the shape allowed); all ten failed, so none is a one-tactic consequence of the library. The sixteen definitions are each used by a headline: the integral and cointegral predicates by the Layer 1 theorems, the action, module-algebra, smash and compatibility records by the smash-product theorems and the finite-dual equivalence, the comodule-algebra predicate and `evalConv` by that equivalence, and the truncated-primitive record, its differential and `SlashHomology` by the slash headline. No declaration restates a definition, mirrors a Check or computes a value.

**Headline inventory.** The Summary's end theorems: Frobenius, Nakayama and symmetric criteria (stated: `finrank_leftIntegral`, `isFrobeniusFunctional_of_isRightCointegral`, `antipode_bijective`, `nakayamaAut_symm_eq_winding`, `symmetric_iff_unimodular_and_antipodeSquare_inner`, `hMod_abelian_isFrobenius`); the triangulated monoidal `H-StMod` (not statable, named in the docstring with the missing coproduct monoidal structure); existence and universal property of `A # H` (stated); the module-algebra/comodule-algebra equivalence (stated); Qi's description of `D(A,H)` and its compacts (not statable, named with the missing diagonal `M ⊗ H`); Khovanov–Qi's slash detection (stated); the Grothendieck rings of Taft categories and `O_n` (not statable, named with the missing braided monoidal structure and triangulated `K₀`); the braided Hopf/bosonization comparison (named). The Qi–Sussan finite-cell theorem of §5.3 needs the specific `p`-DG algebras `A_n^!` and is a target, not a Summary headline. No statable headline is absent and none is forced through a stand-in.

**Previous review, finding by finding.** R01: `IsIntegralNull` is gone; §4.1 says “The integral is required nonzero; the ideal is unchanged by rescaling `Λ`” with the `Λ = 0` Check — repaired. R02: §3.1, “The map `h ↦ 1 # h` is injective when `A` is nonzero; for `A = 0` the smash product is zero”, `includeH` is an algebra map, Checks `A = k` and `A = 0` — repaired. R03: `nakayamaAut_symm_eq_winding` states the winding formula for the native `nakayamaAut.symm`; the Taft `N = 3` Check separates `ν_H(K) = qK` from `ν_S(K) = q⁻¹K` — repaired. R04: QuantumGroups Q8 item 5 is the owner of the finite case in Scope, contracts and §2.1 — repaired. R05: `TauCeti.ConvolutionDual.instHopfAlgebra` is consumed, not rebuilt — repaired. R06: the docstring now names `TauCeti.GradedModuleCat` as present and lists only what is missing — repaired. R07: `exists_leftModuleAlgebra_equiv_rightComoduleAlgebra` states the equivalence with the basis formula forward and evaluation backward — repaired. R08, R09: the file is 314 lines with no unused record and no padding (probe above) — repaired. R10: every target has a locator and a `*Needs:*` line; Laugwitz–Qi Theorem 5.5/Definition 5.6/Lemma 5.8 are cited for the quotient; `.Exact.Stable.Triangulated` is the module cited — repaired (the new slips are R04 above). R11: Summary, Scope, Conventions, contracts, build order, at least three Checks per definition, Examples and Dependencies per layer — repaired.

**Sources at their locators** (line numbers are of the cached texts). `qi` (arXiv v2): Lemma 2.3 lines 263–271; Definition 2.4 lines 348–355; Lemma 2.6 lines 372–374; Proposition 2.7 line 382; Example 2.8 lines 388–401; Definition 3.1 lines 419–420; Theorem 3.5 lines 463–465; Theorem 4.2 lines 567–571; Definition 5.1 lines 780–784; Lemma 5.2 lines 807–812; Lemma 5.4 lines 882–886; Corollary 5.5 lines 917–920; Definition 6.1 lines 1132–1137; Definition 6.3 lines 1183–1197; Corollary 6.5 line 1250; Theorem 6.6 lines 1266–1271; Corollary 6.8 lines 1302–1305; Corollary 6.9 lines 1319–1320; Corollary 6.10 lines 1327–1333; Definition 7.1 lines 1602–1604; Proposition 7.6 lines 1633–1635; Corollary 7.15 lines 1818–1823; §4.3 Taft `K₀` lines 754–767 (p. 19); Definition 9.1 lines 2230–2234; Definitions 9.3–9.4 lines 2254–2261; Lemma 9.6 lines 2282–2283; Proposition 9.8 lines 2317–2318; Corollary 9.9 lines 2325–2327; Proposition 9.10 lines 2341–2346. `khovanov` (arXiv v2): Proposition 1 lines 63–68 (Lam cited for all modules); the suspension `TM = (H/kΛ) ⊗ M` lines 84–91 (p. 3); Proposition 2 lines 78–83; Corollary 1 lines 416–417; Proposition 5 lines 769–771 (p. 18); Proposition 7 lines 1083–1084 (p. 27). `khovanov-qi` (arXiv v3): slash cohomology lines 553–565 (p. 14, equation (18)), decomposition (20) lines 588–593. `erdmann-solberg-wang` (arXiv v1): integrals and dimension one lines 139–156 (§2, p. 4); Theorem 2.2(a)–(c) lines 169–178. `qi-sussan-2017` (arXiv v2): Theorem 5.5 lines 805–810 (p. 16). `fischman-montgomery-schneider` (AMS open backfile, printed pages): conventions lines 274–282 (p. 4861), Lemma 1.5 lines 286–297 (pp. 4861–4862), `αS = α⁻¹`, `αS² = α` lines 324–329. `laugwitz-qi` (arXiv v4): Proposition 3.1 line 513; Proposition 3.3 lines 600–601; Definition 3.5, Lemmas 3.6–3.7 lines 628–649; Lemma 3.11 lines 720–730; Lemma 3.12 line 760; Definition 4.4 and (4.5) lines 926–940; Definition 4.5 lines 941–948; Definition 4.12 lines 1055–1056; Proposition 4.16 lines 1070–1087; Theorem 5.5 lines 1139–1140; Definition 5.6 lines 1143–1145; Lemma 5.8 lines 1184–1188; Lemma 5.14 lines 1326–1330; Theorem 5.15 and proof lines 1336–1367 (pp. 27–28). Each supports the README statement at the stated generality, with the exceptions recorded in the findings and under Source issues.

**Adversarial table.** `H₄` is Sweedler's algebra (`g² = 1`, `x² = 0`, `xg = −gx`, `Δx = x⊗1 + g⊗x`), `T₃` the Taft algebra at a primitive cube root `q`, `Jₗ` the indecomposable `k[d]/(d^p)`-module of length `ℓ`.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| `LeftIntegral`, `RightIntegral` | `k`; `k[C₂]`, char 2; `H₄` | `k`: both `k·1`. `k[C₂]`: `g(1+g) = 1+g`, `ε(1+g) = 0`. `H₄`: `g(1+g)x = (1+g)x`, `x(1+g)x = 0`; right line `x − gx`, `(x−gx)g = x − gx` | sound; left ≠ right lines in `H₄` |
| `finrank_leftIntegral` | `k`; `k[S₃]` over `𝔽₂` | `1 = 1`; `span(Σg)`, dimension `1 = 1` with `ε(Σg) = 0` | sound |
| `hMod_abelian_isFrobenius` | `H = k`; `k[d]/(d²)` char 2 | all modules projective and injective; `k` neither, `H` both; `⊕_ℕ H` projective and injective | sound (all modules) |
| `IsRightCointegral` | `H₄`, `φ = x*` vs `φ = ε` | `h = x`: `φ(x)1 + φ(g)x = 1 = φ(x)1`; `h = g`: `ε(g)g = g ≠ 1` | sound |
| `isFrobeniusFunctional_of_isRightCointegral` | `H₄`, `x*`; `φ = 0` | Gram matrix on `1,g,x,gx` has entries `x*(1·x)=1`, `x*(g·gx)=1`, `x*(x·g)=0`, `x*(gx·g)=−1`, invertible; `φ = 0` excluded by `hphi0` | sound |
| `antipode_bijective` | `H₄`; `T₃` | `S(x) = −gx`, `S²(x) = −x`, `S⁴ = id`; `S²(d) = q⁻¹d ≠ 0` | sound |
| `nakayamaAut_symm_eq_winding` | `H₄`, `Λ=(1+g)x`, `φ=x*`; `T₃` | `α(g) = −1`, `α(x) = 0`; `ν_H(g) = −g`, `ν_H(x) = x`; `φ(ag) = φ(ν_H(g)a)` for `a ∈ {1,g,x,gx}`: `(0,0,0,−1) = (0,0,0,−1)`. `T₃`: `ΛK = q⁻²Λ`, `α(K) = q`, `ν_H(K) = qK`, `ν_H(d) = q·q⁻¹d = d`; Tau Ceti's `ν_S(K) = q⁻¹K` | sound; orientation pinned |
| companion formula (§1.3) | `H₄`; `T₃` with `φ = (d²)*` | `Σφ(x₂)x₁ = g ⇒ a = g`, `g(−x)g = x`; `T₃`: `Σφ(h₂)h₁ = K²` for `h = d²`, so `a = K`; `K⁻¹(qK)K = qK`, `K⁻¹(qd)K = d` | sound |
| `symmetric_iff_unimodular_and_antipodeSquare_inner` | `k[S₃]`; `H₄`; `T₃` | true ↔ (true ∧ true); false ↔ (false ∧ true) since `S²(x) = gxg⁻¹` but `α(g) ≠ 1`; `T₃` left `(ΣKⁱ)d²` vs right `d²(ΣKⁱ)` | both directions |
| `LeftModuleAlgebra`, `smashMulPure` | `C₂` on `k[x]`, `g·x = −x`; trivial action; `A = 0` | `(1#g)(x#1) = −x#g` vs `x#g` untwisted; trivial gives `A ⊗ H`; `0 # H = 0`, `includeH` has kernel `H` | sound |
| `SmashProduct`, `smashProduct_nonempty`, `lift_unique` | `A = H = k`, target `k` | `f(a#h) = ah`, `f(2#3) = 6`; covariance for the sign action with `fA(x) = fH(g) = 1` needs `1 = −1`, excluded | sound |
| `IsRightComoduleAlgebra` | `C = k[G]`, `ρ(a) = a ⊗ g` | coassociative `a⊗g⊗g`, counital `ε(g) = 1`, `ρ(1) = 1⊗g ≠ 1⊗1` for `g ≠ 1` | sound negative control |
| `exists_leftModuleAlgebra_equiv_rightComoduleAlgebra` | sign action of `C₂` on `k[x]`; general multiplicativity | `ρ(x) = x⊗δ₁ − x⊗δ_g`, evaluation `x` at `1`, `−x` at `g`; `ρ(a)ρ(b)` evaluated at `h` is `Σ(h₁·a)(h₂·b) = h·(ab)`; `ρ(1) = 1 ⊗ ε`, `ε` the convolution unit | sound |
| §3.3 antipode-inserted formula | `H₄` | `S(h)·(ab) = Σ(S(h₂)·a)(S(h₁)·b)`, order reversed | correctly rejected |
| §4.1 null ideal | `H = A = k`, `Λ = 1` vs `0`; `d` primitive | `id = Λ·id` null; `Λ = 0` leaves only `0`; `(d·f)(m) = d f(m) − f(dm)` from `S⁻¹d = −d` | sound |
| §4.2 relative structure | `A = k`; `H = k`; `A = k[t]/(t²)`, `H = k` | abelian structure; every object projective-injective, `C(A,k) = 0`; `0 → (t) → A → A/(t) → 0` has no `A`-section | sound |
| §5.1 quasi-isomorphisms | `A = k`; `H = k`; `A = k`, `H = 𝔽₂[d]/(d²)` | `D(k,H) = H-StMod`; `D(A,k) = 0`; `H` acyclic, `k` not | sound |
| §5.2 cofibrant vs (P) | `H = k`, `A = k[t]/(t²)`, `M = A/(t)`; nonsemisimple `H` trivial | `C(A,k) = 0` so `M` has (P); `M` not `A`-projective, not cofibrant; `A⊗H → M⊗H` has no section | sound; Qi Cor 6.5 corrected |
| §5.3 compact generation | `A = k`, `H = 𝔽₂[d]/(d²)`; `⊕_ℕ k` | generator `k`; `Hom(k,k) = k`, `Hom(k,H) = 0`; `id_{⊕k}` not in `⊕Hom` | sound |
| §5.3 Noetherian iff | `A = k[t]`; `A = k[x₁,x₂,…]` | `A#H ≅ A^{dim H}` as left and (via `S⁻¹` normal form `b#h ↦ Σ h₂ ⊗ S⁻¹(h₁)·b`) right `A`-modules; `BI ∩ A = I`; chain `(x₁,…,x_j)` extends strictly | both directions |
| §5.3 smooth basic | `A = ℂ[t]`, `H = H₄`; `A = k×k` | `A` compact, `Res A = ⊕_ℕ k`, stable `Hom(k, ⊕_ℕ k)` infinite-dimensional; `k×k` Artinian, `Dᶜ = Dᶠ` | R01 |
| §5.3 Qi–Sussan | `(p,n) = (2,3),(2,2),(3,4),(3,3)` | `n−1 mod p = 0,1,0,2`; finite-cell true, false, true, false | sound |
| §6.1 `K₀(H-stmod)` | `k[d]/(d²)` char 2, `deg d = 1`; `H = k` | `[H] = (1+q)[k] = 0`, `ℤ[q,q⁻¹]/(1+q)`; `H = k` gives `0` | sound |
| §6.1 finite-target pairing | `k = 𝔽₂`, `H = k[d]/(d²)`, `A = k(t)`, `P = M = A` | `Hom_A(A,A) = k(t)` with `d = 0`, stable invariants `k(t)`, infinite over `k` | source corrected |
| §7.1 obstruction | `ℚ[d]/(d²)`; `𝔽₂[d]/(d²)`; super; `H₄` | `Δ(d²) = 2 d⊗d ≠ 0`; `= 0`; `d⊗d − d⊗d = 0`; `(dg+gd)⊗d = 0` | sound |
| §7.2 null formula | `p = 3`, `J₃`, `h` top ↦ bottom | `Λ·h = Σ_i d^{2−i} h dⁱ` from `binom(2,i) ≡ (−1)^i`, `S⁻¹(dⁱ) = (−1)^i dⁱ`; equals `id` with diagonal `(1,1,1)` | sound, degree `1−p` |
| `SlashHomology` | `p = 2`; `p = 3`, `J₁`, `J₂`, `J₃` | `ker d/im d`; `(k,0)`, `(kd, k)`, `(0,0)` | sound |
| `slashHomology_subsingleton_iff_projective` | `p = 3`, `J₁, J₂, J₃`; `p = 2`, `J₁, J₂` | vanishing exactly for `J₃`, `J₂` = projective; `(d⊗d^{p−1})` coefficient `p` forces `char p` | both directions; R05 |
| §7.2 `K₀` | `p = 2, 3`; `k[d]/(d⁴)` char 2 | `1+q = Φ₂`, `1+q+q² = Φ₃`; `Δ(d⁴) = d⁴⊗1 + 1⊗d⁴`; `1+q+q²+q³ = Φ₂Φ₄ ≠ Φ₄` | sound |
| §7.3 Nichols/Taft | `N = 2, q = −1`; `N = 3`; `N = 1`; `q = 1` char 0; `N = 4` | exterior/`H₄`; `dim 9`, `α(K) = q`; `k`; `k[d]`; `Φ₂Φ₄` | sound |
| §8.1 arithmetic | `n = 4, 6, 12, 30` | `(m,N) = (2,8),(6,6),(6,24),(30,30)`; `ξ_k` orders `p_k n/m`: `4`; `(2,3)`; `(4,6)`; `(2,3,5)`; `ξ_k^{n_k}` orders `p_k` | sound |
| §8.1 `H_n`, bosonization | `n = 4`; `n = 6` | `k[d]/(d²)`, `deg d = 2`, dim `16 = 8·2`; `dim H_6 = 6`, `36`; `d₂⊗d₂` double braiding `q⁸ = q² ≠ 1` | sound |
| §8.2 `K₀(H_n-gmod)`, `(4.5)` | `n = 6` | `v₁ = 1+ν³`, `v₂ = 1+ν²+ν⁴`, `dim_ν W_k = w_k = ∏_{l≠k} v_l` | matches Lemma 5.14 and (4.5) |
| §8.2 `t = 2` | `n = 6`; `n = 12` | `(1+ν+ν²) − ν(1+ν) = 1`, `K₀(O₆) = ℤ[ν,ν⁻¹]/(ν²−ν+1)`; `1+ν⁴+ν⁸ = Φ₃Φ₆Φ₁₂`, `1+ν⁶ = Φ₄Φ₁₂`, gcd `Φ₁₂`; `Φ_d, Φ_e` coprime when `d/e` is no prime power | sound |
| §8.2 `t ≥ 3` | `n = 30` | `v₁ = Φ₂Φ₆Φ₁₀Φ₃₀`, `v₂ = Φ₃Φ₆Φ₁₅Φ₃₀`, `v₃ = Φ₅Φ₁₀Φ₁₅Φ₃₀`; gcd of `w_k` is `Φ₆Φ₁₀Φ₁₅Φ₃₀²`, degree `30`; each `w_k ≡ 0 mod Φ₃₀²`, `Φ₃₀(ν) ≠ 0` in `ℤ[ν,ν⁻¹]/(Φ₃₀²)` | sound; source Theorem 5.15 refuted for `t ≥ 3` |
| §8.2 `t = 1` | `n = 4` | `K₀(O₄) = ℤ[ν,ν⁻¹]/(1+ν²)`; empty product `w₁ = 1` would give `0` | sound |
| §2.1 Hom action | `H₄`, `f = (gx)*` | `−1` vs `+1` at `(x·f)(1)` | R03 |
| §2.2 suspension | `k[d]/(d³)` char 3 | `T(k) = J₂`, `T²(k) = k` | sound |

**Not in the merge order.** HopfologicalAlgebra is not yet listed; the check placed it after its last supplier, which is not a finding.

## Not verifiable

- **Larson–Sweedler (1969)**: cited only through Erdmann–Solberg–Wang and Fischman–Montgomery–Schneider, both read; the original text was not fetched.
- **Montgomery, CBMS 82**: a book with no open text; the finite-dual duality of §3.3 is cited to it without a locator. The equivalence was verified by direct computation above instead.
- **Radford (1985)**: Elsevier, paywalled; cited for bosonization without a locator. Laugwitz–Qi Lemma 3.11 was used for the bosonization formulas.
- **Majid (q-alg/9512028), Kapranov (q-alg/9611005)**: open but cited without locators as background; not read for this review.
- **Qi–Sussan (2022), Khovanov's and Qi's published versions**: read as arXiv v2/v2/v3 as the README declares; published page numbers were not compared.

## Source issues

- **Error** in laugwitz-qi at Theorem 5.15 and its proof, printed pp. 27–28: the source says the Grothendieck ring of `O_n` is `ℤ[ν,ν⁻¹]/(Φ_n)` for every `n ≥ 2`, deducing a gcd relation from the ideal `(w₁,…,w_t)`; it should be `ℤ[ν,ν⁻¹]/(w₁,…,w_t)`, cyclotomic only when `n` has at most two prime factors; affects a stated result.
- **Error** in qi at Corollary 6.5 and Corollary 6.8, printed pp. 31–33: the source says every module with property (P), defined up to isomorphism in `C(A,H)`, is cofibrant; it should say every module satisfying (P1)–(P3) on the nose is cofibrant; affects a stated result.
- **Error** in qi at §9.1, printed p. 57: the source says the derived Hom pairing lands in `Dᶠ(k,H)` for every Noetherian `A`; it should land in `H-StMod`, or in `Dᶠ(k,H)` when the finite-length modules are finite-dimensional over `k`; affects a stated result.
- **Error** in qi-sussan-2017 at §5.2, paragraph before Theorem 5.5, printed p. 16: the source says `[n]` is a unit in `O_p` whenever `p ∤ n−1`; it should require `p ∤ n`, since `[p] = 0`; affects nothing in Theorem 5.5.
