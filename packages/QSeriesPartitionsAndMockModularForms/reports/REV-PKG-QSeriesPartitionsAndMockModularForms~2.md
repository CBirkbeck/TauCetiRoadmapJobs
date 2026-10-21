<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/578#issuecomment-6318979507 -->
Review (codex) of e81b036

Verdict: needs_changes

1. **F01** (P2) Generalize the inverse-of-24 offset interface

   **Location:** `packages/QSeriesPartitionsAndMockModularForms/README.md:547`: “For ℓ∈{5,7,11} and r≥1 define δ(ℓ,r)”.

   **Claim:** The offset construction, uniqueness, reduction and extraction-series API are confined to the three primes used by the subsequent congruences.

   **Witness:** For ℓ=13 and r=1, δ=6 satisfies 0≤δ<13 and 24δ=11·13+1. The same inverse construction and reduction proof apply. BevilacquaChandranChoi2019 line 39 introduces the offset before specializing the congruence primes.

   **Exact repair:** Define the bounded inverse of 24 for every positive modulus M with gcd(24,M)=1, with existence, uniqueness and reduction along divisibility. Specialize to M=ℓ^r for every ℓ coprime to 24, and define the corresponding coefficient extraction with that domain. Keep the divisibility assertions of §4.9 restricted to 5,7,11. Add the ℓ=13 witness and retain 2,3 as negative controls. This changes the construction's generality, not the set of primes satisfying Ramanujan's congruences. The present restriction is an application-specific shortcut contrary to the general-library contract.

2. **F02** (P2) Separate the weight-one constant-shadow correction

   **Location:** `packages/QSeriesPartitionsAndMockModularForms/README.md:1043`: “nonzero constant shadow uses the explicit y^(1−k) term”. The mock space at line 1039 has no k≠1 restriction.

   **Claim:** The constant-shadow correction described in §8.7 works throughout the mock space's weight range.

   **Witness:** At k=1, ξ₁(c·y⁰)=0 for every c, whereas ξ₁(log y)=1. The roadmap itself gives log y as the second zero mode at lines 968 and 984; BruinierFunke2003 line 366 excludes k=1.

   **Exact repair:** State a named zero-frequency correction law. For constant shadow g₀ and k≠1 the Weil normalization is conj(g₀)y^(1−k)/(1−k); the general height-one normalization is conj(g₀)(y^(1−k)−1)/(1−k). At k=1 use conj(g₀)log y. State which normalization each carrier uses and its holomorphic constant adjustment. Add the positive control ξ₁(log y)=1 and negative control ξ₁(1)=0, with a proved Lean test for the existing `maassXi` definition, combined into one of its two existing example blocks so the example limit is preserved. Preserve the weight-one mock construction and the existing k≠1 restriction on surjectivity; do not narrow the entire mock space.

3. **F03** (P3) Correct the Andrews Bailey-pair page range

   **Location:** `packages/QSeriesPartitionsAndMockModularForms/README.md:1206` and `README.md:1389`; `packages/QSeriesPartitionsAndMockModularForms/sources.toml:249`: “Theorems 3–4, 9 and 13, pp. 117–118, 125 and 132–133”.

   **Claim:** Theorems 3 and 4 are on printed pages 117–118.

   **Witness:** Andrews1986 line 241 starts Theorem 3 on printed p.118; line 246 identifies printed p.119, and line 266 starts Theorem 4 there.

   **Exact repair:** Change the Theorems 3–4 page range to pp.118–119 in both README occurrences and the existing manifest entry. Keep lines 241 and 266. The reviewer leaves the author's manifest entry untouched; the fix worker should correct it.

4. **F04** (P3) Give the prose API targets stable declaration names

   **Location:** `packages/QSeriesPartitionsAndMockModularForms/README.md:139`: “the empty quotient”, “the index-minus-one quotient”; also lines 375, 931, 1041 and analogous public-law paragraphs.

   **Claim:** These paragraphs provide the required named public API, but many entries are descriptive phrases without declaration identifiers. This affects definitions as well as theorem targets.

   **Witness:** Line 139 gives four quotient laws but no backticked declaration name; line 375 similarly labels the gap/residue APIs with ordinary words, unlike the actual names `IsGapTwo` and `IsPlusMinusOneMod5`.

   **Exact repair:** Assign stable Lean-style names in backticks to every public law, keeping its mathematical sentence and locator. For example use `regularQuotient_zero`, `regularQuotient_neg_one`, and `isGapTwo_iff_adjacent`. These are README targets: naming them does not require adding non-headline declarations to Suggested.lean. Apply this consistently to the existing public-law lists.

