<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1169#issuecomment-6399873614 -->
Red team round 1 pass a (codex) of 6d65613

Verdict: needs_changes

1. **F01** (P2) The native dyadic Witt classification is missing from the acceptance test

   **Location:** packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:445; packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean:10–34. “Prove this function is the underlying function of an additive equivalence”.

   **Claim:** The acceptance test covers every statable deep theorem. Section 4.1 is a complete classification and multiplication computation on an already available carrier, even though the summary calls it an input. This is a universal classification of Witt classes of forms of arbitrarily large dimension, not an assertion computing a handful of example classes.

   **Witness:** TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:218 supplies `WittRing`; TauCeti/LinearAlgebra/QuadraticForm/Witt/FundamentalIdeal.lean:89 supplies `oneFoldPfisterClass`. Set u=1, v=⟨⟨2⟩⟩, c=⟨⟨−3⟩⟩. No integral carrier is needed.

   **Exact repair:** “State the §4.1 additive coordinate classification and multiplication-by-c formula in Suggested.lean, importing the pinned Witt modules. Define only u, v, c and the finite coordinate function with real bodies; assert bijectivity/additivity and c·(au+bv+ec)=ac+4bu as headline theorems.” Test the repaired statement on (0,0,0), (1,0,0), (0,1,0), (0,0,1): the images are 0,u,v,c and their c-products are 0,c,4u,0. Multiplication by c has image of size four and annihilator of size eight. No small-value auxiliary theorems belong in Suggested.lean.

2. **F02** (P3) The Hasse-sign Check has no specified stabilization

   **Location:** packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:460. “signed determinant a square and stabilized Hasse sign −1”.

   **Claim:** The displayed four-form has a specified Hasse sign after stabilization, but neither the stabilization rank nor a relative invariant is defined.

   **Witness:** For ⟨1,3,−2,−6⟩ the six Hilbert symbols are +1,+1,+1,+1,−1,−1, with product +1. The native `RegularFormClass.localHasse_mk` (TauCeti/NumberTheory/LocalField/QuadraticForm/Hasse.lean:98) uses this product.

   **Exact repair:** “The tensor c·v is ⟨1,3,−2,−6⟩. Its determinant is 36 and its ordinary rank-four Hasse invariant is +1, agreeing with ⟨1,1,1,1⟩. The rank-four hyperbolic form has determinant square and Hasse invariant −1, so cv=4u≠0.” This gives the same nonzero class with a reproducible sign. Adding two hyperbolic planes changes the first form’s ordinary Hasse invariant to −1, which explains why an unspecified stabilized sign does not define a Check.

3. **F03** (P3) Stable homotopy prerequisites point to adapter sections

   **Location:** packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:83. “StableHomotopyKTheory §§5.5, 5.7–5.9 supplies true homotopy groups, stable fibres and their long exact sequences.”

   **Claim:** Those sections supply true homotopy groups and their exact sequences.

   **Witness:** TauCetiRoadmap/StableHomotopyKTheory/README.md §§5.5, 5.7–5.9 concern stable-equivalence tests, point-set adapters and finite biproducts. Its supplier table imports the true groups from GeneralizedCohomology G2.3–G2.6; §5.7 imports derived fibres.

   **Exact repair:** “Consume GeneralizedCohomology G2.4–G2.6 for the stable category, true homotopy groups, spectral Whitehead and mapping-spectrum long exact sequences. Use StableHomotopyKTheory §§5.7–5.9 only for its point-set fibre/cone adapters, boundary sign and finite biproduct comparison.” Update the corresponding §2.2 Needs line. GeneralizedCohomology G2.4, TauCetiRoadmap/GeneralizedCohomology/README.md:271–279, explicitly constructs the exact sequences and Whitehead theorem. The identity map still has zero fibre, and the difference map on (2,1) still equals 1.

4. **F04** (P3) Anti-structure conventions have no discriminating Checks

   **Location:** packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:290, 296–301. “Tφ(x,y)=α(φ(y,x))u”.

   **Claim:** The lifting target includes general Wall anti-structures, but every existing Check has α=id and u=1. Omitting u or reversing the noncommutative action passes all of them.

   **Witness:** Over ℚ with α=id,u=−1, φ(x,y)=xy gives φ+Tφ=0, while omitting u gives 2xy. Over M₂(ℚ), a=E₁₂,b=E₂₁ satisfy (ab)ᵗ=E₁₁ but aᵗbᵗ=E₂₂.

   **Exact repair:** “Add anti-structure Checks: (1) for α=id,u=−1 on ℚ, the one-dimensional diagonal refinement has zero symmetrization and is singular; (2) for φ with matrix [[0,1],[0,0]], u=−1 gives [[0,1],[−1,0]] of determinant 1, while u=1 gives determinant −1; (3) on M₂(ℚ) with transpose involution, verify α(E₁₂E₂₁)=α(E₂₁)α(E₁₂)=E₁₁, whereas preserving the order gives E₂₂.” These checks distinguish the sign and right-module anti-action without changing the valid lifting theorem.

5. **F05** (P1) The regular henselization-completion map is not supplied

   **Location:** packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:83, 332, 340. “including regularity of completion of the finite-type henselizations used by approximation”.

   **Claim:** SchemeAndStackFoundations §§0.14–0.15 and 0.21 provide regularity of the completion map for henselizations of finitely presented pairs, enabling Popescu in §2.5.

   **Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:1404–1414 treats local G-ring completions; §0.13:1043–1045 supplies Noetherian henselization and faithful flatness. Neither supplies geometric regularity for nonlocal pair-completion maps, required by CMM line 1665.

   **Exact repair:** Add to the README supplier contracts and plan.json gaps a matching `gap:henselian-pair-completion-regular`, supplier `SchemeAndStackFoundations`, section `0.21`, needs: “For a finitely presented commutative ℤ-algebra A, an ideal I⊆A, and the henselization (H,J) of (A,I), the canonical map H→AdicCompletion J H is a regular map of Noetherian rings.” Cite this gap in §2.5 and remove the assertion that the present supplier already proves it. For A=ℤ[x], I=(2), the closed fibre is 𝔽₂[x], so H is not local; the new contract covers this instance while the quoted local G-ring statement does not. This finding concerns an undeclared missing bridge, not any of the three accepted gap contracts.

6. **F06** (P3) The fracture sign Check incorrectly calls an additive map a map of units

   **Location:** packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:282. “The maps of units send (1,1) to 1−1=0”.

   **Claim:** The difference map is a map on unit groups, tested also on (2,1).

   **Witness:** Zero is not a unit in ℚ₂; moreover 2 is not a unit of ℤ₂. The difference map is a homomorphism of underlying additive groups, not of multiplicative unit groups.

   **Exact repair:** “The additive difference map ℤ[1/2]⊕ℤ₂→ℚ₂, (a,b)↦a−b, sends (1,1) to 0 and (2,1) to 1.” Both inputs belong to the displayed domain and both outputs now have the correct additive carrier. Keep this as a README Check.

