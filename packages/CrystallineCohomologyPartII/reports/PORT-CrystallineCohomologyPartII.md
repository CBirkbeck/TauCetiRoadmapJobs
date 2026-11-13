# PORT-CrystallineCohomologyPartII

Branch `roadmap/crystalline-cohomology-part-ii`, head commit `8bd69be` ("CrystallineCohomologyPartII: roadmap (README, Suggested.lean, metadata)"), on base `42813dd`. The commit adds only `TauCetiRoadmap/CrystallineCohomologyPartII/{README.md,Suggested.lean,metadata.toml}` (3 files, 2029 insertions).

## Checks

- Build: `lake build TauCetiRoadmap.CrystallineCohomologyPartII.Suggested` ends with `Build completed successfully (18522 jobs).` It gives 5 warnings, all `declaration uses 'sorry'` (lines 95, 111, 123, 145, 178: the five theorems), and nothing else.
- Gate: `gate CrystallineCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction (`gate --depcheck … --movable`): `depcheck: 214 roadmaps, 1902 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Citations (`roadmaps resolve` on the ported README): no cross-roadmap citation or roadmap Lean name is found nowhere. That tool did not check the Mathlib and Tau Ceti names, so I opened each one at the pins myself (below).
- Elaborated signatures: I appended `#check @name` for all eight declarations to the module, built it once with the permitted `lake build` command, and then restored the file byte for byte (the committed file contains no `#check`). I compared each elaborated type with its README statement:
  - `card_rationalPoints_modEq_of_cohomologyPullback_bijective` keeps `[Finite K]`, both `[IsProper π]`, `f ≫ πY = πX`, and the bijectivity in every degree.
  - `card_projectiveZeroLocus_modEq_one` keeps homogeneity, `1 ≤ d j` and `∑ d j ≤ n`.
  - `card_dvd_card_solutions_of_sum_lt` keeps `[Finite K] [Finite σ]` and the strict degree bound.
  - `IsThetaDivisor` and `card_thetaDivisor_modEq` keep `[Field K]`, and the latter keeps `[Finite K]`.
  - `UniversallyCH0Trivial` keeps its explicit `[IsProper π]`.
  - `card_rationalPoints_modEq_one_of_universallyCH0Trivial` keeps `X.Over`, `IsProjectiveOver K`, `Smooth` and `GeometricallyConnected`.

  No binder was lost and nothing changed. The file has no section `variable`s; only `universe u` is in scope.

## Draft pull request body

This pull request adds *Crystalline cohomology, de Rham–Witt complexes and logarithmic structures, Part II: Witt vector cohomology of singular varieties*. It continues CrystallineCohomology where that roadmap stops, and its parent's Scope and ownership names this Part II for Witt cohomology under h-covers and rational Witt cohomology of singular schemes.

Serre's Witt vector cohomology H^*(X, WO_X) ⊗ ℚ fails to be a Weil cohomology, but it is the slope < 1 part of crystalline cohomology for smooth proper X. For singular and nonproper varieties it keeps arithmetic content. The roadmap builds this in seven layers:

- Layer 0: the Witt vector sheaves W_nO_X, WO_X and their ideal sheaves, with the tensor and isogeny rationalizations and Frobenius inversion.
- Layer 1: Bhatt–Scholze's theorem that Frobenius-inverted Witt cohomology is an h-sheaf.
- Layer 2: Witt vector cohomology with compact supports.
- Layer 3: the Berthelot–Bloch–Esnault comparison with the slope < 1 part of compactly supported rigid cohomology.
- Layer 4: Ekedahl duality, Gros cycle classes and the action of proper correspondences on relative Hodge–Witt cohomology.
- Layer 5: Chatzistamatiou–Rülling's Witt-rational singularities, where quasi-resolutions take the place of resolutions.
- Layer 6: the point-count consequences over finite fields: the Witt zeta function, Ax–Katz modulo q, Serre's congruence for theta divisors, point counts of WO-rational schemes, and Esnault's theorem that universally CH_0-trivial (for instance rationally chain connected) smooth projective varieties have a number of rational points congruent to 1 modulo q.

