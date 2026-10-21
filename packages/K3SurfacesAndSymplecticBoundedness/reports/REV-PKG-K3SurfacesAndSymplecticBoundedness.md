<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/563#issuecomment-6315936166 -->
Review (codex) of db94ab6

Verdict: accepted
Conditional on the announced gaps: `surface-projectivity`, `hypersurface-cohomology`, `oda-interface`, `surface-arithmetic-quotient`, `tame-linear-groups`, `elliptic-surface-geometry`, `artin-discriminant`, `witt-formal-brauer`, `crystalline-chern-derivative`, `cross-realization`, `integral-topology`, `tame-lefschetz`, `surface-quotient-resolutions`, `tame-quotient-singularities`, `quotient-transcendental-comparison`, `ruled-surface-two-forms`, `mathieu-permutation-model`, `mukai-eleven-groups-recognition`, `matsusaka-mumford`, `adjoint-positivity`, `exceptional-mathieu-embeddings`, `surface-brauer-localization`, `surface-brauer-kummer`, `equivariant-brauer-descent`, `rational-surface-cohomology`

1. **F01** (P3) The polarization-stabilizer definition is unnumbered

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:605`: “rizov, Definition 3.3.2 and Proposition 3.3.3”.

   **Claim:** The definition of the polarized automorphism functor is numbered Definition 3.3.2.

   **Witness:** `rizov line 608` labels 3.3.2 a remark about the unpolarized automorphism scheme. The polarized functor is defined in the unnumbered paragraph at `rizov line 610`; Proposition 3.3.3 starts at `rizov line 615`.

   **Exact repair:** Replace “Definition 3.3.2 and Proposition 3.3.3” with “the unnumbered definition following Remark 3.3.2 and Proposition 3.3.3”. Keep pp.14–15 and lines 610–642. The mathematical statement and the manifest's existing Proposition 3.3.3 locator need no change.

Acceptance is conditional on the 25 declared supplier contracts listed below. There is one P3 locator correction and no P1 or P2 finding. No previous package review was supplied. The authored README, Lean file, metadata, source manifest and design were not changed.

## Verified sound

The review covered all 60 numbered targets in eight layers, including their 84 subordinate API entries and 191 target Checks, all 60 `*Needs:*` paragraphs, the conventions, the supplier contracts, and the three Lean signatures. The 13 definition/construction subsections each have an API and at least three README Checks. There are eight layer Examples subsections and eight Dependencies subsections.

### Principles and package form

- The geometry uses native schemes, native line-bundle classes and the existing rational-ambient lattice. The predicate does not store a polarization, embedding or volume-form choice. The lattice target adds geometric realization and intersection compatibility to the abstract supplier theory.
- The full arbitrary-field and small-characteristic domains are retained. In particular, projectivity precedes its uses, crystalline freeness is proved rather than inferred from perfectness, quasi-elliptic pencils remain at 2 and 3, and the wild characteristic-2 Enriques quotient remains in the faithfulness proof.
- The smoothness assertion over the open base in §8.4 does not restrict the all-prime moduli and boundedness endpoints. The distinction between smoothness and finite-type existence is explicit.
- No existing K3 roadmap was found on the supplied main snapshot. The abstract lattice, generic comparison, relative Picard and finite-group recognition theories are imported or explicitly contracted. No moved ownership is needed.
- The computations are small mathematical checks, not computational procedures. The Wehler product is a genuine infinite symplectic example; neither the full symplectic group nor unpolarized moduli is asserted to be finite.
- The README has the requested heading sequence and prose target form. The sampled passages are paraphrases; no copied source passage or instruction embedded in mathematical text was found. The source title containing “algorithm” is used only for its cohomological comparison.
- `Suggested.lean` has 43 lines, one `import Mathlib`, the requested namespace and module description, and three documented theorem signatures. It has no data definitions, instances, admitted examples, `set_option`, `lemma`, empty predicates or forced geometric stand-ins. All needed hypotheses are explicit declaration binders, including primeness, oddness and subgroup finiteness. All three names occur in the README. There are no kept definitions requiring definition examples. The README's unavailable geometric carriers have not been replaced by arbitrary data.
- `metadata.toml` and `sources.toml` parse. The latter has 31 entries: 25 certified, four waived and two uncertified. All 25 certified extractions exist. No additional work needed fetching, and no source-manifest entry was added or altered.

### Seeded source verification

All 15 requested sample targets were checked in the numbered cached texts. Printed pagination was distinguished from PDF page markers. The following are the supporting locations, including where the roadmap proves an extension or consequence rather than attributing its full wording directly to the source.

| Target | Source and locator read | Hypotheses and result |
| --- | --- | --- |
| 1.1 One unpolarized predicate | `huybrechts line 133`, Definition 1.1 and footnote, p.7, through line 156 | Arbitrary field; geometric integrality, properness, smooth surface, trivial canonical line and H¹(O)=0 agree. Relative smoothness handles imperfect fields. |
| 1.2 Isomorphisms and arbitrary field extension | `huybrechts line 13964`, Chapter 17 §2.1, p.365, through line 13970 | The text gives base change and the two-section triviality criterion. The reverse implication is the roadmap's faithful-flat descent argument; it does not assume separability. |
| 1.3 Projectivity over the original field | `huybrechts line 147`, Remark 1.2, p.7; `stacks-surface-resolution line 2327`, Lemma 16.11, tag 0C5P, p.51 | The general surface result supplies projectivity over the original field. Absolute dimension two and regularity are satisfied by the smooth field surface. |
| 2.2 Positive-characteristic closedness | `lang-nygaard line 76`, Theorem 1.3 and proof, pp.172–173, through line 104 | All positive characteristics. Finite-height degeneration and infinite-height Witt differential contradiction are separate. The OCR damages the displayed theorem, but the proof explicitly states and proves the requisite differential vanishing. |
| 2.4 Hodge and crystalline ranks | `deligne-lift line 29`, Proposition 1.1, pp.59–60, through line 57 | Hodge diamond and integral ranks agree. The perfect positive-characteristic coefficient hypothesis is retained. The roadmap supplies descent for the wider Hodge assertion and an explicit universal-coefficient proof of freeness. |
| 4.2 Geometric lattice realization | `huybrechts line 335`, Proposition 2.4, p.12; `huybrechts line 13945`, Chapter 17 §2, p.364 | Evenness, nondegeneracy, finite rank and signature agree. Arithmetic comparison is separately contracted; no unconditional integral Galois descent is used. |
| 4.5 General congruence theorem | `huybrechts line 14038`, Lemma 2.6 and proof, p.367, especially line 14049 | The source supplies the integral mod-3 consequence. The arbitrary odd-prime p-adic theorem is explicitly derived by the binomial-depth argument, not falsely attributed verbatim. |
| 5.2 Polarization stabilizers | `rizov line 608`, through line 642, pp.14–15 | Stabilizer of a Picard class, with no chosen line isomorphism, agrees. Numbering correction R01 only. |
| 5.4 Infinite symplectic subgroup | `huybrechts line 12221`, Chapter 15 §2.5(i), p.318, through line 12231 | The smooth Wehler example, intersection matrix, two deck involutions and infinite-order symplectic product agree. The displayed pullback matrices were independently multiplied. |
| 6.1a Cyclic quotient arithmetic | `nikulin-symplectic line 1537`, Russian original §5, pp.108–110, especially equation (5.2) at line 1580 and cases through line 1624; `dolgachev-keum line 507`, Theorem 3.3 proof, p.13 | Conversion from point counts to stabilizer-orbit counts gives the displayed n/m factor. The positive-characteristic argument retains candidates 11 and 15 until the extra discriminant exclusion. |
| 6.3a Wild refinements | `dolgachev-keum line 160`, Proposition 2.3; lines 229, 287, 353 and 391, Propositions 2.5, 2.9, 2.11 and Theorem 2.13, pp.4–10 | Exact order p, geometric field, the p=11 alternative and the section hypothesis for p-torsion are preserved. |
| 6.5 Faithfulness | `keum line 120`, Theorem 1.4, p.3, and line 767 through line 815, §6, pp.19–20; `rizov line 659`, Lemma 3.4.1, p.15 | Positive characteristic includes 2; ℓ is invertible. Integral freeness upgrades rational faithfulness. The rank-22 Picard input is separately named, and the Enriques branch uses b₂=10. |
| 6.9 Mathieu character | `dolgachev-keum line 522`, definition; line 569, Proposition 4.1; line 683, Proposition 4.5; line 785, Theorem 4.7, pp.14–20 | Dimension 24, tame character and the exceptional invariant-dimension hypothesis agree. Identity is evaluated separately. |
| 6.11 Tame groups and exceptional branch | `dolgachev-keum line 785`, Theorem 4.7; line 833, EG1–EG4; line 862, Theorem 5.2; line 1566, Proposition 5.14, pp.19–22,37 | M₂₃ containment includes the exceptional branch; the bound 960 has the additional hypothesis. Abstract extension structures, not just group orders, are contracted. No converse realization claim is made. |
| 8.1 Polarized stacks | `rizov line 879`, Definitions 4.3.1–4.3.2; line 898, Theorem 4.3.3; lines 917,964,1004–1052, pp.20–25 | Picard-section objects, Cartesian arrows, finite type over ℤ, DM property and primitive openness agree. The frame construction supports the quotient presentation. The roadmap uses PGL_(9d+2), consistently with the section rank, rather than propagating the source's later dimension typo. |

No target locator is marked unverified in the plan. The six manifest entries not certified are settled waived or uncertified entries; their limitations are listed under Not verifiable. Additional spot checks read Deligne's nontrivial-line deformation and lift statements, the wild fixed-locus theorems, Rizov's root-locus and embedding statements, and Terakawa's full characteristic-2 hypotheses.

### Adversarial mathematics pass

Each row includes the target's subordinate API, identities, proof dependencies and Checks. “No change” records that no repair was identified; it is not a claim of a formal proof. All edits are left to the fix worker.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: B, Q, signature and RR | Quartic H; rational curve C; characteristic 2 | B(H,H)=4, Q(H)=2; B(C,C)=−2, Q(C)=−1; 2χ(O)=4 in ℤ | No change |
| Conventions: pullback and contraction | f∘g; standard two-vector frame; p=2 | Inverse pullback is a left action; e₁↦e₂*, e₂↦−e₁*, with the expected dyadic sign | No change |
| Conventions: Tate twist and Chern sign | Quartic cup square; point class; exp(2πit) | Trace values +4 and +1; winding increment +1; no equivariant untwisting | No change |
| 1.1 IsK3 and its API | Empty scheme, ℙ², E×E, smooth quartic | Nonemptiness, canonical class and H¹ separately discriminate; no chosen form | No change |
| 1.2 Isomorphism/base change | Identity, extension tower, purely inseparable extension | Faithful-flat descent and cohomology base change preserve all five conditions | No change |
| 1.3 Projectivity | Imperfect k; dimension-three control | Smooth surface is regular and projective; no higher-dimensional inference | No change |
| 1.4 Coherent invariants/contraction | L=O, quartic H, p=2 | χ=2 and 4; integer RR and contraction signs agree | No change |
| 1.5 Numerical and torsion kernels | Trivial line, p-torsion, effective (−2)-curve | Positivity and RR exclude nontrivial kernel, including p-torsion | No change |
| 1.6 Quartics | t=−1,0,1; Fermat in characteristic 2 | χ=4,2,4; Fermat is nonreduced at 2, not a smooth example | No change |
| 2.1 Relative Picard space/API | Field, nonreduced base, jumping divisor, zero section | Universal functions precede representability; unramified is not confused with flat/étale in families | No change |
| 2.1a Infinite-height kernel | Nonzero versus zero witness; finite height; p=2 | Contradiction requires a nonzero kernel element; vector-field hypothesis supplies the unirational reduction | No change |
| 2.2 Closedness | Zero form; successive Cartier images; p=2,3 | Height branches and V-separatedness support vanishing without division by p | No change |
| 2.3 Vanishing | Abelian surface control; algebraic closure; characteristic zero | Oda is applied over a perfect field with a point; GAGA/Hodge supplies the other branch | No change |
| 2.4 Hodge/crystalline modules | Degrees −1,1,3,5; put W/p into M⁰ or M² | Universal coefficients contradict such torsion; ranks 1,0,22,0,1 follow by Nakayama | No change |
| 2.5 Marked formal deformations | Dual numbers; nontrivial global automorphisms | Tangent dimension 20; marking and H⁰(T)=0 distinguish this from global moduli | No change |
| 2.6 Line deformation divisor | O; nonzero p-divisible class; p dividing 2d | O is excluded; flatness does not require a nonzero linear derivative; smoothness does | No change |
| 2.7 Polarized lift | p=2; ramified finite extension of W(k) | Finite trait permitted; no universal lift over W(k) asserted | No change |
| 3.1 Analytic predicate/API | Empty, complex torus, projective quartic | Dimension/nonemptiness/H¹ exclude controls; canonical sections have dimension one | No change |
| 3.2 Algebraic/analytic comparison | Projective and nonprojective analytic K3 | Algebraizable essential image is projective; differential and Picard comparisons use GAGA | No change |
| 3.3 Integral topology | Torsion class x with nx=0; O(1), O(−1) | Image of x in H²(O) vanishes; Picard injection/torsion-freeness and integral duality eliminate torsion | No change |
| 3.4 Integral étale invariants | ℓ=p; ℓ=2≠p; large characteristic-zero field | Bad coefficient excluded; comparison uses finite systems and spreading, not an embedding of all k into ℂ | No change |
| 4.1 Picard descent | Identity; closed overfield; purely inseparable degree pⁿ; Brauer obstruction | Intersection unchanged; cokernel pⁿ-torsion; rational descent does not assert integral surjectivity | No change |
| 4.2 Lattice and API | O, Gram [4], rational curve, ℝ⊂ℂ | Half-norm and determinant conventions agree; extension degree belongs in pushforward formula | No change |
| 4.3 Rank definitions/API | Rank zero, closed base, rank 22 in positive characteristic | Ample class forbids zero; geometric rank independent of closure, not identified with h¹¹ | No change |
| 4.4 Cycle map and saturation | Multiplication by ℓ control; equal rank 22; characteristic zero | Finite-level Kummer injection proves saturation; equal rank alone would not | No change |
| 4.5 Congruence and depth API; all three Lean signatures | n=0,1,2; ℓ=2,3; −1; I+3E₁₂ | GL₀ trivial; −1 is the dyadic obstruction; E₁₂²=0 gives I+3mE₁₂; odd-prime depth strictly increases | No change |
| 4.6 Bounded descent | Closed k, finite k, imperfect k, rational point | Rank bound uses separable Galois image; integral realization retains Brauer and inseparable qualifications | No change |
| 5.1 Symplectic predicate/API | Identity, product, rescaled generator, −1 at p=2 | Generator-independent kernel of inverse pullback; scalar −1 becomes 1 only at 2 | No change |
| 5.2 Polarized stabilizer/API | Scalar choices; L versus Lⁿ, n>0 | No scalar arrows; Picard torsion-freeness gives same stabilizer | R01 locator only |
| 5.3 Finite étale automorphisms | Nonclosed field; involution; p=2 | Zero geometric tangent yields finite étale stabilizer; character kernel is finite étale | No change |
| 5.4 Wehler example | Individual involutions and ordered product | S₂S₁=[[-1,−4],[4,15]], determinant 1, trace 14, eigenvalues 7±4√3 | No change |
| 6.0 Supersingular discriminant | σ=0,11; p=2 | Signature excludes even unimodularity; rescaled evenness at 2 is explicitly contracted | No change |
| 6.0a Height/rank | h=1,10,11,∞ | Bounds 20,2,0; positive Picard rank excludes h=11; ∞ is not an integer input | No change |
| 6.0b Genus-one pencil | Rank one; F versus 2F; p=2,3 | Rank-five isotropy and primitivity needed; quasi-elliptic alternative retained | No change |
| 6.0c Height, Jacobian and rank-21 exclusion | No section; finite height; quasi-elliptic; rank 21 | Jacobian comparison retains no-section case; both pencil alternatives force rank 22 when needed | No change |
| 6.1 Tame quotient/root lattice | G=1, involution, rank-20 square determinant | Empty root lattice has determinant 1; 8A₁ has 2⁸; Jacobian discriminant contradiction retains p=2,3 | No change |
| 6.1a Cyclic arithmetic/API | n=2,4,11,15 | 24=8·3; 72=4·15+2·2·3; rank-20 determinants 121 and 225 require extra exclusion | No change |
| 6.2 Element table | Identity; orders 2,7,8; wild element | Identity excluded; fixed counts 8,3,2; tame hypothesis essential | No change |
| 6.2a Wild locus/API | Empty at p=2; κ=0,1,2; N=2,d=1 | Negative definite versus fibre radical distinguished; 0≤2 supplies no bound and is not divided by zero | No change |
| 6.3 Wild quotients | Rational, K3, free characteristic-2 Enriques | Rational comparison uses ℚℓ; free quotient e=12 and b₂=10 without a Picard-rank premise | No change |
| 6.3a Wild refinements/API | p=11,13; fibration without section; section p-torsion | p=11 retained; p=13 excluded; the p>7 torsion theorem has an elliptic section hypothesis | No change |
| 6.4 Wild-prime bound | Arbitrary finite G; order-p element; p=13 | Cauchy and absence of p-torsion in k× reduce to symplectic order p without restricting G | No change |
| 6.4a Picard faithfulness/API | Rank 22 at p=2; fixing just one ample class | Full Picard action and rank-22 theorem required; ample-class stabilizer alone only gives finite order | No change |
| 6.5 Cohomological faithfulness | Tame kernel; p-primary kernel; ℓ=p; free Enriques | Each quotient branch gives contradiction; coefficient exclusion and integral freeness retained | No change |
| 6.6 Uniform finite bound | G=1; char k=3; wild G | Choose 5 at characteristic 3 and 3 otherwise; no division by group order | No change |
| 6.7d Involution pencil | Identity; swap matrix mod 2; p=3 | Exact order two and p≠2 necessary; integral eigenspaces are not assumed split; quasi-elliptic suffices | No change |
| 6.8 Artin-invariant predicate/API | Rank 22 with disc −9,+9,−81 at p=3; rank 20 | Sign, exponent and rank discriminate without claiming arbitrary numerical realization | No change |
| 6.8a Invariant dimension/API | G=1,C₇, order 21; both Artin invariants one | Dimensions 24,6,6; universal lower bound five is not asserted in the exceptional branch | No change |
| 6.9 Mathieu character | n=1,2,7; wild control | Empty product yields 24; other values 8,3; denominators nonzero | No change |
| 6.10 Characteristic-zero bound | Trivial subgroup; involution; 23-cycle | Orbit counts 24,16,2; recognition only after geometric Sylow embedding | No change |
| 6.11 Positive-characteristic bound | Exceptional group; p=2; nonclosed k | Four-orbit branch retained; tame at 2 means odd order; geometric base change is faithful | No change |
| 7.1 Primitivity/API | Zero, generator, double generator, squarefree d | Zero excluded; saturation equivalence has nonzero hypothesis; n² divides d by evenness | No change |
| 7.2 Root loci/openness | n=0, n=p=3; F,2F,0 | n>0 essential; isotropic section handled using ample intersection, not divisors of zero | No change |
| 7.3 Polarized families/API | Constant family; degree zero; Picard section without a line | Positive degree and étale local representatives retained; no global line or scalar arrow invented | No change |
| 7.4 Vanishing/polynomial | m=−1,0,1; quartic; p=2 | Higher vanishing restricted to m>0; h⁰ for quartic powers 4,10,20 | No change |
| 7.5 Embeddings | 2L,3L; d=1,2; p=2 | Reider–Terakawa inequalities contradict parity; cube projective dimensions 10 and 19 | No change |
| 7.6 Hilbert locus/API | Singular degeneration; equal-rank unequal lines; cube quartic | Scheme-theoretic canonical-class equality and smoothness both retained | No change |
| 7.7 Atlas/API | Cube-root condition at 3; Fermat coordinate swap; no universal root line | Root condition closed; projective frame torsor retains source identification; stabilizers do not collapse its points | No change |
| 8.1 Stacks/API | Involution stabilizer; primes dividing 2d | Groupoid and stabilizers retained; finite-type atlas exists at every prime | No change |
| 8.2 Separation | Generic identity; ruled-surface control | Unique extension between existing smooth families; no properness of moduli inferred | No change |
| 8.3 Coarse spaces | Nontrivial stabilizer; twists over nonclosed k | Universal property and geometric-point bijection do not identify all k-forms | No change |
| 8.4 Smooth open base | d=1; p dividing 2d | Relative dimension 19 on the stated open base; no coarse-space smoothness claim | No change |
| 8.5 Finite-field finiteness | Fixed k,d; twists; Brauer obstruction over general fields | Finite-field Brauer vanishing supplies actual line and k-frame for every form; H_d(k) surjects onto classes | No change |

### Declared supplier gaps

Every row below has the same slug in `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json` and the README's appropriate supplier subsection. All 25 plan `needs` sentences occur in the README. None has supplier `none`. The surrounding clauses supply the coefficient, characteristic and geometric hypotheses; the longer contracts describe related comparison APIs used by their named consumers. No requested theorem was found already supplied at the audited ownership boundary. The missing Part II sections themselves are not findings.

| Slug | Supplier | Boundary and adversarial check |
| --- | --- | --- |
| surface-projectivity | SchemeAndStackFoundations | General smooth proper surfaces, including imperfect fields; dimension-three inference excluded. |
| hypersurface-cohomology | SchemeAndStackFoundations | Existing conormal/Koszul theory imported; connectedness needs ample cuts and positive final dimension. Nonample (2,0) and zero-dimensional cuts fail. |
| surface-arithmetic-quotient | SchemeAndStackFoundations | Extends algebraically closed numerical quotient to arbitrary fields; degree two checks projection normalization. |
| surface-quotient-resolutions | SchemeAndStackFoundations | Existing projective quotient imported; resolution/canonical comparisons add no wild R¹-vanishing claim. |
| tame-quotient-singularities | SchemeAndStackFoundations | Tame SL₂ local geometry; A₁ determinant 2 and E₈ determinant 1; wild linearization excluded. |
| quotient-transcendental-comparison | SchemeAndStackFoundations | Rational cokernel comparison permits ℓ dividing group order; integral averaging not claimed. |
| ruled-surface-two-forms | SchemeAndStackFoundations | Point-blowup comparison and fibre O(−2) calculation give the non-ruledness input. |
| matsusaka-mumford | SchemeAndStackFoundations | Polarized smooth families over a DVR and geometrically non-ruled special fibre retained. |
| elliptic-surface-geometry | SchemeAndStackFoundations | Generic surface theory, not curve Jacobians; torsion in R¹O, wild multiple fibres and quasi-elliptic Jacobians retained. |
| rational-surface-cohomology | SchemeAndStackFoundations | Unirational rather than merely rational surfaces; nonzero inseparable degree remains invertible in ℚℓ. |
| adjoint-positivity | AlgebraicVectorBundles | Separation plus positive-characteristic vanishing; general-type inequalities retained and characteristic-zero vanishing imported separately. |
| tame-lefschetz | EtaleCohomologyFoundations | General finite-order tame trace; identity is Gauss–Bonnet, isolated tame fixed-point contribution is +1. |
| surface-brauer-localization | EtaleCohomologyFoundations | Deleted points and exceptional trees distinguished from an arbitrary divisor with nonzero residue term. |
| surface-brauer-kummer | EtaleCohomologyFoundations | Finite H³ torsion contribution retained; standard divisible-group identification not an equivariant splitting. |
| equivariant-brauer-descent | EtaleCohomologyFoundations | Existing spectral sequence imported; Kummer/restriction compatibility retains units terms and d₂,d₃. |
| integral-topology | ComplexKahlerGeometry | Normalized exponential/Chern/intersection comparison; O(1), O(−1) fix signs. |
| oda-interface | CrystallineCohomology | Perfect positive-characteristic field and rational point; passage to algebraic closure supplies both. |
| witt-formal-brauer | CrystallineCohomology | Representability, realization and functoriality; finite-height rank h versus additive [p]=0; norm degree includes inseparability. |
| crystalline-chern-derivative | CrystallineCohomology | Extra compatibility with line extension, beyond the supplied connection; derivative may vanish for bad-degree classes. |
| artin-discriminant | CrystallineCohomology | Rank-22 cycle input; dyadic evenness explicitly separate, and Pic/p injection only over 𝔽p. |
| cross-realization | CrystallineCohomology | Integral common characteristic polynomial; finite-order semisimplicity needed to infer identity action. |
| tame-linear-groups | CFSGStatement | Finite tame SL₂ classification; retains characteristic zero and excludes wild groups. |
| mathieu-permutation-model | CFSGStatement | Presentations do not yet provide faithful permutation models; identity/involution characters 24,8, with fixed letter retained. |
| mukai-eleven-groups-recognition | CFSGStatement | Mathieu representation, five invariants and Sylow embedding are premises; ℚ₂ quaternion obstruction only needed when 2 divides tame order. |
| exceptional-mathieu-embeddings | CFSGStatement | Embeddings for specified abstract extensions; same group order alone is insufficient. |

The additional generic derivations in the supplier section were checked as well: polarized scheme descent requires an actual line representative; global projectivity retains the qcqs-base hypothesis; rational finite-torsor descent is performed after derived inverse limits; the Picard–Brauer comparison uses the actual field cohomology equivalence. These do not silently identify projective, strongly projective and H-projective morphisms.

### Duplication and supplier-order audit

Read the main-branch IntegralLattices, StableReduction and GlobalQuadraticForms roadmaps for shape, then inspected the consumed sections of SchemeAndStackFoundations, EtaleCohomologyFoundations, JacobianChallenge, AlgebraicVectorBundles, ComplexKahlerGeometry, AlgebraicTopology, MorseNovikov, CFSGStatement and QuadraticFormInvariants. The three earlier-order suppliers absent from the main worktree were read from the existing repository branch snapshots: CrystallineCohomology, ComplexComparisonPartII and AlgebraicModuliForArithmeticGeometry. Their cited sections exist: in particular CR.3.2(3) supplies the exact amplitude/reduction input, C3.2d.2–C3.2d.5 supplies the Picard comparisons, and §9.10 supplies characteristic-zero adjoint vanishing.

Object searches covered main/completed roadmaps, the five named open-roadmap heads and their package contexts, and available library source snapshots. GitHub code search was used for discovery, then relevant declarations were read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, rather than treating current search results as pinned evidence.

| Object | Existing owner checked | Result |
| --- | --- | --- |
| Smooth/proper/geometrically integral scheme | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127`, `Proper.lean:41`, `Geometrically/Integral.lean:40` | Native predicates are consumed. |
| Differential sheaf and rank | `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean`, `Rank.lean:74` | Dimension-two differential sheaf exists; curve-only invertible adapter not misused. |
| Line-bundle class group | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`, equality at line 76 and tensor/triviality at lines 119,135 | Global class carrier consumed, not replaced by an affine Picard group. |
| Rational-ambient lattice | `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`, constructor at line 174 | Geometric pairing/realization is the new content; abstract lattice theory remains imported. |
| Matrices and congruence | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`, `Mathlib/NumberTheory/Padics/RingHoms.lean:300`, lines 459,713; `PadicIntegers.lean:472` | Matrix units, coefficient map and filtration exist. No duplicate general finite-subgroup reduction theorem was located. Nonzero-entry valuation hypothesis retained. |
| Witt coefficients | `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean:148`, `Complete.lean:105` | DVR and residue equivalence imported; no duplicate coefficient-ring target. |
| Field Brauer group | `TauCeti/Algebra/BrauerGroup/Trivial.lean:247`, `TauCeti/Algebra/CrossedProduct/Comparison.lean:267` | Finite-field triviality and additive cohomology equivalence imported with correct direction. |
| Picard representability and generic surface theory | JacobianChallenge Layers C–D; SchemeAndStackFoundations §§2.20,4.14,5.10; ComplexComparisonPartII C3.2d | General theorems imported; K3 instances and arithmetic extension contract are distinct. |
| Mathieu objects | CFSGStatement S1; `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Mathieu/TwentyThree.lean:177` | Existing presentation is not a faithful permutation realization; the declared model gap is not duplicate presentation work. |
| Other open-roadmap overlap | CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers, ArithmeticDynamics | No duplicate K3 library found. ArithmeticDynamics' K3 example concerns canonical heights, not ownership of the surface or lattice theory here. |

