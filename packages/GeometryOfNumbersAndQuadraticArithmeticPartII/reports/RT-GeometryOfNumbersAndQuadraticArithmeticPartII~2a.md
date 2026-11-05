<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1169#issuecomment-6425144514 -->
Red team round 2 pass a (codex) of 846033d

Verdict: needs_changes

1. **F01** (P3) The chosen transfer functional lacks three discriminating Checks

   **Location:** `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:574`: “The ordered basis functional has λ(1)=0 and λ(s)=1, so it is nonzero.”

   **Claim:** Section 5.3 fixes a particular map λ:E→ℚ₂, rather than transfer up to an unspecified nonzero scalar. Its only dedicated Check repeats the defining basis values. The other three Checks concern restriction and the residue map. The worked transfer matrix is useful, but does not supply the required three discriminating Checks for this map.

   **Witness:** For λ(s)=1, λ_*⟨s⟩=⟨1,−3⟩=2u+c. For −λ the value is 6u+c, differing by 4u≠0. Both send the final class t to c, since c has order two.

   **Exact repair:** Replace the final Check of §5.3 by these three Checks, retaining the specified functional in the target:

   - For s²=−3, λ((1+s)²)=λ(−2+2s)=2. The opposite functional gives −2 and half the chosen functional gives 1.
   - Transfer of the unit line on the ordered basis (1,s) has matrix [[0,1],[1,0]] and Witt class zero. Ordinary trace instead gives diag(2,−6), whose signed determinant is the nonsquare class 3 in ℚ₂, so it is nonzero.
   - Transfer of the line ⟨s⟩ has matrix diag(1,−3) and Witt class 2u+c. Replacing λ by −λ gives 6u+c; their difference is 4u≠0. This fixes the sign of the cokernel identification, which transfer of t alone cannot fix.

   These values follow by evaluating λ on a, as and as² for a=1,s. The repaired Checks reject both the opposite-sign and ordinary-trace functional, and use the unchanged §4.1 coordinates. No acceptance-test declarations are added.

## Round-one repair verification

The previous reports use F01–F06 (pass a) and F01–F04 (pass b). Each is checked against this head; none was marked not actionable by the repair report.