These are the inputs that the positive-characteristic birational geometry of Gongyo–Nakamura–Tanaka and Hacon–Witaszek consumes. `Suggested.lean` states the five headlines that are statable at the pinned Mathlib and Tau Ceti:

- the congruence from bijections on structure-sheaf cohomology;
- Ax–Katz modulo q in projective form;
- Ax–Katz modulo q in affine form, which strengthens Mathlib's Chevalley–Warning from p to q;
- the theta-divisor congruence;
- Esnault's point count.

Its docstring names the headlines that are not statable and what each lacks.

## Dependencies still in pull requests

These suppliers are still pull requests: AbelianSchemesAndArithmeticModuli, ArcTopologyAndDescent, ClassicalAdicEtaleCohomology, CrystallineCohomology, DerivedDeRhamCohomology, MotivesAndAlgebraicCycles, NeronModelsAndSemistableAbelianVarietiesPartII, PadicDifferentialEquationsAndRigidCohomology and PrismaticCohomology. All of them come earlier in the merge order, and each adds a new roadmap folder.

The suppliers on main are AdicSpacesPartIII, EnhancedDerivedSheaves, EtaleCohomologyFoundations, JacobianChallenge and SchemeAndStackFoundations. No citation uses an id that only an open revision defines.

## What moved from the Lean to the README

Nothing moved. The package file already met the Lean form. It has:

- one `public import Mathlib` and nine individual `TauCeti.*` imports, each used;
- five headline theorems with `sorry`;
- three definitions with real bodies (`IsThetaDivisor`, `zeroCycleDegree`, `UniversallyCH0Trivial`) that make the headlines statable;
- no padding, no sorry'd data and no `set_option`.

I added no headline: no further one is statable at the pins (see the table). §6.4 (iv) is the case Y = Spec K of the stated §6.4 (ii) and stays a README statement. The only Lean edit is to the module docstring, which now also names two more unstatable headlines:

- §6.5, the congruence of point counts for quasi-birational schemes with WO-rational singularities. It lacks Witt-rational singularities.
- §6.4 (iii), the congruence for the quotient of a proper scheme by a finite group. It lacks the quotient `X/G` of a proper scheme (the pins have affine invariant quotients only) and Witt vector cohomology.

## Supplier replacements and duplication removals

- **Tau Ceti universal homeomorphisms.** The pinned Tau Ceti has `TauCeti.AlgebraicGeometry.IsUniversalHomeomorphism` (`TauCeti/AlgebraicGeometry/Morphisms/UniversalHomeomorphism.lean:64`) with `isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective` (`:162`). The README defined universal homeomorphisms in Conventions item 7 without citing it. It is now cited in Conventions item 7, the Tau Ceti contract, and the "already in the library" sentence of Scope and ownership.
- **Section number.** `sheafified_grothendieck_duality` is a target of SchemeAndStackFoundations §2.20, but the package cited it as "§2.21, sheafified grothendieck duality" six times. All six now cite §2.20.
- **Supplier contracts.** Nine supplier contracts were lists of catalogue slugs such as "§RD.3.1, frame", "§E1, presentability-and-derived-tensor" and "§4.19, de jong alteration theorem". The slug "presentability-and-derived-tensor" names nothing in EnhancedDerivedSheaves. These contracts were:
  - CrystallineCohomology;
  - DerivedDeRhamCohomology;
  - EnhancedDerivedSheaves;
  - EtaleCohomologyFoundations;
  - MotivesAndAlgebraicCycles;
  - PadicDifferentialEquationsAndRigidCohomology;
  - AdicSpacesPartIII;
  - ClassicalAdicEtaleCohomology;
  - SchemeAndStackFoundations.

  I rewrote each to name the supplier's section, its target title or declaration, and what is assumed of it. I checked each against that supplier's README on main or at its open head. All 120-odd slug citations in the *Needs:* and Dependencies lines now use the same real names, for example:
  - `alteration_theorem`;
  - `qcoh_higherDirectImages`;
  - `localization_exact`;
  - `hypercoverDescent_boundedBelow`;
  - `tot_filteredColimit_of_bounded`;
  - the CrystallineCohomology target titles (*Finite-length Witt operators and their identities*, *Degree filtration and the slope spectral sequence* and the others).
