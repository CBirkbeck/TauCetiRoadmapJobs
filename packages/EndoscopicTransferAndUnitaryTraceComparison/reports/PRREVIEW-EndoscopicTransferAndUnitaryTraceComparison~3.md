# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #999 at 3f9167c)

**Verdict:** needs changes

Four blocking findings remain: a ramification condition that permits cancellation of the supposedly pole-removing twist, a nonexistent Levi subgroup, an incorrectly indexed weighted identity, and an SL-type construction stated for arbitrary semisimple groups. There are also two P3 findings. The worker's gate passes; this does not establish the mathematical statements.

The six findings of the previous review were checked first:

| Previous finding | Passage at this head | Assessment |
|---|---|---|
| R01, weighted fundamental lemma | §11.0a: “the residue characteristic `p` of `F` satisfies `p > N(G)e_F + 1`”; §11.0c includes the excluded places in `V`. | The original all-characteristic assertion and disclaimer of ownership are repaired. §§3.18a–3.18b, 4.3b, 4.5a and 4.10b now own the missing chain. The new geometric statements have the separate defects R03–R04 below. For split GL₄ over ℚ₂ the bound fails and the place belongs to V; it is not discarded from the global formula. |
| R02, analytic prerequisites | §11.0f: “Construct the following `L`-functions and local factors with the stated analytic properties.” | Partly repaired. Exterior-square, triple-product and restriction inputs now have an owner. §11.0h deliberately uses weak Asai identification through GSpin₄, so a strong Asai transfer is no longer an unowned prerequisite. Two of the new inputs are incorrect: R01–R02 below. |
| R03, invented trace names | Supplier contract: “the counit trace `tr_f` of `Rf_! ⊣ Rf^!` (S3), specializing to summation over the fibres for finite étale maps”. | Repaired. This is the actual DiamondSixOperations S3 contract, README lines 668–688. A two-point fibre gives multiplication by 2, not the identity. |
| R04, garbled prose | §3.6: “The API the cone chart for Higgs sections, base change and chart descent belongs to this construction”. | Partly repaired. The opening contract sentence and several old locations were corrected, but the same grammatical defect remains at eight locations; R06 below. |
| R05, Shelstad reference and missing Waldspurger entry | §2.14 now specifies “Shelstad I, §11”; References includes *Stabilisation de la formule des traces tordue I*. | Repaired. The reference no longer points to this roadmap's unrelated §11.4. |
| R06, monograph-sized targets and survey locators | §§11.0b–11.0h now separate local/global stabilization, unitary classification, analytic inputs and orthogonal/symplectic classification; §11.0g names “the book's Theorems 1.5.1 and 2.2.1”. | The requested structural repair is present. Book chapters and individual theorem locators are supplied. The unavailable book text is not certified by this review; see Not verifiable. |

## R01 (P1) — The ramification condition allows the twist to cancel

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4359`, §11.0f: “`χ` highly ramified at a nonempty set `S` of finite places and `σ` unramified outside `S`”.

Claim: under these hypotheses, `L(s,(σ⊗χ)⊗π,ρ_m⊗∧²ρ₄)` is entire.

Witness: take `m=1`, a symplectic cuspidal GL₄ representation π with trivial multiplier, and `σ=χ⁻¹`, where χ is highly ramified only in S. Then `σχ=1`; the exterior-square L-function has a pole at 1.

For a concrete family of π, take the unitary symmetric cube of a non-CM cuspidal GL₂ representation with trivial central character. The parameter identity is `∧²Sym³(V)=Sym⁴(V)⊕1` when `det V=1`. Thus the trivial constituent, and its pole, survive the alleged pole-removing twist. This is the symplectic family already used in §11.1's first Check.

Kim's testing family `T^S(m)` consists of representations **unramified at S**, not outside S: `kim03` lines 211–212. Proposition 3.4 uses precisely this family, lines 561–579, printed p.150; Theorem 3.5 retains it, lines 599–600, p.151.

Repair: state the hypotheses of Proposition 3.4 with their quantifier order: fix π and a finite S containing its finite ramification; choose χ sufficiently ramified at a place of S relative to the fixed data; quantify over σ in `T^S(m)`, unramified at every place of S. Retain the source's non-self-association condition and the precise high-ramification requirement used to obtain it. Apply the same correction to the vertical-strip bound. Add the cancellation example as a negative Check. On that example σ is ramified at the chosen place, so the corrected hypothesis excludes it while leaving the intended converse-theorem testing family intact.

## R02 (P1) — The stated D₄ Levi subgroup cannot exist

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4361`, §11.0f: “the Levi `GL₂×GL₂×GL₂` of the simply connected group of type `D₄`”.

Claim: this is the Levi on which the triple-product Langlands–Shahidi construction is performed.

Witness: `rank(GL₂³)=6`, whereas `rank(Spin₈)=4`. A Levi has the ambient group's rank. Deleting the central D₄ vertex instead gives derived group `SL₂³` and a one-dimensional connected centre: rank 4, dimension 10.

The actual derived group is also identified in `kim-shahidi02` lines 909–911, printed p.859. Three copies of GL₂ have dimension 12, so this is not a harmless replacement by a central isogeny of the stated product.

