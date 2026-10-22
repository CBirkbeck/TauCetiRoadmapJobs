<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/625#issuecomment-6333310894 -->
Red team round 1 pass a (codex) of d0e51ae

Verdict: needs_changes

1. **F01** (P3) The elementary model Checks have no complete Lean mirrors

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:369–371`; `packages/GanGrossPrasadUnitaryGroups/Suggested.lean:95–120`. The README promises “a one-dimensional model” and “weights 1 and -1 … while weights 1 and 1 have zero invariant bilinear forms”.

   **Claim:** These are discriminating Checks of the roadmap's model definition, statable on existing carriers, but neither assertion is proved by an `example`. Specializing the first example to the trivial character constructs one nonzero functional; it does not establish dimension one. The second example concerns a fixed tensor with a nontrivial target, rather than the specified weight representations with trivial target.

   **Witness:** `Mathlib/Analysis/Complex/Circle.lean:53,97` supplies `Circle` and `Circle.coeHom`. For weights (1,1), i acts as −1 on the tensor and +1 on the target. Suggested.lean has no Circle representation or dimension assertion.

   **Exact repair text:** “Extend the two existing `algebraicBesselModel` examples, retaining the two-example limit: prove that evaluation at 1⊗1 identifies the trivial scalar model with ℂ; define the scalar Circle actions z·v=zv and z·w=z⁻¹w locally in the examples, prove multiplication gives a nonzero invariant functional for weights (1,−1), and prove every invariant functional for weights (1,1) is zero by evaluating equivariance at z=i and extending from pure tensors. Include the resulting one-dimensional and zero-dimensional model conclusions. Keep the existing nontrivial-target covariance Checks in these examples.”

2. **F02** (P2) Restrict the global relative-character basis to the source's K-bases

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:1181,1191`: “over an orthonormal basis for the actual Petersson pairing”; “Changing orthonormal or orthogonal bases leaves the distributions unchanged.”

   **Claim:** The definition of Jσ and its basis-independence assertion omit the smooth, K-type-adapted basis restriction. The period of §4.1 is a functional on the smooth cuspidal realization, not a functional on its entire Petersson Hilbert completion. An unrestricted Hilbert basis can contain vectors outside that domain; unrestricted Hilbert changes of basis are not covered by the cited nuclear convergence theorem.

   **Witness:** bpcz line 1167–1186 defines K-bases using the finite-dimensional K-isotypic subspaces and proves absolute convergence and independence for those bases. Section 4.1 defines P only on the smooth realization.

   **Exact repair text:** Replace “over an orthonormal basis for the actual Petersson pairing” by “over an orthonormal smooth K-basis, the union of orthonormal bases of the finite-dimensional K-isotypic subspaces, as in bpcz §2.8.3”. Replace the basis API sentence by “Changing compatible smooth K-bases, or rescaling their vectors with the displayed norm denominators, leaves the distributions unchanged.” Add to the hypotheses: “All basis vectors lie in the smooth automorphic realization; basis convergence uses bpcz Proposition 2.8.4.1.”

