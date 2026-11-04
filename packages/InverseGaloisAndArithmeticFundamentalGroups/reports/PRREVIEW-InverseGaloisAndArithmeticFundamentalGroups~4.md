# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at 5ae28d2)

**Verdict:** needs changes

## R01 (P1) — Replace the nonexistent Sha comparison in the supplier contract

**Location:** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:410`: “with `PoitouTate.sha_eq_absoluteSha`”.

**Claim:** ArithmeticGaloisDuality §R02.4.2 supplies this comparison. The name occurs in neither its current README nor Suggested.lean, nor in either pinned library. This is supplier drift, rather than a declared gap.

**Witness:** `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:3249` identifies the kernels only for all places; its next sentence explicitly says inflation need not carry the restricted kernel into the absolute kernel for general `S`.

**Repair:** Delete the stale declaration name. Cite §R02.4.2, *Restricted products of local cohomology and Ш^r_S*, for its actual all-place transport, explicitly with `S` equal to all places. Keep the restricted-ramification groups in IG.4.3; its proof already does so. Do not request the unrestricted identification as a supplier gap. Negative control: for `K = ℚ(√−35)`, `M = C₂`, and `S` the places above 2 and infinity, the Hilbert class field gives a nonzero restricted kernel, whereas the absolute degree-one kernel is zero. The corrected contract makes no identification in this case. At all places both definitions use the same localization kernel.

## R02 (P2) — State the quaternion prescription theorem in the acceptance test

**Location:** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:4672`: “Quaternion prescriptions at every place”; `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/Suggested.lean:270`.

**Claim:** The README promises the full quaternion Grunwald theorem, including dyadic prescriptions, but the Lean file states only the supersolvable theorem away from primes dividing the group order. The quaternion theorem is a separate deep realization result, not a boundary Check or a consequence of that signature.

**Witness:** Mathlib `GroupTheory/SpecificGroups/Quaternion.lean:51` supplies `QuaternionGroup n` of order `4n`. A scratch signature using `QuaternionGroup (2^(n+1))` and the existing completion/tensor-product formulation elaborated with only `sorry` warnings.

**Repair:** Add the field-form headline for generalized quaternion groups of order `2^(n+3)`, retaining the finite and infinite local Galois extensions and their group injections, but without `hSf`. No new geometric carrier is required. The decisive instance is `Q₈`, `K = ℚ`, `S = {2}`, with the unramified quartic local field: the tensor product must be two copies of that field (`8 = 2·4`). The present signature excludes it because `8 ∈ (2)`. The new signature admits it. The source independently confirms the unrestricted set of places: harpaz-wittenberg lines 143–150, discussion after Théorème B, p. 4.

## R03 (P3) — Add the required Lean layer section comments

**Location:** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/Suggested.lean:49` through line 350; for example line 247 begins “Every finite split embedding problem over a number field”.

**Claim:** The file states results from IG.2 through IG.6 but has no layer section comments.

**Witness:** Searching this file for `/-! ## Layer` returns zero matches; the definitions and theorems cross all five layers.

**Repair:** Insert `/-! ## Layer IG.k: ... -/` comments at the layer transitions, in README order. This changes no signature; the existing successful elaboration remains the validation. This is a nonblocking form note.

## Verified sound

**Previous findings, checked first.** The old identifiers below refer to the preceding review, not to the findings above.

| Previous finding | Passage at this head and disposition |
| --- | --- |
| R01, dependency gate | Repaired: the fresh checker prints “0 problem(s)”. All nine previously disputed suppliers are on main; no UPWARD or CYCLE remains. |
| R02, supersolvable Grunwald | Repaired: README:4654 names `exists_galois_with_local_prescriptions_of_supersolvable`; Lean:270 states the completion-algebra conclusion, including infinite places. R02 above concerns the separate quaternion theorem. |
| R03, normal subgroup generality | Repaired: README:2439 uses a Hilbertian field of characteristic zero; Lean:123 carries `(hK : IsHilbertian K)`. |
| R04, four supplier locators | Repaired: README:528 cites `Algebra.exists_finite_inj_algHom_of_fg`; :394 names DGFloer Layer 1 item 2 and AlgebraicTopology Stage 8; :275 names the Tau Ceti inertia declaration; :1068 names the peripheral-power theorem and exponent character. R01 above is a different, newly drifted citation. |
| R05, bounded cores | Repaired: README:6330 cites “Proposition 6.1 with the reduction preceding it” and gives `g ↦ g^{χ(σ⁻¹)}`. Seguin lines 1156–1182 supply precisely this factorization and action. |
| R06, References | Repaired: the References now include Brion–Szamuely, Česnavičius, Jarden, Milne, Graber–Harris–Starr and Kollár, the Massey-vanishing v2 copy, and the expanded indirect-reference paragraph at :7520. |
| R07, unused hypotheses | The two unnecessary binders `0 < r` and nonidentity classes were removed. Characteristic zero remains deliberately shared by the full-group prose and Lean. The previous review explicitly classified this as a note, not a defect; not re-raised. |
| R08, further Hilbertian headlines | Repaired: Lean:107 states Weissauer and :114 states failure of topological finite generation. Both are named in the module docstring. |

**Scope, gate and signatures.** Reviewed the complete README and all 35 Lean declarations at the requested head. The diff outside this folder is empty, and the worktree remains unchanged. The worker's gate reports every check passed, including the targeted build. I ran the targeted build, then direct `lake env lean` elaboration; both succeeded with exactly 17 admitted-theorem warnings and no other diagnostics. After the build I elaborated a scratch copy with `#check @name` for all 35 declarations. No standing binder disappeared. In particular, the normality/closedness hypotheses, Hilbertianity, the nilpotent kernel and splitting, all local completion algebra structures, the scalar tower, `IsFunctionField`, primality and characteristic, and nonempty puncture set remain in the types.

The dependency command requested in the brief returned:

```text
depcheck: 200 roadmaps, 1297 edges, 0 problem(s)
```

No `set_option`, sorry-valued data, placeholder conditions, roadmap imports, admitted examples, computational algorithm, or out-of-folder edit was found. The file imports Mathlib once and four actual Tau Ceti modules. On a scratch copy, all 17 admissions were replaced with `solve | simp | rfl | infer_instance`: all 17 failed to close, with no substitution parse errors. Inspection against the pinned declarations found no one-library-lemma restatement among them. The two frontier propositions are definitions, not asserted solutions of the open problems. Definitions have real bodies and serve the retained headlines; `ReducedSchur.degree` has a proof.

**Headline coverage.** The explicitly named end theorems are Hilbert irreducibility, full-group and disjoint specialization, rational rigidity, stable generating braid-orbit classification, Shafarevich realization, and Hurwitz component/Frobenius classification. All currently statable members of that list occur. Additional deep signatures cover rational-function Hilbertianity, Weissauer, non-finite-generation and normal subgroups, split nilpotent embedding problems, supersolvable prescriptions, coprime realization degrees, Abhyankar and regular-to-ordinary realization. The module docstring identifies the missing carriers for trace formulas, local-system/Noohi/pro-étale constructions, tame specialization, Hurwitz moduli and Frobenius actions, Brauer–Manin density, arithmetic Property E, geometric Hilbert subsets, cover rigidity and patching. Quaternion prescriptions are the remaining statable omission (R02).

