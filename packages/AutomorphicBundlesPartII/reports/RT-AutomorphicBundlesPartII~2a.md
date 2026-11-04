<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1029#issuecomment-6481982015 -->
Red team round 2 pass a (codex) of 67bd670

Verdict: needs_changes

1. **F01** (P2) Repaired exclusion still invokes the parity-restricted lemma for odd rational weights

   **Location:** packages/AutomorphicBundlesPartII/README.md:1373, “That is the only hypothesis of BCGP21 Lemma 2.9.1”; used at README.md:1541 for every a≥2.

   **Claim:** The specified infinitesimal character allows direct application of BCGP21 Lemma 2.9.1 throughout the rational (a,2) family.

   **Witness:** BCGP21 line 1833 requires k_v≡l_v mod 2 and parameter ϕ(2;k_v−1,l_v−2). At (a,b)=(3,2), 3≢2 mod 2. A central twist leaves the semisimple pair (2,0) unchanged.

   **Exact repair text:** “For the totally real weights of §8.8, transport to BCGP21’s central normalization and apply Lemma 2.9.1 with its matching-parity hypothesis. For the rational family (a,2), for every integer a≥2, prove the exclusion in the arithmetic normalization by the argument of CG20, proof of Theorem 7.11, pp. 54–55 (CG20 lines 2133–2150): cases (e)–(f) give character sums; case (d) forces a=2 and a weight-two GL₂ form; case (c) is the quadratic-induced GL₂ case; case (b) gives two classical GL₂ forms of weight a. Construct and reduce their normalized reducible spin systems using §7.0’s realization inputs. Compare full polynomials and multipliers with the non-Eisenstein witness.” Replace the unconditional invocation of the BCGP lemma in §8.7’s route by this rational exclusion.

   **Repair test:** At a=3 the Yoshida alternative uses two weight-three rank-two systems, hence a reducible 2+2 system; it no longer requires 3≡2. At a=2 the additional 1+1+2 alternative remains covered. Do not narrow the headline to even a.

   This is a new source-hypothesis defect in the implementation of pass-a F04; that earlier defect (assuming membership in a limit before proving temperedness) is removed.

2. **F02** (P1) The acceptance file imports a module absent at the specified pin

   **Location:** packages/AutomorphicBundlesPartII/Suggested.lean:2, `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower`; packages/AutomorphicBundlesPartII/README.md:53 cites the same nonexistent file.

   **Claim:** This import exposes the sheaf exterior power at the pinned Tau Ceti revision.

   **Witness:** lake-manifest.json pins TauCeti to 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a; its checkout agrees. The declaration is instead at TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean:60. The old ExteriorPower.lean is absent.

   **Exact repair text:** Replace the import by `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic`. In README §From Tau Ceti replace the exterior-power path and locator by `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean` (line 60). Also refresh the nearby internal-Hom locator to `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean` (line 66).

   **Repair test:** The replacement module exists at the manifest pin and defines exactly `SheafOfModules.exteriorPower`, with the same sheafified sectionwise exterior-power functor consumed at Suggested.lean:79. No mathematics or binders change. The supplied signature-extraction failure at the old import is explained by this missing source module. Elaboration must be rerun by the repair worker; no Lean command was run in this read-only review.

3. **F03** (P1) Torsion-free target does not make division of a derived correspondence unique

   **Location:** packages/AutomorphicBundlesPartII/README.md:800, “given an integral coefficient correspondence T and a proved factorization T=ϖ^k U into a ϖ-torsion-free target”; README.md:809 asserts uniqueness.

   **Claim:** Target torsion-freeness suffices to cancel ϖ^k between correspondences, whose ambient definition (§3.1) allows derived coefficient complexes.

   **Witness:** On Spec O with identity legs, take F=(O/ϖ)[−1], G=O, k=1, T=0. Hom_D(F,G)=Ext¹_O(O/ϖ,O)=O/ϖ. Thus U=0 and U=1 differ but ϖU=0; G is torsion-free.

   **Exact repair text:** “For the geometric integral normalization, specify an actual morphism of coefficient sheaves between the stated pullbacks, with ϖ-torsion-free target sheaf, and a factorization through its subsheaf ϖ^kG. Divide that sheaf morphism uniquely before applying the fundamental-class and derived-global-section constructions. For arbitrary derived coefficient correspondences, uniqueness requires injectivity of multiplication by ϖ^k on Hom_D(Lp₂*F,p₁!G); torsion-freeness of the cohomology sheaves of the target alone does not imply it.” Apply the same distinction to the uniqueness and naturality API bullets. P20 lines 831–841 give the locally free sheaf construction and its flat geometric setting.

   **Repair test:** With actual sheaf source/target O, multiplication by ϖ is cancellable on Hom_O(O,O)=O. The shifted-residue-field example has Hom_D=O/ϖ and fails the new derived injectivity premise, so it no longer gives two allegedly unique normalizations. Add this example as a negative-control Check.

Three new findings: two P1 defects and one P2 source-hypothesis defect. No package implementation files changed.

## Verification of the round-one findings

The identifiers in this table are those of the two earlier reviews, not new finding numbers. No previous finding was marked “not actionable in this package”.

