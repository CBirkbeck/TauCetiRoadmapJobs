# Review of PosetHomotopyAndSubgroupComplexes (pull request #2296 at e1b39b5)

**Verdict:** needs changes

## R01 (P3) — Cite the pinned open-star deformation in the route of 2.2

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:405–406 — “this deformation retracts onto the realization of the order complex of `U_x`, a cone with vertex `x` (McCord 1966, §5, Lemmas 3 and 7, pp. 469–470)”.
**Claim:** The step is supplied only by a source citation, although the pinned Tau Ceti already proves it; it is absent from the supplier contracts and from the *Needs:* line of 2.2.
**Witness:** `AbstractSimplicialComplex.openStarHomotopyEquiv : (K.openStarRealizationSet s) ≃ₕ Realization (K.restrict s)` at `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Star/HomotopyEquiv.lean:44`; `openStarRealizationSet` at `Realization/Star/Retraction.lean:61`. For Sierpiński, `s = {True}`: `(0, 1] ≃ₕ` a point.
**Repair:** Add `AbstractSimplicialComplex.openStarRealizationSet` and `AbstractSimplicialComplex.openStarHomotopyEquiv` to “From Tau Ceti” and to the *Needs:* of 2.2, and write: “`μ⁻¹(U_x)` is `openStarRealizationSet U_x`, homotopy equivalent by `openStarHomotopyEquiv` to the realization of the full subcomplex on `U_x`, the order complex of `U_x`, a cone with vertex `x` (compare McCord 1966, §5, Lemmas 3 and 7, pp. 469–470)”.

## R02 (P3) — 4.5 needs the components of a realization, which no target supplies

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:778–782 — “`G` acts transitively on the components … *Needs:* 1.1, 3.1, 4.1”.
**Claim:** The statement is about `ConnectedSpace` of the realization, the route about order components of the poset. 1.1 treats the finite space, 3.1 is the nerve comparison; neither identifies the two.
**Witness:** `S₂(𝔖₃)`: three order components; the theorem needs “the realization has three components”. That follows from 2.2 (`μ` is bijective on `π₀`) with 1.1, not from 3.1.
**Repair:** Add to 2.2: “Prove that the realization of `orderComplex P` is connected exactly when `P` is nonempty and any two elements are joined by a fence of comparable elements (the `π₀`-bijection of `μ` for `WithUpperSet P`, with 1.1).” In 4.5 write “*Needs:* 1.1, 2.2, 4.1; Mathlib …”.

## R03 (P3) — Give 4.1 (a), (b), (c) separate *Needs:* lines

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:672–673 — “*Needs:* OddOrderTheorem §1.4; 3.3; Mathlib `Subgroup`, `IsPGroup`, `Subgroup.center`, `MulAut.conj`, `Subgroup.map`.”
**Claim:** One line covers three targets with different needs, so the definitions and the conjugation action of (a) wait on 3.3 and on OddOrderTheorem.
**Witness:** `PSubgroupPoset`, `ElemAbelianPoset`, `elemAbelianToPSubgroup` have real bodies in `Suggested.lean:192–204` from Mathlib alone; only (b) uses 3.3, only (c) uses `m_p(G)`.
**Repair:** (a) “*Needs:* Mathlib `Subgroup`, `IsPGroup`, `MulAut.conj`, `Subgroup.map`.” (b) “*Needs:* (a), 3.3; Mathlib `Subgroup.center`, `IsPGroup`.” (c) “*Needs:* (a); OddOrderTheorem §1.4.”

