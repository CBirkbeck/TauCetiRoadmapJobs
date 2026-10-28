<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1129#issuecomment-6431801062 -->
Red team round 1 pass a (codex) of 6536723

Verdict: needs_changes

1. **F01** (P2) Row-echelon uniqueness already has an owner

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:1514: “the uniqueness of the reduced row echelon form is part of this node.”

   **Claim:** §9.4 builds this foundational uniqueness result.

   **Witness:** TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:5888,5898,5912 already owns uniqueness over every field, including the target `IsReducedRowEchelon.eq_of_mul`.

   **Exact repair:** Replace the last sentence of the proof route by: “Use ClassicalArithmeticCompletion §3.19 for existence and uniqueness of reduced row echelon forms over arbitrary fields; this section owns only their application to descent through intersecting fields.” Add that supplier to the contract and Needs line. Over ℚ(a), for the line spanned by (2,2a), the imported reduced row is (1,a); its entries belong to both fields exactly when a does. Zero/full subspaces retain reduced forms 0/I.

2. **F02** (P3) Translation inside the stabilizer does not enlarge the specialness field

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:1549: “translating C₀ by a non-constant non-torsion point moves k_{A,X} up.”

   **Claim:** Every such translation enlarges the minimal field.

   **Witness:** Let A=E² be constant, C₀=E×{0}, K=k(E), and t=(η,0). Then t is nonconstant and non-torsion, but C₀+t=C₀, so k_{A,X}=k both before and after.

   **Exact repair:** Replace the second clause by: “For A=E² constant and C₀=E×{0}, translation by (η,0) leaves C₀ unchanged; translation by (0,η), where η is the generic point over k(E), gives E×{η}, whose minimal specialness field is the algebraic closure of k(E) inside K̄.” The first translated set remains constant; the quotient by E×{0} in the second example is {η}, of transcendence degree one.



3. **F03** (P1) The function-field headline fails for arbitrarily divisible degree-one classes

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:2033, with the extension argument at 2037 and 2018: “every α ∈ Pic(C_K̄) of degree 1” and the threshold “max{h_Fal(C), 1}”.

   **Claim:** A fixed positive constant term gives a genus-only small-point bound for every non-isotrivial pair, with heights normalized relative to the original K/k, even when α is defined only over K̄.

   **Witness:** For constant genus-two C₀/k, K=k(C₀), Weierstrass w, Q=η−w, NQ_N=Q, put α_N=w+Q_N. Constant points have height 2/N²; h_Fal=0; the shift height is 8/N².

   The pair is non-isotrivial: Q_N cannot be constant because NQ_N=Q is nonconstant; the automorphism group of C₀ is finite. For N²>2/c₁, infinitely many constant x satisfy 2/N²<c₁(1+8/N²). This contradicts every finite c₂. The same statement appears in the cited manuscript (yuan-2026 line 141, Theorem 1.1, p. 5; confirmed in the PDF), so reproducing its locator does not fix the defect.

   **Exact repair:** Keep the number-field branch unchanged. Replace the function-field branch by: “For every finite extension E/K over which α is defined, put d_α=[E:K]. In the displayed bound replace max{h_Fal(C),1} by max{h_Fal(C),1/d_α}; all heights in that bound remain normalized over the original K/k.” Prove this using the rational-class version over E and divide the whole inequality by d_α. Explicitly distinguish extending a coordinate field while retaining K-normalization from changing the reference function field: the intrinsic E/k height is [E:K] times the intrinsic K/k height. Update §§7.1,11.6–11.7 and their extension claims to make this distinction.

   For the counterexample, d_α·2/N² is the positive integral degree of the nonconstant map from the curve of definition to J(C₀), so d_α≥N²/2. The repaired right side is at most 10c₁/N²; choosing the theorem's constant smaller than 1/5 excludes these constant points. The false positive constant threshold is removed without dropping algebraic degree-one classes.


4. **F04** (P2) The total-degree definition assigns two values to a nonreduced irreducible scheme

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:147: “For an irreducible Z ... [Z]” versus “each counted once with its reduced structure”.

   **Claim:** Both clauses define the same degree for every closed subscheme Z.

   **Witness:** In P¹, take Z=Spec(k[ε]/(ε²)) supported at a rational point. Its fundamental zero-cycle has degree 2. Its unique reduced component has degree 1.

   **Exact repair:** Replace “For an irreducible Z of dimension d” by “For an integral reduced Z of dimension d”; state explicitly that the total degree of every closed subscheme means the degree of its reduced support. Add the Check “A doubled rational point has total reduced degree 1, whereas its fundamental-cycle degree is 2.” Both clauses then give 1 for this input.

5. **F05** (P2) The relative Hilbert parameter description forgets the level marking

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:259: “Its ℚ̄-points are the pairs ((A, L), X)”.

   **Claim:** Such pairs identify the points of the Hilbert scheme over fine level-four moduli.

   **Witness:** A generic elliptic E with X=E has 48 symplectic bases of E[4]; quotienting by Aut(E)={±1} leaves 24 distinct marked moduli points, all with the same unmarked (E,O(0),E).

   **Exact repair:** Replace the description by “Its ℚ̄-points classify isomorphism classes of triples ((A,λ,η),X), where η is the specified full symplectic level-four marking and X has the stated dimension and degree.” In the witness all 24 marked classes are retained, and forgetting η maps them to one unmarked class. PELModuli §M5.2 explicitly retains this level datum.