- **Duplication sweep, by object.** I ran `roadmaps grep` over main and all open heads for each object, and searched the pins for Chevalley–Warning, Witt vectors, theta and rational points. The objects were:
  - Witt vector sheaves and WO_X, and Frobenius-inverted Witt cohomology;
  - Witt cohomology with compact supports and the slope < 1 comparison;
  - Witt-rational and WO-rational singularities, and quasi-resolutions;
  - the Witt canonical system, Ekedahl duality and Gros cycle classes;
  - Hodge–Witt cohomology with supports;
  - Bocksteins;
  - Ax–Katz, Chevalley–Warning and point congruences mod q;
  - theta divisors and principal polarizations;
  - universal CH_0-triviality, decomposition of the diagonal, rational chain connectedness and Esnault's theorem.

  No second owner exists. The overlaps found and how they are settled:
  - JacobianChallengePartII owns the Jacobian theta polarization, AbelianVarietiesOverFiniteFields counts on genus-two theta divisors, and SheafConvolutionOnAbelianVarieties uses h⁰(Θ) = 1 as an example. None owns the general theta-divisor point congruence.
  - MotivesAndAlgebraicCycles §0.6 owns the integral diagonal decomposition, already cited. Its §2.2 owns continuity of Chow groups and the torsion kernel for smooth projective schemes. §6.10 here keeps the case of zero-cycles on every proper scheme. Scope and ownership now says so in one clause, as a kept variant.
  - PadicDifferentialEquationsAndRigidCohomology mentions quasi-resolutions only inside a proof sketch.
  - Tau Ceti treats rational points as sections `s ≫ f = 𝟙`, as the Lean statements do; there is no named carrier to use instead.

  No declaration of `Suggested.lean` shares a qualified name with a roadmap declaration. No other removal was needed.

## Fixes a mathematician would flag

1. **Title.** The title and the first sentence of Scope and ownership named the parent "crystalline cohomology, de Rham–Witt and logarithmic foundations". The parent is *crystalline cohomology, de Rham–Witt complexes and logarithmic structures*. Fixed in both places.
2. **Scope.** The second Scope paragraph said the parent's "Not here" "also describes convergent coefficient descent and Cartier transforms" and that "the other directions share the parent's crystal interfaces". That left those two topics with no stated owner. The parent's sentence reads: "Witt cohomology under h-covers, convergent coefficient descent, rational Witt cohomology of singular schemes and Cartier transforms of periodic connections are the subject of CrystallineCohomologyPartII". Scope and ownership now says definitely that this roadmap builds the first and third and that convergent-coefficient descent and Cartier transforms of periodic connections are not part of it. See Unresolved.
3. **Conventions item 8.** It defined a quasi-resolution "from a topological finite quotient", but §5.2 and CR12, Definition 4.3.1, require an integral one. A topological finite quotient is normal and equidimensional but may be disconnected. Item 8 now says "integral" and points to §5.2.
4. **TeX-like spans.** `γ_m(Vx) = (p^{m−1}/m!)V(x^m)`, `H^{a+b}_crys`, `W_rΩ^q_{X,log}`, `D_{B,γ}(J)` and `F_{X/k}` appeared outside code spans in the new contract text. They are now in backticks, and the gate's `tex` check passes.

## Adversarial mathematics pass

