# Review of HochschildHomologyAndHKR (pull request #2447 at 72a252e)

**Verdict:** needs changes

## R01 (P3) — Layer 8 dependency line takes in §7.6 and with it the declared gap

**Location:** `TauCetiRoadmap/HochschildHomologyAndHKR/README.md:2487`: "Layers 1–7 (§6.4(a) for the antisymmetrisation map, not §6.4(d)); DerivedModuleAlgebra §0.K.1, …"

**Claim:** "Layers 1–7" includes §7.6. Its *Needs:* line (README:2242) lists gap:smooth-hkr-antisymmetrisation, so Layer 8 inherits the gap. That contradicts the build description and §8.4's "without the gap used in §6.4(d)".

**Witness:** README:796–797: "it depends on Layers 1–5, §§6.2 and 6.4(a) and §§7.1, 7.4 and 7.5, not on the smooth HKR input of §6.4(d) and §7.6". README:2242: "*Needs:* §§1.4, 1.5, 5.2, 6.4, 7.1–7.5; gap:smooth-hkr-antisymmetrisation".

**Repair:** In Layer 8 `### Dependencies`, replace "Layers 1–7 (§6.4(a) for the antisymmetrisation map, not §6.4(d));" with "Layers 1–5; §§6.2 and 6.4(a); §§7.1, 7.4 and 7.5 (not §6.4(d), §7.2 or §7.6, hence not gap:smooth-hkr-antisymmetrisation);".

## R02 (P3) — The description announces two lists and gives neither, and never mentions the declared gap

**Location:** the pull request description: "Its content, in order:" (followed directly by "Roadmap folder …"), and "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)."

**Claim:** Neither the layer list nor the supplier list is there. A reader is not told which supplier sections are consumed, or that the README declares a supplier gap on RefinedTraceMethods §1.9.

**Witness:** README:704–775 names the suppliers DGAInfinity, DerivedModuleAlgebra, EulerSystemsAndKolyvaginSystems, IntegralIwasawaTheory, KTheoryFiniteLocalFields and RefinedTraceMethods. README:769 declares "What RefinedTraceMethods must provide (gap:smooth-hkr-antisymmetrisation)".

**Repair:** After "Its content, in order:", insert: "Layer 1, Hochschild complexes with bimodule coefficients; Layer 2, normalisation; Layer 3, low degrees and square-zero extensions; Layer 4, the bar resolution, Ext and Tor; Layer 5, the cup product; Layer 6, comparison with DGAInfinity and with derived chains; Layer 7, polyvector fields and the cohomological HKR theorem; Layer 8, polynomial algebras through the Koszul resolution." Replace the "Dependencies (…)" sentence with: "Suppliers: DGAInfinity Layers 0, 1 and 8, DerivedModuleAlgebra §0.K.1 and IntegralIwasawaTheory §12.6 (on main); EulerSystemsAndKolyvaginSystems §6.1; KTheoryFiniteLocalFields §4.0; RefinedTraceMethods §§1.1 and 1.9. Declared gap gap:smooth-hkr-antisymmetrisation on RefinedTraceMethods §1.9: ε_n is an isomorphism for every n, every commutative ring k and every smooth commutative k-algebra; only §6.4(d) and §7.6 use it."

## R03 (P3) — "Explicit sign dictionary" overclaims for chains

**Location:** `TauCetiRoadmap/HochschildHomologyAndHKR/README.md:13–15`: "An explicit sign dictionary identifies these complexes with the Hochschild cochains and chains of DGAInfinity Layer 8"; the same wording appears at README:48–49.

**Claim:** For cochains the signs are explicit: Θ(δf) = (−1)^{n+1}[m, Θf]. For chains, §6.3 only proves that signs ν_n exist and leaves them undetermined, because the supplier does not fix the sign of its chain differential (README:724).

**Witness:** README:1916: "Prove that there are signs `ν_n ∈ {±1}` with `ν₀ = 1` such that …". The §6.3 Check at README:1940–1941 computes no ν_n.