| Earlier finding | Status | Repaired passage and location | Witness at this head |
| --- | --- | --- | --- |
| a F01: absent dyadic classification | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean:82`: “∃ φ : ZMod 8 × ZMod 2 × ZMod 2 ≃+ TauCeti.WittRing ℚ_[2]”; multiplication follows at line 95. | The coordinate function uses genuine Pfister classes; (0,0,0),(1,0,0),(0,1,0),(0,0,1) give 0,u,v,c; c-products give 0,c,4u,0. See the exhaustive ledger below. |
| a F02: unspecified stabilized Hasse sign | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:468`: “Hasse invariant … (+1)(−1)(−1)=+1”. | Rank-four cv and 4u have determinant square and Hasse +1; 2H has Hasse −1. Line 31 specifies equal-dimension stabilization and the factor (det q,−1). |
| a F03: spectrum supplier misidentified | Repaired differently | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:53`: “Consume §6.1a's shared spectrum category … homotopy groups, fibres, cofibres, their long exact sequences and detection of equivalences”. | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`, §6.1a “Spectra and stable equivalences”, explicitly supplies these operations in the shared spectrum category. The identity fibre is 0; the difference map sends (2,1) to 1. |
| a F04: anti-structure Checks | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:304`: “φ+Tφ=0”; lines 305–306 add the alternating matrix and transpose tests. | For u=−1, xy−yx=0, versus 2xy for u=1; the two 2×2 determinants are 1 and −1; reversed matrix products give E₁₁ rather than E₂₂. |
| a F05: missing nonlocal completion regularity | Repaired differently | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:85`: “for a Noetherian G-ring A and an ideal I⊆A … regular ring map … henselization … again a Noetherian G-ring”. | Matching gap slug and needs occur in `design/plan.json`; Stacks lines 6106–6109 and 6126–6129 supply both assertions. For H=(ℤ[x],(2))ʰ, H/2H=𝔽₂[x] is nonlocal, so the new contract is needed. |
| a F06: additive difference called a units map | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:284`: “The additive difference map ℤ[1/2]⊕ℤ₂→ℚ₂”. | (1,1)↦0 and (2,1)↦1 are well-typed; the alternative sum sends them to 2 and 3. |
| b F01: absent dyadic classification | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:453`: “The headline theorem `wittRing_padicTwo_coordinates` states the additive equivalence”. | Same verification as a F01. `invertibleTwo` supplies the instance; no extra local instance or ad hoc carrier is needed. |
| b F02: Hasse convention | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:31`: “the product Π_(i<j)(aᵢ,aⱼ) of Hilbert symbols”. | The revised §5.2 Check gives (−1,−1) over E equal to (−1,1) over ℚ₂, hence +1; over ℚ₂ it is −1. Thus 4u=0 over E and 4u≠0 over ℚ₂. |
| b F03: page of Remark 2.2.8 | Repaired differently | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:426`: “Remark 2.2.8, pp. 39–40”. | CDHHLMNNS-III-v4 line 1807 starts the remark on p.39; lines 1811–1818 put the cited contradiction and nondyadic assertion on p.40. The repair is more accurate than restricting to p.39. |
| b F04: omitted Mayer–Vietoris boundary | Repaired | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:603`: “the boundary from Ls₁(O) vanishes: Ls₁(R)→Ls₁(O) is the identity of Ws(𝔽₄)”. | CDHHLMNNS-III-v4 line 2070 gives the degree-one isomorphism. Its cokernel is 0; the next map injects Lq₀(R) into the degree-zero kernel, which is 0. |

## Verified sound

Read all **656 README lines and 104 Suggested.lean lines**, including **3 declarations, 23 numbered target sections, and 105 Check bullets**. There are no bold theorem headings: the numbered sections are the target inventory. Rechecked all ten earlier findings; all are repaired. Checked **30 distinct accessible source locators in five works**, **10 supplier roadmap groups**, and all **55 explicitly supplied sibling folders (110 README/Lean files)** by object. The tables below include targets and Checks carrying S01; the mathematics of the existing functional is correct, but its Check coverage is insufficient.

The three Lean declarations retain their needed hypotheses in the supplied elaborated signatures. No section variables are used. Each theorem has `sorry`; there are no local data declarations, instances, opaque definitions, admitted examples, `lemma`, `set_option`, or proposition stand-ins. The sole Mathlib import and the individual Tau Ceti import conform to the acceptance-test rule. All three own names occur in the README. The PR diff changes nine files, all in this package. No Lean command, build, git mutation, or external write was run.

### Headline inventory and acceptance coverage

| README theorem family | Assessment at the pins |
| --- | --- |
| §§0.1–0.3 integral polarization, Witt injection and canonical residue | Integral metabolic Witt carriers missing; explicitly named in the module docstring. Native field Witt theory requires invertible two. |
| §0.4 finite-field Arf completeness | Stated on native quadratic forms by `arf_trace_classifies`; independent dimensions and all finite characteristic-two fields are retained. |
| §0.4 quadratic Witt extension-degree law | Named as unavailable with the native quadratic scalar-extension API, which requires invertible two. The abstract characteristic-two Witt carrier is also missing. |
| §§1.1–1.2 characteristic-two and DVR L-tables | Missing periodic L-spectra; explicitly named. Characteristic-not-two Dedekind tables remain supplier targets. |
| §2.1 completion decomposition | Intermediate native completion construction and CRT/cofinality comparison. Its quotient/projection API is not an acceptance-test catalogue. |
| §§2.2–2.5 fracture, anti-structure lifting, complete and henselian rigidity | Missing Poincaré, general noncommutative-refinement and periodic L carriers; explicitly named. |
| §§3.1–3.4 total cokernel, number-field refinements, parity and localization | Missing integral Witt/L carriers; explicitly named. General tables and exact extension imported from ArithmeticKTheory §3.5. |
| §4.1 complete dyadic coordinates and multiplication | Both headline statements present on the native Witt ring. They require classification and actual arithmetic; neither is a one-library-lemma consequence. |
| §§4.2–4.3 E₈ integral comparison and integral dyadic group | Integral comparisons named as unavailable. The finite 136-zero computation remains a README Check, as required. |
| §§5.1–5.3 Eisenstein place, integral symmetric group and restriction | Integral headline is named as unavailable. Field restriction is the application of the declared generic exactness contract and §4.1, not a second generic exactness development. |
| §§5.4–5.5 quadratic image and Eisenstein L-tables | Missing integral Witt/L carriers; explicitly named, with no substitute theorem. |

### Lean declaration ledger

Let H=xy and B=x²+xy+y². Let u=1, v=⟨1,−2⟩ and c=⟨1,3⟩ in W(ℚ₂).

| Declaration, section and full context | Instances and values on both sides | Result / change |
| --- | --- | --- |
| `arf_trace_classifies`, Suggested.lean:51, Layer 0. Independent universes k,V,W; Field/Fintype/CharP 2/𝔽₂-algebra on k; additive groups, k-modules and finite dimension on V,W; q,q′; n,m; two indexed bases; six explicit symplectic-pairing hypotheses. | k=𝔽₂,n=m=0: traces 0=0, L=0, 2dim L=0. Zero against H: 0=0, an isotropic line gives 2dim L=2. Zero against B: 0≠1, all three nonzero vectors have q=1, so no such line. B against B: 1=1, diagonal L has dimension 2 inside dimension 4. Over 𝔽₄, B against H: 0=0, both metabolic, total L dimension 2. | Both iff directions, zero dimension and unequal dimensions survive. The six conditions give Gram matrix [[0,I],[I,0]], hence perfect polar. In characteristic two q⊥q′ equals q⊥(−q′). No lost binder or change. |
| `wittRing_padicTwo_coordinates`, Suggested.lean:82, Layer 4. No variables or instances beyond native ℚ₂ and its inferred invertible two; existential additive equivalence, then all a:ZMod 8 and b,e:ZMod 2. | All 32 triples have distinct equal-dimension local invariant triples; all 1,024 additions match coordinatewise addition modulo (8,2,2). 8u=2v=2c=0; (7,1,1)+(1,1,1) maps to 8u+2v+2c=0, as does (0,0,0). | Native representative values use natural scalar multiplication, and quotient wraparound is correct. Together with the local order 32 this gives bijectivity. No padding. |
| `wittRing_padicTwo_mul_c`, Suggested.lean:95, Layer 4. Explicit a:ZMod 8, b,e:ZMod 2; no hidden hypotheses. | All 32 products match ac+4bu. Inputs (0,0,0),(1,0,0),(0,1,0),(0,0,1) give outputs 0,c,4u,0 on both sides. The image is {0,c,4u,c+4u}, size 4; kernel a even,b=0, size 8. | The substantive identities cv=4u and c²=0 are not supplied by a single pinned arithmetic lemma. `oneFoldPfisterClass_mul` alone does not evaluate these classes. No padding or change. |

### Target, definition and convention ledger

Arithmetic checks below are exact rational/finite computations, not Lean proof claims. To compare dyadic Witt classes, representatives were augmented with H=⟨1,−1⟩ to dimension 40 or 41 according to parity, then compared by determinant square class and the ordinary pairwise Hilbert product. The bound accommodates every sum and product tested. Direct computations were saved in scratch notes; no source text was copied there.

| Statement / context | Instances and computed values | Result / change |
| --- | --- | --- |
| Perfect-polar convention, README:23 | On ℤ, b=2xy has cokernel ℤ/2, not 0; on the zero module the adjoint is the unique isomorphism 0→0. On 𝔽₂, q=x² has polar 0 on dimension 1. | Correct exclusion of singular/nonunimodular forms. |
| Quadratic Lagrangian convention | In H over 𝔽₂, span(e₁) has dimension 1, q=0 and equals its perpendicular. In B the polar has the same perpendicular lines, but q=1 on each nonzero vector. | The extra q-vanishing law excludes a merely bilinear Lagrangian. |
| Zero ring and zero ranks | The zero ring has only module 0, the unique pairing, and both Witt groups 0. A finite field is nontrivial, so it cannot enter the Lean field theorem as a zero ring. | No vacuous field counterexample. |
| Periodic sign convention, README:25 | Over ℤ, L⁻₂=L⁺₀=ℤ and L⁻₀=L⁺₋₂=0. In characteristic two −1=1 and the two-periodic even groups agree. | Correct suspension direction. |
| Difference map, README:25 | f=g=idℤ: (1,1)↦0, (2,1)↦1; sum would give 2 and 3. | Correct sign, used again in fracture and final kernel. |
| Residue line and shift, README:27 | For ℤ_(2), l=(½R)/R, multiplication by 2 identifies l with 𝔽₂; derived coefficient l[−1] has cochain H¹=𝔽₂. At 3, H¹=𝔽₃. | Shift and line are not interchanged. |
| Change of uniformizer | At 5, ⟨5⟩ has coordinate ⟨1⟩ for π=5 and ⟨3⟩ for π′=10; 2⁻¹=3 mod 5. | Correct inverse-unit class; it is square-equivalent to multiplication by the unit. |
| Native field identification versus inverse polarization, README:31 | B=xy maps unitaly to q=x², with polar 2xy. Inverse polarization gives q=x²/2, with polar xy. | The two comparisons differ by ⟨2⟩; no missing factor of two. |
| Signed determinant, README:31 | H=⟨1,−1⟩ has det −1 and signed determinant 1; ⟨1,1⟩ has det 1 and signed determinant −1. Rank 0 gives empty determinant 1. | Correct sign in every subsequent binary example. |
| Hasse stabilization, README:31 | ⟨3⟩ has Hasse +1; adding H gives (3,−1)=−1. ⟨1⟩ stays +1 after adding H. | Multiplication by (det q,−1), not unconditional sign reversal. |
| Hilbert normalization, README:47 | (−1,−1): exponent 1→−1; (2,5): exponent 3→−1; (−1,2): exponent 0→+1. | Matches pinned Serre signs. |
| §0.1 σ and its inverse | Over ℚ, polar(x²/2)(1,1)=1 and half-diagonal of this polar is x²/2. Over 𝔽₂, σ(B)=0 while Arf(B)=1. | Additive inverse only when 2 is a unit; no unconditional injection claimed. |
| §0.2 symmetric injection / char-two zero σ | ℤ-line signature 1 stays 1 over ℚ; 𝔽₂[t] polar H has class 0, but the unit line parity is 1; R=K gives kernel 0. | Saturated intersection has torsion-free quotient, hence splits over Dedekind R. No perfection of K used. |
| §0.3 canonical residue | At 2: ∂⟨3⟩=0, ∂⟨2⟩=1, ∂⟨4⟩=0. At 3: ∂⟨6⟩=⟨2⟩. ∂₂(⟨2⟩⊥⟨−2⟩)=1+1=0. | Unit/odd/even valuations, additivity and metabolic relation agree. |
| §0.4 finite Arf coordinate and completeness | Over 𝔽₂ H,B,B⊥B have traces 0,1,0 and Witt classes 0,1,0. Over 𝔽₄ Tr(1)=0, Tr(ζ)=1. All 16 planes ax²+xy+by² over 𝔽₄ have a nonzero isotropic vector exactly in the 10 cases Tr(ab)=0. | Raw sum is not the invariant; trace is. |
| §0.4 extension law | Degrees 1,2,3 send the 𝔽₂ class 1 to 1,0,1; over 𝔽₄ B has zero (ζ,1). The zero class remains 0 for each degree. | Scalar extension differs from symmetric rank parity. |
| §1.1 global char-two table | For 𝔽₂[t], Pic/2=0 and ∂t⟨t⟩=1; for 𝔽₂(t), prime set empty and Pic=0; inverting t deletes that residue coordinate. | Imperfect global fraction fields are included. |
| §1.2 DVR table | ℤ_(2): residues Ws,ℤ/2,0,0; ℤ_(3): Ws,0,0,0. For 𝔽₂[[t]], ∂⟨t⟩=1 is onto and every odd group is 0. | No completeness or finite-residue hypothesis added to the general DVR theorem. |
| §2.1 dyadic completion | ℤ gives ℤ₂; ℤ[i] one ramified factor with exponents 2m; Eisenstein ring one residue-degree-two factor; ℚ,ℤ[1/2],ℤ_(3) all give C=0. | CRT counts distinct primes; empty product is zero. |
| §2.2 general fracture | ℓ=1: square R→0 over R→0; R=ℤ/4,ℓ=2: top identity and bottom zero; R=ℤ,ℓ=3: overlap ℚ₃, where 2 is invertible and Tate groups vanish. | Covers odd ℓ, units and bounded torsion; retains both controls. |
| §2.2 controlled categories | In Dᵇ(k), χ(k[0])=1∉2ℤ whereas χ(k⊕k)=2∈2ℤ; k is a retract of k⊕k. | Density does not imply K₀ surjectivity. |
| §2.3 anti-structure and refinement | For α=id,u=−1 on ℚ, T(xy)=−xy and symmetrization 0; for u=1 it is 2xy. On M₂(ℚ), α(E₁₂E₂₁)=E₁₁ but α(E₁₂)α(E₂₁)=E₂₂. | T preserves right-module sesquilinearity using α²(b)=ubu⁻¹ and T²=1 using α(u)=u⁻¹. Noncommutative order is correct. |
| §2.3 lifting | J=0 gives the prescribed isometry itself; J²=0 makes the next error zero; ℤ₂ refinements H and B have different residue Arf 0,1. | No missing invertible-two hypothesis. |
| §2.4 complete rigidity | ℤ₂→𝔽₂ and dual numbers→𝔽₂ give quadratic residues ℤ/2,0,ℤ/2,0. J=R with separated completion forces R=0. Symmetric orders 16 and 2 differ. | Statement properly restricted to quadratic theory; degree-one source remains uncertified as noted below. |
| §2.5 henselian rigidity | (ℤ₂,(2)) is nonnilpotent but complete; J=0 gives identity. For H=(ℤ[x],(2))ʰ, H/2H=𝔽₂[x] has many maximal ideals, so H is nonlocal. | New G-ring gap covers the nonlocal approximation input. |
| §3.1 A(R) | D=ℤ/4,U=2D,V=0 gives quotient ℤ/2; V=D gives 0. For D=0 the quotient is 0. | Sum, not intersection, of images. |
| §3.2 number-field refinement | ℤ: d=1,Lq₂=ℤ/2,A=0; Eisenstein ring: d=1,Lq₂=ℤ/2,A=ℤ/4; ℤ[1/2]: d=0,Lq₂=A=0. | Finite two-primary A; no splitting follows from the exact extension. |
| §3.3 parity quotient | d=0,1,2,3 gives cardinalities 1,1,2,4. For the étale quadratic algebra over ℤ[t]_(2), discriminant 17 is a unit, reduction x(x+1) gives two primes with residue 𝔽₂(t), and v_t(t)=1 excludes squarehood. | Canonical quotient survives infinite imperfect residues; coordinate identification requires a choice. |
| §3.4 nondyadic localization | S=∅ gives identity and residue 0. S={3} over ℤ gives residue Lq(𝔽₃) and unchanged ℤ₂. S={2} would force ℤ/2=Lq₂(ℤ)=0. | Nondyadic restriction is mathematically necessary. Infinite S uses direct-sum support. |
| §4.1 u,v,c, coordinate function | 32 distinct invariant triples; 8u=2v=2c=0, 4u≠0, c²=0, cv=4u. ⟨1,−5⟩ has coordinate (0,0,1); ⟨1,−3⟩ has (2,0,1). | Full additive presentation and c-multiplication agree. |
| §4.1 ideal and annihilator | Image coordinates (0,0,0),(0,0,1),(4,0,0),(4,0,1); kernel (a,0,e) with a even. | Orders 4 and 8; ann(c)=⟨2u,c⟩, with v excluded. |
| §4.2 E₈ refinement | Arms 2,4,1 give 136 zeros,120 ones among 256 vectors. q(root)=1, q(adjacent root sum)=1; signature 8 and divided signature 1. | Full norm mod 2 would vanish identically, whereas half-norm has Arf 0. |
| §4.3 integral subgroup | ∂u=∂c=0, ∂v=1, so kernel order 16. Polar diag(2,3/2) has coordinate (4,0,1); ⟨u,c+4u⟩ has order 16. | A(ℤ)=0 from images, independent of the abstract d=1 parity test. |
| §5.1 Eisenstein place | Polynomial values at 0,1 are 1,1 mod 2; derivative 1; e=1,f=2. Norm-one units give six solutions, squares three. | Odd discriminant alone is not the inertness proof. |
| §5.2 symmetric global group | 0,u,2u,3u have invariant pairs (0,1),(1,1),(0,−1),(1,−1). −1 is not square in K or E; 4u is hyperbolic after extension. | Four classes with generator order 4; no real-place signature is used. |
| §5.3 restriction | ker θ′=(c) has order 4. W(ℚ₂) has 32 elements, image 8; W(E) has 64, hence coker order 8. Integral source has 16, image 4 and kernel 4; integral target has 32. | Kernel/cokernel comparison uses the symmetric residue identity, not quadratic base change. |
| §5.3 specified λ | λ(1)=0,λ(s)=1; λ_*⟨1⟩=H=0 and λ_*⟨s⟩=⟨1,−3⟩=2u+c. Opposite λ gives 6u+c. | Mathematical normalization correct; Check defect S01. |
| §5.4 local quadratic class t | Polar [[2,1],[1,2ζ]], signed determinant 1−4ζ=3−2s, norm 9+12=21≡5 mod 8. Norm of determinant −1 for 2u is 1. | t differs from 0 and 2u; ⟨u⟩∩⟨t⟩=0. Quadratic restriction is zero. |
| §5.5 transfer and obstruction | Matrix in README has det 21; after a hyperbolic pair it is ⟨4,−21/4⟩≃⟨1,−21⟩=c since −21/3=−7≡1 mod 8. | A=⟨2u,c⟩/⟨c⟩≃ℤ/4. |
| §5.5 final groups | The degree-one map ℤ/2→ℤ/2 is identity, so the preceding cokernel is 0; degree-zero kernel is 0 by disjoint images. Symmetric residues (ℤ/4,ℤ/2,0,0), quadratic (0,0,ℤ/2,ℤ/4). | Repaired boundary step works; source's erroneous quadratic arrow is not copied. |
| Worked examples, README:639–643 | ℤ: (d,A)=(1,0); ℤ[1/2]:(0,0); Eisenstein:(1,ℤ/4), with the tables above. Characteristic-two global odd term Pic/2 replaces the mixed-characteristic four-periodic table. | Tables agree across all layers. |

### Defining API ledger

These are the individual laws attached to the definitions, in addition to the numbered targets above. Line references in this and the following table are to `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md`.

| API statement | Instance and computed values | Result / change |
| --- | --- | --- |
| §0.1 isometry and scalar extension of polar | q=xy, interchange x,y: both polars are xy′+x′y. Extending ℤ→𝔽₂ sends its Gram determinant −1 to 1. | Same actual tensor map; perfectness persists. |
| §0.1 sums and zero | polar(q⊥0)=polar(q)⊕0; polar(0 on 0)=0 on 0. | Additive map. |
| §0.1 descent | H=xy, L=span(e₁): q(L)=0 and b(L,L)=0, with dim L=1=half-rank. | Quadratic metabolic relation maps to symmetric metabolic relation. |
| §0.1 half-diagonal inverse | Over ℚ, b=xy has half-diagonal x²/2 and polar xy; q=3x² has polar 6xy and half-diagonal 3x². | Both composites are identity; two is a unit. |
| §0.3 homomorphism | ∂₂(⟨2⟩⊥⟨−2⟩)=1+1=0=∂₂(H). | Descent and additivity hold. |
| §0.3 unit coefficient | v₂(3)=0, hence ∂₂⟨3⟩=0. | Coefficient reduction would give 1; excluded. |
| §0.3 uniformizer coefficient | v₃(6)=1 and 6/3=2, hence ∂₃⟨6⟩=⟨2⟩. | Unit square class retained. |
| §0.3 square rescaling | ⟨2⟩ and ⟨18⟩ differ by square 9; their odd units are 1 and 9, both 1 mod 2. | Both residues 1. |
| §0.3 uniformizer change | 5=5·1=10·(1/2), and 1/2 mod 5=3. | Coordinates ⟨1⟩,⟨3⟩ represent the same line-valued result. |
| §0.3 finite support | For ⟨6⟩ over ℚ, only primes 2 and 3 can contribute; at every p≥5 valuation is 0. | Direct sum, not arbitrary product. |
| §0.3 metabolic relation | At 3, the residues of ⟨3,−3⟩ give ⟨1,−1⟩=0. | Relation preserved in odd residue characteristic too. |
| §0.4 trace formula | Over 𝔽₄, H has trace 0; x²+xy+ζy² has trace ζ+ζ²=1. | Actual trace distinguished from raw coefficient. |
| §0.4 basis independence | For H over 𝔽₄, two displayed bases give raw sums 0 and 1, but traces 0 and 0. | Raw-sum model rejected. |
| §0.4 additivity | B⊥B over 𝔽₂ has invariant 1+1=0 and diagonal vanishing subspace of dimension 2. | Additivity agrees with metabolic quotient. |
| §0.4 hyperbolic value | q(e)=q(f)=0 for H, so sum and trace both 0. | Normalized value. |
| §0.4 zero iff metabolic | The sixteen 𝔽₄ planes give ten trace-zero planes, each with a nonzero isotropic vector; the other six have none. | Both directions tested. |
| §0.4 additive isomorphism | H and x²+xy+ζy² represent coordinates 0 and 1; two copies of the latter have coordinate 0. | Both elements and relation 1+1=0 present. |
| §0.4 degree law | On class 1, degrees 1,2,3 give 1,0,1. On class 0 all three give 0. | Correct multiplication by degree. |
| §0.4 regularity | x² on a line in characteristic two has polar matrix [0], rank 0<1; H has matrix [[0,1],[1,0]], determinant 1. | Perfect polar excludes singular square. |
| §2.1 algebra equivalence | For ℤ, each stage is ℤ/2ᵐ; 2=2 in every projection. For ℤ[i], the stage exponent at 1+i is 2m. | Ring operations and ramification cofinality agree. |
| §2.1 composite with R | Over ℤ, integer 3 maps to residue 3 mod 2ᵐ in both constructions. | Projection compatibility. |
| §2.1 residue | ℤ₂/2=𝔽₂; the Eisenstein completion modulo 2 is 𝔽₄. | No implicit degree-one residue assumption. |
| §2.1 inversion | ℤ₂[1/2]=ℚ₂; for a ramified factor 2=uπᵉ, π⁻¹=uπᵉ⁻¹/2. | Inverting 2 gives the whole fraction field, also when e>1. |
| §2.1 nondyadic inversion | 3 is already a unit in ℤ₂, with inverse 3 modulo 8; completing ℤ and ℤ[1/3] gives ℤ₂. | Correct comparison. |
| §2.1 unit ideal | ℚ/(2ᵐ)=0 at every stage; its limit is 0, whereas ℚ≠0. | Correct empty product. |
| §2.1 projection extensionality | (0,0) and (0,1) agree in first component, differ in second; a product with no components has exactly one element. | All projections are required. |
| §3.1 sum quotient | D=ℤ/4, U={0,2}, V=0: U+V={0,2}, quotient {U,1+U}. | Two elements, versus four for the wrong intersection. |
| §3.1 surjectivity | The two cosets just listed have representatives 0,1. | Quotient map hits both. |
| §3.1 zero representatives | [2]=[0], but [1]≠[0] for D/U. | Membership in the sum is exactly the zero test. |
| §3.1 factorization | D→ℤ/2 by parity kills U and V; its induced quotient map sends [1] to 1. Identity D→D fails because 2↦2≠0. | Both directions and uniqueness tested. |
| §3.1 double cokernel | Take σ_R=0 into U, σ_C=0 into D and inclusion U→D. Both coker(coker σ_R→coker σ_C) and D/(U+0) are ℤ/2. | Correct quotient direction. |
| §3.1 naturality | Multiplication by 3 on D preserves U and sends [1] to [3]=[1]; the zero diagram gives [1]↦0. | Commuting diagrams give the expected maps. |
| §3.1 group structure | [1]+[1]=[2]=0 in the example; with U=V=0 the same sum is 2≠0. | Quotient structure, not a free added relation. |
| §4.1 v presentation/order/residue | Nonzero coefficients 1,−2; 2v=0, v≠0 because ∂v=1. | Correct order and distinguishing residue. |
| §4.1 c presentation/order/kernel | −5/3≡1 mod 8; 2c=0; multiplication has 8-element kernel and 4-element image. | All three laws checked. |
| §4.1 coordinates: addition | All 1,024 pairs tested; (7,1,1)+(1,1,1)=(0,0,0) maps to 0. | Wraparound is respected. |
| §4.1 coordinates: existence/uniqueness | All 32 triples have different stabilized local invariants, exhausting the 32-element local Witt group. | Neither missing classes nor redundant coordinates. |
| §5.3 fixed functional | λ(a+bs)=b, so λ(1)=0, λ(s)=1, λ((1+s)²)=2. | Linear map determined; its original Checks are insufficient (S01). |

### Individual README Check ledger

Each row records the computed output and its comparison or negative control. “Retain” means the stated Check is true; it is not a claim that the example proves its general target.

| Check / line | Computation and comparison | Result / change |
| --- | --- | --- |
| 001 / 108 | polar(x²/2)(1,1)=1; polar(x²)(1,1)=2. | Retain. |
| 002 / 109 | Arf(B)=1, whereas its symmetric alternating polar has Witt class 0. | Retain. |
| 003 / 110 | Matrix [2] has determinant 2 and cokernel ℤ/2; zero-rank adjoint has kernel and cokernel 0. | Retain. |
| 004 / 111 | I²=(4,2+2√−5,−4+2√−5)=2R; I⁻¹=I/2. Norm a²+5b² cannot be 2, so I is not principal. | Pairing is perfect on a nonfree projective; retain. |
| 005 / 123 | Signature of ⟨1⟩ remains 1, not 0, in the fraction field. | Retain. |
| 006 / 124 | H has symmetric class 0; unit line has parity 1. | Retain. |
| 007 / 125 | K→K is identity; on zero module L=0 and 2dim L=0. | Retain. |
| 008 / 149 | v₂(3)=0 gives residue 0, versus naive coefficient residue 1. | Retain. |
| 009 / 150 | v₂(2)=1 gives residue 1, versus naive zero coefficient. | Retain. |
| 010 / 151 | v₂(4)=2 gives residue 0. | Retain. |
| 011 / 152 | 6/3=2, nonsquare in 𝔽₃, so residue ⟨2⟩. | Retain. |
| 012 / 153 | Ramification index 2: the linking residue is a rank-two metabolic class 0; the residue-field identity would send 1 to 1. | Retain; source Remark 2.2.6 confirms. |
| 013 / 154 | Coordinates are 1 and 1/2=3 mod 5. | Retain. |
| 014 / 181 | H has polar determinant 1, raw sum 0 and trace 0. | Retain. |
| 015 / 182 | B takes value 1 on each of (1,0),(0,1),(1,1); traces against H are 1,0. | No half-dimensional vanishing plane; retain. |
| 016 / 183 | B(ζ,1)=ζ²+ζ+1=0; trace(1)=0, matching H. | Retain. |
| 017 / 184 | polar(x²)=0 on a one-dimensional space, so rank 0<1. | Retain. |
| 018 / 185 | Against H: 0=0, isotropic dimension 1. Against B: 0≠1, maximal isotropic dimension 0. | Both directions retain. |
| 019 / 186 | Tr(ζ)=ζ+ζ²=1; Tr(1)=1+1=0. | Retain. |
| 020 / 187 | New basis has determinant ζ²+ζ=1, q-values 1,1 and raw product 1; trace remains 0. | Retain. |
| 021 / 211 | Pic(𝔽₂[t])/2=0; v_t(t)=1=rank parity of ∂_t⟨t⟩. | Retain. |
| 022 / 212 | Prime index set is empty, Pic=0; t has valuation 1 and is not a square in 𝔽₂(t). | Imperfect fraction field allowed; retain. |
| 023 / 213 | t is a unit after localization; the t residue coordinate disappears. | Retain. |
| 024 / 227 | At 2 residue unit generates ℤ/2 and Ls₁=ℤ/2; at 3 residue remains onto but Ls₁=0. | Retain. |
| 025 / 228 | ∂_t⟨t⟩=1; odd DVR groups 0. | Retain. |
| 026 / 229 | ℤ gives (ℤ,ℤ/2,0,0); 𝔽₃[t] gives (Ws,0,0,0), since Pic/2=0 and d=0. | Retain. |
| 027 / 230 | Negative degrees 2 and 0 give positive degrees 0 and −2: ℤ and 0. | Retain. |
| 028 / 264 | One dyadic prime and one completion ℤ₂; residue cardinality 2. | Retain. |
| 029 / 265 | No dyadic primes; every 2-power quotient of ℤ[1/2] is 0. | Retain. |
| 030 / 266 | Irreducible degree-two polynomial gives one factor, residue cardinality 4. | Retain. |
| 031 / 267 | (2)=(1+i)² up to unit: one prime, exponents 2m. | Retain. |
| 032 / 268 | For both ℚ and ℤ_(3), (2ᵐ)=R; every quotient and limit is 0. | Retain. |
| 033 / 269 | Two maps have x-images (0,0),(0,1); first projections equal, second 0≠1. Empty product has one map. | Retain. |
| 034 / 283 | ℓ=1 gives completion 0, localization R and pullback 0×_0 R. | Retain; pullback is R. |
| 035 / 284 | Difference sends (1,1) to 0, (2,1) to 1; sum sends them to 2,3. | Retain. |
| 036 / 285 | χ(k)=1∉2ℤ; χ(k⊕k)=2∈2ℤ, with k a retract. | Retain. |
| 037 / 286 | In ℤ/4, 2²=0; completion ℤ/4 and localization 0. | Retain. |
| 038 / 300 | polar(xy) has determinant −1∈ℤ₂×, reducing to 1. | Retain. |
| 039 / 301 | Residue Arf values 1 and 0 forbid a residue isometry. | Retain. |
| 040 / 302 | J=0 leaves the isometry unchanged; error ε becomes a multiple of ε²=0. | Retain. |
| 041 / 303 | 1 and 3 reduce to 1 mod 2, but 3 mod 8 is not 1, hence is not a dyadic unit square. | Retain. |
| 042 / 304 | Tφ=−φ, so φ+Tφ=0; omitting u gives 2φ. | Retain. |
| 043 / 305 | Determinants of [[0,1],[−1,0]] and [[0,1],[1,0]] are 1 and −1. | Retain. |
| 044 / 306 | Transposed E₁₂E₂₁ gives E₁₁; unreversed transposed product gives E₂₂. | Retain. |
| 045 / 322 | Both sides have quadratic groups (ℤ/2,0,ℤ/2,0). | Retain. |
| 046 / 323 | Dual numbers and residue have quadratic groups (ℤ/2,0,ℤ/2,0). | Retain. |
| 047 / 324 | J=0 gives identity; J=R gives R/Rⁿ=0 for all n, so separated completeness forces R=0. | Retain. |
| 048 / 325 | Symmetric orders 16≠2 exclude symmetric rigidity. | Retain. |
| 049 / 341 | Quadratic groups (ℤ/2,0,ℤ/2,0) on both sides, including characteristic two. | Retain. |
| 050 / 342 | ε²=0, henselian quotient unchanged in quadratic groups (ℤ/2,0,ℤ/2,0). | Retain. |
| 051 / 343 | J=0 is identity; 2ⁿ≠0 for every n in ℤ₂. | Retain. |
| 052 / 344 | H/2H=𝔽₂[x]; ideals (x),(x+1) already give distinct maximal ideals, with infinitely many irreducibles giving more. | Nonlocal completion case; retain. |
| 053 / 380 | Set D=ℤ/4,U=D,V=0: D/(U+V)=0 despite V≠D. | Retain. |
| 054 / 381 | Set D=ℤ/4,U=0,V=D: D/(U+V)=0 despite U≠D. | Retain. |
| 055 / 382 | d=1,2,3: 2ᵈ/2=1,2,4 cosets. | Retain. |
| 056 / 383 | Eisenstein d=1 gives parity quotient 0 but A=ℤ/4. | Retain. |
| 057 / 384 | C=0 gives Ws(C)=0 and its quotient 0. | Retain. |
| 058 / 385 | ℤ/4 divided by {0,2} has 2 cosets; divided by all D has 1; divided by intersection 0 would have 4. | Retain. |
| 059 / 399 | For ℤ, Lq₂=ℤ/2 and A=0 from spanning images. | Retain. |
| 060 / 400 | For ℤ[1/2], d=0, C=0, Lq₂=0 and A=0. | Retain. |
| 061 / 401 | Eisenstein d=1, Lq₂=ℤ/2 but A=ℤ/4. | Retain. |
| 062 / 415 | Four parity vectors divided by two diagonal vectors gives 2 cosets; (1,0) is not diagonal. | Retain. |
| 063 / 416 | Eight vectors divided by two diagonal vectors gives 4 cosets. | Retain. |
| 064 / 417 | At d=1 quotient size 1 versus A size 4; at d=0 both have size 1. | Retain; no natural-subtraction mistake. |
| 065 / 418 | Discriminant 17 is a unit; mod 2 the two roots are 0,1; v_t(t)=1 rules out squarehood in each residue 𝔽₂(t). | Two dyadic factors, parity quotient size 2; retain. |
| 066 / 432 | S=∅ gives identity R→R with cofiber 0. | Retain. |
| 067 / 433 | Completing ℤ and ℤ[1/3] at 2 gives ℤ₂; residue is 𝔽₃. | Retain. |
| 068 / 434 | The forbidden dyadic sequence would give 0→ℤ/2→0 in its indicated exact segment. | Negative control valid. |
| 069 / 435 | A vector supported at all infinitely many primes has infinite support, hence is outside the direct sum. A single-prime vector is inside. | Retain. |
| 070 / 467 | signed det(v)=2, ∂₂v=1, cv=4u≠0. | Retain. |
| 071 / 468 | det(cv)=36; Hasse=(+1)(−1)(−1)=+1, versus −1 for 2H. | Retain. |
| 072 / 469 | 2v=0; residue of v=1 whereas residues of u,c=0. | Retain. |
| 073 / 470 | −5/3≡1 mod 8; signed det(c)=−3. | Retain. |
| 074 / 471 | 2c=c²=0; c(2u+c)=0, while cv=4u≠0. | Retain. |
| 075 / 472 | c·2u=0 and c·u=c≠0. | Retain. |
| 076 / 473 | Coordinates 000,100,010 give 0,u,v with parities 0,1,0; all 32 invariant triples distinct. | Retain. |
| 077 / 474 | Kernel choices 4·1·2=8; image {0,c,4u,c+4u} has 4 elements. | Retain. |
| 078 / 475 | 8 mod 8=0 and 2 mod 2=0; 8u=2v=0. | Retain. |
| 079 / 487 | Root norm 2 gives half-norm 1; full norm mod 2 would give 0. | Retain. |
| 080 / 488 | Adjacent root sum has q=1+1−1=1, polar −1=1 mod 2; nonadjacent polar 0. | Retain. |
| 081 / 489 | Exhaustive 256-vector count gives 136 zeros and 120 ones; Arf-one count would be 120 zeros. | Retain. |
| 082 / 490 | Signature(E₈)=8 and divided invariant=1; unit line would require q(1)=1/2∉ℤ. | Retain. |
| 083 / 504 | Residue condition b=0 leaves 8·2=16 classes and includes u of odd rank. | Retain. |
| 084 / 505 | −v=v because 2v=0; residue −1=1 in ℤ/2. | Retain. |
| 085 / 506 | det polar=3, signed det=−3, diagonal (2,3/2), coordinate (4,0,1) rather than (0,0,1). | Retain. |
| 086 / 507 | ⟨u,c+4u⟩ contains c=(c+4u)−4u and has 16 classes. | Joint cokernel 0; retain. |
| 087 / 538 | Polynomial values at 0,1 are 1,1; quotient has 4 elements. | Retain. |
| 088 / 539 | Discriminant −3≡1 mod 2; derivative ≡1. | e=1, distinct from f=2; retain. |
| 089 / 540 | t²+t+2 reduces to t(t+1), giving two primes although discriminant −7 is odd. | Negative control valid. |
| 090 / 541 | Six norm-one pairs; their squares are three units, so index 2. | Retain. |
| 091 / 555 | signed det(2u)=−1; adjoining its square root would give ℚ(i), unequal to K and ramified rather than unramified at 2. | Nonzero globally and locally; retain. |
| 092 / 556 | Hasse(4u)=+1; Hasse(2H)=(−1,−1)_E=(−1,1)_ℚ₂=+1, versus −1 over ℚ₂. | Order exactly 4 over K,E; retain. |
| 093 / 557 | Four pairs (0,1),(1,1),(0,−1),(1,−1) remain distinct over E. | Retain. |
| 094 / 571 | Integral kernel {0,c,4u,c+4u} has 4 elements; 16/4=4 images generated by u. | Retain. |
| 095 / 572 | ann(c) has 8 elements, whereas (c) has 4. | Retain; cokernel is the former. |
| 096 / 573 | Symmetric unit has parity 1 in each field, so 1↦1; quadratic Arf instead gives 1↦0. | Retain. |
| 097 / 574 | λ(1)=0, λ(s)=1 merely repeats its definition; transfer t↦c also holds for −λ. | S01: replace with discriminating Checks. |
| 098 / 590 | ζ²+ζ+1=0 gives isotropy of the original plane over 𝔽₄; extension coordinate 2·1=0. | Retain. |
| 099 / 591 | Tr(ζ)=1; polar entries are 2,1,1,2ζ. | Nonzero local quadratic generator; retain. |
| 100 / 592 | signed det=1−4ζ=3−2s; norm=9+12=21≡5 mod 8. | Nonsquare norm; retain. |
| 101 / 593 | Only nonzero order-two class in ℤ/4{u} is 2u; determinant norm N(−1)=1≠square class 5. | Intersection with ⟨t⟩ is 0; retain. |
| 102 / 607 | Image orders 4 and 2, intersection order 1; kernel of their difference is 0. The preceding degree-one cokernel is also 0. | Wq(R)=0; retain. |
| 103 / 608 | (ℤ/4{2u}⊕ℤ/2{c})/⟨c⟩ has order 4 and generator 2u of order 4. | Retain. |
| 104 / 609 | det matrix=21; diagonal (1,−1,4,−21/4) leaves (1,−21); −21/3=−7≡1 mod 8. | Transfer is c; retain. |
| 105 / 610 | Pic/2=0,d=1 imply Lq₂=ℤ/2,Lq₃=A=ℤ/4. | Retain. |

All denominators in these tests are used either in characteristic-zero fields or with specified units. The only d−1 cardinality formula assumes d≥1. The finite-field and nonsquare quadratic-extension hypotheses exclude inseparability; the characteristic-two global arguments do include imperfect fraction fields. All output groups are abelian, so substituting S₃ or Q₈ would violate their types; noncommutativity is instead tested where admitted, using M₂(ℚ). Compactness, smooth group schemes and quasi-separatedness are not implicit hypotheses of any target here.

### Suppliers, ownership and direction

Cross-roadmap citations were resolved against the supplied main checkout or the indexed open head for a new roadmap, then inspected. The resolver used main `546d9e4` and the supplied 2026-10-26 open-head index. No missing roadmap citation was reported; its limited automatic Lean-name check was supplemented by the pinned-source reads below.

| Supplier and inspected locator | Contract verified / boundary preserved |
| --- | --- |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`, §§6.1a, 6.2–6.5, 6.8a | Shared spectra and integer homotopy detection are explicitly in §6.1a. The metabolic symmetric quotient, Poincaré dualities, genuine/symmetric/quadratic structures, filtered colimits, fundamental fibre sequence and L-localization occur in the cited sections. The fundamental sequence starts with homotopy orbits, not fixed points. |
| Same supplier, §§6.9.1–6.9.3 | Residue coefficient is the line shifted by −1. The valuation overring allows nonprincipal and infinite sets. The ramified ℤ→ℤ[i] example gives a zero linking map, matching §0.3. |
| Same supplier, §6.10a | Integer tables, signature, signature divided by eight and comparison multiplication by eight are supplied. This package only adds the E₈ reduction calculation and explicit dyadic images. |
| `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md`, §§1.6, 3.4, 4.5–4.6, 6.6, 7.9 | `bordism_invariant_periodicity` exists in §1.6. Genuine metabolic carriers, degree-zero comparisons, controlled surgery and the stated field L-groups are present. The 𝔽₂ Arf classification is already owned there; the present extension is to all finite characteristic-two fields with actual absolute-trace coordinates. |
| `TauCetiRoadmap/ArithmeticKTheory/README.md:492`, §§1.1–1.3, §2.2 at line 702, §3.5 at line 1213 | Localization without principal ideals, number-field class-group finiteness, Steinitz maps and inverse-ideal convention are present. Section 3.5 owns the general characteristic-not-two Witt injection, tables, completion comparison and total-cokernel extension. Inverse ideal classes become the same classes modulo two. |
| `TauCetiRoadmap/QuadraticFormInvariants/README.md`, Layers 4, 6, 9 | Field Witt operations, local classification, transfer and Frobenius reciprocity are supplied. The generic quadratic-extension exact sequence is not silently attributed to the current transfer section: it is the explicit gap contract. No second field Witt carrier is introduced. |
| `TauCetiRoadmap/GlobalQuadraticForms/README.md:443`, §4.4; §§8.1–8.3 | Number-field Hilbert product and global classification/Witt injection exist. Rank zero is separated from its positive-rank invariant theorem. No global-function-field inference is made. |
| `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md`, §1.7 | Perfect-characteristic-two symmetric comparison has rank parity as coordinate. The 𝔽₂→𝔽₄ unit maps to the unit. It is not the Arf degree-two extension map. |
| `Completed/IntegralLattices/README.md:350`, Layer 5; `TauCetiRoadmap/IntegralLattices/README.md`, signature theory | The E₈ Cartan model, determinant 1, positive roots and half-norm are supplied; the active signature criterion includes divisibility by eight. The present 136-zero refinement computation is additional. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, §§0.13–0.15, 0.21 | Pair henselization, quotient identifications, smooth lifting, Popescu and G-rings are present. The local-completion target does not cover the nonlocal henselization of (ℤ[x],(2)). The declared ideal-adic regularity gap supplies precisely that missing case. |
| `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md`, §§11.3–11.4, 11.15 | Dense-subcategory K₀ membership and ordinary nonconnective localization exist. The even-Euler example prevents illicit deletion of controls. Generic spectra are not sourced from these K-theory sections. |

