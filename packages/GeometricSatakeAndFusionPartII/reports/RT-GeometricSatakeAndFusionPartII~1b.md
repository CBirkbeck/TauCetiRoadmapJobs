<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1177#issuecomment-6406657702 -->
Red team round 1 pass b (claude) of 60448fc

Verdict: accepted

1. **F01** (P3) supplier contract names a §7.3 use that round 7 removed

   Location: `packages/GeometricSatakeAndFusionPartII/README.md:51`, "Section 0.17’s regular-element depth formula supplies depth deformation in §7.3."

   Claim: the SchemeAndStackFoundations contract says §7.3 consumes a depth-deformation argument from §0.17.

   Witness: `README.md:1042` (the §7.3 proof route) now transfers the codimension-1 criterion to the split group G′ where the admissible union is Frobenius split and Cohen–Macaulay, and uses "étale stability of S₂ and connectedness after removing codimension ≥2"; no depth deformation occurs anywhere in §7.3 (grep "depth" in the README hits only line 51, the Conventions line 21 and the Layer 7 Examples). The §7.3 *Needs:* line still cites SchemeAndStackFoundations §§0.17–0.18, which is right for the S₂ vocabulary and étale stability.

   Repair: replace the sentence at line 51 by "Sections 0.17–0.18 supply the Serre S₂ condition, its étale-local stability and connectedness after removing codimension ≥2, used in §7.3." Tested on the instance that exposed it: the §7.3 route then cites exactly the inputs it uses; the §7.3 *Needs:* line and the Layer 7 Dependencies need no change.

Scope of this pass: the whole of `packages/GeometricSatakeAndFusionPartII/README.md` (1220 lines, all 60 target subsections, 42 supplier contracts, Conventions, Examples, Dependencies, Worked examples, References) and the whole of `packages/GeometricSatakeAndFusionPartII/Suggested.lean` (52 lines, module docstring and empty namespace, no declarations). The checkout was confirmed at the pull request's current head `60448fc` before reading. `git diff --stat origin/main...HEAD` touches only `packages/GeometricSatakeAndFusionPartII/` (README.md, Suggested.lean, metadata.toml, sources.toml, reports/, design/plan.json `gaps`).

## Verified sound

