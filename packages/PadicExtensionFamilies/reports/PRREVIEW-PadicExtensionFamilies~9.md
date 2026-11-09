# Review of PadicExtensionFamilies (pull request #1713 at 4e198bf)

**Verdict:** needs changes

This is a full review: the folder changed by 625 lines since `c09ab16`. All four findings of the previous review are repaired (see *Previous findings*). Two P3 findings remain, both about a cited source that does not say what the README attributes to it: the packet relation of 6.6 adds a condition the LMFDB knowl does not have, and 1.1 cites a Mathlib lemma that does not exist at the pin. The gate passes, the dependency check is clean, `Suggested.lean` elaborates with `sorry` as the only warning, and none of its 18 theorems closes under the one-tactic probe.

## R01 (P3) — The packet relation of 6.6 is attributed to knowl `lf.packet`, which does not contain its first clause

- **Location.** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1821–1828`: "Define the **packet** relation on the family: `L_1 ∼ L_2` when their residual-polynomial classes agree, their Galois closures have isomorphic permutation representations …, the closures … have the same `e` and the same `f`, and hiddenSwanSlopes K L_1 = hiddenSwanSlopes K L_2 (knowl `lf.packet`); prove it is an equivalence relation refining the subfamilies". Also the third Check (`:1844–1849`): "the residual classes differ, so they lie in different subfamilies and packets. A relation omitting the residual comparison cannot certify this separation."
- **Claim.** The knowl defines packets by the four *hidden* invariants only: isomorphic permutation groups of the closures, equal residue degree and ramification index of the closures, equal hidden slopes. Residual polynomials are not part of it, and the knowl makes no statement that packets refine subfamilies (subfamilies are knowl `lf.subfamily`, by residual class alone). The README's relation is therefore finer than the LMFDB's, while citing the LMFDB as its source; and the Check's last sentence is false for the knowl's relation on its own example: the two fields have closure groups `D_4` and `A_4`, so the permutation-group clause already separates them.
- **Witness.** knowl-lf-packet lines 90–109 (four conditions, then "the family is partitioned into packets"); knowl-lf-subfamily lines 90–95. LMFDB family page `2.1.4.6a`: `x⁴+2x³+2` is `2.1.4.6a1.1`, `D_4`, residual polynomial `z³+1`, packet size `2`; the `A_4` field is in subfamily `a2`.
- **Repair.** Define the packet relation as the knowl does (the four hidden invariants), and keep "refines the subfamilies" only if it is stated as a theorem with a proof route, or drop it; otherwise keep the finer relation but do not attribute it to `lf.packet` and say in one clause how it differs. Rewrite the third Check so that the separation of `x⁴+2x³+2` and `x⁴+2x³+2x²+2` is certified by what the relation actually tests (their closure groups `D_4` and `A_4`, and their residual classes for the subfamily statement).

## R02 (P3) — `Polynomial.coeff_comp` does not exist at the Mathlib pin

- **Location.** `README.md:551–553` (1.1 *Needs*): "Mathlib `Polynomial.comp`, `Polynomial.coeff_comp`".
- **Claim.** No declaration `Polynomial.coeff_comp` exists in the pinned Mathlib; `#check @Polynomial.coeff_comp` fails. The only `coeff_comp` is `HVertexOperator.coeff_comp` (`Mathlib/Algebra/Vertex/HVertexOperator.lean:157`), unrelated.
- **Witness.** The sweep file (`#check` of every library name in the README) reports `Unknown constant Polynomial.coeff_comp`; a repository-wide grep finds no such theorem.
- **Repair.** Cite what the coefficient formula of 1.1 actually uses: `Polynomial.comp_eq_sum_left` (`Mathlib/Algebra/Polynomial/Eval/Defs.lean:380`) with `Polynomial.coeff_X_add_C_pow` (`Mathlib/Algebra/Polynomial/Coeff.lean:294`, the binomial coefficients of `(X + C r)^n`), and, for the degree, `Polynomial.natDegree_comp` (`Degree/Lemmas.lean:376`).

## Previous findings (r8, at `c09ab16`)

