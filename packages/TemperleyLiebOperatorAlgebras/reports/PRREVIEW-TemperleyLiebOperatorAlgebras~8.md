# Review of TemperleyLiebOperatorAlgebras (pull request #867 at 65e9bc3)

**Verdict:** needs changes

Full review of the repaired head. The change since `c60e315` (939 lines) deletes the four companion Lean files, grows `Suggested.lean` from 56 to 292 lines (the Potts–Fortuin–Kasteleyn identity, the cubic quantum-torus carriers with real bodies and proved cocycle, the two `δ = √3` headlines) and reworks the headline list, Scope, 1.6's Checks, 1.7 and 1.8 of the README. Every passage of the README was read; the fifteen seeded targets were re-verified at their cache lines; the new Lean statements were elaborated, probed with one tactic each and recomputed numerically (tables below); every supplier citation was re-resolved at the current heads. The gate passes. One blocking finding: 1.7 now consumes a GeometricTopology section that exists only in a revision pull request of that roadmap, and the `δ = √2` headline it carried is no longer stated anywhere. Two P3 notes.

**Repair status of the previous review's findings (r7 at c60e315).**

| r7 | Finding | Status at 65e9bc3 |
|---|---|---|
| R01 (P1) | `CubicJonesTargets.lean` built on sorry'd data (`factorSet`, `inversion`, `model`, `braidUnit`) | repaired: the file is deleted; the carriers live in `Suggested.lean:113–268` with real bodies, `cubicFactor_isFactorSet` is proved (`:137–175`), `cubicInversion` is `TwistedMonoidAlgebra.lift` with the factor-set identity proved (`:195–211`); `#print axioms` on `cubicFactor_isFactorSet`, `cubicInversion`, `cubicFixed`, `cubicScalarCoefficient`, `gaussianBraidGenerator` lists `propext`, `Classical.choice`, `Quot.sound` only; the comparison is stated as the existence statement `exists_cubicFixedModel` (`:236–246`) and the finite image as `finite_gaussianBraid_closure` (`:262–266`), the shape r7 asked for |
| R02 (P2) | `CliffordJonesTargets.lean` defined its carriers through admitted theorems | the file is deleted, so the defect is gone; the finite model is now cited from "GeometricTopology Layer 4.5.3", which does not exist on main (R01 below) |
| R03 (P3) | companion files import `Mathlib.<submodule>` lines | repaired: no companion file remains; `Suggested.lean:5–7` imports `Mathlib` and two `TauCeti.*` modules; gate `imports=0`, `mathlib-subimports=0` |
| R04 (P3) | padding and API catalogue; README and Lean disagree | repaired: the 56 companion declarations are gone; `Suggested.lean` has 20 declarations, every name appears in the README (gate `readme-ids-missing=0`; `pottsPartition` at `README.md:649`, `chainForm` `:935`, `cubicSite` `:954`, `twelfthRootOfUnity` `:990`, …); the one-tactic probes fail on all four theorems (below) |
| R05 (P3) | 1.6's medial, ice and wired definitions had fewer than three Checks | repaired: five Checks added (`README.md:775–789`): `L(0.7, 1.3)` at `r = 1.7`, the plaquette, the cup–cap rescaling, the wired two-vertex example; their values recomputed below |

## R01 (P1) — 1.7 consumes GeometricTopology "Layer 4.5.3", which does not exist on main; the `δ = √2` headline is no longer stated

Location: `README.md:33–35` ("the Jones quotient at `δ = √2` as the even Clifford algebra with its analytic adjoint and C*-norm, using GeometricTopology's finite algebraic model"), `:61–63`, `:810–812` ("Consume GeometricTopology Layer 4.5.3's finite algebraic Clifford model, scalar trace, radical quotient, coordinate inclusions and braid phases"), `:826–830`, `:832–836`, `:874–876`, `:891–893`, `:925–926`; `Suggested.lean:110–111`.

Claim: the algebraic `√2` model (`F_m` with its Temperley–Lieb relations, surjectivity, scalar-trace identity, kernel equal to the bilinear radical, coordinate inclusions `J_m` and braid phases) is supplied by GeometricTopology Layer 4.5.3, and this roadmap adds only the analytic adjoint and the comparison with the positive quotient.