5. **F05** (P3) Declare the finite-index Fourier dependency

   **Location:** `packages/QSeriesPartitionsAndMockModularForms/README.md:1004` and `README.md:1010`: “the finite-index assertions are proved here by the cusp-width and finite-order translation argument of §8.4a”.

   **Claim:** The finite-index extension consumes §8.4a, but the subsection's `*Needs:*` line lists only §§8.3–8.4 and the two external suppliers.

   **Witness:** The construction used at line 1004 is explicitly the general-parabolic Fourier target at line 984, not the scalar kernel of §8.4.

   **Exact repair:** Add §8.4a to §8.5's `*Needs:*` line. Keep the repaired full-group/source distinction. The dependency points backwards and creates no cycle.

Five findings: two P2 blockers and three P3 corrections. The five repairs described in the available repair report are present. The original package-review report is absent at the supplied repository-relative location, so its wording could not be checked independently of that repair report. No reviewed package file or source-manifest entry was changed.

## Verified sound

### Previous findings and their repairs

The supplied path `packages/QSeriesPartitionsAndMockModularForms/reports/REV-PKG-QSeriesPartitionsAndMockModularForms.md` does not exist. The following audit therefore uses the five finding descriptions in `packages/QSeriesPartitionsAndMockModularForms/reports/FIX-PKG-QSeriesPartitionsAndMockModularForms~2.md`, then checks the actual package and cited sources. None was marked “not actionable in this package”.

| Previous finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01: semiring expansion and example proofs | Repaired in text/signatures; execution unverified | README:567 says “The pullout signature also retains every commutative semiring”. Suggested.lean:438–442 now spells out coefficient substitution. At the Mathlib pin, `Expand.lean:28` requires CommRing and `coeff_expand` at line 110 has exactly this coefficient formula. The modulus-one proof now uses finite-filter equality; both xi examples include the complex algebra steps. No elaboration success is inferred. |
| F02: native Rogers–Ramanujan counts | Repaired | README:377 says “Both finite-count laws quantify over every n:ℕ, including zero.” Suggested.lean:265 and :272 state both counts on native partitions. The multiset, rather than its underlying set, is sorted. Direct enumeration for n=0,…,16 agrees in both identities. |
| F03: bilateral and quintuple milestones | Repaired | README:281 names `ramanujanOnePsiOne_hasSum`; README:398 names `quintupleProduct_hasSum`. Suggested.lean:213–223 includes both pole exclusions and absolute convergence, and :290–299 includes nonzero q,z and integer exponents. Gasper1995 lines 478–508 and 608 support the formulas; b=0 and b=q are correctly distinguished. |
| F04: finite-index attribution | Repaired, with R05 bookkeeping correction | README:1004 says “For the full group the Fourier and kernel assertions are BruinierFunke2003 (3.2) and Proposition 3.2”. README:1024 separately describes descent for arbitrary finite-index subgroups. BruinierFunke2003 lines 383, 663–696 verify both the notation boundary and the subgroup/averaging argument. |
| F05: concatenation locator | Repaired | README:172 now cites “lines 313 and 329”. Gasper1995 line 329 is Exercise 1.1(ii), the concatenation identity; line 313 is inversion. |

### Principles, shape and Lean audit

Read all 1,392 README lines, all 627 Lean lines, both TOML files, all 69 numbered target subsections and their 69 `*Needs:*` lines. Counted 223 Check bullets, 15 real-bodied Lean definitions, 53 theorem targets and 26 proved-example bodies. All 68 named Lean declarations occur in the README. Checked all declared definitions for an API and at least three README Checks; R04 concerns names, not absence of their mathematical laws. The examples use the roadmap's own definitions; no definition has more than two example blocks.

The file has exactly `import Mathlib` plus the individual pinned partition-conjugation module, the required namespace/module description, and layer comments in README order. No `set_option`, sorry'd data, admitted example, `True` placeholder, `lemma` declaration, fake carrier or conclusion-as-hypothesis was found. The signatures carry their needed binders explicitly; there are no hidden section-variable hypotheses to be dropped. The existing-carrier headlines include both Rogers–Ramanujan count identities, their analytic identities, q-binomial/Euler, 1ψ1, quintuple product, equidistribution and prime-power congruences. Heavy completion/automorphic carriers remain README targets.

