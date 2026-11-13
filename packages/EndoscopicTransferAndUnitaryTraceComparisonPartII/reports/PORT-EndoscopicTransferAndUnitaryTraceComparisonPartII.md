# Port of EndoscopicTransferAndUnitaryTraceComparisonPartII

- Branch: `roadmap/endoscopic-transfer-and-unitary-trace-comparison-part-ii`, from `42813dd`.
- Head commit: `b6cbd63930104152a6e972c6efb60cfc047ff96e` ("EndoscopicTransferAndUnitaryTraceComparisonPartII: roadmap (README, Suggested.lean, metadata)").
- Files: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparisonPartII/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder is changed.

## Build

`lake build TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII.Suggested`:

```text
✔ [18238/18239] Built TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII.Suggested (4.8s)
Build completed successfully (18239 jobs).
```

Warnings: 0. The file declares nothing, so there is no `sorry` warning either. Without a `module` header the build emitted Lake's note "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". ZerosOfLFunctions on main emits the same note. I added the line `module` above `import Mathlib`, as AnalyticNumberTheoryPartI on main does, and the note went away. The import is still the single plain `import Mathlib`, and the gate accepts it (`imports=0`, `no-import-mathlib=0`). If the worker prefers the bare form, deleting that first line brings the note back and changes nothing else.

## Gate

```text
gate EndoscopicTransferAndUnitaryTraceComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency check

```text
depcheck: 208 roadmaps, 1902 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

`roadmaps resolve` on the ported README: no cross-roadmap citations and no Lean names found nowhere. The one earlier lead, `IntegralHermitianLattice.ofCarrier`, is target 2.7.1 in GeometryOfNumbersAndQuadraticArithmetic §2.7 at its head. The tool said "Lean names outside TauCetiRoadmap were not checked: no pinned Lake packages on this host". So I grepped every pinned Mathlib and Tau Ceti name myself in the worktree's `.lake/packages` checkouts: Tau Ceti `2fd255d`, Mathlib `1b1ccf4`, both equal to the manifest. All 17 exist under the names and namespaces cited:

