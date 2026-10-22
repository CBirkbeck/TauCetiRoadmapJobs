<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/625#issuecomment-6335465878 -->
Red team round 2 pass a (codex) of 1211519

Verdict: accepted

## Verification of round-one findings

| Earlier finding | Status at 1211519 | Repaired passage and witness |
| --- | --- | --- |
| r1a F01: incomplete model Checks | Repaired | `packages/GanGrossPrasadUnitaryGroups/README.md:369`: “evaluation at 1⊗1 is a linear equivalence of the model with ℂ”; line 371 adds the Circle dimensions. `packages/GanGrossPrasadUnitaryGroups/Suggested.lean:79` proves the evaluation equivalence and finrank 1; line 120 proves inverse weights have finrank 1 and equal weights have finrank 0. The argument at i forces 2f(1⊗1)=0. |
| r1a F02: arbitrary global Hilbert bases | Repaired | `packages/GanGrossPrasadUnitaryGroups/README.md:1181`: “over an orthonormal smooth K-basis”; line 1183 puts every vector in the period domain, and line 1191 restricts changes to compatible smooth K-bases. The negative control at line 1209 rejects nonsmooth basis vectors. Source verification follows below. |
| r1a F03: staging manifest path | Repaired | `packages/GanGrossPrasadUnitaryGroups/README.md:1417`: “The accompanying [source manifest](sources.toml) records the exact legal copies.” The adjacent file exists and the relative link survives the specified destination move. |
| r1b F01: four admitted native wrappers | Repaired by deletion | `packages/GanGrossPrasadUnitaryGroups/README.md:54`: “No general counting theorem is a target here.” Line 387 imports native intertwiner evaluation. The deleted names are `splitLineFrame_iff_norm_ne_zero`, `algebraicBesselModel_equivariant`, `unitaryConstituentSigns_card` and `unitaryConstituentCoefficient_eq`; none occurs in either current file. Native declarations are checked below. |
| r1b F02: RestrictedProducts path | Repaired | `packages/GanGrossPrasadUnitaryGroups/README.md:69`: “From [RestrictedProducts](../../Completed/RestrictedProducts/README.md) (completed)”. Line 71 imports the completed Layers 0–3. `Completed/RestrictedProducts/README.md` is the destination repository owner. |
| r1b F03: proper names in title | Repaired | `packages/GanGrossPrasadUnitaryGroups/README.md:1`: “Roadmap: unitary Bessel models and the Gan–Gross–Prasad period formula”. |
| r1b F04: successor naming | Not repaired; settled, not re-raised | `packages/GanGrossPrasadUnitaryGroups/README.md:19` retains “GanGrossPrasadUnitaryGroups, Part II”. The repair report marks successor ownership “not actionable in this package” pending a board decision. This is downstream scope, with no prerequisite or mathematical endpoint inferred from the proposed successor. The reason does not create a defect in this package's supply direction. |


No new S-series finding was established. Acceptance is conditional on the declared supplier contracts, not a claim that those contracts are implemented.

## Verified sound

Read all 1,449 lines of `packages/GanGrossPrasadUnitaryGroups/README.md` and all 292 lines of `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`. The declaration count is 19: six real-bodied definitions/abbreviations, one admitted theorem, and twelve proved examples. The target audit covers all 40 numbered target sections, their subordinate APIs and the additional definitions listed below. Reviewed 169 Check bullets in 50 Check blocks. Verified the primary locators for the 40 numbered targets against the available source texts; the source ledger below records supporting anchors across 16 readable works. The seventeenth work is waived. Checked 14 roadmap supplier subsections, including the completed supplier, and searched all seven specified independent sibling heads for overlapping objects.

The README and Lean agree on the scope of the six retained definitions. Each has two proved examples, with multiple assertions where needed. The examples test these definitions rather than substitute an admitted endpoint. The analytic local/global headlines require missing supplier carriers; no missing easy headline or forced substitute was identified. The finite component-character identity is correctly stated on existing carriers.

### Declaration and instance ledger

All locations in this table refer to `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`. There are no section `variable` or `include` declarations. Universes are `u v w`; each necessary instance appears in the declaration's own binders. Mathematical truth and proof bodies were inspected without executing Lean.

