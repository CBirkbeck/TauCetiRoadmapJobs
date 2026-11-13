# Review of RationalHomotopyModels (pull request #2298 at 547c510)

**Verdict:** needs changes

## R01 (P1) — Polynomial homotopy does not preserve indecomposables

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:471`: “homotopic maps between minimal algebras induce the same map on indecomposables”.

**Claim:** This step in the rigidity proof is false when degree-one generators are allowed.

**Witness:** In `M = Λ(x₁,y₁,z₁)`, `dz = xy`, set `H(x)=x`, `H(y)=y−dt`, `H(z)=z+tx`. Then `dH(z)=xy−xdt=H(xy)`, but endpoints send `Q(z)` to `z` and `z+x`.

**Repair:** Replace the route with: “Prove rigidity by induction through the canonical Hirsch stages, comparing the cohomology classes adjoined and killed at each stage (Morgan, Proposition 5.9, p. 167).” Retain degree-one generators and add the witness as a negative-control Check for the discarded indecomposable claim.

## R02 (P1) — The topological Quillen functor has no construction target

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:783`: “with `H(λX) ≅ π_*(ΩX) ⊗ ℚ`”; its prerequisites are “5.4, 6.1”.

**Claim:** Neither prerequisite constructs `λ` from spaces to DG Lie algebras. The algebraic adjunction in 5.4 and the CDGA adjunction in 6.1 do not supply the unrestricted topological equivalence asserted in 6.4.

**Witness:** `README.md:700` defines only coalgebra–Lie functors; `README.md:730` defines only CDGA–simplicial realization. No definition assigns `λ` to a simplicial set or a map, including the `S²` used at line 789.

**Repair:** Add a construction target for the rational Quillen functor on simply connected pointed simplicial sets, specifying its objects, maps, rational-equivalence preservation and Samelson comparison, and make 6.4 depend on it. Specify the 2-reduced coaugmented signed DG-coalgebra category needed in 5.4, importing generic coalgebras from DGAInfinity Layers 0 and 4. Keep the equivalence without a finite-type restriction; require its construction to produce the stated `S²` and `S³` models.

## R03 (P2) — Finite rational type does not imply the elliptic–hyperbolic dichotomy

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:913`: “A simply connected space of finite rational type is either elliptic … or hyperbolic, with exponential growth”.

**Claim:** The dichotomy needs finite-dimensional total rational cohomology, not merely finite dimension in each degree.

**Witness:** For the weak product `X = ∏′_{n≥1} K(ℚ,2n)`, each cohomology degree is finite-dimensional and `rank π₂ₙ(X)=1`; cumulative rational homotopy rank through degree `N` is `⌊N/2⌋`, infinite but not exponential.

**Repair:** Write: “A simply connected space with finite-dimensional total rational cohomology is either elliptic, with finite-dimensional total rational homotopy, or hyperbolic, with exponential growth of cumulative rational homotopy ranks.” Define elliptic using finiteness of both totals (Hess, Definition 2.20, p. 21); the witness is excluded because its total cohomology is infinite-dimensional.

## R04 (P2) — The toral-rank conjecture is stated for too many spaces

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:921`: “a space with an almost free action of an `n`-torus” has “`dim H*(X; ℚ) ≥ 2ⁿ`”.

**Claim:** Without a compactness or appropriate finiteness hypothesis this is false, not an open conjecture.

**Witness:** `ES¹` is contractible with a free `S¹`-action: `dim H*(ES¹;ℚ)=1<2`. AmannZoller2023 line 32 states the compact Hausdorff version.

**Repair:** Write: “The toral-rank conjecture predicts `dim H*(X;ℚ) ≥ 2ⁿ` for an almost free `Tⁿ`-action on a compact Hausdorff space `X` (Amann–Zoller, introduction, p. 1).” The witness is not compact.

