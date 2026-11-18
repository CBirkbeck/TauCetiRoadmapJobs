# Review of MatroidOptimization (pull request #2520 at 6c79158)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the five layers was recomputed on degenerate and small instances (empty type, rank 0, `k = 0`, loops, elements outside the ground set, infinite ground sets, non-cancellative weights, `f ∅ ≠ 0`) and none failed; all 26 source locators agree with the texts, and the misprint the README reports in Schrijver's Exercise 10.31 (i) is real. There are two small corrections (Layer 1 cites no source; the core of a cooperative game is planned by an open roadmap that the scope paragraph does not name) and no format note. Two points are left to the human reviewers: the relation to the open CooperativeGames roadmap, and the kind of sources used.

## C01 — Sections 1.2, 1.3 and 1.4 give no source locator, and the one attribution in them is to a paper that was not read

A reader who wants to compare the symmetric exchange property, the three optimality criteria or the uniqueness statement with the literature has nothing to open: 1.2 says only "The property is due to Brualdi" (line 115), the references list Brualdi (1969) among the "attributions made in prose without a locator", and 1.3 and 1.4 cite nothing. The same holds for the direction of 3.1 that is proved here (Whitney's, line 338: the locator given, Goemans (R1) to (R3) and Lemma 4.3, covers only the direction that is already Mathlib's), and for 4.6 and 5.1.