- Mathlib: `Matrix.conjTranspose` (ConjTranspose.lean:43), `Matrix.IsHermitian` (Hermitian.lean:45), `Matrix.isHermitian_mul_conjTranspose_self` (:286), `Matrix.isHermitian_conjTranspose_mul_self` (:290), `Matrix.charpoly` (Charpoly/Basic.lean:140), `Matrix.charpoly_mul_comm` (:279), `MvPolynomial.hsymm` (Symmetric/Defs.lean:312), `MvPolynomial.bind₁` (Monad.lean:67), `HasStrictFDerivAt.implicitFunction` (Implicit.lean:465, FiniteDimensional section) and `HasStrictFDerivAt.implicitFunctionDataOfComplemented` (:321).
- Tau Ceti: `TauCeti.map_normUnits_unitFiltration` (LocalField/Norm/Unramified/Basic.lean:126) and `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (:158), `ImplicitFunctionData.analyticAt_implicitFunction` (Analysis/Analytic/Inverse.lean:131), `TauCeti.ClassFieldTheory.artinMap_norm` (ClassFieldTheory/Local/ArtinMap.lean:345), `TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes` (:165) and `TauCeti.index_normGroup_of_isCyclic` (ClassFieldTheory/Brauer/LocalH2Bound.lean:70).

## Draft pull request body

This roadmap is the second part of EndoscopicTransferAndUnitaryTraceComparison. The base roadmap develops ordinary endoscopy for unitary Lie algebras: stable classes, κ-orbital integrals, the Laumon–Ngô fundamental lemma and Waldspurger's smooth transfer. It stops before symmetric spaces. This part builds relative endoscopy for the infinitesimal symmetric space of the pair (U(W₁⊕W₂), U(W₁)×U(W₂)).

- **Layer 0** constructs the off-diagonal representation Hom_E(W₂,W₁) and its two signed contractions to Hermitian endomorphisms, together with the contraction torsor. It proves local sections and fibre integration, and shows that contraction carries relative orbital integrals to ordinary ones.
- **Layer 1** pulls ordinary endoscopic data and transfer factors back through contraction. It defines relative transfer, restricted to source-regular targets so that it agrees with the lattice theorem, and proves transfer for tests supported on invertible maps.
- **Layer 2** builds the full spherical module of K-invariant functions on invertible Hermitian matrices. It defines unramified spherical base change by its Satake substitution and fixes Hironaka's spherical Fourier isomorphism with an explicit sign dictionary.
- **Layer 3** proves the germ inversion with its 2^(−#S₁) finite-Fourier factor, additive parabolic descent with its Jacobian, and the Weil-action reductions. Together they turn an augmented Jacquet–Rallis comparison into cyclic endoscopic transfer.
- **Layer 4** takes the product-group comparison as a supplier contract and derives the adjacent-rank spherical Jacquet–Rallis comparison and the cyclic spherical endoscopic fundamental lemma (Leslie, Theorems 5.3 and 3.5). Through determinant-graded lattice counts it reaches the endoscopic fundamental lemma for unitary Friedberg–Jacquet periods (Leslie, Theorem 2.12) over an unramified quadratic extension in every residue characteristic.
- **Layer 5** transports the twisted Levi map to the whole spherical module through Hironaka's transform.

Twenty-one source corrections are recorded, among them the missing finite-Fourier averaging in the germ inversion and a false even-coweight support claim for spherical base change. `Suggested.lean` states no theorem, because none of the five headline theorems is statable at the pins: neither Mathlib nor Tau Ceti has the analytic spherical Hecke algebras, the Satake transform, orbital integrals on p-adic unitary groups or transfer factors.

## Dependencies that are still pull requests

EndoscopicTransferAndUnitaryTraceComparison, GeometryOfNumbersAndQuadraticArithmetic, AdelicAlgebraicGroups, AutomorphicLFunctionsAndLocalFactors, SmoothRepresentationsOfLocalGroups, MetaplecticAutomorphicForms. The other two suppliers, SchemeAndStackFoundations and ReductiveGroupsPartII, are on main. Every cited id was checked at the supplier's head, or on main for those two:

- **EndoscopicTransferAndUnitaryTraceComparison:** §§1.1, 1.4, 1.5, 1.14, 1.17(a)–(c), 2.1, 2.4, 2.9, 2.11, 2.12, 3.3, 4.7 and 4.9(b).
- **GeometryOfNumbersAndQuadraticArithmetic:** §2.7 `IntegralHermitianLattice.ofCarrier` and `.dual`; §2.9 `SignedHermitianSpace`, `signedHermitianAdjoint`, `signedHermitianAdjoint_comp` and `signedHermitianAdjoint_involutive`; §3.2.
- **AdelicAlgebraicGroups:** §2.2 *quotient-measure*.
- **AutomorphicLFunctionsAndLocalFactors:** AL.1.1.2, AL.1.2.1 and AL.1.2.3.
- **SmoothRepresentationsOfLocalGroups:** §SR.4.1 *satake-isomorphism*; §SR.4.3 *parabolic-descent*, *hall-littlewood* and *macdonald-formula*.
- **MetaplecticAutomorphicForms:** §2.1 `weilIndex`, §2.5 `weil_generators` and §3.2a `splitHermitianOscillator`.
- **SchemeAndStackFoundations:** §1.24.
- **ReductiveGroupsPartII:** §RG2.0.2 *smooth-group-analytic-charts*.

The overlap report lists no other open pull request that changes this roadmap, and no cited id that an open pull request drops. No id is supplied only by an open revision.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: one module docstring, `namespace TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII`, and no declarations. The docstring names the five headline theorems (README §§4.10, 4.6, 4.4, 2.3, 5.1) and the carriers each lacks at the pins. I re-searched the pinned Tau Ceti for Satake, spherical Hecke algebras, orbital integrals, Hermitian forms and unitary groups. The only hits are the arithmetic GL_n Hecke rings over ℤ, the newform Satake roots, and unrelated Hermitian-form and representation files, so no headline became statable.

Changes to the file:
- The docstring title now matches the Part II title.
- The `module` line was added, as described under Build.

`#check @name` comparison: the file declares no names, so the scratch check file would have been empty. No elaborated type could change.