## R05 (P2) — Bott–Samelson needs connectedness

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:938`: “`H_*(ΩΣX) ≅ T(H̃_*(X))`”.

**Claim:** The formula is false for disconnected pointed spaces, including with the standing rational coefficients.

**Witness:** For `X=S⁰`, reduced suspension is `S¹`; the left degree-zero algebra is `ℚ[ℤ]=ℚ[t,t⁻¹]`, while the right is `T(ℚ)=ℚ[t]`. Their units differ.

**Repair:** Write: “For a connected well-pointed CW space `X`, Bott–Samelson identifies `H_*(ΩΣX;ℚ)` with `T(H̃_*(X;ℚ))` as graded algebras.” This excludes `S⁰`; for `S¹` both sides are the tensor algebra on one degree-one generator.

## R06 (P3) — The smooth-form supplier locator names only wedge products

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:197`: “From DifferentialGeometry. 0.1: smooth differential forms, wedge product and exterior derivative”; repeated at lines 874 and 889.

**Claim:** DifferentialGeometry §0.1 supplies the exterior-algebra wedge, not the smooth-form carrier or exterior derivative.

**Witness:** On main, `TauCetiRoadmap/DifferentialGeometry/README.md:695` starts §0.1; the smooth-form definition is §0.4 at line 832, and exterior differentiation is §§1.1–1.4 starting at line 866.

**Repair:** Cite DifferentialGeometry §§0.4 and 1.1–1.4 for smooth forms and differentiation, retaining §0.1 for wedge. In the pinned-library contract cite `TauCeti.SmoothForm`, `TauCeti.mextDerivₗ`, `SmoothForm.mextDeriv_mextDeriv` and `SmoothForm.mextDeriv_wedge_apply`; state the remaining totalization into the internal DG carrier as a target of 7.4.

## R07 (P3) — Homotopy transitivity consumes polynomial forms before they are built

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:366`: “lifting lemma 2.2 applied to the surjective quasi-isomorphism `A ⊗ A_PL(Δ²) → (A ⊗ I) ×_A (A ⊗ I)`”.

**Claim:** This route uses the construction and restriction theorem of §§4.1–4.3, absent from §2.3's dependencies and later in the advertised build order.

**Witness:** Section 2.3 lists only 2.1, 2.2 and the cohomology map. `A_PL(Δ•)` is first constructed at `README.md:541`; extendability is first proved at line 560.

**Repair:** Before 2.3, prove directly from the polynomial interval that restriction from `I⊗I` to the bottom and right edges is a surjective quasi-isomorphism onto `I×_K I`. Use 2.2 to fill this square and restrict along its diagonal. Its source and target both have cohomology `K`; the diagonal joins the required endpoints. Replace the triangle Check and name this interval result in `Needs`.

## R08 (P3) — Omitting the differential relation does not produce a DG algebra

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:548`: “forgetting `∑ dtⱼ = 0` would leave … a nonzero closed `1`-form with `H¹ ≠ 0`”.

**Claim:** The proposed quotient has no induced differential, so the claimed cohomology is undefined.

**Witness:** In the quotient imposing only `t₀+t₁−1=0`, the prescribed derivative sends this zero element to `dt₀+dt₁≠0`. Thus the ideal is not preserved by `d`.

**Repair:** Replace with: “Both relations are needed: `d(∑ tᵢ−1)=∑ dtᵢ`, so omitting the second relation prevents the differential from descending to the quotient.”

## R09 (P3) — Odd degrees do not force signed and unsigned Lie laws to differ

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:643`: “agrees with this one exactly when all degrees are even”.

**Claim:** Even degrees suffice, but are not necessary.

**Witness:** The one-dimensional abelian algebra in degree one has bracket zero. Both signed and unsigned antisymmetry and Jacobi evaluate to `0=0`, although its only nonzero degree is odd.

**Repair:** Write: “The conventions agree on algebras concentrated in even degrees. Odd abelian algebras also satisfy both; the free odd generator in the next Check separates them.”

## R10 (P3) — The Heisenberg complement is not forced

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:842`: “`N₁ = ⟨z⟩` is forced (`C₁ = ⟨x, y⟩`)”.