6. **F06** (P3) Three locators point to different sections

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:133,159,587: “§3.1”; “via DGH Lemma 2.4”; “§5.2, part (2)”.

   **Claim:** These identify tropical functoriality, projection degree and family equidistribution at the indicated sections.

   **Witness:** dgh-2021 line 450 concerns Betti forms. packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md:1415 places equidistribution in §5.4(2). yamaki-strict-support lines 581–603 place (3.0.13)–(3.0.14) in §3.2.

   **Exact repair:** At line 133 cite “yamaki-strict-support §§3.1–3.2, pp. 13–15”. At line 159 cite “ggk-2026 lines 377–380, proof of Lemma 2.4, p. 197” for the projection inequality. At line 587 cite “ArakelovGeometryAndAbelianHeightsPartII §5.4(2)”. The degree check for projection of C² is d≤2d², fixed-abelian-variety equidistribution has mass 1, and the tropical map of an identity homomorphism sends u to u. These statements do not change.

7. **F07** (P3) A constant curve may itself be a torsion subvariety

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:1323: “a curve C₀ ... is special though it is not a torsion subvariety”.

   **Claim:** An arbitrary constant curve in a constant abelian variety is not a torsion subvariety.

   **Witness:** C₀=E×{0}⊆A₀=E² is an abelian subvariety, hence the torsion translate 0+C₀. It satisfies both predicates.

   **Exact repair:** Replace “a curve C₀⊆A₀” by “a smooth curve C₀⊆A₀ of genus at least two”. Such a curve is constant-special and cannot be an elliptic coset. Keep C₀=E×{0} as a second control with both predicates true.



8. **F08** (P2) The field-descent proof consumes a later target

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:1506: “*Needs:* ... §9.4”.

   **Claim:** §9.3 is developed before the subvariety descent theorem used in its strict defect-decrease step.

   **Witness:** At line 1500 equality of defects is excluded using subvariety-field-descent, whose first statement is §9.4 at line 1510. No earlier target provides that application.

   **Exact repair:** Move current §9.4 immediately before §9.3, renumber these two sections and update references. Keep its RREF input with ClassicalArithmeticCompletion §3.19 as in R01. For the line y=ax the descent coefficient is a∈k₁∩k₂=k; that result is then available before the defect argument uses it. No external dependency changes.

9. **F09** (P3) Three defining nodes do not have three discriminating Checks

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:298–300,860–862,1687–1689.

   **Claim:** The Checks validate the fibre-power, embedding-height and iterated-sum definitions.

   **Witness:** §1.3 repeats its one-fold and fibre definitions; §5.2 repeats nonnegativity; §9.14 repeats X₀={0}, X₁=X. These leave fewer than three discriminating examples in each node.

   **Exact repair:** Keep existing useful examples and add these computed controls. In §1.3 use E×S over a curve: its square has dimension 3, whereas the absolute square has dimension 4; over characteristic zero, the multisection [2]x=s over E has four components in its square; two-point fibres have four-point squares. The latter two are negative controls excluded by the required geometric integrality. In §5.2 add that common scaling of every polynomial coefficient by 7 leaves h₁ unchanged by the product formula, whereas a projective coordinate change sending the origin to [1:T:0:…], T an integer ≥2, forces c_NT≥log T although h_Fal is fixed. In §9.14 add a translated elliptic subgroup X=t+B: X_m=mt+B and X₂=X exactly when t∈B. This distinguishes stabilization of dimension from equality of sets. These examples have values 3/4, 4, 4; h₁/h₁, c_NT≥log T; and t+B versus 2t+B, respectively.

10. **F10** (P1) The bounded-cover prerequisite has no declared supplier edge

   **Location:** packages/HeightsRationalPointsAndObstructionsPartII/README.md:1360,1368: “Finite étale covers ... of degree ≤ D are finitely many”.

   **Claim:** §8.1 uses this arbitrary-dimensional finiteness input, citing only GH Lemma B.2; its Needs line supplies heights and abelian schemes.

   **Witness:** TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:2549–2568, §IG.3.1, “Finitely many covers of bounded degree”, supplies exactly this theorem. The package's contract at line 137 cites only IG.2; neither §8.1 nor its Needs names IG.3.1.

   **Exact repair:** Add “InverseGaloisAndArithmeticFundamentalGroups §IG.3.1, Finitely many covers of bounded degree” to the supplier contract and §8.1 Needs; replace the source-only input by that supplied theorem, retaining GH Lemma B.2 as its locator. For S°=G_m over an algebraically closed characteristic-zero field there are D connected cover classes of degree ≤D, represented by z↦zⁿ, 1≤n≤D; their compositum has degree lcm(1,…,D). This supplies the actual finite extension needed by the proof. No new construction or gap is needed.

## Verified sound

Read 2,148 README lines and 111 Suggested.lean lines: 108 numbered target nodes, 3 Lean declarations and 111 Checks blocks containing 282 bullets. The README uses bold for “Summary” and “Checks”, not for individual targets; the 108 numbered nodes were the target inventory. All 282 Check bullets were audited; sampled computed controls, including failures and restatements, are retained below. These finite tests are not proofs of the general assertions.

The three supplied elaborated signatures were compared with the README and the pinned definitions. They retain their field instances, smoothness, properness, geometric integrality, dimension, Albanese and positive-power conditions. No signature change is indicated. No Lean command was run: this pass uses the worker's supplied elaboration, as required by the read-only instruction. There are no definitions, instances, sorry'd data, stand-ins or padding theorems in Suggested.lean. Both imports exist at the pin. The three fully qualified theorem names were absent from other searched roadmap files and the pins.

Headline inventory: §§2.7–2.8 height inequalities; §3.2 family equidistribution; §§3.5–3.6 uniform Bogomolov/Manin–Mumford; §§4.8–4.9 gap principle; §§5.4–5.5,5.10,5.12 Vojta–Mumford counting; §§6.5,6.7–6.8,6.12 uniform counts/Mordell–Lang/rational points; §§8.4,8.6,9.12,9.19 geometric Bogomolov and Yamaki reduction; §§10.1,10.3,10.5,10.8 potential-bigness and relative bounds; §11.7 global-field bound; §§12.2–12.4 bielliptic results. The statable curve cardinality headlines are present. The module docstring individually identifies the missing height, polarization, trace, adelic-measure, Ueno-locus and diagonal-polarization carriers for the remaining headline groups. Supporting Euclidean and linear-algebra facts are correctly absent from Lean.