| Line / section | Declaration | Variables and instances actually in scope | Instances tried; result |
| --- | --- | --- | --- |
| 21 / 1.1 | `splitLineFrame` | `F : Type u`, `Field F`, `e : F × F` | Units require both coordinates nonzero; valid in characteristic two as well as zero. |
| 26 / 1.1 | First frame example | Arbitrary field F; rational pairing separately bound by `let` | (1,1), (2,1), (2,1/2); norms 1,2,1. Inverse-dual scaling preserves the cross-pairing; simultaneous scaling gives 4. |
| 37 / 1.1 | Second frame example | Arbitrary field F; explicit h and swapped k | (1,0) is nonzero but is not a unit. Cross-pairings are (1,0) and (0,1); the displayed orthogonal equation is correct. |
| 49 / 2.1 | `linearFirstPairing` | `V : Type v`, `NormedAddCommGroup V`, `InnerProductSpace ℂ V` | Slot exchange gives linear-first convention; completeness and finite dimension are unnecessary. |
| 53 / 2.1 | Scalar pairing example | Native complex inner-product structure | Values at (i,1) and (1,i) are i and −i. |
| 59 / 2.1 | Pairing laws example | Same V instances; `c : ℂ`, `x y : V` | First scalar c, second scalar conjugate(c), and both zero arguments agree with the definition. |
| 69 / 2.1 | `algebraicBesselModel` | `H : Type u`, `Group H`; V/W additive commutative groups and ℂ-modules in universes v/w; three specified representations | The tensor and target character actions are actual native representations. No analytic claim is smuggled into the abbreviation. |
| 79 / 2.1 | Scalar model example | Arbitrary H group and complex-line representation ν | Evaluation at 1⊗1 and scalar multiplication are inverse; finite dimension one follows from the equivalence, including trivial H. |
| 120 / 2.1 | Circle and fixed-tensor example | Native Circle; explicit ρ, inverse ρ, trivial τ; final clause explicitly quantifies H,V,W and their instances | Weights (1,−1) give dimension one. Weights (1,1) give zero, since i acts by −1. A fixed tensor with target action −id maps to zero. |
| 219 / 3.1 | `componentCentralElement` | Arbitrary `I : Type u`, `multiplicity : I → ℕ` | Pointwise parity is defined even for infinite I; no finite-sum assertion here. |
| 224 / 3.1 | `componentCentralElement_character` | `Fintype I`, `DecidableEq I`, multiplicity, actual additive homomorphism χ | Empty index, one coordinate of multiplicity two, and two odd coordinates satisfy expansion in the F₂ coordinate basis. An additive homomorphism is F₂-linear here. |
| 232 / 3.1 | Repeated-constituent example | `Fin 1`, `ZMod 2` | Multiplicity two kills the central coordinate without killing its component generator. |
| 243 / 3.1 | Two-coordinate/empty example | `Fin 2`, `Fin 0`, explicitly constructed additive χ | χ is one on either generator and zero on their sum; empty central element is zero. |
| 264 / 6.3 | `unitaryConstituentSigns` | Arbitrary `I : Type u`, `J : Type v` | Both summands remain present; no quotient by diagonal signs. |
| 267 / 6.3 | Stable cardinality example | `Fin 1`, `Fin 1` | Four sign functions. |
| 272 / 6.3 | Endoscopic/empty cardinality example | `(Fin 2, Fin 1)` and `(Fin 0, Fin 0)` | Eight and one sign functions respectively. |
| 278 / 6.3 | `unitaryConstituentCoefficient` | I,J with `Finite I`, `Finite J` | The sign group is finite and inhabited, so its cardinal is positive. Inverting its complex cardinal introduces no zero denominator. |
| 283 / 6.3 | Stable coefficient example | Two singleton index types | Coefficient 1/4. |
| 288 / 6.3 | Endoscopic/empty coefficient example | Three and zero total constituents | Coefficients 1/8 and 1; the empty test does not assert a rank-zero global theorem. |

### Adversarial statement table

Locations in this table refer to `packages/GanGrossPrasadUnitaryGroups/README.md`. “Retain” means no change justified by the tested instances; it does not mean an analytic proof was executed. The checks include each section's named API, not only its heading.