| Earlier finding | Status and repaired passage | Verification at this head |
|---|---|---|
| Pass a F01, finite versus full representation | Repaired. README:1289: “For a full discrete automorphic representation π=π_∞⊗π_f”; the following paragraph sums over full π with fixed finite part σ. | Two different infinity members with the same σ contribute (d,0)+(0,d)=(d,d). Multiplicity two gives (2d,2d), not (d,d). The later σ-isotypic examples use the sum. |
| Pass a F02, purity without its supplier | Repaired. README:1541: “apply AutomorphicFormsOnReductiveGroups §5.5 `clozelPurity`”. | The supplier's §5.5 states algebraic cuspidal GL_n purity/essential temperedness with its Clozel shift. The GL₄ orbit minus 3/2 is (0,0,1−a,1−a), integral also at a=2 and a=3. CG20 lines 2151–2155 use this step. |
| Pass a F03, relative ampleness sign | Repaired. README:942: “with O(−D′) relatively ample”. | Lan17 lines 1163–1168 have the negative divisor. If O(D′) restricts to O(−1) on an exceptional curve, O(−nD′) has degree n, whereas O(nD′) has degree −n. |
| Pass a F04, circular exclusion | Partly repaired. README:1373: “No temperedness of π_∞ and no membership in a limit of discrete series is assumed at this stage.” | The former circular premise is removed. Type (d) has ranks 1+1+2, type (b) has 2+2. However, the new invocation of BCGP21 Lemma 2.9.1 drops its parity hypothesis: S01. |
| Pass a F05, field-independent separation | Repaired. README:111: “there is R_sep>2 such that for every totally real F”. | The matching `uniform-global-gsp4-separation` entry is in design/plan.json. The existing supplier §6.6 chooses its global bound after F; the declared gap supplies the stronger order. R_F=2+[F:ℚ] gives 3,12,102 and cannot supply the absolute bound of BCGP21 line 3281. |
| Pass b F01, condensed coefficient carrier | Repaired. README:159: “all on the κ-condensed site”; README:455 uses the analytic ring (A,A)■. | VStackSheavesAndLisseCategories VS2.1–VS2.2 supply solidification and general analytic measures. The scheme gluing is explicitly this package's §3.0a. The integer-solid spectrum is not imported as scheme gluing. The repair's reason for rejecting that proposed replacement is correct. |
| Pass b F02, dual-frame scaling | Repaired. README:191: “by u⁻¹; with Lie frame u the dual frame is c/u”. | Changing the frame from 2 to 4 with c=3 changes its partner from 3/2 to 3/4, giving product 3; multiplying the old partner by c/u instead gives product 9. |
| Pass b F03, unnecessary completeness/positive n | Repaired. Suggested.lean:69–83 omits both old hypotheses; README:323 allows every n≥0. | At n=0 the ring is O/(1)=0 and both modules vanish. For O=ℤ_(3), n=2, both coefficient rings before/after completion are ℤ/9. Irreducibility still excludes ϖ=0. |
| Pass b F04, analytic-ring locator | Repaired. README:37: “defined after CS19 Definition 9.1”; References:1627 includes the following paragraph. | CS19 line 2318 defines the discrete Huber pair, while lines 2320–2325 construct the analytic ring. |
| Pass b F05(1), fundamental-class owner | Repaired. README:69 names “the lci upper-shriek identification `upperShriek_lci` (§2.19) consumed by AlgebraicModuliForArithmeticGeometry §7.5's fundamental class”. | SchemeAndStackFoundations:4129 provides the identification; AlgebraicModuliForArithmeticGeometry:8620 owns the boundary fundamental class. Neither is falsely attributed to the other. |
| Pass b F05(2), support/CM supplier | Repaired. README:69 includes “Scheme-theoretic support and Cohen–Macaulay schemes (§0.18)”. | SchemeAndStackFoundations §0.18 exists at line 1254; Layer 5's Dependencies include §§0.18, 1.1, 2.23. The EO specialization uses those generic notions. |
| Pass b F05(3), scalar-parallel boundary condition | Repaired. README:1509: “vanishes unless k_v=l_v=k is independent of v”. | BCGP21 lines 3323–3334 distinguish parallel (4,2), scalar parallel (4,4), and scalar nonparallel (4,4),(6,6). The point contribution can survive only the middle case. |
| Pass b F05(4), Scholze version | Repaired. README:1617 links arXiv:1306.2070v2 and distinguishes manuscript Chapter V from published §5.1. | The cached source has Corollary V.1.7, the locator used in §5.9. |
| Pass b F05(5), exterior-power locator | Partly repaired. README:53 now says “(line 49)”. | At the supplied current pin the entire old module path is absent; the declaration is ExteriorPower/Basic.lean:60. The earlier line correction cannot repair the new pin drift: S02. |

## Verified sound

Both package files were read in full: 1,627 README lines and 85 Lean lines. The Lean file has **three declarations** (two definitions and one theorem), one admitted proof, no admitted data, no padding theorem, and no `set_option`. The declaration contexts are recorded below. The README has **69 numbered target subsections**, plus the four separately presented coefficient/EO definitions and four bold worked examples; these are all covered below. Its bold “Checks” labels are not additional targets. The tables record computed tests, not assertions that a source theorem has been reproved.

### Acceptance statement, headline coverage and contexts

The headline results are: integral coefficient/cohomology constructions (§§1.1–1.5); finite-coefficient Serre duality (§1.6); equivariant perfect models and derived descent (Layer 2); solid coherent correspondences, transpose, support and completion (Layer 3); arithmetic Hecke actions and GAGA (Layer 4); toroidal/PEL and small-weight vanishing, EO Cousin computation and integral Hecke relations/localization (Layer 5); automorphic, interior and multiplicity-counted comparisons (Layer 6); chamber and singular-weight vanishing (Layer 7); rational and Hilbert boundary vanishing, cuspidal exhaustion and the conditional dimension identity (Layer 8).

Suggested.lean's module docstring names the unavailable families and the missing coefficient, compactification, equivariant derived, correspondence, EO, relative-Lie and automorphic carriers. The sole currently expressible geometric headline is §1.6, on native scheme modules, differentials, exterior powers and base-linear cohomology. Its two definitions are used in that headline. They do not encode a substitute theorem. The module-path defect S02 prevents this particular file from loading, but the carrier exists at the pin. No additional statable headline or one-tactic padding declaration was identified.

| Declaration / section | Explicit variable and instance context | Instances and computed values | Result / change |
|---|---|---|---|
| `dvrCoefficientRing`, §1.4, Suggested:51 | O : Type u, CommRing O, ϖ : O, n : ℕ; quotient by the span of ϖⁿ. No hidden DVR/completeness instance. | O=ℤ, ϖ=3, n=2 gives ℤ/9; n=0 gives O/(1)=0; ϖ=0,n=1 gives O/(0)=O. | Definition has the intentionally general ring signature. The headline's Irreducible premise excludes the last case. |
| `integerCoherentCohomology`, §1.4, Suggested:56 | R : Type u, CommRing R, X : Scheme.{u}, X.Over (Spec R), F : X.Modules, i : ℤ. Nonnegative branch uses native R-linear cohomology; negative branch is the zero module on ULift PUnit. | X=Spec R,F=O: i=0 gives R; i=−1 gives 0, whereas truncating (−1).toNat without the guard would give R; F=0 gives 0 in every degree. | Correct branch, scalar and universe contexts; no lost section variable. |
| `finiteCoefficientSerreDuality`, §1.6, Suggested:69 | O : Type u; CommRing, IsDomain, IsDiscreteValuationRing; ϖ with Irreducible ϖ; n : ℕ; X over A=O/(ϖⁿ), d : ℕ, SmoothOfRelativeDimension d and IsProper; F locally free and finite presentation; i : ℤ. No completeness or positive-n binder. | Spec A,d=0,F=A,i=0: Hom_A(A,A)=A on both sides. ℙ¹_A,F=O,i=1: dual H¹(ω)=A=H⁰(O). F=ω,i=0: dual H⁰(O)=A=H¹(ω). i<0 or i>d: 0=0. n=0,F=0: 0=0. A=ℤ/9 or 𝔽₂[t]/t²: dual A=A, including ramified/equal characteristic and characteristic two. | The Artin Gorenstein base makes A-dual exact; smooth proper duality gives the asserted degree reversal. Import repair S02 only. No mechanical elaboration was available. |

A non-Gorenstein control distinguishes the coefficient premise: for A=k[ε,δ]/(ε,δ)², dim soc(A)=2; Hom_A(k,A) has dimension 2 and its A-dual dimension 4, not dim k=1. This illustrates failure of arbitrary-module biduality outside the Gorenstein premise; k is also not a finite locally free A-module, so it is not itself a counterexample to the acceptance theorem with only its base changed. A genus-one curve also distinguishes the trace from an isomorphism RΓ(ω)[1]≅A: the former has nonzero H⁻¹ and H⁰, while A has only H⁰.

### Computed statement ledger

Here “0” denotes the zero module/object, not undefined division. Geometry is always instantiated inside its stated model hypotheses; excluded cases are marked as controls. Values in the fourth column refer to the claimed construction and the comparison or wrong construction. The listed tests include identity maps, empty boundaries, zero coefficients, small primes, nonreduced coefficients, nonflat controls, noncommutative actions and cohomological degree endpoints. Rank-zero test objects are not silently substituted for a fixed positive-rank Shimura datum.

