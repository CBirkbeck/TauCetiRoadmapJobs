<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1029#issuecomment-6393587681 -->
Review (codex) of eab6b37

Verdict: needs_changes

1. **F01** (P1) The normalization has a cyclic prerequisite

   **Location:** `packages/AutomorphicBundlesPartII/README.md:777`, “*Needs:* §1.3; §3.13; §7.0”; line 1361, “*Needs:* Layers 4–6”. The Layer 4 dependency summary at line 853 repeats §7.0.

   **Claim:** §4.1 needs §7.0, but §7.0 needs Layer 4, including §4.1. The advertised build therefore has a cycle even though the roadmap-level gate passes.

   **Witness:** The internal edges give §4.1 → §7.0 → §4.1, a directed cycle of length two. The second edge follows directly from the whole-Layer-4 requirement at README:1361.

   **Exact repair:** Move the elementary coefficient-character dictionary needed to state §4.1 into §1.3 or §4.1, using the parent coefficient definitions. Remove §7.0 from §4.1 and the Layer 4 dependency summary. Keep the archimedean, Galois and packet comparisons in §7.0 consuming the completed normalization. At weight (5,2), x=2, this early calculation already gives the untwisted scalar 128, multiplier twist 4⁻³=1/64 and normalized scalar 2. It needs no packet theorem. Recheck the internal section graph, in addition to the roadmap gate.

2. **F02** (P1) Two supplied derived-algebra results are cited at sections that do not supply them

   **Location:** `packages/AutomorphicBundlesPartII/README.md:79`, “finite hyper-Tor filtrations (§7.7), completion (§7.8)”; lines 698–704 repeatedly import derived object completion from the latter section. §2.5 cites only §§7.1–7.9 at line 431.

   **Claim:** These citations are presented as existing theorem contracts. At the current supplier head, §7.7 is about actions on strict towers and §7.8 is about completion of derived Hom, not the claimed spectral sequence or object-completion theorem.

   **Witness:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1475`, `:1491`, `:1525`: respectively strict-tower actions, finite derived Hom completion, and the coefficient spectral sequence with its filtration. The needed spectral-sequence section is §7.10.

   **Exact repair:** Cite §7.10 for the coefficient/hyper-Tor filtration, including §2.5 and dependency summaries. Import derived object completion from DerivedModuleAlgebra §§1.3–1.5 and effectivity from §1.E.1; retain SchemeAndStackFoundations §4.9 for proper formal functions. Reserve §7.8 for morphism completion. For the test complex O →ϖ O in degrees 0,1, reduction gives H⁰=k and H¹=k, whereas unreduced H⁰ is zero: §7.10 accounts for the extra Tor term. For A=k[x], I=(x), object completion is k[[x]], rather than a statement about Hom sets. These are exactly the two contracts the corrected citations must provide.

3. **F03** (P1) Su regularization is treated as supplied, but the cited theorem is different

   **Location:** `packages/AutomorphicBundlesPartII/README.md:1225`, “import the regularization quasi-isomorphism C∞_umg→C∞_dmg ... from AutomorphicSpectralTheory §5.2”; the analogous claim is at line 1209.

   **Claim:** The supplier provides the regularization and coefficient comparison for Su’s relative (p_o,K_o) cohomology. Its current §5.2 instead treats fixed weighted de Rham/distributional complexes and the full (m_G,K_∞) pair. It does not state the asserted inclusion theorem.

   **Witness:** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2745` specifies the full (m_G,K_∞) pair. Su24 line 1609 specifies (p_o,K_o). For trivial SL₂ coefficients, full relative H²=ℂ, whereas the parabolic relative H²=0.

   **Exact repair:** Add a precise supplier gap at AutomorphicSpectralTheory §5.2, in both the plan’s gaps and the README contract: under Su’s connected-group, central-splitness, neat-level and finite-dimensional holomorphic P_h-coefficient hypotheses, the inclusion C∞_umg(G)^K→C∞_dmg(G)^K induces isomorphisms on all (p_o,K_o)-cohomology, naturally in the coefficient and finite Hecke maps, including the V_o tower action. Cite Su24 Proposition 4.1, p. 38, and retain §6.2’s geometric Dolbeault construction here. Also cite the supplier’s §5.8 for uniform-moderate-growth Fin_J acyclicity; §5.7a only states acyclicity of the logarithmically weighted core. The repaired contract distinguishes the SL₂ complexes: the full quotient has dimension two, the parabolic quotient dimension one, so it cannot silently substitute one relative complex for the other.

4. **F04** (P2) The large-gap equality has no quantified bound

   **Location:** `packages/AutomorphicBundlesPartII/README.md:1532`, “the large-gap assumptions k_v−l_v>R and either l_v=2 or l_v>R give equality”; line 1538 lists §7.3 as a prerequisite.

   **Claim:** The equality uses an unspecified R. The R chosen in §7.3 is a local singular-family bound; it does not state the global, all-place large-weight theorem used here.

   **Witness:** BCGP21 line 3281 asserts existence of an absolute constant. AutomorphicFormsOnReductiveGroups §6.6 separates its global root-separation bound from its local singular bound. At R=3, (k,l)=(8,4) satisfies both written gaps but has a coroot pairing 2.

   **Exact repair:** State existence of the uniform large-gap constant before quantifying weights, occurrences and degrees, with the field, level and central normalization dependence exactly as in BCGP21 Theorem 3.10.1(2). Import the first, global assertion of AutomorphicFormsOnReductiveGroups §6.6 directly, distinguishing its R_sep from §7.3’s singular bound. Choose R_gap at least R_sep+2 when converting its separation predicate to elementary gaps. For R_sep=3, the revised threshold 5 excludes (8,4); an admitted weight (12,6) has pairings 7,11,15,4, all nonzero and greater than 3. Carry this quantifier into §8.9.

5. **F05** (P3) Two example statements use the wrong endpoint

   **Location:** `packages/AutomorphicBundlesPartII/README.md:807`, “Multiplication by ϖ^k is not injective on O/ϖ”; line 1170, “the length-two substitution ... gives degree-one vanishing”.

   **Claim:** The first assertion includes k=0 under §4.2’s k≥0 convention. The second describes the endpoint itself as vanishing although the theorem gives vanishing strictly above it; the same sentence has the analogous length-one wording.

   **Witness:** On 𝔽₃, multiplication by 3⁰ is identity with kernel 0; multiplication by 3 is zero. With d=3 and i>3, lengths one and two first give degrees 3 and 2, not 2 and 1.

   **Exact repair:** Restrict the nonuniqueness Check to k>0, retaining the separate k=0 identity Check. Replace the two phrases at line 1170 by “vanishing above degree two” and “vanishing above degree one”. These agree with the calculated kernels and with i−ℓ(w) at the first allowed i=4. Replace instruction-only Check bullets, such as line 577, by an actual positive and negative instance; for that example use the identity class 1↦1 and the ramified chart q=tᵖ, whose differential p t^(p−1) vanishes at t=0.

6. **F06** (P3) Two manifest entries point to the wrong layer

   **Location:** `packages/AutomorphicBundlesPartII/sources.toml:79` and `:170`, both “cited_for = ["Layer 7"]”, for Sch15 and BR16 respectively.

   **Claim:** The manifest identifies Layer 7 as the use site of both sources, while the README uses them in different layers.

   **Witness:** `packages/AutomorphicBundlesPartII/README.md:1313` cites Sch15 in §6.8; line 1492 cites BR16 in §8.5. Their target layer numbers are 6 and 8, not 7 and 7.

   **Exact repair:** Change only Sch15’s use-site metadata to §6.8 (or Layer 6) and BR16’s to §8.5 (or Layer 8), preserving each key and every recorded fetch/provenance field. The resulting use-site pairs are Sch15→6.8 and BR16→8.5, matching both actual citations. The reviewer has left the original manifest entries unchanged.

Six findings: three P1, one P2 and two P3. The mathematical scope is repairable. The eight declared supplier gaps are contracts, not findings. Authored package files were not changed.