3. **F03** (P3) The source-manifest locator breaks when the package is moved

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:1415`: “The manifest packages/GanGrossPrasadUnitaryGroups/sources.toml records the exact legal copies.”

   **Claim:** This locator names the job-board staging directory. The delivered folder is `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/`, so the reader cannot follow that path in the destination repository.

   **Witness:** The manifest is adjacent to README.md in this package. The specified destination preserves that adjacency and changes the repository-relative directory from `packages/` to `TauCetiRoadmap/`.

   **Exact repair text:** “The accompanying [source manifest](sources.toml) records the exact legal copies. The following identifiers govern the locators above; preprint numbering is not silently replaced by publication numbering.”

## Verified sound

Read all 1447 README lines and all 213 Lean lines, the repository rules, source manifest, gap list, latest repair report, and settled-finding markers in earlier reports. Counts: **23 Lean declarations** (6 real-bodied definitions/abbreviations, 5 theorem signatures, 12 proved examples); **40 numbered README target blocks**, their **82 separate API bullets**, and the inline comparison/definition targets; **173 README Check bullets examined**; **112 distinct source anchor locators checked across 16 readable works**; **13 supplied-roadmap contract groups checked**, with the remaining ReductiveGroupsPartII group explicitly a gap; **7 specified comparison-roadmap heads searched**; **36 gap slugs matched** between the README and plan. These are inspection counts, not a claim of Lean compilation or completed analytic proofs.

No mathematical counterexample was found to the five Lean theorem signatures. All necessary typeclass binders are explicit; no section variable is silently omitted. The six definitions use existing carriers. There is one `import Mathlib`, no admitted data or examples, no `set_option`, and no `lemma` declaration. Each definition has exactly two proved examples. The unavailable analytic and packet carriers are left in the README; no forced headline or missing easy endpoint was identified beyond R01's Check coverage.

The split line distinguishes a nonzero vector from a generator, including characteristic 2 in its deliberately broader elementary specialization. The pairing and target-character conventions distinguish i from −i. Component generators count one copy, while the central element counts multiplicity modulo two. Constituent counts (1,1), (2,1), and (0,0) give orders 4, 8, 1 and coefficients 1/4, 1/8, 1. The global theorem excludes the empty-rank test. Local denominators and vector norms have nonvanishing hypotheses; the global central value is never inverted.

The source restrictions checked include JSZ's finite-dimensional-subspace-dependent parameter, Harris's odd-residue intermediate, BPCZ's variable constituent constant and completed Tamagawa measures, and BPLZZ's n>1 stable specialization. The real induction retains the zero companion-lift branches. The split archimedean higher-codimension prediction remains a proposition. The geometric discriminant uses the full H=N⋊U(W); its stated norm determinant is consistent with that choice. The dyadic spherical Checks give C=3 in the split example and C=1 in the nonsplit rank-one example.

The diff from origin/main changes only this package. No package source was edited, no Lean build was run, and no external write was made during this pass. No settled “not actionable in this package” finding was re-raised.

The dependency gate returned exactly:

```text
depcheck: 8 roadmaps, 58 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The relative endpoints remain downstream of their named suppliers. The 36 declared gaps have named owners and matching README/plan slugs; their absence from today's suppliers was not treated as a defect. The real seesaw proof uses decreasing counts, rather than a circular assumption of the equal-rank endpoint.

**Adversarial target ledger.** Each numbered row includes its API assertions, proof-plan inputs, and Check block. “No defect found” means inspection under the written hypotheses, conditional on the declared supplier contracts. It does not certify an unimplemented proof.

