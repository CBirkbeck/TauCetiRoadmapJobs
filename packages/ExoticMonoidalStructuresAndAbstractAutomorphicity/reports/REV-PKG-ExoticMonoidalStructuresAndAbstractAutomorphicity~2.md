<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1277#issuecomment-6396760971 -->
Review (codex) of 765f8d3

Verdict: needs_changes

1. **F01** (P1) The classification supplier does not cover equal characteristic

   **Location:** `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:87`, with consumers at lines 300, 647, 655 and 1431. The contract says “the explicit classification and supercuspidal Kirillov comparison at their stated scope, extended by the following contract.”

   **Claim:** The local classification needed by the spectral and generation arguments is available for every nonarchimedean field of characteristic different from two. The following contract, at line 89, actually supplies Kirillov realizations and Jacquet boundaries of generic irreducibles, not an extension of the classification theorem.

   **Witness:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:619` restricts R16.2.1 to characteristic-zero fields. For F = 𝔽₃((t)), the package applies, but 3 = 0, so this supplier theorem cannot be instantiated.

   R16.2.8 also retains a characteristic-zero restriction at line 716. Extending its Kirillov realization does not establish the irreducibility criterion for principal series or exhaustiveness of the four classes. This is a supplier-scope defect, not a counterexample to the mathematical classification. The object search found relevant earlier pieces: SmoothRepresentationsOfLocalGroups SR.3a.1, `jacquet-subrepresentation`, and SR.5.2, `segment-representations`. The latter already fixes the two Steinberg/character orientations. Its SR.3.3 classification is explicitly conditional on tempered support; it is not the cited unconditional GL₂ classification.

   **Exact repair:** Retain the general field scope. Add a precise positive-odd-characteristic extension contract for R16.2.1, with the same slug in the README and the plan's top-level gaps. Ask GL2AutomorphicRepresentationsAndTransfer for the normalized principal-series irreducibility criterion and the resulting exhaustive four-class GL₂ classification over these fields. Cite the existing SR.3a.1 subrepresentation and SR.5.2 segment results for the pieces they already provide; do not request their reconstruction. Separate this input from `all-generic-kirillov`, and name it in §§1.4, 4.4, 11.6 and their layer dependencies wherever classification is used.

   **Repair test:** At F = 𝔽₃((t)), ν(t) = 1/3. The ratios ν and ν⁻¹ are the two excluded ratios; normalized I(ν¹ᐟ²,ν⁻¹ᐟ²) has Steinberg subobject and trivial quotient, with the reverse orientation after swapping the characters. Their Whittaker dimensions are respectively 1 and 0. The repaired contract covers this field and convention; the existing Kirillov-only contract does not certify the reducibility/classification assertion. No new gap is needed for the already supplied segment orientations.

2. **F02** (P3) Correct the smooth-representation input citations

   **Location:** `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:211`: “For generation apply exact mirabolic functors Φ⁺Φ⁻”. Its Needs line is at 226. The same missing input occurs in the source proof used by §3.4, lines 530–548.

   **Claim:** The listed SR.1 function/module theory and local Fourier inputs account for the indicated proof routes.

   **Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:3647` owns `mirabolic-derivatives`; line 3696 owns `derivative-exactness`, including Φ⁻Φ⁺ ≅ Id and the mirabolic exact sequence. Neither target appears in this package's supplier contracts.

   Dor23 line 1425 uses the left adjoint of the mirabolic Φ⁻ in the proof underlying §3.4; this is more than roughening and ordinary parabolic adjunction. The supplier is earlier and already owns the input, so this requires a citation correction, not a new foundational target or gap.

   The same citation pattern affects countable Schur: README:43 assigns it to SR.0.1–SR.0.4 and §1.3 uses it at line 278. Its actual target is SR.3a.1 `admissibility-of-irreducibles`, at `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2335`, with the countable form at lines 2339–2342 and 2356. SR.0.4 defines admissibility and duality but does not prove countable Schur.

   **Exact repair:** Add SR.5.1 `mirabolic-derivatives` and `derivative-exactness` to Scope and ownership, Exact supplier contracts, the Needs lines of §§0.5 and 3.4, and the corresponding layer dependency summaries. Specify the unnormalized functors and specialize the stated coefficient/character hypotheses to ℂ with the chosen nontrivial additive character. Repoint countable Schur to SR.3a.1 `admissibility-of-irreducibles`, including §1.3 and Layer 1's dependencies.

   **Repair test:** Φ⁻ kills the trivial mirabolic module because 1−θ(u) is an invertible nonzero complex scalar for some u. On Φ⁺(ℂ), Φ⁻ returns ℂ. Thus Φ⁺Φ⁻ has values 0 on the inflated trivial module and the identity on the nontrivial character orbit. For a one-dimensional irreducible, EndG(ℂχ) = ℂ, whereas two identical copies have EndG(ℂχ⊕ℂχ) = M₂(ℂ), of dimension 4. The cited Schur target has the needed irreducibility and countability hypotheses.

3. **F03** (P3) Replace the nonexistent internal equivalence reference

   **Location:** `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:472`: “The essential-image theorem §3.1-equivalence supplies closure under colimits.”

   **Claim:** The named target supplies the essential-image and closure result.

   **Witness:** There is no §3.1-equivalence. The actual target is §3.5, at `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:552`, which identifies the image with the smallest colimit-closed full subcategory containing Iunit.

   **Exact repair:** Replace `§3.1-equivalence` by `§3.5`.

   **Repair test:** §3.5 contains both the equivalence Modfirm(Z) ≅ Moddf(G) and the asserted colimit closure. Its zero and regular-module cases are F(0) = 0 and F(Z) = Iunit. The corrected reference names that existing target without introducing an edge to another roadmap.

4. **F04** (P3) The singular-support Check has no nonzero ambient instance

   **Location:** `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:223`: “A function supported on singular matrices cannot be an element of Y° unless it is zero.”

   **Claim:** This is a discriminating negative control for the inclusion Y° ⊂ Y.

   **Witness:** In F = 𝔽₃((t)), invertible matrices are dense in M₂(F). Every locally constant ambient function supported on singular matrices is therefore zero. The Check also passes for the wrong open carrier Y° = Y.

   For example every neighborhood of 0 contains tⁿI, whose determinant is t²ⁿ ≠ 0. At a general singular m, det(m+aI) is a monic polynomial in a with at most two roots, so arbitrarily small perturbations are invertible. Functions on the singular locus itself do exist, but §1.2 correctly uses them as a quotient carrier, not as ambient functions extended by zero. The repeated-pattern search found no second instance of this faulty ambient-support Check.

   **Exact repair:** Replace that Check by the actual compactly supported locally constant function Ψ(m,y) = 1M₂(O)(m)·1O×(y). State that Ψ belongs to Y, has Ψ(0,1) = 1, and cannot lie in the extension-by-zero image of Y°. This restores a third discriminating Check without changing the target.

   **Repair test:** Over 𝔽₃((t)), Ψ(0,1) = Ψ(I₂,1) = 1 and Ψ(t⁻¹I₂,1) = 0. It is compactly supported and locally constant, while every image from Y° has value 0 at (0,1). The incorrect choice Y° = Y admits Ψ and fails the replacement Check.

Four findings: one P1 and three P3. The blocking issue is an equal-characteristic classification input represented as supplied by a characteristic-zero target. This is repairable without narrowing the roadmap. None of the findings re-raises a repair marked not actionable. README.md, Suggested.lean, metadata.toml, sources.toml and design/plan.json were not changed.

