# Review of SiegelModularForms (pull request #1714 at c89d13b)

**Verdict:** needs changes

The gate passes, but the acceptance statements contain false identities and a false uniqueness theorem. This review covers only `TauCetiRoadmap/SiegelModularForms/`. Previous findings were checked first; their disposition and the full-review evidence follow the findings. No pull-request file was changed.

## R01 (P1) — The Maass relation includes negative definite indices

**Location:** README.md:2101 and Suggested.lean:1397: “∀ n r m : ℤ”.

**Claim:** The predicate used by the Maass dimension and Saito–Kurokawa headlines imposes the relation on every nonzero integer triple, including matrices outside the positive semidefinite cone.

**Witness:** For χ₁₀ and (n,r,m)=(−1,1,−1), Koecher gives left side 0. The gcd is 1, so the right side is a(1,1,1)=1.

**Repair:** Require the index to be positive semidefinite and nonzero, in both 9.3 and 9.4 and the Lean predicate. Keep the negative-index vanishing theorem separately. The counterexample is then excluded; (1,1,1) still gives 1=1 and (2,2,2) gives −272+512=240. Recheck both dimension headlines and saito_kurokawa against the corrected predicate.

## R02 (P1) — Reduction is unique for the wrong equivalence relation

**Location:** README.md:700 and Suggested.lean:782: “GL₂(ℤ)-equivalent to exactly one reduced form”.

**Claim:** The condition |r|≤n≤m with the boundary sign convention is proper binary reduction, but the orbit in exists_unique_reduced allows determinant −1.

**Witness:** (2,1,3) and (2,−1,3) both satisfy IsReduced. Their determinant is 23/4>0. U=diag(1,−1) has determinant −1 and sends one to the other.

**Repair:** Distinguish oriented SL₂ reduction from unoriented GL₂ reduction. For the GL₂ representative use 0≤r≤n≤m; retain the oriented version with determinant 1 if needed. The displayed GL₂ orbit then has only (2,1,3). Keep determinant-sign transport for odd-weight coefficients, rather than identifying their signs.

## R03 (P1) — The new Satoh headline has a nontrivial kernel at weight 28

**Location:** README.md:1382 and Suggested.lean:1181–1215: the last summand is “V_{k−22}[χ₁₀,χ₁₂]”.

**Claim:** Satoh’s last coefficient ring is W=ℂ[χ₁₀,χ₁₂], not V=ℂ[ψ₆,χ₁₀,χ₁₂]. The enlarged ring makes the asserted unique decomposition false and overcounts dimensions.

**Witness:** At k=28, χ₁₂[ψ₆,χ₁₀]−χ₁₀[ψ₆,χ₁₂]+ψ₆[χ₁₀,χ₁₂]=0. This is a nonzero allowed coefficient tuple. Satoh1986 Theorem 2.2, p.340 (lines203–210), uses W in the last summand.

**Repair:** Use W_{k−22} in prose, a polynomial in two generators for the last Lean component, and t²²/((1−t¹⁰)(1−t¹²)) in the Hilbert series. The old coefficient of t²⁸ is 13; the corrected one is 12. The exhibited kernel tuple is excluded because ψ₆ is not in W₆. The checks through weight 22 did not distinguish the two formulas.

## R04 (P1) — The theta inversion law loses g copies of the covolume

**Location:** README.md:1114 and Suggested.lean:1023–1028: “covol(L)⁻¹”.

**Claim:** Poisson summation runs on L^g. Its covolume is covol(L)^g, whereas the theorem divides by covol(L) only once.

**Witness:** Take L=2ℤ², g=2, τ=iI₂. Left side is 1.00002789903. The stated right side is 4.00011159612; replacing 1/4 by 1/16 gives 1.00002789903.

**Repair:** Replace the factor by covol(L)^(−g), including the odd-rank prose formula. For this lattice the dual theta value is 16.00044638449, so the corrected equality is exact by the product of four one-variable Poisson identities. Add a non-unimodular, g>1 Check; the existing g=1 and unimodular checks cannot detect this error.

## R05 (P1) — The general-level coefficient bounds integrate over a false period

**Location:** Suggested.lean:877–879 and 947–950 use “fourierCoeff 1 f T” for arbitrary arithmetic Γ; see README.md:791.

**Claim:** The definition integrates over a unit cube. Arithmeticity supplies a translation period N, not necessarily 1. Consequently these are not Fourier coefficients at arbitrary level. The same missing period condition affects fourierCoeff_conj at line844.

**Witness:** For g=1, Γ=Γ(2), f(τ)=E₄(τ/2), the endpoint jump f(1+i)−f(i)=−480∑odd r σ₃(r)e^(−πr)≈−21.83644. Unit-period integrals grow exponentially, rather than O(n⁴).

**Repair:** Quantify N>0 and the translation-lattice containment, as koecher already does, and use fourierCoeff N throughout the bounds and equivariance. Integration by parts gives the erroneous coefficients −e^(2πn)·jump/(2πin)+O(e^(2πn)/n²). With N=2, the actual coefficients are 240σ₃(n), of polynomial growth. Make the same correction for cusp forms and the coefficient-injectivity statements.

## R06 (P1) — Weight-zero eigenvalues are not algebraic integers

**Location:** README.md:2541 and Suggested.lean:1456: “The eigenvalues of a level-one eigenform are algebraic integers”.

**Claim:** The Lean theorem quantifies over all integer weights. With the chosen Hecke exponent, constants in weight zero have denominators.

**Witness:** On f=1 in M₀(Γ₂), each T(p) summand is p⁻³. There are (p+1)(p²+1) summands. Thus λ(2)=15/8 and λ(3)=40/27, neither integral over ℤ.

**Repair:** State integral preservation with the weight hypotheses that make the Hecke coefficient powers integral, and state the exceptional weight-zero formula explicitly. For example k≥2 makes p^(k−2) and p^(2k−3) integral in 7.5; k=1 is a zero space. Retain the general coefficient-field theorem, which allows these rational denominators. The repaired integrality statement excludes the constant example.

## R07 (P1) — The Hermitian adjoint is missing complex conjugation

**Location:** README.md:914–916: “(ρ(A)v, w) = (v, ρ(Aᵀ)w)”.

**Claim:** For complex A this cannot define an admissible positive Hermitian form. The source has conjugate transpose, which the extraction can obscure.

**Witness:** For g=1, ρ=std, A=i and v=w=1, the two sides are i and −i (or reversed under the other inner-product convention). The rendered vdg p.8 has a conjugation bar.

**Repair:** Use A*=conjTranspose A, or explicitly restrict the displayed identity to real A and give its complex extension. With A*=−i the two sides agree. Require positivity of the Hermitian form when using it to prove positive definiteness of the Petersson product.

## R08 (P1) — The vector-valued Klingen statement omits parity

**Location:** README.md:1047–1050: “for j > 0 and k > 4 … is surjective”.

**Claim:** This includes odd j, although 1.3 proves that the source space then vanishes. Arakawa’s actual propositions require both k and j even.

**Witness:** Set (k,j)=(5,7). M₅,₇(Γ₂)=0, but S₁₂(SL₂(ℤ))=ℂΔ has dimension 1. A map 0→ℂ cannot be surjective. arakawa1983 lines217–220 and243–245 require even k,j.