The previous review and repair report were checked first. None of their findings was marked “not actionable in this package.” The following quotations are from the revised README; line numbers throughout this report refer to the files reviewed in this round.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01, unowned gaps | Repaired | README:89: “What LanglandsParameterStacks must provide (gap:integral-dual-weyl-lattices)”. All eight remaining slugs have named suppliers and identical contracts in the plan; the six unowned entries are gone. |
| F02, packet duplication | Repaired | README:1357: “import EndoscopicTransferAndUnitaryTraceComparison §11.1 under its `GSp4ClassificationInputs`”. The current supplier actually supplies the conditional general-type packet and multiplicity statement. |
| F03, B3.10 duplication | Repaired | README:171 says “Extend AutomorphicBundles B3.10’s good-prime torsor”; §1.2 imports B3.10 before extending it to the specified normalized models. The retained extension has additional integral transport obligations. |
| F04, base-linear API | Repaired | README:71: “Identify Hⁱ of the scalar-linear RΓ(X,F) in D(O) ... with Tau Ceti’s base-linear scheme-module cohomology”. Existing module structures and linear maps are now imported, and the native exterior-power carrier permits the new duality headline. |
| F05, combined lower-rank gap | Repaired | README:129: “every normalized classical cuspidal weight-one Hecke eigenform”; README:139: “every non-parallel algebraic Hilbert cusp eigenpacket”. The parallel Hilbert existence theorem is imported at line 137. |
| F06, logarithmic input | Repaired | README:145: “relative logarithmic vanishing of Lan–Suh Theorem 3.24”. Its lifting, dimension, residue and ampleness hypotheses are present; the BGG input has its own owner. |
| F07, mixed Satake gap | Repaired | README:101: “the four spin roots are α,β,uα,uβ” and “q³T₀=uD”. This is now a local coefficient-ring identity, with geometric realization owned elsewhere. |
| F08, general PEL vanishing | Repaired | README:944: “For every representation-small dominant weight”; lines 946–947 give both canonical and subcanonical ranges with the length shift. Checked against LanSuh line 2069. |
| F09, solid analytic ring | Repaired | README:449 specifies “(A,A)■”; CS19 Definition 9.1, Theorem 9.8 and Lecture XI support the discrete-base construction. The scheme six operations remain a construction here. |
| F10, old supplier locators | Repaired as listed | README:376 now cites “SchemeAndStackFoundations §§1.1, 2.23”; line 570 cites “AlgebraicModuliForArithmeticGeometry §7.5”. Fresh supplier drift found elsewhere is R02 and R03. |
| F11, coefficient-twist locator | Repaired | README:622 cites “Propositions 4.3.9 and 4.3.11, p. 48” and P20 §4.3.1. Read BP26 line 2481 and the subsequent proposition. |
| F12, Hecke labels | Repaired | README:763: “P20’s T_(ℓ,2), of similitude ℓ, is CG20’s T_(ℓ,1)”. The factors 1/8 and 1/64 at ℓ=2 agree. |
| F13, central sign | Repaired | README:1353: “The coefficient has central weight −w and π_∞ has weight w”. At the supplied nonzero-central example these cancel; the displayed CG20 orbit is explicitly assigned to the contragredient. |
| F14, APIs and Checks | Partly repaired | §§1.3 and 4.3 now have APIs and multiple computed Checks, including README:830: “X⁴−3X³+14X²−24X+64”. Two incorrect example statements remain; see R05. Instruction-only bullets also remain, for example README:577. |
| F15, style | Repaired as listed | The malformed proof-route sentences and old process qualifications are gone. README:1357 now states the actual conditional supplier hypotheses. Layer headings use “Hecke” and “Siegel”. |
| F16, flat coefficient generality | Repaired | README:384: “an A-module N flat over O” and “This allows infinite rank”. Its three controls include an infinite direct sum and the nonflat module O/ϖ. |

## Verified sound

The evidence includes 113 computed adversarial rows, fifteen seeded source checks, three elaborated declarations, and eight audited gaps. The README’s 1,603 lines, the 84-line Lean file, metadata, manifest and the plan’s gap list were read. The prior computed adversarial rows were used as a starting list only; the repaired statements, the fifteen seeded targets and the computations below were checked this round. No copied source passage, executable mathematical algorithm, admitted data definition, `set_option`, alternative import, `lemma`, or foreign fully qualified Lean declaration was found in the package. The introduction distinguishes the extension from AutomorphicBundles; its restored ownership boundaries are appropriate. Main-branch ComplexTori and LocalGaloisGroups were read for the repository’s prose shape.

**Pinned elaboration and signatures.** Mathlib is pinned to `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The required `lake env lean` command on `packages/AutomorphicBundlesPartII/Suggested.lean`, run from the content checkout using its absolute input path, exited 0. Its only diagnostic was the expected `sorry` warning at line 67. All four individual Tau Ceti imports had object files, so no prerequisite build was needed. One scratch elaboration with `#check @name` for all three declarations retained the explicit ring, universe, structural morphism, smooth relative dimension, properness, finite presentation, local freeness, irreducibility, completeness and positive-n binders. The definitions have no lost standing assumptions. The README and the elaborated signatures agree.

The sole admitted theorem was probed on a scratch copy with `simp`, `rfl` and `infer_instance`; none closed it. The existing curve-duality declaration has incompatible base and coefficient hypotheses, so it is not a one-lemma proof. There is no padding to delete. No Lean process started by this review remains running.

**Dependency gate output:**

    moved: AutomorphicBundlesPartII moved in the merge order from #178 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
    depcheck: 48 roadmaps, 556 edges, 0 problem(s)

There is no UPWARD or CYCLE line for roadmaps, and the permitted move is not a finding. R01 concerns internal section edges which that output does not certify. The citation resolver reported no missing names; R02 and R03 illustrate why resolving a section name is weaker than verifying its contract.

**Source sample.** All fifteen sampled locators were opened. Printed pagination was distinguished from extraction-page counters: for example BCGP21 extraction page 78 is printed p. 230, and CG18 extraction page 101 is printed p. 397. Statements below retain their declared supplier conditions.

| Seeded target | Locator read and support |
|---|---|
| 1.2 Integral dual-Weyl coefficients | BP26 §4.3.1, p. 46, line 2410: frame torsor, induced coefficient and canonical sheaf. The translation misprint is corrected in the README; the integral generalization is the named LP3.0 gap. |
| 2.2 Étale Galois projectivity | BP26 Lemma 2.6.11, p. 22, line 1124, including its trace-one proof; CG18 Lemma 7.7 and proof, pp. 397–398, line 4058. Finite étale descent works without inverting the group order. |
| 2.5 Derived coefficient/deck descent | CG18 §7.2, pp. 398–400; CG20 Theorem 7.11 proof, p. 53, line 2056. The README correctly retains the possible Tor₂ term and derives it from the homological spectral sequence. Supplier citation repair is R02. |
| 3.4 Fundamental class | P20 §4.3.1, p. 19, line 811; BCGP21 Definitions 3.9.1–3.9.2, p. 226, line 2881. Equal dimensions alone are expressly insufficient; perfect coefficients and the supplier’s boundary hypotheses are retained. |
| 3.6 Base change | BP26 §2.6.12, pp. 22–23, line 1132: the finite base change needs Tor independence and flat coefficient. The README’s broader derived statement imports coherent duality hypotheses and does not infer them from finiteness. |
| 4.3 Geometric generators/spin polynomial | BCGP21 §3.10, p. 236, and (2.4.8), line 1045; CG20 §5.5, p. 33, line 1320; P20 §5.3, p. 25, line 1084. The matrix similitudes and the coefficient polynomial agree with the current SR.4.5 convention. |
| 4.4 GAGA/tower | CG20 §5.3, pp. 24–25, line 1012; BP26 §1.1, p. 2. Proper coherent GAGA and characteristic-zero finite descent support the tower claim. Trace compatibility is separately declared as a gap. |
| 5.3 General PEL vanishing | LanSuh Corollary 7.24(1)–(2), p. 43, line 2069; Proposition 7.21, pp. 41–42, line 2012; Theorem 7.22, p. 42, line 2042. Both signs, length shifts, representation-smallness and self-conjugate-rank restriction are present. |
| 5.11 Cousin injection | BCGP21 Lemma 3.9.12, p. 230, line 3057. The README supplies the boundary non-zero-divisor obligation instead of promoting a termwise injection to cohomological injectivity. |
| 5.12 Cousin Hecke maps | BCGP21 Lemma 3.9.13 and Remark 3.9.14, p. 231, line 3070; proof continues to p. 232, line 3101. Regular pullback, cofinal powers, support preservation and differential compatibility are the actual inputs. The README’s pp. 230–231 locator includes the statement but not the whole proof. |
| 6.3 Su comparison | Su24 Proposition 4.1, p. 38, line 1609; Theorem 5.7, p. 55, line 2456; central assumption at line 260. The conclusion and V_o tower modification are supported. The supplier route has R03. |
| 7.2 Singular ranges | CG20 discussion after Theorem 5.6, p. 30, line 1215. Recomputed all three shifted walls, including (2,1); the claim is about the tempered image, not all canonical cohomology. |
| 8.2 Boundary over Q | CG20 Lemma 7.10, pp. 52–53, line 2021: all weights, prime-to-p levels and all degrees. Reducible lower-rank boundary systems are excluded by the stated irreducible residual witness. |
| 8.8 Localized cusp sum | BCGP21 Theorem 3.10.1, pp. 236–237, line 3269; proof pp. 239–240, line 3380. Multiplicity spaces, degree-zero equality and degree-one injection are supported; the large-gap constant needs R04. |
| 8.9 Dimension equality | BCGP21 Corollary 3.10.5, p. 237, line 3302; CG20 Theorem 7.11 proof, pp. 54–55; P20 Proposition 15.2.4.1, p. 109, line 4986. The packet pairing remains conditional on the identified earlier supplier. |