## Verified sound

Read all 647 README lines and all 69 Suggested.lean lines: **1 declaration, 23 numbered target sections, 101 Check bullets**. The README uses numbered headings rather than bold target headings; all 23 were included. Verified **28 distinct accessible source locators in four works**, with the corrections and access limits below. Checked the **11 supplier-roadmap contracts**, including ArithmeticKTheory at the supplied current head, and searched the **51 named sibling folders**, main, completed roadmaps, board packages and the roadmap index by mathematical object. These counts include the targets with findings; soundness qualifications are recorded row by row.

The only Lean declaration is a genuine classification theorem, not padding. Its retained variables agree with the supplied elaborated signature. There are no local definitions, instances, opaque data, extra imports, `lemma`, `set_option`, admitted examples or free proposition stand-ins in Suggested.lean. The PR diff lists eight files, all inside this package. No Lean command, build, git mutation or external write was run. Mathematical scratch computations use exact rational arithmetic and finite enumeration, not Lean proof claims.

The three existing gaps have identical slugs and needs sentences in README and plan.json, named earlier suppliers, and precise hypotheses. No finding is raised merely because those contracts are not implemented. The localization-completion gap is associative-ring general; the commutative derived-completion API does not replace it. The quadratic-extension gap asks for exactness, which the pinned transfer/projection-formula declarations alone do not provide.

Dependency command output:

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No ownership moves are proposed. R03 corrects a locator to an owner on main; R05 requests an additional bridge from an existing supplier.

### Headline and carrier inventory

| README target family | Acceptance assessment |
| --- | --- |
| §§0.1–0.3 integral comparison, injection, canonical residue | Integral symmetric/quadratic Witt carriers missing; named in docstring. Native field Witt theory is not an integral substitute. |
| §0.4 finite-field Arf completeness | Present as `arf_trace_classifies`. Arbitrary finite characteristic-two field, independent dimensions and zero dimension are retained. |
| §0.4 abstract Witt scalar-extension law | Deferred explicitly: native `QuadraticForm.baseChange` has the invertible-two binder. The abstract characteristic-two Witt carriers are also absent. |
| §§1.1–1.2 characteristic-two and DVR L-tables | Missing periodic L-spectra; named in docstring. Characteristic-not-two tables are imported. |
| §2.1 completion decomposition | Native carrier construction and CRT/cofinality intermediate; no missing spectral carrier is claimed for it. The quotient API is not acceptance-test padding to add. |
| §§2.2–2.5 fracture, general anti-structure lifting, complete/henselian rigidity | Missing Poincaré and general quadratic-refinement/spectral carriers; explicitly named. R05 concerns the proof prerequisite, not statability. |
| §§3.1–3.4 total quotient, number-field refinements, parity, localization | Integral Witt and L carriers missing; explicitly named. General Dedekind tables and extension are consumed from ArithmeticKTheory §3.5. |
| §4.1 complete dyadic Witt-coordinate classification | Native field carrier exists; missing substantive acceptance theorem, R01. |
| §§4.2–4.3 E₈ integral comparison and dyadic integral subgroup | Integral comparison carriers missing; docstring names these. The 136-zero computation stays a Check. |
| §§5.1–5.3 Eisenstein arithmetic, symmetric group and restriction | Integral group headline is deferred explicitly. The field restriction calculation applies the declared exactness contract and §4.1; no independent generic exactness theorem should be duplicated. |
| §§5.4–5.5 quadratic image and Eisenstein tables | Integral carriers/L-spectra missing; docstring names the endpoints. |

### Lean declaration ledger

| Declaration / context | Instances and both sides | Result / change |
| --- | --- | --- |
| `TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmeticPartII.arf_trace_classifies`, Suggested.lean:47, Layer 0. Independent universes for k,V,W; Field/Fintype/CharP 2/𝔽₂-algebra on k; additive-group, module and finite-dimensional instances on V,W; q,q′, n,m, two bases and six symplectic-pairing hypotheses. No section variables or `include` dependencies. | k=𝔽₂,n=m=0: traces 0=0; L=0 and 2·0=0. n=0,m=1,q′=xy: traces 0=0; L=span(e), 2·1=2. Replace q′ by x²+xy+y²: 0≠1; zero set has only 0, so no dimension-one L. q=q′ anisotropic: 1=1; diagonal L has dimension 2 and q(x)+q(x)=0 in dimension 4. Over 𝔽₄ the same plane has trace 1+1=0; its isotropic line is span(ζ,1), so comparison with xy gives 0=0 and dim L=2. | Both iff directions survive; perfectness follows from the invertible symplectic Gram matrix, so the half-dimensional vanishing subspace is its perpendicular. The supplied elaborated type retains every displayed hypothesis. No change. |

### Target, convention and definition ledger

Here H denotes the hyperbolic plane. Each row records values, not just a verdict. Sections involving future spectra are mathematical checks conditional on the cited supplier contracts.

