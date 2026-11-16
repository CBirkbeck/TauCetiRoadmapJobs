<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6910839962 -->
Red team round 2 pass a (claude) of f7a0780

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.6 says a component `M₀^{a,ξ}` may be empty; every component is nonempty

   **Location.** `packages/PELModuliPartII/README.md:1344` ("A given `M₀^{a,ξ}` may be empty; M₀^a is
   nonempty when F/F⁺ is ramified at some finite place"), `:1363` ("a pair moduli problem built on
   `M₀^{a,ξ}` is empty when `M₀^{a,ξ}` is"), `:1369`, `:1429`, `:1445`, and Conventions `:133`.

   **Claim.** For a class ξ of pairs (Λ₀,⟨,⟩₀) the substack `M₀^{a,ξ}` can be empty.

   **Witness.** RSZ21 lines 658–668: the set of such pairs is in bijection with the isomorphism classes
   of M₀^a(ℂ). The pair itself gives the object: the torus (Λ₀⊗ℝ)/Λ₀ with the complex structure of Φ and
   the Riemann form ⟨,⟩₀. It contradicts the fourth API bullet of the same target (README:1355).

   **Repair.**

   - README:1344, replace the quoted sentence by: "Every `M₀^{a,ξ}` is nonempty and surjects onto Spec
     `O_{E_Φ}`: a pair (Λ₀,⟨,⟩₀) of class ξ gives the complex torus (Λ₀⊗ℝ)/Λ₀ with the complex structure
     of Φ and the Riemann form ⟨,⟩₀, an object of `M₀^{a,ξ}` over ℂ, and a nonempty stack finite étale
     over the connected Spec `O_{E_Φ}` is surjective. What can be empty is the set of classes, that is
     M₀^a itself; M₀^a is nonempty for every a when F/F⁺ is ramified at some finite place."
   - README:1363, replace the Check by: "Emptiness is a property of M₀^a, not of a component. For
     F⁺=ℚ(√3), F=F⁺(i)=ℚ(ζ₁₂) (unramified over F⁺ at every finite place, class number one) and Φ the two
     embeddings sending i to the same square root of −1, a principal polarization needs a purely
     imaginary ξ generating the inverse different (2√3)⁻¹ up to norms; these are ±i·η/(2√3·αᾱ) with η a
     totally positive unit, and √3 has opposite signs at the two real places, so none is Φ-positive:
     M₀^a is empty for a=`O_{F⁺}`, there is no class ξ, and every pair moduli problem over it is empty.
     Nonemptiness of M₀^a is a separate hypothesis wherever a component is selected."
   - README:1369 "a selected nonempty CM component ξ" → "a selected CM component ξ (so M₀^a is assumed
     nonempty)"; README:1429 "a chosen nonempty principal CM component" → "a chosen component of the
     principal CM moduli, assumed nonempty"; README:1445 "If the selected principal CM moduli component
     is empty, so is the pair moduli" → "If the principal CM moduli M₀ is empty there is no component
     to select and no pair moduli"; Conventions :133 "Nonempty CM components" → "A CM component (M₀^a
     being nonempty)".

   Tested on the instance: with the repaired text the ℚ(ζ₁₂) example has an empty index set and no
   empty component; for F imaginary quadratic the index set has one element (RSZ21 line 700) and the
   one component is nonempty.

