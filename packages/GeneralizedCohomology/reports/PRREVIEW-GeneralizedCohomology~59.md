# Review of GeneralizedCohomology (pull request #1807 at 78fe8c3)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/GeneralizedCohomology/` at 78fe8c3: `README.md` (4932 lines) and `Suggested.lean` (159 lines, six theorems). The folder changed by 832 lines since f6de6b4.

**Checks re-run on this head.**

- **Gate.** The worker's gate passes. My re-run reports only `outside-folder` 26. All 26 files are in the 13 sibling folders this pull request owns. `git diff --stat origin/main...HEAD` outside those 14 folders is empty, so this is not a finding.
- **Dependency check.** `depcheck: 234 roadmaps, 2294 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` gives six `sorry` warnings and nothing else (17 s).
- **Signatures.** Since f6de6b4 only the docstrings changed in `Suggested.lean`.

## Previous review (f6de6b4): status of R01–R09

| Id | Status at 78fe8c3 | Evidence |
|---|---|---|
| R01 second HPⁿ carrier | repaired | README 56–60, 272–289 and 103–106 consume Tau Ceti's HPⁿ. G4.0a (2790–2799) builds HPⁿ ≃ Gr_ℍ(1,n+1) from `mk_eq_mk_iff` and `isOpenQuotientMap_mk`. G4.0b (2958–2966) consumes `instChartedSpace` and `instIsManifold`. I checked the chart convention at the pin: `ratio k j = X_j X_k⁻¹` (`Charts.lean:50`) and `affineChart k p j = ratio k (k.succAbove j) p` (`Charts.lean:174`). So README's `ratio 1 0 = X₀X₁⁻¹` and `[v₀:v₁] ↦ v₀v₁⁻¹` agree with Tau Ceti. |
| R02 second owners in open PRs | repaired as far as this pull request can | The description now names #1901, #866 and #1798 and says what each cites. Their heads still state the objects: HigherToposTheory README 36, OperatorKTheory README 1142 and 2332, DGFloer README 1490. GeneralizedCohomology is on main. There it already owns the Kan–Quillen structure and `numerableFiberBundle_hurewicz` (main README 220 and 651). It may not consume OperatorKTheory, which is not on main, so G5.5 must own the graded Clifford conventions. The remaining edits belong to those three pull requests. |
| R03 docstrings | repaired | `Suggested.lean` 22–27 states the Dᵒᵖ instance, 45–49 names the missing telescope and connecting map, 50–52 names the missing products and Thom spaces, and 144–145 covers k = 0 and k = 1. README G3.3's third API bullet (2309–2314) has the Dᵒᵖ remark. |
| R04 missing locators | repaired | All the new locators were checked at their texts; see Sources below. |
| R05 May §1 / Dold refinement | partly repaired | May is now "Chapter 23, §1, p. 189 … proof sketch". The replacement source, Hatcher VBKT Lemma 1.21, does not support the generality claimed for it (R03 below). |
| R06 G3.7 compactness Check | repaired | README 2482 uses the `∏_n ⊕_m ℤ` versus `⊕_m ∏_n ℤ` computation. |
| R07 Tau Ceti tubes and metrics | repaired | README 306–321, G5.2 *Needs:*, G5.7 4712–4724; DifferentialGeometry 12.1 is gone (grep). |
| R08 API lists and Checks | mostly repaired | All 43 sections have `**API.**` and `**Checks.**` (grep counts 43 and 43). G2.11 has 13 Checks and G5.7 has 6. G5.5 still has none for its configuration model and MU→Hℤ orientation (R05 below). |
| R09 missing spaces | repaired for the listed strings | Ten new instances (R06 below). |

## R01 (P2) — Homotopy excision is statable at the pins, but the docstring lists it as not statable

**Location.** `Suggested.lean` 37–38: "the Freudenthal suspension theorem and homotopy excision (G2.5): there is no topological reduced suspension of pointed spaces and no suspension homomorphism on homotopy groups". README G2.5 916–921 and API bullet 993–994 state homotopy excision for CW triads (Hatcher, Theorem 4.23).

**Claim.** The stated reason covers only Freudenthal. Homotopy excision needs relative homotopy groups and subcomplexes, not a suspension. Both exist at the pins. The file names it as a headline, so leaving it out is a statable headline that is absent. The description's sentence "names each headline theorem that is not statable at the pins with the carrier it lacks" is wrong for this item.