All four gap slugs and their named suppliers match `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/design/plan.json` and the README:

| Gap | Precision / minimality check |
| --- | --- |
| `derived-localization-completion-square` | Positive integer, bounded power torsion, associative unital ring and the actual D(R) square are specified. Native ordinary completion supplies neither its derived comparison nor this general pullback. |
| `poincare-change-of-rings-criterion` | Coefficients, involution, saturation, image controls, Ore hypotheses, cofiber equivalences and Tate boundary are specified as one change-of-rings criterion. The two source typographical errors are corrected in the contract. |
| `quadratic-extension-witt-exactness` | Nonzero characteristic-not-two field, nonsquare parameter, specified restriction, nonzero transfer functional vanishing on 1 and Pfister multiplication determine the exact cycle. Native transfer/projection formulas alone are not this exactness theorem. |
| `henselian-pair-completion-regular` | The two linked prerequisites concern the same Noetherian G-ring pair used by §2.5: its henselization remains a G-ring and its ideal-adic completion map is regular. The earlier characteristic-zero resolution discussion is in the Noetherian ℚ-algebra setting and does not supply the required ℤ[x] case. |

These are declared supplier contracts, not findings or undocumented prerequisites. Acceptance of the corresponding eventual proofs remains conditional on their delivery. No supplier is `none`, and no new supplier gap is proposed by this review.