| Statement | Instances and assertions tested | Result | Change |
| --- | --- | --- | --- |
| §1.1 RelevantHermitianPair; constructors, rank, congruence, base change, frame extensionality | W=0; ranks 1 and 3; positive definite versus (2,1)/(1,2); split idempotent; identity/composite transport; field extension splitting E | Basis condition and odd rank difference retained; inseparable quadratic algebra and zero ring outside scope | None |
| §1.1 hermitianFieldCarrierEquiv and its five comparison APIs | C-line at (i,1)/(1,i); zero module; Q₂ extension; multiplication by a and its conjugate adjoint | Slot exchange preserves separation, orthogonals and adjoints | None |
| §1.1 hermitianSplitCarrierEquiv and its comparison APIs | A=0; A=F; idempotents; inverse dual scaling (2,1/2); double slot swap; identity/composition | Correct E-module and GL(A) action, including zero rank | None |
| §1.1 splitLineFrame and norm criterion | (1,1), (1,0), (2,1), (2,1/2); F₂ and Q | Unit iff both coordinates nonzero; norm-one restriction correctly absent | None |
| §1.2 besselDatum and five APIs | Empty flag; two simple coordinates; split GL₃ with b=(x,−y); product and conjugation | Embedding injective; b additive; both split character coordinates retained | None |
| §1.3 besselTransport and four APIs | Identity/composite; form negation; generic-character change; both split factors | Conjugacy rather than literal equality; groups unchanged under simultaneous scaling | None |
| §2.1 besselModel and five APIs | Trivial H; inverse/equal U(1) weights; nontrivial target; smooth dual versus full algebraic dual; pure-tensor density | Mathematics correct; elementary dimension and weight Checks absent from Lean | R01 |
| §2.1 linearFirstPairing | i in either slot; arbitrary scalar; zero vectors and zero space | Linear first, conjugate-linear second | None |
| §2.1 algebraicBesselModel and equivariance | Scalar multiplication; translated 1⊗1; target −id; zero source module | Native intertwiner specialization correct; full weight Check still missing | R01 |
| §2.2 adjacent distribution symmetry and two APIs | Rank-one norm-one torus; split upper/lower unipotents; product reversal | c₀g⁻¹c₀ fixes rank-one group; inversion alone fails | None |
| §2.3 adjacent multiplicity | U(0)⊂U(1); ramified Q₂; split GL₂(R); non-tempered irreducibles | Source gives ≤1 without temperedness; smooth/continuous categories retained | None |
| §2.4 finite-place reduction and two APIs | r=1; isotropic residual W=H; forbidden block present/absent; upper-Borel modulus | Y has prescribed rank, need not be maximal; unnormalized induction and dual exclusion retained | None |
| §2.5 archimedean injection and two APIs | r=1; both complement signs; finite-dimensional S; exceptional induction parameter | Parameter may depend on S; injectivity is not asserted at every s | None |
| §2.6 all odd-codimension multiplicity | W=0; compact U(2) standard with U(1) weight 1; two-dimensional hypothetical model | Uniqueness does not assert existence; finite-subspace argument valid | None |
| §2.7 adjacent integrability | Compact rank one; split noncompact pair; trivial non-tempered GL₂×GL₁ | Tempered hypothesis excludes divergent constant integral; log powers fit root decay | None |
| §3.1 epsilon character and four APIs | Empty parameter; χ₁⊕χ₋₁ against 1; repeated χ₁; involution lift; central element | One-copy generator versus multiplicity distinction correct; duality product is −1 in the two-character test | None |
| §3.1 componentCentralElement and character formula | Empty index; multiplicity 2; two generators; sum character | Finite F₂-coordinate formula correct, with finiteness explicit where summed | None |
| §3.2 enhancement transport | Norm t; nonnorm t; t=−1 over R; two successive changes | Even-side generator flips; odd-side label unchanged in the stated test | None |
| §3.3 temperedBesselForm and four APIs | H=1 with mass a; compact matching/mismatching characters; r>0; reducible tempered induction | Raw integral used only in adjacent case; induction claim is for the full representation | None |
| §3.4 geometric multiplicity and four APIs | x=1; x=−1 on C; zero quasi-character; compact U(2) centralizer; proper Levi | No empty-orbit division; zero-dimensional determinant is 1; Δ uses full H | None |
| §3.5 relative local trace formula | W=0; indefinite real form; normalized induction; Lie/group comparison | Source theorem has stated nonsplit tempered scope; general analysis is assigned | None |
| §3.6 packet Fourier identity | με=−1 and +1; identity component element; group Z/2 with transform (1,−1) | Correct factor (1+με)/2 and delta recovery | None |
| §3.7 finite-place packet selection | W=0; ramified Q₂/Q₃; wrong enhancement | No fictitious second zero-space inner form; actual packet premises assigned | None |
| §3.8 real theta reduction; two seesaws and auxiliary epsilon criterion | Counts (2,1)→(1,1)→(1,0); a+b=1 with extra paired summands; compact vanishing input; zero companion lift | Conditional branches and decreasing induction sound; exact OCR formula limitation recorded below | None established |
| §3.8 realSeesawForm and continuity | U(0); occurring oscillator weight; weight shifted by 1; first/second-slot i | Conjugate oscillator and positive/zero compact weight integrals distinguish conventions | None |
| §3.9 real packet theorem | Compact interlacing; opposite line sign; W=0,r=0; higher odd codimension | Generality and normalization transport retained; no unconditional nonzero-lift step | None |
| §3.10 split prediction and its APIs | Empty smaller group; generic and trivial N-character on GL₃; real higher codimension | Proposition status retained; ordinary Jacquet dimension 6 differs from Whittaker dimension 1 | None |
| §3.11 split generic theorem | Finite places, any r; archimedean r=0; split GL₄ higher-codimension character coordinates | Certified range matches GGP 17.2; larger archimedean claim not inferred | None |
| §4.1 global period and its APIs | r=0; rational elements; character value i; right translation; noncompact quotient | Inverse character gives covariance by ν; convergence is on cusp/smooth carriers | None |
| §4.2 local obstruction and factorization | One zero local model; pure reference tensor; finitely many changes; reference rescaling | Normalization divides only by chosen nonzero reference period; no local-to-global converse | None |
| §4.3 tensor L-representation and three APIs | b=0; ranks (2,1); split place; connected-dual restriction | Index two is finite-Galois, dimension 2ab; split factor has both dual terms | None |
| §4.4 global conjecture and three APIs | W=0; local models without central nonvanishing; fixed versus existential inner form | Defined as a proposition; no theorem takes its own conclusion as premise | None |
| §5.1 normalizers and APIs | Split, ramified, dyadic and infinite places; zero global central value; degree 1 Asai signs | Local C is nonzero; global central numerator may vanish; adjoint denominator regularity assigned | None |
| §5.1a split Whittaker period and APIs | n=1; opposite generic characters; Haar/pairing scales a,b; zero/nonzero λ | Raw differential-measure identity has factor ab; source's earlier ζ(1) measure is distinguished | None |
| §5.2 normalized local period and APIs | x=0 excluded from q; zero local model; matching compact weights; pure-tensor density | Form and quotient domains correct; no unsupported blanket positivity assertion | None |
| §5.3 spherical identity and almost-everywhere API | Haar scale 2; nonspherical Steinberg; split Q₂ eigenvalues 1,−1; unramified nonsplit Q₂ | Raw integrals 3 and 1; α=q=1 with stated volumes; all-residue extension is owned here | None |
| §5.4 rescaling | Pairing factor 2; Haar factors 2 and 1/2; global Haar factor 2; vector scalar c | Pairing cancels; global squared period scales by 4, not 2 | None |
| §5.5 all-place product and APIs | Enlarged finite S; zero exceptional factor; nonunit spherical volumes; product-one rescaling | Finite modification of a convergent nonzero volume tail; no central Euler-product inversion | None |
| §6.1 Whittaker relative periods and APIs | Endoscopic constituent count; leading residues of order r_m; λ=0; enlarged S | Uses leading coefficients rather than divergent L(1); central λ allowed zero | None |
| §6.2 global/local relative characters and four APIs | Rank-one operator; zero period; basis rescaling; normalized compact-open projector; non-smooth Hilbert basis | Local trace interchange is assigned and integrable; global basis domain overclaimed | R02 |
| §6.3 star-generic contribution | Relevant/nonrelevant datum; total count 2/3; full split centre | Coefficients 1/4 and 1/8; no diagonal-sign quotient | None |
| §6.3 constituent sign group and coefficient | Counts (1,1),(2,1),(0,0); arbitrary finite types; reindexing | Native cardinality formulas; denominator always positive | None |
| §6.4 isolated comparison and APIs | One prescribed inner form; level restriction; enlarged S; dense archimedean transfer; multiple realizations | Sum retains all actual realizations; no full nonsplit spherical-Hecke lemma assumed | None |
| §6.5 tempered Euler identity | Missing local model; nontrivial local κ with product 1; count (2,1); partial measures | Vanishing branch avoids division; full sign-group inverse retained | None |
| §7.1 adjacent global existence | Endoscopic parameter; rank n=1; non-tempered data; varying inner form | Actual existential theorem, not fixed-pair nonvanishing | None |
| §7.2 stable specialization | Cuspidal degree factors; n>1; no split-supercuspidal place | Stated restriction matches BPLZZ; imported as corollary of §7.1 | None |
| §7.3 refined proposition and polarization APIs | Counts 2/3; zero central value; mixed vectors; compatible product pairings | Conjecture interface is separate from proof; linear-first polarization consistent | None |
| §7.4 GGP.8 and APIs | Stable/endoscopic counts; zero local or global factor; vector and Haar rescaling; infinite/bad places | Completed Tamagawa identity matches source scope; no good-prime shortcut | None |

