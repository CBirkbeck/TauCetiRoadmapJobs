# Review of TuttePolynomialAndArrangements (pull request #2729 at e696d2d)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, formula and numerical Check in the four layers was recomputed and holds, including the degenerate cases (empty ground set, loops, coloops, `n = 0`, repeated and parallel hyperplanes, the graph on no vertex, `k = 0, 1, 2`), and every locator into Ardila and Ellis-Monaghan–Merino supports the statement it is attached to. There are two small corrections and three format notes, none blocking. For the humans: the locators into Stanley's lecture notes, the source cited most, could not be read through a legal copy and were not checked.

## C01 — The references list Stanley's Definition 3.8, which no section cites

A reader who follows the reference list back into the text finds nothing that uses Definition 3.8: the list of cited items under Stanley in the References (line 677) contains it, and it occurs nowhere else in the README. The pull request description's own list of Stanley locators omits it too. Remove it from the list, or attach it to the sentence it was meant for.

## C02 — Step (c) of the route in 3.3 says the trace arrangement has characteristic polynomial `P` in a case where it does not

In the route of 3.3 (lines 355–358) the sentence reads "the traces on `H` of the hyperplanes that meet `H` without containing it form an arrangement whose characteristic polynomial is `P` (by 3.2) and whose regions are the components in (a)", and only then adds that a hyperplane repeating `H` makes `P = 0`. With the line `x = 0` taken twice in `ℝ²` and `i₀` the second copy, no other hyperplane meets `H` without containing it, so the trace arrangement is the empty arrangement of `ℝ¹`, with polynomial `q` and one region, while `P = q − q = 0` and `H` minus the other hyperplanes is empty. The two cases are disjoint, and an implementer following the sentence literally proves a false intermediate claim. Stating the split would do: "If no other hyperplane contains `H`, the traces … have characteristic polynomial `P` and regions the components in (a); if one does, `P = 0` and `A` has the regions of `A ∖ i₀`." The stated theorems are unaffected (both recurrences hold in both cases: `χ_A = χ_(A ∖ i₀)`, equal region counts).

## N01 — Eight Checks report a past machine run rather than something a reader can compute

The last Checks of 1.4, 2.2, 3.2, 3.3, 4.2, 4.3, 4.4 and 4.5 ("On 118 matroids …", "On 420 random arrangements …", "On all graphs with at most six vertices …") say that an experiment agreed; the sample is not specified, so a reader can neither repeat nor falsify them. They could move to the pull request description, which already carries this record, or be replaced by one named instance each.

## N02 — One docstring line of `Suggested.lean` exceeds 100 characters

Line 72 (the displayed formula in the docstring of `eq_sum_of_tutteGrothendieck`) has 104 characters; README lines 113, 153 and 627 are also over 100.

## N03 — `TauCeti.Quiver.IsAcyclic` is used but its module is not imported by name

