<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/521#issuecomment-6315558871 -->
Review (codex) of 7e6695a

Verdict: needs_changes

1. **F01** (P1) The derivative supplier citation points to Satake theory

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:99`: “SR.4 supplies mirabolic derivatives”; also line 103, the derivative-dependent Needs lines, and `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:3004` and line 3196.

   **Claim:** The restriction reductions consume mirabolic derivatives as supplied by SmoothRepresentationsOfLocalGroups SR.4.

   **Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:3155` is spherical representations/Satake. Its derivatives section is SR.5.1, line 3694; `mirabolic-derivatives` begins at line 3733.

   **Exact repair:** Replace every derivative-specific SR.4 binding with SR.5.1, naming `mirabolic-derivatives` and its exactness/filtration API. Update the supplier row, gap `induction-jacquet` section/needs/detail, target prerequisites, Needs lines and layer dependencies together. Retain SR.4 only for actual Satake inputs. Preserve the supplied unnormalized mirabolic conventions and explicitly perform the required normalized-induction conversion. This is supplier drift, not an objection to the declared restriction-filtration gap.

2. **F02** (P2) Bernstein Ext separation is already supplied

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:105`: “supply Ext-vanishing between disjoint Bernstein blocks”; repeated in `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:3214`.

   **Claim:** This part of `gap:bernstein-exclusions` is missing supplier work.

   **Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1807` supplies `central-ext-vanishing`; line 2740 supplies `bernstein-decomposition`. For the central block projector, the two scalar actions are 1 and 0, so every Ext group vanishes.

   **Exact repair:** Import SR.0d.2 `central-ext-vanishing` and SR.3.2 `bernstein-decomposition` for this specialization. Remove Ext separation from the gap's needs/detail and corresponding missing-theory descriptions. Retain the genuinely additional support-avoiding supercuspidal data, irreducible auxiliary classical induction and SO-orbit clauses. For disjoint finite collections of blocks, use the sum of their central projectors; no new Ext theorem is required.

3. **F03** (P1) Actual enhanced classical packets have no complete supplier

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:577`: “Quantification is over the supplier’s actual Πphi and enhancement map”; also §4.8 at line 605 and `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:1283`.

   **Claim:** The actual packet/enhancement interface used for all classical types over every local field of characteristic different from two comes from the cited sections and gaps.

   **Witness:** `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4173` supplies characteristic-zero unitary packets. `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:1672` assumes tempered packets as data and constructs unenhanced characteristic-zero generic packets. Neither supplies the asserted general enhancement map.

   The `parameter-carriers` contract supplies pairings, centralizers and positive-characteristic parameter carriers; it does not supply enhanced representation packets. The `enhanced-classification` contract at README line 115 only compares unitary labels. For example, the SO/Sp branch over a characteristic-zero local field still lacks its enhancement input; over F₃((t)) even the cited generic-packet construction is outside its domain. Metaplectic enhancement and the four-type enhanced induction laws need the same explicit accounting. Section 4.8 correctly states its implication conditionally, but does not name an owner or a precise interface for all those laws.

   **Exact repair:** Keep the full classical scope. Add precise residual supplier contracts for the actual classical/metaplectic packet and enhancement interfaces and the enhanced induction/normalization laws used in §§4.4–4.8, assigning the missing work to the named classification owner. Separate already supplied characteristic-zero unitary cases from missing types and fields. Where correspondence laws are conjectural inputs, state those mathematical laws explicitly as hypotheses of the assertion/reduction interface, rather than implying that the cited unitary sections provide them. Synchronize the README, plan gaps and consumers. Do not replace actual packets by arbitrary labelled finite sets.

4. **F04** (P1) Ordinary function-field cuspidal realizations lost their contract

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:714`: “F a global field of characteristic different from 2” and “f is a cusp form in the imported automorphic realization”; its Needs line is line 720. See also `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:1675`.

   **Claim:** The ordinary cuspidal realization, factorization and rapid decay needed by §6.1 are available throughout its global-field domain.

   **Witness:** `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:3` scopes its adelic theory to number fields; §4.2 at line 601 consumes that theory. The candidate's `cuspidal-tensors` contract at line 173 covers genuine covers used in §6.2, not ordinary §6.1.

   Take an ordinary SO₄/SO₃ pair over F₃(t). The adelic-points and quotient-integration gaps supply groups and measures, but not its ordinary cuspidal realization or the decay/factorization theorem invoked by the period proof. The GL-specific function-field factor theory does not supply this SO case. The consumer also does not depend on `cuspidal-tensors`.

   **Exact repair:** Declare an AutomorphicFormsOnReductiveGroups contract for the ordinary reductive cuspidal realization, prescribed-central-character factorization and decay inputs over odd-characteristic global function fields. Reuse its existing number-field and abstract restricted-tensor interfaces. Bind §6.1 and the classical global consumers needing this extension to it; keep the genuine-cover extension separately scoped or explicitly distinguish its ordinary and covered domains. Do not narrow the global statements to number fields.

