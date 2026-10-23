<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/173#issuecomment-6373152840 -->
Red team round 2 pass a (codex) of 398e133

Verdict: needs_changes

1. **F01** (P2) Reconstruction is statable on native ranges but omitted

   **Location:** `packages/QuiverRepresentationsPartII/Suggested.lean:13`: “The finite-window classification and reconstruction need the oriented-window adapter and standard interval-pair construction.” Compare `packages/QuiverRepresentationsPartII/README.md:230`.

   **Claim:** Reconstruction cannot be an acceptance theorem until those constructions exist.

   **Witness:** `Mathlib/Algebra/Module/Submodule/Range.lean:155` supplies `LinearMap.rangeRestrict`; `Mathlib/Algebra/Module/Submodule/LinearMap.lean:209` supplies restriction. Native range submodules, their induced gradings and linear equivalences already express the entire reconstruction statement.

   **Exact repair text:** Remove reconstruction from the unavailable-headline list. Add the following headline in Layer 1, document it in §1.6, and retain the existing classification-based proof plan. This uses the actual ranges without constructing an interval classification or an image model. The grade-membership biconditionals express preservation in both directions.

   ```lean
   /-- Equal graded dimensions and isomorphic unshifted VN images determine a VN pair. -/
   theorem reconstruction_from_image {S T : Space}
       (P : Pair S .up) (Q : Pair T .up)
       (hdim : ∀ a : ℤ, Module.finrank ℂ (S.grade a) =
         Module.finrank ℂ (T.grade a))
       (e : LinearMap.range P.operator ≃ₗ[ℂ] LinearMap.range Q.operator)
       (hgrade : ∀ (a : ℤ) (v : LinearMap.range P.operator),
         (v : S.Carrier) ∈ S.grade a ↔ (e v : T.Carrier) ∈ T.grade a)
       (hoperator : ∀ v : LinearMap.range P.operator,
         e (P.operator.rangeRestrict (v : S.Carrier)) =
           Q.operator.rangeRestrict (e v : T.Carrier)) :
       ∃ f : S.Carrier ≃ₗ[ℂ] T.Carrier,
         (∀ (a : ℤ) (v : S.Carrier), v ∈ S.grade a ↔ f v ∈ T.grade a) ∧
         (∀ v : S.Carrier, f (P.operator v) = Q.operator (f v)) := by sorry
   ```

   **Instance test:** On `[0,2]+[1,1]`, the grade dimensions are `(1,2,1)` and the image is `[1,2]`; the identity satisfies both equations. Replacing it by `[0,2]` keeps the image but changes the middle dimension to 1, so hdim rejects it. Zero pairs in grades 0 and 1 likewise fail hdim. This is a statement-level carrier witness, not a claimed elaboration run.

2. **F02** (P2) The general finite-poset milestone is absent from acceptance

   **Location:** `packages/QuiverRepresentationsPartII/README.md:516`: “existence of an equal-size antichain and disjoint chain partition”. `packages/QuiverRepresentationsPartII/Suggested.lean:165` quantifies only over multisegments.

   **Claim:** §4.3 develops finite Dilworth for arbitrary finite posets before its occurrence specialization, but the acceptance file tests only endpoint posets and does not name the general theorem as unavailable.

   **Witness:** `Mathlib/Order/Preorder/Chain.lean:51` and `Mathlib/Order/Antichain.lean:42` already supply both predicates. Fintype, Finset, finite unions and disjointness supply the remaining carriers; no new construction is needed to state an attaining partition.

   **Exact repair text:** Add this Layer 4 headline and name it in §4.3. Keep the occurrence theorem as the separate matching comparison.

   ```lean
   /-- Every finite poset has a chain partition with as many parts as an antichain. -/
   theorem finite_dilworth {α : Type*} [PartialOrder α] [Fintype α]
       [DecidableEq α] :
       ∃ (A : Finset α) (C : Finset (Finset α)),
         IsAntichain (· ≤ ·) (A : Set α) ∧
         (∀ c ∈ C, c.Nonempty ∧ IsChain (· ≤ ·) (c : Set α)) ∧
         (C : Set (Finset α)).Pairwise Disjoint ∧
         C.biUnion id = Finset.univ ∧ A.card = C.card := by sorry
   ```

   **Instance test:** Empty poset: A=C=∅, union=∅ and 0=0. A three-element chain: A has one element and C one three-element part, giving 1=1. A three-element antichain: A has three elements and C three singletons, giving 3=3. The theorem is meaningful on arbitrary finite partial orders, beyond interval endpoint orders.

3. **F03** (P3) The polynomial nonvanishing input is already supplied

   **Location:** `packages/QuiverRepresentationsPartII/README.md:302`: “a nonzero polynomial has a nonzero evaluation, by induction in the variables”.

   **Claim:** The topology layer is to establish this fact by a new induction.

   **Witness:** At the declared Mathlib pin, `Mathlib/Algebra/MvPolynomial/Funext.lean:82`, `MvPolynomial.funext`, proves equality from all evaluations over every infinite integral domain, with arbitrary variable type. Its q=0 contrapositive is the requested fact.

   **Exact repair text:** Replace that sentence by: “Use `MvPolynomial.funext` from `Mathlib/Algebra/MvPolynomial/Funext`: over an infinite integral domain, a polynomial whose evaluations all vanish is zero. Its contrapositive supplies a nonzero evaluation for every nonzero complex polynomial.” Add this exact supplier to the Mathlib contracts. Keep the new topology and irreducibility targets.

   **Instance test:** For X(X−1), values at 0,1,2 are 0,0,2; nonzero evaluation exists. For a nonzero constant on zero variables, its sole evaluation is that constant. The replacement covers both without a new polynomial theorem.

4. **F04** (P3) Six definitions still lack discriminating Check coverage

   **Location:** `packages/QuiverRepresentationsPartII/README.md:188`, `:216`, `:248`, `:422`, `:534`: “standardVector”, “ImageModel”, “iteratedImage”, “restrictCentralizer”, “simultaneousRestrictions”, “InWindow”.

   **Claim:** Each definition is required to have at least three discriminating README Checks. The surrounding lists mainly test interval labels or different objects; §3.3 has no Checks at all.

   **Witness:** §§1.3 and 1.5 never test invalid standard vectors or an image embedding; §2.1 tests centralizer dimensions, not restriction values. §3.3 has no instantiated simultaneous restriction. §4.5 has no upper-window rejection.

   **Exact repair text:** Add these README Checks, keeping them out of Suggested.lean:

   - §1.3: “For one `[0,1]` occurrence, the degree-0 standard vector is nonzero; its degree-2 standard vector is zero. For two `[0,1]` occurrences, their degree-0 standard vectors are distinct and linearly independent.”
   - §1.5, ImageModel: “For N on `[0,2]`, embed the image basis as v₁,v₂, with range span(v₁,v₂). The zero embedding has range 0 and is rejected. Embedding those two vectors as v₀,v₁ is rejected: its range is span(v₀,v₁), not range N.”
   - §1.5, iteratedImage: “For the same chain, k=0,1,2,3 give types `[0,2]`, `[1,2]`, `[2,2]`, and ∅, with dimensions 3,2,1,0.”
   - §2.1, restriction: “For `[0,1]+[1,2]`, the unique opposite block with coefficient λ restricts to coefficient λ on `[1,1]+[2,2]`. For `[0,0]+[1,1]`, every coefficient restricts to zero on the zero VN image. For the zero space the restriction is the unique map between zero spaces.”
   - §3.3: “For `[0,0]+[1,1]`, L(v₁)=v₀ satisfies simultaneous image-admissibility; k=0 is the whole space and every k≥1 image is zero. L=0 fails already at k=0. For `[0,2]`, the sole opposite map L=0 works simultaneously on images of dimensions 3,2,1,0. Independently selecting zero at k=0 while the ambient L(v₁)=v₀ fails the restriction equation: its sides are 0 and v₀.”
   - §4.5: “InWindow `[1,3]` 3 holds; InWindow `[0,1]` 3 fails at the lower bound; InWindow `[2,4]` 3 fails at the upper bound. The empty multisegment satisfies InWindow 0.”

   **Instance test:** The displayed coordinates compute all proposed values. In particular λ=1 restricts to 1 in the first block example, and the second example has a one-dimensional restriction kernel. These exclude incorrect carriers, swapped grades and unrelated choices of restricted operators.