**Claim:** There are many complements; failure for one does not establish failure of the existential criterion.

**Witness:** Every `N₁=⟨z+ax+by⟩` complements `⟨x,y⟩`. For each, `x(z+ax+by)=xz+bxy` is closed and represents the same nonzero class `[xz]`, since `xy=dz`.

**Repair:** Replace the Check with the witness computation for all `a,b∈K`. This proves that every possible complement fails, without asserting uniqueness.

## R11 (P3) — The maps Check compares different cohomology classes

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:283`: “`e ↦ a` and `e ↦ 2a` … so the generator images are not determined by the cohomology class alone”.

**Claim:** Different classes cannot test whether the same class determines a generator image.

**Witness:** The displayed classes are `[a]` and `2[a]`, distinct in characteristic zero. Instead, `e↦0` and `e↦dt` into `I` are distinct DG maps and both represent `0∈H¹(I)`.

**Repair:** Replace the first Check by: “The DG maps `Λ(e₁)→I` sending `e` to `0` and to `dt` are distinct but induce the same cohomology map, because `dt=d(t)`.”

## R12 (P3) — Definitions have Checks but no API lists

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:218`: “define `IsFreeGradedCommutative`”; line 231 goes directly to “Checks”. The same pattern occurs in §§1.2, 2.1, 4.1, 4.3, 5.1–5.4, 6.1 and 7.1.

**Claim:** These definitions omit the required prose API bullet lists; a headline theorem and three examples do not specify the operations and laws implementers must provide.

**Witness:** Section 1.1 defines exponent vectors, ordered monomials and a freeness predicate but gives no API bullets. Section 4.1 similarly introduces forms, simplicial maps and filtration without their API lists.

**Repair:** Add prose API bullets per definition: monomial degree and spanning/extensionality; Sullivan/Hirsch inclusions and relative extensions; interval evaluations; polynomial pullbacks, differential and filtration laws; signed Lie/cochain functor laws; realization naturality; formality transport. Keep at least three discriminating Checks for each definition, and keep these API facts out of `Suggested.lean` unless they are retained headline statements.