## Verified sound

Read all 58 target subsections, their API lists, Checks, proof routes and Needs lines, all 12 layer dependency summaries, the conventions and contracts, and the complete Lean and manifest files. Revisited each earlier finding before the new adversarial pass. The numerical and symbolic tests below are countermodel probes, not a claim to have proved the roadmap's future theorems.

### Previous findings, individually

The identifiers below are those in the repair report. Every requested repair is present; R01 above is a further scope defect found while checking the repaired supplier pattern.

| Earlier finding | Repaired passage and location | Verification | Status |
| --- | --- | --- | --- |
| F01, supplier-less construction gaps | README:7: “The smooth Eilenberg–Watts coevaluation and triangle identities of §5.3, the spherical counit transports of §9.2, and the spin-section and inverse-transpose transport computations of §9.4 are targets of this roadmap.” | All three targets remain; no gap has supplier `none`. The ordinary categorical tensor is separately assigned to EnhancedDerivedSheaves. | Repaired |
| F02, number-field theta input | README:11: “function-field vector-space Poisson adapter and rational symplectic splitting” | Contracts name MetaplecticAutomorphicForms §§4.1, 4.1a, 4.2–4.4. §6.3 uses rational reindexing, trivial rational phases and this Poisson theorem. | Repaired |
| F03, supporting theorem in acceptance file | Suggested.lean:7: “None of these headlines is statable at the pins, for the reasons below.” | The generic coherence declarations were deleted; §5.1 remains a prose target. There are zero declarations in the Lean file. | Repaired |
| F04, compound gap | README:77: “What FunctionFieldArithmetic must provide (gap:determinant-pushforward)” | This, `sl2-rational-unipotent-generation` and `eisenstein-constituent-automorphicity` are three distinct, named contracts, matched in the plan. | Repaired |
| F05, circular global zeta contract | README:65: “For each φ, φ′ ∈ C_c^∞(Γ\GL₂(A)) and Φ ∈ S(M₂(A))” | Supplier input is the ordinary double Godement–Jacquet integral. §6.5 owns theta unfolding and the absolute-value majorant; the signed example gives 0 versus absolute mass 2. | Repaired |
| F06, number-field factorization | README:59: “Representation prerequisites, Restricted tensor realizations, supplies the function-field cuspidal restricted tensor factorization.” | That supplier paragraph explicitly includes function fields. The gap asks separately for ordinary fixed-central-character multiplicity one, not the existing factorization or strong multiplicity one. | Repaired |
| F07, central-lattice carrier | README:11: “Section 6.2 forms compact and unrestricted smooth functions on the quotient of §6.1 using SmoothRepresentationsOfLocalGroups §SR.1.1” | §6.2 uses Γ\G without a central-lattice quotient; constant functions and nonzero degree-periodic functions separate it from the compact carrier. | Repaired |
| F08, missing reference-vector inputs | README:805: “§4.2; §5.5; Completed/RestrictedProducts, Layer 1” | Local counit and coassociativity precede restricted tensor comparison. The Poisson/rational-splitting inputs are also named in §6.3. | Repaired |
| F09, inaccurate locators | README:146: “Constructions 2.7 and 2.9, p. 11”; README:342: “equation (3.2) and Definition 3.2, p. 19” | Dor23 lines 496, 509, 969 and 976 agree. Remark 3.47 is now p. 33; theta-characteristic attribution names Remark A.2, p. 50 and Arm67. | Repaired |
| F10, gap duplication and conventions | README:61: “extending the scalar residue-character normalization of AL.3, Curve additive analysis” | Arbitrary-character finite-dimensional/partial transforms remain the extension. The Kirillov contract now concerns irreducibles only; firm/nondegenerate conventions are explicit. Classification remains the separate R01 issue. | Repaired |
| F11, uncomputed Checks | README:222: “(m,y) ↦ (m,y·det m)”; README:688: “θ(a(0),1) = 2 whereas a(θ(0,1)) = 5” | diag(π,1) changes y to yπ; Cantor pairing gives 2 and 5. Both negative controls now distinguish the proposed wrong models. | Repaired |

### Seeded source sample and unverified locators

All 15 sampled targets were read in the cached legal texts. The published Dor23 numbering, Dor21 arXiv v1, GH11 arXiv v1 and Dor20Z arXiv v1 agree with the manifest. No author-flagged unverified locator remains. Arm67 is separately settled as uncertified; it was not requested again. Source text was not copied into the repository.

| Target | Locator read | Hypothesis/formula check |
| --- | --- | --- |
| 0.1 Determinant pairing | Dor23 polarization before Construction 2.7, pp. 10–11; Dor23 line 491 | The trace polarization agrees. Extension from the source's field to a commutative ring is the polynomial identity with unimodular Gram matrix, verified below; no division by 2 is introduced. |
| 0.5 Open triality kernel | Dor23 equations (2.1)–(2.2), p. 8, line 358; Lemma 2.19, p. 15, line 768; Remark 2.22, p. 17, line 865 | Outer/mirabolic stability, generation and the determinant coordinate change agree. Full middle stability is correctly excluded. R02 concerns its formal supplier, not the source theorem. |
| 1.5 Local zeta comparison | Dor23 Proposition 2.5, p. 10, line 453; comparison at line 854, p. 17 | Generic irreducibility, the multiplication-by-y comparison and Mellin exponents s−1/2 and s+1/2 agree. |
| 2.3 Weak symmetric tensor data | Dor23 Definitions 3.7–3.8, pp. 20–21, lines 1021–1073 | No associator is part of these weak data; the unit comparison has the stated direction. Rescaling the unitor requires rescaling the functor's unit comparison. |
| 2.4 Whittaker unit | Dor23 Construction 3.10 and Construction 3.16, p. 22, line 1093; equation (3.3), p. 23, line 1150 | The nontrivial character quotient, compact induction, action convention and unit integral agree. |
| 2.5 Whittaker trace and symmetry | Dor23 Remark 3.17, p. 23, line 1178; Claim 3.18, p. 24, line 1199; Corollaries 3.20–3.21, p. 25, line 1258 | Transpose acts as +1 after both twisted quotients, yielding the trace and unit symmetry. It is not a Hermitian duality. |
| 3.3 Whittaker unit and Bernstein centre | Dor23 Claim 3.32, p. 27, line 1372; proof, p. 29, line 1460 | Full centre and finite-support enrichment are distinguished. The README's inverse via unitors and central balance is valid independently of detection only on generic simples. |
| 3.5 Degeneracy-free equivalence | Dor23 Theorem 3.26, Corollary 3.27, Remark 3.28, p. 26, line 1318; Claim 3.33, p. 27, line 1375 | Essential image, colimit closure and transferred monoidal structure agree. The target does not identify all generic representations with this image. |
| 4.2 Spherical counit and comultiplication | Dor23 Constructions 3.44–3.45, pp. 31–32, line 1554; Remarks 3.47–3.48, p. 33, line 1620 | The q⁻ν factor, π⁻ν mass and h = diag(1,−πν) convention agree. The README correctly repairs the source's full-character-kernel error to the conductor lattice. |
| 5.1 Idempotent coherence theorem | GH11 Theorem 3.1.2, pp. 10–11, line 481; Appendix A, p. 15, line 705 | Both defect-intertwining equations and invertibility are retained. Pentagon cancellation gives a² = a³ and a = id. |
| 5.4 Generic idempotent algebras | Dor23 Example 3.55, p. 35, line 1741; Remark 2.6, p. 10, line 474 | A nonzero chosen Whittaker unit determines the product; rescaling it changes multiplication inversely. Determinant characters are excluded by genericity. |
| 6.5 Function-field zeta comparison | Dor23 Remark 4.11, p. 44, line 2181; initial integral conventions, p. 39, line 1915 | The inverse transpose in the coefficient, the adelic multiplicative variable and both half shifts match. Absolute convergence is a declared ordinary-integral input plus this target's positive unfolding, not inferred from cancellation. |
| 10.1 Parabolic normalization module | Dor21 Definition B.2.8, p. 18, line 742; Definition B.3.1, p. 20, line 832; Proposition B.5.4 proof, p. 28, line 1306; Dor20Z Claim A.3, p. 26, line 1060 | The additive first coordinate includes zero; η has factor ∣λ²y∣⁻¹ and coordinates (λy,λ⁻¹). The freeness comparison is noncanonical. |
| 11.1 Automorphic torus category | Dor21 Definition C.3.1 and Remark C.3.2, p. 44, line 2090 | Quotient representations, inflation, the convolution unit and relative tensor agree. Rational invariance is required. |
| 11.6 Irreducible automorphic equivalence | Dor21 Theorem C.5.1 and Lemma C.5.2, pp. 53–54, line 2486; Remark C.5.3, p. 54, line 2538 | Irreducible W-modules require the unit quotient. Steinberg uses both nonsplit extensions; the README does not substitute agreement of central characters. R01 remains a supplier scope issue. |

