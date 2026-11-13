<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6862531576 -->
Review (codex) of 31e23fa

Verdict: needs_changes

1. **F01** (P2) State the strict-dynamics hypothesis in ordinary duality

   **Location:** `packages/HigherHidaAndColemanTheory/README.md:451`, §2.7: “Suppose C and X are smooth over S=Spec A with A Artinian, X is pure of relative dimension d and F is finite locally free.”

   **Claim:** These hypotheses give the ensuing perfect ordinary complexes and mutually dual identifications. Neither this sentence nor the layer's standing setting at line 345 assumes strict dynamics. The Needs reference to §2.6 does not state that theorem's additional geometric hypothesis.

   **Witness:** BP-Hida line 1203, Theorem 2.7.4, p. 24, requires a strict dynamical compactification. For the identity correspondence on the affine line over 𝔽₂, identity ordinary localization leaves H⁰=𝔽₂[t], of infinite dimension.

   Here C=X=𝔸¹, F=O, both correspondence maps and the coefficient map are identities, and Xbar=Cbar=ℙ¹ with D+=∞, D− empty. These are smooth finite-type schemes with compactifications proper over the actual scalar base Spec 𝔽₂, satisfying the standing setting. For this support order the positive supported object is RΓ(𝔸¹,O). Inverting the identity changes nothing. It is not perfect over 𝔽₂. Thus the scalar-base repair from an earlier round does not itself repair this different missing hypothesis. Alternatively, if RΓ^ord here means exclusively the compactification-independent object constructed in §2.4, the omitted hypothesis is necessary even to invoke that construction.

   **Exact repair:** After the smoothness assumption insert: “Assume that (C,X,p1,p2) admits a strict dynamical compactification as in §2.2.” Keep the Artinian scalar setting and locally free coefficient. Add the affine-line identity as a negative-control Check, specifying that proper compactifications alone do not suffice.

   **Repair test:** At infinity, with local parameter u, identity pullbacks would require (u^a)⊆(u^b) for positive integers a<b. The element u^a is not in (u^b); strictness fails. The new hypothesis excludes the infinite-dimensional example. For the proper point with empty boundaries, strictness is vacuous and the pairing is 𝔽₂×𝔽₂→𝔽₂, with both complexes perfect of rank one. This is the hypothesis of the cited source, not a restriction to selected primes or Shimura strata.

2. **F02** (P3) Define the radius colimit used by the Klingen BGG sequence

   **Location:** `packages/HigherHidaAndColemanTheory/README.md:1491`, §9.6(4): “the two-term relative BGG sequence 0→Ω(k,r)→F^(k,w−)⊗ω^r→F^(−2−k,w−)⊗ω^(k+r+1)→0 is exact”.

   **Claim:** The exact sequence uses the new notation w−, whereas the preceding definition at line 1486 constructs only the fixed-radius sheaf F^(κ_A,w). No radius-colimit definition occurs in the package. The transition from this sequence to the fixed-w comparison is also left implicit.

   **Witness:** Pilloni-Singular line 4118, before Proposition 13.3.2.1, p. 90, defines the colimit over smaller radius parameters. Lines 4122–4125 explicitly distinguish it from the false fixed-radius exactness assertion: integration changes the radius of convergence.

   **Exact repair:** Before (4), define, for the algebraic characters used there, F^(η,w−)=colim_(0<v<w) F^(η,v), with admissible rational v and restriction transition maps. Define the corresponding C(n,ε,w−,η,r) colimit, and its cuspidal version. State that finite-slope restriction identifies this colimit with the fixed-w finite-slope cohomology, by the radius-improving U factorization (Pilloni-Singular, Corollary 13.2.4.2 and Remark 13.2.4.1, pp. 87–88). Include this step in the route from the BGG triangle to the fixed-w comparison. Add the following negative control.

   **Repair test:** Over ℚ₂, f(z)=Σ_(m≥1)2^m z^(2^m−1) belongs to ℚ₂⟨z⟩, since its coefficients tend to zero. Any primitive has coefficient 1 at every z^(2^m); it does not belong to ℚ₂⟨z⟩. On every smaller disc of radius r<1, those coefficients have weighted norms r^(2^m)→0. Allowing radius loss gives primitives; replacing w− by the single closed-disc Banach sheaf does not. In the colimit, start at a radius parameter v<w and integrate at an intermediate parameter v<v′<w. Polynomial z has primitive z²/2 even at p=2, and constants give the expected kernel. This supplies a definition and a discriminating Check, without changing the valid slope thresholds or the corrected exponent.