| Statement / location | Instances and failure modes tried | Result | Change |
| --- | --- | --- | --- |
| Conventions, 23–42 | Zero ranks; split E; dyadic fields; real line signs; first/second slots; ν versus ν⁻¹; full constituent signs | Algebraic characteristic ≠2 is distinct from residue characteristic two. Local analytic field is characteristic zero. Period and Hom transformations agree. | Retain |
| 1.1 `RelevantHermitianPair`, 207 | W=0 and a line; rank-three hyperbolic-plus-line; positive-definite rank three; splitting extension; nonzero split zero divisor | Rank increment is 2r+1. Frame requires a basis vector, not merely a nonzero vector. Definite rank three fails the r=1 test. | Retain |
| `hermitianFieldCarrierEquiv`, 215 | Complex scalar i; zero module; dyadic quadratic field; adjoint of multiplication by 2 | Slot exchange preserves the adjoint, not its inverse. Both separation directions and orthogonals are retained. | Retain |
| `hermitianSplitCarrierEquiv`, 225 | A=0; split idempotents; inverse-dual scaling by (2,1/2) | Perfectness is not confused with nonisotropic vectors. GL(0) is trivial and slot formulas have the stated chirality. | Retain |
| `splitLineFrame`, 261 | (1,1), (1,0), (2,1); characteristic two | The rational norm-two test does not impose a characteristic-zero restriction on the predicate. | Retain |
| 1.2 `besselDatum`, 271 | Empty flag r=0; two root coordinates; split GL₃ with b=(x,−y) | Relative embedding and additive character respect multiplication; no genericity condition survives on an empty unipotent. | Retain |
| 1.3 `besselTransport`, 303 | Identity/composition; simultaneous negation of real forms; changing only the character | Correct transport changes all corresponding data. A character change alone does not give an intertwiner. | Retain |
| 2.1 `besselModel` and `besselMultiplicity`, 345 | Trivial scalar model; Circle weights; zero Hom; completed tensor at infinity | Dimension begins as a cardinal. Finrank comparison explicitly requires finite dimension. Density is used only for continuous functionals. | Retain |
| `linearFirstPairing`, 377 | (i,1), (1,i), scaling, zero vectors | Pairing sign and conjugate slot agree with the period convention. | Retain |
| `algebraicBesselModel`, 387 | Character times trivial line; opposite/equal Circle weights; fixed tensor and target −1 | Correct dimensions 1,1,0; equivariance is imported from the native carrier. | Retain |
| 2.2 distribution symmetry, 397 | Rank-one identity; upper/lower triangular matrices; attempted identity anti-involution | Split transpose reverses multiplication. The identity map is not used as an anti-involution for a noncommutative group. | Retain |
| 2.3 adjacent multiplicity, 423 | Smaller rank zero; dyadic U(2); real split GL₂ | Irreducibility/category hypotheses are present. Statement is an upper bound and does not assert distinction. | Retain |
| 2.4 finite-place reduction, 443 | r=1; extra isotropy in W; nonsupercuspidal endpoints; excluded Bernstein block; normalized versus unnormalized induction | Auxiliary rank r+1, π_V dual, support exclusion and δ_P^(-1/2) are consistent. Y is not falsely required to be maximal isotropic. | Retain |
| 2.5 archimedean injection, 473 | r=1; both real signs; finite-dimensional S; bad induction parameter | The injection is on S; its half-plane may depend on S. Generic irreducibility is used only after choosing a parameter there. | Retain |
| 2.6 multiplicity one, 499 | W=0 Whittaker case; both signs; compact U(2) with unmatched weight | Zero multiplicity is allowed. Reduction uses the preceding two targets, not a forward nonvanishing claim. | Retain |
| 2.7 adjacent integrability, 519 | Compact U(1); noncompact split GL₂/GL₁; trivial nontempered GL₂ | Temperedness is essential and present. The nontempered test correctly diverges. | Retain |
| 3.1 epsilon character, 549 | Empty parameter; two characters χ₁,χ₋₁; repeated χ₁ | One-copy generator and multiplicity-weighted central element are distinct. The two-generator product is −1 in the stated convention. | Retain |
| `componentCentralElement`, 579 | Empty index; multiplicity two; two odd coordinates | Mod-two multiplicities, rather than the all-ones vector in general, give the central element. | Retain |
| 3.2 enhancement transport, 589 | Norm scalar; nonnorm scalar; even/odd dimensions; t=−1 over ℝ | Determinant change gives the stated parity effect; norm changes are trivial. | Retain |
| 3.3 regularized Bessel form, 609 | H=1; compact matching/mismatching characters; r=0 versus r>0; full induction | Only r=0 is identified with the raw convergent integral. Higher-rank regularization and full-induced-representation hypotheses are retained. | Retain |
| 3.4 geometric multiplicity, 639 | Identity moving quotient; x=−1 over ℂ/ℝ; zero quasi-character; compact U(2) centralizer | Empty determinant is one; Δ(−1)=4; empty regular nilpotent-orbit set contributes zero, not an undefined average. | Retain |
| 3.5 local trace formula, 675 | Rank-zero smaller group; noncompact tempered spectrum; induced term | Geometric and spectral carriers are actual supplied objects. Proper-Levi induction uses the indicated GL germ. | Retain |
| 3.6 packet Fourier identity, 695 | Wrong/right inner form; order-two component group | Fourier transform (1,−1) selects the nontrivial character; the factor (1+με)/2 imposes relevance. | Retain |
| 3.7 finite local packet theorem, 715 | W=0; dyadic field; nontrivial component character | Unique distinguished enhancement is across the relevant inner forms; no second zero-dimensional inner form is invented. | Retain |
| 3.8 real theta reduction, 735 | a+b=1; a+b decreases by two; zero theta branch; b≥2 added non-self-dual hyperbolic pair | Uses small theta and explicit signature formulas. Does not infer irreducibility of every big theta lift. | Retain |
| `realSeesawForm`, 741 | Zero input; occurring compact oscillator weight; shifted absent weight | Conjugate oscillator pairing and μ⁻¹ in the epsilon criterion agree with the source formulas. | Retain |
| 3.9 real packet theorem, 771 | Compact interlacing; negative complementary line; W=0; higher odd codimension | Both signs are retained via transport; higher-rank induction uses GL_(r+1). | Retain |
| 3.10 split prediction, 791 | GL₁/GL₀; adjacent pair; trivial GL₂; regular unitary GL₃ principal series | Higher archimedean assertion remains a proposition. Trivial GL₂ is not tempered/generic; ordinary unipotent Hom has dimension 6 versus Whittaker dimension 1. | Retain |
| 3.11 split nonvanishing, 823 | Adjacent all-place case; finite-place gap three; real higher-gap model | Only the certified range is a theorem. Continued normalized Rankin–Selberg functionals handle raw integral poles. | Retain |
| 4.1 global period, 853 | Inverse character; r=0; a character nontrivial on rational points | Integral descends only for the rationally trivial character. Right translation gives ν, matching the local Hom. | Retain |
| 4.2 local obstruction, 883 | One zero local model; two scalar factors; rescaled reference vector | Local vanishing implies global vanishing. Density and continuity justify extraction of a nonzero pure-tensor value; no false converse. | Retain |
| 4.3 tensor L-representation, 903 | One degree zero; split extension; degrees (2,1) | Induction across the index-two subgroup has dimension 2ab=4; split central value is a product with its dual, hence absolute square under unitarity. | Retain |
| 4.4 global conjecture, 931 | W=0; vanishing central value despite local models; fixed versus varying inner form | Everywhere tempered and multiplicity-one hypotheses stay in the conjecture. It is not used as a proved input. | Retain |
| 5.1 normalizer, 969 | n=1; split place; central global zero | Δ has n+1 factors. Local constants are nonzero by a declared regularity contract; no division by the global central value. | Retain |
| 5.1a split Whittaker period, 999 | Rank one; independent Haar changes a,b; nonzero vector in kernel | Differential GL measure has exponent −n. Raw identity rescales by ab and asserts nonzero functional, not nonzero value on every vector. | Retain |
| 5.2 normalized local period, 1025 | Compact case; zero vector; scalar multiples; dense algebraic tensor and discontinuous counterexample | Normalized quotient is restricted to nonzero vectors. Nonvanishing and extension rely on continuity in the specified topology. | Retain |
| 5.3 spherical evaluation, 1059 | Unit/scaled hyperspecial volume; ramified data; split and nonsplit dyadic n=1 | No spherical vector is asserted at bad data. Harris's odd-residue calculation is not passed off as a dyadic proof; the extension is an owned target. | Retain |
| 5.4 rescaling, 1087 | Pairing scale 2; two local Haar scales with product 1; global subgroup scale a | Local pairing cancels in the quotient. Global period square scales by a², so arbitrary global measure changes are not claimed invariant. | Retain |
| 5.5 all-place product, 1107 | All spherical; one zero factor; enlarged exceptional set | Finite modification of the convergent nonzero volume tail is well-defined. A zero local factor yields zero; no central-value Euler product is assumed convergent. | Retain |
| 6.1 global Whittaker periods, 1147 | Two constituents; zero input; zero central value | Leading coefficients use the exact constituent pole order. Asai sign, norm residue and central-value continuation are not interchanged. | Retain |
| 6.2 relative characters, 1179 | Rank-one operator; zero period; rescaled orthogonal smooth K-basis; nonsmooth Hilbert vector; local smoothing tensor | Repaired basis/domain restriction matches BPCZ. Norm denominators and absolutely convergent expansions are explicit. | Retain repair |
| 6.3 spectral contribution, 1215 | Two/three total constituents; nonrelevant star-generic datum | Full split centre gives 1/4 and 1/8. Relevance is an additional predicate on the actual cuspidal datum. | Retain |
| Constituent sign group/coefficient, 1235 | Singleton/singleton; two/singleton; empty/empty | Orders 4,8,1 and reciprocals agree with both Lean and the full-centre formula. | Retain |
| 6.4 isolated comparison, 1245 | No auxiliary supercuspidal place; zero transfers to other forms; full centre | Sum remains over actual base-change classes. Dense infinite-place transfer and exact finite-place support conditions are kept. | Retain |
| 6.5 Euler identity, 1271 | Zero local model; product of κ factors; endoscopic constituent count | Zero case does not divide by a period. κ-product and partial convergence factors are handled by declared comparisons. | Retain |
| 7.1 adjacent nonvanishing, 1301 | n=1; wrong fixed inner form; endoscopic Π | Existence varies the relevant inner form. No everywhere-tempered hypothesis is imposed on this endpoint. | Retain |
| 7.2 stable nonvanishing, 1321 | One constituent per degree; bad/infinite places; n=1 boundary | Its n>1 source scope is stated; n=1 follows from 7.1 rather than an unsupported BPLZZ attribution. | Retain |
| 7.3 refined conjecture proposition, 1341 | Stable/endoscopic coefficient; zero vector; independent pairing and Haar rescaling | Quantifiers, nonzero vector domain and polarization use the stated pairings; conjecture truth is not a hypothesis of 7.4. | Retain |
| 7.4 `GGP.8`, 1369 | Scalar/vector scaling; Tamagawa Haar factorization; three constituents; zero central value | Coefficient and completed factors match the source. Only positive vector norms and the nonzero adjoint value are inverted. | Retain |