## R13 (P3) — The sphere-model example admits an invalid zero-dimensional instance

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:295`: “`S^(2k)`: `Λ(x_{2k}, y_{4k−1})`, `dy = x²`”.

**Claim:** The even-sphere formula needs `k≥1`; it is not a model of `S⁰` at `k=0`.

**Witness:** At `k=0`, the generator degrees are `0` and `−1`, outside the Sullivan convention. Moreover `H⁰(S⁰;K)=K×K`, whereas every Sullivan algebra here has `H⁰=K`.

**Repair:** State “For `k≥0`, the odd sphere has model `Λ(x_{2k+1})`; for `k≥1`, the even sphere has model `Λ(x_{2k},y_{4k−1})`, `dy=x²`.”

## Verified sound

Previous findings, checked against this head (locators in `TauCetiRoadmap/RationalHomotopyModels/README.md` unless indicated):

| Previous id | Head passage | Disposition |
|---|---|---|
| R01 | §2.5: “every Sullivan algebra is cofibrant”; §3.1: “with `A⁰ = K`” | Repaired; the unrestricted converse is gone. |
| R02 | §6.2: “if … moreover minimal” | Repaired; the acyclic two-generator counterexample is included. |
| R03 | §3.5: “`exists_baseChange_quasiIso` and `exists_baseChange_iMinimal`” | Repaired; both statements elaborate. |
| R04 | §3.4: “*Needs:* 2.4, 3.1, 3.3” | Repaired; automorphisms moved out of 2.4. R07 is a different dependency defect. |
| R05 | §2.3: “`d ∫₀¹ H(a) + ∫₀¹ H(da)`” | Repaired; the witness gives `ds=ds`. |
| R06 | §5.1: “`d[u, x] = −[u, u]`” | Repaired; the alternative sign gives `+[u,u]`. |
| R07 | §5.2: “`dxᵢ = −∑_{j<k} cⁱⱼₖ xⱼ xₖ`” | Repaired; §§5.2–5.3 fix signs and the factor two. |
| R08 | §7.1: “A graded-commutative DG algebra with `d = 0`” | Repaired; `M₂(K)` is explicitly excluded. |
| R09 | Conventions: “the word ‘connected’ means the stronger `A⁰ = k`” | Repaired; Morgan §2, p. 142 is distinguished. |
| R10 | §3.5: “preserved because `L ⊗_K −` is exact” | Repaired; no theorem of Morgan is falsely attributed. |
| R11 | §3.3: “twisted-coefficient form without the ordering condition” | Repaired; source hypotheses distinguished. R01 concerns the new route. |
| R12 | Conventions: “Hess, Example 1.12, uses `dz = yx`” | Repaired; the cyclic variants are distinguished. |
| R13 | Downstream: “EllAdicHomotopyTypesAndWeights consumes” | Repaired; process narration removed. |
| R14 | PR description: “DerivedDeRhamCohomology (#868) and ArithmeticLocallySymmetricSpaces (#871)” | Repaired; these are the open suppliers, and StableHomotopyKTheory is on main. |

Computed adversarial instances; a failure in this table is addressed by its numbered finding:

| Statement | Instances | Left/construction value | Right/required value | Result; change |
|---|---|---|---|---|
| Conventions; signs | Odd `x,y`; Heisenberg | `yx=−xy`; `d(xz)=−x²y=0` | Koszul sign `−1`; closed `xz` | Agree. |
| 1.1 exponent vectors/monomials | Empty index; one odd/even generator | Empty monomial `1`; exponents `{0,1}` / `ℕ` | Bases `{1}`; `{1,e}` / `{xⁿ}` | Agree. |
| 1.1 freeness/universal property | `Λ(e₁)→Λ(a₁)`, `e↦2a` | Image of `1,e`: `1,2a`; `(2a)²=0` | Unique extension; odd square `0` | Agree; API missing R12. |
| 1.2 positive part/minimality iff | `Λ(u₁,v₂)`, `du=v`; even sphere | `Q(d)(u)=v≠0`; `Q(d)(y)=0` | Nonminimal; minimal | Both directions distinguished. |
| 1.2 Sullivan ordering | Cyclic degree-one algebra | `ker(d:V¹→Λ²V)=0` | First generator would be closed | Nonexample rejected. |
| 1.2 Hirsch extension | Adjoin `y₃`, `dy=x²` to `K[x₂]` | `d²y=0`; `dy∈K[x]` | DG inclusion; base-valued differential | Agree. |
| 1.3 DG-map criterion | `x↦s,y↦0` into `K[s]/s²` and `K[s]` | `dφ(y)=0` in both | `φ(dy)=0` / `s²≠0` | First extends, second fails. |
| 1.3 class-determination Check | Maps `e↦0,dt` into interval | Distinct values `0≠dt` | Both classes `0` | R11. |
| Layer 1 sphere examples | `k=0`; `k=1` | Degrees `(0,−1)` / `(2,3)` | `H⁰(S⁰)=K²` / `H(S²)=K[x]/x²` | R13; positive case agrees. |
| 2.1 interval | Characteristic zero; characteristic `p` | `∫tⁿdt=tⁿ⁺¹/(n+1)`; `d(tᵖ)=0` | `H¹=0`; `[tᵖ⁻¹dt]≠0` | Characteristic-zero restriction essential. |
| 2.2 lifting headline | `e₁↦u` through `Λ(u₁,v₂)→Λ(u₁)` | Closed degree-one lift must be `0` | Required image `u≠0` | Non-quasi-isomorphism correctly rejected. |
| 2.3 homotopy | `H(e)=d(st)`; square-path repair | `d∫H(e)=ds`; square/edge `H=K` | Endpoint difference `ds`; `H=K` | Identity agrees; R07. |
| 2.4 homotopy classes | `Λ(e₁)→Λ(a₁)`; nonsullivan `K[x]/x²` | Classes `K`; all lifts send `x→0` | `K`; identity sends `[x]→[x]` | Sullivan hypothesis distinguishes failure. |
| 2.5 model structure | Interval; retract of positive Sullivan | Interval degree zero `K[t]` | Retract degree zero `K` | Correctly avoids unrestricted converse. |
| 3.1 minimal existence | `A=K`; `A=Λ(u₁,v₂),du=v` | Empty minimal model `K` in both | Cohomology `K` in both | Agree; nonnegative connected hypotheses retained. |
| 3.2 i-minimal existence | `i=0`; torus with `i=1` | `M=K`; `M=Λ(a₁,b₁)` | `H⁰` identity, `0→H¹` injective; all `H` identity | Agree. |
| 3.3 rigidity headline | `e↦2e`; acyclic extension | Inverse `e↦e/2`; extra `u,v` | Bijective; nonminimal case excluded | Headline survives; route R01. |
| 3.3 indecomposable route | Heisenberg homotopy in R01 | `Q(f₀)(z)=z` | `Q(f₁)(z)=z+x≠z` | False; R01. |
| 3.4 uniqueness | Models of `Λ(e)` with maps `id,2` | Compatible comparison `e↦e/2` | `2·(e/2)=e` | Isomorphism exists. |
| 3.4 automorphisms | `x↦λx` on sphere cohomology | Lift `y↦λ²y`; derivative `λ²x²` | Image of `dy`: `λ²x²` | Agree for `λ≠0`. |
| 3.5 minimal scalar extension | `ℚ→ℝ`, sphere model | `d(1⊗y)=1⊗x²=(1⊗x)²` | Decomposable differential | Agree. |
| 3.5 quasi-isomorphism base change | `e↦2a`, `ℚ→ℝ` | `H¹(F)=2·id_ℝ` | Inverse `(1/2)·id_ℝ` | Agree; canonical tensor values included. |
| 3.5 i-minimal base change | `i=0`, `K→Λ(a₁)`, `K→L` | `H⁰(F)=id_L`; `H¹(F):0→L` | Bijective in degree zero; injective in degree one | Agree. |
| 4.1 polynomial simplices | `Δ⁰`, `Δ¹`; omitted relation | `K`; `K[t,dt]`; `d(0)=dt₀+dt₁` | `K`; interval; `d(0)=0` | R08 for omitted relation. |
| 4.1 faces/filtration | `∂₂Δ²`; `t₀²` | `t₂→0`; `d(t₀²)=2t₀dt₀` | Edge sum `1`; total degree `2` | Agree. |
| 4.2 extendability | Boundary of interval `(a,b)` | `a+(b−a)t` | Endpoint values `(a,b)` | Surjective; Poincaré test in 2.1. |
| 4.3 forms on simplicial sets | Point; simplicial circle | `A_PL(*)=K`; circle `H⁰=H¹=K` | Singular cohomology `K`; `K⊕K[1]` | Agree. |
| 4.4 de Rham | Oriented interval; triangle boundary | `∫dt=1`; boundary `H¹=K` | Cochain value `1`; simplicial `H¹=K` | Agree; integration is not a DG-algebra map. |
| 4.4 multiplicativity distinction | `t·dt` on interval | `∫t dt=1/2` | Alexander–Whitney `∫t∪∫dt=0` | Chain-level multiplicativity correctly not claimed. |
| 4.5 models of spaces | `S²`; `ℂP²` | `H(Λ(x₂,y₃))=K[x]/x²`; `H(Λ(x₂,y₅))=K[x]/x³` | Sphere; projective-space rings | Agree. |
| 5.1 DG Lie algebra | Odd abelian generator; free odd generator | Brackets `0`; `[a,a]≠0` | Unsigned brackets `0`; `0` | R09; free example discriminates. |
| 5.1 differential sign | `u=dx`, degrees `2,1` | `d[x,u]=[u,u]`; `d[u,x]=−[u,u]` | Antisymmetry requires negatives | Agree. |
| 5.2 CE differential | Heisenberg; `dv₂=u₁` | `dz=−xy`; `du′=−v′` | Nilpotent Sullivan; nonminimal with `H=K` | Agree. |
| 5.2 mixed sign compatibility | `dv=w=[u,u]`, `u=dx`, `v=[x,u]` | Dual: `da=−b, dc=−e+a²/2, de=−ab` | `d²c=ab−ab=0` | Signs agree. |
| 5.3 homotopy Lie algebra | Sphere; Heisenberg | `ι_a²(x²)=2`; `ι_Yι_X(xy)=1` | `[a,a]=2b`; `[X,Y]=−Z` | Agree. |
| 5.4 algebraic Quillen functors | Coaugmentation `K`; coalgebra with `C₁≠0` | `𝓛(K)=0`, `𝓒(0)=K`; degree-zero Lie generator | Unit identity; reduced Lie requires degree `>0` | Boundary agrees; primary locator unreadable. |
| 6.1 spatial realization | `K`; `Λ(x₂),d=0` | Point; rational `K(ℚ,2)` | One augmentation; `π₂=ℚ` | Agree over the stated spatial coefficient `ℚ`. |
| 6.2 unit and generator theorem | `S²`; nonminimal `du₂=v₃` | Minimal `V²,V³=ℚ`; acyclic realization `π₂=0` | `π₂,π₃=ℚ`; nonminimal dual `V²∨=ℚ` | Minimality repair separates the cases. |
| 6.3 classification | `S²×S⁴`; `ℂP³` | Degree-two generator squares `0` / nonzero | Equal Betti numbers, unequal rings | Models distinguish rational types. |
| 6.4 topological Quillen equivalence | `S²`; `S³` | Free Lie on `a₁`: basis `a,[a,a]`; on `a₂`: basis `a` | Loop homotopy ranks `(1,1)` / `(0,1)` | Model values agree; missing functor R02. |
| 7.1 formality definition | Zero-differential commutative algebra; `M₂(K)` | Identity span; noncommutative `H⁰=M₂(K)` | Quasi-isomorphism span; commutative `H⁰(M)` | First accepted, matrix algebra rejected. |
| 7.2 complement criterion | Sphere; all Heisenberg complements | Sphere ideal has closed part `0`; `[x(z+ax+by)]=[xz]≠0` | Exact `0`; required exact class `0` | Criterion discriminates; R10 fixes quantifier. |
| 7.3 ddᶜ headline | `dᶜ=0,d=0`; `du=v,dᶜ=0` | Exact elements `0`; exact closed `v≠0` | Image `ddᶜ=0` in both | First satisfies; second violates hypothesis despite formality. |
| 7.4 Kähler formality | Point; complex torus; Kodaira–Thurston | `H=ℝ`; `dim H¹=2n`; `b₁=3` | Formal; exterior algebra; Kähler odd `b₁` excluded | Mathematical instances agree; supplier R06. |
| Research dichotomy | Weak product `K(ℚ,2n)` | Cumulative rank `⌊N/2⌋` | Claimed finite total or exponential growth | R03. |
| Toral-rank context | `ES¹`; circle acting on itself | Total Betti number `1`; `2` | Bound `2`; `2` | R04 excludes first, retains second. |
| Bott–Samelson context | `S⁰`; `S¹` | `ℚ[t,t⁻¹]`; `T(ℚ[1])` | `ℚ[t]`; `T(ℚ[1])` | R05 excludes first. |

- Source sample: all 15 requested sections examined; 30 core locator/statement comparisons against readable Hess2007, Morgan1978 and Sullivan1977; inaccessible primary texts listed below.
- Pinned declarations opened include `IsDGAlgebra` (`TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:206`), `DGAlgHom` (`Hom/Basic.lean:50`), `cohomologyMap` (`Hom/Cohomology.lean:118`), `baseChange` (`BaseChange.lean:77`), and unsigned graded Lie laws (`Mathlib/Algebra/Lie/Graded.lean:55`); no native Sullivan or polynomial-form implementation found.
- Supplier audit: all 8 named roadmap suppliers resolved on main or the supplied new-roadmap heads; 1 incorrect section attribution is R06; no forbidden, upward or cyclic roadmap edge.
- Headline inventory: 13 stated Lean theorems cover §§1.1–1.3, 2.2, 3.1–3.5, 7.2–7.3; the docstring names homotopy, model-category, polynomial de Rham, Lie, classification and Kähler headlines and their missing carriers.
- Signature/padding audit: all 20 declarations elaborated with `#check @name`; 0 lost required binders, 0 signature repairs; all 13 theorem probes retained `sorry` after `rfl`, `simp`, `infer_instance` and hypothesis attempts; library near-matches supplied no exact one-lemma proof.
- Gate: 0 failing checks at the requested head; direct `lake env lean` succeeded with exactly 13 `sorry` warnings and no others.
- Dependency output: `depcheck: 240 roadmaps, 2172 edges, 0 problem(s)`.
- PR text/scope: 0 outside-folder changes; new folder, 20 declarations and 13 theorems agree with the description; 0 broken overlap ids or conflicting heads; worktree unchanged.