**Witness.**
- Tau Ceti `TauCeti.RelHomotopyGroup N X` (`AlgebraicTopology/Homotopy/Relative/Basic.lean:302`), π_(|N|+1)(X,A,a₀), with `map` (356) and `functor` (386).
- Its carrier `TauCeti.BasedTopPair` (`Topology/Category/BasedTopPair.lean:41`).
- Mathlib `Topology.RelCWComplex.Subcomplex` (`Topology/CWComplex/Classical/Basic.lean:659`).
- The probe below elaborates with one `sorry` warning.

**Repair.**
1. Add this to Layer 2 of `Suggested.lean`. It is tested at universe 0 against the pins, with docstrings shortened here:

```lean
/-- The based pair `(S, T, t)` for `T ⊆ S ⊆ X`. -/
noncomputable def subPair {X : TopCat.{0}} (S T : Set X) (hTS : T ⊆ S) (t : T) :
    TauCeti.BasedTopPair.{0} where
  pair := TopPair.ofSubset (X := TopCat.of S) {s : S | (s : X) ∈ T}
  basepoint := ⟨⟨t.1, hTS t.2⟩, t.2⟩

/-- The inclusion of based pairs `(S, T, t) → (S', T', t)`. -/
noncomputable def subPairIncl {X : TopCat.{0}} {S T S' T' : Set X} (hTS : T ⊆ S)
    (hTS' : T' ⊆ S') (hS : S ⊆ S') (hT : T ⊆ T') (t : T) :
    subPair S T hTS t ⟶ subPair S' T' hTS' ⟨t.1, hT t.2⟩ where
  toTopPairHom := TopPair.ofHom
    (TopCat.ofHom ⟨fun s : S => (⟨s.1, hS s.2⟩ : S'), by fun_prop⟩)
    (TopCat.ofHom ⟨fun s => ⟨⟨s.1.1, hS s.1.2⟩, hT s.2⟩, by fun_prop⟩) (by ext; rfl)
  map_basepoint := rfl

/-- `(S, T)` is `m`-connected. -/
def IsConnectedPair {X : TopCat.{0}} (S T : Set X) (hTS : T ⊆ S) (m : ℕ) : Prop :=
  (∀ s ∈ S, ∃ t ∈ T, JoinedIn S s t) ∧ ∀ (t : T) (i : ℕ), i + 1 ≤ m →
    Subsingleton (TauCeti.RelHomotopyGroup (Fin i) (subPair S T hTS t))

/-- Homotopy excision (Hatcher, Theorem 4.23, p. 360). -/
theorem homotopyExcision {X : TopCat.{0}} [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    (A B : Topology.RelCWComplex.Subcomplex (Set.univ : Set X))
    (hAB : (A : Set X) ∪ B = Set.univ) (hC : IsConnected ((A : Set X) ∩ B)) (m n : ℕ)
    (hA : IsConnectedPair (A : Set X) (A ∩ B) Set.inter_subset_left m)
    (hB : IsConnectedPair (B : Set X) (A ∩ B) Set.inter_subset_right n)
    (c : ((A : Set X) ∩ B : Set X)) (i : ℕ) :
    (i + 1 < m + n → Function.Bijective (TauCeti.RelHomotopyGroup.map (N := Fin i)
      (subPairIncl (S' := Set.univ) Set.inter_subset_left (Set.subset_univ (B : Set X))
        (Set.subset_univ _) Set.inter_subset_right c))) ∧
    (i + 1 = m + n → Function.Surjective (TauCeti.RelHomotopyGroup.map (N := Fin i)
      (subPairIncl (S' := Set.univ) Set.inter_subset_left (Set.subset_univ (B : Set X))
        (Set.subset_univ _) Set.inter_subset_right c))) := by
  sorry
```

2. Add `import TauCeti.AlgebraicTopology.Homotopy.Relative.Basic`.
3. Shorten the docstring item to "the Freudenthal suspension theorem (G2.5): …".
4. In README G2.5 and its API bullet, name `homotopyExcision`.
5. Add `TauCeti.BasedTopPair` and `TauCeti.RelHomotopyGroup` (π_(i+1) is `RelHomotopyGroup (Fin i)`) to "From Tau Ceti" and to G2.5's *Needs:*. Add Mathlib `Topology.RelCWComplex.Subcomplex` to "From Mathlib".
6. Degenerate check: for m = n = 0 the statement asserts nothing, as in Hatcher.

## R02 (P2) — G5.3 states an integral homology Thom isomorphism for every bundle diagram; its own Check refutes it

**Location.** README 3657–3658 (G5.3 API): "Its homotopy groups are the colimits of the stable groups of the finite stages, and its homology satisfies the Thom isomorphism with the bases."