## R04 (P3) — 4.3 holds for every group; drop `[Finite G]`

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/Suggested.lean:227 — “`theorem contractibleSpace_of_normal [Finite G] [Fact p.Prime] (N : Subgroup G) [N.Normal]`”.
**Claim:** Finiteness of `G` is used neither by the statement nor by the route `Q ≤ QN ≥ N` of README.md:737: `QN` is an extension of `Q/(Q ∩ N)` by `N`, a `p`-group for any `G`.
**Witness:** `G = ℤ × ℤ/2`, `p = 2`, `N = 0 × ℤ/2`: `G` infinite, `N` normal, `S₂(G) = {N}`, one point, contractible; the theorem as stated does not apply.
**Repair:** Delete `[Finite G]` from `contractibleSpace_of_normal`; in 4.3 write “for any group `G` and prime `p`, if `G` has a nontrivial normal `p`-subgroup `N` …”, keep the sentence on `O_p(G)` for finite `G`, and add the instance as a Check.

## R05 (P3) — The description still says the `p`-rank and `p`-core are defined here

**Location:** pull request description — “No roadmap on main owns finite spaces, McCord's theorems, the fibre lemma or the subgroup posets; the `p`-rank and the `p`-core are defined here.”
**Claim:** The head contradicts it, and the list “What this roadmap consumes” omits a supplier the head adds.
**Witness:** README.md:74–80: “**Left to OddOrderTheorem.** The `p`-core `O_p(G)` … and the `p`-rank `m_p(G)` (OddOrderTheorem §1.4) … restates neither `O_p(G)` nor `m_p(G)`”; README.md:193–200 is the contract.
**Repair:** Replace the clause by “the `p`-core and the `p`-rank are OddOrderTheorem's (§1.1, §1.4)”; add “OddOrderTheorem §1.1 and §1.4: the `p`-core, elementary abelian `p`-groups and the `p`-rank” to the consumed list and to the suppliers that merge first; in the Layer 4 bullet write “the dimension of `A_p(G)`, `m_p(G) − 1`”.

## R06 (P3) — Layer 3 example cites sections that do not give it

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:638–639 — “The face poset of a simplicial complex has an order complex, its barycentric subdivision, homotopy equivalent to the complex (2.3 and 3.1).”
**Claim:** 2.3 gives a weak equivalence onto the finite-type space `WithUpperSet (Face K)` and 3.1 the nerve comparison; neither compares the two realizations.
**Witness:** One edge: `|sd K|` and `|K|` are the same interval by `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph` (`Subdivision/Homeomorph.lean:221`), a homeomorphism; 2.3's target is the three-point space `{0}, {1} < {0, 1}`.
**Repair:** “… its barycentric subdivision, whose realization is homeomorphic to that of the complex (`AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`), and homeomorphic to the realized nerve of the face poset (3.1).”

## Verified sound

Previous review (at bd77287), finding by finding:

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01 trivial acting group | README:595 “if `P = 1`, the congruence is modulo `1` and holds. Otherwise …”; Check at :631 | Repaired |
| R02 `p`-core, `p`-rank owners | README:74 “**Left to OddOrderTheorem.**”; :193 contract; Lean:38 | Repaired; resolved at OddOrderTheorem's open head, README:316–331, :478–490 |
| R03 orbit-space hypothesis | README:853 “a prime `p` dividing `|G|`” | Repaired |
| R04 Theorem 3 attribution | README:434 “upper-set carrier-map variant, obtained from McCord 1966, Theorem 2”; Check :465; Lean:132 | Repaired |
| R05 Quillen locators | README:534 “Quillen 1978, 1.5”; :485, :510 still “§1”; no pages | Partly; the text is paywalled, numbered statements stand as locators (see Not verifiable) |
| R06 API bullet lists | README:279, :375, :607, :675 “**API.**” lists | Repaired |
| R07 separate fibre Needs | README:561 and :570, one line each for (a) and (b) | Repaired |

Headlines (README): 1.2–1.5, 2.1–2.3, 3.1–3.5, 4.1 (c)–4.7, stated as 20 theorems; 3.4 (b) is named not statable in the module docstring (carriers of HomotopyTheoryOfCategories).

