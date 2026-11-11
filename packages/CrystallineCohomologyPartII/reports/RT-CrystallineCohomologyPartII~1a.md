<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13111#issuecomment-6789912332 -->
Red team round 1 pass a (codex) of 1b57030

Verdict: needs_changes

1. **F01** (P2) Ax's slope/divisibility criterion is absent from the acceptance test

   **Location:** `packages/CrystallineCohomologyPartII/README.md:1472`; `packages/CrystallineCohomologyPartII/Suggested.lean:21–54`. Claim: §6.3 proves the equivalence of power-sum divisibility and divisibility of all reciprocal roots and poles, explicitly advertised as “Ax's criterion” at README line 108.

   **Witness:** BBE07 lines 1475–1494 state the criterion. The Lean file contains no such theorem or explanation of its absence. Its arithmetic formulation uses native polynomials, power series, algebraic closures and `IsIntegral`.

   **Exact repair:** Add the §6.3 headline to the module docstring and state its arithmetic equivalence with `sorry`. One direct formulation takes coprime polynomials P,Q in ℤ[t] with P(0)=Q(0)=1, integers N_r with P/Q=exp(Σ_{r≥1} N_r t^r/r), and q=p^a with p prime, a≥1, κ≥1. State: q^(κr) divides N_r for every r≥1 iff every reciprocal root α of P or Q has α/q^κ integral over ℤ. Use the native polynomial/power-series carriers; the slope-factor restatement can remain prose. Do not substitute Chevalley–Warning or a numerical example.

   **Repair test:** P=1,Q=1−qt gives N_r=q^r and reciprocal pole q, so both sides hold at κ=1; Q=1−t gives N_r=1 and reciprocal pole 1, so both sides fail. P=Q=1 gives N_r=0 and an empty root set, so both sides hold.

2. **F02** (P3) The smooth matching-map citation points to the coskeleton result

   **Location:** `packages/CrystallineCohomologyPartII/README.md:789`, “smoothness … CT03, Proposition 11.2.5”.

   **Claim:** CT03 Proposition 11.2.5 supplies smoothness of the matching maps of the coskeletal product construction.

   **Witness:** CT03 lines 5340–5344 identify a coskeleton. Smoothness is Corollary 11.2.6, lines 5381–5394, printed p. 197. BBE07 lines 1271–1278 distinguish the coskeleton and smoothness references.

   **Exact repair:** “The coskeleton identity follows from CT03 Proposition 11.2.5, pp. 196–197; smoothness of the matching maps follows from CT03 Corollary 11.2.6, p. 197 (or Tsu04 §7.3.3, uncertified).” Add Corollary 11.2.6 to the existing CT03 manifest entry and reference bullet.

   **Repair test:** For a product of smooth factors, the matching map is projection onto a subset of factors; its omitted factors are smooth. The coskeleton identity alone makes no smoothness assertion.

3. **F03** (P3) Serre's subsection locator was read as two sections

   **Location:** `packages/CrystallineCohomologyPartII/README.md:1578,1586,1791`, “Ser58Top, sections 1 and 3”.

   **Claim:** The Bockstein input is located in sections 1 and 3 of Ser58Top.

   **Witness:** BBE07 line 1546 cites §1, no. 3. Ser58Top line 1127 starts no. 3, Bockstein operations, within §1; printed pp. 27–29 contain the operations and their exact-sequence characterization.

   **Exact repair:** Replace these occurrences and the Ser58Top manifest locator by “Ser58Top, §1, no. 3, pp. 27–29 (Bockstein operations); Ser58, Théorème 2 (abelian-variety vanishing, uncertified).” Keep the vanishing theorem attributed to Ser58, rather than treating the definitions in Ser58Top as its proof.

   **Repair test:** For an elliptic curve, the boundary out of H⁰(W_iO)=W_i(k) is zero because restriction from W_(i+1)(k) is onto. This is exactly the exact-sequence convention at Ser58Top lines 1135–1157.

4. **F04** (P2) A supported divisor class is identified with an unsupported Chern class

   **Location:** `packages/CrystallineCohomologyPartII/README.md:979`, “i.e. the first Chern class of O(D)”.

   **Claim:** The class of a principal divisor in H¹_D(X,WΩ¹) is the first Chern class of its line bundle.

   **Witness:** At length one, X=A¹, D={0}, the supported class dt/t is nonzero in k[t,t⁻¹]dt/k[t]dt. But O(D)≅O, so c₁(O(D))=0. CR12 lines 2537–2543 state the equality only after forgetting supports.

   **Exact repair:** “The supported class ĉl(D) is the boundary of d log[t]. Its image under H¹_D(X,WΩ¹) → H¹(X,WΩ¹) is c₁(O(D)); for a globally principal D this latter class is zero.” Make the same forget-support map explicit in the P¹ comparison at line 954.

   **Repair test:** On A¹, the residue of dt/t is 1, whereas its image in H¹(A¹,Ω¹)=0 is zero. On P¹ the supported rational-point class maps to c₁(O(1)) and has trace 1.

5. **F05** (P3) The nodal-cubic Check assumes a split node

   **Location:** `packages/CrystallineCohomologyPartII/README.md:631`, “P¹ ×_X P¹ = P¹ ⊔ two points”.

   **Claim:** The two off-diagonal points of the normalization's fibre product are two k-points for a nodal cubic over the standing perfect field k.

   **Witness:** Over F₃, the cubic y²z=x²(x−z) has a rational nonsplit node. Its two normalization branches are conjugate over F₉; the off-diagonal locus is Spec F₉, with zero F₃-points, rather than two copies of Spec F₃.

   **Exact repair:** Start this Check with “For a split nodal cubic X with rational node and two rational branches”. Add: “For a nonsplit rational node over F_q the off-diagonal locus is Spec F_(q²); after base change to F_(q²) it becomes two points.” Qualify the nodal-cubic Frobenius examples in §§2.6 and 3.6 similarly if K denotes the unit F-isocrystal rather than just a one-dimensional vector space.

   **Repair test:** The split fibre product has q+3 rational points; the nonsplit one has q+1. Both become P¹ ⊔ two points over F_(q²). In degree one the q-Frobenius eigenvalue is +1 for the split node and −1 for the nonsplit node; both slopes are zero.