I checked the five texts the README does cite: none states the symmetric exchange property (Schrijver's Theorem 10.2 (ii) and (iii), p. 176, are the two one-sided forms). The statements themselves are correct (the table in the board report has the instances), so this does not touch a result. A locator for 1.2 and one for 1.3 would be enough: a textbook that states them, or Brualdi's paper once read.

## C02 — The scope paragraph on the core of a cooperative game names no roadmap, while an open roadmap defines that core and proves the membership step that 4.3 proves again

The paragraph "Not treated here" (lines 843 to 848) says correctly that `basePolytope f` is the image under `x ↦ −x` of the core of the game `−f`. The open roadmap CooperativeGames defines exactly that core (its 2.1, `core v = {x | ∑ i, x i = v univ ∧ ∀ S, v S ≤ ∑ i ∈ S, x i}`), and its 2.3 proves that the marginal vector of every order lies in the core of a convex game. For `v = −f` and the order of decreasing `w`, that is the step of the route of 4.3 here ("`x(S) ≤ f S` for every `S` by induction", lines 626 to 628); conversely the route of its 2.4 uses the inequality of the first bullet of 4.3 with the signs changed. No named target is stated twice, and the two definitions are different sets, so each has one owner; but an implementer of either roadmap will prove the same lemma without knowing of the other.

Since neither roadmap is on main, a supplier citation is not the right repair. The paragraph would serve the reader if it named the roadmap and the identity, for instance: "CooperativeGames 2.1 defines the core; `x ∈ basePolytope f ↔ −x ∈ core (−f)`, and its 2.3 for `v = −f` is the membership step of 4.3." Which of the two should own the bridge is listed for the human reviewers.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 weight, `IsMaxWeightBase`, existence | `U₂,₃` weights 3,2,1; bases `{a}`,`{b}` weights −1,−2; all loops; `U₁,ℕ`, `w n = n` | 5,4,3; max `{a}` = −1 vs `∅` = 0; base `∅` weight 0; no maximum | true; finiteness needed |
| 1.2 `exists_symm_exchange` | 4 elements, bases all pairs but `{0,1}`, `B={0,2}`, `B'={1,3}`, `e=0`; infinite ground set route | `f=3`: `{2,3}` base, `{0,1}` not; `f=1`: `{1,2}`, `{0,3}` bases; circuit–cocircuit argument uses no finiteness | true |
| 1.3 three criteria | `U₂,₃` weights 3,2,1, `B={a,c}`; `WithTop ℕ` weights 1,2,⊤; rank-finite infinite `U₁,ℤ` | (2) fails `2>1`; (3) fails at `t=2`; (4) no bijection; ⊤-case: 1 holds, 2 and 3 fail; `U₁,ℤ`: both sides false | true; cancellation needed for 1⇒2 |
| 1.4 uniqueness, weight multiplicities | weights 1,2,2; 1,1,1; strict threshold via least weight above `r` in `B ∪ B'` | unique `{b,c}` (4 vs 3,3); three optimal bases, two elements of weight 1 each | true |
| 2.1 `Greedy.weight_le`, superset in optimal base | `U₂,₃` 3,2,1; free on `{a,b}` weights 1,−5; loop of weight 5; non-cancellative `R` | greedy sets `∅,{a},{a,b}`; base −4 vs `{a}` = 1 (different sizes); `{a}` greedy; exchange step needs only monotone addition | true |
| 2.2 converse (headline) | `P` = nothing; `P` = `∅,{a,b}`; finite subsets of infinite type; `∅`, singletons, `{a,b}` on 3 points | right side vacuous, no matroid (3 controls); `{c}` greedy maximal, `1 < 2` | true; each hypothesis needed |
| 3.1 rank functions | `min(|S|,1)`; `0,0,0,1`; `2·min(|S|,1)`; 1 on singletons only | rank of `U₁,₂`; `0+0 < 1+0`; `r{a}=2>1`; `r{a,b}=0<1` | true; three conditions independent |
| 3.2 intersection (headline) | `M₁=M₂`; path of 3 edges; free on `{a}` and on `{b}`; ground sets differ | `r(E)+0`; max matching 2 = `0+2`; `A={b}`: `0+0`; `A = A' ∪ (E₂∖E₁)` reduces to finite case | true |
| 3.3 union formula and matroid | two copies `U₁,₃`; `ι` empty; disjoint ground sets | `T=X`: `0+1+1=2`; `T=X`: 0; sum of ranks | true |
| 3.4 packing, covering | `U₂,₄`; `K₄`; rank 0; a loop; `k=0` | `2k ≤ 4`; `9 > 6` at `k=3`; all `∅`; `1 ≤ 0` false; both sides agree at `k=0` | true; README direction, not Schrijver's printed one |
| 3.5 Rado | free matroid; `U₁,₂` with `{a}`,`{b}`; `c ∉ E`; `ι` empty; dual of `U₁,ℕ`, `t n = {n}` | Hall; rank `1<2`; `0<1`; empty function; condition holds, transversal `ℕ` dependent | true; finite family needed |
| 4.1 closure properties | `|S|²` on 2 points; `min(f,0)` for additive 2,−1; coverage of `{1,2},{3,4},{1,3}` | `4+0 > 1+1`; values 0,0,−1,0 fail; 2,2,2,4,3,3,4 | true |
| 4.2 `lovaszExtension` | `f{1}=f{2}=1`, else 0 at (2,0),(1,1),(−1,3); constant 1; indicator of `∅`, `univ`; empty type | 2, 0, 4; 0; `f S − f ∅`; 0 | true |
| 4.3 `isGreatest_image_basePolytope` (headline) | `min(|S|,1)`; nonsubmodular 0,0,1; constant 1; `f ∅ < 0`; empty type | segment (1,0)–(0,1), max coordinate; empty; value 1 vs extension 0; empty; one point, 0 = 0 | true; `f ∅ = 0` and submodularity needed |
| 4.4 `convexOn_lovaszExtension_iff` (headline) | `|S|²` at (1,0),(0,1),(½,½); one point; empty type; `1_S + 1_T` | 1,1,2; linear; 0; `f(S∪T)+f(S∩T)−2f∅` | true without normalization |
| 4.5 both minimization theorems | `f = 0,−1,2,0`; constant 1; nonsubmodular 0,0,1; empty type | polytope `(x,−x)`, `−2≤x≤−1`, max −1 = min `f`; 1 vs 0; empty polytope; 0 = 0 | true |
| 4.6 weight as Lovász extension | `U₂,₃` 3,2,1; loop of weight 10; weights −1,−2 | `3·1+2·1+1·0=5`; `10·0`; `−1·1+(−2)·0=−1` | true |
| 5.1 marginal values | coverage `S=∅`, `T={a,c}`; `|S|²` | `3 ≤ 4`; `4 > 2` | true |
| 5.2 bound (headline) | coverage `∅,{c},{a,c}`, `k=l=2`; `k=0`; nonmonotone on one point; `f = 1` iff `{a,b} ⊆ S` | `1 = ¼·4`; `f∅ ≤ f(s l)`; `1 ≤ 0` false; `1 ≤ ¼` false | true; both hypotheses needed |
| C02 identity | `x ∈ basePolytope f` against `−x ∈ core (−f)` | `∑x = f univ` ⇔ `∑(−x) = −f univ`; `x(S) ≤ f S` ⇔ `−f S ≤ (−x)(S)` | identity holds |

- Source locators checked against the text: 26 of 26, in 5 sources (Bach 11, Schrijver 7, Goemans 5, Oxley 2, Krause–Golovin 1); Bach's page numbers are the printed ones.
- Library declarations opened at the pins: every Mathlib and Tau Ceti name the README cites (about 60), each resolved to the file the README names; `TauCeti.isSubmodular_outgoingArrowSum` read at `TauCeti/Combinatorics/Network/CutSubmodular.lean` line 41. No symmetric exchange, Lovász extension, matroid union or intersection at either pin.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows 4.1, 6.7, 6.8 and its scope sentence on the Nash-Williams–Tutte theorems, all present on main.
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. `Suggested.lean` elaborates with `sorry` as the only warning; the elaborated types of the 26 declarations were compared with the README and none lost a binder.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on a separate copy of the file: none of the 21 theorems closes.
- Description and title read against the head: 21 theorems, 5 definitions, the two imports, suppliers and scope all agree.

Overlap check: read ApproximationGuarantees, SpanningTreesAndShortestPaths, CooperativeGames (open) and GraphConnectivityAndFlows (main). ApproximationGuarantees excludes submodular maximization; SpanningTreesAndShortestPaths excludes the matroid form of the greedy theorem and of exchange (its 1.3 is for spanning forests of a graph); CooperativeGames owns `core`, this roadmap owns `basePolytope` (C02); GraphConnectivityAndFlows owns submodularity on lattices, cited. No shared `Suggested.lean` name.

Source independence: 32 passages compared with 5 sources, none shared; largest share Bach, 11 of 26 locators; contents compared with Bach (chapters 2, 3, 4, 6, 10, 11 feed 4.3, 4.2, 4.3, 4.1, 4.5, 5.2, not in order) and with Schrijver Chapter 10: independent.

Research link: the headline targets are the theorems of Edmonds (1965 to 1970), Lovász (1983) and Nemhauser, Wolsey and Fisher (1978) that Bach (2013) builds convex optimization with submodular functions on and that Krause and Golovin (2014) survey for greedy maximization; README references and the two texts.

## Not verifiable

- Brualdi (1969), attributed for 1.2: the publisher's page was found but the text was not read; the README gives no locator into it.
- The other original papers attributed in prose (Rado, Edmonds, Whitney, Nash-Williams, Lovász, Nemhauser–Wolsey–Fisher): not read; the README cites no locator into them.

## Source issues

- **Misprint** in Schrijver2017 at Exercise 10.31 (i), p. 190: the source says `k` disjoint bases exist iff `k(r(X) − r(U)) ≥ |X ∖ U|` for all `U`; it should be `≤`, as `U = ∅` shows; affects nothing.
- **Error** in Bach2013 at Proposition 10.3, equation (10.1), p. 117: the source, as its text extraction reads, gives the last member as `F(V)` minus the least 1-norm on the base polyhedron; it should be half of that difference; affects nothing.

## For the human reviewers

- Ownership: the open roadmap CooperativeGames (its 2.1, 2.3) defines `core v` and this one `basePolytope f`, with `x ∈ basePolytope f ↔ −x ∈ core (−f)`; neither names the other, and which states the bridge is undecided.
- Scope: the headline theorems are classical (1935 to 1983); all 26 locators go to lecture notes, two surveys and an arXiv monograph, and the original papers were not consulted (README lines 951 to 957).
- Licence: Schrijver, Goemans, Oxley and Krause–Golovin were read from the authors' or their groups' pages, which I classed as author pages; Bach from arXiv.