The initial diff comprises ten files, all inside packages/HeightsRationalPointsAndObstructionsPartII. No forbidden import, `set_option`, `lemma` declaration, admitted data, computational algorithm or pull-request number occurs in the two deliverables. Existing repair reports contained no finding marked “not actionable in this package”.

### Elaborated declaration table

Here multiplication is the native point-group law, hence addition on J. Every declaration has universe u; g:ℕ and 2≤g precede ∃B≥1. Thus B cannot depend on F, X, J, the translation, the subgroup or its rank.

| Declaration and section | Complete relevant context | Instances and computed values | Result/change |
|---|---|---|---|
| uniform_maninMumford_curves, §3.6, Suggested.lean:57 | F:Type u; Field, IsAlgClosed, CharZero; X over Spec F; Smooth, IsProper, GeometricallyIntegral; dim X=1; rational x₀; J:AbelianVariety F; a:X→J; IsAlbanese x₀ a; dim J=g; every point c of J | At c=−a(Q), a(Q)+c=0 has order 1; the erroneous +a(Q) gives 2a(Q), infinite order for nontorsion Q. Genus-two Weierstrass points give six 2-torsion images; Stoll's example gives 34, forcing B≥34. Genus one gives infinitely many torsion images but 2≤1 is false. | Sound signature; no one-tactic proof or padding. |
| uniform_mordellLang_curves, §6.8, Suggested.lean:75 | Same geometric context; c; ρ:ℕ; finite s⊆J(F), card s≤ρ; Γ:Subgroup J(F); ∀p∈Γ ∃n>0, pⁿ∈closure(s) | ρ=0 forces s=∅ and closure(s)={1}; membership becomes pⁿ=1, n>0, and RHS=B. For a nontorsion P and its division hull, s={P}, ρ=1 gives RHS=B². Allowing n=0 would make every p qualify since p⁰=1. | Sound rank formulation, including non-finitely-generated groups; no lost hypothesis. |
| uniform_rationalPoints_curves, §6.12, Suggested.lean:96 | F:Type u; Field, NumberField; same X,x₀,J,a hypotheses; full J(F), not an arbitrary subgroup; s finite, card s≤ρ; every p∈J(F) has a positive power in closure(s) | Rank zero gives RHS=B; the chosen x₀ contributes one point. If X(F)=∅ the absent-base-point branch has count 0≤B. At rank one RHS=B². Number-field degree never enters the bound. | Sound; proper smooth integral curves are projective. No stronger algebraic-closure assumption was introduced. |

The zero ring cannot instantiate Field; S₃ and Q₈ cannot instantiate the abelian-variety point group. Zero-dimensional schemes fail dim X=1; genus zero and one fail dim J=g≥2. Characteristic 2 or 3 fields fail CharZero in the first two signatures. These exclusions are actual binders, not intended context. No natural subtraction, division by zero, out-of-range indexing or arbitrary topology is used in these three signatures.

### Sampled adversarial target tests

Section references are to packages/HeightsRationalPointsAndObstructionsPartII/README.md. These 40 rows retain computed controls for the findings, boundary cases and normalization checks. “Pass” describes the displayed instance, not a formal proof. Bounds c,B,Q are the constants quantified in the cited sections.