Repair: use the actual maximal parabolic of Spin₈ and its rank-four Levi, describe its central isogeny with `G_m×SL₂³`, and specify the homomorphism and central-character data that pull the three GL₂ representations onto this Levi. Then identify the eight-dimensional tensor representation in the dual unipotent radical. Keep the `m=1` Rankin–Selberg specialization as a separate specialization with its own carrier: a character is not an input to the displayed three-GL₂ construction. The corrected Levi has rank `1+1+1+1=4`, and the tensor factor has dimension `2·2·2=8`, resolving the rank witness.

## R03 (P1) — The weighted endoscopic sum loses the coset of s

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1748`, §4.3b: “`Σ_{s′∈Z_{M̂}/Z_{Ĝ}}`”.

Claim: the summand `S^{G_{s′}}_{M′}` is defined for that index set and gives the weighted fundamental lemma.

Witness: take `G=M=Sp₄`, `Ĝ=SO₅`, and `s=diag(−1,−1,−1,−1,1)`. Then `M̂′=SO₄`, but the printed index is `{1}`. It asks for `S^G_{M′}`, although `G∉E(s)` and M′ is not a Levi of G.

The connected centres are both trivial, so the ellipticity and equal-connected-centre hypotheses do not exclude this example. The source's paragraph introducing the theorem explicitly uses `sZ_{M̂}` and establishes well-definedness there: `cl-weighted-II` lines 145–146 in v1, and lines 174–175 of the published text. The theorem's displayed index omits s in both versions. This source misprint has been reproduced in the roadmap.

Repair: index by `sZ_{M̂}/Z_{Ĝ}`, or index by `t∈Z_{M̂}/Z_{Ĝ}` and replace every `G_t` in the summand and its coefficient by `G_{st}`. Retain the elliptic finite-support condition. In the example the index becomes `{s}` and the group is SO₄, which is in E(s) and contains M′ as its full Levi. The centre quotient in the displayed coefficient has order 2, so the coefficient is 1/2; the full-Levi weight itself is 1. This checks both the domain and the distinction between the weight and the centre coefficient. Add this nontrivial full-Levi endoscopic example to the Checks.

## R04 (P2) — SLₙ eigenvalue coordinates do not define the general semisimple truncation

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1613`, §3.18a: “`G` a semisimple group”; “an ordering of those roots”; “no partial sum of its coordinates over a nonempty proper subset is an integer”.

Claim: these data define the cover, ξ-stability, general position and the weighted point-count theorem for arbitrary semisimple G.

Witness: for Sp₄ in its standard representation the regular eigenvalues are `a,b,−a,−b`. Arbitrary orderings number 24, but the Weyl-group cover has degree 8. The ξ-coordinates include opposite pairs, whose partial sum is always the integer 0.

Consequently the proposed general-position test excludes every ξ in this example, and the cover is the wrong one. A general semisimple group was not even given a representation defining the characteristic polynomial. The identification of its Levi through irreducible polynomial factors has the same type-A limitation.

`cl-weighted-I` lines 62–64 explicitly restrict the introduction to SL(n). Its general definitions instead use `ξ∈a_T`, the parabolic-degree convex set, and the projections to `a_P` avoiding `X_*(P)` for every proper P (Definitions 6.1–6.3, lines 1145–1170, printed p.26). The general point count has the specified rational-form/double-coset sum and volume factors (Theorem 11.1, lines 2620–2642, p.57), not merely the introduction's factor-polynomial description.

Repair: retain the general semisimple scope, but use the regular Cartan lift at ∞, the W-cover, the convex-set definition of ξ-stability, the parabolic projection/lattice condition, and the full statement of Theorem 11.1 with its hypotheses and measures. Move the coordinate-sum and factor-polynomial descriptions into explicit SLₙ specializations. For Sp₄ the repaired cover has degree 8; a ξ avoiding the proper-parabolic lattice hyperplanes exists, and the forced sum of opposite standard weights is no longer an obstruction. Include that Check alongside the SL₂ example.

## R05 (P3) — The SO₄ multiplicity Check uses a non-orthogonal parameter

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4405`, §11.0h: “the sum of two distinct two-dimensional symplectic constituents”.

Claim: this is a split SO₄ parameter to which the even-orthogonal multiplicity coefficient `m_ψ=2` applies.

Witness: for distinct irreducible symplectic constituents U,V, `Hom(U,V∨)=0`; each has only alternating invariant forms. Hence U⊕V has zero-dimensional space of invariant symmetric forms, and no nondegenerate orthogonal form of rank 4.

Repair: use two distinct irreducible two-dimensional **orthogonal** constituents, with determinant product 1 and with the Arthur SL₂ factors/parity specified. As a representation-level control, the two inequivalent two-dimensional orthogonal representations of the dihedral group of order 10 both have the sign determinant; their direct sum has determinant 1 and a nondegenerate symmetric form of rank 4. In the formal discrete even-orthogonal setting, both constituent degrees are even, which is the intended `m_ψ=2` case. Keep the symplectic direct sum as the excluded control; its invariant symmetric form space remains zero. This repairs the Check, not the multiplicity theorem.

## R06 (P3) — Several API sentences still contain pasted noun lists

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1259`: “The API the cone chart for Higgs sections, base change and chart descent belongs to this construction”. Also lines 1070, 2029, 3069, 3817, 3838, 3912 and 4884.

