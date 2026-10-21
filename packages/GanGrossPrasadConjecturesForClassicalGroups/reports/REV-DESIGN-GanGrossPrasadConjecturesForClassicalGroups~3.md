<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/521#issuecomment-6313797129 -->
Review (codex) of 61cab16

Verdict: needs_changes

1. **F01** (P1) The split equal-rank Fourier–Jacobi integral can diverge

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:696`: “Prove absolute convergence for cuspidal f and Schwartz oscillator phi”. The same construction is in `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:1614`; the false convergence requirement is also assigned to `gap:period-growth` at README line 163 and plan line 3199.

   **Claim:** The ordinary displayed integral defines the Fourier–Jacobi functional for every allowed global relevant skew pair, including the split algebra and equal rank. The split-center convention changes the automorphic norm, but explicitly leaves the period as an integral over the full quotient.

   **Witness:** Take F = Q, A = Q × Q, V = W of A-rank one, and trivial cusp characters. Gaussian theta gives `theta(t) >= t^(-1/2)`; `integral_0^1 t^(-1/2) dt/t` diverges.

   Here is a verification of admissibility and the calculation. Give the split line its nondegenerate skew-Hermitian form using the anti-invariant element (1,−1). Its isometry group is GL1. The complement is zero, so this is relevant and §2.3 retains the basic oscillator. The ambient group is GL1 × GL1 and H is diagonal GL1. The trivial automorphic character on each factor is cuspidal because a torus has no proper parabolic; it is unitary, tempered and square-integrable modulo the split center. Choose the trivial split character mu and the usual rationally trivial additive character. Take the real Gaussian and the characteristic function of the integral finite adeles as the Schwartz input.

   In the unitary Schrödinger normalization, on an idele with positive real component t and integral-unit finite components the theta function is

   `theta(t) = t^(-1/2) sum_(k in Z) exp(-pi (k/t)^2)`.

   All terms are nonnegative and the zero term supplies the stated lower bound. This holds over the compact finite-unit factor of positive measure, so it is a divergence on the idele-class quotient, not merely on a measure-zero path. Its norm direction has measure dt/t. The inverse coordinate convention exchanges the two ends and does not restore convergence. In the unnormalized split action written in ggp line 1999–2004 with trivial multiplier, the same zero term is 1 and already gives divergence of `integral_0^1 dt/t`. The global displayed integral is at ggp line 3123–3146. Thus this is also a source-generalization problem: that displayed definition does not justify the design's blanket split convergence assertion.

   **Exact repair:** Replace blanket convergence in §6.2 and `gap:period-growth` with an accurately stated convergence theorem. Preserve the split scope by giving its necessary additional construction as a named target, with the precise convergence domain or regularization and its dependence on auxiliary choices stated explicitly. A regularized extension must separately establish the claimed equivariance and agreement with the ordinary integral where that integral converges; these cannot be inherited automatically. Propagate the distinction to §6.4 and the theta/growth contracts and synchronize the plan. Add this GL1 Gaussian divergence as a negative-control Check. Merely assuming integrability, changing Petersson norms, or silently replacing the displayed quotient with a norm-one quotient does not repair the claim.

2. **F02** (P1) The base-change contract assigns the Asai sign to the wrong degree

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:115`: “degree-m constituents having Asai sign (−1)^(m+1) pole at 1”. Identical wording occurs in both `detail` and `needs` at `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:2988`.

   **Claim:** Each cuspidal constituent has the pole sign determined by its own degree. This disagrees with the degree of the entire Hermitian parameter used correctly in §8.4, README line 947.

   **Witness:** bpcz line 95–100 uses ambient n in every constituent's sign. For ambient degree 2 with partition 1+1, both signs are −; the contract instead requires + for each degree-one constituent.

   This matters specifically for endoscopic parameters, an endpoint of this roadmap. The existing degree-one/degree-two Check does not distinguish the degree of the parameter from the degree of a summand. There is also a domain distinction to retain when rewriting this contract: bpcz line 112–118 ties its particular Hermitian base-change class to generic Arthur parameters, whereas line 148–151 supplies it for the everywhere-tempered cuspidal domain. An unrestricted cuspidal Arthur parameter need not have this multiplicity-free, trivial-Arthur-SL2 form.

   **Exact repair:** Write a degree-m generic Hermitian parameter as an induction of pairwise distinct constituents of degrees d_i with `sum_i d_i = m`; require the Asai pole sign `(-1)^(m+1)` for every constituent, independently of d_i. State the generic-parameter domain for this decomposition and the everywhere-tempered specialization consumed by the refined identity. If general cuspidal Arthur classification is also requested, distinguish its nontrivial Arthur blocks instead of forcing this decomposition on it. Change both plan fields and the README contract together. Add an ambient-degree-two, partition-1+1 Check, and keep §8.4's ambient-degree convention.