Additional changed inputs read were CS19 Definition 9.1, Theorem 9.8 and Lecture XI (lines 2318, 2449, 2772, 2820, 2856), LanSuh Theorem 3.24 (line 986), BP26 Propositions 4.3.9 and 4.3.11 (line 2481 onward), and the Lan17/LanSuh errata. No new source key was required and no recorded manifest entry was altered.

**Adversarial mathematics.** The following are computed instances, not proofs of general theorems. They test the statements, API laws and plausible wrong models. “Retain” means the tested identity or implication survives with its written hypotheses; unresolved contracts are identified separately. Degree conventions are cohomological unless explicitly labelled homological. Here k is a residue field, A₂=ℤ/9 when a numerical ring is useful, and P is the order-three permutation matrix sending e₁ to e₂ to e₃ to e₁.

| Statement | Instances tried | Values on the two sides / wrong model | Result and change |
|---|---|---|---|
| Conventions: coefficient quotient | O=ℤ₃, n=0,1,2 | O/(3⁰)=0; O/(3)=𝔽₃; O/(9)=ℤ/9 with 3≠0 and 3²=0 | Retain; headline excludes n=0. |
| Conventions: Matlis identification | O=ℤ₃, n=2 | 1 mod 9 maps to 1/9 mod ℤ₃; annihilator on both sides is (9) | Retain chosen uniformizer dependence. |
| Conventions: relative dimensions and universes | Empty X; Spec A₂; finite index set of size 0,1,2 | Empty cohomology 0; point H⁰=A₂, H¹=0; free ranks 0,1,2 | Empty objects harmless; no nonemptiness or finite-rank conclusion hidden in a carrier. |
| Conventions: Frobenius and dual | Matrix diag(2,3) | Arithmetic evaluation has polynomial X²−5X+6; fixed representation at inverse Frobenius gives X²−5X/6+1/6; dual plus inverse Frobenius restores X²−5X+6 | Retain dual transport, including Hilbert supplier’s convention. |
| 1.1 Torsor | O=ℤ₅, g=1, ψ₁=2, c=3; independent ψ₂=2 | Required ψ₂=3/2 and ψ₁ψ₂=3; wrong ψ₂ gives product 4 | Retain; multiplier fixes wrong model. |
| 1.1 Zero-rank and frame functoriality | g=0; successive scalings 2,3 | Rank-zero frames are unique but c varies in Gₘ; successive scaling 6 gives ψ₂=c/6 both ways | Retain extension from parent torsor. |
| 1.2 Induced dual-Weyl convention | m′=1, m=P, f(m)=m₂₁ | Identity translation gives f(P)=1; reversed source formula gives f(P⁻¹)=0 | Corrected convention retained. |
| 1.2 Right B law and noncommutativity | Upper triangular b, P and a transposition Q | (Pb)₂₁=P₂₁b₁₁=b₁₁; L_P L_Q f(m)=f(Q⁻¹P⁻¹m)=L_PQ f(m), whereas QP≠PQ | Retain order and commuting left/right actions. |
| 1.2 Integral lattice distinction | Weight 0; degree 2 in characteristic 2 | Weight 0 yields O and I_D; (x+y)²=x²+y² in Sym², while γ₂(x+y)=γ₂(x)+γ₁(x)γ₁(y)+γ₂(y) | Integral Weyl/dual-Weyl gap is necessary; no factorial inversion. |
| 1.3 Weight dictionary | (a,b)=(1,0),(1,1),(0,0); (k,r)=(0,2) | Ranks 2,1,1; Ω^(0,2)=ω(2,2)=det², not ω(0,2) | Retain. |
| 1.3 Dual and multiplier | Hodge weight ((1,0);−1) | Dual weight ((0,−1);1); central determinant and multiplier exponents change sign | Retain; excludes unchanged multiplier on dualization. |
| 1.4 Derived coherent complexes | Spec O, D=∅; C=[O →ϖ O] in degrees 0,1 | RΓ=O[0] at point; H(C)=(0,k), H(C⊗ᴸk)=(k,k) | Retain derived coefficient change, not H⁰ base change. |
| 1.4 Boundary-arrow API | D=∅; maps ×2 then ×3; zero coefficient | Boundary map=id; composite ×6 on both complexes; zero gives zero | Retain source, target and naturality. |
| 1.4 Equivariant perfectness | Trivial k[C₂]-module, char 2 | Underlying k-dimension 1; Tor_j(k,k)=k for every j≥0 over k[C₂] | Retain distinct notions of perfectness. |
| dvrCoefficientRing | n=2→1, n=3→2→1 | 3 mod 9 maps to 0 mod 3; both reduction composites kill 3 and send 1 to 1 | Native quotient definition has real body. |
| integerCoherentCohomology | Spec A₂, i=−1,0,1; F=0 | Values 0,A₂,0; for F=0 all are 0. Naive i.toNat at −1 would give A₂ | Negative branch is needed. |
| integer cohomology coefficient maps | ×3 at i=0,−1 | At i=0, 1↦3 mod 9; at i=−1 sole map 0→0 | No section variable lost. |
| 1.5 Matlis coherent homology | Spec O; zero module; ramified O=ℤ₃[ϖ], ϖ²=3 | H₀(A₂)=A₂; D_O(0)=0; different=(2ϖ)=(ϖ), trace-dual lattice=ϖ⁻¹O≠O | Retain E/O dual and ramification warning. |
| 1.5 Covariant action | P on a rank-three finite free coefficient | Dual action P⁻ᵗ, double dual P; P⁻¹e₂=e₁ | Covariance requires the declared inverse/transpose, not the same matrix on both slots. |
| 1.6 Finite Serre duality | X=ℙ¹ over A₂, F=O(2), d=1 | i=0: dual H⁰(O(−4))=0=H¹(O(2)); i=1: dual H¹(O(−4))=A₂³=H⁰(O(2)) | Headline survives a nonzero positive-degree example. |
| 1.6 Integer endpoints and trace | Same X, i=−1,2; genus-one curve over k | Both duality sides 0 at endpoints; genus-one RΓ(ω)[1] has H⁻¹=k,H⁰=k, unlike k[0] | Correct non-equivalence of trace and total complex. |
| 1.6 General coefficient characteristic | k[[t]]/(t²), ramified DVR quotient, n=1 | Socle generated by t, ϖ,1 respectively; Hom_A(A,A)=A and Hom_A(k,A)=socle≅k | Equal/mixed characteristic and nonreduced base allowed; no ℤ_p-only dual. |
| 2.1 Čech model | Trivial C₂-torsor over Spec A₂; trivial group | C⁰=A₂²=A₂[C₂], higher terms 0 for one-open cover; Δ=1 gives A₂ | Invariants have rank 1 and lose the upstairs object. |
| 2.1 Refinement/empty model | Repeated identity affine cover; empty scheme | Augmented Čech differential on two opens is (a,b)↦b−a, H⁰=A₂,H¹=0; empty complex 0 | Retain cover comparison. |
| 2.2 Projectivity without averaging | Trivial S₃-torsor over 𝔽₂ | O(Y)=k⁶≅k[S₃], rank 1 over the group algebra; group order 6=0 in k; invariant dimension 1 | Works for a nonabelian group without dividing by 6. |
| 2.3 Infinite-rank freeness | N=O, N=⊕ℕO; Δ=C₃ | Reductions A₂[C₂] and ⊕ℕA₂[C₂], ranks 1 and countably infinite | Full source generality retained. |
| 2.3 Flatness negative control | Δ=1, N=k, n=2 | k has length 1 over A₂; a nonzero free A₂-module has length at least 2 | Nonflat N correctly excluded. |
| 2.4 Finite perfect realization | Trivial torsor over a point; affine polynomial chart | Point model A₂[Δ][0]; chart Čech term A₂[x] has countably infinite A₂-rank | Finite realization is additional to a bounded Čech presentation. |
| 2.4 Dual realization | Point Δ=C₃, permutation P | Model dual is A₂³ with P⁻ᵗ; evaluation has ⟨Pe₁,P⁻ᵗe₁⟩=1 | Retain dual coefficient and action. |
| 2.5 Coefficient reduction | Free A₂[C₃] in degree 0, reduce to 𝔽₃ | Tensor gives 𝔽₃[C₃], higher Tor=0 | Retain perfect base change. |
| 2.5 Deck descent | Regular k[C₂] and trivial k, char 2 | Regular module coinvariants k, higher Tor=0; trivial module Tor_j=k for all j | Five-term sequence must retain Tor₂; R02 supplies the missing cited filtration. |
| 3.0a Discrete solid ring | A=𝔽₂, ℤ/9, k[x] | Characteristic 2 remains 2=0; ℤ/9 retains 3≠0,3²=0; k[x] retains x as a nonunit | (A,A)■ distinguishes the intended analytic ring from an unspecified integer-solid spectrum. |
| 3.0a Completion/support distinction | k[x], I=(x); I=0,1 | Completion k[[x]], local H¹=k[x,x⁻¹]/k[x]; I=0 gives completed X=X, I=1 gives empty completion | Distinct objects and both endpoints retained. |
| 3.0a Derived coefficient compatibility | C=[ℤ →2 ℤ] | C⊗ᴸ𝔽₂ has 𝔽₂ in degrees 0,1; reducing H⁰(C)=0 loses one copy | Retain derived comparison. |
| 3.0b p-level spans | Identity; multiplication by p; q=tᵖ | Scalars 1,p,p⁻¹; derivative p t^(p−1), zero at t=0 for p>1 | Rational isogeny inverse is not an integral lattice map. |
| 3.1 Correspondence and adjunction | Both legs identity, F=G=A₂ | Hom(F,G)=A₂; coefficient ×2 gives 1↦2, zero gives 1↦0 | Declared source/target determine the operation. |
| 3.2 Global map and trace | Degree-two split cover, coefficient 1 | Pullback 1↦(1,1), trace (1,1)↦2; unit cover gives 1 | Excludes zero or rescaled trace. |
| 3.2 Additivity/connecting maps | Scalar maps ×2,×3; coefficient short exact sequence | Sum ×5, composite ×6; δ(2x)=2δ(x) | Base-linear functor and boundary naturality, not just additive maps. |
| 3.3 Composition | Two then three split sheets | Trace of pullback multiplies by 2·3=6; six-sheet composite also ×6 | Retain composition and order. |
| 3.4 Fundamental class | Identity; split finite étale cover of degree 2 | Class at identity sends 1↦1; adjoint trace sends (a,b)↦a+b, so 1↦2 | Retain imported class, not an arbitrary zero arrow. |
| 3.4 Boundary control | p₁=id, p₂ constantly 0 on {0,1}, boundary {1} | p₁⁻¹D={1}, p₂⁻¹D=∅ | Boundary compatibility hypothesis rejects this span. |
| 3.5 Tensor and coinvariants | M=A, regular k[C₂], trivial k in char 2 | T⊗1=T; regular coinvariants k, higher Tor 0; trivial coinvariants have Tor₁=Tor₂=k | Retain flatness condition for ordinary tensors. |
| 3.6 Base change | ℤ→𝔽₂ with coefficient 𝔽₂; flat ℤ→ℚ | Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂; Tor₁^ℤ(−,ℚ)=0 | Finite alone is insufficient; derived/flat hypotheses matter. |
| 3.7 Coefficient twist | Identity correspondence, transport u=2 or 0; two twists 2,3 | Operator ×2 or 0; successive twists ×6=(2·3)×id | Correct coefficient direction and multiplicativity. |
| 3.8 Rational transport | Hodge line O with isogeny [p] | Lattice map 1↦p; inverse 1↦1/p lies in E, not O | Retain rational domain. |
| 3.9 Transpose and duality | P on A₂³ | Pᵗ=P⁻¹≠P; ⟨Pe₁,e₂⟩=1=⟨e₁,P⁻¹e₂⟩ | Explicit inverse fixes transpose convention. |
| 3.10 Contracted supports | p₁=id, p₂=0 on {0,1} | Z={0}: {0}⊆{0,1}; Z={1}: {1}⊄∅; Z=∅,X both satisfy inclusion | Both orientations and endpoints tested. |
| 3.10 Scheme versus set | Frobenius on 𝔽_p[x], Z=V(x) | Supports of (x) and (xᵖ) equal; ideals (x)≠(xᵖ) | Retain set-theoretic convention. |
| 3.11 Formal completion | k[x]/(xⁿ), n=1,2,… | Limit k[[x]]; compatible tuple of constant 1 is 1; tuple x survives in limit | Mathematical formula sound; object supplier corrected in R02. |
| 3.12 Filtration spectral sequence | Single stratum Z₀=X; empty filtration | E₁^(0,t)=H^t(X,F), every other column 0; empty object gives zero on every page | Retain convergence and compact-support distinction. |
| 3.12 Equivariance | T=×2 on the one-stratum model | Page-one map ×2, abutment map ×2; zero map stays zero | Retain natural triangles and filtration action. |
| 3.13 Hecke action | Unit coset; central x=2 at weights (4,2),(5,2) | Operators 1,1,2 after normalization | Retain; normalized convention passes through §4.1. |
| 3.13 Integral detection | Perfect O-complex representing k[0] | Integral identity acts as 1 on k; after tensoring E the object and both identity/zero maps are 0 | Equality after inversion cannot prove integral equality. |
| Layer 4 K-projective lift | A[0], A projective | Hom in homotopy and derived categories both A; maps ×2 and ×3 remain distinct when 2≠3 | Pinned bijection applies; no strict simultaneous algebra action follows. |
| 4.1 Normalization | ℓ=2, similitudes 2,4; scalar x=2 at (5,2) | Factors 1/8,1/64; 128·1/64=2; inverse twist would give 8192 | Arithmetic correct; internal cycle R01. |
| 4.2 Integral division | T=ϖ² id on O | Unique U=id; after tensoring E, ϖ⁻²T=id | Retain torsion-free uniqueness. |
| 4.2 Torsion endpoint | O/ϖ, k=0,1 | Multipliers 1 and 0; kernels 0 and whole residue field | R05: noninjectivity needs k>0. |
| 4.3 Generator matrices | Parameter x=2 | Two symplectic diagonal products equal 4,2,4 respectively | Retain similitudes x²,x,x². |
| 4.3 Spin polynomial | q=2, (T₀,T₁,T₂)=(1,3,2) | Monic coefficients (1,−3,14,−24,64); reciprocal coefficients (1,−3,14,−24,64) in ascending order | e₃=8·3=24 and e₄=8²=64; retain polynomial direction. |
| 4.3 Formal q=1 | (T₀,T₁,T₂)=(1,4,4) | X⁴−4X³+6X²−4X+1=(X−1)⁴ | Formal specialization only, not a finite field of size 1. |
| 4.4 GAGA | ℙ¹_ℂ, O; proper dual-number point | Algebraic/analytic H⁰=ℂ,H¹=0; both dual-point H⁰=ℂ[ε]/ε² retain ε≠0 | Retain proper and nonreduced cases. |
| 4.4 Invariants | C₂ acts on 𝔽₂² by a unipotent shear | Invariant line dimension 1; quotient invariant generator has no invariant lift; over ℚ averaging (1+σ)/2 exists | No integral exact-invariants shortcut. |
| 5.0 Models and quotient | F=ℚ; t↦−t; p=3,2 | Dimensions 3, boundary 2, minimal boundary ≤1; fixed point t=0; e²=e for e=(1+σ)/2 over 𝔽₃, denominator impossible over 𝔽₂ | Retain compactified descent and order condition. |
| 5.0 EO geometry | g=2, F=ℚ | Four Kostant representatives have lengths 0,1,2,3; nonempty codimension 4 impossible in dimension 3 | Retain owned geometric construction. |
| 5.0 Thickening and affineness | k[x,y]/(x²); ℙ¹ over a point | Quotient dimension 1, Koszul homology only degree 0; H⁰(ℙ¹,O)=k but ℙ¹ not affine | Relative vanishing is necessary. |
| 5.0 Boundary regularity | y on k[x,y]/(x²); y on k[x,y]/(xy,x²) | First multiplication kernel 0; second kills nonzero x; localization kills x only in second model | Retain CM/associated-component hypothesis. |
| 5.1 Canonical/subcanonical | Toric ray and empty boundary | Exponents ℕ versus positive integers; coefficients 1 allowed canonically and excluded subcanonically; empty boundary gives equality | Retain formal coefficient distinction. |
| 5.2 Relative vanishing | n=0, subcanonical versus canonical coefficient | Subcanonical term is I_D, canonical O; multiplying by O(−0D′) changes neither | Retain subcanonical condition at n=0. |
| 5.3 General PEL ranges | d=3, μ=0, t=1,2, lengths 1,2,3 | Weights (3,1),(4,2),(4,4) and (4,2),(5,3),(5,5); subcanonical first vanishing degrees 3,2,1 | Both source assertions and shifts retained. |
| 5.3 Canonical sign and positivity | ℓ=0; t=0 | Canonical range i<3, subcanonical range i>3; at t=0 positive line condition fails | No vanishing inferred from missing positivity. |
| 5.4 Length-one range | p=7,(4,2), t=2 | α=β=0, α+β=0<4; first allowed i−1=3 | Retain vanishing above 2. |
| 5.5 Length-two range | p=7,(4,2), t=1 | α=β=0; a+b=6, first allowed i−2=2 | Retain endpoint a+b=6; R05 corrects example wording. |
| 5.6 Length-three range | p=7,(4,4), t=1 | α=β=0; first allowed i−3=1; b=3 would give t=0 | Retain vanishing above 0 and positivity. |
| 5.4–5.6 Range substitutions | −8≤a,b≤20; p=2,3,5,7,11 | Admitted counts by length: (0,0,0),(0,0,0),(36,33,33),(72,64,62),(144,120,108); 672 reconstructed weights equal (a,b), zero failed dominance/smallness tests | Finite arithmetic probe supports exact substitutions, not the geometric theorem. |
| 5.7 Serre dual coefficient | (a,b)=(4,2) | (3−b,3−a)=(1,−1); applying twice gives (4,2); exponent a−b=2 remains 2 | Retain boundary twist and small integral range. |
| 5.7 Symmetric/divided power | Rank 2, degree 2, characteristic 2 | Cross coefficient in ordinary square is 0; divided square cross coefficient 1 | Retain smallness or characteristic-zero hypothesis. |
| 5.8 Singular mod-p ranges | p=5,a=4; p=5,a=3 | (4,2) has a+b=6, a−b=2; (3,0) is self-dual and has difference 3≤p−2=3 | H²_sub,H³_sub=0 in first; H⁰_can,H³_sub=0 in second. |
| 5.9 Twists and surjectivity | Bounds at two fixed levels 2 and 5 | Common N=max(2,5)=5; H¹(k)=0 gives H¹(O)/ϖ=0 and finite Nakayama H¹(O)=0 | Both reduction cokernels zero; no uniformity over unbounded levels. |
| 5.10 Cousin resolution | Regular parameter x in k[x], then codimension 3 chart | H¹_(x)=k[x,x⁻¹]/k[x], H⁰_(x)=0; length-three regular Koszul Ext concentrated in degree 3 | Retain MCM and acyclicity inputs. |
| 5.11 Interior injection | k[x,y]/(x²), boundary y; non-CM negative model above | Localization at y injects in first case; sends nonzero x to 0 in second | Termwise claim survives its stated hypothesis. |
| 5.12 EO Hecke transport | Identity; replacement x by unit·x, cofinal powers xⁿ | Pulled support ideals coincide; (u x)ⁿ generates (xⁿ); identity induces identity on Ext and incidence maps | Preserve regular sequences and cofinal maps, not just supports. |
| 5.13 Integral convolution and quotient | Unit coset; C₂ quotient in char 2 | Unit acts 1; invariant vector 1+σ lies in augmentation ideal since 1+1=0 | Order condition needed for direct-factor argument; no unrestricted averaging. |
| 5.14 Localized complex | A₂×A₂ on C⊕D | (1,0)²=(1,0), (0,1)²=(0,1), product 0, sum 1; factors C and D | Retain actual derived idempotent. |
| 5.14 General localization negative control | ℤ localized at (3) | ℤ has only idempotents 0,1; ℤ_(3) is neither 0 nor ℤ | Finite Artinian factor condition essential. |
| 5.15 Residual witness | Characters 1,1,1,χ with χ≠1 | Any pairing gives products 1 and χ, which differ; no nondegenerate alternating form with one multiplier | GL₄ witness alone is not symplectic. |
| 5.16 Congruence localization | O[t]/(t(t−ϖ)); O×O | Two generic roots 0,ϖ reduce to one root, localized complex dimension 2; product residual ideals select (ℂ,0) and (0,ℂ), dimensions 1,1 | Retain residual congruence and generalized eigenspaces. |
| 6.1 Interior image and tower | D=∅; zero map; (x,y)↦x | Images whole space, 0, and ℂ respectively; last source dimension 2 versus image dimension 1 | Retain actual boundary-ideal map and its kernel. |
| 6.2 Growth resolution | Compact point, trivial V; one logarithmic variable | At a point complex is V in degree 0; logarithmic differential d log z=dz/z, not dz | Retain canonical logarithmic coefficient and central condition; R03 repairs analytic input. |
| 6.3 Automorphic comparison | Trivial coefficient, degree 0; SL₂ pair comparison | Constant form maps to section 1∈ℂ; cusp-only source misses it. Full relative H²=ℂ versus parabolic H²=0 | Source theorem supported, supplier replacement invalid (R03). |
| 6.4 Cusp/interior inclusions | End degrees 0,3; zero cusp source | Cusp/interior dimensions equal in the end degrees; zero source gives image 0, not an arbitrary nonzero canonical class | Retain separate occurrence maps. |
| 6.5 Image subspaces | Comparison ℂ²→ℂ, (x,y)↦x | Source dimension 2, kernel dimension 1, image dimension 1; (0,1) maps to 0 | Excludes identifying source with coherent image. |
| 6.6 Multiplicity | dim infinity=1, dim π_f^K=3, multiplicity 2; no fixed vector | Contribution dimension 2·1·3=6; when π_f^K=0 contribution 0 | Retain multiplicity and specified level. |
| 6.7 Coefficient transport | Norm twist, ν(γ)=2; normalized (5,2) | Naive g-dependent ν(g)⁻¹ changes under γ by 1/2, not 1; corrected adelic product is rationally invariant; normalized scalar is 2 | Retain global norm/sign correction. |
| 6.8 P20 dictionary | (k,r)=(0,2),(0,3) | λ=(−1,0;4),(−2,−1;6); λ₂−λ₁−1=0 and 2−λ₂=2,3 | Corrected holomorphic parameter retained. |
| 6.9 Product degrees | Two real places, both l=2 | Holomorphic/holomorphic contributes degree 0; either single generic contributes degree 1; double generic degree 2 | Degree-one count 2, no collapse of Künneth degrees. |
| 7.0 Balanced/dual central sign | (a,b,c)=(5,2,−4) | w=1; coefficient plus balanced representation gives −1+1=0; same CG20 sign gives −2 | Retain explicit dual interpretation. |
| 7.0 Transfer orbit | (4,2),(5,2), normalized c | Orbits (3/2,3/2,−3/2,−3/2) and (3/2,3/2,−5/2,−5/2), sums 0,−2; balanced dual sums 0,2 | Correct four-term central parity check. |
| 7.0 Nonzero split central test | (a,b,c)=(3,2,0) | w=−5; balanced central −5, coefficient 5, total 0; dual spin orbit (7/2,7/2,3/2,3/2) sums 10 | Nonzero test excludes accidental agreement at w=0. |
| 7.0 Residual exclusion and packets | Direct sum of two rank-two systems; two permitted real places | Invariant subspace dimension 2<4; same finite part of dimension d gives d,2d with multiplicity one | Retain full-polynomial exclusion and conditional packet supplier. |
| 7.1 Closed chambers | Shifted pairs (2,1),(2,−1),(1,−2),(−1,−2) | Membership sets {0},{1},{2},{3}; origin has {0,1,2,3} | Retain compact-wall exclusion and tempered-image restriction. |
| 7.2 Singular families | (a,b)=(2,2),(2,1),(1,1) | Shifted (1,0),(1,−1),(0,−1) have memberships {0,1},{1,2},{2,3} | Both endpoints and dual families correct. |
| 7.3 Singular bound | R=5, k=4 | λ₁=−5, so −λ₁=5≥5; λ₁≥5 is false | Retain corrected sign; this is not §8.8’s global bound. |
| 8.1 Boundary decomposition | Klingen versus Siegel/Borel parabolic | Hermitian factors GL₂ versus trivial; linear factors GL₁ versus GL₂×GL₁ or GL₁³ | Lower-rank rather than full GSp₄ contribution. |
| 8.2 Non-Eisenstein vanishing | Boundary system ρ₂⊕χρ₂; character sum | Rank-two invariant subspace 2<4; character-sum invariant line 1<4 | Full Frobenius polynomial cannot match absolutely irreducible semisimplification everywhere; localized boundary 0. |
| 8.3 Modular boundary | k=0 and k=1 | Boundary sheaves ω² and ω³(−cusp), respectively; at unramified eigenvalue t, T_(ℓ,2)=2t in the doubled k=0 case | Retain exceptional k=0 and source correction. |
| 8.4 Klingen spin factor | α=1, β=2, u=4, q=2 | P₂=X²−3X+2; second factor X²−12X+32; product X⁴−15X³+70X²−120X+64; uD=8=q³T₀ for T₀=1 | Declared local gap has correct polynomial and normalization. |
| 8.4 Four monomials | Uniformizer parameter 2 | Diagonals (1,1,2,2),(1,2,1,2),(2,1,2,1),(2,2,1,1) are four distinct tuples | Repeated-source monomial rejected. |
| 8.5 Totally real boundary | Point boundary weight (4,2); two places with l=(2,3); l=(2,2), k=(2,4) | First nonscalar point contribution 0; nonparallel l contribution 0; last pushforward has Hilbert weight (2,4) | Retain nonparallel Hilbert gap and parallel l condition. |
| 8.6 Localized interior | H⁰(D)_m=0 | LES kernel/cokernel gives H⁰_sub≅H⁰_can and ker(H¹_sub→H¹_can)=0 | Degree-one image equals interior; no all-degree equality over F inferred. |
| 8.7 All-weight rational exhaustion | a=2, shifted (1,0) | Allowed degrees {0,1}; conditional same finite part contributes d in each | Lowest permitted weight retained, no large-weight shortcut. |
| 8.8 Cusp injection and gap | Two l=2 places, dim finite part 3, multiplicity 2 | Degree 0 contribution 6; degree 1 contribution 12; R=3,(8,4) gives root pairing 2 | Multiplicity formula survives; uniform threshold needs R04. |
| 8.9 Dimension equality | l₀=0,1,2 and h⁰=3 | h¹=0,3,6; over Q l₀=1 gives 3=3 | Correct conditional factor; inherit repaired bound where used. |
| Worked examples | p=7,(4,2); trivial C₃-torsor | Length-one bound >2, length-two bound >1; regular dual action P⁻ᵗ, coinvariants Aₙ | Arithmetic correct except the abbreviated cutoff wording in R05. |

