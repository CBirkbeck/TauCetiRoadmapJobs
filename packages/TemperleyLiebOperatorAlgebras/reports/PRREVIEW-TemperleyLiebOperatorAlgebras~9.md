# Review of TemperleyLiebOperatorAlgebras (pull request #867 at 556e24c)

**Verdict:** accepted

Full review of the repaired head. The change since `65e9bc3` (193 lines) moves the finite `δ = √2` even-Clifford model back into this roadmap: five real-bodied definitions and the headline `exists_evenCliffordModel` in `Suggested.lean` (lines 114–163), the rewritten 1.7 (`README.md:802–938`), the restored Scope bullet and headline entry, and seven new Checks in 1.8. Every passage of the README (1770 lines) was read; the fifteen seeded targets were re-verified at their cache lines; `Suggested.lean` was elaborated at the pins on a probe copy with one-tactic probes, `#check` on all 26 declarations and `#print axioms` on every definition; every value of the new 1.7 and 1.8 text was recomputed in an independent model (tables below), together with the trace identities of both headlines against Tau Ceti's spin-representation Markov trace. The gate passes. No P1 or P2 finding; one P3 note.

**Repair status of the previous review's findings (r8 at 65e9bc3).**

| r8 | Finding | Status at 556e24c |
|---|---|---|
| R01 (P1) | 1.7 consumed GeometricTopology "Layer 4.5.3", absent from main; the `√2` headline was stated nowhere | repaired: `README.md:808–812` ("The finite algebraic model, its scalar trace, its radical quotient, its coordinate inclusions and its braid phases are targets of this section"), `:834–858` (the construction of `F_m`, its surjectivity, the Markov argument for `T_m = (√2)^m s_m ∘ F_m`, and `ker F_m = R_m` by nondegeneracy, as 1.8 does), `:60–61` (Scope bullet restored), `:34–35` (headline listed), `:938` ("GeometricTopology Layer 4, for the closure normalisation only"); `Suggested.lean:116–161` declares `cliffordForm`, `EvenClifford`, `majorana`, `cliffordProjection`, `cliffordScalarCoefficient` with real bodies and the headline in the four-conjunct form; elaborated at the pins with a single `sorry` warning; `#print axioms` on the five definitions lists `propext`, `Classical.choice`, `Quot.sound` only. No occurrence of "4.5.3", "producer" or "supplied" remains in the file |
| R02 (P3) | 1.7 prose: process vocabulary and formulas outside code spans | repaired: `:808–812`, `:834–858`, `:882–895` put every formula in a code span and name objects by target; "normalisation" is spelled uniformly (`:895`, `:938`, `:1066`) |
| R03 (P3) | 1.8's definitions had fewer than three Checks each | repaired: `:1042–1054` adds the radical of `B` at `N = 3`, the values `α(e_0, e_1) = ω²`, `α(e_1, e_0) = ω` and the cocycle instance, the `W`-basis form of `g_0` with the `−u` wrong model, the image orders `12, 96, 2592`, and the `θ`-fixed and non-fixed combinations; every value recomputed below and found correct |

## R01 (P3) — a Check names a Lean declaration

Location: `README.md:1053–1054` ("`W(e_0) + W(−e_0)` lies in `C_N` and `W(e_0) − W(−e_0)` does not (`θ` negates it), so `C_N` is a proper subalgebra for `N ≥ 1`; `cubicScalarCoefficient` vanishes on both").

Claim: the Check's last clause is stated through the backticked name of the `Suggested.lean` declaration.

Witness: the house rule that a Check is prose and never names a Lean counterpart; the same section writes the trace as `s_N` everywhere else (`:957–959`, `:1041`), and the mathematics is `s_1(W(e_0) ± W(−e_0)) = 0` (computed: both values `0`).

Repair: replace "`cubicScalarCoefficient` vanishes on both" by "`s_N` vanishes on both".

## Verified sound

**Scope and counts.** README 1770 lines read in full; `Suggested.lean` (344 lines) read and elaborated; the worktree is clean at `556e24c`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TemperleyLiebOperatorAlgebras'` is empty; `metadata.toml` carries only `topic = "math.OA"`; 15 seeded targets re-checked at their sources; 46 adversarial rows with computed values; 24 pinned declarations opened; 16 supplier roadmaps resolved at their current heads or on main.