Ownership searches used the roadmap service by object, the current board packages, main/Completed and all 55 explicitly supplied sibling folders. Relevant searches included integral/metabolic Witt groups, Scharlau transfer, quadratic-extension kernels, Arf trace, dyadic Witt rings, completion fracture and henselian quadratic rigidity. The meaningful overlap is the ArithmeticKTheory table/comparison family already imported. Generic Witt vectors and Habiro fracture occurrences concern other objects. Earlier 𝔽₂ Arf and E₈ ownership is respected. No second owner for this package's all-finite-field coordinate, explicit ℚ₂ presentation or Eisenstein image calculation was found, and no matching fully qualified acceptance-test name was found elsewhere. No ownership move is needed.

The dependency gate was run read-only with the requested roadmap name, order and movable mode. Its complete output was:

```text
depcheck: 56 roadmaps, 646 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. At target level the arithmetic applications occur after their local-coordinate inputs. The illustrative references from §§3.1–3.3 to the later ℤ and Eisenstein computations are Checks, not inputs to the general proofs. The concrete degree-three quotient uses the supplied table and does not feed back into its supplier's proof as a new general table.

### Pinned-library audit

Pins were read from the supplied `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to those library repositories.

| Pinned file and declaration | Verified type/body and practical consequence |
| --- | --- |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:146`, `QuadraticMap`; `polarBilin` at line 317 | The defining data give scalar-square homogeneity and a bilinear companion. They do not assert finite projectivity or perfect polar. The six Lean basis hypotheses supply perfectness in the acceptance theorem. |
| Same file: `proj` at line 628, `Anisotropic` at line 1056, `weightedSumSquares` at line 1410; `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:46`, `Equivalent` | Native quadratic functions and isometry relation exist with the stated meaning. No integral Witt quotient is hidden in them. |
| `Mathlib/LinearAlgebra/QuadraticForm/Prod.lean:55`, `QuadraticMap.prod` | Evaluation is q(v)+q′(w). Thus the Lean theorem states the actual orthogonal sum. |
| `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127`, `QuadraticForm.baseChange` | Its section requires `Invertible (2 : R)`. The nearby extensionality statement does not construct the missing characteristic-two scalar extension. |
| `Mathlib/RingTheory/Trace/Defs.lean:70`, `Algebra.trace`; `Mathlib/FieldTheory/Finite/Trace.lean:36,49` | Native finite-field trace and its Frobenius-sum description support the absolute-trace coordinate. The finite field is automatically finite-dimensional over its prime field. |
| `Mathlib/LinearAlgebra/Basis/Defs.lean:89`, `Module.Basis`; `Mathlib/Algebra/Module/Submodule/Defs.lean:39`, `Submodule`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`, `Module.finrank` | The basis indexes all of V or W, not a selected subspace. Half dimension is a natural-number equality 2·dim L=dim(V×W); it contains no truncated division. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:171`, `AdicCompletion`; `of` at line 364 | Compatible inverse-limit subtype and its map exist. `Completeness.lean:181` needs finite generation of the ideal; Dedekind ideals supply it. `Algebra.lean` supplies the algebra structure. |
| `Mathlib/RingTheory/Ideal/Quotient/Operations.lean:325`, `Ideal.quotientMulEquivQuotientProd` | Coprime ideal hypothesis is explicit; distinct prime powers in the CRT argument satisfy it. |
| `Mathlib/RingTheory/ClassGroup/Basic.lean:347,353`, `ClassGroup.mk0_surjective`, `ClassGroup.mk_eq_one_iff`; `Mathlib/RingTheory/PicardGroup.lean:876`, `ClassGroup.equivPic` | Fractional-ideal class quotient and Picard bridge are available with the Dedekind assumptions, without a characteristic restriction. |
| `Mathlib/RingTheory/Flat/TorsionFree.lean:137`, `IsDedekindDomain.flat_iff_torsion_eq_bot`; `Flat/EquationalCriterion.lean:287`, `Module.Flat.projective_of_finitePresentation` | The saturated finite torsion-free modules used in §0.2 are projective: Dedekind Noetherianity supplies finite presentation. |
| `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:126`, `IsCyclotomicExtension.Rat.isIntegralClosure_adjoin_singleton_of_prime` | Prime-conductor integral-closure identification applies at 3. |
| `Mathlib/NumberTheory/NumberField/Cyclotomic/PID.lean:34`, `three_pid`; `Cyclotomic/Three.lean:50`, `Three.Units.mem` | The Eisenstein PID and six-unit classification are already supplied. |
| `Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean:291,311`, `inertiaDeg_eq_of_not_dvd`, `ramificationIdx_eq_of_not_dvd` | At primes above 2, conductor 3 is prime to 2, orderOf(2 mod 3)=2 and e=1. The nondivisibility alone is not the f=2 proof. |
| `Mathlib/Algebra/Group/Subgroup/Ker.lean:65`, generated additive `AddMonoidHom.range`; `Mathlib/GroupTheory/QuotientGroup/Defs.lean:88`, generated `QuotientAddGroup.mk'` | They supply the abelian quotient and universal property, not an arithmetic computation of A(R). |
| `TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:218`, `TauCeti.WittRing`; `wittClass` at line 288 and `dimMod2` at line 386 in the same file | Field and invertible-two binders are explicit. The quotient kills the hyperbolic ideal; it is neither a Dedekind-ring Witt carrier nor the characteristic-two quadratic carrier. |
| `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean:186`, `regularFormSetoid` | Isometry of regular diagonal presentations, distinct from Witt equivalence. Equal-dimension stabilization is needed before invoking local isometry classification. |
| `TauCeti/LinearAlgebra/QuadraticForm/Witt/FundamentalIdeal.lean:89`, `oneFoldPfisterClass` | Its body is the class of ⟨1,−a⟩. Arguments 2 and −3 produce exactly v and c. Its general multiplication identity does not supply cv=4u. |
| `Mathlib/Algebra/CharP/Invertible.lean:124`, `invertibleTwo` | Characteristic-zero division semirings have the instance needed for the native ℚ₂ Witt ring. No local instance declaration is necessary. |
| `TauCeti/LinearAlgebra/QuadraticForm/Witt/BaseChange.lean:211`, `WittRing.baseChange`; `Transfer/Witt.lean:147,186`, `scharlauTransfer`, `scharlauTransfer_baseChange_mul` | Transfer takes a nonzero linear functional on a finite-dimensional extension and preserves the fixed native convention. The explicit λ in §5.3 is not ordinary trace. |
| `TauCeti/NumberTheory/LocalField/QuadraticForm/PadicTwo.lean:150`, `hilbertSymbol_padicTwo` | The exponent uses ε(u)ε(v)+αω(v)+βω(u), yielding the three signs in the conventions table. |
| `TauCeti/NumberTheory/LocalField/QuadraticForm/Hasse.lean:91,98`, `RegularFormClass.localHasse`; `Classification.lean:129` | Pairwise Hilbert product and rank/determinant/Hasse classification are native. Field, nonarchimedean local topology, valuation and invertibility hypotheses remain in scope. |
| `TauCeti/RingTheory/DedekindDomain/AdicValuation/Completion.lean:367,434`, completeness and residue equivalence | The stated arbitrary-Dedekind comparison is present. It has no finite-residue-field hypothesis. |
| `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`, `IntegralLattice` | Rational ambient module, integral lattice and symmetric form are supplied. The package imports this carrier and its E₈ model. |

