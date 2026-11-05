# Review of GroupActionsOnRiemannSurfaces (pull request #1728 at 6a36121)
**Verdict:** needs changes

Locations abbreviated **README** and **Lean** below mean `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md` and `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/Suggested.lean`. There are five findings: one P1, one P2 and three P3. No change was made to the pull request.

## R01 (P1) — The fixed-order minimization in the Wiman proof is false

**Location:** README:1046–1048: “the minimum of `μ` over signatures satisfying Harvey's conditions with `lcm = n` is attained at `(2, 2g + 1, 4g + 2)`”.

**Claim:** For each fixed cyclic order n, this triangle is the minimizing admissible signature.

**Witness:** For n=2, `(0;2⁶)` satisfies Harvey, has μ=1 and genus 2. The proposed triangle is `(2,5,10)`, with lcm 10, not 2. It is outside the set being minimized.

**Repair:** Replace this step with the actual universal inequality `μ ≥ 1/2 − 3/n` on realized hyperbolic cyclic data, and analyze its equality case separately; do not assert that every fixed n admits an equality signature. Prove it from Harvey's conditions, splitting the branch-number cases, and retain the explicit sharpness construction for n=4g+2. On the refuting C₂ example this gives `1 ≥ −1`, hence `2 ≤ 10`; on `(n,σ)=(10,(0;2,5,10))` it gives `1/5 = 1/2−3/10`, hence `10=10`. The Wiman theorem and the two Lean Wiman signatures survive these tests; the false claim is in the stated proof route. Add the C₂ example as a negative control for the minimization assertion.

## R02 (P2) — Connected permutation triples need not have three admissible cone orders

**Location:** README:517–518: “conversely a connected triple gives a generating vector in its monodromy group with that transitive action”.

**Claim:** Connectedness alone supplies the converse triangle dictionary on the roadmap's `Signature` carrier.

**Witness:** On two letters take `(σ0,σ1,σinf)=(1,(12),(12))`. Its product is 1 and its monodromy is transitive C₂. The proposed reversed orders are `(2,2,1)`, contradicting `Signature.two_le`. Regular C₁₀ components `(5,2,3)` give unsorted reversed orders `(10,5,2)`, despite hyperbolicity.

**Repair:** State the converse for a fixed three-period signature σ and a connected triple with `orderTriple=(m₃,m₂,m₁)`; these exact-order hypotheses also fix the ordering. If a dictionary for arbitrary connected triples is intended, instead delete order-one peripherals and Hurwitz-sort the remaining entries, allowing fewer than three periods. Under the first repair the two-letter counterexample is excluded and the regular C₁₀ triple of orders `(10,5,2)` still produces `(0;2,5,10)`. Under the second it produces `(0;2,2)`, not a triangle signature. This is separate from the forward transitivity problem in previous R15, which is repaired. At the pin, `TauCeti/Combinatorics/PermutationTriple/Basic.lean:75` imposes only the product relation, and `IsConnected` at line 427 imposes nonempty degree and pretransitivity, not nonidentity components.

## R03 (P3) — Replace obsolete inverse-Galois API names with the supplied section contracts

**Location:** README:322–327: “`NielsenClass.inner`, `HurwitzMove.apply` … `HurwitzAction.action` … `product_action`, `generated_action`, `classes_action` … `HurwitzMarking.forget`”.

**Claim:** These are the named APIs provided by InverseGaloisAndArithmeticFundamentalGroups IG.3.2 and IG.5.2.

**Witness:** At supplier head a5186ac, neither its README nor Suggested.lean contains those seven names. IG.3.2 nevertheless states the Hurwitz action and its three preservation laws; IG.5.2 states forgetting the boundary marking.

**Repair:** Cite IG.3.2 **The Hurwitz braid action** and **Branch tuples and Nielsen classes**, and IG.5.2 **Forgetting the boundary marking**, in prose. Keep `BranchTuple`, `BranchTuple.product` and `BranchTuple.generated`, which actually occur in the supplier's Lean file at lines 133, 140 and 143 (excluding the tool's source banner). This is a locator repair, not an unowned prerequisite or a request for another supplier development: the mathematical contracts exist. The supplied action sends `((12),(23))` to `((13),(12))`, with product `(123)` on both sides; the repaired citation retains exactly that contract.

## R04 (P3) — Correct the extension-table page and the homology citation

**Location:** README:1142, 1173, 1427: “Table 1, p.1539”; “Proposition 1.1 and diagram (1.3)”.

**Claim:** These locators respectively identify the nineteen inclusion rows and the composite into rational homology endomorphisms.

**Witness:** `bujalance` lines 75–95 place Table 1 on printed p.1538. `lange_recillas` lines 138–148 make diagram (1.3) a tangent-space diagram, not an H₁ diagram; Proposition 1.1 is the isotypical decomposition.

**Repair:** Cite Table 1 on p.1538, retaining §2 on pp.1539–1540 for the presentation and Teichmüller discussion, and start the normal-case range at p.1540. In §7.3 identify the homology square as the consequence of the period-lattice naturality supplied by MordellLawrenceVenkatesh §8.11, and cite Lange–Recillas §1, pp.3–4 for the group-algebra action, tangent-space square and lattice description. Keep Proposition 1.1 for §7.5. N1 then still reads `2=2·1`, and the genus-two involution still has tangent trace −2 and rational-homology trace −4; the distinction is precisely why the two squares should not share an unexplained locator. Finish the exact local locators at the remaining claims and record the cited works in the required source manifest through the author's normal workflow; none exists in the reviewed folder. This review edits no manifest.

## R05 (P3) — Respect BelyiMaps' explicit analytic ownership boundary

**Location:** README:309–314: “Layer 7 (filling punctures …); Layer 8 … analytic Riemann existence 8.6”.

**Claim:** BelyiMaps supplies these analytic constructions as its own roadmap outputs.

**Witness:** On main, `TauCetiRoadmap/BelyiMaps/README.md:2355` and line 2568 assign Layers 7–8 to successor BelyiAnalyticCovers and retain their text only as a dependency specification. Its ownership table at line 74 makes the same distinction.

**Repair:** Remove these unused broad supplier claims: the local quotient construction is already a target in §1.2, and §§2.1–2.3 explicitly use FuchsianOrbifolds Layers 2, 4–5. Cite those actual routes and the pinned local-multiplicity/degree APIs. If an additional analytic-cover result really is consumed, name its existing owner and exact target or declare its precise contract; do not silently treat an excluded successor target as delivered by BelyiMaps. Keep BelyiMaps' actual Layers 0–6 contracts. The test `z↦z²` still has local degree 2 and the C₂ quotient still has degree 2 through §1.2; neither calculation needs the claimed three-point analytic-existence supplier. This is an ownership-locator correction, not a claim that the quotient theory has no proof route.