**Repair:** State the nonzero Klingen-section theorem for even k>4 and even j>0, with separate parity-zero cases. At (5,7) give image 0; at (10,2) retain the section of Δ. Cite Propositions 1.2–1.3, pp.162–163, rather than the introductory shorthand.

## R09 (P1) — The Sturm-type bound cannot be uniform over all levels

**Location:** README.md:943–947: “tr T ≤ C(g, ρ)” and “C(g, k) = k·c_g'”.

**Claim:** The claim is quantified over every arithmetic Γ, but its bound has no dependence on Γ or its translation lattice.

**Witness:** In genus one, f_N(τ)=Δ(Nτ)∈S₁₂(Γ₀(N)) has a(N)=1 and a(n)=0 for 0≤n<N. For any proposed C(1,12), choose N>C(1,12).

**Repair:** Make the general bound depend on Γ and the specified Fourier coordinates; reserve the level-independent formula for Γ_g. The witness then demands C(Γ₀(N),12)≥N. Use the supplier’s finite-index Sturm theorem for g=1, whose index factor supplies precisely this dependence.

## R10 (P1) — The abstract local Hecke algebra needs its central generator

**Location:** README.md:1742–1744: “H_p is generated by T(p) and T(p²)”.

**Claim:** This confuses the abstract GSp₄ Hecke algebra with its image after fixing the central character of a weight.

**Witness:** The same subsection identifies H_p⊗ℚ with ℚ[ℤ³]^W: transcendence degree 3. An algebra generated by two elements has transcendence degree at most 2. vdg lines1448–1450 also invert T₂(p²).

**Repair:** Keep T₂(p²) as a generator of H_p⁰ and invert it for H_p. State the two-generator consequence only for the fixed-central-character action, with the coefficient field specified. The dimension count is then 3 before specialization and at most 2 afterwards, consistent with Satake and with 7.1.

## R11 (P1) — Squared theta constants are assigned weight one half

**Location:** README.md:1228–1230: the transformation of “{θ_ε²}” uses “det j(γ, τ)^{1/2}”.

**Claim:** The multiplier displayed belongs to theta constants themselves. Squaring also squares the determinant factor and the root of unity.

**Witness:** For g=1, ε=(0,0), τ=2i and S: θ₀₀(i/2)²/θ₀₀(2i)²=2. A weight-one-half factor has magnitude √2, not 2.

**Repair:** Give the squared constants a det j factor and squared phases (fourth roots when the original phases are eighth roots). If the unsquared transformation is needed, state it separately with the branch and multiplier. The corrected squared S-law yields exactly 2 in the witness.

## R12 (P1) — The level-four generator f₃ has the wrong characteristic

**Location:** README.md:1556: “f₃ := (θ₀₀₀₀θ₀₀₀₁θ₀₀₁₁)²”.

**Claim:** Replacing θ₀₀₁₀ by θ₀₀₀₀ destroys the asserted scalar transformation. This is a mistake in the knowl, not in the primary paper.

**Witness:** On diag(2i,4i), the proposed product is 1.00744155969; after swapping coordinates it is 0.99253033298. The correct product is 0.99250264302 in both orders. hayashidaibukiyama2005 line257, p.492, uses θ₀₀₁₀.

**Repair:** Set f₃=(θ₀₀₀₁θ₀₀₁₀θ₀₀₁₁)² and propagate it into the ψ₄-module generators and checks. The swap is a Γ₀(4) Levi element: det(D)³ψ₄(det D)=1, so invariance is required. Doubling the input preserves the same counterexample by using diag(i,2i).

## R13 (P1) — The Euler-product half-plane includes Eisenstein counterexamples

**Location:** README.md:1855–1862: “absolute convergence of both for Re s > k + j/2 + 1”.

**Claim:** The definition is for the eigenforms of 7.2, which include Eisenstein series, but the asserted growth estimate uses cuspidality without assuming it.

**Witness:** For ψ₆, spin roots are 1,p⁵,p⁴,p⁹. At s=8>7, one Euler factor contains 1−p. The local inverse factors do not tend to 1; absolute convergence fails.

**Repair:** Separate the cusp, Klingen and Siegel-Eisenstein bounds, retaining all three classes. For scalar Siegel Eisenstein series of genus two, the displayed factorization gives absolute convergence for Re s>2k−2; at k=6 this is Re s>10. State the cusp estimate with its hypotheses and prove the standard-factor bound separately.

## R14 (P1) — The two L-function records cannot share their prime coefficient

**Location:** README.md:1977: “b_F(p) = λ_F(p)” following the construction of both records.

**Claim:** That coefficient formula is the spin coefficient. The standard coefficient is 1+Σ_i(α_i+α_i⁻¹).

**Witness:** For χ₁₀ at p=2, α₁+α₂=−33/16 and α₁α₂=2. Hence b_standard(2)=1−33/16−33/32=−67/32, whereas b_spin(2)=λ(2)=240.

**Repair:** Use separate coefficient sequences and prime-coefficient laws for the spin and standard records. Keep b(0)=0 and b(1)=1 for both. The repaired two records give −67/32 and 240 respectively on this example; apply the weight-0 normalization to the standard record only.

## R15 (P1) — A complex Hecke eigenline is not its Galois-orbit space

**Location:** README.md:2357–2359: “ℂ-span of its images under the Hecke algebra … equivalently … its Galois conjugates”.

**Claim:** Every Hecke image of an eigenform is a scalar multiple of that form. The proposed space always has dimension one, while a Galois orbit may have several independent eigenforms.

**Witness:** At level one, T₂ on S₃₈ has characteristic polynomial X²+194400X−137403408384, discriminant 587404993536. Its two conjugate eigenforms lift into S₂₀(Γ₂): Hecke-image dimension 1, conjugate-span dimension 2.

**Repair:** Define the rational Hecke constituent (and its complexification) separately from each complex eigenline. The newform-orbit dimension is the dimension of the constituent, not ℂ[H]F. The quadratic example then has orbit dimension 2 and two eigenlines of dimension 1.

## R16 (P1) — The coefficient formula and the Maass lift form a proof cycle

**Location:** README.md:1010–1013: “The route is 9.3’s”; 9.2 Needs line2058 and 9.3 Needs line2087 include 4.2.

**Claim:** The proof of 4.2 invokes 9.2–9.3; 9.2 consumes 4.2, and 9.3 consumes 4.2 and the normalized generators of 6.1, which also depend on 4.2. Calling 4.2 a statement before a proof does not break the cycle.

**Witness:** The explicit edges are 4.2→9.3→4.2 and 4.2→9.3→9.2→4.2. The displayed value 13440 is used on both sides of the claimed derivation.

**Repair:** Move the independent Cohen/Jacobi coefficient theorem and general Maass construction before the Siegel coefficient theorem, or give 4.2 an independent proof route. Separate the later identifications of χ₁₀ and χ₁₂. The value 240·56=13440 should be derived once, then consumed; update every Needs line. The roadmap-level depcheck does not inspect these internal edges.

## R17 (P1) — Several consumed theorems have explicitly unowned proofs

**Location:** README.md:119–124: “their proofs are not targets here”; README.md:1928: “nothing of degree ≥ 2 is proved here”.

**Claim:** The roadmap owns the functional equations, dimension formulas and lift statements, but excludes their general proofs without supplying them from a named owner or declared gap. Section 8.5 then offers only implications from these milestones. A source citation does not supply a library theorem.