5. **F05** (P1) Positive-characteristic orthogonal convergence has no analytic input

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:859`: “For tempered pi0,pi1 of a local adjacent SO pair as in §7.2, prove absolute convergence”; contrast line 185: “For characteristic-zero local adjacent classical pairs”. The corresponding plan contract is at line 3506.

   **Claim:** `gap:local-tempered-estimates` discharges the Harish-Chandra restriction estimates used by §7.3 throughout §7.2's characteristic-different-from-two domain.

   **Witness:** README line 843 permits Fv=F₃((t)), n=2, SO₃/SO₂. Line 185 excludes this field. The source's local convergence result includes the broader domain: ichino-ikeda line 128–179 and line 234–239.

   **Exact repair:** Extend the orthogonal restriction-estimate portion of the named AutomorphicSpectralTheory contract to nonarchimedean local fields of characteristic different from two. Keep the unitary number-field-place and archimedean trace portions at their actual domains. State which bounds yield absolute convergence for SOₙ₊₁/SOₙ with n≥2, and update the gap and §7.3 dependency. Add a positive-characteristic Check, rather than silently restricting the endpoint to characteristic zero.

6. **F06** (P2) The central theta gap still requests existing number-field Mellin theory

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:151`: “supply, over both global-field domains ... the zero-vector and dual zero-vector asymptotics for §6.2a”; also §6.2a's proof route at line 750 and `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:3384`.

   **Claim:** The number-field zero-mode/dual-zero-mode continuation is missing work assigned to MetaplecticAutomorphicForms, while §6.2a rebuilds the central Mellin continuation from Poisson summation.

   **Witness:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2188` defines the same mirabolic theta Mellin integral; line 2216 gives its zero-mode continuation/residues; line 2229 gives the equal-rank cuspidal unfolding.

   Direct substitution, with unitary beta and the same measures, gives `ThetaStar(s;g,Phi,chi) = beta(det g) E(g,s,Phi,eta)` for `eta = beta^n chi`. Indeed `det(ag)=a^n det(g)`, so the two half-density exponents combine to `abs(det g)^s abs(a)^(ns)`. Twisting one cuspidal factor by beta then identifies Z with the supplied equal-rank Rankin–Selberg pairing. The candidate acknowledges this AL.3 interface at line 137, but §6.2a's Needs line omits it and the gap still requests its asymptotic content again.

   **Exact repair:** Make that explicit comparison an adapter in §6.2a and consume AL.3's mirabolic series, continuation/residues, unfolding and pole criterion by their exact headings/names. Remove the already supplied number-field Mellin asymptotics from `gap:global-theta`. Retain the genuinely missing oscillator transport, function-field extension and any stronger uniform estimates or quasicharacter comparisons not supplied there, with precise hypotheses and owners. The relative regularized period itself remains a legitimate target; it need not be deleted.

7. **F07** (P2) The global Bessel character can be degenerate on one split factor

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:714`: “global nontrivial additive character psi_A of `A_A`/A”; also `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:1679`.

   **Claim:** These global data define the relevant Bessel period used with the local models of §2.4 and the global assertion of §6.4.

   **Witness:** Set A=F×F and psi_A(x,y)=psi_F(x). It is globally nontrivial and rational-trivial, but kills the second factor at every place. README line 310 explicitly rejects this character in the rank-three split local model.

   With W=0 and rank-A V=3, one GL₃ simple-root character vanishes. The integral can still be defined as a degenerate Fourier coefficient, but these data cannot instantiate the advertised nondegenerate local Bessel models. Rational triviality alone does not repair the mismatch.

   **Exact repair:** Require the global additive character to be nontrivial on each simple factor, equivalently use `psi_F(Tr(A/F)(c x))` with c∈Aˣ and a nontrivial automorphic psi_F. State and prove that its localizations satisfy §2.1a's factorwise condition. Carry this admissibility into §6.4 and add the one-factor split character as a negative-control global Check. Preserve the general algebraic functional of §2.1.