3. **F03** (P2) Reorganize the consecutive source-section plan in Layer 5

   **Location:** `packages/HigherHidaAndColemanTheory/README.md:870`, §§5.5–5.9, headings “The finite-slope Bruhat Cousin spectral sequence”, “Cuspidal vanishing by Bruhat length”, “Finite-slope Serre duality and complementary ranges”, “Interior cohomology and Cousin subquotients”, “Proved geometric slope bounds”.

   **Claim:** The roadmap's organization must come from its targets and dependencies. These five consecutive sections instead have the scope and order of five consecutive sections of the dominant source.

   **Witness:** BP-Coleman lines 54–58, contents: 5.5↔5.5, 5.6↔5.6, 5.7↔5.7, 5.8↔5.8, 5.9↔5.9. README lines 890 and 943 make vanishing and slope bounds depend on §5.3, not on the intervening sections.

   The mappings include their actual subject matter, not just matching numbers. Duality needs vanishing, and interior assembly needs duality and the Cousin filtration. However, the spectral sequence need not precede local vanishing, and slope exclusion need not follow interior assembly. Consequently the stated dependencies do not force this five-section source order. The earlier review's general assurance about mathematical layer order did not compute this section-level comparison.

   **Exact repair:** Organize the end of Layer 5 around the inputs to §5.10: after the existing continuation/level-control sections, put the proved local slope exclusions (old §5.9); combine the cuspidal and dual canonical degree bounds into a complementary-range section (old §§5.6–5.7); then combine the Bruhat filtration and its interior-image consequence into a filtered-assembly section (old §§5.5 and 5.8); finish with regular and singular classicality (old §5.10). Keep every theorem, hypothesis, API and Check. Give an explicit former-numbering → new-numbering map and update internal references, so downstream citations survive. Preserve the distinct main-result comparisons from BP-Hida, Corollary 6.2.17, p. 64, and BP-GL2, Theorems 1.3–1.4, p. 3, already used in Layers 8–9; these are two further sources, not claimed proofs of the general abelian-type theorem.

   **Repair test:** Local slope exclusion needs old §§5.3 and 1.2 only. Complementary ranges need old §5.3, then §5.6 before §5.7. Filtered assembly needs old §§5.3–5.4, followed by old §§5.5 and 5.7 before §5.8. Classicality then has all of old §§5.5, 5.8, 5.9 and 1.2. The proposed ordering has no reversed edge and breaks the one-to-one source run without weakening the mathematics.

Three findings: two P2 and one P3. The previous finding is repaired. The four reviewed inputs were not changed; no source entry was added. All four source texts were available.

## Verified sound

### Previous finding and changed passages

The previous report has one finding, F01 (called R01 in its evidence table); the repair report marks it addressed, not “not actionable”. No maintainer notes were supplied.

| Previous finding | Present passage | Status and computed retest |
|---|---|---|
| F01: degree-zero classicality omitted its chamber hypothesis | `packages/HigherHidaAndColemanTheory/README.md:1274`: “Let κ be M-dominant algebraic with Cκ+={id}, and let χ be a finite-order character of Tʳ(ℤ_p).” | **Repaired.** At modular k=1, Cκ+={id,long}, l_max=1 and the complement of the chamber set is empty. At k=2, Cκ+={id}, l_max=0 and the standard strict bound is 1. |
| Same finding: precise factorization and boundary qualification | Line 1274 factors local cuspidal H⁰→local canonical H⁰ through classical canonical H⁰; line 1276 uses the canonical Cousin edge and its interior outgoing image. | **Repaired.** Outgoing d₁ has target length-one H¹; its interior part vanishes with the singleton hypothesis. For r≥2 the target bidegree is (r,1−r), with q<0, hence zero. No assertion of classical cuspidality was added. |
| Same finding: wall-weight and rank-zero controls | Lines 1282–1285 distinguish k=1, k=2, the genus-two wall and a torus. | **Repaired.** k=1 allows degrees [0,1]; κ=(k+2,2) has two compatible chambers; the torus has d=0 and one chamber. |

The new argument was compared with BP-Coleman lines 5781–5787 (Proposition 5.10.2(1)–(3), p. 124), lines 5551–5558 (Theorem 5.7.3 and Proposition 5.7.4, p. 120), and lines 7971–7991 (Theorem 6.10.3 and Remark 6.10.4, pp. 173–174). The new dependencies on §§5.5, 5.7 and 1.2 supply the stated argument. The pattern sweep included §§5.10, 7.2, 8.5 and 9.2: singular chamber sets remain plural, the converse in §7.2 has dominant algebraic ν and its explicit sufficient slope conditions, and weight one does not acquire an automatic positive window.

### Coverage, principles and shape

Read all 68 numbered targets, every Needs line, all nine layer dependency endings, Scope, Conventions, supplier contracts and source annotations. The 24 explicit construction/API blocks have at least three Check bullets. Main-branch PadicMeasuresIwasawaAlgebras and ResolutionOfSingularitiesCharacteristicZero provide the house-shape comparison. The package has the required opening, ownership, conventions, supplier, build, layer, examples/dependencies, downstream and reference sections.

This is an extension of PadicFamilies, whose stopping point is stated. It preserves every-genus Siegel theory, cofinal p=2 levels, singular weights and general abelian-type Coleman data within its standing assumptions. No second copy on main, route-specific shortcut, computational algorithm, forbidden supplier, sorry'd data, option override or undeclared own Lean name was found. Mathematical hypotheses are explicit or standing except R01; the new radius notation needs R02. Organization needs R03 even though the coarse layer order is compatible with dependencies. No additional repair is proposed for stylistic preference.

All four works occur once in `packages/HigherHidaAndColemanTheory/sources.toml`, with author-edition pagination and the different Coleman preprint pagination distinguished. No locator is flagged unverified by the author. No missing-reference request or new manifest key is necessary.

### Seeded source sample

The following are the fifteen requested targets, checked against the cached text and printed page markers. These references are to the recorded author editions; no journal-page substitution was made. “Supported” describes the checked claim and qualifications, not a claim to have formalized its proof.