**Repair:** At README:13–15, write "An explicit sign dictionary identifies the cochain complex with the Hochschild cochains of DGAInfinity Layer 8, and signs `ν_n` fixed by Layer 8's chain differential identify the chain complex with its Hochschild chains, for `A` in degree zero". At README:48–49, write "the comparison between the ungraded complexes and DGAInfinity Layer 8's Hochschild cochains (with an explicit sign dictionary) and chains (with the signs `ν_n` of §6.3)".

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §1.1 `C_•(A,M)`, `b` | `A=M=k`; `Mat₂(k)` | `b_n=Σ_{i≤n}(−1)^i`: `b₁=0, b₂=1` ⇒ `HH₀=k`, `HH_{≥1}=0`; `b(E₁₂⊗E₂₁)=E₁₁−E₂₂`; Ginz05 l.973–976 same formula | holds |
| §1.2 `δ`, `hochschildBimodule{Cocycles,Coboundaries,Cohomology}` | `A=M=k`; `Mat₂(ℤ)` with `op b•m=bᵀm` | `δ^n=0,1,0,1,…` ⇒ `HH⁰=k`; `δδ1(E₁₂,E₁₂)=E₂₂−E₁₁≠0`, so `B⊄Z` and the Lean quotient by `B∩Z` is needed | holds |
| §1.3 functoriality | non-multiplicative `φ` on `k[x]` | image of `b(1⊗x⊗x)` is `2x⊗x`; `b(1⊗φx⊗φx)=2x⊗x−1⊗x²`; they differ by `1⊗x²` | Check correct |
| §2.2 / `exists_homotopyEquiv_normalizedHochschildCochainComplexι` | curried pinned `b`; `A=N=k` | `i=0` term `φ(xa₁,…)=(a₁·ψ)(x)`, last `φ(a_{n+1}x,…)=(ψ·a_{n+1})(x)`; full complex `d=0,1,0,…`, normalised complex `k,0,0,…`: both have `H=k` in degree 0 | true over every `k` |
| §3.3 Der/Inn, `HH¹` | `k[x]`; `Mat₂(k)` | `D↦D(x)` gives `Der≅k[x]`, `Inn=0`; `δE₁₁(E₁₂)=−E₁₂`; Ginz05 l.1075–1085 same sequence | holds |
| §3.4 / `homology_one_linearEquiv_kaehler` | `k[x]/(x²)` over `𝔽₂`, `ℚ`; `k[x]` | `Ω¹` has dimension 2 over `𝔽₂` and 1 over `ℚ`; `[1⊗x²]=2[x⊗x]` ↔ `d(x²)=2xdx`; `N₁` all cycles | true for every commutative `R` |
| §4.2 bar resolution | `B₁(A)`; `A=k`; `k[x]` | `(b′h+hb′)(a₀⊗a₁⊗a₂)=a₀⊗a₁⊗a₂`; `h(x·1⊗1)=1⊗x⊗1≠x⊗1⊗1`; HKR62 l.444–447: right-linear homotopy | holds |
| §4.4 / `nonempty_linearEquiv_ext` | `A=k=M=ℤ`, `n=0,1` | `δ¹=id` ⇒ `HH¹=0=Ext¹_ℤ(ℤ,ℤ)`; `HH⁰=M^A=Hom_{Aᵉ}(A,M)` | true for `k`-projective `A` |
| §5.1 `cupProduct` | `k[x,y]`; Lean `example` | `(∂x∪∂y)(x,y)=1`, `(∂y∪∂x)(x,y)=0`; `finSumFinEquiv` feeds the first `p` arguments to `f` (proved by `simp`); Ginz05 l.1341 | holds |
| §5.2 Leibniz rule | `f,g∈C¹` | `δ(f∪g)(a,b,c)=af(b)g(c)−f(ab)g(c)+f(a)g(bc)−f(a)g(b)c=(δf∪g−f∪δg)(a,b,c)`; Ginz05 l.1344 has the same sign | holds |
| §5.4 cup = Yoneda | `p=0`; `q=0` | `s(0,q)=1`: `mk₀_comp_extMk` (Ext.lean:255) has no sign; `s(p,0)=1`: `extMk_comp_mk₀` (:234) has no sign | consistent |
| §6.1 suspension `Θ` | arity `n=0,1,2` | sign of `Θ(δf)` against `[m,Θf]`: `−1, +1, −1` = `(−1)^{n+1}`; Ginz05 l.1363 has composition sign `(−1)^{(i−1)(q−1)}` | holds |
| §6.2 / `cupProduct_graded_comm` | `f=g=∂` on `k[x]`; `p=q=0` | `2∂a∂b=−δ(∂²)(a,b)=2∂a∂b`; Ginz05 (6.6.3) gives `2=−2` at `(x,x)`; central `f,g`: `0∈B⁰=0` | README form true; source erratum |
| §6.3 chain comparison (R03) | `A=k` | both sides `k` in every degree, differentials alternate `0`/iso; `ν_n` not computable: the supplier's sign is not fixed | existence only |
| §6.4 `ε^cl`, `π^cl` | `k[x,y]`; `𝔽₂`; `ℤ→𝔽₂[x,y]` | `π₂ε₂(dx∧dy)=2dx∧dy`; over `𝔽₂` the composite is 0 but `ε₂≠0` (pairs to 1); `1⊗x²⊗y−1⊗y⊗x²=−b(W)` | holds |
| §7.1 `h_n` | `k[x]`, `M=R`; non-symmetric `M` | `h₁(∂x)([1⊗x])=1`; `δm(x)=m≠0` while every 1-chain is a cycle; HKR62 l.284–298 restriction to cycles | holds |
| §7.2 Lemma 4.1 transport | `ℚ[x]/(x²)`; `𝔽₂[x]/(x²)` | `HH₁=R/(2x)` not projective, `HH₂=xR`, `h₂=0` on `ℚ` vs `Hom(xR,ℚ)=ℚ`; over `𝔽₂` all `HH_j=R` | hypothesis needed |
| §7.4 `T^n`, `τ_n` | `k[x,y]`; `𝔽₂(u)[a]/(a²−u)` | `τ₂(∂x∧∂y)(dx∧dy)=1`; `Der=R∂`, so `T²=0` while `HH²=R` | holds |
| §7.5 / `detCochain_sub_factorial_smul_cupDerivations_mem` | `k[x,y]`; `n=0,1` | `⟨∂x,∂y⟩−2(∂x∪∂y)=−∂xa∂yb−∂ya∂xb=δ(∂x∂y)`; `n=0`: `1−1=0∈B⁰`; `n=1`: `D−D=0` | true for every commutative `R` |
| §7.6 / `cohomological_hkr_hom_kaehler` | `n=0,1`; `ℤ→ℤ[1/2]` | `n=0`: `e(m)(1)=m` (`Perm(Fin 0)` is a singleton); `n=1`: `e[D](dr)=D(r)`; smooth but not `ℤ`-projective | true under the stated hypotheses |
| §7.6 / `cohomological_hkr` | `𝔽₂[x,y]`, `n=2` | `Ψ(∂x∧∂y)` pairs to 1 with `ε₂(dx∧dy)`; `[⟨∂x,∂y⟩]=2Ψ=0`; `[D∪D]=0` because `e[D∪D]` is a determinant with equal columns | true; the `n!` failure is exhibited |
| §8.1 diagonal sequence | `k[X]`; `k[x]/(x²)` | `t` a nonzerodivisor of `k[X,Y]`; `t(x⊗1+1⊗x)=x²⊗1−1⊗x²=0`, a zero divisor; HKR62 l.268–271 | holds |
| §8.3 `ι` | `j=2`; unsigned `ι′` | `b′ι(e₁∧e₂)=t₁(1⊗X₂⊗1)−t₂(1⊗X₁⊗1)`; `ι′` defect `2(X₂⊗X₁⊗1+1⊗X₂⊗X₁−1⊗X₁X₂⊗1)` | holds |
| §8.4 / `homological_hkr_mvPolynomial` | `m=1,n=2`; `m=0` | `1⊗X⊗X²−1⊗X²⊗X=b(1⊗X⊗X⊗X)` ↔ `ε₂(dX∧dX²)=0`; `m=0`: `Ω⁰=k=H₀`, higher degrees 0 | true over every `k` |
| Layer 8 dependencies (R01) | §7.6 *Needs:* | "Layers 1–7" includes §7.6, which carries the gap; README:796–797 excludes it | inconsistent |

