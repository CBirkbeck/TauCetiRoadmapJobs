# Review of MotivesAndAlgebraicCycles (pull request #1313 at 6be1873)

**Verdict:** needs changes

Incremental re-review of the 30 lines changed since b8e693e (26 insertions, 4 deletions, all in `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md`): the new §7.1a, the scope sentence (line 7), the Tau Ceti contract sentence (line 45), the Layer 7 Examples and Dependencies sentences (lines 1704, 1708) and three references (lines 1745–1747). `Suggested.lean` and `metadata.toml` are unchanged; nothing outside the folder changed.

## R01 (P2) — pullback functoriality of coniveau is stated below what the cited source proves

**Location** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md` line 1313: “For flat `f`, prove `f^*N^pH^i(Y,ℚ)⊆N^pH^i(X,ℚ)` … If the generalized conjecture holds for `X` and `Y`, derive `f^*N^p⊆N^p` for every `f` from the functoriality of `L^p`.”

**Claim** Pullback along an arbitrary morphism is offered only conditionally on the generalized Hodge conjecture, and the cup-product inclusion is absent. The cited paper proves both without that conjecture, and the paragraph cites only parts (1)–(2) of its theorem.

**Witness** ArapuraKang line 49 (“without assuming GHC”), lines 57–58 (Theorem 1.1(3): `f^*N^pH^i(Y)⊂N^pH^i(X)` for every map of smooth projective varieties), lines 60–63 (Corollary 1.2), proof at lines 319–412; it uses Deligne's Gysin description (lines 32–35, 324).

**Repair** Replace the last two sentences of the paragraph and its locator by: “For flat `f`, prove `f^*N^pH^i(Y,ℚ)⊆N^pH^i(X,ℚ)`, since flat preimages keep codimension. For every morphism `f:X→Y` of smooth projective varieties, prove `f^*N^pH^i(Y,ℚ)⊆N^pH^i(X,ℚ)`, taking the Gysin description of the next paragraph as a hypothesis for the smooth projective varieties the proof passes through: factor `f` through its graph, treat a closed immersion by blowing up and general hyperplane sections, and use the generically finite case `f^*H^i(Y)∩N^pH^i(X)=f^*N^pH^i(Y)`. Deduce `N^pH^i(X,ℚ)∪N^qH^j(X,ℚ)⊆N^{p+q}H^{i+j}(X,ℚ)` by restricting the exterior product to the diagonal. (Arapura–Kang, Theorem 1.1(1)–(2) and its proof, p.2; the flat case, pp.3–4; Theorem 1.1(3) with Lemmas 2.1–2.6 and §3, pp.2–9; Corollary 1.2, p.2; arXiv v1.)” Move the derivation from the generalized conjecture into a Check: under the conjecture for `X` and `Y` the inclusion is immediate from `f^*L^p⊆L^p`, in agreement with the theorem. Extend the reference at line 1747 to “Theorem 1.1 and Corollary 1.2”.

## R02 (P3) — the curve Check asserts `F¹H¹≠0` in every genus

**Location** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md` line 1320: “On a smooth projective curve the predicate holds in every bidegree: `N¹H¹=0`, … and `L¹H¹=0` although `F¹H¹=H^{1,0}≠0`”.

**Claim** The inequality is asserted for every smooth projective curve; it fails in genus zero.

**Witness** `ℙ¹`: `H¹(ℙ¹,ℚ)=0`, so `F¹H¹=H^{1,0}=0`, of dimension `g=0`. The same Check's next sentence takes `ℙ^d`, whose odd cohomology it says is zero.

**Repair** Write “and `L¹H¹=0`, although `F¹H¹=H^{1,0}` has dimension the genus and is nonzero in positive genus”. On an elliptic curve this gives `dim F¹H¹=1`, `L¹H¹=0`; on `ℙ¹` both are zero.

## Previous findings