| Target | Instances and computed values on the two sides | Result/change |
|---|---|---|
| 0.1 Total degree | Rational/degree-two point: 1/2; line/conic: 1/2; Abel genus-g curve: g; line plus off-line point: 2 versus top-degree 1; contained point: 1<1+1; empty:0. Double point:2 versus1. O(−1) diagonal:−1 versus−2. | R04; R06 locator. The negative-degree control is excluded by the stated ampleness convention for positivity statements. |
| 0.2 Product-grid escape | P¹, M=2, Z=Δ, Σ={a}: Σ² has1 point in Δ; Σ={a,b}, a≠b: four pairs, two outside Δ. Empty Σ gives X′=∅, degree0<c. | Pass. |
| 0.4 Euclidean packing | ρ=0: covering number1=(1+2R/r)⁰; interval [−r,r], R=r>0:1≤3; ∅:0; singleton:1; r=0 for an interval:∞, denominator0 excluded. | Pass, including internal centres. |
| 1.2 Relative Hilbert scheme | Principal E degree1 becomes8; genus-two Abel curve degree2 becomes16. Generic E has24 level-four classes above one unmarked curve. | R05. |
| 1.3 Fibre powers | E×S over curve S has dimension2; its square over S has dimension3, absolute square4. For [2]x=s over E the square has4 components. Point-base square is E², dimension2. | Sound construction; R09 Checks. |
| 1.6 Nondegenerate powers | Full abelian fibres over a curve: domain real dimension2mg+2, Betti target2mg, so rank cannot be full; stabilizer dimensiong>0 excludes them. A fixed genus-two Abel curve has rank2=2dim C. | Pass. |
| 2.2 Cutoff form | Constant E×S: ω pulled from E, θ=ϑ(s); [2]*θω=4θω. At θ=0 density0; at θ=1 and positive rank density>0. d(θω)=dθ∧ω can be nonzero. | Pass; compactness follows from proper π over compact support. |
| 2.4 Top intersection lower bound | Fixed E as above: F¹=4N², so κ=4 gives equality. Constant torsion section over a curve: vertical form restricts0, so top integral0 and nondegeneracy fails. d=0: F⁰=N⁰=1. | Pass. |
| 3.1 Betti measure | Fixed E with degree d: curvature mass d, normalized mass d/d=1. Torsion section: restricted form0, rank0, excluded. On E², (β₁+β₂)²=2β₁β₂, not β₁β₂. | Pass. |
| 3.2 Equidistribution | Fixed E, f=1: orbit average1=integral1. Torsion section over a curve has vertical form0 but orbit mass1; nondegeneracy fails. f=0 gives error0<ε. | Pass; R06 supplier locator. |
| 3.6 Uniform Manin–Mumford | Translation c=−a(Q): Q maps to0; incorrect sign gives2a(Q). Genus2 example count34 requires B≥34. Genus1 count∞ is excluded by g≥2. | Pass; native Lean headline. |
| 4.6 General polarization gap | l=g!: n=l/g!=1, rescaling1. n=2,r=1: exceptional-degree factor n²=4; n=2,r=2 gives16. | Pass. |
| 4.8 New gap principle | Fix genus2 C⊂J and append E with arbitrarily large h_Fal(E). C×{0} has fixed degree but does not generate J×E; the growing cutoff eventually contains arbitrarily many points, refuting removal of generation. | Pass, hypothesis necessary. |
| 5.1 Rank Euclidean space | Γ=torsion: dimension0, every norm0. Division hull of one nontorsion P: dimension1; h(2P)=4h(P), pairing(P,P)=h(P). Adding an independent Q gives dimension2=1+1. | Pass. |
| 5.2 Embedding constants | O_E(2·0): h⁰=2, map degree2, not embedding; O_E(3·0):h⁰=3, plane cubic. Moving origin to [1:T:0] forces c_NT≥log T while ĥ(0)=0. | Pass definition; R09 Checks. |
| 5.6 Isolated fibre alternative | Theta D=6: Stab={0} has degree1; containing translate intersection has2≤36 points. X=[3]⁻¹Θ: stabilizer81>D=54 but81≤D²=2916. r=2 endpoint exponent4=2r. Empty Ξ:degree0; r=0:fibre singleton. | Pass; repairs source's false intersection shortcut. |
| 5.12 Explicit David–Philippon count | g=2,D=32: Q=(2³²h₀·32)¹⁶=2⁵⁹²h₀¹⁶≥6. Rank0,a=2: count≤Q; rank2 gives Q(10Q)=10Q². Six height-zero Weierstrass points are allowed. | Pass; no false positive lower bound on all points. |
| 6.2 Simultaneous specialization | Constant sections specialize identically. Legendre μ²=2(2−λ), P=(2,μ): at μ=0,λ=2, 2P=0; generically 2P≠0, so kernel contains nonzero2P. Polynomial exceptional-degree bounds add, while exp(ch) dominates their sum. | Pass. |
| 6.5 Arbitrary finite rank | Division hull of ℤP has rank1 and is union of finitely generated subgroups of rank≤1; any finite subset of N points lies in one, giving N≤c². Γ={0}:0/1≤c. | Pass. |
| 6.8 Curve Mordell–Lang | Rank0 and empty generating set permit pⁿ=1, n>0, and RHS=B. Rank1 division hull gives B². The erroneous n=0 permits every point, producing ∞. | Pass; Lean binds n>0. |
| 6.12 Rational-point bound | Empty rational-point set:0; chosen rational base point:at least1; rank0 boundB, rank1 boundB². B is independent of [F:Q] in the stronger Lean headline. | Pass. |
| 7.1 Adelic canonical height | Point P: denominator(dim+1)deg=1 and both heights h(P). A or a torsion coset:both0. Coordinate extension preserves fixed-K height; changing reference K to E scales by [E:K]. | R03 extension wording must distinguish these operations. |
| 7.4 Special subvarieties | Constant E×{0}:special=true,torsion-subvariety=true. Constant genus2 curve:special=true,torsion-subvariety=false. Trace-free point:special iff torsion. | R07 false Check. |
| 8.1 Bounded-degree torsion | Constant elliptic curve:every torsion point degree1, unbounded orders, so geometric trace exclusion is necessary. Zero A:only order1. For G_m over algebraically closed characteristic-zero k and cover boundD, exactly D connected covers and finite compositum degree lcm(1,…,D). | Mathematical statement sound; R10 supplier. |
| 8.5 Moriwaki inequality | Number-field polarization gives [k₀:Q] times absolute heights on both sides. Trivially metrized trivial polarization has intersection degree0 and heights0, so inequality0≤c. | Pass conditional on nef-comparison gap. |
| 9.3 Intersecting isogeny fields | k₁=k gives descent to k. k₁=k₂=acl(k(t)) with nonconstant Legendre gives intersection larger than k and no constant isogeny model. Defect0 is base case; induction requires strict δ′<δ. | R08 order. |
| 9.4 Subvariety field descent | Over ℚ(a), row span(2,2a) reduces to(1,a); in characteristic2 use the already reduced row(1,a); descent to both fields forces a∈k₁∩k₂=k. Zero/full spaces have reduced forms0/I. Taking a outside k fails simultaneous descent. | R01 ownership. |
| 9.6 Minimal specialness field | Constant E×{0}, t=(η,0):translate unchanged, fieldk. t=(0,η):quotient pointη, minimal field acl(k(η)), transcendence degree1. | R02. |
| 9.11 Numerical torsion class | Constant elliptic scheme with L=O(2·0):generic degree2 and L≡2[0]. Degree-n torsion multisection has class n[0], so [T]/n=L/2. | Pass, rigidification essential. |
| 9.14 Iterated sums | Genus2 Abel C:dimensions0,1,2,2 and C₂=J. X={x}:X_m={mx}, all dimensions0 but sets change. X=t+B:X_m=mt+B; X₂=X iff t∈B. | R09 Checks. |
| 9.15 Stabilization index | Subgroup B>0:dimensions0,b,b, index1. Genus2 Abel C:0,1,2,2, index2. Point:all dimensions0, no strict jump, excluded by dim X>0. | Pass; source lacks the exclusion. |
| 9.17 Torsion fibre height | Subgroup case:f⁻¹(0)={(0,0)}, height0. On E²,H₁²=H₂²=0,H₁H₂=1: M·L=1≤L²=2; (M+L/2)²=3/2. Prime-to-p torsion remains dense for p=2,3. | Pass; prime-to-p restriction belongs to this smooth-fibre step only. |
| 9.19 All-characteristic Bogomolov | Constant genus2 curve:height0 densely, special via trace, not a torsion coset. Trace-free height-positive singleton:ε=h/2 gives∅. Both directions give matching truth values, including constant varieties in p=2,3. | Pass. |
| 10.1 Potentially-big count | Three vertical fibres in C² have degree3; Σ of3 base points has9 grid points lying in Z. Correct bound3≤3; false fibre-power exponent gives3≤√3. Constant family has base-growth1 but invariant intersection0, failing potential bigness. | Pass. |
| 10.8 Relative Bogomolov | Genus2,S point:number-field Abel thresholdm=1; difference thresholdm=2. At m=1, C−C=J with dense torsion, so no small-points property. Constant function-field curve has dense height-zero constants and fails the required variation over constants. | Pass; source's broader branch is false. |
| 11.2 Shift criterion | g=2,d=1:shift2α−ω. For α=w with ω=2w shift0; for α=w+Q shift2Q. Multiplication[2] has finite fibres even in p=2, so nonconstant Q cannot become constant after this shift. | Pass. |
| 11.4 Shift heights | y=ω−(2g−2)α gives (2g−2)x−ω+y=(2g−2)(x−α); for g=2 its height is4ĥ(x−α). Sign reversal gives an extra2y and fails this equality. | Pass over number fields. |
| 11.7 Yuan headline | Constant genus2, α_N=w+Q_N, NQ_N=η−w:infinitely many x have height2/N²; h_Fal=0, shift height8/N². For N²>2/c₁, cutoff c₁(1+8/N²)>2/N². | False; R03. |
| 12.1 Diagonal lift | Fourfold V₄-cover of P¹ has five branch values (three shared, two unshared), each contributes2:2g−2=−8+10=2, henceg=2. Two shared values give six branches andg=3. Isogeny kernel has4 elements. | Pass. |
| 12.3 Bielliptic small points | Projection heights2a and2b give elliptic heightsa,b and pullback heighta+b=(2a+2b)/2. Degree-one conventions are retained; native full x-height would double this. | Pass. |