| Target | Context / instance tried | Computed values on the two sides or against the wrong model | Result / change |
|---|---|---|---|
| 1.1 | Rank-one Levi frame ψ₁=2, c=3; rescale by 2; rank zero | ψ₂=3/2, then 3/4, products 3 and 3; wrong scaling gives 9. Rank zero leaves only the multiplier. | Correct inverse-frame convention; prior repair verified. |
| 1.2 | Weight zero; nonabelian left translation; nonempty boundary | Weight-zero canonical coefficient O, subcanonical I_D. For m′=1, m the permutation matrix (123), and f(m)=m₂₁, the correct action gives 1, the printed inverse action 0. Composition L_gL_h=L_gh, not L_hg for g=(12),h=(23). | Integral right-B realization retains symmetric versus divided powers; no forced characteristic-p identification. |
| 1.3 | (a,b)=(1,0),(1,1),(2,2),(5,2); x=2 | Ranks 2,1,1; natural weight-(5,2) scalar 2⁷=128 and ν⁻³=4⁻³=1/64 give 2; weight (4,2) gives 1. | Correct rank/central dictionary. |
| 1.4 | C=[O→O] with differential ϖ; nonflat thickening control | H⁰=0,H¹=k; C⊗ᴸk has H⁰=k,H¹=k. For Spec k→Spec k[ε]/ε², Tor_j(k,k)=k for every j≥0, so pushforward k is not perfect. | Proper-flat-finite-presentation premise excludes the control. A trivial k[C_p]-module has infinite projective dimension and is not inferred perfect from O-perfectness. |
| 1.5 | Δ action by 2 over 𝔽₅; ramified ϖ²=p; n=2 | Dual action is 3, so evaluation gives 2·3=1, not 2·2=4. Matlis class x/ϖ² uses ϖ²; for a ramified trace pairing the different contributes 2ϖ. | O-linear Matlis dual and inverse deck action are retained; no unjustified ℤ_p trace identification. |
| 1.6 | Spec A, ℙ¹_A, i=−1,0,1,2; n=0 | Spec: A=A at i=0, 0=0 otherwise. ℙ¹,F=O,i=1: A=A. ℙ¹,F=ω,i=0: A=A. Outside [0,d]: 0=0. | Acceptance theorem agrees with README; see contexts above. |
| 2.1 | Trivial C₂-torsor; Δ=1 | Upstairs affine term A²=A[C₂], ordinary invariants diagonal A; Δ=1 gives A. | Čech terms preserve deck information rather than replacing terms with invariants. |
| 2.2 | Split C₂-torsor in characteristic two; S₃ regular torsor | k[C₂] dimension 2, group-ring rank 1; trace (1,0)↦1 although \|C₂\|=0 in k. k[S₃] has dimension 6 and group-ring rank 1. | Projectivity is torsor descent, not averaging or commutativity. |
| 2.3 | Free flat coefficient N, including infinite direct sums; nonflat N=k,n=2 | N⊗A_n[Δ] is the corresponding free group-ring module; N=k gives a module killed by ϖ, unlike nonzero free A₂-modules. | Flatness excludes the control; infinite-rank lifting supplier is used. |
| 2.4 | Trivial torsor; ℙ¹ with F=O | Model A_n[Δ][0]; on ℙ¹ ordinary cohomology dimensions (1,0), dual coefficient ω gives (0,1), reversed by duality. | Both coefficient dual and degree reversal necessary. |
| 2.5 | R=𝔽₂[t]/t², chain C₁→C₀ multiplication t | H₀=H₁=k. Tor₂(k,k)=k maps isomorphically to H₁⊗k=k; the next map is zero. H₁(C⊗k)=k maps isomorphically to Tor₁(k,k)=k. | Correct edge sequence keeps Tor₂. Ordinary coinvariants alone fail. |
| 3.0a | Spec O, identity operations; completion/local support on k[x] at (x) | Identity map acts by 1; I=0 completion A, I=(1) completion 0. Completion at x gives k[[x]] in degree 0; local support gives k[x,x⁻¹]/k[x] in degree 1. | Scheme analytic-ring construction is distinct from integer-solid spectrum and from local cohomology. |
| 3.0b | Identity isogeny and multiplication-by-p isogeny | Identity coefficient map is 1; [p] on invariant differentials is p, invertible only after 1/p. In characteristic p it is 0. | The additional p-level spans are explicit targets, not assumed smooth or integral isomorphisms. Their stated construction comes after §§3.1–3.8. |
| 3.1 | Identity legs, coefficient map multiplication 2; zero coefficient | Adjunction returns multiplication 2, not the zero map; zero coefficient gives the unique zero map. | Actual morphism has specified source Lp₂*F and target p₁!G. |
| 3.2 | Identity span; split finite étale degree two, including char 2 | Identity gives 1; pullback then trace gives 2; in char 2 this is 0, not 1. | No division by the degree. Proper p₁ retained. |
| 3.3 | Two noncommuting affine pullbacks, x↦x+1 and x↦2x | One order gives 2x+1; opposite order gives 2x+2. Identity composition gives the original polynomial. | Fiber-product ordering and pullback ordering agree. |
| 3.4 | Equal-dimensional finite-flat map t↦t^p; identity | Differential determinant is p·t^(p−1), hence 0 in char p; identity determinant is 1. The finite-flat duality trace still exists for the inseparable map. | Does not equate inseparable trace with an inverse Jacobian. Embeddability and Cartier hypotheses remain. |
| 3.5 | Deck coinvariants for R=k[C₂], char 2 | R⊗ᴸ_R k=k[0]; k⊗ᴸ_R k has k in every nonnegative homological degree. | Derived tensor distinguishes free from trivial deck coefficient. |
| 3.6 | Flat identity base change versus residue reduction | Identity Tor₁=0; k⊗ᴸ_O k has k in degrees −1,0, whereas k⊗_O k has only degree 0. | Tor-independence required for the underived identification. |
| 3.7 | Rank-one coefficient twist by 3, zero twist, p-lattice | Scalar correspondence changes to 3 times itself; zero twist gives 0; inverse p sends 1↦1/p outside O. | Coefficient arrow need not be an isomorphism; no integral inverse inferred. |
| 3.8 | [p] after inverting p; identity | p·p⁻¹=1 over E; p⁻¹∉O; identity transports by 1. | Rational transport is not an integral isogeny inverse. |
| 3.9 | Transpose of 3-cycle; blowup of ℙ²; closed point in A¹ | Permutation inverse sends e₁↦e₃ and preserves evaluation 1; the same permutation would pair to 0. Blowup b!O=O(E), quotient O_E(−1) has H⁰=H¹=0. Point inclusion has i!O=k[−1], not k. | Duality, shifts and birational test correct; not asserting p!=p*. |
| 3.10 | X={0,1}, p₂ constant 0,Z={1}; t↦t² | First contraction condition reads {1}⊂∅, false. For t↦t² supports are both {0}, but (t) is not contained in (t²). | Set contraction distinguished from stronger ideal divisibility. |
| 3.11 | Completion of k over ℤ₃; x-adic completion | Completed k=k; its derived residue reduction has k in degrees −1,0. Completed k[x]=k[[x]]. | Pseudo-coherence and derived operations retained. |
| 3.12 | Identity on k[x] with finite support filtration; scalar 2 | Each induced term and abutment map is 1, or 2 for the scalar map; completion is degree-zero k[[x]], local support is degree-one quotient. | Filtration equivariance does not identify the two coefficient constructions. |
| 3.13 | C=O[0]⊕O[−1], projection to degree one | Projection and zero map both act by 0 on H⁰, but by 1 and 0 on H¹. | Individual all-degree operators precede relations; H⁰ cannot certify derived equality. |
| 4.1 | Similitudes 2 and 4; central scalar at weights (4,2),(5,2) | Normalizing factors 1/8,1/64; scalar products 64/64=1 and 128/64=2. ν³ instead gives positive powers and fails. | Arithmetic ν⁻³ normalization consistent across layers. |
| 4.2 | O-module versus derived coefficient k[−1] | Hom(O,O)=O permits cancellation. Hom_D(k[−1],O)=k has ϖ·0=ϖ·1=0 but 0≠1. | False at stated derived generality: S03. |
| 4.3 | q=2, (T₀,T₁,T₂)=(1,3,2); q=1 control | P=X⁴−3X³+14X²−24X+64; reciprocal 1−3X+14X²−24X³+64X⁴. At q=1,(1,4,4), P=(X−1)⁴. | Coefficients and reciprocal direction correct. q=1 is an algebraic specialization, not a residue field. |
| 4.4 | Characteristic-zero finite invariants; excluded 𝔽₂[C₂] | In char 2 the invariant 1+σ maps under augmentation to 0, whereas target invariants have dimension 1; H¹(C₂,𝔽₂)=𝔽₂. In char 0 averaging is defined and higher cohomology vanishes. | Exactness confined to characteristic zero; integral tower not silently exact. |
| 5.0 | Hilbert degree d=1, prime-to-p quotient; fixed point under t↦−t | Ambient dimension 3; codimension-one stratum dimension 2. For p=3 the projector (1+σ)/2 is idempotent; for p=2 undefined. The action fixes t=0 despite being free off 0. | Actual compactified torsor/freeness hypotheses retained. |
| 5.1 | Zero cone; q=t² ramification chart | Zero cone has no nonzero faces: subcanonical monomial condition imposes no inequality. Pullback boundary ideal (q) becomes (t²), not reduced ideal (t). | Boundary ideal and multiplicities retained. |
| 5.2 | Exceptional curve, n=1,2 | Degrees of O(−nD′) are 1,2; degrees of O(nD′) are −1,−2. | Relative positivity repaired; canonical/subcanonical endpoint ranges differ as stated. |
| 5.3 | p=7, μ=0, twist t=2 and t=1 | t=2 gives three coefficient weights (4,2),(5,3),(5,5), with vanishing cutoffs >2,>1,>0. t=1 gives (3,1),(4,2),(4,4). t=0 is outside positive twist input. | Length shifts and strict inequalities preserved. |
| 5.4 | p=7, (3,1),(6,1),(7,1) | Weight differences 2,5,6; upper allowed value p−2=5. In the source parameterization α+β=0,3,4 versus strict bound 4. | First two admitted, last excluded. |
| 5.5 | p=7, (4,2),(6,1),(7,1) | Sums 6,7,8 and gaps 2,5,6. First two satisfy sum≥6 and gap≤5; third fails the gap. | Lower sum endpoint retained. |
| 5.6 | p=7, (4,4),(7,4),(8,4) | b=4 in all cases; gaps 0,3,4 versus bound p−4=3. | First two admitted; last excluded. |
| 5.7 | Dual weight (4,2); characteristic three, degree three | (4,2)↦(1,−1)↦(4,2). In char 3, 3!=0; the degree-three symmetric/divided-power identification is excluded by a−b≤p−1. | Boundary twist and integral coefficient restriction correct. |
| 5.8 | p=5, a=4 in (a,2); a=3 in (a,3−a) | (4,2) lies in 4≤a≤5; (3,0) lies in 3≤a≤3. a=6 lies in neither. | Endpoint and distinct vanishing assertions consistent. |
| 5.9 | O[0] versus complex [O→O] with differential ϖ | O→k on H⁰ is onto; for the two-term complex H⁰=0 but residue H⁰=k, so reduction 0→k fails. | Higher cohomology vanishing is genuinely needed; finite collection uses maximum of finitely many bounds. |
| 5.10 | Regular sequence (x,y); nonregular x in k[x,y]/xy | Koszul cohomology for the regular sequence is k in degree 0 and 0 negatively; the nonregular one-term Koszul has H⁻¹=(y)≠0. | CM/regular embedding premise is discriminating. |
| 5.11 | Boundary localization by y on k[x,y]/x²; bad ring k[x,y]/(xy,x²) | First localization has kernel 0; second kills nonzero x. | Boundary regularity, not support terminology alone, gives injectivity. |
| 5.12 | Complex k→k with d=1 | Term maps (1,1) commute with d: 1=1. Term maps (1,0) give 0≠1. | Chain compatibility is a separate assertion, not termwise maps alone. |
| 5.13 | Torsion coefficient k[0], maps 1 and 0 | After tensoring with E both maps become 0; integrally 1≠0. | Integral relations need the Cousin injection, not characteristic-zero equality. |
| 5.14 | T=A×A, supported and absent maximal blocks | e₁=(1,0),e₂=(0,1): eᵢ²=eᵢ, e₁e₂=0, sum=1. An absent block has projector 0; ℤ has no idempotent isolating localization at p. | Finite Artin image hypothesis is essential. |
| 5.15 | Rank-four cyclic diagonal representation over 𝔽₁₁ with eigenvalues 1,2,3,5 | Pair products for the three partitions are (2,4),(3,10),(5,6); none agree, so there is no nondegenerate alternating similitude pairing. | A bare GL₄ representation cannot replace the supplied symplectic residual witness. Full polynomial and multiplier both retained. |
| 5.16 | T=O[t]/t(t−ϖ), versus O×O | Two characteristic-zero characters have one common residual maximal ideal in the first case, so localized complex dimension is 2; in the product case one chosen factor gives dimension 1. | Congruence localization sums all lifting characters, not a single eigencharacter. |
| 6.1 | Affine chart with boundary (t); empty boundary | Image of (t)→k[t] contains t but not 1; with empty boundary the image is all k[t]. | Interior is an image, not automatically canonical cohomology. |
| 6.2 | Full versus holomorphic parabolic relative pair | For the compact-dual sl₂/so₂ calculation, degree-two contribution is one-dimensional; a one-dimensional holomorphic quotient has ∧²=0. Canonical constant 1 restricts to boundary 1. | Pair and growth complex cannot be replaced by full de Rham or cusp coefficients. |
| 6.3 | Inverse central action; f(y)=y in a cusp; zero V | Central factors 2 and 1/2 multiply to 1, not 4. Weighted L² integral ∫(log y)^(−2n)dy diverges for every n. V=0 gives zero cohomology. | Moderate growth is not automatically weighted L²; regularization supplied separately. |
| 6.4 | Constant section on a noncompact modular curve | Canonical section 1 has boundary value 1 and is not in the boundary-ideal image; cusp section has value 0. | Cusp injection/interior inclusion is not surjectivity in every degree. |
| 6.5 | Map ℂ²→ℂ, (x,y)↦x | Source dimension 2, image dimension 1, kernel dimension 1. | Definitions take images of comparison maps. |
| 6.6 | Full π, m=2, dim π_f^K=3, local dimension 1; fixed σ with two infinity members | Contribution dimension 2·3·1=6, not 3. Under the cusp injection, two degree choices give (d,0)+(0,d)=(d,d). | Prior finite/full repair verified. |
| 6.7 | Weight (5,2), central scalar x=2 | Natural c=−7; normalized c=−4; analytic coefficient V(−2,−5;−1). Normalized scalar 2, versus untwisted 128. | Same dictionary as §§1.3,4.1. |
| 6.8 | Holomorphic weight k=0,r=2 | Negative parameter (1−k−r,2−r;k+2r)=(−1,0;4). An eigenline alone has dimension 1 but does not set global occurrence multiplicity to 1. | Endpoint retained; multiplicity remains explicit. |
| 6.9 | Two real places with two degree choices | Product (1+t)²=1+2t+t²; a fixed holomorphic/generic tensor alone has one degree-one factor, not two. | Packet sum distinguished from fixed full representation and component invariants. |
| 7.0 | (4,2),(5,2); central balancing; type (d) | Displayed contragredient spin orbits have sums 0 and −2 respectively; the balanced representation in the latter case has sum +2. At (3,2;c=0), coefficient exponent 5 and balancing exponent −5 cancel, whereas wrong sign gives 10. Type (d) has rank 1+1+2. | Transport signs discriminate; parity problem S01 in exclusion. |
| 7.1 | Origin and regular point in closed chambers | Origin satisfies all four weak chamber inequalities; a regular interior point satisfies one. Compact-singular origin does not produce four genuine limits. | Membership condition is not an existence assertion for limits. |
| 7.2 | (a,2), (a,3−a), (1,b), endpoints a=2,b=1 | Shifted pairs (a−1,0), (a−1,1−a), (0,b−2) select degrees {0,1},{1,2},{2,3}; at (2,1), pair (1,−1) does not select degree 0. | Correct closed walls. |
| 7.3 | R=5, negative parameter λ₁=−k−1 | k=4 gives −λ₁=5≥5; k=3 gives 4<5. The printed positive λ₁≥5 would admit neither. | Corrected negative-parameter bound, distinct from regular root separation. |
| 8.1 | Boundary restriction differential on two intersecting pieces | (1,1)↦1−1=0; (1,0)↦0−1=−1. | Alternating nerve sign and boundary differential preserved. |
| 8.2 | Exact boundary triangle in all degrees; degree-zero-only control | All boundary Hⁱ=0 gives subcanonical→canonical isomorphisms. H⁰(D)=0 alone permits H¹_sub=0,H¹_can=ℂ,H¹(D)=ℂ. | Rational theorem uses all-degree vanishing; not inferred from degree zero alone. |
| 8.3 | Φ at k=0 and k>0; factor 2 | At k=0 target is ω²; k>0 includes the elliptic cusp ideal. Eigenvalue 1 under elliptic T becomes 2 under the stated geometric T_(ℓ,2), hence 0 after characteristic-two reduction. | Matches P20's stated characteristic-zero normalization; this scalar is not substituted for the residual Satake theorem. |
| 8.4 | q=2, α=1,β=2,u=4; repeated-root specialization | D=2, q³T₀=uD=8 gives T₀=1. Roots 1,2,4,8 yield X⁴−15X³+70X²−120X+64, T₁=15,T₂=30. α=β=u=1 gives (X−1)⁴. | Four distinct formal monomials are retained even when specialized values coincide. |
| 8.5 | Parallel (4,2), scalar parallel (4,4), scalar nonparallel (4,4),(6,6) | Point contribution forced zero in first and third cases; only second passes the necessary condition. For curve strata, equality of l_v, not equality of k_v, is the relevant parallel test. | Prior scalar-parallel repair verified; conclusion only H⁰-boundary. |
| 8.6 | H⁰-boundary zero, H¹-boundary possibly nonzero | H⁰_sub→H⁰_can is iso; 0=H¹_sub→ℂ=H¹_can is injective with cokernel ℂ permitted. | Image is interior; no false H¹ surjectivity. |
| 8.7 | Rational a=2 and a=3; finite-part invariants dimension d | Shifted GL₄ orbits (0,0,−1,−1), (0,0,−2,−2); holomorphic/generic σ sum gives (d,d). a=3 has 3≢2 modulo 2. | Purity repair holds; exclusion source hypothesis needs S01. |
| 8.8 | R_sep=3,R_gap=5; weights (8,4),(12,6),(8,2),(10,6) | Root pairings respectively (5,7,9,2),(7,11,15,4),(7,7,7,0),(5,9,13,4). First fails l-gap, second passes, third is allowed singular branch, fourth fails k−l>5. Central twist: 4·1/4=1, wrong sign gives 16. | Large-gap and singular branches separated; absolute uniformity is a declared gap. |
| 8.9 | l₀=2,1,0, finite-part dimension d | (h⁰,h¹)=(d,2d),(d,d),(d,0). Rational singular case l₀=1 gives h¹=h⁰, including a=2. | Conditional multiplicity-counted equality matches preceding statements. |