**Gate, build and dependency check.** The worker's gate at this head: every counter `0`, `build=0`, `OK`. The dependency check, rerun as prescribed:

```text
depcheck: 204 roadmaps, 1404 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` (the manifest's pins; the shared packages directory checked to be at those revisions before elaborating). `lake env lean` on a scratch copy of `Suggested.lean`: exactly five `sorry` warnings (the five theorems) and nothing else; the copy replaced each `sorry` by `first | (simp; done) | rfl | infer_instance | sorry`, and all five fell through to `sorry` (`simp` made no progress on any of them), so no headline closes in one tactic. `#check @name` for all 26 declarations: each elaborated type carries every binder of its README statement (`exists_evenCliffordModel` keeps `m`, `q`, `hq` and quantifies the four conjuncts over `TemperleyLieb ℂ (↑√2) m`; `markovTrace_neg_one_pow_nonneg_iff` keeps `δ < 0`, `hq`, the `StarRing`/`StarModule` families and `he`; `pottsPartition_eq_fkPartition` keeps `[CommSemiring R]` and both `Fintype` instances), nothing dropped. `#print axioms` on the twelve definitions and the proved instance: no `sorryAx`.

**Headlines and padding.** `README.md:25–37` lists the end theorems. Stated: `markovTrace_neg_one_pow_nonneg_iff` (2.1), `pottsPartition_eq_fkPartition` (1.6), `exists_evenCliffordModel` (1.7), `exists_cubicFixedModel` and `finite_gaussianBraid_closure` (1.8). Named in the docstring as not statable, correctly (`Suggested.lean:39–61`): the Powers-state comparison, the loop and six-vertex identities, the adjoint, inclusion and block compatibilities of 1.7–1.8 (no analytic adjoint on `CliffordAlgebra`, `TauCeti.TemperleyLieb` or the twisted monoid algebra at the pins), the comparisons 1.1–1.4, the Bratteli presentation, the unitary category, the affine classification and Gram determinant (`TauCeti/Algebra/TemperleyLieb/` has `Basic.lean` and `MarkovTrace.lean` only). The five definitions of the Clifford section are each used in the headline's statement; none restates a definition, mirrors a Check or computes a value. Every backticked name of this roadmap's own in the README is declared in `Suggested.lean` (gate `readme-ids-missing=0`, checked name by name: 25 names, each found).

**The `√2` headline, checked as mathematics.** With `d_j = c_j c_(j+1)`: `d_j² = −c_j² c_(j+1)² = −1`, so `(i d_j)² = 1` and `p_j = (1 + i d_j)/2` is idempotent; `i d_j` and `i d_(j+1)` anticommute, giving `p_j p_(j±1) p_j = p_j/2`, so `√2 p_j` satisfies `E_j² = √2 E_j` and `E_j E_(j±1) E_j = E_j`, the relations of `TemperleyLieb.lift` (`Basic.lean:196`). `c_S c_T = ± c_(S △ T)`, so `s_m(c_S c_T) = ±[S = T]`: `s_m` is a trace and the pairing is diagonal `±1` on the even monomials, hence nondegenerate on `Cl_m⁰`; `c_j c_k = d_j ⋯ d_(k−1)` so the `d_j` generate `Cl_m⁰` and `F_m` is onto. For `x ∈ Cl_m`, `x c_m c_(m+1)` has no scalar term, so `s_(m+1)(J_m(x) p_m) = s_m(x)/2`, which gives `(√2)^(m+1) s_(m+1)(F(ι x · e_m)) = (√2)^m s_m(F x)`, the Markov property, and `(√2)^(m+1) s(J F x) = √2 · (√2)^m s(F x)`, the factor `δ`; with `T(1) = (√2)^m`, Markov uniqueness gives the trace identity. `ker F ⊆ R`: `T(xy) = (√2)^m s(F(x)F(y)) = 0`. `R ⊆ ker F`: `s(F(x) z) = 0` for every `z` in the image, which is all of `Cl_m⁰`, so `F(x) = 0` by nondegeneracy. `m = 0, 1`: `Fin (m − 1) = Fin 0`, both sides `ℂ`, `F = id`, `T_0(1) = 1 = s_0(1)`, `T_1(1) = √2 = √2 · s_1(1)`. `hq` is satisfiable by `q = −exp(±πi/4)`. The transported basis claim (`:825–827`) is correct for the standard basis: it is orthogonal for the sum of squares, so the contraction terms of `changeForm` vanish on ordered monomials and `CliffordAlgebra.basis q_m (Pi.basisFun ℂ (Fin m)) S = c_S`; the README states it as a target, not a fact assumed. The independent numerical check below reproduces the trace identity against Tau Ceti's spin-representation trace (`markovTrace` is `trace (diagonal spinWeight * spinRep x)`, `MarkovTrace.lean:452`) on every word tried.

**Pinned declarations opened** (Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`). Tau Ceti: `markovTrace` (`Algebra/TemperleyLieb/MarkovTrace.lean:452`, with `hδ : δ = -(q + q⁻¹)` at `:445`, the form of `hq`), `markovTrace_one` (`:462`), `markovTrace_mul_comm` (`:468`), `markovTrace_strandIncl` (`:486`), `markovTrace_strandIncl_mul_e_last` (`:494`); `e` (`Basic.lean:155`), `lift` (`:196`), `hom_ext` (`:215`), `strandIncl` (`:233`); `CliffordAlgebra.basis` (`LinearAlgebra/CliffordAlgebra/Dimension.lean:118`: `b.ExteriorAlgebra.map (equivExterior Q).symm`, indexed by `Finset I`, so `repr a ∅` is the coefficient at the transported `1`), `basis_apply` (`:123`), `equivExterior_basis` (`:132`), `finrank_even` (`:250`); `IsFactorSet` (`Algebra/MonoidAlgebra/Twisted/Basic.lean:97`), `of_mul_of` (`:330`), `basis` (`:350`), `lift` (`:391`); `jonesDelta` (`KnotTheory/TemperleyLieb.lean:85`), `jonesUnit` (`:105`), `jones` (`:135`). Mathlib: `CliffordAlgebra.even : Subalgebra R (CliffordAlgebra Q)` (`LinearAlgebra/CliffordAlgebra/Even.lean:53`), `QuadraticMap.weightedSumSquares` (`LinearAlgebra/QuadraticForm/Basic.lean:1410`, `Σ w_i • v_i * v_i` at `:1419`), `AlgHom.equalizer` (`Algebra/Algebra/Subalgebra/Basic.lean:1030`). Duplication by object at the pins: no file of Tau Ceti mentions both `TemperleyLieb` and `Clifford` except a documentation reference in `Algebra/TemperleyLieb/Basic.lean:92`; no Potts, Fortuin–Kasteleyn or random-cluster object exists in Mathlib or Tau Ceti; no `ZMod 3` instance of the twisted monoid algebra exists; `jonesDelta a = √2` for `a² = −exp(−πi/4)` and `= √3` for `a² = −exp(−πi/6)`, as 1.7 and 1.8 state.

**Cross-roadmap citations resolved this round.** Subfactors at the head of #874 (`deecc6b`): 3.1 (`README.md:676`, the conjugate-linear adjoint fixing the generators, unique, commuting with `strandIncl`), 3.2 (`:697`; `R_n = {x : T_n(xy) = 0 for all y}` at `:726`; `markovTrace_nonneg_iff` and `jonesLoopParameters` at `:729–731`; `markovTrace_nonneg_iff_lt_floor` at `:732`), 3.3 (`:774`; `τ_n ∘ π_n = T_n` at `:788–790`; `ker π_n = R_n` at `:791`; the Markov formula `τ_(n+1)(ι_n(x) p_n) = δ⁻¹ τ_n(x)` with `p_n = δ⁻¹ U_n` and its normalised form at `:799–802`; `B_δ` at `:810–812`). VonNeumannAlgebras at #889 (`dee8088`): Layer 0 (`:275`), Layer 2 (`:523`), Layer 4 (`:970`), Layer 10 (`:2247`), 13.1 V13a (`:3690`); a second open pull request #1041 also adds a roadmap of this name, and the pull request's own text names #889 as the supplier. CStarAlgebras at #860 (`1d4e2ed`): C1–C5 (`:85, 263, 459, 497, 546`). CategoricalOperatorAlgebras at #888 (`79cccda`): CA1a (`:152`), CA2a (`:302`). CStarClassification at #863 (`db5a0c5`): CL2 (`:349`), 2.1 `IsAF` (`:351–355`), 2.2 Bratteli diagrams (`:376`). On main (`fa41b37`): TemperleyLieb Layers 0–7 (`:254, 283, 333, 485, 545, 606, 680, 767`) with the consumed names present (`presentedTLEquiv`, `negligibleIdeal`, `MonoidalQuotient`, `halfCount`, `gramPoly`, `existsUnique_isMarkovTrace`, `condExp`, `exists_qInt_eq_zero_iff`, `existsUnique_jonesWenzl`, `diagBasis`, `reflect`, `isSemisimpleRing_iff_of_charZero`, `CellModule`, `cellForm`) and `IsMarkovTrace.apply_jonesWenzl` as a Layer 6 target (`:242, 708`: the worker's single citation lead is this target name, not a pinned declaration); PivotalSpherical Layers 0–4 (`:257, 283, 318, 352, 387`); GrothendieckEulerForms Layer 2 (`:238`); GraphConnectivityAndFlows 1.1 (`:224`, `componentCount = Nat.card G.toSimpleGraph.ConnectedComponent` at `:253`); BelyiMaps Layer 2 (`BipartiteRibbonGraph` at `:897`); SpinGeometry G1 (`:136`, `κ_tens` at `:214–224`, `cliffordScalarTrace` at `:233`, the adjoint `κ_tens ∘ (id ⊗ reverse_ℝ)` at `:248`); SpinRepresentations, a sub-roadmap at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md`, Layer 0 (`:317`) and Layer 1 (`:354`; even subalgebra `M_(2^(l−1)) × M_(2^(l−1))` in dimension `2l` at `:390–391`, a single `M_(2^l)` in dimension `2l+1` at `:400`, the blocks 1.7 uses); TypeAHeckeAlgebras H3 (`:193`); GeometricTopology Layer 4 (`:409`, Markov moves `:445`, the Jones polynomial from the Kauffman bracket `:1050`), and no Clifford section on main (zero occurrences of the word in the file).

**Ownership.** `roadmaps grep` over main and the 433 open heads for `evenCliffordModel|cubicFixedModel|pottsPartition|Fortuin`: only this roadmap (27 lines). The board package index lists no competing package. The finite `√2` model is also declared at the head of #903 (`TauCetiRoadmap/GeometricTopology/CliffordJonesAlgebraTargets.lean:212`, namespace `TauCetiRoadmap.GeometricTopology.CliffordJones`, with README section 4.5.3 at `:2213`). That pull request revises the GeometricTopology roadmap that is on main, so it cannot be cited as a supplier, and GeometricTopology on main does not carry the section; this roadmap is therefore the owner of the model today, as the previous review ruled. The fully qualified names differ, so the two `Suggested.lean` files do not collide; whichever of the two merges second should reduce its copy to a citation of the other's section. Ownership against open pull requests whose files the brief did not give was not checked beyond `roadmaps grep`.

**Sources checked at their locators** (cache ids by their first eight characters; the roadmap has no `sources.toml`).

- Jones 1985, `bcae6367`: printed p. 104 = file page 2, lines 57–83 (the `A_n` on `n` projections with (I)–(III), the trace (IV)–(VI), Temperley–Lieb's representation and the Potts/ice equivalence, the trace as the restriction of the Powers state); printed p. 107 = page 5, lines 191–203 (at `t = i` the `A_n` are complex Clifford algebras; at `exp(πi/3)` a cubic Clifford algebra and finite braid image). Supports 1.5–1.8.
- Penneys, Chapter 4, `a5da4024`: Facts 4.4.14 from line 557 (printed 154), (TB4) lines 589–592 (printed 155, the adjoint on tree-basis matrix units for real `d`), (TB6) lines 600–602 (`d < 0` gives `(−1)^n Tr_n` positive), (TB7) lines 607–608 (negligible ideal `ℂ f^(n)` when `[n+1] = 0`); Definition 4.5.1 line 733, Proposition 4.5.3 line 745, Exercise 4.5.4 line 747 (printed 158); Example 4.6.12 line 941 (printed 163), Example 4.6.14 line 1000 (printed 164). Supports 1.1, 1.3, 1.4, 2.1, 2.2.
- Ridout–Saint-Aubin, `126aa444`: Theorem 4.7, (4.20), lines 1120–1129 (factor `[n−2p+1+j]/[j]`, exponent `d_(n,p−j)`, printed 20); Corollary 4.8 line 1140, Proposition 4.9 line 1162 (printed 21). Supports 1.2.
- Iohara–Lehrer–Zhang, roots of unity, `3a990ff3`: Proposition 3.1 lines 154–158, Remark 3.2 lines 159–162. Supports 1.3.
- Iohara–Lehrer–Zhang, Jones quotients, `8ec89b73`: (5.18) line 561, Proposition 5.3 lines 567–568, Theorem 5.4 lines 571–579 (`ℓ = 4`, `q = −exp(πi/4)`, `φ_n(f_j) = (1 + 2iγ_jγ_(j+1))/√2`, surjective onto `C_n⁰`, stated for `n ≥ 3`; with `γ_j = c_j/√2` this is `√2 p_j`), Proposition 5.5 lines 590–593 (the constant term is the Jones trace on `Q_n`). Supports 1.7; the roadmap covers `m ≤ 2` by its own `m ≤ 1` clause and the `R_2 = 0` case.
- Erdmann–Green, `6f192e41`: 2.1.1–2.1.6 lines 94–132 (`n ≥ 3`, printed 3–4), Proposition 2.2.4 lines 164–171 (printed 5), Proposition 2.2.5 lines 174–181, Proposition 2.4.4 lines 246–252 (printed 7), 2.5.4–2.5.6 lines 328–346 (printed 9). Supports 4.1–4.4.
- Graham–Lehrer 2003, `49bac728`: (TL) lines 357–361 with `δ_x = −(x + x⁻¹)` (printed 488), the presentation remark lines 378–380, §4 lines 398–400 (printed 489). Supports 4.1, 4.7.
- Chen, `fe11792b`: Theorem 5.4.4 lines 1723–1735 (`0 ≤ a, b ≤ n − 2`), Theorem 5.4.5 lines 1940–1941. Supports 3.4.
- Morin-Duchesne–Saint-Aubin, `d6f3a06c`: Corollary 4.2, (23), lines 1115–1119; Proposition 4.3, (29), lines 1275–1296 (`α = v^N + v^(−N)`). Supports 4.6 (misprint below).
- Chen–Przytycki, `ec149273`: §2 lines 25–53 (`⟨b_1,b_1⟩ = δ²`, `⟨b_1,b_2⟩ = α`, `⟨b_1,b_3⟩ = αδ`, Barad's factorisation; printed 1–2). Supports the 4.6 Check.
- Galindo–Rowell, `1052ac29`: §3.1 lines 223–244, Proposition 3.4 lines 232–242 (`U_1U_2 = q²U_2U_1`, `R` unitary), Proposition 3.6 lines 265–275 (conjugation (3.1)–(3.2) on the finite monomial set, central kernel of finite order). Supports 1.8.
- Rowell–Wenzl, `9897a868`: Remark 4.8 lines 911–915, Theorem 4.9 lines 917–925. Supports 1.8.

**Adversarial table, 1.7 at this head** (exact where shown as integers or fractions; otherwise complex floating point in an independent model of `Cl_m` on ordered monomials, and of `TL_m` through Tau Ceti's spin representation at `q = −exp(πi/4)`).

| Statement | Instances tried | Values on both sides | Result | Change |
|---|---|---|---|---|
| `d_j² = −1`, `d_j† = −d_j`, `p_j† = p_j = p_j²`, `p_j p_(j±1) p_j = p_j/2`, distant commutation | `m = 2, …, 5`, all `j` | all identities exact | holds | none |
| `s_2(p_0) = 1/2`, `T_2(e) = (√2)²·√2·s_2(p_0)` | `m = 2` | `1/2`; `1.414214 = √2 = δ` | holds | none |
| new Check `s_1(c_0) = 0 = ½ tr(L_(c_0))` | `Cl_1 = ℂ ⊕ ℂc_0` | `s_1(c_0) = 0`; trace of left multiplication `0` | holds | none |
| new Check `s_2(d_0 d_0) = −1`, `s_2(d_0† d_0) = 1` | `m = 2` | `−1`; `1` | holds | none |
| new Check `c_0 c_2 = d_0 d_1` in `Cl_3` | `m = 3` | equal as elements | holds | none |
| pairing `s_m(c_S c_T)` on `Cl_m⁰` diagonal `±1` | `m = 1, 2, 3, 4` (dims `1, 2, 4, 8`) | diagonal, every entry `±1` | nondegenerate | none |
| `F_m` onto: dimension of the algebra generated by the `p_j` | `m = 0, …, 5` | `1, 1, 2, 4, 8, 16 = 2^(m−1)` (`1` at `m = 0`) | holds | none |
| Markov `s_(m+1)(J_m(y) p_m) = s_m(y)/2` | random even `y ∈ Cl_(m−1)`, `m = 1, 2, 3` | `0.381887+0.127535i`, `0.046930+0.014174i`, `0.450714+0.015295i`, both sides | holds | none |
| trace identity `T_m(x) = (√2)^m s_m(F_m x)` against `markovTrace` | `m = 1, …, 4`, 5/7/11/17 words in the `e_j` | equal on every word; `T_2(1) = 2`, `T_2(e) = √2`, `T_3(1) = 2√2`, `T_3(e_j) = 2`, `T_4(e_j) = 2√2` | holds | none |
| `F_3(f_3) = 0` with `f_3 = 1 − √2(e_0 + e_1) + e_0e_1 + e_1e_0` | `m = 3` | image identically `0` | holds | none |
| `g_j = −(1 + d_j)/√2 = u((1+i)p_j − 1)`; `g_j² = d_j`, `g_j⁴ = −1`, `g_j⁸ = 1`; unitary; braid relation | `m = 3` | all exact | holds | none |
| eigenvalues `iu` on `p_0`, `−u` on `1 − p_0`; conjugation `c_0 ↦ −c_1`, `c_1 ↦ c_0` | `m = 2, 3` | exact | holds | none |
| braid image order `2^m m!` | `m = 2, 3, 4` | `8, 48, 384` | holds | none |
| `a_j = i c_j c_(m−1)`, `a_j² = 1`; without `i` | `m = 3` | `1`; `−1` | holds | none |
| `dim Cl_m⁰` | `m = 0, …, 5` | `1, 1, 2, 4, 8, 16` | holds | none |
| `m ≤ 1` clause and `hq` | `Fin 0`; `q = −exp(±πi/4)` | both sides `ℂ`, `F = id`; `−(q + q⁻¹) = √2` | holds | none |
| Jones-polynomial normalisation at the trivial braid | `m` strands | `(−√2)^(m−1) s_m(1) = (−δ)^(m−1)`, the `m`-component unlink at `t = i` | consistent | none |

**Adversarial table, 1.8 (new Checks recomputed) and the other Lean statements.**

| Statement | Instances tried | Values on both sides | Result | Change |
|---|---|---|---|---|
| `B(a, a) = 0`; radical at `N = 3`; nondegenerate at `N = 2` | all `a`; `ρ = (1,0,1)` | `B(ρ, e_j) = 0, 0, 0`, `B(e_0, e_1) = 1`; `N = 2` nondegenerate | holds | none |
| `α(e_0, e_1) = ω²`, `α(e_1, e_0) = ω`; cocycle at `(e_0, e_1, e_0 + e_1)` | `N = 2` | exponents `2, 1`; both sides `−0.5 − 0.866i = ω²` | holds | none |
| `cubicFactor_isFactorSet` (cocycle, `α(−a,−b) = α(a,b)`, `conj α(a,b) = α(b,a)`) | all triples, `N = 1, 2, 3` | exact | holds (proved in the file) | none |
| `U_j³ = 1`, `U_jU_(j+1) = ωU_(j+1)U_j`, `p_j† = p_j = p_j²`, `θ(p_j) = p_j`, `p_jp_(j±1)p_j = p_j/3`, `U_j† = U_j⁻¹` | `N = 1, 2, 3` | exact; `s_N(p_0) = 1/3` | holds | none |
| `†` anti-multiplicative, `s(x†x) = Σ|x_a|²`, `θ† = †θ` | random `x, y`, `N = 2, 3` | exact | holds | none |
| `dim C_N = (3^N + 1)/2` = dimension generated by the `p_j`; Gram determinant on `C_N` | `N = 1, 2, 3` | `2, 5, 14`; `|det| = 2, 16, 8192` | holds | none |
| Markov `s_(N+1)(I(x) p_N) = s_N(x)/3` | random `x`, `N = 1, 2` | `0.107082+0.210316i`, `0.102129+0.286171i`, both sides | holds | none |
| trace identity `T_m = (√3)^m s_(m−1) ∘ F_m` against `markovTrace` at `q = −exp(πi/6)` | `m = 1, …, 4`, 5/7/10/16 words | equal on every word; `T_2(e) = √3`, `T_3(1) = 3√3`, `T_4(e_j) = 3√3` | holds | none |
| `g_j` unitary, `θ`-fixed, `g_j³ = −i`, eigenvalues `i`/`−u`, braid relation, `= −(1 + ω²(U_j + U_j²))/√3` | `N = 1, 2, 3` | exact | holds | none |
| new Check: `−u` in place of `u` | `N = 1` | `g p_0 = −i p_0`, `g³ = +i` | holds | none |
| conjugation `g_0U_1g_0⁻¹ = ωU_1U_0⁻¹`, `g_1U_0g_1⁻¹ = ωU_0U_1`, `g_0U_0g_0⁻¹ = U_0` | `N = 2` | exact | holds | none |
| image orders | `N = 1, 2, 3` | `12, 96, 2592` | holds | none |
| `θ` fixes `W(e_0) + W(−e_0)`, not `W(e_0) − W(−e_0)`; `s_1` on both | `N = 1` | true/false; `0, 0` | holds | R01 (wording only) |
| `dim C_N` against `D_m` | `N = 0, …, 5` | `1, 2, 5, 14, 41, 122` both | holds | none |
| block sizes against `A_5` paths | `m = 2, 3, 4` | `(1, 1)`, `(2, 1)`, `(2, 3, 1)` = `(d_+, 3^k, d_−)` patterns; weights `1/3, 2/3` at `m = 2` | holds | none |
| `pottsPartition = fkPartition` (Lean semantics) | 9 graphs (empty, isolated, edge, loop, parallel, triangle, plaquette, path+isolated, loop+edge) × `q = 0, …, 3` | equal in all 36 cases; `q = 2`: `1, 8, 8, 6, 26, 144, 960, 80, 30` | holds | none |
| 1.6 plaquette loop identity | `δ = 1.7`, `v = (0.5, 1, 1.5, 2)` | `285.9238` both sides | holds | none |
| 1.6 `L(0.7, 1.3)` at `r = 1.7`; wired two-vertex | | `1.4647, 2.91`; `9, 3` | holds | none |
| `markovTrace_neg_one_pow_nonneg_iff` | `δ = −2`; `δ = −1/2`; `δ = 0` | `−T_1(1) = 2`, `T_2(e†e) = 4`; `T_2(f_2) = −3/4` with `f_2 = 1 + 2e`; at `0` all `T_n = 0` yet `0 ∉ J`, excluded by `δ < 0` | holds | none |

**Adversarial table, the other seeded targets (recomputed, Gram determinants by the half-diagram pairing over `ℚ`).**

| Statement | Instances | Values | Result |
|---|---|---|---|
| 1.1 diagram adjoint | two strands, `i·e` | `(i·e)† = −i·e`, `star(i·e) = i·e`; at `δ = i`, `κ` carries `e² = i·e` to `e² = −i·e` | holds |
| 1.2 anchors at `δ = 7/3` | `(n,t) = (2,0), (3,1), (4,2), (4,0), (5,1)` | `7/3 = [2]`, `40/9 = [3]`, `217/27 = [4]`, `1960/81 = [2]²[3]`, `79360000/59049 = [3]⁴(δ² − 2)`; wrong exponent gives `73290626560000/387420489` | holds |
| 1.2 indefinite; `δ = 0`; `δ = 1` | `δ = 1/2`, `n = 3`; `n = 3, 2`; `n = 2` | `det = −3/4`; `det G_(3,1) = −1`, `G_(3,3) = 1`, `G_(2,0) = 0`; `G_(2,0) = G_(2,2) = 1` | holds |
| 1.3 dimensions | `δ = √2`; `δ = 2`, `n = 4` | `dim Q_2 = 2`, `dim Q_3 = 4 = 5 − 1`; `4 + 9 + 1 = 14 = catalan 4` | holds |
| 1.4 weights | `n = 2`; `δ = φ`, `n = 3` | `1 + (δ² − 1) = δ²`; `[1..4] = 1, φ, φ, 1`, `2φ + 1 = 4.2361 = φ³` | holds |
| 1.5 `p_t` and slices | `t = 4` | rank-one projection, trace `1`; last-site slice `(4/25) I₂`, first-site slice `diag(16/25, 1/25)` | holds |
| 2.2 weights at level 2 | `δ = 2`; `δ = 3` | `(1/4, 3/4)`; `(1/9, 8/9)`, sums `1` | holds |
| 3.1 dagger on `Hom(0,2)` | `i·cup` | `(i·cup) ≫ (−i·cap) = δ·𝟙_0`; linear dagger gives `−δ·𝟙_0` | holds |
| 3.2 norms | `e`, `e_ie_(i+1)e_i` | `‖e‖ = δ`; `‖e_ie_(i+1)e_i‖ = δ`, not `δ³` | holds |
| 3.3 | `e ⊗ e` in `End(4)` | `(e_1e_3)² = δ²e_1e_3`, norm `δ²`; rescaled cup not balanced for `|c| ≠ 1` | holds |
| 3.4 truncated rules | `m = 4, 5` | `X_1 ⊗ X_1 = X_0 ⊕ X_2`, `X_2 ⊗ X_2 = X_0`; at `m = 5`, `X_2 ⊗ X_2 = X_0 ⊕ X_2` (`2m − 4 − 4 = 2`) | holds |
| 4.1 `ATL_2` | `W_(0,z)(2)`, `z = 2` | `e_1e_2e_1 b_1 = δa²b_1`, `a² = 25/4` | holds |
| 4.2 dimensions | `(2,0), (3,1), (4,0)` | `2, 3, 6` | holds |
| 4.6 Gram `n = 2, t = 0`; `n = 3, t = 1` | `σ_(2,0) = −1`, `σ_(3,1) = 1`; `X = 5/3`, `Z = 7/2` | `X² − (Z + Z⁻¹)²`; `63299/5292 = X³ − 3X + Z² + Z⁻²` | holds |
| 4.6 six-state determinant | `(d,a) = (3,0), (3,3), (5,2), (2,7)` | `321489`, `0` (rank `2`), `102102525`, `−184528125`, each equal to `(d² − a²)⁴((d² − 2)² − a²)`; leading `h⁴` coefficient `6⁴·40 = 51840` | holds |
| 4.6 `T_r(−v−v⁻¹) = (−1)^r(v^r + v^(−r))`; telescoping | `v = 5/2`, `r ≤ 5`; `n = 4` | all equal; `2 + 3 + 1 = 6 = E_(4,0)`; `2·4 + 4·1 = 12 = 2·C(4,2)` | holds |
| 4.7 valuation bound | `n = 2`, `t = 0`, `z = v = 5/2`; `v = z = i` | `F_2(x, v)` has a simple zero at `x = δ` (derivative `−2δ = 29/5`), bound `1`; `F_2(x, i) = −x²`, order `2`, Gram matrix zero | holds |

## Not verifiable

- Graham–Lehrer 1998 (doi 10.5169/seals-63902): uncertified and settled since r2; cited by locator, not reopened.
- Temperley–Lieb 1971 (doi 10.1098/rspa.1971.0067) and Baxter–Kelland–Wu 1976 (doi 10.1088/0305-4470/9/3/009): paywalled, cited by locator only; the Potts/ice equivalence they are cited for is independently supported by Jones 1985 p. 104 and the computations above.
- The order of the Gaussian braid image for `N ≥ 4` and of the Clifford braid image for `m ≥ 5` were not computed (`2592` at `N = 3` and `384` at `m = 4` were); finiteness and the formula `2^m m!` are what the README claims and what the cited sources and the conjugation argument give.

## Source issues

- **Misprint** in Morin-Duchesne–Saint-Aubin (arXiv 1203.4996) at Proposition 4.3, equation (29), printed p. 24: the source gives an unsigned product, which at `N = 2`, `d = 0` yields `α² − β²`; it should carry the leading-term sign, yielding `β² − α²` there; affects nothing (the roadmap supplies the sign `σ_(n,t)`; carried from r2).
- **Misprint** in Jones 1985 (doi 10.1090/S0273-0979-1985-15304-2) at printed p. 104, second paragraph: the text layer gives the Temperley–Lieb representation space of `A_n` as having dimension `2n+2`; it should be `2^(n+1)`, the `(n+1)`-site spin chain (superscript placement not confirmable from the extraction); affects nothing (carried from r7).