`Suggested.lean` uses `TauCeti.Quiver.IsAcyclic`, which the supplier contracts place in `TauCeti/RepresentationTheory/Quiver/Acyclic/Basic.lean`, and imports only `TauCeti.RepresentationTheory.Quiver.Zigzag.Orientation`, through which it arrives. Importing the module that is used would keep the file independent of that file's imports.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Tutte polynomial (definition) | `U_(1,3)`, `U_(2,3)`, `U_(2,4)`, loop, coloop, `∅`; exponents swapped | `U_(1,3)`: `(x−1)+3+3(y−1)+(y−1)² = x+y+y²`; swapped variant gives `x²+x+y`; loop `1+(y−1)=y`; coloop `(x−1)+1=x` | holds; wrong variant excluded | none |
| 1.2 Deletion–contraction, loop, coloop | `U_(2,4)` at any `e`; single loop | `(x²+x+y)+(x+y+y²) = x²+2x+y²+2y`; loop: `T=y` against `1+1=2`, so hypotheses needed | holds | none |
| 1.3 Duality | `U_(1,3)✶=U_(2,3)`; `U_(2,4)` | swap of `x+y+y²` is `x²+x+y`; `x²+2x+y²+2y` symmetric | holds | none |
| 1.4 Universality (division-free) | `U_(1,2)`, `a=0,b=1`; `a=b=1,x₀=y₀=2`; `E=∅`; `f=0` | terms `A=∅,{e}` carry `a¹=0`, `A=E` gives `y₀`; recursion `0·x₀+1·y₀=y₀`; exponent of `a` matches `a^(n−r)b^r T(x₀/b,y₀/a)` termwise; `∅`: `1=1` | holds; `f=0` shows `f(∅)=1` needed | none |
| 1.5 Bases and independent sets | `U_(2,4)`, `K₄` | `T(1,1)=1+2+1+2=6`; `T(2,1)=4+4+1+2=11=1+4+6`; `K₄`: `1+3+2+4+2+3+1=16` | holds (`0⁰=1` selects `r(A)=r(E)`, `|A|=r(A)`) | none |
| 2.1 Characteristic polynomial | `U_(2,4)`, `U_(1,1)`, loop, `∅`, `C₄`; sign of `T(1−q,0)` | `q²−4q+6−4+1=(q−1)(q−3)`; `q−1`; `1−1=0`; `1`; `q³−4q²+6q−3`; sign `(−1)^(r+|A|)` termwise; loop: flats sum `1 ≠ 0` | holds; loopless hypothesis needed and stated | none |
| 2.2 Broken circuit theorem | `U_(2,4)` order `0<1<2<3`; a loop; `C₄` | broken circuits `{0,1},{0,2},{1,2}`; NBC sets `1,4,3` against `q²−4q+3`; loop: `∅` broken, both sides `0`; `C₄`: `1,4,6,3` | holds; exponent `r−|S|` never truncates | none |
| 3.1 Arrangements, `χ_A` | empty in `ℝⁿ`, `n=0`; coordinate planes of `ℝ³`; 3 generic lines; 3 concurrent lines | `qⁿ`; `1`; `(q−1)³`; `q²−3q+3`; `q²−3q+2` (`μ(origin)=2`) | holds | none |
| 3.2 Whitney's formula | a line taken twice; 3 generic lines | `q²−q−q+q=q²−q`; `q²−3q+3` (triple not central) | holds with repetitions | none |
| 3.3 Zaslavsky, both counts | 3 generic lines; `x=0,x=1` in `ℝ²`; coordinate planes; empty arrangement, `n≥1` and `n=0` | `χ(−1)=7`, `χ(1)=1`; `q²−2q`: 3 regions, `(−1)¹χ(1)=1` strip; `8`, `0`; empty: `1` region, `W=0`, `(−1)⁰·1=1` | holds | C02 (route wording) |
| 4.1 Cycle matroid, `r(A)+c(A)=n` | two isolated vertices; `K₄`; `V=∅` | `0+2=2`; `r(E)=3`, `c=1`, `n=4`; `0+0=0` | holds | none |
| 4.2 Chromatic polynomial, Tutte relation | triangle; `C₄`; `V=∅`; `k=0` | `(−1)²q(1−q)(2−q)=q(q−1)(q−2)`; `q(q−1)(q²−3q+3)=q⁴−4q³+6q²−3q`; `P=1`, one empty colouring; `P(0)=0` | holds | none |
| 4.3 Graphic arrangement | `K₃`; edgeless graph; graph with an edge | `q(q−1)(q−2)`, 6 regions; `r=0`, `χ(1)=1`: one relatively bounded region; `P_G(1)=0`: none | holds | none |
| 4.4 Acyclic orientations | triangle; `K₄`; `V=∅`; identity with `T(2,0)` | `−P(−1)=6`; `24`; `1`; `(−1)ⁿ(−1)^(n−c)(−1)^c T(2,0)=T(2,0)` | holds | none |
| 4.5 Nowhere-zero flows | `C₄`, `k=2,3`; `K₄`, `k=2,3,4`; `k=1`; `k=0` triangle | `−T(0,1−k)=k−1`: `1`, `2`; `(k−1)(k−2)(k−3)`: `0,0,6`; `k=1`: `0` with an edge (`T(0,0)=0`), `1` without; `k=0`: card `0` against `−1` | holds; `k≥1` needed; exponent `|E|+c−n ≥ 0` | none |
| Lean: `eq_sum_of_tutteGrothendieck` | `α` empty; binders | sum over `A=∅` is `1 = f M`; `[Finite α]`, `[CommRing R]` in the signature | agrees with 1.4 | none |
| Lean: `ncard_relativelyBounded_regions` | `ι` empty, `d` nonempty | region `univ`, `univ ∩ {0}` bounded: `1 = (−1)⁰·1` | agrees with 3.3 | none |
| Lean: `card_isNowhereZeroFlow` | `k=2` skew condition; diagonal | `f v u = −f u v` automatic in `ZMod 2`; `f u u = 0` from non-adjacency; count `1` iff all degrees even | agrees with 4.5 | none |