6. **F06** (P3) The Ax reference names a nonexistent BBE proposition

   **Location:** `packages/CrystallineCohomologyPartII/README.md:1796`; `packages/CrystallineCohomologyPartII/sources.toml:346`, Ax64 locator, “BBE07 Proposition 6.1”.

   **Claim:** BBE07 Proposition 6.1 is the accessible secondary locator for Ax's criterion.

   **Witness:** BBE07 line 1426 starts numbered paragraph 6.1, defining slope factors; the criterion is Proposition 6.3 at lines 1475–1494. There is no Proposition 6.1 in this version.

   **Exact repair:** Replace “BBE07 Proposition 6.1” by “BBE07 Proposition 6.3, p. 35” in the reference bullet and the existing Ax64 manifest entry. Retain Ax64's settled uncertified status.

   **Repair test:** The replacement locator explicitly equates q^(κr)-divisibility of N_r with q^κ-divisibility of reciprocal roots and poles; Φ=(1−qt)⁻¹ has N_r=q^r and pole q.

7. **F07** (P2) The unstatable-headline inventory omits the correspondence and Bockstein theorems

   **Location:** `packages/CrystallineCohomologyPartII/Suggested.lean:41–54`; `packages/CrystallineCohomologyPartII/README.md:108,880,1021,1578`.

   **Claim:** The module docstring inventories the headline theorems that cannot yet be stated at the pins.

   **Witness:** Its four bullets omit Ekedahl self-duality (§4.1), the Hodge–Witt correspondence action (§4.5), and Serre's Bockstein vanishing (§6.8). None is stated in the file; each needs the missing de Rham–Witt sheaves.

   **Exact repair:** Add: “Ekedahl self-duality and the cycle-class/correspondence action on relative Hodge–Witt cohomology (§§4.1–4.6), and Serre's Bockstein vanishing (§6.8), are not statable: the pins lack de Rham–Witt sheaves, their dualizing systems and supported cohomology, and the Witt restriction/Verschiebung exact sequences on schemes.” Do not add replacement theorems about arbitrary complexes or scalars.

   **Repair test:** The required P¹ pairing uses H¹(P¹,WΩ¹), and the elliptic Bockstein uses H¹(E,W₂O_E). The native cohomology functor does not construct either coefficient sheaf; the proposed inventory names these missing carriers directly.

## Verified sound

Read the complete README (1,800 lines), complete Suggested.lean (164 lines), all **8 declarations** (5 theorems and 3 definitions), **59 numbered target blocks**, and **210 Check bullets**, including the five convention Checks. The tables below record computed tests; they are not claims to have formally proved the targets. The findings above identify the exceptions. All three Lean definitions are needed by retained headline theorems. None of the five theorems passes the one-tactic padding probe: the characteristic-only Chevalley–Warning theorem is strictly weaker than the q-divisibility target.

Compared all eight supplied elaborated signatures with the source and README. There are no section-variable blocks whose hypotheses silently disappear: the required field, finiteness, properness, smoothness and geometric-connectedness binders occur explicitly. No new elaboration or Lean build was run, as required by the read-only brief.

The changes at the reviewed head are confined to the package. The file has one Mathlib import, nine existing individual Tau Ceti imports, no sorry'd data, no `set_option`, no `lemma`, and no admitted example. The module's `public import` form agrees with the pinned module syntax. No algorithmic target or process instruction was found in the mathematical specification.

Dependency gate output:

```text
depcheck: 236 roadmaps, 2144 edges, 0 problem(s)
```

The declared `gap:qcqs-frobenius-factorization` has the same slug, supplier, hypotheses and conclusion in the README and plan. It requests finite finitely presented universal homeomorphisms of qcqs F_p-schemes; the finite-type supplier statement does not already cover it. The identities are tested by the identity/empty scheme with N=0 and by F_p(t)⊂F_p(t^(1/p)) with N=1. It is not a defect or an undeclared dependency.

### Lean declaration and context ledger

Names below are in `TauCetiRoadmap.CrystallineCohomologyPartII`; all declarations are in Layer 6. `q` denotes the cardinality of the finite field, so q≥2. Empty schemes and zero modules are allowed where stated; a zero ring is excluded by `Field`.