The additional definitions and worked targets have their own tests:

| Definition / bold worked target | Computed instances | Result / change |
|---|---|---|
| §1.4 coefficient quotient and integer-indexed cohomology | n=0→0; ℤ_(3)/9→ℤ/9; i=−1→0 rather than H⁰=A | Covered individually in the declaration-context table. |
| §5.0 EO closed filtration and its thickenings | In a threefold, codimensions 0,1,2,3 give dimensions 3,2,1,0; k[x,y]/xⁿ has dimension 1 for n=1,2, not dimension 0. | Regular thickenings preserve support dimension; empty tail contributes 0. |
| §5.0 boundary regularity on EO thickenings | y is injective on k[x,y]/xⁿ for n=1,2; in k[x,y]/(xy,x²), y·x=0 with x≠0. | Extra boundary-regularity input excludes the wrong thickening. |
| Finite coefficient duality and reduction, README:1592 | A_n[Δ] has rank \|Δ\| over A_n and rank 1 over A_n[Δ]; its dual has inverse action; derived coinvariants are A_n[0]. For trivial k[C_p]-module k, Tor_j=k for every j≥0. | Free/trivial action and derived/ordinary descent distinguished. |
| Small weights at the endpoint, README:1596 | p=7,(4,2): a−b=2, a+b=6, b=2<4; dual (1,−1); shifted (3,0); central exponent 0; spin entries ±3/2 twice. | First two vanishings apply, third does not; no cross-characteristic conflation. |
| Chamber walls, README:1600 | (a−1,0): C₀,C₁; (a−1,1−a): C₁,C₂ even at a=2; (0,0): all four. | No unique-chamber claim for singular points. |
| Boundary exactness and counts, README:1602 | H⁰(D)=0 with H¹(D)=ℂ permits an H¹ cokernel ℂ; all-degree Hⁱ(D)=0 removes it. σ sum (d,0)+(0,d)=(d,d). | Matches separate rational/totally-real boundary conclusions and multiplicity convention. |