- **R01 (P2, weighted Galois-mean-slope formula statable): repaired.** `Suggested.lean:187–193` defines `artinSlopeList K L M` on the integer lower indices `1, …, largestLowerJump K M` with multiplicities `Nat.log p ((G_{i+1} ⊔ H).relIndex (G_i ⊔ H))`, and `:295–303` states `discriminantExponent_div_finrank_eq` with `t = (G_1).relIndex G_0`. The docstring (`:30–36`) now says the list needs no finiteness theorem and no longer lists the slope content among the unstatable headlines. README 2.2 (`:809–815`, `:821–831`) has the list's API bullets, 3.1 (`:1121–1125`) identifies the sorted slope list of the slope content with `artinSlopeList K M M`, and 3.3 (`:1167–1169`) names the theorem. The 2.6 height identity is stated on the same list (`discriminantExponent_eq_sum_artinSlopeList`, `:263–270`).
- **R02 (P2, Mass formula carriers duplicated): repaired.** `totallyRamifiedHeight` is gone; `mass_completeness` (`:518–525`) is the proposed form over `IsRepresentativeSet` and `E.wildExponent`; `ore_realizability` (`:404–406`) and `krasner_refined_count` (`:429–433`) are stated as `E ∈ totallyRamifiedOfDegree K n ∧ E.wildExponent = j`; `HasExtensionInvariants` remains only for `monge_class_count`. The 0.1 invariant is renamed `wildRamificationExponent` (`:71–72`, README `:414`), Convention 6 (`:228–235`) reserves "wild exponent" for `H`, and the table row `README.md:393` cites the pinned names with their files (`Basic.lean`, `Representative.lean`, `Orbit.lean`, `Main.lean`, `Infinite.lean`, `Countable.lean`, …). No `TauCetiRoadmap.MassFormula.*` citation remains (grep).
- **R03 (P3, four locators): repaired.** `:384` and `:799` cite `isPGroup_upperRamificationGroup_of_pos` (`Herbrand/PPrimary.lean`); `:363` has `minpoly.AlgHom.fintype` with its file; `:383` lists `RamificationIndexDomain` under `RamificationGroup.lean`; `:981`, `:2228–2229` and `Suggested.lean:245` cite Greve–Pauli "§4, p.5" for the Galois-case slope-to-jump statement, with §8 kept only for one-segment Galois groups.
- **R04 (P3, split Checks lists): repaired.** 1.5 has its API bullets at `:723–727` followed by one Checks list (`:729–744`); 2.2 has API bullets `:821–831` then one Checks list (`:833–860`); the Checks lists of 6.2 (`:1582–1594`), 6.3 (`:1614–1625`) and 6.8 (`:1940–1962`) are each a single list.

## Verified sound

### Gate, dependency check, elaboration, probe

- My run of the gate on this head: `gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.
- **Dependency check** (`--movable`, content main `c44dcc80`): `depcheck: 239 roadmaps, 2316 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. RamificationOfCompleteDiscretelyValuedFields is line 2 of the merge order, this roadmap line 396.
- **Elaboration.** `lake env lean` on a copy of `Suggested.lean` exits 0 with exactly 18 warnings, all `declaration uses sorry` (one per theorem). Imports: `import Mathlib` plus eleven pinned `TauCeti.*` modules; no `set_option`, no sorried data, no `lemma`, no `#check`.
- **Binder audit.** A scratch copy with `#check @` for all 44 declarations elaborates. The elaborated types agree with the worker's `signatures.md`. The seven "dropped binder" leads are defs whose bodies do not use the dropped structure: `wildRamificationExponent` drops `ValuativeExtension K L` (it reads `ramificationIndex K L` only), `ramificationPolynomial` keeps only fields and the algebra map (README `:270–271` says so), `conjugateBreaks` drops `ValuativeExtension K L`/`K M` (only `M`'s valuation enters), `artinSlopeList` drops every structure on `L` (README `:821–824` says so), `slopePolygon` drops `ValuativeExtension K L` (README `:929–930`). Every sorried theorem carries the hypotheses its README statement names: `[Algebra.IsSeparable K L]` on 2.3, 2.4, 2.6; `[Module.Finite K M] [IsGalois K M]` on every statement reading `M`; `[ValuativeExtension L M] [Module.Finite L M] [IsGalois L M]` on 2.5 for `herbrand L M`.
- **One-tactic probe.** Each of the 18 proofs replaced by `first | rfl | (simp; done) | infer_instance | decide | (exact Iff.rfl) | (norm_num; done) | (aesop; done)`: 18 errors, one per theorem, so no padding.
- **Library sweep.** 201 backticked library names of the README were `#check`ed in the same file. 141 resolve under the file's imports; of the 60 the file does not import, 58 were located by grep in the pinned sources, with the file the README names: for example `isPGroup_upperRamificationGroup_of_pos` (`Herbrand/PPrimary.lean:78`), `hasseArf` (`HasseArf/Abelian.lean:50`), `UpperJump.eq_of_finrank_prime` and `UpperJump.exists_eq_intCast_of_finrank_prime` (`HasseArf/PrimeDegree.lean`), `Subgroup.upperRamificationGroup_quotient` and `comap_restrictScalarsHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean`), `differentExponent_eq_finsum_lowerRamificationGroup` (`Different/Hilbert.lean`), `differentExponent_tower` (`Different/Tower.lean`), `differentExponent_bounds_of_wild` (`Different/Wild.lean:90`), `IsTotallyRamified.isGalois_iff_exists_isPrimitiveRoot` (`TamelyRamified/Galois.lean`), `finrank_fixedField_lowerRamificationGroup_one` (`TamelyRamified/Subextension.lean`), `inertiaSubgroup` (`Unramified/Inertia/Basic.lean:112`), `wildInertiaSubgroup` and `maximalTameExtension` (`WildInertia.lean:251, 137`), `eisensteinSet`, `measure_eisensteinSet`, `mem_eisensteinSet_iff_exists_isEisensteinAt` (`MassFormula/Eisenstein/Region.lean`), `IntermediateField.lintegral_rootCount` (`MassFormula/Integral.lean`), `IntermediateField.rootCount_eq_sum_ite_of_eisenstein`, `tsum_rootCount_eq_of_separable`, `aemeasurable_rootCount_restrict_eisensteinSet` (`MassFormula/RootCount.lean`), `IntermediateField.measure_image_setOf_exists_aeval_monicOfCoeff_eq_zero_le_addVal` (`MassFormula/Fibre.lean`), `exists_mem_totallyRamifiedOfDegree_discriminantExponent_eq` (`MassFormula/Infinite.lean`), `countable_totallyRamifiedOfDegree` (`MassFormula/Countable.lean`), `exists_card_aroots_eq` (`RootCount/Basic.lean`), `Polynomial.exists_isRoot_addVal_eval_eq`, `Polynomial.existsUnique_isRoot_addVal_lt` (`RingTheory/DiscreteValuationRing/Hensel.lean`), `MeasureTheory.Measure.measure_image_mulVec_integerBox` (`MeasureTheory/Group/LocalFieldScaling.lean`), `Polynomial.newtonSlopes_eq_map_roots_map`, `Polynomial.card_filter_roots_le_addValuation` (`NewtonPolygon/Roots.lean`), `Polynomial.newtonPolygon_mul`, `Polynomial.newtonSlopes_mul` (`NewtonPolygon/Mul.lean`), `Polynomial.den_dvd_of_forall_mem_newtonSlopes_eq` (`NewtonPolygon/Ramification.lean`), `TauCeti.IsLowerConvexEnvelope.exists_rat_eq_and_den_dvd_of_isFiniteFace` (`Convex/Sequence/Rationality.lean`), `rootDiscr_def` (`NumberField/Discriminant/Basic.lean:82`), `Polynomial.Gal.restrict` (`FieldTheory/PolynomialGaloisGroup.lean:117`), `normalClosure.is_finiteDimensional` (`FieldTheory/Normal/Closure.lean:173`). The two misses are `Polynomial.coeff_comp` (R02) and `nTj`, which is the data-model label of Polynomial Galois groups, not a Lean name.

