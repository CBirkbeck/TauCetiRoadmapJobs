# Review of GlobalShtukasAndFunctionFieldLanglands (pull request #1490 at 6efb589)

**Verdict:** needs changes

## R01 (P2) — Retire the four redundant supplier-gap requests

**Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/design/plan.json:4`, 10, 16, 22; `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:29`, 139, 458, 1056, 2067. “The elliptic-sheaf carrier and its comparison with one-leg shtukas belong to §2.7.”

**Claim:** Previous review R01 is **not repaired**. The previous and present heads are identical. Four active requests still assign work to suppliers although the README owns that work or imports its existing owner. None of the four slugs occurs in the README's exact supplier contracts. This concerns redundant ownership, not the availability of declared supplier results.

**Witness:** §§7.6, 2.7 and 0.13 own centre restriction, elliptic chains and SL_r volume. §7.11 imports rec; `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4658` owns it. The four plan records request these same objects elsewhere.

**Repair:** Retire `classical-centre-restriction`, `elliptic-sheaf-carrier`, `function-field-sl-volume` and `equal-characteristic-glr-correspondence` from the active package gaps. Keep the local support theorem in §7.6, elliptic chains in §2.7, volume in §0.13, and §7.11's pair-factor and geometric comparisons. Retain the supplied rec bijection, without constructing another one. Synchronize the package contract record with these assignments; no supplier edit is needed.

The identifying tests are unchanged: SL₂ over F₃(t) has integral-volume-one quotient volume 1/16 in both descriptions; rank 2 with degree-2 infinity has period and degree increase 4; coefficients λʲ at ϖʲ have support sizes 1,2,3 modulo λ,λ²,λ³ but infinite limit support; rank-one geometric Frobenius 2 gives rec(D∨)(ϖ)=2. Removing the redundant requests leaves each tested object with one owner. The available repair report does not mark this ownership finding “not actionable in this package”; its retention of the four records is not a repair.

## R02 (P2) — Specify the twisted Eisenstein map and involution

**Location:** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1398`. “Let H̄ be the image of H_G^Σ⊗Q_ℓ in End(V)×Q_ℓ[Pic_X(F_q)]^ι.”

**Claim:** This headline does not specify the map to the Picard factor, the Eisenstein ideal, or the involution used for its invariant ring. The only previously defined ι is the coefficient-field isomorphism in Conventions. Ordinary inversion and the degree-twisted involution give different invariant subrings. Section 1.12's normalized Satake convention does not define the unnormalized rational Picard coordinate used by YZ.

**Witness:** YZ line 403 defines the ideal through Satake and divisor-to-Picard maps. YZ-I line 1235 sends h_v to t_v+q_v/t_v; line 1253 sends [L] to q^deg(L)[L⁻¹]. For q=3, inversion changes z+3/z to 1/z+3z.