2. **F02** (P2) §0.4 and §§4.3–4.4 use f-O-displays for an unramified extension; no target states them

   **Location.** `packages/PELModuliPartII/README.md:382` (§0.1 states only "For a finite totally
   ramified extension O⊂O′, strict formal O′-modules are equivalent to nilpotent windows over the
   Lubin–Tate O′-frame"), `:453` ("For K/K₀ unramified, contract the embedding-graded display by a full
   Frobenius round trip"), `:455`, `:983`, `:1004`.

   **Claim.** The contraction of an embedding-graded display along an unramified extension gives a
   strict formal O_K-module by "the O-display and Lubin–Tate window equivalences of §0.1".

   **Witness.** The contraction yields a window over `(W_O(R),I_O(R),F^f,F^{f−1}V⁻¹)`, not an
   O_K-display (Mih19 lines 569–571, 2180–2182; LL22 lines 1993–1995). Its equivalence with strict
   formal O′-modules is Mih19 Proposition 13.2 (lines 2193–2194), absent from §0.1.

   **Repair.**

   - README:382, after the Lubin–Tate sentence insert: "For a finite unramified extension O⊂O′ of degree
     f and an O′-algebra R in which π is nilpotent, the frame `A_{O′/O}(R)=(W_O(R),I_O(R),F^f,F^{f−1}V⁻¹)`
     has as windows the f-O-displays. For noetherian R, strict formal O′-modules over R are equivalent
     to nilpotent f-O-displays, and base change along W_O(R)→W_{O′}(R) is an equivalence from nilpotent
     f-O-displays to nilpotent O′-displays, compatible with duality after rescaling the pairing by a
     unit. (Mih19, §13, Definition 13.1 and Proposition 13.2, pp. 48–49.)"
   - §0.1 API, add: "For O⊂O′ unramified of degree f and noetherian R, strict formal O′-modules are
     equivalent to nilpotent f-O-displays, and these to nilpotent O′-displays."
   - §0.1 Checks, add: "For f=1 the frame `A_{O/O}(R)` is the Witt O-frame and both functors are the
     identity. For O=ℤ_p and O′=W(𝔽_{p²}), a strict formal O′-module of relative height 2 has a
     2-ℤ_p-display of rank 2 over W(R), while its p-typical display has rank 4."
   - README:455 "Use the O-display and Lubin–Tate window equivalences of §0.1" → "Use the O-display,
     f-O-display and Lubin–Tate window equivalences of §0.1"; README:983 after "pairing by μ" add "; the
     result is an f-ℤ_p-display with O_L-action, a strict formal O_K-module by §0.1".

   Tested: at f=2, n=2 (the Layer 4 Example) the contracted object has rank 2n=4 over W(R) with
   `(Ḟx,Ḟy)=F V⁻¹(x,y)` (LL22 line 2044 with f=2), a window over `A_{O_K/ℤ_p}(R)`, which the repaired
   §0.1 turns into the strict O_K-module of relative height 4.

3. **F03** (P2) §7.3 imposes `Exo_Φ(n,0)`, which no target defines, and omits its hypothesis

   **Location.** `packages/PELModuliPartII/README.md:1476` ("(A[v^∞],i,λ)∈Exo_Φ(n,0) at other ramified
   v|p"), `:1491` ("Omitting the banal Exo_Φ(n,0) condition at another ramified v|p changes the
   functor").

   **Claim.** The condition at the other ramified places is a defined object of the roadmap.

   **Witness.** §4.1 (README:947) defines only Exo_Φ(n−1,1), §3.1 only the relative Exo(n,0). The
   absolute category is LL22 Remark 2.67 (lines 2205–2210), for F⁺_v/ℚ_p unramified, which LL22
   Assumption 1.3 (lines 147–148) assumes at every ramified place.

   **Repair.**

   - §4.1 (README:947), append to the statement: "Define also Exo_Φ(n,0): p-divisible groups of height
     2nf and dimension nf with an O_L-action under which O_L acts on every summand of Lie, for all f
     embeddings, through the member of Φ above that embedding, and a compatible polarization with
     kernel X[i(u)]; arrows are as for Exo_Φ(n−1,1). (LL22, Remark 2.67, p. 44.)" Add the Check: "For
     f=1, Exo_Φ(n,0) is the relative Exo(n,0) of §3.1: height 2n, dimension n, and i(u)−u is zero on
     Lie."
   - §7.3 (README:1476): "a ramified quadratic distinguished place u with F⁺_u/ℚ_p unramified" → "a
     ramified quadratic distinguished place u, with F⁺_v/ℚ_p unramified at u and at every other place v
     above p that ramifies in F (LL22, Assumption 1.3, p. 4)"; and "∈Exo_Φ(n,0)" → "∈Exo_Φ(n,0) of §4.1,
     for the local type Φ_v".

   Tested on f=1: the added definition returns §3.1's Exo(n,0). With a second ramified place v above p
   and F⁺_v=ℚ_p(√p), the embedding decomposition of §4.1 does not exist; the repaired hypothesis
   excludes it.

4. **F04** (P3) §0.2 states representability of functors that are defined only in later layers

   **Location.** `packages/PELModuliPartII/README.md:410` ("Consequently the functors N_n of Layer 1,
   N¹_n of Layer 2, N^exo of Layer 3 and N_n^Kra of Layer 5 are represented by separated formal
   schemes"), and "The space Ñ_n of Layer 2 is closed in `N¹_n×N_{n+1}`".

   **Witness.** These functors are defined in §§1.1, 2.1, 2.4, 3.3 and 5.3, whose `*Needs:*` lines
   (README:565, 701, 760, 848, 1134) list §0.2: §0.2 ↔ §1.1 is a cycle inside the roadmap, and §§1.2,
   3.3 state the same representability again.

   **Repair.** Replace the passage from "Consequently the functors" through "cut out by the Krämer
   conditions." by: "Consequently, for a quadratic extension L/K and a biformal framing object with
   O_L-action over the residue field of O_L̆, every functor obtained from the EL functor 𝓜 for B=L,
   O_B=O_L and a single lattice, applied to the underlying p-divisible group of the framing object, by
   finitely many conditions of the following kinds is represented by a separated formal scheme locally
   formally of finite type over Spf O_L̆ (O_L̆=O_K̆ when L/K is unramified): closed conditions
   (strictness of §0.1; a determinant, Eisenstein or wedge equation on Lie; that the lift of a relative
   quasi-polarization is an isogeny; a kernel condition on it), open and closed conditions (a height or
   a degree), open conditions on Lie at geometric points, and the adjunction of an O_L-stable summand of
   Lie X cut out by closed conditions in a Grassmannian bundle. A closed subfunctor of a product of two
   such functors is again of this kind. §§1.2, 2.2, 2.4, 3.3 and 5.3 apply this criterion." Delete "The
   space Ñ_n of Layer 2 is closed in `N¹_n×N_{n+1}`" (it is §2.4), and in the Scope (README:24–25) write
   "and the representability criterion that Layers 1–5 apply to their unitary framed functors (§0.2)".

5. **F05** (P3) Conventions: "relative height 2n … the strict object then has dimension n"

   **Location.** `packages/PELModuliPartII/README.md:103–105`: "Relative height 2n means absolute
   p-height 2n[K:ℚ_p], and the strict object then has dimension n".

   **Witness.** The Lubin–Tate O_K-module of relative height 2n is strict of dimension 1, not n, for
   n≥2; the README's own §0.2 Check (README:418) uses a strict module of relative height 2 and
   dimension 1 beside objects of dimension [K:ℚ_p].

   **Repair.** "Relative height 2n means absolute p-height 2n[K:ℚ_p]. The unitary objects of this
   roadmap of relative height 2n have dimension n by definition (§0.3); the height does not imply it
   (the Lubin–Tate O_K-module of relative height 2n has dimension 1). Forgetting the O_K-action keeps
   the Lie algebra, so the underlying p-divisible group has the same dimension."

6. **F06** (P3) §3.4: the local-model smoothness has no locator of its own

   **Location.** `packages/PELModuliPartII/README.md:852–856`: "(LL22, §2.1, Lemma 2.4 and its proof,
   p. 10.)" and "the local-model smoothness invoked in the proof of LL22 Lemma 2.4".

   **Witness.** LL22 lines 439–441 give no argument: the proof refers to another paper for the
   smoothness of the local model. The step is in a cached text: RSZ21 lines 1415–1416 (type (e)),
   1444–1445 and 1490–1493.

   **Repair.** Extend the locator to: "(LL22, §2.1, Lemma 2.4 and its proof, p. 10; RSZ21, Theorem
   5.4(e) with its proof, pp. 26–27, and the proof of Theorem 5.7, p. 28, for the smoothness of the
   π-modular local model of signature (n−1,1) with the wedge and spin conditions, which rests on
   Pappas–Rapoport, Local models in the ramified case III, §5.3.)" The same locator serves the first
   sentence of the Route of §7.7 (README:1555).

Three P2 findings (S01–S03) and three P3 findings (S04–S06). No P1. All nine round-1 findings are
repaired at this head and no repair introduced an error. `Suggested.lean` states nothing, which is
correct at the pins.

## Round-1 findings at this head

| Round-1 id | Status | Repaired passage (witness) |
| --- | --- | --- |
| 1a/F01, 1b/F01 (§3.7 lattices) | repaired | `packages/PELModuliPartII/README.md:911`: "Λ is a vertex lattice when Λ⊆Λ^∨ and uΛ^∨⊆Λ, that is Λ^♯⊆Λ⊆u⁻¹Λ^♯, and its type is t(Λ)=dim_k(Λ^∨/Λ)". Agrees with LL22 lines 518–530 and 1102–1106. Recomputed at n=2 below. |
| 1a/F02, 1b/F02 (display gap) | repaired | README:251 and `design/plan.json` (`gaps`, same slug, same sentence): "For every ring R in which p is nilpotent, define displays over R with their base change and duals and the functor BT …". README:39–41 agrees. |
| 1a/F03 (strict modules, second owner) | repaired | README:42–46, 253–260, 392: "The rank of P is the O-relative height of X of HilbertModularVarietiesAndShimuraCurves §R18.5.4". That section states the strict action, rank X[π]=q^h, height_p=[K:ℚ_p]h and the relative height of an O_K-linear quasi-isogeny, as cited. |
| 1a/F04 (special inert) | repaired | README:1635: "𝔭 is a prime of F⁺ that is inert in F, the rational prime p below it is odd and unramified in F, and F⁺_𝔭=ℚ_p". Agrees with LTXZZ22 lines 1293–1296. |
| 1a/F05 (LTXZZ22 note) | repaired | The sentence is gone from README:2050–2059; §8.2 keeps "rank N≥1", consistent with LTXZZ22 line 2652 (the N=1 case is treated). |
| 1a/F06 (three Checks) | repaired | README:521 (§0.7), :825 (§3.2), :1231 (§5.9). Each recomputed below. |
| 1a/F07 (page ranges) | repaired | README:1369 "Definition 3.9 and Remarks 3.11–3.12, pp. 13–14; §4.1, pp. 17–19" (RSZ21 lines 766, 804, 809, 940); README:453 "pp. 12–18"; README:1860 "pp. 58–60". |
| 1b/F03 (minimal cover) | repaired | README:909: "through which every other such triple (Y,α₁,α₂) factors: α₁=ρ₁∘β and α₂=ρ₂∘β for a unique isogeny β:Y→X̃". |
| 1b/F04 (LTXZZ models, consumer) | repaired | README:1988–1993: "That roadmap requests them from ShimuraVarieties in its supplier contract named native-shimura; ShimuraVarieties does not state them, and their owner is this roadmap." The consumer's contract still reads so at its open head. |

New errors introduced by the repairs: none found. The added statements were recomputed (rows marked
"r1" in the table under Verified sound).

## Verified sound

**Counts.** Declarations read: 0 of 0 (`Suggested.lean`, 39 lines, read whole). Targets read: 75 of
75 (README read whole, 2091 lines). Locators verified against the cached texts this pass: 74 (LL22
30, RSZ21 11, RZ96 8, HLSY23 8, LZ22 6, LTXZZ22 4, Mih19 4, Zhang21 2, LL21 1). Checks tested by
computation: 31 (table below). Sibling citations checked: 62 section ids for existence at main or at
the open heads, 9 read for content (HilbertModularVarietiesAndShimuraCurves §R18.5.4; PELModuli
§§M0.10, M2.15, M4.7; IgusaVarietiesAndTorsionConcentration §§0.27, 0.31; AdicSpacesPartIII §R2.9;
GeometryOfNumbersAndQuadraticArithmetic §2.7; SelmerIwasawaCohomologyPartII, contract
native-shimura). Pinned declarations grepped: 14, all present in the files the README names.

**Declarations of `Suggested.lean`.** None: one `import Mathlib`, one module docstring, an empty
namespace `TauCetiRoadmap.PELModuliPartII`. No `set_option`, no `lemma`, no `#check`. The `#check
@name` audit has nothing to elaborate; I ran no Lean and nothing changed.

**Headline theorems and padding.** Headlines (README:11–16): §§1.2, 2.2, 3.4, 3.7, 5.7 (local
spaces), §6.6 (CM moduli), §§7.6–7.9, 8.4, 8.7 (global models), §§9.5–9.10 (uniformization), and
§9.1. The docstring names each with the carrier it lacks. At the pin: Tau Ceti's
`AlgebraicGeometry/FormalScheme/Spf/` has four files (carrier, structure sheaf, completed
neighbourhood, independence of the ideal) and no morphisms; no p-divisible group or abelian scheme
(`TauCeti.AlgebraicGeometry.AbelianVariety` is over a field); `TauCeti.TateModule` is the Tate
module of an abelian group, as the docstring says. None is statable; nothing is padding.

**Dependency check.** Output: `depcheck: 254 roadmaps, 2411 edges, 0 problem(s)`. No UPWARD, CYCLE
or moved line. AdicSpacesPartIII, SchemeAndStackFoundations, ReductiveGroupsPartII,
AbelianSchemesAndArithmeticModuli, AdelicAlgebraicGroups and AlgebraicModuliForArithmeticGeometry are
on main; the other suppliers are earlier in the merge order. `git diff --stat origin/main...HEAD`
shows changes only under `packages/PELModuliPartII/`.

**Declared gaps.** Four slugs, the same in `design/plan.json` and under Exact supplier contracts,
each with a named supplier whose section exists. Not raised. `gap:hermitian-local-global` is not
already supplied: no roadmap on main or open states existence of global hermitian spaces with
prescribed invariants (`roadmaps grep`), and SelmerIwasawaCohomologyPartII addresses the same slug to
the same supplier.

**Ownership.** `roadmaps grep` for the exotic categories and the Krämer model finds no other owner.
No declaration name is shared (the file declares none). Ownership against open pull requests was
checked through `roadmaps grep` and `roadmaps show` at the indexed heads.

**Policy.** No pull-request number, no `lemma`, no `set_option`, every target has a locator; the
README has no process narrative ("corrected" at README:1960 and :2014 refers to source errata).

**Adversarial table** (statement; instances; values on each side; result; change).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 ghost identity for V | n=1,2 | w₁(Vx)=π·x₀; w₂(Vx)=π·x₀^q+π²x₁=π·w₁(x) | pass | none |
| §0.1 π↦−π | q odd, x_i↦(−1)^i x_i | (−1)^(i·q^(n−i))=(−1)^i, so ghost maps match; w₁(Vx) changes sign | pass | none |
| §0.1 biformal ⇔ no slope 0, 1 | height 1 dim 1; height 2 dim 1 | dual dimension 0 (étale); 1 (slopes ½) | pass | none |
| §0.1 API rank P (r1) | K=ℚ_p(√p), relative height 1 | rank X[π]=p, p-height 2=[K:ℚ_p]·1 | pass | none |
| §0.1 unramified frame | f=1; f=2 | Witt O-frame; `(W,I,F²,FV⁻¹)`, not a target | missing | S02 |
| Conventions, heights | Lubin–Tate, relative height 2n | dimension 1≠n for n≥2 | overclaim | S05 |
| §0.2 parameter count | [K:ℚ_p]=1,2 | 1·(2−1)=1; 1·(4−1)=3; N₁ has 0 | pass | none |
| §0.2 build order | N_n, N¹_n, N^exo, N^Kra | defined at §§1.1, 2.1, 3.3, 5.3, which need §0.2 | cycle | S04 |
| §0.4 degree of P(r,s) | [K:K₀]=ef | deg P₀₁=fe; deg P(r,s)=nef; (T−ā) divides P₀₁ | pass | none |
| §0.4 μ-ordinary | (1,0), (1,1) | slopes ½,½; 0,0,1,1 | pass | none |
| §0.7 Check (r1) | n=3, (1,2), i′=i∘conj | (T−ā)(T−a)²; λi′(a)=i′(ā)^∨λ | pass | none |
| §1.6 dimensions | n=2,3,4 | relative (0,1),(1,3),(2,5); arithmetic (1,2),(2,4),(3,6) | pass | none |
| §2.3 invariants | W_n split, x₀ of norm ϖ | even valuation; +1 odd, nonsplit V_(n+1) | pass | none |
| §2.4 degree of α | q=3 | (deg α)²=9·9, deg α=9; 27²≠81 | pass | none |
| §2.5 degree of π₁ | isotropic lines of a hermitian plane over 𝔽_(q²) | q+1; q=3 gives 4 | pass, LZ22 line 2872 | none |
| §3.2 Check (r1) | ū=−u | λ^∨=i(u)^∨σ=σi(ū)=−λ; orders q^n, q^(2n) | pass | none |
| §3.7 dual (r1) | L/K ramified, p odd | different (u); Λ^∨=u⁻¹Λ^♯ | pass, LL22 line 520 | none |
| §3.7 type parity (r1) | normal basis, a_i∈{0,1} | t = number of unit-norm vectors ≡ n mod 2; t=0 forces a split space | pass, LL22 lines 558, 567 | none |
| §3.7 n=2 (r1) | ⟨1⟩⊥⟨−ε⟩, ε nonsquare unit | Λ₀^♯=Λ₀, t=2, dim 0; uΛ₀: quotient of length 4, not killed by u | pass | none |
| §3.7 κ₂ (r1) | ρ iso; K unramified of degree 2 | κ₂=0; absolute height = 2·relative, always even | pass | none |
| §4.3 μ | f=1, 2 | empty product, μ=1; F²(μ)/μ=ε₁ | pass, LL22 line 1915–1921 | none |
| §5.2 fixed lattice | M(Y)=O_L̆e | VM=i(u)M; (e,e)=δ⟨Πe,e⟩ unit; (ue,ue)=−u²(e,e) | pass | none |
| §5.4 trace recovery | A=⟨Πx,y⟩, B=⟨x,y⟩ | Tr(u⁻¹δ(A+uB))=2δB | pass, HLSY23 line 465 | none |
| §5.9 Check (r1) | λ_Y↦cλ_Y, c=2 | h↦c⁻¹h, (e,e)_Y↦c(e,e)_Y; product invariant; with the inverse, factor ¼ | pass | none |
| §6.1 reflex field | n=2 | σ fixes Φ and {φ₀,φ̄₀}, so σφ₀=φ₀ | pass | none |
| §6.4 unramifiedness | split and inert types | stabilizer of Φ contains inertia of ℚ_p | pass | none |
| §6.6 components | ℚ(ζ₁₂)/ℚ(√3); imaginary quadratic | empty index set; one class, nonempty | fails as worded | S01 |
| §6.6 Check on k[ε] | R[x]/(x²) | (x+α)∋x² iff α²=0, α=εc | pass | none |
| §6.6 Check on units | c=1+√2 | c²=3+2√2, c⁴=17+12√2, c⁻¹=√2−1 | pass | none |
| §6.8 parity | n=3, r_φ=2 | 3·1−2=1; 0−2=−2 | pass | none |
| §7.3 conditions | f=1; second ramified v with F⁺_v ramified | Exo_Φ(n,0) undefined in the README; no embedding decomposition | missing | S03 |
| §7.6 good primes | residue characteristic unramified in F⁺, prime to d | unramified in F, Λ₀⊕Λ self-dual: good for PELModuli §M0.10; ℚ(ζ₁₂), p=3: 3 divides the discriminant | pass | none |
| §7.7 Meyer | F⁺=ℚ, n=4 | signature (6,2), 8 variables | pass | none |
| §8.1 special inert (r1) | F⁺=ℚ(√2), F=ℚ(ζ₈), p=7 | 3²≡2, −1 nonsquare mod 7 | pass | none |
| §8.4 crossing ring | N=2 | x₁x₂−p∉𝔪², dimension 2 | pass | none |
| §8.6 degree | q=3 | 9·9=(deg α)² at v₀; LZ22 line 3593 prints a smaller degree | pass, README note stands | none |
| §9.1 general K | u with ord_𝔭(u)=m·slope, uū=q^(2m) | Frob^(2m)/u a unit of absolute value 1 in a product of CM fields: a root of unity | pass | none |
| §9.1 Checks | supersingular E; ordinary E; conjugated CM | 4=4; 2≠4; 0≠2 | pass | none |
| §9.2 lattice Check | H=(0,1,0;1,0,0;0,0,3) | duals as stated, lengths 3,3,1; det −3 odd, nonsplit; gΛ₋=Λ₊ | pass | none |
| §9.2 hypotheses | torsion-free discrete Γ | point stabilizers compact, so finite, so trivial | pass, RZ96 lines 2380–2411 | none |
| §9.6 scalar | val_u(ϖ)=1, 0 | u²/ϖ unit; valuation 1 | pass | none |

**Wording and arrangement.** 24 passages set beside 9 sources at their locators: LL22 Definition 2.1,
Remark 2.2, Definitions 2.10, 2.27, Proposition 2.28, Definition 2.59, Lemma 2.60, Notation 4.19, the
pairing of §4.5; HLSY23 Definition 2.2 and §2.2; RZ96 Propositions 2.34–2.37, Lemma 6.28, Corollary
6.29, Theorem 6.30; RSZ21 §3.4 and Theorems 5.4, 5.7; Zhang21 §6.2 and Definition 6.1; LZ22 §§10.1,
10.2, 13.1, 13.4; LTXZZ22 Definition 5.2.1 and Theorem 5.2.5; LL21 Notation 5.6; Mih19 §13. The
longest shared runs are 8 or 9 words (LL22 line 426; RZ96 line 2407), each a statement that can be
written one way. No table, figure or list of examples is taken over. LL22 has the largest share (43
of 245 mentions of a source id in the layers). Its contents against the layers: Layer 3 uses its
§§2.1 and 2.3, Layer 4 its §2.8, §§7.3, 7.7 and 9.6 its §4.5; Layers 0–2 and 5–9 have no counterpart
there. Inside Layer 4 the order is forced by the `*Needs:*` lines of §§4.2–4.6.

Source independence: 24 passages compared with 9 sources, none shared; largest share LL22, 43 of 245 locators; contents compared with LL22: independent.

## Not verifiable

- The primary sources of the exotic local-model smoothness (the paper LL22 line 440 refers to, and
  Pappas–Rapoport III §5.3) are not in the cache; S06 points to the cached RSZ21 passages only.
- Published page numbers of Zhang21 and LTXZZ22: the cached texts are the arXiv versions. Item
  numbers were checked, pages were not.
- In the LTXZZ22 extraction fraktur 𝔭 and p are the same glyph (LTXZZ22 line 2617); "A[𝔭]" in §8.2
  rests on the mathematics, as the round-1 repair says.
- Wu16, Cho18, Kraemer03, Howard19, RZ17, RSZ20 and LRZ26: not reopened in this pass; their locators
  stand on round 1.
- LL22 Remark 2.67 says that the absolute and relative Exo(n,0) can be shown to agree, without proof;
  the repair of S03 takes only the definition from it.
- Supplier sections beyond the nine read were checked for existence and heading only.

## Source issues

- **Error** in LZ22 at §13.4, item (3), p. 82: the source says the global isogeny has degree the residue cardinality at v₀; it should be its square, since both source polarization factors have that degree and the target is principal; affects nothing.
- **Misprint** in LZ22 at Remark 10.2.1, p. 65: the source says W_n and V_(n+1) for the spaces spanned by the level lattices; these have the opposite invariants to the special-Hom spaces of §§10.1–10.2 bearing those names; affects nothing.
- **Error** in RZ96 at Corollary 6.29, printed p. 293: the source says the K-linear Hom comparisons hold for two objects each satisfying Lemma 6.28; it should require the two 𝔭-parts to be isoclinic of one common slope; affects a stated result.
- **Misprint** in LL22 at §4.5, the moduli description, p. 66: the source says the exotic conditions hold for the p-divisible group of the CM factor; it should be that of the unitary factor, which has the required height; affects nothing.
- **Gap** in LL22 at footnote 8, p. 10: the source says the cited results over ℚ_p hold over every p-adic field, without argument; it should give the relative Dieudonné-theoretic proof; affects a stated result.
- **Gap** in HLSY23 at Definition 2.2(2), p. 10: the source says the framing is a height-zero linear quasi-isogeny, with no polarization condition; it should require the framing polarization to pull back to a unit multiple; affects nothing.

## For the human reviewers

- **Licence.** RZ96 is read from an author-hosted scan of a Princeton University Press book (`packages/PELModuliPartII/sources.toml`, id RZ96, `licence_class = "author-page"`); LL21, LL22 and RSZ21 are author copies of published articles.
- **Not tested.** Published pagination of Zhang21 and LTXZZ22 was not compared: the README cites published pages, the cached texts are the arXiv versions.
- **Scope.** §9.9 (README:1947) says no cited text states the comparison of Krämer completions with the filtration; §5.6 at n=2 is the roadmap's own computation; §3.7 over a general p-adic field rests on LL22 footnote 8.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f7a07804dd74ae15e38c878a8c62934e5ecbe7c3", "job": "RT-PELModuliPartII~2a", "model": "fable", "worker": "chris-x26"} -->