### Sampled API and convention tests

These 15 rows retain discriminating API and convention controls. “L158” means README.md line 158, not a Lean declaration.

| Statement | Computed instance values | Result/change |
|---|---|---|
| L158 product degree | P¹×P¹,O(1,1):2=binom(2,1)·1·1; point×curve:1=binom(1,0)·1·1 | Pass, geometric integrality retained. |
| L293 flat/proper/irreducible | E²×S has one component and relative dimension2; [2]x=s multisection square has4 components, violating geometric-integral-fibre hypothesis | Pass. |
| L568 graph scalar | Fixed E degree d:κ=d, restricted form massd, normalized massd/d=1 | Pass. |
| L854 coefficient height | Projective vectors(1,2),(7,14) both have heightlog2 | Pass. |
| L1289 field extensions | [1:t] has fixed-K height1 before/after coordinate extension; intrinsic degree-d rebase heightd, still zero iff original zero | Pass for density, independent of R03 numerical bound. |
| L1807 quasi-finite iff | z↦z² sends t to t², both transcendental; in char p Frobenius sends t to t^p, still transcendental. Constant mapA¹→point has dimensions1→0 and is not quasi-finite | Pass both directions, including inseparability. |
| L1941 shift iff | g=2,d=1,α=w+Q:shift2Q; Q constant iff2Q constant since [2] finite, even in char2 | Pass. |
| Convention: coefficient versus FS height | [2:1]:log2 versus½log5; [1:0]:0=0; doubling a cycle doubles intersection height but normalized ratio stays fixed | Pass. |
| Convention: absolute number-field height | [2:1] overQ andQ(i):log2=log2; relativeQ(i) height2log2 | Pass. |
| Convention: residue weights | 1/(t²+1) overR(t):one pole of residue degree2 gives2; overC(t) fixedR weights give4 divided by2=2 | Pass. |
| Convention: pairing | h(P)=1,h(2P)=4 gives (4−1−1)/2=1; unhalved value2 is wrong for the Euclidean norm | Pass. |
| Convention: theta factors | Principal heighta, twice-theta2a; [2] gives4a; level-four height8a=4(2a) | Pass. |
| Convention: isogeny in characteristic p | [p] on an elliptic curve has degreep² even if inseparable; for p=2 degree4, for p=3 degree9 | Pass. |
| Convention: generic-fibre integrality | [2]x=s overE has degree4; its self-product decomposes by E[2] into4 components, not1 | Pass, explicitly guarded. |
| Supplier X* convention | Torsion section and fullA:complement∅; trace-free nontorsion section:whole section; constant genus2 family:complement∅ | Pass. |

### Supplier, ownership and dependency audit

Seventeen named supplier groups were checked against their readable current versions: the content main checkout, the supplied open-head checkouts, the current `roadmaps show` result for new roadmap suppliers, or the earlier board design where no open folder exists. Eighteen explicitly named pinned API declarations were located and their relevant hypotheses read. The supplied citation resolver's ArakelovGeometryAndAbelianHeightsPartII lead is resolved by its earlier board design; it is not a missing-roadmap finding.