### Sources, Checks and supplier audit

There are **73 Check blocks and 189 Check bullets**, all read and compared with their defining statements, formulas and hypotheses. The computation ledger above covers every target, including the four additional definition blocks and the four worked examples. No definition was found with fewer than three Checks. Some individual Checks are identity or zero cases; the companion negative controls distinguish the wrong constructions. S03 requires one additional negative control because the existing O/ϖ Check does not detect torsion in derived Hom into a torsion-free coefficient.

The following ledger counts **47 named locators** whose text was located and read (section-wide citations and errata are additional, not included in 47). “Verified” here concerns the locator and the stated source hypotheses, not endorsement of the source slips recorded below. All readings used the supplied legal source extractions. The same source keys are retained; no missing-source request was made.

| Source | Named locators counted | Text witnesses and outcome |
|---|---:|---|
| CG18 | 3 | Lemmas 7.5–7.7: CG18 lines 4001, 4035, 4058. The ambient §7.2 construction at lines 3947–4154 preserves the flatness, p-group and dual-coefficient conditions. Trace-isomorphism slips are listed below. |
| CG20 | 8 | Theorem 5.1 line 931; Theorem 5.2 line 1038; Lemma 5.4 line 1097; Theorems 5.5–5.6 lines 1141,1182; Corollary 5.8 line 1231; Lemma 7.10 line 2023; Theorem 7.11 line 2056 and its characteristic-zero argument lines 2116–2157. Small-weight inequalities, W/V transport, all-degree rational boundary vanishing and the isolated all-weight rational argument were compared. |
| BP26 | 6 | Lemma 2.6.11 line 1124; Proposition 2.6.13 line 1142 with hypotheses lines 1135–1141; Proposition 2.7.3 line 1185; Lemma 2.9.3 line 1403; Theorem 2.9.7 line 1440; Proposition 2.9.9 line 1452. Also read the coefficient/action construction at lines 2410–2432 and the relevant six-operation passages. |
| P20 | 6 | Definition 4.3.1 and Remark 4.3.3 at lines 811–841; Theorem 15.2.2.1 line 4922; Theorem 15.2.3.1 line 4939; Corollary 15.2.3.1 line 4954; Proposition 15.2.4.1 line 4986. Boundary Φ and normalization at lines 4973–4983; several printed slips are avoided by the README. |
| Lan17 | 2 | Corollary 6.7, lines 1163–1168, and Theorem 8.6, line 1505 and following. O(−D′) is the ample object; formally canonical versus subcanonical boundary ideals and the n=0 distinction are retained. |
| LanSuh | 4 | Theorem 3.24 line 986; Proposition 7.21 line 2012; Theorem 7.22 line 2042; Corollary 7.24 line 2069. Degree bounds, lifting, nilpotent residues and condition (3.25) were compared with the gap and §5.3. The symplectic p=2 issue is excluded by the explicit rank inequality. |
| Su24 | 4 | Propositions 3.14 and 3.16, lines 1535–1578; Proposition 4.1 line 1609; Theorem 5.7, lines 2440–2473. The parabolic pair, growth stages, inverse central coefficient action and tower equivariance are retained. |
| BCGP21 | 5 | Lemma 2.9.1 line 1831; Theorem 2.9.3 line 1867; Theorem 3.10.1 line 3269; Corollary 3.10.5 line 3302; Lemma 3.10.7 line 3314. Its parity restriction gives S01; the absolute bound, scalar-parallel restriction and degree-zero-only totally-real boundary scope are correctly distinguished elsewhere. The EO/Cousin argument at lines 2920–3135 was also read. |
| Sch15 | 1 | Corollary V.1.7 line 3089, manuscript p.83. Its scalar-weight range and geometric Frobenius polynomial are not an all-weight residual substitute. Version numbering matches the repaired reference. |
| HZ01 | 1 | Corollary 3.2.9 line 2734, with (3.2.4) line 2694 and (3.2.8) line 2729. The Levi/component corrections and length shift appear in the source. BCGP21 lines 3310–3313 expressly explain why their totally-real case uses a separate argument. |
| BR16 | 2 | Theorem 1.12 line 523 and Proposition 1.14 line 579. Both require a subfield of ℂ; Remark 1.13 lines 572–575 warns against positive-characteristic extension. The README uses them in characteristic zero. |
| CS19 | 5 | Definition 9.1 line 2318 and its following analytic-ring paragraph; Theorem 9.8 line 2449; Proposition 11.2 line 2795; Definition 11.3 line 2805; Proposition 11.4 line 2820. Arbitrary discrete rings, enhanced descent and finite-Tor comparison conditions are present. |

