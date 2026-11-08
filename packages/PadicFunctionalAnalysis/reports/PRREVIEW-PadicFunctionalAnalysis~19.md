# Review of PadicFunctionalAnalysis (pull request #1807 at 7e8275c)

**Verdict:** needs changes

Full review of the rewritten folder (README 1146 lines, `Suggested.lean` 134 lines; 2208 changed lines since 12e0624, the head the previous review read). The worker's gate at this head passes every check (`prnum=0 sorry-examples=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 depcheck=0 build=0 OK`), the dependency check prints `depcheck: 240 roadmaps, 2429 edges, 0 problem(s)` with no UPWARD or CYCLE line, and `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0 in 4 s with exactly six `declaration uses sorry` warnings (lines 63, 72, 90, 99, 113, 125). Ten of the previous review's eleven findings are repaired; R10 is partly repaired (R05 below). Two new findings are blocking: a statable headline named in the README's own list of central targets is absent from `Suggested.lean` (R01), and one §3.2 target states an "exactly when" that the zero module refutes (R02).

## R01 (P2) — The analytic-level criterion for weights (§5.4, with its §4.6 input) is statable at the pins and absent from `Suggested.lean`

Location: README lines 17–22 ("The central remaining targets are … analytic levels of weights"), §4.6 lines 757–759 ("`χ_t` lies in the image of `LA_h(K)` exactly when `‖t‖ < p^(−1/((p−1)p^h))`"), §5.4 lines 944–951; `Suggested.lean` module docstring lines 19–32, which names only the §4.7 bijection as not statable.

Claim: the Lean file states the roadmap's headline theorems that the pinned libraries do not prove.

Witness: the pinned `Amice/Character.lean` header (lines 36–39 at Tau Ceti `2fd255d9`) says the converse "that `χ_t` lies in the image of `LA_h(K)` only when `‖t‖ < r_h` needs Amice's basis theorem … it is not proved here". Every carrier of that converse, and of §5.4, is pinned: `TauCeti.AnalyticStage.eval` (`Distribution/AnalyticStage.lean`), `PadicInt.addChar_of_value_at_one` (Mathlib), `TauCeti.amiceRadius` (`Amice/Norm.lean` 98), `TauCeti.WeightSpace.principalChar` and `.coord` (`WeightSpace.lean` 122, 156) with `principalChar_eq_addChar_of_value_at_one` (185). The two statements below elaborate under `lake env lean` at the pins (two `sorry` warnings, no error; the module `TauCeti.NumberTheory.Padics.Distribution.Amice.Character` built first with `lake build`):

```lean
theorem exists_eval_eq_addChar_iff (h : ℕ) {K : Type*} [NormedRing K] [NormMulClass K]
    [NormOneClass K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [Module ℚ_[p] K]
    [NormSMulClass ℚ_[p] K] [IsUltrametricDist K] [CompleteSpace K] {t : K}
    (ht : Tendsto (t ^ ·) atTop (𝓝 0)) :
    (∃ f : TauCeti.AnalyticStage p h K,
        ⇑(TauCeti.AnalyticStage.eval ℤ_[p] f) = PadicInt.addChar_of_value_at_one t ht) ↔
      ‖t‖ < TauCeti.amiceRadius p h := by
  sorry

theorem exists_eval_eq_principalChar_iff (h : ℕ) {K : Type*} [NormedRing K] [NormMulClass K]
    [NormOneClass K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [Module ℚ_[p] K]
    [NormSMulClass ℚ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
    (κ : TauCeti.WeightSpace p K) :
    (∃ f : TauCeti.AnalyticStage p h K, ⇑(TauCeti.AnalyticStage.eval ℤ_[p] f) = κ.principalChar) ↔
      ‖κ.coord‖ < TauCeti.amiceRadius p h := by
  sorry
```