**Seeded sources.** Thirteen of the fifteen sampled targets have readable source inputs; the two unavailable books are listed below. For constructed adapters, the source supplies the indicated ingredients, not necessarily the adapter verbatim. I read the text, including the hypotheses, rather than relying on the source service's metadata.

| Sampled target | Locator verification |
| --- | --- |
| Idempotents representing algebra maps | kedlaya-liu lines 487–499, Definition 1.2.2/Lemma 1.2.3, p. 13: arbitrary commutative base, finite étale source, arbitrary target algebra, and the isomorphism condition on Γ(e). |
| Noohi groups/infinite Galois categories | bhatt-scholze lines 2944–2950, 2983–2985, 3044–3055, 3060–3086, pp. 63–66: Hausdorffness, open-subgroup basis, completeness, all colimits/finite limits and tameness. The open-subgroup converse is distinguished correctly. |
| Tame tangential fibres | sga1 lines 10893–10905, 11089–11107, 11381–11463, XIII §§2.1–2.4 and 2.10–2.12, pp. 277–285, 289–290, supply tame/Kummer and inertia comparison. The normalized-parameter root construction is the README's explicit adapter. wood-moments lines 650–690 give the branch-generator conventions and a narrower invariant comparison, not a general tangential-base-point theorem. |
| Proper descent | stacks lines 1038–1070 (0BTL/0BTM) give full faithfulness and local effectivity; Stacks 0GF0 lines 10851–10856 gives proper-surjective descent for étale sheaves. The README retains the further representability/algebraization argument for covers. |
| Polynomial guard | Mathlib `FieldTheory/RatFunc/AsPolynomial.lean:144`, :182, :201 gives reduced-fraction evaluation and its guarded laws; debes lines 5087–5160, printed pp. 135–137, supplies the Hilbert-specialization context. The explicit guard is derived in the README. |
| Independent quadratic characters | The simultaneous quadratic-polynomial argument checks directly; the Fried–Jarden book locator is not certified. |
| Nielsen questions | chen lines 222–235 and 504–509, pp. 5, 11; mccullough-wanderley lines 42–50 and 300–308, pp. 481–482, 487. The latter uses field-automorphism orbits of traces, correctly retained here. These remain open propositions. |
| Fitting supplements | schmidt-wingberg lines 6852–6868, Propositions 16–17: a normal subgroup not contained in Φ has a proper supplement, and Φ is strictly smaller than F for nontrivial finite solvable groups. The extraction is garbled; the two propositions remain legible, but its generated page markers do not certify printed pagination. |
| Central Property E | lwzb lines 491–495, Definition 2.3, p. 11: nonsplit central prime-order kernel, trivial operator action, equivariant surjective lifts. |
| General-genus Hurwitz comparison | sga1 lines 9872–9895 and 9957–9970, XII 5.1/5.2, pp. 251–254, give finite-cover comparison; chen lines 624–700, 1064–1076 gives general `(g,n)` cover groupoids/equivalence. Family transport and infinitesimal comparison are the separately specified Ehresmann/Kummer/GAGA route. |
| Admissible stacks/stable marked curves | chen lines 991–1076, Definitions 2.4.3/2.4.7, Propositions 2.4.4/2.4.6/2.4.8 and Theorem 2.4.9, pp. 21–23: faithfulness, markings, inverse branch characters, type data and connected variant. The roadmap does not inherit the source's false flatness claim. |
| Hurwitz cohomology/trace | deligne-weil-ii lines 2640–2644, Corollary 3.3.4, printed p. 206: compact-support weights bounded above by degree for the constant weight-zero sheaf. The weight bound is explicitly a hypothesis of the point estimate; trace itself is constructed in IG.0. |
| Semidirect versus quotient components | lwzb lines 1844–1855 and 2428–2512, Theorem 10.4/Lemma 12.10, pp. 39–40, 53–54: admissibility, the `q(q−1)` coprimality, abelianization and multiplier comparison. Identity inertia is excluded in this roadmap's exact-branch convention. |
| Complete-DVR field patching | harbater-hartmann lines 340–351, 455–505, 859–884, Notation 4.3/Theorems 4.9–4.11/7.1, pp. 9, 12–13, 22: arbitrary subsets, the empty-patch convention, vector spaces and Galois algebras. It does not assert that all glued algebras are fields. |
| Inverse Galois frontier | The implication follows from the stated specialization theorem, and the two problem definitions are correctly quantified. Serre's second-edition locator remains uncertified. |

**Pinned and ownership evidence.** Opened Mathlib's `RatFunc.eval` and its two guarded laws above; `RingTheory/NoetherNormalization.lean:287` (`Algebra.exists_finite_inj_algHom_of_fg`); `GroupTheory/SchurZassenhaus.lean:277` (existence, not conjugacy); and `GroupTheory/SpecificGroups/Quaternion.lean:51`, :91, :166, :174 (carrier, group, finiteness, order). Opened Tau Ceti `Topology/Algebra/Group/Generation.lean:73`: finite generation means a finite set generates a dense subgroup, not abstract finite generation. `Topology/Algebra/Group/Profinite/EmbeddingProblem/Basic.lean:60`, :92 bundles the two finite groups, quotient surjections and open kernel; `IsSolution` supplies continuity and commutativity, not properness. The headline adds surjectivity. `FieldTheory/FunctionField/Basic.lean:49` defines one-variable function fields by a transcendental parameter and finite dimension, not by a chosen rational-function embedding. The genus and place-ramification carriers were checked in `FieldTheory/FunctionField/RiemannRoch/Genus.lean:189` and `Place/Extension/Basic.lean:311`. `NumberTheory/ClassFieldTheory/Local/Unramified.lean:432` gives the valuation-zero unit inertia lift, and :441 gives arithmetic Frobenius for a uniformizer.

Object searches used the roadmap service on main and open work, the pinned libraries, and the board package context. In particular, finite étale torsors belong to AdicEtaleGeometry A4.2 (README:9267–9299 explicitly assigns the field-specialization consumer here); finite étale fundamental groups and coefficient cohomology belong to EtaleCohomologyFoundations F.0–F.6; ordinary arithmetic trace is assigned here by its introduction and SchemeAndStackFoundations README:7388–7391. No second `U(G,c)`, Hilbertian-field or Noohi construction was found among the supplied sibling work. The simple supersolvability predicate needed to state a field theorem is equivalent, for finite groups, to FiniteGroupInvariants §1.1's cyclic-normal-series predicate; it is not a second plan for that roadmap's classification theory. Their fully qualified names differ. Fitting theory is imported from LocalFiniteGroupTheory L2, not rebuilt here. No signature in this file duplicates a readable sibling's fully qualified declaration name.