Witness: GeometricTopology on main (`fa41b37`) has Layer 4 at `TauCetiRoadmap/GeometricTopology/README.md:409` and Layer 5 at `:519`, with no subsection numbered 4.5 and no occurrence of the word "Clifford" in the file. The only GeometricTopology contract in this README (`README.md:334–336`) promises Layer 4's closure normalisation and nothing else, so 1.7's consumption and the contract section disagree. The section cited exists only at the head of pull request #903, which revises the existing GeometricTopology roadmap (heading "4.5.3 Fourth-root evaluation, the Arf invariant and the integral W quotient" at that head's `README.md:2179`, the finite model at `:2234–2274`, the statement `exists_evenCliffordModel` at `CliffordJonesAlgebraTargets.lean:212`). A pull request that revises an existing roadmap is never a dependency: the roadmap is cited as it is on main, where the section is absent. The dependency check reports nothing because GeometricTopology is on main. Consequence: the algebraic `√2` comparison is statable at the pins (Mathlib `CliffordAlgebra`, `CliffordAlgebra.even`, `QuadraticMap.weightedSumSquares`; Tau Ceti `CliffordAlgebra.basis` at `TauCeti/LinearAlgebra/CliffordAlgebra/Dimension.lean:118`; the companion file stated it at `c60e315`), it is listed among the end theorems at `README.md:33–35`, and it is now neither stated in `Suggested.lean` nor named in the module docstring as not statable (the docstring's 1.7 bullet, `Suggested.lean:43–46`, covers only the adjoint, inclusion and block compatibilities). A statable headline that is absent, pushed to a supplier that does not have it.

Repair, tested: own the finite model here, exactly as 1.8 owns the cubic one. (1) In `Suggested.lean`, under the Layer 1 section comment, add real-bodied definitions `cliffordForm m := QuadraticMap.weightedSumSquares ℂ (fun _ : Fin m ↦ (1 : ℂ))`, `EvenClifford m := CliffordAlgebra.even (cliffordForm m)`, `majorana m j := CliffordAlgebra.ι (cliffordForm m) (Pi.single j 1)`, `cliffordProjection m j := (2 : ℂ)⁻¹ • (1 + Complex.I • (majorana m ⟨j, _⟩ * majorana m ⟨j + 1, _⟩))`, `cliffordScalarCoefficient m a := (CliffordAlgebra.basis (cliffordForm m) (Pi.basisFun ℂ (Fin m))).repr a ∅`, and the headline

```lean
theorem exists_evenCliffordModel (m : ℕ) (q : ℂˣ)
    (hq : (Real.sqrt 2 : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ))) :
    ∃ F : TemperleyLieb ℂ (Real.sqrt 2 : ℂ) m →ₐ[ℂ] EvenClifford m,
      (∀ j : Fin (m - 1),
        (F (e (Real.sqrt 2 : ℂ) j) : CliffordAlgebra (cliffordForm m)) =
          (Real.sqrt 2 : ℂ) • cliffordProjection m j) ∧
      Function.Surjective F ∧
      (∀ x, markovTrace q hq x =
        (Real.sqrt 2 : ℂ) ^ m * cliffordScalarCoefficient m (F x)) ∧
      (∀ x, F x = 0 ↔ ∀ y, markovTrace q hq (x * y) = 0) := by
  sorry
```

On a scratch copy at the pins this elaborates with the single `sorry` warning; `#check` prints the four conjuncts; `#print axioms` on the definitions lists no `sorryAx`. The statement is true by the 1.7 text: `T_m = (√2)^m s_m ∘ F_m` by Markov uniqueness (`s_(m+1)(J_m(x) p_(m−1)) = s_m(x)/2`), the kernel is the trace radical because the pairing `s_m(xy)` is nondegenerate on `Cl_m⁰` and `F_m` is onto (both proved in the ILZ route, `8ec89b73 line 571–579, 590–593`). (2) In the README, return 1.7's "Consume … Layer 4.5.3", "the algebraic F_m supplied by", "the producer's" and "supplied" passages (`README.md:810–812, 832–847, 874–880, 891–893`) to this roadmap's own targets in the form 1.8 uses ("Prove `d_j² = −1`, …, obtain `F_m` by `TemperleyLieb.lift`, …, `ker F_m = R_m`; the existence of `F_m` with its generator values, its surjectivity, the trace identity and the kernel is the headline `exists_evenCliffordModel`"), name the new Lean declarations at their definitions, restore the Scope bullet (`README.md:61–63`) to "the identification of the Jones quotient at `δ = √2` with an even Clifford algebra, its blocks, tower and braid image (1.7)", put `exists_evenCliffordModel` in the headline list (`README.md:33–35`), and cite GeometricTopology Layer 4 "for the closure normalisation only" in 1.7's *Needs:* (`README.md:925–926`), as 1.8 already does (`README.md:1041`). The 1.7 Checks already carry the values this needs (`s_2(p_0) = 1/2`, `T_2(e) = √2`, `dim Cl_m⁰ = 1, 1, 2, 4, 8, 16`, `F_3(f_3) = 0`, the order-`8` image on two strands). Ownership note: the head of pull request #903 declares the same object under `TauCetiRoadmap.GeometricTopology.CliffordJones`; two open pull requests building one object is a defect for whichever merges second, and since this roadmap cannot cite that revision, this roadmap is the owner until GeometricTopology on main carries the section, at which point a later revision of this roadmap can reduce 1.7 to a citation.