| Statement | Instances | One side | Other side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Convention 1 | Sierpiński `Prop` | `True ⤳ False`: opens ∅, {True}, univ | pinned `toEquiv a ≤ toEquiv b ↔ b ⤳ a`: False ≤ True | Agree | — |
| 1.2 fence headline | Sierpiński; discrete pair; pseudo-circle constants a, b | fence lengths 1; none; 2 (a ≤ c ≥ b) | homotopic yes; no; yes | Both directions hold | — |
| 1.2 one-step homotopy | `f₁ x ⤳ f₂ x` | `f₂⁻¹(V) ⊆ f₁⁻¹(V)` | preimage `f₁⁻¹(V)×[0,1) ∪ f₂⁻¹(V)×[0,1]` open | Continuous; matches barmak2011 line 4601 in the dual order | — |
| 1.3 `IsBeatPoint`, retraction | chain 0<1<2; `0,1<2`; pseudo-circle | beat points 3; {0,1}; 0 | `2` in `0,1<2`: no max below, nothing above | Wrong model “has a comparable neighbour” gives 4 on pseudo-circle | — |
| 1.4 Stong | pseudo-circle; Sierpiński vs point | self-maps ≃ id: only id | Sierpiński ≃ₕ point, cards 2 ≠ 1 | Hypothesis needed; barmak2011 line 768 | — |
| 1.5 invariant core, fixed point | ℤ/2 on `a,b<c`; ℤ/2 on indiscrete pair; `X = ∅` | core {c}, fixed c; no fixed point, not T₀ | `Y = ∅` works; contractible excludes ∅ | Holds; barmak2011 lines 4592, 4605 | — |
| 2.1 `IsBasisLike`, theorem | `{B}` on Sierpiński; two arcs on circle; ∅ → point | basis-like, not a basis; fails (2 components) | hypothesis over `{B}` is the conclusion; pinned predicate needs `exists_joined` | Matches mccord1966 lines 140–147 | — |
| 2.2 McCord | Sierpiński; discrete ℕ | `μ(0)=False`, `μ(t)=True`, `μ⁻¹{True}=(0,1]` open | min-vertex choice pulls {True} back to {1}, not open | Largest vertex correct for Mathlib's order; mccord1966 line 237 in dual order | R01, R02 |
| 2.3 carrier map | edge, weight 1/4 on vertex 1 | carrier `{0,1}`; subdivision chain `{0} ⊂ {0,1}`, largest `{0,1}` | McCord's map gives `{0}` (mccord1966 lines 314–321) | Variant = `μ ∘ sd⁻¹`, valid | — |
| 3.1 nerve | `Fin 2`; `0,1<2`; indiscrete pair | interval; two edges at 2; edge | interval; same; nerve nondegenerate in every dimension | PartialOrder needed | — |
| 3.2 homotopy property | `f i=(i,0)`, `g i=(i,1)` into `Fin 2 × Fin 2` | `f 1`, `g 0` incomparable: straight line leaves the complex | prism chains (0,0)<(0,1)<(1,1), (0,0)<(1,0)<(1,1) | Holds | — |
| 3.3 conical | `0,1<2`; pseudo-circle | `f` const 2 | forces `f = id`, no `x₀ ≤ a, b`; `π₁ = ℤ` | Holds; negative control excluded | — |
| 3.4 (a) fibre lemma | `{0} ↪ Fin 2`; discrete pair → `Fin 2`; `{a,c} ↪ (a,b<c)` | fibres {0},{0}; lower fibre over 1 has 2 points; fibre over b empty | point ≃ₕ interval; `π₀` 2 → 1; dual fibres sizes 2,1,1 | Lower fibres correct; StableHomotopyKTheory §2.31 uses `F↓d` on `SSet.toTop ∘ nerve` | — |
| 3.5 `chainEulerChar`, congruence | ℤ/4 on 4+1 points; ℤ/4 through ℤ/2 on 2+1; `P = 1` on 2 points | χ = 5; χ = 3 with `χ(T^Q) = 3`; χ = 2 | 5 ≡ 1 (4); hypothesis fails, 3 ≢ 1 (4); 2 ≡ 1 (1) | Holds; def equals RHS of pinned `eulerChar_realization` verbatim; brown1975 line 98 | — |
| 3.5 route | `e(Q)` for `1 < Q < P` | `1 = e(Q) + e(P) + 0` | `e(Q) = 0`, `χ = e(1) + 1`, `|P| ∣ e(1)` | Sound for `P ≠ 1` | — |
| 4.1 posets, (c) | `𝔖₃`; `D₈`; `Q₈`; `ℤ/4`; 1; `n = 0` | `|A₂|` 3; 7; 1; 1; 0 | `m₂` 1; 2; 1; 1; 0; no face of card 0 and `1 ≤ 0` false | Iff holds both ways; `sSup` of a bounded set containing 0 | R03 |
| 4.2 Brown–Quillen | `D₈`; `𝔖₄` with non-normal `V₄` | `A₂` 7 points, `S₂` 9, both conical | fibre `A₂(V₄)` 4 points vs `A₂(D₈)` 7 | Holds; cores 21, 39 for order 72 at minian_piterman2018 line 290 | — |
| 4.3 normal `p`-subgroup | `𝔖₄`, 2; `𝔖₃`, 2; `ℤ × ℤ/2`, 2 | `O₂ = V₄`, conical; 3 points; one point | contractible; not; contractible but `G` infinite | Holds; finiteness unused | R04 |
| 4.4 Stong iff | `𝔖₃` at 2, 3; `G = 1`; `𝔄₄` at 2 | contractible no, yes, no (empty), yes | normal `p`-subgroup no, yes, no, yes | Both directions; minian_piterman2018 line 165 | — |
| 4.5 connectivity | `𝔖₃`, 2; `𝔖₃`, 3; `𝔄₅`, 2; `ℤ/p`; `G = 1` without `hp` | components 3; 1; 5; 1; empty | `M` of order 2; none (`A₃ ∩ A₃ᵍ = A₃`); `𝔄₄`, intersections of order 3; none; none though LHS true | Holds; `hp` needed | R02 |
| 4.6 solvable | `𝔖₃`, 2; `𝔖₄`, 3 and 2; `G = 1` | `A_p` 3 points; 4 points; contractible; empty | `O_p` 1; 1; `V₄`; hypothesis false | Consistent; piterman_smith2024 line 1697 | — |
| 4.7 Brown | `𝔄₅` at 2, 3, 5, 7; `𝔖₃`, 2 | χ = 20 − 15 = 5; 10; 6; 0; 3 | moduli 4; 3; 5; 1; 2 | All ≡ 1; 5 ≢ 1 (8); brown1975 lines 117, 150 | — |
| Layer 3 example (point removal) | chain 0<1<2 minus 1 | fibre over 1 is `{0}`; others have a maximum | edge vs triangle, both contractible | 3.4 applies | — |
| Research context | arXiv abstracts | Piterman: `p`-rank ≤ 4; Piterman–Smith: `p = 3, 5`; Díaz Ramos: odd primes, preprint | README:866–873 | Agree | — |

