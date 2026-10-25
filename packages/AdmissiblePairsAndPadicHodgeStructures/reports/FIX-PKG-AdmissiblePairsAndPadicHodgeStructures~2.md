# Repair report

## F01 (P2) — applied

Summary: special → opposite-special, with both directions specified and agreement in minuscule type. Added §11.5 Checks distinguishing weights 0,−1,2 from [−1,1] and retaining the empty intersection. Evidence: HKII line 2486; definitions at HKII line 2353 and the mirabolic example at HKII line 2386. The theorem in §11.5 already had the correct conclusion.

## F02 (P2) — applied

§§0.2 and 0.4: characteristic zero alone → complete DVR with algebraically closed residue field and compatible coefficient section. Added the nonsplit PGL_2 torsor Check in §0.2. Evidence: HKI line 1151, HKI line 1168 and HKI line 1176. §§0.3, 0.5 and geometric-fibre goodness in §4.5 retain their compatible hypotheses; general vector bilattices remain unrestricted in §0.1.

## F03 (P2) — applied

Duplicate Chevalley/exhaustion gap → three pinned imports. Narrowed the observable gap to representable quasi-affine quotients in README and top-level plan gaps. Updated §§2.5, 5.2–5.3, 7.6, 8.3, 10.1–10.2 and their layer dependencies. Evidence: the pinned Character.lean theorem at line 101 and Finite.lean theorems at lines 144, 292; countability argument at HKII line 2680.

## F04 (P3) — applied

Unattributed proper projection → DiamondsAndVStacks D5.10 / profinite-products-of-locally-spatial-diamonds in the supplier contract, §10.2 Needs and Layer 10 Dependencies. The route explicitly uses chart-universe profinite compact-open parameter sets and the product homeomorphism. Evidence: that supplier's D5.10 and HKII line 2701 through HKII line 2707. Added finite-parameter and noncompact negative-control Checks.

## F05 (P3) — applied

§5.3: unbased local closedness → locally closed locally spatial cell over Spd L([mu]), partially proper there; closedness in the ambient base change remains conditional on Levi-minuscule type. §11.6: reflex-field algebraic input → input defined over L([mu]). Added torus, minuscule, nonminuscule and larger-field Checks. Evidence: HKII line 1425, HKII line 274 and HKII line 289.

## F06 (P3) — applied

§8.5: quadratic CM field → quadratic extension F/Q_p embedded in the quaternion division algebra D. Added Checks for the matching torus class, D×/F× dimension 4−2=2 and both ramified and unramified quadratic extensions, including p=2. Evidence: HKII line 2210 through HKII line 2215. Global CM terminology elsewhere concerns the separate two-lattice criterion.

## F07 (P3) — applied

Replaced all six reported labels with §§0.5, 8.4, 11.5, 10.1, 10.1 and 11.1. Replaced analogous unnamed consumer labels in §§0.1, 1.1, 1.3–1.4, 2.2, 2.4, 4.6 and 8.4 with their actual numbered sections. Each referenced heading exists; no Lean declaration was introduced or renamed.

## F08 (P3) — applied

Replaced page-marker and mismatched locators throughout all layers, conventions, examples and References. Corrected the nonexistent Example 3.2.4 and Corollaries 9.3.4/9.3.6 citations. Scholze now says 2012 and cites only the used theorem. Added BhattHansen in §10.3. Secondary author attributions now explicitly run through HKII line 2920 / HKII line 3010 and HKII line 2919 / HKII line 3003.

## Validation

Elaboration of `packages/AdmissiblePairsAndPadicHodgeStructures/Suggested.lean` with `lake env lean`, run from the pinned content checkout: **exit 0, no stdout, no stderr**. There are no TauCeti imports and no missing object files to build. No Lean process remains running.

The file remains an empty acceptance module with one `import Mathlib`, the required namespace and its explanation of every missing headline carrier. Declaration inventory: **zero definitions, instances, theorems, examples or other named declarations**. Consequently the requested `#check @name` signature comparison has an empty domain; no signature scratch declarations or binder changes are necessary. No theorem was replaced with a scalar stand-in, API lemma or boundary-case declaration. The changed README targets therefore require no Lean signature changes.