**Claim.** The bullet fixes no coefficients and no orientation hypothesis, and G5.3's diagrams need not be oriented.

**Witness.**
- G5.3's own Check (3667) gives `π₀MO = ℤ/2`.
- MO is connective, so Hurewicz gives `H₀(MO;ℤ) = ℤ/2`, but `H₀(BO;ℤ) = ℤ`.

**Repair.** Replace the bullet with: "Its homotopy groups are the colimits of the stable groups of the finite stages. For a commutative ring A and a diagram whose bundles carry compatible A-orientations, `H_n(Mξ;A) ≅ H_n(hocolim_i B_i;A)`. Every diagram is 𝔽₂-oriented; ℤ-orientations need compatibly oriented bundles." Add the Check "`H₀(MO;ℤ) = ℤ/2` while `H₀(BO;ℤ) = ℤ`, so the integral Thom isomorphism needs an orientation".

Tested on the instances:
- MO with ℤ coefficients is excluded.
- MO with 𝔽₂ coefficients gives 𝔽₂ = 𝔽₂ in degree 0.
- MSO with ℤ coefficients gives ℤ = ℤ.

## R03 (P3) — G3.5 claims Hatcher's refinement lemma holds for every numerable cover, but its proof uses paracompactness

**Location.** README 2387–2391: "Hatcher, *Vector Bundles and K-Theory*, Lemma 1.21, p. 37 … stated for paracompact spaces, whose proof uses only a partition of unity subordinate to the cover and so applies to every numerable cover".

**Claim.** The lemma is right at p. 37, but its proof does not support this generality, in two places.
- Its second clause takes a partition of unity subordinate to `{V_k}`, which uses paracompactness of X again.
- Its first step fails when the partition is finite.

**Witness.** `HatcherVBKT` lines 1470–1480.
- Line 1478 starts with "let {ϕγ} be a partition of unity subordinate to the cover {Vk}".
- For the two-arc cover of S¹ with ϕ₁ + ϕ₂ = 1, the set S = {1, 2} gives `V_S = S¹`, which lies in neither arc.

**Repair.** Replace the clause after "stated for paracompact spaces" with an explicit construction for a numerable cover with partition (ϕ_β):
- `f_S = max(0, min_(β∈S) ϕ_β − max(0, max_(β∉S) ϕ_β))` is positive exactly on V_S. That set lies in the cover member of any β ∈ S.
- `g_k = Σ_(|S|=k) f_S` is locally a finite sum, since near x only k ≤ #{β : ϕ_β ≢ 0 near x} occur.
- `g_k/Σ_j g_j` is a partition of unity whose positivity sets are exactly the V_k.

Tested on the two-arc cover:
- `V₁ = {ϕ₁ ≠ ϕ₂}` is the disjoint union of two pieces, each inside one arc.
- `V₂ = {ϕ₁ > 0, ϕ₂ > 0}` lies in both arcs.
- At ϕ₁ = ϕ₂ = ½ the point lies in V₂, so the V_k cover S¹.

Alternatively, cite Dold (1963) for numerable covers, after verifying the locator.

## R04 (P3) — Four citations of "T7.1's eight stable Bott equivalences" name an export TopologicalKTheory no longer makes

**Location.** README 82 ("the eight stable Bott equivalences remain in TopologicalKTheory"), 360, 3506 and 3773 ("consuming TopologicalKTheory T7.1's eight stable Bott equivalences on ℤ×BO").

**Claim.** This is supplier drift. At this head, TopologicalKTheory exports one eightfold equivalence. It builds no chain of eight equivalences and leaves any comparison with one to "the roadmap that constructs such a chain".

**Witness.** TopologicalKTheory README 1754–1765 ("Export the eightfold stable Bott equivalence on ℤ×BO … no chain of eight single-loop equivalences is constructed") and 204–217. At f6de6b4 its line 201 still spoke of "the eight stable Bott maps".

**Repair.** At all four places write "TopologicalKTheory T7.1's eightfold stable Bott equivalence ℤ×BO → Ω⁸(ℤ×BO) (the product with b) and its coefficient ring". I checked that each use needs no more than this:
- G5.0's `π_i`, i ≤ 8, is ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ, read from the coefficient ring.
- G5.4's KO structure maps need only the 8-periodicity.

## R05 (P3) — G5.5's configuration model, Hermite embedding and MU→Hℤ orientation have no Check (residue of the previous R08)