## R02 (P3) — 1.7 prose: process vocabulary and mathematics outside code spans

Location: `README.md:832–836` ("Consume the algebraic F_m supplied by GeometricTopology Layer 4.5.3, with d_j=c_jc_(j+1), p_j=(1+i d_j)/2 and F_m(e_j)=√2p_j"), `:843–847` ("the producer's bilinear trace radical", "Q_m≅Cl_m⁰", "m≥3", "m≤2"), `:829` ("Match this s_m"), `:874`, `:891–892`, `:925–926` ("specialization", "normalization" against "normalisation" everywhere else in the file).

Witness: the house style puts mathematics in code spans and names objects by their roadmap or target; the same section writes `d_j = c_j c_(j+1)` in code spans at `:826–828`, and "producer"/"supplied"/"Consume" describe a supply relation, not the mathematics.

Repair: subsumed by R01's rewrite; if any of these passages survives, put every formula in a code span and replace "the producer's"/"supplied" by the roadmap section or target that provides the object.

## R03 (P3) — 1.8's definitions have fewer than three Checks each

Location: `README.md:996–1009`, six Checks for the eleven definitions of 1.8 now in `Suggested.lean`.

Witness: `chainForm`/`cubicFactor` have one Check (`:1004–1005`, `U_0 U_1 = ω U_1 U_0` from `B(e_0, e_1) = 1`, with the symmetric `α = ω^B` as the wrong model); `gaussianBraidGenerator`/`twelfthRootOfUnity` have one (`:1006–1007`, the eigenvalues of `g_0`); `cubicInversion`/`cubicFixed` have the dimension Check only (`:998–1000`).

Repair (values computed this round, table below): for `chainForm`/`cubicFactor` add `B(a, a) = 0` for every `a`; at `N = 3`, `B(ρ, e_j) = 0` for `ρ = (1, 0, 1)` and every `j` while `B(e_0, e_1) = 1` (the radical of the Blocks paragraph); `α(e_0, e_1) = ω²`, `α(e_1, e_0) = ω`; the cocycle identity at `(a, b, c) = (e_0, e_1, e_0 + e_1)`, both sides `ω²`. For `gaussianBraidGenerator`: in the `W`-basis of `G_1`, `g_0 = −(1/√3)(1 + ω² U_0 + ω² U_0²)`, so a definition with `u ↦ −u` would give `g_0³ = +i`; the subgroup generated by the `g_j` has order `12`, `96`, `2592` for `N = 1, 2, 3`. For `cubicFixed`: `W(e_0) + W(−e_0)` lies in `C_N` and `W(e_0) − W(−e_0)` does not.

## Verified sound

**Scope and counts.** 1745 README lines read in full; `Suggested.lean` (292 lines) read and elaborated; the worktree is clean at `65e9bc3` and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TemperleyLiebOperatorAlgebras'` is empty; `metadata.toml` carries only `topic = "math.OA"`; 15 seeded targets checked at their sources (every locator found at its printed page); 31 adversarial rows with computed values; 19 pinned declarations opened; 14 supplier roadmaps re-resolved at their current heads.

**Gate, build and dependency check.** The worker's gate at this head: every counter `0`, `build=0`, `OK`. The dependency check, rerun as prescribed:

```text
depcheck: 204 roadmaps, 1403 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line (GeometricTopology is a main-only roadmap, absent from the merge order, so R01 is invisible to it). `lake env lean` on a scratch copy of `Suggested.lean` at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, the manifest's pins, the shared packages directory checked to be at those revisions): exactly four `sorry` warnings (lines 103, 236, 262, 281) and nothing else. `#check @name` for all 20 declarations: each elaborated type carries every binder of its README statement (`pottsPartition_eq_fkPartition` keeps `[CommSemiring R]` and both `Fintype` instances; `exists_cubicFixedModel` keeps `hq`; `markovTrace_neg_one_pow_nonneg_iff` keeps `δ < 0`, `hq`, the `StarRing`/`StarModule` families and `he`), nothing dropped.