**Lean declaration/context ledger.** Namespace throughout: `TauCetiRoadmap.GanGrossPrasadUnitaryGroups`; universes u,v,w; no section variables or `include` context. Locations below are lines in `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`.

| Line | Declaration and layer | Explicit variables and instances | Instance test / result |
| --- | --- | --- | --- |
| 21 | splitLineFrame, L1 | F:Type u, Field F; e:F×F | IsUnit specialization; F₂ and Q |
| 25 | splitLineFrame_iff_norm_ne_zero, L1 | Same field context and e | Product nonzero iff both coordinates units; true |
| 32 | example, L1 | F:Type u, Field F; local Q-pairing | Unit/norm 1 and 2; inverse versus simultaneous scaling; proof inspected |
| 43 | example, L1 | F:Type u, Field F; local two pairings | Nonzero idempotent fails frame; cross-values and orthogonal equation; proof inspected |
| 55 | linearFirstPairing, L2 | V:Type v, NormedAddCommGroup V, InnerProductSpace C V; x,y | Swapped native inner product; no hidden completeness |
| 59 | example, L2 | Concrete C | i versus −i; proof inspected |
| 65 | example, L2 | Same inner-product instances; c:C; x,y:V | Scalar and zero identities, including zero module; proof inspected |
| 75 | algebraicBesselModel, L2 | H:Type u, Group H; V:Type v,W:Type w, AddCommGroup and Module C on each; ρV,ρW,ν:C-line representation | Native tensor intertwiner, no topology asserted |
| 84 | algebraicBesselModel_equivariant, L2 | Same context; ℓ:model; h:H; v:V; w:W | Direct intertwiner equation; true even for zero modules |
| 95 | example, L2 | H,Group H; ν:C-line representation | Multiplication, values 1 and i; proof inspected; dimension/weights absent (R01) |
| 108 | example, L2 | Full model context; ℓ,h,v,w; hv,hw fixed-vector equations; hν=−id | Equation forces 2ℓ(v⊗w)=0; proof inspected; not the U(1) weight Check |
| 126 | componentCentralElement, L3 | I:Type u; multiplicity:I→N | Coordinates modulo two; no finiteness needed for definition |
| 131 | componentCentralElement_character, L3 | I,Fintype I,DecidableEq I; multiplicity; additive χ | Finite coordinate expansion; empty sum and multiplicity 2 checked |
| 139 | example, L3 | I=Fin 1 | Central element zero, generator nonzero; proof inspected |
| 150 | example, L3 | Concrete Fin 2 and Fin 0; explicit additive sum χ | χ(e₀)=χ(e₁)=1, χ(z)=0; empty group; proof inspected |
| 171 | unitaryConstituentSigns, L6 | I:Type u,J:Type v | Function type on sum; finite hypothesis required only by count theorem |
| 174 | unitaryConstituentSigns_card, L6 | I,J; Finite I,Finite J | Nat.card=2^(card I+card J); empty and nonempty cases |
| 180 | example, L6 | Fin 1,Fin 1 | Cardinality 4; proof inspected |
| 185 | example, L6 | Fin 2,Fin 1 and Fin 0,Fin 0 | Cardinalities 8 and 1; proof inspected |
| 191 | unitaryConstituentCoefficient, L6 | I,J; Finite I,Finite J | Complex inverse of positive finite group cardinality |
| 197 | unitaryConstituentCoefficient_eq, L6 | Same finite context | Inverse power of two; no omitted instances |
| 204 | example, L6 | Fin 1,Fin 1 | Coefficient 1/4; proof inspected |
| 209 | example, L6 | Fin 2,Fin 1 and Fin 0,Fin 0 | Coefficients 1/8 and 1; proof inspected |