**Location.** README 4283–4312 (Λ(A,U), the levels Λ(Sⁿ,U_n)), 4313–4320 (the Hermite embedding U_n → H_n^even) and 3866–3878 (complexThomOrientation_to_HZ). The seven Checks at 4391–4397 test the Clifford matrices, the sign adapter, K_op, Λ(ℝ), the √2 norm and A = ℝ, but none of these three.

**Claim.** The house rule asks for three discriminating Checks per definition.

**Witness.** In 4391–4397, Λ occurs only as the exterior algebra Λ(ℝ) of the neutral Clifford module (4395). A grep for the configuration space Λ(A,U), Hermite, h_ and complexThomOrientation returns nothing.

**Repair.** Add these Checks:
- **Configuration model.** For the based set 2₊, Λ(2₊,ℂ^∞) consists of pairs of mutually orthogonal finite-dimensional subspaces, with `π₀ = ℕ²`. The fold map 2₊ → 1₊ sends a pair to its orthogonal sum, so the Segal map is a bijection on π₀. Without orthogonality, `dim(U₁ + U₂) < dim U₁ + dim U₂` can occur, and the sum fails.
- **Hermite embedding.** `h₀ = π^(−1/4) e^(−x²/2)` has `∫h₀² = π^(−1/2)∫e^(−x²) = 1` and is even. `h₁ = π^(−1/4) √2 x e^(−x²/2)` has norm 1 and is odd. So z^α ↦ h_α would meet the odd part, and only h_(2α) lands in H_n^even.
- **MU→Hℤ orientation.** complexThomOrientation_to_HZ is the identity ℤ → ℤ on π₀ (muCoefficientZeroIso), and zero on `π₂MU = ℤ` since `π₂Hℤ = 0`. It sends x_MU to h_AT; the opposite normalization would give −h_AT.

## R06 (P3) — Missing spaces and one notation clash

**Location and repair.**
- Insert a space in "contribute+1" (953), "sign(−1)^n" (1070), "induced by(p,id)" (2622), "pair(X,A)" (2666), "level0" (3696, 4278), "degree−8" (3788), "unit+1" (3875) and "degrees1,2,4" (4326).
- Lower-case "AS SETS" (3333).
- At 4326 the degree-4 KO generator is written "α". Elsewhere it is "a" (3790, 4259), and α is the Atiyah–Bott–Shapiro map. Write "η, η², a".

## Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `kanQuillen_modelCategory` (G2.1) | Δ[1]→Δ[0]; ∂Δ[1]→Δ[0]; ∂Δ[2]↪Δ[2]; Λ²₀→Δ[1] on vertices 0,1,0; one-tactic probe | \|Δ[1]\| ≃ pt, so a weak equivalence; π₀\|∂Δ[1]\| has 2 elements against 1; π₁\|∂Δ[2]\| = ℤ against 0; the filler needs vertices (0,1,0), not monotone; the only pinned `ModelCategory` instances are `CochainComplex.Plus`, `Over` and `Cᵒᵖ`; the probe fails | true | none |
| `sSetTopAdj_unit_weakEquivalence` (G2.1) | X = Δ[0]; X = ∂Δ[1]; route | Δ[0] → Sing(pt) = Δ[0] is an iso; two points go to two points; ε_{\|X\|}∘\|η_X\| = id with CC C1.2b's counit of `sSetTopAdj` (CC README 835) | true | none |
| `numerableFiberBundle_hurewicz` (G2.10) | B×F with ρ ≡ 1; Möbius band; F = ∅; {0,1}→[0,1]; May's criterion | `Prod.fst` lifts; two arcs with a two-function partition; Σρ = 1 makes the base sets cover B, so F = ∅ forces Z = ∅ and lifts exist vacuously; the path 0→1 has no lift from 0; May's theorem (`MayConcise` 2181, p. 51) needs λ_U⁻¹(0,1] = U, locally finite, and the sets {ρ_i > 0} supply this | true | none |
| `homologyComparison` (G3.3) | X = ∅; Hℤ→Hℚ; C := Dᵒᵖ; Warsaw circle | for X = ∅, `IsAdditive` (`EilenbergSteenrod.lean:214`) at J = PEmpty gives 0 on both sides; ℤ→ℚ on a point is not an iso, so `hpt` fails; in Dᵒᵖ, coproducts are products, so additivity is the product axiom; on the Warsaw circle singular H₁ = 0 but Steenrod H₁ = ℤ, so the CW hypothesis is needed | true | none |
| Hatcher Prop. 3.17 | locator | `HatcherAT` 9415, p. 217; 9437–9438 leave the infinite-dimensional case to the reader | matches; Source issues | none |
| `stableStem_isOfFinOrder` (G5.6) | (n,k) = (0,3), (1,4), (0,2) | π₄S³ = ℤ/2 and π₆S⁴ = ℤ/2 are finite; (0,2) is excluded since 2 ≥ 3 fails, and there π₃S² = ℤ is infinite | true; range sharp | none |
| `rationalHurewicz` (G5.6) | k = 0, X = S¹⊔S¹; k = 1, X = S¹∨S¹; S² with k = 2; S³ with k = 3 | k = 0: 2k−2 = 2k−1 = 0 in ℕ, nothing asserted; k = 1: the kernel clause is void (the commutator kernel is excluded), and π₁ maps onto H₁(ℤ), spanning ℚ²; S²: ℚ → ℚ is an iso in degree 2, and in degree 3 the span of 0 is ⊤ in H₃ = 0, with the kernel ℤ not asserted since 3 > 2; S³: π₄ = ℤ/2 is torsion and H₄ = 0 | true | none |
| homotopy excision (G2.5, not stated) | carriers; probe; m = n = 0 | `RelHomotopyGroup` (Relative/Basic.lean:302) with `map` (356); `Subcomplex` (Classical/Basic.lean:659); the probe elaborates with 1 `sorry` warning; m = n = 0 asserts nothing | statable | R01 |
| Freudenthal (G2.5, not stated) | X = S², k = 2; X = S¹, k = 1; carriers | π₂S² = ℤ → π₃S³ = ℤ is an iso (i = 2 = 2k−2); π₃S² = ℤ → π₄S³ = ℤ/2 is onto, not injective; π₁S¹ → π₂S² is onto; Tau Ceti's `Topology/Sphere/Suspension.lean` has only I×S¹→S² | true; not statable | none |
| G1.1 axioms | ∨_ℕ S¹; KU; f_n = (−1)ⁿ; locators | ∏ℤ is uncountable against countable ⊕ℤ; KU⁻² = ℤ ≠ 0; f_{n+1}σ = (−1)^{n+1}σ ≠ σf_n = (−1)ⁿσ; `HatcherAT` 594–606 (p. 10), 6977–7013 (pp. 160–161), 8747–8760 (p. 202); `MayConcise` p. 137 | hold | none |
| G1.4 products | Cohen p. 309; twists | the twist has degree (−1)^{1·1} = −1 on S² and +1 on S⁴; a×σ(b) = (−1)^p σ(a×b) | hold | none |
| G1.5 smash lift | T²; S⁰; ℝ²; 4I.1 | H̃²(T²) = ℤ and H̃²(S¹∨S¹) = 0; S⁰×Y = Y⊔Y; (ℝ²)⁺ = S²; `HatcherAT` 20117 (p. 467) | hold | none |
| G1.6 boundary identities | S¹×(D¹,S⁰); Lemma 3.6 | δ(x×e) = −x×δe against a∪δb = x×δe, ratio −1 = (−1)¹; δb∪a = (−1)^{1·1}a∪δb = −x×δe; `HatcherAT` 8935 (p. 206) | hold | none |
| G1.7 spheres | KU; HF₂; r = 0; p. 448 | KU⁰(S¹) = ℤ⊕0 and KU¹(S¹) = 0⊕ℤ; 2σ² = 0 is vacuous mod 2; `HatcherAT` 19296–19298 give hⁿ ≈ hⁿ⁺¹Σ | hold | none |
| G2.3 stable equivalences | HSS Ex. 3.1.10; S→* | `HSS` 1088 (p. 23): F₁S¹ has level 0 = * and level n = ∨ⁿSⁿ; naive π₀ is ⊕ℤ against ℤ; [S,HZ] = ℤ against [*,HZ] = 0 | hold | none |
| G2.8 Γ-spaces | MMSS; Elmendorf–Mandell; M = ℕ | `MMSS` 2473/2477 (p. 53), 2513 (p. 54); EM 67, 84, 113; ℕ is special, π₀ is not a group, and its group completion has π₀ = ℤ | hold | none |
| G2.11 foundations | HTT/HA locators; Checks | HTT A.3.2.16 (40160), A.3.4.13–14 (41420/41430), A.3.5.13 (41674), A.3.6.16/18 (41987/42052), A.3.1.10 (39789), A.2.6.15 (38368), 1.2.4.3 (2066), 2.2.1.2 (3814), 2.2.2.12 (3964), 3.2.1.8/9/13, 4.2.4.1/3/4, 5.2.7.12, 3.3.1.8, 2.4.2.4, 2.1.3.4; HA 4.8.1.10/13/14 (27069/27099/27108), 7.3.2.6–7; core of N([1]) has 2 vertices; χ(X⊕ΣX) = 0 while χ(S) = 1; colim(ℤ →2 ℤ →3 ⋯) = ℚ | hold | none |
| G3.1 Brown | 4E.1–4E.2; Cohen 10.3; empty wedge | `HatcherAT` 19285 (p. 448), 19338 (p. 449); `CohenBMH` 10035 (p. 282, finite based CW); h(∨∅) = ∏∅ = singleton; K(ℤ,1) = S¹ and K(ℤ,2) = CP∞ | hold | none |
| G3.4 Milnor | 3F.8; ε-normalization; towers | `HatcherAT` 13729 (p. 314); ε·(−1)^i(a_i − f*a_{i+1}) = (1−shift)a; constant tower lim¹ = 0; for ×2, ×3, …, lim = 0 and lim¹ = Ext(ℚ,ℤ) ≠ 0 | hold | none |
| G3.5 open covers | May p. 51; VBKT 1.21; X_i = {0}∪[1/i,1]; two-arc S¹ | the telescope has 2 components against 1 for [0,1]; `HatcherVBKT` 1466–1480 (p. 37): V_{1,2} = S¹, and the second clause uses paracompactness | locator overstated | R03 |
| G3.7 compactness | ⊕_n S into ⊕_m HZ | the family (e_n)_n lies in ∏_n⊕_mℤ but not in ⊕_m∏_nℤ | hold (old R06 repaired) | none |
| G3.9 completion | HZ, HQ | π₀HZ^∧_p = ℤ_p; HQ^∧_p ≃ 0 although ℚ⊗ℤ_p = ℚ_p | hold | none |
| G4.0 HP charts | Tau Ceti `ratio`, `affineChart` | `ratio k j = X_j X_k⁻¹`; for n = 1, `affineChart 1 p 0 = ratio 1 0 p = X₀X₁⁻¹`; the complement of X₁ ≠ 0 is {[1:0]} | match | none |
| G4.1 Leray–Hirsch | 4D.1, 4D.8; X×CPⁿ; (D¹,S⁰) | `HatcherAT` 18645 (p. 432), 19006 (p. 441); free on 1, …, xⁿ; rank one on σ | hold | none |
| G4.3 Thom | Cohen 10.40; Cor. 4D.9; Möbius | `CohenBMH` 11933 (p. 330: connective E, connected X); `HatcherAT` 19035 (p. 441); w₁(Möbius) ≠ 0, so not HZ-orientable; HF₂ always orientable | hold | none |
| G4.5 locators | VBKT 3.1–3.2; Miller; 4D.4; 4D.12 | `HatcherVBKT` 3011 (p. 77), 3032 (p. 78); Miller 1604 (p. 42, ⟨e(λ),[CP¹]⟩ = −1), 1615 (p. 43), 1740 (p. 45); `HatcherAT` 18775–18779 (4D.4 includes Gₙ(ℍ^∞), p. 435), 19190 (p. 445, quaternionic case) | hold | none |
| G4.6 GL_k(ℝ) | table; reflection; stabilizations; locators | r(v) = −v̄ sends (q_L, q_R) to (q_R, q_L); the composite ℤ → ℤ² → ℤ is ×2; [S¹,GL₂(ℝ)] = ℤ⋊ℤ/2; `HatcherAT` 12820 (p. 293) and 13070 (p. 299); `HatcherVBKT` p. 75 | hold | none |
| G5.0 BSpin | π_i for i ≤ 8 | π_i BO = ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ, so π_i BSpin = 0, 0, 0, ℤ, 0, 0, 0, ℤ | hold; citation drift | R04 |
| G5.2 Atiyah duality | point; Sⁿ; S¹ ⊂ ℝ² | D(pt₊) = S; Σ⁻ⁿ(S∨Sⁿ) = S⁻ⁿ∨S; Σ⁻²(S²∨S¹) = S∨S⁻¹ | hold | none |
| G5.3 Thom spectra | MO with ℤ; MSO; 𝔽₂ | H₀(MO;ℤ) = π₀MO = ℤ/2 against H₀(BO;ℤ) = ℤ; MSO gives ℤ = ℤ; 𝔽₂ gives 𝔽₂ = 𝔽₂ | API overclaims | R02 |
| G5.4 KSp | [ℍ] = ab⁻¹ | a·ab⁻¹ = a²b⁻¹ = 4; c(a)c(b)⁻¹u² = 2u²·u⁻⁴·u² = 2 | hold | none |
| G5.5 Clifford and K_op | e₁, e₂; π₀K_op,n; p = q = 0 | e₁e₂ = diag(−i, i) = −e₂e₁ and e₂* = e₂; π₀K_op,1 = KO₇ = 0 and π₀K_op,4 = KO₄ = ℤ; Hom_gr(C₀(ℝ), ℝ) = {0, ev₀} = S⁰ | hold; three objects lack Checks | R05 |
| G5.6 locators | SSAT 1.21–1.22; 4.24; Cohen 10.19 | `HatcherSSAT` 1946 (p. 32), 2024 (p. 34); `HatcherAT` 15686 (p. 360); `CohenBMH` 10477 (p. 294) | hold | none |
| G5.7 supports | U = ℝ, ℓ = 0 | C_c(ℝ) = F(Σ∞S¹,R) = Σ⁻¹R = Σ⁻¹P_R(ℝ) | hold | none |