The pins were read from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Inspected the isocrystal declarations in `Mathlib/RingTheory/WittVector/Isocrystal.lean` at lines 113, 132, 138, 157, 172 and 180; the Baire declarations cited by the README; and `BDeRhamPlus` and `BDeRham` at lines 75 and 88 of `Mathlib/RingTheory/Perfectoid/BDeRham.lean`. These supply neither relative period categories nor moduli diamonds. `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean`, lines 15–26 and 57, supplies the topological orbit space and explicitly distinguishes the missing sheafed curve. `TauCeti/Geometry/Hodge/Conjugation.lean`, line 35, concerns complex conjugation, not these p-adic structures.

The three added native imports were read at their pinned signatures. The exterior-line stabilizer result requires a field, a commutative Hopf algebra and a finitely generated defining ideal, and quantifies over commutative value algebras. The subcomodule results allow a commutative semiring and require freeness of the coefficient coalgebra. The stronger field specialization, not countability of Q_p, is what the application uses.


| Pinned declaration | File and line |
| --- | --- |
| `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` | `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean`, line 101 |
| `TauCeti.Subcomodule.exists_finite_subcomodule_mem` | `TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean`, line 144 |
| `TauCeti.Subcomodule.iUnion_finiteSubcomodules_eq_univ` | `TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean`, line 292 |

The dependency command, with `--depcheck packages/AdmissiblePairsAndPadicHodgeStructures/README.md --name AdmissiblePairsAndPadicHodgeStructures --order merge-order/ORDER.txt --movable`, returned exit 0:

```text
depcheck: 48 roadmaps, 553 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The merge-order file was not edited.

`roadmaps resolve` checked main `b41e47b` and the available open heads: **no cross-roadmap citations found nowhere; no Lean names found nowhere**. Its generic notice that it did not check external library names was supplemented by inspection of the actual pinned files above. All 16 AdicSpacesPartIIPartII target anchors were separately found in `packages/AdicSpacesPartIIPartII/design/README.md`; this package-stage supplier has no exported README in the roadmap-show output. The other imported anchors were found in their named suppliers. D5.10's source and target, chart universe, homeomorphism and universally closed projection were read directly.

Ownership searches used `roadmaps grep` over main and the available open heads, together with searches of board packages by object. The matches in DiamondsAndVStacks, RelativeFarguesFontaine, BunGAndNewtonStrata and HeckeStacksAndLocalShtukas use Howe–Klevdal for their distinct foundational inputs; they do not own the admissible-pair categories or bi-analytic theorem developed here. This package remains their owner. Reductive, abstract Tannakian, period-descent and analytic-manifold constructions retain the existing supplier owners. No new generic construction is assigned here. For work with no files or head exposed by the supplied index, ownership against open pull requests was not checked.

Read the upstream README shapes in `TauCetiRoadmap/ReductiveGroups/README.md` and `TauCetiRoadmap/PerfectoidSpaces/README.md`. The package retains its layer order, API lists and existing Checks; repairs add no layer or new headline target.

Source audit, against the five certified cached versions:

| Source | Original line citations | Original page-marker citations | Final line citations | Final page-marker citations |
| --- | ---: | ---: | ---: | ---: |
| HKI | 29 | 23 | 49 | 0 |
| HKII | 88 | 81 | 150 | 0 |
| Scholze | 2 | 1 | 2 | 0 |
| LiuZhu | 3 | 1 | 5 | 0 |
| BhattHansen | 2 | 0 | 5 | 0 |

Every final cited line exists in the manifest's cached version; 211 occurrences refer to 157 distinct source lines. The numerical claim of 106 page-marker citations is confirmed. The manifest and References now cite the same five works and versions, with BhattHansen used in the body. No new work, duplicate source key or missing legal source was needed; `sources.toml` and `metadata.toml` remain unchanged. No source text was copied into the package.

Gap parity: **nine slugs**, each with exactly the same supplier and needs sentence in the operative README and top-level plan gaps. Compared parsed plans excluding `gaps`: **identical**. The actual plan diff changes only the requested two gap entries. `git diff --check`: **exit 0, no output**. No additional gate failures were supplied in the brief.

## Adversarial mathematics pass

Each row evaluates the stated target, its defining conditions and the sign or boundary data used by its API and Checks. Non-numerical membership and map tests give explicit sets, ranks or images. This is a computation record, not a claim that elaboration proves the mathematics. Conditional targets retain their independent supplier hypotheses.

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: fields and uniformizers | Q_p-breve; F₂[[t]]; a field; zero ring | First residue is F_p-bar; second has char 2; in a field every nonzero t is a unit; zero ring has 0=1 | Only the first is strict p-adic; second allowed for vector bilattices; last two excluded as DVR inputs | F02 made group residue assumptions explicit |
| Conventions: Tate normalization | Q_p(n), n=−1,0,1 | Isocrystal slopes 1,0,−1; bundle slopes −1,0,1; étale exponents −1,0,1; de Rham exponents 1,0,−1; weights 2,0,−2; modified slopes all 0 | Consistent in Layers 2–3, 6–9 and 12 | Locator corrections |
| Conventions: weights and opposite types | GL_2 type (1,0); mirabolic (1,1,−2) | First Ad weights −1,0,1 are unchanged as a set under inversion; second nonzero weights 1,1,−2 become −1,−1,2 | Two one-sided bounds differ outside reductive symmetry | F01 |
| Conventions: fractional powers | n=−1 and a=0 | Fil^(−1) is not contained in Fil^0; Fil^0 is contained in itself | Replacing a negative fractional ideal by the ring gives a false positive | Retained |
| §0.1 lattice, trace filtration and type | Rank 0; rank 1, a=−1,0,1 | Rank 0 type is empty; trace nonzero iff i+a≤0; jumps 1,0,−1 | Opposite signs correct | F08 |
| §0.1 exactness and elementary divisors | L₂=⟨e1,e2+t^-1 e1⟩ | Minimum entry valuation −1, determinant valuation 0, divisors −1,1; subline and quotient each 0; image of ambient Fil^0 in quotient is 0, quotient Fil^0 is k | Trace fails exactness | Retained |
| §0.1 ramification and lattice swap | a=1, t=u²; swap L₁,L₂ | Type 1 becomes 2 under ramification; swap gives −1 | No ramified invariance asserted | Retained |
| §0.2 good torsors | G_a; split torus; equal PGL_2 division torsors | G_a cocharacter group 0, so t^-1 class excluded; torus type a realized by t^a; Brauer invariant 1/2 becomes 0 over Q_p-bar, giving type 0 | Double cosets require trivial lattice torsors | F02 |
| §0.3 specialization dominance | Unipotent rank-two extension; split extension | Levi type 0,0; actual type 1,−1; determinant sum 0=0; split actual 0,0 | Strict dominance detects bad extension; equality detects goodness | F08 |
| §0.4 exactness equivalence | Standard cocharacter; G_a bad extension; nonsplit equal PGL_2 torsors | Split gradeds preserve the sequence; G_a quotient image 0 versus k; PGL_2 trace exact but invariant 1/2 blocks trivialization before extension | Equivalence stated on algebraically closed residue | F02 |
| §0.5 BB recovery | GL_2 types (1,0), (2,0); trivial Gamma | Ad weights respectively −1,0,1 and −2,0,2; root parameter in the second fibre survives modulo t²; trivial Gamma fixes all those parameters | Upper bound and infinite-order action are necessary to the respective arguments | F08 |
| §1.1 isocrystals and basicness | Borel with b=diag(p,1); b=1; torus | Ad Frobenius on upper root is p, slope 1; for b=1 slope 0; every torus Newton map is central | Levi-basic does not imply group-basic | F08 |
| §1.2 Levi invariance | Same Borel and torus | Both class sets identify through the diagonal datum, but root slope 1 remains noncentral in Borel | B(G) bijection does not identify basic subsets | F08 |
| §1.3 sigma-centralizer | GL_2 b=diag(p,1); simple slope 1/2 | Distinct-slope centralizer is G_m²; slope-1/2 endomorphism algebra has Q_p-dimension 4 and is quaternion division | Inner-form assertion restricted to basic b | F08 |
| §1.4 bundle stack | G=1; G_a, b=1 | Bun_1 has one object and trivial automorphisms; trivial G_a bundle has automorphisms Q_p and v-locally vanishing additive H¹ | Stack retains automorphisms | F08 |
| §1.5 basic stratum | G_a, b=1; Borel nonbasic datum | First is [*/Q_p]; second has root slope 1 and does not qualify | No nonbasic replacement by constant rational automorphisms | F08 |
| §1.6 basic twisting | G_m, b=p^n, n=1; b=1 | F_b(E_b)=E_1; F_b(E_1)=E_(p^-1); at b=1 both are E_1 | Inverse exponent correct | F08 |
| §2.1 p-adic Hodge structures | Unit; Q_p(1); Q_p⊕Q_p(1) | Weights 0,−2; modified bundle slopes 0,1; direct sum has two graded weights, not a pure average −1 | Grading and slope convention agree | F08 |
| §2.2 admissible pairs | Unit; Tate pair; O(1)⊕O(−1) | Modified Tate slope 1−1=0; transported de Rham exponent −1; degree-zero sum has slopes 1,−1, not both 0 | Slope-zero condition stronger than degree zero | F08 |
| §2.3 pointwise Tannakian structure | Zero object; unit; nontrivial unipotent extension | Fibre dimensions 0,1,2; End(unit)=Q_p; extension group can be G_a rather than a reductive group | Neutrality is not a reductivity argument | F08 |
| §2.4 basic-pair equivalence | Slopes 0,−1; tensor of two Tate pairs | Weights 0,−2; tensor slope −2 gives weight −4; dual gives slope 1 and weight 2 | Tensor and dual signs correct | F08 |
| §2.5 canonical MT/MG | Unit sums; nonzero Tate generator; unipotent extension | Groups 1, G_m, G_a; on e2, matrix [[1,u],[0,1]] gives e2+u e1 | Characters and nonsplit extensions retained | F03 native inputs |
| §2.6 invariants | G_m, type a=1 | Étale exponent 1 requires isocrystal slope −1; weight is −2=2·(−1); B(G_m,[mu^-1]) fixes this slope | Inverse type correct | F08 |
| §2.7 rigidified BKF comparison | Unit; two different slope summands | Unit modification (O,O,id); for slopes 0,−1 the second bundle is O⊕O(1) and requires its grading splitting | Rigidification is actual extra data | F08 |
| §3.1 analytic lattices and good reduction | Tate pair; self-extension parameter t^-1 | Canonical Tate exponent n; additive parameter nonzero in B_dR/B_dR+ while its only good G_a type has parameter 0 | Flag analyticity alone insufficient | F08 |
| §3.2 crystalline realization | Unit and Tate pair over strict K | D_cris dimensions 1,1; Frobenius 1 and p^-1; recovered lattice exponents 0,1 | Rank and sign agree | F08 |
| §3.3 open image | Tate generator at p=2,3; unit | Cyclotomic image has finite index in Z_p× and is open in Q_p×; unit group and image both 1 | No exceptional prime removed | F08 |
| §3.4 two-lattice CM | Unit/Tate; nonzero self-extension | Torus groups 1/G_m satisfy two canonical lattice conditions; extension has G_a and non-good lattice | Both rational structures are used | F08 |
| §4.1 rigid analytic subdiamonds | Disc; cusp L⟨u²,u³⟩; transcendental point | Seminormalization adds u; diamonds identify cusp with its seminormalization; transcendental coordinate has residue degree infinite over L, not finite | Field and seminormality retained | F08 |
| §4.2 coefficient local systems | Rank 0; rank 1 Tate O-system | GL_0=1; cyclotomic weight of O(1) is 1 and survives every finite extension | Fibre rank alone does not imply analytic-bundle descent | F08 |
| §4.3 integrality | X=A¹, x=0, ξ^-1; zero/unit ideals | 0 is integral everywhere; ξ^-1 has valuation −1 and nowhere integral; ideals 0 and 1 cut out S and ∅ | Closed-locus orientation correct | F08 |
| §4.4 relative bilattices | L₂=Fil^a; disc parameter z/ξ | Trace jumps −a,a; z≠0 gives minimum valuation −1 and determinant 0, hence types 1,−1; z=0 gives 0,0 | Type jump obstructs locally split filtration | F08 |
| §4.5 relative goodness | G_a jumping disc; constant good cocharacter | Good locus z=0 has type 0; elsewhere GL_2 trace quotient image 0 instead of k; constant cocharacter has split traces | No fibrewise flag shortcut | F08 |
| §4.6 M0 and filtered lattice | Flat line, filtration jump a=−1,0,1 | Associated exponents 1,0,−1; M0 exponent always 0; residual rank always 1 | Sign and forgetting filtration agree | F08 |
| §4.7 essential image | Unit; jumping unipotent lattice | Unit trace rank constant 1; disc Fil^0 rank jumps 2 at zero versus 1 away | Essential-image condition excludes jump | F08 |
| §5.1 Grassmannian and good cells | G_m; G_a | G_m exponents Z, each BB target a point; G_a class ξ^-1≠0 but only good cell {0} | Good cells need not exhaust | F08 |
| §5.2 subgroup immersion | Identity; inverse-character graph with chi(h)=a | Identity quotient a point; graph acts by a^-1·a=1 on v, whereas z=a acts by a² | Correct character sign; quasi-affine and affine remain distinct | F03 |
| §5.3 Grassmannian geometry | G_m; GL_2 types (1,0), (2,0) | Cell dimensions 0,1,2; minuscule P¹ closed; (2,0) closure contains distinct boundary (1,1), dimension 0 | General cell only locally closed, with stated partial properness | F05 |
| §5.4 faithful cutout | Unipotent extension at Levi type 0 | Actual GL_2 type 1,−1 is not ≤0,0; split type 0,0 is ≤0,0; determinant sums 0 | Both Levi condition and bound used | F08 |
| §5.5 rigid sources | G_a; GL_2 minuscule line flag | G_a rigid maps have image {0}; line flag has steps F^0,F^1 and transversality to F^0 imposes no extra restriction | Geometric ξ^-1 point not a rigid counterexample | F08 |
| §5.6 adjoint-weight BB | Weights 0,1,−2 and inverse 0,−1,2 | First maximum 1, second maximum 2; GL_2 type (2,0) has surviving positive congruence parameter | One-sided upper bound correct | F08 |
| §6.1 neutral family | Two-point base with unit isocrystal | Endomorphism f is one scalar a giving (a,a), not arbitrary (a,b) | Globally fixed W is substantive | F08 |
| §6.2 faithful evaluation | Same two-point base; zero map | At either point f=a; evaluation 0 forces a=0 globally | Disconnected base does not break faithfulness of fixed maps | F08 |
| §6.3 canonical subgroup forms | Unramified norm-one torus in SL_2 | Norm valuations even; quotient Q_p×/N(E×)=Z/2; H¹(Q_p,SL_2)=1 | Nonneutral fibre forms can differ between components | F08 |
| §6.4 good type on rigid bases | Connected unit family; jumping lattice without admissibility | Unit type 0 everywhere; unipotent jumping example gives 1,−1 versus 0,0 | Arbitrary lattice family does not supply missing de Rham criterion | F08; explicit gap retained |
| §6.5 represented admissibility | G_m, b=p^-n, exponent a | Modified slope n−a; admitted iff a=n | Mismatched invariant gives empty locus | F08 |
| §6.6 nonemptiness | G_m, n=a=1; n=1,a=0 | Bundle slopes 0 and 1; respective admissible sets point and ∅ | Membership in B(G,[mu^-1]) necessary | F08 |
| §6.7 connected products | X=Y=point; X=two points | Product component counts 1·1=1; outside hypothesis 2·1=2 | Nonempty connected hypotheses preserved | F08 |
| §6.8 admissible connectedness | Compatible torus; incompatible torus; trivial U | Point has one component; incompatible locus ∅; U=1 contributes one loop point | Nonemptiness precedes connectedness | F08 |
| §7.1 neutral Hodge families | Tate constant on two points | Fixed V dimension 1 on both, exponent −n on both; independent maps (0,1) not a fixed V-map | Fixed datum differs from arbitrary variation | F08 |
| §7.2 Hodge-family Tannakian structure | Unit and a Tate generator | Fibre groups 1 and G_m, with no nontrivial finite component quotient | Neutrality alone not the connectedness proof | F08 |
| §7.3 Hodge domain | G_m, Hodge weight −2 | Domain lattice exponent −1; opposite admissible type exponent 1; weight 2nu=−2 | Domain lies in inverse-type Grassmannian | F08 |
| §7.4 HT line locus | n=−1, target lattice Fil^0 or Fil^-1 | Inclusion Fil^-1⊂Fil^0 false; Fil^-1⊂Fil^-1 true | Negative twists retained | F08 |
| §7.5 rigid closed HT incidence | Rational line e1; variable flag [a:c] | Line incidence is c=0, closed; [1:1] fails, [1:0] passes | Correct rigid closed equation | F08 |
| §7.6 special Hodge subvariety | Torus; mirabolic inverse type; original type | Torus dimension 0; weights 0,−1,2 pass lower bound; 0,1,−2 fail it | Correct inverse BB direction | F03, F08 |
| §8.1 Hodge line locus | Tate n=−1 and n=1 | Frobenius p and p^-1, required exponents −1 and 1; for n=−1 exponent-0 lattice fails | Correct isocrystal rational structure | F08 |
| §8.2 admissible functoriality | f=id,g=1; Frobenius-nonfixed g | First map L↦L; for b_H=1 the required b_G is g sigma(g)^-1, generally not 1 | Sigma-conjugacy, not ordinary conjugacy | F08 |
| §8.3 subgroup admissibility | Norm-one torus; Borel [1:1] for b=diag(p,1) | H¹-kernel Z/2 gives two possible forms; [1:1] has a≠0 but c≠0, so ambient passes and subgroup fails | Neutral piece kept separate | F03, F08 |
| §8.4 special admissible locus | Torus; mirabolic two types | Torus bound vacuous; maximum weights 1 and 2 distinguish upper-bound admission | Nonempty fixed type and upper bound retained | F08 |
| §8.5 local special points | Quadratic F/Q_p, ramified or unramified | dim D×/F×=4−2=2; dim_Qp P¹(F)=2·1=2; matching torus cell one point | Local extension, no global CM condition | F06 |
| §8.6 Borel and parabolic boundary | Borel [1:0],[1:1]; GL_3 disc z=0,1 | First subgroup accepted, second ambient-only; GL_3 determinant 1, minimum valuation −1 and two-minor valuation −1 give ambient 1,0,−1; Levi becomes 0,0;0 at z=0 versus 1,−1;0 | Ambient type constant, Levi type jumps | F08 |
| §9.1 infinite-level frames | Unit G_m object, scaling frames by a,c | Two independent frame coordinates (a,c)∈Q_p×²; actions commute since ac=ca on separate factors | Both frames are retained | F08 |
| §9.2 period torsors | G_m, exponent n=1 | L_et exponent 1, L_dR exponent −1; rational frame fibres Q_p× on both sides; BB flag dimension 0 | Torsors are additional to lattice points | F08 |
| §9.3 infinite-level functoriality | Identity datum; successive maps with g₁,g₂ | Identity fixes both frames; composite isocrystal transport g₂ f₂(g₁), with the same transported lattice | Compatible chosen transport required | F08 |
| §9.4 one-sided specialness | Mirabolic weights 0,1,−2 and inverse | Upper/lower booleans (true,false) and (false,true); two-sided false in both | Adjectives remain distinct | F01, F08 |
| §9.5 agreement | GL_4 diag(t,t,1,1); reductive roots ±α | All subgroup weights in −1,0,1; symmetry sends each α to −α | All three agree under minuscule or reductive symmetry conditions | F08 |
| §9.6 basic duality, noncommutative witness | b=[[1,1],[0,1]], x=diag(2,1) | sigma_b(x)=[[2,−1],[0,1]]; b^-1 sigma_b(x)=sigma(x)b^-1=[[2,−2],[0,1]]; inverse conjugation instead gives [[2,1],[0,1]] | Frobenius twist orientation fixed, including p=2 | F08 |
| §9.7 Hodge-domain connectedness | Compatible G_m, n=1 | Inverse datum b^-1=p and inverse type −1 still has modified slope 0; both domains points | Duality transfers one component to one component | F08 |
| §10.1 exceptional locus | Constant family at actual group; two distinct CM tori | First exceptional set ∅; two points each have proper torus group while their generated group can be GL_2 | Only pointwise equivalence and forward subfamily implication retained | F03, F08 |
| §10.2 countable regular exhaustion | G_m, V_i=span{x^j:−i≤j≤i} | dim V_i=2i+1; union contains every Laurent monomial; exterior pairs indexed by N²; degree 0 has dimension 1 | Countable representations, not countable lines | F03 |
| §10.2 Chevalley-line detection | H=mu_m in G_m; line Q_p(1+x^m) in V_m | Translation sends vector to 1+a^m x^m; same line iff scalar is 1 and a^m=1 | Proper subgroup detected in exterior degree 1 | F03 |
| §10.2 compact projection | Empty and two-point parameters; discrete sequence p^n | Images ∅ and Z₁∪Z₂ closed; p^n→0 but 0 absent from discrete-parameter image | Compactness essential | F04 |
| §10.3 generic density | Zero-dimensional smooth point; infinite- and finite-residue discs | Point has no proper nonempty Hodge locus; finite residue gives x^q−x=0 mod π at all integral points but Gauss norm 1 | Infinite-residue Gauss input retained | F08 |
| §11.1 closure definition | Empty family; one container A; A⊂B | Empty intersection M; intersection of {A} equals A; containers(B)⊂containers(A) gives closure(A)⊂closure(B) | Empty-family and monotonicity orientations correct | F08 |
| §11.2 analytic closedness | Torus special point; one-sided mirabolic component | Point closed in both structures; weights 0,−1,2 provide only HT-special guarantee | No unsupported opposite-side closedness | F01, F08 |
| §11.3 connected-component formula | Two components M₁,M₂, connected lift in M₁ | Containing component selected is M₁; empty container family still gives M₁∪M₂ | Selection used only for nonempty family | F08 |
| §11.4 orbit submersion | GL_2 line flag; torus | Orbit derivative rank 1=dim P¹; torus flag rank 0=dimension 0; hypothetical rank 0 in P¹ leaves one vanishing transverse coordinate | Rank defect excluded by identity theorem | F08 |
| §11.5 general Ax–Lindemann | Inverse mirabolic; minuscule GL_2; empty index family | Weights 0,−1,2 pass lower bound and fail upper; GL_2 −1,0,1 passes both; empty intersection equals all M_C | General conclusion opposite-special | F01 |
| §11.6 minuscule theorem and field | Flag point [1:c], c∉E; GL_4 parabolic | Equation X1−cX0 has unique point [1:c]; E-rationality forces c∈E, contradiction; parabolic weights remain −1,0,1 | Algebraic input allowed over L([mu]); nonreductive subgroup allowed | F05 |
| §11.7 period-image density | Unit/torus family; nonbasic ordinary boundary | Flag target for actual torus group has dimension 0 and image closure a point; no assertion that arbitrary larger ambient flag has dimension 0 | Actual generic group and geometric irreducibility retained | F08 |
| §11.8 nonbasic boundary | Borel b=diag(p,1) | Upper-root slope 1, hence nonbasic; whole Serre–Tate family and torus lift have the same one-point HT flag image | Flag equations cannot distinguish the proper lift | F08 |
| §12.1 variations | Nontrivial local-system monodromy; trivial filtration on flat line | Underlying rational monodromy can be nonidentity; M0 lattice exponent 0 regardless of forgotten filtration jump a | Variation need not be neutral | F08 |
| §12.2 crystalline-frame cover | Constant framed basic datum; ordinary rank one | Constant cover fibre G_b(Q_p); ordinary integral fibre Z_p×, rational fibre Q_p× with valuation components Z | Integral and rational frames distinguished | F08 |
| §12.3 Katz–Igusa obstruction | Ordinary tower at p=2,3 | Z_2× and Z_3× both infinite and nondiscrete; rational valuation components indexed by Z | No finite-fibre rigid cover can supply full monodromy | F08 |
| §12.4 basic uniformization | Gamma=1; nontrivial discrete Gamma | Quotient M/Gamma equals M when trivial; for nontrivial Gamma each orbit maps to one point, unlike separate product coordinates | Diagonal quotient retained as hypothesis | F08 |
| §12.5 products of Shimura curves | n=0,1,2 | Domain dimensions 0,1,2; quaternion invariants (infinity,p) change from (0,1/2) for D to (1/2,0) for B | Product and inner-form conventions agree | F08 |

## Repair-specific interface checks

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Native Chevalley theorem is scheme-theoretic | char 2, H=mu_2⊂G_m, a=1+epsilon with epsilon²=0 | a²=1, while a≠1; line 1+x² is fixed exactly when a²=1 | Nonreduced subgroup detected, unlike field-point-only stabilizers | Import with full pinned hypotheses |
| Finite-subcomodule exhaustion | Zero comodule; G_m monomial x^-3 | Zero comodule contained in zero finite subcomodule; x^-3 lies in V_3 of dimension 7 | Degenerate and Laurent directions both covered | Native imports |
| Inverse-character vector stabilizer | H=G_m on v by chi(h)=h, h=2 over Q_p | (2,1/2) sends v to v; (2,2) sends v to 4v≠v, also at p=2 | Wrong character direction excluded | Explicit §5.2 graph calculation |
| Observable quotient is weaker than affine quotient | Upper-unipotent U⊂SL_2 | SL_2/U identifies with A² minus 0, dimension 2; its global functions are k[x,y], whose spectrum contains the missing origin | Quasi-affine does not imply affine | Narrowed supplier gap |
| Profinite product map and universal closedness | P=∅, one point, two points | Products ∅, S, S⊔S; projection images of closed sets ∅, Z, Z₁∪Z₂ | Native map agrees with second product coordinate | Exact D5.10 supplier |
| Reflex-base cell versus arbitrary closure | GL_2 type (2,0) | Dominant sums: 2+0=1+1=2 and 2>1; boundary (1,1) distinct from cell | No unconditional closedness added | §5.3 Check |
| Local quadratic orbit | Unramified quadratic F/Q_2; ramified quadratic F/Q_3 | In both cases [F:Q_p]=2, dim F×=2, dim D×=4, quotient dimension 2 | No prime or ramification exclusion | §8.5 Checks |
| Existing supplier gaps remain explicit | Rank-one matching Tate datum; wrong lattice exponent | Full-rank comparison rank 1=dim V; exponent shift by 1 changes modified slope from 0 to −1 | A bare full-rank scalar equality cannot replace the required lattice/filtration compatibility | No independent gap silently discharged |

## Maintainer notes

No public Lean name changed. Downstream roadmaps need no rename. The supplier obligations shrink: the countable-Chevalley gap is deleted, and the observable gap no longer asks for a line-stabilizer theorem already at the pin. DiamondsAndVStacks D5.10 is an added exact citation to an existing earlier supplier, not a new merge-order requirement.

The package still has the nine explicit supplier gaps, including the arbitrary-field full-rank de Rham criterion; the conditional downstream scope is unchanged. No other roadmap was edited. Historical `packages/AdmissiblePairsAndPadicHodgeStructures/design/README.md` and non-gap plan fields retain earlier wording because they are outside this job's edit boundary; the operative README and permitted top-level gaps carry the repairs. No commit or network write was made.