## Verified sound

This was a full reread of the 48 numbered targets, their APIs and Checks, the conventions, worked examples, supplier contracts and all 21 explicit Lean declarations. Numerical checks are evidence on the stated instances, not proofs of the general theorems. Unread primary sources are identified separately below. The scope is repairable and develops a general finite-action library; it does not re-plan an existing roadmap.

**Previous review, checked before the full pass.** Each quotation below is from the repaired head. “Repaired” refers to the earlier defect, not certification of every assertion in that section. No repair report marking a finding “not actionable in this package” was supplied or found with the reports.

| Previous finding | Current passage and location | Result |
| --- | --- | --- |
| R01 endpoint antihomomorphism | README:212–222, “opposite of Mathlib's fundamental group”; Lean:29–31 makes the same choice. | Repaired. Endpoint labels now multiply as `(12)(23)=(123)`; the native fundamental-group product gives the opposite label `(132)`. |
| R02 lost complex structure | README:709–724 and 778–797 retain the “marked complex quotient” and the chosen fibre point. | Repaired. One C₂ vector can have a three-dimensional realization family; restriction uses double-coset stabilizers. |
| R03 handles and inner quotient | README:843–858, “simultaneous conjugation of all handle entries”. | Repaired. Unramified S₃ gives 360 vectors and 60 inner/braid classes. |
| R04 special versus generic extension | README:1111–1133 requires the pullback to be onto the smaller-group Teichmüller space. | Repaired. Dimensions 3 and 0 exclude the special C₂⊂C₁₀ extension from the generic test. |
| R05 plain sorting | README:490–507, “Hurwitz moves”. | Repaired. The nonabelian product remains 1 instead of becoming `(123)`. |
| R06 trivial action | README:616–630, “`h = g` iff `G` is trivial”; the stronger branch bound requires order at least two. | Repaired. At g=h=2, n=1 the general bound is `0≤0`. |
| R07 unrealized numerical data | README:1060, “realized data `(G,σ,v)`”. | Repaired. n=15 and periods `(2,3,30)` are excluded by absence of an order-30 element. |
| R08 hyperelliptic converse | README:1331–1333, “Neither converse holds.” | Repaired. C₄ already contains the six-fixed-point involution despite a generic extension; witnesses are conditional subtypes/options. |
| R09 passport versus topology | README:1538, “No assertion makes the topological class or generic full group a function of a passport alone”. | Repaired. The two C₂² unramified vectors have fundamental-class values 1 and 0. |
| R10 labelled equivariance | README:1298, “`FixCount(α·v,α(γ))=FixCount(v,γ)`”; README:1403–1405 gives the character law. | Repaired. The new C₅ multiplicities are also correct; the previous review's scaled C₅ witness was erroneous: the correct scaled tuple has multiplicities `(0,1,0,1)`. |
| R11 marked mapping classes | README:334–336 names MordellLawrenceVenkatesh §§5.9, 5.21 and owns the cone-order restriction and half-twist comparison. | Repaired. These supplier sections exist and state the needed marked/outer-action inputs. |
| R12 analytic Jacobian | README:352–354, “MordellLawrenceVenkatesh §8.11 supplies the period-lattice identification”. | Repaired. That section supplies naturality and the integral homology comparison. |
| R13 supplier drift | README:330–332 names TeichmullerGeometry §§5.6, 8.4, 10.1 and owns the cone-orbifold and generic-extension additions. | Original unavailable section/module claims repaired. Exact-name drift remains in a different supplier contract: R03 above. |
| R14 failing gate | Lean:1, “module”; recorded gate says “build=0 OK”. | Repaired. Independent elaboration also passes. |
| R15 arbitrary permutation action | README:516–517, “`n ≠ 0` and the given `G`-action is pretransitive”. | The earlier forward-direction defect is repaired. R02 above concerns a separate omission in the converse. |
| R16 incomplete extension conditions | README:1194–1244, “Prove necessity and sufficiency row by row.” | Repaired. All N1–N8/T1–T11 conditions are supplied, including exact target orders, injection and index. |
| R17 headline stand-ins | Lean:8–27 lists the algebraic headlines and missing geometric carriers. | Repaired. Nine genuine theorem signatures remain; no assumed conclusion, finite lookup-list substitute or dummy character sum. |
| R18 computational scope | README:1064–1068, “finitely many such data up to group isomorphism”; README:1221, “not a search specification”. | Repaired. The goals are mathematical finiteness/classification and extension existence. |
| R19 aggregates | README:939–946, “These are intrinsic fixed-signature counts” and separate sums by quotient-genus regime. | Repaired. The table-reading code supports that distinction. |
| R20 padding | Lean:117–182 contains only the correspondence, torsion, integrality and bound/criterion theorems. | Repaired. All nine fail the tested one-tactic probes. |
| R21 shape and local Checks | README has “Exact supplier contracts”, nine layer-end “Examples”/“Dependencies” pairs and 48 Checks blocks. | Substantially repaired; the definition APIs and three local discriminating examples are present. |
| R22 source locators | README:1661–1664 now says “§3, p.7” and “§20, p.84”; the Lange–Recillas and Swinarski versions are explicit. | Partly repaired. R04 records remaining incorrect locators; broad section references and the absent source manifest still limit traceability. |

**Gate, build and direction of supply.** The requested head was checked, the worktree is unchanged, and the diff outside the reviewed folder is empty. The recorded push gate passes every scanner, metadata, stray-file, dependency and targeted-build rule. Independent `lake env lean` elaboration of the unchanged Suggested module exits successfully with exactly nine `sorry` warnings and no other warning or error. No Tau Ceti import needs a prerequisite build because the only import is `Mathlib`.

The requested dependency command, using the supplied candidate order, `--movable` and main content, returned:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. All `*Needs:*` clauses and supplier citations were read. References to SatoTateGroups and other excluded directions describe ownership boundaries, not consumed prerequisites. No declared gap was found. The forward references from §3.7 to §4.6 concern finite aggregate sums; the signature/vector quotients used earlier are finite independently. Similarly, §5.2 announces the classification consequence subsequently supplied by §§5.3–5.4; the underlying definitions and dimension inputs do not depend on that consequence.

**Adversarial table.** Products of permutations act right to left. Write `μ=2h−2+Σ(1−1/m)` and `g=1+nμ/2`. Empty sums/products/lcms are 0/1/1. Every period is at least two, and a finite group's order is positive, so the used denominators are nonzero. The n=0 value of the total genus function is tested without treating it as a realized finite-group order. Geometric claims have the standing compact, connected, nonempty, complex, faithful holomorphic, genus-at-least-two hypotheses; characteristic-p, inseparable and noncompact cases are outside this scope. Pure presentation and correspondence statements do not unnecessarily require a finite codomain.