Resolved the supplier tables and Needs lines against current text. Concrete anchors: EtaleCohomologyFoundations README:203 (Galois categories), :284–387 (field/inertia/arithmetic sequence), :778–827 (henselian tame character), :850–885 (representations/lattices), :459–761 (ctf, base change, compact supports, Künneth), :963–1091 (adic realization), :1182–1202 (duality/purity); EnhancedDerivedSheaves §§0.1–0.3; SchemeAndStackFoundations §2.17 (:3956), §3.2, §4.10 and §5.11; ClassifyingSpaces Stage 4 item 17; DGFloer Layer 1 item 2 and AlgebraicTopology Stage 8; PeripheralActions README:8–20 and its peripheral-power theorem. ArithmeticGaloisDuality R02.3.0d, 3.1, 4.2–4.3, 4.5a–b supply the localization route, with the exception R01. ArithmeticGaloisRepresentations §§3.1, 3.4 and 6.4a supply conductor scaling and Frattini openness. ComplexComparisonPartII §§C−1.1–C−1.2, C1.9, C3.3, C4.5, C5.2 and C6.0–C6.6 retain properness, finite type, coefficient and transport conditions. Resolution §5.5/§6.2 is consumed through AlgebraicModuli §§9.4–9.5. AdelicAlgebraicGroups §4.1 supplies Hasse/weak approximation; ReductiveGroupsPartII RG2.0a supplies norm tori. Main/Completed versions of BelyiMaps, ProfiniteArithmetic, ProfiniteProPGroups, ProfiniteCohomology, PolynomialGaloisGroups, ClassFieldTheory, Chebotarev, LocalFieldsRamification, AlgebraicCurves, ModularCurves, ReductiveGroups, GlobalNumberFields, StableReduction, RepresentationTheory/InductionRestriction and DifferentialGeometry contain the cited layers. Existing-roadmap revisions were not substituted for main. PeripheralActions, AdicEtaleGeometry and Completed/ProfiniteProPGroups were also read as shape comparisons.

**Computed adversarial pass.** Each row identifies a README target by its line and abbreviated title. Values are explicit test computations, not proofs of the full theorem. “Retain” means this test finds no required mathematical change; source limitations remain separate. The rows include all 169 bold target blocks, all seeded targets, the Lean headlines and the targets touched by findings.