| Target | Source text and locator | Result |
|---|---|---|
| §1.2 Relative slopes and geometric classicality regions | BP-Coleman lines 6022–6042, Definition 5.11.2, p. 130; lines 6210–6220, Definition 5.11.14, p. 134; §5.9, pp. 121–124 | Geometric small/strongly-small conditions retain the two proved bounds and logical negation of a cone inequality. The analytic-coefficient condition is separately derived in §6.7 rather than importing the disputed printed formula. |
| §2.3 Supported ordinary localization | BP-Hida lines 889–919, Definition 2.4.2 and Lemmas 2.4.3–2.4.4, pp. 18–19 | Relative analytic tensor localization and finite-Artinian Fitting behavior agree. The kernel/comparison prerequisites are declared gaps. |
| §2.7 Transposed ordinary Serre duality | BP-Hida lines 1151–1160, Proposition 2.7.2, and lines 1185–1220, Proposition 2.7.3/Theorem 2.7.4, pp. 23–24 | Transpose and dualizing twist agree; missing strict dynamics is R01. |
| §3.2 Integrally normalized stratum Hecke action | BP-Hida lines 2478–2510, Lemma 4.3.8, Propositions 4.3.9, 4.3.11, 4.3.13, p. 48, with the continuation on p. 49 | Source normalization depends on t, including its unit part. The package correctly repairs the pure-p-power scalar, and distinguishes local normalization from the global extension. |
| §3.6 Integral ordinary Cousin sequence | BP-Hida lines 2664–2674, Theorem 4.5.2 and Remark 4.5.3, pp. 51–52 | Integral ordinary elimination uses positive valuation on incompatible strata; all compatible strata survive. |
| §4.1 Finite torus group-ring perfectness | BP-Hida lines 2750–2759, compact-open/decomposable definition; lines 2780–2796, Lemma 5.2.2 and Proposition 5.2.3, p. 54 | Quotient is finite; p-primary group rings are allowed. No semisimplicity assumption is smuggled in. |
| §4.4 Continuous admissibility and perfect duals | BP-Hida lines 2842–2856, Proposition 5.2.7, p. 55; lines 2930–2940, Lemma 5.4.2, p. 57 | Continuous regular-function models and perfect dual/reconstruction agree; completing after the filtered level limit matters. |
| §5.7 Finite-slope Serre duality | BP-Coleman lines 5458–5494 and 5551–5558, Theorems 5.7.1–5.7.3, pp. 117–120; lines 1451–1502, Theorem 2.7.1/Proposition 2.7.3, pp. 31–32 | Perfectness is restricted to matching finite-dimensional generalized blocks. Ω^d and complementary degrees correct the printed shift/form misprints. |
| §6.1a Abelian-type analytic coefficients | BP-Coleman lines 3155–3159, Definition 4.4.3, p. 66; 3926–3933, Principle 4.4.44, p. 84; 4303–4333, Remark 4.6.6, pp. 91–92; 4455–4483, Remark 4.6.13/Proposition 4.6.15, p. 95; 7510–7554, Lemma 6.6.4, pp. 163–164 | Hodge cover, auxiliary torus and finite quotient are retained. Extra projectivity is identified as this roadmap's extension, with smooth target, Cohen–Macaulay source and finite-flat argument, not falsely attributed verbatim to the lemma. |
| §6.5 Locally analytic BGG exactness | BP-Coleman lines 6957–7035, Theorem 6.2.16, Corollary 6.2.18, Example 6.2.19, pp. 151–152 | Locally analytic resolution, algebraic kernel and twists agree. Analytic characteristic zero is essential. |
| §7.2 Classical eigenpackets and converse | BP-Coleman lines 7771–7821, Theorem 6.9.3 and proof, pp. 169–170 | Forward inclusion allows higher degrees. Converse uses dominant algebraic ν, smooth-character untwist and the proved sufficient BGG/geometric region. Maximal-degree Tor argument is present in the source. |
| §8.4 All-genus rational amplitude | BP-Hida lines 3302–3306, Corollary 6.2.17 and Remark 6.2.18, p. 64 | Rational all-genus conclusion is distinguished from the integral genus-one/two theorem. |
| §9.2 Modular normalization and degree one | BP-Coleman lines 6536–6547, §5.14.2, p. 141; BP-GL2 lines 60–106, Theorems 1.1–1.4, pp. 2–3 | Naive/standard normalization, strict endpoints, dual weight and k≥3 specialization agree. |
| §9.3 GSp4 chambers and strict slope | BP-Coleman lines 6500–6578, §5.14, pp. 140–142; BP-Hida lines 2981–3008, Proposition 5.6.3, p. 58; 3114–3131, Proposition 6.1.11, pp. 60–61; 3210–3218, Corollary 6.2.10, p. 62 | Four weights, complementary ranges and trace-subtracted strict U₂ threshold agree. The symplectic diagonal is corrected from the printed source. |
| §9.6 Klingen analytic family | Pilloni-Singular lines 3507–3544, §12.6.2, pp. 76–77; 3631–3663, §12.8/Proposition 12.8.2.1, p. 79; 3880–4045, §13.2 and Proposition 13.3.1.1, pp. 85–88; 4104–4182, §§13.3.2–13.4, pp. 89–91 | Compactness, finite-slope continuation, bounds −3/0 and primary localization checked. Corrected BGG power passes; undefined radius colimit is R02. |