The independent cyclic test compared direct additive tuples (reachable sum and generated gcd) with Harvey's predicates for **48,144** hyperbolic cases, n=1,…,24, h=0,…,3, r=0,…,8 and periods dividing n. There were **0** discrepancies. Every realizable case had integral genus at least two and satisfied the two stated Wiman signatures, also with **0** discrepancies. This does not validate the false minimization step R01.

| Statement | Instances tried; computed values on both sides | Result / change |
| --- | --- | --- |
| 0.1 Signature, μ, genus, sorting | `(0;∅)` gives −2; `(2,3,5)`, `(2,3,6)`, `(2,3,7)` give −1/30, 0, 1/42. At n=168 the last gives g=3; n=0 gives g=1. `(2;∅),n=1` gives g=2. Sorting `(7,2,3)` leaves μ=1/42; period 1 fails `two_le`. | Pass on these positive, zero and negative controls. |
| 0.2 Generating vectors | C₂ with six nonzero entries: sum 0, image order 2, one vector; three entries: sum 1, zero vectors. C₄ tuple `(2,2,2,2)`: sum 0 but image order 2≠4. Empty vector generates order 1. | Relation, exact-order and generation conditions discriminate independently. |
| 0.3 Transport/inner action | C₅ `(1,1,3)` scales to `(2,2,1)` and back by 3. C₁₀ has four vectors, four inner classes and one automorphism orbit. S₃ `(2,2,3,3)` gives 12 vectors/6=2 inner classes. | Pass; labelled data are transported. |
| 0.4 Signature presentation | C₄ `(2,2,2,2)` kills every square and the product but has image order 2; C₂ `(1,1,1)` kills squares but product is 1 additively, so fails. The trivial tuple kills all relators. | Universal property does not assume generation or exact order. |
| 0.5 Vector/epimorphism correspondence | C₁₀ assignments `(5,2,3),(5,4,1),(5,6,9),(5,8,7)` give four vectors and four surjective exact-order maps. PSL₂(7) gives 336 triples and 336 maps, 2 inner classes. Nongenerating C₄ assignment has image 2≠4. | Counts and distinguished-generator equations agree. |
| 0.6 Quotient and sorting | The S₃×C₃ example projects to `(b,z,a,b,b)` with product 1; plain order-sorting gives `(b,a,b,b,z)` with product `(123)`. Hurwitz sorting keeps product 1 and target periods `(2,2,2,2,3)`, μ=2/3, g=3. | Repaired rule passes; trivial quotient deletes all periods. |
| 0.7 Triangle dictionary | `C₁C₂C₃↦zyx=1`; `(2,3,7)↦(7,3,2)`. Regular C₁₀ has one orbit of size 10; adding a fixed letter gives 10+1. Connected two-letter `(1,t,t)` has reversed orders `(2,2,1)`; regular C₁₀ `(5,2,3)` has reversed orders `(10,5,2)`, μ=1/5 and g=2, but is unsorted. | Forward direction passes; converse needs R02. |
| 1.1 Action carrier/Aut | Faithful C₁₀: image 10, kernel 1. Trivial C₂ action: image 1, kernel 2, rejected. Genus-one translations form an infinite subgroup, unlike the asserted finite Aut at g≥2. | Faithfulness and genus restriction distinguish wrong models. |
| 1.2 Stabilizers/quotient | `z↦z²` has inertia/local degree 2/2; identity has 1/1. Hyperelliptic C₂ has six exceptional fibres of size 1 and ordinary fibres of size 2, degree 2. | Pass. |
| 1.3 Branch signature | C₂ total ramification is 6·1=6. C₁₀ contributes 5+8+9=22; the identity quotient contributes 0. | Agrees with degrees and branch deletion. |
| 1.4 Riemann–Hurwitz and bounds | Hyperelliptic C₂: `2=2·1`; C₁₀: `2=10·(1/5)`; S₃ `(2,2,3,3)`: `2=6·(1/3)`. Trivial g=h=2: `2=1·2`, branch bound `0≤0`, h=g. | Earlier trivial-group failures repaired. |
| 1.5 Differential representation | Genus-two hyperelliptic involution: eigenvalues −1,−1, trace −2, invariants 0=h. Bielliptic: 1,−1, trace 0, invariants 1=h. C₅ inverse pullback has eigenvalues ζ⁴,ζ³. | Covariant representation/inverse-pullback convention passes. |
| 2.1 Fuchsian realization/torsion | `(2,3,7)`: μ=1/42, area π/21, elliptic orders 2,3,7. `(2;∅)`: μ=2, area 4π, no nonidentity torsion. `(3,3,3)`: μ=0, excluded. | Agrees with hyperbolicity and torsion source. |
| 2.2 Exact orders/torsion-free kernel | C₂ `(2⁶)` maps exact orders 2→2 and has index 2, genus 2. The trivial map changes 2→1 and kills torsion. Identity map of the infinite signature group has kernel 1 and preserves every order. | Both implications and infinite codomain tested. |
| 2.3 Marked realization | C₂ `(2⁶)` gives degree 2, quotient genus 0, genus 2. S₃ `(1;3)` gives degree 6 and `g=1+6(2/3)/2=3`. The C₂ realization space has dimension 3. | Marked complex structure is retained, not chosen from the vector alone. |
| 2.4 Monodromy inverse | Left-deck labels `(12),(23)` multiply to `(123)` in the opposite fundamental group; the native product label is `(132)`. Positive local loop for `z↦z^m` ends at `exp(2πi/m)z`. | Direction and rotation convention agree. |
| 2.5 Existence/integrality | C₂ `(2⁶)`: one vector, g=2. A₅ `(2,3,7)`: no order-7 element, zero vectors, numerical genus 12/7. Trivial `(2;∅)`: one vector, g=2. | Nonintegral numerical datum does not produce an action. |
| 2.6 Analytic inverse/restriction | C₂ vector has a dimension-3 family, with distinct realizations of full Aut orders 10 and 48. Restrict C₁₀ to C₅: inertia 2 disappears, inertia 5 splits into two, inertia 10 gives one; periods `(5,5,5)`, g=2. | Retained marking and double-coset rule pass. |
| 3.1 Refined passports | C₁₀: four ordered passports, one Aut orbit. S₃: transpositions share one class, 3-cycles another; 12 vectors give two inner classes with one ordered class vector. C₂² unramified: empty passport for both fundamental-class values 0 and 1. | Passport is not a complete topological invariant. |
| 3.2 Frobenius/Möbius count | S₃ `(2,2,3,3)` has prefactor 6, character sum 2, count 12, all generating. C₂ with six/three involutions gives `(1+1)/2=1` / `(1−1)/2=0`. C₄ order-two tuple: raw 1, generating 0. At r=0, `Σχ χ(1)²/\|G\|=1`. | Empty exponent convention and subgroup subtraction pass. |
| 3.3 Braid quotient | S₃ unramified h=2: 360 vectors, 60 inner classes, 60 braid classes. With a=(12), b=(23), c=(123), `[a,b]=(132)` and `[a,b]c=1`, though c≠1. | Handle conjugation and preserved branch product pass. |
| 3.4 Topological equivalence | C₂² vectors `(x,y,0,0)` and `(x,0,y,0)` both have g=5 and empty passport; images of the fundamental class are 1 and 0 in H₂=C₂. | Not topologically equivalent; excludes unmarked/passport identification. |
| 3.5 Braid refines topology | C₁₀: four braid classes map to one topological class. Unramified S₃: 60 braid classes, not 360. Hurwitz pair `(12),(23)` and `(13),(12)` both multiply to `(123)`. | Direction and strict refinement witnessed. |
| 3.6 Genus-zero classification | C₁₀: four vectors and four units, one orbit. C₃×C₁₅: 192 vectors, 192 automorphisms, one topological orbit; exchanging the two order-15 entries gives 96 braid classes. Three distinct sphere colours: pure mapping class group has size 1. | Pass for abelian and coloured-sphere controls. |
| 3.7 Three counts/aggregates | C₂ `(2⁶)` has (inner,braid,top)=(1,1,1); C₁₀ has (4,4,1). Genus-two C₂ signatures contribute inner counts 1+4=5 but passport counts 1+1=2. | Fixed-signature counts and aggregate sums separated. |
| 4.1 Quotient genus | Genus-two trivial, hyperelliptic and bielliptic actions have (h,r)=(2,0),(0,6),(1,2). Only the first has h=g. | Pass including trivial group. |
| 4.2 Family dimension | C₂ hyperelliptic: −3+6=3; bielliptic: 3−3+2=2; triangle: −3+3=0; trivial genus two: 6−3=3. | Fixed-locus and moduli dimensions agree; nontrivial bound used only when n≥2. |
| 4.3 Hurwitz/equality/large actions | Klein: 168=84·2, μ=1/42. Bring S₅: 120<252 but 120>12, μ=1/20. C₁₀: 10<84. `(2,2,2,m)` has μ=1/2−1/m, hence is large for m≥3. | Bound, equality and infinite large-signature family pass. |
| 4.4 Harvey | n=1, `(2;∅)`: M=1, one vector. n=2, six/five periods 2: even/odd maximal-2-power counts 6/5 and vector counts 1/0. n=4, six periods 2: M=2≠4, no generating vector. | 48,144 direct tuple comparisons; zero discrepancies. |
| 4.5 Wiman | C₁₀ `(5,2,3)` has orders (2,5,10), g=2 and 10=10. C₁₄ `(7,2,5)` has orders (2,7,14), g=3 and 14=14. C₂ `(2⁶)` has M=2, μ=1; proposed minimizing triangle has M=10, μ=1/5. | Headline instances pass; fixed-n proof assertion fails, R01. |
| 4.6 Realized finiteness/classifications | n=15, `(2,3,30)` gives g=2 but 30>10 and no vector. Trivial g=2 gives n=1≤84, h=2 and r=0. C₁₀ realizes maximal period 10=4g+2. | Realization restriction passes; complete low-genus tables remain source-uncertified. |
| 5.1 Fullness/overgroup | C₂⊂C₁₀ on the genus-two curve has index 5 and `2·1=10·(1/5)=2`. Full C₁₀ there has index 1; its C₂ subgroup is not full. | Individual-curve definition and index formula pass. |
| 5.2 Generic fullness | C₂ hyperelliptic space dimension 3, special C₁₀ triangle dimension 0. Generic bielliptic C₂⊂C₂² preserves dimension 2 and doubles order 2→4. | Special/generic distinction passes. |
| 5.3 Nineteen inclusions | All 19 sampled area equalities and equal dimensions are displayed below. N1: 2=2·1 and 3=3; T1: 4/7=24/42 and 0=0; N4 quotient order 4 has exponent 2, not 4. | Table and coset interpretation agree with accessible source; page corrected by R04. |
| 5.4 Extension criteria | N2 in S₃: a=(12),b=(23),x=(12) gives w=(23), image A(x)=(12)≠w, with all peripheral orders 2. N4/N7 automorphism relations and all T-row word tests are below. | Tested word formulas pass; trivial induced automorphism does not force a trivial extension lift. |
| 5.5 Generic full group | Hyperelliptic genus-two generic order 2, special order 10, dimensions 3 versus 0. Bielliptic generic extension has order 4/index 2 and dimension 2. Identity extension has index 1. | Definition separates special enlargement from generic stabilizer. |
| 6.1 Macbeath/fixed points | C₂ counts 6 or 2. S₃ transposition: `2(1/2+1/2)=2`; 3-cycle: `3(2/3+2/3)=4`, also `6(1/3+1/3)=4`. C₃² example: counts x=12,y=6,xy=0. | Centralizer/normalizer forms agree; identity excluded; relabelling equivariant. |
| 6.2 Hyperelliptic criterion | C₂ hyperelliptic: 6=2·2+2. Bielliptic: 2≠6. C₄ `(2,2,4,4)`: `4(1/2+1/2+1/4+1/4)=6`. | Predicate on G distinct from fullness. |
| 6.3 Hyperelliptic family | C₄ genus-two action has a six-fixed-point involution and index-two generic extension. Bielliptic C₂ has fixed count 2, no witness in G, but generic C₂² has the six-fixed-point involution. | Implication and conditional witness repaired; no converse asserted. |
| 6.4 Cyclic trigonal | S₃ genus two: 3-cycle fixed count 4, `2=−6+2·4`. C₃² genus ten: x count12 gives `18=−6+24`; y count6 gives `18=3(2·2−2)+12`. Distinct degree-three pencils force g≤(3−1)²=4. | Criterion and uniqueness threshold g≥5 agree; C₂ witness set empty. |
| 7.1 Eichler | Hyperelliptic: `1+6(−1/2)=−2`; bielliptic: `1+2(−1/2)=0`. Equianharmonic torus: `1+3ω/(1−ω)=ω`, inverse pullback trace ω². | Denominators nonzero for nonidentity finite-order fixed-point rotations; signs distinguish inverse action. |
| 7.2 Chevalley–Weil | C₂ multiplicities (0,2). C₅ `(1,1,3)` gives (0,0,1,1), scaled `(2,2,1)` gives (0,1,0,1); each sums to 2. Trivial unramified genus two gives (h−1)+1=2. | Labelled equivariance and trivial-character correction pass. |
| 7.3 Homology/Jacobian | Genus two: complex dual dimension 2, integral period rank 4. Hyperelliptic traces are −2 on differentials, −4 on H₁. Identity and basepoint translation induce I₄ on H₁. | Mathematical comparison supplied; source square locator needs R04. |
| 7.4 Idempotent relations | C₂² averaging sum has coefficient 3/2 at identity and 1/2 at each nonidentity, equal to `1+2ε_G`. Zero/identity idempotent images have dimensions 0/g. G=1 has ε_G=1. | Product-isogeny dimensions and degenerate idempotents agree. |
| 7.5 Rational blocks/Schur index | Hyperelliptic: H₁ dimension4→abelian dimension2, exponent1. Klein: dimension6→3, exponent3→elliptic cube. Q₈ `(i,j,−k)` has product1, g=2, differential multiplicity1, Schur index2 and exponent2/2=1. C₃ nontrivial block: rational degree2, Schur index1, exponent1. | Nonsplit control excludes division by degree without Schur index. |
| 7.6 Decomposition record | Hyperelliptic `[(2,1)]`: 2·1=2; bielliptic `[(1,1),(1,1)]`:1+1=2; Klein `[(1,3)]`:1·3=3. Trivial character block has dimension h, so vanishes exactly for h=0. | Unlabelled multiset, not arbitrary ordered labels, is invariant. |
| 8.1 Label prefixes | C₁₀: one family prefix, four refined passports, one topological class. Klein: two refined passports, one topological class. Changing the C₂ quotient genus from 0 to 1 changes the family and branch count 6→2. | Family/refined/topological distinctions pass. |
| 8.2 Intrinsic records | C₂² unramified genus5: same empty passport, fundamental-class values1/0. C₃² relabelling changes fixed count at x 12→6 but transported-label count stays12. Scaled C₅ characters both sum to2 and give rational pair(2,1). | Fields descend at the stated equivalence level. |

