# Repair findings and verification

The first F01 below belongs to review r2a. The remaining eight findings belong to review r2b. Their F01 identifiers are retained separately. Review suggestions were checked as mathematical claims; no review text was treated as an instruction. The formatting gate repair is recorded below.

## F01 (P3) — applied

Review r2a. Weak Checks → computed controls in §§2.1, 2.5, 2.6, 4.1, 6.3 and 8.1: three homotopy fibres, total-sheaf flags, bundle/torsion Jordan blocks, Hall shifts, both rank-two residues, and explicit characteristic determinants. The flag mass is 3/6; elliptic residues are −3,0; framing constants are 14,30. No Check was added to Suggested.lean.

## F01 (P1) — applied differently

Review r2b. Backwards density gap → local §4.10, consuming ArithmeticStatisticsPartVIII §5.17 and DeligneWeightsAndPurity §10.5. Deleted the Lefschetz contract and plan gap; redirected §§4.9, 10.4 and layer dependencies. The proposed radial shortcut needed strengthening: the leading radial coefficient and equidistribution must be combined, as in S16 line 3363; infinitely many multipliers alone do not suffice.

## F02 (P2) — not actionable in this package: supplier chart identification requires correction

The supplier’s §3.7 cannot be edited here. Added gap:two-line-chart-epimorphism in both contracts and plan. Locally §§7.4–7.5 distinguish the Hom-frame open Q₁₂ from its evaluation-surjective open Q°°, prove the frame-torsor comparison only there, and restrict the imported equivalence. The genus-two witness has Hom dimensions 9,47 and Ext¹ dimensions 0,0, but first-evaluation basepoints (S16 line 2512).

## F03 (P2) — applied

Slope-based SchemeAndStackFoundations gap → strong-generation lemma in §8.1, using its §3.3 locally-free-input Serre duality, coherent HN theory and §0.2 field extension. Deleted the plan gap and every “generation contract” reference. The zero sheaf is handled without assigning a slope. Torsion, the strict-bound failure O(−1), and the fixed-source kernel give discriminating Checks (S16 line 2495).

## F04 (P2) — applied differently

Compound QSeries contract → coefficient-extension gap at HabiroNahmSeries §5.1. Scope and contracts now import λ-rings/Adams from SchemeKTheoryOperations §§6.2.1–6.2.2 and the existing plethystic family from HabiroNahmSeries. All complete-Adams consumers, including Layer 10’s combined references, follow the new owner. The missing extension remains explicit; no supplier theorem was invented. ψ₂((q−1)⁻¹) evaluates to 1/3 at q=2.

## F05 (P3) — applied

Nilpotent enumeration in the acceptance file → README-only input theorem §1.4. Deleted nilpotent_matrix_count and its Layer 1 comment from Suggested.lean; synchronized the module description, Mathlib contract, §1.4 and build guide. Enumeration remains a target with its original generality: finite fields, n≥0. Direct enumeration gives 4 over 𝔽₂ and 9 over 𝔽₃ for n=2.

## F06 (P3) — applied

Claimed existing symmetric-function Part II → explicitly requested continuation under gap:macdonald-admissibility. The same contract asks for integral HLV admissibility; the text no longer claims an existing supplier proves it. The gap remains unchanged in the plan. QSeries §§2.4, 3.5 supply q-binomial identities and ordinary partition adapters, rather than modified Macdonald theory.

## F07 (P3) — applied

The §8.4 elliptic Check’s negative weights → the δ convention of §8.2: δ(1,5)=3 and δ(0,a₂)=2a₂>0. Larger second subspaces increase δ. Rechecked the other stability witnesses: δ(8,29)=−115, δ(5,24)=−19; λ on a projector is −δ. No target sign or character was changed.

## F08 (P3) — applied differently

Independent Hom-transfer route → direct use of ArtinAlgebras Layer 0 recognition, uniqueness and indecomposables in §1.2. Deleted the isolated §1.1 construction and its pinned module-theorem contract/dependencies. Added the exact ArtinAlgebras contract and proper Hom-finiteness input. Nonunit nilpotence uses the Artinian radical theorem; finite residue fields use Wedderburn. The suggested temporary alternate construction would duplicate the imported owner.

## Required checks and scope