| Declaration; README section; retained context | Instances and computed values on the two sides | Result / change |
|---|---|---|
| `card_rationalPoints_modEq_of_cohomologyPullback_bijective`, line 74; §6.4(ii); K:Type u, Field, Finite; X,Y:Scheme u; πX,πY proper; f and f≫πY=πX; bijective pullback for every i | Identity: point counts equal and all pullbacks identity. Blowup of a smooth projective surface at a rational point: H^i(O) unchanged, counts differ by (q+1)−1=q. Fold P¹⊔P¹→P¹: H⁰ map a↦(a,a) not onto, counts differ by q+1≡1. Empty→point: H⁰ map K→0 not injective, counts 0 versus 1. | Positive and negative controls agree; no lost binder. |
| `card_projectiveZeroLocus_modEq_one`, line 90; §6.6; finite field; n,r:ℕ; homogeneous F_j of specified d_j≥1, sum d_j≤n | r=0,n=0: P⁰ has 1 point, residue 1. Double line, split line pair and nonsplit plane conic: q+1,2q+1,1, all residue 1. Zero polynomial assigned positive degree: all Pⁿ points, residue 1. Constant equation 1: zero points, but its degree 0 is excluded. Ordinary cubic in P²/F₅: 9≡4, degree 3>2 excluded. | Sound at n=0, p=2, nonreduced and redundant equations; representative choice does not affect homogeneous zeros. |
| `card_dvd_card_solutions_of_sum_lt`, line 102; §6.6; K,σ,ι independent universes; Field/Finite K, Finite σ; finite s; sum totalDegree<card σ | Empty s in m≥1 variables: q^m, divisible by q. σ empty: hypothesis 0<0 impossible. Nonzero constant equation: zero solutions, q divides 0. Zero polynomial: totalDegree=0, q^m solutions. Nondegenerate ternary quadratic over F₉: 81=9² zeros. | Sound, including totalDegree(0)=0; Mathlib only gives characteristic 3 in the F₉ example. |
| `IsThetaDivisor`, line 113; §6.9; arbitrary Field K:Type u; native AbelianVariety, ideal I; existential effective-Cartier instance; ample dual class and finrank H⁰=1 | Elliptic divisor P: I=O(−P), dual O(P), h⁰=1, true. Divisor 2P: h⁰=2, false. Dimension-zero abelian variety: unit ideal gives empty effective divisor, O ample and h⁰=1, true. Zero ideal on nonempty A is not effective Cartier. | Three discriminating cases; the dual has the correct sign. |
| `card_thetaDivisor_modEq`, line 124; §6.9; finite field, A and two ideals satisfying `IsThetaDivisor` | Elliptic case: 1≡1; dimension zero: 0≡0. Ample divisors 2P and P+Q have counts 1 and 2, unequal modulo q, but h⁰=2 excludes both. | Sound; arbitrary principal polarizations, not merely translates, are permitted. |
| `zeroCycleDegree`, line 134; §6.10; X:Scheme u, L:Type u, Field L, π and locally finite integral cycle; no properness in helper | On P¹, rational x has degree 1, degree-two closed y has degree 2, y−2x has degree 2−2=0; an unweighted sum would be −1. Zero cycle/empty support gives 0. A generic point of P¹ has infinite residue degree, hence the total helper returns 0 there, but it is not a zero-cycle. | Real body; consumers restrict to dimension-zero cycles on proper schemes, making support and residue degrees finite. |
| `UniversallyCH0Trivial`, line 142; §6.10; K:Type u Field; X:Scheme u and π proper; every L:Type u with Field/Algebra K L; induced locally-Noetherian instance | P¹_L: degree CH₀≅ℤ, nonzero class [x] degree 1, degree-zero classes vanish, N=1. Empty scheme: no nonzero-degree cycle, false. Spec F_(q²) over F_q: after algebraic closure two points give kernel ℤ, not torsion. Elliptic curve: over an algebraic closure of k(E), generic-point difference has infinite order, false; over F̄_p alone that test would be torsion. | Correct rational, rather than integral, CH₀ criterion. Fixed universe is sufficient since finite cycle/equivalence data descend to a small extension. |
| `card_rationalPoints_modEq_one_of_universallyCH0Trivial`, line 157; §6.14(i); K finite field; X over Spec K, projective, smooth, geometrically connected, universal CH₀ predicate | Pⁿ: 1+q+⋯+qⁿ≡1. E/F₅: y²=x³+x+1 has 2+0+2+2+2+1=9≡4, and fails CH₀ triviality. Supersingular E/F₃: y²=x³−x has 4≡1 but still fails CH₀ triviality, so no converse. Empty and Spec F_(q²) have zero rational points and fail geometric connectedness. | Sound; `ConnectedSpace` includes nonemptiness. |

The pertinent native definitions were checked at the pins: `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` supplies a semilinear automorphism without a finite-dimensionality assumption; `Mathlib/FieldTheory/ChevalleyWarning.lean:110` concludes p-divisibility; `Mathlib/RingTheory/PowerSeries/Exp.lean:50` and `Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean:53` supply the arithmetic carriers for R01. `TauCeti/AlgebraicGeometry/Cohomology/Pullback.lean:65` and `TauCeti/AlgebraicGeometry/Modules/Pullback/Basic.lean:211` give the actual pullback and unit-sheaf identification. `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` bundles a proper geometrically integral group scheme. `TauCeti/AlgebraicGeometry/Chow/Basic.lean:86,257` supplies cycles of a specified dimension and rational equivalence; it does not make every algebraic cycle a zero-cycle. `TauCeti/AlgebraicGeometry/ProjectiveSpectrum/ProjectiveOver.lean:57` supplies the projectivity hypothesis.

### README target and computed-instance ledger

Each row covers the named target, its defining construction and its displayed identities/API at the section's stated generality. The inherited hypotheses are prime p, perfect k of characteristic p, W=W(k), K=W[1/p]; Layers 4–5 additionally impose quasi-projectivity over the ground field. Cases inapplicable to a target (noncommutative groups for a Witt-ring identity, or a zero coefficient field) do not supply counterexamples.