Additional negative controls: the inseparable finite flat extension 𝔽₂(s)⊂𝔽₂(t), t²=s, has algebra trace zero (both basis traces are zero), so §3.4 cannot demand that every fundamental class be nonzero. The identity extension has trace 1. Replacing the proper curve by A¹ gives H⁰(O)=k[x], an infinite-dimensional space; the headline’s properness hypothesis excludes that attempted application. No section uses a polynomial degree of zero, an out-of-range `Fin` index, natural subtraction in place of integer cohomological subtraction, or division by a nonunit without its stated localization. The local q=1 Check is explicitly formal.

**Library and ownership audit by object.** The roadmap tools searched main and the indexed open heads for coherent duality, exterior powers, perfect models, derived cohomology, solid scheme sheaves, EO/Cousin constructions and the three Lean declaration names. The library search used the pinned files, not an updated checkout. No matching declaration name was found in readable main/open-roadmap Lean files. The following native declarations were opened; none is replaced by an admitted data stand-in.

| Object | Pinned declaration and location | What it supplies, and what it does not |
|---|---|---|
| Smooth relative dimension | `AlgebraicGeometry.SmoothOfRelativeDimension`, `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127` | Local standard-smooth charts of the stated relative dimension; no properness. |
| Locally free module sheaf | `SheafOfModules.IsLocallyFree`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean:61` | Locally isomorphic free sheaves; the definition does not itself impose finite rank. |
| Finite presentation | `SheafOfModules.IsFinitePresentation`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:269` | Locally a cokernel of maps between finite free sheaves; supplies the separate finiteness condition retained in Lean. |
| Sheaf determinant carrier | `SheafOfModules.exteriorPower`, `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:52` | Sheafification of sectionwise exterior powers; degree zero is the structure sheaf. No duality theorem. |
| Relative differentials | `AlgebraicGeometry.Scheme.relativeDifferentials`, `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85` | Sheafified relative Kähler differentials, with the specified base morphism. |
| Internal Hom | `AlgebraicGeometry.Scheme.Modules.instMonoidalClosed`, `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean:63` | Closed monoidal module-sheaf category; no proper-duality counit. |
| Additive cohomology | `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` and `cohomologyFunctor`, `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`, `:66` | Cohomology of the underlying abelian sheaf and coefficient maps; no geometric finiteness or duality assumption. |
| Degree zero | `cohomologyZeroEquiv`, `cohomologyZeroEquiv_naturality`, same file `:80`, `:86` | Natural additive H⁰/global-section identification. |
| Base-linear cohomology | `AlgebraicGeometry.Scheme.Modules.cohomologyBaseModule`, `cohomologyMapBaseLinear`, `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean:45`, `:57` | Restriction of scalars along R→Γ(X,O_X) and R-linear coefficient maps. |
| Base-linear H⁰ | `cohomologyZeroBaseLinearEquiv`, its naturality theorem, same file `:110`, `:127` | Natural R-linear identification with sections; no derived RΓ comparison supplied here. |
| Connecting map | `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyδBaseLinear`, `TauCeti/AlgebraicGeometry/Cohomology/LongExactSequence.lean:242` | Requires an actual short exact coefficient sequence and n₀+1=n₁. |
| Existing curve Serre duality | `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`, `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean:113` | Field, integral separated Noetherian curve, DVR stalks, valuative existence, coheight and function/constant-field hypotheses, and a canonical divisor selected by a nonzero differential. It is not finite-coefficient relative duality. |
| K-projective representative | `CochainComplex.isKProjective_of_projective`, `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:113` | Upper degree bound plus termwise projectivity. |
| Homotopy/derived morphisms | `CochainComplex.IsKProjective.Qh_map_bijective`, `Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean:43` | K-projective source and a derived-category instance; no strict action supplied. |