| Statement / context | Instances tried and computed values | Result / change |
| --- | --- | --- |
| Conventions: perfect polar, quadratic Lagrangian, zero ring/module | ℤ-line B=2 has cokernel ℤ/2; zero-module adjoint has kernel=cokernel=0. Over 𝔽₂ q=x² has polar 0 on a dimension-one space. Zero ring has only module 0. | Excludes determinant-only regularity and singular characteristic-two lines. |
| Conventions: periodic sign and difference | At ℤ, negative-sign L₂=positive L₀=ℤ, negative L₀=positive L₋₂=0. Difference at (1,1)=0, (2,1)=1; sum would give 2,3. | Correct; unit-language Check is R06. |
| Conventions: residue line and its shift | At ℤ_(2), l=(½ℤ_(2))/ℤ_(2), multiplication by 2 identifies l with 𝔽₂; RHom residue coefficient is l[−1]. π=5 versus 10 changes coefficient 1 to 3 modulo 5. | Correct line versus chosen coordinate distinction. |
| Conventions: symmetric/native comparisons and signed determinant | B=⟨1⟩ maps to q=x² under the unital identification, whose polar is 2; inverse polarization is x²/2, whose polar is 1. H=⟨1,−1⟩ has det=−1,d±=1; ⟨1,1⟩ has det=1,d±=−1. | Correct factor of two and determinant sign. |
| §0.1 polarization and inverse | q=x²/2 over ℚ gives b(1,1)=1; q=xy over 𝔽₂ has b=[[0,1],[1,0]], class 0; anisotropic plane has same bilinear class but Arf 1. | Valid construction; invertible-two restriction necessary for inverse. |
| §0.2 integral injections / zero σ in char 2 | ℤ-line has signature 1 before and after extension; over 𝔽₂[t] the polar plane has class 0 while unit line has parity 1; R=K gives identity and zero kernel. | Consistent with saturation proof and supplier injection. |
| §0.3 residue definition, additive/square/finite-support laws | ∂₂⟨3⟩=0, ∂₂⟨2⟩=1, ∂₂⟨4⟩=0; ∂₃⟨6⟩=⟨2⟩; ∂₂(⟨2⟩⊥⟨−2⟩)=1+1=0. For ⟨6⟩ over ℚ only primes 2,3 contribute. | No missing finiteness restriction; direct sum is correct. |
| §0.4 Arf definition, completeness, additivity, base change | Over 𝔽₂ traces of H,A,A⊥A are 0,1,0; zero-space trace 0. Over 𝔽₄ Tr(1)=0,Tr(ζ)=1. Degree 1,2,3 acts on 1 by 1,0,1. | Correct absolute trace, not raw sum. |
| §1.1 characteristic-two global table | 𝔽₂[t] has Pic/2=0 and ∂t⟨t⟩=1; 𝔽₂(t) has no nonzero primes and Pic=0; t inverted removes exactly the t coordinate. | No perfectness hypothesis inadvertently added to K. |
| §1.2 DVR/global sequence | ℤ_(2): L₁ˢ=ℤ/2; ℤ_(3): L₁ˢ=0; both second residues onto. 𝔽₂[[t]]: odd groups 0, even Ws; ℤ: residues ℤ,ℤ/2,0,0. | Correct shift and dyadic distinction. |
| §2.1 C and comparison/projections | ℤ: one ℤ₂ factor; ℤ[i]: one factor, cofinal exponent 2m; Eisenstein: one factor of residue degree 2. ℚ and ℤ[1/2]: every quotient zero, C=empty product=0. | CRT/cofinality valid for ramified and empty families. |
| §2.2 fracture / controls / Tate boundary | (ℤ,1): square ℤ→0 over ℤ→0; (ℤ/4,2): top identity, bottom 0; (ℤ,2): overlap ℚ₂, Tate groups 0. Dense even-Euler category has K₀ image 2ℤ and excludes class 1. | Valid conditional on the two declared supplier gaps; retain controls. |
| §2.3 anti-structure, quotient refinement and lifting | α=id,u=1: Tφ=φᵗ and polar of xy has determinant −1. α=id,u=−1: a diagonal φ has φ+Tφ=0. J²=0 sends first-order error to zero; J=0 gives the original isometry. | Statement supported by Wall; add sign/noncommutative Checks, R04. |
| §2.4 complete rigidity | ℤ₂→𝔽₂ and dual numbers→𝔽₂ give quadratic residues ℤ/2,0,ℤ/2,0; J=R plus separation gives R=0 and zero spectra. Symmetric groups instead have sizes 16→2. | Valid theorem; degree-one proof remains locator-only at Wall-1973. |
| §2.5 henselian rigidity | Complete examples agree with §2.4; J=0 is identity; I=(2) in ℤ₂ is nonnilpotent. Pair-henselization of (ℤ[x],(2)) has quotient 𝔽₂[x], hence is nonlocal. | Theorem supported by III Remark 2.3.8; missing supplier bridge is R05. |
| §3.1 two-image quotient and all universal properties | D=ℤ/4,U=2D,V=0: quotient has 2 elements; V=D gives 1. D=(ℤ/2)²,U=Δ,V=0: quotient has 2 elements. D=0 gives 0 group. | Sum of ranges, not intersection; zero iff d=u+v, factorization iff both ranges killed. |
| §3.2 number-field refinements / finiteness | ℤ has d=1,L₂q=ℤ/2,A=0; Eisenstein has d=1,L₂q=ℤ/2,A=ℤ/4; ℤ[1/2] has d=0 and both groups 0. | No false splitting or d=1 vanishing inference. |
| §3.3 canonical parity quotient | d=0,1,2,3 gives quotient cardinalities 1,1,2,4. In the imperfect example, discriminant 17 is a unit; reduction x(x+1) gives two residue fields 𝔽₂(t); v_t(t)=1 excludes squares. | Correct in infinite imperfect residue characteristic two. |
| §3.4 nondyadic localization | Empty S gives R→R→0. S={3} over ℤ preserves ℤ₂ and adds Lq(𝔽₃). S={2} would force L₂q(ℤ)=0 instead of ℤ/2. | Restriction is required by genuine failure, not a shortcut. |
| §4.1 u,v,c, full coordinate map, ideal and annihilator | All 32 triples have distinct parity/determinant/Hasse invariants after stabilization to dimension 12 or 13. All 32 c-products agree with ac+4bu. 2v=2c=c²=0, cv=4u≠0, 8u=0; image size 4, kernel size 8. | Classification supported; acceptance omission R01 and ambiguous sign R02. |
| §4.2 E₈ half-norm reduction | Arms 2,4,1 give 136 zeros and 120 ones in 256 vectors; root value 1; adjacent-root sum value 1. Signature=8, divided signature=1. | Correct refinement, not the identically zero full norm mod 2. |
| §4.3 integral subgroup and polar image | Residue kills u,c and sends v to 1; kernel size 16. Polar diag(2,3/2) has d±=−3 and matches c+4u, not c. ⟨u,c+4u⟩ has 16 elements. | A(ℤ)=0 follows. |
| §5.1 Eisenstein completion / units | X²+X+1 at 0,1 gives 1,1; derivative mod 2=1; e=1,f=2. Norm a²−ab+b²=1 has six units, squares index 2. ℚ(√−7) instead gives two linear factors. | Inertness and unramifiedness independently tested. |
| §5.2 symmetric group | 0,u,2u,3u give parity/discriminant (0,1),(1,1),(0,−1),(1,−1). 2u≠0 and 4u=0 after degree-two extension of the quaternion obstruction. | Order four, completed images distinct. |
| §5.3 restriction / specified transfer | Kernel ⟨c,4u⟩ has 4 elements; integral source 16 gives image 4; field source 32 gives image 8. Transfer image ann(c) has 8 elements. λ(1)=0,λ(s)=1; symmetric residue map sends 1 to 1. | Correct conditional on declared exactness gap. |
| §5.4 zero Arf change and new local image | q_A(ζ,1)=0; Tr(ζ)=1 for new plane. d=1−4ζ has norm 1−4(−1)+16=21≡5 mod 8; norm(−1)=1. | New order-two class t differs from 0,2u and intersects ⟨u⟩ trivially. |
| §5.5 integral quadratic table | Images of sizes 4 and 2 intersect in 1 element; kernel Wq(R)=0. Transfer(t)=c, so ann(c)/⟨c⟩ has four elements generated by 2u. Pic/2=0, L₂q=ℤ/2,L₃q=ℤ/4. | Corrected source table survives the arithmetic test. |
| Examples / worked tables | ℤ: A=0, symmetric ℤ,ℤ/2,0,0 and quadratic ℤ,0,ℤ/2,0. ℤ[1/2]: A=0 and positive residues away from 0 vanish. Eisenstein: A=ℤ/4 and quadratic 0,0,ℤ/2,ℤ/4. | Consistent across layers. |