### Computed adversarial table

Rows cover the seeded targets, ten headlines, changed passages and every finding. Earlier computed rows were used only for unchanged formulas and compared with the present Checks; the previous review's uncomputed general assurances were not treated as evidence. The tests below are falsification tests, not proofs of the geometric theorems.

| Statement | Instances tried | Computed values on the relevant sides | Result / change |
|---|---|---|---|
| Conventions; §§4.8, 5.7 duality | d=0 and d=3, free one-term complexes | RHom(A,A)=A; RHom(A[−2],A[−3])=A[−1]; paired degrees 2+1=3 | Correct shift and degree direction. |
| §1.2 cone negation | Two independent simple-root directions, differences (−1,2) and (0,0) | First cone membership false, its negation true, coordinatewise negativity false; zero difference belongs to cone | Negation is not strict negativity in every coordinate; equality is excluded by smallness. |
| §§1.2, 5.10, 7.6 chambers | GL₂ k=0,1,2 | Cκ+={long},{id,long},{id}; interior intervals [1,1],[0,1],[0,0] | Singular case not collapsed; repaired singleton excludes k=1. |
| §2.1 smooth purity | Dimensions 0,1,2; A=ℤ/4 | Ω^d rank 1 in degrees 0,−1,−2; Ω¹ at dimension 2 has rank 2. Tor_i^A(𝔽₂,𝔽₂)=𝔽₂ for all i | Finite-Tor and top-exterior-power qualifications matter. |
| §2.2 strict dynamics | Frobenius at p=2,3; identity at infinity | Pullback powers u²,u³ give ratios 1/2,1/3; identity gives ratio 1, not <1 | Identity is not strict with nonempty boundary. |
| §2.3 ordinary localization | U=1,0,3 on ℤ/9 | Ordinary outputs ℤ/9,0,0; U²=0 for U=3 | Rational invertibility does not replace integrality/ordinarity. |
| R01, §2.7 | Identity on affine line and proper point over 𝔽₂ | Identity ordinary H⁰=𝔽₂[t] and 𝔽₂; dimensions ∞ and 1 | Add strict dynamics; proper compactifications alone do not imply perfection. |
| §§2.5–2.6 | A=ℤ/9→𝔽₃; Γ=C₂ over 𝔽₂ | A⊗^L_A𝔽₃=𝔽₃; 𝔽₂[Γ]=𝔽₂[e]/e² free rank 1 over itself, but Tor_i^{𝔽₂[Γ]}(𝔽₂,𝔽₂)=𝔽₂ for all i | Derived base change and group-ring flatness retained. |
| §2.8 support comparisons | Two points, supports empty and {a}; empty-boundary identity | Complement H⁰ dimensions 2 and 1; required {a}⊆∅ false. Empty-boundary comparisons equal identity | Cross-containment and factorization hypotheses exclude false comparisons. |
| §3.2 character scalar | p=3, t=diag(2,3), diag(2,6), diag(1,9) | Scalars 3/2,3,9; unit factors 1/2,1,1 | Exact character criterion works; nontrivial unit may have value 1. |
| §3.6 incompatible stratum | Scalar 3 times a unit mod 9 | Square 0; ordinary summand 0; compatible scalar 1 leaves the whole module | Eliminates only incompatible ordinary terms. |
| §§3.8, 4.7 Hecke action | Degree character at ℓ=2,5 | 3²=6+3=9; 6²=30+6=36; all-ones gives 1≠4 mod 9 | Earlier corrected Check retained; genuine algebra action required. |
| §4.1 group-ring perfectness | Γ=C₂, p=2 | ℤ₂[Γ] has ℤ₂-rank 2, group-ring rank 1; mod 2, (γ−1)²=0 | Nonsemisimple coefficients are included. |
| §4.4 continuous admissibility | ℤ₂ with finite quotients; rank-one regular representation | Finite levels have 2,4,8 coordinates; f(z)=z has infinite image but is a uniform limit. Continuous dual is rank-one Λ | Completion cannot be omitted or replaced by one finite level. |
| §4.6 derived Hida control | [Λ —X→ Λ], specialize X=0 | Family H⁰=0, H¹=Λ/(X); specialized H⁰=H¹=F | Underived specialization loses the degree-zero contribution. |
| §§4.6, 8.3 inverse character | ν(u)=4, then ν=1 | Inverse evaluation gives 1/4,1; direct evaluation gives 4,1 | Nontrivial character distinguishes the convention. |
| §4.9 integral low-genus amplitude | g=2,d=3, length 1 | Canonical [1,3], cusp [0,1]; complementary opposite cusp [0,2] | Distinct complementary intervals retained. |
| §§5.2–5.3 support models | f_n=3^(−n/2)z^n, n=4,8,12; U=diag(1,3,0) | Norms at radii 3^(−1/2),3^(−1/4) are (1,1,1),(3,9,27); finite-slope dimension 2, ordinary dimension 1 | Pro-Banach presentation and finite slope are not replaced by simpler objects. |
| §5.7 pairing/ranges | d=3, positive length 1 | Cusp positive [0,1] pairs with canonical negative [2,3]; positive canonical [1,3] pairs with negative cusp [0,2] | Opposite sign and ε exchange are required. |
| R03, §§5.5–5.9 | Dependency graph on the five sections | Internal edges 5.6→5.7, 5.5→5.8, 5.7→5.8; no edge from 5.5 to 5.6 or from 5.8 to 5.9 | Source sequence is not forced. Proposed order satisfies all three edges. |
| §§5.8, 7.3 interior image | Multiplication by t over F⟨t⟩ | Family image (t) has fibre F; image of specialized zero map is 0 | Image and specialization do not commute in general. |
| §6.1a descent | C₂ augmentation over ℤ₂/ℚ₂; plane quotient by ±1 | Integral invariant image 2ℤ₂, rational image ℚ₂. Generic quotient degree 2, origin fibre dimension 3 | No integral averaging or arbitrary finite-flat assertion. Smooth-target hypothesis separates the latter case. |
| §6.5 BGG | SL₂,k=1 over ℚ₂; polynomials 1,z,z² | D² gives 0,0,2; kernel on these polynomials has dimension 2, not 3 | Characteristic-zero derivative and algebraic kernel agree at p=2. |
| §§6.7, 7.2 sufficient converse | Thresholds 0 and 3; slopes 2 and 3 | Slope 2 satisfies first bound, fails second; slope 3 satisfies both | Both necessary analytic inequalities are used in termwise BGG exclusion. |
| §6.9 projectivity | Ideal (x,y) in F⟨x,y⟩ | Generic rank 1, origin fibre dimension 2 | Torsion-free alone cannot replace the stated projectivity conditions. |
| §7.1 cohomological eigenvariety | [F —1→ F], U=1; F in degree one | Chain Fredholm product (1−X)² but cohomological support empty; degree-one F gives a point | Acyclic artifacts excluded, positive degrees retained. |
| §7.5 interior dimension | A=F⟨t⟩, B=A[N]/N²; A/(t) | B free rank 2, support dimension 1; A/(t) dimension 0 with t-torsion | Full-dimensional torsion-free support distinguished from excluded torsion. |
| Repaired §7.6 | k=1 versus k=2; d_r from (0,0) | k=1 l_max=1, smallness imposes no chamber exclusions; k=2 l_max=0. For r≥2, q=1−r<0 | Degree-one obstruction excluded only with singleton; higher outgoing terms zero. |
| §§8.1–8.2 comparisons | Formal disc/puncture; U=diag(1,p,0) | Completion H⁰=𝔽₂[[t]], local H¹=𝔽₂[t,t⁻¹]/𝔽₂[t]; ordinary dimension 1, finite-slope dimension 2 | Completion, local support and rational finite slope remain separate. |
| §8.4 rational all-genus amplitude | g=3,d=6; lengths 0,2,6 | Canonical [0,6],[2,6],[6,6]; cusp [0,0],[0,2],[0,6] | Correct rational ranges; no integral all-genus conclusion inferred. |
| §§8.5, 9.3 sharp Siegel bounds | κ=(5,3;−8) | A_w=(0,2;−8),(−2,2;−8),(3,−3;−8),(−5,−3;−8); t₂ bounds 3,4,4,8 become 0,1,1,5 after trace subtraction | Strict standard U₂ endpoint is 1, not ≤1. |
| §9.2 modular normalization | k=2; dual weight 2−k | Naive endpoint 2, standard endpoint 1; dual weight 0. At k=1 standard positive window is empty | No mistaken endpoint or wall-weight control. |
| §9.3 symplectic convention | diag(1/3,1/9,1,1/3) | Both antidiagonal products 1/9; replacing last entry by 3 yields 1 and 1/9 | Corrected element lies in GSp₄; printed alternative does not. |
| §§9.4–9.5 Klingen distinction | Height 1/2 at p=2; parameters 1,1,9,9 at p=3 | Generator counts 1 versus 3; pair products 1,9,9,81; eigenvalues 1/3,3,3,27 | Height-one tower and isolated primary refinement distinguished. |
| §9.6 primary component | F[y]/y² at y=0 | Localization dimension 2; residue tensor dimension 1 and Tor₁ dimension 1 | Keep generalized component; product-space derived fibre is different. |
| R02, §9.6 radius exactness | f=Σ2^m z^(2^m−1) | f-coefficients→0; primitive coefficients=1 do not→0; on radius r<1, r^(2^m)→0 | Add the missing colimit definition and radius-loss Check. |
| §9.6 BGG normalization | p=3,k=0,f=z,Uf=f(3z) | D(Uz)=3=3U(Dz), whereas (1/3)U(Dz)=1/3; thresholds (−2,1), at k=3 (1,4) | Correct positive power and strict bounds retained. |
| §9.8 two-term Klingen control | r=2,k=0; torsion at p=2 | H⁰ threshold min(1,1)=1 includes slope 0; all-degree threshold min(1,−2)=−2 does not. k>p+1 first holds at k=4 | Degree-specific rational argument and stricter torsion range distinguished. |