The earlier review’s assertion that the pin lacked a sheaf exterior power is no longer correct at this pin. The repaired package explicitly uses it. The resulting finite-coefficient specialization combines the supplied relative duality theory with the DVR/Matlis coefficient interface; it is not a second construction of a generic dualizing category.

**Supplier citations resolved this round.** For existing roadmaps the main copy was used; for newly proposed roadmaps the indexed head was used. The paths below are repository-relative; the section labels were resolved against actual content, not just remembered names. Grouped ranges refer to the contract’s range; the listed line is an anchor, not a claim that the entire range is on one line.

| Supplier | Sections/targets consumed and inspected | Resolution / ownership consequence |
|---|---|---|
| AlgebraicVectorBundles | L0A–L0C, `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215` | Polynomial bundle operations are imported. |
| SchemeAndStackFoundations | §§0.18, 1.1, 2.6–2.8, 2.18–2.21, 2.23, 4.8–4.10; anchors `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3959`, `:4275`, `:4558`, `:5448` | Scalar-derived cohomology, proper duality, ordinary support/Cousin theory, equivariant descent and formal functions exist. The native base-linear comparison remains a separate declared contract. |
| DerivedModuleAlgebra | §§0.2–0.3, 1.1.1, 1.3–1.5, 1.E.0–1.E.1, 1.M.1–1.M.2, S.1; completion anchor `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1733` | Native derived tensor/Hom, completion, effectivity, arbitrary-residue-field Matlis theory and signed filtrations are owned here. |
| DeformationAndDerivedPatchingAlgebra | §§7.1–7.10; `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1475`, `:1491`, `:1525` | Infinite-rank lifting, coefficient duality and derived actions are present. §7.10, not §7.7, owns the spectral sequence; §7.8 owns Hom completion. R02. |
| AutomorphicBundles | B0–B5, B3.10, B3.BGG.1–3, B5.10; `TauCetiRoadmap/AutomorphicBundles/README.md:2019`, `:3072`, `:3133`, `:4887` | Parent integral coefficients and section Hecke action are imported. BGG’s characteristic-zero range does not already supply the requested integral small-weight extension. |
| ShimuraCompactifications | C1, C3.3–C3.10, C4.1–C4.11, C4.16–17, C5.3–C5.31; `TauCetiRoadmap/ShimuraCompactifications/README.md:2642`, `:2717`, `:2885`, `:2920` | Normalizations, formally canonical coefficients, canonical bundle and blow-ups exist; normalized models are not automatically smooth. |
| LanglandsParameterStacks | LP3.0, `TauCetiRoadmap/LanglandsParameterStacks/README.md:729` | Field-valued Weyl/dual-Weyl and filtration theory; integral split-Levi lattices are an extension. |
| ComplexComparisonPartII | C1.9, C2, C3.3; `TauCetiRoadmap/ComplexComparisonPartII/README.md:1663`, `:2106` | Proper/projective coherent GAGA and bounded derived GAGA exist, including nilpotents. Actual coherent-duality trace compatibility is still the named gap. |
| SmoothRepresentationsOfLocalGroups | SR.0–SR.4, particularly SR.4.5, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:3489` | Towers, convolution, induction and spin-generator conventions exist. The Klingen local factor identity is the declared extension. |
| IntegralHeckeAndGaloisDeterminants | §§2.2–2.3, 3a.1–2, 3b.1–2 | Finite derived-image factors, residual predicates and polynomial twist/dual transport are imported, not reconstructed on new carriers. |
| AutomorphicFormsOnReductiveGroups | §§1.1–1.3, 4.1–2, 6.1–7; `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:1033` | Actual relative cochains, coherent chamber calculation and the three separate classifications exist. The global and singular constants must remain distinct (R04). |
| AutomorphicSpectralTheory | §§4.1–5, 5.1–7a; additionally opened §§4.10, 5.8; `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2439`, `:2745`, `:2844` | Spectral multiplicities exist. The claimed Su regularization is absent from §5.2; uniform moderate-growth Fin_J acyclicity occurs in §5.8. R03. Wallach cuspidality is §4.10, rather than §§4.1–5; §8.7 can use the already imported conditional cuspidality conclusion of EndoscopicTransfer §11.1 instead. |
| EndoscopicTransferAndUnitaryTraceComparison | §11.1 and GSp4ClassificationInputs, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4153` | Conditional general-type transfer, cuspidality, local parameters and multiplicity one for packet members are present. No new packet classification belongs here. |
| ArithmeticGaloisRepresentations | §§1.1–1.12, 2.2, 5.1–3; `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1084`, `:1219`, `:1572`, `:3147` | Semisimplification, stable lattices, multiplier forms, Frobenius conventions and dense-polynomial recognition exist; trace alone is not used in small characteristic. |
| WeightsInEtaleCohomology | R34.5–R34.6, classical and source-qualified Hilbert branches; `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:627`, `:836` | Classical weights at least two are supplied. Weight one is not supplied by that statement; the declared gap is minimal. |
| ModularCurvesPartII | §§14.1–14.4a, `TauCetiRoadmap/ModularCurvesPartII/README.md:3741`, `:3850` | Parabolic coefficient systems, finite/adic cohomology and level comparisons exist. |
| HilbertModularVarietiesAndShimuraCurves | R18.3.29(a), `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:3836` | Parallel-weight existence includes even degree without a finite discrete-series place. Its arithmetic representation is dual to the geometric convention; the nonparallel unrestricted extension is separate. |
| CrystallineCohomology | CR.5.1–5.4, CR.DDR.6.11–14; `TauCetiRoadmap/CrystallineCohomology/README.md:8382`, `:8974`, `:9554` | Logarithmic structures and comparisons are present. Lan–Suh coefficient vanishing with lifting/ampleness conditions is not merely that comparison theorem. |
| EnhancedDerivedSheaves | §§0.1–3, E1.3, E2:towers, E3.2–3, E5:abstract; `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, `:549`, `:1290`, `:1436` | Enhanced categories, coherent diagrams and limits are imported. Triangulated functorial cones are not assumed. |
| SolidAnalyticRings | §§1.5, 2.2, 6.4, 7.1–2; `TauCetiRoadmap/SolidAnalyticRings/README.md:191`, `:265`, `:629`, `:687` | Solid module categories and scalar operations; not the scheme Zariski six operations. |
| VStackSheavesAndLisseCategories | VS2.2, `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:708` | Analytic measures and complete categories exist. Its integer-solid spectrum is not substituted for the scheme’s (A,A)■. |
| AlgebraicModuliForArithmeticGeometry | §7.5, especially `fundamental_class_boundary`, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:9418` | Relative Cartier and finite-flat/determinant alternatives match the retained boundary hypotheses. |