### Individual README Check ledger

Each locator is a line of packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md. Values record the claimed comparison and the independent calculation; the two exceptions point to findings. Spectral values use the verified mathematical supplier statements, rather than executable Lean objects.

| Check line | Computed comparison / result | Change |
| --- | --- | --- |
| 106 | q(2)−2q(1)=2−1=1; the unhalved diagonal instead gives 4−2=2. | None |
| 107 | A has Arf 1; its polar has the isotropic line span(e), hence symmetric Witt class 0. | None |
| 108 | The adjoint is multiplication by 2: determinant 2, cokernel ℤ/2. On rank zero its kernel and cokernel are both 0. | None |
| 109 | For s²=−5, I² has generators 4,2+2s,−4+2s; their combination (2+2s)−(−4+2s)−4=2 gives I²=2R. Thus (1/2)I=I⁻¹. | None |
| 121 | The real signature of the line is 1 before and after extension; the zero class has signature 0. | None |
| 122 | The polar matrix of xy is [[0,1],[1,0]], with a rank-one Lagrangian; the unit line has parity 1. | None |
| 123 | R=K gives id on classes; on the zero module L=0=L⊥ and 2 dim L=0. | None |
| 147 | v₂(3)=0, so residue=0; reduction alone would give the nonzero unit class 1. | None |
| 148 | v₂(2)=1 and 2/2=1, so residue=1; direct coefficient reduction gives 0. | None |
| 149 | v₂(4)=2, and 4 is a square; both residue computations give 0. | None |
| 150 | v₃(6)=1 and 6/3=2; 2 is the nonsquare unit of 𝔽₃. | None |
| 151 | (2)=(1+i)² up to a unit; extension of the ramified linking form has a half-length isotropic submodule, class 0. Plain field extension sends 1 to 1. | None |
| 152 | 5/5=1; 5/10=1/2≡3 mod 5. Coordinate rescaling by 2⁻¹ gives the same line-valued class. | None |
| 179 | q(e)=q(f)=0, b(e,f)=1; Tr(0·0)=0. The line span(e) is Lagrangian. | None |
| 180 | q(1,0)=q(0,1)=q(1,1)=1. Tr(1·1)=1 versus H trace 0; A⊥H has Witt index 1, not 2. | None |
| 181 | ζ²+ζ+1=0; Tr(1)=1+1=0. An isotropic line in A and one in H give a dimension-two vanishing subspace. | None |
| 182 | (x+y)²−x²−y²=0; the one-dimensional polar adjoint has rank 0. | None |
| 183 | Zero trace=H trace=0 and 2·1=2; zero trace≠A trace=1 and A has only the zero vanishing subspace. | None |
| 184 | Tr(ζ)=ζ+ζ²=1, while Tr(1)=0; the two quadratic classes are distinct. | None |
| 185 | b((1,1),(ζ,ζ²))=ζ+ζ²=1. Raw products are 0 and 1; absolute traces are 0 and 0. | None |
| 209 | Pic(𝔽₂[t])/2=0; v_t(t) mod 2=1 equals the residue rank parity. | None |
| 210 | For the field 𝔽₂(t), the prime-indexed sum is 0 and Pic=0; t has odd valuation and is not a square. | None |
| 211 | t is a unit in 𝔽₂[t,t⁻¹]; the t-coordinate is absent, not an added ℤ/2 summand. | None |
| 225 | At 2 the residue of ⟨2⟩=1 and L₁ˢ=ℤ/2. At 3, ⟨3⟩ has residue ⟨1⟩, but L₂ˢ(𝔽₃)=0 and L₁ˢ(ℤ_(3))=0. | None |
| 226 | v_t(t)=1; residue parity=1. The imperfect generic field has only even L-groups, and the onto residue map leaves odd DVR groups 0. | None |
| 227 | ℤ has d=1, Pic/2=0 and tuple (ℤ,ℤ/2,0,0); 𝔽₃[t] has d=0, Pic/2=0 and tuple (Ws,0,0,0). | None |
| 228 | For n=2, n−2=0 and L₀ˢ(ℤ)=ℤ; for n=0, n−2=−2≡2 and L₂ˢ(ℤ)=0. | None |
| 262 | (2) has one prime of e=f=1; the inverse limit is ℤ₂, with quotient 𝔽₂. | None |
| 263 | 2 is a unit; each quotient is 0 and the empty ring product is the zero ring. | None |
| 264 | X²+X+1 has no root over 𝔽₂; one factor, e=1,f=2 and residue cardinality 4. | None |
| 265 | (2)=(1+i)² up to a unit: one prime, exponent 2, cofinal local powers 2m; not two product factors. | None |
| 266 | In ℚ and ℤ_(3), (2^m)=R for every m, so every quotient and its limit equal 0. | None |
| 267 | At x, the two maps have first coordinate 0=0 and second coordinates 0≠1. With no factors the codomain has one element. | None |
| 281 | ℓ=1 gives C=0 and localization=R; the pullback of R→0←0 is R. | None |
| 282 | The additive difference gives 1−1=0 and 2−1=1; 0∉ℚ₂× and 2∉ℤ₂×. R06. | R06 |
| 283 | Euler(k[0])=1∉2ℤ, while Euler(k[0]⊕k[0])=2∈2ℤ; the dense control cannot be replaced by ℤ. | None |
| 284 | In ℤ/4, 2²R=0; the completion stabilizes at R and localization at 2 is 0. | None |
| 298 | b_xy=[[0,1],[1,0]], det=−1 in ℤ₂ and 1 in 𝔽₂; no denominator 2 occurs. | None |
| 299 | Reduction gives trace products 1·1=1 and 0·0=0; hence no isometry exists to lift between these forms. | None |
| 300 | For J=0 every error is 0. In the dual numbers, an error proportional to ε has quadratic remainder proportional to ε²=0. | None |
| 301 | Both coefficients reduce to 1; a putative isometry requires a²=3 in ℤ₂. Odd squares are 1 mod 8, whereas 3≠1. | None |
| 317 | Reduction yields the quadratic tuple (ℤ/2,0,ℤ/2,0) on both sides. | None |
| 318 | ε²=0; reduction of the nilpotent thickening gives the same tuple (ℤ/2,0,ℤ/2,0). | None |
| 319 | J=0 gives id. If J=R, all R/Jⁿ=0; separated completeness identifies R with 0. | None |
| 320 | The symmetric source has 16 classes, residue has 2; a bijection would require 16=2. | None |
| 336 | ℤ₂→𝔽₂ gives order 2 in each even quadratic degree and order 1 in each odd degree. | None |
| 337 | The square-zero ideal is nilpotent and henselian; both quadratic tuples are (ℤ/2,0,ℤ/2,0). | None |
| 338 | For J=0 reduction is id. In ℤ₂, 2ⁿ≠0 for all n, while the pair is henselian. | None |
| 374 | Take D=ℤ/4,U=D,V=0: D/(U+V)=0 although V→D is not onto. | None |
| 375 | Take D=ℤ/4,U=0,V=D: D/(U+V)=0 although the global image vanishes. | None |
| 376 | For d=1,2,3 the diagonal has 2 elements and the quotient has 1,2,4 elements, respectively. | None |
| 377 | At d=1, parity quotient has order 1; the Eisenstein total quotient has order 4. | None |
| 378 | When 2 is invertible, C=0, Ws(C)=0, and the quotient by the two zero images is 0. | None |
| 379 | ℤ/4 divided by {0,2} has 2 elements; adding the whole quadratic image gives 1. The intersection with {0} instead gives 4. | None |
| 393 | d(ℤ)=1, L₂q has 2 elements, and the two images generate Ws(ℤ₂), giving A=0. | None |
| 394 | d(ℤ[1/2])=0, C=0, so L₂q=0 and A=0. | None |
| 395 | d(ℤ[ζ₃])=1 and the quotient ann(c)/⟨c⟩ has order 4. | None |
| 409 | Δ={(0,0),(1,1)}; (1,0)∉Δ and the quotient has 4/2=2 elements. | None |
| 410 | There are 8 vectors and 2 in Δ; 8/2=4 cosets. | None |
| 411 | d=1 gives 2/2=1 coset versus order 4 for A; d=0 gives one vector and one coset, A=0. | None |
| 412 | Discriminant 17 is a unit; mod 2, X²−X−4=X(X+1). Both residues are 𝔽₂(t), with v_t(t)=1; the parity quotient has 2 elements. | None |
| 426 | Empty localization is R and the indexed residue sum is 0; the fibre of id is 0. | None |
| 427 | Inverting 3 leaves the dyadic completion ℤ₂; the added residue field has cardinality 3. | None |
| 428 | The prohibited S={2} would give 0=π₃Lq(𝔽₂)→π₂Lq(ℤ)→π₂Lq(ℤ[1/2])=0, forcing 0 where the actual group is ℤ/2. | None |
| 429 | For ⟨6⟩ only primes 2 and 3 can contribute; a tuple nonzero at infinitely many primes has infinite support and is outside the direct sum. | None |
| 459 | v=⟨1,−2⟩ has d±=2, residue 1, 2v=0; multiplying by c gives nonzero 4u. | None |
| 460 | det⟨1,3,−2,−6⟩=36, ordinary Hasse=+1; the rank-four hyperbolic Hasse=−1. R02. | R02 |
| 461 | 2v has rank 4, square determinant 4, Hasse −1, hence is hyperbolic; v residue=1 versus residues 0 for u,c. | None |
| 462 | −5/3≡1 mod 8; rescaling identifies coefficient 3 with −5. d±(c)=−3≡5 mod 8. | None |
| 463 | 2c and c² have rank 4, square determinants 9 and 81 and Hasse −1, hence class 0. c⟨1,−3⟩=0; cv=4u≠0. | None |
| 464 | c(2u)=2c=0, whereas cu=c has nonsquare signed determinant −3 and is nonzero. | None |
| 465 | Coordinate images 0,u,v have parities 0,1,0. Stabilized determinant/Hasse computation distinguishes all 32 triples. | None |
| 466 | c(au+bv+ec)=ac+4bu vanishes for the 4 even a, b=0 and either e: 8 triples. Image={0,c,4u,c+4u}, size 4. | None |
| 467 | 8u=0 and 2v=0, so integer-coordinate triples (8,0,0),(0,2,0),(0,0,0) all have image 0 before quotienting the coordinates. | None |
| 479 | B(eᵢ,eᵢ)=2, half-norm=1; full norm mod 2 would be 0. | None |
| 480 | For adjacent roots q(eᵢ+eⱼ)=1+1−1=1 and b=−1≡1; nonadjacent b=0. | None |
| 481 | The half-norm polynomial has 136 zeros, 120 ones; 2⁷+2³=136 versus 2⁷−2³=120. | None |
| 482 | The E₈ Gram matrix is positive of rank 8, signature/8=1. An integral line q=ax² has polar coefficient 2a, never 1. | None |
| 496 | Residues of u,c,v are 0,0,1. Exactly 8·2=16 coordinates have b=0; u itself has odd rank. | None |
| 497 | The displayed section is −v=v because 2v=0; residue(−v)=−1=1 in ℤ/2. | None |
| 498 | The polar determinant is 3, signed determinant −3; diagonal entries 2,3/2 multiply to 3. After equal-rank stabilization its class is c+4u. | None |
| 499 | From u and c+4u one recovers c=(c+4u)−4u; all 16 kernel classes lie in the sum of the images, giving quotient 0. | None |
| 530 | P(0)=P(1)=1 mod 2; the quotient has four elements and degree 2. | None |
| 531 | Disc(P)=−3 is odd and P′≡1; ramification index is 1. | None |
| 532 | X²+X+2≡X(X+1) mod 2 with distinct roots 0,1; there are two dyadic primes despite odd discriminant −7. | None |
| 533 | a²−ab+b²=(a−b/2)²+3b²/4. Norm 1 forces b=−1,0,1 and gives six solutions; the squares form the order-three subgroup. | None |
| 547 | d±(2u)=−1 is nonsquare; K and its dyadic completion do not contain i, so 2u≠0. | None |
| 548 | The quaternion invariant 1/2 becomes 2·(1/2)=0 after degree two at the dyadic place; thus 4u=0 while 2u≠0. | None |
| 549 | The four parity/signed-discriminant pairs are (0,1),(1,1),(0,−1),(1,−1); no two agree. | None |
| 563 | Restriction kills c,4u; their subgroup has order 4. The integral image has order 16/4=4, generated by the order-four image of u. | None |
| 564 | The annihilator has 8 coordinates, whereas (c) has 4; transfer identifies the restriction cokernel with the former. | None |
| 565 | Symmetric rank parity sends 1 to 1 under 𝔽₂→𝔽₄; quadratic absolute trace sends the old 1 to 1+1=0. | None |
| 566 | λ(1)=0,λ(s)=1 gives nonzero λ. Ordinary trace instead transfers ⟨1⟩ to ⟨2,−6⟩ of nonsquare signed determinant 12, so it cannot kill the restriction image. | None |
| 582 | q(ζ,1)=ζ²+ζ+1=0; the two-dimensional nondegenerate form therefore has Witt class 0 over 𝔽₄. | None |
| 583 | Tr(ζ)=ζ+ζ²=1; the polar entries are 2,1,1,2ζ with determinant 4ζ−1. | None |
| 584 | (1−4ζ)(1−4ζ²)=1−4(−1)+16=21≡5 mod 8, a nonsquare. | None |
| 585 | The class 2u has determinant norm N(−1)=1; t has norm 21. Their ratio is nonsquare, excluding equality; t also differs from 0. | None |
| 599 | The images have orders 4 and 2 and trivial intersection; their fibre-product kernel is 0. | None |
| 600 | Transfer(t)=c; (ℤ/4⊕ℤ/2)/⟨c⟩ has 4 elements, generated by 2u. | None |
| 601 | The rational congruence below gives diagonal (1,−1,4,−21/4), determinant 21. The remaining class is ⟨1,−21⟩=⟨1,3⟩ since −7≡1 mod 8. | None |
| 602 | Pic/2=0,d=1; L₂q has 2 elements and L₃q=A has 4, while the parity quotient has 1. | None |