**Witness:** For χ₁₀, the promised completed card needs the functional equation and poles {8,10}. Section 8.3 states these, excludes their proof, and names no supplier for that proof.

**Repair:** Make the general proofs targets here, with their prerequisites, or import exact theorems from earlier owners and declare any genuine supplier gaps consistently. Apply this to the stated exclusions for functional equations, Ramanujan–Petersson, Ikeda/Miyawaki, dimension/classification formulas and local newforms. The χ₁₀ card must then derive its functional-equation fields from an owned theorem. Genuine conjectures may remain explicitly conditional.

## R18 (P1) — The harmonic-theta supplier is cited without its positive-degree hypothesis

**Location:** README.md:355 and 1180–1181 call Θ_{L,P} “a cusp form of weight m/2+d”.

**Claim:** These supplier statements omit d>0. The supplied LatticePackingsAndPerfectForms §5.6 explicitly separates constant harmonic polynomials from the cusp theorem.

**Witness:** Take L=E₈, P=1, d=0. Θ_{L,P}=E₄ has constant coefficient 1, not 0. The supplier README.md:1386–1390 requires d>0 and assigns d=0 to ordinary theta series.

**Repair:** Restore d>0 in both the exact contract and comparison sentence. For d=0 import the ordinary theta comparison from ThetaSeries, yielding E₄∈M₄ rather than S₄. Retain the already repaired λ_g≥1 sufficient condition in the higher-genus theorem.

## R19 (P1) — The nebentypus decomposition has the larger-group space on the wrong side

**Location:** README.md:949–951: “M_ρ(Γ) = ⨁ over the characters of Γ/Γ′”.

**Claim:** For Γ′ normal in Γ, characters decompose M_ρ(Γ′), not M_ρ(Γ). The latter is the trivial-character summand.

**Witness:** Use g=1, Γ=Γ₀(3), Γ′=ker χ₋₃, weight 1. The trivial-character space is 0 by −I; θ_A₂ has character χ₋₃ and constant term 1, so the direct sum is nonzero.

**Repair:** Write M_ρ(Γ′)=⊕_ψ M_ρ(Γ,ψ), with the finite abelian quotient hypothesis and character convention. The example then places θ_A₂ in the nontrivial summand of M₁(Γ′), not in M₁(Γ). Resolve the supplier’s nebentypus theorem by name in the contract.

## R20 (P1) — The rational-span claim includes arbitrary complex multiples

**Location:** README.md:1351–1352: “Every form in M_k(Γ₂) has Fourier coefficients in the ℚ-span”.

**Claim:** Igusa generation is over ℂ. It gives a rational structure but does not make every complex form rational.

**Witness:** Take F=iψ₄. Its constant coefficient is i. The normalized monomials have rational coefficients, whose ℚ-span contains only rational numbers; i is outside it.

**Repair:** Use ℂ-span for all forms and ℚ-span for the rational subspace. Then iψ₄ belongs only to the complexification, while ψ₄ belongs to the rational structure. Make the same distinction in the rationality and coefficient-field discussion of 11.2.

## R21 (P1) — Good Hecke operators are not self-adjoint for general nebentypus

**Location:** README.md:1698–1704: “self-adjoint for the Petersson product on S_ρ(Γ)”.

**Claim:** This includes Γ₁(N), whose complex nebentypus summands have a character factor in the adjoint. The appropriate general property is normality.

**Witness:** For the even cubic character modulo 7 with χ(3)=ω, χ(2)=ω². On S₁₆(Γ₀(7),χ), T₂*=ωT₂. The cusp form ΔE₄,₁,χ has q²-coefficient (−377+264ω)/7≠0, so T₂≠0.

**Repair:** State T_p*=⟨p⟩⁻¹T_p and its character specialization, then normality and simultaneous diagonalization; reserve self-adjointness for the appropriate real normalization. TauCeti/NumberTheory/ModularForms/Petersson/Normal.lean:145 states the exact character adjoint. Here B₄,χ=(−128+88ω)/7, so E₄,₁,χ has constant term (16−11ω)/7 and q-coefficient 1. Multiplication by Δ gives the witness. The corrected adjoint has factor ω, whereas the trivial-character case has factor 1.

## R22 (P1) — The referenced level-three polynomial is not pluriharmonic

**Location:** README.md:1484: “with the knowl’s S and pluriharmonic P”.

**Claim:** The referenced polynomial has an unsquared first wedge term. It is neither homogeneous of the required degree nor pluriharmonic for S, so it cannot be used as the input to 5.3.

**Witness:** lmfdb_mf_siegel_family_gamma0_3 line114 gives P(e₁,e₃)=1 but P(2e₁,e₃)=2, whereas the determinant-square law requires 4. Its S⁻¹-Laplacian in x at y=e₃ equals −8, not 0.

**Repair:** Square the first wedge term and explicitly state the corrected polynomial and S-pairing convention here. Then P(2e₁,e₃)=4 and the same Laplacian is 8−8=0. Verify the other mixed Laplacians and the determinant-square law before using it to define γ₄; do not import the malformed polynomial by reference.

## R23 (P2) — Import the Jacobi operators and identify the earlier theta specialization

**Location:** README.md:2047–2056: “Owned here … operators V_l”; README.md:1080–1138 owns the unimodular theta construction without the earlier package contract.

**Claim:** The general Jacobi index-raising operator is already owned elsewhere, and an earlier package constructs the same all-genus unimodular theta specialization. These ownership boundaries must be explicit.

**Witness:** HalfIntegralWeightModularForms README.md:1634–1637 constructs V_l with Fourier/composition laws. packages/LevelOneAutomorphicFormsForClassicalGroups/design/README.md:1678 constructs θ_g[L] with the identical unweighted tuple sum and constant term 1.

**Repair:** Consume V_l from HalfIntegralWeightModularForms §6.4, deleting the second construction and proof. Add an exact comparison to LevelOneAutomorphicFormsForClassicalGroups LO.6/higher-genus-theta for the unimodular specialization; retain only the genuinely broader non-unimodular development here. At index one V₁ must still be identity, and on E₈ both theta specializations must have constant coefficient 1, not an automorphism-weighted value. Both owners are eligible suppliers.

## R24 (P2) — The level-four library stops at a database boundary

**Location:** README.md:1570–1571: “The odd-weight part … is not recorded by the LMFDB and is not a target here.”

**Claim:** The source supplies the full character-graded ring. Omitting its odd weights solely because the database does not display them is a route-specific restriction.

**Witness:** hayashidaibukiyama2005 Theorem 1.1, p.493 (lines288–301), gives ℂ[f₁,g₂,X,f₃] for character ψ^k. The omitted weight-one part contains the nonzero f₁(2τ), with constant coefficient 1.

**Repair:** Include the odd-weight ψ₄ part, its exact relation to the character-graded polynomial ring, its API and checks. Distinguish ψ^k from a fixed ψ. Weight one must have dimension 1; the existing even-ψ dimensions 0,1,4 at weights 10,12,14 remain unchanged.

## R25 (P2) — A statable singular-form headline is missing

**Location:** README.md:803–810; Suggested.lean module docstring lines23–47 does not list the singular-form theorem.

**Claim:** The headline “nonzero scalar form is singular iff 2k<g” is absent even though this file already defines forms, Fourier coefficients, determinants and the full-level group. A predicate vanishing on nonsingular indices is a simple native definition.