Sample source locators read: §1.2 — Hess Definition 1.10, p. 5 (line 243), Morgan Definitions 5.1–5.2, p. 163 (line 1017); §2.1 — Hess Proposition 1.14, p. 7 (line 314); §2.4 — Sullivan Corollary 3.6, p. 285 (line 660), Morgan Theorem 5.7, pp. 166–167 (line 1119); §3.3 — Morgan Proposition 5.9, p. 167 (line 1162), Hess Proposition 1.18, p. 8 (line 361); §3.4 — Morgan Theorem 5.6, p. 164 (line 1064); §3.5 — Morgan Definition 5.3, p. 163 (line 1036), used only for the conditions; §4.1 — Hess Definition 1.19, p. 8 (line 382); §4.4 — Hess Theorem 1.21, p. 9 (line 431), Sullivan Theorem 7.1, p. 297 (line 1121); §5.2 — Sullivan §2, pp. 279–280 (line 440), for the degree-one case; §6.2 — Hess Theorem 1.24, p. 10 (line 493); §6.3 — Hess Corollary 1.26, p. 11 (line 556); §7.1 — Hess Definition 2.1, p. 13 (line 647). General graded §5.2, §§5.4, 6.4 and §7.2 retain the source-access limitations below.

Overlap check: read EllAdicHomotopyTypesAndWeights (#1644) and KanQuillen (#2269), covering all three closest-roadmap lists (the main list is empty), plus AlgebraicTopologyPartII (#1694), DGAInfinity and GeneralizedCohomology; RationalHomotopyModels owns Sullivan models and polynomial forms; DGAInfinity owns generic DG/coalgebra infrastructure; GeneralizedCohomology G2.1 supplies the ordinary simplicial model structure; KanQuillen owns its combinatorial variant. EllAdicHomotopyTypesAndWeights consumes the Sullivan/form contracts rather than rebuilding them.

Source independence: 35 core passages compared with 3 sources, including 5 additional passages from different sections; no copied expression or reused tables/figures found. Largest share Hess2007: 23 of 75 named locator citations before Research context. Hess's contents (lines 14–19) do not map onto these seven layers; lifting→minimal models→classification is forced by §§2.2, 3.1 and 6.2. Contents comparison: independent; the later polynomial-form input in §2.3 is R07.

## Not verifiable

- FHT2001: settled uncertified; §§3, 10, 12, 17, 21–24, including the general graded CE assertion and Quillen comparisons; not requested again.
- DGMS1975: settled uncertified; Theorem 4.1, §6 and p. 261, including the sampled §7.2 criterion; not requested again.
- Quillen1969: Theorem I, Part I and Appendix B; sources service reached the JSTOR DOI landing page but obtained no legal readable text.
- BG1976: CDGA model structure and de Rham adjunction; sources service reached the AMS landing page but obtained no readable text.
- GriffithsMorgan2013: Springer copy paywalled; uncertified background reference.
- FOT2008: Oxford DOI returned HTTP 403; research-context citation unreadable.
- FHFormal1982: AMS DOI landing page yielded no classified readable copy.
- FHCategory1982: Crossref returned HTTP 429; AMS DOI landing page yielded no classified readable copy.
- FHJLT1988: JSTOR DOI landing page yielded no readable copy; the dichotomy counterexample is independent of this access limitation.
- Halperin1977: AMS DOI landing page yielded no classified readable copy.
- FriedlanderHalperin1979: Springer copy paywalled; uncertified research-context citation.
- Halperin1985: Cambridge landing page yielded no classified readable copy.
- AlldayPuppe1993: Cambridge landing page yielded no classified readable copy.
- ShigaTezuka1987: Elsevier copy paywalled; theorem and cited erratum not verified.
- GroveHalperin1982: Springer copy paywalled; cited background not checked against that text.
- GromollMeyer1969: Project Euclid landing page yielded no PDF through the sources service.
- ViguePoirrierSullivan1976: Project Euclid landing page yielded no PDF through the sources service.
- BottSamelson1953: Springer copy paywalled; original theorem locator uncertified, counterexample computed independently.
- Kadeishvili2009: publisher DOI returned HTTP 502; cohomology `C∞` classification citation unreadable.

## Source issues

- **Error** in Hess2007 at the model-structure paragraph before Proposition 1.13, printed p. 6: the source says the displayed generating-cell maps are precisely relative Sullivan inclusions; it should distinguish arbitrary generating-cell maps from Sullivan inclusions, since the displayed set includes `ℚ[t₀]→ℚ`; affects a stated result.
- **Error** in Hess2007 at Proposition 1.16, printed p. 7: the source says every CDGA map has a Sullivan-extension quasi-isomorphism factorization; it should impose appropriate connectivity hypotheses: the unit into `ℚ×ℚ` cannot have such a factorization; affects a stated result.
- **Error** in Hess2007 at Proposition 1.16, printed p. 7: the source says connectivity of the source and finite-type target cohomology ensure extension generators have degrees at least two; it should also restrict the target's low-degree cohomology; `ℚ→Λ(a₁)` already requires a degree-one generator; affects a stated result.
- **Misprint** in Hess2007 at the paragraph before Proposition 1.14, printed p. 7: the source says the polynomial-interval CDGA is the complex `D(1)`; it should use the free commutative cochain algebra `ΛD(1)`; affects nothing.
- **Error** in Hess2007 at the proof after Proposition 1.18, printed p. 8: the source says a minimal relative Sullivan endomorphism homotopic to the identity equals the identity; it should conclude invertibility, allowing the Heisenberg automorphism `z↦z+x`; affects the proof.
- **Error** in Hess2007 at Theorem 1.24(2), printed p. 10: the source says realization homotopy groups equal dual generator spaces for all simply connected finite-type Sullivan algebras; it should require minimality for this identification; affects a stated result.
- **Misprint** in Walker2017 at the paragraph before Theorem 2, preprint p. 1, line 46: the source says `βᵢ(M)` is the Betti number of `R`; it should say the Betti number of `M`; affects nothing.
- **Misprint** in CattalaniMilivojevic2020 at the introduction, preprint p. 1, lines 16 and 23: the source says cohomology itself exceeds `dim V` and an alternating sum of homotopy vector spaces is non-positive; it should insert vector-space dimensions in both numerical expressions; affects nothing.

## For the human reviewers

- FHT2001 and DGMS1975 remain settled uncertified. The sampled graded Lie, Quillen and formality locators could not all be checked against primary texts; the individual limitations are listed above.
- EllAdicHomotopyTypesAndWeights (#1644), `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md:67`, addresses five supplier-gap contracts to AlgebraicTopologyPartII; this folder's downstream section claims their ownership. AlgebraicTopologyPartII's inspected scope contains no duplicate Sullivan construction; the contract addresses need administrative reconciliation.