For the §5.5 transfer matrix M, the four columns (0,0,1,0), (0,0,1/2,1/2), (4,0,1,1), (−9/2,1/2,−3/2,−1) give an invertible rational matrix T with TᵗMT=diag(1,−1,4,−21/4). All six off-diagonal entries are zero; this certifies the diagonalization independently of the source diagram.

### Map and API-law audit

The named construction APIs have the same hypotheses as their parent sections. These rows separate the individual laws from the section-level ledger; no such API lemma belongs in Suggested.lean.

| Statement | Computed comparison / negative control | Result |
| --- | --- | --- |
| §0.1 polar respects isometry and scalar extension | For q=x²/2 over ℚ, f=−id gives b(f1,f1)=1=b(1,1); extending to ℚ₂ keeps b(1,1)=1. | Compatible. |
| §0.1 polar respects sum and zero | For x²/2⊥3y²/2, the polar is diag(1,3), with mixed value 0; the empty matrix remains empty. | Additive. |
| §0.1 Lagrangian descent | For xy, span(e) has q(e)=0 and b(e,e)=0; its perpendicular is the same line. | Metabolic relation preserved. |
| §0.1 inverse comparisons | Half-diagonal of b=1 has polar 1; full polar of q=x² is 2, whose half-diagonal is x². | Both composites are identity when 2 is invertible. |
| §0.3 additive residue homomorphism | At 2, residues of ⟨2⟩,⟨−2⟩ are 1,1; their hyperbolic sum has residue 0=1+1. | Additive/metabolic law. |
| §0.3 unit vanishing | At 3, coefficient 2 is a nonsquare unit but v₃=0, residue 0. | Does not confuse unit and square. |
| §0.3 odd-valuation coefficient | At 3, 6=3·2 gives residue ⟨2⟩. | Unit square class retained. |
| §0.3 square scaling | At 2, 2 and 18=9·2 have unit parts 1 and 9 with the same residue 1. | Square scaling preserved. |
| §0.3 uniformizer transport | π=5→10 sends coordinate 1 to 3; multiplying by the dual trivialization factor 2 restores 1. | Canonical line class unchanged. |
| §0.3 finite support | The line ⟨6⟩ has possible support {2,3}; every p outside this finite set has residue 0. | Direct sum, not product. |
| §0.3 orthogonal sums and metabolic quotient | A hyperbolic pair ⟨πu,−πu⟩ has residue ⟨ū,−ū⟩ of class 0. In residue characteristic 2 its two rank-one classes sum to 0. | Descends. |
| §0.4 absolute-trace definition | In 𝔽₄, Tr(ζ)=1 while Tr(1)=0. | The raw coefficient is not the invariant. |
| §0.4 basis independence | For xy over 𝔽₄ the two bases in Check 185 have raw sums 0,1 and traces 0,0. | Correct weaker invariant. |
| §0.4 orthogonal additivity | Over 𝔽₂, A⊥A has trace 1+1=0 and diagonal Lagrangian of dimension 2. | Additive. |
| §0.4 hyperbolic normalization | q(e)q(f)=0·0=0, absolute trace 0. | Hyperbolic class vanishes. |
| §0.4 zero iff metabolic | Over 𝔽₂, H has trace 0 and a line of zeros; A has trace 1 and no nonzero zero. | Both directions tested. |
| §0.4 isomorphism | H and A realize coordinates 0 and 1; A+A=0 and A≠0. | Two-element target, not trivial. |
| §0.4 scalar-extension degree law | The 𝔽₂ Arf-one plane over extensions of degrees 1,2,3 has absolute traces 1,0,1, equal to those degrees mod 2. | Correct even-degree zero map. |
| §0.4 full-polar regularity | x² has polar rank 0 on rank 1; xy has polar determinant 1 on rank 2. | Excludes squares, includes hyperbolic planes. |
| §2.1 algebra equivalence and quotient projections | For ℤ[i], at level m the ideals (2)^m and ((1+i)^(2m)) agree up to a unit; both quotients have cardinality 2^(2m). | Ramification cofinality retained. |
| §2.1 projection after R→C | For R=ℤ, 3 maps to the compatible sequence 3 mod 2^m and to the same 3 in ℤ₂. | Map, not merely abstract ring equivalence. |
| §2.1 component residue field | At the Eisenstein dyadic prime the component quotient has four elements; at ℤ's it has two. | f=2 versus f=1 distinguished. |
| §2.1 component after inverting 2 | ℤ₂[1/2]=ℚ₂; in the Gaussian completion 2 is a unit times π², so π⁻¹ is also present after inverting 2. | Fraction field even when ramified. |
| §2.1 nondyadic localization | ℤ→ℤ[1/3] induces ℤ₂→ℤ₂; the added inverse 1/3 already exists in ℤ₂. | Completion equivalence. |
| §2.1 unit ideal | ℚ/(2^m)=0 for all m; inverse limit 0. | Correct total-function/empty-product value. |
| §2.1 projection extensionality | In two factors, values (0,0),(0,1) agree only in the first; in zero factors the codomain has one element. | All projections necessary. |
| §3.1 sum-of-ranges quotient | D=ℤ/4,U={0,2},V=0 gives a two-element quotient; intersection instead gives four. | Correct sum. |
| §3.1 surjectivity | Both quotient elements are represented by 0 and 1 in ℤ/4. | Onto. |
| §3.1 zero iff sum decomposition | [2]=0 with 2=2+0∈U+V; [1]≠0 because neither 1 nor 3 lies in U+V. | Both directions. |
| §3.1 unique factorization iff killing images | Reduction ℤ/4→ℤ/2 kills U and factors uniquely; identity ℤ/4→ℤ/4 sends 2 to 2≠0 and cannot factor. | Both directions. |
| §3.1 cokernel on cokernels | In the commuting square with σ_R=0 and bottom group D=ℤ/4, global image 2D, σ_C=0: both iterated and joint cokernels have two elements. Replacing σ_C by id makes both zero. | Correct construction. |
| §3.1 functoriality | Multiplication by 3 on ℤ/4 preserves U=2D; on the quotient it sends [1] to [3]=[1], agreeing with the induced map. | Requires commuting diagram as stated. |
| §3.1 inherited abelian group | In D/U, [1]+[1]=[2]=[0] and [1]+[0]=[0]+[1]. | Uses native quotient, not a new generic group construction. |