| Target / context | Instances and computed values | Result / change |
|---|---|---|
| Conventions 1–12 | p=2: W₂(F₂)=ℤ/4, FV(1)=VF(1)=2, [1]=1. Over F₄, F=(σ,2σ), F²=(1,4), normalized slopes 0,1. P¹: even-degree determinant exponents −1, ζ=((1−t)(1−qt))⁻¹. Anisotropic binary quadratic: affine count 1, projective count 0, and 1+(q−1)·0=1. | Normalizations, signs, projective exclusion of zero and positive characteristic agree. |
| §0.1 Witt ideal sheaves; char-p scheme, coherent I in finite-type assertions | W₁I=I; I=0 gives 0, I=O gives WO. On F_p, inverse tower ℤ/pⁿ has lim ℤ_p and lim¹=0. In F_p[t], V(t)=(0,t) belongs to W₂I but [t] multiples have second coordinate divisible by t^p. | Distinguishes kernel Witt ideal from Teichmüller-generated ideal; n=0 gives zero truncated ring. |
| §0.2 Two rationalizations; Noetherian tensor-cohomology assertion | M=⊕ℤ/pⁿ: M⊗ℚ=0 but bounded-torsion quotient image≠0. At p=2, ℤ/3 is bounded integer torsion but not 2-primary. End(ℤ_p)⊗ℚ=ℚ_p; empty-space category is zero. | Quantifiers distinguish uniform exponent from elementwise torsion. |
| §0.3 Frobenius inversion | Perfect A: F bijective, colimit W(A). A=F_p[ε]/ε²: F kills the ε-part and colimit=ℤ_p; original W(A)≠ℤ_p. Empty scheme: zero complex. | Tests identity, nilpotent and zero objects. |
| §0.4 Nilpotents and radicals; bounded nilpotence where required | Dual numbers and double line give K and W(k[x])⊗ℚ after reduction. For A=F_p[t_i]/(t_i^(p^i)), F^N(t₁,t₂,…) retains a nonzero coordinate for i>N; no uniform F power kills the vector. | Nilpotence qualification prevents the unbounded-nilradical counterexample. |
| §0.5 Finite UH and connected fibres | F_p(t)⊂F_p(t^(1/p)): both composites of inclusion and p-th power are F, N=1. Identity/empty: N=0. Spec F_(q²)→Spec F_q: rational Witt dimensions 2 versus 1; geometric fibre has two points. | Both directions of connected-fibre criterion retain geometric connectedness. Declared qcqs gap accepted. |
| §0.6 Closed-cover Mayer–Vietoris | Crossing axes: H⁰ is W(k[x])_K×_K W(k[y])_K. Identical two-member cover: diagonal K→K², difference (a,b)↦a−b, kernel diagonal and cokernel 0. Empty member contributes 0. | Difference sign gives exactness; no new scalar restriction. |
| §0.7 Higher direct images; properness in fibre-dimension bound | Point: H^i=0 for i>0. Punctured A²→A² has fibre dimension 0 but class x⁻¹y⁻¹ survives in R¹O and in R¹WO; absolute dimension 2 still permits this H¹. | Properness is essential and is present; corrects the source's overgeneral bound. |
| §0.8 Proper finiteness and slopes | P¹: H¹(WO)=0 in both rationalizations. Ordinary E: rational H¹ dimension 1, slope 0; supersingular E: dimension 2, slopes 1/2,1/2. Point: dimension 1, slope 0. | Strict upper bound 1, not positivity of all slopes. |
| §1.1 Fppf descent | F_(p²)/F_p: tensor square splits into two copies, two maps (a,a) and (a,σa); equalizer W(F_p)=ℤ_p. Identity cover: totalization W(A). Empty scheme: 0. | Full descent agrees with equalizer in degree zero. |
| §1.2 Derived self-products; qcqs F_p-schemes | k⊗^L_(k[t])k has π₀=k,π₁=k. Witt π₁=∏k is killed by F and p; after inversion both complexes reduce to W(k). Flat two-factor case Tor>0=0; in three factors flatness of just the first leaves the other pair's π₁=k. | Derived inputs are owned by EnhancedDerivedSheaves; no classical base-change substitution. |
| §1.3 Blowup pushout; Noetherian affine base, sufficiently thickened centre | Principal nonzerodivisor J: blowup=id, B′=A×_(A/J)A/J=A. Blowup A² at origin: H⁰X=A, H⁰E=k and B′=A×_k k=A. Unit ideal: E=Z=∅, X=Y, B′=A; zero ideal: X=E=∅, Z=Y, B′=A. | Boundary constructions and maps retain the base. Ferrand's finite hypothesis is not asserted for E=P¹. |
| §1.4 Excision after F inversion | Closed cover gives the diagonal/difference sequence of §0.6. Base-changing the k[t]-module k with itself gives H^(−1)=k,H⁰=k, whereas the classical point has only H⁰=k. F-inverted Witt removes the extra homotopy. | The derived intermediate is necessary and supplied. |
| §1.5 h-descent; Noetherian finite-dimensional schemes | Closed two-branch cover: equalizer/fibre K→K²→K has degree-zero diagonal and no cokernel when the branches meet once. Split nodal normalization: degree-one kernel produces one K. Identity cover returns the input. | Blowup and fppf reductions agree with explicit descent. |
| §1.6 Rational h-descent | Apply p inversion to the preceding complexes: ℤ_p becomes ℚ_p, zero remains zero, and a single loop gives H¹=K. Empty cover is a cover only of ∅, whose value is 0. | No false descent from a non-cover. |
| §2.1 Witt ideal vanishing; proper f finite over complement | Blowup A²: R¹(I′^r)=⊕_(m≥0)H¹(P¹,O(m+r))=0 for r≥0. Cone on a canonically embedded genus≥3 curve: H¹(C,ω)=k survives for I′, while rational Witt ideal R¹=0. | The Witt assertion is stronger than ordinary-ideal vanishing; no illicit O-vanishing inference. |
| §2.2 Exceptional-locus reduction | Rational tree: vertex-edge incidence cokernel 0, H¹(E,WO)_K=0. Elliptic exceptional curve: H¹ dimension 1 ordinary, 2 supersingular, hence nonzero higher direct image. Empty exceptional locus: zero higher direct images. | The reduction distinguishes rational and elliptic singularities. |
| §2.3 Compact supports | A¹: K→K is identity, so all H_c^i=0. G_m: diagonal K→K² has cokernel K, giving H_c¹=K and others zero. Proper point: H_c⁰=K; empty: 0. Ordinary A¹ H⁰=W(k[t])⊗ℚ is infinite-dimensional. | Compact supports and ordinary cohomology cannot be interchanged. |
| §2.4 Compact-support finiteness/slopes | G_m has one slope-zero K in degree 1. A² has Witt H_c²=0, although rigid H_c⁴=K(−2) has slope 2. Point has degree-zero slope 0. | Witt degree bound dim and rigid bound 2dim are distinct. |
| §2.5 Smooth simplicial resolutions | Smooth X identity: every term smooth. Singular X identity: proper hypercover but terms not smooth. Split node fibre product P¹⊔Spec k⊔Spec k; nonsplit rational node gives P¹⊔Spec F_(q²). | R05 corrects the last comparison's split hypothesis. |
| §2.6 Truncated descent, q<N | Split node at N=1: C⁰=K,C¹=K³,d⁰=0, truncated H¹=K³. At N=2, d¹ imposes a=0,b+c=0, H¹=K. H⁰=K in both cases. | Strict range is necessary; N=0 asserts no nonnegative-degree isomorphism. |
| §3.1 Slope cutoffs | Rank zero: every part 0, polynomial 1. Rank one F=p^aσ: cutoff<1 is all iff integral a≤0. P¹ top class F=pσ excluded. Ordinary elliptic polynomial has one unit-root factor; supersingular has both slope-1/2 factors. | Exact cutoff, Tate sign and semilinear normalization agree. |
| §3.2 Tube/PD/Witt realization | Point: tube K→W(k)[1/p]=K is identity; empty: 0→0. For Z_p[t], φ(t)=t^p, ghost coordinates t^(p^i) give sφ(t)=[t]. On Spec F_p at n=2, p maps to p≠0, while augmentation sends it to 0. | PD step cannot be replaced by a rational map to O_X; p=2 retains the divided powers. |
| §3.3 Rigid-to-Witt map | Point: id_K; empty: 0. P¹: H² maps K(−1)→0. Ordinary E: H¹ maps a 2-dimensional space onto its slope-zero line, kernel dimension 1. | Full comparison is not an isomorphism before the slope cutoff. |
| §3.4 Simplicial embeddings | Constant point frame has identity matching maps. Product frame matching map drops smooth factors; relative tangent dimension is the sum of omitted factors' dimensions, zero when none omitted. | Construction works; R02 repairs the smoothness locator. |
| §3.5 Smooth proper comparison | P¹: degree 0 K↔K, degree 2 cutoff 0↔0. Abelian dimension g,p-rank f: dimension of slope<1 H¹ is 2g−f; g=0 gives 0, g=1 gives 1 or 2. | No ordinary-only or p>2 restriction. |
| §3.6 BBE comparison | P¹: (K,0,0) on slope<1 degrees 0,1,2 equals Witt values. Nodal curve: H¹ is one slope-zero line (F eigenvalue ±1 according to splitting). Supersingular E: dimension 2 on both sides. | No descent-degree finding: the full coskeleton is étale above U; §2.6 can be applied at one higher truncation to cover the desired degree. |
| §3.7 Smooth affine vanishing | Dimension-one A¹: all Witt compact cohomology 0; G_m: only degree 1 equals K. Dimension-zero point: only degree 0 equals K. | “Except dimension” permits zero even in that dimension. |
| §4.1 Canonical Witt system and duality | Point: W_nω=W_n(k), no shifts. Smooth P¹ at n=1: dualizing complex Ω¹[1] has cohomology in degree −1; the [−1] in μ restores degree 0. Trace of point class=1. Two planes meeting at a point are non-CM, with additional dualizing cohomology. | Canonical module cannot replace the whole dualizing complex on singular schemes. R07 concerns the acceptance-test inventory. |
| §4.2 Supported pushforward | P¹→point sends H¹(WΩ¹)=W to W by trace 1 and H⁰(WO) to 0. Relative Frobenius on A¹ has rank p and trace-pullback p; on a point rank 1 gives identity. | Shift (q,i)↦(q−r,i−r) agrees. The finite-map issue discussed during review is not retained: a shifted global Gysin class alone is not a counterexample to a sheaf-trace formula. |
| §4.3 Supported cycle classes | A¹,D=0: local class dt/t has residue 1; image in H¹(A¹,Ω¹)=0. P¹ point: ordinary class has trace 1. Empty support Chow group 0, a single point support Chow₀=ℤ. | R04 separates supported and unsupported classes. |
| §4.4 Proper correspondences | Structure graph A¹→point is not proper over target; transpose is proper over A¹. Finite flat degree d graph composed with transpose gives dΔ. Empty source has zero correspondences. | Direction of properness and composition are correct. |
| §4.5 Correspondence action | On P¹, P¹×{x} acts diag(0,1), {x}×P¹ acts diag(1,0) on H⁰(WO)⊕H¹(WΩ¹); sum=id. Finite flat degree d composite acts d·id. | Graph/transpose conventions agree with §4.4; R07 requests its missing docstring entry. |
| §4.6 Positive-codimension annihilation | Point→P¹ sends 1 to a nonzero degree-(1,1) class, whose WO projection is 0. On two points the component correspondence acts diag(1,0), not killed by any N>0, but its support has codimension 0. Empty support acts 0. | Degree-zero and positive-codimension hypotheses exclude both false strengthenings. |
| §5.1 Finite/topological quotients | For odd p, A²/{±1} has cover degree 2, prime to p. Smooth equidimensional X has identity cover degree 1. Spec k⊔A¹ has dimensions 0,1 and fails equidimensionality. Elliptic cone has nonzero rational Witt H¹, so is not a finite quotient. | Tame and general quotient classes remain distinct; no good-prime shortcut in the theory. |
| §5.2 Quasi-resolutions | Identity smooth integral: degree 1. Frobenius on dimension d: purely inseparable degree p^d, accepted. Separable degree-2 elliptic cover of P¹: rejected. Split nodal normalization has degree-1 function field but two points in one fibre, so is not a UH. | Function-field and fibre conditions are not conflated. |
| §5.3 Cover projectors/UH push-pull | Frob on Spec k⊔A¹ has component ranks (1,p), not constant p. Finite degree d cover gives projector e with e²=e after dividing by d; degree 1 gives identity. | Inverting p accommodates inseparable degree; components treated separately. |
| §5.4 Quasi-resolution of a topological quotient | Quadric cone resolution: exceptional P¹ has H¹(WO)_K=0; higher WO direct image vanishes. Relative Frobenius: pull-push p^d becomes invertible in the isogeny category. | General quotient theorem includes wild degree; tame examples are only Checks. |
| §5.5 WO/Witt-rational singularities | Smooth and quadric cone examples satisfy vanishing. Elliptic cone has H¹ dimension 1 or 2 and fails. Wild finite quotients can be non-CM while Witt-rational; rational singularities impose more. | “One quasi-resolution” versus “every” agrees by common domination; no CM implication asserted. |
| §5.6 UH invariance | Frobenius twist: cohomology is identified after p inversion, inverse p^(−d) times trace. Purely inseparable normalization of smooth scheme inherits the property. Identity degree 1 returns the same condition. | Both directions of UH invariance retain normality. |
| §5.7 Singularity complexes | Smooth S: WS₀=WO in degree 0, higher groups 0. Elliptic cone: H¹(WS₀)≠0; rational-tree exceptional fibre: H¹=0. Frobenius quasi-resolution comparison becomes invertible after p inversion. | Intrinsic complexes distinguish the two singularities. |
| §5.8 Quasi-birational invariance | Blowup of smooth integral X at a proper smooth centre: H^i(WO)_ℚ unchanged. Blowup centre=X: source empty, H⁰ changes from nonzero to 0 and surjectivity/quasi-resolution fails. Identity: equality. | Degenerate centre correctly excluded. |
| §5.9 Rational implies Witt-rational | Rational surface resolution: R^iO=R^iω=0 for i>0, inducing Witt vanishings. Nodal normalization is finite with higher O images 0 but f_*O≠O; its rational Witt H¹ drops K→0. | Normality/degree-zero direct image cannot be omitted. |
| §5.10 Isolated singularity criterion | Conic exceptional curve: higher Witt cohomology 0. Elliptic exceptional curve: dimension≥1. Nonsplit degree-two zero-dimensional Z has higher cohomology 0 but H⁰ dimension 2 versus base dimension 1, so geometric connectedness is essential. | Both degree-zero and positive-degree conditions are tested. |
| §5.11 Rational diagonal decomposition | P¹: Δ=pt×P¹+P¹×pt, N=1; for P^d the remaining terms have second factor in a hyperplane. Elliptic generic point over algebraic closure of k(E) has infinite-order class, so no rational CH₀-triviality. Dimension 0 point: Γ=0. | Rational clearing of denominators genuinely extends the supplier's integral fixed-support result. |
| §5.12 CH₀-trivial fibration | P¹→point: H⁰(Wω)=0, H¹(Wω)=W_ℚ; shifted RHS degrees −1,0 give 0,W_ℚ. Identity: r=0, H⁰(Wω)=Wω. Pⁿ-bundle: only R^nWω survives and equals base Wω with the stated grading shift. | The roadmap repairs CR12's unshifted formula; record the source error below, not a package defect. |
| §6.1 Witt zeta function | Point ζW=(1−t)⁻¹; P¹ same; A¹ and empty ζW=1. Ordinary E numerator has unit-root factor; supersingular E retains both reciprocal roots of slope 1/2. | Alternating exponent (−1)^(i+1) and strict cutoff tested. |
| §6.2 Zeta comparison | P¹ full ζ=((1−t)(1−qt))⁻¹, cutoff=(1−t)⁻¹=ζW. A¹ full ζ=(1−qt)⁻¹, cutoff=1=ζW. Empty gives 1=1. | Normalizations agree with §3.6 and rigid supplier. |
| §6.3 Ax criterion | Φ=(1−qt)⁻¹: N_r=q^r, α/q=1 integral, all four conditions true. Φ=(1−t)⁻¹: N_r=1, α/q=1/q nonintegral, all false. Φ=1: N_r=0, root set empty, all true. | R01 missing statable headline; R06 secondary locator. |
| §6.4 Cohomology and point counts | P¹ and two transverse P¹s have H⁰=K,H¹=0 and counts q+1,2q+1. Split nodal cubic has H¹(O)=K and q points, residue 0. Blowup difference q; fold-map difference q+1 fails bijective H⁰. Igusa involution: −1=+1 on characteristic-2 O-cohomology, but −1≠+1 on rational Witt H². | All four variants distinguish their actual coefficient theories. |
| §6.5 WO-rational point counts | Quadric cone: q²+q+1. Resolution F₂: (q+1)². Difference q, residue 1 on both. Identity difference 0; finite UH has identical rational points over perfect finite fields. | Proper quasi-birational/isogeny hypotheses give the stated congruence. |
| §6.6 Low-degree complete intersections | Plane conics give q+1,2q+1,1 including nonreduced and nonsplit cases. Empty equation list gives 1+q+⋯+qⁿ. F₉ ternary quadratic gives 81 affine zeros. Cubic curve with 9 points over F₅ violates degree≤n and congruence. | Same tests as Lean; scalar q rather than p matters. |
| §6.7 Ample divisor criterion | P¹,D=point: H⁰ω=H⁰ω(D)=0 and H¹O=0; ζ<1(P¹)=ζ<1(D)·1=(1−t)⁻¹. Dimension 0 empty divisor: U=X, same identity with the degree-zero determinant factor. | Top-degree shift and exponent agree; vacuous H¹ injection is only a boundary Check. |
| §6.8 Bockstein vanishing | Elliptic curve: W_(i+1)(k)→W_i(k) onto, connecting map=0, hence V^i injective on H¹. Supersingular characteristic 2: F on H¹O can be 0 while this V remains injective. Dimension 0: V^i:k→W_(i+1)k injective by Witt coordinates. | R03 repairs reference; R07 records absent acceptance-test inventory. |
| §6.9 Theta congruence | Elliptic θ,θ′ each one rational point: 1≡1. Dimension-zero θ=∅: 0≡0. Degree-two ample divisors 2P and P+Q have h⁰=2 and counts 1,2, so fail theta hypothesis. | Correct polarization generality, including dimension zero. |
| §6.10 Universal rational CH₀ | P¹: degrees 1 and 2, [y]−2[x] degree 0 and rationally zero. Empty: degree image 0, not ℚ. Two geometric points: degree kernel ℤ. Finite inseparable L′/L degree p: length-weighted pull-push is p, not number of geometric points 1. | Tests residue multiplicities, rational coefficients, and extension quantifier. |
| §6.11 RCC definition and base change | Pⁿ: lines join pairs; point: constant rational curve family gives dominance onto point×point. Elliptic curve: every rational curve map constant, pair map lies in diagonal and is not dominant. Projective elliptic cone: two lines through vertex connect pairs, but exceptional elliptic H¹≠0. | RCC alone does not imply WO-rationality. |
| §6.12 Smooth projective RCC implies CH₀ triviality | Pⁿ_L has CH₀=ℤ, rational degree isomorphism. Over algebraically closed L, a chain's consecutive differences are principal, so sum [x]−[y]=0. Finite-extension descent multiplies the difference by [L′:L], yielding torsion before tensoring. | Rational, not necessarily integral, conclusion over general L. |
| §6.13 CH₀-trivial Witt vanishing | Pⁿ: positive-degree Witt groups 0; crystalline H^(2j) has slope j≥1 for j>0. Point has no positive cohomology. Ordinary elliptic H¹ has slope 0 and fails CH₀ hypothesis. | No converse asserted. |
| §6.14 Esnault and degenerations | Pⁿ count≡1. Quadric cone and its rational resolution each count≡1. E/F₅ count 9≡4, E/F₃ supersingular count 4≡1 despite nontrivial CH₀. Empty and Spec F_(q²) count 0 but fail geometric connectedness. | Matches Lean and distinguishes necessary hypotheses from false converses. |