## Supplier replacements and duplication sweep

The sweep was by object, across main and the 438 open roadmap heads with `roadmaps grep`. I searched for Friedberg–Jacquet, Jacquet–Rallis, relative endoscopy, unitary symmetric spaces, Hironaka, Hermitian spherical functions, base-change homomorphisms, Hall–Littlewood, off-diagonal and symmetric-pair representations, Leslie and Xiao.

- **Hall–Littlewood polynomials:** owned by SmoothRepresentationsOfLocalGroups §SR.4.3 (*hall-littlewood*). The §2.3 proof route used P_λ(U;−q⁻¹) with no supplier. It now cites that target in the route, the §2.3 *Needs* line, Scope and ownership, and the SR supplier contract, which says what is assumed: symmetric Laurent polynomials over ℤ[t] for every dominant integral λ, negative entries included, homogeneous of degree |λ|.
- **Satake transform of the determinant shells (§4.8):** the route now also names SmoothRepresentationsOfLocalGroups §SR.4.3 (*macdonald-formula*). Summing it over the partitions of d gives q^(d(n−1))h_d(Z). I checked this identity exactly with rational arithmetic against the symmetrization formula for P_λ: n=2,3,4; d=0,1,2,3; q=2,3,5. All cases agree.
- **Spherical base change BC_n:** EndoscopicTransferAndUnitaryTraceComparison §4.9(b) uses the map b_(E/F) through its sources' definition and constructs no normalized formula. §6.8 there is about Shin's similitude groups, and §4.10a about general twisted spaces. This roadmap stays the owner of the explicit GL_n construction by the substitution Z_i↦T_i² (§2.2). Scope and ownership now says in one clause that BC_n is the GL_n case of the base roadmap's b_(E/F) and how the two differ.
- **ReductiveGroupsPartII:** the locator RG2.0, a whole layer, is now §RG2.0.2. That is where *smooth-group-analytic-charts* is stated (README line 640 on main).
- **GanGrossPrasadUnitaryGroups:** its local relative contracts on the base roadmap (finite transfer and the GL_n×GL_(n+1) fundamental lemma) are as Downstream consumers describes them. No roadmap on main or at an open head names this roadmap.

No removals were needed. Every other owned object keeps its owner: the relative symmetric-space geometry, the relative transfer relation, the module H(X_n) with Hironaka's transform, the germ, descent and Weil reductions, the self-dual-overlattice adapter of §4.7 and the full-module operator ξ_X. The closest roadmaps by vocabulary and results were the overlap report's GanGrossPrasadUnitaryGroups, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicLFunctionsAndLocalFactorsPartII, MetaplecticAutomorphicForms and FunctionFieldArithmetic, plus GeometryOfNumbersAndQuadraticArithmetic §3.2 (Hironaka on U(2n)/(U(n)×U(n)), a different space). Their scope sections claim none of these objects.

## Fixes from the reviewer read

1. **Title.** "relative endoscopy for unitary Friedberg–Jacquet periods" became "endoscopic transfer and unitary trace comparison, part II — relative endoscopy for unitary Friedberg–Jacquet periods". This follows the Part II form on main (ReductiveGroupsPartII, AdicSpacesPartII/III).
2. **API lead-ins.** The bare label `API:`, a field list, was replaced in all 16 definitions by the prose lead-in "The supporting API comprises:", the most common form on main.
3. **Unsupplied input in §2.3.** The proof route used Hall–Littlewood polynomials without a supplier. They are now cited (see above).
4. **Imprecise locator.** RG2.0, a whole layer, is now §RG2.0.2 (see above).
5. **New Source corrections E20 and E21.** These apply the accepted review's two Leslie19 notes. I checked both against the arXiv v2 text; its SHA-256 equals the manifest's.
   - **E20, proof of Lemma 3.9, p. 13.** The proof needs |C(H_x/F)|=2^(|S₁|−1), which is 2^(−1) when S₁ is empty. The lemma itself still holds. §0.5 now cites E20.
   - **E21, measure paragraph after Lemma 2.1, p. 6.** The maximal compact subgroup there omits the factors O_(F_i)^× for i∈S₂. Witness: n=2 with F[δ]≅E. Then T_δ(F)≅E^×, and the source's subgroup is E¹, which has Haar measure zero. The Conventions' measure sentence now cites Leslie25 §1.5.4 and E21.