5. **F05** (P2) Both centralizer restriction headlines can be stated now

   **Location:** `packages/QuiverRepresentationsPartII/README.md:284`: “restriction to its unshifted VN image is a surjective complex linear map”; the WL version is at :292. Both are absent from Suggested.lean.

   **Claim:** The acceptance file omits the two restriction-surjectivity milestones while retaining only nilpotence from the actual-operator theory.

   **Witness:** `Pair`, `Module.End`, `LinearMap.range` and `LinearMap.rangeRestrict` already express opposite endomorphisms on the actual image and their commutation. The desired extension conclusion needs neither interval types nor a coordinate image model.

   **Exact repair text:** State both directions together as follows in Layer 2 and name this theorem in §§2.3–2.4. Its image homogeneity is the induced grading's actual membership condition, and its last conjunct is the restriction equality.

   ```lean
   /-- Every opposite-degree commuting map on an actual VN or WL image extends. -/
   theorem centralizer_image_extension {S : Space} {d : Direction}
       (P : Pair S d) (L' : Module.End ℂ (LinearMap.range P.operator))
       (hgrade : ∀ (a : ℤ) (v : LinearMap.range P.operator),
         (v : S.Carrier) ∈ S.grade a →
           (L' v : S.Carrier) ∈ S.grade (a - d.step))
       (hcomm : ∀ v : LinearMap.range P.operator,
         L' (P.operator.rangeRestrict (v : S.Carrier)) =
           P.operator.rangeRestrict (L' v : S.Carrier)) :
       ∃ L : Module.End ℂ S.Carrier,
         Homogeneous S L (-d.step) ∧
         L.comp P.operator = P.operator.comp L ∧
         ∀ v : LinearMap.range P.operator,
           L (v : S.Carrier) = (L' v : S.Carrier) := by sorry
   ```

   **Instance test:** For VN `[0,1]+[1,2]`, an image map sending the degree-2 source vector to λ times the degree-1 target vector extends by also sending the source's degree-1 vector to λ times the target's degree-0 vector. Both compositions on that source vector are λ times the target's degree-1 vector. Reflection gives the WL case. On a zero image the unique map extends by zero. No Lean execution is claimed.

6. **F06** (P3) Undeclared planned API names still appear as Lean code

   **Location:** `packages/QuiverRepresentationsPartII/README.md:94`: “`intSeg b k`”; :150: “`constantSpace n a`”; :188: “`standardSpace m`” and “`pairType P`”.

   **Claim:** The binding acceptance convention requires every backticked name belonging to this roadmap to be declared in Suggested.lean. These planned API identifiers are presented in code notation although their definitions were removed or intentionally omitted.

   **Witness:** None of intSeg, constantSpace, standardSpace or pairType occurs among the file's 39 declarations. The same mismatch occurs for imagePair, centralizer, genericType, dual and other planned geometric carriers.

   **Exact repair text:** Keep the mathematical targets, but use italic prose names for absent declarations and prose or fenced text for formulas involving them. In particular change the four code spans above to “*intSeg b k*”, “*constantSpace n a*”, “*standardSpace m*” and “*pairType P*”. Apply the same correction to Interval.shift, degreeDimension, totalLength, shiftMultisegment, Space.dimension, VN, WL, PairIso, standardVector, standardPair, shiftSpace, shiftPair, imagePair, ImageModel, iteratedImage, centralizer, oppositePair, restrictCentralizer, Precedes, ZariskiOpenDense, genericType, genericLocus, commutingIncidence, dual, Admissible, onOppositeImage, imageAdmissibleLocus, simultaneousRestrictions, ram, adjacentDualCount, integralSegmentAdapter and newformExample wherever code spans treat them as declarations. Retain code notation for actual acceptance declarations and pinned supplier names. Do not add API padding to satisfy the naming rule.

   **Instance test:** The prose still defines intSeg 2 2 as [2,4], of length3, and still specifies pairType of a standard singleton as that singleton. Only the false indication that these names are acceptance-file declarations is removed. The proposed headlines in S01, S02 and S05 are genuine declarations and should be named as such in the README.

Head verified as 398e133b108f3c7e9d8ae57f38f063ed9ec8defa. No package input has been edited; no Lean command has been run.

## Earlier findings: verification at this head

| Earlier ID | Status | Repaired passage and independently checked witness |
|---|---|---|
| a F01 | repaired | packages/QuiverRepresentationsPartII/Suggested.lean:107: “theorem Space.internal”; all ten admissions now belong to theorems; zero examples remain. Deletion follows the binding no-padding rule. |
| a F02 | repaired | packages/QuiverRepresentationsPartII/README.md:311: “whole one-point space is open, dense, and irreducible”; lines 35, 102, 118, 132, 155, 481, 498, 540 carry the requested prose controls. Values are −1, 3, two distinct labels, empty split, bottom, 0, matching size 2, and the three unit steps. |
| a F03 | repaired | packages/QuiverRepresentationsPartII/README.md:45 and :60 give Mathlib 6b7abb3 and Tau Ceti a91d3aa; packages/QuiverRepresentationsPartII/README.md:66: “pinned implementation supplier”. Compare lake-manifest.json at the supplied content pin. |
| a F04 | partly repaired | packages/QuiverRepresentationsPartII/README.md:171: “zero operator and E₂₁ are not pair-isomorphic”; :118 rejects a constant occurrence selector; :540 rejects wrong start and non-unit step. The two tautological Lean examples are absent. The requested three-Check coverage for every definition remains incomplete (S04). |
| a F05 | repaired | packages/QuiverRepresentationsPartII/README.md:148 names Space.Carrier; :162 names Direction.step; :302 names polynomial_irreducible. The closing catalogue, reversal helper, length helper and range helper are absent from Suggested.lean. |
| a F06 | repaired | packages/QuiverRepresentationsPartII/sources.toml:1: “schema = "tauceti-roadmap-sources/v1"”; five distinct source keys, with Z81 explicitly uncertified. |
| a F07 | repaired | packages/QuiverRepresentationsPartII/Suggested.lean:132: “IsChain Interval.included (A : Set Interval)”; :146 specializes IsAntichain. Empty sets satisfy both; equal interval copies remain endpoint-incomparable. |
| a F08 | repaired | packages/QuiverRepresentationsPartII/README.md:649: “Prove the following mathematical recurrence for the geometric dual”; :661 states an injection condition. No separate mwLabel or executable selection procedure remains. The revised matching threshold is confirmed by the source audit below. |
| a F09 | repaired | packages/QuiverRepresentationsPartII/README.md:19: “use Mathlib’s IsChain and IsAntichain”. The numbered Mathlib pull-request citation is absent. |
| a F10 | repaired | packages/QuiverRepresentationsPartII/README.md:174: “nilpotence follows directly from the finite grading support”; :176 constructs the finite-window equivalence before :188 defines pairType. The former internal cycle is absent. |
| a F11 | repaired | packages/QuiverRepresentationsPartII/README.md:631: “a unitary irreducible supercuspidal representation ρ of GL_d(F), d≥1, and a real c”; :663 supplies label independence. The GL₂-label example now has group rank 4, and the equal-characteristic example is explicit. |
| b F01 | repaired | packages/QuiverRepresentationsPartII/README.md:9 uses the plain SmoothRepresentationsOfLocalGroups name; :68, :76, :80 have the three canonical supplier headings. No nonexistent main link remains. |
| b F02 | repaired | packages/QuiverRepresentationsPartII/README.md:64: “Tau Ceti also supplies these interfaces directly”; :339: “before using the orbit supplier”. All six temporal occurrences are absent. |
| b F03 | repaired | packages/QuiverRepresentationsPartII/README.md:126: “the maximal part plus the remainder is m”. maximalPart_add_remainder is absent from Lean; this elementary API fact remains prose. |
| b F04 | repaired | packages/QuiverRepresentationsPartII/Suggested.lean:195 has only p and m; packages/QuiverRepresentationsPartII/README.md:536 says “for every m, r and a”. For r=a=0 the weight is 0≤E₀; for r=3,a=1,m=[0,1], every path has 0≤1. |

No earlier finding was marked “not actionable in this package”; no settled finding is re-raised.

## Verified sound

Read all 728 README lines, all 218 Suggested.lean lines and all 85 source-manifest lines. The acceptance file has **39 explicit declarations: 29 real-bodied definitions/carriers and 10 admitted theorems**. There are **35 numbered target sections**. The 175-row README statement table below includes their definitions, theorem/API assertions, conventions and comparisons; the separate declaration table has all 39 declarations. All **43 bold spans** were inspected: they are the summary, Check labels, reference keys and emphasis within prose; none is an additional individually bold named declaration. Their mathematical assertions are included below. The prior 15 findings were checked individually; 14 are repaired, and a F04's general coverage requirement is partly repaired.

The supplied 39 elaborated signatures were compared individually against the README and original declaration text. All required binders survive: S fixes the finite coordinate carrier; d admits only ±1; h excludes the empty peeling branch; r,a are natural numbers, coerced to integers at the cut; attainment retains its window and interior hypotheses. There are no standing section variables to disappear. The pretty-printed irreducibility signature hides its topology argument, but the source explicitly supplies polynomialTopology, so it does not accidentally assert Euclidean irreducibility. No signature was changed and no Lean elaboration or build was run by this reviewer.