No generic cohomology, bundle tensor operation, local Satake carrier, residual determinant or packet classification is planned a second time in the retained package. The scheme solid extension is more than SolidAnalyticRings’ affine coefficient category, and the current indexed search did not locate another readable owner for that construction. EO geometry overlaps the later IgusaVarietiesAndTorsionConcentration IG.2.12–IG.2.13: the prerequisite is owned here below that consumer, rather than imported upward. This ownership move should be reflected by the later consumer importing §5.0. No later roadmap is cited as a supplier here.

**Declared gaps.** All eight slugs match `packages/AutomorphicBundlesPartII/design/plan.json` and the README’s exact-supplier subsection. Each asks for one result with its compatibility laws, rather than an unrelated collection. None has supplier `none`. The algebraic checks below concern the requested contract; absence of its eventual proof is not a finding.

| Slug | Minimal missing contract and discriminating witness |
|---|---|
| integral-dual-weyl-lattices | LP3.0’s field theory does not select integral lattices. In characteristic 2, Sym² and divided powers have the different cross coefficients 0 and 1 computed above. |
| coefficient-linear-coherent-comparison | Native base-linearity is already imported; the missing item is the comparison from HⁱRΓ in D(O). At Spec O, both H⁰ carriers must identify ×ϖ with ×ϖ, not merely an arbitrary additive bijection. |
| gaga-duality-trace | Existing GAGA does not by itself identify a chosen duality counit. A split degree-two map must carry trace (a,b)↦a+b, giving 2 on the pulled-back unit, on both sides. |
| boundary-spin-satake | Earlier SR.4.5 supplies the general spin polynomial, not this Klingen factorization. Roots 1,2,4,8 give coefficients 1,−15,70,−120,64 and q³T₀=uD=8. |
| coefficient-logarithmic-splitting | CR’s logarithmic comparison does not give the stated coefficient vanishing. At p=7,e=3, degree m=0 satisfies m<4; m=4 does not. Positivity t=0 likewise fails. |
| integral-small-weight-dual-bgg | Parent BGG comparison is characteristic zero. With d=3 and length 3, the new integral subcanonical range begins at degree 1, not degree 4. |
| classical-weight-one-realization | Existing classical carrier begins at weight 2; weight 1 lies outside it. The requested rank-two polynomial remains X²−TX+D with two roots, not a rank-four boundary system. |
| nonparallel-hilbert-realization | Parallel (2,2) is supplied; (2,4) has common parity but is outside the parallel branch. The gap asks only for the missing realization/unramified polynomial range. |