### Supplier and pin audit

All section references below were resolved against main, the supplied open head, or the roadmap-index head when the supplier is not on main. The three declared gaps are contractual dependencies, not missing citations.

| Supplier | Resolved objects and boundary |
| --- | --- |
| GeometryOfNumbersAndQuadraticArithmetic §§6.2–6.5, 6.8a–6.9, 6.10a | Exact symmetric/Witt objects; derived Poincaré coefficients, residue lines and L-localization; integer invariant maps. Section 6.10a supplies both integer tables and multiplication by eight. The two §6.8a gaps are precise additions, not present implementations. |
| HermitianKTheoryOfPoincareCategories §§1.6, 3.4, 4.5–4.6, 6.6, 7.9 | Sign periodicity, quadratic Witt/surgery, K₀ controls, low-dimensional comparisons, characteristic-two field groups. Free variants in §4.6 require free coefficient; the scalar coefficient used in rigidity is free. |
| KTheoryFiniteLocalFields §1.7 | Perfect-characteristic-two symmetric rank-parity comparison; does not supply the quadratic degree-two base-change law. |
| ArithmeticKTheory §§1.1–1.3, 2.2, 3.5, supplied current head | Fraction field/localization and Picard conventions; quadratic-to-symmetric injection for fraction characteristic ≠2; general Dedekind tables, degree-three extension and completion square. Its existing targets are consumed rather than repeated. |
| QuadraticFormInvariants Layers 4, 6, 9, main | Native odd-characteristic Witt and local classification; transfer and projection formula. Layer 9 does not already state the quadratic-extension exactness contract. |
| GlobalQuadraticForms §4.4, §§8.1–8.3, main | Hilbert reciprocity and number-field local/global classification. No function-field or imperfect-field assertion is imported from this supplier. |
| Completed/IntegralLattices Layer 5 and active IntegralLattices signature theory | Positive E₈ Gram form, determinant one, evenness and signature divisibility. The half-norm mod-two refinement is this package's additional calculation. |
| GeneralAlgebraicKTheory §§11.3–11.4, 11.15 | Dense triangulated subcategories, K₀-image controls and ordinary nonconnective localization. They do not authorize dropping a proper control subgroup. |
| SchemeAndStackFoundations §§0.13–0.15, 0.21, main | Henselization, smooth lifting, Popescu and local G-ring completion. The nonlocal geometric-regularity bridge is absent: R05. |
| StableHomotopyKTheory §§5.5, 5.7–5.9 | Adapter and finite-biproduct material; its import of GeneralizedCohomology G2.3–G2.6 explains R03. GeneralizedCohomology G2.4 actually supplies the homotopy exact sequences and Whitehead theorem. |