### Source-location ledger

The following **75 named source passages** were located and compared with their use here. The count treats the explicitly identified §3.2.1–3.2.3 cycle-class block as one passage, and counts repeated uses of the same passage only once. This is a locator/statement comparison, not certification of every proof in these papers. R02, R03 and R06 identify the incorrect locators; R04 identifies a claim whose support group differs from the source's group.

| Source | Located passages and extraction witnesses | Count |
|---|---|---:|
| BBE07 | Theorem 1.1; Corollaries 1.2–1.3; Theorem 1.4; Corollaries 1.5–1.6; Propositions 2.1–2.2; Corollary 2.3; Theorem 2.4; Proposition 2.10; Proposition 3.2; Lemma 5.1; Propositions 6.2–6.4; §6.5; Propositions 6.8–6.9. Witnesses: BBE07 lines 67,129,161,169,177,195,259,285,304,345,618,722,1207,1450,1475,1498,1534,1594,1637. | 19 |
| BS17 | Theorem 11.40, Proposition 11.41, Lemmas 11.43 and 11.45; BS17 lines 2387,2389,2403,2419. The proof's derived products and blowup pushout were also read at BS17 lines 2440–2482. | 4 |
| CR12 | Theorem 1.10.3; Propositions 2.3.3–2.3.4 and 2.4.1; §3.2.1–3.2.3; Theorem 3.3.10; Propositions 3.4.3,3.5.4,3.5.6; Lemmas 3.6.1–3.6.2; Proposition 3.7.7; Proposition 4.1.4; Theorem 4.3.3; Propositions 4.4.6,4.4.9,4.4.17,4.5.3; Theorems 4.5.6,4.7.4,4.8.1. Witnesses: CR12 lines 1424,1915,1928,1934,2537,2737,2802,3019,3066,3202,3242,3364,3496,3772,3950,3974,4065,4147,4213,4444,4544. | 21 |
| CR11 | Theorem 1.2.3, especially its same-dimension finite-map condition and supported cycle existence requirement; CR11 lines 558–581. | 1 |
| GNT19 | Remark 2.17; Lemmas 2.18,2.19,2.20,2.22; Proposition 2.23; Definition 4.5 and Remark 4.6; GNT19 lines 669,696,717,732,767,785,1298,1304. | 8 |
| NT20 | Remark 2.2, Lemmas 2.17–2.18; NT20 lines 275,650,677. | 3 |
| ESN03 | Theorem 1.1 and Corollaries 1.2–1.3; ESN03 lines 52,67,77. The original integral CH₀ condition is stronger than the roadmap's rational condition; the latter is justified through the roadmap's diagonal/correspondence route, not attributed verbatim to Esnault. | 3 |
| HW23 | v2 Corollary 4.6 and its proof; HW23 lines 953–978. This passage has p>5 and a log-resolution hypothesis; neither is presented here as an all-characteristic klt theorem. | 1 |
| Tan18 | Remark 5.3(1), Proposition A.4; Tan18 lines 763–769,1183–1198. | 2 |
| dJ97 | Theorem 5.9, Corollaries 5.10 and 5.15; dJ97 lines 645,699,798. Finite-dimensionality belongs to Theorem 5.9; Corollary 5.10 has its stated excellent-base generality. | 3 |
| dJ96 | Corollary 7.4; dJ96 lines 1459–1461. It includes a finite ground-field extension; the package's perfect-field construction uses the separately named plurinodal input. | 1 |
| Gro85 | II Définition 4.1.7, printed p. 50; Gro85 lines 1464–1498. | 1 |
| CT03 | Proposition 11.2.5 and Corollary 11.2.6; CT03 lines 5340–5344,5381–5394. | 2 |
| Del74 | (6.2.5), with the categorical conditions immediately before it; Del74 lines 538–572. The split simplicial construction is categorical, not restricted to complex schemes. | 1 |
| Ser58Top | §1 no. 3, Bockstein operations; Ser58Top lines 1127–1195. This verifies the corrected locator, not abelian Bockstein vanishing from Ser58. | 1 |
| EGAIII1 | Proposition 3.3.1 and Corollary 3.3.2; EGAIII1 lines 4409–4437. Proper, rather than merely projective, graded-cohomology finiteness is supplied. | 2 |
| Stacks | Tags 0FH6 and 02RH; Stacks lines 1074–1077 in the Weil-cohomology extraction, and Stacks lines 1156–1171 in the Chow-homology extraction fetched through the sources service. These are the same manifest source key. | 2 |