## Verified sound

- **Binders and padding.** I ran `#check @` on all six theorems in one scratch file. Every elaborated type matches its README statement (G2.1 730–735, G2.10 1258–1260, G3.3 2305–2307, G5.6 4449–4453), and no binder is lost. A one-tactic probe (`rfl`, `infer_instance`, `simp`, `aesop`, `decide`, `trivial`, an anonymous constructor) fails on all six, so none is padding.
- **Pinned declarations opened (52).**
  - Tau Ceti, HPⁿ: QuaternionicProjectiveSpace (`Basic.lean:62`), with `mk` (89), `mk_eq_mk_iff` (107), `lift` (122), `isOpenQuotientMap_mk` (138), `instPathConnectedSpace` (161), `ratio` (`Charts.lean:50`), `affineOpen` (62), `affineParam` (127), `affineChart` (174), `affineChart_transition` (215), `instChartedSpace` and `instIsManifold` (Instances 48, 88).
  - Tau Ceti, towers: `ModuleTower` (`Tower/Basic.lean:78`), `lim` (170), `limOne` (516), `subsingleton_limOne_of_surjective` (347), `connecting` (`Exact.lean:173`), `subsingleton_limOne_of_isMittagLeffler` (`MittagLeffler.lean:191`), `limOneSubsequenceEquiv` (`Subsequence/LimOne.lean:280`), `groupTowerLimOneEquiv` (`GroupTower.lean:23`).
  - Tau Ceti, tubes and metrics: `exists_diffeomorph_normalBundle_subset` (`Existence.lean:53`), its Riemannian form (`Coordinates.lean:146`), `exists_isClosedEmbedding_normalExp_disc` (`DiscSphere.lean:56`), `normalTube` (`Euclidean.lean:225`), `nonempty_contMDiffRiemannianMetric` (`Riemannian/Existence.lean:69`).
  - Tau Ceti, homotopy: `HomotopyGroup.hurewiczHom` (`Hurewicz/Basic.lean:652`); `BasedTopPair`, `RelHomotopyGroup`, `map`, `functor`, `group` and `commGroup` (`Relative/Group.lean:274, 294`).
  - Tau Ceti, other: the framed-only Pontryagin–Thom collapse (`PontryaginThom/Basic.lean`), so G5.2's unframed collapse duplicates nothing; `thomPair`, `IsThomClass` and `eulerClass`, which CharacteristicClasses C2.1 consumes (its README 170, 1186).
  - Mathlib: `IsAdditive` and `IsExtraordinaryEilenbergSteenrod` (`EilenbergSteenrod.lean:214, 297`), `TopPair`, `ofSubset` and `ofHom` (`TopPair.lean:34, 57, 66`), `Subcomplex` (`Classical/Basic.lean:659`).
  - A grep found at both pins no `ModelCategory SSet`, sequential spectra, stable equivalences, Brown representability, numerable Hurewicz theorem, mapping telescope, Postnikov tower, Leray–Hirsch, quaternionic Grassmannian, Spanier–Whitehead duality, Gysin map or rational Hurewicz. So the six stated headlines and the statability claims other than R01 are accurate.