Zero rings and inseparable quadratic extensions are excluded by the field/quadratic-étale hypotheses; equal-characteristic local fields are excluded from the analytic claims. Residue characteristic two is not excluded. A residue cardinality of one is not an allowed local field. No scheme/properness statement in this package imports an unstated Noetherian or quasi-separated hypothesis.

### Sources checked

These are source locators, not copied passages. Numbering was checked against the versions recorded in `packages/GanGrossPrasadUnitaryGroups/sources.toml`.

| Source | Verified anchors and use |
| --- | --- |
| `ggp` | ggp line 179 (slot convention), line 229 (relative geometry), line 510 and line 720 (components and epsilon character), line 1567 and line 1593 (frames and Bessel character), line 2051 (Hom), line 2152 and line 2229 (finite-place reduction), line 2394 (split genericity), line 2503 (transport), line 3026 and line 3036 (global L-representation and period), line 3175 (conjecture). |
| `agrs` | agrs line 59 and line 66 (multiplicity), line 80 (distribution assertion), line 215 (unitary anti-involution). Characteristic-zero scope includes dyadic fields. |
| `sun-zhu` | sun-zhu line 49 and line 66 (archimedean distribution/multiplicity). The continuous smooth-dual comparison is an explicit supplier contract. |
| `jsz-bessel` | jsz-bessel line 24 (uniqueness), line 190 and line 207 (induction convention), line 215 (generic irreducibility), line 260 (finite-dimensional injection), line 652 (Whittaker decay). |
| `bp-unitary-tempered` | bp-unitary-tempered line 4994 and line 5003 (geometric multiplicity identity). Local Hom duality conventions were compared rather than silently identified. |
| `bp-arch` | bp-arch line 3994 (Δ), line 6735 and line 6780 (regularized forms), line 6813 and line 7165 (nonzero criterion), line 10054 and line 10204 (geometric expression), line 10538 and line 10551 (multiplicity/local trace), line 11200 (packet uniqueness). |
| `bp-refined` | bp-refined line 2626 (epsilon data), line 2855 (packet theorem), line 2880 (finite Fourier identity and inner-form factor). Packet/endoscopic hypotheses are discharged through named contracts, not erased. |
| `xue-real` | xue-real line 179 and line 213 (real local theorem), line 267 (reduction), line 561 and line 893 (theta parameter formulas), line 848 (seesaw form), line 983 (conditional branches), line 1098 and line 1188 (induction). The cached legal PDF was also inspected at published pp.1010–1011 and 1019 to resolve OCR ambiguity in the epsilon characters, conjugate additive character and conjugate oscillator coefficient. |
| `harris` | harris line 75 and line 132 (pairings/refinement), line 170 (odd-residue scope), line 230 (integrability), line 1289 (spherical formula). The new dyadic comparison is not attributed to this restricted calculation. |
| `bplzz` | bplzz line 127 and line 157 (n>1 stable endpoint), line 185 (refined identity). The package's rank-one endpoint instead comes from BPCZ. |
| `bpcz` | bpcz line 96 and line 124 (Hermitian data/nonvanishing), line 148 and line 179 (normalizer/refined identity), line 679 (measures), line 1167 and line 1185 (smooth K-bases/nuclear convergence), line 3040 and line 3066 (relative character/spectral contribution), line 4122 (global periods), line 4225 and line 4243 (character factorization), line 4694 (unitary character), line 4749 and line 4755 (isolated comparison), line 4835 and line 4865 (global endpoints). The package uses positive cardinal 2^(r_total), not the inverted cardinal printed at bpcz line 4945; it also uses the correct GL differential exponent −n instead of the problematic general-rank expression at bpcz line 706. |
| `bp-plancherel` | bp-plancherel line 4480 (transfer) and line 4734 (spectral comparison). Haar changes are an explicit contract; no constant is imported across different measure conventions without comparison. |
| `zhang-period` | zhang-period line 424 (Haar/Whittaker conventions), line 656 (spherical transfer), line 962 (pairing), line 1437 (Fourier identity), line 1523 and line 1543 (split period computation). |
| `bernstein-zelevinsky` | bernstein-zelevinsky line 329 (geometric filtration). The README asks for the regular unitary GL consequence as a supplement and does not mislabel a filtration as a canonical splitting. |
| `bp-fundamental` | bp-fundamental line 99 (unramified fundamental lemma including small residue characteristic). No large-residue qualification is added to the gap. |
| `ag-descent` | ag-descent line 406, line 583 and line 1189 (descent, adapted Fourier/homogeneity inputs and criterion). The contract does not assert unrestricted homogeneity of arbitrary distributions. |