The supplied elaborated signatures were compared individually with the source declarations and README; no changes or dropped binders were found. No fresh elaboration was run under the read-only prohibition. The printed existential type abbreviates the equivalence's carrier, which was checked directly in Suggested.lean:82. No one-tactic padding was identified among the three substantive declarations.

### Accessible source-locator audit

The cached legal extractions were read at these locators. “Supports” records the specified use, not an endorsement of every statement elsewhere in the paper. The source mistakes relevant to the calculation are separately registered below.

| Source / locator and extraction line | Checked use |
| --- | --- |
| CDHHLMNNS-III-v4, Lemma 2.2.2, p.37; line 1690 | Residue duality line and shift. |
| CDHHLMNNS-III-v4, Remark 2.2.6, p.39; line 1774 | Ramified comparison and zero linking map for ℤ→ℤ[i]. |
| CDHHLMNNS-III-v4, Remark 2.2.8, pp.39–40; line 1807 | Dyadic failure of quadratic dévissage and its nondyadic scope. |
| CDHHLMNNS-III-v4, Lemma 2.2.9, pp.40–41; line 1840 | Rank-one residue from valuation parity. |
| CDHHLMNNS-III-v4, Remark 2.2.10, p.41; line 1869 | Extension to the full residue description. |
| CDHHLMNNS-III-v4, Proposition 2.3.1, p.41; line 1881 | Symmetric Dedekind table and degree-zero identification. |
| CDHHLMNNS-III-v4, Corollary 2.3.2, pp.41–42; line 1904 | Global residue cokernel and Picard quotient. |
| CDHHLMNNS-III-v4, Remark 2.3.3, p.42; line 1933 | Negative symmetric sign is suspension by two. |
| CDHHLMNNS-III-v4, Corollary 2.3.4, p.42; line 1936 | Characteristic-two symmetric groups. |
| CDHHLMNNS-III-v4, Remark 2.3.5, p.42; line 1960 | Characteristic-two sign/two-periodic comparison. |
| CDHHLMNNS-III-v4, Proposition 2.3.6, p.43; line 1976 | General arithmetic fracture, including K₀-image controls. |
| CDHHLMNNS-III-v4, Proposition 2.3.7, pp.43–44; line 2000 | Complete quadratic rigidity and the additional degree-one Wall input. |
| CDHHLMNNS-III-v4, Remark 2.3.8, p.44; line 2023 | Henselian extension of complete quadratic rigidity. |
| CDHHLMNNS-III-v4, Proposition 2.3.9, pp.44–45; line 2031 | Quadratic table, total cokernel, comparison square and degree-one isomorphism at line 2070. |
| CDHHLMNNS-III-v4, Corollary 2.3.10, p.45; line 2072 | Number-field table, finite two-primary obstruction and finite-field Arf isomorphism at line 2095. |
| CDHHLMNNS-III-v4, Remark 2.3.11, p.45; line 2097 | Negative quadratic sign shift. |
| CDHHLMNNS-III-v4, Remark 2.3.12, pp.45–46; line 2099 | Rank-parity quotient. The package supplies its explicit infinite-imperfect-residue test. |
| CDHHLMNNS-III-v4, Example 2.3.13, p.46; line 2110 | Integer comparison and abstract dyadic Witt group order 32. |
| CDHHLMNNS-III-v4, Example 2.3.14, pp.46–47; line 2150 | Eisenstein setup, restriction kernel and transfer-annihilator strategy. Its erroneous generator and quadratic arrow are corrected in the package. |
| CDHHLMNNS-III-v4, Remark 2.3.15, p.47; line 2206 | Nondyadic localization. The package says two is invertible rather than incorrectly excluding residue characteristic zero. |
| CDHHLMNNS-III-v4, Corollary 2.3.16 proof, pp.47–48; line 2222 | Saturated-Lagrangian proof and injectivity; finite Picard groups of localized number rings at line 2237. |
| CDHHLMNNS-III-v4, Remark 2.3.17, p.48; line 2240 | Symmetric fraction-field injection in characteristic two and zero quadratic polarization. |
| CDHHLMNNS-III-v4, §3.2 opening, pp.54–55; line 2525 | Classical integral forms and E₈ context. The package imports integral classification, rather than copying this section as new work. |
| CDHHLMNNS-II-v5, Proposition 4.5.5, pp.108–110; line 5253 | Full change-of-rings criterion, saturated control and vacuous endpoint Tate condition. Corrected Ore ring and condition number are recorded below. |
| Wall-1970, Lemma 1, p.427; line 104 | Lifting finite projective data over a complete ideal. |
| Wall-1970, Theorem 2 and proof, pp.428–429; line 132 | Quadratic isometry lifting with anti-structure and successive ideal-power correction. |
| CMM, Theorem 3.15, p.21; line 892 | Smooth henselian lifting used in approximation. |
| CMM, Remark 5.6, p.39; line 1659 | Retraction/filtered-colimit reduction from henselian pairs to complete pairs. |
| Stacks, Lemma 15.51.14 (0AH2), pp.130–131; line 6106 | Regularity of the ideal-adic completion map of a Noetherian G-ring. |
| Stacks, Lemma 15.51.15 (0AH3), p.131; line 6126 | Henselization of a pair preserves the Noetherian G-ring property. |