H90 was read at the accessible Theorem 2.4.4/2.7 and comparison passages; some scan formulas are not recoverable from the extraction. It is not included in the 47 count. The corresponding genus-two inclusions and endpoint assertions were additionally verified in CG20 Theorem 5.2. Both errata sheets were read in full. GK19 remains the settled uncertified citation.

The **21 external supplier contracts** were resolved against the supplied main/head copies. The table records the ownership boundaries checked; a section range denotes the named range in that supplier, not a new requirement to implement it here.

| Supplier file | Resolved input and hypothesis boundary |
|---|---|
| TauCetiRoadmap/AutomorphicBundles/README.md | B0–B5; B3.10; B3.BGG.2–3 (lines 2020,3073,3134). The integral small-weight BGG extension is a gap; the existing characteristic-zero comparison is not replanned. |
| TauCetiRoadmap/AlgebraicVectorBundles/README.md | L0A–L0C: native finite locally free tensor, dual, determinant and base-change operations. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md | §§0.18,1.1,2.6–2.8,2.18–2.21,2.23,4.8–4.10. The upper-shriek, relative-dualizing and coherent pushforward hypotheses include the advertised Noetherian and properness conditions; §2.20's field-valued Serre theorem is not the Artin-coefficient acceptance theorem. |
| TauCetiRoadmap/DerivedModuleAlgebra/README.md | §§0.2–0.3,1.1.1,1.3–1.5,1.E.0–1.E.1,1.M.1–1.M.2,S.1. Arbitrary residue-field Matlis duality is specifically §1.M.2 (line 2290); §1.M.1 alone would be insufficient. |
| TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md | §§7.1,7.3–7.10. Infinite-rank lifting §7.5, coefficient duality §7.6, strict towers §7.7, finite-Hom completion §7.8 and finite filtered hyper-Tor §7.10 are separate inputs; they are not interchangeable. |
| TauCetiRoadmap/ShimuraCompactifications/README.md | C3.3–C3.10,C4.1–C4.11,C4.16–C4.17,C5.3–C5.17,C5.19–C5.31. Normalized bad-level models do not promise smoothness; the package constructs its additional coefficient spans subject to actual geometric conditions. |
| TauCetiRoadmap/LanglandsParameterStacks/README.md | LP3.0: field Weyl/dual-Weyl modules. Integral lattices with base change remain the declared gap. |
| TauCetiRoadmap/ComplexComparisonPartII/README.md | C1.9,C2,C3.3: proper/projective coherent and derived GAGA (lines 1665,2105). Trace compatibility with the geometric spans is the gap, not falsely claimed from bare GAGA. |
| TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md | SR.0–SR.3,SR.4.1,SR.4.5 (line 3498). Its T₁,T₂ are the package's T₂,T₁; at q=2 the exchanged tuple gives 1−3X+14X²−24X³+64X⁴. The Klingen factorization remains a gap. |
| TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md | §§2.2–2.3,3a.1–3a.2,3b.1–3b.2 (lines 1879,3004,3066,3170,3222). Full multiplier and geometric-Frobenius dual/twist transport are present. This package constructs their geometric action, not a second abstract polynomial API. |
| TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md | §§1.1–1.3,4.1–4.2,5.5,6.1–6.7. `clozelPurity` is present with algebraicity; global separation fixes F first, unlike the new uniform gap. Local negative-parameter singular bounds are distinct. |
| TauCetiRoadmap/AutomorphicSpectralTheory/README.md | §§4.1–4.5,4.10,5.1–5.8, including §5.7a. Multiplicity spaces and the semisimple tempered-cuspidal criterion are retained. Full-pair regularization does not supply Su's parabolic-pair gap. |
| TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md | §11.1 (line 4154) under `GSp4ClassificationInputs`: full general-type packet occurrence and multiplicity after the unitary twist. The package keeps the conditional premise. |
| TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md | §§1.1–1.2,1.7–1.12,2.2,5.1–5.3 and Layer 5: actual representations, stable lattices, Frobenius conventions and recognition by full polynomials. Equality of traces alone in characteristic two is not substituted. |
| TauCetiRoadmap/WeightsInEtaleCohomology/README.md | R34.5–R34.6 (lines 544,628): classical weights at least two and source-qualified Hilbert multiplicities. Weight-one extension is declared; no source-range extension is inferred silently. |
| TauCetiRoadmap/ModularCurvesPartII/README.md | §§14.1–14.4a: actual parabolic coefficient realization, Hecke and level transport, used through R34.5–R34.6. |
| TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md | R18.3.29(a), line 3837: parallel weight k≥2, every totally real field for good-prime existence; stronger bad-place assertions have separate hypotheses. Its arithmetic representation is the dual of the geometric realization, preserving the good-prime polynomial upon simultaneous Frobenius conversion. |
| TauCetiRoadmap/CrystallineCohomology/README.md | CR.5.1,CR.5.3–CR.5.4,CR.DDR.6.11–CR.DDR.6.14. The precise Lan–Suh relative vanishing is a gap; ordinary logarithmic comparisons do not imply it. |
| TauCetiRoadmap/EnhancedDerivedSheaves/README.md | §§0.1–0.3,E1.3,E1.9,E2:towers,E3.2–E3.3,E5:abstract. E1.9 (line 1057) has proper support, finite presentation and target-flat terms; the application G•=O_X[0] preserves flatness. |
| TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md | VS2.1–VS2.2 analytic measures (lines 640,714): general κ-condensed analytic modules. Integer-solid AnSpec gluing is deliberately not consumed as the scheme construction. |
| TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md | §7.5, `fundamental_class_boundary` (line 8620): actual fundamental class and boundary-twisted trace with embeddability, Cartier and inverse-boundary premises. |
| TauCetiRoadmap/AutomorphicBundlesPartII/README.md | Internal dependency ranges checked across all eight layers. §3.0b explicitly builds after §§3.1–3.8; none of those targets depends on §3.0b. Layer 4 can then consume it. The later geometric Hecke-relations theorem is not used to define the earlier individual operators. |