**Extension-row checks.** Each row was compared with Bujalance–Cirre–Conder, including its hypotheses and generator marking. The following are additional computed checks, not a replacement for the source's necessity/sufficiency proofs. Parameters are chosen so both signatures are hyperbolic. All dimensions are `3h−3+r`.

| Row and parameter | Source μ = index × target μ; dimensions | Word/automorphism test |
| --- | --- | --- |
| N1 | `2=2·1`; 3=3 | Trivial G: all four assignments give 1, A²=id; extension lift still has order 2 in C₂. |
| N2, t=3 for area | `4/3=2·(2/3)`; 2=2 | Separate t=2 S₃ test: a=(12),b=(23),x=(12),w=(23); A=id, A(x)=(12)≠w, A²=id. Its genus is 4. |
| N3, t=3 | `2/3=2·(1/3)`; 1=1 | S₃ a=(12),b=(23),x=(123): A=id; `(ba)⁻¹x(ba)=x`; genus 3. |
| N4, t=3 | `2/3=4·(1/6)`; 1=1 | C₃² tuple `(x,y,−x,−y)`: A swaps coordinates, B is negative swap; A²=B²=id and BAB=A, Inn(bd)=id. Quotient C₂². |
| N5, (t₁,t₂)=(2,4) | `1/2=2·(1/4)`; 1=1 | C₄ `(2,2,1,3)`: A is inversion, A²=id; images `(2,2,3,1)` satisfy the displayed words. |
| N6, t=4 | `1/4=3·(1/12)`; 0=0 | C₄² `(x,y,−x−y)`: A cycles the three entries, A³=id. |
| N7, t=4 | `1/4=6·(1/24)`; 0=0 | Same tuple: B maps x→−x−y,y→y; B²=id and BAB=A⁻¹, Inn(c⁻¹)=id. Quotient S₃, not C₆. |
| N8, (t₁,t₂)=(15,3) | `8/15=2·(4/15)`; 0=0 | C₃×C₁₅: a=(0,1),b=(1,−1),c=(−1,0); orders 15,15,3, sum 0. A(s,t)=(s+t,−t) swaps a,b and fixes c; A²=id. |
| T1 | `4/7=24·(1/42)`; 0=0 | Finite H order168, generated source order7, index24; source orders(7,7,7), product1. Coset cycle types 2¹²,3⁸,1³7³ give exactly three order-7 source cones. |
| T2 | `3/14=9·(1/42)`; 0=0 | H504, G56, index9; source orders(2,7,7), product1. |
| T3 | `4/21=8·(1/42)`; 0=0 | H168, G21, index8; source orders(3,3,7), product1. |
| T4 | `1/2=12·(1/24)`; 0=0 | H96, G8, index12; source orders(4,8,8), product1. |
| T5 | `5/12=10·(1/24)`; 0=0 | H720, G72, index10; source orders(3,8,8), product1. |
| T6 | `2/3=12·(1/18)`; 0=0 | H324, G27, index12; source orders(9,9,9), product1. |
| T7 | `3/10=6·(1/20)`; 0=0 | H120, G20, index6; source orders(4,4,5), product1. |
| T8, n=2 | `1/4=6·(1/24)`; 0=0 | In PSL₂(17), target orders(2,3,8); word images have orders(2,8,8), product1. |
| T9, n=3 | `1/3=4·(1/12)`; 0=0 | In PSL₂(23), target orders(2,4,6); word images have orders(3,6,6), product1. |
| T10, n=3 | `2/9=4·(1/18)`; 0=0 | In PSL₂(19), target orders(2,3,9); word images have orders(3,3,9), product1. |
| T11, n=4 | `1/8=3·(1/24)`; 0=0 | In PSL₂(17), target orders(2,3,8); word images have orders(2,4,8), product1. |