At the pinned Mathlib, QuadraticMap is a homogeneity/bilinear-companion structure (LinearAlgebra/QuadraticForm/Basic.lean:146), not a finite-dimensional or nonsingular form. Its polar is at line 317. The invertible-two hypothesis of `QuadraticForm.baseChange` is in LinearAlgebra/QuadraticForm/TensorProduct.lean:39, with the construction at line 127. `QuadraticMap.prod` (Prod.lean:55) uses addition; in characteristic two it agrees with the difference needed by Witt comparison. `Algebra.trace` (RingTheory/Trace/Defs.lean:70) has the native linear-algebra carrier used by the only acceptance theorem.

At the same pin, AdicCompletion is the compatible inverse-limit subtype (RingTheory/AdicCompletion/Basic.lean:171), with its comparison map at line 364, algebra/evaluation maps in Algebra.lean:104,130, and CRT in RingTheory/Ideal/Quotient/Operations.lean:325. The ClassGroup declarations in Basic.lean:347,353 and `ClassGroup.equivPic` in RingTheory/PicardGroup.lean:876 provide the ideal-class/Picard interface. Cyclotomic integral closure, PID, six-unit, inertia-degree and ramification-index declarations were resolved in NumberTheory/NumberField/Cyclotomic/Basic.lean:126, PID.lean:34, Three.lean:50 and Ideal.lean:291,311. Finite torsion-free projectivity uses RingTheory/Flat/TorsionFree.lean:137 and Flat/EquationalCriterion.lean:287, retaining finite presentation over a Noetherian Dedekind domain.

At the Tau Ceti pin, LinearAlgebra/QuadraticForm/Witt/Ring.lean:218 defines `WittRing` on fields with invertible two as a quotient of the Witt–Grothendieck ring by the hyperbolic ideal. The field characteristic-two and integral dyadic carriers are not silently covered by this type. Its class map and parity are at lines 288 and 386; FundamentalIdeal.lean:89 defines the one-fold Pfister classes used by R01. Witt/BaseChange.lean:211 and Transfer/Witt.lean:147,186 retain their field, finite-dimension and nonzero-functional hypotheses. NumberTheory/LocalField/QuadraticForm/Classification.lean:129,136 and Hasse.lean:91,98 distinguish ordinary from signed discriminant and use the ordinary pairwise Hilbert product. RingTheory/DedekindDomain/AdicValuation/Completion.lean:367,434 supplies the completion and residue comparison without a finite-residue-field hypothesis.

Object searches found no second owner for the package's general finite-field trace coordinate, explicit dyadic three-generator arithmetic, or corrected Eisenstein quotient. The general integral carriers, integer tables, local-field classification, E₈ lattice, Dedekind tables, and transfer stay with the suppliers above. The sole fully qualified acceptance name has no collision in the readable main, package and supplied sibling files. The 51 supplied sibling folders were searched by object; ArithmeticKTheory is the substantive overlapping supplier and was read at its supplied head. Unrelated Witt-vector and Hasse–Arf ramification matches do not own Witt groups of quadratic forms.

### Source-locator audit

These are the 28 distinct accessible locators checked against the supplied legal extractions, with the source errors listed separately below. A supporting locator does not certify every new arithmetic deduction; those are tested in the ledgers above.