Domains were checked before applying these instances. Genus zero is outside the positive-genus Siegel datum, while the torus Coleman case tests dimension zero. Analytic fields are characteristic zero; inseparable characteristic-p fields do not meet that datum. Integral layers include nonreduced Artinian coefficients and p=2. Finite group-ring perfectness quantifies over abelian Γ, so S₃ is not an omitted allowed example. Noncompact subgroups fail the compact-open level condition. Empty supports give zero, empty boundaries retain ordinary proper cohomology, and no formula introduces a zero denominator by an unrestricted total-function convention.

### Acceptance file, headline coverage and pins

The specified `lake env lean` elaboration of `packages/HigherHidaAndColemanTheory/Suggested.lean`, from the content checkout, exited **0 with no output and no warnings**. No Tau Ceti object build was needed. The file has exactly one `import Mathlib`, one module docstring and the required namespace. It has **zero declarations and zero sorried theorems**: the exhaustive one-tactic probe and `#check @name` sets both have cardinality zero. No untested sorry or erased section hypothesis remains.

| Headline in README | Coverage in module docstring / missing carriers |
|---|---|
| §4.6 derived arithmetic Hida control | Lines 10–15: Siegel models, polarized Igusa towers, supported ordinary cohomology and universal Iwasawa complex. |
| §4.8 integral Iwasawa Serre duality | Same lines: those complexes and their geometric duality data. |
| §4.9 integral low-genus amplitude | Lines 16–18: universal ordinary geometric complexes. |
| §8.4 rational all-genus amplitude | Lines 16–18: those complexes and analytic overconvergent comparison families. |
| §5.10 regular/singular geometric classicality | Lines 19–21: abelian-type Shimura varieties, period maps, tubes and supported Cousin cohomology. |
| §7.1 cohomological eigenvariety | Lines 22–24: analytic weight space, geometric coefficient family and cohomology. |
| §7.5 interior dimension/deformation | Same lines: the geometric interior eigenpacket support. |
| §7.6 sharp interior bounds | Lines 25–27: supported coherent cohomology and integral model. |
| §8.5 sharp Siegel bounds | Same lines: the integral supported overconvergent model. |
| §9.8 two-term Klingen control | Lines 28–30: Klingen threefold, height-one tower and partial-ordinary complex. |