The general coefficient-ring, nonzero-denominator, termination, even-lattice and all-cusp boundaries are explicit. The rank/crank correction at size one, the exponent for powers of seven, conjugate shadow representation, nonharmonic general indefinite/Jacobi outputs, and absence of unit-circle evaluations were retained. No replanning of a main roadmap or computational algorithm deliverable was found. No suspicious instruction was acted on. R01 is the remaining application-specific restriction of a general construction.

**Elaboration: not available.** The brief supplies no executable Lean command. No Lean command was run, and this review makes no claim that `sorry` is the only actual compiler warning. Static inspection cannot certify the revised tactic proofs.

### Seeded source sample

Read all 15 requested target locators in the cached legal texts. Printed page labels, theorem/equation numbers, domains and normalization were compared, with the distinctions below. All 13 certified works have readable cached text; Watson's difficult exponent arrays were additionally inspected in rendered pages of the cached legal PDF (printed pp.107 and 122). The two waived and three uncertified entries remain settled. The only explicitly unchecked locator is the waived GasperRahman2004 background entry; it is not reopened.

| Target | Source evidence read | Result |
| --- | --- | --- |
| 3.2 finite Schur | Gasper1995 lines 1672–1689, (4.2.11)–(4.2.12), p.29 | These are the infinite endpoints, exactly as the README acknowledges. The finite formulas are attributed to the author's Pascal derivation, not falsely called Gasper's equations. Checked both polynomial identities exactly for n=0,…,12, including signed floor indices. This is not a source proof of the finite identities. |
| 3.3 Rogers–Ramanujan | Gasper1995 lines 1675–1689; Pak2002 lines 3703–3755, pp.38–39 | Both products, gap/residue interpretations, minimum part two and zero-size convention agree. |
| 3.5 ordinary adapter | Pak2002 lines 442–455, §2.2.1, p.10; pinned `coeff_genFun` | Product and p(0)=1 agree. The semiring coefficient specialization is native; inverses are confined to rings and constant-one tails. |
| 4.3 rank/crank functions | AndrewsGarvan1988 lines 80–88, 97–130, pp.168–170; Zagier2009 lines 912–925, p.986–17 | The source theorem requires n>1. The package correctly computes n=0,1 separately and adds (1−z)X. |
| 4.8 eta decimation | Atkin1967 lines 375–410, (29)–(33), p.23; Watson1938 lines 1081–1116 | Parity Euler factors and the extra X agree. Direct residue arithmetic gives offsets 4,24 for five and 5,47,243 for seven. The five/seven extension is also an explicit formal pullout argument. |
| 4.8a integral modules | Watson1938 lines 409–445, 542–555, 675–698, 1081–1116, 1319–1390; Atkin1967 lines 95–121, 232–247, 414–484, 514–565 | Checked weighted families, finite-support assertion, exceptional seven-base step and Atkin's X/Y inclusions. Rendered Watson pp.107,122 resolves the OCR's lost superscripts. The package's arbitrary-generator inclusions are proof targets using the source's coefficient bounds, not a claim that the paper literally defines these named modules. Full valuation-array reconstruction was not performed. |
| 4.9 prime powers | BevilacquaChandranChoi2019 lines 39–44, p.1; Atkin1967 lines 25–28, p.14 | All three exponents agree. Independently p(243) mod 343=245, hence divisible by 49 but not 343. Offset generality is R01. |
| 7.2 ordered kernel | Zwegers2002 lines 1275–1347, Definition 2.1, pp.25–27 | Ordered difference, √y/√(−Q(c)), isotropic domain and z-adapter agree. Hyperbolic summands give 2 and 0 with the stated order. |
| 8.2 differential operators | BruinierFunke2003 lines 375–480, (3.1), (3.3), Proposition 3.2, pp.8–10 | Signs, shifts, conjugation and factorization agree. Differentiating y, iy, y² independently fixes xi and Laplacian normalization. |
| 8.7 specified completions | Zagier2009 lines 640–735, §5, pp.986–12–14; BruinierFunke2003 lines 423–438 | Keeping the completion as data avoids an unjustified injectivity claim. Differentiating the displayed cusp integral gives (i/2)y^(−k)conj(g). The noncuspidal weight-one extension needs R02. |
| 9.1 theta coordinates | Zwegers2002 lines 2673–2696, Theorem 3.1 and (3.1)–(3.4), pp.49–50 | Substitution n=l+2mj gives precisely the native-theta adapter; positive index and multiplier restrictions are retained. |
| 9.2 meromorphic data | Zwegers2002 lines 2660–2668 and 3101 onward, p.49 and Theorem 3.9 | Elliptic/modular factors and integer positive index agree. Pointwise meromorphic decomposition does not silently assert holomorphy in τ. |
| 10.5 fifth-order vectors | Zwegers2002 lines 4329–4414 and 4770–4856, pp.74–80 | Checked every displayed component, characteristic and root-of-unity coefficient, including F₀−1, the φ₁ sign, scale 30τ and the opposing corrections. |
| 10.7 seventh-order vector | Zwegers2002 lines 3694–3783, pp.67–68, Proposition 4.5 | Order (A₀,A₂,A₁), all six C terms, phases, 21τ scale and ζ₁₄⁻¹/(2η) agree. |
| 11.3 rank residues | Zagier2009 lines 929–965, Theorem 7.1 and corollary, pp.986–17–18 | Root filtering and every positive modulus are supported. The exact shadow normalization is derived using §§6.1,11.2; conjugating the finite filter coefficients is necessary. t=1 gives zero. |