**Headlines and padding.** `README.md:25–38` lists the end theorems. Stated: `markovTrace_neg_one_pow_nonneg_iff` (2.1), `pottsPartition_eq_fkPartition` (1.6), `exists_cubicFixedModel` and `finite_gaussianBraid_closure` (1.8). Named in the docstring as not statable, correctly: the Powers-state comparison (needs V2 and `B_δ`), the loop and six-vertex identities, the adjoint and block compatibilities of 1.7–1.8, the comparisons 1.1–1.4, the Bratteli presentation, the unitary category, the affine classification and Gram determinant (`TauCeti/Algebra/TemperleyLieb/` has `Basic.lean` and `MarkovTrace.lean` only at the pin). Missing: the algebraic `√2` model (R01). One-tactic probes on scratch copies: `pottsPartition_eq_fkPartition` with `simp [pottsPartition, fkPartition]` leaves the two sums as the goal, `rfl` fails; `exists_cubicFixedModel` with `simp`: no progress; `finite_gaussianBraid_closure` with `simp`: no progress, `infer_instance`: not a class; `markovTrace_neg_one_pow_nonneg_iff` with `simp`: no progress, `rfl` fails. No declaration restates a definition, mirrors a Check or computes a value; `cubicFactor_isFactorSet` is the instance the carrier needs, proved.