- **Sources: seeded sample.** All 15 sections are in the table above.
  - Verified: `HatcherAT` (p. 10, §2.3, §3.1, Lemma 3.6, Prop. 3.17, Thm 3.19, §3.D, Thm 3F.8, Thm 4.23, Cor. 4.24, Ex. 4.46, Thms 4D.1, 4D.4, 4D.8, Cor. 4D.9, Ex. 4D.12, 4E.1, 4E.2, 4I.1); `MayConcise` (Ch. 7 §4 Theorem p. 51, Ch. 16 §5 p. 128, Ch. 18 §§1, 3, Ch. 23 §1 p. 189 and §8 pp. 200–201); `HatcherVBKT` (Props 1.11 and 1.14, Lemma 1.21, p. 75, Thms 3.1–3.2, Introduction table); `CohenBMH` (Thms 10.3, 10.16, 10.19, 10.40, 10.43, 10.46, Defs 10.16–10.17 and 10.28); `HSS` (1.2.5, 3.1.10, 3.4.4, 4.3.2, 5.3.8, 5.5.2–5.5.3, 5.6.2, 6.2.3); `MMSS` 18.2, 18.3, 18.8; `ElmendorfMandell` 1.1, 1.2, 1.4; `LurieHTT` and `LurieHA` as in the table; `HatcherSSAT` 1.21, 1.22; Miller Ch. 2 §2; `HebestreitSagave` §6.3 (1189), Cor. 6.7 (1289), §7.1 (1337–1372).
  - Defect: G3.5 (R03).