Object searches at the pins found no existing geometric carriers that make these headlines statable using a few simple definitions. Generic derived categories or bare endomorphisms do not suffice. Each headline is therefore legitimately named as not statable, rather than replaced by an arbitrary complex satisfying its own conclusion. The README's own backticked-name audit yields no undeclared acceptance-test name.

Pinned declarations and their hypotheses were opened, rather than inferred from the resolver:

| Object | Pinned file and line | What the native carrier includes / does not include |
|---|---|---|
| `Module.End` | `Mathlib/Algebra/Module/LinearMap/End.lean:33` | M→ₗ[R]M on a module; no compactness or topology. |
| `zpow_sub₀` | `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402` | Nonzero base in a group with zero; not permission to invert p on torsion coefficients. |
| `HasDerivedCategory`, `DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74`, line 87 | Localization size and abelian-category infrastructure; no Shimura cohomology realization. |
| `CondensedMod` | `Mathlib/Condensed/Module.lean:41`, abelian instance line 43 | Sheaves of modules on the compact-Hausdorff coherent site; not scheme-level six operations. |
| `CondensedMod.IsSolid` | `Mathlib/Condensed/Solid.lean:83`, context lines 74–81 | Solidity via specified map inversion; surrounding discussion distinguishes general rings from finite-type ℤ-algebras. No relative analytic localization kernel. |

The previous computed degree-character checks use the already pinned `HeckeRing.deg` in `TauCeti/NumberTheory/HeckeRing/Degree.lean:104`, the prime-power degree in `TauCeti/NumberTheory/HeckeRing/GL2/Degree.lean:54`, and the multiplication relation in `TauCeti/NumberTheory/HeckeRing/GL2/MultiplicationTable.lean:551`. They remain Checks, not newly owned arithmetic-algebra targets. The owned assertion is the higher supported geometric action respecting those relations.

### Supplier resolution and duplication audit

The board-package index and supplied open-head index were read before ownership conclusions. Object-based roadmap searches and `roadmaps show` were used. The resolver reports no missing cross-roadmap identifiers; its automatic native-library check was unavailable, so the native checks above were done separately. No second copy of this roadmap exists on main in the supplied checkout. No overlap lead reports a dropped supplier id, unnamed revision-only id, dropped consumer-cited id or conflicting change to this roadmap.

The table records current locations, not remembered line numbers. All paths in this table are `TauCetiRoadmap/<supplier>/README.md`; the line witnesses locate the relevant contracts, and the sections/ranges list the consumed interfaces. Current main is used for existing roadmaps, including SmoothRepresentationsOfLocalGroups and SchemeAndStackFoundations.