No false statement was found among the ten existing Lean theorems. None closes by a single pinned lemma or merely evaluates a boundary case: internality needs a coordinate decomposition, nilpotence a finite common bound, irreducibility the generated polynomial topology, Dilworth a finite partition argument, cut width an occurrence-weight comparison, path bounds/attainment nested-interval arguments, and peeling/truncation multiplicity arguments. The easy API and boundary signatures identified previously remain deleted. S01, S02 and S05 identify missing statable headlines; no new padding finding is made.

### Declaration-by-declaration adversarial table

Contexts below are complete mathematical contexts, not implicit extra assumptions. Every declaration is in `TauCetiRoadmap.QuiverRepresentationsPartII`; ordinary data lives in Type, coefficients are ℂ, classical propositional decidability is local, and there are no section variables. Let A=[0,2], B=[1,1], C=[0,0]+[1,1], D=2[0,1], Q=2[0,0]+3[1,1], and ∅ denote the empty multiset. Let N=E₂₁ and L=E₁₂ on degrees (0,1).

| Declaration (Suggested.lean line; section) | Variable/instance context | Instances and computed values | Result / change |
|---|---|---|---|
| Interval (33; 0.1) | left,right:ℤ; left≤right | (0,0): 0≤0; (0,2): 0≤2; (1,0): 1≤0 false | Real nonempty intervals; no change |
| Interval.contains (40; 0.1) | s:Interval,a:ℤ | A at 0,2,3 gives true,true,false | Inclusive; no change |
| Interval.included (44; 0.1) | s,t:Interval | B⊆A true; A⊆B false; A⊆A true | Correct direction |
| Interval.shorten (48; 0.1) | s:Interval | [3,3]→none; [3,4]→[3,3]; A→[0,1] | Singleton deletion correct |
| Multisegment (52; 0.2) | Multiset Interval | D.card=2, not 1; ∅.card=0 | Multiplicity retained |
| rightTruncate (55; 0.2) | m:Multisegment | D→2[0,0]; [0,0]+[1,3]→[1,2]; ∅→∅ | Bind deletes singletons |
| occurrenceInterval (61; 0.2) | m; i:Fin m.card | D has two labels both [0,1]; [0,0]+[2,2] gives counts 1,1; ∅ has no i | Choice of list changes order only |
| maximalPart (65; 0.3) | m; classical decidability | max(2A)=A; max(A+B)=A; max(C)=C; max∅=∅ | One copy, full inclusion |
| remainder (69; 0.3) | m; multiset subtraction | rem(2A)=A; rem(A+B)=B; rem(C)=∅ | No unintended underflow |
| Space (75; 1.1) | n:ℕ; degree:Fin n→ℤ | n=0 gives zero coordinates; n=2,degree=(3,3) gives dimension 2 | Finite-support model |
| Space.Carrier (80; 1.1) | S:Space | n=0: singleton function space, vector dimension 0; n=2: ℂ² | No extra finite-dimensional hypothesis needed |
| Space.grade (83; 1.1) | S,a:ℤ | degrees (3,3): grade3=⊤, grade4=⊥; zero S: every grade=⊥ | Submodule equations closed under scalars |
| Direction (90; 1.2) | two constructors | up,down count=2; no zero-step constructor | Excludes identity-direction counterexample |
| Direction.step (93; 1.2) | d:Direction | up→1; down→−1 | Signs agree with shifts |
| Homogeneous (98; 1.2) | S,T:Endℂ S.Carrier,c:ℤ | N sends grade0 to1; degree−1 fails at v₀; zero T works for both ±1 | Pinned predicate specialization |
| Pair (102; 1.2) | S,d; T and proof of homogeneity | N gives up pair; L gives down pair; identity on one nonzero grade fails +1 | Actual operator, no free predicate |
| Space.internal (107; 1.1) | S | degrees (0,1): (x,y)=(x,0)+(0,y) uniquely; empty S: 0↔0 | Correct bijectivity, not just disjointness |
| Pair.nilpotent (110; 1.2) | {S,d},P | N≠0,N²=0; single-grade zero has T¹=0; zero-dimensional id=0 | Uniform exponent, no characteristic extrapolation |
| polynomialTopology (116; 2.5) | n:ℕ | D(0)=∅; D(1)=whole; n=1,D(X)=ℂ∖{0} | Real topology on native carrier |
| polynomial_irreducible (121; 2.5) | n; explicit polynomial topology | n=0: one point; n=1: D(X)∩D(X−1) contains 2 since 2·1≠0 | Not Euclidean topology; S03 concerns an input only |
| cutPart (127; 4.1) | m,a:ℤ | C at0 has 2; C at3 has0; 2A at0 has2 | “or”, not “and” |
| IsInclusionChain (131; 4.1) | A:Finset Interval | {A,B}=true; {[0,0],[1,1]}=false; ∅=true | Native IsChain semantics |
| chainWeight (135; 4.1) | m,a; finite sup in ℕ | E₀(C)=1; E₀(2[0,1]+B)=3; E₃(C)=0 | Full counts, empty sup=0 |
| endpointBefore (140; 4.2) | m;i,j:Fin m.card | [0,0]→[1,1]=true; duplicate D=false; A→B=false since 2<1 fails | Strict both ends |
| IsEndpointAntichain (145; 4.2) | m;A:Finset labels | both D labels=true; both C labels=false; empty=true | Distinct equal labels incomparable |
| IsEndpointMatching (149; 4.2) | m;E:Finset(label×label) | on 0,1,2 singletons: {(0,1),(1,2)} true; {(0,1),(0,2)} false; {(0,2),(1,2)} false | Left/right roles independent |
| matchingNumber (155; 4.2) | m | D→0; C→1; three successive singletons→2; ∅→0 | Counts edges |
| antichainWidth (160; 4.2) | m | D→2; C→1; A+B→2; ∅→0 | Counts labelled copies |
| weighted_dilworth (165; 4.3) | m | D:0+2=2; C:1+1=2; three singletons:2+1=3; ∅:0+0=0 | Finite tests pass; S02 adds general input |
| cut_antichain_width (169; 4.3) | m,a:ℤ | C at0:1=1; A+B at0:2=2; C at3:0=0 | Both extrema agree |
| GridPath (173; 4.5) | r,a:ℕ; vertices plus start,finish,steps | r3,a1: (2,1),(1,1),(1,2),(1,3); steps (−1,0),(0,1),(0,1); r0,a0:(1,0) | a>r admits no path |
| intervalWeight (182; 4.5) | m,i,j:ℤ | m=2[1,3]: weights at (2,1),(1,2),(1,3) are0,0,2 | Invalid endpoints give zero |
| GridPath.weight (186; 4.5) | {r,a},p,m | displayed path on 2[1,3]:0+0+0+2=2; on ∅:0 | No repeated vertex counting |
| InWindow (190; 4.5) | m,r:ℕ | [1,3],r3:true; [0,1],r3:false; [2,4],r3:false; ∅,r0:true | Correct body; S04 adds Checks |
| GridPath.weight_bound (195; 4.5) | {r,a},p,m only | r3,a1,m=[0,1]:0≤1; r0,a0,m=[0,0]:0≤1 | Unrestricted repair sound |
| grid_path_chain_max (199; 4.6) | m,{r,a};1≤a,a<r,InWindow | m=2[1,3],r3,a1:max weight2=E₁; m=∅:0=0; outside [0,1]:0≠1, hypothesis fails | Attainment requires support control |
| truncate_maximalPart (206; 5.1) | m | 2A: both sides [0,1]; [0,0]+2[1,2]+B: both [1,1]; ∅:both∅ | Surviving maxima preserved |
| truncate_remainder (210; 5.1) | m | 2A: both [0,1]; [0,0]+2[1,2]+[2,2]: both [1,1]; ∅:both∅ | Multiplicity subtraction correct |
| chainWeight_peeling (214; 5.2) | m,a,h:cut≠0 | C,a0:1=0+1 and1=1; 2A,a0:2=1+1 and1=1; ∅ would give0=1 but h fails | Nonempty hypothesis essential |

### README statement and convention table

These rows cover the additional prose targets and API statements as well as the displayed identities. Definition rows shared with the declaration table are referenced explicitly. Positive, negative and degenerate values are recorded; “not statable” refers to an acceptance signature, not to the mathematical assertion's truth.