- **Cross-roadmap citations resolved (46).**
  - AlgebraicTopology at this head: Stages 2.5, 4.4, 4.5, 4.7, 4.8, 5.0, 5.5, 6.4, 8.2, 8.8c (2889), 8.8d (2963), 8.10, 8.11a (3128) and 8.11b (3181). Its README 2513–2514 leaves Freudenthal to this roadmap.
  - CharacteristicClasses at this head: C1.1b (449), C1.2 (705), C1.2b (830; the counit at 835), C1.5 (953), C1.5a (991; f_h at 1006–1013), C2.1 (1184), C2.4 (1449), C2.5 (1469), C3.2 (1685), and w₂ as spin obstruction (27, 302).
  - TopologicalKTheory at this head: T1.5 (141, 377), T1.5a (421), T1.6a (497), T1.6c with `stableOrientedGrassmannianWhitneySum` (759–760), T5 (1137), T7 with `a² = 4b` and `c(a) = 2u²` (1730, 1747), T7.0 with `stableOrientedGrassmannianInverse` (1409, 1469), and T7.1 (R04).
  - ComplexKahlerGeometry K1 (558) and K7.1 (2321).
  - On main: SpinGeometry G1.3 (107) and its Layer 7 (881); SA-D15–D17 (1099–1103); RepresentationTheory with SpinRepresentations, LieGroups and CompactGroups; GeometricTopology, HilbertModules, CStarAlgebras, SmoothBundlesConnections and ComplexManifolds are all on main. `roadmaps resolve` finds no unresolved citation or name.
  - Every supplier is on main. HigherToposTheory, OperatorKTheory, TangentialBordism, StringOrientation, IndexTheory, GeneralAlgebraicKTheory and StableHomotopyKTheory appear only in consumer sentences.
- **Overlaps.**
  - #1187, #1808 and #1854 change this folder. The description's shared-folder block orders them after this pull request.
  - No id that this README cites is dropped by another pull request, and no id dropped here is cited elsewhere. StableHomotopyKTheory (#1227, its README 238) cites G2.1 `realizationProductKelleyComparison`, which this README maps to AlgebraicTopology Stage 4.5 (92–93).
- **Ownership against open pull requests.** I checked by object (`roadmaps grep`/`show` and the given checkouts) against #1901, #866, #1798 and #1227; see R02 in the status table. Ownership against the other open pull requests was not checked.

## Not verifiable

- `QuillenHA` (G2.1), `JoachimKO` (G5.5), `SegalCategories` and `McDuffSegal` (G2.8), and `ABSClifford` are settled as uncertified and cited by locator only.
- HSS: I read the arXiv text. Its numbering against the JAMS 13 (2000) version is paywalled and was not compared.
- Dold, *Partitions of unity in the theory of fibrations* (1963), the alternative in R03, is not in the sources cache. Verify its locator before citing it.

## Source issues

- **Gap** in HatcherAT at Proposition 3.17, printed p. 217: the source proves the finite-dimensional case and leaves the infinite-dimensional telescope reduction to the reader; it should carry out the telescope argument, as in Theorem 3F.8; affects the proof.
- **Error** in HatcherVBKT at Lemma 1.21, printed p. 37: the proof says each V_S lies in a cover member because the functions in S are positive there; for a finite partition and S the whole index set, V_S is all of X; it should also require the functions in S to be positive; affects the proof.