The repaired source-dependent routes were also reopened: Dor23 lines 2032–2166 for restricted references and rational theta invariance, lines 2535–2564 for the deliberately owned Appendix A transports, and Dor21 lines 2297–2334 and 2421–2466 for degree splitting and the large-degree correction. The additional source slips found during this pass are listed at the end.

### Adversarial values: conventions and contracts

All analytic rows use complex coefficients, a genuine local field, a nontrivial continuous additive character and nonzero multiplicative coordinates. Characteristic two is excluded from the oscillator/global field scope, but residue characteristic two is admitted; q = 2 and 3 give nonzero normalization factors. The ring-valued determinant target is independently tested in characteristic two and on a nonreduced ring. There is no arbitrary rank, fan, ideal, polynomial-degree or natural-subtraction parameter in these signatures; those unrelated degeneracies do not instantiate them. Universe sizes are fixed in the conventions, and infinite products mean smooth categorical products.

| Statement | Instances tried | Values on the two sides / competing models | Result | Change |
| --- | --- | --- | --- | --- |
| Field and denominator scope | q = 2,3; y = 0; q = 1 | q⁻¹ = 1/2,1/3; y = 0 has membership 0 in F×; q = 1 is not a field cardinality | No 0/0; dyadic residue fields retained | None |
| Classification scope | F = 𝔽₃((t)) versus ℚ₃ | Both have q = 3 and ν(π) = 1/3; 3·1 is 0 in the first and nonzero in the second | Equal formulas do not transfer the supplier's hypothesis | R01 |
| Right-action transpose | g = u(1), h = diag(2,1) | (gh)ᵀ = hᵀgᵀ = [[2,0],[1,1]]; gᵀhᵀ = [[2,0],[2,1]] | Noncommuting test fixes order | None |
| S₃ action order | (12),(23) | Opposite orders give the distinct cycles (123),(132); a transposition squared gives identity | Not an abelianized permutation action | None |
| Bilinear versus Hermitian dual | pairing value 1, scalar i | Bilinear second-slot value i; Hermitian value −i | §6.2 pairing and §11.4 positivity have distinct conventions | None |
| Compact averaging | C₂ swaps (2,0) | Averaged vector (1,1); unnormalized sum (2,2); second averaging still (1,1) | Normalization and idempotence hold | None |
| Negative Fourier kernel | δ₁ on C₃; ζ³ = 1 ≠ ζ | Transform (1,ζ⁻¹,ζ⁻²)/√3; square δ₂ since Σx ζ⁻ˣ⁽¹⁺ʸ⁾/3 = 1 iff y = 2 | Reflection, not identity | None |
| Firm/nondegenerate modules | ℂ² and ⊕ℕ ℂ; infinite tuple | (e₁+e₂)v = v in ℂ²; finite projector on (1,1,…) gives a different tuple | Finite local units exclude full-product substitution | None |
| Smooth limit | stabilizers Jn with nonopen intersection | Each coordinate is smooth; tuple's common-open-stabilizer predicate is false | Smooth part is essential | None |
| Pair-category tensor | (Z,0),(0,Zsph),(0,0) | Mixed product (0,Zsph); zero product (0,0) | Correct weak unit and zero | None |
| Global degree and residue conventions | places of degrees 2,3; residues r,−r | Degree 3−2 = 1; character product e₀(0) = 1; rational idele norm 1 | No degree-one place assumption | None |
| Spin carrier | ℙ¹, L = O(−1) versus O | L² = O(−2) = Ω; O² = O ≠ Ω | Degree equality alone is not the datum | None |
| Ordinary categorical tensor | Vectℂ, identity regular bimodule | ℂ ⊗ℂ ℂ = ℂ; both triangle maps send 1 to 1 | Ordinary, not stable, tensor requested | None |

### Adversarial values: every target