## Not verifiable

- **Wall-1973**, Corollary 1, Lemma 1, Proposition 4 and Lemma 5: settled uncertified source. The exact degree-one relation/kernel proof was not read. CDHHLMNNS-III-v4 line 2019 identifies its use; this does not certify Wall's original text.
- **Scharlau-1985**, Chapter 6, §6, Theorem 6.11: settled uncertified source. Its printed DVR locator was not independently verified. The explicit residue and matrix-lifting argument and the accessible III source were checked.
- **Lam-2005**, VI Theorem 2.29 and VII Theorem 3.5: settled uncertified source. Book text and original numbering were not inspected. Native local classification, the declared extension-exactness contract, accessible III statements and the explicit arithmetic computations were checked instead.
- **Fresh Lean elaboration:** prohibited for this pass. This review compared the supplied three elaborated signatures against the pinned code and README; it does not claim a new build or completed proofs of the admitted headlines.
- **Future supplier implementations:** the four declared gaps are precise contracts, not available code. The roadmap-level ownership and hypotheses were checked; eventual proofs and interoperability cannot be certified from plans.
- **Other open work:** all 55 supplied sibling folders were searched by object, and indexed ownership searches were run. Full ownership against open pull requests whose files were not supplied was not checked. No undisclosed head was fetched or treated as a supplier.