**Witness:** Existing carriers are SiegelModularForm, HalfIntegral and fourierCoeff. For θ_E₈ in genus 8, a basis Gram matrix has nonzero coefficient and determinant; in genus 9 every Gram matrix has rank≤8.

**Repair:** State the scalar theorem on these carriers with nonzero and positive-genus hypotheses, and add only the simple singularity predicate it needs. Also audit the omitted vector-valued eigenbasis result: Weight and cuspSubmodule already exist, while exists_eigenform_basis at line1336 is scalar only. Missing source formulas, such as Tsushima’s, are not missing carriers; transcribe an exact statement or explain the actual unstatable object.

## R26 (P2) — The cited vector spinor theorem has an extra hypothesis

**Location:** README.md:1887–1895 and 1938–1944 attribute the general vector-valued spin completion to “Arakawa 1983 for j > 0”.

**Claim:** The readable Arakawa theorem requires a_F(I₂)≠0. This restriction is absent from the roadmap, and no stronger primary theorem is identified.

**Witness:** arakawa1983 lines92–96, printed p.158, explicitly assumes the Fourier coefficient at I₂ is nonzero before asserting entirety and the functional equation. The roadmap’s hypotheses do not mention that coefficient.

**Repair:** Give an exact primary theorem covering the claimed generality, with an owned proof route that removes this restriction; separately state what Arakawa’s theorem itself supplies. Add a negative-control applicability check with a(I₂)=0, which cannot invoke the cited theorem. Do not narrow the library’s intended general theorem merely to evade the missing input.

## R27 (P2) — Congruence-level assertions need positive level and positive genus

**Location:** README.md:512–515: “Γ_g(N) normal of finite index” and “−1 ∈ Γ_g(N) iff N ≤ 2”.

**Claim:** No positive-level restriction is stated here; the Lean conventions use natural N and reduction to ZMod N. The displayed equivalence also needs g>0.

**Witness:** At N=0, ZMod 0=ℤ, so Γ₁(0) as a principal group is {1}, of infinite index, and −I is absent although 0≤2. At g=0, −I=I even for N=3.

**Repair:** Require N≥1 and g≥1 for these assertions; give the N=0 and genus-zero definitions separately if retained. With these guards, N=1,2 includes −I and N=3 excludes it. State the elementary divisors with positive diagonal entries as well, as vdg Proposition 16.2 does.

## R28 (P2) — The prose eigenform predicate admits zero

**Location:** README.md:1680: “IsHeckeEigenform f := ∀ T, ∃ λ, T f = λ f”.

**Claim:** This predicate holds for zero and does not determine an eigenvalue character. Suggested.lean:1327 correctly includes f≠0, so the two definitions disagree.

**Witness:** For f=0, T f=0=λf for λ=0 and λ=1, for every T. Hence the stated laws cannot select a unique character. For f≠0, cancellation does give uniqueness.

**Repair:** Add f≠0 to the prose definition and retain it in every newform/eigenvalue interface. The zero form then fails the predicate, while ψ₄ remains an eigenform with λ(2)=45.

## R29 (P2) — The dimension targets still omit the formulas they promise

**Location:** README.md:1430–1439: “their cubic polynomial formulas” and “the cubic numerator coefficients they list”; README.md:1390–1399 similarly leaves Tsushima/Ibukiyama statements by citation.

**Claim:** The earlier conditionality error is repaired, but a pointer to unspecified coefficients is not an exact theorem statement or a discriminating acceptance target. IsotypicDecomposition is likewise named without the actual system of equalities it assumes.

**Witness:** cvdgg2015 lines934–960 prints both cubics and all ten numerator coefficients. At j=2 these give M₃,₂(Γ₂(2)) dimension 0 and M₄,₂ dimension 15; no displayed formula here computes either.

**Repair:** Write the two cubics, their ranges and parity, and the required numerator functions in the roadmap’s own notation; state the precise conditional multiplicity assertions. Transcribe the other promised dimension/module targets with exact hypotheses and locators. The resulting formulas must calculate 0 and 15 in the witness. This is the unresolved statement-completeness part of previous R03, not a renewed objection to conditional results.

## R30 (P3) — The repaired parity counterexample uses an even genus

**Location:** README.md:669–672: “Γ = Γ₂ … ρ(−1) = diag(1, −1)”.

**Claim:** For ρ=det⁰⊕det¹ in genus two, det(−I₂)=1, so ρ(−I₂)=I₂. The proposed counterexample does not satisfy ρ(−1)≠1.

**Witness:** At g=2 the two eigenvalues are (1,1), not (1,−1). At g=1 they are (1,−1), and the constant vector (1,0) is still a nonzero modular form.

**Repair:** Use Γ₁ and the genus-one representation in this negative control, and qualify the corresponding Lean docstring at line679. The corrected instance refutes the weaker hypothesis exactly as intended; the fixed-vector theorem itself can stay.

## R31 (P3) — Remove definitions and a counting check that test no headline

**Location:** Suggested.lean:1369–1394 defines spinorEulerFactor, standardEulerFactor, maassCoeff and maassLift; line1047 states card_evenChar.

**Claim:** None of the four definitions occurs in any subsequent headline theorem. In particular maassLift takes arbitrary c and is not tested as a lift of a Jacobi form; the docstring already correctly records that carrier as unavailable. card_evenChar mirrors the theta-characteristic Check.

**Witness:** Searching all later theorem signatures finds no use of the four names. The count gives 3,10,36, precisely the README Check. All 82 plain one-tactic probes retained sorry; no success is claimed from them.

**Repair:** Delete these unused definitions and card_evenChar from Suggested.lean; keep their mathematical definitions and checks in the README. Do not replace the absent Jacobi carrier by an arbitrary coefficient function or prove the counting Check in place. Keep genuine dependencies needed to state retained headlines.

## R32 (P3) — Repair the sampled locators and add absent ones

**Location:** README.md:1313 cites “Aoki–Ibukiyama 2005, Theorem 4.1” for the Wronskian; §2.5 has no source locator.

**Claim:** The Wronskian is in §2, not that level-three ring theorem. Several sampled claims have only an author/year or a broad survey section; the Miyawaki spin formula is not Theorem 1.1 of the cited Ikeda text.

**Witness:** aokiibukiyama2005 lines210–243, p.253, gives the Wronskian and 41472; Theorem 4.1 starts at line480. ikeda2006 lines77–83 proves the standard L-function identity, not the spin identity.

**Repair:** Cite Aoki–Ibukiyama §2, pp.252–253 (Proposition 2.1 for the general determinant), with the normalization paragraph. Add exact primary locators for coefficient bounds, Klingen, ring theorems and the Miyawaki spin identity. Cite the readable Eichler–Zagier 1983 preprint with its own pages (Theorem 2.1, pp.20–21; Theorem 6.2, pp.71–72), unless the 1985 numbering is checked. The Wronskian normalization remains 2⁹·3⁴=41472.

## R33 (P3) — The source manifest is still absent

**Location:** TauCetiRoadmap/SiegelModularForms/ contains README.md, Suggested.lean and metadata.toml, but no sources.toml.

**Claim:** The references have no persistent source keys, legal provenance, version notes or certified/uncertified status. This is previous R10, unrepaired.

**Witness:** The source-service pass found readable preprints, publisher-only books, unresolved papers and one false-positive fetch returning manuscript guidelines. Without a manifest these materially different statuses are indistinguishable.