- none: the previous report, of b8e693e, was an acceptance with no finding of its own; its two carried findings were recorded there as repaired, and the passages they concern (lines 63, 1352, 1712 and the finite-field Künneth sentence of line 1708) are unchanged in this diff.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §7.1a level piece `L^p`, existence and type bound | weight `n`, sub-structure `W` with `W_ℂ⊆F^p` | `W_ℂ=conj W_ℂ⊆F^p∩conj F^p`; types `(a,n-a)`, `p≤a≤n-p`; pin has `sup_WC`, `WellFoundedLT` under `Module.Finite` | holds |
| `L^p=0` for `2p>n`; weight `2p` | `n=1,p=1`; `n=2p` | empty range `1≤a≤0`; `F^p∩conj F^p=H^{p,p}`, rational points `V_ℚ∩H^{p,p}` | holds; agrees with §7.1 |
| twist shift `L^p(V(m))=L^{p+m}V` | `V=tate 0`, `m=-1`, `p=1` | pin: `(tate m).F p=⊤` iff `p≤-m`; `F^p(V(m))=F^{p+m}V`; `L¹(tate(-1))=ℚ=L⁰(tate 0)` | holds; sign agrees with line 45 and §7.1 Check 2 |
| exterior product `L^aV⊗L^bW⊆L^{a+b}` | `V=W=H¹(E)`, `a+b=1` | left `0`; right contains `α⊗β-β⊗α`, type `(1,1)`, dimension ≥1 | inclusion strict, as Check 3 says |
| `Ñ^p⊆N^p`, `Ñ^p⊆L^p` | `Z` of dimension `d-r`, `r≥p` | `codim f(Z)≥r`; source weight `i-2r+2r=i`; `F^r(H(-r))=F⁰H=` all; image in `F^r⊆F^p` | holds |
| vanishing for `i<2p`; `p≤0` | `i=1,p=1`; `p=0` | `H^i_Y=0` for `i<2codim Y`; `H^{i-2r}(Z)=0`; `2p>i`; `Y=X`, `Z=X`, `F⁰=` all | all three `0`, resp. all `H^i` |
| degree `2p`: `N^p=Ñ^p=` cycle classes | `Y` of codimension ≥`p`, `Y′` | `codim Y′≥p+1`, so `H^{2p}_{Y′}=H^{2p+1}_{Y′}=0`; `H^{2p}_Y≅H⁰(Y∖Y′)(-p)`, one class per codimension-`p` component | bidegree `(2p,p)` is §7.1's predicate |
| pushforward and product for `N`, `Ñ` | `dim X=n`, `dim Y=m`, support of dimension ≤`n-p` | image support of codimension ≥`p+m-n`; degree `i+2(m-n)`; product support of codimension ≥`p+q` | holds; equals ArapuraKang lines 52–56 |
| pullback for `N` | flat `f`; arbitrary `f` | flat: preimage keeps codimension (ArapuraKang lines 134–149); arbitrary: source proves it unconditionally, README only under the conjecture | R01 |
| Gysin description as hypothesis | `Y` of codimension ≥`p`, resolution components `Ỹ_j` | `c_j=d-dim Ỹ_j≥p`; kernel `=` Gysin image gives `N^p⊆Ñ^p⊆L^p`; DeligneHodgeIII lines 1264–1274, printed p.40 | holds; hypotheses match (proper smooth ambient, closed subscheme, resolution) |
| Check 1, `E³` with `τ³=2` | `Σa_jα^{3-j}β^j`, coefficient of `ω̄³` | `(a₀τ³-a₁τ²+a₂τ-a₃)/(τ-τ̄)³`; with `τ³=2`: `a₁=a₂=0`, `a₃=2a₀`; `L¹∩V` rational of dimension ≤1 and even, so `0` | holds |
| Check 2, curves and `ℙ^d` | genus 0 and 1; `ℙ^d` bidegree `(2j,p)` | `N¹H¹=L¹H¹=0`; `N¹H²=H²`; `N²H²=L²H²=0`; `ℙ^d`: both `ℚh^j` for `p≤j`, `0` for `p>j`; `F¹H¹(ℙ¹)=0` | predicate holds; R02 |
| Check 4, nodal cubic in `ℙ²` | `i=3`, `d=2` | `H³_Y(ℙ²)≅H_1(Y)=ℚ`; `H¹(ℙ¹)=0`; `H³(ℙ²)=0`, so exactness at `H³(ℙ²)` holds | holds |
| Line 45 contract | pinned `RationalSubstructure` module | `RationalHodgeSubstructure` l.75, `WC` l.85, `ofRationalMorphismRange` l.152, `Lattice` l.244, `BoundedOrder` l.248 | all exist |