| Statement / location | Instances and computed values | Result / change |
|---|---|---|
| Summary and ownership, 3–19 | C has dual [0,1], ram [0,0]; ram(C)=1 singleton whereas ram of either summand=∅ | Geometric dual/split distinct from supplier representations |
| Inclusive length and empty-interval convention, 23 | [0,0]:1; [0,2]:3; [1,0] invalid | Boundary fixed |
| Occurrence count versus length, 23 | D has card2,length4; Q has card5,length5 | Full multiplicities |
| Shift convention, 25–31 | [0,2] shifted−1=[−1,1]; V(−1)₀=V₁ | Correct sign |
| VN/WL images, 31 | VN A image[1,2], shifted−1=[0,1]; WL A image[0,1] | Both constructions recomputed |
| Trace pairing, 35 | tr(E₂₁E₁₂)=1; NL−LN=diag(−1,1); pairing with diag(1,0)=−1 | Sign correct |
| Complex-point topology, 33 | affine dimension0 has one point; D(1) is that point, D(0)=∅ | Nonempty irreducibility meaningful |
| Normalized Z/L convention, 37 | Z([0,1])=ν^{1/2}∘det, L([0,1])=ν^{1/2}St; L(C)=Z([0,1]) | Subrepresentation and quotient separated |
| Empty representation, 37 | m=∅ gives n=d·0=0, vector dimension1 | Not zero representation |
| Integral interval / contains / included / shorten, 94 | Declaration table gives endpoint truth values and [3,3]→none | Same definitions |
| intSeg and interval length, 94 | intSeg 2 2=[2,4]; length3; intSeg 3 0=[3,3],length1 | Natural conversion nonnegative |
| Endpoint extensionality, 96 | equal (0,2) endpoints give A=A; changing2→1 gives distinct intervals | No proof-field dependence |
| Translation and membership iff, 96 | 3∈[2,4] iff2∈[1,3]:true; 5∈[2,4] iff4∈[1,3]:false | Both directions |
| Positive length, 96 | singleton1>0; A length3>0 | No empty interval admitted |
| Inclusion reflexivity/transitivity/antisymmetry, 96 | [1,1]⊆[0,2]⊆[−1,3]; reverse outer inclusion false; both ways at A give endpoints0=0,2=2 | Correct partial-order laws |
| Multisegment/rightTruncate/occurrence labels, 109 | D→2[0,0]; labels2; ∅→∅ with no labels | Declaration values agree |
| degreeDimension and totalLength, 109 | A+B has dimensions(1,2,1), length4, card2 | Distinct invariants |
| shiftMultisegment, 109 | 2[2,4] shifted−1=2[1,3]; ∅ shifted any c=∅ | Multiplicity and empty value |
| Truncation additivity, 111 | trunc([0,0]+[1,3])=[1,2]=∅+[1,2] | Correct singleton deletion |
| Truncation/translation commutation, 111 | [2,4],c=−1: both [1,2]; singleton[2,2]:both∅ | No endpoint loss |
| Additive dimensions, 111 | deg₁(A+B)=2=1+1; deg₃=0=0+0 | Off-support zero |
| Occurrence counting, 111 | D has count2 at[0,1]; separated singletons counts1,1 | Constant selector rejected |
| Sum of all dimensions, 111 | A+B:1+2+1=4; ∅:0 | Sum is finitely supported |
| Truncation decrement, 111 | A+B: length2=4−2; D:2=4−2; ∅:0=0−0 | Strict only for nonempty m |
| maximalPart/remainder, 124 | 2A↦(A,A); A+B↦(A,B); C↦(C,∅) | One-copy convention |
| Maximal count criterion, 126 | in2A, countmax(A)=1; inA+B,countmax(B)=0 | Both branches |
| Split equality, 126 | A+A=2A; A+B=A+B; ∅+∅=∅ | Elementary API retained only in prose |
| Maximal members incomparable, 126 | C's distinct singletons: neither includes the other; same interval comparison forces equality | No duplicate maxima |
| Existence of containing maximum, 126 | B⊆A inA+B; singleton isolated[5,5] contains itself | Empty input has no occurrence premise |
| Worked maximal split, 138 | m=[0,0]+2[1,2]+[2,2], max=[0,0]+[1,2], rem=[1,2]+[2,2]; trunc m=2[1,1] | Correct copies |
| Space / carrier / grade, 148 | n2 with degrees3,3: ℂ²,grade3=⊤,grade4=⊥; n0:zero | Coordinate specialization adequate |
| Space.dimension, 148–150 | grade3 dimension2=two indices; missing grade4 dimension0=zero indices | Finite basis count |
| Abstract grading presentation, 148 | dimensions(2,3) requires five basis indices; not two | Multiplicities not assumed1 |
| Space.internal/support, 150 | degrees0,1 decompose(x,y) uniquely; constantSpace2 3 support{3}; empty support∅ | Finite direct-sum property |
| constantSpace, 150 | (2,3) has dims2 at3,0 at4; (0,0) has dim0 everywhere | Three concrete cases |
| Directions and homogeneous pairs, 162 | N step1, L step−1, nonzero identity step0 excluded | Real operator condition |
| PairIso / Pair.Isomorphic, 162 | singleton0 versus singleton1 not graded iso; zero versus N on(0,1) not intertwined; identity gives P≅P | Grade and operator conditions both necessary |
| zeroPair and nilpotence, 162–164 | zero^1=0; N²=0 but N≠0 | Uniform exponent target |
| Isomorphism reflexivity/transitivity, 164 | scaling by2 then3 gives6, inverse1/6; zero maps intertwined on same grades | Laws consistent |
| Degree reflection, 164 | [0,2]→[−2,0], VN arrows become WL; reflection twice gives[0,2] | Distinct from transpose |
| Finite-window equivalence, 176 | [0,0] gives one vertex and0 arrows; [0,1] arrow coefficient1; enlargement[−1,2] adds two zeros | Adapter precedes classification |
| Window restriction compatibility, 176 | extend then restrict E₂₁ yields coefficient1 again; boundary arrows0 | No wraparound |
| standardSpace, 188 | A has three basis vectors; D has two grade0 and two grade1 vectors | Occurrence basis |
| standardVector, 188–190 | one[0,1] at0=v₀; at2=0; duplicate block vectors at0 independent | S04 adds missing Checks |
| standardPair, 188 | A up:v₀→v₁→v₂→0; down:v₂→v₁→v₀→0 | No degree translation |
| pairType and standard type, 188–190 | standard A up/down both typeA; zero WL singleton2 type[2,2] | Classification label convention |
| Standard dimension formulas, 190 | A+B grade1=2,total4; D grade0=2,total4 | Agrees with §0.2 |
| Arrow formulas and invalid vectors, 190 | N v₂=0 forA; L v₀=0; every image of invalid vector0 is0 | No out-of-range nonzero value |
| Vector nonvanishing/basis/grade, 190 | [0,1] at0 lies grade0 and is nonzero; at2 equals0, lying in every grade | Total-function case |
| Pair classification iff, 202 | zero versusN on(0,1): types C versus[0,1], not iso; conjugating N by scale2 gives same type | Both directions consistent |
| Type grade-dimension formula, 202 | A+B at1 gives2; singleton support2 at0 gives0 | Full multiplicity |
| Rank table, 204 | A+B: R(0,0)=1,R(1,1)=2,R(2,2)=1,R(0,1)=R(1,2)=R(0,2)=1 | Diagonal includes all singletons |
| Rank finite differences, 207 | multiplicity[0,2]:1−0−0+0=1; [1,1]:2−1−1+1=1; [0,1]:1−0−1+0=0 | Integer subtraction essential |
| WL rank analogue/type determination, 210 | reverse A+B arrows has same three ranks1 and diagonal1,2,1 | Same interval labels |
| shiftSpace/shiftPair, 216–218 | A shifted−1 supported[−1,1], images shifted consistently; singleton2 shifted−1=singleton1 | Correct grade reindexing |
| imagePair / ImageModel, 216 | A VN range span(v₁,v₂),dim2; zero map range0,dim0 | Real subspace; S04 covers embeddings |
| Image embedding and grading, 216 | embed basis as(v₁,v₂); range∩grade1=span v₁; range∩grade0=0 | Zero embedding rejected by range condition |
| iteratedImage, 216 | A,k=0,1,2,3: dimensions3,2,1,0 and supports[0,2],[1,2],[2,2],∅ | S04 adds explicit Checks |
| VN image type with shift, 218 | A: [1,2](−1)=[0,1]=trunc A; singleton→∅ | Shift necessary |
| WL image type, 218 | A: [0,1]=trunc A; no shift | Opposite convention preserved |
| Reconstruction, 230–238 | A+B andA share image[1,2] but have middle dimensions2 versus1; equal grade dimensions and image recover multiplicities | True; S01 adds signature |
| centralizer, 248 | chainA:dim0; C:dim1; Q:dim6 | Opposite degree, not full endomorphism centralizer |
| oppositePair, 248–250 | onC, scalar1 gives WL[0,1],scalar0 gives two singletons | Same actual L |
| Commutation law/range stability, 248–250 | for[0,1]+[1,2], allowed L maps source1→target0 and source2→target1; NL=LN maps source1→target1 | Nonzero commuting compositions exist |
| restrictCentralizer/embedding, 248–250 | preceding block coefficientλ restricts toλ on singleton images; onC restrictionλ→0 | S04 adds these Checks |
| Conjugation invariance, 250 | scale target basis by2 sends coefficient1→2, both centralizer points; inverse gives1 | Linear equivalence not chosen labels |
| Precedes / coordinate equivalence, 262–270 | target[0,0],source[1,1]:0<1≤1≤1,dim1; selfA:0<0 false,dim0; gap0→2:2≤1 false | All 100 block systems agree |
| Independent occurrence coordinates, 268 | Q has2×3=6 variables; identity minor in2×3 matrix has det1 and rank2 | No deduplication |
| VN restriction surjectivity, 284–286 | original[0,1]←[1,2] parameterλ maps to image[1,1]←[2,2] sameλ; zero image target has unique0 | Lifting criterion correct |
| WL restriction surjectivity, 292–294 | reflected blocks[−1,0]←[−2,−1] have the same coefficient liftλ→λ | Reflection reverses degree only |
| polynomialTopology/centralizerTopology, 300 | dim1: D(X)=ℂ∖0; dim0:point; coordinate scale2 pulls X to2X with same zero locus | Topology independent of basis |
| ZariskiOpenDense, 300 | D(X) open dense but not whole; ∅ not dense inpoint; point dense inpoint | Nonempty centralizer included |
| Nonzero evaluation/product, 302 | X(X−1) at2=2; constant1 at unique zero-variable point=1 | True existing input; S03 |
| Coordinate/centralizer irreducibility, 302 | C centralizerℂ has intersecting D(X),D(X−1); A centralizerpoint has only one nonempty open | No Euclidean substitution |
| Finite intersections, 302 | D(X)∩D(X−1)=ℂ∖{0,1}; empty family giveswhole | Empty-family branch correct |
| Surjective linear inverse image, 304 | projectionℂ²→ℂ pulls D(X) back tox≠0, contains(1,0); zero map pulls it back to∅ | Surjectivity essential |
| Affine-subspace intersection, 304 | D(X) misses subspace{0}; meets line y=0 inℂ² densely where x≠0 | Nonempty intersection retained |
| Unit disk Check, 310 | disk contains0; complement has infinitely many positive integers and is notwhole | Correct non-Zariski-open control |
| genericType, 317 | A→three singletons; C→[0,1]; gap[0,0]+[2,2]→itself | Attained rank determines type |
| Finite simultaneous rank maxima, 317 | Q has maximal rank2, attained by [[1,0,0],[0,1,0]]; zero matrix rank0 | A nonzero minor supplies nonempty open |
| genericLocus, 319 | C gives scalar≠0; A giveswhole point | Full type locus, not arbitrary subopen |
| Generic-type uniqueness, 319 | C rank1 locusℂ× dense; rank0 locus{0} not dense | Wrong type excluded |
| Generic conjugation invariance, 319 | λ=1→2 by grade scaling, both type[0,1] | Basis independent |
| Generic shift compatibility, 321 | C shifted−2 has dual[−2,−1]; λ1 generic before/after,λ0 not | Underlying map unchanged |
| G,E₊,E₋, 335 | dimensions(2,3): dimG=4+9=13,dimE±=6; G nonabelian | No commutative-group shortcut |
| commutingIncidence, 335 | grades(1,1):NL=LN iff nl=0; (1,1) rejected; origin admitted | Reduced point-set locus described |
| Trace tangent identity, 335 | X=diag(1,0),[X,N]=−N; both traces−1 | Sign fixed at two terms |
| Orbit geometry, 339 | 2×3 ranks0,1,2 give orbit dimensions0,4,6 and stabilizer dimensions13,9,7 | Smooth finite-type complex action |
| Conormal bundle comparison, 340 | same ranks: fibre dimensions6,2,0 =6−(0,4,6) | Rank normalization agrees |
| Closure dimension, 341 | orbit+fibre=0+6=4+2=6+0=6; zero space0+0=0 | Equal dimensions used, not topology alone |
| Incidence components, 342 | scalar case has two axis closures, each dim1; zero space one component dim0 | Finite orbit premise supplied |
| Opposite closure correspondence, 343 | n≠0 up orbit has down0; n=0 has dense down l≠0 | Projection direction correct |
| Generic-fibre comparison, 344 | over n=0:fibreℂ,intersectionℂ×; over n=1:fibre{0},intersection{0} | Every orbit fibre met |
| Generic conormal symmetry, 333–346 | [0,1]→C→[0,1]; C→[0,1]→C | Correct both directions; Z81 remains uncertified |
| dual, 358 | A→three singletons; C→[0,1]; gap→gap; ∅→∅ | No arbitrary additivity |
| VN generic-dual identification, 358 | C at coefficient1 and its scaled conjugate2 both generic type[0,1] | Classification invariance |
| WL generic-dual identification, 358–362 | WL chain[0,1] has opposite zero of typeC; transpose preserves endpoints0,1 | No endpoint reflection here |
| Dual dimensions/length, 358 | Q and2[0,1]+[1,1] both have dims(2,3),length5 | Full grade preservation |
| Dual translation, 360 | dual(C shifted−2)=[−2,−1]=shift(dual C,−2) | Shift sign consistent |
| Dual involutivity, 374 | dual²(A)=A;dual²(C)=C;dual²(∅)=∅ | 1,001 finite cases agree |
| Admissible, 390 | C:λ1 true,λ0 false; A:onlyλ0 true; zero space true | Genericity condition fixes object |
| onOppositeImage, 390 | C,λ1 has actual image grade0 line with N=0,type[0,0]; A,L0 has image0 | Correct unshifted image |
| imageAdmissibleLocus, 390–396 | C,λ1: image WL and VN type[0,0],dual fixed; λ0 fails ambient admissibility | Two conditions retained |
| Admissible iff generic, 398 | onC both predicates say λ≠0:values true at1,false at0 | Both directions |
| Opposite image embedding, 398 | C,λ1:embed(v₀)=v₀ and N v₀=0 on both sides | Actual intertwiner |
| Image-admissible⇒admissible, 398 | C,λ1:true⇒true; C,λ0 premisefalse | Elementary implication stays prose |
| Image-admissible open dense, 410–414 | C locusℂ×; A locuspoint; zero locuspoint | No positive dimension requirement |
| Nonzero-minor charts, 414 | C chart atλ1 has denominator1;λ0 is excluded | No division by zero |
| simultaneousRestrictions, 420–422 | A ranges dimensions3,2,1,0 all carryL0; C needsλ≠0 onk0 and zero maps onk≥1 | True target; S04 adds definition Checks |
| Finite pullback intersection, 422 | N³=0 onA leaves only k0,1,2 nonzero images; all later images0 | Finite-support hypothesis used |
| ram, 431 | ramA=∅;ramC=[0,0];ramgap=∅;ram∅=∅ | Correct right truncation |
| Dual of ramification, 434 | C:dual(ramC)=[0,0]=trunc[0,1] | Involution used |
| VN-image realization, 434 | C,λ1 gives grade0 image type[0,0]=ramC | Correct actual image |
| Length bound, 434 | C:1≤2;A:0≤3;∅:0≤0 | Subspace dimension proof |
| Ram translation, 436 | ram(C shifted−2)=[−2,−2]=shift(ramC,−2) | No hidden +1 |
| Shifted image-admissibility, 436 | C,λ1 shifted−1: image singleton−1; both dual equality sides singleton−1 | Same underlying L |
| Ram/truncation commutation, 450–462 | [0,1]+[1,2]: both[0,0]; C:both∅;A:both∅ | ImNL=ImLN with common−1 shift |
| cutPart/chainWeight/IsInclusionChain, 472 | C cut card2,weight1; 2[0,1]+B cut card3,weight3; outside cut0 | Same as Lean |
| adjacentDualCount, 472 | C at0 count1; A at0 count0; Q at0 count2 | Requires both grades |
| Cut occurrence counts, 474 | D at0 retains count2; at3 count0 | No set reduction |
| Chain cardinal bound, 474 | C:1≤2;2[0,1]+B:3≤3;∅:0≤0 | Natural subtraction safe |
| Weight-zero iff empty, 474 | C,a0:1≠0 and cut nonempty; C,a3:0=0 and cutempty | Both directions |
| Empty/singleton/rejected chains, 474 | ∅ true;{A}true;C distinct intervalsfalse | Pinned chain vocabulary |
| endpointBefore, 487 | 0→1→2 singleton chain true; equal endpoint0 prevents strict edge | Strict partial order |
| Endpoint irreflexivity/transitivity, 491 | self requires0<0 false;0<1<2 implies0<2 at both ends | Both laws |
| Matching/width definitions, 489 | D:(0,2); C:(1,1); three successive singletons:(2,1) | Role reuse allowed |
| Matching size bound, 491 | three-singleton maximum2≤3; empty0≤0 | Projection injection proof |
| Maximum-bound equivalences, 491 | C bound1:true for all matchings; bound0:false on one edge; D width-bound1:false on two labels | Both implications tested |
| Permutation invariance, 491 | swapD labels leaves(0,2); swapC labels reverses index edge but leaves(1,1) | Occurrence order immaterial |
| Finite chain-cover weak duality, 516 | three-element chain antichain1≤onepart; three incomparable elements3≤threeparts | Arbitrary covers counted |
| Attaining disjoint chain partition, 514–516 | chain3:onepart,width1; antichain3:threeparts,width3; empty:0parts,width0 | S02 adds general signature |
| Matching/partition correspondence, 514 | 0→1→2 matching2 gives one chain=3−2; no edges gives3chains=3−0 | Acyclic strict relation |
| weighted_dilworth, 506–510 | D:0+2=2;C:1+1=2;∅:0+0=0 | General finite proof owned here |
| cut_antichain_width, 512 | D at0:2=2;A+B at0:2=2;C at0:1=1 | Full copies necessary |
| Incomparability iff inclusion, 518 | A,B endpoint-incomparable and nested; C comparable endpoints and nonnested; duplicates incomparable and equal | Endpoint equalities covered |
| Adjacent generic rank, 524 | Q:rank2=matching2=count2; C:1=1=1; A:0=0=0 | Adjacent only |
| Edges at cut / overlap, 526 | a0,target[−1,0],source[1,2]:−1<1≤1≤2; both requisite grades present | Correct padding support |
| Determinant/matching bound and attainment, 526 | selected2×2 identity minor det1; zero matrix all minors0 | Distinct variables per allowed entry |
| GridPath and weights, 534 | declaration table: valid steps, invalid start weight0, terminal weight2 | Actual paths, no surrogate |
| Path step counts/rectangle, 536 | r3,a1:one decrement,two increments; rectangle[1,2]×[1,3]; r0,a0:(1,0) | a>r impossible |
| Distinct/nested valid vertices, 536 | [1,1]⊊[1,2]⊊[1,3]; each meetsa1; initial(2,1)invalid | Bound valid outside window |
| Path upper bound, 536 | outside-window[0,1],r3,a1 gives0≤1 | Repair verified |
| Path attaining maximum, 550–552 | 2[1,3] maxweight2=E₁; C shifted1 atcut1 maxweight1=E₁ | Extension can add zero-weight vertices |
| Monotone-region rank sum, 554 | r3,a1,m=2[1,3]:cut2−boundary2=0; [1,1]+[2,2]:cut2−boundary1=1 | Consistent with source formula |
| Adjacent chain formula, 560–566 | C:1+1=2;2[0,1]+B:0+3=3;A+B:0+2=2;∅:0+0=0 | All-integer target |
| Boundary cuts, 568 | A,a=−1 or2:dual crossing0,cut1,weight1 | No artificial r≥2 restriction |
| Truncation/maximalPart, 584–591 | 2A:both[0,1]; singleton only:both∅ | Injective on surviving intervals |
| Truncation/remainder, 584–591 | [0,0]+2[1,2]+[2,2]:both[1,1] | Cancellation preserves multiplicity |
| Nonempty chain decrement, 597–605 | C:1=0+1;2A:2=1+1;maxpart weights1 | Empty remainder branch handled |
| Empty-cut companion, 603 | ∅ orC,a3:all three weights0; increment would be0=1 | Prose boundary result only |
| Ramified maximal split, 613–625 | C:[0,0]=[0,0]+∅;2A:∅=∅+∅;workedm:[0,0]=[0,0]+∅ | 1,001 recurrence-based cases agree |
| Split proof grade dimensions, 623 | C:cut2−weight1=1;max=C same1;remainderempty0;1=1+0 | Reconstruction input matches |
| Nonadditivity control, 625 | ram(C)=[0,0] versus ram(singleton0)+ram(singleton1)=∅ | Arbitrary splitting excluded |
| Integral-segment adapter, 631–639 | d2,[0,1],c0 givesρ,ρν onGL4; singleton groupGL2;emptyGL0 | General cuspidal rank repair |
| Adapter support/twist, 639 | b0,e1,c2 givesρν²,ρν³; shiftingb,e by1 givesρν³,ρν⁴ | Same common determinant twist |
| Representation comparison, 631–637 | d1,C: L(C)=Z([0,1]); d2,[0,1]:group rank4 onboth sides | Label equality at same rank |
| Unramified normalization, 641–647 | q2,χ=ν² givesabsχ(ϖ)=1/4,c2,absχ₀(ϖ)=1; unitaryχ givesc0 | log denominator nonzero |
| Uniformizer independence, 647 | ϖ′=uϖ:χ(u)=1,absu=1,so both log ratios equal | Unramified hypothesis used |
| Equal characteristic Check, 673 | F₂((t)),q2,d1,C givesGL2 anddual[0,1] | q=1 excluded by local field |
| Geometric-dual recurrence, 649–655 | A:k0,p1,m′=[1,2],dualA=dual[1,2]+[0,0]; C:k0,p2,m′=∅,dualC=[0,1] | Z98 left-endpoint rule |
| Recurrence decrement, 652 | A:2=3−1;C:0=2−2;D afterone shortening:length3=4−1 | p positive, not natural underflow |
| MW order, 657 | [1,1]>[0,2]>[0,1]>absence | Decreasing left then right |
| Singleton extraction, 659 | C:k1,m′=[0,0],rank2d→d; D:k0,shorten one copy,not both | Last tied interval convention |
| Involution on embeddings, 660 | singletonα with rank-zero second factor:τ fixesα; reversed product stillα | Scoped to trivial GL₁ line |
| Right-singleton candidates, 661 | q=[0,0],k1: candidatesC and[0,1],each length2 | Coarse candidate set |
| Quantified exclusion, 661 | q=[0,2]+[1,3]+[2,2],k3: B=[0,2],C=[1,3],0<1≤3≤3;C<[2,3] | Source requires A∈q; retained |
| Dual reinsertion, 662 | C removes singleton1 then extends[0,0];2[0,0] removesone then addsone | Absence branch correct |
| Weak reinsertion threshold, 677 | q=dual m′=[0,0]+[0,1]+[1,1]+[1,2]; A=[1,1],B=[0,1],C=[1,2]=A⁺ | Equality required; strict version fails |
| Cuspidal-label independence, 663 | m=[0,1] has transformed labelC onGL2 ford1 andGL4 ford2 | No isomorphism across groups claimed |
| Fixed-support order induction, 665 | support{0,1} has labelsC and[0,1],involution exchanges them | Finite support, square identity |
| newformExample, 683–700 | card7,length2+5+2+4+1+2+1=17,grade3 count4 | Definition Check values correct |
| Newform maximal split, 692 | maximum lengths5+4+2+1=12;remainder lengths2+2+1=5;12+5=17 | One-copy split |
| Intermediate dual/truncation, 692 | dualmax lengths1+2+2+3+4=12;truncate lengths1+1+2+3=7 | Exactly one shortening |
| Newform ramification, 687–692 | output[4,4]+[2,5]+[1,2]+[0,0]:card4,length8,grade3 count1 | Independent recurrence agrees |
| Consumer interfaces, 690,714–716 | output lengths1,4,2,1 sum8; empty contributes no lengths; arbitrary splitC fails | No conductor theorem re-owned |