For T8–T11 these are **word and exact-order tests only**; those simple quotients are not claimed to realize the table index. The full index/injection condition is stated in the roadmap and checked against the source. For T1–T7 the subgroup orders and indices were computed too. All nineteen area and dimension equations were computed independently.

**Seeded source sample: all fifteen requested targets.** The legal copies read were the publisher's Breuer contents and ten-page excerpt, the AMS open Bujalance–Cirre–Conder article, Lange–Recillas arXiv v2, Swinarski arXiv v1, two Paulhus author manuscripts, and the LMFDB repository file. Source IDs below identify the line-numbered extractions obtained through the sources service. For Breuer, line numbers below refer to the ten-page excerpt unless explicitly labelled “contents”. No claim that a secondary quotation certifies an unread primary locator is made.

| Sample target | Text and exact locator checked | Outcome |
| --- | --- | --- |
| 0.5 | `breuer` lines 318–343, Theorem 3.2 and the following ordering result, printed p.8; `paulhus2023` lines 72–127, pp.2–3. | The presentation, generation and exact peripheral orders support the correspondence, together with the native universal property. Breuer's later existence theorem and Broughton's primary proposition remain unread. The arbitrary-group algebraic correspondence does not require compact-surface existence. |
| 2.2 | `breuer` lines 319–332, Theorem 3.2(3–4), p.8; `bujalance` lines 151–172, §2, p.1540. | The torsion description and smooth-epimorphism condition support both implications. Exact orders are required; finite index is needed only for the compact quotient/genus consequence. |
| 3.1 | `paulhus2023` lines 138–165, refined-passport discussion, pp.3–4. | The ordered conjugacy-class data and distinction from topological classes agree. Breuer §14, p.45 was not accessible; the author manuscript's pagination is not silently treated as the published volume's. |
| 3.4 | `paulhus2023` lines 346–405, pp.8–9, discussing Broughton Proposition 2.2. | Supports the Aut(G)/mapping-class formulation as secondary evidence. The primary proposition was not readable. The cone-colour and inner-quotient refinements are explicitly constructed here and matched with the supplier. |
| 3.5 | Same Paulhus passage; InverseGaloisAndArithmeticFundamentalGroups IG.3.2 and local §3.4. | The half-twist route supports refinement; S₃ and C₁₀ witnesses distinguish product preservation and strictness. Primary Broughton certification remains unavailable. |
| 3.6 | `paulhus2023` lines 346–405, pp.8–9, genus-zero braid discussion. | The quotient-genus-zero hypothesis is essential and retained. Broughton Proposition 2.2 itself remains uncertified. |
| 3.7 | `lmfdb` lines 213–241, aggregate-table block in `higher_genus_w_automorphisms/main.py`. | Verified the grouping by genus/group/quotient-genus regime and separate completeness table by genus. This verifies the table-reading semantics, not the truth or completeness of stored data. |
| 4.4 | Harvey, Theorem 4, article pp.86–97: attempted publisher/DOI and sources-service lookup. | Primary text unavailable. The stated criterion independently passes 48,144 direct cyclic tests, including empty branch lists and n=1; this is not a locator certification. |
| 5.1 | `breuer` lines 248–252, Lemma 2.5, p.6; `bujalance` lines 35–74, §1, p.1537. | Normalizer/automorphism interpretation and full-action distinction supported; pointwise fullness is separated from generic fullness. |
| 5.4 | `bujalance` lines 187–337, cases N1–N8, pp.1540–1544; lines 350–558, T1–T11, pp.1544–1548. | All nineteen generator formulas compared, including N2's x image, N4/N7 compatibility, exceptional target triples, and exact orders. The first normal case begins on p.1540, so a collective reference starting at p.1541 omits its opening. |
| 6.1 | Macbeath §2 unavailable; `swinarski` Theorem 1.3, pp.2–3, rotation-resolved fixed points, and the explicit coset derivation in README. | The aggregation and two forms were checked mathematically on C₂, S₃ and C₃². Macbeath's primary locator remains uncertified. |
| 6.3 | `swinarski` lines 223–242, §2.1, p.5. | Supports testing the hyperelliptic involution in the action/full group. It does not by itself prove closedness of the hyperelliptic locus or the family-wide assertion; the generic-extension route here must carry that extra conclusion. HyperellipticCurves §1.4 supplies the pointwise involution criterion. |
| 6.4 | Same Swinarski passage; AlgebraicCurves Layer 8 Castelnuovo inequality. | The order-three fixed-point test agrees. The g≥5 uniqueness claim is a stated deduction from `(3−1)(3−1)=4`, not a claim that Swinarski proves it in §2.1. |
| 7.3 | `lange_recillas` lines 106–155, §1, Proposition 1.1 and diagram (1.3), pp.3–4. | Group-algebra action and tangent/lattice compatibility supported. Diagram (1.3) is not the H₁ square: R04. The latter has a valid separate supplier in MordellLawrenceVenkatesh §8.11. |
| 8.2 | `paulhus2023` refined-passport/topological passages above; `lmfdb` aggregate block; local equivariance computations. | The repaired record distinctions survive the explicit C₂² and C₃² counterexamples. Broughton Proposition 2.2, live knowls and the complete database schema are not certified. |

