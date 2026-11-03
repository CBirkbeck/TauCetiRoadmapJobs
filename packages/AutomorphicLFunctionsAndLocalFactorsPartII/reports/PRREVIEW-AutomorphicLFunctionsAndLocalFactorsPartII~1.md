# Review of AutomorphicLFunctionsAndLocalFactorsPartII (pull request #1756 at 843d267)

**Verdict:** needs changes

## R01 (P1) — Weyl conjugation need not preserve the classical tail

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:816`, propagated at line 1774. The proposed quotient has the form “(σ′₁×…×σ′_d)⋊π₀”; only the GL blocks may change.

**Claim:** Every constituent of the original induction is a quotient after permuting or dual-twisting its GL blocks while retaining π₀.

**Witness:** For split SO₄/ℚ₃, ν²⋊ν has two constituents but only one quotient. Allowed alternatives (2,1),(−2,1) miss the quotient obtained by Weyl-swapping to (1,2), which changes the SO₂ tail.

Here ν=|·|, the Borel Levi is GL₁×SO₂, and the D₂ Weyl orbit of (2,1) is {(2,1),(1,2),(−2,−1),(−1,−2)}. All inducing characters are supercuspidal, since the Levi factors are tori. Pulling the principal series back to Spin₄=SL₂×SL₂ gives rank-one exponents 1 and 3. The exponent-1 factor has trivial quotient and Steinberg subrepresentation; the exponent-3 factor is irreducible. Consequently I(2,1) has two constituents but only one irreducible quotient. The other becomes a quotient of I(1,2), which exchanges the GL₁ character and the SO₂ character. The only additional datum permitted by the written claim is (−2,1); its different cuspidal support prevents it from supplying the missing quotient. This is not fixed by the SO₂ Check, which tests the torus alone rather than a torus tail inside SO₄.

**Repair:** Use conjugacy of the entire cuspidal pair (M,σ), as in `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2594`–2610, and obtain the quotient version by admissible duality. State the classical-coordinate consequences with the action on the tail included, allowing the SO₂ exchange and the even-orthogonal outer action. In §10.6 prove invariance of the transferred full inducing datum under this action, rather than claiming invariance with π₀ fixed. Add the SO₄ example as a negative-control Check. For this instance the corrected datum (1,2) supplies the missing quotient, and both transferred GL₄ supports are {ν²,ν,ν⁻¹,ν⁻²}; their four γ-factor products agree. The repair preserves the claimed generality.

## R02 (P3) — The cited CPS94 local exponent does not match this normalization

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1744`, the local ε-factor character-change theorem, citing CPS94 line 249.

**Claim:** That locator supports the scalar ω_Π(b)^k ω_τ(b)^N |b|^(Nk(s−1/2)) in the roadmap's self-dual-measure convention.

**Witness:** CPS94 line 249 (printed p.163) gives exponent nm s−nm+m(m+1)/2. With n=3,m=1,s=1/2,b=3 over ℚ₃ and trivial central characters, its scalar is √3; the standard scalar is 1.

The printed PDF was inspected to exclude an OCR error. The roadmap's formula has the correct standard exponent: three unramified trivial Tate parameters give three factors with character-change ratio |3|^(s−1/2), hence ratio 1 at the midpoint. CPS94's global product argument still eliminates the absolute-value power, so its global conclusion does not settle the local normalization discrepancy.

**Repair:** Keep the roadmap's formula. Replace the claim of direct support from CPS94 line 249 with an explicit normalization correction and a proof route through the generic pair character-change calculation, followed by the canonical Langlands-block product of EndoscopicTransferAndUnitaryTraceComparison §10.29. Cite AutomorphicLFunctionsAndLocalFactors AL.1.3.1 for the rank-one normalization and retain CPS94 for the global product argument. Add the (N,k)=(3,1) midpoint check; the corrected product is 1, not √3. Record the source discrepancy in the errata record below.

## Verified sound

The review read both requested files, all 71 numbered subsections and their 71 *Needs:* lines, the scope, conventions, supplier contracts and references. It inspected the base roadmap and neighboring owners by object, the declared gaps and repair dispositions, all 15 seeded source targets, and the pinned declarations listed below. Numerical and low-rank checks are reported separately from verification of a general proof: a successful test is not a proof of a continuation, uniqueness or globalization theorem.

**Gate and Lean.** The head is the requested 843d267. The diff outside this roadmap folder is empty. The worker's gate reports every scanner and targeted-build check passing, including imports, sorry-data, set_option, source-material, stray-files and outside-folder. Independent elaboration of `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean` with `lake env lean` exited 0, with no warnings. There are no declarations, so the elaborated-signature and one-tactic padding inventories both have size zero; there is nothing to probe with `#check @name`. No repository file was changed.

The required dependency command returned:

```text
depcheck: 204 roadmaps, 1632 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The local ordering separates convergence from continuation and construction from its comparisons; §10.6's substantive defective input is R01.

**Headlines.** The module docstring names all 17 headline groups: (1) unitary Eisenstein continuation; (2) unitary local functional equation/spherical formula; (3) global doubling/Garrett pullback; (4) completed unitary L-function; (5) holomorphic injection/branching/projection; (6) critical nonvanishing/algebraicity; (7) rectangular models/support/root elimination; (8) generalized continuation/multiplicity one/functional equation; (9) local stability; (10) auxiliary and doubling pole attainment; (11) Speh Eisenstein holomorphy; (12) global unfolding/functional equation/strip bounds, including the torus branch; (13) twisted global entireness; (14) twisted converse; (15) cuspidal weak transfer; (16) coarse compatibility/local existence; (17) general automorphic weak transfer. Searches at the pins found no native smooth/Casselman–Wallach automorphic representation and doubling-family carriers sufficient for these statements. The empty acceptance file therefore does not substitute arbitrary functions for the headlines. The coefficient-field Cauchy theorem is expressible on existing Weyl modules, but is a supporting classical input rather than one of these end theorems; its omission is not padding or a missing headline.

**Pinned objects opened.** Mathlib pin f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti pin 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. The 12 cited declarations were checked against their actual definitions/signatures:

| Declaration | File and line at the pin | What the carrier supplies, and does not supply |
| --- | --- | --- |
| Matrix.fromBlocks; Matrix.fromBlocks_multiply | `Mathlib/Data/Matrix/Block.lean:45`, `:213` | Rectangular block constructor; multiplication has finite contracted indices and semiring assumptions. |
| Matrix.conjTranspose | `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43` | Transpose followed by star. |
| Matrix.IsHermitian | `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44` | Aᴴ=A; neither positivity nor nondegeneracy. |
| Matrix.trace | `Mathlib/LinearAlgebra/Matrix/Trace.lean:43` | Finite diagonal sum. |
| AddChar | `Mathlib/Algebra/Group/AddChar.lean:70` | Zero/addition preservation; no continuity, nontriviality or unitarity. |
| lipschitzGroup; spinGroup | `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:61`, `:292` | Generated subgroup of units; Pin/even submonoid, respectively. Neither is a reductive group scheme with a pinning. |
| CliffordAlgebra.mem_lipschitzGroup_iff_involute_act_ι_mem_range_ι | `TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/CliffordGroup.lean:138` | Clifford-group characterization; field, finite dimension, invertible 2, nondegeneracy and representation of a unit are retained. |
| TauCeti.weylModuleOfShape; TauCeti.weylRepOfShape | `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:429`, `:441` | Young-symmetrizer image and GL action over a commutative ℚ-algebra, not an arbitrary-module Schur functor. |
| TauCeti.isIrreducible_weylRepOfShape_iff | `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Irreducible.lean:160` | Characteristic-zero field; irreducibility iff the number of rows is at most n. |


**Supplier and ownership audit.** `roadmaps resolve` at main 929496d and the supplied open-head index found no unresolved roadmap citation. Its library-name stage did not have Lake packages, so library claims were checked directly at the pins instead. `roadmaps grep` object searches and board-package searches covered group schemes, rectangular derivatives/Whittaker models, prescribed globalization, pole detection, Hermitian cuspidal support, Speh blocks, local factors and transfer. The following are resolved ownership boundaries, not claims that a planned supplier theorem has been implemented:

| Supplier and current location | Resolved boundary |
| --- | --- |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:943`, `:5509`, `:6704` | RG2.0a affine restriction of scalars, RG2.4 local decompositions/modulus, RG2.5 dual/L-groups of supplied groups. §0.0 here supplies concrete U/GU/GSpin comparisons. |
| `TauCetiRoadmap/OrthogonalSpinGroups/README.md`, Layers 0–1 | General-field SO, Clifford vector action and Spin; the completed-roadmap claims were not confused with implementations at a newer pin. |
| `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:26`, Layers 2–3 | Standing field ℂ; the coefficient-field Cauchy comparison here is a kept variant on the pinned Weyl modules. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:772`–820 | The signed Hermitian carrier/adjoint at line 776 explicitly works over fields with involution; odd residue characteristic applies to later classification, not that carrier. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2594`, `:3018`, `:3672`, `:4401`, `:4818` | Whole cuspidal data, second adjunction, derivatives and the distinct Z/L conventions. The whole-datum statement does not imply §5.0's fixed-tail claim. |
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:426`–446, `:624`–646 | recGL and actual cuspidal realizations; prescribed-local-component existence is an additional §10.0 target, not silently supplied by §4.2. |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:1593`–1645, `:2507`–2526, `:2876`–2886 | Discrete-unitary Eisenstein continuation and its smooth extension, intertwiners/residues, residual Speh, and cuspidal-support decomposition. The extra detection and constituent comparisons remain local targets. |
| `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:732`–745, `:1674`–1706 | Finite-place MVW and doubling for splitting characters. §3.2 owns the archimedean comparison; §§2.0/3.4 own arbitrary-character extension. |
| `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:645`–665 | R16.1.8 prescribes finite-image characters on full local groups, permits auxiliary ramification/order growth, and is trivial at infinity. The one-place norm-twist consequence is distinguished from incompatible simultaneous prescriptions. |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1657`–1680, §§0.1–0.4, 2.3 | Adjoint-determinant modulus, restricted products and quotient measures, with their analytic hypotheses. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:273`, `:1141`, Layers AL.0–AL.4 | Isobaric sums, Tate character-change normalization, GL factors and Satake products remain imports. The outside-S fixed-twist converse has a distinct family. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4192`–4206 | Canonical nongeneric factors on ordered Langlands data; γ support invariance, not equality of all L-factors for arbitrary constituents. |
| `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md:1083`–1122 at its supplied open head | Weighted-space support and continuous projections, not the constant-term pole-order or general automorphic constituent assertions here. |

No fully qualified Lean declaration is duplicated: this file declares none. The base roadmap is imported by named sections, and this extension identifies where the base stops. The remaining construction targets build comparisons on supplier carriers rather than reproduce those carriers.

**Declared gaps and settled work.** The registry contains six legacy G-records and 22 slugged supplier requests; this PR's README contains no `gap:` labels because those 22 comparisons have become local targets. They map as follows: two group-scheme requests→§0.0; classical quotient→§5.0; rectangular support plus five archimedean model requests→§5.1a; archimedean transfer→§0.4; opposite-unipotent estimate→§5.6; real contragredient→§3.2; two globalizations and automorphic constituent support→§10.0; pole detection/Hermitian support→§8.0; Speh intertwiner→§8.2; square normalizers→§8.5; gamma support→§10.2; epsilon character change→§10.3; arbitrary-character doubling→§§2.0/3.4. These are explicit owned targets, not assumed gap predicates. Their scope was checked for the stated field, rank, category, character and ramification hypotheses; §5.0 fails as R01.

G1–G6 are not re-raised. `packages/AutomorphicLFunctionsAndLocalFactorsPartII/reports/FIX-PKG-AutomorphicLFunctionsAndLocalFactorsPartII~2.md:5` expressly marks F01 not actionable because retiring them also changes frozen coverage references. Its ownership explanation is borne out here: G1→§§1.3/2.0–2.4/3.4 and named analytic suppliers; G2→§3.2/MVW; G3→§§4.2–4.10; G4→Layers 5–7/9.3; G5→§§10.0/10.3 plus the Hecke-character supplier; G6→§0.0. Synchronizing the obsolete registry with the port's ownership moves is intake maintenance, not a claim that inaccessible source proofs have been read. No settled inaccessible source was requested again.

**Seeded source audit (15 targets).** All locators below refer to the versions named in References. CFK uses arXiv v5 pages, not Annals pagination; MODELS uses v1; HLS uses the author text's internal pages. Source formulas with garbled extraction were checked against the rendered page when used for a finding.

| Target | Text and locator actually inspected | Outcome and limits |
| --- | --- | --- |
| 1.1 | EHLS lines 1862–1889, §4.1.1–4.1.2, p.44; lines 2197–2228, §4.3.1, pp.51–52 | Right-action induction and the half-modulus/character conversion agree. The χ versus χ⁻¹ distinction is retained. |
| 2.4 | EHLS lines 1893–2108, §§4.1.3–4.2.1, pp.45–49; HLS lines 1781–1788 and 1827–1831, footnotes 7–8, pp.44–45 | These give setup and use of the analytic results, not a complete unitary normalized local-FE proof. The target is a comparison on the named supplier; full primary proof remains uncertified below. |
| 3.4 | EHLS lines 1925–2045 and 2081–2108, pp.45–49; HLS lines 1727–1748 and 1791–1820, §3.1.2 | Global factorization and unramified normalization support the stated convention. Extension to arbitrary χ and completed bad factors is explicitly owned, not supplied by the displayed unramified identity alone. |
| 4.4 | EHLS lines 3494–3530, pp.75–76, (100), Lemma 4.4.8; printed p.76 inspected | Cauchy decomposition and minor vectors located. The roadmap specifies its own genuine polynomial action and lower/upper Borel pair. Printed partition inequalities are weak; the OCR's strict inequalities are not a source error. |
| 4.7 | EHLS lines 3537–3574, Corollary 4.4.9 and proof, pp.76–77 | Critical pair, selected line and nonzero rational scalar are present; projection to that line is essential. |
| 5.5 | CFK lines 535–554, §3.3, pp.13–14 | Entire compact-picture versus finite-place polynomial sections, spin character and s−1/2 normalization match. |
| 5.6 | CFK lines 779–831, Lemmas 3.13–3.14, pp.19–20; lines 1455–1482, Lemma 3.22, pp.32–33 | Schwartz/seminorm bounds and positive-chamber opposite-unipotent convergence located. Continuity and smooth vectors are retained. |
| 6.2 | CFK lines 561–567, Theorem 3.2, p.14 | Continuation and nonzero data match the stated archimedean/finite-place categories. Full underlying CFK22 proof is settled uncertified. |
| 6.8 | CFK lines 568–575, (3.2)–(3.3), p.14; lines 704–707, Theorem 3.7, p.17 | Parity of square factors and extra Sp factor agree; arbitrary generic τ is permitted for factor comparison with unramified π, not for the spherical-vector formula itself. |
| 7.5 | CFK lines 977–1008, 1022–1059, 1114–1136, 1212–1407 and 1408–1454, §§3.6–3.7, pp.24–32 | Read the matrix-coefficient realization, open chart, restriction model, determinant weights and convergence argument. The lower model is a restriction image, not all functions satisfying equivariance. Auxiliary uniqueness still depends on KAP23. |
| 8.1 | CFK lines 1490–1557, §4.2, (4.1)–(4.3), pp.33–35 | Residual Speh inducing data, spin-only central character and global parameter shift match. Residual Speh itself stays with the named supplier. |
| 9.1 | GK lines 4022–4054, 4115–4198, §3.2, pp.70–73; CFK lines 1668–1709, §4.3, pp.38–39 | Unfolding and nontrivial-unipotent hypotheses inspected. The roadmap correctly supplies a separate split-torus branch instead of extending this period to an infinite-volume quotient. |
| 10.0 | CFK lines 61–66, p.2; 1792–1825, pp.41–42 | Constituent support and globalization uses located. The stronger explicit central-character/ramification constructions are local targets; the short source proof does not independently establish all those refinements. |
| 10.3 | CFK lines 321–353, Theorem 2.1, pp.8–9; CKPSS01 lines 131–232, §2, pp.8–10; CPS94 lines 186–311, Lemmas 2.1–2.3, pp.161–165 | All ranks 1,…,N−1, fixed twist, outside-S matching, standard-module replacement and complete analytic hypotheses agree. CKPSS proof's mirabolic sums/congruence subgroup/strong approximation were read. Local ψ-change locator needs R02. |
| 10.7 | CFK lines 58–70, Introduction, p.2 | General automorphic consequence located. The roadmap retains inducing exponents and does not assert cuspidality or genericity of the transfer. |

Additional flagged G-obligations were checked against ADAMS14 lines 46–60 (fundamental Cartan, Theorem 1.2/Corollary 1.4), GGS17 lines 219–252 and 1310–1326 (Theorems E–F/Corollary G and exactness proof), MODELS lines 108–128 and 194–222 (derivatives and associated-cycle argument), GARRETT lines 171–197 (domain Haar and qualitative theorem), and HARRIS lines 1152–1194 (Remark 4.4, measure and theta comparison). HEN02 lines 195–240 distinguish support characterization from an unjustified nongeneric isomorphism theorem. These reads do not certify the complete inaccessible proofs listed below.

**Adversarial table.** The 163 rows cover all numbered targets, the headline groups, the findings and the principal API/convention assertions. “Pass” means the displayed computation agrees; source-proof limitations remain as recorded above and below. ν denotes the normalized local norm. Infinity, zero germs and excluded inputs are not assigned fictitious numerical values. All arithmetic below was recomputed for this review.

| Statement | Instances tried | Values on the two sides / wrong-model value | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: quadratic norm | ℂ/ℝ at 2; split algebra at (2,1/2) | 2·2=4 versus ordinary modulus 2; product norm=1 | Pass | None |
| Conventions: characteristic and q | ℚ₂, ℚ₃; purported q=1, characteristic 2 | norm(2)=1/2, norm(3)=1/3; 1 and characteristic 2 excluded by q≥2/char 0 | Pass domain | None |
| Conventions: variables | s_U=1, z=s_U+1/2; s_G=1/2 | z=3/2 reflects to −1/2, hence s_U=−1; s_E=0 | Pass | None |
| 0.0 U and GU carrier | zero module; complex line | U₀ has one element; GU₀ records any λ, so λ=1 and 2 differ despite identical action | Pass | None |
| 0.0 unitary/similitude laws | complex line, g=2 and h=3 | multipliers 4 and 9 multiply to 36, multiplier of 6; 2 is not unitary | Pass | None |
| 0.0 GSpin comparison | split Q=xy, vector (1,1); central scalar 2 | Q=1 is invertible; vector action of scalar 2=id, while its Clifford unit is 2≠1 | Pass | None |
| 0.0 base change/block map | two one-dimensional factors | block diag(2,3) multiplies block diag(5,7) to diag(10,21), on either construction | Pass | None |
| 0.1 doubled form/isotropy | h(x,y)=conj(x)y, vector (1,1) | h(1,1)−h(1,1)=0; anti/diagonal cross-pairing=2 | Pass | None |
| 0.1 polarization inverse | (3,1) | anti/diagonal coordinates (1,2) reconstruct (3,1); omitting halves reconstructs (6,2) | Pass | None |
| 0.1 embedding of isometries | factors 1 and −1 | squared norms both 1; block map preserves diag(1,−1); zero map sends norm 1 to 0 | Pass | None |
| 0.1 rank zero | V=0 | dim W=0=2·0; each polarization is 0 and inverse maps are unique | Pass | None |
| 0.2 modulus | n=1, B=2 over ℂ, λ=1 | δ=4⁻¹=1/4, δ^(1/2)=1/2; reciprocal convention gives 4 and 2 | Pass | None |
| 0.2 central similitude | B=2I_n, λ=4 | λ^(n²) norm(det B)^(−n)=4^(n²)4^(−n²)=1 | Pass | None |
| 0.2 radical/addition | skew-adjoint scalars i and 2i | i+2i=3i stays skew; Hermitian scalars 1 and 2 do not satisfy x+conj(x)=0 | Pass | None |
| 0.2 coordinate rescaling | unrescaled cross-pairing 2h | at h(1,1)=1 pairing=2; dual-basis rescaling by 1/2 gives 1 | Pass, including dyadic field | None |
| 0.3 standard degrees | Sp₂, SO₃, SO₄ | N=3,2,4 respectively; substituting matrix size gives wrong first two degrees | Pass | None |
| 0.3 GSpin determinant | scalar 2I₄ in dual GSp₄ | χ=4, det=16=χ²; χ alone gives 4 | Pass | None |
| 0.3 torus pair | GSpin₂, σ(ϖ)=1, χ(ϖ)=−1 | pair (1,−1), product −1=χ; forgotten twist gives product 1 | Pass | None |
| 0.3 central quotient | GSpin₂ | center dimension 2, distinguished center 1, quotient 1; full-center quotient would have dimension 0 | Pass | None |
| 0.4 archimedean transfer | SL₂ weights ±1/2 | Sym² weights 1,0,−1: degree 3 and sum 0; original has degree 2 | Pass convention | None |
| 1.1 induction covariance | n=1,s=0,χ=1,B=2,λ=1 | multiplier 1/2=δ^(1/2); using inverse modulus gives 2 | Pass | None |
| 1.1 norm twist | same B, χ replaced by norm_E | 4·(1/2)=2; parameter shift s↦s−1 also gives 4·(1/2) | Pass | None |
| 1.1 transitivity of action | positive B=2,3 | factors 1/2·1/3=1/6, equal factor at B=6 | Pass | None |
| 1.2 Godement section | n=1,s=0,χ=1, g=diag(4,1) | second row is unchanged; determinant factor=√4=2, hence f(g)=2f(1) | Pass | None |
| 1.2 Schwartz/measure linearity | Φ=0; Haar multiplied by 3 | f_0=0; value 2 becomes 6, not 2 | Pass | None |
| 1.2 exponent | n=1,s=1/2 | n+2s=2; replacing by n+s gives 3/2 | Pass | None |
| 1.3 Weyl action | χ(z)=z/modulus(z), z=i | (χᶜ)⁻¹(i)=i, whereas χ⁻¹(i)=−i | Pass | None |
| 1.3 continuation reflection | χ=norm_E^i at 2 | χ(2)=4^i, reflected character 4^(−i); applying twice returns 4^i | Pass type/parameter | None |
| 1.3 residual specialization | GL₁ Siegel datum | no internal GL residue is needed; one-dimensional inducing rank=1, empty residue chain length=0 | Pass boundary | None |
| 2.0 arbitrary-character extension | ℚ₃×ℚ₃, χ=(ramified quadratic,1), (2,2) | χ=−1; splitting character and norm twist both 1 on this pair | Pass; extension necessary | None |
| 2.1 normalized pairing | pairing=2, Z=6; dual vector scaled by 5 | quotient 3; new pairing=10,Z=30, quotient still 3 | Pass | None |
| 2.1 zero-pairing domain | v=0 | Z=0 and pairing=0; 0/0 is not an allowed normalized integral | Pass domain | None |
| 2.1 Haar scaling | compact mass 7, constant coefficient 2 | Z=14 and normalized quotient=7; mass 1 instead gives 2 and 1 | Pass | None |
| 2.2 split rank-one denominator | X=1/2,Y=1/3 | d=1/(1−XY)=6/5; Z=(1−XY)/((1−X)(1−Y))=5/2; dZ=3 | Pass | None |
| 2.2 nonsplit parity | q=2,n=2,s=0,χ=1 | d=(1−1/4)⁻¹(1+1/2)⁻¹=8/9; omitting η gives 8/3 | Pass | None |
| 2.2 excluded rank/junk value | n=0 formal product | empty product 1; positive-rank theorem does not acquire a rank-zero representation | Pass domain | None |
| 2.3 compatible spherical lattice | split dyadic rank one, s=1/2,t=1/2 | Z=3,d=4/3,dZ=4; incompatible scaling Z=3/2 gives 2 | Pass negative control | None |
| 2.4 normalized intertwiner | s_U=1/4 | source parameter 1/4, target −1/4, double reflection 1/4; substituting 1−s gives 3/4 | Pass type | None |
| 2.4 scalar normalization | rescale unnormalized operator by 2 | normalization functional also doubles, so normalized ratio is 2/2=1; leaving scalar fixed changes it to 2 | Pass | None |
| 3.1 global period is section-dependent | S₃ standard sum-zero representation, v=(1,−1,0), ℓ=x₃ | ℓ(v)=0 but ℓ((23)v)=−1; delta kernel at (23) integrates to −1 | Pass rejection of fixed-section invariance | None |
| 3.1 Euler/pairing factorization | local pairings 2,3 and integrals 6,12 | raw product 72; normalized product 3·4=12 and global pairing 6 gives 72 | Pass | None |
| 3.2 real contragredient | U(1) character z³ at z=i | character=i³=−i; inversion character=i^−3=i, equal dual and unequal original | Pass | None |
| 3.2 involution | diagonal complex phases i,−i | inversion twice gives (i,−i); a single inversion gives (−i,i) | Pass | None |
| 3.3 Garrett output/linearity | kernel multiplied by 2; selected vector v | output 2T(v); assuming only a fixed-section intertwiner would wrongly force all kernels to one scalar pairing | Pass linearity; see §3.1 witness | None |
| 3.3 contragredient distinction | one-dimensional character z³ | π(i)=−i, π∨(i)=i; output π cannot be relabeled π∨ | Pass | None |
| 3.4 completed unitary product | two designated local factors 2,3 | product 6; deleting factor 2 multiplies by 1/2, restoration by 2 returns 6 | Pass factor convention | None |
| 3.4 completed reflection | z=3/2 | dual argument 1−z=−1/2; s_U reflection 1↦−1 agrees | Pass | None |
| 4.1 positivity | U(1,1), κ=(1;−1) versus (0;0) | gap 2 meets threshold 2 and μ=(0,0); gap 0 fails | Pass | None |
| 4.1 dual label | κ=(2;−1) | generating dual weight (−2;1), not (2;−1); gaps have opposite signs | Pass | None |
| 4.2 scalar automorphy/central phase | m=3,aχ=2,bχ=0,n=1,z=e^(iπ/4) | Λ=(1;−3), generator (−1;3), central value z²=i; inverse choice gives −i | Pass | None |
| 4.2 holomorphic range | 2m−aχ−bχ=4, n=2 | 4≥2n=4 at boundary; m reduced by 1 gives 2<4 | Pass | None |
| 4.3 holomorphic injection | normalized highest generator at identity | source coefficient 1 maps to function value 1; zero map gives 0 | Pass necessary nonzero control | None |
| 4.4 Cauchy dimensions | u=2,d=2; u=0,d=0 | dim Sym²(E⁴)=10=3²+1²; empty degree-zero space has dimension 1 | Pass | None |
| 4.4 polynomial action law | g=[[1,1],[0,1]], h=[[1,0],[1,1]] | (gh)⁻¹=[[1,−1],[−1,2]]; reversed order gives [[2,−1],[−1,1]] | Pass, order distinguished | None |
| 4.4 Borels/highest minors | f=X₁₁, lower/upper unipotents | both chosen actions fix f; first upper instead subtracts X₂₁, value difference −1 at X₂₁=1 | Pass | None |
| 4.4 minor versus repeated entry | X=[[1,2],[3,4]], λ=(1,1) | Δ₂=4−6=−2; X₁₁²=1 | Pass | None |
| 4.5 opposite branch twist | a=b=1,m=3,aχ=2,bχ=0,r=1,s=0 | generator (−2;3), transported dual (−3;2), plus twist 2 gives (−1;4) | Pass | None |
| 4.5 common central phase | same branches, z=e^(iπ/8) | total exponent 4 gives i; inverse determinant twist gives −i | Pass | None |
| 4.6 raising polynomial/PBW | partition (1,1); zero partition | differences (0,1), weighted degree 2 and polynomial Δ₂; zero partition gives degree 0 and operator 1 | Pass | None |
| 4.6 coefficient scaling | operator D replaced by 3D | evaluation at a vector with Dv=2 gives 6; zero operator gives 0 | Pass linearity | None |
| 4.7 rational projection | zero raising partitions, identity projection on selected line | scalar P=1, projection of generator coefficient 1 is 1; zero projection gives 0 | Pass boundary/nonzero control | None |
| 4.8 unitary critical parameter | m=3,aχ=2,bχ=0,n=1,B=1 | t=2,scrit=3/2; J(m(2,1))=1/16=(1/2)4^(−3/2); substituting m gives 1/64 | Pass | None |
| 4.8 section rescaling | zero partitions, identity, B=1 then 2 | section values 1 and 2; local integral doubles | Pass | None |
| 4.8 U versus GU character | multiplier ν=4 | exponents 0 and 1 give 1 and 4, though both restrict to 1 on ν=1 | Pass discriminant | None |
| 4.9 critical nonvanishing | scalar disk kernel, m=2 | integral π/(2−1)=π≠0; zero section gives 0 and is excluded | Pass instance; general theta comparison not certified | None |
| 4.10 algebraicity/Haar | a=b=1,m=2; Haar doubled; compact ab=0 | π⁻¹I=1, doubled Haar gives 2; compact period power π⁰=1 | Pass | None |
| 5.0 classical quotient | SO₄/ℚ₃, inducing exponents (2,1) | two constituents, one quotient; allowed second pair (−2,1) lies outside its four-element Weyl orbit | FAIL | R01 |
| 5.0 corrected whole datum | Weyl swap (2,1)↦(1,2) | values at 3 swap (1/9,1/3)↦(1/3,1/9); missing quotient is recovered | Repair passes instance | Include tail action |
| 5.1 trace character | k=3,c=1; adjacent entries 3,7 and cross entry 4 | trace sum 10; cross entry contributes 0; ψ(3+7)=ψ(3)ψ(7) | Pass | None |
| 5.1 stabilizer | k=2,c=1, diagonal Levi (a,b) | adjacent entry scales by a/b; a=b gives 1, (2,1) gives 2 and changes ψ | Pass | None |
| 5.1 boundary/orbit order | k=1,c=2 and k=2,c=1 | trace sum 0 and ψ=1, orbit (1,1); ordinary GL₂ Whittaker orbit (2) | Pass | None |
| 5.1a finite derivative support | determinant character GL₂, k=1,c=2 | orders (1,1), terminal dimension 1, rectangular Hom dimension 1; ordinary Whittaker dimension 0 | Pass | None |
| 5.1a exclusion of generic GL₄ | requested (k,c)=(2,2) | rectangular prefix sums (2,4); generic first derivative order 4>2 | Pass | None |
| 5.1a archimedean wavefront | determinant versus generic GL₂ | maximal partitions (1,1) and (2); ordinary Whittaker dimensions 0 and 1 | Pass | None |
| 5.1a induced wavefront | generic principal series from two GL₁ characters | induced regular GL₂ orbit has dimension 2=0+0+2 dim U; separate block orbit dimensions are 0,0 | Pass | None |
| 5.1a archimedean derivative comparison | determinant GL₂ | ranks 2→1→0, terminal dimension 1 and functional dimension 1 | Pass | None |
| 5.1a degenerate derivative induction | k=2,c=2; k=c=1 | ranks 4→2→0; singleton derivative ends at rank 0 with character value 1 | Pass | None |
| 5.1a exact continuous dual | 0→V→V⊕V→V→0, model dimension 1 | dual dimensions 1→2→1, image/kernel dimensions 1=1; quotient dual maps into middle dual | Pass | None |
| 5.2 generalized Speh definition | c=1; k=1,c=2 | ρ₁(τ)=τ; ρ₂(χ)=χ∘det has dimension 1 and rectangular orbit (1,1) | Pass | None |
| 5.2 finite length versus admissibility | ℚ₂, determinant characters of increasing conductor n≥2 | for depth m, extra fixed dimensions max(m−1,0), finite; total length is infinite | Pass exclusion of false finite-length inference | None |
| 5.2 model uniqueness | one determinant character versus its double | rectangular Hom dimensions 1 versus 2; the double fails the one-dimensional law | Pass | None |
| 5.3 spin kernel descent | central factors 2 and 1/2 | product 1; suppressing either leaves 2 or 1/2, so descent fails | Pass | None |
| 5.3 character descent | kernel value ζ and inverse ζ⁻¹ | product 1; same-sign alternative gives ζ²≠1 when ζ has order 3 | Pass | None |
| 5.3 permutation/embedding | four coordinates interleaved | order (1,3,2,4) is invertible; applying the same transposition twice restores (1,2,3,4) | Pass | None |
| 5.4 determinant twist | k=2,c=3,l=1, determinant norm 1/2 | (kc−kl−c+l)/2=1, twist=1/2; omitted twist=1 | Pass | None |
| 5.4 restriction image | lower-chart test with character ζ of order 3 | prescribed restriction vanishes at a₁₁=0, while another equivariant function can have value ζ²−ζ≠0 | Pass distinction | None |
| 5.4 rank domain | c=3,l=2 in classical-tail use | c−2l=−1, so forbidden; truncating natural subtraction to 0 would admit a spurious tail | Pass domain | None |
| 5.5 section parameter | s_G=1/2 | exponent s_G−1/2=0, not 1/2 | Pass | None |
| 5.5 section classes | X=q⁻ˢ | 1+X Laurent polynomial; 1/(1−X) has a pole at X=1 and is not an entire compact-picture section | Pass | None |
| 5.5 central covariance | spin inducing central values a=2,b=3 | χ(ab)=6=χ(a)χ(b) in the chosen scalar test; forgetting χ changes 6 to 1 | Pass | None |
| 5.6 Schwartz decay | e^(−x²), polynomial weight x² | at x=0 weighted value 0, at x=1 value e⁻¹, at infinity limit 0; constant function's weight is unbounded | Pass model of required bound | None |
| 5.6 opposite-unipotent estimate | SL₂(ℝ) spherical section, positive exponent 1 versus boundary 0 | integral of (1+x²)⁻¹ is π; integral of (1+x²)⁻¹/² diverges | Pass positive-chamber necessity | None |
| 6.1 local integral descent | central quotient scalar and inverse | coefficient factor 2 times section factor 1/2=1; same-sign factors give 4 | Pass | None |
| 6.1 matrix coefficient dual | one-dimensional character value i | π∨ gives −i rather than i; pairing with inverse-character section cancels to 1 | Pass | None |
| 6.1 linearity | zero section; section multiplied by 2 | integrals 0 and 2Z; wrong constant construction gives Z in both cases | Pass | None |
| 6.2 continuation/nonzero data | SO₂/ℚ₂, unramified trivial data at s=1 | Z=3≠0; continued rational germ has the same value 3 | Pass instance; underlying general proof uncertified | None |
| 6.3 generic multiplicity one | trivial torus functional; double of its representation | Hom dimensions 1 and 2; the reducible double is outside the irreducibility hypothesis | Pass domain | None |
| 6.4 intertwiner reflection | s=1/4 | target 3/4, twice-reflected parameter 1/4; unitary-family reflection would instead be −1/4 | Pass | None |
| 6.4 normalization ambiguity | λ(s) rescaled by eˢ | relative normalization changes by e^(2s−1); at s=0 this is e⁻¹≠1 | Pass discriminant | None |
| 6.5 dyadic θ-factor | c=2,k=1,s=1, trivial characters | norm(2)⁻¹=2 over ℚ₂, versus 1 over ℚ₃; at s=1/2 the norm exponent is 0 | Pass | None |
| 6.5 gamma definition | Z=3, transformed Z=6, scalar correction 1 | γ=2; scaling section by 5 gives 30/15=2 | Pass ratio normalization | None |
| 6.6 norm twists | spin t=1/4,u=1/3 | shift t+u=7/12; omission of spin twist gives 1/3 | Pass | None |
| 6.6 multiplicativity | torus pair α=1,β=−1 at uniformizer | standard degree 2 and determinant −1; dropping twisted dual gives determinant 1 | Pass | None |
| 6.6 reflection/duality | SO₂/ℚ₂,π=τ=1,s=2 | γ(2)=9/16 and γ(−1)=16/9; product 1, whereas equal factors would give 81/256 | Pass | None |
| 6.6 ψ-change exponent | N=3,k=1,s=1/2, trivial central characters | norm power 0, scalar 1; at s=1 exponent 3/2 | Pass | None |
| 6.7 gamma-zero divisor | SO₂/ℚ₃, ramified quadratic τ, X=3⁻ˢ | γ=−3X² has zero divisor 0 on ℂ×; P=1,L=1; counting X=0 would demand P(0)=0 | Pass | None |
| 6.7 polynomial normalization | P=1−2X; proposed 3P | constant terms 1 versus 3; root both 1/2, so constant-term law excludes 3P | Pass | None |
| 6.7 empty classical GL block | Sp₀ tail, τ with shifts ±1/4 | factor L(s+1/4)L(s−1/4), not 1; two retained shifts, not zero | Pass | None |
| 6.7 torus exponents | α=ν,β=ν⁻¹ | exponents 1 and −1 cannot both become 0 under one common shift: equations u=−1 and u=1 conflict | Pass separate torus branch | None |
| 6.7 GSpin positive chamber | GSpin₃≃GL₂, r=1,a=3/4 | GL₂ exponents (3/4,5/4) are in the wrong order; a>r/2 holds but a>r fails, correctly excluding them | Pass corrected convention | None |
| 6.8 spherical denominator | SO₂/ℚ₂,k=1,τ=π=1,s=1 | L=4,b=4/3,Z=3; bZ=L | Pass | None |
| 6.8 parity and exterior rank one | c=2,k=1,s=1/2 | symmetric argument 1, exterior argument 2 with factor 1; Sp adds standard argument 3/2 | Pass | None |
| 6.9 holomorphy/pole comparison | unramified unitary rank-one factor at q=2,s=1 | L=2 finite; at s=0 pole, outside Re(s)>0 | Pass boundary | None |
| 6.10 stability | ramified quadratic pair on SO₂/ℚ₃ | both Tate L-factors 1, product 1; γ retains nontrivial unit −3X² | Pass; L=1 does not mean γ=1 | None |
| 6.11 twisted torus factor | GSpin₂/ℚ₃, α=1,β unramified with β(3)=−1,s=1 | L=(1−1/3)⁻¹(1+1/3)⁻¹=9/8; omitted twist gives 9/4 | Pass | None |
| 6.11 nonunitary SO₂ factor | μ(3)=2,τ=1,s=1 | L=(1−2/3)⁻¹(1−1/6)⁻¹=18/5 | Pass full torus scope | None |
| 6.11 archimedean parity | α=β=sgn on ℝ | L=Γℝ(s+1)² rather than Γℝ(s)²; shifts 1,1 versus 0,0 | Pass | None |
| 7.1 auxiliary exponent | k=1,c=2; k=2,c=1 | s−(kc−2c+1)/2=s+1/2 and s−1/2 respectively | Pass | None |
| 7.1 Schwartz factor at k=1 | GL₁, no cutoff, shell index m∈ℤ | positive m requires Re(s)>0, negative m requires Re(s)<0; no common convergence domain | Pass necessity of Φ | None |
| 7.1 covariance/linearity | auxiliary section scaled by 2; Φ=0 | integral doubles; zero Φ gives 0 | Pass | None |
| 7.2 sign in functional equation | real c=1,k=2,π=sgn; c=2,π=sgn det | first ωπ(−1)^(k−1)=−1; second det(−I₂)=1 gives +1 | Pass | None |
| 7.2 parity boundary | k=1 and k=3 | exponent k−1 is 0 or 2; sign correction is +1 in both | Pass | None |
| 7.3 common pole divisor | germs t⁻¹,t⁻² | common maximal pole order 2; quotients by t⁻² are t,1; unit eᵗ has order 0 | Pass | None |
| 7.3 uniqueness/zero germ | multiply chosen denominator by eᵗ; zero integral | orders unchanged by 0-order unit; zero germ has no finite pole order used for attainment | Pass domain | None |
| 7.4 domination direction | L_RS=t⁻¹, auxiliary divisor t⁻² | L_RS/aux=t is holomorphic; inverse quotient t⁻¹ is not | Pass | None |
| 7.5 open-chart exponent | k=2,c=3,l=1 | initial exponent s−3/2 plus restriction twist 1 gives s−1/2, the GL₁ auxiliary exponent | Pass | None |
| 7.6 pole attainment | L=t⁻¹, Z=t⁻² | ord Z=−2≤−1=ord L; Z/L=t⁻¹ need not have a finite nonzero value | Pass germ formulation | None |
| 8.0 constant-term detection | family t⁻²A+t⁻¹B, CT(A)≠0 | pole order 2 on both sides; if CT(A)=0 only order ≤1 remains, excluded by target | Pass required distinction | None |
| 8.0 Hermitian support | λ=1/4+i | −conj(λ)=−1/4+i; −λ=−1/4−i is different | Pass | None |
| 8.1 global Speh family | c=1; s_G=1/2 | residual Speh is τ itself; s_E=0 | Pass | None |
| 8.1 spin-only twist | SL₂ datum τ=1 and nontrivial auxiliary quadratic character | nonspin χ=1; inserting the arbitrary quadratic would change the square-character test from 1 to nontrivial | Pass discrimination | None |
| 8.2 two-term constant term | c=2,s=1/2,τ a cubic Hecke character | smaller Speh size 1 in both terms; parameters s+1/2=1 and s−1/2=0; M₁ threshold −1/2 and M₂ boundary 1/2 | Pass recursion/ranges | None |
| 8.2 Speh intertwiner bound | c′=1, s=1/4 | threshold (1−c′)/4=0 and s is inside; for c′=3 threshold −1/2 | Pass range | None |
| 8.3 residual exponents | c=2,Re(s)=1/4 | prefix bounds −3/4 and −1/2, both negative; at Re(s)=0 final bound 0 | Pass | None |
| 8.4 no-essential-self-duality scope | rank-one inducing character τ with τ² nontrivial on units | τ² on chosen unit −1 versus norm^it on units 1, so no norm twist makes selfdual | Pass hypothesis witness | None |
| 8.5 square normalizer | k=1,c=2,s=1/2 | wedge² of a line is 0, L=1; symmetric-square argument 1, not 2 | Pass | None |
| 9.1 torus exclusion | SO₂ global quotient, positive nonzero kernel, cutoffs R=e,e² | truncated outer integrals C log R=C,2C with C>0; limit infinite | Pass; torus period not asserted | None |
| 9.1 unfolding characters | ψ and ψ⁻¹ on the same trace value with ψ=ζ₃ | ζ₃ζ₃⁻¹=1; equal signs give ζ₃²≠1 | Pass | None |
| 9.1 scalar/Euler linearity | factorizable sections with local multipliers 2 and 3 | global scalar 6=2·3; deleting either loses a factor | Pass | None |
| 9.2 completion/deletion | one local factor L_v=2 | delete multiplier 1/2, restore multiplier 2, total 1 | Pass | None |
| 9.2 product formula | rational b=2 over ℚ | norm∞(2)norm₂(2)=2·1/2=1; idele supported only at infinity has norm 2 | Pass rational-domain distinction | None |
| 9.3 completed FE | s=1/4, all-place product | reflected argument 3/4, reflection twice 1/4; omitting one nontrivial local epsilon 2 changes product by 2 | Pass convention | None |
| 9.3 strip hypothesis | model entire functions e^(s²), e^(−s²), fixed real part x | magnitudes e^(x²−y²) bounded and e^(−x²+y²) unbounded; entireness alone is not strip boundedness | Pass; separate analytic target needed | None |
| 9.4 pole-order entireness argument | LQ holomorphic, ord Q=−1 | ord L+ord Q≥0 forces ord L≥1; a pole of Q cannot hide a pole of L | Pass | None |
| 9.5 torus entireness criterion | unramified order-3 class character μ over ℚ(√−23), τ=μ⁻¹ | product Λ(1)Λ(μ⁻²); pole order −1 at s=1 despite μ²≠1; theorem's torus criterion excludes the norm-character factor | Pass correction to global scope | None |
| 9.5 class-character witness | reduced forms of discriminant −23 | (1,1,6),(2,1,3),(2,−1,3): three classes, μ³=1 but μ²≠1 | Pass | None |
| 10.0 automorphic support | no GL blocks; one GL₁ block with tail degree N₀ | degrees N₀ and N₀+2; missing dual would give N₀+1 | Pass | None |
| 10.0 classical globalization twist | unitary σ; general norm twist ζ | exponent 0 gives ζ=1; twist-back central multiplier ζ·ζ⁻¹=1 | Pass consistency; existence proof not independently certified | None |
| 10.0 controlled test globalization | T={v₁}, one auxiliary good place w | canceled ratios at v₁,w are 1,1; uncontrolled factors away from v₀ count 0 | Pass contract | None |
| 10.1 weak transfer Satake polynomial | SO₂, μ(ϖ)=3 | roots 3,1/3; polynomial 1−(10/3)T+T², determinant 1 | Pass | None |
| 10.1 weak versus local equality | prescribe all but one place | exceptional finite set cardinality 1; definition imposes 0 equalities at that place | Pass scope | None |
| 10.2 coarse support equality | GL₂ trivial and Steinberg | common support {ν^(1/2),ν^(−1/2)}; standard L-ratio L(s−1/2)≠1 | Pass; not isomorphism | None |
| 10.2 gamma cancellation | x=q^(1/2−s) | (1−x)/(1−x⁻¹)=−x meromorphically, giving the Steinberg epsilon monomial | Pass | None |
| 10.2 nonempty test family | N=2 versus N=1 | ranks {1} versus ∅; N=1 would fail to distinguish any two characters | Pass N≥2 restriction | None |
| 10.3 converse testing ranks | N=2,3 | {1} and {1,2}; testing only rank 1 omits one required rank for N=3 | Pass | None |
| 10.3 convergence bound | N=3,σ₀=1,q=2 | parameter bound 2, inverse bound 4; product bound with τ unitary <2√2, consistent with the right-half-plane margin | Pass numerical bound | None |
| 10.3 epsilon ψ-change | N=3,k=1,s=1/2,b=3, trivial parameters | canonical factor ratio 1; CPS94 printed exponent yields √3 | Formula passes; citation fails | R02 |
| 10.3 fixed twist | candidate Π⊗η and test τ′ | pair characters Π⊗η⊗τ′ and Π⊗(ητ′) coincide; scalar example 2·3·5=30=2·15 | Pass twist direction | None |
| 10.4 high ramification | ℚ₂ character conductor m≥4; odd p conductor m≥2 | square conductor m−1 at 2 versus m at odd p; both grow without bound | Pass; dyadic case retained | None |
| 10.4 torus weak transfer | α,β as above | α⊞β has degree 2 and determinant αβ=χ; no converse testing required | Pass | None |
| 10.5 isolation | η_v₀=1,η deep at v₁, test ramification only at common-good w | local ratio at v₀ unchanged, other ratios 1·1=1 | Pass cancellation | None |
| 10.6 local existence proof | R01 SO₄ datum and swapped full datum | GL₄ supports both {ν²,ν,ν⁻¹,ν⁻²}; fixed π₀ route misses one quotient | Route fails as written | R01 |
| 10.7 general automorphic transfer | one GL₁ block; trivial Sp₂ automorphic representation | standard degree increases by 2; Sp₂ target remains GL₃ (weights 1,0,−1), not GL₂ | Pass generality/degree | None |

The 29 explicit construction/API blocks retain their prose API and at least three Checks; additional constructions in §§0.0, 4.4, 5.1a, 8.0 and 10.0 have stated inputs and outputs and discriminating checks. Rank-zero, zero-vector and empty-product cases above were tested only where their domains admit them. The zero ring, inseparable quadratic extensions, nonreduced quadratic algebras and characteristic-p local fields do not satisfy the standing characteristic-zero field/quadratic-étale assumptions. Residue characteristic 2 is admitted and was tested. Bare Hermitian matrices do not supply nondegeneracy; AddChar alone does not supply the analytic character hypotheses. Finite-length and Casselman–Wallach assumptions are explicit where the derivative and continuous-dual comparisons need them. No algorithm, copied source passage, sorry'd data, set_option or other-folder edit was found.

## Not verifiable

- **CFK22:** settled uncertified at DOI 10.1007/s00039-022-00609-4, with publisher correction DOI 10.1007/s00039-022-00622-7. The existing record identifies unsuccessful publisher/NSF routes. I did not request or retry it. CFK's Theorems 3.2, 3.5, 3.7, 3.10 and 4.6–4.7 can be checked as statements in the available v5 text; that does not certify the underlying full local continuation, normalization, stability and strip-bound proofs.
- **KAP23:** settled uncertified, DOI 10.1093/imrn/rnac201, Theorem 25. The auxiliary uniqueness input used by CFK Appendix A and Layer 7 is not independently checked against its primary proof. No new request.
- **YAM14:** settled uncertified, DOI 10.1007/s00222-013-0476-x, Theorem 7.1. The k=1 pole-attainment proof and all orthogonal/spin adaptations were not independently certified. No new request.
- **Classical unitary analytic normalization:** EHLS §§4.1–4.2 and HLS §3.1.2 were available and read; neither displayed passage proves the entire ramified/nonsplit local functional equation in the roadmap's right-action convention. HLS footnote 8 expressly qualifies the unitary continuation reference. The named supplier and explicit comparison targets own the work, but a complete primary unitary proof was not available in the supplied texts. This does not reopen a settled source request.
- **Holomorphic rational-kernel/theta comparison:** GARRETT's qualitative theorem and Haar normalization, HARRIS Remark 4.4(iii)–(iv), and the cited EHLS projection/critical-section statements were read. They support the route, but I have not certified a full proof of every coefficient-field, highest-line and GU multiplier comparison in §§4.8–4.10. The roadmap expressly makes these comparisons targets; a numeric disk check does not prove them.
- **Globalization refinements and full distribution proof:** the precise CFK proof passages using globalization, and GK's stated unfolding and distribution framework, are accessible. The short globalization passages do not themselves establish all prescribed central-character/unramified-place conditions in §10.0, and this review does not certify the entire equivariant-distribution proof of generic multiplicity one. These are explicit owned proof obligations, not missing opaque Lean hypotheses.

These limitations are recorded rather than guessed or converted into claims that the sources were verified in full. The verdict does not depend on obtaining another text: R01 has an explicit local counterexample.

## Source issues

- **Gap** in CPS94 at Lemma 2.1 proof, printed p.163 (CPS94 line 249): the source says the local exponent is nm s−nm+m(m+1)/2 without reconciling the additive measures; it should include the self-dual measure correction of exponent m(n−m−1)/2, yielding nm(s−1/2); affects the proof.
- **Error** in EHLS at §4.1.4, p.47 (EHLS lines 2017–2023): the source says a fixed-section doubling period is an invariant pairing and vanishes on orthogonal vectors; it should retain section translation, with no such vanishing for arbitrary fixed sections; affects a stated result.
- **Misprint** in EHLS at the action preceding Lemma 4.4.8, p.76 (EHLS lines 3515–3518): the source says the transposed-inverse substitution defines the stated polynomial product-group action; it should specify the genuine pullback action and compatible Borels, as in roadmap §4.4; affects a stated result.
- **Error** in CFK at §3.4, Langlands-quotient convention, p.17 (CFK lines 685–687): the source says a_d>r/2 when norm(Υ)^(−r)π′ is tempered; it should use a_d>r in the displayed Υ convention; affects a stated result.
- **Error** in CFK at Theorem 4.8, pp.39–40 (CFK lines 1719–1723): the source says nonessential self-duality and the stated bad-place condition imply entireness throughout its group scope; it should exclude split-torus doubling and use the separate two-Hecke-factor pole criterion; affects a stated result.