The finite audit independently enumerated all 1,001 multisets of cardinality at most four on the ten intervals with endpoints in [−1,2]. It checked 1,001 instances each of one-copy splitting, both truncation identities, length decrement, matching-plus-width, dual involutivity, dimension preservation, ram/truncation commutation and ramified maximal splitting. It checked all 7,007 cuts in [−3,3], including 4,500 nonempty and 2,507 empty peeling cases. Path bounds passed 15,015 parameter cases with r≤4 and all their paths; 210 supported interior cases attained the bound. All 100 ordered interval-block commutator systems had dimension exactly the claimed zero or one. There were zero failures. Dual values in this finite audit use the sourced recurrence; this does not independently prove its universal geometric identification.

The remaining boundary controls include r=1, where 1≤a<1 has no solution; the wrong start (1,1) differs from the required (2,1); a proposed (0,2) step differs from both allowed unit steps. All 80 bullets under README Checks were evaluated together with the worked examples and convention witnesses above. They have the stated numerical values. S04 concerns absent discriminating tests for particular definitions. Positive-characteristic and zero-ring counterexamples are outside the explicitly complex operator geometry; no finite-field variant is promised. Equal-characteristic local fields and residue cardinalities 2 and 3 remain allowed in the representation layer, whose coefficients are still ℂ. Infinite-dimensional gradings, non-finite-type actions and q=1 fail standing hypotheses. Empty paths/multisets, zero operators, one-point spaces, missing grades, natural subtraction and invalid standard-vector degrees were tested explicitly. General sheaves/nonreduced bases belong to the bundle supplier, not to a claimed extension of this complex orbit theorem.