The rows cover each numbered statement and its defining data/API, with supplementary rows where distinct formulas require different probes. They also test the associated Checks and layer examples. “Pass” means these computations agree with the stated hypotheses and source; it does not turn a boundary computation into a proof of a deep theorem. R01 and R02 identify formal inputs that are still missing from the stated dependency routes.

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 determinant polarization | m = [[1,2],[3,4]], n = [[5,6],[7,8]] | det(m+n)−det m−det n = −8+2+2 = −4; tr(m)tr(n)−tr(mn) = 65−69 = −4; wrong positive cross terms give 60 | Pass | None |
| 0.1 bilinearity/perfectness | zero ring, 𝔽₂, ℤ[ε]/ε² | Gram determinant 1; B(E₀₀,E₁₁) = 1, B(E₀₁,E₁₀) = −1; B(εE₀₀,E₁₁) = ε; B(m,m) = 2 det m = 0 in 𝔽₂ | Pass, including zero ring's unique invertible zero-module map | None |
| 0.2 symplectic triple action | determinants π,π⁻¹,1; scalar triple (−I,I,I) | Alternating-form multipliers ππ⁻¹ = 1 and (−1)² = 1; tensor scalar in second example is −1 | Determinant-product condition, not scalar-product condition | None |
| 0.2 action faithfulness control | (2I,(1/2)I,I) over ℚ₃ | Determinant product 4·1/4 = 1; action scalar 2·1/2 = 1 although triple ≠ identity | README claims action, not injectivity | Source misprint only |
| 0.3 rigidified lift | identity, (13), scalar modification c | Identity scalar 1; E₀₁ ↦ E₁₀ ↦ E₀₁; c ≠ 1 changes the prescribed restriction | Rigidification excludes arbitrary lift scalar | None |
| 0.4 generator formulas | m = 0,I₂; y = π, q = 3; w twice | Unipotent phases 1,e(bπ); two Fourier prefactors 1/81 and scaled-square factor 81 give 1; m reflects to −m | Pass; w² = −I | None |
| 0.5 open carrier/generation input | I₂,diag(π,1),0; positive ball near I₂ | Coordinates y,yπ; singular membership 0; Fourier value at 0 is positive ball volume | Open support is not middle-G stable | R02 citation |
| 0.5 singular-support Check | Ambient functions supported on det = 0; replacement Ψ = 1M₂(O)·1O× | Original function necessarily 0, both in Y and Y°; replacement has values 1,1,0 at (0,1),(I₂,1),(t⁻¹I₂,1), whereas Y° has value 0 at (0,1) | Original Check is vacuous; replacement discriminates | R04 |
| 0.5 mirabolic projector | inflated trivial module; Φ⁺ℂ | Φ⁺Φ⁻ gives 0 in first case and Φ⁺ℂ in second; Φ⁻Φ⁺ℂ = ℂ | Distinguishes ordinary and twisted quotient | R02 citation |
| 1.1 central balance | 0, identity, block projector e_c | All three actions 0, id, e_c; e_c² = e_c and e_ce_d = 0 for c ≠ d | Pass | None |
| 1.2 singular/Tor contraction | determinant-only residual action; V supercuspidal or 1G | SL₂ action on Q and functorial Tor is id; supercuspidal Jacquet term 0; (1G)SL₂ = ℂ ≠ 0 violates the vanishing hypothesis | No hidden flatness substitution | None |
| 1.3 spectral integral | Ψ(g,y) = Φ(g)f(y det g), coefficient integral 1 | μΨ(y) = f(y)∫βΦ = f(y); V⊕V would have 2² = 4 coefficient summands | Inverse determinant and irreducibility matter | R02 Schur citation |
| 1.4 Kirillov boundary | supercuspidal; generic principal series over F₃((t)) | Jacquet boundary 0 versus nonzero; compact test subspace alone misses the second | Carrier test passes; classification scope unresolved | R01 |
| 1.5 local zeta comparison | unit shell, uniformizer shell; zero function | Weights 1; ∣π∣^(s−1/2)∣π∣ = ∣π∣^(s+1/2); zero gives 0 = 0 | Pass | None |
| 2.1 IRL conversion | diag(π,1), u(1), double transpose | Diagonal remains diag(π,1), not diag(π⁻¹,1); u(1)ᵀe₁ = e₁+e₂; transpose twice id | Pass | None |
| 2.2 exotic bifunctor | zero input, flip twice, unit input | 0⊛N = 0; double flip fixes [m⊗n⊗Ψ]; Iunit⊛N = N | Expected zero, symmetry and unit tests | None |
| 2.3 weak data | Vect, unitor scaled by 2 | Symmetry paths both 2λ; correct functor unit comparison 2 restores its square; comparison 1 leaves λ versus 2λ | Weak data do not force a normalization or associator | None |
| 2.4 Whittaker quotient/unit | θ(u) = ζ ≠ 1, character vector W | W(ug) = ζW(g); quotient relation maps to ζW−ζW = 0; trivial action gives (1−ζ)W and quotient 0 | Pass | None |
| 2.5 trace/symmetry | M = Iunit; transpose on double twisted quotient | Φ⁻(Iunit⊛N) = Φ⁻N; transpose scalar +1, square +1; scalar −1 would violate unit symmetry | Pass | None |
| 3.1 degeneracy and orthogonality | 1G, St, nonsplit 0→1→E→St→0 | Φ⁻1G = 0; dim Φ⁻St = 1 but Ext¹(St,1) ≠ 0; Hom(E,1) = 0 since a retraction would split the extension | Genericity differs from degeneracy-free | R03 reference |
| 3.1 tensor nonclosure control | 1G⊛1G | Both factors have Φ⁻ dimension 0; product's Steinberg constituent gives dimension 1 | Not a monoidal quotient by degenerate objects | None |
| 3.2 finite-support enrichment | two blocks; infinite block tuple | e₁+e₂ fixes two-block Hom; every finite projector truncates (1,1,…) | Direct-sum enriched Hom differs from full Hom | None |
| 3.3 unit-centre inverse | f = id, z = 0, two block projectors | ψ(id)X = idX; ψ(0)X = 0; evaluations of e₁,e₂ are (1,0),(0,1); central balance gives zX = 0 if zI = 0 | Both inverse directions agree | None |
| 3.4 enhanced adjunction | N = 0,Z,e_cZ,⊕n Nn | F(0) = 0; F(Z) = Iunit; e_dF(e_cZ) = 0 for d ≠ c; returned direct-sum vectors have finite support | Unit/reconstruction pass | R02 citation |
| 3.5 essential image | 0,Z,St | Images 0,Iunit; St has Ext¹(St,1) ≠ 0 and so is excluded | Equivalence is not all generic objects | None |
| 4.1 twisted spherical generator | ramified χ with χ(u) ≠ 1 on O× | SL₂(O)-fixed dimension 1, K-fixed dimension 0; det on SL₂ is 1 | Correct larger generator | None |
| 4.2 counit/comultiplication | ν = 0,1, q = 3 | (scale,mass) = (1,δ₁),(1/3,δπ⁻¹); hKh⁻¹ upper entry −π⁻¹b at ν = 1 | Sign and exponent agree | None |
| 4.2 conductor negative control | coefficient-of-t⁻¹ character on F₃((t)) | e(t⁻²) = 1 but t⁻² ∉ O; u(t⁻²) is outside the compact conductor lattice | Full kernel is wrong | Source error already avoided |
| 4.3 spherical equivalence | generator; ramified χdet | Left and right counits both return generator; χdet has K-fixed dimension 0 but lies in image | Ambient unit is not claimed to be E | None |
| 4.4 joint generation | pair generators and mixed counit | (Z,0) ↦ Iunit; (0,Zsph) ↦ E; mixed tensor ↦ E; mixed Hom in product category is 0 while ε:E→Iunit is nonzero | Faithful is not full; generation input still needs scope repair | R01 |
| 5.1 defect theorem | θ(x,y) = 2xy on ℂ; zero object | Both triple products 4xyz; a = 1; pentagon values 1 = 1; unique endomorphism of zero object is id | Pass | None |
| 5.1 invertibility and compatibility | scalar 0 on nonzero line; Cantor pairing | 0² = 0³ but 0 is not invertible; Cantor triple values 2,5; θ(a(0),1) = 2 versus a(θ(0,1)) = 5 | Both omitted-hypothesis models excluded | None |
| 5.2 associator | three E inputs and mixed ε | Pentagon paths a²,a³; invertible a gives a = 1; mixed unit paths both ε | Mixed naturality must accompany generator coherence | None |
| 5.3 Frobenius self-duality | Vect, regular bimodule, zero | Evaluation ℂ⊗ℂ = ℂ; triangle composites 1↦1; zero input evaluates to 0 | Ordinary categorical tensor has required specialization | None |
| 5.4 generic algebras | unit 2u; determinant character | Product m/2 gives (m/2)(2u,v) = v; keeping m gives 2v; determinant character has Φ⁻ dimension 0 | Choice of nonzero unit matters | None |
| 5.5 convolution/firm algebra | orthogonal blocks, infinite sum | e₁e₂ = 0; local unit acts by 1 on its block; tuple (1,1,…) is not in ⊕ℂ | No global unit in a direct sum is assumed | None |
| 6.1 restricted tensor | two-place tensor with inserted reference y₃ | [x₁⊗x₂] = [x₁⊗x₂⊗y₃]; reference counit gives the unit class; 1G has noncompact support whereas 1K is compact | Reference laws and support agree | None |
| 6.2 compact/unrestricted carriers | compact indicator, constant 1, nonzero degree-periodic function | Indicator supported in finitely many level cosets; constant has value 1 at all degrees; periodic nonzero values repeat at unbounded degrees | Last two are not compact functions | None |
| 6.2 transpose dual | pairing value 1, scalar i in either slot | B(if,f′) = i = B(f,if′); Hermitian alternative in second slot gives −i | Bilinear convention retained | None |
| 6.3 rational theta invariance | transposed pairs (E₀₁,1),(E₁₀,1), weights a,b | Both sums a+b; rational unipotent phase e(bq det ξ) = 1; rational determinant norm = 1 | Reindexing and phase invariance agree | None |
| 6.3 Fourier/permutation generator | rational q = 1,a²; identity permutation | Global Fourier prefactor ∣q∣² = 1; rational change has covolume 1; splitting assigns identity scalar 1 | Poisson and scalar normalization are in scope | None |
| 6.4 theta multiplication | outer rational translate, swap inputs, zero | Reindexed finite sum unchanged; swapped two-term sum a+b; zero input maps to 0 | Descent and commutativity tests pass; target initially unrestricted | None |
| 6.5 global zeta identity | q = 3 shell; zero input; rational idele | 3^(−s+1/2)·3⁻¹ = 3^(−s−1/2); integrals 0 = 0 for zero data; rational norm 1 | Half shifts agree with local layer | None |
| 6.5 absolute convergence route | two unit-volume patches, values 1,−1 | Signed value 0; absolute mass 2 | Signed integral is not an absolute majorant | None |
| 7.1 Poincaré map | rational u(b), right translate g₀ | e(b) = 1; both action formulas sum W(γgg₀); zero W gives zero sum | Quotient and right action agree | None |
| 7.2 unit identity | rational-unipotent Fourier integral | Character orthogonality gives 1 when q det ξ = 1, otherwise 0 | Open determinant orbit selected | None |
| 7.3 image/kernel equality | determinant-character functional; Poincaré image; positive quotient patch normalized to fiber mass 1 | Pushforward on Poincaré image 0; positive patch has pushforward 1 at its chosen determinant, so is excluded; U and Γ invariance yield SL₂ action value 1 | Image inclusion and annihilator converse use the two named contracts | None |
| 7.4 compact algebra | unit image and swapped factors | m(u⊛x) = x = m(x⊛u); swapping factors leaves m(x,y); zero input 0 | Unit, symmetry and compact image agree | None |
| 7.5 modules on S and S̃ | unit; zero; two algebra inputs | Unit action x↦x; zero action 0; iterated action equals action by product on each generator | Does not assert a perfect object pairing | None |
| 8.1 abstract automorphic object | unit map factoring through I; zero object | Factorized unit acts as id; zero object's id is 0; arbitrary zero action on nonzero M gives 0 ≠ idM | Unitality excludes the wrong action | None |
| 8.2 fully faithful realization/closure | zero, smooth product, subquotient | Hom(0,N) = 0 on both sides; nonsmooth tuple has membership 0; kernel/cokernel inherit the same unit identity | No extension-closure claim introduced | None |
| 8.3 matrix Schwartz module | diag(a,1) stabilizer, rational coinvariants | Stabilizer determinant a, not a² as for aI; [γξ] = [ξ]; zero test function gives zero | Correct T rather than scalar centre | None |
| 9.1 spin lattice | ord ω = 2k, lattice πʲO; ℙ¹ at infinity | Annihilator exponent −j−2k; self-dual iff j = −k; ord∞dt = −2 gives j = 1; odd ord has no integral half | Actual spin datum supplies evenness | None |
| 9.2 global spherical coalgebra | unramified reference, adapted local lattice | Δ uses matrix-lattice indicator and δ₁; reference comparison 1↦1; both counits return 1 | Global counit is a target, not a source black box | None |
| 9.3 spin convolution | eJ averaging, orthogonal projectors, zero | eJ² = eJ; e(1−e)(f⋆g) = 0; zero product 0; local unit acts as identity on its finite support | Smooth Hom restriction and central balance agree | None |
| 9.4 spin/inverse transpose transport | s↦πs locally; g = diag(π,1), q = 3 | Lattice exponent decreases by 1; inverse-transpose weights 9 and 1/9 multiply to 1; rational global scale 1 | Involution test passes; multiplicativity remains the explicit transport target | None |
| 10.1 normalization action/η | λ = π,y = 1,q = 3; λ = 0 | ηf(π,1) = 9f(π,π⁻¹); ηf(0,1) = 0; action of (π,1) has factor 1/3 | Reciprocal weight or multiplicative first coordinate is wrong | None |
| 10.1 twist/invertible module | (a,d) = (π,1); chosen generator doubled | Weyl squared weight (1/3)·3 = 1; doubling a trivialization doubles its comparison | Involution is canonical, trivialization is not | None |
| 10.2 normalized adjunction | regular tensor generator; q = 3 | Hom(Lnorm⊗rW,V) = Hom(rW,Hom(Lnorm,V)); scalar normalization uses 1/3, with no chosen √3 | Correct left/right direction | None |
| 10.3 rank-one quotient | diag(0,λ), λ = 0,1; rank two | det = 0, so middle U phase 1; rank-two phase can be ζ ≠ 1 and ordinary coinvariants give 0; torus factor 1/3 at (π,1) | Includes additive zero and discards wrong cell | None |
| 10.4 lax/localized unit | two triple products; η inverted or not | Both triple outputs have two Lnorm factors; after localization η⁻¹η = 1; before it, nonzero boundary cokernel prevents inverse | Localization is essential | None |
| 10.5 intertwiner | double composite; conductor zero Fourier vector | M² corresponds to η⊗η(w), then to 1 after inversion; Fourier square δ₁↦δ₋₁ | Extra factors retained before localization | None |
| 11.1 quotient torus/category | trivial rational action; ρ(t) = ζ ≠ 1 | Descent condition true for ρ(t) = 1; (ζ−1)v ≠ 0 forbids descent; quotient identifies t and 1 | Inflation and unit use the quotient group | None |
| 11.2 global adjunction | local maps at infinitely many places; cusp | Reference mismatch set infinite, hence no restricted tensor map; cuspidal restriction 0 | Local localization does not invent a global η | None |
| 11.3 Weyl lifting identity | formal u,v,z | Left expansion D(uz,vz)+D(uz²,v)+D(v,uz²)+D(vz,uz); right expansion has exactly these four terms | Identity recovers arbitrary degree | None |
| 11.3 degree, half-power and stabilizer | deg(u/v)=−5,N=10, threshold 3; q=3 | Required degrees 10,5,15 all exceed 3; conjugated values both 1/√3; wrong conjugation gives √3 and 1/(3√3); rational stabilizer 4, normalized coefficient 4/4 = 1 | Negative degree and normalization controls pass | None |
| 11.3 diagonal generator | u = v; ℂ versus characteristic two | S(u,u) = 2D(u,u), so half recovers D over ℂ; 2 = 0 in characteristic two | Coefficient hypothesis is in force | None |
| 11.4 component ideals | cusp, anomalous Eisenstein quotient, degree 2/3 places | Cusp constant term 0; anomalous object's restriction and cuspidal projector both 0; degree difference 1 without a degree-one place | Kernel-only classification is excluded | None |
| 11.5 component equivalence | orthogonal component projectors, smooth tuple | e² = e, e(1−e) = 0; nonsmooth tuple excluded from reconstructed smooth object | Product/category convention retained | None |
| 11.6 irreducibles/W-modules | St, determinant character in its block | Whittaker dimensions 1,0; St⊛St ≅ St; a determinant character is not a unital St-module | Centre agreement alone is insufficient | R01 dependency |
| 11.7 finite-length restriction | length n = 0,1,2; cusp; χ = χ(w) | Bounds 0,2,4; cusp restriction 0; extension of two equal characters still dimension ≤ 1+1 = 2 | No distinct-character hypothesis silently used | None |