### Ownership, contracts and direction

The checks below use the supplied main checkout and local read-only supplier heads. No revised version of an existing main roadmap is substituted as a prerequisite. The field adjoint and split carrier already have owners; this package owns their slot-convention comparisons after both suppliers.

| Supplier | Locator checked / relevant ownership boundary |
| --- | --- |
| ReductiveGroups | `TauCetiRoadmap/ReductiveGroups/README.md:129`, 234, 443, 627: points dictionary, closed subgroups, unipotents, all-field parabolic Levi decomposition. |
| GlobalNumberFields | `TauCetiRoadmap/GlobalNumberFields/README.md:412`, 423, 438, 470: adeles, diagonals, finite-extension maps and topological base change. |
| RestrictedProducts | `Completed/RestrictedProducts/README.md:206`, 269, 307, 361: coordinate/reference/finite-place/diagonal interfaces. The package imports compact-open references and does not infer a Tamagawa measure. |
| ReductiveGroupsPartII | RG2.4 is explicitly a requested supplement, `gap:hermitian-unitary`. Field carriers/adjoints are excluded; no nonexistent arbitrary-form theorem is presented as available. |
| GeometryOfNumbersAndQuadraticArithmetic | Head `01c64f0c`, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1184`: field carrier and adjoints explicitly apply beyond the odd-residue classification heading. |
| MetaplecticAutomorphicForms | Head `297a40c9`, `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:604`: §3.2a supplies the split carrier, conjugate-first pairing and inverse-dual GL action. Real overlap estimates and exact tempered signatures remain named supplements. |
| SmoothRepresentationsOfLocalGroups | Head `28803294`, SR.0–SR.5; `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:3646` onward supplies derivatives and the Schwartz injection. Its injection is not already the requested supercuspidal restriction isomorphism. SR.2.2 supplies a Jacquet filtration, not the additional normalized regular-unitary comparison. |
| NoncommutativeGeometry | `TauCetiRoadmap/NoncommutativeGeometry/README.md:85`, N1: Hausdorff completed projective tensor with the continuous bilinear universal property and complete target. |
| AutomorphicFormsOnReductiveGroups | Head `bc8af0ce`, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:431` and 448: genericity criterion, `HasWhittakerModel`, smooth topology, nuclearity and `seminormEstimate`. Relative smooth-dual and vector-valued decay comparisons are separate gaps. |
| AutomorphicSpectralTheory | Head `7d326fdb`, Layers 0–4 and 6: general automorphic spectral objects. The local distribution, germ, Plancherel, smoothing and multiplier continuations are explicitly requested Part II contracts. |
| ModularityAndLanglandsExtensions | Head `393335a9`, §§3.13, 3.15, 3.20, 5.1 and 5.4: parameter/packet/base-change direction. The stronger actual enhanced all-inner-form and Hermitian discrete comparisons are declared gaps. |
| EndoscopicTransferAndUnitaryTraceComparison | Head `f8f8c2b0`, Layers 2–5 and §§11.2–11.4: ordinary transfer direction. Relative geometric, smooth, spherical and spectral comparisons are explicitly Part II supplements. No local GGP result is imported to prove itself. |
| AdelicAlgebraicGroups | Head `7b84aae1`, §§0.3, 1.2–1.5, 2.2–2.5; `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:2009` and 2119 use character-module convergence factors. The additional BPCZ Artin–Tate and partial-measure comparison is distinct from that existing construction. |
| AutomorphicLFunctionsAndLocalFactors | Head `691b4b33`, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:241`, 1965, 2054 and 2312: archimedean Whittaker realization, equivariance, entire normalized Rankin–Selberg functionals and nonvanishing. Differential Haar, signed-Asai residue and exact all-place comparisons remain declared supplements. |

All 36 `design/plan.json` gap slugs occur under `## Exact supplier contracts`, with the same named supplier. None has supplier `none`. No non-gap design field changes against the base. The contracts specify fields, categories, normalizations and comparisons; their missing general constructions are not replaced by assumptions containing a target's conclusion.