### Headline coverage

The README's deep milestones are finite-window interval classification and reconstruction; uniform nilpotence/internal grading; centralizer coordinates and restriction surjectivity; polynomial irreducibility and generic type; conormal symmetry and involutive duality; generic admissibility on actual images and simultaneous restrictions; ram/truncation commutation; finite Dilworth and the matching/weighted-chain comparisons; adjacent generic rank and the adjacent Knight–Zelevinsky identity; path attainment; truncation/peeling and ramified maximal additivity; the geometric-dual recurrence and general representation comparison.

The acceptance file states the ten milestones enumerated in the declaration table. Its docstring names the geometric generic-type, conormal, ramification and representation headlines whose constructions are unavailable. These omissions do not require free predicates or sorry-valued data. Reconstruction is expressly but incorrectly put in that unavailable list (S01). The general finite-poset theorem needs no new carrier and is absent (S02). The centralizer restriction surjections also admit direct native-range signatures (S05). The full block-coordinate classification and generic interval-type constructions require further carriers; they were not replaced by rank-only surrogates. The numerical newform calculation and empty branches are Checks, not missing acceptance targets.

### Supplier and ownership audit

The inspected content checkout is main at a4a8652; both installed library revisions equal lake-manifest.json: Mathlib 6b7abb3 and Tau Ceti a91d3aa. The supplier audit checked **three supplying roadmaps, eight cited section groups**, and their named declarations. There are **zero direct supplier citations to the 26 explicitly supplied sibling heads**; all 26 were searched for object ownership in both README.md and Suggested.lean. No files were missing. The lone broad-regex hit in ArithmeticDynamics concerned automorphisms of graded trees and has no overlap with commuting degree±1 linear operators.