- Formatting gate failure `tex=1`: in §7.4 replaced the braced exponent outside code with “a direct sum of l₁ copies of L₁”. This expresses the same source sheaf; the statements and Checks are unchanged. Repeated the README scanners: `tex=0; latex=0`. Elaboration and the dependency check were repeated after this repair, with the same successful outcomes recorded below.
- Elaboration: `lake env lean` on `packages/CountingBundlesAndHallAlgebrasOfCurves/Suggested.lean`, run from the pinned content checkout, exited **0**. Sole diagnostic: `Suggested.lean:83:8: warning: declaration uses sorry`. All three imported Tau Ceti object files were present; no build was needed. No Lean process remains running.
- Signature audit: a separate elaboration containing `#check @name` for **all four retained declarations** exited **0**, with the same expected warning. No section hypothesis disappeared. The three definitions retain exactly k, Field k, X, its structure morphism and the displayed rank/bundle or rank/degree inputs. The headline additionally retains Finite k, properness, smooth relative dimension one, geometric connectedness, r and both integer degrees. These match §§0.2 and 10.4. The only signature change was deletion of nilpotent_matrix_count.
- Dependency check: the required `gate --depcheck` invocation with `--name CountingBundlesAndHallAlgebrasOfCurves`, the supplied order and `--movable` exited **0**. Its final output is recorded below. No UPWARD, CYCLE or moved line occurred.
- Citation resolution: `roadmaps resolve` found no unresolved cross-roadmap citations or Lean names. Its warning that pinned Lake packages are unavailable to that service was handled by reading the worker’s actual pinned source files separately.
- Scope: only the package README, Suggested.lean, the plan’s top-level gaps and this report changed. Parsed comparison confirms every other top-level plan field is identical. `git diff --check` passed. All seven gap slugs, suppliers and needs sentences match their README contracts. metadata.toml and sources.toml needed no change.

Dependency output:

```text
depcheck: 52 roadmaps, 599 edges, 0 problem(s)
```

## Ownership and source evidence

The main checkout was confirmed at 20b02f6. The pinned manifest supplies Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Shape was compared with AlgebraicVectorBundles, SchemeAndStackFoundations and RepresentationTheory/QuiverRepresentations on main. Revision-only open work was not substituted for these main versions.

The roadmap search/list/show tools were used for ownership checks, including searches by the objects “strongly generated”, “Weil tuples”, “density of curves”, “plethystic coefficient”, “modified Macdonald” and categorical recognition. The board packages and the supplied sibling checkouts were also searched. No existing distinct owner was found for the curve-specific density application or numerical slope criterion; their inputs retain their suppliers. Open-head checks covered the available indexed new roadmap folders; no unprovided open checkout was sought manually.

Supplier locators used by the repairs:

| Supplier | Evidence and boundary |
|---|---|
| ArtinAlgebras Layer 0 | Recognition requires split idempotents, finite biproducts and Hom-finiteness over an Artinian commutative ring; Uniqueness and Indecomposables give the exact coherent application. It does not require coherent sheaves to be Artinian objects. |
| SchemeAndStackFoundations §§2.6, 3.3 on main | Proper coherent cohomology finiteness and curve_serre_duality_ext_hom with locally free first input. Taking that input to be L(x) is legitimate. No slope/HN input is attributed to this supplier. |
| EndoscopicTransferAndUnitaryTraceComparison §3.7 | Names Q₁₂ of Schiffmann §6.4 and its zero-level quotient; does not separately impose the first-evaluation epimorphism in that two-line definition. The stronger frame-torsor statement must be restricted; the new gap records this. |
| LefschetzPencilsAndVanishingCycles §5.11 | A gcd statement about Frobenius polynomials of pencil fibres, rather than universal curve density. DeligneWeightsAndPurity consumes this earlier supplier. The backwards contract has been withdrawn. |
| ArithmeticStatisticsPartVIII §5.17 | Odd-degree polynomial-family geometric monodromy is full symplectic for g≥2 and odd auxiliary ℓ, and for g=1 with ℓ≥5. The ℓ=3 genus-one exception has index 27. |
| DeligneWeightsAndPurity §§1.7, 10.5 | Weight-one curve H¹ and degree-fibre equidistribution, with base dimension in the normalization. Half-Tate normalization and the radial application are performed in §4.10 here. |
| SchemeKTheoryOperations §§6.2.1–6.2.2 | Line-monomial λ-structure, specialness and Newton Adams composition; these are not reconstructed in the complete-series gap. |
| HabiroNahmSeries §5.1 | The displayed logarithmic identity defines L_n=(q−1)[t^n]Log F; its q↦q^m substitutions include the coefficients. The general reciprocal-parameter extension is not stated there. |
| HabiroCyclotomicCompletions §1.1 | Simultaneous q-and-series substitution and elementary plethystic Exp; the extended calculus must agree under specialization. |
| QSeriesPartitionsAndMockModularForms §§2.4, 3.5 | q-binomial/Euler identities and ordinary partition series; the Macdonald continuation is a declared gap. |