Seven blocking findings: four P1 and three P2. The relative mathematics is substantially supported by the sources; the remaining defects concern supplier coverage, two nonminimal contracts, and compatibility of global and local character data. The design can be repaired without changing its intended scope. No design or source-manifest file was edited.

## Previous findings checked first

The round-4 report was absent at its designated package path. I recovered and read its retained submission, then checked all seven findings against `packages/GanGrossPrasadConjecturesForClassicalGroups/reports/FIX-DESIGN-GanGrossPrasadConjecturesForClassicalGroups~5.md` and the actual design. References below to the README mean `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md`.

| Previous finding / repair | Status | Repaired passage and independent assessment |
|---|---|---|
| R01 / F01: broad smooth-representation contracts | Partly repaired | README line 99: “SR.2.2 supplies the modulus delta_P, exact Jacquet functors and normalized induction”. These imports and the move of Casselman–Wallach theory to AutomorphicFormsOnReductiveGroups §2.7 are correct. The derivative section and the remaining Ext request still need R01–R02 below. |
| R02 / F02: existing oscillator, theta and standard-module theory | Partly repaired | README line 147: “Sections 3.6–3.8 supply finite length, `howeDuality` and `localSeeSaw`”. The deleted Heisenberg/seesaw gaps and retained generic-local/P2 extensions are justified. The number-field theta-asymptotic portion still overlaps AL.3: R06 below. |
| R03 / F03: classification and factor theory | Partly repaired | README line 111: “retaining their `UnitaryClassificationInputs` hypotheses”; line 137 imports `AL3.NormalizedRsPeriod`. These repairs correctly preserve conditional classification, CM restrictions, and the distinction between local Whittaker periods and induced Eisenstein periods. The classical nonunitary enhancement interface is still missing: R03 below. |
| R04 / F04: adelic, cuspidal and analytic theory | Partly repaired | README line 169: “Sections 3.4–3.5 supply `RestrictedTensor` and Flath factorization with nonzero spherical reference vectors.” Ordinary number-field imports and separate Tamagawa normalizations are correct. The function-field ordinary realization and positive-characteristic local estimates have fallen outside the residual contracts: R04–R05 below. |
| R05 / F05: Hermitian carrier ownership | Repaired | README line 81: “Use its conjugate-linear-first pairing h by B(x,y) = h(y,x)”. GeometryOfNumbersAndQuadraticArithmetic §2.9 supplies the field carrier without its later local-classification restrictions; MetaplecticAutomorphicForms §3.2a supplies the split carrier. The Check gives B(i,1)=i and B(1,i)=−i. |
| R06 / F06: isolation ownership routing | Not repaired; settled | The repair report F06 says “not actionable in this package: supplier ownership routing requires the maintainer”. I checked the competing SM.5/global-isolation target and the narrower contract. Its normalized multiplier statement agrees with bplzz line 1428–1440. The stated reason remains valid; I do not re-raise it or require a dependency on Part II. |
| R07 / F07: global use of a local-only functional | Repaired | README line 280: “Prove G(W)-invariance and compatibility with every scalar extension F → R; no local topology or representation is an input.” Section 6.1 now uses this algebraic map. The separate global-character admissibility defect in R07 below is not a failure of this algebraic repair. |

## Verified sound

### Coverage, principles and shape

I read all 52 target paragraphs, their 89 API entries and 161 Checks, the conventions, all 52 Needs lines, all eight layer-dependency paragraphs, the supplier table, the plan and all 39 gap contracts. There are 26 definition/construction targets, 25 theorem targets and one example target. Every definition/construction has a named API and at least three Checks. All target names occur in the README; every internal prerequisite resolves to an earlier target; the graph is acyclic. Every gap has a named supplier, the same slug and needs sentence in both files, and exactly the consumers recorded by `neededBy`. These mechanical facts do not discharge the semantic defects above.

The roadmap develops general relative theory rather than a good-prime route. Characteristic two, inseparable quadratic algebras and the zero base ring are excluded explicitly; dyadic characteristic-zero fields remain included. Arbitrary ambient forms, split algebras, exceptional low ranks, archimedean continuity and genuine-cover signs are retained. There is no whole-roadmap replan, computational algorithm, copied source passage found in the inspected text, or arithmetic consumer used as a proof supplier. Conjecture assertions remain propositions; the orthogonal refinement is not presented as an unconditional theorem. No suspicious instructions were encountered in the inspected data.