3. **F03** (P3) The higher-codimension milestone precedes two of its inputs

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:413`: “*Needs:* §3.1, §3.3, §3.4, §3.7, §3.8”. The corresponding dependencies are at `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:773`.

   **Claim:** The document presents targets in build order, but §3.6 needs the connected SO and skew-unitary reductions introduced afterwards.

   **Witness:** The target graph has exactly two forward edges: `3.6 → 3.7` and `3.6 → 3.8`. Neither reduction depends on §3.6; the graph is acyclic and can be reordered.

   **Exact repair:** Put both reduction targets before `GGP.higherCodimensionMultiplicityOne`, preserving their mathematical content and its four-family conclusion. Update subsection identifiers, references, plan ordering and gap consumer identifiers consistently. No supplier ownership or merge-order change is needed.

There are three findings: two P1 findings and one P3 finding. The two mathematical defects are repairable within this roadmap's scope. Declaring their analytic or classification inputs as supplier gaps does not make the false requirements valid.

## Verified sound

### Previous repairs

The requested preceding review, `packages/GanGrossPrasadConjecturesForClassicalGroups/reports/REV-DESIGN-GanGrossPrasadConjecturesForClassicalGroups~2.md`, is absent. I therefore checked each of F01–F04 as described in `packages/GanGrossPrasadConjecturesForClassicalGroups/reports/FIX-DESIGN-GanGrossPrasadConjecturesForClassicalGroups~3.md`, against the revised design and independent evidence. None is marked not actionable in that repair report. All four recorded repairs are present; the new findings do not re-raise a settled finding.

| Recorded finding | Repaired passage | Independent verification | Status |
|---|---|---|---|
| F01, duplicate scheme construction | README line 53: “for every commutative ring R, n ≥ 0 and arbitrary constant matrix C”; line 85: “explicitly converting the pinned M C Mᵀ = C convention to column isometries by M ↦ (Mᵀ)⁻¹” | Read the pinned ConstantForm, O, SO and symplectic declarations and the alternating-basis theorem. The residual arbitrary-quadratic point comparison is distinct. The line 217 rational matrix has determinant 1, row Gram C and column Gram diag(16,1/4); inverse transpose gives the required column isometry. | Repaired |
| F02, missing higher-codimension families | README line 409: “a special orthogonal or Hermitian relevant pair of arbitrary odd codimension, or a symplectic/metaplectic or skew-Hermitian relevant pair of arbitrary even codimension” | All four reductions occur at line 411. The SO(3)/SO(0) auxiliary space has dimension four and Witt index two; the skew-unitary codimension-two example has the indicated GL1 Levi. Compared ggp line 2661–2700, waldspurger line 10–18 and sun line 31–42, 102–104. R03 concerns their placement only. | Repaired |
| F03, unnecessary classification/category inputs | README line 228: “*Needs:* §1.1, `gap:marked-inner-forms` (ReductiveGroupsPartII), `gap:hermitian-witt` (ReductiveGroupsPartII).” | §1.3 no longer consumes enhanced classification; §4.1's line 468 needs parameter carriers and components, not smooth or Casselman–Wallach categories. The plan and gap consumers agree. Layer 4 correctly retains category inputs for its later representation-theoretic targets. | Repaired |
| F04, residual-line normalization | README line 592: “require the complement of the smaller space to be a sum of hyperbolic planes and a line of norm +nu0 if d > dprime, or −nu0 if dprime > d” | bp-refined line 713–719, 806–807 and 2891–2901 fix the same datum and labels. Over Q3(√3), −1 is not a norm: a unit norm reduces to a square in F3. Scaling by 2 multiplies the norm by 4. The enhanced-classification contract agrees. | Repaired |

### Principles, structure and consistency

Read all eight layers, all 50 targets, their 80 API statements and 149 Checks, the conventions, supplier contracts and both machine-readable files. The target kinds are 12 definitions, 12 constructions, 25 theorems and one example. All 24 definitions/constructions have named APIs and at least three Checks. All eight layers end with Examples and Dependencies. The required opening, ownership, conventions, supplier, build, consumer and reference sections are present. README target/API/Check names agree with the plan; harmless prose differences concerning packet notation do not change their statements.

The design separates conjecture propositions from proved unitary results; retains ramified, dyadic and infinite places at the applicable endpoints; and gives the general relative constructions rather than a spherical-only replacement. The characteristic-zero proved uniqueness results are not advertised as positive-characteristic theorems. Orthogonal refinement remains conjectural. No existing roadmap is re-planned, computational algorithm introduced, or downstream arithmetic result used as a premise. I found no copied source passage or instruction embedded in fetched material that affected this review. There is no Lean file here containing sorry'd data, forced substitute carriers or `set_option`.

### Seeded source verification

All 15 seeded targets were checked against the cached legal texts, including theorem/section numbering, page markers and hypotheses. No additional author-flagged unverified locator occurs in the design. All 12 manifest sources are certified and their texts were accessible; no new fetch or manifest edit was needed. The table distinguishes a source-supported extension plan from a theorem literally proved at the locator.

| Seeded target | Locator read | Outcome |
|---|---|---|
| §1.2 Flag subgroup | ggp §2, p. 7, line 244–257; §10, p. 43, line 1541–1557 | Correct semidirect subgroup and diagonal second coordinate. Empty flags give the stated diagonal cases. Scheme comparisons are separately contracted. |
| §2.3 Oscillator restriction | ggp §12, pp. 49–52, line 1761–1769, 1796–1813, 1823–1845 | Correct flag twist, genuine sign and unitary splitting condition. X = 0 retains the basic oscillator; W = 0 has its separate branch. |
| §3.1 Nonarchimedean uniqueness | ggp §14, pp. 58–59, line 2064–2078; waldspurger Theorem 1, p. 1, line 10–18; sun Theorems B–C, pp. 1–3, line 31–42, 102–104 | Correct characteristic-zero and irreducibility domains, including dyadic fields. Connected SO uses Waldspurger, and Jacobi/oscillator inputs use Sun's actual statements. |
| §3.2 Archimedean uniqueness | sun-zhu Theorems A–B, pp. 2–3, line 55–68, 80–97 | Casselman–Wallach spaces, continuous functionals and the required Jacobi central-character data are retained. Algebraic duals cannot replace these. |
| §3.3 Bessel reduction | ggp Theorem 15.1, pp. 60–63, line 2116–2124, 2152–2163 | Correct full-O/Hermitian scope, unnormalized induction and support exclusion; no automatic SO conclusion is attributed to this theorem. |
| §3.4 Fourier–Jacobi reduction | ggp Theorem 16.1, pp. 64–67, line 2282–2317 | Genuine Levi multiplier, Bernstein exclusion and mixed-model comparison are present. Positive isotropic rank is required. |
| §3.5 General multiplicity assertion | ggp Conjecture 14.1, pp. 58–59, line 2064–2078 | Correctly a proposition, distinct from the narrower proved theorem instances. |
| §3.7 Connected orthogonal reduction | ggp §19, pp. 75–77, line 2661–2698; comparison with Theorem 15.1 at line 2158 | Source supplies the reduction strategy, not the exact stated SO theorem. The design explicitly owns that extension and its component/closed-orbit proof; its low-rank construction is consistent. No claim of a verbatim source theorem is made. |
| §6.1 Bessel period | ggp §23, pp. 86–88, line 3036–3093; §22, p. 83, line 2908 | Correct displayed period, rational triviality and split-plane exclusion. The design correctly avoids claiming finite volume for the full GL quotient. |
| §6.2 Fourier–Jacobi period | ggp §23, pp. 88–89, line 3094–3146; split local action at line 1992–2004 | Formal theta/period construction located. The all-input split convergence claim fails: R01. |
| §6.3 Central L-representation | ggp pp. 85–90, line 2993–3028, 3151–3171, 3184–3188; Lemmas 3.4–3.5, p. 12, line 424–445 | Tensor/induction signs and inverse splitting twist agree. The global symplectic R does not acquire the extra local trivial line; split factors give both Rankin–Selberg factors. |
| §6.4 Global nonvanishing proposition | ggp Conjecture 24.1, pp. 89–90, line 3175–3182 | The tempered, cuspidal, multiplicity-one clauses and three nonvanishing formulations agree. Its reference to the split §6.2 functional must follow R01's repair. |
| §7.5 Normalized local forms | bpcz §1.1.6, p. 4, line 148–169 | Correct inverse local quotient, pairing convention and ordinary-scalar domain. No arbitrary normalizing scalar is substituted. |
| §7.7 Normalization invariance | bpcz definitions and Theorem 1.1.6.1, pp. 4–5, line 160–191 | The stated rescaling laws follow from these formulas. Nonzero vectors, finite changes and product-one measure constraint are essential and present. |
| §8.5 Factorization | bpcz §§10.3.1–10.3.5, pp. 90–92, line 4866–4946; §2.3, line 679–700 | Tempered domain, actual isolation, raw versus normalized traces, both measures and product of comparison constants are tracked. The source's final cardinality typo is not copied into the coefficient. |

Further checks used all remaining manifest texts: ichino-ikeda line 130–266 and 370–400 for orthogonal restrictions and conjectures; harris line 243–250 and 1289–1294 for convergence and the spherical finite-exception statement; bplzz line 127–186 for the stable range; gan-ichino line 90–142 and 2450–2510 for theta and standard-module reductions; bp-arch line 11119–11205 for real stability, transfer and prescribed Whittaker uniqueness; bp-refined and bp-unitary-tempered for the distinction between labelled selection and unlabelled uniqueness. No unavailable paywalled text was needed.

### Adversarial mathematics pass

Each target row covers its hypotheses, construction or theorem statement, associated API and Checks. “Pass” means that these boundary computations and source comparisons found no additional defect; it does not mean the planned proof has already been formalized. Forbidden inputs are tested against the actual standing hypotheses. The zero ring, characteristic-two field, inseparable algebra and q = 1 are not silently admitted into the field/local-field targets.

| Statement | Instances tried | Result | Change required |
|---|---|---|---|
| Standing forms and topology | Q(x) = x²; alternating plane; a = i on a complex Hermitian plane; characteristic 2 versus Q2 | Polar value 2; alternating values 1,−1; conjugate-inverse partner is i; dyadic characteristic zero remains allowed. | None |
| Standing measures and factors | q = 2, s = 1; s = 0; vector 2i; two reciprocal local rescalings | L = 2; pole is not a scalar; squared scaling 4; measure invariance needs product one. | None |
| §1.1 Relevance and API | Zero inclusion with both signs; anisotropic complement; split hyperbolic complement; identity isometry | Zero complement is skew-relevant only; parity alone cannot replace the isotropic-rank condition. | None |
| §1.2 Subgroup and API | Empty flags; j(1,g) and j(u,1); SO ranks 0,1; rational Gram example | Diagonal versus unipotent coordinates differ; low-rank determinant-one groups trivial; inverse transpose is necessary. | None |
| §1.3 Inner relevance and API | Identity marking; different real signatures; split GL; complement of dimension zero | Complement isometry survives transport; equal dimensions alone are insufficient; split GL introduces no nontrivial pure twist. | None |
| §1.4 Split comparison | Rank zero and rank one; a = 2 | Actions (2,1/2) preserve the split pairing; (2,2) does not. | None |
| §2.1 Bessel character and API | Empty flag; root values 1 and −1; zero/non-generating split coefficient | Empty character is trivial; additive sum is zero; degeneracy is rejected by genericity hypotheses. | None |
| §2.2 Heisenberg quotient and API | One-dimensional X; W = 0; X = 0; non-unimodular split functional | The half-commutator convention gives commutator b; zero spaces and the basic branch are distinguished; surjectivity needs unimodularity. | None |
| §2.3 Oscillator and API | Cover kernel; X = 0; W = 0; one wrong splitting | Two genuine signs cancel; equal rank retains the oscillator; zero W leaves the flag character; changed splitting changes the datum. | None |
| §2.4 Model and API | Trivial H with one-dimensional and zero inputs; infinite direct sums; genuine kernel; continuous versus algebraic Hom | Dimensions 1 and 0; no unjustified finite dimension; wrong cover parity kills invariants; topology requires the stated comparison assumptions. | None |
| §3.1 Basic finite-place uniqueness | Q2; SO(1)/SO(0); rank-zero oscillator boundary | Dimension one is attained; characteristic-zero theorem includes residue characteristic 2. | None |
| §3.2 Basic infinite-place uniqueness | Real trivial group; nontrivial Jacobi center; infinite-dimensional inputs | Scalar functional gives the sharp boundary; central characters and continuous bilinear topology remain necessary. | None |
| §3.3 Bessel induction | Insufficient Witt index for a closed Levi; forbidden Bernstein block; O/SO comparison | Empty exclusion is legitimate; excluded support cannot be dropped; O theorem does not itself give SO. | None |
| §3.4 Symplectic induction | X = 0; positive rank; omitted genuine multiplier | Zero-rank case lies outside the nonbasic reduction; sign mismatch appears if the multiplier is dropped. | None |
| §3.5 Multiplicity proposition and API | One-dimensional trivial input; reducible two-dimensional trivial input; zero Hom | Dimensions 1,2,0 show irreducibility and the distinction between a bound and existence. | None |
| §3.6 Higher multiplicity | Basic codimensions; SO(3)/SO(0); skew-unitary codimension two; dyadic field | All four families have a named reduction; its two later dependencies violate the declared build order. | R03 |
| §3.7 Connected SO induction | W = 0; two maximal-isotropic components; absent closed Levi; support collision | Auxiliary split SO(4) case is consistent; components and closed supports must be retained. No inference from an arbitrary O-extension. | Reorder under R03 |
| §3.8 Skew-unitary induction | Rank-one X; zero X; common mu versus changing one mu | Inducing mu cancels dual mu inverse; residual absolute-value factor survives; zero rank is basic. | Reorder under R03 |
| §4.1 Components and API | Zero parameter; doubled selfdual summand; paired nonselfdual summands; two odd orthogonal blocks | Component groups are trivial, C2, trivial and C2²; determinant-one condition reduces the last order to two. | None |
| §4.2 Conjugate-dual character and API | N = 0; two involution signs; odd versus even dim N | Zero character trivial; sign generators multiply; additive-character changes detect parity. | None |
| §4.3 Selfdual correction and API | Zero domain; even symplectic dimensions; odd negative control; real determinant sign | Even-domain and determinant corrections are necessary; wrong real correction changes the sign. | None |
| §4.4 Distinguished character and API | Split parameter; local N a line; twist eigenvalues z,u | Split component character trivial; extra local line corrects parity; twist is z/u, not zu. | None |
| §4.5 Change laws | Identity changes; nonnorm multiplier; changing a single oscillator splitting | Identity coherence holds; parity sign and relative splitting ratio cannot be omitted. | None |
| §4.6 Selection proposition and API | Singleton split packet; irrelevant inner form; nongeneric parameter | Uses actual marked representations and relevance; does not manufacture a singleton by definition. | None |
| §4.7 Split selection | GL2/GL1; basic equal rank; higher codimension at infinity | Correct generic domain; no unsupported higher-codimension archimedean theorem. | None |
| §4.8 Selection reduction | Symmetric/skew and split/nonsplit families; positive-characteristic and archimedean boundaries | The implication uses its stated classification/induction inputs; no extension beyond its field domain is inferred. | None |
| §5.1 Tempered Bessel selection | Residual lines ±1 over Q3(√3); generator times 2; ramified Q2 | Norm classes distinguish the parity convention; scaling gives norm factor 4; no residual-prime exclusion. | None |
| §5.2 Standard modules | Empty GL block list; unordered exponents; zero reduced rank | Empty induction recovers tempered data; ordering and relevance conditions cannot be discarded. | None |
| §5.3 Generic Bessel selection | Tempered boundary; generic non-tempered induction; nongeneric parameter | Uses irreducibility on the generic domain and the fixed normalization of §5.1. | None |
| §5.4 Theta bridge | Zero lift; nonzero tempered lift; incompatible splitting characters | Zero lift gives no selected representation; seesaw/P2 inputs are actual supplier laws rather than downstream GGP. | None |
| §5.5 Generic Fourier–Jacobi selection | Equal rank; ramified dyadic field; wrong mu restriction | Equal rank uses the bridge; allowed dyadic fields remain; invalid splitting rejected. | None |
| §5.6 Tempered uniqueness | Several real signatures; complex split place; empty individual packet | Uniqueness ranges across relevant marked forms; empty individual packets permitted; complex place uses split selection. | None |
| §6.1 Bessel period and API | Zero cusp form; adjacent diagonal; split orthogonal plane; GL norm direction | Zero functional value and diagonal formula correct; split orthogonal plane excluded; no finite-volume assertion for GL. | None found |
| §6.2 Fourier–Jacobi period and API | Zero Schwartz vector; genuine kernel; nonautomorphic psi; split GL1 Gaussian | First three controls work, but admissible trivial cuspidal input gives a divergent theta integral. | R01 |
| §6.3 Global R and API | M = 0; dimensions 2 and 1; split unitary data | L = 1 for zero representation; tensor dimension is 2 rather than 4; two split factors retained. | Contract correction R02 |
| §6.4 Nonvanishing proposition and API | Local obstruction; zero central value; a zero-valued vector in a nonzero functional; split rank one | Functional nonvanishing is existential; the split period must first exist in the asserted sense. | R01 |
| §6.5 Unitary datum and API | Q(i) norm inputs 1,i,1+i; zero form input; nonisometric Hermitian forms | Norms 1,1,2; zero period allowed; equal rank does not identify different forms. | Contract correction R02 |
| §7.1 Orthogonal factors and API | d = 2,3,4; hyperbolic plane; pole at the global evaluation point | Correct discriminant parity and distinct even/odd factors; singular expression is not an ordinary scalar. | None |
| §7.2 Orthogonal local form and API | Zero vector; one-sided scalar i; singular local normalizer | Conjugations match the chosen pairing; zero/pole denominator is outside the scalar domain. | None |
| §7.3 Orthogonal convergence/spherical value | Norm-one spherical vector; compact measure multiplied by 2 | Spherical value gains factor 2; volume normalization cannot be suppressed. | None |
| §7.4 Orthogonal conjectures and API | Component orders 2 and 4; zero vector; measure factor 3; analytic continuation hypotheses | Component product gives 1/8; norm division excludes zero vector; global measure constant compensates. | Contract correction R02 |
| §7.5 Unitary local form and API | Scalars i and 2i; zero vector; Cv replaced by 2Cv; split q = 2 | Correct sesquilinearity; ratio needs nonzero norm; altered Cv halves alpha; local trivial factor at 1 is 2. | None |
| §7.6 All-place local theorem | Compact volume 2; complex split place; dyadic and ramified completions | Alpha equals volume times norm; no endpoint place is deleted by the almost-everywhere spherical calculation. | None |
| §7.7 Invariance | Nonzero scalar 2i; two measures c,c inverse; one measure doubled | Norm ratio unchanged; product-one changes cancel; a single doubling changes the product. | None |
| §7.8 Global constant and API | Two/three constituents; n = 1; central L-value zero; degree 2 partition 1+1 | Component factors 1/4 and 1/8; zero numerator allowed; constituent parity must use ambient degree. | R02 |
| §8.1 Relative distributions and API | Orthonormal-basis phase i; zero period; empty sum; non-tempered split trivial representation | Phase cancels; zero distribution legitimate; non-tempered example shows why local convergence cannot be dropped. | None |
| §8.2 Linear contribution | Two/three constituents; irrelevant spectral datum | Factors 1/4 and 1/8; zero irrelevant contribution is not inverted. | None |
| §8.3 Isolated comparison | Enlarging the exceptional set; zero test function | Finite-S factors must move together; zero identities cause no division. | Contract correction R02 |
| §8.4 Endoscopic nonvanishing | Ambient degrees 1 and 2; mixed constituent degrees; fixed wrong inner form; function field | Target uses ambient parity correctly, unlike its contract; existence is over forms; theorem is number-field only. | R02 |
| §8.5 Factorization | One zero local model; constants k,k inverse; ambient measure doubled alone or compensated | Both sides vanish with local obstruction; constants cancel; ambient product constraint essential. | Contract correction R02 |
| §8.6 GGP.8 | Stable/endoscopic counts; nonzero vector with zero period; scalar 2i | Coefficients 1/4 and 1/8; no period cancellation; squared quantities scale by 4. | Inherits R02 |
| §8.7 Stable specialization | n = 1 versus n > 1; two cuspidal base changes | Stable source's n > 1 restriction retained; n = 1 belongs to the general endpoint. | None |

### Duplication audit by object

The library audit used Mathlib commit `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, agreeing with the content manifest and design. Object searches were followed by reads of 28 pinned files, rather than treating search-result revisions as the pins.

