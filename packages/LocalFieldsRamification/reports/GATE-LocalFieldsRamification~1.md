# GATE-LocalFieldsRamification~1: answers to human review

Commits `adf8bb17` (review answers) and `9fe00eb9` (repairs of the worker's checks) on top of `b58725d` (not pushed). Files changed: `TauCetiRoadmap/LocalFieldsRamification/README.md`, `TauCetiRoadmap/LocalFieldsRamification/Suggested.lean`.

## H01 (roed-math) — applied differently
The cyclic prime-power arithmetic step is in the Hasse–Arf entry of `README.md` (Layer 3, from `b58725d`): lower breaks `b_0 < … < b_{r−1}` of a totally ramified cyclic degree-`p^r` extension, Sen divisibility `p^{j+1} ∣ (b_{j+1} − b_j)` for `0 ≤ j < r−1` (Fesenko–Vostokov III §4, pp. 91–93), the Herbrand sum `u_j = b_0 + Σ_{a<j} (b_{a+1} − b_a)/p^{a+1}`, detection of each positive jump through a cyclic `p`-primary quotient, and invariance after removing the unramified part. This round fixes how that step is listed: the line "Proposed Lean-facing target declarations: `CyclicLowerBreakData`, `sen_cyclic_power_break_divisibility`, …" named five declarations that `Suggested.lean` does not have. It now lists the same targets in prose, with only `hasseArf` backticked. It also adds three Checks: your `C₄` filtration (breaks `2, 3`, upper breaks `2, 5/2`, excluded because `2 ∤ 3 − 2`), `ℚ_2(ζ_8)/ℚ_2` (lower `1, 3`, upper `1, 2`, detected by `ℚ_2(i)` and `ℚ_2(√2)`), and the jumps at `−1`, `0` and in degree one.

## H02 (roed-math) — applied
The false example "`ℚ_p` with the discrete topology has finite quotients by non-open subgroups" is gone at this head, as of `b58725d`. `README.md` Layer 1, "The power subgroup is open", now uses the finite-support subgroup of `(ℤ/2)^ℕ`. That subgroup is dense, and pulling back the kernel of a nonzero functional on the nonzero `𝔽₂`-space quotient gives a proper dense subgroup of index 2, which is therefore not open. Searching for "discrete topology" finds no other occurrence.

## H03 (roed-math) — applied
`README.md` Layer 2, "Norms", false generalization: "the norm-equation criterion is false there in both directions" became (at `b58725d`) "the sufficiency half … is false there". The text adds that `f = 1` at `ℚ_2(√2)/ℚ_2`, where `[ℤ_2ˣ : N(𝒪[L]ˣ)] = 2 = e`, and that necessity holds in every extension because `v_K(N y) = f · v_L(y)`.

## H04 (roed-math) — applied
At the pinned Tau Ceti, `TauCeti.map_normUnits_unitFiltration_psiNat_add_one_le` and `…_psiNat_le` (`Norm/Herbrand.lean:168,177`) and `TauCeti.normGradedMap_tame_break_zero`, `_zero_before_break`, `_positive_before_break`, `_at_break` (`Norm/Graded.lean:293,385,397,646`) exist. `normGradedMap` was already a reducible alias of the native map. In `Suggested.lean` the five wrappers `map_norm_unitFiltration_psiNat_le`, `normGradedMap_tame_break_zero`, `normGradedMap_zero_before_break`, `normGradedMap_positive_before_break` and `normGradedMap_at_break` went from `sorry` to proofs by the native theorems, in the same pattern as the existing `normGradedMap_after_break`. Their signatures are unchanged.

## H05 (kim-em) — answered
The claims in this status comment hold at `b58725d`. The Sen divisibility, the Herbrand sum, quotient detection, the unramified reduction and the separate `−1`, `0` and degree-one cases are in the Hasse–Arf entry, and the prime-degree norm indices are explicitly not a premise. Two corrections: the five "proposed" declaration names were not declared in `Suggested.lean` (fixed under H01); and the file has 79 admitted declarations after H04 (45 after the repairs below).

## Adversarial pass (statements added or changed)

| statement | instances | computed values | result | change |
|---|---|---|---|---|
| Sen divisibility `p^{j+1} ∣ b_{j+1}−b_j` (zero-based) vs one-based `p^j ∣ b_{j+1}−b_j` | r=1; r=2 with `C₄` filtration | r=1: empty range; `C₄`: `b_1−b_0 = 1`, `2 ∤ 1` | indexings agree; excludes the abstract `C₄` filtration | Check added |
| Herbrand sum `u_j` | `C₄` (2,3); `ℚ_2(ζ_8)` (1,3) | `φ(3) = 2 + 1/2 = 5/2`; `φ(3) = 1 + 2/2 = 2` | slope `1/(G_0:G_t)` correct | Check added |
| cyclic quotient detection | `ℚ_2(ζ_8)`, `G = C₂×C₂`, quotients by `{1,5}`, `{1,7}`, `{1,3}` | upper jumps `1`, `2`, `2`; disc. exponents `2`, `3`, `3` give `d = t+1`, so `t = 1`, `2`, `2` | jumps of `G` (1, 2) are each detected | Check added |
| character of `p`-power order separating `G^u/G^v` | `χ` of order `p^a m`, `gcd(m,p)=1` | `χ^m` restricted to `G^u` still has order `p^a ≥ p` | exists | none |
| endpoints | degree 1; unramified, `G_0 = 1`; tame, `G_1 = 1` | no jump; jump at `−1` only; jump at `0` only | integral | Check added |
| `tame_break_zero` wrapper | native gives `ker = finrank`, `index = finrank`; `Subgroup.index = Nat.card (G ⧸ H)` | after rewriting `finrank = ℓ` it closes by `exact` | elaborates | proof closed |
| `zero/positive_before_break`, `at_break` wrappers | roadmap `UpperJump` vs native, via `upperJump_iff_native` | subtype proofs irrelevant | elaborates | proof closed |
| `map_norm_unitFiltration_psiNat_le` | `Algebra.normUnits K := Units.map (Algebra.norm K)` (`RingTheory/Norm/Units.lean:40`) | definitional | elaborates | proof closed |

Signatures: no declaration type changed (proof bodies only), so no `#check` comparison was needed. The precomputed signature dump failed (missing Tau Ceti object file), and the brief allows no other Lean command.

Ownership: no new carrier or construction was introduced; Hasse–Arf stays this roadmap's own (ClassFieldTheory consumes it). Citations: Fesenko–Vostokov was already cited; nothing new is fetched or requested.

## Repairs of the worker's checks (commit `9fe00eb9`)

- **imports / build warnings.** `import TauCetiRoadmap.ProfiniteProPGroups.Suggested` is removed. It was another roadmap's module, and through it the build pulled in `ProfiniteCohomology/Suggested.lean`, whose `unusedSectionVars` warnings were the 41 `build` findings. The pro-`p` statements now use Tau Ceti's `TauCeti.IsProP`, `TauCeti.IsProPSylow` and `TauCeti.IsProPSylow.eq_of_normal` (`Topology/Algebra/Group/Profinite/ProP/Basic.lean:68`, `Sylow/Basic.lean:62`, `Sylow/Conjugacy.lean:48`). `ProfiniteProPGroups`' `IsProP` and `IsProPSylow` are reducible aliases of exactly these (its `Suggested.lean:131,189`), so the statements are unchanged. Imports added, all at the pin: `TauCeti.NumberTheory.LocalField.{ExpLog, Padic, Unramified.Maximal, Unramified.ZHat, Unramified.Inertia.Basic}` and `TauCeti.Topology.Algebra.Group.Profinite.{ProP.Basic, Sylow.Basic, Sylow.Conjugacy}`.
- **set_option.** `set_option autoImplicit false` is deleted. The file elaborates without it.
- **sorry-data (18).** These now have real bodies:
  - `padicIntegerRingEquiv` is `Padic.integerRingEquiv p` (Tau Ceti `Padic.lean:86`), and `coe_padicIntegerRingEquiv` is proved by `Padic.coe_integerRingEquiv_apply`.
  - `padicResidueFieldEquiv` is `IsLocalRing.ResidueField.mapEquiv` followed by Mathlib's `PadicInt.residueField`.
  - `localExponential` and `localLogarithm` are `NormedSpace.exp` and `NormedSpace.log`, the functions Tau Ceti's deep-unit theorems are about. With that, `localLogarithm_localExponential`, `localExponential_localLogarithm` and `continuous_localLogarithm_deep` became closed proofs by `TauCeti.log_exp_of_mem_maximalIdeal_pow`, `TauCeti.exp_log_of_mem_unitFiltration` and `TauCeti.continuous_log_unitFiltration`. The last needs `1 ≤ i`, which follows from `e < (p − 1) i`.
  - The `ℚ₃(√3)` instances are proved. `X² − 3` is irreducible by `X_pow_sub_C_irreducible_iff_of_prime`, since `b² = 3` would give `2 v_3(b) = 1`; finiteness comes from `AdjoinRoot.powerBasis`.

  Thirteen declarations duplicated Tau Ceti and are deleted; the file and the README now use Tau Ceti's names: `maximalUnramifiedExtension`, `maximalUnramifiedFrobenius`, `maximalUnramifiedGaloisGroupEquivZHat` (with `_apply_frobenius`), `inertiaSubgroup`, `isClosed_inertiaSubgroup`, `inertiaSubgroup_normal`, `restrictMaximalUnramifiedHom`, `IsArithFrobeniusLift`, `exists_isArithFrobeniusLift`, `unramifiedQuotient`, `unramifiedDegree` and `quotientInertiaSubgroupEquiv`. Aliasing them under the same names was rejected. On main, `ClassFieldTheory/Suggested.lean:2046` opens both `TauCeti` and this namespace, and uses four of these names bare (`inertiaSubgroup`, `IsArithFrobeniusLift`, `restrictMaximalUnramifiedHom`, `maximalUnramifiedGaloisGroupEquivZHat`). Once the Tau Ceti modules are imported, aliases would make each of those references ambiguous. With the local copies deleted, each name resolves only to Tau Ceti's declaration, whose body is the same, and the `zHat.{0}` target there matches because that file has `K : Type`.

  The two sorry'd Iwasawa equivalences are restated as theorems:
  - `tameQuotientEquiv` becomes `existsUnique_tameQuotientEquiv` (`∃!` with the two marking values). Its consequences `map_tameInertia_tameQuotientEquiv`, `tameQuotientEquiv_mk_of_isArithFrobeniusLift` and `iwasawaCoordinate_tameQuotientEquiv_mk` now quantify over any marked isomorphism `e` with `he₀ he₁`. The closed uniqueness example now proves that two marked isomorphisms coincide.
  - `iwasawaGeometricEquiv` becomes `exists_iwasawaGeometricEquiv`. The coordinate theorem takes `e` with `e σ = σ'⁻¹` and stays a closed proof.

  Three declarations are deleted and stay README targets in prose: `padicIntegerRingUniformEquiv` (with its `_apply` theorem) and `deepUnitExpLogEquiv`. `tameInertia_isMulCommutative` (a `Prop` instance with a `sorry` body) is now a `theorem`.
- **sorry-examples (8).** The admitted value computations are deleted: the step III local-field example, `#(ℚ_2ˣ/(ℚ_2ˣ)²) = 8`, `1 + 8ℤ_2` squares, the degrees of `ℚ_2(μ_3)` and `ℚ_2(√2)`, the norm-form statements over `ℚ_2(√5)`, and `[ℚ_2(μ_8):ℚ_2] = 4`. Each stays a README Check or worked example (README lines 224, 458, 522, 597, 828, 1536).
- **tex (4).** The Eisenstein orthogonality display is now one inline code span with "sum and minima over `0 ≤ i < n`". The broken code span `[U(K,v) : N_{L/K}(…)]` is rejoined on one line.
- **prnum (1).** Every `#226` (10 occurrences, not only the flagged diagram) now names the roadmap, Counting Totally Ramified Extensions (`../MassFormula/README.md`), which is on main. The process sentence "#226 itself must be updated separately…" became a statement of the contract.
- **readme-ids-missing (6).** The Herbrand names are qualified as `TauCeti.LocalFieldsRamification.*` (Tau Ceti `Herbrand/Basic.lean:298,307,316,331,370`). The LeanBridge names are qualified as `PadicField.Extension.*`, as in their table rows.
- **README agreement.** Text that described the deleted carriers or the roadmap import is rewritten: the Summary, Layer 1 deep units, Layer 2 `K^ur`, Layer 4 suppliers and contract table, Iwasawa and translation, and Dependency order.

### Adversarial pass (statements added or changed by the repairs)

| statement | instances | computed values | result | change |
|---|---|---|---|---|
| `X² − 3` irreducible over `ℚ_3` | root `b` | `v_3(b²) = 2 v_3(b)` vs `v_3(3) = 1` | no root; proved | instance proved |
| `padicResidueFieldEquiv` | `p = 2` | `𝓀[ℚ_2]` and `ZMod 2` both have 2 elements; reduction of `3 ∈ ℤ_2` is `1` on both routes | real body | none |
| `localLogarithm = NormedSpace.log`, depth `i` | `K = ℚ_2`, `e = 1`; `i = 1` and `i = 2` | `i = 1`: `(p−1)i = 1 = e`, excluded, and `log(−1) = 0 = log 1` there; `i = 2`: `1 + 4ℤ_2 → 4ℤ_2` | the threshold excludes the non-injective boundary | closed proofs |
| `continuous_localLogarithm_deep` side condition | `i = 0` | `(p−1)·0 = 0`, so `e < 0` is false | `i ≥ 1` derived | closed proof |
| `localExponential` junk | `x = 1 ∈ ℚ_p` | `v_p(1/n!) → −∞`, so the series is not summable and the value is `0` | only stated on `𝓂^i`, `(p−1)i > e` | none |
| `existsUnique_tameQuotientEquiv`, geometric marking | `σ ↦ of 0` under relator `σ⁻¹τσ = τ^q` | would force `τ^{q²−1} = 1` in torsion-free `I_K/P_K` | arithmetic marking excludes the geometric convention | none |
| `map_tameInertia_tameQuotientEquiv` | conjugates of `of 1` | `σ^n τ σ^{−n} = τ^{q^n}`; `q` a unit in `Ẑ^{(p')}` | closed normal closure = closure of `⟨of 1⟩` = image | none; `e` tied by `he₀ he₁` |
| `tameQuotientEquiv_mk_of_isArithFrobeniusLift` | `φ = σ ι`, `ι ∈ I_K` | `e(φ̄) = of 0 · e(ῑ)`, `e(ῑ) ∈ ⟨⟨of 1⟩⟩` | true | none |
| `iwasawaCoordinate_tameQuotientEquiv_mk` | `g = σ`; `g ∈ I_K` | LHS `gen`, RHS `equivZHat(Frob) = gen`; LHS `1` (kernel), RHS `restrict ι = 1` | agree on generators | universe `zHat.{u}` both sides |
| `exists_iwasawaGeometricEquiv` | relator image | `φ(σ τ σ⁻¹ τ^{−q}) = σ⁻¹ τ σ τ^{−q}` = `iwasawaRelatorGeometric` | relators correspond | none |
| geometric coordinate | `e σ = σ'⁻¹` | `e.symm σ' = σ⁻¹`, coordinate `gen⁻¹` | closed proof | none |
| `unramifiedQuotient_equiv_zhat` | `Ω = AlgebraicClosure K : Type u` | `zHat.{max u u} = zHat.{u}` | closed proof | universe made explicit |
| pro-`p` statements on `TauCeti.IsProP` | `K = ℚ_2`, `U(K,1) = 1 + 2ℤ_2 ≅ {±1} × (1 + 4ℤ_2)` | every finite quotient is a 2-group | unchanged statement (alias) | supplier renamed |

Signatures: the brief allows no Lean command but the target build, so no `#check @name` file was elaborated. Every changed declaration states all its binders in its own signature. The Marked section now carries `hσ hτ e he₀ he₁` explicitly in each theorem, because once the statements no longer mention `tameQuotientEquiv` the section variables would have dropped out.

Ownership: no carrier was added. Thirteen local copies of Tau Ceti declarations were deleted in favour of the pinned originals.

Consumers: on main, `ClassFieldTheory`, `LocalGaloisGroups`, `MassFormula`, `OrthogonalSpinGroups` and `QuadraticFormInvariants` import this `Suggested.lean`. In code, they use none of the deleted or re-signed names except the four bare names in ClassFieldTheory, which resolve to Tau Ceti as explained above. `LocalGaloisGroups/Suggested.lean:2174–2196` cites `LocalFieldsRamification.tameQuotientEquiv` and `exists_isArithFrobeniusLift` in docstrings only, and those citations are now stale. The open revision of ClassFieldTheory already states these against `TauCeti.*` directly and does not open this namespace. None of the consumers was built (the brief permits only this target's build).

## Build

`lake build TauCetiRoadmap.LocalFieldsRamification.Suggested`: `Build completed successfully (9175 jobs)`, exit 0. The only warnings are 45 `declaration uses sorry`; there is no warning from another roadmap's file.

## Gate

`gate LocalFieldsRamification: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck: `depcheck: 148 roadmaps, 999 edges, 0 problem(s)` (no UPWARD or CYCLE line).

No suspicious instructions were found in the review text.