The last row records internal citations in addition to the 21 external supplier contracts.

The ten slugs in design/plan.json match the ten README “What … must provide” contracts: `integral-dual-weyl-lattices`, `coefficient-linear-coherent-comparison`, `gaga-duality-trace`, `boundary-spin-satake`, `coefficient-logarithmic-splitting`, `integral-small-weight-dual-bgg`, `classical-weight-one-realization`, `nonparallel-hilbert-realization`, `su-parabolic-regularization`, and `uniform-global-gsp4-separation`. Each has a named supplier and section; none uses supplier `none`. Their hypotheses distinguish the missing extensions from the currently supplied results. A comparison's naturality clauses are part of the same comparison contract, not unrelated bundled requests. These gaps are not findings.

Ownership searches used the roadmap search service, main/Completed, board packages and the supplied sibling checkouts, by coherent duality, Weyl lattices, coefficient correspondences, completion, EO/Cousin geometry, Hecke actions and automorphic comparisons. The generic owners in the table are imported. Later EO/Igusa and Siegel/overconvergent roadmaps do not move this package's needed finite-level coherent specialization upward; no dependency on them is introduced. No other readable Suggested.lean declares any of the three fully qualified names in `TauCetiRoadmap.AutomorphicBundlesPartII`. The field/curve Serre-duality APIs do not duplicate the relative Artin-coefficient theorem here.

At the pins, Mathlib's `CochainComplex.isKProjective_of_projective` is in Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:113, with an upper bound and projective terms; `CochainComplex.IsKProjective.Qh_map_bijective` is in Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean:43, with a K-projective source and derived-category instance. Thus lifting gives homotopy classes, not automatically strict commuting chain representatives. The package states that distinction.

Tau Ceti's Cohomology/Module/Base.lean lines 45,57,110,127 and Cohomology/LongExactSequence.lean:242 supply exactly the scalar structures, linear maps, H⁰ equivalence/naturality and connecting morphism cited. Their signatures do not assert properness, finite dimension or the derived comparison. Modules/Differentials/Basic.lean:85 supplies relative differentials. Modules/TensorProduct.lean:66 supplies the closed monoidal instance. ExteriorPower/Basic.lean:60 defines the sheafified exterior-power functor, not a duality theorem. All these paths have prefix TauCeti/AlgebraicGeometry except the exterior-power path, whose full path is in S02. The existing field-valued divisor-sheaf Serre-duality declaration has the curve, function-field and valuative hypotheses listed by the README; it does not imply the general acceptance statement by a single library lemma.

The read-only dependency gate returned:

```text
moved: AutomorphicBundlesPartII moved in the merge order from #178 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 178 roadmaps, 1192 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The permitted move is not a finding. The package diff against origin/main changes only files under packages/AutomorphicBundlesPartII. README and Lean contain no pull-request numbers, computational algorithm, `set_option`, admitted data or process instruction masquerading as mathematics. The theorem uses `theorem`, and its three own backticked declaration names agree with the README.

## Not verifiable

- Mechanical elaborated signatures: the supplied signature run exited before printing signatures because the exterior-power object import failed. The brief forbids Lean builds here. No Lean command was run, and the report's binder table is a source-level inspection, not a successful `#check` certificate. The repair worker must rerun elaboration after S02.
- GK19: the existing source key is explicitly uncertified. Its EO/Hasse locator remains cited without certification; it is not reopened or entered in a missing-reference request.
- H90: the supplied scan extraction does not recover every formula in the relevant comparison statement, and OCR is unavailable. The accessible surrounding discussion and CG20 Theorem 5.2 support the package's genus-two use; the unreadable original formula itself is not certified.
- Declared supplier gaps: no implementation or proof of the ten missing contracts is asserted. Their matching declarations, ownership and precision were checked; acceptance after the listed repairs remains conditional on those contracts and on the explicit classification inputs.
- The source proof of P20's particular factor 2 in the Φ formula is quoted there from an older reference; the displayed formula was verified in P20 line 4980, but that older proof was not independently reconstructed. The package separately supplies the normalized full boundary Satake contract, avoiding an inference from this scalar alone.