| Object | Pinned or earlier owner checked | Design treatment |
|---|---|---|
| Algebraic and continuous intertwiners | `Mathlib/RepresentationTheory/Intertwining.lean:31`; `Mathlib/RepresentationTheory/Continuous/Basic.lean:54`; `TauCeti/RepresentationTheory/Continuous/Intertwining.lean:66` | Imports native carriers; the local smooth/topological conditions are separate. Finite-dimensional comparison keeps completeness, Hausdorffness and scalar continuity. |
| Polarization and form symmetry | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:311`; `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286` | Uses unhalved polarization and existing symmetry/alternation, not a second API. |
| Quadratic Witt decomposition/cancellation | `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:413`; `TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean:196` | Imported with finite-dimensional regular summand and invertible-2 hypotheses; the general Hermitian gap explicitly reuses them. |
| Alternating forms | `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:301` | Basis comparison, including orientation and dimension zero, reuses the pinned theorem. |
| Arbitrary matrix-form group scheme | `TauCeti/Algebra/AlgebraicGroup/ConstantForm/Basic.lean`, `groupScheme`, `mem_definingPointsSubgroup_iff` | Arbitrary C, all commutative rings and zero ring are imported; smoothness is not asserted for arbitrary C. |
| Standard O, SO and Sp schemes | Pinned `Orthogonal/Basic.lean:187`, `SpecialOrthogonal/Basic.lean:81`, `Symplectic/Basic.lean:215`, `Symplectic/Scheme.lean:73`, and their cited BaseChange, Smooth, Connected, Reductive and SO LowRank files | Standard constructions are imported. SO's general characteristic restriction and unrestricted ranks 0,1 are distinguished; Sp smoothness has no invertible-2 requirement. General quadratic point/topology comparison remains residual. |
| Matrix unitary groups and pairings | `Mathlib/LinearAlgebra/UnitaryGroup.lean:70`; `TauCeti/Topology/Algebra/UnitaryGroup.lean:100`; `TauCeti/LinearAlgebra/Matrix/UnitaryGroup.lean:29`; `TauCeti/RepresentationTheory/InvariantForm/Hermitian.lean:95` | Standard positive compactness is not extended to indefinite or nonarchimedean groups. Star-first comparison reverses arguments. |
| Hilbert symbol | `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46`, square-class declarations at lines 179–184 | Existing norm-equation symbol imported; factor comparison assigned separately. |
| Heisenberg plane | `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:92`, `mul_z`, `commutatorElement_eq` | Existing xy-prime cocycle is compared by z ↦ z−xy/2; general symplectic oscillator theory is not claimed to be that elementary group. |
| Group schemes, flags and quadratic point groups | `TauCetiRoadmap/ReductiveGroups/README.md`, Layers 0,3,5,7; `TauCetiRoadmap/OrthogonalSpinGroups/README.md`, Layers 0,2,3 | Actual sections exist. OrthogonalSpinGroups supplies points and its stated local topology, not arbitrary-local-field SO scheme comparison. |
| Restricted products, scalar adeles and characters | `Completed/RestrictedProducts/README.md`, Layers 1–3; `TauCetiRoadmap/GlobalNumberFields/README.md`, Layers 0,4,5,8,9 | Generic packaging is imported; group integration and Tamagawa factorization remain named contracts. |

Read the main-branch roadmap shapes and scopes, including ReductiveGroups, OrthogonalSpinGroups and RestrictedProducts. Searched main and board packages for the relevant form, model, parameter, oscillator, period and normalization objects. The related Part II packages do not supply a second eligible implementation of this roadmap's relative targets. Read the three specified open heads: QWittVectors at `4605fbb0a2d9279b561f9467ab5cce09d7f2469e`, ErdosProgressionPowers at `72b615703f7fc5d175e519ddbb6e589d3d744c6c`, and ArithmeticDynamics at `85e78c07dcc361ead6505c970a1181deee483819`. Arithmetic Witt vectors, an analytic Bessel inequality and dynamical invariant measures are different objects from the Witt forms, Bessel models and adelic measures here. No further duplication was found.

### Supplier contracts and order

Read every Needs line and supplier citation. All 40 gap slugs occur identically in the README and plan, have named suppliers and matching required-output sentences, and have consumer lists agreeing with the actual target prerequisites. The contracts cover eight suppliers: ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicLFunctionsAndLocalFactors, MetaplecticAutomorphicForms, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups and AutomorphicSpectralTheory. They are declared contracts, not assertions that their sections already exist. No absent declared gap was treated as an unowned prerequisite.

The audit found no additional duplicate request, unnamed owner or unsupported existing-section citation. R01 identifies an impossible convergence output in the growth contract; R02 identifies the inconsistent mathematical domain/sign in the base-change contract. Other contracts specify their field, representation or analytic domains and a coherent interface. The target graph is acyclic; its only forward presentation edges are R03. Downstream arithmetic consumers supply no prerequisite.

The exact command in the brief could not read `packages/GanGrossPrasadConjecturesForClassicalGroups/README.md`, because that package-stage file does not exist. It exited 1 with FileNotFoundError. Repeating the same gate with `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md` as candidate, and unchanged configuration, roadmap selection and order, exited 0 with this output:

```text
candidate: GanGrossPrasadConjecturesForClassicalGroups is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 29 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The four roadmaps counted by this gate are its resolved existing-roadmap inputs; the 40 separately inspected gap contracts are not silently certified implementations. No merge-order edit or movement of ownership is required by these findings.