### Pinned declarations opened (file:line at the Tau Ceti pin)

- `totallyRamifiedOfDegree` (`MassFormula/Basic.lean:111`), `totallyRamifiedOfDegree_one` (`:131`, `= {⊥}`, as the 6.8 Check says); `IsRepresentativeSet` (`Representative.lean:65`: `R ⊆ σ_K(n)` and every member of `σ_K(n)` is isomorphic to exactly one member of `R`), `exists_isRepresentativeSet` (`:76`); the second mass formula `IsRepresentativeSet.tsum_one_div_natCard_algEquiv_mul_natCard_residueField_pow_wildExponent` (`Main.lean:89`, sum `1/(#Aut · q^{wildExponent}) = 1` for `0 < n`), the first `tsum_one_div_natCard_residueField_pow_wildExponent` (`:72`), `infinite_totallyRamifiedOfDegree_iff` (`:100`: infinite iff `ringChar K = ringChar 𝓀[K] ∧ p ∣ n`). These are exactly what 6.8 and 5.4 consume.
- `lowerRamificationGroup` (`RamificationGroup.lean:99`), `largestLowerJump : ℤ` (`:229`, `sInf {n : ℕ | G_n = ⊥} − 1`), `lowerRamificationGroupReal` (`:278`, `G_u = G_{⌈u⌉}`), `herbrand`/`inverseHerbrand` (`Herbrand/Basic.lean:258/262`), `upperRamificationGroup v = lowerRamificationGroupReal (inverseHerbrand v)` (`:421`), `Nat.cast_mem_ramificationIndexDomain` (used at `Herbrand/Basic.lean:466`). With `G_u = G_{⌈u⌉}`, `G^u` at a break is the larger group and shrinks immediately to the right: the left-continuity of Convention 3 and the "vertex before the jump" of 2.4.
- `addVal_sum_eisenstein_powerBasis` (`Eisenstein/PowerBasis.lean:148`: the valuation of `Σ c_i ξ^i` is `⨅ (e · addVal c_i + i)`), `natCast_differentExponent_eq_iInf_of_eisenstein_adjoin_eq_top` (`Different/Eisenstein.lean:89`), `differentExponent_le_ramificationIndex_sub_one_add_natCastValuation` (`Different/Wild.lean:61`: `d ≤ e − 1 + v_L(e)` for `(e : L) ≠ 0`), as 1.1, 3.6, 6.2 and 7.3 use them.
- `hasseArf` (`HasseArf/Abelian.lean:50`: every `UpperJump` of an abelian extension is an integer), `isPGroup_upperRamificationGroup_of_pos` (`PPrimary.lean:78`).

### Cross-roadmap citations resolved