| Gap family | Slugs checked | Minimality boundary |
| --- | --- | --- |
| Hermitian geometry (1) | `hermitian-unitary` | Excludes the already-owned field/split carriers and field adjoint construction. |
| Finite local representation supplements (6) | `local-categories`, `local-bernstein`, `local-mirabolic`, `gl-tempered-genericity`, `local-jacquet-filtration`, `local-spherical` | Requests relative comparisons, simultaneous avoidance, restriction, all-rank genericity and normalization beyond the cited category/filtration/Satake APIs. |
| Smooth automorphic/archimedean supplements (4) | `archimedean-globalization`, `archimedean-generic-induction`, `archimedean-seminorms`, `automorphic-realization` | Uses existing smooth carriers; adds the exact relative, induction-family and continuity estimates needed here. |
| Spectral/analytic supplements (8) | `distribution-gk`, `local-schwartz-germs`, `local-tempered-bounds`, `local-plancherel`, `local-fourier-extension`, `local-smoothing-trace`, `automorphic-spectrum`, `spectral-isolation` | General analytic suppliers own these extensions; the specialized Bessel trace and period computations remain here. |
| Parameters (2) | `enhanced-packets`, `global-parameters` | Actual packet/base-change realization and normalization, not arbitrary data with desired properties. |
| Endoscopic/relative comparisons (6) | `ordinary-endoscopy`, `relative-geometric-comparison`, `relative-finite-transfer`, `relative-archimedean-transfer`, `relative-fundamental-lemma`, `relative-character-comparison` | Ordinary transfer is separated from relative comparison; finite exact and infinite dense transfer are distinguished. |
| Real theta (2) | `real-oscillator-model`, `real-small-theta` | Requests real mixed-model estimates and small-lift signature/enhancement formulas; does not assume equality of all big and small lifts. |
| Adelic normalization (1) | `adelic-measures` | Compares existing measures to the specified BPCZ factors, including partial measures and volume tails. |
| Local/global factors (6) | `factor-epsilon-identities`, `tempered-local-regularity`, `hermitian-global-values`, `local-rankin-selberg`, `whittaker-pairing-fourier`, `global-mirabolic-norms` | Exact signs, regularity, measures and residue orders supplement existing factors; central global vanishing is allowed. |