Claim: these sentences specify the API in ordinary mathematical prose.

Witness: “The API the … belongs” has two noun phrases without a connector; the other seven instances have the same pattern. At line 2029, for example, “The API the GL intertwining normalizing factor” is not a grammatical subject.

Repair: rewrite each as prose listing the facts, for example: “The API consists of the cone chart for Higgs sections, its base-change compatibility, and descent along the chart groupoid.” State each retained mathematical property as a sentence or API bullet. Do not introduce prospective Lean names. The example then has one subject and an explicit list of three mathematical obligations; its existing zero-differential and isomorphism Checks still test the same construction. This is the remaining part of previous R04.

## Verified sound

**Scope and mechanical checks.** The reviewed files are the 5,609-line README and the 44-line Suggested.lean, at the requested head. The README has 15 layers and 235 numbered target sections. This was a full-folder re-review, not a review restricted to the 450-line repair. Six previous findings and all 15 seeded source targets were revisited. The concrete calculations below distinguish sound instances from the failed ones; they are not proofs of the general theorems.

The worker's gate reports every counter zero, including `outside-folder`, `stray-files`, `sorry-data`, `set_option`, `readme-ids-missing`, `depcheck` and `build`, followed by `OK`. The independent outside-folder diff is empty and the tracked worktree remains clean. The dependency command was rerun with the supplied merge order, `--movable` and the main content checkout. Its output was:

```text
depcheck: 209 roadmaps, 1491 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The direct `lake env lean` elaboration of Suggested.lean exited 0 with no output. No prerequisite Tau Ceti object build was needed. There are zero local declarations, zero admitted theorems, zero data definitions and zero examples: the binder-signature and one-tactic-padding probe sets are empty. No theorem can be certified merely from this build.

**Seeded source verification.** The following table records the texts and locators read. Page numbers are those of the cited version, not inferred from a different edition. Source prose has not been copied. The source formulas with their standing hypotheses were compared to the targets; additional proof obligations explicitly owned here are distinguished from assertions that the source already proves them.

| Sample target | Text and exact locator checked | Result and limits |
|---|---|---|
| 1.11 Kottwitz map and duality | `kottwitz86` lines 172–202, Theorem 1.2, p.368, and 380–404, Theorem 2.2, p.374; `labesse99` lines 1405–1451, Proposition 1.7.3, pp.38–39; `kaletha-rigid` lines 695–737, 1207–1228, 1601–1611, 2192–2206, Corollaries 3.8, 4.9 and Theorems 5.4, 5.7. | Finite-local bijectivity is distinguished from the real map and its fibres. The dual-centre adapter is additional to the supplied rational-point Kottwitz map. |
| 3.13 δ-stratification | `ngo-fl` lines 3828–3844 (Proposition 5.1.3, p.94), 3941–3963 (Proposition 5.2.4, p.97), 3984–4000 (Lemma 5.3.1, p.98), 4110–4140 (Propositions 5.4.1–5.4.2, p.101). | The local discriminant calculation and global codimension estimate have different base spaces; moving the singular point is retained. |
| 3.15 purity and κ-parts | `ngo-fl` lines 4448–4471 (Corollary 5.7.5, p.110), 4590–4628 (6.2.5–6.2.6, pp.113–114), 6442–6454 (Remark 7.5.1, p.149). | Proper smooth finite-stabilizer/DM hypotheses and the isotypic decomposition are retained. Remark 7.5.1 does not by itself supply a general stack six-functor theory; the README owns the needed extension and cites the scheme suppliers. |
| 4.6 group and spherical fundamental lemmas | `wald-twisted` lines 2430–2470 (4.11, p.52), 3266–3370 (5.12, pp.71–73); `hales-statement` lines 373–464 (6.1, pp.9–10), 723–731 (Remark 9.3, p.17); `shin-stablegal` lines 828–840 (Remark 3.4, p.16). | The Hales statement alone is not treated as a proof of its then-conjectural theorem. The group/Hecke reductions and the separate all-residue-characteristic route are retained. |
| 4.7a Jacquet–Langlands | `badulescu02` lines 535–559, §3.1, p.13; `scholze-llc` lines 1399–1437, definition preceding Corollary 11.3 and its proof, p.29. | Essentially square-integrable domain and the sign `(-1)^(n-r)` agree. The cohomological dual convention requires reading Scholze's proof, not copying the extra dual in the corollary's display. |
| 6.8 BC*, ζ̃*, η̃* | `shin-stablegal` lines 800–808 (3.3, p.15), 1231–1243 (4.4, p.22), 1402–1455 (4.18–4.20, pp.25–26); `cs-noncompact` lines 3012–3065 (5.4.2–5.4.3, p.70). | Satake maps, block order and parity twists are distinguished. |
| 6.16 central contribution | `kottwitz86` lines 1147–1255, §§9.5–9.6, pp.393–396; `morel08` lines 2695–2870, Proposition 3.3.4 and Remark 3.3.5, pp.55–58, and 4327–4331, Remark 6.2.2, p.93. | The README correctly says Kottwitz's theorem omits the complement. Morel supplies the unitary infinity calculation; the general central comparison is an additional target here, not a claim about Kottwitz 9.6. |
| 6.17 twisted invariant distributions | `arthur-local` lines 405–488 (§2, (2.1), pp.331–332), 598–618 (§3, (3.1), pp.335–336), 1678–1692 (Corollary 8.3), 1788–1814 (Proposition 9.1); `kottwitz-rogawski` lines 287–310, §6 Theorem 1, pp.810–813. | Component discriminants and connected centralizers are retained. Character support and twisted Paley–Wiener remain inputs to the recursion, not consequences assumed without an owner. |
| 6.28 worked trace formulas | `shin-stablegal` lines 696–722, Lemma 3.1, p.13; `cs-noncompact` lines 3240–3278, Remark 5.5.4 and Theorem 5.6.1, pp.74–75. | Recomputed the Tamagawa/outer-automorphism coefficient and its cancellation; the degree-one totally real field is excluded from the simple formula. |
| 7.3 rational Igusa trace | `cs-compact` lines 2734–2790, Definition 4.3.6, p.716, and 3312–3408, §5.2, pp.731–733; `cs-noncompact` lines 645–700, 2.2.3–2.2.4, pp.15–16, and 854–909, 2.3.5–2.3.7, pp.19–20. | Liftability and common similitude multiplier are kept; alternating cohomology is not identified with degreewise cohomology. |
| 7.10a correspondence inputs | `varshavsky05` lines 749–779, Theorem 2.3.2 and remarks, p.20. | Proper first leg, quasi-finite second leg, boundary invariance and sufficiently large Frobenius power remain explicit. |
| 10.23 segment-to-monodromy | `henniart02` lines 245–290, §§2.2–2.3, pp.593–594, and 318–370, §§2.5–2.6, p.595. | Segment convention, nilpotent special block and Frobenius semisimplification retain N. The classical correspondence and segment classification are imported, not reconstructed from traces alone. |
| 10.28 supercuspidal pair factors | `scholze-llc` lines 1725–1760, Theorem 14.1 and footnote 9, pp.35–36. | The supercuspidal domain matters: the paper's virtual extension does not give the usual L-factor on arbitrary nongeneric representations. The README separates that later extension. |
| 12.5 period maps | `scholze-weinstein` lines 2119–2147 (6.1.3, p.55), 2606–2622 (7.1.1, p.68), 2659–2681 (7.2.2, p.70); `pan22` lines 2397–2465, §§5.2.2–5.2.4, pp.55–57. | The two flags, actions and inverse-transpose conversion are distinguished; the chosen coefficient field/duality data are not erased. |
| 12.14 central quotient and tensor sectors | `dat-lt` lines 1214–1242, §3.5, pp.24–25, and 1384–1409, §4.1 notation, p.28. | Compact-mod-centre characteristic-zero sectors and conversion of the left action to a right tensor action agree. The scalar-height quotient does not erase the residual height classes. |

Additional repair-source checks: `cl-weighted-I`, Definitions 6.1–6.3 and Theorems 6.9, 11.1; `cl-weighted-II`, Theorem 1.4.1 in both v1 and the published pagination; `kim03`, Propositions 3.1, 3.4, 3.9 and Theorem 3.5; `gelbart-shahidi01`, Corollaries 1–2 and Theorem 4.1; `kim-shahidi02`, the D₄−2 derived Levi on p.859; and `asgari02`, Proposition 5.6, Theorem 5.7 and Remark 5.8, lines 651–677, printed p.688. Asgari's local input is for characteristic-zero nonarchimedean fields and generic discrete-series representations, extending to tempered representations by multiplicativity; it is not a blanket theorem about arbitrary local representations.

**Adversarial calculations.** “Pass” records the displayed instance and the negative control, not a proof of the entire target. The 49 rows include all 15 seeded targets, the headline families and every mathematical finding. Entries with structural constructions give the computed dimensions, cardinalities or operators in place of a scalar equality.

| Statement | Instances tried | Values computed on the two sides / competing models | Result; change |
|---|---|---|---|
| 1.1 crossed-module cohomology | Identity crossed module; `[μ₂→1]` over ℝ; inversion action of C₂ on C₃ | Identity: all cohomology pointed sets singleton. For `[μ₂→1]`, H⁰ has 2 elements, while H⁰ of its cokernel has 1. With trivial Γ=C₃, the semidirect H⁰ has 6 elements and is nonabelian. | Pass; abelian cokernel alone is correctly insufficient. |
| 1.2 torus duality | Split G_m and quadratic norm-one torus over a p-adic field | Split: H¹=0 and torsion coinvariants=0. Norm-one: both groups C₂; invariant cocharacter lattice=0. | Pass; invariants cannot replace coinvariants. |
| 1.3 stable classes | Regular GL₂ with quadratic characteristic algebra | H¹ of the induced centralizer torus=0; stable class contains one rational class. | Pass in this case; does not extend to all connected centralizers. |
| 1.11 Kottwitz map | Norm-one torus; PGL₂ over a p-adic field; compact SU₂ over ℝ | Norm-one groups both order 2. PGL₂ torsors and dual-centre character group both order 2. Compact real SU₂ has two H¹ classes but trivial target. | Pass; real map must not be called injective. |
| 2.4 orbital normalization | Central γ, matching Haar; double only centralizer measure | Oγ(f)=f(γ), Dγ=1; after scaling, Oγ(f)=f(γ)/2. | Pass; connected-centralizer and quotient measures matter. |
| 2.7 product normalization | Two local scalar changes c and c⁻¹ | Product changes by c·c⁻¹=1; changing only one factor gives c. | Pass for the product convention; retain compatible local choices. |
| 3.4 companion section | Polynomial X²−3X+2 | Companion `[[0,−2],[1,3]]` has trace 3, determinant 2 and characteristic polynomial X²−3X+2. | Pass; agrees with the pinned companion. |
| 3.11 Picard dimension | Pic(ℙ¹); one-node rational curve; two-component example in the README | Stack dimensions `−1=0+0−1`, `0=1+0−1`, `0=2+0−2`. | Pass; automorphism dimension cannot be omitted. |
| 3.13 δ and codimension | Local GL₂ equations t²−ε and t²−ε², odd characteristic | First: discriminant valuation 1, defect 1, δ=0. Second: valuation 2, defect 0, δ=1. Moving-node stratum has codimension 1, while fixing its position adds one condition. | Pass; distinguishes local fixed-position and global codimension statements. |
| 3.14 support inequality | Abelian fibre of dimension 1; point fibre | Amplitude 2 and `2(d−δ)=2`; point gives 0 and 0. | Pass; positive-rank test is needed in addition to the point. |
| 3.15 purity/decomposition | Point; BC₂ with rational coefficients; BG_m | Point H⁰ has dimension/trace 1. BC₂ has no positive rational cohomology. BG_m has nonzero H², unlike a finite-stabilizer zero-dimensional fibre. | Pass on stated DM scope; BG_m is excluded. |
| 3.18 geometric shift/twist | Rank-one endoscopy with r=2, q=3 | Shift is 2r=4; geometric Frobenius on twist (2) is 1/9, not 9. | Pass for shift/Tate convention. |
| 3.18a general cover and ξ | Standard Sp₄, eigenvalues ±a,±b | Root orderings 4!=24; W-cover degree 8. Opposite-coordinate partial sum=0 for every ξ; general parabolic-lattice avoidance is attainable. | Fail; R04. |
| 4.3b weighted endoscopic index | G=M=Sp₄, dual SO₅, s as in R03 | Printed index `{1}` produces an undefined stable term; corrected coset `{s}` gives SO₄. Centre quotient order=2, coefficient=1/2, full-Levi weight=1. | Fail; R03. |
| 4.6 spherical transfer | Torus integral unit; an element outside integral support | Both orbital sides are 1 on the unit and 0 off support, with unit quotient measure. | Pass; the separate small-residue-characteristic route is necessary for the general group assertion. |
| 4.7a JL character sign | Quaternion division algebra, n=2,r=1; split d=1 | Division trivial character=1; corresponding GL₂ Steinberg elliptic character=−1; `(-1)^(2−1)=−1`. Split sign=1. | Pass. |
| 5.2 normalized induction | GL₂, q=4, one uniformizer on diagonal | δ_B=4⁻¹=1/4 for diag(ϖ,1); δ_B^(1/2)=1/2, inverse normalization=2. | Pass; normalized and unnormalized inductions differ. |
| 6.8 unramified BC | Torus root 2, unramified degree 2; block sizes 2+1 | Base-change root 2²=4; evaluating the pulled-back Satake monomial gives 4. Complement parities are 1 and 0. | Pass; twists depend on the other block. |
| 6.16 central complement | Torus, one selected rational class with f(z)=1 and τ=1; zero test | Noncentral terms=0; central and stable contributions=1. Zero test gives 0 on both complements. | Pass for these controls; not a proof of general singular descent. |
| 6.17 twisted invariant distribution | Full Levi; G_m with inversion θ over ℝ | Proper-Levi subtraction=0, so I=J. On Lie(G_m), 1−θ=2, discriminant absolute value=2, square-root factor=√2; untwisted factor=1. | Pass; θ cannot be dropped from the determinant. |
| 6.28 stable/twisted coefficient | G₄ and G₂,₂ | `ι=2/(4·2)=1/4`; multiplying by τ(H)=4 gives 1; `τ(G)ε=2·(1/2)=1`. | Pass; ι and ε are different. |
| 6.28 elliptic character | GL₂ Steinberg on elliptic norms | Ordinary and normalized base-change twisted characters both −1. | Pass; a +1 sign fails. |
| 7.3 alternating trace object | One-dimensional H⁰ and H¹ with identity | Alternating dimension and trace=1−1=0, but degreewise dimensions=(1,1), not (0,0). | Pass; no concentration follows from zero Euler class. |
| 7.3 inverse frame action | Scalar frame change 2 | Inverse frame action is 1/2; using the direct action gives 2. | Pass; the variance is substantive. |
| 7.10a cohomological correspondence | Point with coefficient space E³; scalar correspondence 2 | Identity trace=3; scalar-2 trace=6; fixed-point local terms give the same numbers. | Pass; local terms retain the coefficient map. |
| 8.2/7.10a Haar idempotent | vol(U)=1/4, invariant space dimension 3 | Raw 1_U has trace 3/4; `1_U/vol(U)` has trace 3. | Pass; raw characteristic functions are not projectors. |
| 8.9 normalized constant term | GL₂, modulus value 4, auxiliary orbital value 1/2, Weyl factor 4 | Half-modulus normalization gives trace contribution 2; replacing it by the full inverse modulus gives 1. | Pass for the README normalization test. |
| 8 stabilized Fourier coefficient | Component group C₂ | Trivial-character average `(1+1)/2=1`; nontrivial average `(1−1)/2=0`. | Pass; normalization by the component-group order is required. |
| 9 raw compact cohomology | Same two-term complex with zero differential | Euler class=0, H⁰=H¹=E; with identity differential, both cohomology groups=0. | Pass; the raw object carries more information than the alternating class. |
| 10 trace recognition | Distinct bases 1/2,1/3 at exponents 0,1 | Vandermonde determinant `1/3−1/2=−1/6`; at exponents N,N+1 it is `−2^(−N−1)3^(−N−1)`, nonzero. | Pass; zero bases would invalidate cancellation after shifting. |
| 10.23 monodromy block | q=3, F=diag(1,1/3), N(e₀)=e₁, N(e₁)=0 | N²=0, N≠0; FNF⁻¹=N/3. Replacing N by 0 leaves the same Frobenius polynomial but changes dim ker N from 1 to 2. | Pass; traces alone do not determine N. |
| 10.28 pair factors | Unramified rank-one roots 2 and 3, conductor-zero ψ | Tensor root=6; both L-factors `(1−6q^(−s))⁻¹`; conductor=0 and epsilon factor=1. | Pass on the supercuspidal rank-one case. |
| 10 inner-form Grothendieck comparison | GL₂ trivial representation and Steinberg | LJ values −1 and +1; their reducible principal-series sum maps to 0. | Pass; extension to K₀ need not preserve positivity. |
| 11.0a large-p threshold | Split GL₄, e_F=1 | N=16 gives p>17. p=2 and p=3 fail; each belongs to the finite exceptional set V in global stabilization. | Pass; small places remain in the formula. |
| 11.0a Arthur weight | Rank-one convex hull with unit coroot covolume | Endpoints 0,1 have weight 1; coincident endpoints 0,0 have weight 0; full Levi has weight 1. | Pass; constant weight 1 is wrong for proper Levis. |
| 11.0f exterior-square entireness | m=1, symplectic π, σ=χ⁻¹ | σχ=1; exterior square retains a trivial constituent and pole at s=1, whereas the claim requires no pole. | Fail; R01. |
| 11.0f triple-product carrier | Three GL₂ factors and Spin₈ | Proposed Levi rank=6, ambient rank=4; corrected Levi rank=4, dimension=10; tensor degree=8. | Fail; R02. |
| 11.0h exterior-square transfer | Roots 1,2,3,4 | Exterior roots 2,3,4,6,8,12; product 13824=24³. | Pass; the Check does not assert that these are a global unitary cuspidal input. |
| 11.0h tensor/Asai transfer | Roots (1,2) and (3,5) | Tensor roots 3,5,6,10; determinant 900=2²·15²; split Asai dimension=4. | Pass for the algebraic parameter operation. |
| 11.0h even-orthogonal Check | Distinct irreducible symplectic U,V of dimension 2 | Invariant symmetric-form space has dimension 0; required orthogonal form has rank 4. Orthogonal dihedral replacement has determinant 1 and symmetric rank 4. | Fail; R05. |
| 11 packet multiplicity | Component group C₂, packet character −1 on generator, epsilon +1 | Character average `(1−1)/2=0`; matching characters give `(1+1)/2=1`. | Pass; membership alone does not give multiplicity 1. |
| 12 tower supercuspidal degree | n=1 | Cohomological degree n−1=0, sign=1, half twist=0; parameter dimension=1. | Pass; no rank-zero tower is inferred. |
| 12.5 period equivariance | g=`[[1,1],[0,1]]` | Inverse transpose=`[[1,0],[−1,1]]`; ordinary transpose has +1 instead. | Pass; dual period conventions require the minus sign. |
| 12.14 tensor sector | C₃, ρ=ζ, H with left character ζ⁻¹ | Converted right character is ζ; tensor sector dimension=1. Using H with left character ζ instead gives right ζ⁻¹ and dimension=0. | Pass; characteristic 3 averaging is excluded. |
| 12.14/12.19 scalar heights | Rank two, central scalar ϖI₂ and Frobenius | Central height shift=2, quotient has classes {0,1}; Frobenius shift=1 interchanges them. | Pass; quotienting does not make Frobenius the identity. |
| 13 packet oldforms | README q=3 level example, index 48, fixed space dimension 4 | vol(K)=1/48; raw characteristic-function trace=4/48=1/12; normalized projector trace=4. | Pass; dimensions use normalized idempotents. |
| 14 rational Igusa spectral comparison | Two equal one-dimensional adjacent-degree terms | Signed trace=0 and degreewise cohomology=(1,1); replacing it by an actual zero representation loses information. | Pass; no positivity or integral concentration is asserted. |
| 15 normalization ledger | Factors 2,−1,3,5,7 | Product=−210; omitting the sign gives +210. | Pass; all listed factors must survive export. |
| 15 Satake/Frobenius export | Roots 2,3; unramified extension of degree 2 | Polynomial X²−5X+6 becomes X²−13X+36 from roots 4,9; simply squaring the polynomial is different. | Pass. |

The prose defect R06 is tested syntactically rather than by a numerical row; its repaired sentence preserves the cone computation: zero differential gives the full K⁰ section space, while an invertible differential gives its zero subspace.

**Headline acceptance-test audit.** The headline families read from the Summary, layer endpoints and downstream exports are: stable-class classification and Kottwitz duality (Layer 1); normalized/Fourier-compatible transfer (2); Hitchin support and geometric stabilization, including the weighted extension (3); ordinary, weighted and twisted fundamental lemmas and smooth transfer (4); the normalized GL spectral input (5); stable–twisted unitary comparison (6); rational Igusa geometry and traces (7–8); raw compact-unitary realization (9); trace-defined local Langlands identification, monodromy, pair factors and inner forms (10); unitary and symplectic/orthogonal packet classifications and rank-four transfer (11); tower/period comparison and actual supercuspidal cohomology (12); pure automorphic transfer and oldform dimensions (13); signed rational Igusa spectral comparison (14); coherent normalized exports (15).

Suggested.lean's module docstring names these families and their missing carriers. The native matrix, exact K₀, isocrystal, scheme, reductive-group and orbit-topology APIs do not by themselves supply endoscopic data, admissible local/automorphic representations, Hitchin/Igusa/tower spaces or their equivariant ℓ-adic cohomology. Scalar, matrix or finite-sum identities extracted from these headlines would be stand-ins. No omitted statable headline or padding declaration was identified. In particular the rank-one isocrystal theorem already in Mathlib is neither the tensor G-isocrystal construction nor an appropriate replacement headline.

**Pinned-library audit.** Pins checked: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These ten file groups record definitions/signatures opened, not just name-search hits:

| Pinned file and line | Declaration and actual scope |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132`; `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:119`; `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44` | `Matrix.charpoly` is determinant of the characteristic matrix; monicity is present. `Matrix.IsHermitian` is exactly `Aᴴ=A`, not nondegeneracy or positivity. |
| `Mathlib/MeasureTheory/Group/Measure.lean:785` | `IsHaarMeasure` extends finiteness on compact sets, left invariance and positivity on nonempty opens. Regularity is a separate hypothesis in the general setting, as the README says. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | `Isocrystal` carries a module and Frobenius-semilinear equivalence; no finite-dimensional field is included. `IsocrystalEquiv` at 138 commutes with Frobenius, `StandardOneDimIsocrystal` at 157 uses the fraction-field carrier, and classification at 180 assumes algebraically closed residue field and finrank 1. |
| `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean:151` | `AlgebraicGeometry.IsFinite.of_comp` requires finite composite **and separated second leg**. It is not cancellation of finiteness without a hypothesis. |
| `Mathlib/LinearAlgebra/Vandermonde.lean:84` | Matrix entries are powers `v_i^j`. Determinant formula at 219, nonvanishing criterion at 233 and coefficient-separation theorem at 259 retain the domain and distinct-base assumptions. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | `AbelianVariety` bundles a group object over Spec K, properness and geometric integrality. It does not contain Honda–Tate or full faithfulness as fields. |
| `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:163` | `ExactK0` is the presented group for a chosen exact structure on an essentially small additive category. `of_conflation` at 180, `lift` at 324 and `map` at 468 provide the relations and universal/functorial maps. No smooth representation category is created by this generic construction. |
| `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:56` | `spaX` is a Frobenius orbit quotient with the adicity hypothesis. `quotientMap` at 67 and equality criterion at 72 identify integer Frobenius translates. There is no relative structure sheaf or untilt divisor in this definition. |
| `TauCeti/Algebra/CrossedProduct/Comparison.lean:267` | `brauerCohomologyEquiv` identifies the additive algebraic Brauer group with continuous Galois H² of separable-closure units. This existing field comparison is correctly imported. |
| `TauCeti/LinearAlgebra/Matrix/RationalCanonicalFormFinTwo.lean:69`; `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ConjugacyClasses.lean:206` | The companion, determinant and trace formulas are at 69,75,79. The nonscalar conjugacy criterion is at 206, finite-field nonsplit-torus criterion at 238 and conjugacy-class equivalence at 345. These finite-rank inputs are cited rather than recreated in Suggested.lean. |