Used `roadmaps grep` for object searches across the indexed main/open heads and `roadmaps show` for the smooth supplier. Also searched the local main and Completed trees, board packages and the supplied sibling checkouts. Exact namespace searches found this package's fully qualified names only here. No other owner was found for integral multisegment duality, the integer-window adapter, its scoped finite-orbit conormal comparison or weighted interval peeling. Finite Dilworth is explicitly excluded by `TauCetiRoadmap/GraphConnectivityAndFlows/README.md:1117`; developing it here does not duplicate that roadmap. Generic bundle and smooth-representation constructions remain with their cited suppliers. No target was moved or new supplier gap invented in this read-only pass.

| Supplier citation | Resolved location and hypotheses | Check |
|---|---|---|
| QuiverRepresentations Layer 1 | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:229`; `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:93` | Finite vertices, field; left path-algebra modules. On0→1 the later arrow multiplies on the left, agreeing with E₂₁. |
| QuiverRepresentations Layer 2 | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:128` and :135 | Finite-length modules and internal decompositions; two distinct isomorphic submodules remain two indexed summands, as for2[0,1]. |
| QuiverRepresentations Layer 5 | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:348` and :375 | Algebraically closed field, finite ADE quiver. Finite oriented windows overℂ satisfy the hypotheses; positive-root vector(1,1,1) is interval[0,2]. |
| AlgebraicVectorBundles L0B | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:228`; `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean:40`, :167, :191 | Actual finite locally free sheaves, locally constant rank and arbitrary pullback. Rank2 remains2 after pullback. |
| AlgebraicVectorBundles L2B | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:340`; `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean:732`, :750, :795 | totalSpaceScheme, totalSpaceEquiv and totalSpaceHomEquiv have the cited sheaf/geometric and section-valued meanings; zero bundle has one zero vector in each fibre. No orbit dimension theorem is supplied there. |
| SmoothRepresentationsOfLocalGroups SR.0–SR.3 | indexed open head, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` | Smooth modules, actual equivariant maps, GL groups, normalized parabolic induction; q=2 normalization uses the positive real square root insideℂ. |
| SmoothRepresentationsOfLocalGroups SR.5.2, segment-representations | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4325` | Unitary cuspidal label of rankd≥1, real endpoints congruent modℤ, full occurrence multisegment, Z/L conventions. Two-term rank2 label givesGL4. |
| SmoothRepresentationsOfLocalGroups SR.5.3, highest-derivative-adapter | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4717` and :4730 | Involution Z(m)↦L(m), empty rank-zero line and fixed cuspidals; the supplier explicitly tests involutivity. Longer segments distinguish Z and L. |

All named pinned library contracts were resolved in their stated files:

| Pinned declaration | File and line, relative to the library | Scope verified |
|---|---|---|
| DirectSum.IsInternal | `Mathlib/Algebra/DirectSum/Basic.lean:440` | Bijective canonical direct-sum map; not merely independent subspaces |
| LinearMap.range | `Mathlib/Algebra/Module/Submodule/Range.lean:57` | Actual set range; contains exactly images |
| Submodule.map | `Mathlib/Algebra/Module/Submodule/Map.lean:52` | Actual image of submodule under linear map |
| Module.finBasis | `Mathlib/LinearAlgebra/Dimension/Free.lean:334` | Finite and free; indexed by Fin finrank |
| Module.Basis.ofVectorSpace | `Mathlib/LinearAlgebra/Basis/VectorSpace.lean:152` | Basis over division ring; finite-dimensionality is a separate input |
| Matrix.rank | `Mathlib/LinearAlgebra/Matrix/Rank.lean:132` | finrank of range of mulVecLin; complex matrices avoid zero-ring rank conventions |
| MvPolynomial.eval | `Mathlib/Algebra/MvPolynomial/Eval.lean:256` | Ring-hom evaluation; no nonvanishing built into definition |
| TopologicalSpace.generateFrom | `Mathlib/Topology/Order.lean:70` | Generated topology; arbitrary Euclidean topology not assumed |
| IsChain / IsAntichain | `Mathlib/Order/Preorder/Chain.lean:51`; `Mathlib/Order/Antichain.lean:42` | Set.Pairwise, distinct elements only; no finite partition assertion |
| IsIrreducible | `Mathlib/Topology/Irreducible.lean:48` | Nonempty plus preirreducible; no algebraic dimension |
| TauCeti.QuiverRep | `TauCeti/RepresentationTheory/Quiver/Representation/Basic.lean:53` | Paths Q functor into ModuleCat; does not itself require finite-dimensional objects |
| TauCeti.quiverRepEquivalence | `TauCeti/RepresentationTheory/Quiver/Representation/AsModule.lean:574` | Finite vertex quiver over field; appropriate object universes retained |
| TauCeti.QuiverRep.exists_indecomposable_iso_biproduct | `TauCeti/RepresentationTheory/Quiver/Representation/KrullSchmidt.lean:85` | Pointwise finite-dimensional representation and finite quiver; Fin n summands |
| exists_equiv_iso_of_iso_biproduct / card_iso_eq_card_iso_of_iso_biproduct | same file:110 and :148 | Isomorphisms of indecomposable decompositions, preserving every isomorphism-class count |
| TauCeti.LinearMap.IsHomogeneous / isHomogeneous_def | `TauCeti/LinearAlgebra/Graded/LinearMap.lean:56` and :61 | Maps gradep into gradep+q; no internality assumption hidden in predicate |
| homogeneousSubmodule and zero/add/smul/comp API | same file:73–158 | Fixed degree is a linear submodule; commutation must be separately imposed |
| Module.End.exists_pow_apply_eq_zero_of_forall_mem_support_lt | `TauCeti/LinearAlgebra/End/LocallyNilpotent.lean:104` | Well-founded basis weight, vector-dependent exponent; not the uniform Pair.nilpotent target |
| TauCeti.isLocallyClosed_orbit_of_isConstructible | `TauCeti/Topology/Algebra/MulAction/Orbit.lean:87` | Group action, ContinuousConstSMul, NoetherianSpace and constructible orbit; no conormal dimension conclusion |

The dependency checker completed with exit0 and exactly:

```text
depcheck: 27 roadmaps, 233 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The internal sequence is now pairs → finite-window equivalence → standard pairs/types → classification; the earlier cycle is gone. The independent adjacent-rank route uses §§2.2 and2.6, not conormal involutivity. The split uses earlier Layers1–4. The representation inputs of §5.4 do not feed back into geometry. EndoscopicTransferAndUnitaryTraceComparison is a possible consumer, not a supplier. No declared gaps exist.

### Source locator audit

**39 locator groups** were verified in the four legally readable sources listed below; Z81's settled uncertified locators were not counted. AKY is the cited arXiv v4. Z98 and DIL printed labels agree with the manifest. The MW extraction still contains page markers only after a sources-service fetch; its cached official GDZ PDF was rendered locally and read directly. For MW, the cited line anchors below identify the extraction's page marker, and the accompanying printed page identifies the mathematical text viewed. No mathematical source passage was copied into this report or the repository.

| Source / locator group | Source anchor | Verification |
|---|---|---|
| AKY §2.1,p7 | AKY line 264 | Segment conventions; rank-positive statement and two-term determinant character at AKY line 278 |
| AKY §2.3,p8 | AKY line 319 | Right shortening and ramification, retaining multiplicity; source rank-zero slip not copied |
| AKY Proposition 2.4,p9 | AKY line 362 | λπ=λm belongs to the consumer |
| AKY §2.4 maximal split,p10 | AKY line 422 | Distinct maxima, multiplicity at most1 |
| AKY Proposition 2.7,p10 | AKY line 430 | Canonical ramified additivity |
| AKY Corollary 2.8,pp10–11 | AKY line 432 | Tuple additivity consumer |
| AKY §2.5,pp11–13 | AKY line 461 | Seven input intervals and four output intervals; faulty intermediate labels corrected by endpoints |
| AKY §3.1 graded pairs,p14 | AKY line 548 | Finite-dimensional complex ℤ-graded objects and steps±1 |
| AKY Lemma 3.1,pp14–15 | AKY line 554 | Reconstruction from grading and actual unshifted image |
| AKY shifts/standard blocks,p15 | AKY line 588 | V(c)ₐ=Vₐ₋c and arrows on interval basis |
| AKY Lemma 3.2,p16 | AKY line 631 | Both centralizer restriction surjections |
| AKY admissibility paragraph,p16 | AKY line 647 | Commuting triple and dual WL type |
| AKY Lemma 3.3,p16 | AKY line 651 | VN image shifted−1; WL image unshifted |
| AKY Lemma 3.4,p17 | AKY line 676 | Entire image-admissible locus open dense |
| AKY simultaneous choice,p18 | AKY line 734 | Common L on every iterated image; package proves the stronger image-admissible version using earlier surjections |
| AKY Proposition 3.5,pp18–19 | AKY line 757 | ram/right-truncation commutation and shared image ofNL=LN |
| AKY Lemma 3.6,p19 | AKY line 766 | Maximal-part and remainder truncation identities; source omits proof, package supplies route |
| AKY Proposition 3.7,pp19–21 | AKY line 771 | Adjacent dual count as full cut count minus chain maximum |
| AKY path/chain comparison,pp20–21 | AKY line 819 | Correct endpoint(1,r); AKY line 838 typo not copied; maximum argument at AKY line 856 |
| AKY proof of Proposition 2.7,pp21–22 | AKY line 878 | Image reconstruction, graded rank counts and maximal-chain decrement |
| MW Corollary I.7.2/Proposition I.7.3,p147 | MW line 184 | Induction-factor reversal under the rank-one involution; correct scope retained |
| MW II.1,pp147–148 | MW line 184; MW line 185 | Local field, arbitrary positive cuspidal rank, interval precedence and decreasing lexicographic order |
| MW II.2,pp149–150 | MW line 186 | Endpoint recurrence; not a new separately computed package label |
| MW Lemma II.3,pp150–151 | MW line 187; MW line 188 | Singleton reinsertion and matched smaller occurrences; weak target comparison agrees with later proof |
| MW Lemma II.4,pp160–161 | MW line 197; MW line 198 | Independent commuting-block coefficients, ordered occurrence pairs |
| MW Proposition II.6,pp162–169 | MW line 199; MW line 206 | Generic conormal label equals recurrence label; affine slices are actual subsets |
| MW Remark II.6.1,p163 | MW line 200 | Dense-open affine intersection requires nonempty intersection |
| MW Corollary II.7,p169 | MW line 206 | Recurrence involutivity from geometric duality |
| MW Lemma II.10.2,pp172–173 | MW line 209; MW line 210 | Right-singleton candidates and exclusion through ordered matching |
| MW Remark II.10.3,p174 | MW line 211 | Threshold A is an occurrence; target≤A⁺ is used explicitly in proof; product-order slip recorded below |
| MW Lemma II.11,pp174–175 | MW line 211; MW line 212 | Greatest-left-endpoint singleton extraction, last interval at that endpoint, unique smaller irreducible |
| MW Proposition II.12,pp175–176 | MW line 212; MW line 213 | Cuspidal-label independence, as label maps across different group ranks |
| MW Theorem II.13,pp176–177 | MW line 213; MW line 214 | Comparison reduced to trivial rank-one line, then total-length and fixed-support-order inductions |
| Z98 §2,p410 | Z98 line 41; Z98 line 67 | Finite-window quivers, generic opposite path ranks and interval labels |
| Z98 §3,formula(1)/Theorem 1,pp410–411 | Z98 line 77; Z98 line 90 | Monotone minimum and finite-difference multiplicities; package uses adjacent specialization only |
| Z98 §5,equations(3)–(4),p412 | Z98 line 140; Z98 line 152 | Least-left-endpoint recurrence and positive length decrement |
| DIL Theorem 3/inductive proof,pp6-1–6-2 | DIL line 40; DIL line 59 | Finite Dilworth, maximum-antichain split and removal branch |
| DIL split-poset construction,p6-3 | DIL line 104 | Matching edges form disjoint chains, number n−matching size |
| DIL weighted copies,p6-4 | DIL line 145 | Antichain copies retain vertex multiplicity |

Package policy checks found one Mathlib import and one used pinned Tau Ceti import, no `lemma`, `set_option`, sorry-valued data, admitted examples, placeholder predicates, imports of another roadmap, process narrative or pull-request number in README/docstrings. The head diff contains only this package folder. `git status` after review shows only this report as new; README.md, Suggested.lean, metadata.toml, review.json and sources.toml remain unchanged. S06 records the remaining README/Lean naming-policy mismatch. The resolver's `GridPath.weight_bound` lead is a false positive: it is declared at packages/QuiverRepresentationsPartII/Suggested.lean:195 and named at packages/QuiverRepresentationsPartII/README.md:536.

## Not verifiable

- Z81 §4.3, Proposition 4.4 and §4.5, original pp20–21: settled `uncertified` in sources.toml. Its own statement text and numbering were not certified indirectly from MW, and it was not requested again.
- Lean execution: no build or elaboration was run, as required by the read-only brief. The worker's supplied 39 elaborated types were audited, and the three proposed signatures in S01, S02 and S05 were checked by reading native definitions, not by executing Lean.
- The long proofs of MW Lemma II.3 and Proposition II.6 were not re-proved line by line. Their statements, setup, needed affine-slice qualification, weak matching threshold and application in Theorem II.13 were read at the legal scan. The cached text is not usable OCR; MW line references above anchor PDF pages only.
- Future geometric/representation implementations have not been checked. In particular the scoped algebraic conormal construction and point/scheme compatibility are mathematical targets, not available implementations that this pass can certify.

## Source issues

- **Misprint** in AKY at §2.3, printed page 8: the source says a segment may have cuspidal rank zero; it should be positive cuspidal rank, as in §2.1; affects a stated result.
- **Misprint** in AKY at §2.5, printed page 12: the source says to shorten four newly relabelled intervals that already have shortened endpoints; it should be the four surviving original intervals shortened once, or new labels without further shortening; affects a stated result.
- **Misprint** in AKY at proof of Proposition 3.7, printed page 20: the source says the converse path ends at (a,1); it should be (1,r), matching the path definition; affects the proof.
- **Error** in DIL at definition following Definition 2, printed page 6-1: the source says every chain has a unique maximum; it should be every nonempty finite chain has a unique maximum; affects nothing.
- **Misprint** in DIL at proof of Theorem 5, printed page 6-4: the source says apply Dilworth to the chain-copy construction; it should be the chain-height/antichain-partition theorem, Theorem 2; affects the proof.
- **Misprint** in MW at Remark II.10.3, printed page 174: the source says the excluded constituents belong to the singleton-first product; it should be the singleton-last product of Lemma II.10.2 used by its proof; affects a stated result.
- **Error** in DIL at proof of Theorem 4, printed page 6-3: the source says every deficient component has a vertex adjacent to A(G); it should handle unmatched singleton components separately, since an isolated vertex has no such neighbor; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "398e133b108f3c7e9d8ae57f38f063ed9ec8defa", "job": "RT-QuiverRepresentationsPartII~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