The other existing contracts were resolved at their permitted copies: AlgebraicVectorBundles L0A–L2B; QuiverRepresentations Layers 1–2; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.5–0.6, 0.13; ClassicalGroupsPartII §§CG.0.4–CG.0.5, CG.2.4–CG.2.6; FunctionFieldArithmetic §§0.2–0.3, 5.1–5.4; WeilConjectures WC.1; ReductiveGroupsPartII §RG2.3.7; AutomorphicSpectralTheory §§6.22c, 6.24; AlgebraicModuliForArithmeticGeometry §§1.3, 4.19; EtaleDualityAndPerverseSheaves §§0.4, 0.6–0.7; ComplexComparisonPartII §§C6.3–C6.6; and CohomologicalPointCounting’s combined endpoint. Their general GIT, coherent-duality and affine-bundle extensions remain conditional on the explicit gaps, rather than being asserted as supplied theorems.

The source passages decisive for the findings were read in the legal cached extractions: S16 line 867 (total-sheaf flags), S16 line 880 (Jordan quotient), S16 line 1258 and S16 line 3321 (density), S16 line 3363 (radial proof), S16 line 2495 (strong generation), S16 line 2504 through S16 line 2538 (frames, erroneous generation implication and cotangent sequence), S16 line 2207 (truncated generating series), and S16 line 389 (rank-two count). Published S16 numbering is used. No new source was needed; M20, FH58 and HES81 remain the settled locator-only references, with no renewed request.

Pinned declarations were read at the paths and locators in the README. In particular, FixedRank is the constant-rank full subcategory and its pullback goes from bundles on Y to bundles on X for X→Y; eulerCharBelow has no cohomology finiteness built in; Indecomposable explicitly excludes zero; Skeleton takes isomorphism classes; FullSubcategory retains all ambient morphisms. Matrix.card_GL_field counts units, not nilpotents. Artinian radical nilpotence permits noncommutative rings. Arm and leg functions use natural subtraction and require cell membership for their geometric interpretation. Object searches at the pins found no curve Higgs/Hall or plethystic carrier that would make the omitted headlines statable.

## Computed adversarial mathematics ledger

This is an instance audit, not a proof of the admitted headline or of the README targets. Each row records values for a statement, definition or convention; linked API consequences are evaluated on the same objects. In the tables, P means P_X(1), E denotes the Euler pairing and D=1+(g−1)r². All numerical specializations use characteristic-zero coefficients; q=1 is excluded for finite-field specializations. Statements requiring an object absent at the pins stay in the README.