### Declared supplier gaps

All 15 slugs have a named supplier and the same needs sentence in `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/design/plan.json` and the README's Exact supplier contracts. None is treated as an unowned prerequisite merely because its supplier has not yet implemented it. The related clauses below describe one construction and its necessary interface, rather than unrelated bundled requests. None requests a package-owned Appendix A transport. R01 concerns an additional classification input, not rejection of the existing Kirillov gap.

| Gap slug | Owner and section | Minimality and discriminating test |
| --- | --- | --- |
| smooth-balanced-tensor | SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 | The pinned algebraic coinvariant tensor has no residual smooth action; the contract adds that construction and its unit/exactness interface. Test 0⊗M = 0 and regular⊗M = M. |
| smooth-tor-residual-action | SmoothRepresentationsOfLocalGroups SR.0d.1 | A derived category alone is not the stated two-group spectral sequence with surviving actions. Identity on Q must induce identity on Tor, rather than an unspecified action. |
| firm-centre-enrichment | SmoothRepresentationsOfLocalGroups SR.1.3, SR.3.2 | Existing locally unital modules do not state this entire closed/enriched comparison. The infinite tuple (1,1,…) belongs to full Hom but not finite-support enrichment. |
| transpose-central-distributions | SmoothRepresentationsOfLocalGroups SR.3.2 | Categorical centre and block decomposition do not already give the transpose-invariant distribution realization. Matrix transpose fixes a diagonal and interchanges E₀₁,E₁₀. |
| twisted-spherical-centre | SmoothRepresentationsOfLocalGroups SR.2.1, SR.3.2, SR.4.1 | Ordinary K-Satake misses ramified determinant twists: SL₂(O)-invariants have dimension 1, K-invariants dimension 0. The compactness and endomorphism assertions concern this one generator. |
| equal-characteristic-fourier | AutomorphicLFunctionsAndLocalFactors AL.0, AL.3 Curve additive analysis | Scalar residue-character Fourier already exists; arbitrary-character finite-dimensional perfect pairings and partial-transform compatibility are the extension. The negative C₃ Fourier square is δ₂. |
| normalization-module-freeness | AutomorphicLFunctionsAndLocalFactors AL.1 | The requested S(F×)-module freeness with its prescribed noncanonical generator is not ordinary scalar Fourier theory. The generator sends 1O× to 1O, including value 1 at zero. |
| compact-data-global-zeta | AutomorphicLFunctionsAndLocalFactors AL.3 | Ordinary compact-data double-integral convergence is separate from the package's theta/Whittaker unfolding. Absolute masses 2 versus signed 0 distinguish the obligations. |
| all-generic-kirillov | GL2AutomorphicRepresentationsAndTransfer R16.2.1, R16.2.8 | Existing R16.2.8 gives the characteristic-zero supercuspidal comparison. The gap adds all generic irreducibles and the full boundary: zero for supercuspidals, nonzero for principal series. It does not supply R01's classification. |
| rational-theta-characteristic | FunctionFieldArithmetic §0.3 | Picard points and line-bundle tensor carriers do not assert existence of L² ≅ Ω. On ℙ¹, O(−1) works and O fails. Dor23 attributes existence to Arm67; direct certification of Arm67 remains unavailable. |
| ordinary-presentable-linear-tensor | EnhancedDerivedSheaves E5:presentability.2 | Its presentable ∞-categorical/stable tensor is different from the requested ordinary ℂ-linear abelian-category tensor. In Vect the regular bimodule gives triangles 1↦1. |
| determinant-pushforward | FunctionFieldArithmetic §6.2 | Existing central-lattice functions do not give this compact Γ\G fiber integration with disintegration. A positive patch can have fiber integral 1, while a Poincaré image has integral 0. |
| sl2-rational-unipotent-generation | FunctionFieldArithmetic §6.1 | Adelic group construction does not state this generated-subgroup inclusion. Rational Weyl conjugation of upper unipotents supplies lower unipotents; det u = 1 for both. |
| eisenstein-constituent-automorphicity | FunctionFieldArithmetic §6.3 | Constant terms alone do not assert automorphicity of every induced irreducible constituent. The determinant character constituent has Whittaker quotient 0 and must still be included. |
| function-field-cuspidal-multiplicity-one | AutomorphicLFunctionsAndLocalFactors AL.3 | Strong multiplicity one compares isomorphism classes; this asks for multiplicity 1 in a fixed-central-character cusp space. The supplied restricted-tensor factorization is not requested again. |