- Source locators read in the text: 23 (Ardila2015: 12, lines 4350–4354, 4402–4409, 4492–4504, 5133–5135, 5372–5375, 5395–5409, 5416–5417, 5436, 5518–5529, 5566–5600; EllisMonaghanMerino2008: 11, lines 104–106, 179–182, 527–538, 591–607, 632–636, 737–740, 806–810, 856–857, 962–964). All support the statements.
- Library declarations opened at the pins: 35 (among them `Matroid.eRk_dual_add_eRank` at Rank/ENat.lean:641, `Matroid.restrict_eRk_eq` :194, `Matroid.contract` Minor/Contract.lean:62, `IndepMatroid.ofFinitaryCardAugment` IndepAxioms.lean:216, `IncidenceAlgebra.mu_apply` :383, `sum_Icc_mu_right` :400, `SimpleGraph.IsAcyclic.ncard_edgeSet_add_card_connectedComponent` Acyclic.lean:493, `TauCeti.DoubledQuiver.Orientation` Orientation.lean:73, `TauCeti.Quiver.IsAcyclic` Acyclic/Basic.lean:40). No Tutte, chromatic or characteristic polynomial of a matroid or arrangement exists at either pin.
- Cross-roadmap statements resolved: 6 (GeometricTopology 4.4.5 on main, weighted matrix-tree identity at README line 3008; GraphConnectivityAndFlows 7.4 and 8.1–8.5 on main; SpanningTreesAndShortestPaths 1.1–1.3, 5.2; MatroidOptimization scope; GraphColouring 3.1, 3.2; PseudolineArrangementsAndOrientedMatroids scope, at their open heads).
- Automatic checks: all passed. Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with 18 `sorry` warnings and nothing else. Elaborated types compared with the README statements: all agree; `graphicArrangement` does not carry `[Fintype V]`, which its type does not need.
- One-tactic probe: none of the 18 theorems closes with `rfl`, `simp` (also with the five definitions unfolded) or `infer_instance`. No padding.
- Headline theorems (deletion–contraction with loop and coloop, universality, broken circuits, Zaslavsky's two counts, colourings, Tutte relation, graphic arrangement, acyclic orientations, flows): all stated in `Suggested.lean`; none declared not statable.
- Pull request text read against the head: counts (18 theorems, 14 definitions, one structure, three instances), imports, suppliers and locator lists agree; no change outside the folder.

Overlap check: read MatroidOptimization, GraphColouring, SpanningTreesAndShortestPaths, DirectedMatrixTreeAndBEST, PseudolineArrangementsAndOrientedMatroids, MatchingPolynomial (open), GraphConnectivityAndFlows, GeometricTopology, ReflectionInvariantTheory (main); nothing shared. SpanningTreesAndShortestPaths 1.1 states the edge count of a spanning forest and this roadmap owns the cycle matroid and its rank (both rest on the same Mathlib lemma, neither cites the other); ReflectionInvariantTheory owns the chambers of a reflection arrangement only; no other roadmap states a Tutte, chromatic, flow or characteristic polynomial, a general real arrangement, or a count of acyclic orientations.

Source independence: 9 passages compared with 2 sources (Ardila2015, EllisMonaghanMerino2008), none shared; largest share Stanley2006, 21 of 46 locators, whose text and table of contents could not be read; contents compared with Ardila2015 (arrangements in its Chapter 6 before matroids and the Tutte polynomial in Chapter 7; here matroids first, arrangements third, graphs last): independent.

Research link: The headline targets are Zaslavsky's region counts (1975), Stanley's acyclic orientation theorem (1973), Brylawski's universality of the Tutte polynomial (1972), Tutte's flow polynomial (1954) and Whitney's broken circuit theorem (1932), as surveyed in Ardila (2015, §§6.2–6.3, 7.6–7.7) and Ellis-Monaghan–Merino (2008); rests on the README's references and both texts read.

## Not verifiable

- Every locator into Stanley, *An introduction to hyperplane arrangements* (pp. 2–3; Definitions 1.1, 1.3, 2.5, 2.6, 4.10; Lemmas 2.1, 2.2 and the erratum to 2.2; Theorems 2.4, 2.5, 2.7, 4.12; Proposition 2.5; Corollary 2.3; equation (22)): the sources service accepted neither the notes on the author's page nor the publisher's page, so the text was not read. Each statement carrying one of these locators was checked by computation, and all but the broken circuit theorem (2.2) and the definition of relative boundedness (3.1) also carry a locator that was read.
- The original papers of Whitney, Tutte, Brylawski, Stanley, Zaslavsky and Greene–Zaslavsky: attributed in prose only, not cited by locator, not read.

## Source issues

- **Error** in Ardila2015 at §7.7.1, sixth bullet, p. 122: the source says, for any matroid, that `(−1)^r T(1 − q, 0)` equals the Möbius sum over the lattice of flats; it should be restricted to loopless matroids (a single loop gives `0` against `1`); affects nothing.
- **Gap** in Ardila2015 at Theorem 7.6.1 (2), p. 120: the source says any function satisfying the three recursions is the stated evaluation; it should also require the value `1` on the empty matroid (the zero function satisfies the recursions); affects nothing.

## For the human reviewers

- Not tested: Stanley's lecture notes carry the largest share of the locators (21 of 46 mentions in the layers); neither their text nor their table of contents was read, so wording and arrangement were not compared with them.
- Licence: the notes are cited from a page on `math.mit.edu` that the README describes as the author's; the sources service did not classify that host path, so its status as an author's page is for a human to confirm.