## Source issues

The effect labels below concern the source statement or proof. They are not additional package findings where the README already uses the corrected version.

- **Error** in CG18 at §7.2, printed p.399 (CG18 line 4115): the source says top coherent trace is an isomorphism without a global-functions qualification; it should be the trace map, with an isomorphism only under the corresponding global-functions condition; affects the proof.
- **Error** in CG18 at §7.2, printed p.400 (CG18 line 4143): the source says the shifted dualizing cohomology complex is isomorphic to the coefficient ring; it should be the proper-duality counit, which need not be a quasi-isomorphism; affects the proof.
- **Misprint** in BP26 at §4.3.1, manuscript p.46 (BP26 line 2419): the source says left translation evaluates at m⁻¹m′; it should be evaluated at (m′)⁻¹m; affects a stated result.
- **Misprint** in BP26 at proof of Proposition 2.9.9, manuscript p.29 (BP26 line 1467): the source says the inverse-image open subsets of C immerse into X; it should be open immersions into C; affects the proof.
- **Misprint** in P20 at §15.2.1, manuscript p.107 (P20 line 4897): the source says λ₂ is both at most and greater than −λ₁; it should be −λ₁≥λ₂>λ₁ in the indicated chamber; affects a stated result.
- **Misprint** in P20 at §15.2.2, manuscript p.107 (P20 line 4913): the source says the coefficient's first label is λ₁+1; it should be −λ₁+1, matching its stated highest weight; affects a stated result.
- **Misprint** in P20 at §15.2.2, manuscript p.107 (P20 line 4917): the source says that coefficient's central label is c; it should be −c, as in its definition and the following theorem; affects a stated result.
- **Misprint** in P20 at Theorem 15.2.2.1(2), manuscript p.108 (P20 line 4927): the source says the negative parameter must be large positive; it should be −λ₁≥R, equivalently k≥R−1; affects a stated result.
- **Misprint** in P20 at Corollary 15.2.3.1, manuscript p.108 (P20 line 4960): the source says unlocalized H¹ equals the sum for a single residual congruence class; it should be H¹ localized at that residual ideal; affects a stated result.
- **Error** in P20 at proof of Corollary 15.2.3.1, manuscript p.108 (P20 line 4965): the source says the three-term cohomology segment is short exact; it should be a segment of the long exact sequence, without the asserted endpoint properties; affects the proof.
- **Misprint** in P20 at proof of Corollary 15.2.3.1, manuscript p.109 (P20 line 4980): the source says the boundary ω² exception occurs at k=2; it should be k=0, as in the preceding pushforward formula; affects the proof.
- **Misprint** in P20 at Proposition 15.2.4.1, manuscript p.109 (P20 line 4989): the source says λ₁>0 for its previously defined holomorphic/generic limits; it should be λ₁<0; affects a stated result.
- **Misprint** in BCGP21 at proof of Lemma 3.10.7, printed p.238 (BCGP21 line 3352): the source says one spin monomial occurs twice in the four-term sum; it should be four distinct spin monomials before specialization; affects the proof.
- **Misprint** in BR16 at proof of Theorem 1.12, v1 p.11 (BR16 line 552): the source says the arithmetic subgroup has finite order in GL_q(O_F); it should be finite index, as needed for the density argument; affects the proof.
- **Error** in Lan17 at Lemma 8.1, manuscript pp.31–33 (Lan17err line 9): the source says the acting object is a finite abelian group; it should be a finite étale commutative group scheme, using descent before averaging; affects the proof; corrected in print at Lan17err items (1)–(2), p.1.
- **Error** in Lan17 at Theorem 8.7, manuscript p.34 (Lan17err line 14): the source says the indicated map is always bijective; it should exclude the simultaneous dimension-one and nonempty-boundary case; affects a stated result; corrected in print at Lan17err item (3), p.1.
- **Misprint** in LanSuh at Theorem 1.8, manuscript p.6 (LanSuhErr line 9): the source says Hᵐ(f) before specifying f; it should identify f as the special-fibre reduction of F; affects nothing; corrected in print at LanSuhErr item (1), p.1.
- **Misprint** in LanSuh at §4.4, manuscript p.27 (LanSuhErr line 11): the source says canonical/subcanonical labels on the wrong part of the coefficient notation; it should attach them to the coefficient functor applied to W; affects nothing; corrected in print at LanSuhErr item (2), p.1.
- **Error** in LanSuh at §6.2, manuscript p.34 (LanSuhErr line 14): the source says the positive unipotent Lie module identifies with the dual negative module in characteristic two; it should use the actual dual, or exclude the symplectic characteristic-two case; affects the proof; corrected in print at LanSuhErr item (3), p.1.
- **Misprint** in LanSuh at proof of Proposition 6.8, manuscript pp.35–37 (LanSuhErr line 19): the source says w in the final sentence; it should be z; affects nothing; corrected in print at LanSuhErr item (4), p.1.
- **Error** in LanSuh at Proposition 7.2, manuscript p.37 (LanSuhErr line 20): the source says the specified canonical line has trivial tensor square; it should be torsion in the Picard group without exponent two; affects a stated result; corrected in print at LanSuhErr item (5), p.1.
- **Error** in LanSuh at Theorem 8.13 and Corollary 8.14, manuscript pp.48–49 (LanSuhErr line 27): the source says Weyl-alcove smallness suffices; it should use representation-smallness as in Corollary 7.24; affects a stated result; corrected in print at LanSuhErr item (6), p.1.
- **Error** in LanSuh at Theorem 8.13, manuscript pp.48–49 (LanSuhErr line 29): the source says unshifted weights determine a single interior degree; it should use both shifted-weight cutoffs and the resulting interval; affects a stated result; corrected in print at LanSuhErr item (6), p.1.
- **Error** in LanSuh at Corollary 8.14 and Theorem 8.23, manuscript pp.49,51 (LanSuhErr line 35): the source says the two shifted-weight conditions ambiguously; it should require both simultaneously; affects a stated result; corrected in print at LanSuhErr item (7), p.1.
- **Error** in LanSuh at Theorem 8.23, manuscript p.51 (LanSuhErr line 38): the source says characteristic-zero cutoffs use the unshifted weight; it should use the shifted weights and their interior interval; affects a stated result; corrected in print at LanSuhErr item (8), pp.1–2.
- **Error** in LanSuh at Remark 8.24, manuscript p.51 (LanSuhErr line 48): the source says regularity of μ(ν) suffices; it should also require that ν is cohomological; affects a stated result; corrected in print at LanSuhErr item (9), p.2.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "67bd670db780c7928f538e70596b71460f23bd42", "job": "RT-AutomorphicBundlesPartII~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