**Repair:** Before §3.9 uses the Satake–Picard action, define H_G^Σ, the map a_Eis^Σ, its kernel, and ι_Pic([L])=q^deg(L)[L⁻¹], retaining the source's uniformizer/divisor orientation. Use ι_Pic in §3.11 and explain the change of variable t_v=√q_v·u_v connecting it to normalized Satake. Alternatively transport the entire map and statement consistently into normalized coordinates. Add discriminating Checks for the new definitions. Cite YZ §2.2, p.8, and Yun–Zhang's first paper §4.1.1–§4.1.2, p.22 ([arXiv:1512.02683](https://arxiv.org/abs/1512.02683)).

Test of the repair: on P¹/F₃ with z=[O(1)], ι_Pic(z)=3/z and ι_Pic²(z)=z. The generator z+3/z is fixed; at z=2 and its twisted partner z=3/2 it has value 7/2 both times. Ordinary inversion instead gives 13/2 at z=2. In normalized coordinates it is √3(u+u⁻¹), with u↦u⁻¹. This makes the second component of the image map and its kernel determinate.

## R03 (P3) — Replace stale supplier identifiers with the existing prose targets

**Location:** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:99`, 107, 179, 197, 551, 568. “§3.1 (`CurveBundles` …) and §3.2 (`LocalLoopGrassmannian` …).”

**Claim:** The cited sections exist and supply the described mathematics, but the identifiers `CurveBundles`, `LocalLoopGrassmannian` and `OrientedNearbyCycles.modificationBaseChange` do not occur in the corresponding supplier README or Suggested.lean. These are stale declaration locators, not unowned mathematical prerequisites.

**Witness:** `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1095` constructs Bun_G; line 1119 constructs Gr_G. `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3076` states modification/base-change in prose. Literal searches of both files in each supplier find none of the three names.

**Repair:** Cite the existing section titles and prose targets, dropping the nonexistent declaration names throughout this README. Preserve the hypotheses: the local quotient is for an unramified reductive group over k[[t]], and modification/base-change uses a qcqs irreducible base, finitely presented map and bounded constructible invertible-torsion coefficients. Tested objects are unchanged: Bun_Gm has scalar automorphisms, the local G_m quotient has integer-valued geometric points, and the identity specialization has the identity comparison. No new gap or new supplier construction is required.

## R04 (P3) — Record the two newly cited sources in the source manifest

**Location:** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:476`, 1077, 2258, 2260; `packages/GlobalShtukasAndFunctionFieldLanglands/sources.toml`. The references introduce “[Sp] Michael Spieß” and “[Harder] Günter Harder”.

**Claim:** Neither work has a record among the manifest's 28 source entries. Both are needed by owned targets, and neither is a renamed version of another recorded work.

**Witness:** Manifest searches by key, author and title find neither work. The sources service successfully read Sp from the publisher archive and Harder from the linked university copy; Sp line 2392 and Harder line 1973 contain the relevant constructions/comparison.

**Repair:** Add one manifest record each under the existing README keys Sp and Harder, including the legal retrieval metadata, cited targets and exact locators. Keep the README references. Both texts were readable in this review, so this needs no missing-source request. The mathematical tests remain period 4 at rank 2/degree-2 infinity and volume 1/16 for SL₂/F₃(t).

## Verified sound

This is a fresh full review of all **92 numbered targets**, their API/Checks, scope, conventions, supplier contracts and proof routes, rather than an incremental acceptance of the preceding review. The seeded sample has **15 targets**; its source results are recorded below. The previous review's sole finding is reconciled in R01 with the current passage and unchanged-head evidence. Its older repaired findings are not revived: the geometric rec adapter consumes its owner, and the revised LanglandsParameterStacks, ArithmeticGaloisDuality, DeligneWeightsAndPurity and GeometricSatakeAndFusion citations resolve to their operative targets.

The finite computations below test definitions and conventions; they do not substitute for proofs of geometric theorems. “Pass” means the listed instance and negative control agree with the stated hypotheses and conclusion. The source and ownership audits provide separate evidence for the general statements. R01–R04 describe the remaining changes.

### Gate, form and headline coverage

The supplied push gate reports every counter zero, including the targeted build, and `OK`. The independent dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Direct `lake env lean` elaboration of `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean` exited 0 with no output or warnings. The outside-folder diff against origin/main is empty. No reviewed worktree file was edited.

The file has one `import Mathlib`, one module docstring, the prescribed namespace and **zero declarations**. Consequently the signature-binder inspection and one-tactic probe each have zero declarations to test. There is no sorry'd data, surrogate predicate, `set_option`, catalogue or padded boundary theorem. The empty file is appropriate for these geometric headlines at the inspected pins.

The README's headlines are: bundle/torsion mass and SL_r volume (§0.13); rational, arithmetic and integral Satake (§§1.7–1.14); global shtuka geometry, finite-type truncations and compact cohomology (§§2.1–2.5), elliptic-sheaf comparison (§2.7); integral Eichler–Shimura (§3.7), cusp and one-place Hecke finiteness (§§3.10–3.12), PGL₂ Eisenstein decomposition (§3.11); Drinfeld descent, product actions and ind-smoothness (Layer 4); split, nonsplit and modular excursion decompositions (§§5.7–5.11); companions and GL_r comparison (Layer 6); local parameterization, local–global compatibility and gamma/GL_r comparison (§§7.6–7.11). The docstring names these families and their missing carriers. Section 5.12 is explicitly conditional; §5.13 states a conjectural multiplicity description, not an unconditional supply theorem.

The pinned libraries have ordinary schemes, categorical descent, representation/comodule equivalence and the requisite linear algebra. They do not furnish the global shtuka moduli, perverse étale Satake categories, geometric cohomology operators or the smooth local representation/parameter interfaces needed for these headline signatures. Searches by those objects found comments about future geometry and unrelated uses of “admissible”, not alternative headline carriers. The declared finite-extension representation carrier is present and acknowledged; it does not supply Satake's geometric side. There is no missing statable headline demonstrated by the audit.

The repository's writing/review guidance and main-branch AlgebraicCurves and AlgebraicVectorBundles examples were read. All eight layers have Examples and Dependencies; numbered definitions retain API lists and at least three Checks (also mechanically counted for the 27 sections containing an explicit “Define”). The tests distinguish nilpotent from reduced levels, source from modified HN bounds, rational from geometric central degrees, generalized from ordinary eigenspaces, and completed from ordinary Hecke support. No computational algorithm, copied prose passage or route-specific good-prime restriction was identified. The general torsion/integral statements are not replaced by characteristic-zero projectors.

### Seeded source verification

References below use the pagination of the version named in the README; line numbers identify the legally cached extraction. The source papers' exact scope is kept distinct from additional construction targets proved here.

| Target | Text opened and locator | Comparison with the roadmap |
|---|---|---|
| 0.12 Nonsplit bundle descent | VL Remark 12.2, p.150, VL line 8319; §12.1, VL line 8270 | Inner forms and H¹ sectors are retained. Splitting the pinned outer action is not asserted to trivialize every inner model; effective inner descent is an owned construction using torsors. |
| 1.7 Classical Satake category | Ric Theorem 0.1, p.2, Ric line 62; Theorem 5.1, p.20, Ric line 925 | Geometric category versus full continuous arithmetic category distinguished. The latter is not reduced to finitely many pure Tate objects. |
| 1.8 Signs and Tate normalization | MV Lemma 6.1/Proposition 6.3, pp.19–20, MV line 805; VL Remarks 1.19/1.21, pp.50–52, VL lines 2634,2720 | The component parity correction and the separate trace sign are both retained; √q choices agree across residue degrees. |
| 1.13 Determinants/opposition | Zhu introduction, p.3, Zhu line 116; LY Lemma 3.3, pp.9–10, LY line 406 | Quotient determinant has positive degree on the minuscule P¹. Opposition uses unshifted IH degree 2j with sign (−1)^j; it is not a universal sign on all shifted cohomology. |
| 2.10 Coalescence | VL Proposition 4.12/Remark 4.13, pp.69–70, VL line 3704; Proposition 9.7, p.132, VL line 7344 | Arbitrary maps of finite leg sets, representation restriction, composition and product-Galois equivariance match. No extra shift is introduced under diagonal restriction. |
| 3.7 Eichler–Shimura | VL Proposition 7.1, p.102, VL line 5453; Xue-I Proposition 7.2.6, p.44, Xue-I line 2583 | The integral statement uses a free rank-r auxiliary representation, arbitrary finite coefficient W and enlarged truncation. It does not import the rational antisymmetrizer as an integral proof. |
| 3.9 Boundary constant terms | YZ Lemmas 3.33,3.34,3.36/(3.32), pp.36–38, YZ lines 2268,2334,2360,2383 | High-bound hypothesis, constructible error and mc-action match. Generic closedness of every horocycle is explicitly avoided (Remark 3.35). The printed sign/index slips are corrected in the roadmap. |
| 3.11 Eisenstein decomposition | YZ Lemma 3.37–Theorem 3.41, pp.39–41, YZ line 2430; YZ §2.2, p.8, line 403; YZ-I §4.1, p.22, line 1229 | Any spherical place is allowed; finite over its Hecke algebra is not finite over Q_ℓ. The general theorem matches, but its defining Picard map/involution must be supplied: R02. |
| 5.2 Invariant-function indexing | VL Lemma 10.6, pp.137–138, VL line 7768 | Regular invariant functions are realized by finite-dimensional cyclic algebraic coefficients; arbitrary set functions are not admitted. |
| 5.3 Satake scalars/separation | VL Lemma 10.2, p.135, VL line 7576; Remarks 11.6/11.8, pp.142–144, VL lines 7978,8019 | The geometric Frobenius identity matches. One-variable Hecke data are not claimed to reconstruct arbitrary reductive parameters; GL_r trace reconstruction is distinguished. |
| 5.4 Full-cohomology excursions | Xue-I Construction 8.3.3, 8.3.4, Lemma 8.3.5, p.57, line 3460; Proposition 8.4.2, p.58, line 3515 | Retained legs, all degrees, constant-term compatibility and extension O_E→E are present. The split setting is explicit; further coefficient/nonsplit extensions are not silently attributed to this source. |
| 5.5 Global identities | VL Proposition 10.8(i)–(iv), pp.138–139, VL line 7804 | Algebra, reindexing, disjoint-union and ordered three-copy identities match, with continuity. These are verified for constructed operators, not assumed in a structure field. |
| 5.6 Unramifiedness | VL Lemma 10.4, p.136, VL line 7631; Proposition 10.10, p.140, line 7858 | Degree d corresponds to d·deg(v) partial Frobenius; inertia is d=0. The specified good open, including the nonsplit bad-model locus, is retained. |
| 5.7 Global excursion algebra | VL Notation 10.5, p.137, VL line 7754; Remark 11.6, p.142, line 7978 | Finite-dimensional commutative image and generalized blocks match; no reducedness assertion for the whole algebra. Actual Hecke scalar action uses the smaller normal-operator algebra. |
| 5.12 Conditional eigensheaf comparison | VL §15/Proposition 15.1, pp.173–174, VL line 9481 | Conditional eigenobject with fusion/Frobenius compatibility gives the claimed trace comparison. The roadmap retains the additional compatibility assumption instead of treating the source's omitted argument as a proved general construction. |

The other source issues explicitly highlighted by the README were also reopened: YZ's shifts/torsor/index, Feng's base-field typo, LL's printed correction, the Xue-I maximal-ideal proof step, Ric's semidirect-product formula and VL's tensor-power proof step. Del73 remains settled uncertified, as instructed. Sp and Harder were fetched through the sources service, not a mirror; their relevant period and measure passages were read. No unresolved source-fetch request remains.

### Computed adversarial table

The table has 102 computed rows; each of the 92 numbered targets has a row. Additional rows separate conventions, crucial constructions, the seeded headline normalization and source-error counterexamples. The tests include p=2, p=3, F₂, empty legs, zero spaces, nonreduced bases, inseparable central kernels, nonsplit models, degree>1 places and nonintegral Weil parameters. Cases excluded by standing hypotheses are marked as such rather than evaluated as if admissible.

| Statement | Instances tried | Values computed / competing model | Result; change |
|---|---|---|---|
| Conventions: coefficients | p=3, ℓ=2, s=1 versus s=0; q=1 | 3 mod 2=1 is invertible; O/λ nonzero versus O/λ⁰=0; q−1=0 at q=1 | Pass: ℓ≠p, s≥1, q≥2 exclude the junk cases |
| Conventions: reciprocity | χ(ϖ)=2, degree 1 and 2 | Geometric values 2,4; arithmetic values 1/2,1/4 | Pass; inversion is necessary |
| Conventions: half Tate | GL₂ minuscule over F₃; q=9, degree 2 | IC trace −1/√3 becomes +1/√3; √(9²)=3²=9 | Pass |
| 0.1 Bundle stack | G_m on P¹/F₃; one fibre trivialized | Automorphism orders 2 and 1; stack mass 1/2 versus 1 | Pass; retain automorphisms and nonparahoric level models |
| 0.2 Deformations | G_m/P¹; PGL₂ with one flag | (h⁰,h¹,h²)=(1,0,0), dimension −1; PGL₂ dimension −3+1=−2 | Pass |
| 0.3 Full levels | F₃[ε]/ε², G_m | Units 2·3=6 versus reduced-level units 2 | Pass; reduced level is wrong |
| 0.4 Fractional twists | Rank 2 and rank 1 at degree-one point | Two rank-2 rotations raise degree by 2=deg(E(x))−deg(E); rank-one period 1 | Pass |
| 0.5 Slopes/Euler form | O,O(1) on P¹; torsion; zero | χ=1+1=2, reverse 1−1=0; nonzero torsion slope ∞; zero has no factors | Pass |
| 0.6 Bounded loci | G_m→GL₂, t↦diag(t,t⁻¹), bound 1 | max(d,−d)≤1 gives d=−1,0,1; adjoint slope is 0 for all d | Pass; faithful bound essential |
| 0.7 Adelic groupoid | Line bundle/F₃; disconnected C₂ | Stabilizer order 2=automorphism order; H¹(F₃,C₂) has 2 classes, not 1 | Pass; connected Lang hypothesis retained |
| 0.8 Shifted HN | O(1)⊕O(−1), T=(1,−1); block (1,3] of T=(3,2,0), degree 4 | Shifted slopes 0,0; block slope (4−2−0)/2=1 versus wrong prefix −1/2 | Pass |
| 0.9 Parabolic instability | Opposite flags on O² at 0,∞ | Empty/full subsets have instability 0, singletons 1 | Pass; uniqueness restricted to positive minimum |
| 0.10 Central lattice | GL₂ degree lattice 2Z; norm-one torus | Z/2Z has 2 classes; rational split rank 0 versus geometric rank 1 | Pass; rational quotient does not bound arbitrary geometric components |
| 0.11 Orbit masses | G_m/F₃ | Kernel value 2 times mass 1/2=1; unweighted count 1 differs from integral of constant function 1/2 | Pass |
| 0.12 Nonsplit descent | GL(O⊕O(1))/P¹; norm-one torus | h⁰(Lie(𝒢)(−1))=1 versus split value 0; Frobenius closure d=−d forces d=0 | Pass; outer splitting alone insufficient |
| 0.13 Bundle mass/SL volume | P¹/F₃, rank 2 | GL mass 1/48+Σ(m≥1)1/(4·3^(2m+1))=1/32; SL₂ volume 1/16=3⁻³Z(1/9); gauge multiplier 16 gives 1 | Mathematics passes; R01 ownership |
| 0.13 Torsion mass | P¹/F₂, degree 2; rank-one volume | Torsion contributions 2+3+1/3=16/3, not ordinary-exponential 9/2; SL₁ volume 1, empty product 1 | Pass; q=1 excluded |
| 0.14 Cuspidal functions | G_m/P¹/F₃, level {0,∞} and empty level | Ray quotient size (2·2)/2=2 versus 1; all torus functions are cuspidal | Pass |
| 0.15 Picard/Lang fibre | P¹/F₃ | Pic(F₃)=Z, Pic⁰(F₃)=0; scalar stabilizer 2 and object mass 1/2 | Pass; degree-zero kernel alone loses components |
| 1.1 BD Grassmannian | G_m over dual numbers; weights 1,−1 collide | (1+ε/t)(1−ε/t)=1, but 1+ε/t is not a power-series unit; collision weight 0 | Pass; geometric integer points do not describe all test rings |
| 1.2 Schubert geometry | GL₂ weights (1,0),(2,0),(1,1) | Dimensions 1,2,0; minuscule quotient determinant degree +1, not −1 | Pass |
| 1.3 Hecke chains | Empty chain; G_m weights 2,−1 | Empty map id; composite weight 2−1=1 | Pass |
| 1.4 Stack sheaves/trace | BC₂ sign over Q₂; BG_m/F₃ | Invariants of sign=0 versus trivial dimension 1; compact trace Σ(i≥1)3⁻ⁱ=1/2=1/2 | Pass; rational averaging not silently used for torsion |
| 1.5 Fusion/convolution | Two standard GL₂ modifications | Exceptional fibre P¹ dimension 1; fixed-fibre codimension 2 gives 2=2; total-family codimension 3 gives 2<3 | Pass; semismall and small distinguished |
| 1.6 Iwahori minuscule | Local equation ab=t; r=0 | At a=b=t=0, fibre tangent dimension 2 versus smooth relative dimension 1; no modification gives Bun | Pass; smooth total space does not imply smooth projection |
| 1.7 Satake category | G_m weights 2,−1; GL₂ standard; G=1 arithmetic descent | Weight sum 1; 2²=3+1; geometric unit has arithmetic Frobenius +1 or −1 | Pass; full arithmetic category retained |
| 1.8 Symmetry | Two odd minuscule factors | Koszul −1 times parity correction −1 gives +1 | Pass |
| 1.9 Geometric Satake | G_m; standard GL₂ representation | Coordinate algebra E[z,z⁻¹]; standard dimension 2; tensor dimension 4 | Pass; reconstruction has the marked fibre functor |
| 1.10 Central action | diag(1,2) on P¹/F₅; central scalar 3 | [1:1]↦[1:2]; inverse gives [1:3]; scalar 3 fixes point | Pass; equivariance not confused with trivial action of every group element |
| 1.11 Nonsplit Satake | Inner transition diag(1,t); characteristic 2 | Root-line transition factors t⁻¹,t; lift a²(1+t)=1 would require a₀²=1 and a₀²=0 | Pass; étale inner data and half-Tate choices retained |
| 1.11 L-group adapter | Split SL₂, cyclotomic value 3 | Conjugation-only source map gives u(1/3) versus u(3); right translation by c_γ⁻¹ gives u(1)c_γ⁻¹ on both products | Pass with corrected roadmap map; source issue below |
| 1.12 Spherical Satake | Unramified norm-one torus; locally split torus coordinate z=2 | Invariant cocharacter lattice 0 gives spherical algebra E; local values 2 and 1/2 differ although orbit sum is 5/2 | Pass; use local quotient Q_v |
| 1.13 Determinant/opposition | Zero module, one line scaled by 2, two-line swap; P¹ | Determinants 1,2,−1; inverse line would give 1/2; IH⁰/IH² signs +1,−1 | Pass; in characteristic 2 the swap sign becomes +1 |
| 1.14 Integral Satake | Residue module k over DVR; torus weights ±1 | Tor₁(k,k)=k, ordinary tensor k; derived degrees −1,0 but perverse degree-zero tensor k; weight sum 0 | Pass; flat/free restrictions remain explicit |
| 2.1 Shtuka definition | Opposite GL₂ modifications; positive G_m singleton | Degrees d,d+1,d close; singleton would require d+1=d | Pass; arrows and closing isomorphism constrain object |
| 2.2 Finite type | μ_p over dual numbers; two SL₂ factors | (1+ε)^p=1 with ε≠0; kernel element (−I,I) acts by −1 on a mixed tensor even though individual squares act by +1 | Pass; source shortcut replaced |
| 2.2 Bound transport | E=O(2)⊕O(−1), double cover and tensor square | Pullback top slope 4; tensor slopes 4,1,1,−2; modified polygon vertex 1/4 need not equal source 0 | Pass; inseparable/modified bounds not identified without comparison |
| 2.3 Local model | G=1; one G_m jet with zero modification | Relative dimensions 0 and 1=dim G_m; quotient subtracts the jet dimension | Pass |
| 2.4 Fractional infinity | Rank 2, degree-2 pole; rank 1/no legs over F₃ | Balancing degree n·deg(D∞)=4; groupoid quotient removes scalar order 2 while degree-class quotient leaves BC₂ | Pass; Picard groupoid quotient essential |
| 2.5 Compact cohomology | No-leg GL₂/P¹, HN bounds 0,1,2; collision P¹ | H⁰ dimensions 1,2,3 grow unbounded; collision H⁰ and H² both rank 1 | Pass; full HN colimit not claimed finite |
| 2.6 Inner forms | Two Brauer invariants 1/2, versus one | Sum 1=0 in Q/Z; single invariant 1/2≠0 | Pass |
| 2.7 Elliptic comparison | Rank 2, degree-2 infinity; normalized P¹ degree | Four degree-one quotients raise degree 4=2·2, not 2; marked degree 2(−1)+1=−1, tensor O(1) changes it to +1 | Mathematics passes; R01 |
| 2.8 Horocycles | r=2, path N,N+1,N; r=1 | Endpoint difference 0 and two leg parameters; one increment has difference 1 and cannot satisfy same closing condition | Pass |
| 2.9 Partial Frobenius | Degree-2 place, two independent legs | One step exchanges embeddings, two return; degree vectors add (1,0)+(0,1)=(1,1) | Pass |
| 2.10 Coalescence | V⊠V∨, dim V=2; torus weights 2,−1 | Diagonal restriction End(V) has dimension 4; weight sum 1, further restriction unchanged | Pass; composition and unit preserved |
| 2.11 Hecke maps | Torus translations 2,3,0 | Composite shift 5; adjoint/inverse shift −2; unit shift 0 | Pass; direction distinguished |
| 3.1 Creation/annihilation | V=E²; rescale coevaluation by 3 | Evaluation after canonical creation 2; rescaled value 6; unit representation value 1 | Pass; zigzag normalization excludes rescaling |
| 3.2 Integral Hecke finiteness | E line with operator λ⁻¹ versus 2 (ℓ=5) | Orbit valuations −n are unbounded; 2 preserves O_E | Pass; finite E dimension is insufficient |
| 3.3 Horocycle shifts | r=2, #I=2, affine dimension 1 | Compact pushforward [−2](−1) followed by [4](2) gives [2](1), not [−2](−1) | Pass; corrected sign |
| 3.4 mc localization | Finite E² and infinite direct sum at a point | Finite E² becomes zero; infinite direct sum is not a constructible error | Pass; localization does not kill every Ind-object |
| 3.5 Cuspidality | Torus; GL₂ delta at trivial bundle | Intersection over empty proper-parabolic set is whole torus space; GL₂ constant term has a nonzero positive summand | Pass |
| 3.6 Hecke from Frobenius | Unit; rank-one geometric value 2 at degree 2 | Unit eigenvalue 1; two iterations 4; arithmetic inverse would be 1/4 | Pass |
| 3.7 Eichler–Shimura | F=diag(2,3); rank one; mod 2 | F²−5F+6=diag(0,0); 2−2=0; 2·id=0 mod 2 while id≠0 | Pass; rational-projector inference would fail last test |
| 3.8 No-leg cusp | G_m ray level on P¹/F₃; nonzero translation tail | Cusp dimension 2; distinct translates on the degree half-line span infinitely many basis vectors | Pass |
| 3.9 Boundary action | High indices n≥0 with shifts ±1 | T₋T₊=id; T₊T₋ kills e₀, difference rank 1; difference is 0 modulo constructibles | Pass; not an honest restricted group action |
| 3.10 Cusp finiteness | Integral torus ray space; full GL₂ colimit | Cusp lattice O_E² has rank 2; whole GL₂ colimit has dimensions ≥m+1 | Pass; image of one truncation, not injective stabilization |
| 3.11 Eisenstein decomposition | P¹/F₃, z=[O(1)] | t=z+3/z, ι(z)=3/z; t(2)=t(3/2)=7/2 but t(1/2)=13/2 | R02: define twisted involution and map |
| 3.11 Any-place finiteness | Degree-2 spherical place | z²+9/z²=t²−6; E[t] finite of degree 2 over E[t²−6], yet infinite-dimensional over E | Pass; no degree-one-only shortcut |
| 3.12 One-place module | O_E[t], and (O_E/λ²)[t] | Rank 1 over respective polynomial algebra, infinite O_E size; torsion killed by λ² | Pass; finite Hecke generation differs from Hecke-finite orbit |
| 3.13 Finite-type iff | r=0, #Σ∞=0 or 2; r=1, #Σ∞=1 | 0<0 false/nonfinite; 0<2 true/finite; 1<1 false/nonfinite | Pass; parity/degree assumptions retained |
| 4.1 Finite-cover descent | Trivial cover; product C₂×C₂ | Trivial cover degree 1; (1,0) acts nontrivially on first factor only, diagonal (1,1) acts on both | Pass; product not replaced by diagonal |
| 4.2 Lisse descent | O_E/λ² constant line; ramified boundary control | Constant stalk length 2 and identity descent; nontrivial inertia action ≠1 cannot extend as unramified local system | Pass |
| 4.3 Frobenius–Weil | Frobenius λ⁻¹; two degree coordinates 2,3 | Degree n has valuation −n; (1,1) acts by 6 | Pass; Weil and profinite Galois continuity differ |
| 4.4 Fusion/Frobenius | Merge two legs | Partial degrees (1,0),(0,1) combine to (1,1); total scalar 2·3=6 | Pass |
| 4.5 Finite envelopes | Recurrences of degrees 2 and 3 | Six monomials F₁^aF₂^b, 0≤a<2,0≤b<3; higher powers reduce to their span | Pass; inverses require invertible constant coefficients |
| 4.6 Specialization | Recurrence with zero initial data; boundary skyscraper | Two initial zeros propagate to zero; skyscraper closed stalk rank 1 versus generic rank 0 | Pass; arbitrary sheaf specialization would be false |
| 4.7 Product Galois action | Integral unit 2 at ℓ=5 versus 1/5 | Powers of 2 have valuation 0; powers of 1/5 have valuation −n | Pass; stable finite lattices used |
| 4.8 H functors | Empty torus legs, insert unit; V⊗V∨ | Cusp dimension 2 remains 2 under unit insertion; dim End(E²)=4 | Pass |
| 4.9 Galois coalescence | S₃, a=(12),b=(23) | Diagonal sends ab to (ab,ab); ab=(123) differs from ba=(132) | Pass; multiplication of arbitrary factors is not the diagonal map |
| 4.10 Leg naturality | Unit retained leg; scalar 3 auxiliary action | Retained identity 1, auxiliary scalar 3, total 3; acting also on retained leg would give 9 | Pass |
| 4.11 Choice independence | Conjugate diag(2,3) by basis swap | Traces 5 and 5; determinants 6 and 6; creation/evaluation remove conjugating basis | Pass |
| 4.12 Full Weil descent | A=O_E[t]/(λt−1)=E; m=0 | A/mⁿ=E, not finite torsion over O_E; integral residue branch gives O_E/λⁿ | Pass with two-branch roadmap proof; source error below |
| 4.13 Ind-smoothness | Constant line at diagonal; increasing finite systems | Specialization 1→1 is iso; colimit ranks 1,2,3,… unbounded | Pass; no finite-rank lisse conclusion |
| 5.1 Excursions | Trivial coefficient pairing 3; identity tuple on E² | Operator 3·id; trace pairing 2; zero pairing 0 | Pass; arbitrary scalar excluded by fixed maps |
| 5.2 Invariant indexing | SL₂ A=diag(2,1/2), f(g,h)=tr(gh⁻¹) | f(A,A)=2; wrong gh gives tr(A²)=17/4; tr A=5/2 | Pass; function is regular/algebraic |
| 5.3 Satake/separation | G_m geometric Fr=2; degree d=0,1,2 | Values 1,2,4; arithmetic inverse gives 1,1/2,1/4 | Pass; degree and normalization visible |
| 5.4 Full excursions | Retained J and auxiliary I, pairing 3 | J-action id, auxiliary result 3·id; empty I yields ξ(x)·id | Pass; construction includes noncuspidal compact cohomology |
| 5.5 Identities | Scalars 2,3; ordered S₃ words | Tensor/disjoint union 6, not 5; a b⁻¹=(123) differs from b⁻¹a=(132) | Pass |
| 5.6 Unramifiedness | Inertia i, degree-one Fr with value 2 | σ(i)=1, σ(iFr)=2=σ(Fr); degree-zero partial iterate id | Pass |
| 5.7 Excursion algebra | Jordan J=[[1,1],[0,1]]; zero cusp | ker(J−1) dimension 1, ker((J−1)²) dimension 2; zero cusp has no nonzero blocks | Pass; reducedness not assumed |
| 5.8 Reconstruction | SL₂ unipotent versus I; G_m generator 2 | All unipotent power traces 2, semisimple representative I₂; G_m generator recovered as 2 | Pass; unique semisimple class, not unique raw representation |
| 5.9 Global decomposition | Commuting normal Hecke diag(2,3); one Jordan excursion block | Hecke eigenspaces dimensions 1,1 and scalars 2,3; Jordan generalized block 2, ordinary eigenspace 1 | Pass; normality applied only where justified |
| 5.10 Nonsplit decomposition | Q=C₂ prescribed nontrivial component | Component idempotents evaluate (0,1); wrong trivial projection gives (1,0) | Pass; projection law excludes wrong model |
| 5.11 Modular blocks | Regular representation of C₂ over F₂ | rank(T−1)=1, (T−1)²=0; generalized block dimension 2 versus eigenspace 1 | Pass; no good-prime restriction |
| 5.12 Conditional comparison | Rank-one eigencharacter χ with χ(g)=ζ, ζ³=1; f=0 control | Action χ(g)f=ζf on both sides; zero trace satisfies both sides 0 and implies no nonzero eigenfunction | Pass; conditional, no existence/nonvanishing claim |
| 5.13 Multiplicity conjecture | W=1; nontrivial action on A | Candidate is A^S, not A: for sign on E, dimensions 0 versus 1 | Pass as a labelled conjectural target; not a supplied theorem |
| 6.1 Twists/coefficient fields | ℓ=5, arithmetic scalar 6 and inverse | 6·(1/6)=1; v₅(6)=0 but v₂(6),v₃(6)>0 | Pass; an ℓ-unit need not be a unit at another prime |
| 6.2 Companions | Rank-one root of unity; rank-two slopes ±1/2 | Rank-one slope 0; translation by 1 produces slopes 1/2,3/2 | Pass; norm twists tracked |
| 6.3 GL_r comparison | Rank-one finite-order χ; direct sum of equal trivial lines | Frobenius polynomial 1−χ(Fr)T on both constructions; reducible rank-two polynomial (1−T)² is excluded from irreducible correspondence | Pass |
| 7.2 Restricted shtukas | No legs; G_m/F₃ at first jet; budget 1→0 | Automorphism group G_m(F₃) order 2; no-leg quotient retains it; budget after one allowed step 0 | Pass; negative budget not used |
| 7.3 Nearby cycles | Smooth two-dimensional product versus xy=0 | Product has one irreducible component; crossing has two | Pass; dimension alone does not establish geometric integrality |
| 7.4 Transport | Bounds (2,5), changes (−1,+1); insufficient bound | New bounds (1,6); 0−1=−1 is inadmissible, not truncated to 0 | Pass; explicit inequalities retained |
| 7.5 Local excursions | Constant functions 1 and 3 | Convolution elements 1_K and 3·1_K; unit support K | Pass; identity comparison fixes normalization |
| 7.6 Centre restriction | Coefficients λʲ on cosets ϖʲ | Support sizes mod λˢ are s; inverse-limit support infinite; unit excursion has uniformly one coset | Mathematics passes; R01 ownership |
| 7.7 Local/full comparison | Same coefficient family; extra trivial leg | Valuations j→∞ but support infinite; extra unit leg multiplies action by 1 | Pass; decay is not ordinary finite support |
| 7.8 Local–global semisimple | GL₂ special versus trivial representation | Same semisimple roots {√q,1/√q}; N-ranks 1 and 0 | Pass; general comparison is only semisimple |
| 7.9 Monodromy distinction | q=3,F=diag(1/√3,√3),N=E₁₂ or 0 | FNF⁻¹=N/3; N-ranks 1,0; forgetting N identifies Weil semisimplifications | Pass |
| 7.10 Gamma factors | Special block a=1,b=3,q=3,T=1/9 | Monodromy correction −1/3 times complementary ratio −3 gives 1; trivial-character gamma at s=0 is 0/(2/3)=0 | Pass; nonvanishing is not asserted at zeros |
| 7.10 Additive-character change | ψ→ψ_ϖ, q=3 | Rank-one norm factor 3^(1/2−s), rank-two factor 3^(1−2s) | Pass; self-dual measures included |
| 7.11 Geometric rec | χ(ϖ)=2, arithmetic Fr inverse | D(Fr_arith)=1/2, D∨(Fr_arith)=2, rec(D∨)(ϖ)=2 | Pass; no duplicate bijection construction |
| 7.11 Pairs/segments | Unramified lines 2,3 at T=1/9; lengths 1,2 | L=1/(1−6/9)=3; omitted dual gives 54/53; segment N-ranks 0,1 | Pass; full dual and Z/L convention retained |
| 7.11 Nonintegral domain | ℓ=5, Weil Fr=1/5 | v₅(Frⁿ)=−n; no stable lattice, but raw Weil–Deligne datum with N=0 exists | Pass; correspondence not restricted to Galois-extendible parameters |

### Pinned declarations opened

Pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are the declarations consumed, not names guessed from a newer checkout. The carrier inspections show what each definition does **not** supply.

| File and line at pin | Declaration / inspected content |
|---|---|
| `Mathlib/AlgebraicGeometry/Scheme.lean:40` | `AlgebraicGeometry.Scheme`: locally affine locally ringed space; no smoothness, separatedness, nonemptiness or finite-type field. |
| `Mathlib/CategoryTheory/Sites/Descent/DescentData.lean:59` | `CategoryTheory.Pseudofunctor.DescentData`: actual objects, transition morphisms and coherence. |
| `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49` | `CategoryTheory.Pseudofunctor.IsStack`: prestack plus essential surjectivity for covering sieves; no algebraicity/atlas. |
| `Mathlib/CategoryTheory/Galois/Basic.lean:412` | `CategoryTheory.GaloisCategory`: existence of a fibre functor; no distinguished geometric basepoint. |
| `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60` | `ExteriorAlgebra`: the Clifford algebra of the zero quadratic form, with real body. |
| `Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, 89 | `LinearMap.charpoly`, `LinearMap.aeval_self_charpoly`, under finite/free module assumptions at line 39. |
| `Mathlib/RingTheory/Finiteness/Defs.lean:46`, 121 | `Submodule.FG` and `Module.Finite`: finite generating set and finite generation of the top submodule, not finite underlying set. |
| `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:32`, 757 | `Algebra.adjoin`, `Algebra.isMulCommutative_adjoin`; commutation is a hypothesis, not a property of arbitrary generators. |
| `Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:634` | `FiniteDimensional.finiteDimensional_subalgebra` needs finite ambient dimension. |
| `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71` | `Module.End.genEigenspace`: increasing kernels, including the infinite exponent. |
| `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean:74` | `Module.End.iSup_maxGenEigenspace_eq_top`: algebraically closed field and finite dimension. |
| `Mathlib/LinearAlgebra/Eigenspace/Pi.lean:90`, 194 | Independence of simultaneous generalized spaces; simultaneous spanning for a pairwise commuting triangularizable family. These are separate assertions. |
| `Mathlib/CategoryTheory/Limits/Indization/Category.lean:70` | `CategoryTheory.Ind`: universe-sensitive Ind category, not an arbitrary object class in the original universe. |
| `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45` | `CategoryTheory.ObjectProperty.IsSerreClass`: zero/subobject/quotient/extension closure. |
| `Mathlib/CategoryTheory/Abelian/SerreClass/MorphismProperty.lean:65` | `CategoryTheory.ObjectProperty.isoModSerre`: kernel and cokernel condition; not itself the constructed localized category. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean:216`, 231 | `TauCeti.FGPointRepresentationCat`, `TauCeti.fgPointRepresentationCategoryEquivalence`; finite module representations/comodules, not perverse sheaves. |

There are 16 file-location groups above, including 21 named declarations or predicates. None is redeclared in Suggested.lean. The generalized-space algebra belongs to Mathlib; the roadmap's content is its application to geometrically constructed operators and parameter labels.

### Ownership and supplier resolution

The object search used `roadmaps grep` over main and open heads, package records, the supplied sibling checkouts and pinned libraries. Supplier texts were reopened with `roadmaps show`; revisions of existing main roadmaps were not substituted for main. The table records the 22 roadmap contract families, with repository-relative README locators. Layer/section references below refer to the operative paragraphs, not merely similarly named headings.

| Supplier README | Resolved contract and location |
|---|---|
| `TauCetiRoadmap/ReductiveGroups/README.md` | Layers 0,1,3,4,6,7,8,9 at lines 129,176,234,432,466,627,1023,1092: points, comodules, quotients, tori, reductivity, structure and pinned groups. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | §§1.1,1.15–1.16,1.18–1.21 at lines 2071,2502,2589,2745,2817,2843,2951; curve/Picard §§3.1–3.7 at 4647–4937; deformation §§4.1,4.3–4.5 and Quot §4.14 at 5066,5135,5194,5244,5706. Generic stack/Picard carriers remain supplied. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` | F.0.1–F.0.3 at 175,200,231; F.1 at 457; F.2.1–F.2.7 at 504–759; F.8 at 1265; F.10 at 907,940,1108,1295,1372,1411; G.1–G.3 at 57,105,139. These are scheme coefficient/operation theorems. |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md` | L0A–L2B at 215,228,255,269,290,306,340: module sheaves, polynomial operations, relative Spec and bundles. |
| `TauCetiRoadmap/AlgebraicCurves/README.md` | Layers 0–5 at 403,455,478,520,578,624; dictionary Layer 12 at 1468. Places and divisor degrees include residue degrees. |
| `TauCetiRoadmap/JacobianChallenge/README.md` | D at 218, F at 448: Picard functor, rigidification and Abel–Jacobi. Picard scheme is not the Picard stack. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` | AL.3.10.1–.13 at 2312–2448, pure realization at 2459. Adeles, additive analysis, reciprocity, slopes/bounds, two-leg carriers, essential cohomology and ramified induction are imported. Multi-leg/scheme-model comparisons here add an interface, not a second global GL_r proof. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` | §§3.1–3.2 at 1095,1119: fixed-curve reductive Bun and local loop quotient; R03 corrects names, not ownership. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` | §§0.5,1.3 at 668,1158; §§2.3–2.5,2.8–2.10,2.12 at 1659,1786,2065,2331,2451,2546,2785; §§5.3,5.6 at 5106,5524; §§6.1–6.3,6.5 at 6218,6283,6562,6934. Scheme scope distinguished from this roadmap's stack extension. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md` | §5.4 at 3054 and 3076: general oriented product and Orgogozo modification; R03. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md` | §§0.12,0.15,5.5,7.8,7.12,7.15 at 748,774,1565,2196,2254,2308; §8.24 coefficient descent at 2876–2895. DM rational étale coefficients are imported; lisse-étale comparison and Artin extension remain here. |
| `TauCetiRoadmap/FunctionFieldArithmetic/README.md` | §§0.3,2.2,5.1,5.3,5.8,6.1–6.4 at 515,719,1726,1807,2019,2108,2159,2204,2252. General reductive function-field cusp finiteness already owned; §0.14 is the stack-function comparison. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md` | R02.3.2 at 2074, especially class formation at 2245: ideles, degree, arithmetic reciprocity and Brauer invariants. |
| `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md` | §§6.1–6.2 at 1114,1128: neutral reconstruction with actual exact faithful fibre functor and antipode. |
| `TauCetiRoadmap/LanglandsParameterStacks/README.md` | §§0.1,1.13 at 135,456; §§2.9–2.14 at 682,703,713,723,741,757; §§3.2–3.5 at 807,827,838,848. Universal excursion/reconstruction objects are imported; global profinite continuity is separately proved here. |
| `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md` | Trace determination at 883 requires d! invertible; field determinant reconstruction at 1951 does not. Modular reconstruction does not misuse characteristic-zero traces. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md` | RG2.3.7 at 5203, RG2.5.1–RG2.5.2 at 6724,6931: Lang, dual group, L-group. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` | SR.0.4/1.3/2.1–2.2/3.1–3.2/4.1 at 838,1268,1872,2001,2526,2665,3146; segments at 4401; raw WD/operations/F-semisimplification at 4432,4518,4624; rec at 4658. Geometric duality adapter agrees with arithmetic reciprocity at 4663 and rank-one normalization at 4691. |
| `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md` | LPV.0 at 317; trait functors and finite/adic comparisons at 418,518,599,645. |
| `TauCetiRoadmap/RelativeFarguesFontaine/README.md` | §6.5 at 2172: Beauville–Laszlo for glueable modules, with finite-projective criterion. No blanket flatness of completion is assumed. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md` | §1.3 at 603: coherent quotient Grassmannians and flags. Generic carrier is imported; the periodic elliptic-chain carrier is local to §2.7, subject to R01 contract cleanup. |
| `TauCetiRoadmap/GeometricSatakeAndFusion/README.md` | §0.29 at 803–815: ordinary finite-dimensional Schubert models before perfection, quotient determinant O(1), coefficient/jet comparisons. Multi-leg collision families remain here. |

Against open work, `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md:14` explicitly consumes this finite-extension Satake theory and extends coefficients/geometric fields; it does not supply this roadmap's proof. `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md` consumes §0.13's masses in its supplier contract and later Hall/Higgs constructions. `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md:7` consumes the elliptic-sheaf carrier. `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:7` extends perversities on general-base schemes, not the Artin-stack Satake/shtuka construction here. These boundaries justify ownership rather than a new duplicate carrier. No fully qualified declaration collision is possible in this empty Suggested.lean.

Internal supply goes from geometry to cohomology, Galois actions, global excursions, then local excursions/comparison. In particular §7.8 does not consume §7.11, and §6.3 imports AL.3's independently owned global correspondence. Generalizing coefficient or nonsplit scope is stated as a construction here, not as an unsupported stronger supplier theorem. The unresolved contract duplication is R01; no additional upward edge or cycle was found.

## Not verifiable

- **Del73**, §§8.4–8.6, especially pp.568–570: already settled as uncertified in the source manifest. Its text was not requested again. The raw-parameter interface was checked in the actual supplier, and the displayed geometric/arithmetic, duality and monodromy formulas were tested above; this is not certification of Del73's complete proof.
- **§5.13 multiplicity formula:** explicitly conjectural in the roadmap/source. Its trivial-representation and centralizer tests were checked, but it is not certified as a theorem or allowed as an input to the proved decomposition.
- No seeded source text was inaccessible. Harder's scan has imperfect OCR; the SL_r normalization was cross-checked with the independently computed P¹/F₃ volume. No missing-source request is pending.

## Source issues

- **Misprint** in YZ at §3.5.4, p.38 (YZ line 2369): the source says the normalized boundary summand has negative shift and twist; it should be the positive shift and twist obtained from Corollary 3.29; affects a stated result.
- **Misprint** in YZ at §3.5.4, p.38 (YZ line 2372): the source says a fixed-degree rank-one fibre is a full Picard torsor; it should be a Picard-degree-zero torsor, with the degree union a full Picard torsor; affects a stated result.
- **Misprint** in YZ at §3.5.4, p.38 (YZ line 2380): the source says every summand uses the unprimed degree index; it should be the running degree index κ′; affects nothing.
- **Misprint** in Feng at §5.3, p.36 (Feng line 1614): the source says Frobenius–Weil automorphisms fix F_q; it should be F_ℓ in this paper's base-field notation; affects nothing.
- **Error** in LL's cited 1997 book at §VI.3f, Lemma 11 (reported in LL, Chapter I, p.32, LL line 1712): the source says the relevant expansion has only exponential factors; it should allow polynomial factors multiplying the exponentials; affects a stated result; corrected in print at LL, Chapter I, Proposition I.10, Theorem I.13 and the following remark, pp.30–32.
- **Error** in Xue-I at proof of Lemma 8.2.4, pp.55–56 (Xue-I line 3366): the source says every A/mⁿ is finite torsion over O_E; it should distinguish maximal ideals above λ from those where λ is invertible; affects the proof.
- **Error** in Ric at Corollary 5.8, p.22 (Ric line 1051): the source says conjugation by χ(γ⁻¹) gives the semidirect-product isomorphism; it should use right translation by a chosen inverse half-Tate lift; affects a stated result.
- **Gap** in VL at proof of Lemma 12.19(c), p.160 (VL line 8800): the source says the order-of-kernel tensor power of an arbitrary faithful representation factors through the quotient; it should separate central-character summands before forming powers, then prove boundedness; affects the proof.