### Supplier and ownership ledger

Checked **14 cross-roadmap supplier groups**, including the Ferrand comparison in a Check, against main or the earlier new-roadmap head returned by the roadmap tools. Repeated citations are counted once per supplier here. The library matches and ownership searches were checked by object, including Witt sheaves/ideals, simplicial Witt vectors, derived fibre products, supported Chow groups, Bocksteins, rational diagonal decomposition and point-count congruences. No duplicate fully qualified name among the eight Lean declarations was found. The missing Ax acceptance theorem in R01 is not a theorem already supplied by the characteristic-only Chevalley–Warning result.

| Supplier / resolved section | Contract comparison and ownership outcome |
|---|---|
| CrystallineCohomology, §§CR.3:duality.1, CR.4.4, CR.4.6–CR.4.8 | Witt schemes, affine Witt ideals, Frobenius-lift map, smooth de Rham–Witt and slope decomposition stay with the parent. The trace heading says “proper smooth”, but its first numbered assertion explicitly needs only smooth pure dimension; using that assertion for nonproper smooth schemes is not drift. Local ideal-sheaf cohomology and the singular comparison remain this package's extension. |
| AbelianSchemesAndArithmeticModuli, §A2.4 | `ampleCohomologyAndDegree` explicitly has h⁰(L)=χ(L)>0 and deg φ_L=χ(L)² for ample L; dimension-zero value is 1. It supplies exactly the theta-definition equivalence. |
| AdicSpacesPartIII, §F0.6 | `graded-cohomology-finiteness`, `TauCetiRoadmap/AdicSpacesPartIII/README.md:3013`, has Noetherian base and proper morphism, including the Rees-module use needed for ideal vanishing. |
| ArcTopologyAndDescent, §§1.1,1.3,1.6 | At the supplied head, universal descent includes full Čech totalization and right cancellation; the h-site is finitely presented over a qcqs base. The package does not consume §1.4's separate abstract blowup criterion. |
| ClassicalAdicEtaleCohomology, §5.4 | Plurinodal alterations, finite-group control and the purely inseparable invariant function field are explicit, extending the ordinary alteration supplier. |
| DerivedDeRhamCohomology, §PD.6 | Both named PD-envelope targets exist; ordinary completed envelopes and derived completion are distinguished, with bounded p-torsion needed for the latter comparison. The tube construction uses the former and its compatible maps. |
| DerivedModuleAlgebra, former §1.T.1 | The main introduction explicitly preserves this locator and maps it to native `TauCeti.ModuleTower` limit/Milnor/Mittag–Leffler results. Its disappearance as an active heading is not supplier drift. |
| EnhancedDerivedSheaves, §§E1,E2,E2.8,E5:descent,E5:animation.1–3 | `moduleDescent`, bounded-below hypercover descent, `derivedSchemeBaseChange`, `simplicialWitt`, `wittFrobeniusLocalization` and `tot_filteredColimit_of_bounded` exist. Witnesses in `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`: lines 1809,1963,1965,1980,2319,2415,2427,2483. The bounds are uniform and the derived fibre products include iterates. |
| EtaleCohomologyFoundations, §G.2 | `nagataCompactification`, `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:107`, covers separated finite-type maps over qcqs bases. It is used as geometry, not as a Witt-cohomology theorem. |
| MotivesAndAlgebraicCycles, §§0.1,0.6,2.2 | Ordinary proper Chow correspondences, integral fixed-support diagonal decomposition, and smooth-projective field-extension control are owned here. The package states its rational diagonal extension and its general proper zero-cycle field-extension lemmas separately. |
| PadicDifferentialEquationsAndRigidCohomology, §§RD.3.1–3.2, RD.4.1,4.5,4.12,4.17–4.19,4.24,4.36–4.38; RD.5.67,5.73–5.74,5.77–5.78,5.89–5.90; RD.6.22–6.23,6.58; RD.7.4 | All these locators resolve. Read the actual compact-support, descent, smooth-proper comparison, duality and trace-formula hypotheses. Its semilinear Frobenius and linear q-th iterate agree with the package's φ=F^a; P¹ has slopes 0,1 and eigenvalues 1,q. The tube-to-PD map stays with this supplier. |
| PrismaticCohomology, §2.0 | The finite-presentation refinement of v-covers is explicit: quasi-compact open covering followed by a proper finitely presented surjection. The package imports this geometric statement, not prismatic cohomology as a substitute for Witt theory. |
| SchemeAndStackFoundations, §§0.20,0.23,0.26,0.29,2.6–2.7,2.18–2.21,4.9,4.12,4.14,4.16,4.19,5.1–5.5 | The geometric, duality and Chow inputs resolve, including `projectionFormula` at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4132`. Finite-type Frobenius factorization is at lines 1829–1831; the larger qcqs contract remains an explicit gap. The degree map weights residue degrees, consistent with the Lean helper. |
| NeronModelsAndSemistableAbelianVarietiesPartII, §1.1 | Ferrand data require the closed leg and the finite leg; the package explicitly excludes using that theorem for P¹→point. Its B′ construction is therefore not a duplicate claim of a general Ferrand pushout. |

The nearest supplied open heads were searched for overlapping objects, including ArcTopologyAndDescent, AlgebraicModuliForArithmeticGeometryPartII, EtaleDualityAndPerverseSheavesPartII, DeRhamCohomologyAndDuality, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, CohomologyComparisonsPartII and QWittVectors. The ownership searches separate the smooth parent theory, rigid cohomology, enhanced derived inputs and Chow operations from this package's singular Witt constructions. No ownership cycle was established. The overlap input reported no conflicting edit or dropped cited identifier.

## Not verifiable

- **Eight settled inaccessible sources:** Eke84, EkeII, Kol96, Tsu03, Ser58, Ax64, BS83 and Tsu04 remain uncertified at their existing manifest keys. They were not requested again. In particular the full abelian Bockstein proof in Ser58 and Kollár's RCC results were not certified from the primary texts. Readable BBE07, CR12 and ESN03 passages were compared where they quote or use these inputs.
- **HW23 published numbering:** the cached v2 verifies Corollary 4.6. The published Corollary 1.3 and pp. 19–20 are already explicitly cited as uncertified in the package; no claim is made here to have compared those pages.
- **Elaboration:** no Lean command was run. The eight provided elaborated signatures were inspected, not regenerated. The proposed new arithmetic theorem in R01 is supported by native carriers and the source, but its eventual Lean syntax still needs the repair worker's permitted elaboration check.
- **Proof completeness:** the statement tests do not certify the entire proof of every large source theorem. In particular the general shifted Wω comparison in §5.12 was checked against the source's shift bookkeeping and projective-bundle witnesses, not independently formalized. The source-location ledger is limited to its named passages; broad chapter citations are not blanket proof certification.
- **OCR-only apparent slips:** EGAIII1 line 4432 appears to cite Corollary 3.3.2 in its own proof, and line 4431 has an apparent equation-number slip. The underlying page image could not be inspected with the available local renderers. These are not asserted as source errata on extraction evidence alone.
- **Unlisted open work:** ownership was searched through the provided checkouts and roadmap index, with direct reading of relevant suppliers and close matches. Open work absent from those readable inputs was not checked; no claim is made to have read every unrelated open roadmap in full.

## Source issues

- **Misprint** in BBE07 at proof of Proposition 2.10, printed p. 17 (BBE07 line 662): the source says integral Frobenius gives positive slopes; it should be nonnegative slopes, since H⁰(Spec F_p) has slope zero; affects the proof.
- **Error** in GNT19 at Lemma 2.20, printed p. 16 (GNT19 lines 732–750): the source says higher Witt direct images vanish above fibre dimension for every finite-type morphism; it should be restricted to proper morphisms; punctured A²→A² has nonzero R¹ and zero-dimensional fibres; affects a stated result.
- **Misprint** in GNT19 at Proposition 2.23, printed p. 18 (GNT19 lines 785–788): the source says I is an ideal of O_X on Y, and places its zero locus in X; it should be an ideal on Y, pulled back to X in the vanishing statement; affects a stated result.
- **Misprint** in CR12 at Proposition 3.7.7, printed pp. 70–71 (CR12 lines 3364–3372): the source says RF and RF_ℚ are left derived functors of left-exact functors; it should be right derived functors; affects nothing.
- **Error** in CR12 at Theorem 4.8.1, printed p. 96 (CR12 lines 4544–4558): the source says positive Wω direct images equal the unshifted positive singularity-complex cohomology; it should retain the relative-dimension cohomological and Witt-grading shifts, including the degree-zero term on the base; affects a stated result.
- **Gap** in BS17 at proof of Proposition 11.41, printed p. 53 (BS17 lines 2470–2479): the source says the blowup square has a pushout finite universally homeomorphic to the base; it should construct that pushout and justify finiteness and universal homeomorphism after thickening, since the exceptional map need not be finite; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1b57030b727f5209c5a9c16d8166c4f25fd11302", "job": "RT-CrystallineCohomologyPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