### Supplier resolution and direction

Resolved citations anew against content main `5f173a7b9ac37eb6b62d01eb3db5047b92d19363` and the supplied open-head index dated 2026-10-25T10:15:35Z. `roadmaps resolve` returned no missing-name leads; this did not detect the semantic scope and target-location issues R01–R02. The service's lack of pinned packages on its own host was not used as evidence about the local pins.

In this table, each roadmap filename is `TauCetiRoadmap/<name>/README.md` unless another path is given. Line numbers refer to the roadmap file, excluding the service's output header. All Needs lines were compared with these resolutions and the declared gaps.

| Supplier | Resolved targets and file evidence | Result |
| --- | --- | --- |
| SmoothRepresentationsOfLocalGroups | SR.0.1–SR.0.4 (lines 558, 617, 696, 800); SR.0d.1–SR.0d.2 (1593, 1655); SR.1.1–SR.1.3 (981, 1151, 1230); SR.2.1–SR.2.3 (1833, 1962, 2122); SR.3.2 (2603); SR.4.1 (3083) | Smooth carriers, duals, locally unital modules, induction/Jacquet/Whittaker, centre and ordinary Satake exist. Countable Schur is instead in SR.3a.1; mirabolic input is SR.5.1: R02. |
| SmoothRepresentationsOfLocalGroups, adjacent ownership | `jacquet-subrepresentation` at 2326; `admissibility-of-irreducibles` at 2335; `langlands-classification` at 2832; `mirabolic-derivatives` at 3647; `derivative-exactness` at 3696; `segment-representations` at 4324 | These are existing inputs, not new constructions for this roadmap. Conditional Langlands classification is not an unconditional replacement for R16.2.1. |
| AutomorphicLFunctionsAndLocalFactors | Representation prerequisites, Restricted tensor realizations at 261; AL.0 Local Schwartz–Bruhat spaces and finite Fourier levels; AL.1 Local eigendistributions and Hecke L-functions; AL.2 Godement–Jacquet standard functions; AL.3 Curve additive analysis at 2414 and Function-field local factors, multiplicity one and converse theorem at 2426 | Read local scope, function-field completion/measure comparisons, arbitrary ramified factors and restricted-tensor paragraph. Additional interfaces are explicitly contracted. |
| MetaplecticAutomorphicForms | §§0.15–0.18, 1.1–1.4, 2.4b–2.7; §4.1 at 1150, §4.1a at 1162, §4.2 at 1174, §4.3 at 1192, §4.4 at 1200 | Function-field vector Poisson and rational splitting now replace the former number-field-only theta input. Odd-field-characteristic global scope and local dyadic distinctions are retained. |
| FunctionFieldArithmetic | §§0.1–0.3 at 440, 478, 509; §§2.1–2.3 at 676, 713, 749; §§4.8–4.10 at 1500, 1536, 1575; §5.8 at 1995; §§6.1–6.4 at 2082, 2133, 2178, 2226 | Divisor/idele degree, differential measures, ray classes, degree-sensitive Chebotarev and central-lattice cusp finiteness resolve. The package uses the quotient of §6.1, not §6.2's central-lattice carrier, for S. |
| GL2AutomorphicRepresentationsAndTransfer | R16.2.1 at 617, scope at 619; R16.2.8 at 712, scope at 716 | Sections exist; classification remains characteristic zero. R01 records the uncontracted extension. |
| ArithmeticGaloisDuality | R02.3.2 at 1989 | Read the function-field idele, degree and compact degree-zero class input used through the arithmetic suppliers. |
| AlgebraicVectorBundles | L0B at 228, L0C at 254 | Invertible sheaves, tensor/dual and polynomial operations exist; existence of a theta characteristic is a separate gap. |
| EnhancedDerivedSheaves | E5:presentability.2 at 1624, Tensor products of presentable categories and module base change at 1674 | The ordinary complex-linear extension is correctly distinguished from the ∞-categorical tensor. |
| Completed/RestrictedProducts | `Completed/RestrictedProducts/README.md:268`, Layer 1; line 411, Change of family and double cosets; Scope and ownership and conventions | Finite changes/reindexing of restricted products exist. They do not purport to construct the triality restricted tensor of representations, owned in §6.1. |