**Ownership and supplier direction.** Object searches used both the roadmap service and the readable main, board-package and listed sibling trees, including Hitchin truncation, weighted orbital terms/fundamental lemmas, exterior-square/triple-product factors, Igusa traces and Lubin–Tate towers. Main was checked at `9c6e95d911c8ef4a94a1d22116bd70e3fbcb4858`. The later mod-p tower roadmap explicitly imports this roadmap's tower geometry; its complete-local/mod-p cohomology refinements are different objects. The later exceptional-theta spin-factor contract concerns the degree-eight Spin₇ representation from F₄, not the D₄ triple product or the GL₄ exterior square here. No new supplier edge to these consumers is warranted. The weighted Hitchin construction is owned here because the searched earlier suppliers provide weighted orbital distributions and general geometry, not the weighted geometric fundamental lemma. The newly specified higher-rank analytic inputs similarly extend beyond the earlier rank-one Shahidi argument.

The following concrete cross-roadmap contracts were reopened and resolved at the supplied main/open-head copies:

- `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4350`, SR.5.2 segment representations; `:4586`, classical LLC and arithmetic reciprocity with duality; `:4752`, SR.5.3 derivative adapter. This roadmap's §10.23 converts their labels into monodromy rather than restating the classification. The algebraic dual is `(r∨,−Nᵗ)`; nonabelian Weil-group inversion is not used as a homomorphism.
- `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2508`, §4.14a number-field residual blocks; `:3078`, §6.9 orbital integrals; `:3099`, §6.10 weighted orbital integrals. Quotient measure and centralizer scaling agree with the tests above. The new endoscopic stable avatars are not the supplier's ordinary weighted distribution.
- `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`, AL.2 generic newforms and AL.3.9.5–AL.3.9.6 converse theorems. These do not supply the exterior-square analytic theorem that §11.0f now owns.
- `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md`, §§5.6,5.8,6.1–6.5, in particular the `CohCorr` API and compact-support composition at lines 6428–6512 and `fujiwaraVarshavskyTraceFormula` at 7097. These are planned supplier API names, not missing declarations falsely attributed to the pinned library. This resolves the worker's two citation leads concerning `CohCorr` and `rgammac`.
- `TauCetiRoadmap/DiamondSixOperations/README.md:668`, S3 counit trace, and `:676`, finite-étale summation. The repaired citation uses its real name.
- `TauCetiRoadmap/PadicHodgeTheory/README.md:1078`, §5.5 tensor torsor and B(G) invariants, and `:1325`, §7.5 relative analytic periods. The rational-point Kottwitz map, minimal B(G) invariants and relative ℚ_p period chart stay with their suppliers; the added dual-centre, PEL and finite-E tower comparisons have separate scope here.
- `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:11` imports this roadmap's §§12.2–12.8,12.11,12.14,12.19,12.21. Its rank-two central quotient also has height shift 2, agreeing with this roadmap's convention.