**Repair:** Add sources.toml using the required schema, one stable key per work, exact locators and source-service provenance; mark legally unreadable publisher texts uncertified rather than inventing content. Record the 1983/1985 Eichler–Zagier version distinction and reject the unrelated Andrianov–Kalinin fetch. This review changes no manifest.

## Verified sound

Unqualified README/Suggested locations mean `TauCetiRoadmap/SiegelModularForms/`. Instance checks are not general proofs.

### Disposition of the previous ten findings

Previous findings were checked first. No “not actionable in this package” repair disposition was found.

| Previous finding | Current passage and disposition |
|---|---|
| R01, pluriharmonic indices | README:1154–1162 now sums derivatives over the lattice-coordinate index. **Repaired.** |
| R02, cusp criterion | README:1186 uses “λ_g ≥ 1”; README:1211–1216 gives the Sym⁸ negative control. **Repaired.** |
| R03, conditional dimensions | README:1437 makes “IsotypicDecomposition” a named hypothesis. **Partly repaired.** Formulas remain absent (R29). |
| R04, missing Satoh headline | Suggested:1181 now states the unique decomposition. **Partly repaired.** Weight28 refutes the new uniqueness statement (R03). |
| R05, Kohnen exponent | README:2206 now has “a^{k−1} φ(a,T)”. **Repaired against the readable survey**, vdg line1929. The primary normalization of φ remains uncertified. |
| R06, finite-dimensionality argument | README:678–681 now routes the scalar degree-two calculation through “6.3”. **Repaired.** |
| R07, Checks claiming absent Lean names | README:655,2115,2152 gives these as prose checks. **Repaired.** The gate reports readme-ids-missing=0. |
| R08, process wording | Suggested:43 says “no roadmap module is importable here”; the prior pull-request/process remark is absent. **Repaired.** |
| R09, four padding statements | `exists_eq_const`, `eq_zero_of_neg`, `summable_siegelTheta`, `cosetReps_spec` are absent. **Repaired for those four.** R31 concerns different remaining declarations. |
| R10, source manifest | No `sources.toml` exists. **Not repaired**, R33. |

### Gate, elaboration and signatures

The worker gate passed every scanner and the targeted build at the requested head. Outside-folder diff is empty. Independent dependency output:

```text
depcheck: 204 roadmaps, 1594 edges, 0 problem(s)
```

No UPWARD/CYCLE/moved line. This coarse graph misses R16’s internal cycle. Absent suppliers use the insertion rule; HalfIntegralWeightModularForms explicitly names Siegel as downstream.

Original Lean elaboration succeeded: 82 warnings, all sorry. All 219 declarations were #checked in a scratch copy. Binder leads are benign: extendZero needs no NormedSpace; fourierCoeff/phi/gram/siegelTheta need no finite dimension to be defined. Analytic theorems keep their hypotheses. R05 concerns periods.

All 82 scratch probes tried simp/rfl/infer_instance and retained sorry. An unfolded isMaassForm_zero probe also failed on transported zero. R31 uses the unused-definition/mirrored-Check rule, not a claimed tactic success. No files in the PR changed; no Lean process remains. Imports pass; no sorry-bodied data, set_option, fake Prop carrier, copied passage or algorithm target was found. R17/R24 violate the general-library contract. The work is repairable.

### Seeded source sample: all 15 targets

Legal source-service texts were opened at these locators. PDF images resolved ambiguous OCR. Preprint numbering is not silently identified with published numbering.

| Target | Locator and result |
|---|---|
| 0.4 action | vdg lines180–218, §2 p.6; arakawa1983 lines35–39 p.156. Symplectic action; positive similitudes follow by M/√μ. Positivity retains μ. |
| 1.1 weights | vdg lines324–350, §3 p.9. Holomorphic finite-dimensional representations; highest-weight statements require irreducibility. |
| 2.1 indices | vdg lines387–398, §4 p.10. Dual half-integral lattice agrees; false GL₂ uniqueness is R02. |
| 2.5 bounds | No exact README locator. arakawa1983 lines249–254 p.163 is full-level, with ρ(T⁻¹/²) normalization; does not justify arbitrary period1 (R05/R32). |
| 3.1 Φ | vdg lines508–523, §5 p.12: diag(T′,0), highest-weight restriction and elliptic weight k+j agree. |
| 3.3 domain | vdg lines224–231, §2 p.7: determinant inequality agrees; README correctly fixes primitive-tail condition. |
| 4.2 coefficients | Eichler–Zagier1983 preprint Thm2.1 pp.20–21 lines682–705 and Thm6.2 pp.71–72 lines2416–2455. Constants agree; cycle R16. Cohen1975 unavailable. |
| 4.3 Klingen | vdg Thm5.4/Cor5.5 pp.13–14 lines549–600. arakawa1983 Props1.2–1.3 pp.162–163 lines217–245 require even k,j (R08). |
| 6.2 χ₃₅ | aokiibukiyama2005 Prop2.1 pp.251–252 and normalization p.253, lines151–153,210–243. Coefficient41472; Thm4.1 is wrong locator (R32). |
| 6.5 Γ₂(2) | cvdgg2015 arXiv1306.6018v2 Thms12.1/12.3 p.20 lines934–960, conditional refinement p.21 lines966–972; Thm14.1 pp.22–23 lines1029–1057. R29 is missing formulas, not conditionality. |
| 6.8 level4 | hayashidaibukiyama2005 p.492 lines250–261; Thms1.1–1.2 p.493 lines288–301. Confirms even series, refutes f₃/odd-weight omission (R12/R24). |
| 7.1 Hecke pair | vdg Lem16.1,Prop16.2,Thm16.3 pp.30–31 lines1401–1475: finite cosets, positive elementary divisors, central inverse. R10. |
| 8.4 signs | vdg §20 p.36 lines1754–1776; arakawa1983 p.158 lines92–96. Sign/center agree; a(I₂)≠0 omitted (R26). |
| 9.3 Maass | vdg §21 pp.38–39 lines1862–1904; EZ1983 Thm6.2. r/d is correct; all-integer domain false (R01). |
| 9.8 Miyawaki | ikeda2006 Thm1.1 lines55,65–83,214–220: parity k≡n+r, nonzero hypothesis, standard product agree. Does not supply spin identity (R32). Type II correctly conditional. |

### Pinned definitions and ownership

Object searches used roadmaps grep/show, main, board and supplied heads; no namespace collision found. Read main examples ModularForms, ThetaSeries, LFunctions. Ownership against unavailable open-PR files was not checked. The 27 tool leads were knowl IDs. Every Needs line was read (R16–R18/R23).

Pinned declarations opened (paths relative to the respective library root):