The specified mechanical dependency command, with this package's README, name, merge order and `--movable`, exited 0:

```text
depcheck: 51 roadmaps, 587 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Relevant positions in `merge-order/ORDER.txt` are EnhancedDerivedSheaves 18, SmoothRepresentationsOfLocalGroups 26, AutomorphicLFunctionsAndLocalFactors 94, GL2AutomorphicRepresentationsAndTransfer 104, MetaplecticAutomorphicForms 165, FunctionFieldArithmetic 168, and this roadmap 288. The R02 corrections remain downward supply. No supplier was moved and no merge-order file was edited.

### Duplication by object and native declarations

Used `roadmaps list`, `roadmaps grep` and `roadmaps show`, including the supplied main/open-head index, rather than treating an absent local folder as absent work. Searches covered triality and exotic products, degeneracy-free representations, Whittaker units and universal Whittaker modules, balanced tensor, Eilenberg–Watts, idempotent coherence, Kirillov models, determinant pushforward, normalization modules and theta characteristics. Read the matches relevant to the consumed objects. The broad ownership query returned 201 matches; narrower object queries distinguished scalar metaplectic theory, generic representation theory, p-adic Kirillov applications and this package's exotic construction.

The existing SR.5.2 Whittaker projectives, Bernstein endomorphisms and segment representations remain supplier-owned. §3.3 here additionally identifies the actual exotic unit and its multiplication-compatible centre action over the package's field scope. The categorical Eilenberg–Watts target is the comparison for this smooth category, while the general ordinary presentable tensor is supplied. No other readable roadmap was found to own Dor's exotic product, degeneracy-free equivalence, theta automorphic algebra or normalized induction construction. Type-D₄ diagram triality and unary-theta characteristics are different objects. No package Lean declaration duplicates an existing fully qualified name: there are zero package declarations.

The board index was read before the ownership conclusions. Five other indexed package READMEs were readable at their exact heads: AnalyticNumberTheory (`310e834`), ArithmeticStatistics (`357e723`), AutomorphicCongruences (`b047dd3`), KatoEulerSystems (`a3ba9c5`) and LogicAndDefinabilityInNumberTheory (`d36cfa5`). The object search found no competing ownership in those files. The fifteen unreadable board paths are listed below; no assertion of absence is made about their contents. The content-roadmap open-head search was available; board-head README failures are a distinct limitation.

Pins read from the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations were opened at those pins:

| Declaration | Pinned file and line | What the native object does and does not supply |
| --- | --- | --- |
| `Matrix.det_fin_two` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809` | The 2×2 commutative-ring determinant formula; no new determinant theory is planned here. |
| `Matrix.trace`, `Matrix.trace_transpose`, `Matrix.trace_mul_comm` | `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`, 71, 156 | Native trace and identities; the package's particular polarization and triality use them. |
| `Rep.coinvariantsTensor` | `Mathlib/RepresentationTheory/Coinvariants.lean:410` | Algebraic representation coinvariants into modules, with no smooth residual-action assertion. |
| `CategoryTheory.SymmetricCategory` | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:366` | Requires a monoidal category and its associator; cannot stand in for constructing the exotic associator. |
| `CategoryTheory.CommMon` | `Mathlib/CategoryTheory/Monoidal/CommMon_.lean:26` | Bundles a genuine commutative monoid object in an existing braided monoidal category. |
| `CategoryTheory.Mod` | `Mathlib/CategoryTheory/Monoidal/Mod.lean:227` | Actual module objects once the ambient monoidal category and algebra exist. |
| `CategoryTheory.Functor`, `CategoryTheory.Iso` | `Mathlib/CategoryTheory/Functor/Basic.lean:40`; `Mathlib/CategoryTheory/Iso.lean:54` | Mapping identity/composition and inverse equations; no exotic tensor is encoded by these alone. |
| `TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272` | Discrete underlying topology and open point stabilizers, on a TopRep object. |
| `TauCeti.SmoothDiscreteTopRep`, `TauCeti.DiscreteRep` | Same file, lines 618 and 631 | A native category of smooth discrete representations does exist. DiscreteRep also requires continuous scalar multiplication; choosing coefficient topology remains material. These carriers lack the triality kernel and exotic tensor. |
| `TauCeti.discreteRepEquivSmoothTopRep` | Same file, line 833 | The discrete/TopRep dictionary, not the Whittaker, Kirillov or automorphic-algebra comparison. |
| `TauCeti.D4Tripled.trialityAutomorphism` | `TauCeti/Algebra/Lie/D4/Tripled/Triality.lean:142` | Algebraic D₄ group-scheme automorphism, not the smooth S₃ triality kernel. |

Thus the earlier review's blanket assertion that no smooth-representation category exists at the pins is too strong. The actual absence relevant to acceptance is the constructed exotic/analytic objects in each headline. The native smooth-discrete dictionary does not make those headlines statable with a few simple definitions. No free Prop, arbitrary operation, or assumed conclusion was used to replace them.

### Headline coverage, Lean and shape

The README's 15 headline groups and the missing carriers named in the module docstring are:

| Headline | README targets | Missing constructed carrier/interface |
| --- | --- | --- |
| Rigidified triality lift | 0.3 | Smooth scalar metaplectic extension and its specified lift |
| Singular/open/Kirillov spectral comparisons | 1.2–1.4 | Smooth balanced/derived tensor, Y and full Kirillov realization |
| Local zeta comparison | 1.5 | The spectral comparison and its actual integrals |
| Whittaker unit and trace | 2.4–2.5 | Exotic product and Whittaker unit |
| Unit centre and degeneracy-free equivalence | 3.3–3.5 | Firm Bernstein enrichment and the constructed Whittaker functor |
| Spherical equivalence and joint generation | 4.3–4.4 | Exotic spherical coalgebra and component functors |
| Unique exotic associator | 5.2 | Actual exotic bifunctor and generator comparisons |
| Categorical Frobenius self-duality | 5.3 | Ordinary linear categorical tensor and smooth Eilenberg–Watts comparison |
| Generic idempotent algebras/local convolution | 5.4–5.5 | Exotic category and spherical coalgebra |
| Adelic monoidal structure, theta multiplication and zeta | 6.1–6.5 | Restricted tensor kernels and the required smooth automorphic carriers |
| Compact automorphic algebra | 7.3–7.5 | Actual Poincaré map, I and its exotic multiplication |
| Fully faithful realization and matrix Schwartz automorphicity | 8.2–8.3 | The exotic algebra I and its modules |
| Spin coalgebra, convolution and transports | 9.2–9.4 | Theta characteristic, adelic coalgebra and its constructed product |
| Normalized induction, multiplication and intertwiner | 10.3–10.5 | Normalization module, internal Hom and tensor-compatible localization |
| Automorphic adjunction, lifting, components, irreducibles, finite length | 11.2–11.7 | Actual automorphic categories, torus carriers and normalized functors |

The supporting unit-free coherence theorem in §5.1 is statable as abstract categorical mathematics; the previous review correctly distinguished it from these acceptance headlines. It remains in the README and has not been restored as padding.

Ran `lake env lean` on the absolute package Suggested.lean path from the pinned content checkout, as required. It exited 0 with empty output: no errors and no warnings, including no sorry warnings. The file has the single import `Mathlib`; no Tau Ceti module build was needed. No Lean process remains running.

Mechanically enumerated every declaration: zero definitions, instances, structures, theorems and examples. Consequently the generated `#check @name` list is empty, there are no section binders to lose, and there is no sorried theorem on which to run the one-tactic padding probe. Reading the native definitions above supports the missing-carrier explanations; no statable headline was replaced by a stand-in. The file contains one module docstring and the required namespace, no sorry'd data, no `set_option`, no admitted examples and no extra imports.