**Pinned declarations opened** (Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`). Tau Ceti: `markovTrace` (`Algebra/TemperleyLieb/MarkovTrace.lean:452`), `markovTrace_one = δ^n` (`:462`), `markovTrace_mul_comm` (`:468`), `markovTrace_strandIncl` (`:486`), `markovTrace_strandIncl_mul_e_last` (`:494`, the Markov property `T(ι x · e_last) = T(x)`); `IsFactorSet` (`Algebra/MonoidAlgebra/Twisted/Basic.lean:97`: cocycle `α(gh, j) α(g, h) = α(h, j) α(g, hj)`, `one_left`, `one_right`), `twistedTranslation_single` (`:236`, `W(g) e_h = α(g, h) e_(gh)`), `twistedMonoidAlgebra` (`:282`), `of_mul_of` (`:330`, `of g * of h = α g h • of (g h)`), `basis` (`:350`), `lift` (`:391`, needs `u 1 = 1` and `u g * u h = α g h • u (g h)`); `CliffordAlgebra.basis` (`LinearAlgebra/CliffordAlgebra/Dimension.lean:118`, indexed by `Finset I` for a linearly ordered basis); `jonesDelta` (`KnotTheory/TemperleyLieb.lean:85`), `jonesUnit` (`:105`). Mathlib: `AlgHom.equalizer` (`Algebra/Algebra/Subalgebra/Basic.lean:1030`); `Graph.restrict` (`Combinatorics/Graph/Delete.lean:38`, `vertexSet := V(G)`, `edgeSet := E(G) ∩ E₀`), `Graph.toSimpleGraph : SimpleGraph V(G)` (`Simple.lean:100`), `Graph.isLink_symm` (`Basic.lean:99`), `IsLink.symm` (`:128`), `exists_isLink_of_mem_edgeSet` (`:142`). The conventions of `chainForm`, `cubicFactor` (`ω^((2B) mod 3)` through `ZMod.val`) and `gaussianBraidGenerator` (`u • ((1 + u²) • p − 1)`) were replayed in the regular representation (table).

**Cross-roadmap citations resolved this round.** Subfactors at the head of #874 (`deecc6b`): 3.1 (`README.md:676`), 3.2 (`:697`, `markovTrace_nonneg_iff`, `jonesLoopParameters` at `:729–731`), 3.3 (`:774`). VonNeumannAlgebras at #889 (`dee0881`): Layer 0 (`:275`), Layer 2 (`:523`), Layer 4 (`:970`), Layer 10 (`:2247`), 13.1 V13a (`:3690`). CStarAlgebras at #860 (`1d4e2ed`): C1–C5 (`:85, 263, 459, 497, 546`). CategoricalOperatorAlgebras at #888 (`79cccda`): CA1a (`:152`), CA2a (`:302`). CStarClassification at #863 (`db5a0c5`): CL2 (`:349`), 2.1 (`:351`, `IsAF`), 2.2 (`:376`). On main (`fa41b37`): TemperleyLieb Layers 0–7 (`:254, 283, 333, 485, 545, 606, 680, 767`) with 41 occurrences of the consumed names (`presentedTLEquiv`, `negligibleIdeal`, `MonoidalQuotient`, `halfCount`, `gramPoly`, `existsUnique_isMarkovTrace`, `condExp`, `exists_qInt_eq_zero_iff`, `existsUnique_jonesWenzl`, `diagBasis`, `reflect`) and `IsMarkovTrace.apply_jonesWenzl` as a Layer 6 target (`:242, 708`: the worker's one citation lead, not a pinned declaration); PivotalSpherical Layers 0–4; GrothendieckEulerForms Layer 2; GraphConnectivityAndFlows 1.1 (`:224–256`, `componentCount = Nat.card … ConnectedComponent`); BelyiMaps Layer 2 (`:892`, `BipartiteRibbonGraph` `:897`, `facePerm` `:922`); SpinGeometry G1 (`:136`, `κ_tens` `:214–224`); SpinRepresentations Layers 0–1 (`:316, 353`); TypeAHeckeAlgebras H3 (`:193`), H4a (`:452`); GeometricTopology Layer 4 (`:409`), and not 4.5.3 (R01).

**Ownership.** `roadmaps grep` over main and the 426 open heads for "Fortuin|random-cluster|Potts partition|pottsPartition": only this roadmap. For "quantum torus|Gaussian braid|twistedMonoidAlgebra|cubicFixed|CubicTorus": this roadmap, plus generic uses of the twisted monoid algebra in NoncommutativeAndEquivariantIwasawa (#1307), InductionRestriction (main) and OperatorAlgebraDynamics (#1137), none building the cubic Temperley–Lieb instance; this roadmap owns it. For "even Clifford|exists_evenCliffordModel|EvenCl": SpinRepresentations (main and #1207) and OrthogonalSpinGroups own the general structure theory the README cites; the `√2` Temperley–Lieb model appears at the head of the GeometricTopology revision #903 only (R01). The board package index lists no competing package. Ownership against open pull requests whose files the brief did not give was not checked beyond `roadmaps grep`.

**Sources checked at their locators** (cache ids by their first eight characters; the roadmap has no `sources.toml`).

- Jones 1985, `bcae6367`: printed p. 104 = file page 2, lines 57–83 (the `A_n` on `n` projections with relations (I)–(III), the trace with (IV)–(VI), Temperley–Lieb's representation, the Potts/ice equivalence, the trace as the restriction of the Powers state); printed p. 107 = page 5, lines 191–203 (at `t = i` the `A_n` are the complex Clifford algebras; at `e^(πi/3)` a cubic Clifford algebra and finite braid image). Supports 1.5–1.8.
- Penneys, Chapter 4, `a5da4024`: Facts 4.4.14 from line 557 (printed 154), (TB4) lines 589–592 (printed 155: the adjoint on tree-basis matrix units for real `d`), (TB6) lines 600–602 (`d < 0` gives `(−1)^n Tr_n` positive), (TB7) lines 607–608 (negligible ideal `ℂ f^(n)` when `[n+1] = 0`); Definition 4.5.1 line 733, Proposition 4.5.3 line 745, Exercise 4.5.4 line 747 (printed 158); Example 4.6.12 line 941 (printed 163), Example 4.6.14 line 1000 (printed 164; located this round, the truncation to `A_n`). Supports 1.1, 1.3, 1.4, 2.1, 2.2.
- Ridout–Saint-Aubin, `126aa444`: Theorem 4.7, (4.20), lines 1120–1129 (exponent `d_(n,p−j)`, factor `[n−2p+1+j]/[j]`, printed 20); Corollary 4.8 line 1140, Proposition 4.9 line 1162 (printed 21). Supports 1.2.
- Iohara–Lehrer–Zhang, roots of unity, `3a990ff3`: Proposition 3.1 lines 154–158, Remark 3.2 lines 159–162. Supports 1.3.
- Iohara–Lehrer–Zhang, Jones quotients, `8ec89b73`: (5.18) line 561, Proposition 5.3 line 567, Theorem 5.4 lines 571–579 (`ℓ = 4`, `q = −exp(πi/4)`, `φ_n(f_j) = (1 + 2iγ_jγ_(j+1))/√2`, surjective onto `C_n⁰`), Proposition 5.5 lines 590–593. Supports 1.7.
- Erdmann–Green, `6f192e41`: 2.1.1–2.1.6 lines 94–132 (printed 3–4), Proposition 2.2.4 lines 164–171 (printed 5), Proposition 2.2.5 lines 174–181, Proposition 2.4.4 lines 246–252 (printed 7), 2.5.4–2.5.6 lines 328–346 (printed 9). Supports 4.1–4.4.
- Graham–Lehrer 2003, `49bac728`: (TL) lines 357–361 with `δ_x = −(x + x⁻¹)` (printed 488), the presentation remark lines 378–380, §4 lines 398–400 (composition factors determined in characteristic zero, printed 489). Supports 4.1, 4.7.
- Chen, `fe11792b`: Theorem 5.4.4 lines 1723–1735 (`0 ≤ a, b ≤ n − 2`, printed 44), Theorem 5.4.5 lines 1940–1941. Supports 3.4.
- Morin-Duchesne–Saint-Aubin, `d6f3a06c`: Corollary 4.2, (23), lines 1115–1119; Proposition 4.3, (29), lines 1275–1296. Supports 4.6 (misprint below).
- Chen–Przytycki, `ec149273`: §2 lines 25–53 (the annular pairing, `⟨b_1,b_1⟩ = δ²`, `⟨b_1,b_2⟩ = α`, `⟨b_1,b_3⟩ = αδ`, Barad's factorisation; printed 1–2). Supports the 4.6 Check.
- Galindo–Rowell, `1052ac29`: §3.1 lines 223–244, Proposition 3.4 lines 232–242 (`U_1U_2 = q²U_2U_1`, `R` unitary), Proposition 3.6 lines 265–275 (finite image via the action on the finite monomial set, central kernel of finite order). Supports 1.8.
- Rowell–Wenzl, `9897a868`: Remark 4.8 lines 911–915, Theorem 4.9 lines 917–925. Supports 1.8.

**Adversarial table, the new Lean statements and 1.6–1.8** (exact where shown as integers or fractions; complex floating point otherwise; the regular representation of `G_N` on `ℂ^(3^N)` for `N = 1, 2, 3`).

| Statement | Instances tried | Values on both sides | Result | Change |
|---|---|---|---|---|
| `pottsPartition = fkPartition` with the Lean semantics (`∀ u w, IsLink e u w → σ u = σ w`; `k(A)` counts isolated vertices) | empty graph, 3 isolated vertices, edge, loop, parallel pair, triangle, plaquette, path plus isolated vertex, loop plus edge; `q = 0, 1, 2, 3`; `v = 2, 3, 5, 7` | equal in all 36 cases; e.g. edge `q = 2`: `8 = 8`; loop `q = 2`: `6 = 6`; parallel `q = 2`: `26 = 26`; plaquette `q = 2`: `1470 = 1470`; `q = 0`: `0 = 0` for nonempty `V`, `1 = 1` for the empty graph (`0^0`) | holds | none |
| loop factor | `IsLink e u u` | the condition is vacuous, factor `1 + v_e`, Potts loop value `q(1 + v)`, FK `Q(1 + v)` | holds | none |
| `cubicFactor_isFactorSet` | `N = 1, 2, 3`, all triples (`3^9` at `N = 3`) | `W(a)W(b) = α(a,b)W(a+b)` as matrices for all `a, b`; cocycle exact | holds (proved in the file) | none |
| `U_j³ = 1`, `U_jU_(j+1) = ωU_(j+1)U_j`, distant commutation | `N = 1, 2, 3` | exact; `α(e_0,e_1) = ω²`, `α(e_1,e_0) = ω`, ratio `ω` | holds | none |
| `cubicProjection` | `N = 1, 2, 3` | `p_j² = p_j = p_j†`, `p_jp_(j±1)p_j = p_j/3`, distant commute; `s_N(p_0) = 1/3` | holds | none |
| `cubicInversion`, `cubicFixed` | `N = 1, 2, 3` | `α(−a,−b) = α(a,b)`; the algebra generated by the `p_j` has dimension `2, 5, 14 = (3^N+1)/2 = dim C_N`, so `F_m` is onto `C_(m−1)` | holds | none |
| kernel of `F_m` is the trace radical | `N = 1, 2, 3` | the Gram matrix of `s_N(xy)` on the basis `1, W(a)+W(−a)` of `C_N` has `|det| = 2, 16, 8192`, nonzero, so `{x : ∀ y, s(F(x)F(y)) = 0} = ker F` | holds | none |
| trace identity `T_m = (√3)^m s_(m−1) ∘ F_m` | `m = 0, 1, 2, 3`; random `x` | `T_0(1) = 1 = s_0(1)`; `T_1(1) = √3`; `T_2(e) = √3 = 3·√3·(1/3)`; `T_3(e_0e_1) = T_2(e_0) = √3 = 3√3·3·s_2(p_0p_1)` with `s_2(p_0p_1) = 1/9`; Markov `s_(N+1)(I_N(x)p_N) = s_N(x)/3`: `0.04479+0.28248i` both sides at `N = 1, 2` | holds | none |
| `m = 0` and `m = 1` | `Fin (m−1) = Fin 0`, `cubicFixed 0 = ℂ` | both sides `ℂ`, `F = id`, kernel `0` | holds (docstring states it) | none |
| `hq` is satisfiable | `q = −e^(±iπ/6)` | `−(q + q⁻¹) = 2cos(π/6) = 1.732051 = √3` | holds | none |
| `gaussianBraidGenerator` | `N = 1, 2, 3` | `u((1+u²)p_j − 1) = −(1 + ω²(U_j + U_j²))/√3` entrywise; unitary; `g_j³ = −i`; braid relation `g_0g_1g_0 = g_1g_0g_1` | holds | none |
| `finite_gaussianBraid_closure` | closure in the regular representation | `|⟨g_0⟩| = 12`, `|⟨g_0,g_1⟩| = 96`, `|⟨g_0,g_1,g_2⟩| = 2592` (`N = 3`, computed this round); `N = 0`: the trivial group | holds | none |
| `markovTrace_neg_one_pow_nonneg_iff` (2.1) | `n = 1`, `δ = −2`; `δ = −1/2`; `δ = 0` | `−T_1(1) = 2`; `T_2(f_2) = δ² + 2δ = −3/4 < 0` with `f_2 = 1 + 2e`; at `δ = 0` all `T_n = 0` yet `0 ∉ J`, excluded by `δ < 0` | holds | none |
| sign relation (2.1) | `n = 1, x = 1`; `n = 2, x = e` | `(−1)·T^(−δ)_1(1) = δ`; `(+1)·T^(−δ)_2(−e) = δ` | holds | none |
| 1.6 new Checks | `r = 1.7`, `a = 0.7`, `b = 1.3`; plaquette at `δ = 1.7`, `v = (0.5, 1, 1.5, 2)` | `a + b/r = 1.4647`, `a + br = 2.91`; `ell(A) = 4, 1, 2` with `k(A) = 4, 1, 1` on `∅`, the 3-path, the cycle; `Z_FK(δ², v) = 285.9238 = δ⁴ Σ δ^ell Π v/δ`; `r^(−1/2)C = r^(1/2)A = [[0, r^(−1/2)],[r^(1/2), 0]]`; wired two-vertex at `q = 3`, `v = 2`: `9` and `3` | holds | none |
| 1.7 values (carried from r7, unchanged text) | `m = 2..5` | `p_jp_(j±1)p_j = p_j/2`; `g_j⁸ = 1`; image orders `8, 48, 384, 3840 = 2^m m!`; `dim Cl_m⁰ = 1, 1, 2, 4, 8, 16` | holds | none |
| 1.8 blocks and weights (carried) | `N = 1, 2, 3`; `m = 2, 3, 4` | centre dimensions `2, 2, 3`; weights `1/3, 2/3`; `2/3, 1/3`; `2/9, 2/3, 1/9` | holds | none |

**Adversarial table, the other seeded targets (recomputed).**

| Statement | Instances | Values | Result |
|---|---|---|---|
| 1.1 diagram adjoint | two strands, `i·e` | `(i·e)† = −i·e`, `star(i·e) = i·e`; at `δ = i`, `κ` carries `e² = i·e` to `e² = −i·e` | holds |
| 1.2 anchors and exponents | `δ = 7/3`; `n = 5, t = 1` | `det G_(3,1) = 40/9 = [3]`; `d_(5,1) = 4`, `d_(5,0) = 1`, wrong exponent `d_(5,2) = 5` | holds |
| 1.2 indefinite | `δ = 1/2`, `n = 3` | `det [[δ,1],[1,δ]] = −3/4` | holds |
| 1.3 dimensions | `δ = √2` | `dim Q_2 = 2`, `dim Q_3 = 4 = 5 − 1`; `δ = 2`: `Σ_t (#paths)² = catalan n` (`n = 4`: `4 + 9 + 1 = 14`) | holds |
| 1.4 weights | `n = 2`; `m = 5`, `n = 3` | `1 + (δ² − 1) = δ²`; `2δ + 1 = 4.236 = δ³` at `δ = 1.618` | holds |
| 2.2 weights at `δ = 2`, level 2 | `(1/4, 3/4)`; `δ = 3`: `(1/9, 8/9)` | sums `1`; unit weights `1/2` | holds |
| 3.1 dagger on `Hom(0,2)` | `i·cup` | `(i·cup) ≫ (−i·cap) = δ·𝟙_0`; the linear dagger gives `−δ·𝟙_0` | holds |
| 3.2 norms | `e`, `e_ie_(i+1)e_i` | `‖e‖ = δ` (`e/δ` a projection); `‖e_ie_(i+1)e_i‖ = ‖e_i‖ = δ`, not the bound `δ³` | holds |
| 3.3 | `e ⊗ e` in `End(4)` | `(e_1e_3)² = δ²e_1e_3`, norm `δ²`; rescaled cup `‖r‖² = |c|²δ ≠ ‖r̄‖²` | holds |
| 4.1 `ATL_2` | `W_(0,z)(2)`, `z = 2` | `e_1e_2e_1 b_1 = δa²b_1` with `a² = 25/4`, not `δ b_1` | holds |
| 4.2 dimensions | `(n,t) = (2,0), (3,1), (4,0)` | `C(2,1) = 2`, `C(3,1) = 3`, `C(4,2) = 6` | holds |
| 4.6 Gram `n = 2, t = 0`; `n = 3, t = 1` | `σ_(2,0) = −1`, `σ_(3,1) = 1`; `X = 5/3`, `Z = 7/2` | `X² − (Z+Z⁻¹)²` ; `det = 63299/5292 = X³ − 3X + Z² + Z⁻²` | holds |
| 4.6 six-state determinant | `(d,a) = (3,0), (3,3)` | `9⁴·49 = 321489`; `0` with rank `2`, matching `(d²−a²)⁴((d²−2)²−a²)` | holds |
| 4.6 `T_r(−v−v⁻¹) = (−1)^r(v^r + v^(−r))`, telescoping | `v = 5/2`, `r ≤ 5`; `n = 4` | all equal; `2 + 3 + 1 = 6 = E_(4,0)`; `2·4 + 4·1 = 12 = 2·C(4,2)` | holds |
| 4.7 valuation bound | `n = 2`, `t = 0`, `z = v`; `v = i`, `z = i` | `F_2(x,v) = (v+v⁻¹)² − x²` has a simple zero at `x = δ ≠ 0` (derivative `−2δ`), bound `1`; `F_2(x,i) = −x²`, order `2` at `0`, bound `2`, Gram matrix zero | holds |

## Not verifiable

- Graham–Lehrer 1998 (doi 10.5169/seals-63902): uncertified and settled since r2; cited by locator, not reopened.
- Temperley–Lieb 1971 (doi 10.1098/rspa.1971.0067) and Baxter–Kelland–Wu 1976 (doi 10.1088/0305-4470/9/3/009): paywalled, cited by locator only; the Potts/ice equivalence they are cited for is independently supported by Jones 1985 p. 104 and by the computations above.
- The order of the Gaussian braid image for `N ≥ 4` was not computed (`2592` at `N = 3` was); finiteness is what the README claims and what Galindo–Rowell prove.

## Source issues

- **Misprint** in Morin-Duchesne–Saint-Aubin (arXiv 1203.4996) at Proposition 4.3, equation (29), printed p. 24: the source gives an unsigned product, which at `N = 2`, `d = 0` yields `α² − β²`; it should carry the leading-term sign, yielding `β² − α²` there; affects nothing (the roadmap supplies the sign `σ_(n,t)`; carried from r2).
- **Misprint** in Jones 1985 (doi 10.1090/S0273-0979-1985-15304-2) at printed p. 104, second paragraph: the text layer gives the Temperley–Lieb representation space of `A_n` as having dimension `2n+2`; it should be `2^(n+1)`, the `(n+1)`-site spin chain (superscript placement not confirmable from the extraction); affects nothing (carried from r7).