The title, summary, ownership, conventions, supplier contracts, reading guide, eight layers, Examples/Dependencies endings, consumers and references have the requested shape. Main-branch QuadraticFormInvariants, GlobalNumberFields and completed RestrictedProducts were read for shape and ownership. Mathematical use of the word “packet” was not treated as process narrative. No Lean file is present at this design stage; Lean-specific signature and example checks cannot be inferred from prose.

### Seeded source sample

All 13 recorded source texts are legally cached and marked certified. I read each selected passage in the extraction, including its theorem label and surrounding hypotheses. The reference paragraph identifies the cached preprint versions; I checked against those versions, not an unverified alternate published pagination. There is no individually flagged unverified locator; the generic warning about other published pagination is not a hidden target list. No new source or missing-reference request was necessary, and no manifest entry was changed.

| Selected target | Locator read | Result |
|---|---|---|
| §2.3 Oscillator restriction | ggp §13, pp.49–52, ggp line 1761–1845 | The oscillator pullback, lambda factor, trace normalization, equal-rank case and genuine sign agree. The zero smaller-space case is distinguished from zero isotropic rank. |
| §2.4 Restriction functionals | ggp §14, pp.57–58, ggp line 2012–2063 | The tensor-Hom convention and the need for the dual/conjugacy comparison are preserved. The archimedean statement requires continuous functionals and completed tensors. |
| §3.1 Nonarchimedean uniqueness | ggp Theorem 14.1, p.58, ggp line 2068–2078; waldspurger theorem, p.1, waldspurger line 10–18; sun Theorem A and corollary, pp.1–3, sun line 15–42 and line 102–104 | Characteristic-zero hypotheses and genuine symplectic inputs are retained. Sun supplies the stronger Fourier–Jacobi uniqueness rather than leaving the earlier supercuspidal restriction in place. |
| §3.2 Archimedean uniqueness | sun-zhu Theorems A/B, pp.2–3, sun-zhu line 28–97 | The listed reductive/Jacobi groups and Casselman–Wallach categories agree; algebraic discontinuous Hom is not substituted. |
| §4.7 Split selection | ggp Theorem 17.2, p.68, ggp line 2394–2405 | Basic codimensions at all local fields; all codimensions nonarchimedeanly. The higher-codimension archimedean conclusion is not asserted. |
| §4.8 Reduction | ggp Theorem 19.1, pp.75–77, ggp line 2653–2700 | It is a conditional family implication using enhanced induction, not a proof of basic selection. Source support is correct; the supplier interface still needs R03. |
| §6.1 Bessel period | ggp §23, pp.86–88, ggp line 3036–3093 | The quotient, algebraic functional, cuspidality and split-plane exclusion agree. The stronger local admissibility already imposed by this design must also be imposed globally: R07. Function-field realization ownership is R04. |
| §6.2a Central regularization | liu-relative §3.1, p.17, liu-relative line 1029–1036; Remark 3.6 and (3.12)–(3.13), pp.23–24, liu-relative line 1492–1543 | Row action and half-density, central-character cancellation, initial half-plane and unitary central regularity agree. The function-field version is explicitly an extension target. Existing number-field ownership is R06. |
| §6.3 Global L-representation | ggp §§22–24, pp.85–90, ggp line 2993–3028 and line 3151–3188; Lemmas 3.4–3.5, p.12, ggp line 424–445 | Tensor/induction signs and mu inverse agree. The extra local metaplectic trivial line is correctly absent globally. Split factors give a value times its dual, not a single factor. |
| §6.5 Adjacent unitary datum | bpcz §§1.1.3–1.1.5, pp.2–3, bpcz line 81–134 | The norm-one line, actual cuspidal occurrence and initially weak base-change relation are correct. |
| §7.7 Invariance | bpcz §1.1.6, pp.4–5, bpcz line 160–193 | Scaling a vector by 2i multiplies both squared period and norm by 4. A local Haar rescaling multiplies alpha by that scalar; only product-one changes preserve a fixed global factorization. |
| §8.3 Isolated comparison | bpcz Proposition 10.1.6.1, pp.87–88, bpcz line 4712–4767 | The finite sets, transferable data, spherical restrictions and weighted distributions retain the source conditions. The isolation input has mu(chi)=1 and finite spectral range, not an idempotent cusp projector. |
| §8.4 Endoscopic nonvanishing | bpcz Theorem 1.1.5.1, p.3, bpcz line 93–134; proof §10.2, p.89, bpcz line 4835–4842 | The Hermitian generic parameter and existence on some inner form match. Everywhere temperedness is not imposed on this nonvanishing theorem. |
| §8.5 Factorization | bpcz §10.3, pp.90–92, bpcz line 4866–4946; measures §2.3.2–§2.3.3, bpcz line 679–700 | All-place temperedness, both Haar normalizations, finite-S convergence factors and product of comparison constants are retained. The design does not copy the inverted component-cardinality typo at the end of the source calculation. |
| §8.7 Stable specialization | bplzz Theorems 1.1/1.2, pp.3–4, bplzz line 127–186 | The stated n>1 range, cuspidal stable base changes, Asai parity and refined factor 1/4 match. This is a specialization, not a new stronger endpoint. |