| File and line | Contract |
|---|---|
| Mathlib/LinearAlgebra/Matrix/PosDef.lean:62,164 | PosSemidef/PosDef include Hermitian symmetry and quadratic inequalities; Fin0 positivity vacuous. |
| Mathlib/NumberTheory/ModularForms/Basic.lean:72,80 | ModularForm/CuspForm include holomorphicity and cusp boundedness/vanishing. |
| Mathlib/NumberTheory/HeckeRing/Defs.lean:75 | IsHeckeTriple gives containment/commensurability, not self-adjointness. |
| Mathlib/Algebra/Module/ZLattice/Covolume.lean:72 | Measure-dependent covolume; products multiply. |
| Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean:37 | dualSubmodule: integral pairings; dual(2ℤ²)=(1/2)ℤ². |
| Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:307 | sturm_bound_levelOne has level-one scope. |
| TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean:94,117–130,156 | GLSymplectic, membership and equivalence; Levi.lean supplies leviHom. |
| TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:86 | Determinant identity includes empty-size1=1. |
| TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104 | Newform includes eigenform and normalized q coefficient. |
| TauCeti/NumberTheory/ModularForms/Petersson/Normal.lean:145 | isAdjointPair_heckeRingHomCuspCharSpace_heckeTGeneratorGamma0: χ(p)⁻¹Tₚ. |

Resolved cross-roadmap sections (each location is that roadmap’s README.md unless stated):

| Supplier | Sections and lines |
|---|---|
| ModularForms | Layers2/4/7/9:383,532,708,971. |
| ThetaSeries | Exclusions153–155; Layers1–3 Poisson/lattices/theta;2E/6F level/character. |
| IntegralLattices | **Active** main §2G:813,§6D:1661; Completed file numbering differs. |
| LFunctions | Layer0:348,385–399 analytic/arithmetic data and translation. |
| ClassicalGroupsPartII | CG.0.1:318–334, positive-rank GSp/multiplier. |
| MetaplecticAutomorphicForms | 6.18/6.20:1768/1804;8.10–8.12:2490–2521;8.18–8.19:2608–2624. |
| QSeriesPartitionsAndMockModularForms | 9.1:1358–1378, exponent r²τ/(4m)+rz. |
| HalfIntegralWeightModularForms | 6.1–6.4:1510,1548,1583,1624; V_l:1634–1637. General index needs discriminant and residue. |
| LatticePackingsAndPerfectForms | 5.6:1381–1410 requires d>0; d0 ordinary theta. |
| LevelOneAutomorphicFormsForClassicalGroups | packages/LevelOneAutomorphicFormsForClassicalGroups/design/README.md:1678, LO.6/higher-genus-theta, constant1. |
| HyperellipticCurves | 5.3:2049 Euler factors;5.6:2124 conductor. |
| AbelianVarietiesOverFiniteFields | 1.3:492 L-polynomial convention. |
| PELModuli | siegelModuli:3532;siegelStack M6.3:3817. |
| ShimuraCompactifications | 2.8:1338;7.16:2576. |
| AutomorphicBundles | 3.2:1379 comparison;12.14:5037 is rank-one q comparison. |
| SatoTateGroups | 5.3:903;Layer6:972. |

### Headline inventory

Present: half-space action; Fourier reconstruction/Koecher; Φ/cusp criterion; finite dimensionality; Eisenstein modularity/constant term/Φ; even-rank theta modularity/inversion; Igusa generation/independence/dimension; Satoh decomposition/dimension; Hecke action/eigenbasis; Maass dimensions/Saito–Kurokawa; paramodular dimension11; coefficient-field finiteness/integrality. Findings identify false signatures.

Docstring omissions with missing objects: Petersson (domain/measure), Maass–Cohen (Cohen function), Klingen (parabolic/pullback), odd-rank theta (square root), level rings/classifications (generators/characters), Satake (algebra/characters), L-functions/exports/lifts (Satake/standard data), Jacobi-side/Fourier–Jacobi/Gritsenko (Jacobi carrier), paramodular newforms/conjecture (local factors/complement). “Formula not transcribed” is not a missing carrier; singularity is statable but absent (R25/R29). Arbitrary-c maassLift does not remedy the missing Jacobi carrier (R31).

### Adversarial values across all 66 numbered milestones

Every numbered subsection is covered. “Pass” means the instance agrees, not a proof. Decimal theta values are approximations; rational/algebraic entries are exact.