| Source / locator | Extraction lines | Comparison made |
| --- | --- | --- |
| CDHHLMNNS-III-v4 Lemma 2.2.2, p.37 | 1690–1704 | Residue coefficient l[−1], retaining the unshifted line separately. |
| CDHHLMNNS-III-v4 Remark 2.2.6, p.39 | 1774–1798 | Ramified Gaussian linking comparison is zero, despite identity on residue fields. |
| CDHHLMNNS-III-v4 Remark 2.2.8, pp.39–40 | 1807–1818 | Dyadic quadratic dévissage fails. |
| CDHHLMNNS-III-v4 Lemma 2.2.9, pp.40–41 | 1840–1868 | Second-residue unit and uniformizer coordinates. |
| CDHHLMNNS-III-v4 Remark 2.2.10, p.41 | 1869–1870 | Localization/residue coordinate comparison. |
| CDHHLMNNS-III-v4 Proposition 2.3.1, p.41 | 1881–1903 | General Dedekind symmetric table and fraction-field injection, with fraction characteristic ≠2. |
| CDHHLMNNS-III-v4 Corollary 2.3.2, pp.41–42 | 1904–1932 | Global-field symmetric table with fraction characteristic different from two and Picard cokernel. |
| CDHHLMNNS-III-v4 Remark 2.3.3, p.42 | 1933 | Sign and period conventions. |
| CDHHLMNNS-III-v4 Corollary 2.3.4, p.42 | 1936–1959 | Characteristic-two global table and divisor-parity argument. |
| CDHHLMNNS-III-v4 Remark 2.3.5, p.42 | 1960–1965 | DVR residue surjectivity and odd-group distinction between mixed and equal characteristic. |
| CDHHLMNNS-III-v4 Proposition 2.3.6, p.43 | 1976–1994 | Arithmetic fracture, bounded torsion, controls and completion. |
| CDHHLMNNS-III-v4 Proposition 2.3.7, pp.43–44 | 2000–2022 | Integral quadratic rigidity for complete pairs. |
| CDHHLMNNS-III-v4 Remark 2.3.8, p.44 | 2023–2029 | Henselian extension via filtered colimits and approximation. |
| CDHHLMNNS-III-v4 Proposition 2.3.9, pp.44–45 | 2031–2070 | General quadratic table and total cokernel extension. |
| CDHHLMNNS-III-v4 Corollary 2.3.10, p.45 | 2072–2096 | Finite-residue/number-field specialization; no abstract splitting assumed. |
| CDHHLMNNS-III-v4 Remark 2.3.11, p.45 | 2097 | Negative-sign shift. |
| CDHHLMNNS-III-v4 Remark 2.3.12, pp.45–46 | 2099–2109 | Canonical parity quotient, including d=1 limit. |
| CDHHLMNNS-III-v4 Example 2.3.13, p.46 | 2110–2149 | Integer dyadic subgroup, E₈ Arf zero and integer comparisons. |
| CDHHLMNNS-III-v4 Example 2.3.14, pp.46–47 | 2150–2205 | Checked against explicit restriction/transfer and finite-field base change; three errors recorded below. |
| CDHHLMNNS-III-v4 Remark 2.3.15, p.47 | 2206–2216 | Nondyadic localization and unchanged completion. |
| CDHHLMNNS-III-v4 Corollary 2.3.16 proof, pp.47–48 | 2222–2239 | Finiteness of local Witt input and passage to integral Witt groups. |
| CDHHLMNNS-III-v4 Remark 2.3.17, p.48 | 2240–2249 | General-Dedekind scope of the injection argument. |
| CDHHLMNNS-III-v4 §3.2 introduction, pp.54–55 | 2525–2558 | Integer signature and signature/8 invariant maps. |
| CDHHLMNNS-II-v5 Proposition 4.5.5, pp.108–110 | 5250–5285 | Saturated control, coefficient isomorphism, compatibility, derived cofibers, both Ore conditions and Tate boundary. |
| Wall-1970 Lemma 1, p.427 | 104–114 | Lifting quadratic refinements across a surjective ring map on a projective module. |
| Wall-1970 Theorem 2, pp.428–429 | 132–169 | Quadratic lifting, including anti-structure; not symmetric rigidity. |
| CMM Theorem 3.15, p.21 | 892–894 | Henselian lifting for smooth algebras. |
| CMM Remark 5.6, p.39 | 1659–1674 | Pair henselization, geometric regularity and Popescu/Elkik route. |

## Not verifiable

- Wall-1973, Corollary 1, Lemma 1, Proposition 4 and Lemma 5: settled uncertified source; no legal text supplied. The degree-one relation comparison is corroborated by CDHHLMNNS-III-v4 lines 2019–2021, but the four original locators were not independently certified.
- Scharlau-1985, Chapter 6 §6 Theorem 6.11, and Lam-2005, VII Theorem 3.5 and VI Theorem 2.29: settled uncertified locators. They were not fetched or requested again. Restriction/transfer applications were checked mathematically and against the declared contract; this does not turn the books into certified sources.
- No fresh Lean elaboration was run: the task's read-only/no-build restriction controls. The supplied elaborated signature of the sole declaration was compared binder by binder with Suggested.lean and the README; no lost section binder was found. Proposed repairs to Suggested.lean remain prescriptions for the repair worker, not compiled edits.
- Future Poincaré, integral Witt and spectral APIs are mathematical supplier contracts rather than implemented carriers at these pins. Their spectral equivalences cannot be evaluated by the finite computations; the reported checks verify their stated hypotheses, source statements and consequences on the listed examples, conditional on those contracts.
- Wall-1970's OCR has gaps in displayed formulas. The lifting statement and hypotheses were checked from the legible theorem/proof text and the explicit restatement in CDHHLMNNS-III-v4; no additional formula-level conclusion is certified from missing glyphs.

## Source issues

- **Misprint** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.47, lines 2180–2181: the source says the annihilator of ⟨1,3⟩ is generated by 2⟨1⟩ and ⟨1,−2⟩; it should be generated by 2⟨1⟩ and ⟨1,−3⟩, equivalently 2u and c; affects a stated result.
- **Gap** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.46, lines 2156–2157: the source says odd discriminant makes two prime in the Eisenstein ring; it should be supplemented by irreducibility of X²+X+1 over 𝔽₂, since odd discriminant proves only unramifiedness; affects the proof.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed pp.46–47, lines 2163, 2178, 2202–2205: the source says the quadratic residue arrow is identity, yielding degree zero ℤ/2 and degree three ℤ/4⊕ℤ/2; it should be zero by absolute trace, yielding degree zero 0 and degree three ℤ/4; affects a stated result.
- **Misprint** in CDHHLMNNS-II-v5 at Proposition 4.5.5(iv), printed p.109, line 5262: the source says the second Ore pair uses the image of S inside the source ring A; it should be the image of S inside the target ring B; affects the proof.
- **Misprint** in CDHHLMNNS-II-v5 at the paragraph following Proposition 4.5.5, printed p.109, lines 5276–5277: the source says condition iv is equivalently the kernel-and-cokernel isomorphism test for right multiplication; it should be condition iii; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6d65613428bff42b182a4057cdc24473e393b019", "job": "RT-GeometryOfNumbersAndQuadraticArithmeticPartII~1a", "model": "gpt-6-astra", "worker": "chris-38"} -->