| Supplier and resolved scope | Witness/version and comparison |
|---|---|
| Mathlib metric/linear/height APIs | Mathlib/Topology/MetricSpace/CoveringNumbers.lean:74,288,351; MetricSeparated.lean:43; Analysis/InnerProductSpace/PiL2.lean:111; Topology/MetricSpace/Pseudo/Defs.lean:418; MeasureTheory/Measure/Lebesgue/EqHaar.lean:500; LinearAlgebra/Dimension/Finrank.lean:61; FieldTheory/IntermediateField/Basic.lean:52; RingTheory/AlgebraicIndependent/Basic.lean:45; LinearAlgebra/Span/Defs.lean:46; LinearAlgebra/Matrix/Echelon/Basic.lean:87; NumberTheory/Height/Projectivization.lean:51. In particular maximalSeparatedSet is empty when packingNumber=∞; the finite-dimensional positive-radius argument must establish finiteness first. |
| Tau Ceti abelian and point-group carriers | TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95,281; Isogeny.lean:61; Albanese.lean:84; Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58. IsAlbanese is a universal factorization property, not an arbitrary predicate supplied by the roadmap. CanonicalHeight/Basic.lean:120 and Limit.lean:77 for elliptic curves use the full naive x-height, confirming the factor two. |
| SchemeAndStackFoundations | Main, TauCetiRoadmap/SchemeAndStackFoundations/README.md:551,798,5528,5643,5706,6567–6921,7336: projective constructions, spreading, blow-ups/Bertini, Hilbert, Chow/Chern/intersection and Bézout. The flat improper-intersection strengthening is explicitly a gap. |
| HeightsRationalPointsAndObstructions | Current new-roadmap head: §§0.10–0.12,0.16–0.35,1.7–1.11,5.1–5.19, including 5.9b and 5.13b–c. Its §0.12/0.33 multiply intrinsic function-field height under changing the reference field; they do not justify the fixed constant in R03. Its qualitative results do not own the uniform conclusions here. |
| AlgebraicModuliForArithmeticGeometry | Current new-roadmap head, README.md:685,818,993, §§1.5–1.6,2.1. Hilbert-family fibres, degree/Hilbert-polynomial boundedness and geometrically integral locus match the characteristic-zero use here. |
| PELModuli | Current new-roadmap head, §§M5.1–M5.3,M6.9–M6.10. Full marking and fixed symplectic pairing are retained; this is the datum lost in R05. |
| AbelianSchemesAndArithmeticModuli | Current new-roadmap head, A1–A3,A6; A2.7–A2.9 include positivity, sufficiently high projectively normal powers, normalized nef bundles and nef differences. Isogenies include inseparable ones. |
| AbelianSchemesAndArithmeticModuliPartII | Supplied open head, README.md:1226,1508,1656 and B4.2–B4.6. B2.3's bounded-degree torsion consequence is explicitly for curve fields; §8.1 is a genuine higher-dimensional extension. B2.13/B2.21–23 use dominant generically special varieties and componentwise geometric generic fibres. B4 retains generic-fibre integrality and finite stabilizer. |
| ComplexComparisonPartII | Current new-roadmap head, §C5.4, README.md:3018,3249,3379. Compactly supported cycle integration, Chern/intersection comparison and semipositive wedge inequalities are present; the cutoff need not be closed. |
| ArakelovGeometryAndAbelianHeights | Current new-roadmap head, README.md:839,1026,1148–1205,1503–1584,1693. Faltings normalization, isogeny comparison, theta embeddings, Northcott and level-degree bounds match. Arbitrary coordinate changes are not covered: the controlled-embedding gap is necessary. |
| ArakelovGeometryAndAbelianHeightsPartII | Earlier board design, packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md:294,1411,2769–2904,2950,3124 and §§3.1–3.3,4.7–4.9,5.1–5.5,6.1–6.4,8.4,9.1–9.2. Its §5.4(2), not §5.2(2), is the equidistribution export. Nef comparison remains declared as a gap. |
| StableReductionPartII | Earlier board design, packages/StableReductionPartII/design/README.md:23132,23206 and MC.4/MC.6. The DGH export retains fixed pairing and finite geometric Torelli fibres; the Yuan export supplies the level/Picard triples, including similitude components. |
| JacobianChallengePartII | Current new-roadmap head, §§0.2–0.4,1.1–1.4,2.1–2.7,3.2–3.13,5.1–5.6,7.1–7.2. README.md:799–935 confirms the shifted coordinate and the factor 2g−2 in the triangular comparison; §3.12 rigidifies twice-theta. |
| NeronModelsAndSemistableAbelianVarieties | Current new-roadmap head, §§1.1–1.10,3.10,3.13–3.14,5.1–5.2; README.md:1644,1747,1814,2839,2901. The local excellent-DVR statements apply to the smooth-curve models and preserve good reduction under inseparable isogenies. |
| TropicalAndBerkovichArithmetic | Supplied open head, README.md:2094,2120,2145,2307. §§6.2–6.4 construct general model/limit measures and §7.0 Raynaud uniformization; the abelian tropical support, strict-support and generic-net conclusions are supplied by the declared extension contract. |
| InverseGaloisAndArithmeticFundamentalGroups | Current new-roadmap head, IG.2 supplies specialization. Its IG.3.1, README.md:2549, also owns bounded-degree covers, but the package omitted that edge: R10. |
| AlgebraicCurves | Main, Layers10–11, README.md:1014,1039,1067: hyperelliptic/Weierstrass structure and characteristic-zero Hurwitz bound; no wild-characteristic Hurwitz bound is consumed. |
| JacobianChallenge | Main, LayerF, README.md:448–455: the actual pointed Albanese property; native IsAlbanese is already available. |
| ArithmeticDynamics | Supplied open head, §§6.57–6.64,6.93,6.110–6.112, README.md:9487,9617,10102,10355,10369,10398. It owns elliptic projections, torsion images and joint-height bounds. Projection height2a corresponds to degree-one elliptic heighta, as used here. |

