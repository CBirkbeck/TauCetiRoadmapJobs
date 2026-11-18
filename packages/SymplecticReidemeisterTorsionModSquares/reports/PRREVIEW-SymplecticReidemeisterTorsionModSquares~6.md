# Review of SymplecticReidemeisterTorsionModSquares (pull request #1645 at 172adf7)

**Verdict:** accepted

**Summary.** Accepted: no finding. The new opening overview, the reordered sections and the journal references agree with the layers and with the sources; the Gaussian genus-two example, the boundary pairing, the Zassenhaus Checks and the density arithmetic were recomputed and agree. There are one small correction (the Dehn twists are cited to the wrong layer of GeometricTopology) and one format note, neither blocking, and one question for the author about the sign laws of §§2.5, 2.6 and 2.8 taken together. Two points are left to the human reviewers.

## C01 — The Dehn twists of §4.8 are cited to GeometricTopology Layer 3, but that roadmap gives them to its Layer 1.7.2

A reader who follows "GeometricTopology Layer 3; gap:marked-surface-twists" (the *Needs:* line of §4.8, line 771, and the Dependencies of Layer 4, line 779) arrives at the diffeomorphism-group layer (§§3.1–3.4: the topology on `Diff(M)`, smooth families, isotopy extension, Cerf's theorem), which contains no twist. On main, GeometricTopology says in its scope that "Layer 1.7.2 is the single owner of the mapping class groups of compact surfaces, their Dehn twists with the sign convention pinned there" (`TauCetiRoadmap/GeometricTopology/README.md:165`, with the section at line 1212). That section gives the action of a twist on `H₁` only, so the requested extension (the action on a marked presentation of π₁, with basepoint paths and the relator kept up to conjugacy with exponent +1) is still a real request; only its address is off.

Cite GeometricTopology Layer 1.7.2 in the two lines, and say in the contract under "From TauCetiRoadmap.GeometricTopology" that the marked-surface request extends Layer 1.7.2 (keeping Layer 3 beside it if isotopy extension is meant). The result of §4.8 does not depend on the direction of the twists, since each `T_i` is fixed by its action on words.

## N01 — Three wordings

"the corrected brutal-truncation exact sequence" (§1.5, line 269) does not say what was corrected: the sequence as stated is right, and the source's display (B.14) has the quotient in the wrong degree, so "corrected" can go or become a clause naming (B.14). "the orthogonal circle regression family" (§3.5, line 578) uses a process word for the family of §3.4. The heading "The circle formula in odd characteristic" (§4.4) covers characteristic zero as well, as its statement says.

## Questions for the author

- Sections 2.5, 2.6 and 2.8 are each stated for every dimension 4j − 1. Applied to N = M × [0,1], whose boundary is M ⊔ (−M), they give, with c = χ½(M, ρ): from the disjoint-union law and orientation reversal, RT = [(−1)^(c·c)] · [(−1)^c] · RT(M)² = 1; from the boundary theorem, RT = [(−1)^(2c/2)] = [(−1)^c]. These agree only when c is even. For three-manifolds §3.2 proves that, and nothing in the roadmap uses the odd case. For j ≥ 2, is evenness of χ½ for symplectic systems on closed (4j − 1)-manifolds intended as a consequence (it would then also give §3.2 without the K-theory), or does one of the three statements need the hypothesis that χ½ is even? I could not decide it: no closed example with c odd is known to me, and on the algebraic model `K² → K²`, `d = diag(0,1)`, hyperbolic pairing on the first coordinates (strongly even, Poincaré, c = 1) the comparison needs every sign of the determinant functor, which I did not carry through.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.3 algebraic boundary | circle complexes in degrees (k,k+1), k=0..3, A = 3-4-5 rotation, 1, −1; one-term complexes, ε=±1; C=R, f=(a) | Cone d²=0 and displayed pairing closed in all 21 cases; ε-symmetry by hand: both sides ε(−1)^(pq+p)β(x)+(−1)^q α(y); a=0 still hyperbolic | Agrees with (A.9), AV-v1 line 3015 | none |
| §0.4 semicharacteristic | K in degree 1; S³ rank two; zero complex | χ≤1 = −1; 2 − 0 = 2; 0 | Agrees with (A.10), AV-v1 line 3050 | none |
| §0.6 parity | C⁰=C¹=K, d=0; K², d=J; 𝔽₂, d=1 | lower sum 1, χ≤0=1; 2 and 0; over 𝔽₂ 1 against 0, closedness 2xy=0 | Agrees; 2 invertible is needed | none |
| §1.1 graded lines | odd and even line | double inverse (−1)^n: −1 and +1; swap of two odd lines −1 | Agrees with (B.1)–(B.2), AV-v1 lines 3181–3190 | none |
| §1.5 termwise determinant | r=1 in the truncation sequence | quotient of σ≥0 by σ≥1 is C⁰ in degree 0 = C^(r−1)[1−r]; source prints C^r[−r] | README right, source misprinted | N01 |
| §1.8, §2.1 Lagrangian volume | ω(e,f)=1, L=ℚe and L=ℚf; rank 2r | q(f)(e)=−1 so e∧(−f); f∧e; both −e∧f. General r: (−1)^r, reordering even | Agrees | none |
| §2.2 cellular volume | rank 1 and rank 2 cell reversal | (−1)^1 = −1; (−1)^2 = 1 | Agrees with AV-v1 lines 509, 3770 | none |
| §2.4 duality sign | point, d=1; rank 4; closed 3-manifold | 2d(2d−1)/2 ≡ d: −1; +1; χ=0 gives +1 | Agrees with (B.27), AV-v1 line 3796 | none |
| §2.5 torsion | S³ rank two; S¹, B=I₂, rotation; S³ ⊔ S³ | [−1]; θ=[2] from Q(e₁)Q(e₁−e₂)=2, det((1+A)/2)=1/2; [−1]²·(−1)^4 = 1, normalized 1 | Agrees with AV-v1 lines 3751–3782 | question |
| §2.7 three volumes | C=K² in degree 0, zero pairing, j=1 | boundary K² in degrees −1 and 4; χ(C)=2, χ½(D)=−2, r≡0 | Agrees with (B.20), (B.23), AV-v1 lines 3675, 3749 | none |
| §2.8 boundary theorem | S³=∂D⁴ rank 2 and rank 4 | χ½=2: RT=[−1], normalized 1; χ½=4: RT=1 | Agrees with Theorem 2.2, AV-v1 line 605 | question |
| §3.1 low bordism | point d=0..4; Bℤ, d=1 | ℤ,0,0,0 against ℤ,0,0,0; Ω₄=ℤ against H₄=0; circle ↦ 1 | Agrees with Thom IV.13, Thom line 2527 | none |
| §3.2 evenness | q=3,5 restriction; L(3,1) rank two | q²+1 = 10, 26, even; characteristic 3: 2−2=0; characteristic 0: 2−0=2 | Agrees with AV-v1 lines 588–603 | none |
| §3.3 even strict models | K in degrees 0,1, d=0; pair in degrees (−1,0) | χ≤0=1 odd, cannot be evened; a pair with its dual changes parities in degrees −1,0,1,2 only | Agrees; route sound | none |
| §3.4–3.5 families | H⊕H, A=diag(1+s,(1+s)⁻¹)⊕I₂ over ℚ[s]_(s) | generic θ=(2+s)²/(4(1+s))=[1+s], h=2, raw [−(1+s)]; special h=4, raw 1; normalized [1+s]↦1 | Agrees | none |
| §3.6 étale Chern map | 𝔽₃, 𝔽₅, rank 0 | H₃(SL₂(𝔽₃);ℤ)/2 of order 2 (ℤ/24); values [−1], [2] nonsquares; rank 0 source 0 | Agrees with AV-v1 lines 644–649, 730–733 | none |
| §4.1 `zassenhaus_primary_formula` | B=(a), A=−1; I₂ rotation; hyperbolic −1; 3-cycle on ℚ³; −I₄ | a=Q(e); 1/2 ~ 2; disc −1 against Q(e+f)Q(e−f)=−4; (2)(1+ω)(1+ω²)/8=1/4 against [2]²; 1 | Agrees with JRV Theorem 5.1, JRV lines 782–800 | none |
| §4.1 plus-one form | SO, even dimension, square discriminant | disc(W)·det(A⁻¹−A on W) is an alternating Gram determinant, a square; det(1−A on V₋)=2^(dim V₋), dim even | Agrees with (B.31), AV-v1 line 3854 | none |
| §4.2 circle complex | A=1, −1, rotation | closedness: (A⁻¹−A)+(A−A⁻¹)=0; A=−1: d=2, pairing 0; det(1∓A)=2 | Agrees with AV-v1 lines 3003–3010 | none |
| §4.3–4.4 circle formula | I₂ with A=1; 𝔽₃ unipotent diag(U,U⁻ᵀ) | exponent h/2+n/2+r=n even; h=2, θ=1, raw [−1] in both | Agrees; the source proves characteristic 0 only, the route here is the roadmap's own | none |
| §4.6 mapping torus | T=1; T=−1 (intertwiner −I) | h=4, θ=1; h=0, det(2I₄)=16; Wang: H⁰=0, H¹=ker(1−T) | Agrees with Lemma C.2.1, AV-v1 line 4073 | none |
| §4.7 cocycle model | a₁=a₂=b₂=I, b₁=diag(2,1/2), φ(b₁)=e₁ | relator value e₁−e₁=0; φ(b₁⁻¹)=−e₁/2; T̃φ_v=φ_(M⁻¹v); 8−2−2=4 | Agrees with (C.5)–(C.8), AV-v1 lines 4146–4176 | none |
| §4.8 Gaussian example | both systems, exact arithmetic in ℚ(i) | relators I₂; T₃(R)=(a₂⁻¹a₁⁻¹)R(a₁a₂), others fix R; x⁶+x⁴+x²+1, det 4 and 2; (x²+1)³, 8 and 2; reversed order fails on b₂ | Agrees with AV-v1 lines 4196–4245 | C01 |
| §5.3 transfer lemma | a, b independent; b in span of a | pattern (0,1) excluded by a=0 ⟹ x=0 ⟹ b=0; b=a at k₀, nonzero at k₁ | Agrees with Lemma 2.9.1, AV-v1 line 767 | none |
| §5.4 liftable rank | ℚ, ℚ(i) | r₂=0, 1; K₃(ℚ)→H₃(SL(ℚ)) is ℤ/48→ℤ/24 | Agrees with Lemma 2.10.1, AV-v1 line 820 | none |
| §6.3 cyclic extension | h=4; r=5, 13, 17 | (r−1)/h = 1, 3 odd; 4 even, conjugation dies; gcd(1+h,2h)=1 | Agrees | none |
| §6.4 cubic improvement | δ=1/2, 1/4 | h=8, N=4: 7/128 ≥ 1/128; h=12, N=6: 5/256 ≥ 1/1024; h<2+4log₂(2/δ) ≤ 8/δ² | Agrees with (2.21), AV-v1 line 1094 | none |
| §6.5 density one | ℚ(i)/ℚ identity class | initial fraction 1/2; 2=(1−i)²i nonsquare | Agrees with §2.13, AV-v1 line 1096 | none |
| §7.1 characteristic zero | Spec ℤ[1/2], Spec ℤ[1/2,t] | total weight ~Q; Σ p log p ~ Q²/2, so 1/d, not 1 | Agrees with §2.14 after the roadmap's repair, AV-v1 line 1108 | none |
| §7.2–7.4 Witt lift, all fields | Sp₂(𝔽₃); 𝔽₉ | order 24, Sylow 8, index 3 odd; 8⁻¹=2 in 𝔽₃; H₂(SL₂(𝔽₉))=ℤ/3, H₂[2]=0 | Agrees with §§2.15–2.16, AV-v1 lines 1132–1159 | none |
| §7.5 topological theorem | S³ rank two; Gaussian torus; two copies | χ½=2, [−1]·[−1]=1=c(0); χ½=0, [2]; [2]²=1 | Agrees with Theorem 2.1, AV-v1 line 422 | none |
| §7.6 mapping-class identity | T=1; Gaussian T | χ½(M_f)=−h; h=4, θ=1; h=0, θ=[2] | Agrees with (1.5), AV-v1 line 94 | none |
| §8.1–8.2 real vanishing | C₂=Gal(ℂ/ℝ); ℤ→ℤ/4→ℤ/2 | β(t)=t²≠0 so ker β_et=0; 1↦1↦1 so the class lifts and its Bockstein is 0 | Agrees with (1.10), AV-v1 lines 230–248 | none |

- Source locators read at the text: over 30 in AV-v1 (all 15 sampled targets and every theorem the overview names), 2 in JRV, 1 in Thom; 0 locators flagged as unverified by the README.
- Library declarations opened at the pins: 14 (among them `CliffordAlgebra.orthogonalSpinorNorm` and `orthogonalSpinorNorm_reflectionOrthogonal`, `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:98`, `:123`, value `[Q v]`; `TauCeti.QuadraticMap.orthogonalGroup`, `.../OrthogonalGroup/Basic.lean:190`; `squareClass_eq_zero_iff`, `.../SquareClassGroup/Basic.lean:72`; `SymplecticGroup.det_eq_one`, `Mathlib/LinearAlgebra/SymplecticGroup.lean:386`; `Nat.forall_exists_prime_gt_and_eq_mod`, `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:443`). No Zassenhaus spinor-norm formula and no Reidemeister torsion at either pin.
- Cross-roadmap citations resolved: 14 roadmaps, every cited section id found (13 on main, Chebotarev among the completed ones; MetaplecticAutomorphicForms §2.4b at the head of its open pull request, which the description names). All 14 supplier requests are stated once, each with one supplier; K3BlochGroups §4.20 does not already give the `SL₂` surjection.
- Dependency check: `depcheck: 205 roadmaps, 2227 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- Elaboration: one warning, `40:8: declaration uses 'sorry'`. `#check` of the one declaration: `K`, `V`, five instances, `Q`, `hQ`, `A` all present. One-tactic probe (`simp`, `rfl`, `exact?`, anonymous constructor with `simp`): none closes it; no padding.
- Headlines: the three-manifold theorem (§7.5), the boundary theorem (§2.8), N = c_et (§7.4), the mapping-torus formula (§4.6) and real vanishing (§8.2) are named as not statable in the module docstring with the missing carrier; Zassenhaus's formula is stated.
- Pull-request text: title and 8 paragraphs read against the head; none contradicted. The folder is new on the base; the description says so.
- Earlier findings: the previous review had none open.

Overlap check: read TangentialBordism, HomotopySpheres, FourManifolds (main; the open and results lists are empty); TangentialBordism owns the bordism groups, orientation map and spectral sequence, this roadmap the degree ≤ 3 comparison, cited not restated; nothing else shared. LevelOneAutomorphicFormsForClassicalGroups (open) imports §4.1 from here.

Source independence: 21 passages compared with 3 sources, none shared beyond formulas and the defining matrices of the §4.8 example; largest share AV-v1, 67 of 70 locators; contents compared with AV-v1: independent (Layers 0–4 and 8 regroup Appendices A–C, §§2.3–2.7 and §1.3.3 out of the source's order, with the all-characteristic circle proof and even strict models the roadmap's own; Layers 5–7 run parallel to §§2.9–2.16 in an order forced by the *Needs:* chain 5.3 → 6.1 → 6.2 → 6.4 → 6.5 → 7.1 → 7.3 → 7.4).

Research link: The roadmap formalizes the topological half of Abdurrahman–Venkatesh (Inventiones 2025), whose Theorem 2.1 they use for square classes of central values of symplectic L-functions over function fields; it rests on Zassenhaus's spinor-norm formula (via Jouve–Rodriguez Villegas 2014) and Thom 1954. Rests on the sources read and the README's scope.

## Not verifiable

- The README's sentence that the journal version of AV-v1 does not keep the arXiv numbering throughout: the journal text was not read; the bibliographic data of all three references were confirmed with the publishers' records.
- The 14 supplier requests are contracts on other roadmaps and are not theorems that could be checked here; a `sorry` build checks the signature of `zassenhaus_primary_formula`, not its truth.
- The description's account of which model ported the package is about process.

## Source issues

- **Error** in AV-v1 at Lemma 2.7.1, p. 16: the source says integral H₂ of Sp₂ᵣ(𝔽_q) and SL₂ᵣ(𝔽_q) vanishes for all odd q; it should be of odd order, since H₂(SL₂(𝔽₉)) is ℤ/3; affects nothing.
- **Error** in AV-v1 at §2.14, p. 25: the source says the closed points have density 1 for the weight Q^(−d) Σ log q_x; it should be 1/d (Spec ℤ[t] gives Q²/2); affects the proof.
- **Gap** in AV-v1 at (2.15) and Lemma 2.11.2, pp. 20–21: the source defines density by a lower limit and then unions two density-zero sets; it should use the upper limit for exceptional sets; affects the proof.
- **Error** in AV-v1 at Lemma 2.11.2, p. 21: the source draws the map from the Galois group of the compositum to the product as onto; it should be onto each factor only (take E₁ = E₂); affects nothing.
- **Gap** in AV-v1 at Lemma 2.11.1, pp. 20–21: the source assumes the raw torsion is a nonsquare; it should assume the normalized torsion is, since S³ with constant coefficients has raw class −1 and trivial normalized class; affects a stated result.
- **Error** in AV-v1 at §2.3.3, p. 13, and §B.10, p. 86: the source says raw torsion commutes with base change of normal rings; it should be the normalized torsion (constant rank two on L(3,1): −1 over ℚ, 1 over 𝔽₃); affects a stated result.
- **Misprint** in AV-v1 at §A.6.1, proof of (A.11), p. 66: the source says the skew form descends to the cokernel of d; it should be the quotient of C⁰ by the kernel of d; affects nothing.
- **Misprint** in AV-v1 at (B.14), p. 74: the source says the quotient of σ≥r−1 by σ≥r is C^r[−r]; it should be C^(r−1)[1−r]; affects nothing.
- **Misprint** in AV-v1 at (C.9), p. 89: the source says det(1−T) is the product of det(1−T̃) and det(1−M⁻¹); it should be their quotient; affects nothing modulo squares.
- **Error** in JRV at §5, before Theorem 5.1, p. 16: the source says the spinor norm is onto once the dimension is at least 2; it should exclude, for example, the positive definite real plane; affects nothing.

## For the human reviewers

- **Licence.** The README now links Thom (1954) by its E-Periodica DOI, which resolves to that archive; the text the locator was checked against is the copy fetched earlier from a personal page on a university host, as the roadmap's source manifest still records.
- **Scope.** The main source is now given with its journal reference (Inventiones mathematicae 241 (2025), 717–839), confirmed with the publisher's record; all locators still refer to the arXiv version v1, which was the text read.