Additional checks read gan-ichino Proposition 9.1 and Proposition 9.2 at gan-ichino line 2440–2510, bp-refined's nu0 conventions at bp-refined line 713–719 and line 806–809 and refined statement at line 2877–2901, bp-arch §12.3 at bp-arch line 11132–11205, the tempered precursor at bp-unitary-tempered line 5429–5433, ichino-ikeda Proposition 1.1/Theorem 1.2 at ichino-ikeda line 128–239, harris's convergence/spherical domains at harris line 170–175, line 238–250 and line 1289–1294, and bplzz Theorem 3.19 at bplzz line 1428–1440. In particular, the ambient-degree Asai sign for a partition 1+1 is retained, and harris's spherical exclusions are not used to omit ramified/dyadic local integrals from the endpoint.

### Adversarial mathematics pass

Each row covers the target's main statement, associated API and Checks. “No change” means no further defect found in this pass, conditional on the stated supplier contracts; it is not a formal proof. Characteristic two, inseparability, zero base rings and q=1 were checked against the standing exclusions throughout. The zero scalar algebra in the algebraic base-change API is allowed and gives the zero map. No Lean variable/include context exists to audit.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| §1.1 RelevantPair | Zero spaces with epsilon ±1; positive real plane; anisotropic skew-Hermitian plane; h(i,1) | Zero skew pair relevant, zero symmetric pair not; parity alone is insufficient; argument reversal gives i and −i | No change |
| §1.2 relativeSubgroup | Complement rank 0/1; j(1,g); C=diag(1,4), M=((0,1/2),(−2,0)) | Diagonal boundary; row Gram equation converts by transpose-inverse; determinant-one cut gives SO(0)=SO(1)=1 | No change |
| §1.3 IsRelevantInnerForm | Zero complement; real signatures (3,1)/(1,3); split GL | Equal rank is not complement isometry; pure GL twists are trivial | No change |
| §1.4 splitPairEquiv | Rank 0/1; a=2 | Split action is (2,1/2), not (2,2); A-rank is not doubled | No change |
| §2.1 besselFunctional | r=0; coordinates (1,−1); F₃(t)→F₃((t)); zero scalar algebra | Values 0,0,t+1 and zero respectively; polynomial scalar extension is coherent | No change |
| §2.1a besselCharacter | Split e=(1,0)e0; psi(x,y)=psi_F(x); both-factor character | Nonunit generator/character kills a GL₃ root; both coefficients survive for psi_F(x+y) | Carry admissibility globally: R07 |
| §2.2 fourierJacobiQuotient | X=0; W=0; non-surjective split functional; alternating plane | Separate zero-X branch; unimodularity matters; b0=2B gives commutator 2 on the chosen plane | No change |
| §2.3 fourierJacobiRepresentation | Equal rank; W=0; cover kernel −1 | Equal rank still uses the oscillator; exactly one genuine ambient factor cancels the oscillator sign | No change |
| §2.4 Model | Trivial group on C/C²; infinite-dimensional topological source | Model dimensions 1/2 before irreducibility; continuous dual cannot be replaced by full algebraic dual | No change |
| §3.1 basicMultiplicityOneNonarchimedean | SO(1)/SO(0); Q₂; non-genuine wrong input | Low-rank bound consistent; dyadic case retained; genuine hypothesis essential | No change |
| §3.2 basicMultiplicityOneArchimedean | Rank zero; real Jacobi center; discontinuous functional | The central-character line is compatible; only continuous CW functionals enter | No change |
| §3.3 besselInductionReduction | Empty forbidden support; one forbidden Bernstein block | Support exclusion can be vacuous but cannot be dropped when a closed stratum survives | Supplier repairs R01–R02 |
| §3.4 fourierJacobiInductionReduction | Zero isotropic rank; changed genuine inducing character | Reduction uses positive rank; genuine twist changes the Hom problem | Supplier repairs R01–R02 |
| §3.5 MultiplicityOneAssertion | Trivial irreducible line; reducible C²; zero Hom | Irreducibility is necessary; upper bound does not assert existence | No change |
| §3.6 specialOrthogonalBesselInductionReduction | Two maximal-isotropic SO orbits; SO(0); insufficient Witt index | Distinct components retained; auxiliary induction must exist in the specified orbit | Supplier repairs R01–R02 |
| §3.7 skewUnitaryFourierJacobiInductionReduction | det=a; incompatible smaller splitting; X=0 | mu and mu inverse cancel, leaving the half-modulus; incompatible splitting is excluded | Supplier repair R01 |
| §3.8 higherCodimensionMultiplicityOne | Basic pairs; SO₃/SO₀; dyadic field | Reduction targets precede the milestone and include connected SO/skew-unitary cases | R01–R02 propagate |
| §4.1 parameterSignDomain | Zero parameter; repeated irreducible; hyperbolic nonselfdual pair | Trivial component group at zero; repeated copies do not become separate generators; GL factor connected | No change |
| §4.2 conjugateRootCharacter | N=0; two sign generators; nonnorm change | Character at zero is 1; generator signs multiply; odd/even scaling differs as stated | No change |
| §4.3 selfdualRootCharacter | Zero; symplectic pair; M=1⊕sgn and N=1⊕1 over R | Even-dimensional domain matters; determinant correction changes the test sign from −1 to +1 | No change |
| §4.4 distinguishedCharacter | Split group; local metaplectic N of dimension one; mu value u | Split enhancement is trivial; N⊕1 has dimension two; inverse twist gives z/u | Missing actual enhancement interface: R03 |
| §4.5 selectionChangeData | Identity change; nonnorm scaling; two scalar characters z,u | Identity transport holds; reassociation gives zu; nonnorm scaling need not fix labels | R03 propagates outside supplied unitary domain |
| §4.6 LocalSelectionAssertion | Split singleton; two inner forms; SO/Sp; F₃((t)) | Union and genericity restrictions correct; claimed supplier does not cover all actual enhancements | R03 |
| §4.7 splitLocalSelection | GL₂×GL₁; higher archimedean codimension | Singleton selection holds in the asserted source range; higher archimedean case excluded | R01–R03 interfaces |
| §4.8 localSelectionReduction | Basic family; each classical type; archimedean field | Valid conditional direction; no archimedean Bernstein reduction claimed | R01–R03 |
| §5.1 unitaryTemperedBesselSelection | Ramified Q₂; larger dimension even/odd; nonnorm nu0 | Residual line changes from +nu0 to −nu0 with the stated parity; no good-prime restriction | No change |
| §5.2 unitaryStandardModuleMultiplicity | Empty inducing lists; unordered exponents | Empty lists recover the tempered problem; ordering is required | R01–R02 interfaces |
| §5.3 unitaryGenericBesselSelection | Generic local parameter outside global exponent bound | Global-localization theorem alone is insufficient; residual arbitrary-local contract correctly remains | No change beyond R01 |
| §5.4 unitaryThetaBesselJacobiBridge | Zero lift; rank zero; split algebra | Zero lift gives no model; separate supplier branches cover boundary cases | No change |
| §5.5 unitaryGenericFourierJacobiSelection | Wrong splitting restriction; excluded chi_V block; Q₂ | Generic-theta and almost-equal-rank exclusions remain explicit | No change |
| §5.6 unitaryTemperedPacketUniqueness | Real signatures; split complex place; irrelevant parameter | Must sum over relevant forms; irrelevant sum is zero; split case uses §4.7 | No change |
| §6.1 globalBesselPeriod | Rational point; codimension one; F₃(t); split one-factor character | Rational descent works; codimension-one character is 1; supplier and local-data domains fail as described | R04, R07 |
| §6.2 globalFourierJacobiPeriod | Rank zero; split GL₁ equal rank; two genuine signs | Point quotient harmless; positive equal rank can diverge; signs multiply to +1 | R04 for ordinary function-field inputs |
| §6.2a splitEqualRankFourierJacobiPeriod | n=1 Tate integral; Fourier dilation 2; beta=abs(.)^(−1/2); da×2/dg÷2 | Regular unitary center; character shift under Fourier transport; pole finite part shifts by −log(abs(det k))R; compensated measures preserve Z | Import identical AL.3 Mellin theory: R06 |
| §6.3 distinguishedLRepresentation | M=0; dimensions 2 and 1; split algebra | L(s,0)=1; global dimension 2, not 4; split central value is a squared absolute value | R03 for general actual parameter/packet interfaces |
| §6.4 GlobalNonvanishingAssertion | One zero local model; zero central value; polar central family | Local and global conditions are both required; a polar finite part supplies no invariant scalar | R03, R04, R07 |
| §6.5 UnitaryPeriodDatum | Norm line at 1,i,1+i; different inner forms | Norms 1,1,2; actual realized inner form stays in the datum | No change |
| §7.1 orthogonalDelta | Dimensions 2,3,4; split plane | L(1,chi), zeta(2), zeta(2)L(2,chi); split-plane pole excluded | No change |
| §7.2 orthogonalLocalPeriod | Zero vector; i in each factor; singular quotient | Correct opposite scalar linearities; zero has no normalized vector ratio; no inversion at pole/zero | No change |
| §7.3 orthogonalTemperedAndSpherical | Haar×2; missing hyperspecial condition; F₃((t)) | Spherical alpha doubles; all U1–U6 needed; characteristic-p analytic input absent | R05 |
| §7.4 OrthogonalRefinementAssertions | Component orders 2 and 4; Haar×3; zero vector | Factor 1/8; global measure constant compensates; zero ratios excluded | R03–R05 prerequisites, conjectural status preserved |
| §7.5 unitaryNormalizedLocalPeriod | Zero vector; i-scaling; q=2, s=1/0 | Local factor is 2 at 1 and singular at 0; nonvanishing requirement prevents 0/0 | No change |
| §7.6 unitaryLocalConvergenceAndSpherical | Ramified/dyadic/infinite place; spherical compact volume 2 | Local integrals included everywhere; spherical alpha equals compact volume times norm | No change |
| §7.7 unitaryNormalizationInvariance | 2i f; reciprocal local Haar changes; one Haar doubled | Vector ratio unchanged; reciprocal changes cancel; isolated change alters product | No change |
| §7.8 unitaryGlobalConstant | Two/three constituents total; central value zero; ambient degree two partition 1+1 | Factors 1/4,1/8; numerator may vanish; both degree-one constituents use ambient Asai sign − | No change |
| §8.1 relativeCharacters | Basis vector i e; zero period; constant coefficient on noncompact Fv× | Phase cancels; zero distribution; divergent integral cannot be included without estimates | No change |
| §8.2 linearRelativeContribution | Irrelevant datum; split-center dimensions two/three | Zero contribution; powers 1/4 and 1/8 agree | No change |
| §8.3 isolatedRelativeComparison | mu(chi)=1; surviving proper-Levi component; two Haar scalings | Action at chi preserved; not an idempotent cusp projection; both measure changes matter | Settled F06 remains outside package repair |
| §8.4 unitaryEndoscopicNonvanishing | Ambient dimensions one/two; partition 1+1; fixed unrelated inner form | Asai signs +/−; existence is on some inner form, not every form | No change |
| §8.5 unitaryRelativeCharacterFactorization | Zero local model; real/complex place; ambient×bG, diagonal×bH | Trace comparison changes by bG bH/Cv; no omitted infinite factors | No change |
| §8.6 unitaryRefinedPeriod | Pure tensor rescaling; constituent totals two/three | Squared norm ratio and 1/4,1/8 constants coherent; no division by zero vector norms | No change |
| §8.7 stableUnitarySpecialization | n=1; two cuspidal stable base changes | n=1 not attributed to the n>1 source theorem; stable component constant 1/4 | No change |