## Adversarial mathematics pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 adjoint X^τ | W₁=⟨1⟩, W₂=⟨π⟩, X=z | conj(z)conj(v)w=conj(v)·π·X^τw ⇒ X^τ=π⁻¹z̄; at z=1, π⁻¹ (equal-form guess z̄ gives 1) | holds | none |
| §0.1 block δ | standard X=diag(1,π) | δ²=diag(−XX^τ,−X^τX)=diag(−1,−π²,−1,−π²); unsigned block gives +; split n=1, (g,h)=(2,1): (1,1)↦(2,1/2), AB=1 kept | holds | none |
| §0.2 r₂=r₁∘τ, charpoly | X=diag(1,π) | r₁(X^τ)=−X^τX=r₂(X); both diag(−1,−π²), charpoly (T+1)(T+π²) | holds | none |
| §0.3 quotient | ⟨1⟩,⟨ε⟩ rank 1; split (0,1),(1,0) | 1↦−ε⁻¹; both invariant 0, different orbits | holds | none |
| §0.4 block charpoly | rank 1 ⟨a₁⟩,⟨a₂⟩; split A=diag(1,0), B=I | det[[T,−X],[X^τ,T]]=det(T²+XX^τ)=T²+(a₁/a₂)N(z); a₁=1,a₂=π,z=1: constant π⁻¹; split: T²(T²+1), not regular | holds | none |
| §0.5 image Ω, torsor | X invertible | h₂(X⁻¹w,X⁻¹w′)=h₁(w,(XX^τ)⁻¹w′)=−h₁(w,y⁻¹w′), so X is an isometry h₂→−h₁(·,y⁻¹·); unramified rank 1: −N(E^×)=even valuations, −π has no lift | holds | E20 locator added |
| §0.6 lift | B×J, vol J=2 | ∫h(b)1_J/vol J=h(b); without the denominator 2h | holds | none |
| §0.7 RO scaling | c₁,c₂,c_T=2,3,4 | 2·3/4=3/2; stabilizer doubled: 1→1/2 | holds | none |
| §0.8 r_! | f=1_O_E, rank 1; rank 2 at −I₂ | r_!f(t)=1 iff v(−t) even ≥0; rank 2: XX*∈I₂−πHerm₂(O_E) forces det unit, so X∈GL₂(O_E), fibre volume 1 | holds | none |
| §0.9 RO=Orb∘r_! | X=1, π, π⁻¹ | values 1, 1, 0 on both sides (v(N(π⁻¹))=−2) | holds | none |
| §1.1 data | E=F×F | centre dim 2 (GL_a×GL_b) vs 1 (GL_n): no elliptic block datum | holds | none |
| §1.2 factor | x−y=π, q=2; x=y | η(π)|π|=−q⁻¹=−1/2; x=y not source-regular | holds | none |
| §1.3 κ-sums | D=C₂, values 2,5 | SRO=7; κ: 2−5=−3; basepoint moved: 5−2=3=κ(d₀)⁻¹(−3) | holds | none |
| §1.4 relation, zero clause | (c,c) with N(c)=−1; (c,c′) with −N(c′)=1+π | blocks (1,1): resultant 0, not source-regular, stable value 1 (zero clause would give 1≠0); (1,1+π): resultant −π, η(−π)|π|=−q⁻¹ (η(−1)=1 unramified) | holds | none |
| §1.5 / Layer 1 example | W₂=(E²,diag(1,π)), X=I₂; z=diag(π,πu) | X^τ=diag(1,π⁻¹), det r₁ valuation −1; −z⁻¹ det π⁻²u⁻¹, even, so z∈Ω(V₂,V₂) | holds | none |
| §2.1 module | n=0; n=1, λ=(−1) | one point, basis {e_0}; π⁻¹O_F^× is compact open in F^× | holds | none |
| §2.2 BC_m | m=1, d=1; n=2 T_(1,0) | Z↦T² gives 1_(π²O_F^×) (Z↦T gives non-norms); Sat_E=q(Z₁+Z₂)↦q(T₁²+T₂²)=Sat_F(T_(2,0))−(q−1)T₁T₂, since Sat_F(T_(2,0))=q(T₁²+T₂²)+(q−1)T₁T₂ by P_(2,0)(T;q⁻¹) | holds | none |
| §2.2 square with ξ | a=b=1 | both composites: q⁻ᵇX_i², q⁻ᵃY_j²; Z₁Z₂↦q⁻²XY | holds | none |
| §2.2 ξ_F formula | general a,b | \|det m₁\|^(b/2)\|det m₂\|^(a/2)·δ_P^(1/2)=\|det m₁\|^b, matching §3.4's Jacobian u=m₁u′ | holds | none |
| §2.3 H_n values | rank 2, Hall–Littlewood at t=−q⁻¹ | qP_(2,0)(U;−q⁻¹)=q(U₁²+U₂²)+(q+1)U₁U₂ (exact check, q=3); H_2(e_(2,0)+(q+1)e_(1,1))↦q(T₁²+T₂²)=Sat(BC(T_(1,0),E)) | holds | Hall–Littlewood supplier added |
| §2.3 dictionary sign | λ=(1),(1,0),(1,1) | degree \|λ\| odd flips sign: H_1(e_1)=±1_(πO^×), H_2(e_(1,0))=∓T_(1,0); (1,1) is even, no flip; norms in unramified E are the even valuations | holds | none |
| §2.3 module law | rank 1, φ=1_(π^dO_E^×) | H_1(φ∗e_j)=1_(π^(j+2d)O^×)=BC(φ)∗H_1(e_j) | holds | none |
| §3.1 κ_Σ | two nonsplit factors, ζ=(ε,1) | Σ={1}: η₂(1)=1; Σ={2}: η₁(ε)=−1 | holds | none |
| §3.2 Tate value | test 1_O_F, unramified η | Σ_(k≥0)(−q^(−s))^k=1/(1+q^(−s)), 1/2 at s=0; test 1_(πO^×): −1 | holds | none |
| §3.3 inversion | rank 1; r=2 | 1/2=(1/2)(1+0); HHᵗ=4I, coefficients 1/4 | holds | none |
| §3.4 descent | n=2, a=b=1, m₁=π | integral of 1_(M₂(O)) gives 1_O⊗1_O⊗1_(L₁)⊗1_(L₁); Jacobian \|π\|=q⁻¹ | holds | none |
| §3.5 cyclic sign | a=b=1; ℚ₃(√3) x_a=0, x_b=1; mixed ℚ₃(√2) | det=x_b−x_a=−D; η(−1)=−1 in ℚ₃(√3) (2 is not a square mod 3); mixed: D_ab=(√2−1)(−√2−1)=−1, det[[1,0,2],[0,1,0],[1,1,1]]=−1 | holds | none |
| §3.6 averaging | F[x]=F×F, a=b=1 | r_n=2=1+1, 1/4=(1/2)(1/2) | holds | none |
| §3.7 trace kernel | u=w=w′=1 | Tr(2)=4=2+2; N(2)=4≠N(1)+N(1)=2 | holds | none |
| §3.8 generation | t=π⁻¹ | n(π⁻¹)ň(−π)n(π⁻¹)·w⁻¹=diag(π⁻¹,π); conjugation scales t by π⁻²; ∪π^(−1−2j)O_F=F | holds | none |
| §4.1 unit c | unramified; ℚ₃(√3) | N(O_E^×)=O_F^× contains −1; ramified unit norms ≡ a² mod 3, and 2 is not a square: no c | holds | none |
| §4.2 cyclic = pushforward | rank 1, d=1,−1 | 1_(π^dO_E^×)↦e_(2d), coefficient 1; valuation 1 gives 0 | holds | none |
| §4.3 contraction | n=1, m=0 | Ω=ω(γ₂), det[e₁]=1, η(1)=1 | holds | none |
| §4.4 JR comparison | n=1, φ=1_(π^dO_E^×) | both sides 1_(π^(2d)O_F^×); odd valuation: 0=0 | holds | none |
| §4.5 augmented | n=1, φ=1_(πO_E^×) | Hermitian cyclic argument has valuation 2, BC_1(φ)=1_(π²O^×) | holds | none |
| §4.6 cyclic FL | n=2, φ=c_(2,1) | ξ_E(c_(2,1))=c_(1,1)⊗1+1⊗c_(1,1), cyclic target e_2⊗e_0+e_0⊗e_2 | holds | none |
| §4.7 grades, density | n=1, T=1, π²; n=2 | rank-1 density α(1,π²)=(q+1)q^(N−1)/q^N=1+q⁻¹, self-density 1+q⁻¹, m₀=1 (likewise T=1); det(±XX*)=(±1)^nN(det X) has even valuation, so odd grades vanish; Φ_2,2: m₀=1 for (2,0) and q+1 isotropic lines for (1,1); ∏_j(1−(−q)^(−j))>0 at q=2 | holds | none |
| §4.8 shells | n=2,3,4; d=0..3; q=2,3,5 | Σ_λ q^⟨λ,2ρ⟩P_λ(Z;q⁻²)=q^(d(n−1))h_d(Z) exactly, every case; exponent d(n−1)−bd_a−ad_b=d_a(a−1)+d_b(b−1) | holds | Macdonald route added |
| §4.9 equivalence | a=b=1, d=1; label (π,1) | (2,0)↦1, (1,1)↦0; no source match for (π,1) on V₂ (even source determinant valuation, odd target) | holds | none |
| §4.10 FL Check | (1,1+π) | 1=−q⁻¹·RO^κ ⇒ RO^κ=−q, consistent with an ordinary κ-value 1−(q+1) | holds | none |
| §5.1 ξ_X | e_0, e_(1,0), e_(1,1), e_(2,2), 1_(πK)∗e_0 | e_0⊗e_0; −(e_1⊗e_0+e_0⊗e_1) under either uniform dictionary, + under the mixed one; −q⁻¹e_1⊗e_1; q⁻²e_2⊗e_2; q^(−2ab) from ∏q⁻ᵇX∏q⁻ᵃY | holds | none |
| Conventions | q=2; reversed columns, ℚ₃(√3) | q_E=4, \|π\|_E=1/4; reversing two columns gives η(−1)=−1 | holds | E21 locator added |
| E20 / E21 | S₁=∅; n=2, F[δ]≅E | kernel has 1 element, not 2^(−1); E¹ has measure zero in T_δ(F)≅E^×, while O_E^× has positive finite volume | source errors confirmed | added |