At the library pins, the named inputs were located by object and declaration: `LinearMap.Nondegenerate` and `flip_nondegenerate` in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595` and 656; `Submodule.orthogonalBilin` in `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean:48`; `Representation.IntertwiningMap` and `isIntertwining` in `Mathlib/RepresentationTheory/Intertwining.lean:36` and 87; tensor and dual actions in `Mathlib/RepresentationTheory/Basic.lean:618` and 670; `Matrix.unitaryGroup` in `Mathlib/LinearAlgebra/UnitaryGroup.lean:58`; `Circle.coeHom` in `Mathlib/Analysis/Complex/Circle.lean:97`; `Nat.card_sum` and `Nat.card_fun` in `Mathlib/SetTheory/Cardinal/Finite.lean:217` and 242; and `TauCeti.HopfAlgebra.pointsFunctor` in `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:150`. The last is the convolution group on algebra homomorphisms, with postcomposition maps, under its actual commutative-base/Hopf hypotheses. Product-unit, field-unit, inner-product and tensor evaluation APIs also support the retained examples.

Object searches on main, Completed and the pins found no existing Bessel-model/packet/period endpoint to replace these targets. The seven independently specified open sibling heads were searched: QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. Matches concerning Bessel's inequality or Hermitian line bundles are different objects. They are not suppliers of this package.

All internal target prerequisites precede their consumer or are explicit hypotheses of a conditional API. The conjectural propositions are definitions, not proof inputs asserting their own truth. All named external suppliers are on main/completed or earlier in the supplied merge order. The read-only dependency command returned exit status zero:

```text
depcheck: 8 roadmaps, 58 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. No ownership move was needed. The committed `origin/main...HEAD` diff is confined to `packages/GanGrossPrasadUnitaryGroups/` (12 files, 2,628 insertions, 61 deletions). The checked-out full head begins `1211519`. Neither Lean source nor README contains a forbidden option, an admitted data definition, an admitted example, a `lemma` declaration, a pull-request reference or an algorithmic target. The sole import is `import Mathlib`; layer comments follow README order. Source manifest keys are unique and the pin hashes agree with the supplied library manifest.

## Not verifiable

- Lean elaboration was not run: the read-only brief forbids Lean builds and supplies no permitted elaboration command. This report verifies signatures and proof bodies by inspection, not a successful compiler run.
- `xue-bessel` is explicitly waived in `packages/GanGrossPrasadUnitaryGroups/sources.toml`. Its unverified theorem number and pagination remain uncertified. No replacement request or renamed source key was created; no verified endpoint here relies on guessing its contents.
- The 36 declared supplier contracts are future prerequisites. Their implementations and future proof correctness cannot be certified at this head. Their absence is accepted conditionally under the brief, rather than reported as missing ownership.
- The analytic proof plans, including the owned all-residue spherical extension, are plans rather than completed formal proofs. Source statements, hypotheses, normalization witnesses and dependency boundaries were checked; this report does not certify an implementation of those plans.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1211519246954c1079f6c9ee988bb0cb4c409a4f", "job": "RT-GanGrossPrasadUnitaryGroups~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