The hypotheses are those of the pinned section at `Amice/Character.lean` 254–256 (multiplicative norm, as the README's §4.6 and §5.4 require: "complete normed extension `K/ℚ_p`", "field-valued weight"). The second is §5.4 at principal-character level `h`, which is level `h + v_p(q)` on `ℤ_pˣ`: `amiceRadius p h = p^(−1/((p−1)p^h))` equals the README's `p^(−q/(p^(h+v_p(q))(p−1)))` since `q = p^(v_p(q))`, so the natural-number subtraction `h − v_p(q)` of the README's form is avoided. Both are true: "⇐" is the pinned `eval_addCharExpansion` (216); "⇒" is Amice's theorem (`amiceMap_bijective_and_norm_eq`) with `eval_injective` (`K` is a `ℚ_p`-module, so `p`-torsion-free), `eval_amiceMap` (the Mahler coefficients of `χ_t` are `t^n`, Mathlib `PadicInt.continuousAddCharEquiv`) and `tendsto_amiceCharCoeff_iff` (161); the second follows from the first by `principalChar_eq_addChar_of_value_at_one`.

Repair: add both theorems to `Suggested.lean` (the §4.6 one under a Layer 4 section comment, the §5.4 one under Layer 5), import `TauCeti.NumberTheory.Padics.Distribution.Amice.Character`, name them in §4.6, §5.4 and the "How to read the build" list of README lines 1047–1051, and reword §5.4 to state the level at which the principal character is analytic.

## R02 (P2) — §3.2: "contractive exactly when `‖g‖ ≤ 1`" fails for the zero module

Location: README lines 566–567 ("Target: multiplication by `g` on `C(ℤ_p,E)` is bounded by `‖g‖`, and is contractive exactly when `‖g‖≤1`"); Convention 3 (lines 78–79, "Empty indices and zero modules have norm zero") admit the instance.

Claim: multiplication by a continuous scalar function `g` is a contraction of `C(ℤ_p,E)` if and only if `‖g‖ ≤ 1`.

Witness: `E = 0`, `g = p⁻¹` (constant, `‖g‖ = p`): `C(ℤ_p, 0) = 0`, so multiplication by `g` is the zero map, contractive, while `‖g‖ = p > 1`. The same happens for any `E` on which the scalar action is not norm-faithful. The bound `‖g·f‖ ≤ ‖g‖‖f‖` is the correct general statement; the converse needs a vector that sees `‖g‖`.

Repair: state the "only if" for `E = R` with `NormOneClass R` (then `f = 1` gives `‖g‖ = ‖g·1‖ ≤ 1`), or for `E ≠ 0` with `NormSMulClass R E` (a constant `f = e ≠ 0` gives `‖g·f‖ = ‖g‖‖e‖`), and add `E = 0` as the negative-control Check.

## R03 (P3) — `matrixCoeffInputFirst` is a definition that no headline uses

Location: `Suggested.lean` lines 46–55; README lines 28–29 ("the input-first adapter of §2.6"), 502–503, 1047; module docstring lines 21–22.

Claim: the file keeps only the definitions its headline theorems need.

Witness: the body is `ContinuousLinearMap.matrixCoeff u i j` with the two indices swapped; none of the six sorried theorems mentions it, and the pinned `ContinuousLinearMap.matrixCoeff` (`Topology/ContinuousMap/ZeroAtInfty/Matrix.lean`) is the carrier consumers cite (CompactOperators on main line 43 cites "`matrixCoeff u j i` … PFA's transpose adapter" by section, LocallyAnalyticDistributions line 189 "output-first matrix coefficients"). A reindexing of a pinned definition is an API entry, not an acceptance test.

Repair: delete it from `Suggested.lean`; in README §2.6 keep the adapter as a target described in words (`B(u) j i = matrixCoeff u i j`, with the two product laws), without a backticked own name, and drop it from lines 28–29, 1047 and the module docstring.

## R04 (P3) — The module docstring does not name the §5.5 and §5.6 headlines as not statable

Location: `Suggested.lean` lines 30–32 ("The unbounded Amice bijection of §4.7 is not stated … The remaining targets of §§4.4–5.6 are specified in the README"); README lines 17–22 list "scalar analytic factors; and an annular Banach–Tate coefficient ring" among the central remaining targets.

Claim: the docstring says which headline theorems are not statable and what each lacks.

Witness: §5.5 (lines 962–979) expands `κ(cz+d)` on the closed unit disc and bounds its Gauss norm; its statement needs the analytic extension of a weight to `1+p^h𝒪_K`, which no pinned declaration provides (`TauCeti.WeightSpace` is `ℤ_[p]ˣ →ₜ* Rˣ`, `WeightSpace.lean` 81). §5.6 (lines 981–1012) is a construction (`H` with its normal forms and gauge); it has no carrier before the roadmap builds it. "Specified in the README" does not say either.

Repair: in the docstring, after the §4.7 sentence, name §5.5 (lacks a carrier for the extended character on `1+p^h𝒪_K`) and §5.6 (the ring `H` is itself a target) as not statable; after R03, drop "together with the input-first matrix adapter of §2.6".

## R05 (P3) — README shape and locator precision (R10 partly repaired)

Location: every layer ends with a bold "**Checks.**" list and a bold "**Dependencies.**" paragraph (lines 299–314, 376–384, 529–543, 612–628, 801–823, 1016–1040) instead of `### Examples` and `### Dependencies`; targets without a `*Needs:*` line: §0.4 (lines 289–296), §1.1 (331–332), §1.3 (355–357), §1.4 (370–374), §2.2 (425–427), §2.6 second and third bullets (509–516), §3.2 (566–567), §4.1 (637–646), §4.2 (652–656), §4.5 (735–744), §5.2 (855–872), §5.4 (944), §5.5 (964), §5.6 (983); "RestrictedPowerSeries Layers 0–2 and its open-disc algebra" (lines 172–173, 625–626, 819–820) where the open-disc algebra is RestrictedPowerSeries §7.1 (main, lines 704–720); "[LWX] §3.15" (line 1011) is Lemma 3.15 (LWX line 1215); Amice's theorem cites "[Am], [Col] I.4" (lines 59, 69 of the Lean file; README 820) where the theorem is Colmez Théorème I.4.7 (Col line 712) and the Mahler criterion Corollaire I.4.8 (714).

Repair: `### Examples` and `### Dependencies` subsections per layer; a `*Needs:*` line on each target listed; cite RestrictedPowerSeries §7.1, LWX Lemma 3.15, Colmez Théorème I.4.7 and Corollaire I.4.8.

## Previous findings

- R01 — repaired: `Suggested.lean` now has one definition and six sorried headlines (lines 52, 63, 72, 90, 99, 113, 125); none of the pinned declarations the previous witness listed is restated; the README cites them by name under "In the pinned library" in every section and lists them in the supplier table (lines 149–163); Amice's theorem is stated on the pinned `amiceMap` (63–67) with its integral case (72–75).
- R02 — repaired: §2.4 cites `TauCeti.Huber.BanachModule.CompletedTensor` with `.map` and `.lift` (lines 453–460); LocallyAnalyticDistributions appears only in "Owned elsewhere" (line 40) and "Downstream consumers" (1068–1073); the dependency check prints no UPWARD line.
- R03 — repaired: §5.3 cites `AbstractMeasure.extendCoefficients`, `TauCeti.measureFun`, `norm_measureFun_le`, `measureFun_injective` (lines 884–891); PadicMeasuresIwasawaAlgebras appears only as owner of what is deferred (lines 39, 552, 609) and as a consumer (1073–1089).
- R04 — repaired: module form with `public import Mathlib` and eleven `TauCeti.*` modules that exist at the pin (lines 1–14); gate `imports=0 mathlib-subimports=0 no-import-mathlib=0 build=0`.
- R05 — repaired: no `example` in the file; gate `sorry-examples=0`.
- R06 — repaired: no pull-request number, fork link or commit hash in the README (`grep github.com` is empty; gate `prnum=0`); the two Mathlib declarations are cited by name (lines 143–145).
- R07 — repaired: the seven backticked own names of the README are the seven declarations of the file (gate `readme-ids-missing=0`); every Lean name appears in the README (lines 502, 700–701, 914–916, 926, 935, 1047–1051).
- R08 — repaired: no proved one-term declaration remains; the one-tactic probe (below) closes nothing.
- R09 — repaired: module docstring "P-adic functional analysis: target signatures" (16–33), no global `Classical`, a docstring on every declaration.
- R10 — partly repaired: `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers` exist and the process wording is gone; `*Needs:*` lines exist on §2.4, §4.4, §4.6, §4.7 and §5.3 but not on the targets listed in R05, and layers still end in bold paragraphs. Re-raised as R05.
- R11 — repaired (stays repaired): `git diff --stat origin/main...HEAD` outside the pull request's fourteen folders is empty.

## Verified sound

**Gate, dependency check, elaboration.** The worker's gate at 7e8275c: every counter zero, `OK`. My rerun of the dependency check (`gate --depcheck … --movable`): `depcheck: 240 roadmaps, 2429 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean`: exit 0, six `sorry` warnings, no other warning. The elaborated signatures in the worker's `signatures.md` (seven declarations) were compared with the README statements: `amiceMap_bijective_and_norm_eq` carries `[Module ℤ_[p] E] [IsBoundedSMul ℤ_[p] E] [IsUltrametricDist E] [CompleteSpace E]` as §4.4 says; `exists_character_of_hasEval` and `eq_aeval_binomialSeries` carry `[IsLinearTopology S S] [CompleteSpace S] [T2Space S] [Algebra ℤ_[p] S] [ContinuousSMul ℤ_[p] S]` as §5.3's "complete separated linearly topologised `ℤ_p`-algebra"; `measurePairing_injective` is on `AbstractMeasure ℤ_[p]ˣ ℂ_[p] ℂ_[p]` as §5.3's "bounded `ℂ_p`-valued measures on `ℤ_pˣ`". No binder is dropped.

**One-tactic probe.** A scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | exact (by simp) | sorry`: lines 63, 72, 90 unchanged (`sorry`); lines 99, 113, 125 end in "unsolved goals" after `simp` rewrites (`κ x = κ (section (x mod q)) * aeval (binomialSeries …)`, `aeval (amiceTransform μ) = toCompletedGroupAlgebra (map ofAdd μ)`, `Injective fun μ κ ↦ μ κ.weightTest`). Nothing closes; no padding among the theorems (R03 is the definition).

**README identifiers at the pins.** All 319 backticked dotted or library identifiers of the README were resolved by a declaration scan of the pinned Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (namespace-qualified): 312 resolve to a declaration with the cited qualified name; `NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero` is the `to_additive` form in Mathlib `Topology/Algebra/InfiniteSum/Nonarchimedean.lean` (used at its line 123); `TauCeti.NormedRing.IsTate.isTateRing` is the instance at `PseudoUniformizer.lean` 313 (`[SeminormedCommRing R] [IsUltrametricDist R] [IsTate R]`, built from `Huber.IsTateRing.of_isUnit_norm_lt_one`, no completeness, as §0.4 says); `TauCeti.RingOpNorm` is the namespace of the scoped instances (`RingOpNorm.lean` 156); `a_n`, `b_n`, `c_n`, `sorry` are notation. Every pinned file path in the supplier table (lines 149–163, brace lists expanded) exists at the pin. Declarations opened and read this round, file and line: `Amice/Basis.lean` 393, 406–463, 494, 537, 542 and its header (Amice's theorem "not proved here"; the matrix "congruent modulo `p` to an upper triangular matrix with unit diagonal" in the order the README's §4.4 target describes); `ZeroAtInfty/Triangular.lean` 132, 233–239 (`[SeminormedRing R]`, no Tate hypothesis, so it applies over `ℤ_p`); `Bases/Orthonormal.lean` 107; `WeightSpace.lean` 81, 94, 112, 122, 156, 174, 180, 185, 223–229, 280–290; `UnitsDecomposition/Logarithm.lean` 75, 243, 318, 383, 416, 423, 431; `CompletedGroupAlgebra/PowerSeries.lean` 350–352, 368 (`ℤ_p⟦X⟧ ≃ₐ[ℤ_p] ℤ_p[[Γ]]`, `X ↦ γ − 1`); `ProP/PadicInt/Basic.lean` 153, 184; `Measure/CompletedGroupAlgebra.lean` 133, 449; `Measure/CharacterIntegral.lean` 92; `Measure/Units/WeightIntegral.lean` 70–77, 113, 126; `Amice/Character.lean` 14–60, 161, 196, 216, 279; `Amice/Norm.lean` 98; `ZeroAtInfty/FiniteCoordinates.lean` 40–41, 46, 78, 95 (`[Module.Finite R P] [CompleteSpace P]`, Tate `R`); `RingTheory/Huber/ClosedSubmodule.lean` 132 (`[IsNoetherian A V]`: finite modules, so §2.6's closed-finite-submodule target is not pinned); Mathlib `Measure/Basic.lean` 40, 105, `Measure/AmiceTransform.lean` 158, 231, `RingTheory/PowerSeries/Evaluation.lean` 60 (`HasEval a := IsTopologicallyNilpotent a`), `RingTheory/PowerSeries/Binomial.lean` 47.

**Suppliers on main (content at eaf17b1).** AdicSpaces (`Completed/`) Layer 0 (line 135); RestrictedPowerSeries Layers 0–2 (191–395) and §7.1 (704); NewtonPolygons Layer 1 "Additive valuations and normalisation" (442); ProfiniteProPGroups (`Completed/`) "Layer 9 prerequisites" (1656) with `powerSeriesCoordinate` (1796–1810) and `prodPowerSeriesCoordinate` (1837, 1862); LocalFieldsRamification (`Completed/`) logarithm and exponential (395–407). All earlier than this roadmap or completed; the depcheck agrees.

**Consumers on main and at open heads.** AdicSpacesPartII R0.4 (line 2270, "Supplied by PadicFunctionalAnalysis §0.4", names `tateGauge`, `exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow` at 340) and §§2.2, 2.4 (341): the README's Downstream bullet maps those names to the pinned `TauCeti.Huber.*`. AdicSpacesPartIII R3.6 (606, `countable-type-closed-subspace-section`, "Transport of PadicFunctionalAnalysis §2.4's splitting"). CompactOperators line 43 (`matrixCoeff u j i`) and 266 ("apply this criterion to the PFA transition"). PadicMeasuresIwasawaAlgebras lines 352–367 cite §3.4 clauses and §5.3 clauses with the old Lean names; the Downstream bullet (1073–1089) gives each old name its pinned declaration, and `exists_character_of_hasEval`, `eq_aeval_binomialSeries` remain targets here. LocallyAnalyticDistributions at #854 (read with `roadmaps show`): lines 175–211 consume §§1.4, 2.1–2.2, 2.6, 4.3–4.4, 4.7 by section; its §0.1 takes the topology of `LA(ℤ_p,L)` and `D(ℤ_p,L)` from PadicLocalLanglandsForGL2Qp §0.1 (line 180) and its §1.4 point-mass and convolution identities from §4.7 here (301, 309): consistent with the §4.7 targets and with "no global topology" (Convention 9). QuaternionicModularForms at #934 lines 227–233 consume §§4.1–4.6, 5.2–5.5 and "§5.6 the annular ring `H`, its gauge `‖T‖=α`, its specialisations `T↦t` and the identity `(p,T)=(T)`": §§5.5–5.6 are owned here and consumed there. OverconvergentAutomorphicForms at #1422 line 539 evaluates `κ(cz+d)` with "an actual analytic extension of κ"; it builds no scalar expansion of its own. No second owner of Amice's theorem, the adic universal character, the Amice-coordinate comparison, separation by weights or `H` was found by `roadmaps grep` over the 466 open pull requests and main.

**Overlaps.** #1808 and #1854 carry this folder with #1807's earlier §5.3 text (`roadmaps show PadicFunctionalAnalysis --pr 1854` differs from main only at lines 918–922, the previous §5.3 paragraph, and its `Suggested.lean` equals main's); both are stacked on #1807 (its description), and the overlaps index reports no conflict in this folder for either, so the rewrite at this head supersedes their copies on merge. No id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id other roadmaps cite (consumers cite section numbers that still exist: §0.4, §§1.2–1.4, §§2.1–2.7, §3.4, §§4.3–4.7, §§5.1–5.6).

**Seeded sample, against the sources.** 0.2 and 0.3: JN Lemmas 2.1.6–2.1.7 at JN lines 460–492 (the two-regime bound and the power comparison `C₁|a|₁^s ≤ |a|₂ ≤ C₂|a|₁^s`, `|ϖ|₂ = |ϖ|₁^s`, both norms with multiplicative `ϖ`), matched by the README's 0.3 paragraph and the pinned `RingEquiv.exists_pos_norm_le_mul_rpow`; KL Remark 2.4.4 at KL lines 1538–1547 (the gauge formula, without `z ∈ A₀`: the README's §0.4 hypothesis and Check add it). 1.1, 1.2: JN §2.1 and Buz §2 (Buz Lemma 2.2, lines 200–208: an abstract homomorphism from a finite Banach module is continuous, via the open mapping theorem, the §1.4 target's bridge); BGR 3.7 uncertified. 2.2, 2.3, 2.4: Serre Propositions 1–5 (Serre lines 60–177: orthonormal bases, matrices of operators, the local-compact case); Buz Lemma 2.3 (lines 328–342: finite coordinates detect a finite submodule, `A` Noetherian, the §2.6 closedness target); Conrad Lemma 1.1.5 (lines 274–276: `A → k'⊗̂A` faithfully flat, `A'⊗M → A'⊗̂M` a topological isomorphism for finite `M`), the §2.4 corollary's model. 2.6: Buz 2.3(a)–(c) as above. 3.1, 3.3: Mah Theorem 1 (Mah lines 156–160, `a_n → 0` and `f = Σ a_n binom(x,n)`); van der Put is pinned. 4.4: Col Théorème I.4.7 (Col line 712: `⌊n/p^h⌋! binom(x,n)` an orthonormal basis of `LA_h(ℤ_p,L)`) and Corollaire I.4.8 (714–720: `φ ∈ LA ⇔ liminf v_p(a_n)/n > 0`, with `liminf ≥ 1/((p−1)p^h)` at level `h`), matching the README's second and third §4.4 bullets; the roadmap's generality (complete ultrametric `E` with contractive `ℤ_p` action) is the one the pinned `Amice/Basis.lean` header sets up (the change of basis is `ℤ_p`-integral and triangular, Col lines 723–747). 4.5: pinned. 4.6: `tendsto_amiceCharCoeff_iff` at the pin, Col I.4 (the character `(1+z)^x`, Col lines 1496–1500). 4.7: Col Théorème II.2.2 (line 1502–1504: `μ ↦ A_μ` a Fréchet isomorphism `D(ℤ_p,L) → R⁺` with `v_{B(0,u_h)}(A_μ) ≥ v_{LA_h}(μ) ≥ v_{B(0,u_{h+1})}(A_μ) − 1`, i.e. `S_h ≤ D_h ≤ p·S_{h+1}`), RJW Theorem 3.43 (line 1453, citing Col II.2.2), ST Theorem 2.2 (line 316, Amice's theorem in Schneider–Teitelbaum's several-variable form). 5.3: RJW Proposition 3.16 (line 816: `M(G,O_L) ≅ lim O_L[G/H]`), Theorem 3.25 (959: the Mahler transform is an `O_L`-algebra isomorphism `M(ℤ_p,O_L) → O_L⟦T⟧`, with `δ_a ↦ (1+T)^a` at 955), Remark 3.47 (1492–1516: weights of `ℤ_pˣ` as `|Δ|` copies of the open disc, a measure determined by its integrals against characters, for odd `p`). LWX Lemma 3.15 (line 1215: `Λ⟦pT⁻¹⟧ = ℤ_p⟦T, pT⁻¹⟧ ⊗ ℤ_p[Δ]` with `m_Λ Λ_{>1/p} = (T)`), the §5.6 comparison.

**Adversarial table.** `g` is `tateGauge`; rows marked (carried) keep the values of the earlier reports, re-read against the rewritten text this round.

| Statement | Instance | Left | Right | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `amiceMap_bijective_and_norm_eq`, `E = 0` | any `h` | `C₀(ℕ,0) = 0` | `LA_h(0) = 0` | bijective, norms `0 = 0` | none |
| same, `h = 0`, `p = 2` | `e_{0,n} = n! binom(x,n) = x(x−1)…(x−n+1)` in `w = x` | column `n`: degree `n`, leading coefficient `1`, entries `≤ 1` | upper triangular, unit diagonal, null columns | isometric automorphism by `Triangular.lean` 233 | none |
| same, `E = 𝔽_p` (trivial norm) | `h = 0`, `n = p` | expansion of `x^p − x`: `(0, −1, 0, …, 1)` | nonzero | coefficient-level bijection survives torsion (the pin's reduction mod `p`) | none |
| `isOrthonormalBasis_amiceTerm` | `a = Σ a_n single n`, `E = ℤ_p` | `amiceMap a = Σ a_n amiceTerm n 1` | `‖a‖ = max‖a_n‖` | orthonormal family; dense span from surjectivity | none |
| `exists_character_of_hasEval`, `S = 0` | `η`, `z = 0` | `WeightSpace p 0` a point, `coord = 0` | `HasEval 0` | holds | none |
| same, `S = ℚ_p` | — | `IsLinearTopology ℚ_p ℚ_p` false (only ideals `0`, `ℚ_p`) | excluded | README line 1027 agrees | none |
| same, `S = ℤ_p[ε]/ε²` | `z = ε` | `ε² = 0`: `HasEval ε` | weight `s ↦ 1 + sε` | exists; README Check 1024–1026 agrees | none |
| same, existence/continuity | open ideal `I`, `z^n ∈ I` for `n ≥ N` | `binom(s,n) z^n ∈ I` for all `s` | tail uniform in `s` | `s ↦ (1+z)^s` continuous; uniqueness from `T2` and density of `ℤ` | none |
| `eq_aeval_binomialSeries` | `x = 1`; `x = γ`; `x = section δ` | `κ(1) = 1`; `κ(γ)`; `κ(section δ)` | `1·aeval 1`; `aeval(1+X) = 1 + T_κ`; `finiteChar δ · 1` | agrees (`padicIntUnitsEquivZModUnitsProd_padicUnitsGenerator = (1, ofAdd 1)`, `…_padicUnitsSection δ = (δ, 1)`) | none |
| `amiceTransform_completedGroupAlgebra_compat` | `μ = δ_a` | `powerSeriesCoordinate((1+X)^a) = (1+(γ−1))^a = [ofAdd a]` | `completedGroupAlgebraEquiv(δ_{ofAdd a}) = [ofAdd a]` (`toCompletedGroupAlgebra_dirac`) | agrees; `T = [γ]−1` (`powerSeriesCoordinate_X`) | none |
| `measurePairing_injective` | `μ ≠ 0`; finite-order weights | `ℂ_p ⊇ μ_{p^n}, μ_{p−1}`: characters of `(ℤ/p^n)ˣ` span its functions | locally constant functions dense in `C(ℤ_pˣ,ℂ_p)` | `μ` vanishing on all weights is `0` | none |
| `matrixCoeffInputFirst` (R03) | `2×3`, `3×2` over `ℚ_p` | `B(u∘v) = B(v)B(u)` | `A(u∘v) = A(u)A(v)` transposed | consistent; no headline uses it | R03 |
| §4.6 function-level criterion (R01) | `p = 2`, `‖t‖ = 2^{−1/2}`, `h = 1, 2` | `r_1 = 2^{−1/2}`, `r_2 = 2^{−1/4}` | fails level 1, holds level 2 | pinned `not_tendsto_amiceCharCoeff_one_and_tendsto_amiceCharCoeff_two`; function form absent | R01 |
| §5.4 level formula (R01) | `h ≥ v_p(q)`, `γ^{p^{h−v_p(q)}} = exp(p^h)` | `‖κ(exp p^h) − 1‖ < r_p` | `‖T_κ‖ < p^{−1/((p−1)p^{h−v_p(q)})} = p^{−q/(p^h(p−1))}` | agrees (`q = p^{v_p(q)}`) | R01 (state at principal-character level) |
| §3.2 "contractive exactly when" (R02) | `E = 0`, `g = p⁻¹` | multiplication is `0`, contractive | `‖g‖ = p > 1` | false | R02 |
| §3.2 bound | `E = R`, `f = 1` | `‖g·1‖ = ‖g‖` | `≤ ‖g‖‖1‖` | converse holds with `NormOneClass` | R02 |
| §5.2 conductor valuations | odd `p`, `m ≥ 2`; `p = 2`, `m ≥ 3` | principal order `p^{m−1}`; `2^{m−2}` | `v_p(ζ−1) = 1/(p^{m−2}(p−1))`; `1/2^{m−3}` (`m = 3`: `ζ = −1`, `v_2 = 1`) | agrees | none |
| Convention 10, `p = 2` | `ℤ_2[Δ]`, `Δ = {±1}` | local, maximal ideal `(2, δ−1)` | `ℤ_2[Δ] → ℤ_2 × ℤ_2` index 2 | no integral product; series ring maximal ideal `(2, T, δ−1)` | none |
| §5.3 `[x] = [x̄](1+T)^{s(x)}` | `x = γ`; `x = ω(δ)` | `(1, 1)` → `1+T`; `(δ, 0)` → `[δ]` | decomposition | agrees | none |
| §4.4 transition multiplier | `m_h(n)/m_{h+1}(n)` | `v_p = ⌊n/p^{h+1}⌋` (Legendre) | `→ ∞` | norm `→ 0`, diagonal | none |
| §4.4 Mahler criterion | `f ∈ C(ℤ_p,E)`, `E` a Banach `ℚ_p`-space | `f = eval(amiceMap c)` with `a_n = m_h(n)c_n` | `c_n → 0 ⇔ ‖a_n‖/‖m_h(n)‖ → 0`, `‖f‖_h = sup` | Col I.4.7–I.4.8 | none |
| §4.5 generators | `p` odd; `p = 2`: `4`, `2` | `‖p‖ = p^{−1} < p^{−1/(p−1)}` iff `p > 2`; `‖4‖ = 1/4 < 1/2`; `‖2‖ = 1/2 = r_2` | convergence disc `‖z‖ < r_p` | `exp(p)`, `exp(4)` valid, `exp(2)` not | none |
| §4.7 `b_n = 1/n!` | `h = 0, 1` | `D_0 = sup‖1/n!‖‖n!‖ = 1`; `D_1 = sup p^{⌊n/p⌋}` | — | bounded at 0, unbounded at 1 | none |
| §4.7 stage norm | `μ` on `LA_h`, Amice basis | `μ(e_{h,n}) = m_h(n) b_n` | dual of `c₀` is `ℓ∞` | `‖μ‖_h = sup‖b_n‖‖m_h(n)‖` | none |
| §4.7 `S_h ≤ D_h ≤ p S_{h+1}` | Col II.2.2 valuations | `v_{B(0,u_h)} ≥ v_{LA_h} ≥ v_{B(0,u_{h+1})} − 1` | norms `p^{−v}` | agrees | none |
| §5.6 `H ≃ ℤ_p[[T,U]]/(TU−p)` | `d_{−m} T^{−m}`, `m > 0` | `= (d_{−m}/p^m) U^m`, needs `v_p(d_{−m}) ≥ m` | normal form `Σ a_m T^m + Σ b_m U^m` | agrees with LWX Lemma 3.15 | none |
| §0.4 Check `(ℤ_p,p²,p)` (carried) | `x = p, p²`, `ϖ = p²` | `g(p) = 1`, `g(p²) = p⁻¹` | README `1, p⁻¹` | `g(p)² ≠ g(p²)` | pinned `Padic.tateGauge_subring_sq_values_and_not_mul` |
| §0.4 membership `ϖ ∈ A₀` (carried) | `ℚ_p²`, `A₀ = {x ≡ y mod p²}`, `ϖ = (p,p²)` | `g(1) = 1`, `g(ϖ) = a⁻¹`, `g(1+ϖ) = a²` | `a² > max(1,a⁻¹)` | ultrametricity fails; `hϖ` in `exists_tateSeminorm` | none |
| §0.4 `N(x) = max(|x|,|x|²)` (carried) | `|ϖ| = r < 1` | `N(ϖ)N(ϖ⁻¹) = r⁻¹` | `> 1` | no multiplicative pseudo-uniformiser | none |
| §0.3 `|·|` vs `|·|²` on `ℚ_p` | `a → 0` | `|a|²/|a| = |a| → 0` | no `C₁|a| ≤ |a|²` | same topology, no linear comparison | none |
| §0.2 Neumann (carried) | `‖x‖ < 1`; `x = 0` | `‖(1−x)⁻¹‖ = 1`, `‖(1−x)⁻¹ − 1‖ = ‖x‖` | `1`; `0` | agrees | none |
| §1.4 Checks | `(x,y) ↦ x+py` on `ℚ_p²`; `id : (ℤ_p,|·|²) → (ℤ_p,|·|)` | preimage `(n,0)`, constant 1; `‖id x‖/‖x‖' = 1/|x| → ∞` | — | lifting constant 1; continuous, unbounded (`ℤ_p` not Tate) | none |
| `le_ringOpNorm` (carried) | `R = ℤ_p`, `u = id : (ℤ_p,|·|²) → (ℤ_p,|·|)` | `sInf ∅ = 0` | — | `IsTate R` excludes it | none |
| `exists_isOrthonormalBasis_iff` (carried) | `I = ∅`; zero ring; incomplete `c₀` | `M = 0`; `‖1‖ = 1 ≠ 0`; no isometry | `C₀(∅,R) = 0`; excluded; `CompleteSpace` | agrees | none |
| §2.3 Checks | `ℚ_p` with `p^{1/2}|·|`; `ℚ_p⟨X⟩/(X)`, family `{1}` | norms not in `p^ℤ`; `‖X·1‖ = 0` | `isONable_iff_discrete_norm`; orthogonality uses `‖a_i e_i‖` | potentially, not isometrically ONable; orthogonal singleton, torsion, not free | none |
| `exists_finset_norm_le` (carried) | `P = 0`; `P = R·single i₀` | `S = ∅`, any `C`; `S = {i₀}`, `C = 1` | pinned `∃ C > 0` | holds | none |
| `exists_continuousLinearEquiv_prod_of_countableType` (carried) | `K⟨T⟩` constants | Schneider splitting | — | holds | none |
| §3.2 Mahler of `x²` (carried) | `x² = binom(x,1) + 2binom(x,2)` | same | pinned example | agrees | none |
| §3.4 `x^p − x` (carried) | `x = 1+p` | valuation 1 | sup `p⁻¹`, Gauss `1` | agrees | none |
| §3.4 `φ, ψ` at `p = 3` (carried) | `δ₂`, `δ₆`, `δ₁` | `φδ₂ = δ₆`, `ψδ₆ = δ₂`, `ψδ₁ = 0` | README | agrees | none |
| §3.4 `p^{−n}` moments | `sup_n p^n` | unbounded | `norm_toCLMEquiv_eq_iSup_coeff` | not a moment sequence | none |
| `existsUnique_integral_iff_norm_le_one` (carried) | `δ₀`; `p⁻¹δ₀` | `1`; `p` | `≤ 1`; false | agrees | none |
| §4.3 transition (carried) | `k = 1`, `w = b + pv` | `d_1 = Σ k b^{k−1} p c_k` | contraction `p^j` | agrees | none |
| §4.6/4.7 `‖t‖ = 2^{−1/2}` (carried) | `p = 2`, `h = 1, 2` | thresholds `2^{−1/2}, 2^{−1/4}` | fails 1, passes 2 | agrees | none |
| §5.5 Gauss norm (carried) | `p = 2`, `h = 2`, `‖ℓ‖ < 1/2` | coefficient valuation `2(n−1) − v(n) ≥ 0` | constant term 1 | Gauss norm 1 | none |
| §5.6 gauge, evaluation (carried) | `‖T‖ = α`, `‖U‖ = 1`, `‖p‖ = α`; `p⁻¹ < |t| < 1` | `|d_m||t|^m ≤ (p|t|)^{−|m|}` | `→ 0` iff `p|t| > 1` | annulus right; `Σ U^j` formal, not convergent | none |
| §5.3 Dirac extension (carried) | `ν = δ_a` to `ℂ_p` | `‖ν_{ℂ_p}‖ = 1`, value `κ(a)` | `|κ(a)| = 1` | `norm_measureFun_dirac` | none |

## Not verifiable

- [Sch] Schneider, *Nonarchimedean Functional Analysis*: settled as uncertified; cited by locator only (§§3–4, §§8–10).
- [Bel] Bellaïche, *The Eigenbook* Chapter II: settled as uncertified.
- [BGR] Bosch–Güntzer–Remmert §§2.7, 3.7: settled as uncertified; 2.7.1/4 and 3.7.3 are relayed through Conrad line 272 and JN.
- [Am] Amice 1964 is an OCR'd scan (2272 lines); the README cites it without a theorem number, and the basis theorem was checked in Colmez I.4.7 instead (R05 asks for that locator).
- [Mah] is an OCR'd scan; Theorem 1 (lines 156–160) is legible, the displayed series only partly.
- Ownership was checked against main and the open pull requests the brief lists plus LocallyAnalyticDistributions #854 (read through `roadmaps show`); CompactOperators and PadicMeasuresIwasawaAlgebras were read on main.

## Source issues

- **Gap** in KL at Remark 2.4.4, arXiv v5 p. 39 (KL lines 1538–1547): the source says that for any ring of definition `A₀` and topologically nilpotent unit `z` the function `inf{cⁿ : z⁻ⁿx ∈ A₀}` is a Banach-ring norm; it should require `z ∈ A₀` (or a power of `z` in `A₀`), since otherwise the ultrametric inequality can fail (`ℚ_p²`, `A₀ = {x ≡ y mod p²}`, `z = (p,p²)`); affects a stated result. The roadmap's §0.4 and the pinned `TauCeti.Huber.exists_tateSeminorm` add the hypothesis.
- **Error** in JN at Lemma 2.1.6, published version (JN footnote 3, line 500): the source says the published statement of the lemma is incorrect; it should be the arXiv v4 statement with the two-regime bound `|a|_ϖ ≤ C₁` for `|a|_π < 1` and `|a|_ϖ ≤ C₂|a|_π^s` otherwise; affects a stated result; corrected in print at arXiv:1604.07739v4 Lemma 2.1.6.