The citation resolver reports no cross-roadmap citation or Lean name found nowhere. This is a useful existence check, not certification that every cited supplier proves every attributed claim. No additional supplier-drift finding is inferred from a name search alone. The README's individual Needs lines and layer dependencies remain the implementation obligations; the numerical dependency output above establishes only the inter-roadmap order. The reading of main-branch PurityOfBranchLocus and BorelEquivalenceRelations provided the repository-shape comparison. This roadmap has its summary, ownership, conventions, contracts, layer order, examples/dependencies and references. The surviving prose damage is R06.

## Not verifiable

The following locator-only inputs could not be certified from a legally readable primary text in this run. They are not being silently treated as proofs, and no request is made to park this review or edit a source manifest.

- `wald-weighted-twisted`: Waldspurger, *À propos du lemme fondamental pondéré tordu*, Theorem 3.8, Math. Ann.343 (2009), pp.103–174. The sources service reached the publisher DOI; legal search found related reports and the different unweighted paper, not this theorem's full text. The precise reduction's locator remains uncertified.
- `arthur-classification`: *The Endoscopic Classification of Representations*, Theorems 1.5.1,1.5.2,2.2.1 and Chapters 6–8. The sources service reached DOI 10.1090/coll/061 and the AMS landing page. The Clay archive supplied the survey, not the book, and the UBC archive lookup timed out. Survey theorem numbers do not certify the book's proofs.
- `henniart09`: *Sur la fonctorialité, pour GL(4), donnée par le carré extérieur*, pp.33–45. Title/DOI lookup reached an HTTP-403 response; a Mathnet repository candidate timed out. The all-place completion in §11.0f is not source-certified here.
- `jacquet-shalika90`: *Exterior square L-functions*, §8 Theorem 1, pp.143–226. Bibliographic search obtained no legal text; the attempted Columbia author-page PDF returned 404. Kim's Proposition 3.9 records the result used, but that is not a reading of the primary proof.
- `hiraga-saito12`: *On L-packets for inner forms of SL_n*, Theorem 4.14. The sources service reached the AMS landing page without full text; a candidate institutional preprint returned 403. The originating restriction theorem is uncertified, even though its application is stated in Gee–Taïbi.

Kottwitz 1986 is an OCR extraction; theorem labels and the relevant hypotheses were readable, but this review does not certify every OCR symbol. Finite-dimensional examples and the empty Lean file cannot certify the full geometric support, stabilization, classification or tower-cohomology proofs. The positive record above is limited to the identified locators, resolved contracts and computed instances; the four blocking defects independently require changes.

## Source issues

- **Misprint** in cl-weighted-II at Theorem 1.4.1, printed p.1651 (v1 p.4): the source says the sum is indexed by the centre quotient without the coset representative s; it should be indexed by s times that centre quotient, consistently with the immediately preceding well-definedness statement; affects a stated result.
- **Misprint** in scholze-llc at Corollary 11.3, p.29: the source says the left cohomological isotypic argument is ρ∨; it should be ρ under the preceding Hom definition and the proof's final trace calculation; affects a stated result.