The five open-roadmap heads were checked at these commits: CohomologyComparisonsPartII `dd8d7e6fda7516b9ab6806d5d75f5202332851c7`; ColemanIntegrationPartII `bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4`; QWittVectors `4605fbb0a2d9279b561f9467ab5cce09d7f2469e`; ErdosProgressionPowers `72b615703f7fc5d175e519ddbb6e589d3d744c6c`; ArithmeticDynamics `85e78c07dcc361ead6505c970a1181deee483819`. Their scope paragraphs and object searches showed no duplicate K3 target. ArithmeticDynamics line 2233 is the canonical-height endpoint example; CohomologyComparisonsPartII concerns classical syntomic producers and relative open-curve coefficients.

The quoted relative file paths in this table denote their respective library or roadmap repositories at the audited versions. The main snapshot is the supplied repository state; branch snapshots are evidence for earlier-order suppliers, not new dependencies on unrelated revision proposals.

Mechanical dependency check, exit status 0:

```text
depcheck: 6 roadmaps, 42 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This tool output is not a certificate for every prose dependency: the 60 `*Needs:*` lines and supplier paragraphs were also read. The target-order scan found no forward self-dependency in a `*Needs:*` line. The appearance of `IsK3.projective` in §1.1's API is a pointer to its separately proved §1.3 theorem, not a premise of the predicate. Source-facing quotient results, explicit gaps and later consumer names were distinguished from supplied premises.

## Not verifiable

- **Lean elaboration:** not available. The brief provides no executable elaboration command and expressly restricts Lean commands. None was run; neither successful elaboration nor “sorry is the only warning” is claimed. Static signature inspection found no missing implicit standing hypotheses. The three proofs remain admitted targets, not mathematical evidence.
- **`rudakov-shafarevich`, §8 Proposition 3:** waived manifest entry. Its rank-22 Picard-faithfulness use is supported by `keum line 799`, but the primary proof was not independently read.
- **`nygaard-vectorfields`, Lemma 3.3:** waived manifest entry. `lang-nygaard line 99` and line 101 verify its role and the vector-field/unirationality reduction, not its missing primary proof.
- **`matsusaka-mumford`, Theorem 2:** waived manifest entry. `rizov line 1075` through line 1085 identifies the non-ruled polarized trait application; the original proof remains uncertified here.
- **`shioda-transcendental`, Proposition 5:** uncertified locator-only entry. `keum line 811` and `dolgachev-keum line 590` support the cited applications. They do not independently certify every clause of the general supplier contract.
- **`arapura-chern`, §7.5 Lemma 7.5.1 and Definition 7.5.2, p.150:** uncertified locator-only entry. The README's Čech/logarithm/Thom derivation and signs were checked, but the published page was not read.
- **`liu`, Chapter 9 §3:** waived and unused manifest entry; not reopened or used as independent evidence.
- **Declared supplier extensions:** the 25 Part II contracts are future supply obligations, not implemented results certified by this package review. Acceptance is conditional on them. No absence of a declared extension was treated as an unowned prerequisite.

The settled waived/uncertified entries were not reopened. No new missing-reference request is needed. No source extraction was copied into the package or this report.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "db94ab66ff742f22f558692395ebadc9019975bc", "job": "REV-PKG-K3SurfacesAndSymplecticBoundedness", "model": "gpt-6-astra", "worker": "chris-1"} -->