**Source locator ledger.** Each number below is a distinct checked anchor in the cached legal extraction, in the format “source id line N”. The count includes definitions, hypotheses and normalization passages as well as numbered theorems. Formula details obscured by Xue's OCR are separately excluded below.

| Source id | Checked line anchors |
| --- | --- |
| ggp | line 179, line 229, line 272, line 510, line 598, line 728, line 1567, line 1624, line 1637, line 2020, line 2051, line 2071, line 2152, line 2229, line 2398, line 2425, line 2503, line 3026, line 3077, line 3175, line 3184 |
| agrs | line 39, line 59, line 80, line 220 |
| sun-zhu | line 49, line 66 |
| bp-unitary-tempered | line 5003, line 5284, line 5429 |
| bp-arch | line 3984, line 3999, line 6627, line 6775, line 6813, line 7165, line 10054, line 10204, line 10248, line 10538, line 10551, line 11200 |
| bp-refined | line 2626, line 2869, line 2888 |
| harris | line 75, line 132, line 149, line 170, line 250, line 1289 |
| bplzz | line 128, line 157, line 185 |
| bpcz | line 96, line 124, line 148, line 179, line 679, line 1167, line 3040, line 3070, line 4122, line 4152, line 4225, line 4245, line 4749, line 4755, line 4835, line 4873, line 4889, line 4918, line 4935 |
| jsz-bessel | line 24, line 207, line 215, line 260, line 268, line 652 |
| bp-plancherel | line 4480, line 4485, line 4734, line 4741 |
| zhang-period | line 656, line 675, line 962, line 982, line 1437, line 1523, line 1543 |
| bernstein-zelevinsky | line 329 |
| bp-fundamental | line 99 |
| ag-descent | line 406, line 583, line 596, line 1189 |
| xue-real | line 63, line 213, line 238, line 267, line 384, line 594, line 677, line 848, line 873, line 893, line 983, line 1024, line 1067, line 1098, line 1172, line 1188 |