## Not verifiable

- The original round-2 review is absent. Only its four finding descriptions preserved in the round-3 repair report could be checked; their repaired text and mathematical evidence were independently verified above.
- Lean elaboration: **not available**. This design has no `Suggested.lean`, and the brief supplies no usable elaboration command. No Lean command was run, no elaborated binder check was claimed, and the “sorry is the only warning” condition could not be tested. Package-stage Lean signatures and proved mirrors remain outside this design review.
- The complete future proofs of the owned SO/skew-unitary reductions and the 40 supplier contracts are not implemented artifacts available for verification here. Their declared status is not itself a finding. In particular §3.7 is a source-guided extension, not a theorem certified verbatim by its O-group locator.
- No cited source text was unreadable or missing. No missing-reference request or manifest addition was necessary. Source and boundary checks do not certify the convergence claim refuted in R01 or the sign contract refuted in R02.

Only this review report, `packages/GanGrossPrasadConjecturesForClassicalGroups/design/review.json`, and the required scratch worklist were written. The design README, plan, source manifest, library pins, content repository and merge order were left unchanged.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "61cab160430a414be1ff3fec76dfd80abef8524e", "job": "REV-DESIGN-GanGrossPrasadConjecturesForClassicalGroups~3", "model": "gpt-6-astra", "worker": "chris-1"} -->