| Supplier | Resolved sections and README line witnesses |
|---|---|
| AdicSpacesPartIII, main | R3.1:9136; R3.4:10053; R3.6:10472; R3.8:11858. Coherent quasi-Stein/trace interfaces. |
| AdicSpacesPartIV, main | F1.10:5032, coherent dagger duality; the Banach extension remains a declared gap. |
| AutomorphicBundles, #1069 | §§1.4–1.5,1.9:911–1043; 3.3:1399; 5.2–5.4,5.10; 6.1:2122; 9.1:3019; 11.10:4082,11.16–11.17; 12.1:4519,12.11:4928. |
| AutomorphicBundlesPartII, #1823 | §§2.2:373,2.4–2.5; 3.0a:453,3.0b; 3.1–3.3,3.6,3.9–3.13; 5.1:917,5.2:942,5.13:1104. Six operations, finite torsors and individual operators distinguished from the extra supported correspondence contract. |
| AutomorphicFormsOnReductiveGroups, #1037 | §6.7:1083, supplied Siegel chambers; the abelian-type extension is here. |
| CompletedCohomologyPartII, #1035 | §§3.11:967,3.12:997, continuous functions and dual action. |
| DeformationAndDerivedPatchingAlgebra, #1034 | §§7.1:1366,7.3:1392,7.5:1426,7.6:1461,7.8:1516,7.10:1550. Perfect-complex and completed-Hom inputs. |
| HodgeTateAndCanonicalSubgroups, #1084 | §5.1:1370, Hilbert tower; the two Siegel/Klingen continuations are declared, not attributed to this existing section. |
| IntegralHeckeAndGaloisDeterminants, #1689 | §2.1:2899, §2.3:3024, finite scalar-linear image/Fitting interfaces. |
| LocallyAnalyticDistributions, #854 | §3.3:2007; §4.16:3035; §4.17:3227, characters, compact-complex theory, factorized stage operators and relative slope cone. |
| OverconvergentAutomorphicForms, #1422 | §0.4:204, §§8.6:1467,8.7:1499, coefficient descent and finite-flat/projective Banach interfaces. |
| PELModuli, #966 | M2.8:2380,M2.9:2430; M5.1:3500,M5.2:3531,M5.5:3661,M5.6:3703. |
| PadicFamilies, #1019 | Layer 0; §§0a.24:594,0a.25:621; §§2a.8–2a.14 starting at1493; 2a.15:1634,2a.16:1659,2a.17:1687. Generic ordinary/spectral machinery stays imported. |
| PadicMeasuresIwasawaAlgebras, main | §§1.1:606,1.7:909, measures and completed group algebras. |
| PerfectoidShimuraVarieties, #1085 | §3.13:1479,4.5:1580; §§6.3–6.10 starting1997,6.12–6.15 including6.13a. Auxiliary B₁ at2017, abelian period map at2122 and descent at2147. |
| PhiGammaModulesAndIwasawaCohomology, #1310 | §2.7:1256, character-space interface. |
| ResolutionOfSingularitiesCharacteristicZero, main | §6.3:913, Cartier separation; the statement used is not restricted to characteristic zero by the roadmap's title. |
| SchemeAndStackFoundations, main | §2.20:5380; `upperShriek_structureSheaf_iso_shift`:5446 and `relativeDualizingModule_smooth`:5454. Smooth/Cohen–Macaulay dualizing formula. |
| ShimuraCompactifications, #1053 | §0.14:690,4.10; §§6.16:2132,6.17:2158; 7.19:2646,7.20:2674,7.21:2721,7.29:2904. |
| ShimuraData, #1038 | §§3.8:528,3.10:578,3.13:637; 5.5:1168,5.6:1186,5.10:1268,5.11:1290. Symplectic coordinate convention agrees. |
| SolidAnalyticRings, #1458 | §§7.2:715,7.3:745,7.4:787; polynomial coefficient structures exist, the specified kernel and discrete-adic comparisons are declared extensions. |
| LieHighestWeight, main | Layer 3:405, algebraic PBW/Verma input, distinct from locally analytic BGG. |
| SmoothRepresentationsOfLocalGroups, main | SR.0.2:667,SR.1.4:1445,SR.4.5:3597, compact-open Hecke and Satake conventions. |

The three closest-roadmap lists have five distinct members; the main-only list is empty. Their scopes were read:

- PadicFamiliesPartII #2280, `TauCetiRoadmap/PadicFamiliesPartII/README.md:7`: imports the general supported theory and Klingen comparison from this package; its Hilbert-place extension, singular Sen theory and projective refinements are additional targets. Its description of this package's BGG exponent is stale: the present §9.6 already has the positive exponent. That downstream description is not a reason to change this package's correct formula or introduce an upward supplier edge.
- AutomorphicBundlesPartII #1823, `TauCetiRoadmap/AutomorphicBundlesPartII/README.md:453`, line 736: owns enhanced generic coherent operations and individual derived correspondences; higher supported ordinary/finite-slope realization is here.
- OverconvergentAutomorphicForms #1422, `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1467`, line 1499: owns analytic coefficient construction and its Hodge-type projective interface; §6.1a supplies the explicit abelian-type extension before the application here.
- GSp4NonregularModularityLifting #1817, `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:7`, line 11: consumes the chamber and singular control theorems for lifting, rather than owning their general construction.
- PerfectoidShimuraVarieties #1085, `TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:2017`, line 2122: owns perfectoid/period/torsor descent; the classical-flag affinoid extension is the declared gap, and supported cohomology is here.

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms, GSp4NonregularModularityLifting, PerfectoidShimuraVarieties; generic six operations belong to AutomorphicBundlesPartII, analytic coefficients to OverconvergentAutomorphicForms with this package's specified abelian extension, period/torsor descent to PerfectoidShimuraVarieties, general Hida/Coleman and Klingen control to HigherHidaAndColemanTheory, Hilbert/Sen refinements to PadicFamiliesPartII, and modularity lifting to GSp4NonregularModularityLifting.