Lean context and generality: the Lean file has no declarations, so it has no `variable` block to audit, and the README's generality is not narrowed anywhere in Lean. Vacuity: the relative transfer relation is tested only at source-regular targets, and the §1.4 Check shows such a target that is matched, with factor −q⁻¹.

## Unresolved

- **Supplier gaps.** The seven conditional supplier gaps of the accepted review are unchanged:
  - on EndoscopicTransferAndUnitaryTraceComparison: `jr-local-comparison`, `jr-weil-descent`, `jr-product-base-change` and `unitary-factor-all-quadratic`;
  - on GeometryOfNumbersAndQuadraticArithmetic: `hermitian-field-classification`, `unramified-hermitian-lattice-orbits` and `unramified-unit-vector-transitivity`.

  They are stated as "What X must provide" contracts, a form used on main (BelyiMaps, FlagVarieties, IndexTheory, TensorProductCombinatorics). GeometryOfNumbersAndQuadraticArithmetic §3.2 uses integral congruence diagonalization inside a proof route without stating it as a target, so `unramified-hermitian-lattice-orbits` is still needed.
- **`module` header.** Its addition is a choice the worker may revert (see Build).
- **Suspicious text.** None found in the reviews, supplier READMEs or sources.


Pull request: #2256 (roadmap/endoscopic-transfer-and-unitary-trace-comparison-part-ii at b6cbd63)