| Statement | Instances tried | Values on the two sides / negative control | Result and change |
|---|---|---|---|
| Field, zero and slope conventions | 𝔽₂, zero, rational torsion, O(1)⊕O(−1) | q=2; zero has 0 HN steps; torsion has slope +∞; bundle slopes 1,−1, mean 0 | Zero gets no slope; total HN cut distinguishes mean slope |
| Euler order and Hall square root | P¹, O and O(1); O²/𝔽₂ | E(O,O(1))=2, reverse=0; v²=2; three sublines give 3√2 | Quotient-left convention retained |
| Frobenius, extension and Adams | y²+y=x³ over 𝔽₂, 𝔽₄, 𝔽₆₄ | #E=3,9,81; eigenvalue sums 0,−4,−16 give 3,9,81 | Extension acts on q and eigenvalues |
| Formal reciprocal tuples and localization | q=2, α=(−1,−2) | P=6; ψ₂P=1−1−4+4=0; ψ₂((q−1)⁻¹)=1/3 | Formal tuple differs from a curve; no q=1 evaluation |
| Residue and differential convention | f=h⁻¹,h⁻²,1 with h=1−z/u | rRes=1,0,0; dRes=−1,−1,0 | Simple-pole sign retained throughout |
| Higgs dimension, twist and reduction conventions | Rank one, genus two | D=2; coarse dimension 4, stack 3, core 2; compact affine shift 4 and twist −2 | No rank/cohomological-degree conflation |
| §0.1 coefficient ring and full character ring supplier | g=0; g=1,a=3,q=2 | R₀=ℚ[q±1]; a+q/a=11/3 before/after a↦2/3, while a changes | Weyl invariants and independent q retained |
| λ-ring supplier and Adams | Line a; integer 2; localized denominator | ψ₂(a)=a², ψ₂(2)=2; ψ₂((q−1)⁻¹) at q=2 is 1/3 | Import SchemeKTheoryOperations; narrow extension gap |
| Ordinary / plethystic series suppliers | log(1+uv), Exp(T), Exp(−T) | coefficients 1,−1/2; Exp(T) has T² coefficient 1, ordinary exp(T) gives 1/2; Exp(−T) gives 0 | Existing operations imported; inverse coefficient extension requested |
| Bundle/Picard mass supplier | r=0; a line/𝔽₃; torsion degree one on P¹/𝔽₂ | bundle mass 1; line class count 1 versus mass 1/2; torsion coefficient 3 | Fixed-rank zero and coherent torsion separated |
| Lang and band suppliers | G_m/𝔽₃; constant C₂; constant S₃ | geometric Lang z↦z² is onto; rational map is constant 1; H¹ has 1,2,3 classes respectively | Connectedness used for uniqueness, not neutrality |
| Duality / top-component supplier | A¹, P¹, two exchanged components | compact traces q and 1+q; top component dimension 2 but first Frobenius trace 0 | Geometric Frobenius and top dimension retained |
| Compact comparison suppliers | Point, two points, elliptic Higgs rank one | H_c⁰ dimensions 1,2; elliptic H_c dimensions in degrees 2,3,4 are 1,2,1 | Rank comparison requires a lisse stratum |
| §0.2 bundleDegree | O(1) on P¹; O² in genus two; O(1)⊕O(−1) | 2−1=1; −2−2(−1)=0; 2−2=0 | Real native definition agrees with degree on curves |
| §0.2 absolute predicate | O, O², zero | geometric End(O)=k̄; diag(1,0) splits O²; zero violates nonzero condition | Predicate values true,false,false |
| §0.2 native class count | P¹, r=0,1,2 and d=±1; one 𝔽₃ line | counts 0,1,0 in each degree; line contributes 1 versus mass 1/2 | All binders match Lean |
| §0.2 coherent decorated counts | Rational torsion block of lengths 1,2; degree-two simple | absolute indicators 1,1,0; last object becomes two geometric summands | Rank-zero coherent extension distinct from bundles |
| §0.2 HN field extension | O(2)⊕O(−1), degree-two torsion, zero | slopes (2,−1)→(2,−1); +∞→+∞; empty→empty | No arbitrary family-base-change claim |
| §0.3 residue operations | 1/(1−z), 1/(1−z)², regular 1 | normalized residues 1,0,0; differential residues −1,−1,0 | Higher-pole negative control retained |
| §1.2 coherent decomposition | 0,O,O²; k[t]/t² | summand numbers 0,1,2; local residue k versus M₂(k); t²=0, (1+t)⁻¹=1−t | Imported categorical recognition; deleted Hom-transfer construction |
| §1.3 matrix-block radical | N=𝔽₂[t]/t², M=N² | radical dimension 4; quotient cardinal 16; units 16·6=96, nilpotents 16·4=64 | Repeated-copy matrix block, not radical dimension 2 |
| §1.4 nilpotent count | n=0,1,2 over 𝔽₂; n=2 over 𝔽₃ | counts 1,1,4,9 equal q^(n(n−1)); GL counts 1,1,6 for 𝔽₂ | Direct enumeration; theorem kept in README only |
| §1.5 ratio | zero, 𝔽₃ line, O²/𝔽₂, rational length-two block/𝔽₂ | ratios 1,1/2,4/6,2/2 equal 1,1/2,2/3,1 | Radical factors cancel in both numerator and denominator |
| §1.6 neutrality and forms | G_m, dual-number units, constant C₂ | neutral H² in each case; H¹ cardinal 1,1,2 | Neutral does not mean unique form for disconnected band |
| §1.7 Frobenius orbit | One length-two orbit, extension degrees 1,2 | absolute counts 0,2; divisor sum 0,2; descended class twice the summand class | Orbit length and class scaling agree |
| §1.8 coprime residue and scalar split | (r,d)=(2,1); algebra k[t]/t² | residue degree divides 1; c+bt has scalar c and nilpotent bt, End dimension 2 | Residue k does not assert End=k |
| §1.9 HN bound | r=1,d=−1,0,1; g=2,r=2,d=3 | cutoff indicators 0,1,1; 3>2=r(r−1)(g−1); genus-one gap is 0 | Strict bound and separate genus-zero route retained |
| §1.10 finiteness, twist and dual | P¹ lines of degree ±1; rank two | A(1,−1)=A(1,1)=1; rank-two values 0=0; twist shifts d by r | No rational point assumption in general |
| §2.1 homotopy fibre and Fubini | Id:BS₃; BC₂→BS₃; B(C₂²)→BC₂ | fibre masses 1,3,1/2; total masses 1/6=1/6, 1/2=3/6, 1/4=(1/2)² | Three computed fibres replace weak Checks |
| §2.2 nilpotent groupoid | zero, 𝔽₃ line, rational length-two module | masses 1,1/2,1; Id on line has nonzero every power; t²=0 | Unit and nonzero nilpotent separated |
| §2.3 exponential identity | One absolute line species at q=2 | multiplicities 0,1,2 give 1,1,2/3; exponential gives 1,1,1/2+1/6 | Adams on coefficient q is required |
| §2.4 Jordan class | θ=0; one size-two block; torsion length two | α₁=[F]; α₂ rank 1 gives total rank 2; torsion α₂=(0,1) gives degree 2 | Weighted class retained |
| §2.5 filtered groupoids | P¹ flags with first piece O(−1), respectively O(1); O,O flag/𝔽₂ | total cutoff true,false despite first slopes −1,+1; flag mass 3/6=1/2 | Reject graded-piece and first-piece cutoffs |
| §2.6 Jordan functors | O(−1)² with θ(e₂)=e₁; rational k[t]/t² | H=O(−1), slopes −1=−1; H=k_x, slopes +∞=+∞; H₁=0,H₂=H in both | Both directions of cutoff tested, including torsion |
| §2.7 fibre exponents | One step; α₂=O on P¹; α₁=O,α₂=O(1) | exponents (d,d′,d″)=(0,0,0),(−1,−1,0),(−3,−3,0); masses 1,1/2,1/8 at q=2 | Symmetric and ordered Euler terms agree |
| §3.1 Hall operations | O²/𝔽₂, plus unit | product 3√2; coproduct coefficient √2/2; zero-sheaf product factor 1 | Product counts subobjects, coproduct divides by Hom |
| §3.2 Green compatibility | Same O,O,O² | pairing (3√2)/6=√2/2; coproduct pairing √2/2 | Bilinear pairing and twist agree |
| §3.3 characteristics / torsion | Rank two plus length-one rational torsion; negative torsion class | Hall factor v² and correction v⁻² give 1; negative torsion indicator 0 | Rank-dependent correction retained |
| §3.4 filtered masses | Three O flags in O²/𝔽₂ | direct mass 3/6=1/2; v⁻¹(v/2)=1/2 | Same flag normalization as §2.5 |
| §4.1 Eisenstein distributions | O⊕k_x, O(1)⊕O(−1), O(−1) | v·v⁻¹z=z; total and positive indicators 1,0; unrestricted/positive/negative values z⁻¹,0,z⁻¹ | Three new numerical controls |
| §4.2 Hecke commutation | r=0,1,2 | empty factor 1; arguments q⁻¹ᐟ²z/w and (q⁻¹z/w,z/w); all constant coefficients 1 | Rank and argument shifts retained |
| §4.3 coproduct formula | r=0; split (1,1), genus zero | E₀⊗E₀; prefactor q⁻¹ᐟ² with arguments q¹ᐟ²z,q⁻¹ᐟ²z | Reciprocal shifts, rather than identical arguments |
| §4.4 Eisenstein residues | r=1; rank-two genus one chain | rank-one factor V₁⁻¹V₁=1; chain residue of h⁻¹ is 1, differential version −1 | Normalized residue retained |
| §4.5 HN product | O(1)⊕O(−1) on P¹ | E(negative quotient,positive subobject)=3; prefactor v⁻¹ and degree shifts v⁻² cancel Hall v³ | Smaller slope stays left |
| §4.6 spherical algebra | Line generator squared; torsion generator; O(m)⊕O(−m) | values 3√2 versus rank-two characteristic 1; torsion values 1,0 on k_x,O; infinitely many m≥0 | Generators and completion distinguished |
| §4.7 HN membership | P¹ types (2,0), ((1,1),(1,−1)), ((1,0),(1,0)) | stratum class counts 1,1,0 | Equal slopes cannot create a second HN step |
| §4.8 generic form | One line; O,O flag at q=2 | line mass P/(q−1)=P; scalar flag correction v⁻¹(v/2)=1/2 | Invariant scalar and v extension kept distinct |
| §4.9 universal counts | P¹/𝔽₂, classes (0,1),(1,1) | N₀ begins 1+3z; rank-one N begins 1+4z; after division coefficient is 1 | Torsion is canceled rather than discarded |
| §4.10 curve tuple density | q₀=3,m=1,2,3; genus-one ℓ=5 versus 3 | unnormalized q=3,9,27, normalized multiplier 1; (q−3)/t²=0,2/3,8/9→1; ℓ=3 exception index 27 | Density now owned here; leading radial coefficient required |
| §5.1 pairing series | One rank-one slot at 0 and infinity | V₁/(1−zw) gives V₁ in nonnegative degrees; its negative at infinity gives V₁ in negative degrees | Expansion region fixes cutoff |
| §5.2 torsion separation | One rank-one slot on P¹/𝔽₂ | zw coefficient #X/(q(q−1))=3/2, not 3 | Total-rank q shift retained |
| §5.3 unrestricted pairing | One slot; ranks (1,2) | one-slot mass V_r∑(zw)^d; cross-shifts q⁻¹ and q¹ᐟ² | Order of unequal ranks matters |
| §5.4 expansion separation | 1/(1−z) expanded at 0 and infinity | (1−z)∑_(n≥0)z^n=1; (1−z)(−∑_(n<0)z^n)=1 | Polynomial clearing valid for both regions |
| §5.5 truncated shuffle | s=1,2 | positive V₁/(1−zw); negative −V₁/(1−zw) gives positive negative-degree coefficients; s=2 sign +1 | Unaveraged sum and signs retained |
| §5.6 block residue | Tuple (1); tuple (2), g=2 | first has 0 residues and identity factor; second has a=−1/2, chain z₂/z₁=q⁻¹ | Weighted scaling included |
| §5.7 Jordan sum | r₂=1; degree α₂=1; empty generic type | rank exponent 2, degree exponent 2; rank-zero series coefficient at z on P¹/𝔽₂ is 3 | Multiplicity length cannot replace weighted size |
| §5.8 positive-arm product | λ=(1),(2),(1,1) | products 1,ζ(q⁻¹z),1; corresponding plethystic inputs 0,Xq⁻¹z,0 | Arm-zero cells excluded |
| §5.9 J kernel | One box, genus two | J=q⁻¹P/(q−1), so qJ=P/(q−1); q=2 gives P/2 and P | Genus normalization retained |
| §5.9 H kernel and ordered residues | Empty,(1),(2) | H=1,(1−z)⁻¹,(1−z²)⁻¹; latter z,z² coefficients 0,1 versus 1,1 | No empty/nonempty or weighted-size conflation |
| §5.10 partition product | Empty and one-box terms on P¹/𝔽₂ | torsion series 1+3z+…; one-box factor (1−z)⁻¹; their z coefficient is 4 | Common torsion factor retained before cancellation |
| §6.1 partition identity | Rank one, q=2 | both sides’ T coefficient P/(1−z); torsion-only rank-zero coefficient after cancellation 1 | Positive rank identity agrees with §4.9 |
| §6.2 Fourier extraction | r=2,b₀=2,b₁=3; characteristic two | residues −5/2,1/2; negative Fourier sums 2,3; in char 2, 1−z²=(1−z)² | Nonzero r in coefficient field required |
| §6.3 residue formula | r=1; r=2 on P¹; r=2 on E/𝔽₂ with P=3 | rank-one residue −P; rank-two residues (0,0),(−3,0); recovered counts 0,3 for both parities | New independent rank-two controls |
| §6.4 rank-two expression | q=2, empty tuple; formal tuple (−1,−2) | bracket 1/3−1/12−1/4=0; P=6,U=15,V=0,S=5/6 gives bracket 5−4=1, count 6 | Rational cancellation and genus boundary agree |
| §6.5 origin evaluation | Rank one; q⁻¹; paired monomials | P(0)=1; q⁻¹ has a pole; α₁α₂=q both evaluate to 0 | Only functions regular at origin can be evaluated |
| §6.6 constant formula | g=2,r=1,2,3,4; g=3,r=3,4 | values 1,2,6,22 and 15,95; rank-one differential residue −1 recovers +1 | Both minus signs retained |
| §7.1 positive Higgs category | P¹ exact sequence O(−1)→O²→O(1); torsion self-Ext | positivity false,true,true; derived Higgs Ext dimensions 1,2,1 versus underived 1,1,0 | Exact category not asserted abelian; derived terms required |
| §7.1 Higgs differential and stability | Elliptic (O,0)→(O,η); L² with zero field | differential(Id)=+η, complex cohomology 0; L² has equal-slope line and is semistable, not stable | Commutator sign and geometric stability retained |
| §7.2 Serre-dual invariant criterion | W=ke₁, matrices [[1,1],[0,2]], [[1,0],[1,2]] | lower-left entries 0,1; factorization/invariance true,false | Natural maps determine preservation |
| §7.3 coarse Higgs geometry | Rank one, genus two; scalar stabilizer | Pic^d×A² dimension 4; gerbe dimension 3; mass weight 1/(q−1) versus coarse weight 1 | Coarse/stack normalization retained |
| §7.3 nilpotent scheme versus core | Elliptic r=2,d=1,p=2; scalar ε on rank one | polynomial t²+a² gives a²=0; reduced a=0; ε²=0 but characteristic coefficient −ε≠0 | Nilpotent families not identified with scheme fibre |
| §7.4 generation open | Elliptic (l₁,l₂)=(2,7); genus-two counterexample | first frame rank 0 versus required 2 rejects combined quotient; one-line kernel rank 1,degree −4; genus-two Hom 9,47 and Ext¹ 0,0 but first evaluation fails | Q°° is a proper restriction; supplier gap recorded |
| §7.5 cotangent comparison | Rank-one genus g; excluded genus-two point | moment kernel has dimension g=dim Ext¹(L,L); zero covector gives zero Higgs field; excluded point still has Ext¹(L_i,F)=0 | Supplied zero-level comparison restricted to Q°° |
| §7.6 Kronecker moment | Two arrows over 𝔽₃, x₁=e₁,x₂=e₂,y₁=e₁*,y₂=e₂* | μ=(2,−I₂); total trace 2−2=0 | Effective moment target and signs agree |
| §8.1 framing dimensions | (g,r,d)=(1,1,0),(1,1,3),(2,2,1) | (d₁,l₁,d₂,l₂,C)=(2,2,7,7,14),(0,3,7,10,30),(5,9,24,47,423) | Recomputed least choices |
| §8.1 characteristic determinant | (l₁,l₂)=(2,7),(3,10) | proper determinants never 0 as integers; none divisible by 11 in first case; 10=0 mod 2, none divisible by 31 in second | Sufficient cutoff distinguished from necessity |
| §8.1 strong-generation lemma | L=O on P¹, F=O,O(−1); k_x; zero | margins 0>−1 and −1=−1; h¹=0 in both but evaluations onto,zero; torsion/zero Ext¹=0 and evaluation onto | Strict criterion, torsion and zero verified |
| §8.1 fixed-source kernels and subspaces | g=2,r=2,d=1; full source and zero kernel | kernel rank 7,degree −46; μ_min≥−16, hence μ_min+24≥8>3; zero kernel Hom=Ext¹=0 | Uniform source-bound argument preserved |
| §8.2 character and δ | Dimensions (2,3); full vector; excessive-slope line at g=2 | δ(1,1)=−1, δ(1,2)=1, δ(2,3)=0; δ(5,24)=−19 | γ and λ=−δ kept fixed |
| §8.3 moment criterion | Indecomposable with End dimension h; nontrivial projector | contribution (q−1)q^(h−χ)/((q−1)q^(h−1))=q^(1−χ); projector λ=−δ≠0 when p>C | Both implications need stated coprimality/characteristic |
| §8.4 semistable framing and smoothness | Elliptic O/𝔽₂; doubled two-arrow example | δ(1,5)=3 and δ(0,a₂)=2a₂; effective differential rank 4, central-line differential rank 1 | Elliptic sign repaired; restricted target remains line |
| §8.4 frame-vanishing target | Genus-two F=L₁⊕B with deg B=6 | l₁=9, h⁰=11, h¹=2; subpair (8,29) gives δ=−115 | Injective frame alone insufficient; vanishing target retained |
| §8.5 tight-pair slope criterion | g=2,r=2,d=1, line of degree 1 | section dimensions (5,24); δ=−19=(24−5)(1−2) | Destabilizing slope has negative δ |
| §8.6 central family | Rank-one genus g; noncentral value | each fibre count q^gP; nonzero scaling t followed by t⁻¹ gives factor 1; noncentral coadjoint orbit has >1 values | Family coordinate only on invariant central line |
| §8.7 BB deformation | Y=A¹×A^a over 𝔽_Q; elliptic reduced core | total Q^(a+1)=Q·Q^a; zero and unit fibres Q^a; opposite elliptic core rank 0 | Reduced core, not its a² thickening, is an affine bundle |
| §8.8 bounded-characteristic count | Rank one genus two; P¹ ranks one and two | q²P=q^D A; genus-zero counts 1=1,0=0 | Sufficient bound belongs to geometric route only |
| §8.9 positive/ordinary Higgs integration | Elliptic q=2,r=1; genus-two rank one; elliptic r=2,d=0 | I₁=Ω₁=6; genus-two I₁=2P, wrong sign gives 8P; 30−18−6=6 | q normalization, Adams and slope-zero extraction agree |
| §8.9 cutoff and Ext² boundary | Elliptic d=−1; E=F=(O,0) | usual Ω=6, positive coefficient 0; Ext² dimension 1 at equal slopes versus 0 for strict ordered slopes | Relative and ordinary factors remain distinct |
| §8.10 all-characteristic count | E:y²+y=x³ over 𝔽₂ and 𝔽₄ | (A,Ω,#H,mass)=(3,6,6,6),(9,36,36,12); multiplying second mass by q−1 gives 36 | q, not p; no p>C hypothesis |
| §9.1 purity and shifts | Rank-one g=2; elliptic r=2,d=1,p=2 | m=2,b=0,D=2 gives H_c^n=H^(n−4)(Pic)(−2); elliptic m=1,b=0,D=1 gives shift 2 | Twice-rank shifts retained for both core models |
| §9.2 positivity and paired representatives | g=1,r=1; g=2,r=2 | A(−α)=1+α₁+α₂+q; D=5 gives top degree 10; α₁⁵α₂⁵=α₃⁵α₄⁵=q⁵ on cone | Positive representative need not be freely invariant; 4∤10 |
| §9.3 complex compact polynomial | Rank-one g=1,2 | signed t²−2t³+t⁴ and t⁴(1−t)⁴; unsigned t²(1+t)²,t⁴(1+t)⁴; top degrees 4,8 | Signs and q=t² agree |
| §9.4 core trace and components | Rank-one g=2; exchanged component pair | q²∏(1−α_j⁻¹)=P; top degree 4 has dimension 1; exchanged pair dimension 2,trace 0 | Prefactor q^D, top degree 2D |
| §10.1 Mellit kernel | g=1,q=2,α=−1 and −2; T=0 | H₁(z)=3(z+1),2(z+2); z=1 values 6,6, z=0 values 3,4; empty Ω=1,H=0 | Reciprocal invariance asserted at recovered count |
| §10.2 regular deformation | f_n=1; empty partition | padding gives 1=1; deformation constant term 1 | Generic deformation imported, curve identification retained |
| §10.3 Laurent integrality | Rank-one H₁; negative control 1/(1+z) | H₁ has no finite pole; control value 1/2 at z=1 but pole at −1 | Global Laurentness, not local regularity, removes other poles |
| §10.4 degree independence / Lean headline | P¹ ranks 0,1,2 at d=−1,+1; elliptic ranks one,two | equalities 0=0,1=1,0=0; elliptic counts 3=3; control (2+3z)/(1−z²) yields 2,3 | Native carriers and all curve binders retained |
| §10.5 all-degree positivity | g=2,r=2,d=0 and 1 | origin values both 2; gcd(2,1)=1; top degree both 10 | Transfer counts, rather than identify coarse moduli |
| §11.1 quasi-parabolic objects | No marks; rank one; O² with three fibre lines | unmarked count A; rank-one count P; three distinct lines force scalar End, two leave diagonal End | Flag isomorphisms essential for indecomposability |
| §11.2 parabolic universal functions and Euler form | Rank-one flags; one two-step P¹ mark | universal P; line jumps in steps 1,2 give E_par=0, reverse 1; (q−1)⁻¹ at q=2 gives 1 but pole at q=1 | Localized conclusion retained; marked integrality remains conjectural |
| §11.3 cut and exact HN counts | Rank-one d=−1,0,ν=0; nonsplit genus-two class (2,1) | cutoff counts 0,P; nonsplit HN ((1,1),(1,0)), μ_min=0<1/2; split has same HN but absolute indicator 0 | Fixed HN does not determine indecomposability |
| §11.4 cut universality | Rank-one lower cut ν=0 and its dual | degrees −1,0 give 0,P; dual upper cut at degrees 1,0 gives 0,P | Only K_g asserted |
| §11.5 Euler Hall Hopf/Lie | Unit scalar c; torsion-left/line-right on P¹_C | primitive identity c=2c forces c=0; Hall products on O(d+1) have values χ(P¹)=2 and 0; commutator 2 | Order and primitive degree zero agree; q=1 pole excluded |
| §11.6 conjecture (i), exact HN | Genus-two nonzero extension versus split extension | same HN ((1,1),(1,0)); absolute indicators 1,0 | Conjecture specifies refined count, not HN graded count |
| §11.6 conjecture (ii), positive differences | Rank one, cuts i=0 and i=1 | at d=0 difference P−0=P with positive signed representative; at d=1 difference P−P=0 | Formulated only, no proof asserted |
| §11.6 conjecture (iii), Lie multiplicity | Rank-one origin; Hopf unit | expected multiplicity P(0)=1; degree-zero primitive dimension 0 | Nonzero class and origin regularity retained |
| §11.6 conjecture (iv), Hilbert series | Single primitive species with origin value 1 | Exp(T)=1+T+T²+… gives degree-two coefficient 1, not 1/2 | Plethystic convention fixed; conjectural equality not used |
| §11.6 conjecture (v), marked integrality | Rank one or a length-one flag | A=P∈R_g; at origin P=1; unrestricted localized element (q−1)⁻¹ has q=1 pole | Degenerate marked case does not prove general denominator removal |

The changed Checks were also compared with all worked examples. In particular the total flag cutoff agrees with the Jordan cutoff, all Hall factors cancel with the same quotient-left convention, and the δ witnesses in §§8.1–8.5 and the final worked example use one sign. The all-characteristic counting statements continue to include characteristics two and three.

## Maintainer consequences

The package can repair its local statements, but cannot amend EndoscopicTransferAndUnitaryTraceComparison §3.7. That supplier correction is explicitly not actionable here and is represented by the new gap; it requires a supplier or human decision. Other remaining supplier gaps are neither certified nor discharged by this report.

The complete-Adams gap retains its slug but now names HabiroNahmSeries §5.1’s coefficient continuation. The universal-curve-weil-density and degree-only-strong-generation slugs were deleted because §§4.10 and 8.1 now own those applications. Layer numbers and existing target numbers were preserved; §1.1’s isolated construction was deleted without renumbering §1.2 onward. The deleted Lean name is nilpotent_matrix_count; no retained Lean declaration changed name or signature. The seven remaining gaps agree exactly between README and plan. No source is newly missing. No commit, push, pull-request edit or merge-order edit was made.