| Target (README line) | Instance and computed values on the two sides | Result / change |
| --- | --- | --- |
| 478 Curve trace | Identity on genus 0/1: Δ² = 2/0; `1−Tr(H¹)+deg = 1−0+1 / 1−2+1 = 2/0`. Constant map: intersection 1, expression `1−0+0=1`. | Retain; self-intersection and isolated fixed points distinguished. |
| 502 Finite trace | One rational point with coefficients ℤ/4: trace 1, point sum 1; empty scheme: 0, 0. No averaging by 2 is available in ℤ/4. | Retain ctf/perfectness. |
| 537 Rational trace, all powers | P¹ over 𝔽₃, power 2: traces 1 and 9, alternating sum 10; `#P¹(𝔽₉)=10`. | Retain geometric Frobenius. |
| 559 Constant trace | A¹/𝔽₂: compact H² has eigenvalue 2 and other groups 0; count 2. Gₘ: `−1+2=1`, count 1. | Retain compact supports. |
| 583 Galois algebras | `K×K`, swap C₂: dimension 2; tensor/map dimensions 4 and 4, matrix permutes the four primitive idempotents. Zero algebra: dimension 0, excluded by nonzero condition. | Retain disconnected torsors. |
| 639 Idempotent maps | `A=R×R`, `B=R` connected nonzero: two maps, qualifying idempotents `(1,0),(0,1)`; `(1,1)` gives rank 2 instead of 1. For `R=k×k`, there are 4 independent componentwise choices. | Retain Γ(e) isomorphism, not primitive-idempotent shortcut. |
| 666 Integral finite monodromy | Continuous compact image in discrete GL₁(ℤ) has at most 2 elements. Nodal loop acting by `[[1,1],[0,1]]` has powers `[[1,n],[0,1]]`, infinitely many. | Retain normality. |
| 700 Integral/isogeny/rational systems | Nodal rank-one monodromy p sends `p^aℤ_p` to `p^(a+1)ℤ_p`, never the same lattice. Multiplication `p⁻¹` is rational but not integral. | Retain stackification/global-lattice distinction. |
| 748 Lisse comparison | Trivial rank-one system: reductions have orders ℓⁿ, inverse limit ℤ_ℓ and rationalization ℚ_ℓ. Monodromy ℓ: zero invariant lattices, so outside the essential image. | Retain invertible ℓ and global-lattice condition. |
| 809 Bounded lattices | Rank 1, m=0/1: allowable lattices count 1/3 (`ℤ_p`; `pℤ_p,ℤ_p,p⁻¹ℤ_p`), agreeing with `2m+1`. | Retain incidence bounds. |
| 850 Noohi | Discrete ℤ: Aut(forgetful)=ℤ and reconstruction identity; its profinite completion is Ẑ, a different group. Trivial group gives Set and Aut=1. | Retain noncompact examples and tameness. |
| 885 Pro-étale torsors | Normal field base gives profinite Γ on both sides. Nodal rational curve admits quotient ℤ; the loop maps to 1, and rank-one monodromy is p, with infinite image `{p^n}`. | Retain open-profinite reduction. |
| 990 Tame versus prime-to-p | A¹ over algebraically closed char p: tame group 1, local tame inertia `∏ℓ≠p ℤ_ℓ(1)` maps to 1. Gₘ gives that Tate module globally. | Retain local/global distinction. |
| 1056 Tangential fibres | `z³=t` in char 2 has 3 lifts and a 3-cycle. `t'=t(1+t)` changes roots by the unique unit root reducing to 1. `y²−y=t⁻¹` has wild index 2, excluded. | Retain tangent normalization/tameness. |
| 1091 Frobenius | μ₅ over 𝔽₂: arithmetic exponent 2, geometric exponent 3, product 6≡1 mod5. Degree-two boundary over 𝔽₂: stabilizing power has exponent 4. | Retain inverse convention. |
| 1126 Henselian covers | Strictly henselian base: rank-n covers and closed fibres both split into n copies. Square-zero thickening `k[ε]/ε²` has the same n sheets as k. | Retain proper base condition. |
| 1171 Proper descent | Identity map: descent object V and recovered V coincide. Split double cover under a blow-up descends to two sheets; zero sheets descend to empty cover. | Retain proper-surjective and effective descent. |
| 1231 Proper smooth specialization | P¹: both geometric groups 1. Elliptic curve: prime-to-p Tate ranks 2 on both fibres; supersingular special p-rank 0 need not equal ordinary p-rank 1. | Retain prime-to-p isomorphism only. |
| 1255 Relative boundary | Three disjoint sections on P¹ give prime-to-p free rank 2 on both fibres. Three lines degenerating to concurrent lines: generic π₁=Ẑ², special π₁=free profinite rank 2. | SNC hypothesis excludes degeneration. |
| 1291 Char-zero base extension | P¹ minus three points over Q̄⊂ℂ: degree-two connected covers count 3 on each side, from the three nonzero maps F₂→C₂. | Retain all finite-type schemes via descent. |
| 1359 Arithmetic representations | Trivial representation: orbit size 1. Unipotent Gₘ monodromy `[[1,1],[0,1]]`: infinite image, yet scaling its off-diagonal entry gives conjugate matrices and orbit size 1. | Retain finite orbit, not finite image. |
| 1384 Moduli outer action | Once-punctured torus: π₁ free rank 2; elliptic involution induces −I on H₁=ℤ², not identity. For identity base map, induced outer map is identity. | Retain stack inertia. |
| 1419 Semisimple pointed covers | `SL₂→PGL₂`: kernel μ₂ and degree 2; simply connected SL₂ has no nontrivial connected pointed étale cover. | Retain central-isogeny form. |
| 1464 Finite-stabilizer quotient | `SL₂→SL₂/{±1}`: geometric π₁=C₂; stabilizer 1 gives π₁=1. A disconnected source would not supply the claimed universal cover. | Retain connected/simply connected source. |
| 1570 Regular rational functions | At t=0, `1/(T+1)` regular with value1; `1/T` not regular but total evaluation0. | Retain subring domain. |
| 1613 Reduced denominator | `(T²−1)/(T−1)=T+1`: reduced denominator1 and value at1=2, not unreduced 0/0=0. | Retain reduced fractions. |
| 1627 Regular evaluation | At0, `T/(T+1)` maps0 and `1/(T+1)` maps1; their sum1 maps1=0+1. | Retain ring map on regular subring. |
| 1660 Total specialization | `Y+T⁻¹` at0 gives Y; it exists as a total polynomial but its second coefficient has a pole. Zero polynomial maps0. | Retain total/regular distinction. |
| 1698 Coefficients | `p=T Y²+1`, t=2: coefficients `(1,0,2,0,…)` both by specialization and by individual evaluation. | Retain out-of-range zeros. |
| 1712 Coefficient-map compatibility | Regular p above: mapping coefficients at2 gives `2Y²+1`, equal to specialization. At a pole there is no evaluation ring hom on the full RatFunc field. | Retain restricted domain. |
| 1727 Addition | At0, `T⁻¹+(1−T⁻¹)=1`: total evaluation left1, separate values0+0=0. For regular T and1: both1. | Retain both regularity hypotheses. |
| 1746 Multiplication | At0, `T·T⁻¹=1`: value1 versus0·0=0. For T+1 and T+2: both2. | Retain both regularity hypotheses. |
| 1765 Denominator product | `p=Y²+T⁻¹Y`: D=T; p=0: empty product D=1. | Retain zero coefficients' denominator1. |
| 1794 D nonzero | Above D=T≠0 even though D(0)=0; p=0 gives1≠0. | Retain polynomial versus evaluated nonvanishing. |
| 1808 Regularity locus | `Y+T⁻¹`: all coefficients regular exactly at t≠0; D(t)=t gives the same set. | Retain equivalence both ways. |
| 1823 Degree | `TY+1` at0 has degree0 versus1; `Y+T⁻¹` keeps degree1 at0 despite a lower pole. | Retain precise leading-coefficient criterion. |
| 1847 Guard | `TY+1`: guard T vanishes at0, degree0≠1. `Y²−T`: guard1, at4 gives two linear factors. p=0: guard0. | Retain guard claims only regularity/degree. |
| 1869 Bad parameters | `Y+1/(T²−T)` over 𝔽₂: bad set `{0,1}`, size2; there is no good parameter. | Retain finiteness without existence. |
| 1888 Finite avoidance | Over ℚ, forbidden roots0,1 leave t=2 with guard product2≠0. Over 𝔽₂ the same forbidden set is the entire field. | Retain infinite field for existence. |
| 1908 Hilbertian definition | `Y−1/g(T)` at a zero of g specializes to Y but fails coefficient regularity; elsewhere denominator nonzero. `Y²−T` at2 over ℚ is irreducible, over ℂ never is. | Retain simultaneous family/guard condition. |
| 1961 Finite permanence | `ℚ⊂ℚ(√2)` degree2 and identity degree1 both satisfy permanence. The proper-degree restriction needed for Weissauer is absent here. | Retain finite extension scope. |
| 1986 Hilbert irreducibility | r=0: evaluation is identity, g stays g≠0. r=1, `Y²−T`, guard T: t=2 gives degree2 and irreducible `Y²−2`. | Retain r=0. |
| 2022 RatFunc Hilbertian | Over 𝔽₂(S), `Y²+Y−T` at t=S gives degree2 and no rational root: a pole of `h²+h` has even order, S has pole order1. | Retain arbitrary constant field. |
| 2041 Thin sets | Squares in ℚ are the image of the degree2 map x↦x²; identity map has degree1 and cannot certify all ℚ as thin. | Retain degree>1 and proper closed sets. |
| 2072 Lang–Weil | A¹/𝔽_q: count q, main term q, error0; two affine lines: count2q, cannot use geometrically irreducible main term q. | Retain geometric irreducibility. |
| 2106 Integral thin count | Squares among integers of absolute value≤N number `⌊√N⌋+1`, order N^1/2, versus the ambient `2N+1`. N≥2 keeps logN positive. | Retain range/ambient dimension. |
| 2142 Full group | `(Y²−T)(Y²−2)` at t=3: group C₂² of order4 on both sides; at t=2 specialized splitting group C₂ of order2. Constant f=1 has degree0 and trivial groups at all t. | Retain full-group Hilbert set, not regularity of constants. |
| 2180 Disjoint fibres | √2,√3 extensions: degrees2,2 and compositum4. Repeating √2 gives compositum2 and fails disjointness. Trivial group gives degree1 and remains disjoint. | Retain relative compositum condition. |
| 2210 Frattini detection | P=C₄, Φ=2C₄: subgroup2C₄ maps to0 in C₂, not surjectively; P maps ontoC₂. In ∏C₂, Φ=0 is not open. | Retain closed subgroup and finite Frattini quotient. |
| 2253 Disjoint quadratic example | Classes of primes2,3,5 give degree8 compositum; each nonempty subproduct has an odd valuation. Repeating2 gives square4 and degree only2. | Retain distinct independent classes. |
| 2281 Weak approximation | Take ℝ-neighborhood(1,3), 5-adic neighborhood2+5ℤ₅ and polynomial Y²−T: t=2 lies in both, and Y²−2 is irreducible. Equality t=0 has radius0, not an open neighborhood. | Retain open neighborhoods; boundary equality has radius0. |
| 2317 Local specialization | At5, t∈2+5ℤ₅ makes `Y²−t` unramified quadratic (2 nonsquare mod5); t∈1+5ℤ₅ gives split fibre. | Retain local-open and full-group intersection. |
| 2348 Norm pullback | Identity norm has fibres points, geometrically integral. Squaring Gₘ→Gₘ has geometric fibre2 points, so fails the geometric-integrality hypothesis. | Retain fibre hypothesis. |
| 2380 Weissauer | M=ℚ(μ₂∞), L=M(∛2): degree3>1. L=M has degree1 and is excluded; the source hypothesis is not finite generation of M/ℚ. | Retain proper finite degree; locator uncertified. |
| 2414 Quadratic independence | ℚ, classes2,3,5: 8 square classes, Galois quotient C₂³, 8 characters. d generators permit at most2^d characters, so arbitrary r defeats fixed d. | Retain char0; direct argument verified. |
| 2439 Normal subgroups | N=1 gives dense-generator number0 and N=⊥. Γ_ℝ=C₂ is finitely generated normal but ℝ is not Hilbertian: Y²−T and Y²+T have no common irreducible specialization (t>0/t<0/t=0 exhaust the cases). | Retain Hilbertian assumption. |
| 2558 Punctured Riemann existence | Gₘ, cover z↦z³: degree3, monodromy3-cycle, extension ramification3 at0,∞. | Retain local extension data. |
| 2583 Bounded-degree covers | π₁(Gₘ)=ℤ: exactly one connected cover of each degree n; at degree≤2 count2. Free rank2 has finitely many maps to S₂ (4). | Retain finite generation and fixed degree. |
| 2609 Artin neighborhoods | Gₘ(ℂ) retracts to S¹: π₁=ℤ and πᵢ=0 for i>1. P¹(ℂ)=S² has π₂=ℤ, so is not itself an Artin K(π,1). | Retain neighborhoods, not all varieties. |
| 2657 Density | ℤ→Ẑ surjects modulo every n; modulo2 images0,1 exhaust C₂, though ℤ is not all Ẑ. | Retain density, not surjectivity. |
| 2678 Branch/Nielsen tuples | In S₃, `(12)(23)(132)=1`, generated group has order6. Empty tuple product1 but generated subgroup1; for G≠1 it is not generating. | Retain separate product/generation conditions. |
| 2720 Hurwitz action | `((12),(23))→((13),(12))`: both ordered products `(123)`, both generate S₃. Simply swapping gives `(132)`, wrong product. | Retain positive-move convention. |
| 2750 Braid-orbit monoid | Concatenation lengths2+3=5, empty length0 is unit. Product-one blocks have product1, so block interchange preserves each product and orbit. | Retain all tuples before generating restriction. |
| 2775 Exterior/T systems | C₂, rank2: 3 surjections modulo Inn or Aut(C₂); Nielsen transformations give1 T-system. C₅ rank1: 4 generators, inversion gives2 exterior orbits. | Retain both quotient operations. |
| 2811 Nielsen questions | C₂,r=2: orbit size3 and d+1=2. C₅,r=1: two orbits, so r=d does not suffice. 𝔽₄: ω↦ω²=ω+1 changes trace but preserves field orbit. | Retain open status and weak trace. |
| 2841 Single-class extraction | C₂,c={g}: any nonempty tuple is all g; after removing first entry tail generates iff length≥2. | Retain a positive stability threshold. |
| 2864 Sphere tuple realization | S₃ indices2,2,3: `2g−2=6(−2+1/2+1/2+2/3)=−2`, hence g=0. Non-generating tuple would give disconnected cover. | Retain generating condition. |
| 2899 Rigidity | S₃ classes(2,2,3): 6 generating product-one tuples, one conjugation orbit (stabilizer1). G=1,r=0: one empty tuple and regular degree1 extension. | Retain identity-class allowance. |
| 2931 Central obstruction | Centre1 gives H² coefficient1 and obstruction0. For a central C₂ obstruction, cocycle value −1 cannot be replaced by1 without a splitting. | Retain actual descent cocycle. |
| 2959 Real moduli obstruction | Lift of the real involution in SL₂(𝔽₅) has square−I, order4 rather than2; descent would require squareI. | Retain negative real example. |
| 2980 Rigid S₃ dessin | Branch orders2,2,3 give total ramification `3+3+4=10`; `−12+10=−2` matches genus0. | Retain cycle convention. |
| 3012 Lift commutators | In Q₈, images of i,j commute in V₄ but lift commutator `[i,j]=−1`; changing either lift by−1 leaves−1. | Retain centrality and H₂ class. |
| 3045 Reduced multiplier | V₄ has H₂=C₂. Including a class with a nontrivial commuting-pair commutator kills that C₂; empty c leavesC₂. | Retain quotient by specified pairs. |
| 3069 Reduced covers | D₈ and Q₈ both stem-cover V₄ with kernelC₂; their exponent4/noncentral involution behavior differs, so no canonical group identification is forced. | Retain parameterized stem cover. |
| 3111 Lifted classes | S₃ transposition class has3 elements and reduced multiplier1, hence3 lifts in its selected class. In Q₈→V₄, `{i,−i}` collapses to one element before the commutator quotient. | Retain reduced quotient requirement. |
| 3139 Marked extensions | C₂ with one marked generator: a lift in ℤ can have infinite order, projection parity is still correct. Forcing lift square1 would give C₂, a different object. | Retain no order relations. |
| 3160 Universal marked group | C₂,c={g}: U=ℤ; trivial G,c={1}: U=ℤ, not1. Trivial G,c=∅: U=1. | Retain empty and identity class cases. |
| 3189 Class degree | `[x][y][x]⁻¹[xyx⁻¹]⁻¹` has degree `e_x+e_y−e_x−e_y=0`; one generator has degree1. | Retain real homomorphism body. |
| 3210 Fibre product | S₃ transpositions: U=`S₃×_{C₂}ℤ`; pair(g,n) exists iff sign(g)=n mod2. `(1,1)` fails; `(1,2)` exists. | Retain abelianization compatibility. |
| 3247 Kernel | C₂ one class: ker(U→C₂)=2ℤ; multiplier0 and ker(ℤ→C₂)=2ℤ give the same answer, not allℤ. | Retain kernel of degree-to-abelianization map. |
| 3271 Coprime semidirect | C₃⋊C₂=S₃: admissible involutions form1 class of size3; quotient C₂ has1 nontrivial class. Abelianizations bothC₂. | Retain coprime action/admissibility. |
| 3322 Unit powers | In S₃, inverse of `(12)(23)` is `(132)`, while `(12)⁻¹(23)⁻¹=(123)`; inversion is a set power map, not a homomorphism. | Retain explicit distinction. |
| 3352 Power corrections | C₂ marked lift x∈ℤ, α=3: `x³[x]⁻¹=x²` lies in kernel2ℤ. The correction is not automatically1. | Retain central correction. |
| 3374 Discrete unit action | α=1 gives `h¹ W₁(m)=h` because W₁=1. In the C₂ model α=3 needs the degree correction to preserve the specified fibre. | Retain action law with correction. |
| 3404 Cyclotomic twist | C₅ and χ=2: inverse character3 acts, since2·3≡1. Direct exponent2 gives a different element for a generator. | Retain inverse-cyclotomic convention. |
| 3450 Lifting invariant | S₃ move above: `[a][b]=[aba⁻¹][a]` by the defining relation, so both lift products equal. Length0 gives1 and degree0. | Retain ordered product. |
| 3473 Stable classification | C₂,c={g}, n≥1: one generating braid orbit and one degree-n element of U=ℤ. At n=0 the tuple does not generate C₂. | Retain threshold and generation. |
| 3500 Arithmetic lifting | Identity root evaluates1. In a C₂ branch example with infinity image g, the inverse correction multiplies g by g⁻¹ to1; omitting it leaves nonidentityg. | Retain infinity correction and restricted comparison. |
| 3645 Proper local solutions | Projection `C₂×C₂→C₂`: diagonal lift image order2 versus proper solution image4. Kernel-conjugacy is trivial here, so it cannot erase this difference. | Retain properness separately. |
| 3691 Abelian obstruction | `C₄→C₂` pulled back along identity C₂ has no splitting: an order2 lift of the quotient generator does not exist. Pullback along trivial map has obstruction0. | Retain pullback and nonsurjective-base extension. |
| 3740 Twists | For trivial C₂ action, twisting a nonzero character χ by χ yields0; image drops from2 to1 although the lifting equation persists. | Retain warning that twisting need not be proper. |
| 3786 Independent C₈ lifts | Degree8 subfields of ℚ(ζ₁₇), ℚ(ζ₄₁) ramify at disjoint primes; intersection degree1, compositum degree64. | Retain independence. |
| 3814 Wang obstruction | At2, v₂(16)=4 is not divisible by8. The degree8 subfield of ℚ(ζ₁₇) has local Frobenius order4, yielding2 quartic factors, not1 octic field. | Retain dyadic exclusion in general theorem. |
| 3844 Operator shrinking | Zero quotient target makes every coefficient image0. A nonzero one-dimensional F_p target needs at least1 surviving generator; deleting all generators gives rank0 and cannot be proper. | Retain surjective operator quotient. |
| 3888 Induced abelian solutions | For G=1, module F_p^n has order p^n; independent n characters give image p^n, versus a repeated character's image p. n=0 gives kernel1. | Retain properness and rank. |
| 3922 Restricted localization | S=T removes direct sum (0). Over ℚ,p=2 the real nonzero classes pair to1/2; dropping the real term changes1/2 to0. | Retain modified archimedean conventions. |
| 3978 Auxiliary cokernel | A=0: both cokernel and dual kernel have order1. Identity enlargement S′=S induces identity and no change in either cardinality. | Retain allowed-ramification data. |
| 4060 Cyclic correction | Two local quadratic characters summed give0 when equal,1 when exactly one is nonzero; correction can cancel ramification without preserving a chosen nonzero character. | Retain separate auxiliary properness step. |
| 4099 Split nilpotent theorem | Kernel1: β=π and imageQ. Nonsplit `C₄→C₂` has no section (order2 generator cannot lift to order4), so fails the split premise. | Retain section and nilpotence. |
| 4151 Fitting supplements | S₃: Φ=1, F=C₃, supplementC₂, orders3·2=6. S₄: Φ=1,F=V₄,supplementS₃, quotient index4. G=1 has Φ=F, so strictness requires nontriviality. | Retain supplier Fitting object. |
| 4207 Shafarevich | S₃ uses nilpotent C₃⋊C₂ order6; trivial group uses K/K degree1. A₅ is not solvable, so no claim here. | Retain solvability. |
| 4236 Approximation/localization | Trivial stabilizer has singleton H¹ and no local obstruction. C₈ at2 has an octic unramified local class absent globally. | Retain equivalence with quotient approximation. |
| 4275 Force full image | Proper H=C₂⊂S₃ misses 3-cycles; H=C₃ misses transpositions. Prescribing both types excludes each and forces image order6. | Retain auxiliary conjugacy tests. |
| 4310 Brauer–Manin | Constant quaternion over ℚ has invariants1/2 at2 and∞, zero elsewhere; sum1=0 in ℚ/ℤ. Deleting∞ gives1/2. | Retain all places and sum convention. |
| 4350 Torus types/descent | For trivial stabilizer quotient, character group0 and torus1; twisting parameter set has1 element. A C₂ quotient has character groupC₂, not0. | Retain actual type/descent map. |
| 4424 Smaller stabilizer | S₃ series `1<C₃<S₃`: quotientC₂ and fibre stabilizerC₃ order3<6. Trivial quotient would leave order6 and not decrease induction. | Retain proper shortened series. |
| 4473 Fibration density | For product V×Q→Q, each fibre is V. The Hamilton norm−1 torsor has0 real points but a geometric point, so a geometric section yields0 rational fibre points. | Retain arithmetic fibre-density hypothesis. |
| 4529 Supersolvable BM density | Hamilton norm−1 equation has real left side sum of squares≥0 versus right−1, so adelic set∅. A₄ has minimal normal V₄ noncyclic; excluded. | Retain outer-stable series and BM set. |
| 4585 Unramified Brauer | For quaternion stabilizer, quotient Br_nr/Br(k)=0; for C₈ one cannot infer this since its dyadic approximation fails. | Retain two distinct Brauer inputs. |
| 4624 Supersolvable prescriptions | S₃ at5: 6∉(5); permitted. C₈ at2: 8∈(2); excluded. Trivial local field in degree6 global realization gives6 tensor factors. | Present Lean signature matches. |
| 4672 Quaternion prescriptions | Q₈ at2 with unramified degree4 local field: tensor dimension `2·4=8`; biquadratic C₂² cannot embed in Q₈ (only one involution). | R02: add missing headline; retain all places. |
| 4704 Coprime degrees | Degrees2,3 have gcd1 although neither is1; empty list gcd0≠1. Trivial group has degree list[1]. | Retain signed-cycle argument, no degree-one inference. |
| 4740 No unramified base extensions | ℚ finite everywhere-unramified extension has degree1. Over 𝔽_q(t), constant extension degree2 is unramified but its infinity residue degree2, not split. | Retain split infinity. |
| 4769 Coprime complements | S₃=C₃⋊C₂: 3 complements of order2, conjugate by C₃; their intersection1. C₄→C₂ has no complement and orders are not coprime. | Retain conjugacy hypotheses. |
| 4803 Admissibility | Inversion C₂-action on C₃: commutators `h⁻¹σ(h)=h⁻²=h`, generateC₃. Trivial action gives only1, fails for nontrivialH. | Retain operator-generated condition. |
| 4853 Property E | Nonsplit `C₄→C₂`: any lift of a surjection to C₂ has imageC₄, since a proper subgroup maps trivially. Split C₂²→C₂ admits image2, so nonsplit is essential. | Retain prime central kernel/trivial Γ-action. |
| 4914 Arithmetic Property E | Base unramified group1 has no surjection onto nontrivialG; for G=1 a central prime extension splits. Thus no spurious forced C_p quotient. | Retain nonsplit premise and base restrictions. |
| 4951 Tame central lifts | KernelC₃ with μ₃ adjoined has inertia character valued in μ₃; without adjoining, Frobenius q=2 conjugates ζ toζ², notζ. | Retain cyclotomic extension. |
| 4986 Global lifting | Unramified finite place contributes1; only finitely many nonidentity terms remain. Empty product=1, including identity root. | Retain finite ramification and local inertia lifts. |
| 5044 Identity-root obstruction | `I(φ,1)=1`; specifying nonidentity multiplier a gives fibre size0, rather than a uniformly positive number. | Retain explicit obstruction. |
| 5064 Infinity types | In H≀C₂ with H=C₂, pure swap has order2 and projects ontoC₂. An element in base H² projects1 and cannot have that infinity type. | Retain projection hypotheses. |
| 5141 Marked function-field count | Over 𝔽₃(t), y²=t(t−1) has finite branch degree2 and norm3²=9. Leading coefficient1 makes the infinity fibre two rational points, each residue degree1. | Retain reduced discriminant and marking. |
| 5298 Configurations | Conf₀=point, Conf₁=A¹; over𝔽₂ ordered distinct pairs number2, unordered number1. Nonzero ε in k[ε]/ε² is not a unit, so difference ε is excluded. | Retain invertible differences. |
| 5334 Configuration groups | n=1: braid group1; n=2: B₂=ℤ and pure subgroup2ℤ, quotientC₂. | Retain ordered/unordered distinction. |
| 5364 Compactification | n=2: M̄₀,₃=point, product with P¹×P¹ has dimension2; Conf₂ also dimension2. n=1 would require unstable M̄₀,₂. | Retain n≥2. |
| 5403 Marked topological Hurwitz | G=S₃,n=1: full marked fibre has6 tuples; no tuple generates S₃. Product-one restriction would leave only1 tuple, a different moduli problem. | Retain all tuple fibre. |
| 5439 Forget marking | Exact image H⊂G gives marking stabilizer C_G(H). H=G=S₃ gives1; H=1 gives all6 elements. | Retain centralizer, not always Z(G). |
| 5468 Tame families | Over k[ε]/ε², nilpotent deformation ε·y⁻m can disappear on every geometric fibre but persists in the family. Kummer model `x=u^e` has ramification e prime to characteristic. | Retain relative charts, not fibrewise normalization. |
| 5527 Arithmetic Hurwitz | Centreless S₃ connected cover has vertical automorphism group1; C₂ has2. A chosen unramified sheet kills both possibilities except identity. | Retain stack versus marked scheme. |
| 5571 Arbitrary monodromy moduli | G=C₂, all-identity length2 tuple: product1, exact image1, disconnected cover2 components. Pair(g,g): product1, exact imageC₂, connected. | Retain inactive markings. |
| 5612 Analytic comparison | Four transpositions in S₃: 27 product-one tuples, 3 constant non-generating tuples, 24 generating; quotient by free conjugation gives24/6=4. | Retain specified marking/connectedness. |
| 5654 Component bound | Finite étale degree d over connected base has at most d components; split degree3 has3, connected degree3 has1. | Retain degree bound. |
| 5681 General genus | g=2,n=0, connected étale double cover: `2g'−2=2(2g−2)=4`, g'=3. P¹ unpunctured has only split H-torsor, with |H| components. | Retain arbitrary genus and all isomorphisms. |
| 5718 Admissible nodes | `ξη=a≠0`, e=3: quotient `xy=a³`; weights(ζ,ζ⁻¹) give producta, weights(ζ,ζ) giveζ²a. | Retain balance. |
| 5748 Stable marked G-curves | `z↦z²` with four target labels has source marks `0,∞,±1,±√λ`, count6, hence stable P¹; deck automorphisms commuting withC₂ have order2. | Retain marked stability and faithfulness. |
| 5791 Versal monodromy | S₃ monodromy generates order6 on a chart; finite-index subgroup can reduce the image, e.g. kernel of map toS₃ gives image1. | Retain explicit monodromy image condition. |
| 5831 Tame cohomological specialization | Constant pair P¹ minus{0,∞}: H⁰=F_ℓ,H¹=F_ℓ, dimensions1,1 on both fibres for invertibleℓ. Boundary collision changes rank and is excluded. | Retain relative SNC and tame coefficients. |
| 5891 Mod-ℓ comparison | n=2,G=C₂,q=3, ℓ=5 exceeds max=3; |S₂|=2 is invertible. ℓ=2 cannot average, since division by2 is undefined in F₂. | Retain ℓ bound. |
| 5936 Towers/rational dimensions | ℤ/ℓ and ℤ/ℓ² both reduce to one-dimensional F_ℓ, but have lengths1,2. RP² has mod2 H¹ dimension1 and rational H¹ dimension0. | Retain whole tower and inequality. |
| 5994 Hurwitz trace | Geometrically connected A¹: top compact eigenvalue q, trace/count q. Two conjugate geometric components exchanged by Frobenius have top trace0 and no rational points. | Retain geometric Frobenius and fixed components. |
| 6050 Uniform estimate | Aⁿ: count qⁿ, main term qⁿ, error0. Gₘ: count q−1, main q, absolute error1≤q^1/2 for q≥2. | Retain separate weight hypothesis. |
| 6099 Points/extensions | Split C₂ torsor corresponds to zero character, not a quadratic field; a surjective character has image2 and connected field degree2. | Retain connected/marked dictionary. |
| 6139 Component invariant | C₂ with n involutions: product is g^n, so product-one iff n even; geometric specialization preserves parity. | Retain generator transport. |
| 6185 Fixed-fibre equation | C₃, q=5,W=a: `h^(q−1)=W^q` means h=a²; dropping exponentq givesh=a. Counts both1, individual solutions differ. | Retain corrected equation. |
| 6220 Fixed components | C₂ involution class: d=1, one component for positive evenn and zero for oddn. Period2 is essential; n=0 has no generating tuple. | Retain residue-class and nontriviality conditions. |
| 6259 Semidirect counts | H=1 gives identical counts on both sides. H=F₃², Γ=C₂ inversion, q=7: multiplier kernelC₃ and q−1=6 give3 fixed lifts versus1 downstairs. | Retain gcd(q(q−1),|H|)=1. |
| 6290 Product-one monoid | C₂ pairs(g,g) multiply to length4, product1 and imageC₂; empty tuple is length0 unit/image1. Images after multiplication are subgroup joins. | Retain nested-image Galois assertion. |
| 6317 Bounded cores | C₂: ψ=1+2=3; four g entries reduce to two g entries plus block(g,g), length2≤3 and imageC₂. Empty core would have image1. | Retain exact image and inverse χ. |
| 6344 Trace-zero doubles | char≠2, y²=f: basis1,y, trace(y)=0 and trace(1)=2. In char2 trace(1)=0, so division by2 cannot split the algebra. | Retain 2 invertible. |
| 6371 Lifted affine group | `(a,b,d)` requires d²=a^n. n odd determines connected torus coordinate; n even permits signs± after dividing by a^(n/2), giving2 components. | Retain square-root datum. |
| 6408 Hyperelliptic quotient | Four simple branch points give genus1 by `2g−2=2(−2)+4=0`. At n=1 the moduli has positive-dimensional automorphisms rather than a DM quotient. | Retain stability/labels. |
| 6442 Full monodromy | Connected torsor fibre underC₂ has transitive imageC₂; split fibre2 points has image1. A degree-two base pullback can turn the former into the latter. | Retain connectedness after pullback. |
| 6483 Field patching | U₁=U₂=∅: intersection field k(x)((t)) on both sides, not k((t))(x). Split C₂ algebras glue toF×F, not a field. | Retain empty-patch convention. |
| 6516 Induced patches | S₃ with subgroupsC₂ andC₃: generated subgroup order6, glued field connected. Only subgroupC₂ gives3 components of an induced algebra. | Retain generated-subgroup criterion. |
| 6570 Cover patching | Local `x=y²` has inertia2 and branch ideal(x); identity branch has inertia1. An étale generic-point condition excludes a ramified constant field extension. | Retain common branch-divisor and generic conditions. |
| 6654 Specialize from Laurent series | Geometrically connected cover retains degree and connectedness on an open spread. Pure constant degree2 extension has geometric fibre2 components and fails the hypothesis. | Retain geometric connectedness. |
| 6684 Euler/Swan | Constant rank1 on A¹: χ_c=1. Nontrivial Artin–Schreier rank1 with Swan1 at∞: `1−1=0`. On Gₘ constant rank1 givesχ_c=0. | Retain compact Euler and wild Swan. |
| 6757 Serre step | Rank1 AS character in char2 with χ_c=0, pullback x=z³: Swan3 and χ_c=1−3=−2, so H¹ dimension2. Formula `md+(m−1)rank=0+2=2`. | Retain corrected growth term/sign. |
| 6818 Raynaud A¹ | G=C_p: p(G)=G, quotient rank0≤0; AS cover y^p−y=x realizes it. G=C_ℓ,ℓ≠p: rank1>0 and no tame A¹ realization. | Retain quasi-p criterion. |
| 6859 Harbater Gₘ | C_ℓ,ℓ≠p: quotient cyclic rank1≤1, Kummer z^ℓ=x. C_ℓ² has rank2>1, excluded. | Retain cyclic prime-to-p quotient. |
| 6894 Abhyankar | g=0,r=1 gives bound0; g=0,r=2 gives1. In char2, S₃ is generated by transpositions, so p(G)=G and quotient rank0. r=0 excluded before natural subtraction. | Retain nonempty punctures and both directions. |
| 7044 Realization objects | K/K realizes group1 degree1. `Y²−2` overℚ realizesC₂ degree2; zero polynomial is not a separable defining polynomial. | Retain field/polynomial data distinction. |
| 7075 Specialization data | `Y²−T` at2: regular degree2, GalC₂; at4: regular degree2, Gal1. Guard1 alone cannot give the realization. | Retain full-group Hilbert condition. |
| 7128 Cyclic examples | ℚ(ζ₅)/ℚ has degree4 and GalC₄; its real subfield has degree2 and GalC₂, a distinct realization. | Retain named pinned examples. |
| 7158 Dihedral example | ℚ(⁴√2,i): degree8; r sends root to i·root, s conjugates i; r⁴=s²=1 and srs=r⁻¹. | Retain D₈, not cyclic8. |
| 7191 Symmetric realizations | n=1 groupS₁=1 and degree1; n=2 givesC₂ and quadratic example. Native theorem supplies largern. | Retain pinned supplier, no parallel construction. |
| 7224 Belyi transport | Source convention `τ∞τ₁τ₀=1`; new ordered tuple `(τ₀⁻¹,τ₁⁻¹,τ∞⁻¹)` product is inverse of that word, hence1. Simply reversing without inverses changes the convention. | Retain explicit transport. |
| 7267 IGP frontier | G=1: both problems require degree1 realization. G=C₂: ℚ(√2) and ℚ(T)(√T) satisfy ordinary/regular cases. General implication uses specialization, not these examples. | Retain open propositions. |
| 7304 Generic polynomial | `Y²−T` over char≠2 realizes every quadratic `K(√a)` by T=a. Constant `Y²−2` cannot realize K(√3) overℚ; groups bothC₂ do not imply universality. | Retain all infinite overfields and regularity. |
| Supplier contract :410 (R01) | K=ℚ(√−35) has2 reduced forms `(1,1,9),(3,1,3)`, hence class number2; 2 inert gives principal prime(2), split in class field. Restricted Sha¹ has2 elements; all-place Sha¹ has1 by Chebotarev. | Replace stale comparison; all-place-only repair passes. |
| Lean form (R03) | Five represented layers versus0 layer comments; desired correspondence is5 versus5. | Insert comments only. |