Also checked the corrected full-group/finite-index attribution, the bilateral/quintuple additions, KnoppMason2009 lines 188–241 (holomorphic logarithmic expansions only), BringmannOno2006 lines 270–337 (third-order vector), Garvan1988 lines 687–749 (eleven-dissection correction), and Andrews1986 lines 85–110, 241–280, 450 and 698 (Bailey/Hecke inputs). The Andrews page error is R03. No additional source fetch or missing-reference request was necessary.

### Adversarial mathematics pass

Each row covers the displayed definition/construction, its public laws, hypotheses and Checks in that numbered subsection. Exact finite computations are checks, not substitutes for the remaining theorem proofs. Cases such as inseparable schemes or ramified DVRs have no carrier in these targets; coefficient characteristic and zero-ring cases were used where relevant.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 1.1 finite products | n=0,1,2; q=0,1; zero ring; identity map | Index-zero factor and scalar change consistent | None |
| 1.2 integer products | a=3,q=2,n=−1; a=q=2 | Value −2; reciprocal zero is excluded | None |
| 1.3 quotient coefficients | A=[3], B=[1] or [2], q=2,j=−1 | −1 or 0; continuation distinguishes a denominator P-pole from a coefficient pole | R04 names |
| 1.4 formal products | a=0,1; degrees 0–2; F₂ | Tail unit/full product distinction and signs correct | None |
| 1.5 concatenation/inversion | n=0,2; units versus a=0 | Triangular exponent and reciprocal guards correct | None |
| 1.6 finite limits | q=0; a=q⁻¹,n=1 | 1−a at zero base; zero tail cannot be divided out | None |
| 2.1 unilateral series | Empty lists; numerator 1; denominator 1 | Normalization sign and finite termination are explicit | None |
| 2.2 bilateral series | j=−1; B=[q]; z=0 | Correct quotient direction; vanished negative tail; z=0 excluded | None |
| 2.3 convergence | q=2,a=±1/2; A=[],B=[0]; z=0 | Radius 4 versus terminating polynomial; negative-tail shift n+1 correct | None |
| 2.4 binomial/Euler | q=0; a=0; first two positive degrees at q=1/2 | Rational binomial and entire 1+z limit correct | None |
| 2.5 1ψ1 | j=0,−1; b=0,q; a=b | −2/3 versus 0 in the new example; empty annulus for a=b | None |
| 2.6 Bailey relation | Zero pair; delta pair; n=0,1 | β₀=α₀ and n+r denominator correct | R04 names |
| 2.7 Bailey transforms/limits | a=q=0; forbidden ρ=aq; zero pair | Unit requirements and weighted summability retained | None |
| 3.1 Gaussian polynomials | n=0,2,3; k=−1,n+1; Q=±1 | Integral polynomial remains defined where quotient is 0/0 | None |
| 3.2 finite Schur | Both identities, n=0,…,12, exact polynomial coefficients | All comparisons passed; signed floors essential | None |
| 3.3 Rogers–Ramanujan | Both counts n=0,…,16; (4),(3,1),(2,2); q=0 | Exact counts agree; predicates discriminate multiplicity/residue | R04 names |
| 3.4 quintuple | n=0,±1; z=1,−1; forbidden q,z=0 | 2−2q−2q² at z=1; cancellation at z=−1 | None |
| 3.5 ordinary adapter | n=0,1,2,4; reduction mod 2 | 1,1,2,5; constant coefficient survives scalar change | None |
| 4.1 rank/crank | Empty, (1), (3,2,1,1), (3,3), conjugate | Strict inequality and signed rank correct | None |
| 4.2 vector partitions | Empty; size one; swap last two partitions | V₁=z+z⁻¹−1 and swap sign correct | None |
| 4.3 generating functions | n=0,1; z=−1 | C₁=z⁻¹ and f specialization correct | None |
| 4.4 residue filter | t=1,2; zero statistic; characteristic dividing t | Multiplied integral filter and finite fibers correct | None |
| 4.4a dissections | Constant theta-addition term; size 4,6,49 | Source residue-five correction uses A₉; p(49)=173525=11·15775 | None |
| 4.5 equidistribution | Crank at sizes 4,5,6; rank mod 11 at size 6 | Each base crank fiber has size 1; rank-one fiber size 2 | None |
| 4.6 offsets | ℓ=2,3,5,7,11,13; r=1,2,3 | δ(13,1)=6 exposes unnecessary domain restriction | R01 |
| 4.7 decimation | t=1,2; X,X²; 1+X+2X²; semiring coefficients | Linear pullout holds; multiplication does not | None |
| 4.8 alternating eta | ℓ=5,7,11; first two steps and third seven-step | Odd/even Euler factors and extra X agree | None |
| 4.8a eta modules | First five/seven steps; seven r=3; eleven leading order | Exceptional seven step required; source filtrations match after normalization | None; proof-array limit stated above |
| 4.9 prime powers | r=1,3; p(243) modulo 343 | Seven exponent is sharp at this witness | None |
| 5.1 odd theta | Central two terms; z=0,1/2,τ=i | Oddness and derivative −2πη³ correct | None |
| 5.2 eta multiplier | Identity, S,T,−I; change lift sign | Cocycle rather than an SL₂ character; factors agree | None |
| 5.3 smoothing | x=0; positive/negative real x | β(0)=1, E′(0)=2; sign-only kernel fails | None |
| 5.4 Mordell | z=±1/2,τ=i; z=0 | Values 1,1 and positive integral at zero | None |
| 5.5 R correction | u=0; ν=±1/2; unit shift; y=0 | Evenness, factor 2 and domain correct | None |
| 5.6 μ | u→0; unit shift; common m(X,q,Z) normalization | Residue −1/(2πiϑ); reindex k=n+1 gives stated m comparison | None |
| 5.7 completed μ | S-defect; u+τ; simultaneous τ shift | h/(2i)+(i/2)h=0; homogeneous factors correct | None |
| 6.1 unary theta/C | a=b=0; a=1/6; scaling d>0 | Zero odd sum; leading 1/6; xi factor −√(2d) | None |
| 6.2 periods | a=b=0; endpoint a=1/2 | Central characteristic is (1/2,1/2); endpoint crossing excluded | None |
| 6.3 torsion | Order 2; unit characteristic shift; zero torsion point | Pole guard and finite rational orbit retained | None |
| 7.1 cone data | Hyperbolic plane; opposite component; rank one | Boundary admissibility and empty rank-one boundary correct | None |
| 7.2 ordered kernel | Equal data; hyperbolic points (1/2,±1/2) | Zero, 2 and 0; order fixes sign | None |
| 7.3 convergence | Dependent negative rays; two boundary rays | Q⁺ denominator not used on dependent/boundary case | None |
| 7.4 transformations | Hyperbolic determinant; odd diagonal; inadmissible b | Prefactor τ; half-diagonal shift retained | None |
| 7.5 orthogonal correction | A=[−2],c=1,2,a=1/4 | Minus sign and two nonprimitive cosets correct | None |
| 8.1 modular spaces | Zero; constant weight zero; odd central action; cusp S outside Γ | Carrier, representation domain and growth conventions distinguished | None |
| 8.2 differential operators | 1,y,iy,y²,log y; k=0,1,1/2 | ξ₀y=1; ξ₀iy=−i; Δ₀y²=−2y²; shift 3/16 | None |
| 8.3 harmonic spaces | Zero; constant; polynomial-growth y² | Harmonicity is independent of growth; analytic regularity gap explicit | None |
| 8.4 scalar kernel | k=0,1; w positive/negative; zero frequency | H₀=eʷ; log y is necessary at weight one | None |
| 8.4a monodromy | M=1,i,2; one unipotent Jordan block; β=0 | Complex frequencies/Jordan τ factors retained; matrix ODE and reduction-of-order Wronskian agree | None |
| 8.5 Weil Fourier/kernel | Rank zero; lattice ⟨2⟩; polar mode; subgroup missing central kernel | Central obstruction conditional; ξ₀conj(q⁻¹)=4πq⁻¹ | R05 |
| 8.6 exact sequences | Full group; normal subgroup; zero incompatible eigenspaces | Antilinear xi and finite-quotient averaging coherent; supplier gap retained | None |
| 8.7 mock objects | Zero/cusp/constant shadows; scalar i; k=1 | Constant-power correction misses log y; cusp-integral derivative correct | R02 |
| 9.1 theta components | m=1,l=0,1; l+2m; excluded m=0 | Leading exponents 0 and 1/4 and native adapter correct | None |
| 9.2 meromorphic datum | Zero; θ component; nonzero constant at m>0 | Elliptic law admits first two, rejects constant | None |
| 9.3 mixed residue | (1+v+conj v)/v²; conj v/v; 1/v; affine scaling | Residues 1,0,1; holomorphic Wirtinger coefficient essential | None |
| 9.4 polar kernel | z→u; l=0,m; cone Gram matrix | Residue −1/(2πi); R_m,0(0)=1 and R_m,m(0)=0 | None |
| 9.5 decomposition | Empty pole set; θ_m,j; double pole | Delta coefficients; first derivative needed for double poles | None |
| 10.1 third-order series | q=0; f through q³; ω through q³ | 1+q−2q²+3q³ and 1+2q+3q²+4q³ | None |
| 10.2 third-order vector | S²; T exchange; first unary correction | S²=I; first shadow +2√6g(1/6,0;3τ) | None |
| 10.3 fifth/seventh series | Constants; φ₁(−q)/q; seventh starting indices | Limit −1; ψ₁ constant retained; A₁ starts q | None |
| 10.3a Hecke identities | Constant/first terms; corrected ψ₀ and φ₁; seventh cone exponents | 1+2ψ₀ and q-factor required | R03 locator |
| 10.4 cone models | Diagonal fifth matrices; seventh negative vectors; leading terms | Correct signatures and unilateral-to-cone direction | None |
| 10.5 fifth corrections | Opposite vectors; phases and half-arguments | All source coefficients agree and corrections cancel | None |
| 10.6 fifth transforms | S²; exchange of components 3/5,4/6 | Unequal √2 entries give identity after scaling; φ₁ minus sign gives ζ₂₄₀⁷¹ | None |
| 10.7 seventh correction | Leading powers; Q(cᵢ),B(c₁,c₂) | −1/168,47/168,143/168; Q=−21/2,B=−28 | None |
| 10.8 seventh transforms | S²; third T phase | Sine matrix involution and 143≡−25 mod168 agree | None |
| 11.1 bilateral rank | q→0; z=−1; removable z=1 | Constant 1 and f specialization agree; q=0 understood as the standing bilateral limit convention | None |
| 11.2 root completions | α=1/2,1/3; excluded integer α; lower unipotent | Third-order witness and order-three polar cancellation retained | None |
| 11.3 rank deviations | t=1,2; nonreal filtering phases | Zero at t=1; opposite half-f deviations at t=2; shadow filter conjugates | None |