### Duplication and supplier direction

Pinned Mathlib commit: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Pinned Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The local library checkouts matched these commits. Object searches and file reads covered algebraic/continuous intertwining maps, finite-dimensional comparison, invariant sesquilinear forms, polarization, quadratic Witt decomposition/cancellation, alternating bases, Heisenberg coordinates, constant-form and SO/Sp schemes/points, base change and low ranks. The imported declarations exist and the relative constructions add genuine pair/model data. In particular:

- Mathlib `Representation.IntertwiningMap` in `Mathlib/RepresentationTheory/Intertwining.lean` and `ContIntertwiningMap` in `Mathlib/RepresentationTheory/Continuous/Basic.lean` are correctly consumed, without pretending that individual operator continuity gives joint smoothness.
- `ContRepresentation.intertwiningMapEquiv` in `TauCeti/RepresentationTheory/Continuous/Intertwining.lean` needs the finite-dimensional Hausdorff source over a complete normed field; the README retains those restrictions.
- `QuadraticMap.polar_self`, `Representation.IsInvariantSesqForm`, the alternating `Matrix.J` basis and the Heisenberg central-coordinate law support the explicit factor-two, argument-reversal and orientation Checks.
- `TauCeti.ConstantForm.groupScheme` and its point criterion use M C Mᵀ=C. The explicit transpose-inverse conversion is necessary and correct. Existing standard SO/Sp schemes and low-rank results are imported; the arbitrary-form/topological comparison remains a precise residual contract.