Counts. Declarations read: 0 (the acceptance file declares nothing; its docstring was read in full, and the `#check @name` binder audit therefore has no names to compare, which the file's emptiness makes exact). Targets read: 60 of 60 subsections, every Check, every *Needs:* line, every Dependencies list, the four worked examples and the reference list. Locators verified against the cached texts: 150 cited `<source> line N` locators across all 21 sources (GL 13, KPZ 45 including the fuller passages below, KZ 12, SW 14, AGLR 22, KP 12, LEV 7, PZ 8, HLR 4, GORGL 4, GORSP 3, RZ17 2, KRZ 2, PRLSV 1, FHLR 1, PR 1, ALWY 1, GLX 2, GLE22 1, HAI14 3, HAI15 2); every one lands on the theorem, definition, section or equation the README names, with the printed page where the extraction carries page markers. Checks tested with computed values: 48 (table below). Sibling and library citations checked: 103 (GeometricSatakeAndFusion 8 target names at #1235; ReductiveGroupsPartII 21 subsection labels incl. RG2.3.5's bold target "Tame realization of stabilizers as fixed points of hyperspecial models", RG2.4.3 and RG2.5 at #785; SmoothRepresentationsOfLocalGroups SR.1, SR.3.2, SR.4.1 at #785; LefschetzPencilsAndVanishingCycles LPV.0 §§0.1–0.8, §1.10, LPV.6 §§6.1–6.2 and the three `VanishingCycles.semisimpleTrace*` names at #873; ClassicalAdicEtaleCohomology §4.5a and its bold target "Comparison with nearby cycles of the adic generic fibre" at #875; PELModuli M0 at #966; EtaleDualityAndPerverseSheaves §§2.1–2.3, 2.6–2.10 and Layer 5 at #1040; RootSystemsPartII RS2.4 with both target names and the "Independent continuation briefs" / "Minuscule weights and modular representation bounds" brief in the board design; DiamondsAndVStacksPartII D10.8–D10.15 and D11.1–D11.20 in the board design; SchemeAndStackFoundations §§0.8, 0.17–0.21, 0.26, 0.28, 0.30, 1.1, 4.6, 4.7–4.14 on main; ModularCurves §0G on main; the six Mathlib and two Tau Ceti file:line citations at the pins 6b7abb3c and a91d3aaf, each exact to the line, with `Module.Grassmannian` recording quotient rank, `traceForm_nondegenerate` carrying `[FiniteDimensional K L] [Algebra.IsSeparable K L]`, `ZariskiTangentSpace` the residue-field dual of the cotangent space, and `Derivation.adjointWeightSpace` taking a Hopf map to a monoid algebra, as the README states).

Direction and ownership. Every supplier in a *Needs:* line, Dependencies list or contract precedes this roadmap in `merge-order/ORDER.txt` (SchemeAndStackFoundations 2, ReductiveGroupsPartII 25, RootSystemsPartII 26, SmoothRepresentationsOfLocalGroups 27, LefschetzPencilsAndVanishingCycles 63, ClassicalAdicEtaleCohomology 64, EtaleDualityAndPerverseSheaves 122, PELModuli 132, GeometricSatakeAndFusion 150, DiamondsAndVStacksPartII 152; this roadmap 290). The gate output, run from the board checkout with the brief's command:

```text
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The 42 gap slugs used in *Needs:* lines, the 42 "What <Supplier> must provide (gap:…)" contracts and the 42 entries of `design/plan.json` `gaps` are the same set. Each gap was checked for precision and minimality: SchemeAndStackFoundations on main states no trait-normality criterion, no fpqc descent of normality, no finite weak normalization and no S₂-ification criterion (its §0.26 has weakly normal schemes only as examples, its §0.10 has geometrically unibranch rings, which the S₂-ification gap correctly uses as vocabulary); the pinned Tau Ceti has no tangent-map functoriality on `ZariskiTangentSpace`; GeometricSatakeAndFusion at #1235 states the Witt flags, Demazure spaces, v-closure local models, admissible loci, the `𝓖`-versus-`𝓖°` closure comparison for minuscule bounds and the central comparison (its "Integral parahoric ind-properness" and "Bounded admissible affine flag loci"), but no Schubert normality, no coherence, no polynomial BD functor, no negative big cell, no central nearby cycles; the named "extensions" and "prefixes" in the gap sections do not exist there yet, which is what a declared gap means. Ownership by object: `roadmaps grep` over main and all 367 open heads for Wakimoto, kimberlite, Drinfeld local model, formal-curve span, Finkelberg–Mirković, test function / Bernstein function, chain incidence, tubular neighbourhood and polynomial local model found no second owner (the hits are `M_dR`/`M^r_μ` in PerfectoidShimuraVarieties, Bernstein functions in OneParameterSemigroups, Wakimoto modules in AffineLieAlgebras, shtuka local-model maps in GlobalShtukasAndFunctionFieldLanglands, nodal local models in LefschetzPencilsAndVanishingCycles, and topology); the brief's 55 sibling checkouts were covered by that index.

Policy. No `lemma`, no `set_option`, no pull-request number, no process word, no machine path in README.md, Suggested.lean or sources.toml. Every target carries a locator. No computational algorithm. The acceptance file has the required form (title "…: target signatures", the roadmap-is-README sentence, the not-statable list with the missing carrier for each, `import Mathlib` only, the namespace, nothing admitted). The README has no backticked names of its own; every backticked name is a pinned declaration or a supplier's API name.

Headlines and padding. The pinned Mathlib has no Grassmannian scheme (only the functor of points `Module.Grassmannian`), no affine Grassmannian, loop group, Schubert variety or nearby-cycle object; the pinned Tau Ceti has none of these either, no reductive group schemes, buildings or cocharacter data, and no derivative of pointed scheme morphisms. So every headline in the docstring's list is not statable at the pins, the elementary statements the design once suggested (trace-form nondegeneracy, the x²+xyz span computation, the SL₂ matrix identity) are not headlines and are rightly kept as README Checks, and there is no padding to delete.

Mathematics. The statements were checked at the source's generality, in both directions, with the instances in the table. In particular: the characteristic scoping of Layer 4 is exactly the source's (KPZ §4.1.1 fixes an algebraically closed field of arbitrary characteristic p; the only division by 2 is the Dᴴ detector −2m at KPZ line 1966, so §4.9's p≠2 on that endpoint is forced and §§4.7, 4.9, 4.10 elsewhere are at the source's range); the Cartan index convention of §4.8 (t^{−i}H_α, i≤k_{−α}) agrees with KPZ's (t^{⟨λ,α⟩−k}H_α, 1≤k≤k_α) because s_α(λ−kα∨)=λ+(k−⟨λ,α⟩)α∨ gives k_α=k_{−α}+⟨λ,α⟩ and exponents ≥0 vanish in the tangent space; the trace normalization chain (geometric Frobenius, ℚ_ℓ(1)↦q⁻¹, IC=ℚ_ℓ[d](d/2), τ=(−1)^d q^{−d/2}φ, κ^ss=(−1)^dτ=z^ss, z^ss↦q^{−d/2}1_{Kt^μK}) is self-consistent and matches AGLR lines 131, 136 and 151 ((√q)^{⟨2ρ,μ⟩}τ^Φ∈ℤ); the KZ Lemma 5.2.5 route of §5.4 uses only σ_q-fixedness of the translation (KZ lines 2319–2329) and HR08 connectedness of the stabilizer, which the declared jets gap requests; GL Corollary 3.5's proof (GL lines 289–297) transfers to a split k((t))-group exactly as §7.3 says, and GL Proposition 3.4's proof (GL lines 272–285) uses weak normality, unibranch components and completion compatibility exactly as the S₂-ification gap states.

### Adversarial table (sampled rows; every row carries computed values)

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, PGL₂ coroot order | λ=0, μ=1 and μ=2 in X_*=ℤ | positive coroot 2; μ−λ=1∉2ℤ, μ−λ=2=1·2 | 0≤2 only; 0,1 incomparable | none |
| Conventions, apartment sign | diag(t,t⁻¹) | cocharacter (1,−1); GL line 227: t^ν acts by −ν, displacement (−1,1); det valuation 0 | matches GL | none |
| Conventions, KZ lattice test | g=diag(π⁻¹,1,1), Λ=O³ | πgΛ=Oe₁+πOe₂+πOe₃; mod πΛ: line ke₁ | matches KZ line 946 | none |
| Conventions, τ vs φ | d=0; d=1, q=9 | (φ,τ)=(1,1); (1,−9^{−1/2})=(1,−1/3) | consistent with §§8.2–8.4 | none |
| §0.1 Check 3 | GL₂, (2,0) | ⟨(2,0),e₁−e₂⟩=2>1; reflex field F; dim Gr_{≤(2,0)}=⟨(1,−1),(2,0)⟩=2 | not minuscule, general bound | none |
| §0.2 Check 2 / property 2 | h=3,d=1; m=0; m=2 | kernel rank 3−1=2; m=0: rank 0, kernel GL₂; m=2: ranks (6,2) | m≥1 needed and stated | none |
| §0.4 Check 3 | SL₂→PGL₂ | diag(z,z⁻¹)↦2∈ℤ; 2n=1 unsolvable | PGL₂ class 1 has no SL₂ lift | none |
| §0.4 property 3 | GSF "Integral parahoric ind-properness", SW Prop 21.4.3 (SW line 7504) | closure in Gr_{𝓖°} → closure in Gr_{𝓖} is an isomorphism for minuscule μ | owned by the supplier as cited | none |
| §0.5 Check 2 | blow-up of P¹_O at a special point | regular, two reduced components; exceptional P¹ collapses to one point in M^v | comparison not a monomorphism | none |
| §0.5 Check 4 | Spec O[x]/(x²−π) | flat; generic fibre a field (normal); special x²=0 nonreduced | excluded | none |
| §1.1 Check 3 | G_a over k at t=0 | LG_a/L⁺G_a=t⁻¹k[t⁻¹], an infinite union of affine lines | smooth connected fibres ⇏ ind-projective | none |
| §1.2 Check 3 / §1.3 Check | GL₂ hyperspecial, ν=(2,0) | Adm={t^{(2,0)},t^{(1,1)}}; dim 2; normal (π₁(SL₂)=1, Faltings); GL₂/P_ν=P¹ of dim 1 | Schubert bound, not a flag | none |
| §1.3 range | PGL₂ at p=2 | π₁(PGL₂)=ℤ/2; HLR lines 78–80: quasi-minuscule Schubert variety not weakly normal | p∤π₁ hypothesis necessary | none |
| §1.4 | GL₂→PGL₂, p=3; KP Prop 2.2.4 (KP line 1386) | M^loc_G ≅ normalization of M^loc_{G^ad}⊗O_E under p∤π₁(G^der) | as stated | none |
| §1.5 | KPZ Prop 3.2.11 (KPZ lines 864–875) | p>2, abelian type, μ^ad nontrivial on each F-simple factor; outputs 1)–4) incl. E′=E^ad | as stated | none |
| §2.1 Check 4 | split GL₂/ℚ₃, x at √2−1, x′ at 1/4 | e·(√2−1)∉ℤ for all e; e=4 sends 1/4 to the vertex 1; ℚ₃(i,3^{1/4}) tame Galois, e=4 | fixers equal, points differ | none |
| §2.3 Check 1 | Res_{K/F}G_m, K/F unramified quadratic, μ=(2,0) | reflex field K; ν=(2,0) for GL₂, root pairing 2, dim 2; GL₂/P_ν has dim 1 | target is the Schubert bound | none |
| §2.3 Check 3 | [K:F]=e, weights 0,1 of multiplicity d in rank n | subspace rank ed; quotient rank e(n−d); d=0: both points, quotient rank en | consistent | none |
| §2.4 | KPZ Thm 3.3.25, Rem 3.3.26 (KPZ lines 1125–1137) | quasi-tame, p odd, classical, (3.3.24) form; 𝒢′=𝒢 if π₁(G)_I torsion-free, or x generic and no index divisible by p | as stated | none |
| §2.6 incidence equation | Λ₀=Oe₁⊕Oe₂, Λ₁=Oe₁⊕πOe₂, F₀=[x₀:y₀], F₁=[x₁:y₁] | Λ₁→Λ₀ is diag(1,π), πΛ₀→Λ₁ is diag(π,1); both give x₁y₀=πx₀y₁; special x₁y₀=0, components x₁=0 and y₀=0 | matches worked example πad−bc=0 and bc=π on a=d=1 | none |
| §2.6 Check 7 | forgetful map to F₀ on the special fibre | over [1:0]: y₀=0, all F₁ (P¹); over [0:1] or [x₀:1]: x₁=0, one point | not smooth; xy=π flat with reduced fibre | none |
| §2.6 Checks 4–5 | one-lattice period, d=1; d=0 | X_I=Fl_full×_{Fl_I}M_{I,k}: P¹-bundle over P¹; d=0: M=Spec k, X_I=P¹; over k[ε]/ε² refinements [1:0],[1:ε] distinct | cartesian condition needed | none |
| §2.6 GSp Checks | rank 2; one lattice of rank 4; plane ⟨e₁,f₁⟩ | GSp₂=GL₂, every line Lagrangian; LG(2,4) dim 3 vs Gr(2,4) dim 4; ψ(e₁,f₁)=1 in every characteristic | annihilator condition essential | none |
| §2.8 | K=F, r=1; V=0; F_p(t^{1/p})/F_p(t); split pair with multipliers 1,2 | Ψ(e₁,e₂)=1; zero form on 0 nondegenerate, no unique multiplier; inseparable trace ≡0, form degenerate; diagonal blocks 1 and 2, no common multiplier | hypotheses necessary and stated | none |
| §3.1 Check 3 | PU₃(F′/F), p=3, μ=(1,0,0), self-dual lattice | π₁(G^der)=ℤ/3; HLR lines 1865–1868: quasi-minuscule Schubert variety non-normal, PZ special fibre nonreduced | canonical ≠ raw model | none |
| §3.6 | AGLR Thm 7.22 (AGLR line 2776) | arbitrary reductive G, arbitrary parahoric, μ minuscule: unique flat projective weakly normal model with diamond M_{G,μ} | as stated | none |
| §4.1 Check 2 | Spec k[ε]/ε² | k[ε]/ε²→k[[a]] forces ε↦f with f²=0, f=0; tangent dim 1, span 0 | correct | none |
| §4.1 Check 3 | xy=0 at 0 | axis derivatives (1,0),(0,1) span k²; derivative (1,1) gives xy=a²+… ≠0 | span ≠ set of derivatives | none |
| §4.2 / worked example | x²+xyz=0 | f(f+gh)=0 in k[[a]] ⇒ f=0 or f=−gh∈(a²); span = {x=0}, dim 2; T₀ dim 3; minimal primes (x),(x+yz) | reduced, reducible, not normal (contra KPZ line 1354) | none |
| §4.3 | t^λL⁻⁻Gt^{−λ} chart | Ad(t^λ)(t⁻¹k[t⁻¹]⊗𝔤)=⊕_α t^{⟨λ,α⟩−1}k[t⁻¹]X_α ⊕ t⁻¹k[t⁻¹]Lie T | matches KPZ 4.1.7 | none |
| §4.4 Check 3 | B₃, μ=(2,0,0), ν=(1,1,0); μ=(1,0,0), ν=0 | μ−ν=e₁−e₂, coordinate sum 0 (D₃ lattice); spin test (1−1+0)/2=0, ω₁:1, ω₂:0; second: sum 1 odd | congruence not implied by inequalities | none |
| §4.4 property 3 | C₂, μ=2ω₂∨=(1,1), ν∈{(1,0),(0,0),(2,0),(2,1)} | ⟨μ−ν,ω₁⟩=0,1,−1,−1; coroot order: ≤,≤,not,not; for C_n, x_j=r/2−ν_j increasing so x₁≥0 ⇒ all partial sums ≥0 | test detects dominance for the family | none |
| §4.5 Checks | SL₂, λ=0, μ=α∨, j=0,1,2 | k_α=max{j: jα∨≤α∨}=1; derivatives 0, t⁻¹X_α; j=2: relative position 2α∨>μ | interval 1≤j≤1 | none |
| §4.6 Check 1 | SL₂, μ=α∨, ν=ω, t^μ | ⟨μ,−w₀ν⟩=1, ⟨μ,−ν⟩=−1; t·diag(t,t⁻¹)O²=diag(t²,1)O²⊂O²⊂diag(1,t⁻²)O² | both inclusions hold | none |
| §4.7 j_α formula | SL₂, λ=0, μ=α∨, S={ω} | only ω′=−ω has ω′+α a weight; j_α=1−0=1=k_α; coefficient ±1 nonzero at p=2 | equality | none |
| §4.8 convention vs KPZ | SL₂, λ=α∨, μ=2α∨ | k_α=3, k_{−α}=1=k_α−⟨λ,α⟩; KPZ exponents 2−k∈{1,0,−1}, only −1 survives mod 𝔱[[t]]; README t⁻¹H | same subspace | none |
| §4.8 Chevalley sign | u=((1,0),(1,1)), E=((0,1),(0,0)) | uEu⁻¹=((−1,1),(−1,1))=E−H−F; KPZ line 1746 prints X_α+H_α+X_{−α} | span of H unchanged | none |
| §4.9 Checks | SL₂, H=H_α, λ=0, μ=α∨; λ=μ=α∨; H=0; Dᴴ m=1 | candidates {1,1}→l=1; {0,2}→l=0; D_0 empty; −2m=1 in F₃, 0 in F₂ (KPZ line 1966) | p≠2 forced only on the Dᴴ endpoint | none |
| §5.1 worked example | D₄, θ=α₁+2α₂+α₃+α₄, triality orbit of α₁+α₂ | orbit sum has α₂-coefficient 3>2; θ itself has (1,2,1,1) | step is existential (RS2.4) | none |
| §5.2 / Examples | nonstandard SU₃, c=a, d=−a²/2; a=1 in F₃; F₂ | τ(c)c+d+τ(d)=a²−a²/2−a²/2=0; 1+1+1=0 in F₃; 2 not invertible in F₂ | p≠2 stated | none |
| §5.3 Check | μ₃ over F₃[ε]/ε² | (1+εt⁻¹)³=1+3εt⁻¹+3ε²t⁻²+ε³t⁻³=1, but 1+εt⁻¹∉L⁺ | prime-to-p kernel hypothesis necessary | none |
| §5.4 | KZ Lemma 5.2.5 proof (KZ lines 2319–2329); t^λ=diag(t,t⁻¹) | translation not integral; proof uses σ_q(y)=y and Lang on K_λ with connected fibre | README's reading; jets gap declared | none |
| §6.1 Checks 3–4 | B=F, b=π; D quaternion, R an F_{p²}-algebra | θ_b∘transition = π·id, zero mod π; (O_D/Π)⊗_{F_p}R=R×R, ranks (1,1) vs (2,0) with total 2 | type condition needed | none |
| §6.5 | SW lines 7811–7822 | M_Dr: O_D⊗R-linear quotients of rank n; Thm 21.7.1 for general μ as in RZ17 | as stated | none |
| §6.6 | SW lines 7852–7879; KRZ Def 2.1.1 (KRZ line 535) | ( , )=tr_{F₀/ℚ_p}ϑ⁻¹( , )_{F₀}, ( , )_{F₀}=tr_{F/F₀}δ⁻¹⟨ , ⟩, δ unit or uniformizer; self-dual chain ramified, almost self-dual unramified; r_{φ₀}=r_{φ̄₀}=1, r∈{0,2} elsewhere | as stated | none |
| §6.6 Check 2 | xy=ϖ_E² over O_E | dim 2, embedding dim 3; flat, generic smooth, special xy=0 reduced ⇒ normal (A₁) | regular not asserted | none |
| §7.1 / Layer 7 Examples | zero bound; GL₂ line model; node xy=π | π₀=1 and H⁰ dim 1 in each case; annular tube connected; node (dim,depth)=(1,1) so S₂ | GL Lemma 5.1 instance | none |
| §7.3 | GL Cor 3.5 proof; PGL₂ at p=2 | G adjoint, Adm(μ) realized as Adm(μ′) for split G′, CM there; HLR Thm 1.1: non-normal Schubert varieties are not S₂ | transfer as stated | none |
| §7.4 example | PU₃, p=3, μ=(1,0,0) | 2ρ=(2,0,−2), ⟨2ρ,μ⟩=2; non-normal (HLR line 1867) but unibranch, perfection normal (AGLR line 1222); lowest costandard stalk F_ℓ | bound 1 holds | none |
| §8.2 Check 3 | unipotent block, eigenvalues q⁻¹,1, N(e₂)=e₁ | admissible filtration ⟨e₁⟩⊂V: graded trace q⁻¹+1; V^I=⟨e₁⟩: trace q⁻¹; q=9: 10/9 vs 1/9 | grade before invariants | none |
| §§8.3–8.4 | d=1, q=9, hyperspecial GL₂ | τ=−1/3; κ^ss=(−1)^dτ=1/3=z^ss; φ=q^{d/2}z^ss=1; z^ss image q^{−1/2}1_{Kt^μK}=(1/3)·1 | consistent with AGLR line 151 | none |
| §8.4 Check 3 | μ=0 | V_0 trivial, trace 1 for every π; z_Φ=1_{P_r} at every level | correct | none |

## Not verifiable

- `gap:minuscule-dominance-tests`, `gap:minuscule-root-coefficients`, `gap:minuscule-cartan-coefficients` name items MB.1–MB.3 of RootSystemsPartII's "Independent continuation briefs"; the board design carries the brief as one long paragraph in which the MB labels occur, but the brief proposes a separate roadmap, so the labels could not be checked as sections. Declared gaps are contracts and this is not a finding.
- GLX page numbers are cited "(v3)" against arXiv:2208.07195v3; the cached extraction carries no page markers for GLX, GL, AGLR, HLR or KZ, so printed pages for those five were checked only through the theorem numbers.
- GL line 80 cites "[AGLR22, Theorem 7.23]" for the removed exceptions; the cached AGLR v2 has Theorem 7.22 and Remark 7.23 at that place. The README cites AGLR by its own v2 numbering, so nothing in the package depends on this.
- The published Forum of Mathematics, Pi pagination of KPZ was checked only through the "=== page N ===" markers of the extraction (pages 16–46 agree with the README's citations); the Cambridge PDF itself was not opened.

## Source issues

- **Misprint** in PZ at §9.d.3, formula for A_μ (printed p. 76; PZ line 3127): the source writes the minuscule hyperspecial trace function with the factor q^{+(ρ,μ)}; with (9.9) RΨ_μ≅ℚ_ℓ[d](d/2) and the geometric Frobenius of its own definition (PZ line 3077) it should be q^{−(ρ,μ)}; affects nothing (Theorem 9.16 is stated through A_μ:=τ^ss(F̄_μ)).
- **Misprint** in SW at §21.8 (printed p. 206; SW line 7901): the GL₂ components of μ are written (1,1) over φ₀ and (0,0) or (2,2) elsewhere; they should be the weights (1,0) over φ₀ and (0,0) or (1,1) elsewhere, since Theorem 21.8.1 identifies the model with the one-dimensional Drinfeld model; affects nothing (the proof uses the adjoint datum).
- **Misprint** in KZ at Lemma 5.2.5 (p. 52; KZ line 2317): the hypothesis reads ṫ^λ∈𝒢(F_q[[t]]), which fails for every nonzero translation; it should read ṫ^λ∈G(F_q((t))), F_q-rationality, which is all the proof uses; affects nothing.
- **Error** in KPZ at Remark 4.1.5(2) (printed p. 31; KPZ line 1354): the surface Spec k[x,y,z]/(x²+xyz) is called normal; it is reduced with the two components x=0 and x+yz=0, so not normal; affects nothing (the example only shows a tangent-cone obstruction).
- **Misprint** in KPZ at §4.3.1 (printed p. 40; KPZ line 1746): Ad(x_{−α}(1))X_α is written X_α+H_α+X_{−α}; with the standard E,H,F it is E−H−F, the signs being convention-dependent; affects nothing (only the span of the H-component is used).
- **Gap** in KPZ at Theorem 4.3.2(2) with Proposition 4.3.10 Case (2) (printed pp. 40, 45; KPZ line 1966): the detector equals −2m_{α_n} or −2m_{α_{n−1}} and is declared nonzero, which fails in characteristic 2 while the theorem states no restriction on p; it should assume p≠2 in the Dᴴ endpoint case; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "60448fc", "job": "RT-GeometricSatakeAndFusionPartII~1b", "model": "fable", "worker": "fable-rt200"} -->