### Duplication and supplier-order audit

Read the main-roadmap shapes of ThetaSeries and Completed/ContourIntegration, and the relevant main sections of ClassicalArithmeticCompletion, ModularForms, PDE and IntegralLattices. Read the cached supplier heads of GeometryOfNumbersAndQuadraticArithmetic (`01c64f0cc5f154a3d190697951ead2fffc2af693`) and MetaplecticAutomorphicForms (`297a40c9a53d52c164a6e568d51015a6332dc8f4`). Their cited sections exist: analytic products/Appell–Lerch at §4.3; cover at §§2.4b–2.6; finite Weil and conjugation at §4.7; Jacobi at §§6.18,6.20; multiplier/comparison at §§7.1,7.49. The finite-prefix, classical-coordinate and holomorphic-weight adapters are distinct from those suppliers' objects.

The five specified open heads were inspected by scope and object searches: CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. No duplicate endpoint was located there. Sibling-package and main-roadmap searches likewise found no second owner for the retained rank/crank, Bailey, indefinite-completion or mock-form constructions.

Pinned library sources were checked at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The locator helper checked extracted files against Git tree blob hashes; I read the relevant declaration lines myself. Object searches covered q-products/q-binomials, partition multisets and weighted generating functions, conjugation, theta/eta, Maass/xi, residues and Eichler integrals. In particular:

| Existing object | Pinned or roadmap locator | Package handling |
| --- | --- | --- |
| Native partitions, restrictions and weighted series | `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52`, :205; `GenFun.lean:56`, :60, :170 | Reused. Weight-one coefficient adapter is a stated specialization, not a replacement carrier. |
| Partition conjugation | `TauCeti/Combinatorics/Enumerative/Partition/Conjugate.lean:157`, :162, :174, :183 | Reused for the new rank-sign comparison. |
| Ring-only expansion | `Mathlib/RingTheory/PowerSeries/Expand.lean:28`, :110 | Explicit coefficient substitution preserves semiring generality. |
| Ordinary Pochhammer versus q-Pochhammer | `Mathlib/RingTheory/Polynomial/Pochhammer.lean:33` | q-analogues occur in a TODO, not an existing competing declaration. |
| Pentagonal, Glaisher, theta and eta | The exact files/declarations in README:39–44 | Imported; their general results are not planned anew. |
| Formal specialization/triple product/cubic product | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:3619`, :8210, :8809, :9339, :9366 | Imported by the correct sections. |
| General lattice Poisson/positive theta | `TauCetiRoadmap/ThetaSeries/README.md:423`, :484, :587 | Consumed; indefinite error kernels remain distinct. |
| Residue/Cauchy and holomorphic Eichler theory | README:50,82's pinned Tau Ceti contracts | Distinct from mixed real-analytic residues and the conjugated shadow primitive. |

Read every supplier citation and `*Needs:*` line. No upward edge, supplier drift or cycle was found. R05 is an omitted local edge, not an upward one. No object needs to be moved to a later roadmap. The mechanical check returned exit code 0 with exact output:

```text
depcheck: 6 roadmaps, 40 edges, 0 problem(s)
```

All three gap slugs match the top-level design `gaps` list and the README's exact supplier-contract sentences. The surrounding paragraphs specify the pair-cover roots, analytic ellipticity away from y=0, and finite-rank vector-bundle/cusp-controlled Dolbeault extension. Their owners are named; no supplier is `none`. Main PDE Lane E is smooth/Schauder rather than analytic regularity, ModularForms 10B is line-bundle theory, and the metaplectic head does not give the requested classical pair comparison. These contracts are not findings and are not treated as already discharged. They remain prerequisites after the present package fixes.

## Not verifiable

- **Original prior review:** the named round-one package-review report is absent. The five available repair descriptions were checked against the actual files, but an omitted original finding cannot be ruled out from that missing document.
- **Lean elaboration:** not available under the brief. The revised proofs and signatures were inspected against the pins; no compiler run, elaborated `#check` output or warning count is claimed.
- **Settled sources:** GasperRahman2004 and BFOR2017 are waived; Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified. Their full text was not read and no new request is made. In particular the complete rank-five/seven Lambert evaluations remain locator-only; the seventh-order formulas themselves are also visible in Zwegers2002 lines 3697–3720.
- **Proof reconstruction limits:** the finite Schur formulas are the author's derived targets, not formulas found at the cited infinite-identity locator. Both were checked exactly through n=12. The full Watson/Atkin valuation inductions and the analytic convergence proof for arbitrary Jordan monodromy were not independently formalized; their source ingredients and displayed algebra/ODE were checked. This review does not present those checks as completed proofs.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e81b0363c56b9dd29b60d2094e9f1c2d351edf96", "job": "REV-PKG-QSeriesPartitionsAndMockModularForms~2", "model": "gpt-6-astra", "worker": "chris-4"} -->