The following source-error witnesses were also computed; none requires weakening the roadmap's corrected mathematical targets.

| Source statement | Instance and values | Result |
| --- | --- | --- |
| chen Proposition 2.4.4, flatness | At a node, `A=k[[x,y]]/(xy)`, `B=k[[u,v]]/(uv)`, x=u²,y=v². Generic rank2; fibre `B/(u²,v²)` has basis1,u,v and dimension3. | Finite, not flat. The README only requires C and D flat over the base. |
| wood-moments Definition 3.12, tame group | In char3, an ordinary elliptic curve has an étale C₃ translation subgroup. Together with inversion it gives an S₃-cover of P¹ with four inertia groupsC₂. Group order6 is divisible by3 although all inertia orders2 are prime to3. | Tame group has an S₃ quotient; a pro-prime-to-3 group cannot. |
| bhatt-scholze Example 7.1.2, transitive sets | S has3 elements, G=S₃. The transitive set G/A₃ has2 elements. Pointwise stabilizers of finite subsets of S have indices1,3,6, never2. | Transitive sets need quotients of the proposed generating objects, not just those objects themselves. |

## Not verifiable

- **fried-jarden**, *Field Arithmetic*, third edition, Proposition 16.11.6 and Chapter 13 (also Theorems 13.4.2 and 13.9.1(b)): the sources service's author/title/year and configured local-source search found no legal readable copy. The independent quadratic argument was checked directly; this does not certify the book's proposition number or exact page. The Weissauer locator remains uncertified.
- **serre**, *Topics in Galois Theory*, second edition, Introduction and §§3.3, 8.1: the same service searches found no legal readable copy. The frontier propositions and specialization implication were checked mathematically, but these book locators and the book's exact rigidity formulation were not independently certified from text.
- **schmidt-wingberg**: the service flags the extraction as unreadable. Propositions 16–17 are legible enough to check the statements at lines 6853–6864, but the broken pagination prevents certification of the printed page number from this extraction.
- The general-genus comparison's analytic-family/Artinian-deformation extension is a construction using the explicitly named suppliers. The sampled SGA/Chen locators support its ingredients; they do not state that whole adapter as one theorem. Likewise the tangential construction is not a verbatim theorem at the Wood locator. These limitations are not assertions that either construction is false.

The report distinguishes these limits from the two blocking defects above. No source content was added to the repository, and no source manifest was edited.

## Source issues

- **Error** in chen at Proposition 2.4.4, printed p. 22: the source says the quotient of a stable marked G-curve is finite flat; it should be finite, with flatness of the curves over the base distinguished from flatness of their quotient map; affects a stated result.
- **Error** in wood-moments at Definition 3.12, printed p. 394: the source says the tame punctured-line fundamental group is free pro-prime-to-p; it should be its maximal prime-to-p quotient that has this description; affects a stated result.
- **Error** in bhatt-scholze at Example 7.1.2, printed p. 63: the source says every transitive permutation-group set comes from a finite pointwise stabilizer; it should allow equivariant quotients of those coset sets and use naturality under those quotients; affects the proof.
- **Misprint** in chen at proof of Proposition 2.4.6, printed p. 22: the source says the component-normalization genus test uses Q′; it should use Z′, the normalization named in the preceding sentence; affects the proof.