The requested dependency check returned:

```text
depcheck: 240 roadmaps, 2194 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. Every Needs line was also read, including the additional §7.6 inputs; this mechanical result does not excuse R01's missing mathematical hypothesis.

### Declared gaps

The nine slugs match `packages/HigherHidaAndColemanTheory/design/plan.json` and the README's Exact supplier contracts. All name owners. Each remaining interface is precise and belongs to one construction with its compatibility requirements; none requests a duplicate of an existing supplied statement.

| Slug | Named owner and residual requirement |
|---|---|
| solid-localization-kernel | SolidAnalyticRings §§7.2–7.3: relative analytic polynomial kernel and its specified localization tensor/triangles. |
| discrete-adic-solid-comparison | SolidAnalyticRings §§7.3–7.4: discrete-adic and countable completion/localization diagrams with preserved tensors and limits. |
| siegel-ordinary-igusa | HodgeTateAndCanonicalSubgroups §5.1 continuation: polarized all-genus towers, cofinal p=2 construction, quotients and reduction. |
| klingen-height-one-igusa | Same owner's height-one continuation: ℤ_p× tower on the p-rank-at-least-one locus with the specified nonfinite transitions. |
| abelian-affinoid-basis | PerfectoidShimuraVarieties §§3.13,6.8: abelian classical-flag affinoid basis and finite-level/toroidal comparisons. |
| projective-banach-cohomology | AdicSpacesPartIII §§R3.4,R3.6: projective Banach coefficients on finite quasi-Stein covers, countable models, compact restrictions and the stated integral lattice comparisons. |
| banach-support-duality | AdicSpacesPartIV §F1.10: complementary-support LB/Fréchet pairing, top form and finite-slope perfectness. |
| coherent-correspondences | AutomorphicBundlesPartII §§3.3,3.6,3.10–3.12 on §3.0a: the two supported orders, comparison, support changes, composition/base change and twist-limit formulas. |
| abelian-subcanonical-vanishing | AutomorphicBundlesPartII §5.2 continuation: abelian-type formal subcanonical vanishing with the specified projective Banach coefficients and bounded torsion. |

These are contracts, not unowned prerequisites. This is not an acceptance, so no conditional-acceptance field is asserted.

### Source expression, arrangement and reuse

Compared the fifteen sampled passages, repaired §7.6, and five further passages from §§4.3,4.5,5.8,6.4,8.3 against their sources. The additional witnesses are BP-Hida lines 2842–2856, 2919–2940 and 3233–3306, and BP-Coleman lines 5574–5598 and 7362–7384. The Lean docstring's absent-carrier explanations were also read; they are package-specific rather than a source passage. No copied sentence, translated passage, figure, table, exercise list or imported public-formalization declaration was identified. Formula and standard-hypothesis coincidences were not counted as copying.

Counting source-labelled citation bundles before References gives BP-Coleman 54, BP-Hida 45, Pilloni-Singular 10 and BP-GL2 2, total 111; several bundles contain multiple theorem locators. The largest source's contents were opened at BP-Coleman lines 17–76. At the coarse level the integral/analytic strands and later comparisons have their own dependency structure. At the finer level the five-section run fails the arrangement test, as R03 records. The dependency-forced portions (vanishing before duality, and both filtration and duality before interior assembly) are not themselves findings.

Source independence: 21 mathematical prose passages compared with 4 sources, no copied wording or reused artifact found; largest share BP-Coleman, 54 of 111 source-labelled citation bundles; contents compared with BP-Coleman: §§5.5–5.9 require the reorganization in R03.

## Not verifiable

- No cited author-edition text or contents page was inaccessible. Publication versions with different pagination were not substituted or independently certified; the package explicitly cites the versions read.
- The nine supplier extensions are contracts for future library work. Their ownership and precise scope were checked, not nonexistent implementations.
- The empty acceptance file elaborates, but the geometric headline statements cannot themselves be checked by Lean at these pins. The docstring names the missing carriers; the build is not evidence of their mathematical truth.

## Source issues

These observations concern sources, not extra package findings where the package already corrects them.

- **Error** in BP-Hida at Remark 4.3.12, printed page 48: the source says the comparison scalar is a pure p-power for every positive torus element; it should retain evaluation of the difference character on the unit part; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3, printed page 32: the source says an already derived supported complex receives another shift and uses Ω¹ in top-degree duality; it should omit the extra shift and use Ω^d; affects a stated result.
- **Misprint** in BP-Coleman at §5.14, diagonal preceding Remark 5.14.1, printed page 140: the source says the last diagonal block is p times the identity; it should be p⁻¹ times the identity so the antidiagonal products agree; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), printed page 173: the source says the interior amplitude conclusion uses the strongly-small subspace; it should use the small subspace established by its proof; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, printed page 90: the source says the BGG target operator is p^(−k−1)U; it should be p^(k+1)U in the contracting convention; affects a stated result.
- **Gap** in Pilloni-Singular at §13.4, printed page 91: the source says pullback at a spectral point gives eigenspace cohomology without specifying the operations; it should distinguish derived weight specialization and primary localization from spectral residue fibre; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "31e23fa6a0993e4718717776075097676145cec4", "job": "REV-PKG-HigherHidaAndColemanTheory~6", "model": "gpt-6-astra", "worker": "chris-4"} -->