| Statement | Instances and computed values on both sides | Result / change |
|---|---|---|
| 0.1 Sp blocks | g=1, S=[[0,−1],[1,0]]: SJSᵀ=J, det S=1; diag(1,−1) gives −J. | Pass; excludes antisymplectic matrix. |
| 0.2 multiplier | M=diag(1,2), μ=2: MJMᵀ=2J and det M=2=μ¹. Scalar2I has μ=4 and det=4. | Pass for g>0; do not infer rank-zero uniqueness. |
| 0.3 half-space | diag(i,2i) has Im eigenvalues1,2; diag(i,−i) has1,−1. Fin0 determinant1 and unique empty point. | Pass; positive/negative controls. |
| 0.4 action | g=1, M=diag(1,2), τ=i: Mτ=i/2; μ Imτ/abs(det j)²=2/4=1/2. S(2i)=i/2. | Pass; catches omitted μ. |
| 0.5 cocycle | S,T=[[1,1],[0,1]], τ=i: j(ST,i)=i+1=j(S,T i)j(T,i)=(i+1)·1. | Pass; order correct. |
| 0.6 congruence | g2,p2,3: (1+p)(1+p²)=15,40. N0 principal group has infinite index; g0,N3 has −I=I. | Positive cases pass; R27. |
| 0.7 paramodular | n(diag(0,1/2)) sends e₄·2 to e₂+2e₄, preserving the lattice; entry1/2 excludes Γ₂. Indices p2,3 are15,40. | Pass. |
| 1.1 weights | detᵏSymʲ at −I₂ acts (−1)ʲ: j0→1,j1→−1. At g1 det⁰⊕det¹ gives(1,−1); at g2 gives(1,1). | Weight convention passes; R30 fixes negative control. |
| 1.2 slash | g1,k4,e3,M=diag(1,2): μ³j⁻⁴=2³·2⁻⁴=1/2. With e4 the factor is1. | Pass. |
| 1.3 forms/parity | g1 constant1 has weight0, Φ=1; odd scalar weight with −I would require1=−1. Reducible invariant vector(1,0) survives. | Fixed-vector theorem passes; R30. |
| 2.1 lattice/reduction | (2,±1,3): det=6−1/4=23/4 and both reduced; GL swap of sign identifies them. tr(TS) integral for S symmetric integral. | R02; half-integral pairing passes. |
| 2.2 Fourier | f=1,N1: coefficient T0=1, all nonzero T=0; reconstruction1=1. E₄(τ/2) has period2, endpoint jump≈−21.83644. | Full-period case passes; R05. |
| 2.3 boundedness | f=1 on Imτ≥c>0 has supremum1; q⁻¹ at iy has size e^{2πy}→∞. | Positive/negative control passes. |
| 2.4 Koecher | g2,χ₁₀,T=negative definite: a(T)=0; at(1,1,1), a=1. g1 q⁻¹ has a(−1)=1 and is excluded by the g≥2 hypothesis. | Pass. |
| 2.5 bounds | Correct E₄ coefficients a₁=240,a₂=2160; wrong unit-period E₄(τ/2) coefficients have leading magnitude abs(jump)e^{2πn}/(2πn). | R05; polynomial bound fails. |
| 2.6 singular | θ_E₈ at g9 has rank≤8<9; at g8 the basis tuple has nonsingular Gram and positive count. 2k=8<9, but8<8 false. | Threshold check passes; missing Lean headline R25. |
| 3.1 Φ | ΦE₄^(2)=E₄^(1): constant coefficient1→1; Φχ₁₀=0. det¹⁰Sym² maps to elliptic weight12. | Pass. |
| 3.2 cusp | χ₁₀ rank-one coefficients0, positive index(1,1,1) coefficient1; E₄ constant1≠0. | Pass, both directions discriminated on examples. |
| 3.3 domain | Y=diag(1,2), h=e₁,k2: hᵀYh=1<2, but tail gcd=0, so excluded. h=e₂ gives2=2. | README passes; source misprint below. |
| 3.4 Petersson | A=i,ρ=std,v=w=1: displayed adjoint gives i versus−i; conjugate transpose gives equality. | R07. |
| 3.5 finiteness/Sturm | Δ(Nτ) has first coefficient a(N)=1, all0≤n<N zero; N>C defeats fixed C(1,12). For weight1 character decomposition,0≠constant term1 of θ_A₂. | R09/R19. |
| 4.1 Eisenstein | g2,k4: constant1, Φ constant1; λ₂=(1+8)(1+4)=45. k=g+1 is excluded by strict convergence bound. | Pass on stated range. |
| 4.2 coefficients | k4, discr3: E₄,₁ coefficient56 and 2/ζ(−3)=240, giving13440; discr4 coefficient126 gives30240. | Constants pass; proof cycle R16. |
| 4.3 Klingen | (k,j)=(5,7): source dimension0, target dim S₁₂=1. (10,2): target S₁₂ dimension1 and even parity. | R08. |
| 5.1 theta | E₈,g1: a₀=1,a₁=240; zero lattice tuple contributes exactly1, not1/abs(Aut E₈). | Pass; ownership comparison R23. |
| 5.2 theta inversion | L=2ℤ²,g2,iI: left1.00002789903, wrongright4.00011159612, correctedright16.00044638449/16=1.00002789903. | R04. |
| 5.3 pluriharmonic | P=(x₁+ix₂)⁴: Laplacian0. P=1,d0,E₈ theta constant1≠0; E₈ Sym⁸ rank-one sum120≠0. | Repaired λ_g condition passes; supplier R18. |
| 5.4 theta characteristics | Even counts g1,2,3=3,10,36. θ₀₀² at2i under S has ratio2, not√2. Odd characteristic pairing cancels termwise. | Count passes; squared law R11. |
| 6.1 generators | χ₁₀ coefficients(1,0,1)=−2,(1,1,1)=1; χ₁₂ gives10,1. Φ of both0. | Normalization controls pass. |
| 6.2 χ₃₅ | Wronskian first coefficient2⁹·3⁴=41472; division gives1. det−1 sends a(2,1,3)=1 to a(2,−1,3)=−1. | Values pass; locator R32. |
| 6.3 Igusa | Even monomial dimensions k0,4,6,8,10,12,20=1,1,1,1,2,3,5; odd35,37,39=1,0,1. iψ₄ constanti is not rational. | Ring counts pass; rational-span R20. |
| 6.4 Satoh | k10,12,14,16,18,20,22 counts1,0,2,3,3,4,7; k28 wrong13, correct12; explicit nonzero syzygy sums to0. | R03/R29. |
| 6.5 level2 | Scalar k0,2,4: (k+1)(k²+2k+12)/12=1,5,15. j2 vector k3,4 cubics=0,15. | Counts pass; formulas missing R29. |
| 6.6 level3 | P(e₁,e₃)=1, P(2e₁,e₃)=2 instead of4 (R22). Φβ₃ q-coefficient72−10·18=−108; q²270−1080+486=−324. Φδ₃ constant1−9=−8. | Correctly rejects knowl’s cusp designation. |
| 6.7 level2 Γ₀ | Hilbert coefficients k0,2,4,6,8=1,1,3,4,7. χ₁₉ weight5+6+8=19. | Algebraic count/weight pass; primary certification limited below. |
| 6.8 level4 | Dimensions1,3,7,14,24; evenψ weights10,12,14→0,1,4. Wrong f₃ swap1.00744155969≠0.99253033298; corrected both0.99250264302. | R12/R24; even series passes. |
| 6.9 higher degree | Given genus3 series coefficients weights4,6,8,10,12=1,1,1,2,4; subtract genus2 at12:4−3=1. E₈²/D₁₆⁺ constant difference1−1=0. | Internal counts pass; primary classification unavailable. |
| 7.1 Hecke pair | p2: T(p) cosets15, T₀(p²)120,T₁(p²)30,T₂(p²)1, total151; central pI has one coset. | Pass; central generator retained. |
| 7.2 eigenform | f0 satisfies Tf=λf for bothλ0,1; ψ₄ nonzero givesλ₂45 uniquely. | Prose R28; Lean excludes0. |
| 7.3 level Hecke | χmod7 cubic, p2: adjoint multiplierω≠1; ΔE₄,₁,χ has a₂=(−377+264ω)/7≠0. | R21. |
| 7.4 Satake | Abstract invariant algebra trdeg3 versus two-generated algebra trdeg≤2. Fixing central character removes one parameter. | R10. |
| 7.5 coefficient law | χ₁₀,p2 at(1,1,1): a(2,2,2)=240; the isotropic middle terms and divided triple contribute0, so240=λ₂·1. | Pass; k0 boundary gives15/8 in R06. |
| 7.6 fields/eigenbasis | ψ₄ λ₂45∈ℚ. S₃₈ charpoly discriminant587404993536=2¹⁰·3²·63737521; eigenvalues−97200±48√63737521. | Field degree2; orbit distinction R15. |
| 8.1 local factors | χ₁₀,p2 spin X coefficient−240; standard X coefficient67/32, hence Dirichlet coefficient−67/32. g1 degrees2,3; g2 degrees4,5. | Factor conventions pass; export R14. |
| 8.2 convergence | ψ₆ has root p⁹; at s8>7 local factor includes1−p, so inverse factors fail to approach1. | R13. |
| 8.3 completion | χ₁₀ weight17, center18−s, spin poles8,10 exchanged; center fixes9. Entirety excluded for this SK lift. | Pole symmetry passes; ownership R17. |
| 8.4 signs/weights | Scalar k10: root(+1), w=20−3=17; g1 k12 givesw11, center12−s. Vector(k,j)=(10,2) givesw19, center20−s. | Conventions pass; Arakawa applicability R26. |
| 8.5 export | Both records b₀0,b₁1; χ₁₀ b_spin(2)=240 versus b_std(2)=−67/32. | R14; separate sequences. |
| 9.1 Fourier–Jacobi | T=(n,r,m) gives trace nτ+rz+mω. m0 cusp coefficient0; χ₁₀ m1 beginsq(ζ−2+ζ⁻¹). | Pass; off-diagonal factor2 checked. |
| 9.2 Jacobi | m1 discriminant3: (n,r)=(1,1),(3,3) give4n−r²=3. V₁ coefficient sum one term1·c(n,r). dim J₁₀,₁=dim M₁₈=2. | Pass; duplicated V_l R23. |
| 9.3 lift | χ₁₀ (2,2,2): c12+2⁹c3=−272+512=240. Negative(−1,1,−1): left0,rightc3=1. | R01. |
| 9.4 Maass space | k10 expecteddim2, cuspdim1; current predicate rejects χ₁₀ because0≠1 at negative index. Zero relation0=0 still holds. | R01; closure alone cannot fix carrier. |
| 9.5 SK | f₁₈ a₂=−528, add2⁹+2⁸=768 gives240; f₂₂ a₂=−288, add2¹¹+2¹⁰=3072 gives2784. | Eigenvalue normalization passes; predicate R01. |
| 9.6 Gritsenko | N1 reduces to index-one lift, same240 at p2; N277 cusp-Jacobi dimension10, full cusp dimension11 leaves1 nonlift. | Counts consistent; primary construction unavailable. |
| 9.7 Ikeda | Δ:k6,n2 givesgenus4 weight8, shifts7,6,5,4. n1 fails parity6≢1 and targetS₇=0. Counts1,1,1,2,2. | Corrected parity/exponent pass against survey. |
| 9.8 Miyawaki | n=r1,k10: 10≡2 mod2, targetgenus3 weight12; standard degrees3+2+2=7, spin2+2+4=8. k11 excluded. | Parity/nonzero qualification pass; spin locator R32. |
| 10.1 paramodular | k4 at p2,3,5,7,11,13,17: source table0,0,0,1,1,2,2. N1 group equalsΓ₂. | Source table agrees. |
| 10.2 good factors | p2,N277 polynomial1+2X+4X²+4X³+4X⁴: a₁=−2,a₂=4, reciprocal coefficients4=p·2 and4=p². | Pass. |
| 10.3 newspace/orbits | S₃₈ conjugate pair spansdimension2; ℂ[H]f for either eigenform hasdimension1. N1 oldspace0, newspace=whole cusp space. | R15. |
| 10.4 local newforms | Unramified conductor exponent0 giveslocallevel p⁰=1; at277 the promised exponent1 requireslocaltheory rather than good-prime factors. | Boundary consistent; unowned input R17. |
| 10.5 weight2 | p277:11=10+1. p2 polynomial as above; congruence modulus15 divides the stated lift/nonlift differences in the source theorem. | Dimension/shape agrees with Poor–Yuen. |
| 10.6 curve/conjecture | Curve y²+(x³+x²+x+1)y=−x²−x: #C(F₂)=3+2=5,#C(F₄)=7+2=9. Newton givesa₁=3−5=−2,a₂=(4−(5−9))/2=4. | Matches10.2. QM-fourfold clause retained as conjectural. |
| 11.1 labels | K1/fulllevel have intrinsic(genus,level)=(2,1); K277 gives(2,277). Vector(k,j)=(10,2) distinguished from scalar(10,0). | Intrinsic prefix control passes; database order not theorem. |
| 11.2 coefficient field | k0 constant eigenvalues15/8,40/27 rational but nonintegral. Quadratic S₃₈ field degree2, complex eigenline dimension1. | R06/R15/R20. |
| 11.3 type | ψ₄ has nonzero constant1; χ₁₀ hasconstant0 and SKλ₂240. These distinguish Eisenstein from cusp/CAP examples. | Boundary consistent; representation classification supplied separately. |
| 11.4 coverage | Weight2,K277 total11 decomposes10 lifts+1 nonlift; level4 evenψ at10 is0 while omitted oddψ at1 is1. | Coverage cannot justify omission, R24. |