- Source locators checked against the text: 20 (barmak2011 lines 596, 624, 673, 730–743, 761–768, 4592–4609; mccord1966 lines 72, 91, 144, 238, 270, 310–321; brown1975 lines 98, 117, 150; minian_piterman2018 lines 15–24, 61–64, 163–165, 288–309, 329); printed pages agree with the README in each case.
- Quillen's numbering corroborated in secondary texts: Proposition 1.6 (barmak2011 line 1154), Propositions 1.6, 1.9, 2.1, 2.4, 2.6, 5.2 (piterman2021 lines 185–201, 838), Corollary 12.2 (piterman_smith2024 line 1697), Conjecture 2.9 (minian_piterman2018 line 166).
- Library declarations opened at the pin: Mathlib `Specialization.toEquiv_le_toEquiv`, `homeoWithUpperSetTopologyorderIso`, `orderIsoSpecializationWithUpperSetTopology`, `Finite.toAlexandrovDiscrete`, `IsPGroup.le_sylow_of_normal` (elaborated); Tau Ceti `OrderComplex.lean:57, 116, 154`, `Realization/Basic.lean:165, 362, 417`, `WeakHomotopyEquivalence.lean:149, 355, 363`, `EulerCharacteristic.lean:145`, `FiniteCWType.lean:180`, `Subdivision/Basic.lean:76`, `Subdivision/Homeomorph.lean:221`.
- No pinned declaration states a target: searched Mathlib and Tau Ceti for beat points, basis-like covers, order-complex homotopies, subgroup posets, `p`-core, `p`-rank, strongly embedded subgroups; the one overlap is R01.
- Cross-roadmap citations resolved: StableHomotopyKTheory §2.31 on main (README:915–917); HomotopyTheoryOfCategories 2.1 and 2.4 at its open head; OddOrderTheorem §1.1 and §1.4 at its open head. No dropped id, no conflicting head, no second copy.
- Gate: every check 0, targeted build passed. `lake env lean` on `Suggested.lean`: 20 `sorry` warnings, nothing else. The 26 elaborated signatures compared with the README: no binder lost, generality equal except R04.
- Padding probe: each of the 20 theorems tried with `simp`, `rfl`, `infer_instance`, `simp_all`, `exact?`; 100 failures, none closes.
- Dependency check: `depcheck: 240 roadmaps, 2170 edges, 0 problem(s)`. Nothing changes outside the folder.