Additional source checks: `lange_recillas` lines 210–224, Proposition 2.1 and Theorem 2.2, p.6, support the matrix-size exponent and allow zero factors; `paulhus2008` lines 90–107 and 146–150 support the rational group-algebra and C₂² decompositions. `bujalance` lines 563–605 distinguish hyperelliptic subgroup tests and triangular extensions. None of those sources turns an arbitrary character field into a splitting field; the roadmap correctly keeps the Schur index. The publisher's Breuer contents confirms the revised section/page spine (Fuchsian groups §3 p.7; differentials §7 p.25; fixed points §10 p.35; trace §12 p.41; genus computations §20 p.84).

**Ownership and pinned-library audit.** Object searches were made with the roadmap index's `roadmaps grep`/`show`, across main, the supplied open heads and the board packages: signature groups, surface kernels, generating vectors, branch tuples/Hurwitz actions, cone-orbifold Teichmüller spaces, period lattices, holomorphic differentials, Schur indices and group-algebra decompositions. Generic topology, curve/Jacobian constructions and rational representation descent retain their earlier owners. No second declaration of this roadmap's fully qualified Lean names was found apart from another checkout of this same pull request. Ownership against other open pull requests without supplied files was not independently audited; tools were used to resolve the explicitly cited suppliers, not to treat unrelated index hits as new owners.

The main roadmap examples read for shape were FuchsianOrbifolds, BelyiMaps and ComplexTori. The source index identifies the additional cited suppliers as new roadmaps: InverseGaloisAndArithmeticFundamentalGroups at a5186ac, SurfaceTopology at 421e114, MordellLawrenceVenkatesh at 99154a7, and ArithmeticGaloisRepresentations at 2194655. These were read through `roadmaps show`; an open revision of an existing main roadmap was not substituted for main.