**Headline completeness.** Fifteen headline groups are identifiable in the README. One is stated, and the other fourteen are individually named with their missing carriers in the Lean module docstring:

| Headline | Lean coverage |
|---|---|
| Finite-coefficient coherent Serre duality (§1.6) | `finiteCoefficientSerreDuality`, with the two small real-body definitions it needs. |
| Equivariant finite perfect models and deck descent (Layer 2) | Named; missing torsor/equivariant derived realization. |
| Correspondence composition, base change and transpose (Layer 3) | Named; missing coherent upper shriek, trace and enhanced correspondence carrier. |
| Solid completion and support-filtration spectral sequence (Layer 3) | Named; missing scheme solid sheaves and completed locales. |
| Normalized Hecke action, GAGA and coherent tower (Layers 3–4) | Named; missing actual Shimura towers and coefficient correspondences. |
| Lan relative subcanonical vanishing (§5.2) | Named; missing contraction and formally canonical PEL coefficient carriers. |
| General PEL small-weight and specialized integral vanishings (§§5.3–5.8) | Named; missing integral PEL/Siegel model, Hodge and boundary coefficients. |
| Integral Hecke relations and localized factors (§§5.10–5.15) | Named; missing EO and coherent Cousin/Hecke carriers. |
| Su comparison (§6.3) | Named; missing actual canonical coefficient, growth complex and automorphic relative cohomology. |
| Harris comparison and multiplicity contribution (§§6.4–6.6) | Named; missing the occurrence maps and automorphic spaces. |
| Chamber and singular interior decomposition (Layer 7) | Named; missing archimedean representation and coherent occurrence carriers. |
| All-degree rational boundary vanishing (§8.2) | Named; missing boundary/coefficient/Hecke residual carrier. |
| Totally real boundary and interior comparison (§§8.5–8.6) | Named; missing Hilbert–Siegel boundary and coefficient maps. |
| Localized cusp injection, large-gap and rational all-weight exhaustion (§§8.7–8.8) | Named; missing spectral multiplicities and geometric congruence localization. |
| Conditional dimension equality (§8.9) | Named; missing those same spaces and packet occurrence data. |