Overlap check: read StratifiedSpacesAndTameTopology, HomotopyTheoryOfCategories, KanQuillen (also StableHomotopyKTheory, OddOrderTheorem); shared objects and owners: Theorem A for realized nerves, StableHomotopyKTheory; basic localizers and their Theorem A, HomotopyTheoryOfCategories; `p`-core and `p`-rank, OddOrderTheorem; order complexes, Tau Ceti. Nothing else shared.

Source independence: 13 passages compared with 4 sources (barmak2011, mccord1966, brown1975, minian_piterman2018), including two docstrings of `Suggested.lean` and the routes of 1.4, 1.5, 2.2, 2.3 and 4.7, none shared beyond what the mathematics forces; largest share quillen1978, 13 of 39 locators, whose text and contents could not be read; contents compared with barmak2011 (Layer 1 draws on its §§1.2–1.3 and 8.1, Layer 2 on McCord, Layers 3–4 on other sources): independent. Within Layer 3 the order 3.2 → 3.3 and 3.1 → 3.4 is forced by the *Needs:* lines.

## Not verifiable

- quillen1978: the DOI resolves only to a paywalled page. The statements cited by number are corroborated above; the locators “§1” (3.1, 3.2), “1.5” (3.3) and “§2” (4.1), the wording and the table of contents were not read.
- stong1984: paywalled; 4.2 and 4.4 were checked through minian_piterman2018 lines 61–64, 163–165 and 294, not in Stong's §3.
- The Research-context citations of Webb 1987, Symonds 1998, Thévenaz–Webb 1991, Grodal 2002, Smith 2011, Brown 2000, Hall 1936, Aschbacher–Kleidman 1990, Aschbacher–Smith 1993 and Díaz Ramos 2018 were not read (publisher pages only); they support no target.

## Source issues

- **Error** in shareshian_woodroofe2016 at §1.3.1, p. 3 (arXiv v2): the source says `S_p(G)` is a subposet of the proper nontrivial subgroups and is contractible when `G` has a nontrivial normal `p`-subgroup; it should be the poset of all nontrivial `p`-subgroups, which contains `G` when `G` is a `p`-group; affects a stated result.

## For the human reviewers

- **Not tested.** quillen1978 has the largest share of the locators (13 of 39); its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Licence.** mccord1966 and barmak2011 were read in copies hosted on a third party's university page (`webhomes.maths.ed.ac.uk/~v1ranick/papers/`), neither the authors' nor the publishers'; the host's status was not classified.
- **Licence.** diaz_ramos2023 (arXiv:2303.15613) is an unpublished preprint; README.md:872–873 labels it as such and no target rests on it.