"Pass" means the stated law holds on the instance and on its negative control. I recomputed every row myself.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Conv. 1–2 (F, V, p-typical) | p = 2, W₂(F₂) | W₂(F₂)=ℤ/4; F(V(1))=2, V(F(1))=V(1)=2 (char p), [1]=1; σ²=id on W(F₄) so F² is K-linear | Pass |
| Conv. 4 (two rationalizations) | ⊕_{n≥1} ℤ/pⁿ on a point; ℤ/3 at p=2 | ⊗ℚ = 0, isogeny image ≠ 0 (no p^N kills it); ℤ/3 killed by 3, not by 2^N | Pass |
| Conv. 6 (slope normalizations) | F₄, E=K⊕K, F=(σ,2σ) | F²=(1,4); v₄(1)=0, v₄(4)=1 = v₂(2); E^{<1} = first summand | Pass |
| Conv. 7 (universal homeomorphism) | Tau Ceti definition at the pin | every base change homeomorphic ⟺ integral + universally injective + surjective (`:162`); integral + loc. finite type ⇒ finite | Pass; now cites Tau Ceti |
| Conv. 8 (quasi-resolution) | source P¹⊔P¹ | Frobenius of P¹⊔P¹ excluded by §5.2's integrality but admitted by old wording | Fixed (integral) |
| Conv. 11 + Check (projective count) | x² − ay² on ℙ¹(F_q), q odd | affine zeros 1, projective 0; 1 = 1 + (q−1)·0 | Pass |
| Conv. Check (ζ of P¹) | P¹/F_q | ζ=(1−t)⁻¹(1−qt)⁻¹; ζ^W=(1−t)⁻¹; exponents (−1)^{i+1} = −1 for i=0,2 | Pass |
| §0.1 Witt ideal sheaves | I=(t)⊂F_p[t], n=2; I=0, O | V(t)=(0,t)∈W₂(I); [t](a₀,a₁)=(ta₀,t^pa₁), so t ∤ / t^p ∤ t; W_n(0)=0, W_n(O)=W_nO | Pass |
| §0.1 V-sequence | 0→W_nI→W_{n+1}I→I→0 | ker of first component = (0,a₁,…,a_n)=V(W_nI); a ↦ (a,0,…) surjective | Pass |
| §0.1 inverse-limit formula | X=Spec F_p | W_n(F_p)=ℤ/pⁿ surjective tower, lim = ℤ_p, lim¹=0 | Pass |
| §0.2 Serre class | End on Spec F_p | colim_a Hom(p^aℤ_p, ℤ_p) = ℤ_p[1/p] = ℚ_p; m prime to p is a unit in W(R) | Pass |
| §0.3 F-inversion | A=F_p[ε]/(ε²); X=∅ | F kills W(εF_p) (ε^p=0) so W(A)[1/F]=ℤ_p ≠ W(A); ∅ gives 0 | Pass |
| §0.4 (iii) nilpotent nilradical | F_p[t_i]/(t_i^{p^i}) | F^c(t₁,t₂,…) has t_i^{p^c} ≠ 0 for i > c, so not killed | Pass |
| §0.4 (ii) radicals | I=(t²), J=(t) on A¹ | W(J)/W(I) has components in tA/t²A, killed by F, so by p | Pass |
| §0.5 (ii) connected fibres | Spec F_{q²}→Spec F_q; k[t]⊂k[t,s]/(s²−t), p odd | dims 1→2 over W(F_q)[1/p], not iso; s^{p^N}=t^{(p^N−1)/2}s ∉ A | Pass |
| §0.5 (i) Frobenius factorization | F_p(t)⊂F_p(t^{1/p}); ∅; Spec F_p | both composites = Frobenius with N=1; identity with N=0 | Pass (gap qcqs-frobenius-factorization kept) |
| §0.6 Mayer–Vietoris | two lines in A²; P¹∪P¹ at a point | H⁰ = W(k[x])_K ×_K W(k[y])_K; 0→K→K²→K→0 exact | Pass |
| §0.7 fibre-dimension bound | j: A²∖0 → A² | fibres of dim 0 but [x⁻¹y⁻¹] ≠ 0 in H¹(A²∖0, O), so properness needed; absolute bound H^{>2}=0 holds | Pass |
| §0.8 finiteness, torsion | supersingular / ordinary E; P¹ | H¹(E,WO) free of rank 2 (slope ½) / rank 1 (slope 0); H¹(P¹,WO)=0. Torsion of an f.g. module over the Noetherian W_σ[[V]] with central p is killed by one p^N | Pass |
| §1.1 fppf descent | Spec F_{p²}→Spec F_p | equalizer of W(F_{p²}) ⇉ W(F_{p²}×F_{p²}) is ℤ_p | Pass |
| §1.2 derived products | k⊗ᴸ_{k[t]}k; 3 factors, first flat | π₀=k, π₁=k; π₁W=∏k killed by F (and by p); k[t,s]⊗(k⊗ᴸk) has π₁=k[s] ≠ 0 | Pass |
| §1.3 finite pushout | A², J=(x,y); J=(f) nonzerodivisor | B′=k[x,y]×_k k=k[x,y]; H¹(Bl,O(−nE))=⊕_{m≥n}H¹(P¹,O(m))=0; B′=A×_{A/J}A/J=A | Pass |
| §1.4 excision | Y=A², T=X=Bl₀A² | chart k[x,v₁,v₂]/(x(v₁−v₂)) reduced, two components; sequence RΓ(X)→RΓ(X)⊕K→K has iso first component | Pass |
| §1.5–1.6 h-descent | node xy=0; Bl₀A² base change | Bl at node = disjoint lines (flat); E×E component makes b_T not a blowup | Pass |
| §2.1 ideal vanishing | cone over canonical curve g ≥ 3; Bl₀A² | R¹f_*(I′) ⊃ H¹(C,ω_C)=k but rational Witt R¹=0; ⊕_{m≥r}H¹(P¹,O(m))=0 | Pass |
| §2.2 exceptional locus | elliptic cone | R¹f_*WO_ℚ = H¹(E,WO_ℚ): dim 1 slope 0 (ordinary), dim 2 slope ½ (supersingular) | Pass |
| §2.3 compact supports | A¹, G_m, ∅ | A¹: fib(K→K)=0 in all degrees; G_m: H¹_c=coker(K→K²)=K; ∅: 0 | Pass |
| §2.4 finiteness, bounds | A² ⊂ P² | H²_c(A²,WO_K)=fib(K→K)=0, while H⁴_rig,c(A²)=K(−2) | Pass |
| §2.5 resolutions | split/nonsplit node over F_q | X₁=P¹⊔2 pts: q+3 points; nonsplit P¹⊔Spec k′: q+1 | Pass |
| §2.6 descent | node, truncation N=1,2; y²=x²(x−1)/F₃ | N=1: H¹=K³; N=2: H¹=K. Split: q ≡ 1−1; nonsplit: q+2 ≡ 1−(−1); F₃ curve: 1+1+2+1 = 5 = q+2 | Pass |
| §3.1 slope parts | E=K, F=p^aσ; P₁ of elliptic curves | E^{<1}=E ⟺ a ≤ 0; P^{<1} = 1−αt (ordinary), = P (supersingular) | Pass |
| §3.2 Witt realization | Spf W, F=σ; Spf ℤ_p, id; ℤ_p[t], t↦t^p | identity of K; P(J_n)=ℤ/pⁿ→ℤ/pⁿ, augmentation 1↦1, p↦0; s_φ(t)=[t] (ghosts t^{p^i}) | Pass |
| §3.3 comparison map | P¹, ordinary E, point, ∅ | H²: K(−1)→0 not injective; H¹ kills the slope-1 line; id of K; 0→0 | Pass |
| §3.4 simplicial frames | smooth projective X, constant objects | all maps identities, Frobenius-compatible | Pass |
| §3.5 smooth proper | abelian variety, dim g, p-rank f | slope<1 part of H¹_crys: f + (2g−2f) = 2g−f | Pass |
| §3.6 main comparison | P¹; node; elliptic curves | H⁰: K↔K; H²: no slope<1; node H¹=K slope 0 on both sides; dims 1 / 2 | Pass |
| §3.7 smooth affine | A¹ ⊂ P¹ | all H^i_c = 0 (no claim in degree n) | Pass |
| §4.1 canonical system | point; P¹; two planes in A⁴; cone over abelian surface | W_nω = W_n(k); W₁ω_{P¹}=O(−2), H¹=W(k) by trace; non-CM: depth 1 < 2; dim H¹(A,O)=2 ≠ 0, so the cone is not CM | Pass |
| §4.2 pushforward | P¹→pt; F: A¹→A¹⁽¹⁾; point in P¹ | (1,1)→(0,0) iso, (0,0)→(−1,−1)=0; F_*F^* = p; r=−1, so 1 ↦ ĉl(x) of trace 1 (not a multiple of 1) | Pass |
| §4.3 cycle classes | D=V(t)⊂A¹; {0},{∞} ⊂ P¹; Φ={∅} | supported class −dt/t ≠ 0, image 0 (H¹(affine)=0) = c₁(O); both images = c₁(O(1)), trace 1; CH(T,{∅})=0, CH₀(P¹,{∞})=ℤ | Pass |
| §4.4 correspondences | finite flat h of degree d; A¹→pt | [Γ_h]∘[Γ_hᵗ]=p₁₃,*{(h(x),x,h(x))}=d[Δ_Y]; graph not proper over pt, transpose proper over A¹ | Pass |
| §4.5 action | P¹×{x}, {x}×P¹ on P¹ | on (H⁰WO, H¹WΩ¹): diag(0,1) and diag(1,0); sum = [Δ] acts as id | Pass |
| §4.6 positive codimension | pt→P¹ (degree 1); Spec k ⊔ Spec k | 1 ↦ ĉl(x), trace 1, WO-projection 0; component support acts diag(1,0), N·diag(1,0) ≠ 0 | Pass |
| §5.1 finite quotients | A²/{±1}, p odd; Spec k ⊔ A¹; G=ℤ/pⁿ | tame of degree 2; not equidimensional (dims 0, 1); CR12 Remark 4.4.8 checked against Ellingsrud–Skjelbred for cyclic p-groups (depth = min(dim V^G + 2, dim V)) | Pass |
| §5.2 quasi-resolutions | F_{X/k}; E→P¹ degree 2; split node | degree p^{dim X}, purely inseparable; k(P¹)⊂k(E) separable, so excluded; node normalization has degree 1 but 2 points over the node | Pass |
| §5.3 direct factor | Spec k ⊔ A¹ | u_*u^* = (1, p) componentwise, not p^{dim X} = p | Pass |
| §5.4 quasi-resolution theorem | minimal resolution of A²/{±1} | exceptional P¹, H¹(P¹,WO_ℚ)=0 | Pass |
| §5.5 WO-rationality | elliptic cone; ℤ/pⁿ quotients | H¹(E,WO_ℚ) ≠ 0 (dim 1 or 2); non-CM finite quotients are Witt-rational | Pass |
| §5.6–5.7 | smooth S; elliptic cone | WS₀=WO_ℚ, WS_d=Wω_ℚ; H¹(WS₀) ≠ 0, so not iso | Pass |
| §5.8 invariance | blowup along C ≠ X; C = X | same H^i(WO_ℚ); C=X gives empty blowup, H⁰ drops to 0 (excluded) | Pass |
| §5.9 rational ⇒ Witt-rational | split nodal cubic, normalization | R^{>0}=0 but H¹(S,WO_K)=K vs 0; normality needed | Pass |
| §5.10 isolated singularities | cone over V(x²−ay²)⊂P¹ = Spec F_{q²}; plane curve genus g | higher Witt = 0 but W(F_q)_ℚ→W(F_{q²})_ℚ has dims 1→2; slope-[0,1) part of H¹ has dim 2g−f ≥ g | Pass |
| §5.11 diagonal | Pⁿ; elliptic curve | Δ = Σ h₁^i h₂^{d−i} = h₁^d + (terms with h₂ ≥ 1); transposition of Bloch–Srinivas orientation consistent; E fails the hypothesis | Pass |
| §5.12 fibrations | P¹→pt (r=1); Pⁿ_Y→Y; identity | H⁰Wω=0=H^{−1}WS, H¹Wω=W(k)_ℚ=H⁰WS; RⁿWω=Wω_Y via the j=n summand; r=0 identity | Pass |
| §6.1 Witt zeta | pt, P¹, A¹, ∅, elliptic E | (1−t)⁻¹, (1−t)⁻¹, 1, 1, 1−αt or P₁ | Pass |
| §6.2 slope factor | P¹, A¹, G_m | ζ^{<1}: (1−t)⁻¹, 1, 1−t; Witt factor the same | Pass |
| §6.3 Ax's criterion | 1/(1−qt); 1/(1−t) | N_r = q^r ≡ 0 mod q^r, factor 1; N_r = 1 fails all four | Pass |
| §6.4 (ii)/(iv) | blowup of a surface at a point; P¹; two P¹ meeting at a point; fold map; ∅; ordinary E | difference q; q+1≡1; 2q+1≡1; fold map: H⁰ F_q→F_q² not onto, 2(q+1)−(q+1)=q+1≢0; ∅: Γ=0, 0 points; E: H¹≠0, p+1−a≢1 | Pass |
| §6.4 (iii) | Igusa surface, p=2 | translation trivial on H¹(O), [−1]=1 on H¹(O) in char 2; on H¹⊗H¹ of Witt cohomology [−1] acts by −1, invariants 0; free ℤ/p translation quotient: étale isogeny is zero on H¹(O) (dual kernel μ_p) | Pass |
| §6.5 WO-rational counts | quadric cone vs F₂ | q²+q+1 vs (q+1)², difference q | Pass |
| §6.6 Ax–Katz | F₉ ternary form; ℙ²(F₂), x₀²=x₁x₂; double line, line pair, x²−ay²; r=0; cubic in ℙ² | 81 = 9²; 3 points (0:1:0),(0:0:1),(1:1:1); q+1, 2q+1, 1; Σqʲ; p+1−a≢1 | Pass |
| §6.7 ample divisor | P¹, D a point | h⁰(ω)=h⁰(O(−1))=0; (1−t)⁻¹=(1−t)⁻¹·1 | Pass |
| §6.8 Bockstein | g=0; g=1 all i; E₁×E₂, char 2 | V^i injective on k; W_{i+1}(k)→W_i(k) onto; m^*(a₁∪a₂) component a₁⊗a₂ ± a₂⊗a₁ ≠ 0 | Pass |
| §6.9 theta | elliptic P vs 2P, P+Q; O(−P); dim 0 | h⁰=1, count 1=1; h⁰=2, counts 1 vs 2; ideal sheaf has h⁰=0 and is not ample; only the unit ideal, empty Θ, 0≡0 | Pass |
| §6.10 universal CH₀ | P¹ with x, y (deg 2); ∅; genus g ≥ 1; F_q→F_{q²} | deg(y−2x)=0, unweighted sum −1; ∅ has no cycle of nonzero degree; η−c₀ non-torsion over the closure of k(C) but torsion over F̄_p; π_*π^*[x]=2[x], [y]↦2[y] | Pass |
| §6.11–6.12 RCC | Pⁿ, cubic surface, cone, elliptic curve | lines join points; the cone is RCC though not WO-rational; E has no rational curves | Pass |
| §6.13 vanishing | Pⁿ, cubic surface | H^{>0}(WO)=0; H²_crys all slope 1 | Pass |
| §6.14 Esnault | y²=x³+x+1/F₅; y²=x³−x/F₃; Spec F_{q²}; ∅ | fibre counts (2,0,2,2,2)+∞ = 9 ≡ 4 (ordinary, a=−3); (1,1,1)+∞ = 4 ≡ 1 (supersingular, not a converse); 0 points, not geometrically connected; ∅ excluded | Pass |
| Lean `card_rationalPoints_modEq_of_cohomologyPullback_bijective` | X=Y, f=id; X=Y=∅; X=∅→Spec K | trivial; 0≡0; H⁰: K→0 not injective, excluded. K finite, so point sets finite (no `Nat.card` junk) | Pass |
| Lean `card_projectiveZeroLocus_modEq_one` | n=0 (forces r=0); r=0; F=0 with d ≥ 1; F₂ example | 1≡1; Σqʲ≡1; zero polynomial homogeneous of every degree, imposes nothing; 3≡1 mod 2. `x.rep` is any nonzero representative and homogeneity makes the test independent of it | Pass |
| Lean `card_dvd_card_solutions_of_sum_lt` | σ empty; s empty; f=x₀ over F₄ in 2 vars; constant | 0<0 false; q^{|σ|} with |σ| ≥ 1; 4 zeros, 4∣4; no zeros, 0 divisible | Pass |
| Lean `IsThetaDivisor` | see §6.9 | the dual, h⁰ = 1 and ampleness each exclude a wrong model; `finrank` junk 0 cannot give 1 | Pass |
| Lean `card_thetaDivisor_modEq` | E, P vs Q; dim 0 | 1≡1; 0≡0 | Pass |
| Lean `zeroCycleDegree` | P¹/F_q: [y]−2[x]; non-closed points | 2−2=0; finsum over finite support on quasi-compact X_L; residue degree 0 at non-closed points, but those are excluded by `cyclesOfDimension 0` (Tau Ceti dimension = height with x ≤ y ⟺ y ⤳ x, so dimension-0 points are closed) | Pass |
| Lean `UniversallyCH0Trivial` | Spec K; ∅; P¹; elliptic curve | true (Z₀=ℤ, deg=id); false (no nonzero-degree cycle); true; false (non-torsion kernel over L = closure of k(E)) | Pass |
| Lean `card_rationalPoints_modEq_one_of_universallyCH0Trivial` | Spec K; Pⁿ; Spec F_{q²}; ordinary E | 1≡1; Σqʲ≡1; not geometrically connected, excluded; hypothesis false, 9≢1 at F₅ | Pass |