Object searches used `roadmaps grep` and local searches across main/Completed, board packages and all 55 supplied sibling checkouts. The foundational RREF overlap is R01; the bounded-cover owner is R10. The remaining principal constructions here are uniform consequences, the explicitly scoped higher-dimensional extensions and the geometric-Bogomolov descent/proof, rather than duplicates of the suppliers' qualitative heights, moduli, Betti or adelic carriers. No duplicate fully qualified Lean theorem name was found.

The requested dependency command returned:

```text
depcheck: 56 roadmaps, 655 edges, 0 problem(s)
```

It exited successfully, with no UPWARD, CYCLE or moved line. This does not detect the internal §9.3→§9.4 forward use in R08. ClassicalArithmeticCompletion and InverseGaloisAndArithmeticFundamentalGroups, needed for the repairs, already precede this roadmap.

### Declared supplier gaps

All five slugs occur in both packages/HeightsRationalPointsAndObstructionsPartII/design/plan.json and the README's Exact supplier contracts, with the same named supplier and needs. None has supplier `none`. The requests retain the hypotheses below and do not duplicate an available theorem at the checked version. They are conditional contracts, not findings.

| Gap | Precision/minimality and computed control |
|---|---|
| flat-nonproper-intersection | Flat ambient map, smooth projective ambient varieties, integral dominant X, correct expected dimension, finite smooth intersection with the jump locus and scheme multiplicities. For g=id, X=B, V a point, both sides are [V] with coefficient1. Existing Chow/Bézout interfaces do not state this excess-intersection inequality. |
| arithmetic-interpolation | Positive dimension, complete projectively normal abelian embedding, nonempty finite S and degree-bounded hypersurface exclusion are explicit. For g=r=1, deg_L A=deg_L X=3, the forbidden zero-dimensional degree is27; 28 distinct points escape it, and the displayed height coefficient is48. Existing §5.9b supplies the cycle-height normalization, not this interpolation bound. |
| controlled-polarization-embeddings | Existence of controlled choices, not all coordinate bases; arbitrary dimension/polarization degree and return rescalings are retained. A coordinate origin of height log T gives c_NT≥log T, refuting arbitrary-basis control. Existing theta comparison alone does not supply the joint addition-law coefficient bound. |
| abelian-tropical-measures | The four clauses specify one coherent missing abelian tropical-measure interface, with geometric divisorial places, normalization, compatible simplices, rational interior points and a generic small net. Good reduction gives torus rank0 and mass1 at the canonical support point; a rank-one circle has normalized mass1. The base source already constructs model measures and Raynaud uniformization; the gap adds their stated abelian support/equidistribution consequences. |
| moriwaki-silverman-tate-nef | Only the comparison is extended from big to nef; the specialization limit retains bigness. Trivial nef polarization has height0, giving0≤C, while Northcott fails. No stronger Northcott or specialization statement is requested. |

### Source locator audit

Located and read all 123 distinct explicitly keyed source-line anchors in the README, across 14 texts, plus the cited Yuan–Zhang theorem and lemma in the fifteenth readable text. Additional cited locations without repeated source keys were checked, including Kühne Lemmas7–8,25; David–Philippon Theorems1.3–1.4 and the counting proof; Yamaki Proposition5.12 and Corollary7.22. Rémond's equations missing from text extraction were checked visually on printed pp.105–106; Yuan's algebraic-closure quantifier was checked visually on manuscript p.5. “Located” certifies the locator, not the truth of the source: the errors below remain errors.

| Source | Explicit keyed anchors read | Additional principal locations checked |
|---|---:|---|
| ggk-2026 | 34 | Theorems1.1,1.1′,1.2–1.3; Lemma2.4; §§3–8; AppendixA, especially the faulty intersection shortcut at line1818. |
| yuan-2026 | 16 | Theorem1.1; Theorems4.2,4.7–4.10,4.17,4.19; Propositions4.16,4.18; §4.4.2 rebase argument. Numbering is the recorded 2024 author manuscript. |
| dgh-2021 | 24 | Theorems1.1–1.6; Propositions4.1–4.3,7.1,8.1; Lemmas6.1,6.3–6.4; §8 and AppendixB. Lemma2.4 does not supply projection degrees: R06. |
| gh-2019 | 7 | Theorems1.1,1.4,A.3; PropositionB.1 and LemmaB.2; §A.3. Nef versus big polarization is distinguished. |
| xy-2022 | 23 | Proposition2.1; §§3.1–3.3; Proposition4.2; Lemma5.3 and Proposition5.4/proof. Nonproper multiplicities, positive-dimensional X and prime-to-characteristic multisections were checked. |
| kuhne-2021 | 5 | Theorems1–4; Lemmas7–8 and25. Compactly supported tests and the positive graph-degree limit agree with the package. |
| dky-2020 | 5 | Theorems1.1,1.10; Remark1.2; Proposition9.1 and §§9.3–9.5. The isogeny degree4, fibre factor16 and height factor½ agree. |
| remond-2000-vojta | 1 | Theorems1.1–1.2, printed pp.105–106; visual inspection confirms the angle, growth and height inequalities. |
| yamaki-2018 | 1 | Theorems1.5,5.3,5.5; trace quotient and product statement, including the assumed Bogomolov theorem for the trace-free factor. |
| masser-1996 | 2 | Theorem, printed p.459; polynomial bound on the degree of an exceptional-set vanishing polynomial. |
| dmy-2026 | 1 | §5, printed pp.26–27, product-grid observation; it supports the use of total component degree. |
| david-philippon-2002 | 2 | Theorems1.2–1.4, p.641; Rémond count p.643; proof pp.689–690. Q substitution is monotone in the required direction. |
| masser-1989 | 1 | Main Theorem and Scholium1, p.414: fixed-degree polynomial exceptional growth versus exponential full-set growth. |
| yamaki-strict-support | 1 | §§3.1–3.2,5.3; Proposition5.12 p.29; proof of Theorem6.2 p.31; Corollary7.22 p.41. Equations(3.0.13)–(3.0.14) are in §3.2, within the cited pp.13–15. |
| yuan-zhang-adelic | 0 | Theorem5.3.3 p.158 and Lemma5.3.4 p.159, source lines6219 and6229. The nef/big hypotheses and dimension+1 normalization agree. |