## Not verifiable

All bibliography entries and 32 named knowls were submitted to the legal sources service. Missing texts did not stop the review. Landing pages and an unrelated guidelines document were not treated as papers. Unresolved requests remain in needs-references.toml; publisher-only texts are uncertified, not re-requested.

| Works | Attempts and limits |
|---|---|
| Freitag1983; Cohen1975; Piatetski-Shapiro–Rallis1987; Andrianov–Zhuravlev1995; Kohnen2002; Roberts–Schmidt2007; Mizumoto1991; Weissauer2009 | DOI/publisher pages only; exact primary hypotheses/locators uncertified. |
| Eichler–Zagier1985 | Publisher unavailable, author URL forbidden. Read legal institutional1983 preprint; published pagination unverified. |
| Andrianov1974; Andrianov–Maloletkin1975; Andrianov–Kalinin1979 | Math-Net/title search: no text; timeout; unrelated manuscript guidelines, respectively. |
| Böcherer1985; Rankin1939; Tsushima1983 | Title/bibliographic searches unsuccessful. |
| Brumer et al.2019; Brumer–Kramer2019 correction | MSP/AMS landing pages only. Read corrected conjecture in Brumer–Kramer arXiv §8; point counts do not certify modularity. |
| Gritsenko1995; Klingen1990; Roberts–Schmidt2006 | Cambridge/World Scientific landing or forbidden access. |
| Igusa1962; Igusa1964 II; Igusa1964 theta; Igusa1967 | JSTOR/publisher entries only. |
| Ibukiyama1985,2007,2012 | Euclid/title searches unsuccessful. Read1991 OCR; not all appendix coefficients reconstructed. |
| Ikeda2001; Miyawaki1992; Tsuyumine1986; Poor–Yuen2007 | JSTOR/J-STAGE/Euclid/title routes unavailable. Higher-genus primary classification/nonvanishing uncertified. |
| Maass1979 I–III | Title searches failed for I–II; III rate-limited. Read the index-one construction in EZ1983 instead. |

No inaccessible theorem is certified from memory. Numerical checks are not proofs of the general theorems. The blocking witnesses do not depend on these unavailable texts.

## Source issues

- **Misprint** in vdg at §2, p.7, lines224–231: the source says reduction tests every primitive vector for each diagonal position; it should be primitive in the tail beginning at that position; affects a stated result.
- **Misprint** in vdg at §21, p.39, line1904: the source says the second index remains r in the Maass divisor relation; it should be r/d; affects a stated result.
- **Misprint** in vdg at §20, p.36, lines1754–1776: the source says the exceptional theta span has lattice rank 2g; it should be rank 2k for weight k; affects a stated result.
- **Misprint** in vdg at Conjecture 21.3, p.40, lines1947–1957: the source says k has the parity of n; it should have the parity of n+r in this pullback construction; affects a stated result.
- **Misprint** in lmfdbthetas at the pluriharmonic displayed equation, lines106–110: the source sums over the column range while differentiating in row indices; it should sum the lattice-coordinate row index and leave the two column indices free; affects a stated result.
- **Misprint** in lmfdb_mf_siegel_family_gamma0_4 at the generator list, line96: the source assigns weight four to θ₀₀₀₀⁴ after doubling; it should assign weight two; affects a stated result.
- **Error** in lmfdb_mf_siegel_family_gamma0_4_psi_4 at the module decomposition, line115: the source includes the trivial-character summand YB in the ψ₄ module; it should omit that summand; affects a stated result.
- **Misprint** in lmfdb_mf_siegel_family_gamma0_4_psi_4 at the f₃ definition, line117: the source includes θ₀₀₀₀ in the triple product; it should use θ₀₀₀₁θ₀₀₁₀θ₀₀₁₁; affects a stated result.

- **Misprint** in lmfdb_mf_siegel_family_gamma0_3 at the polynomial definition, line114: the source leaves the first wedge term unsquared; it should square that term; affects a stated result.
- **Error** in lmfdb_mf_siegel_family_gamma0_3 at the generator list, lines119–123: the source calls α₁, β₃ and δ₃ cusp forms; their boundary values are nonzero, so they belong to modular-form spaces without that qualification; affects a stated result.
- **Misprint** in lmfdb_mf_siegel_family_gamma0_3 at the Wronskian, line131: the source uses 4γ₄/2 and δ₄ in the weighted first row; it should use 4γ₄ and δ₃ consistently with the derivative rows; affects a stated result.