The rows of the previous review for untouched statements stand as in the previous review, of `b8e693e`. None of the seeded sample targets falls in the changed passages.

- Source locators checked against the text: 7. ArapuraKang §1 p.1 (lines 36–43), Theorem 1.1 p.2 (lines 50–58) and its proof (lines 66–75); DeligneHodgeIII Propositions 8.2.5–8.2.6 on printed p.39 and 8.2.7, Corollaire 8.2.8 on p.40 (lines 1233–1274); Deligne's Clay text §2 (lines 104–107, 126–129) and its bibliography for Grothendieck's pages 299–303 (lines 200–201).
- Library declarations opened at the pin: 6 in Tau Ceti `Geometry/Hodge/RationalSubstructure` (above, with `WellFoundedLT` l.305) and `tate` with its filtration formula in `Geometry/Hodge/Tate/Basic` l.93–103.
- Cross-roadmap citations resolved: 2. ResolutionOfSingularitiesCharacteristicZero §5.2 on main (README line 801: reduced finite-type scheme in a smooth ambient, smooth strict transform, isomorphism over the regular locus); ComplexComparisonPartII §C5.3 at its open head (pure Hodge structure of weight `n` on proper smooth cohomology). Both are earlier in the merge order.
- Ownership: a search of main and the open heads for the generalized Hodge conjecture, the coniveau filtration on Betti cohomology and the level filtration finds no other owner. Geometric mixed Hodge theory appears only in roadmaps later in the merge order (MotivicEtaleKTheory, MixedHodgeModulesAndIrregularHodgeTheory), so taking Deligne's description as a hypothesis creates no upward edge.
- Overlap check: read the hits in SchemeKTheoryOperations (coniveau filtration on K-theory, lines 1420 and 1462, a different object), MotivicEtaleKTheory and EllipticKTheory; `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy; nothing shared.
- Gate at 6be1873: every counter zero, `OK`. Dependency check: `depcheck: 240 roadmaps, 2179 edges, 0 problem(s)`, no UPWARD or CYCLE line. Elaboration of `Suggested.lean`: four `sorry` warnings (lines 88, 102, 118, 141), nothing else; the file is unchanged since b8e693e, so the `#check` comparison of the previous review stands.
- Headlines: §7.1a adds predicates and inclusions on Betti cohomology with supports, which has no carrier at the pins; the Layer 7 bullet of the module docstring already names the cycle-conjecture implications as not statable. No statable headline is missing and nothing was added to probe for padding.
- Pull request text: no sentence of the title or description is contradicted by this head; the suppliers §7.1a uses (ComplexComparisonPartII, ResolutionOfSingularitiesCharacteristicZero) are already named there, and no section, declaration or supplier was removed. Remark, no change asked: the summary's list of formulated conjectures does not name the Hodge and generalized Hodge predicates.
- Source independence: changed passages only; 6 passages compared with 3 sources (ArapuraKang, DeligneHodgeIII, Deligne's Clay text), none shared beyond formulas; no layer was added, removed or reordered, so the arrangement was not compared again; Grothendieck 1969 could not be read.

## Not verifiable

- **Grothendieck 1969** (§7.1a, pp.299–303): the DOI resolves only to a paywalled page. The journal and page range agree with the bibliography of Deligne's Clay text; the cubic-period example of Check 1 was verified by computation, not against the paper.
- **KunnemannPicard** (§7.17): unchanged and outside the changed passages; carried from the previous report.

## Source issues

- **Misprint** in ArapuraKang at §1, p.1 of arXiv v1: the source says the Gysin description is Proposition 8.2.8 of Deligne's paper; it should be Corollaire 8.2.8; affects nothing.
- **Misprint** in ArapuraKang at the proof of Theorem 1.1(2), p.2 of arXiv v1: the source says the second class lies in the coniveau of the cohomology of `X`; it should be of `Y`; affects nothing.
- **Misprint** in ArapuraKang at §3, p.8 of arXiv v1: the source says the class may be assumed outside the next coniveau step of the cohomology of `X`; it should be of `Y`; affects nothing.

## For the human reviewers

- none