## Not verifiable

- remond-2000-decompte and david-philippon-2007 remain the two explicitly settled uncertified sources. Their original proofs and exact internal locators cannot be certified from the available text. No new request was made; the readable GGK, DGH and David–Philippon2002 statements were checked separately.
- No new Lean elaboration or proof build was performed. The provided elaborated signatures support the binder audit only; they do not prove the admitted theorems.
- The proposed function-field correction in R03 was tested on the counterexample and follows by rescaling the rational-class version. It is not independently formalized here; the repair must restate and check that version and its extension argument explicitly.
- Earlier board designs are future suppliers, not implemented libraries. Acceptance is conditional on the five declared gaps and on the ordinary named roadmap contracts; their absence from today's pinned libraries is not a finding.
- Ownership against other open pull requests for which the brief supplies no checkout was not certified. The searches over the supplied 55 sibling checkouts, main/Completed and board packages were performed; tool index hits were treated as leads rather than as permission to audit additional unrelated heads.

## Source issues

- **Error** in yuan-2026 at Theorem 1.1, p. 5, and §4.4.2, p. 81 (lines 141,2734–2735): the source says the function-field cutoff with constant one applies to every algebraic degree-one class; it should be rescaled by the degree of a field defining the class, or stated for classes over the reference field; affects a stated result.
- **Error** in yuan-2026 at Theorem 4.19, p. 101 (line 3417): the source says maximal variation over the function field suffices for the relative Bogomolov conclusions; it should be maximal variation over the constants in that branch; constant curves otherwise have dense height-zero points; affects a stated result.
- **Misprint** in ggk-2026 at Theorem 1.3, p. 192 (line 166): the source says both constants are named c₃; it should be c₃ and c₄; affects nothing.
- **Misprint** in ggk-2026 at Proposition 5.2, p. 212 (line 1021): the source says the small-height constant on the left has one prime; it should be the same double-prime constant used in the following formula; affects nothing.
- **Misprint** in ggk-2026 at §7.1, p. 221 (line 1473): the source says a translated intersection equals the untranslated intersection as a set; it should be a translation bijection, hence equality of cardinalities; affects the proof.
- **Gap** in ggk-2026 at Appendix A.1, p. 227, equation (A.1) (lines 1740–1751): the source says the coordinate-dependent comparison constants satisfy a Faltings-height bound after choosing global sections; it should be an explicitly controlled embedding and addition-law choice; arbitrary coordinates move the origin to unbounded height; affects the proof.
- **Error** in ggk-2026 at Proposition A.3 proof, p. 229 (line 1818): the source says the intersection of all indicated translates equals an intersection of at most dim X translates; it should be contained in a bounded-degree proper intersection; a genus-two theta curve's stabilizer is not one curve translate; affects the proof.
- **Misprint** in dgh-2021 at Proposition 4.2 proof, p. 17 (line 770): the source says the base cutoff is evaluated at the total-space point and reverses the composition; it should be θ(P₀)=ϑ(π(P₀))=1; affects nothing.
- **Gap** in dgh-2021 at Proposition 4.3 proof, p. 21, equation (4.13) (line 1034): the source says every degree monomial is bounded using the factor D′ to the power d−1; it should be max{1,D′}, or explicitly choose D′≥1; constant families admit D′=0 with positive mixed intersections; affects the proof.
- **Misprint** in gh-2019 at Theorem A.3, p. 56 (line 2606): the source says the base-curve height is evaluated at P in the abelian scheme; it should be evaluated at π(P); affects nothing.
- **Error** in xy-2022 at Proposition 3.6 proof, p. 16 (line 594): the source says intersection with K bijects algebraically closed intermediate fields of K̄ with relatively closed fields in K; it should be restricted to conjugation-stable fields, or replaced by conjugate saturation before descent; affects the proof.
- **Error** in xy-2022 at Proposition 3.6 proof, p. 16 (line 614): the source says the minimal isogeny field of the ambient variety alone determines when X is special; it should be combined with descent of the translated subvariety after removing its stabilizer; affects the proof.
- **Misprint** in xy-2022 at Proposition 3.1 proof, p. 19 (line 725): the source says X is special over the field that does not contain its minimal specialness field; it should be not special over that field; affects the proof.
- **Error** in xy-2022 at Lemma 5.3, p. 23 (line 908): the source says every X has a positive index with a strict dimension jump to a torsion subvariety; it should be restricted to positive-dimensional X; a singleton has dimension zero at every index; affects a stated result.
- **Gap** in xy-2022 at Proposition 5.4, pp. 25–26 (lines 972,996): the source says the height-zero fibre conclusion holds for all torsion points outside the jump locus; it should be stated for prime-to-characteristic torsion by this proof, or supplemented with an argument for non-étale torsion multisections; affects the proof.
- **Misprint** in xy-2022 at Proposition 5.4 proof, p. 26 (line 1013): the source says the intermediate intersection with the torsion multisection already carries the factor a; it should be unscaled until replacing that multisection by its numerical class aL^dim A′; affects the proof.
- **Misprint** in yamaki-strict-support at §5.3, p. 26 (lines 1101–1104): the source says a positive multiplication integer characterizes the canonical metric uniquely; it should be an integer at least two; multiplication by one imposes no metric condition; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "65367239ad6925da1da4d0b16b19241d8852dd8a", "job": "RT-HeightsRationalPointsAndObstructionsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