**Supplier/ownership ledger.** All paths below are repository-relative. The seven comparison heads named in the brief were used for their respective folders; none is consumed here. The additional open supplier snapshots were read from repository refs at 7b84aae1 (Adelic), bc8af0ce (AutomorphicForms), 691b4b33 (AutomorphicLFunctions), 7d326fdb (AutomorphicSpectral), f8f8c2b0 (EndoscopicTransfer), 01c64f0c (GeometryOfNumbers), 297a40c9 (Metaplectic), 393335a9 (ModularityAndLanglands), and 28803294 (SmoothRepresentations). Searches of active and Completed roadmaps and the two pinned libraries found no additional duplicate owner of the relative endpoints.

| Supplier | Concrete sections/names inspected | Result |
| --- | --- | --- |
| ReductiveGroups | `TauCetiRoadmap/ReductiveGroups/README.md`, Layers 0,3,5,7; parabolic/Levi statement at line 632 | Generic group and flag infrastructure present |
| GlobalNumberFields | `TauCetiRoadmap/GlobalNumberFields/README.md:412`, Layers 4–6 and 8 | Arithmetic adelic carriers and extension maps present |
| RestrictedProducts | `Completed/RestrictedProducts/README.md:248`, Layers 0–3 | Reference families, maps, decomposition and diagonals present |
| NoncommutativeGeometry | `TauCetiRoadmap/NoncommutativeGeometry/README.md`, N1 | Completed projective tensor and dense algebraic image present |
| GeometryOfNumbersAndQuadraticArithmetic | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1184`, §2.9 and named adjoint API | Field carrier not limited by odd-residue classification hypotheses |
| SmoothRepresentationsOfLocalGroups | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, SR.0.1–0.4, SR.2.1–2.3, SR.3.1–3.3, SR.4.1–4.2, SR.5 | Stated generic constructions present; supplements declared as gaps |
| AutomorphicFormsOnReductiveGroups | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:431`, §§2.6–2.7 and automorphic realization sections | Archimedean genericity, globalization and seminormEstimate distinguished from relative supplements |
| AutomorphicSpectralTheory | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md`, Layers 0–4,6 | General spectral theory present; local relative extensions/multipliers declared |
| ModularityAndLanglandsExtensions | `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md`, §§3.13,3.15,3.20,5.1,5.4 | Conditional classification interfaces not passed off as unconditional theorem; gap supplies additional actual packet properties |
| EndoscopicTransferAndUnitaryTraceComparison | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4140`, Layers 2–5, §§11.2–11.4 | Ordinary interfaces separate from relative continuation and enhanced classification |
| MetaplecticAutomorphicForms | `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:608`, §3.2a; §§0.18,3.3–3.6 | Split carrier present with conjugate-first convention; comparison owned here |
| AdelicAlgebraicGroups | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, §§0.1–0.3,1.1–1.5,2.2–2.5 | General measure carriers present; BPCZ normalization supplement remains explicit |
| AutomorphicLFunctionsAndLocalFactors | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1959,2048,2306`, AL.3 WhittakerModel, RsLocalFactor and NormalizedRsPeriod | Imported API names and adjacent exponent shift present; differential-Haar comparison declared |
| ReductiveGroupsPartII | gap:hermitian-unitary, RG2.4 | Declared requested contract; not counted as a currently supplied theorem |

Pinned object searches checked `LinearMap.Nondegenerate`, `LinearMap.flip_nondegenerate`, `Submodule.orthogonalBilin`, `Submodule.mem_orthogonalBilin`, `Representation.IntertwiningMap`/`ext`/`isIntertwining`, `Representation.tprod`/`tprod_apply`/`dual`, `Matrix.unitaryGroup`, `Prod.isUnit_iff`, `Nat.card_fun`, `Nat.card_sum`, the complex inner-product identities, `LinearMap.mul'`, `TensorProduct.map_tmul`, and `TauCeti.HopfAlgebra.pointsFunctor`. The points functor is convolution-valued, and the matrix unitary group only covers the identity Gram matrix. The relative specializations do not replace these generic constructions.

## Not verifiable

- **Lean elaboration:** not run, as required by the read-only pass. All signatures, binders and example proof bodies were inspected; this report makes no new build claim.
- **Fine Xue typography:** xue-real's cached OCR scrambles several conjugation bars and exponents in equations (3.11)–(3.15) and Proposition 3.6 (xue-real line 563–587 and line 876). The locators, rank conditions, nonzero-lift branches, signature-count mechanism and induction structure were checked; those exact printed signs could not all be independently certified from this extraction. The legal PDF is already available; no missing-source request is needed.
- **Waived work:** xue-bessel remains waived. No result was inferred from it and no renewed request was made.
- **Declared supplier gaps:** the 36 contracts remain mathematical prerequisites, not existing declarations verified by this pass. Their declaration and direction were checked. Acceptance of the package's eventual theorems is conditional on discharging those contracts.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d0e51ae93d65e9cb9006b22b05083ec1ce311977", "job": "RT-GanGrossPrasadUnitaryGroups~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