| Resolved roadmap contract | Evidence read and boundary retained |
| --- | --- |
| FuchsianOrbifolds Layers 2,4,5 | `TauCetiRoadmap/FuchsianOrbifolds/README.md:235`, 286, 311: polygon presentations; quotient/compactification; topological genus, degree, ramification and Euler-characteristic Riemann–Hurwitz. Analytic genus comparison is explicitly left to ModularForms. |
| BelyiMaps §§0–1,3.2–3.4,4–6 | `TauCetiRoadmap/BelyiMaps/README.md:578`, 643, 866, 1181, 1228, 1240, 1576, 1957: triples, nonempty transitivity, ordered passports, product-one counts, generation correction, peripheral loops and cover rigidifications. New arbitrary-length counting and arbitrary surface signatures are real extensions. Its analytic Layers 7–8 have a successor boundary: R05. |
| InverseGaloisAndArithmeticFundamentalGroups IG.3.2/IG.5.2 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:2677`, 5421: arbitrary-product disc tuples, product-preserving Hurwitz action, colour restrictions, marked covers and forgetting the marking. Product `(12)(23)=(123)` is preserved by `(13)(12)`. Obsolete exact names are R03. |
| TeichmullerGeometry §§3.3,5.6,8.4,10.1 | `TauCetiRoadmap/TeichmullerGeometry/README.md:326`, 496, 655, 736 at the supplied head: proper action, finite conformal stabilizers, dimension `3h−3+r`, minimum area π/21. They do not claim the arbitrary-cone global identification or all-signature extension classification; local §§4.2,5.2–5.4 own those additions. |
| SurfaceTopology Layers 7–9 | `TauCetiRoadmap/SurfaceTopology/README.md:1172`, 1256, 1422: compact-surface classification and orientation-preserving/boundary-relative mapping classes. Its exclusion of punctured mapping classes is respected by using the separate supplier below. |
| MordellLawrenceVenkatesh §§5.9,5.21,8.11 | `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:1804`, 1965, 2517: punctured mapping classes and their outer action, capping, and the Jacobian period lattice with natural integral homology comparison. These explicitly repair previous R11–R12. Cone-order restriction and the half-twist/sphere comparison remain local targets. |
| ComplexCurveModuli D0 | `TauCetiRoadmap/ComplexCurveModuli/README.md:25`: compact smooth complex-curve/classical-surface comparison, genus-zero case and uniformization. The roadmap builds its finite-cone adaptation rather than claiming D0 already states it. |
| AlgebraicCurves Layers 6–8,11–12 | `TauCetiRoadmap/AlgebraicCurves/README.md:1093`, 1396, 1468: Castelnuovo inequality, characteristic-zero automorphism finiteness and the function-field/curve dictionary. The tame function-field Hurwitz bound is consumed, not rebuilt as a competing library theorem. |
| ModularForms 10B | `TauCetiRoadmap/ModularForms/README.md:1068`: analytic Riemann–Roch, differential dimension and the analytic/topological genus comparison. No claim that the pinned Degree module already proves that comparison. |
| JacobianChallenge D–F and ComplexTori Milestone 1 | `TauCetiRoadmap/JacobianChallenge/README.md:218`, 332, 448: Pic⁰/Jacobian, dimension and Albanese functoriality. `TauCetiRoadmap/ComplexTori/README.md:130` starts with an already supplied full lattice and is not used to invent the curve's period lattice. |
| ArithmeticGaloisRepresentations §5.6 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3305`, §5.6: rational simple block Mₙ(D), `[D:Z]=s²`, complex degree n·s and multiplicity s under scalar extension. Q₈ gives n=1,s=2, not n=2. |
| HyperellipticCurves §1.4 | `TauCetiRoadmap/HyperellipticCurves/README.md:831` at the supplied head: the involution/fixed-point criterion in characteristic ≠2, centrality and the reduced automorphism group. The present roadmap uses only its complex specialization. |
| AlgebraicTopology Stage 6 and group-classifying inputs | `TauCetiRoadmap/AlgebraicTopology/README.md:946`, 1822: oriented fundamental classes, products and naturality, native bar/classifying-space conventions. The elementary C₂² exterior-square calculation is explicitly a local distinguishing calculation, with values 0 and 1. |

Representative pinned definitions/theorems actually opened, including their relevant limitations, are listed next. Paths beginning `Mathlib/` and `TauCeti/` are relative to the two pinned library repositories.

| Pinned object | File and line; what the declaration includes |
| --- | --- |
| Presented groups | `Mathlib/GroupTheory/PresentedGroup.lean:39`, 90, 135: quotient of FreeGroup by normal closure; generator closure is top; `toGroup` assumes all relators vanish. It does not assume exact generator orders or surjectivity. |
| Endpoint convention | `Mathlib/Topology/Homotopy/Lifting.lean:627`, `fundamentalGroupToMulOpposite`: endpoint labels for the left action land in `Gᵐᵒᵖ`. This is the decisive direction check. |
| Wedderburn–Artin | `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:200`, `IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing_finite`: finite semisimple algebra, matrix sizes nonzero, finite division algebras. It is not a split-algebra assertion. |
| Permutation triple | `TauCeti/Combinatorics/PermutationTriple/Basic.lean:75`, 347, 427: product `σinf*σ1*σ0=1`, generated monodromy, connected iff n≠0 and pretransitive. No component nonidentity/order-sorting condition: R02. |
| Combinatorial genus | `TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean:204`: cycle-based natural genus; it is not the missing generic compact-surface genus carrier. |
| Triangle area sign | `TauCeti/GroupTheory/TriangleGroup/Signatures.lean:122`, 155: reciprocal-sum Euler characteristic and hyperbolic sign. The roadmap uses its negative and reverses the generator order. |
| Braid group | `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:97`: `ArtinGroup (CoxeterMatrix.A (n−1))`. At n=0,1 the generator index is empty; no spurious braid action is inferred. |
| Local multiplicity | `TauCeti/Analysis/Complex/RiemannSurface/LocalMultiplicity.lean:336`, 357: identity multiplicity1 and power-map multiplicity m. The file's introduction expressly does not provide the local normal-form construction. |
| Degree and finite holomorphic map | `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean:120`, 133, 356, 385: total degree function, finite holomorphic-map hypotheses and constructor, fibre-sum theorem. Generic topological genus/Riemann–Hurwitz is a roadmap contract, not an existing theorem in this file. |
| Ramification | `TauCeti/Analysis/Complex/RiemannSurface/Ramification.lean:76`, 112, 171: sum of local-multiplicity-minus-one, divisor, and fibre identity. Natural subtraction is legitimate for the nonconstant finite maps used here. |
| Function-field Hurwitz | `TauCeti/FieldTheory/FunctionField/Automorphism/HurwitzBound.lean:83`, 186: finite subgroup, function field with exact constants, genus≥2 and tameness; the latter theorem specializes to characteristic zero. It does not prove finiteness of the entire higher-genus automorphism group. |
| Hyperelliptic predicate | `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Basic.lean:76`: genus≥2 and a separable rational subfield of degree2. `IsFunctionField` and exact constants are separate hypotheses; inseparable characteristic-two extensions do not satisfy this predicate automatically. |
| Character-sum convention | `TauCeti/RepresentationTheory/CharacterTable/CentralIdempotent.lean:142`, 211: coefficient χ(g⁻¹) and multiplication law. `CharacterTable/IdempotentDecomposition.lean:186` gives the sum of primitive central idempotents. Split complex blocks do not supply rational Schur indices. |