Headline inventory: the statable headlines are §6.4 (ii), §6.6 (projective and affine), §6.9 and §6.14 (i), and all are stated. The non-statable ones are named in the docstring with the carrier each lacks: §§1.5–1.6, §3.6, §6.2, §6.3, §§4.1/4.5, §§5.4/5.6/5.12, §6.5, §6.4 (iii), §6.8, §6.13, §6.14 (ii) and §§6.11–6.12. Ax's criterion §6.3 in its arithmetic core mentions none of the roadmap's objects, so it is not a headline.

## Ownership against open pull requests

I checked by object (list above) with `roadmaps grep` over every open head and main, and read the scopes of the closest roadmaps:

- the parent CrystallineCohomology;
- PadicDifferentialEquationsAndRigidCohomology;
- ArcTopologyAndDescent (also from its checkout listed in the brief);
- AlgebraicModuliForArithmeticGeometryPartII;
- PCurvature;
- JacobianChallengePartII;
- AbelianVarietiesOverFiniteFields.

The other supplier heads were read through `roadmaps show`.

AlgebraicModuliForArithmeticGeometryPartII cites HW23 but owns numerical and Picard contraction theory, not Witt singularities. No roadmap other than this one owns the Witt objects or the congruences. This roadmap is the owner because the parent's Scope and ownership assigns this direction to it.