No new reference request is needed. The three uncertified works retain their existing manifest keys and settled status.

## Source issues

- **Gap** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.46, line 2156: the source says an odd discriminant makes two prime in the Eisenstein ring; it should be the reduction X²+X+1 is irreducible over 𝔽₂, whereas odd discriminant proves only unramifiedness; affects the proof.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed p.47, line 2180: the source says ⟨1,−2⟩ generates part of the annihilator of ⟨1,3⟩; it should be ⟨1,−3⟩, equivalently use ⟨2u,c⟩, since cv=4u≠0; affects a stated result.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, printed pp.46–47, lines 2163, 2178 and 2202: the source says quadratic residue base change is identity and yields Lq₀=ℤ/2 and Lq₃=ℤ/4⊕ℤ/2; it should be zero on Arf coordinates, giving Lq₀=0 and Lq₃=ℤ/4; affects a stated result.
- **Misprint** in CDHHLMNNS-II-v5 at Proposition 4.5.5(iv), printed p.109, line 5262: the source says the image multiplicative set satisfies its second Ore condition in the source ring; it should be in the target ring B; affects the proof.
- **Misprint** in CDHHLMNNS-II-v5 at the paragraph after Proposition 4.5.5, printed p.109, line 5276: the source says condition iv is equivalent to the comparison on multiplication kernels and cokernels; it should be condition iii; affects nothing.
- **Misprint** in CDHHLMNNS-III-v4 at Remark 2.3.15, printed p.47, line 2211: the source says every nondyadic residue field has odd characteristic; it should be characteristic different from two, including ℚ at (t) in ℚ[t]; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "846033d2df85a2613c625a0c9bc212cf30ac3317", "job": "RT-GeometryOfNumbersAndQuadraticArithmeticPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