The all-signature `SignatureGroup`, its exact-order epimorphisms, and the vector-to-geometry interfaces are owned here. Three-generator triangle and permutation carriers, general branch-tuple actions, finite-holomorphic-map degree, function-field Hurwitz and split character idempotents are imported by specialization/comparison. No duplicate fully qualified declaration was introduced. No route-specific good-case restriction, computational procedure, sorry'd data, `set_option`, copied source passage or outside-folder edit was found.

**Headline and Lean audit.** The README's algebraic acceptance headlines are the vector/epimorphism correspondence (§0.5), Fuchsian torsion and exact-order kernel criterion (§§2.1–2.2), realized-genus integrality (§2.5), Hurwitz bound/equality (§4.3), Harvey (§4.4), and Wiman bound/equality (§4.5). All nine occur in Lean, with twelve explicit supporting structures/definitions/abbreviations. The broader geometric endpoints are the marked Riemann-existence equivalence, topological classification, generic full-group and nineteen-row extension classification, fixed-point and differential-character formulas, and the Jacobian/isogeny decomposition. The module docstring names these missing-carrier families rather than replacing them with arbitrary predicates or assumed conclusions. The low-genus classifications and record identities remain README mathematical targets; database completeness is explicitly outside scope.

A scratch copy containing `#check @name` for all **21** explicit declarations was elaborated once and compared to the README and the supplied signature inventory. **Zero** section binders were lost. In particular, `[Finite G]`, hyperbolicity and positive cyclic order occur where needed; the torsion-free-kernel theorem permits an infinite codomain as the README now says. No signature change was made. The unused-surjectivity possibility in the torsion criterion is not a blocker: without surjectivity the same iff follows by restricting to the image, but the stated theorem is deliberately about epimorphisms.

For padding, three separate scratch copies replaced every admission by respectively `simp`, `rfl` and `infer_instance`, elaborated serially. **None of the nine** theorem bodies closed in any copy. Reading the relevant pinned presentation, triangle, function-field and character APIs found no exact single-library-lemma proof of one of these nine newly specialized headline statements. The previous one-lemma Hurwitz wrapper and boundary/example padding are gone. There are no admitted examples or data definitions and no catalogue of ancillary API theorems.

## Not verifiable

No unread theorem was marked certified, and the review was completed without parking for a text. All source retrieval used the sources service and legal publisher/author/arXiv/repository locations. An HTTP/search failure establishes only that this review could not read a text, not that no legal copy exists.

- **Breuer beyond printed p.10.** Cambridge's [publisher excerpt](https://assets.cambridge.org/97805217/98099/excerpt/9780521798099_excerpt.pdf) and [contents](https://assets.cambridge.org/97805217/98099/toc/9780521798099_toc.pdf) were readable; the full book was not. Later existence, character, fixed-point, rotation, trace, passport and genus-table locators remain uncertified. The full-text lookup also encountered a search-service 429. The excerpt is not a certification of §§7,10–14,20.
- **Broughton, Propositions 2.1–2.2 and Tables 4–5.** Tried DOI [10.1016/0022-4049(91)90021-S](https://doi.org/10.1016/0022-4049(91)90021-S), the sources lookup, and the indexed institutional copy at CORE; the latter returned HTTP 403. Paulhus quotes/discusses the classification, but that does not verify Broughton's hypotheses or printed pages firsthand.
- **Harvey, Theorem 4; Wiman's original bound.** Tried Harvey's publisher DOI [10.1093/qmath/17.1.86](https://doi.org/10.1093/qmath/17.1.86) and bibliographic lookup for Wiman. The publisher/lookup attempts did not yield readable primary text. Exact theorem/page verification remains open independently of the cyclic computations.
- **Macbeath §2; Singerman Theorem 1; Ries §3.** Tried their DOI/publisher records, respectively [10.1112/blms/5.1.103](https://doi.org/10.1112/blms/5.1.103), [10.1112/jlms/s2-6.1.29](https://doi.org/10.1112/jlms/s2-6.1.29), [10.2307/2154274](https://doi.org/10.2307/2154274), and sources lookup. No readable primary text obtained. The complete extension rows were instead read in the AMS open Bujalance–Cirre–Conder article; Macbeath's rotation-refined formula was compared with Swinarski. Ries's precise generic-locus argument remains uncertified.
- **Farkas–Kra III.7, V.1, V.2.9; Miranda III.3; Chevalley–Weil and its correction; Kani–Rosen Theorems A–C.** Bibliographic/DOI service attempts did not supply readable full texts. The latter two DOI records were [10.1007/BF02940687](https://doi.org/10.1007/BF02940687) and [10.1007/BF01442878](https://doi.org/10.1007/BF01442878). The character signs were tested directly, and group-algebra isogenies were checked against accessible Lange–Recillas/Paulhus; those checks do not certify the original numbered theorems or correction's locator.
- **LMFDB live knowls, every stored label and completeness flags.** The repository's page code verifies the aggregate-query distinction, not the contents of the backing database, live knowls, all example identifiers or a frozen data snapshot. No acceptance claim of database completeness is made.
- **General proofs.** Enumeration of 48,144 cyclic cases, finite permutation witnesses and successful `sorry` elaboration do not prove Harvey, Wiman, Riemann existence or any general geometric statement. The report's sound rows are explicitly limited to the instances and source/supplier evidence recorded above.

## Source issues

These issues are in the sources, not additional findings against the roadmap. In particular, the roadmap's Q₈ Schur-index test avoids the splitting-field mistake.

- **Error** in breuer at Corollary 2.6, printed p.6: the source says all lifts of an automorphism with a fixed point are conjugate; it should restrict to lifts fixing points over the specified fixed point; affects a stated result.
- **Error** in lange_recillas at Proposition 1.1 proof, arXiv v2 p.4: the source says distinct simple rational group-algebra factors are nonisomorphic as rational algebras; it should use distinct central idempotents to distinguish their group-module actions, since ℚ[C₂]=ℚ×ℚ; affects the proof.
- **Error** in lange_recillas at §1, arXiv v2 p.5: the source says character values are roots of unity and their fields are cyclotomic; it should say sums of roots of unity and subfields of cyclotomic fields; affects the proof.
- **Error** in swinarski at Algorithm 1.5, Step 3, arXiv v1 p.4: the source says semisimplicity splits the isotypical representation over its character field; it should allow a splitting extension when the Schur index exceeds one, as for Q₈ over ℚ; affects the proof.