- **RamificationOfCompleteDiscretelyValuedFields §4a.2** at the head of its open pull request (`README.md:1080`, "Finite separable extensions: ψ_(L/K) and the open-subgroup identity"; `subgroupOf_upperRamificationGroup` named at `:1102`); its Downstream consumers (`:1340`) name this roadmap for exactly this section.
- **On main:** EtaleMassFormula §§1.1–1.3 (`README.md:232, 258, 278`) and its hand-off of Krasner's and Monge's counts to this roadmap (`:37–39`); NumberFieldArithmetic 4.2 (`:1123`), 5.1 (`:1302`), 5.2 (`:1336`), 5.3 (`:1393`), 5.6 (`:1493`), 5.10 (`:1714`), 6.3 (`:1798`), 6.5 (`:1873`); PolynomialGaloisGroups `TransitiveGroupLabel` (`Suggested.lean:140`); LocalFieldsRamification Layers 0–4 with `unitFiltration` at `README.md:283`; ClassFieldTheory Layers 6–8; MassFormula, realized by the pinned `MassFormula/` modules (its README `:410–428` places Krasner's refinement outside its scope).
- **Deferrals to open roadmaps, by name:** ArithmeticGaloisRepresentations Layer 3 "Artin and Swan conductors" exists at its head (`README.md:2530`); ArtinRepresentations and FiniteGroupInvariants are named only in *Not owned here*, never on a `*Needs:*` line.
- The overlaps tool reports no other open pull request changing this folder and no dropped ids either way.

### Ownership

- The closest open roadmaps in vocabulary: LocalFieldsRamification (#617, a revision of a completed roadmap, cited as on main) has no ramification polygon, slope content, residual polynomial, Krasner count or Galois root discriminant; MassFormula (#1819, #1187) has the same scope as main and names Krasner's refinement as outside it. EtaleMassFormula hands Krasner's and Monge's counts here. `roadmaps grep` finds no second owner of the ramification polygon, rams, residual polynomials, associated inertia, slope content, hidden slopes, Galois mean slope, indices of inseparability, jump sets, Herbrand invariants, families, packets or the Galois root discriminant.
- Every declaration of `Suggested.lean` is under `TauCetiRoadmap.PadicExtensionFamilies`; no other roadmap I can read declares these names.

### Source sample

| Target | Source read | Locator check |
|---|---|---|
| 0.4 | Mathlib `Algebra.discr_of_matrix_vecMul`; Tau Ceti `Padic.not_isSquare_five` | both resolve at the pins |
| 1.1 | pinned `addVal_sum_eisenstein_powerBasis`, `natCast_differentExponent_eq_iInf_of_eisenstein_adjoin_eq_top` | statements as cited; Mathlib `Polynomial.coeff_comp` does not exist (R02) |
| 1.2 | greve-pauli (author page) | Lemma 4.1 line 211 and Prop.-Def. 4.3 line 227, both p.5 ✓: the coefficient inequalities of `ψ = φ(αx+α)` and the invariance of `rp(φ)` and of the associated inertia under `α ↦ δα`; knowl `lf.ramification_polygon` lines 94–103 (reflection `(−i, v(ρ_i))`) ✓ |
| 1.3 | greve-pauli §3 lines 112–177; knowl `lf.residual_polynomials` lines 99–111 | Ore's `A(x) = Σ \overline{ρ_{jm+k} α^{jh − v(ρ_k)}} x^j` with the knowl's endpoints and slope `h/m = (v(ρ_k) − v(ρ_{k+l}))/l` ✓; "positive slope ⟹ `x^k A(x^m)` additive" ✓ |
| 1.4 | pauli-sinclair (arXiv 1504.06671v1) | Lemma 4.7 line 1078 and Theorem 4.8 line 1086, p.14 ✓: roots scale by `δ^{−h}`, the orbit `𝒜` with `γ_{δ,ℓ} = δ^{−h_ℓ deg A_ℓ}` recursed from the last segment; the README's reversed list gives the same orbit; greve-pauli Prop.-Def. 4.3 pp.5–6 ✓, Theorem 7.4 line 658 p.13 (`T ⊆ N`, `I` of degree `lcm(f_i, …)`) ✓; knowl `lf.associated_inertia` ✓ |
| 1.5 | greve-pauli Prop.-Def. 4.3 | invariance under the uniformizer ✓ |
| 2.2 | pinned `isPGroup_upperRamificationGroup_of_pos`, `hasseArf`, `UpperJump`, `largestLowerJump`, `herbrand` | as cited |
| 2.4 | knowl `lf.slopes` lines 90–106 | lower convex hull of `(n_E, c_E)`, wild slope repeated `m` times for `n_2/n_1 = p^m` ✓; Deligne A.6 not read (below) |
| 3.5 | knowl `lf.galois_splitting_model` line 91 | irreducible `f ∈ ℚ[x]`, `K ≅ ℚ_p[x]/(f)`, `Gal(f/ℚ) ≅ Gal(f/ℚ_p)` ✓; Mathlib `Polynomial.Gal.restrict` exists (`PolynomialGaloisGroup.lean:117`) |
| 4.1 | heiermann (MPIM preprint) | Definition 3.13 line 423 (printed p.12), Lemma 3.16 line 449, Proposition 3.17 line 460 (p.13: `v_B(D) = i_0 + n − 1`), Theorem 7.1 line 1261 (p.37) ✓; the regularisation `min(ĩ_{j'} + (j'−j)ne)` with `ne = v_B(p)` is the README's `e_L` ✓; knowl `lf.indices_of_inseparability` lines 96–104 ✓ |
| 6.2 | knowl `lf.herbrand_invariant` lines 121–143; greve-pauli Lemma 4.2 line 225 p.5 | geometric/arithmetic conditions identical to `IsCompatible` ✓; one-segment bound `m_1 ≤ p v(p)/(p−1)` ✓ |
| 6.4 | monge-families (arXiv 1109.4617v2) | §1.2 line 89 p.2 (`e_F = +∞` in characteristic `p`) ✓, Lemma 3 line 264 p.6 ✓, Definition 1 line 285 p.6 ✓, Theorem 1 line 509 p.11 (`B_{L/K}/#Aut(L/K)` reduced polynomials) ✓, §2.4 line 530 p.11 (tame case `T^n + θπ`) ✓; pauli-sinclair Prop. 3.10 line 496 (p.7, conditions (a)–(e) to p.8), Prop. 3.11 line 771 p.9 ✓, Lemma 5.7 line 1351 p.19 ✓, Theorem 6.3(a) line 1444 p.21 ✓; knowl `lf.eisenstein_diagram` lines 94–177: index, bands, D/Z/A/B/C points, generic polynomial, `(q^f−1)^{δ+α} q^{f(β+γ)}` specializations, mass `(q^f−1)^α q^{fβ}` ✓ (two issues in the knowl, below) |
| 6.6 | knowl `lf.packet` lines 90–109, `lf.subfamily` lines 90–95; LMFDB family page `2.1.4.6a` | subfamily ✓; packet relation differs (R01) |
| 6.8 | pinned `MassFormula/Main.lean:89, 100`, `Representative.lean:65, 76`, `Basic.lean:131` | as cited |
| 7.3 | jones-roberts-2007 (ASU author page), §2 lines 110–165, rendered p.4 for (2.5) | GRD `d(K) = |D(K)|^{1/N}`, `d(F) ≤ d(K)`, `d(K) = Π p^{β_p}` ✓; (2.5) `β_p = Σ (p−1)s_j/p^{k+1−j} + (1/p^k)(t−1)/t` equals the README's `1 − 1/(tp^k) + (p−1)Σ(s_j − 1)/p^{k+1−j}` (both are `(p−1)Σ s_j/p^{k+1−j} + p^{−k} − 1/(tp^k)`); knowl `nf.galois_root_discriminant` ✓ |
| 2.6, 2.7, 3.2, 3.3, 6.5 | knowls `lf.rams`, `lf.top_slope`, `lf.hidden_slopes`, `lf.galois_mean_slope`, `lf.family_mass` | identities, denominator `∣ p^k − 1`, small/tiny rams ✓; top slope case split incl. `K/K` ✓; hidden = Galois − visible ✓; `c(M/K)/[M:K]` ✓; mass `1/#Aut(L/K_f)`, `= f ·` absolute for `K = ℚ_p` ✓ |

### Adversarial table (values computed on each side)

| Statement | Instances | Values | Result |
|---|---|---|---|
| 0.1 `w`, `ε`, `ε ∣ q^f − 1` | `ℚ_2 ⊂ ℚ_2(√2) ⊂ ℚ_2(∜2)`; `ℚ_5(∛5)` closure | `2 = 1 + 1`, `1 = 1·1`; `ε = 3 ∣ 24` | pass |
| 0.4 square class | `(1,√2)` → `8`, `(1,2√2)` → `32`; cyclic cubic | class `2` both; square | pass |
| 0.5 `#Aut ∣ n`, inseparable case | `𝔽_2(s,t) ⊂ K(a) ⊂ K(a,√(ta))`, `a²+a = s` | `Aut` embeds in `Aut(L_s/K)`: `1 ∣ 4` | pass |
| 1.1 `v(ρ_1) = H` | `x²−2`; `x⁴−2`; `x⁴+2x²+2` | `2 = 3−2+1`; `8 = 11−4+1`; `6 = 9−4+1` | pass |
| 1.1 coefficient formula | `x⁴+2x²+2`, `ρ_1 = 4 + 3φ_3/α + 2φ_2/α² + φ_1/α³`, `ρ_2 = 6 + 3φ_3/α + φ_2/α²` | `v(ρ_1) = min(8, ∞, 6, ∞) = 6`, `v(ρ_2) = min(4, ∞, 2) = 2` | pass (heights `6, 2, ≥7, 0`) |
| 1.2 rams | `x⁴−2`; `x⁸−2`; `x⁴+2x+2`; `x⁴+2x³+2` | `(2,4)`; `(2,4,8)`; `(1/3,1/3)`; heights `3, 3, 3, 0` give `(1,1)` | pass |
| 1.3 additive exponents | `x⁴−2` faces; `x⁴+2x+2`; `x⁴+2x³+2` `A = z³+1` | `2,4`, `1,2`; `1,4`; `1,2,4` | pass |
| 1.3 negative control | tame `x³−5`, `A = z²+3z+3` | `1 + 1 = 2` not a power of `5` | hypothesis `0 < h` needed, present |
| 1.4 orbit and inertia | `α⁴ = 2` over `ℚ_4`, `δ` of order 3; `z²+3z+3` over `𝔽_5`; `z³+1` over `𝔽_2` | `(z²+δ², δ²z+δ)`; disc `2` nonsquare → `2`; `(z+1)(z²+z+1)` → `lcm(1,2) = 2` (LMFDB `2.1.4.6a1.1`: `[2]`) | pass |
| 1.5 `conjugateBreaks` | `ℚ_2(∜2)` in `D_4` closure, `ξ = ∜2` | `v_M(σα−α) = 6,10,6`, `/2 − 1` gives `{2,4,2}` | pass |
| 1.5 zero count | `ℚ_5(∛5)` in `S_3` closure; `ℚ_2(∜2)` | `2 = 3 − 5⁰`; `0 = 4 − 2²` | pass |
| 2.1 count on `(−1,0]`, at `−1` | `L^{ur}` of degree `f` | `[G : G_0 H] = f`, `[G : GH] = 1` | pass |
| 2.2 break at `−1` iff `f > 1` | `G_0 H = G` iff `f = 1` | — | pass |
| 2.2 `artinSlopeList` | `ℚ_2(∜2)`, `D_4`: `#G_t = 8,8,4,4,2,2,2,2,1`, `H ∩ G_t ≠ 1` iff `t ≤ 1` | `[G_iH : G_{i+1}H] = 1, 2, 2` at `i = 1, 3, 7`, `φ = 1, 2, 3`: `[3, 4]`; with `H = 1`: `[2,3,4]` | pass |
| 2.2 multiplicity | `F_{x⁴+2x+2}`, `L = M`: `G_0 = A_4`, `G_1 = V_4`, `G_2 = 1`, `φ(1) = 1/3` | `log_2 4 = 2` copies of `4/3`; total length `2 = w` | pass |
| 2.2 length | `log_p [G_1 H : H] = log_p(n/(fε))` | `ℚ_2(∜2)`: `log_2(4/1) = 2` | pass |
| 2.2 empty lists | unramified quadratic (`largestLowerJump = −1`, `toNat = 0`); `ℚ_5(∛5)` closure (`= 0`) | `[]`, `[]` | pass |
| 2.3 integral | identity; unramified quadratic; `ℚ_5(∛5)`; `ℚ_2(∜2)` | `0`; `0`; `2·1 = 2`; `3·3 + 2·1 = 11` | pass |
| 2.4 segment | `ℚ_2(∜2)`, `(u,u') = (2,3)`, `(3,4)` | `P(2) = 0 + 3·1 = 3`; `P(4) = 3 + 4·2 = 11` | pass |
| 2.4 `(u,u') = (−1,0)`, `(0,u')` | unramified quadratic; `ℚ_5(∛5)` | `P(2) = 0 + 0·1 = 0`; `P(3) = 0 + 1·2 = 2` | pass |
| 2.4 least height | `ℚ_2(ζ_8)`: `(2,2)` from `ℚ_2(i)`, `(2,3)` twice, `(4,8)` | slopes `2, 3`; the max would give chord `8/3` | pass |
| 2.5 count | `D_4` case, slopes `{−4,−2,−2}` | `t=3`: `1+3 = 4 = 4/1`; `t=5`: `1+1 = 2`; `t=8`: `1`; `t ∈ [−1,0]`: `4 = [G_0 : G_0∩H]` | pass |
| 2.5 negative control | `−t` for `−φ_{M/L}(t)`, `t = 3` | `2 ≠ 4` | excluded |
| 2.6 identities | `ℚ_2(ζ_8)`; `ℚ_2(∜2)`; `F_{x⁴+2x+2}` | means `⟨1/2,5/4⟩`, `⟨1,2⟩`, `⟨1/6,1/4⟩`; `s_2 = 2 = 2·5/4 − 1/2` | pass |
| 2.6 height identity on the list | `[3,4]`, `p=2`, `e=4`: `Σ (1)(a_i−1)/2^{2−i}`; `[4/3,4/3]`; `[]` | `2/4 + 3/2 = 2`, `3 + 4·2 = 11`; `1/12 + 1/6 = 1/4`, `3 + 1 = 4`; `0` | pass |
| 2.6 wrong weight | `p^i` instead of `p^{w+1−i}` on `[3,4]` | `3 + 4(1 + 3/4) = 10 ≠ 11` | excluded |
| 2.6 denominator theorem | `x⁴+2x+2`: count of `−1/3`; `x⁴−2`: `−2`, `−4`; `0`; non-slope; `x⁴+2x³+2`: `−1` | `3`, `ordCompl 3`, `3 ∣ 3`; `2 → 1`, `1 → 1`; `1 ∣ ordCompl(n−p^w)`; `1 ∣ 0`; `3 → 3`, `1 ∣ 3` | pass |
| 2.6 proof check | run `r_k = … = r_{k'}`, `V_{k'}/V_{k−1}` | breaks of `V_{k'}/V_{k−1}` are `ψ_{V_{k−1}/K}(s_k)`, all equal; lower break `ψ_{V_{k'}/K}(s_k) = r_k`; face `(1,H)`–`(p^d,0)`, `H = (p^d−1) r_k ∈ ℕ` | pass |
| 2.7 top slope | `ℚ_2(∜2)`; `ℚ_5(∛5)`; `ℚ_2(√5)`; `K/K` | `4`; `1`; `0` (`G^{(0)} = G ≠ 1`); `0` by the explicit case | pass |
| 3.1 `[M:K] = t u p^k` | `F_{x⁴+2x+2}`: `[4/3,4/3]_3^2`; `ℚ_3(∛3)`: `[5/2]_2` | `24 = 3·2·4`; `6 = 2·1·3` | pass |
| 3.3 weighted formula | `[2,3,4]`; `[]_3^2`; `[]^2`; `[5/2]_2` (`p=3`); `[4/3,4/3]_3^2` | `7/8 + 1/8 + 1/2 + 3/2 = 3 = 24/8`; `2/3 = 4/6`; `0`; `1 − 1/6 + 2·(3/2)/3 = 11/6`; `1 − 1/12 + (1/3)(1/4 + 1/2) = 7/6 = 28/24` | pass |
| 3.4 `#Aut = [N_G(H) : H]` | `S_3`, `H = C_2`; `A_4`, `H = C_3`; biquadratic | `1`; `1`; `4` | pass |
| 3.5 negative control | `x³−7` at `p = 7` | local group order `3` (`ζ_3 ∈ ℚ_7`), global `6` | pass |
| 3.6 bounds | `(2,1,4,11)`; `(2,3,2,6)` | `11 = 4 − 1 + 4·2`; `3 ≤ 6 ≤ 9`, `c = 7` fails `c ≡ f(e−1) mod f` | pass |
| 4.1 indices | `x⁴−2`; `x⁴+2x³+2`; `x⁴+2x+2`; `x³−5` | `∞,∞,0 → 8,4,0`; `3,3,0` (LMFDB `2.1.4.6a1.1`: `[3,3,0]`); `1,1,0`; `[0]` | pass |
| 4.1 rams from indices | `x⁴+2x+2`, envelope of `(1,1),(2,1),(4,0)` | `i*_1 = 2/3`, `r_1 = (2/3)/2 = 1/3`, `r_2 = (1 − 2/3)/1 = 1/3` | pass |
| 5.1 Ore | `ℚ_2`, `n=2`: `j = 0,1,2`; `n = 1`: `j = 0, 1`; `𝔽_3((t))`, `n = 3`, `j = 1` | `0` fails (`a = 0 ≠ 1`), `1, 2` admissible; `j=0` only; `b = 1`, `v(1) = 0 ≤ 0`, `1 ≤ ∞` admissible (`X³ + tX + t`, non-Galois, ram `1/2`) | pass |
| 5.3 `krasnerCount` | `ℚ_2`, `n=2`, `j=1,2`; `n=4`, `j=8` | `2·2^{1}·(1/2) = 2`, `2·2^{2−1−2+2} = 4`; `ν = (3,2,3)`, `4·2^{4+8−1−8} = 32` | pass |
| 5.3 equal-characteristic depth | `p ∣ h` makes `(h : K) = 0` | `oreCoefficientDepth = 1` | pass |
| 5.4 totals | `ℚ_2`, `n = 2, 4`; `ℚ_3`, `n = 3` | `6`; `92`; `21` | pass |
| 6.2 compatibility | `ℚ_2`, `e=4`: `[2,3]` → rams `(2,4)`; `[1,5/2]` → `(1,4)`; `[1/3,1/3]`; `[1,1]`; `[1,2]` → `(1,3)` | arithmetic, arithmetic; geometric, arithmetic; `(4−1)/3 = 1` odd, `< 2`; `3·1 = 3` odd; `3 < 4` odd | pass, all realized |
| 6.2 rejections | `[1, 3/2]` → `(1, 2)`; `[2, 2]` → `(2, 2)` | `(2−1)·2` even, `2 ≠ 4`; `(4−1)·2 = 6` even, `d = 2` | rejected, matching Ore (`j = 4`) and the direct computation (`v(ρ_2) = 2` forces a vertex at `2`) |
| 6.2 necessity proof | single face of width `p^d − 1`, min at `h = p^k h'`, `k ≥ 1` | `v(ρ_{p^k}) ≤ H − n k e_K` below the chord unless `r ≥ p^d k e_K/(p^k − 1)`, which exceeds `p e_K/(p−1)` except `d = k = 1` (arithmetic) | pass |
| 6.4 points | `[1]`, `[2]`, `[1,1]` over `ℚ_2` | `(α,β,γ,δ) = (1,0,1,0)`, `(0,1,1,0)`, `(1,1,1,0)` | pass |
| 6.4 ram counts | `[1]`, `[2]`, `[2,3]`, `[1/3,1/3]` | `1`, `2`; `2`, `4`; `k=1`: `0 ≠ ⌈1/3⌉`, `k=2`: `1` | pass (knowl overclaims, below) |
| 6.5 masses | `[1]`, `[2]`, `[1,1]` over `ℚ_2`; `[1]` over `ℚ_4` | `1`, `2`, `2` (LMFDB `2.1.4.6a`: mass `2`, ambiguity `1·1·gcd(4,2) = 2`); `3 = 12/4` | pass |
| 6.5 Serre comparison | `ℚ_2`, `e = 2` | `1·2^{−1} + 2·2^{−2} = 1` | pass |
| 6.5 `Aut(L/K)` vs `Aut(L/K_f)` | `ℚ_2`, `f = 2`, `[1]` over `ℚ_4` | `Σ 1/#Aut(L/ℚ_4) = 3`, `Σ 1/#Aut(L/ℚ_2) = 3/2` | README follows `lf.family_mass` |
| 6.6 subfamilies | `x⁴+2x³+2`, `x⁴+2x³+2x²+2` | kernels of `z⁴+z`, `z⁴+z²+z` on `𝔽_2`: `2`, `1`; groups `D_4`, `A_4` | classes differ; R01 |
| 6.7 `mongeCount` | `ℚ_2 (2,1)`; `ℚ_4 (2,1)`; `(1,1)` | `1+3+2 = 6`; `3+7+4 = 14`; `1` | pass (unchanged since r8) |
| 6.8 completeness | `ℚ_2`, `n=2`; quartic; `ℚ_2(√2)`; `ℚ_4`; `n = 1` | `2/4 + 4/8 = 1`; `1/2+1/4+1/8+1/16+1/32+1/32 = 1`; `1/2+1/4+1/4`; `3/4+1/4`; `{K}`: `1`, `∅`: `0` | pass |
| 7.1–7.3 | `ℚ`; `ℚ(√5)`; `ℚ(∜2)`; `ℚ(ζ_5)`; `3.1.23.1` | `1`; `5^{1/2}`; `2^{11/4} < 2^{24/8} = 8 < 2^{1+3} = 16`; `5^{3/4}`; `23^{1/2}` | pass |
| 7.3 bound | `gms_p ≤ 1 − 1/e_p + v_p(e_p)` | `d/e ≤ (e − 1 + e v_p(e))/e` | pass |
| `galoisMeanSlopeAt_eq_zero_iff` | `ℚ(√5)` at `5`, `2`; `p = 1` | `1/2`, `5 ∣ 5`; `0`, `2 ∤ 5`; excluded by `Fact p.Prime` | pass |

## Not verifiable

- Not opened this round: Deligne, Appendix A.6 (no legal copy found); Serre, *Local Fields* (paywalled); Krasner 1966, Ore 1928, Fried 1974, Serre 1978 (not obtained; Serre 1978 is consumed through the pin). Jones–Roberts 2007 was read from the ASU author copy (`hobbes.la.asu.edu`); its published page numbers were not compared.
- Sections 4.2 (Miki, Pagano), 5.1/5.3 (Pauli–Roblot) and 6.7 (Monge's count) are unchanged since the previous review, which read those sources; they were not re-read this round.
- Pauli–Sinclair Proposition 3.10 was read for its locator and statement only; the sufficiency direction of its conditions (a)–(e), which 6.4 cites for the mixed-characteristic realization, was not checked step by step.

## Source issues

- **Misprint** in knowl-lf-eisenstein_diagram at "The size of a family", lines 174–177: the source says the family mass is the sum of `1/|Aut(L/K)|` over the family; it should be `1/|Aut(L/K_f)|`, as knowl `lf.family_mass` defines it (over `ℚ_2` with `f = 2`, the family `[1]` has mass `3` with `K_f` and `3/2` with `K`); affects nothing here (6.5 uses `Aut(L/K_f)`).
- **Error** in knowl-lf-eisenstein_diagram at "Slopes, means, and rams on Eisenstein diagrams", line 185: the source says the number of drawn points in `B_k` of index at most `k` is `⌈r_k⌉`; it should be `⌈ε p^k s_k⌉ − ⌈ε p^k m_k⌉`, which equals `⌈r_k⌉` only when `k` is final in its run (for `[1/3, 1/3]` over `ℚ_2` the band `B_1` has no point of index `≤ 1`, while `⌈1/3⌉ = 1`); affects nothing here (6.4 states the corrected count).
- **Misprint** in knowl-lf-rams at the definition of `ℛ_1^z`, lines 107–108: the source requires a numerator prime to `p` and allows `α ≤ pz/(p−1)`; the endpoint `pz/(p−1)` has numerator divisible by `p`, so the set as written excludes the arithmetic ram (`ℚ_2(√2)` has ram `2 = 2·1/1`); it should exempt the endpoint; affects nothing here (6.2 treats the arithmetic case separately).