Main-branch OrthogonalSpinGroups, ReductiveGroups, GlobalNumberFields and completed RestrictedProducts were checked by object and cited layer. Supplier reads used the board's recorded head versions, including SmoothRepresentationsOfLocalGroups/ReductiveGroupsPartII at `0d37c3f452ad9769ad7bfc257b5f283091814d85`, MetaplecticAutomorphicForms at `297a40c9a53d52c164a6e568d51015a6332dc8f4`, EndoscopicTransferAndUnitaryTraceComparison at `f8f8c2b09070d68ef4a7d35f53b9f34afa32abc7`, AutomorphicFormsOnReductiveGroups at `bc8af0cee90d91cf9c2345e2b65630749b64609c`, AutomorphicSpectralTheory at `7d326fdba6d5dea86107c721218d026889c8965e`, and AutomorphicLFunctionsAndLocalFactors at `691b4b3310d33d5ad6b2b5224005a407eff9a1f8`. The supplier line witnesses above refer to those versions. The two residual duplication findings are R02 and R06; R01 is drift and R03–R05 are uncovered domains. The remaining declared gaps were not treated as unowned merely because their work is absent today.

I also checked the five named open sibling roadmaps at their heads: CohomologyComparisonsPartII `dd8d7e6fda7516b9ab6806d5d75f5202332851c7`, ColemanIntegrationPartII `bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4`, QWittVectors `4605fbb0a2d9279b561f9467ab5cce09d7f2469e`, ErdosProgressionPowers `72b615703f7fc5d175e519ddbb6e589d3d744c6c`, and ArithmeticDynamics `85e78c07dcc361ead6505c970a1181deee483819`. Their scope and relevant-object searches found no additional competing Bessel/Fourier–Jacobi, enhancement, Bernstein or relative-period construction. Bessel's inequality and q-Witt differential operators are unrelated objects. Board-package searches found the already settled isolation overlap; it was not turned into an upward dependency.