The existence of bare linear images, module categories or scalar polynomials does not make the other fourteen headlines statable on their actual objects at the pins. No free Prop field or weakened scalar theorem was used to stand in for them.

## Not verifiable

- GK19 Remark 10.1.3, printed p. 962, remains the settled `uncertified` source. It was not requested again; its contents are not certified by this review. The explicit chamber computations and conditional supplier route were checked independently.
- The author-manuscript locators of BP26 and the other version-qualified entries were checked against their cached texts. Publisher pagination and independent publication metadata were not certified. No mismatch between the numbered theorem actually used and the cached version was found in the seeded sample.
- BR16 Proposition 1.14 in the available version is readable; the correspondence with the alternative numbering 1.5.8 mentioned by BCGP21 was not independently checked in that other version. No new source request was made for the same already recorded work.
- Ownership was searched in main, indexed open-roadmap README/Lean files and local board packages. Five of the twenty explicitly indexed board-package README heads were readable. The following exact supplied heads returned HTTP 404 at their package README endpoints: ArithmeticLocallySymmetricSpacesPartII `84a41ac`; CompletedCohomologyAndLocalGlobalCompatibilityPartII `948c94c`; CrystallineCohomologyPartII `84ea77e`; EndoscopicTransferAndUnitaryTraceComparisonPartII `80a66cc`; HigherHidaAndColemanTheory `da88512`; LawrenceVenkateshMethod `9ee7ac3`; OrdinaryAutomorphicFormsAndModularityLiftingPartII `7e88c38`; PELModuliPartII `d4bb48d`; PadicHodgeTheoryPartII `6502997`; PadicLocalLanglandsForGL2QpPartII `3e0777d`; RealSurfacePeriodIndex `875bca4`; SchemeAndStackFoundationsPartII `accb0a0`; ShimuraVarietiesPartII `57dc0a4`; VStackSheavesAndLisseCategoriesPartII `0987ba7`; VectorBundlesAndIsocrystalsPartII `b58d862`. Their existence is acknowledged; no claim that they have no overlapping object is made. This limitation is not converted into an ownership finding.
- The separately named sibling pull requests without supplied filesystem paths were not independently checked as sibling checkouts. The indexed roadmap tool searches cover the available heads; there was no attempt to discover further checkouts or treat a revision of an existing roadmap as a new supplier.

There is no unresolved request for a source text and no reason to reopen a waived or uncertified manifest entry. The mathematical and mechanical work not depending on the unavailable items is reported above.

## Source issues

- **Misprint** in BP26 at §4.3.1, p. 46: the source says the left action evaluates at m⁻¹m′; it should be evaluation at m′⁻¹m; affects nothing.
- **Misprint** in P20 at §5.3, p. 24: the source says the holomorphic parameter starts 1−k+r; it should be 1−k−r, agreeing with the following page; affects nothing.
- **Misprint** in P20 at §5.3, p. 25: the source says the tensor-twisted correspondence targets p₁!O; it should be p₁!Ω^(k,r), retaining the coefficient just tensored into the fundamental class; affects nothing.
- **Misprint** in P20 at proof of Corollary 15.2.3.1, p. 109: the source says the exceptional boundary sheaf ω² occurs at k=2; it should be k=0; affects nothing.
- **Misprint** in P20 at Corollary 15.2.3.1, p. 108: the source says the degree-one equality without residual localization on its left side; it should be localized at m, matching the congruence-restricted right side; affects a stated result.
- **Misprint** in P20 at Theorem 15.2.2.1(2), p. 108: the source says the negative parameter satisfies λ₁≥R in the large-weight range; it should be −λ₁≥R; affects a stated result.
- **Misprint** in BCGP21 at proof of Lemma 3.10.7, printed p. 238: the source says the four spin monomials with a repeated diagonal; it should be the four distinct diagonals (1,1,ϖ,ϖ), (1,ϖ,1,ϖ), (ϖ,1,ϖ,1), (ϖ,ϖ,1,1); affects the proof.
- **Error** in BCGP21 at Lemma 3.8.5, printed p. 220: the source says every finite étale Galois cover splits into invariants and augmentation terms; it should be restricted to invertible group order for this decomposition, as the trivial characteristic-two double cover shows; affects the proof.
- **Gap** in BCGP21 at Lemma 3.9.12, printed p. 230: the source says restriction of Cousin terms to the interior is immediate; it should be an argument establishing boundary regularity on the relevant Cohen–Macaulay thickenings and excluding associated boundary components; affects the proof.
- **Error** in CG20 at §5.3, p. 26: the source says the g-dependent inverse similitude twist is rationally equivariant; it should be corrected by an adelic norm/sign factor cancelling the extra rational scalar; affects the proof.
- **Misprint** in CG20 at §5.3, p. 28: the source says the chambers are indexed from zero through four; it should be zero through three; affects nothing.
- **Misprint** in BP26 at proof of Proposition 2.9.9, p. 29: the source says the target uses open direct image and places inverse-image opens in X; it should be extension by zero with the inverse-image opens in C; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "eab6b3794d4f04e80dd7b9d4048eecb73506c782", "job": "REV-PKG-AutomorphicBundlesPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