- Gate: my run of `gate` and the worker's gate.md are both OK (every check 0). Dependency check: `depcheck: 253 roadmaps, 2400 edges, 0 problem(s)`. Suppliers' merge-order positions (IntegralIwasawaTheory 31, KTheoryFiniteLocalFields 98, EulerSystemsAndKolyvaginSystems 113, RefinedTraceMethods 356) all precede this roadmap at 357.
- Elaboration: `lake env lean` on `Suggested.lean` gives 8 `sorry` warnings and nothing else. The elaborated types of all 14 declarations match their README statements, with every binder explicit and none dropped. One-tactic probe (`rfl`/`trivial`/`infer_instance`/`simp`/`constructor`): 0 of 8 theorems close.
- Source locators checked against the cached texts: 49 (Ginz05 27, HKR62 18, AV20 2, StacksSmooth 2). All support the claims as written, including the README's statement that Ginz05 (6.6.3) is wrong.
- Library declarations opened at the pins: Mathlib `exteriorPower.bijective_pairingDual` (ExteriorPower/Basis.lean:182, `Free`+`Finite` only), `instModuleTensorProductMop` (Azumaya/Defs.lean:39), `ModuleCat.Algebra.instLinear` (ModuleCat/Basic.lean:437), `extMk_comp_mk₀`/`mk₀_comp_extMk`/`extMk_eq_zero_iff`/`extLinearEquivCohomologyClass` (Abelian/Projective/Ext.lean), `rank_subsingleton` (Dimension/Basic.lean:168), `Module.Flat.of_retract` (Flat/Basic.lean:173). Tau Ceti: `hochschildBimoduleCoboundary` (Coboundary.lean:303), `normalizedHochschildCochainComplexι` (Normalized/Basic.lean:300), `normalizedHochschildChains.chainComplex` (Chains.lean:361), `multilinearCurryFirstEquiv_hochschildCoboundary` (Dual.lean:138), `kronecker_bijective_of_projective_homology_lt` (UniversalCoefficient/Basic.lean:212).
- Names and duplication: 101 of the README's 103 `TauCeti.*` names resolve at the pin. `TauCeti.DualBimodule` is a namespace; `TauCeti.StarkSystems.toExteriorBidual` is IntegralIwasawaTheory §12.6's target (main, README:1847). Mathlib has no Hochschild or Koszul complex. Tau Ceti has no normalisation theorem, no `HH₁≅Ω¹` and no HKR. No pinned statement duplicates a target.
- Cross-roadmap citations resolved: 17. These are RefinedTraceMethods §§1.1, 1.9 and 1.10 (#1493 head; §1.9 names `ε_n` but does not state it is bijective for smooth algebras, so the gap is minimal), KTheoryFiniteLocalFields §4.0, EulerSystemsAndKolyvaginSystems §6.1, IntegralIwasawaTheory §12.6, DGAInfinity Layers 0, 1 and 8, DerivedModuleAlgebra §§0.K.1 and 0.5, NoncommutativeGeometry N1 and N1.Cyclic, BanachAlgebras Layer 6, LanglandsParameterStacks §1.17, ZigzagPreprojective Layer 7, and DerivedDeRhamCohomology Layer 2. The gap slug is identical in `design/plan.json` and README:769.
- Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, DGAInfinity, NoncommutativeGeometry and DerivedModuleAlgebra (the results/headings list is empty). Shared objects and owners: Hochschild cochains, cup product and normalisation of an algebra with coefficients in itself belong to DGAInfinity Layer 8, and this roadmap keeps a stated bimodule-coefficient variant. Normalised scalar cochains of complex algebras belong to NoncommutativeGeometry N1.Cyclic. Square-zero extensions and the Koszul complex belong to DerivedModuleAlgebra §§0.5 and 0.K.1, and are cited. CyclicHomologyLieHomologyAndQuasiFreeAlgebras shares nothing: it leaves HH and HKR to KTheoryFiniteLocalFields.
- Source independence: 22 passages compared with 4 sources (Ginz05, HKR62, AV20, StacksSmooth); nothing is shared beyond formulas and statements the mathematics forces. Largest share Ginz05, 46 of 126 locators. Contents compared with Ginz05 (§§3, 4, 5, 6, 8, 9 against Layers 3, 2/4, 1–4, 5/7, 3, 7/8, in a different order; Layer 6 has no counterpart): independent.

## Not verifiable

- Loday98 (§§1.1, 1.3, 1.5, 3.2, Theorem 3.4.4): recorded as uncertified, so no legal text is cached. Its locators in §§1.1–1.3, 2.1–2.2, 4.2, 5.1–5.2, 6.4, 7.6 and 8.1 were not checked. Sample target §1.3 cites only Loday98 and Weibel94.
- Weibel94 (§§2.2, 2.6, 3.2, 9.1–9.4, Theorem 9.4.7): uncertified; not checked.
- CE56 (Chapters IX, XI): uncertified; not checked (§§1.1–1.4, 3.3, 4.4, 5.3–5.4).
- Ger63 (§7): uncertified; not checked (§§5.1, 5.2, 6.1, 6.2 and the `cupProduct` docstrings).
- Mat86 (§25): uncertified; not checked (§7.4).

## Source issues

- **Error** in Ginz05 at (6.6.3), p. 29 (line 1368): the source says f∪g − (−1)^{pq} g∪f = d(f∘g) − df∘g − (−1)^p f∘dg; with the coboundary of line 1058 this fails for f = g = d/dx on k[x] at (x,x), giving 2 = −2; it should be g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q (d(f∘g) − f∘dg); affects the proof.
- **Gap** in Ginz05 at §9.3, p. 46 (lines 2193–2196): the source says the ideal of the diagonal of a smooth affine variety is generated by a regular sequence; it should be generation by a regular sequence locally at points of the diagonal, which suffices after localising Tor; affects the proof.
- **Misprint** in Ginz05 at §5.2, p. 22 (line 1053): the source gives the inner sum of the Hochschild boundary without the signs; it should carry (−1)^j as at lines 973–976; affects nothing.
- **Misprint** in Ginz05 at §3.1, p. 9 (line 404): the source writes m ∈ m and ad m : M → M; it should be m ∈ M and ad m : A → M; affects nothing.
- **Misprint** in Ginz05 at (6.6.2), p. 29 (line 1363): the inserted g takes arguments a_i through a_{i+q}; it should end at a_{i+q−1}; affects nothing.
- **Misprint** in Ginz05 at §9.2, p. 45 (line 2146): the source writes the alternation sign as (−1) to the power sign σ; it should be sign σ itself; affects nothing.

## For the human reviewers

- none