Read AlgebraicVectorBundles, Completed/RestrictedProducts and ComplexTori on main for shape. The package has the Summary, scope, conventions, supplier contracts, build paragraph, 12 layers, layer Examples/Dependencies, downstream consumers and references. All 58 target subsections have a locator, Needs line and at least three Check bullets; definition interfaces are in prose. R04 distinguishes bullet count from a genuinely discriminating Check. No route-specific good-place restriction, computational algorithm, copied source passage, re-planned base roadmap, process narrative, forbidden Lean command or local machine path was found in the package. R02 and R03 record the remaining citation defects rather than hiding them behind the shape check. The accessible ownership evidence supports this roadmap's scope; the unavailable board files limit the ownership audit as stated below.

## Not verifiable

- **Arm67**, pp. 238–246: the manifest records it as uncertified and paywalled. Dor23 line 2512 confirms the attribution, but the original existence proof was not inspected. The settled entry was left alone and no new reference request was made.
- The following exact board-head README requests returned HTTP 404. Their contents and ownership overlap could not be checked. These are not claims that the packages do not exist; the supplied board index explicitly lists them. The main/open-content-head search and all independent mathematical/source checks were completed.

| Unreadable repository-relative path | Indexed head | Reason |
| --- | --- | --- |
| `packages/ArithmeticLocallySymmetricSpacesPartII/README.md` | 84a41ac | HTTP 404 |
| `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` | 948c94c | HTTP 404 |
| `packages/CrystallineCohomologyPartII/README.md` | 84ea77e | HTTP 404 |
| `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md` | 80a66cc | HTTP 404 |
| `packages/HigherHidaAndColemanTheory/README.md` | da88512 | HTTP 404 |
| `packages/LawrenceVenkateshMethod/README.md` | 9ee7ac3 | HTTP 404 |
| `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` | 7e88c38 | HTTP 404 |
| `packages/PELModuliPartII/README.md` | d4bb48d | HTTP 404 |
| `packages/PadicHodgeTheoryPartII/README.md` | 6502997 | HTTP 404 |
| `packages/PadicLocalLanglandsForGL2QpPartII/README.md` | 3e0777d | HTTP 404 |
| `packages/RealSurfacePeriodIndex/README.md` | 875bca4 | HTTP 404 |
| `packages/SchemeAndStackFoundationsPartII/README.md` | accb0a0 | HTTP 404 |
| `packages/ShimuraVarietiesPartII/README.md` | 57dc0a4 | HTTP 404 |
| `packages/VStackSheavesAndLisseCategoriesPartII/README.md` | 0987ba7 | HTTP 404 |
| `packages/VectorBundlesAndIsocrystalsPartII/README.md` | b58d862 | HTTP 404 |

## Source issues

- **Misprint** in Dor23 at Construction 2.7, p. 11, Dor23 line 503: the source says the triple action is an embedding; it should be a homomorphism, with scalar kernel witnessed by (2I,(1/2)I,I); affects nothing.
- **Misprint** in Dor23 at the proof of Proposition 2.12, p. 14, Dor23 line 678: the source says a torus triple belongs to F×; it should belong to (F×)³; affects nothing.
- **Gap** in Dor23 at the proof of Lemma 2.20, p. 17, Dor23 line 848: the source says the remaining Tor term vanishes from coinvariant vanishing; it should also establish the identity residual SL₂ action on Tor by functoriality; affects the proof.
- **Misprint** in Dor23 at Warning 3.25, p. 25, Dor23 line 1292: the source says St is the trivial representation in the extension description; it should identify St as Steinberg and 1G as the trivial subobject; affects nothing.
- **Error** in Dor23 at Remark 3.47, p. 33, Dor23 line 1626: the source says the compact conjugate intersection equals the whole character kernel; it should use the conductor lattice, since e(t⁻²) = 1 over 𝔽₃((t)) need not imply t⁻² lies in O; affects a stated result.
- **Misprint** in Dor23 at the proof of Claim 4.3, p. 41, Dor23 line 2035: the source says the reference vector is the indicator of GL₂(Fv); it should be the indicator of GL₂(Ov); affects nothing.
- **Misprint** in Dor23 at the proof of Proposition 4.9, p. 43, Dor23 line 2125: the source says the Fourier integrals run over rational matrices; it should integrate over adelic matrices while keeping the summation rational; affects nothing.
- **Misprint** in Dor23 at Construction 4.15, p. 45, Dor23 line 2267: the source says the pairing integral runs over GL₂(A); it should run over GL₂(F)\GL₂(A); affects nothing.
- **Gap** in Dor23 at Claim A.6, p. 51, Dor23 line 2544: the source says the adelic coalgebra is counital without constructing its counit transports; it should construct the lattice-adapted global counit and verify both equations; affects the proof.
- **Gap** in Dor23 at Construction A.7 and Remark A.8, p. 51, Dor23 line 2555: the source says section independence and inverse-transpose multiplicativity hold without the transport calculation; it should compare comultiplication and multiplication under differential rescaling and weighted inverse transpose; affects a stated result.
- **Misprint** in Dor21 at Remark B.2.1, p. 16, Dor21 line 637: the source says the outer determinant uses g₁ and g₂; it should use g₁ and g₃; affects nothing.
- **Gap** in Dor21 at Remark C.4.5, p. 49, Dor21 line 2297: the source says to choose a degree-one place; it should choose a degree-one idele, since a curve need not have a rational point; affects the proof.
- **Error** in Dor21 at the proof of Lemma C.4.9, p. 52, Dor21 line 2460: the source says an arbitrary ray class has a prime representative; it should first shift to sufficiently large positive degrees and recover the class by the four-term convolution identity; affects the proof.
- **Misprint** in Dor21 at the proof of Lemma C.5.2, p. 53, Dor21 line 2513: the source says the condition characterizes an M-module; it should say an St-module, with the specified unit-induced comparison St⊛M ≅ M; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "765f8d3c6f7afeef98bf37d63e4fa717d0b6e697", "job": "REV-PKG-ExoticMonoidalStructuresAndAbstractAutomorphicity~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