The exact requested gate invocation using `packages/GanGrossPrasadConjecturesForClassicalGroups/README.md` could not open that file: it does not exist in the design package. Its diagnostic was FileNotFoundError, exit 1. I reran the same gate and order with the actual candidate `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md`; it exited 0 and printed:

```text
candidate: GanGrossPrasadConjecturesForClassicalGroups is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 6 roadmaps, 47 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Manual reading of every supplier/Needs citation found no later-roadmap proof input. No ownership was moved to a later roadmap in this review. The candidate's absence from the order is expected and is not a finding. The mechanical gate does not detect the semantic drift in R01 or the domain gaps above.

## Not verifiable

- **Lean elaboration: not available.** There is no `Suggested.lean` in this design package and the brief supplies no runnable elaboration command. No Lean process was started. Consequently there is no elaboration result, no claim that `sorry` was the only warning, and no checked elaborated signatures or Lean mirrors of the prose Checks.
- **Alternate published pagination:** only the versions recorded in `sources.toml` were certified against the cached text. No assertion is made about an alternate edition's numbering. All 15 seeded targets were readable in the recorded versions; no missing text remains.
- **Supplier implementations:** declared residual contracts are future mathematical obligations, not verified implementations. Their absence is not itself a finding. R02/R06 identify nonminimal portions, and R03–R05 identify consumers not covered by the declared scope. Other contracts remain conditions on eventual construction.
- **Isolation owner selection:** F06's maintainer routing decision remains unsettled outside this package, as its repair report explains. It is not re-raised and does not account for any of the seven blocking findings.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7e6695ad6ca8be948f32dd4b428597f91ccdc5c1", "job": "REV-DESIGN-GanGrossPrasadConjecturesForClassicalGroups~5", "model": "gpt-6-astra", "worker": "chris-3"} -->