## Unresolved

- **Topics the parent hands to this roadmap but that have no owner.** The parent CrystallineCohomology (its Scope and ownership, "Not here") says convergent-coefficient descent and Cartier transforms of periodic connections are "the subject of CrystallineCohomologyPartII". This roadmap does not build them, as accepted at design, and now says so definitely. No other roadmap owns them:
  - PCurvature lists the Ogus–Vologodsky Cartier transform as out of scope;
  - PadicDifferentialEquationsAndRigidCohomology §RD.5.110 uses a Cartier-type Frobenius descent only inside one proof.

  The parent's sentence should drop those two topics or name another owner. That is an edit to the parent, not to this folder.
- **Conditional acceptance.** The review accepted conditionally on gap:qcqs-frobenius-factorization. SchemeAndStackFoundations §0.26 on main still covers only schemes of finite type over F_p (`frobenius_factors_through_universalHomeomorphism`), so the gap stands. The other three gap contracts also remain unprovided on main:
  - reduced-flattening-by-blowup: §4.12 is stated over integral bases;
  - quasi-coherent-kunneth: §2.6 has no Künneth formula;
  - admissible-invariant-quotient-gluing: §1.17 is for projective morphisms.

  They are kept as declared "What SchemeAndStackFoundations must provide" contracts, in the form roadmaps on main already use (FlagVarieties).
- **Uncertified sources.** Eke84, EkeII, Kol96, Tsu03, Tsu04, Ser58, Ax64 and BS83 remain cited by locator without text, as the accepted review settled.
- **No suspicious text.** No fetched or read text contained instructions.

Sources consulted on the web: secondary statements of the Ellingsrud–Skjelbred depth formula (Kemper's depth survey, https://www.math.cit.tum.de/fileadmin/w00ccg/algebra/people/kemper/Depth_FKS_03.pdf; https://arxiv.org/pdf/1907.06373, Remark 4.22). They confirm the form CR12 Remark 4.4.8 uses for cyclic p-groups (depth = min(dim V^G + 2, dim V)), so the §5.5 Check stays unchanged.


Pull request: #2265 (roadmap/crystalline-cohomology-part-ii at 8bd69be)
