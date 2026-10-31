# Review of TemperleyLiebOperatorAlgebras (pull request #867 at c60e315)

**Verdict:** needs changes

Full review of the repaired head. The change since `44be852` is the README reshaping of 1.5–1.8 (1093 changed lines) and the new `CubicJonesTargets.lean`; the three older companion Lean files are byte-identical to the previous head (`git diff --stat 44be852..HEAD` lists only `README.md` and `CubicJonesTargets.lean`). Every passage of the README was read; the seeded targets were re-verified at their cache lines; the mathematics of 1.5–1.8 was recomputed (tables below) and holds everywhere it could be computed. The gate passes at this head. The findings are one new blocking defect in the new Lean file, the unrepaired blocking defect of the previous review in the Clifford file, and the two unrepaired style findings on the companion files, plus one Check-count note.

**Repair status of the previous review's findings (r6 at 44be852).**

| r6 | Finding | Status at c60e315 |
|---|---|---|
| R01 (P2) | `CliffordJonesTargets.lean` builds `evenProjection`, `model`, `coordinateInclusion` from admitted propositions | **not repaired**: the file is unchanged (re-raised as R02 below) |
| R02 (P3) | gate `blob=2` (links pinned to a commit) | repaired: gate `blob=0`; "GraphConnectivityAndFlows 1.1" and "SpinGeometry G1" are plain citations with contract subsections (`README.md:334–352`) |
| R03 (P3) | gate `prnum=2` (Mathlib pull-request numbers, chat links) | repaired: gate `prnum=0`; the Mathlib `Graph` API is cited by file (`README.md:170–173`) |
| R04 (P3) | the "Knot Theory" source of 1.5–1.7 unidentified | repaired: Jones, *A polynomial invariant for knots via von Neumann algebras*, BAMS 1985, printed pp. 104 and 107 (`README.md:1683–1688`), fetched and verified below |
| R05 (P3) | process narrative, scan commentary, lost spaces | repaired: scans for "scan", "prototyp", "certificate", "so far", "deferred", pull-request numbers, LaTeX and `Layer\d`-style lost spaces return nothing |
| R06 (P3) | 1.5–1.8 not in house shape; contract sections not updated | repaired: each of 1.5–1.8 has API bullets, a `**Checks.**` list (5, 7, 6, 6 bullets) and an itemised `*Needs:*`; contracts added for GraphConnectivityAndFlows, BelyiMaps, SpinGeometry, SpinRepresentations, VonNeumannAlgebras, GeometricTopology and the Tau Ceti spin-model, ribbon-graph, Clifford-basis and twisted-monoid-algebra names (`README.md:195–228, 334–360`); Layer 1 Examples/Dependencies and the Summary updated |
| R07 (P3) | supplier labels not resolving (GeometricTopology 4.5/4.7, VonNeumannAlgebras V1/V2, SpinGeometry "Pauli", TypeAHeckeAlgebras H3) | repaired: "GeometricTopology Layer 4" (`TauCetiRoadmap/GeometricTopology/README.md:409` on main), "VonNeumannAlgebras V0, V2, V4, V10, V13a" (open head of #889, `README.md:275, 523, 970, 2247, 3690`), SpinGeometry G1 items 1 and 3 with the Pauli realisation owned here, "TypeAHeckeAlgebras H3 and H4a" (`README.md:193, 452` on main) |
| R08 (P3) | companion files import `Mathlib.<submodule>` lines | **not repaired**; the new file repeats it (re-raised as R03) |
| R09 (P3) | padding and API catalogue in the companion files; the README names none of their declarations | **not repaired**; the new file adds more (re-raised as R04) |

## R01 (P1) — `CubicJonesTargets.lean` is built on sorry'd data

Location: `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/CubicJonesTargets.lean:38` (`instance factorSet (N : ℕ) : IsFactorSet (factor N) := by sorry`), `:52` (`def inversion (N : ℕ) : Cubic N ≃ₐ[ℂ] Cubic N := by sorry`), `:41` (`abbrev Cubic`), `:59` (`fixed`), `:68` (`fixedGenerator`), `:85` (`model`), `:121` (`braidUnit`).

Claim (module docstring and pull-request description): the file states target signatures on "the native twisted monoid algebra, with its actual basis and lift", with "thirteen intentional admissions".

Witness: the pinned `TauCeti.twistedMonoidAlgebra k G α` takes `[IsFactorSet α]` (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean:276–282`), so the carrier `Cubic N` exists only through the admitted instance. On a scratch copy at the pins, `#print axioms Cubic` lists `sorryAx`, and so do `model` and `braidUnit`. `inversion` is a `def` whose body is `sorry`; `fixed`, `projection_mem_fixed`, `fixedGenerator` and `model` mention it; `model` additionally feeds the admitted `generator_square`, `generator_adjacent`, `generator_distant` into `TemperleyLieb.lift`; `braidUnit` uses the admitted `braid_phase` for its `val_inv`/`inv_val` fields. The Lean rules forbid a `def` or `instance` whose body is `sorry` and anything that mentions one; the gate's `sorry-data=0` scans `Suggested.lean` only.

Repair (checked by hand on the instances below): the admitted facts are finite computations and should be proved. `IsFactorSet (factor N)`: `chainForm` is biadditive in each argument (it is a finite sum of products in `ZMod 3`), so `factor N a b * factor N (a*b) c = factor N b c * factor N a (b*c)` reduces to `ω^(2(B(a,b)+B(a+b,c))) = ω^(2(B(b,c)+B(a,b+c)))`, both exponents being `2(B(a,b)+B(a,c)+B(b,c))`, and `chainForm 1 b = 0 = chainForm a 1` gives `one_left`, `one_right` (the row "cocycle" of the 1.8 table, exact for all `3^6` triples at `N = 2`). `inversion`: `TwistedMonoidAlgebra.lift (fun a ↦ of a⁻¹)` with `of_one` and `of_mul_of`, since `factor N a⁻¹ b⁻¹ = factor N a b` by bilinearity (`B(−a,−b) = B(a,b)`); `inversion_weyl` is then `lift_of`. `projection_mem_fixed` follows from `inversion_weyl` and `inv` of `Multiplicative.ofAdd (Pi.single j 1)`. `braid_phase`: `U_j³ = 1` from `of_mul_of` three times (`chainForm a a = 0`), then `(1+U+U²)² = 3(1+U+U²)` and the scalar identities `u(1+ζ) = √3 ζ`, `u((1+ζ)/3 − 1) = −1/√3` (both checked). If they are not proved now, delete `factorSet`, `Cubic`, `weyl`, `scalarTrace`, `site`, `inversion`, `fixed`, `projection`, `fixedGenerator`, `model`, `braidGenerator`, `braidUnit` and every theorem about them, and state the comparison as existence statements in `Suggested.lean` whose proofs carry the relations (there is a surjective algebra map `TL_m(√3) → C_(m−1)` with `e_j ↦ √3 p_j`, trace identity and kernel `R_m`; the group generated by the `g_j` is finite).

## R02 (P2) — `CliffordJonesTargets.lean` defines its carriers through admitted theorems

Re-raised: r6 R01.

Location: `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/CliffordJonesTargets.lean:53` (`evenProjection`), `:75` (`model`), `:104` (`coordinateInclusion`).

Witness: the file is byte-identical to the head the previous review read (`git diff 44be852..HEAD -- CliffordJonesTargets.lean` is empty). `evenProjection m j := ⟨projection m j, projection_mem_even m j⟩` with `projection_mem_even` admitted (line 49); `model` is `TemperleyLieb.lift` of the admitted `generator_square`, `generator_adjacent`, `generator_distant` (lines 59–72); `coordinateInclusion` is `CliffordAlgebra.map` of an isometry whose `map_app'` is the admitted `coordinateVector_isometry` (line 100). Every substantive theorem of the file (`model_surjective`, `native_trace`, `kernel_trace_radical`, `trace_markov`, `trace_inclusion`) is about these admitted carriers.

Repair: as in r6 R01. `coordinateVector_isometry` closes with `simp [form, coordinateVector, Fin.sum_univ_castSucc]`; `projection_mem_even` from `CliffordAlgebra.ι_mul_ι_mem_evenOdd_zero` and subalgebra closure; the three generator relations from `CliffordAlgebra.ι_sq_scalar` and `ι_mul_ι_add_swap` (`Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:119, 263`) by `d_j² = −1`, `p_j p_(j±1) p_j = p_j/2` (the 1.7 table rows, `m = 2..5`). Otherwise delete the carriers and the theorems about them and state the comparison as an existence statement.

## R03 (P3) — Companion files import Mathlib submodules

Re-raised: r6 R08.

Location: `CliffordJonesTargets.lean:1–5`, `PottsIceTargets.lean:1–7`, `PowersTensorTargets.lean:1–5`, `CubicJonesTargets.lean:1–8`.

Witness: each file imports `Mathlib.<submodule>` lines (the new file six of them: `Mathlib.Algebra.Algebra.Subalgebra.Basic`, `Mathlib.Data.ZMod.Basic`, …) and none imports `Mathlib`; the Lean form rules admit only `import Mathlib` followed by the `TauCeti.*` modules used. The gate's import scanners cover `Suggested.lean` only, which is why they report `0`. All four files elaborate at the pins (the new one with 13 `sorry` warnings and no error, on a scratch copy).

Repair: replace each import block by `import Mathlib` plus the Tau Ceti modules used (`TauCeti.Algebra.TemperleyLieb.MarkovTrace`; `TauCeti.LinearAlgebra.CliffordAlgebra.Dimension` in the Clifford file; `TauCeti.Algebra.MonoidAlgebra.Twisted.Basic` in the cubic file).

## R04 (P3) — Padding and API catalogue in the companion files; README and Lean do not agree

Re-raised: r6 R09.

Location: the four companion files (56 declarations; the README names none of them).

Witness: r6 R09's list stands unchanged for the three older files (`cup_cap_circle`, `cup_cap_snakes`, `coordinateVector_isometry`, `transfer_word_closure`, `density_commutes` close in one tactic or are a pinned lemma; `componentCount_empty`, `projection_trace`, `braid_phase`, `local_six_vertex_matrix`, `local_projection_rank_one`, `last_slice_projection`, `first_slice_projection`, `rotation_exchanges_resolutions`, `projection_laws`, `adjacent_projection_law` are small values or README Checks; `parameter_dictionary`, `loop_specialization_of_euler`, `productState_positive`, `productState_faithful` are about free data). The new file adds `inversion_weyl` (the specification of an admitted `def`), `projection_mem_fixed`, `generator_square`, `generator_adjacent`, `generator_distant` (the lift relations), `fixed_dimension` (the Check `1, 2, 5, 14, 41, 122`), `braid_phase` (the Checks `g_0³ = −i`, `g_0^12 = 1` and the second form of `g_j`), and module docstrings that are process commentary ("Admissions specify … they are not completed proofs", "prototypes V2's second/last-site slice", "suggested targets"). The README writes `F_m`, `C_N`, `s_N`, `G_N`, `φ_m`, `Z_FK` and never the Lean names `model`, `fixed`, `scalarTrace`, `Cubic`, `productState`, `fkPartition`, so no backticked name of the roadmap's own in the README is declared in these files and no declaration of theirs appears in the README.

Statements that are not padding: `potts_eq_fk`, `native_trace_product_state`, and, subject to R01 and R02, the two `native_trace`, the two `kernel_trace_radical`, the two `model_surjective` and `finite_braid_image`.

Repair: delete the padding (the README keeps every statement as a Check or API bullet); keep only the definitions the nine substantive statements need, with real bodies (R01, R02); name each surviving declaration in the README at its target, or move the nine into `Suggested.lean` under `/-! ## Layer 1 -/` and delete the companion files.

## R05 (P3) — 1.6's medial, ice and wired definitions have fewer than three Checks

Location: `README.md:703–745` (`L(a, b)`, `Rot`, `Z_ice`, the wired sums) and the `**Checks.**` list `README.md:757–771`.

Witness: of the seven Checks of 1.6, five test `Z_FK`/`Z_Potts` and `ell`; `Rot` and `L(a, b)` share one (`Rot(I) = E`, `Rot(E) = I`, `Rot⁴ ≠ id`), `Z_ice` has one (`r = 1`, closure of `1 ∈ TL_m` is `2^m`), the wired sums have one (one edge wired to a loop).

Repair: add, from the table below, the entries of `L(0.7, 1.3)` at `r = 1.7` (`1.4647`, `2.91`, off-diagonal `1.3`), the plaquette as an ice check (`ell = 4, 1, 2` on `∅`, a three-edge path, the cycle, with `Z_FK(δ²) = δ⁴ Σ δ^ell Π v/δ`), the rescaling `r^(−1/2) C = r^(1/2) A` making cap the adjoint of cup for real `r > 0`, and a wired two-vertex example with a nonempty block of size two fixed to one colour (division by `q`).

## Verified sound

**Scope and counts.** 1701 README lines read in full; 5 Lean files (593 lines) read; `Suggested.lean` and `CubicJonesTargets.lean` elaborated on scratch copies at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, the manifest's pins; the shared packages directory checked to be at those revisions); 52 adversarial rows with computed values (pure-Python exact rationals and complex floating point; the script is in the reviewer's scratch directory); 15 seeded targets checked at their sources; 40 cited library declarations opened at the pins; 14 supplier section labels resolved. The one citation lead of the worker (`IsMarkovTrace.apply_jonesWenzl`, README 246) is a TemperleyLieb Layer 6 target on main (`TauCetiRoadmap/TemperleyLieb/README.md`, 2 occurrences), not a claimed pinned declaration.

**Gate, build and dependency check.** The worker's gate at this head: every check `0`, `build=0`, `OK`. The dependency check, rerun as prescribed:

```text
depcheck: 204 roadmaps, 1399 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TemperleyLiebOperatorAlgebras'` is empty; the worktree is clean at `c60e315`. `lake env lean` on a scratch copy of `Suggested.lean`: one `sorry` warning (line 56) and nothing else; `#check @markovTrace_neg_one_pow_nonneg_iff` shows every binder of the README statement (`δ < 0`, the unit `q` with `δ = −(q+q⁻¹)`, `StarRing`/`StarModule` at every level, generator fixation) in the elaborated type, nothing dropped. One-tactic probes on this theorem (`simp`, `rfl`, `infer_instance`) fail (r3, r6; the pinned library has no positivity classification).

**Headlines.** README 25–33 lists four end theorems; the negative-parameter positivity theorem is stated at `Suggested.lean:56`; the unitary category, the affine classification and the affine Gram determinant are named in the module docstring as not statable (no diagram category, negligible quotient, C*-category or affine algebra at the pins: `TauCeti/Algebra/TemperleyLieb/` has `Basic.lean` and `MarkovTrace.lean` only). 1.5–1.8 add no end theorem; their statable comparisons sit in the companion files (R01–R04).

**Suppliers resolved this round.** Subfactors at the open head of #874: 3.1 (`README.md:676`), 3.2 (`:697`), 3.3 (`:774`), with `jonesLoopParameters`, `markovTrace_nonneg_iff`, `markovTrace_nonneg_iff_lt_floor` present. TemperleyLieb on main: Layers 0–7 (`README.md:254–767`) with `presentedTLEquiv`, `condExp`, `existsUnique_isMarkovTrace`, `isSemisimpleRing_iff_of_charZero`, `negligibleIdeal`, `MonoidalQuotient`, `halfCount`, `gramPoly`, `diagBasis`, `reflect`, `exists_qInt_eq_zero_iff`, `existsUnique_jonesWenzl`, `apply_jonesWenzl`. VonNeumannAlgebras at #889: Layer 0 (`:275`, states and GNS), Layer 2 (`:523`, tensors), Layer 4 (`:970`, normality and normal representations), Layer 10 (`:2247`, Tomita–Takesaki), 13.1 (`:3690`, V13a). CStarAlgebras at #860: C1–C5 (`:85, 263, 459, 497, 546`). CategoricalOperatorAlgebras at #888: CA1a (`:152`), CA2a (`:302`). CStarClassification at #863: CL2 (`:349`), 2.1 (`:351`), 2.2 (`:376`), `IsAF`. PivotalSpherical on main: Layers 0–4 (`:257–387`). GrothendieckEulerForms on main: Layer 2 (`:238`, split, exact, abelian and triangulated Grothendieck groups). GraphConnectivityAndFlows 1.1 on main (`:224–256`, `Graph.componentCount G = Nat.card G.toSimpleGraph.ConnectedComponent` for finite `V(G)`). BelyiMaps Layer 2 on main (`:897–922`, `BipartiteRibbonGraph`, `facePerm := (rotW * rotB)⁻¹`). SpinGeometry G1 on main (`:136–293`): item 1 the real-to-complex dictionary; item 3 (`:170–272`) `κ_tens`, `κ_base`, the positive-form scalar-trace adjoint `κ_tens∘(id⊗reverse_ℝ)` for nonnegative `b`, `cliffordScalarTrace = 2^(−dim V) trace(L_a)`, the ordered-product basis compared with `CliffordAlgebra.basis` under `equivExterior`, and `τ_ℂ(a*a) = Σ_I |a_I|² Π b(e_i,e_i)`, faithful for definite `b`; it installs no global star, as the README says. SpinRepresentations on main (`TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:316, 353`): Layer 0 the Clifford algebra and gradings, Layer 1 the structure theorem. TypeAHeckeAlgebras on main: H3 (`:193`), H4a (`:452`). GeometricTopology on main: Layer 4 (`:409`, knot theory). Every supplier is on main or earlier in the merge order; the one open-pull-request supplier of another folder is #889, as the pull request's merge-order comment says.

**Ownership.** `roadmaps grep` over main and the 426 open heads for "quantum torus|Gaussian braid|Gaussian representation|twisted group algebra|twistedMonoidAlgebra|cubic Clifford|Jones quotient|clock and shift": the Jones quotient belongs to Subfactors 3.3 (cited); the twisted monoid algebra is consumed generically by OperatorAlgebraDynamics (#1137, twisted group C*-algebras) and ScatteringDiagrams (#1134, quantum tori as Laurent rings), neither of which builds the cubic Temperley–Lieb instance or its braid image; no roadmap owns the `δ = √3` comparison, so this roadmap is its owner. The r6 greps for Potts, ribbon graphs, even Clifford and Powers states stand. The board package index lists no competing package. Ownership against open pull requests whose files the brief did not give was not checked beyond `roadmaps grep`.

**Pinned declarations opened** (Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`). Tau Ceti: `IsFactorSet` (`Algebra/MonoidAlgebra/Twisted/Basic.lean:97`, cocycle and two normalisations), `twistedMonoidAlgebra` (`:282`, requires `[IsFactorSet α]`), `TwistedMonoidAlgebra.of` (`:316`), `of_mul_of` (`:330`), `basis` (`:350`), `lift` (`:391`, needs `u 1 = 1` and `u g * u h = α g h • u (g*h)`), `algHom_ext` (`:370`); `HeisenbergGroup` (`GroupTheory/SpecificGroups/Heisenberg.lean:55`); `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` (`LinearAlgebra/BilinearForm/SymplecticBasis.lean:301`, needs nondegeneracy, as the README's use on a complement of the radical requires); `jonesDelta a = −(a² + a⁻²)` (`KnotTheory/TemperleyLieb.lean:85`), `jonesUnit a i` with value `crossing δ a a⁻¹ i = a • 1 + a⁻¹ • e i` (`:105`, `Algebra/TemperleyLieb/Basic.lean:319`), `jones` (`:135`); `BraidGroup` (`GroupTheory/SpecificGroups/Braid/Basic.lean`); `Matrix.extendLast` (`LinearAlgebra/Matrix/ExtendLast.lean`); `AbelianK0` with `of`, `of_shortExact`, `of_biprod` (`CategoryTheory/GrothendieckGroup/Abelian.lean:79–127`); `spinCup`, `spinCap`, `markovWeight`, `spinGenerator`, `spinRep_e`, `spinWeight`, `diagonal_spinWeight_mul_spinGenerator`, `markovTrace_apply`, `markovTrace_one`, `spinRep_strandIncl`, `markovTrace_strandIncl` (`Algebra/TemperleyLieb/MarkovTrace.lean:87–488`); `strandIncl`, `hom_ext`, `lift_e`, `adjoin_range_e`, `aug` (`Basic.lean:209–246`); `BipartiteRibbonGraph`, `facePerm` (`Combinatorics/RibbonGraph/Basic.lean:49, 119`), `genus`, `IsConnected.two_sub_two_mul_genus` (`Genus.lean:41, 59`); `CliffordAlgebra.basis`, `equivExterior_basis` (`LinearAlgebra/CliffordAlgebra/Dimension.lean:118, 132`). Mathlib: `AlgHom.equalizer` (`Algebra/Algebra/Subalgebra/Basic.lean:1030`), `Module.Basis.SmithNormalForm` (`LinearAlgebra/FreeModule/PID.lean:407`), `IsDiscreteValuationRing` (`RingTheory/DiscreteValuationRing/Basic.lean:56`), `QuadraticMap.weightedSumSquares` (`LinearAlgebra/QuadraticForm/Basic.lean:1410`), `CliffordAlgebra.even` (`Even.lean:53`), `equivEven` (`EvenEquiv.lean:204`), `ι_sq_scalar`, `ι_mul_ι_add_swap` (`Basic.lean:119, 263`), `Graph` (`Combinatorics/Graph/Basic.lean:90`), `Graph.restrict` (`Delete.lean:38`), `Graph.toSimpleGraph : SimpleGraph V(G)` (`Simple.lean:100`), `PMF` (`Probability/ProbabilityMassFunction/Basic.lean:45`), `LinearMap.BilinForm` (`LinearAlgebra/BilinearMap.lean:529`), `Polynomial.Chebyshev.S` (`RingTheory/Polynomial/Chebyshev.lean:627`), `Mat_` (`CategoryTheory/Preadditive/Mat.lean:62`), `Karoubi` (`Idempotents/Karoubi.lean:43`), `RingQuot.lift` (`Algebra/RingQuot.lean:370`), `TwoSidedIdeal` (`RingTheory/TwoSidedIdeal/Basic.lean:36`).

**Sources checked at their locators** (cache ids by their first eight characters; the roadmap has no `sources.toml`).

- Jones, *A polynomial invariant for knots via von Neumann algebras*, BAMS 12 (1985), fetched this round from the AMS journal host (publisher-open; cache bcae6367). Printed p. 104 = page 2, lines 57–83: the algebras `A_n` on `n` projections with relations `e_i² = e_i = e_i*`, `e_i e_(i±1) e_i = t/(1+t)² e_i`, distant commutation; the trace with `tr(w e_(n+1)) = t/(1+t)² tr(w)` and positivity; Temperley–Lieb's representation and the Potts/ice equivalence (crediting Baxter's book); Pimsner–Popa's rediscovery and the trace as the restriction of the Powers state. Supports 1.5 (`τ = t/(1+t)²`) and 1.6. Printed p. 107 = page 5, lines 191–203: at `t = i` the `A_n` are the complex Clifford algebras; at `e^(πi/3)` the `A_n` are related to a kind of cubic Clifford algebra and the braid image is finite. Supports 1.7 and 1.8.
- Galindo–Rowell (arXiv 1312.5557v1, cache 1052ac29): §3.1 lines 223–244, Proposition 3.4 (`U(e_i⊗e_j) = q^(j−i) e_(i+1)⊗e_(j+1)`, `R = m^(−1/2) Σ q^(j²) U^j` unitary, `U_1U_2 = q² U_2U_1`, printed p. 6); Proposition 3.6 lines 265–275 (finite image by the conjugation action on the finite set of monomials, kernel central scalar, determinant a root of unity; printed pp. 6–7), the route 1.8 restates. At `m = 3`, `q = ω`, `R = (1 + ωU + ωU²)/√3` and the README's `−g_j = (1 + ω²U + ω²U²)/√3` is its Galois conjugate `ω ↦ ω²`, as stated; GR's (3.1) `R u_(i+1) R⁻¹ = q u_i⁻¹ u_(i+1)` becomes, under the same conjugation and `u_(i+1)u_i⁻¹ = ω u_i⁻¹u_(i+1)`, the README's `U_(j+1) ↦ ω U_(j+1) U_j⁻¹` (row below).
- Rowell–Wenzl (arXiv 1401.5329v4, cache 9897a868): Remark 4.8 lines 911–915 (the Gaussian representations, known to Jones for `N = 3`), Theorem 4.9 lines 917–925 (braid images are Gaussian, hence finite; printed p. 23). Supports the 1.8 citation.
- Iohara–Lehrer–Zhang, *The Jones quotients* (arXiv 1702.08128v1, cache 8ec89b73): (5.18) line 561, Proposition 5.3 line 567, Theorem 5.4 lines 571–579 (`ℓ = 4`, `q = −exp(πi/4)`, `φ_n(f_j) = (1 + 2iγ_jγ_(j+1))/√2`, `Q_n ≅ C_n⁰` for `n ≥ 3`), Proposition 5.5 line 590. Supports 1.7.
- Iohara–Lehrer–Zhang, roots of unity (author's page, cache 3a990ff3): Proposition 3.1 line 154, Remark 3.2 line 159. Supports 1.3.
- Penneys, *Unitary Quantum Symmetries Lite*, Chapter 4 (author's page, cache a5da4024): Facts 4.4.14 line 557, (TB4) 589–591, (TB5) 597, (TB6) 600–602 (for `d < 0`, `(−1)^n Tr_n` is positive: the sign of the headline), (TB7) 607–608 (`[n+1] = 0` gives negligible ideal `ℂ f^(n)`); Proposition 4.5.3 line 745, Exercise 4.5.4 line 747; §4.6 Bratteli diagrams from line 779, Example 4.6.12 line 941. Supports 1.1, 1.3, 1.4, 2.1, 2.2.
- Ridout–Saint-Aubin (arXiv 1204.4505v4, cache 126aa444): Theorem 4.7 and (4.20) lines 1120–1129 with exponent `d_(n,p−j)`; Corollary 4.8 line 1140; Proposition 4.9 line 1162. Supports 1.2.
- Erdmann–Green (arXiv math/9811017, cache 6f192e41): 2.1.1–2.1.6 lines 94–132 (affine diagrams, `n ≥ 3`, product with `δ^x`), Proposition 2.2.4 lines 164–172 (generators `E_1..E_n, u^(±1)`, relations (1)–(5)), Proposition 2.2.5 lines 174–181 (the affine Temperley–Lieb algebra as the subalgebra generated by the `E_i` under (1)–(3)), Proposition 2.4.4 lines 246–250 (a diagram with `t > 0` through strings is determined by two involutions and a winding integer), 2.5.4–2.5.6 lines 328–344 (standard modules depend on the winding root only). Supports 4.1–4.4.
- Graham–Lehrer 2003 (Numdam, cache 49bac728): relations (TL) line 360, page 10 marker line 353 (printed p. 488), presentation remark lines 379–394. Supports 4.1.
- Chen (arXiv 1502.06845v1, cache fe11792b): Theorem 2.4.6 line 642, Theorem 3.3.5 line 1026, Theorem 5.4.4 lines 1723–1735 (`0 ≤ a, b ≤ n−2`, printed p. 44), Theorem 5.4.5 lines 1940–1941. Supports 3.4.
- Morin-Duchesne–Saint-Aubin (arXiv 1203.4996v3, cache d6f3a06c): Corollary 4.2 and (23) lines 1115–1119, Proposition 4.3 and (29) lines 1275–1294. Supports 4.6; the misprint note below stands.

**Adversarial table, 1.5–1.8 (computed this round).** `r = 1.7` (`t = 2.89`, `δ = 2.288235`, `τ = 0.190985`); exact rationals where shown as fractions.

| Statement | Instances tried | Values on both sides | Result | Change |
|---|---|---|---|---|
| `τ = δ⁻² = t/(1+t)²` (1.5) | `r = 1.7` | `0.190985 = 0.190985` | holds | none |
| native generator block equals `δ p_t` (1.5) | pinned `spinCup`/`spinCap` at `q = −r` | block on `01, 10`: `[[0.588235, 1], [1, 1.7]] = [[r⁻¹, 1], [1, r]]`; `E = δp`, `p² = p`, `p = p*`, rank `1` | holds | none |
| `p_i p_(i±1) p_i = τ p_i`, distant commutation; `D^(⊗3)` commutes (1.5) | three sites | both orders exact; commutators `0` | holds | none |
| the two slices (1.5) | `r = 1.7`; `t = 4` | last `= 0.190985·I₂`; first `= diag(0.551946, 0.066085) = diag(t², 1)/(1+t)²`; at `t = 4`: `0.16·I₂` and `diag(0.64, 0.04)` | holds | none |
| `φ_1` tracial iff `t = 1` (1.5) | `t = 2.89` | `Tr(D[e_12, e_21]) = −0.485861 = (1−t)/(1+t)` | holds | none |
| weights `markovWeight/δ = diag D_t` (1.5) | `q = −r` | `0.257069, 0.742931` on both sides | holds | none |
| `T_2(e) = Tr((W⊗W)E)` (1.5, 1.6) | `W = diag(r⁻¹, r)` | `2.288235 = δ` | holds | none |
| spin flip `F p_t F = p_(1/t)` (1.5) | `r = 1.7` | entrywise equal | holds | none |
| `Z_Potts = Z_FK` (1.6) | edge, loop, parallel pair, triangle, three isolated vertices, path plus isolated vertex, plaquette, empty graph; `q = 0..3`; weights `2, 3, 5, 7` | equal in all 32 cases; `q = 0` gives `0` for nonempty `V`, `1` for the empty graph; e.g. plaquette at `q = 2`: `1470` | holds | none |
| one edge, one loop, parallel pair (1.6) | `Q = 7`, `v = 2` | `63 = Q² + Qv`; `21 = Q(1+v)`; `105 = Q² + 2Qv + Qv²` | holds | none |
| deletion–contraction, bridge (1.6) | triangle edge; path `0–1–2` | `1260 = 1260`; `630 = (Q+v)·Z(G/e) = 630` | holds | none |
| loop expansion `Z_FK(δ²) = δ^|V| Σ δ^ell Π v/δ` (1.6) | plaquette, all 16 `A`, Euler `ell = 2k + |A| − 4` | `1487.677883` both sides; `ell = 4, 1, 2` on `∅`, 3-path, cycle | holds | none |
| cup/cap at `q = −r` (1.6) | pin | `C = [[0,1],[r,0]]`, `A = [[0,r⁻¹],[1,0]]`, `CA = AC = I`, `Σ A_ab C_ab = 2.288235 = δ`; `r^(−1/2) C = r^(1/2) A` | holds | none |
| `L(a, b)` (1.6) | `a = 0.7`, `b = 1.3` | diagonal `0.7, 1.4647, 2.91, 0.7`, off-diagonal `1.3`; `a + b/r = 1.4647`, `a + br = 2.91` | holds | none |
| `Rot(I) = E`, `Rot(E) = I`, `Rot⁴ = Ad(W⊗W)` (1.6) | random complex `4×4` `T`; elementary `T_(00,01)` | exact; `Rot⁴T = (W⊗W)T(W⊗W)⁻¹`, `≠ T`, `≠ (W⊗W)⁻¹T(W⊗W)`; factor `0.346021 = r⁻²` | holds | none |
| Clifford relations, projections (1.7) | `m = 2..5` by Jordan–Wigner | `c_ic_j + c_jc_i = 2δ_ij`; `p_j` Hermitian idempotents; `p_jp_(j±1)p_j = p_j/2`; distant commute; `s(p_0) = 1/2` | holds | none |
| braid units (1.7) | `m = 2..5` | `g_j = u((1+i)p_j − 1) = −(1+d_j)/√2`; `g² = d`, `g⁴ = −1`, `g⁸ = 1`; braid relations; `g c_j g⁻¹ = −c_(j+1)`, `g c_(j+1) g⁻¹ = c_j` | holds | none |
| braid image order `2^m m!` (1.7) | group closure, `m = 2..5` | `8, 48, 384, 3840`; not `2^(m−1) m! = 4, 24, 192, 1920` | holds | none |
| eigenvalues of `g_0` (1.7) | `m = 2` | `(g_0 − iu)(g_0 + u) = 0`, both ranks `1` | holds | none |
| `P_m` central unitary, `a_j` (1.7) | `m = 2, 4`; `m = 3` | `P* = P`, `P² = 1`, anticommutes with every `c_j`; `a_j² = 1`, anticommute; without `i` the square is `−1` | holds | none |
| Jones normalisation at `t = i` (1.7) | `u = e^(πi/4)` | `−(u+u⁻¹) = −1.414214`; `τ = i/(1+i)² = 1/2`; `T_2(e) = 2·√2·(1/2) = √2` | holds | none |
| Mathlib `star` is not `†` (1.7) | `p_0` | `star p_0 = (1 − id_0)/2 ≠ p_0` | holds | none |
| factor set `α = ω^(2B)` (1.8) | `N = 1, 2`, all triples | cocycle identity exact (`3^6` triples at `N = 2`); `W(a)W(b) = α(a,b)W(a+b)` in the regular representation | holds | none |
| `U_j³ = 1`, `U_jU_(j+1) = ωU_(j+1)U_j`, unitarity (1.8) | `N = 1, 2, 3` | all exact; symmetric `α = ω^B` gives phase `ω²` (Check) | holds | none |
| `p_j = (1+U_j+U_j²)/3` (1.8) | `N = 1, 2, 3` | Hermitian idempotent, `θ(p_j) = p_j`, `p_jp_(j±1)p_j = p_j/3`, distant commute; `E_j = √3p_j` satisfy `E² = √3E`, `E_jE_(j±1)E_j = E_j`; `s(p_0) = 0.3333` | holds | none |
| `dim C_N = (3^N+1)/2`, blocks (1.8) | `N = 1, 2, 3` | `2, 5, 14`; centre of `C_N` of dimension `2, 2, 3` (`ℂ⊕ℂ`, `M_2⊕M_1`, `M_2⊕M_1⊕M_3`); central `W(a)` of `G_N`: all for `N = 1`, only `W(0)` for `N = 2`, `W(0), W(ρ), W(2ρ)` with `ρ = (1,0,1)` for `N = 3` | holds | none |
| Markov `s_(N+1)(I(x)p_N) = s_N(x)/3` (1.8) | random complex `x`, `N = 1, 2` | `0.42939+0.48315i` both sides; `0.77939−0.22095i` both sides | holds | none |
| Gaussian braid units (1.8) | `N = 1, 2, 3` | `g_j = u((1+ζ)p_j − 1) = −(1 + ω²(U_j+U_j²))/√3`; unitary; `g³ = −i`, `g^12 = 1`; braid relations; `(g−i)(g+u) = 0` with ranks `(2,1), (6,3), (18,9)`; `g_jU_(j+1)g_j⁻¹ = ωU_(j+1)U_j⁻¹`, `g_(j+1)U_jg_(j+1)⁻¹ = ωU_jU_(j+1)`, `g_j` fixes `U_j` | holds | none |
| scalar identities (1.8) | `u = e^(πi/6)` | `u(1+ζ) = √3ζ`; `u((1+ζ)/3 − 1) = −1/√3`; `a² = −u⁻¹` gives `jonesDelta a = 1.732051 = √3` | holds | none |
| finite braid image (1.8) | closure in the regular representation | `|⟨g_0⟩| = 12` at `N = 1`; `|⟨g_0, g_1⟩| = 96` at `N = 2` | holds (finite, as claimed) | none |
| `A_5` path model (1.8) | `m = 0..6` | counts `(1), (0,1), (1,0,1), (0,2,0,1), (2,0,3,0,1), (0,5,0,4,0), (5,0,9,0,4)`; `dim Q_m = 1,1,2,5,14,41,122 = (3^(m−1)+1)/2`; `catalan 4 = 14`, `catalan 5 − 1 = 41` | holds | none |
| block sizes vs `d_± = (3^k ± 1)/2` (1.8) | `m = 3, 5, 7`; `m = 2, 4, 6, 8` | odd `m`: `(2,1), (5,4), (14,13)`; even `m`: labels `0,2,4` sizes `(1,1,0), (2,3,1), (5,9,4), (14,27,13)` | holds | none |
| trace weights (1.8) | `δ = √3`, `[1..5] = 1, √3, 2, √3, 1` | `m = 2`: `1/3, 2/3`; `m = 3`: `2[2]/δ³ = 2/3`, `[4]/δ³ = 1/3`; `m = 4`: `2/9, 2/3, 1/9 = d_+/9, 2/3, d_−/9` | holds | none |
| `A_3` path model (1.7) | `m = 0..5` | `dim Q_m = 1,1,2,4,8,16` | holds | none |

**Adversarial table, unchanged seeded targets (recomputed).**

| Statement | Instances | Values | Result |
|---|---|---|---|
| headline `markovTrace_neg_one_pow_nonneg_iff` (2.1) | `n = 1`, `δ = −2`; `δ = −1/2`; `δ = 0` | `−T_1(1) = 2`; `T_2(f_2) = δ² + 2δ = −3/4 < 0` with `f_2 = 1 + 2e`; at `δ = 0` all `T_n = 0` yet `0 ∉ J`, excluded by `δ < 0` | holds |
| sign relation (2.1) | `n = 1, x = 1`; `n = 2, x = e` | `(−1)·T^(−δ)_1(1) = δ`; `(+1)·T^(−δ)_2(−e) = δ` | holds |
| 1.2 anchors and exponents | `δ = 7/3`; `n = 5, t = 1` | `det G_(3,1) = 40/9 = [3]`; `d_(5,1) = 4`, `d_(5,0) = 1`, `d_(5,2) = 5` | holds |
| 1.2 indefinite | `δ = 1/2`, `n = 3` | `det [[δ,1],[1,δ]] = −3/4` | holds |
| 2.2 weights at `δ = 2`, level 2 | `(1/4, 3/4)` | sum `1`; unit weights `1/2` | holds |
| 3.4 truncation | `m = 3`; `m = 5` | `min(2, 2m−4−2) = 0`; `2m−4−4 = 2`, `2m−4−6 = 0` | holds |
| 4.3 Gram `n = 2, t = 0` | `d, a` | `d² − a²` | holds |
| 4.3 / 4.6 Gram `n = 3, t = 1` | `X = 5/3`, `Z = 7/2` | `det = 63299/5292 = X³ − 3X + Z² + Z⁻²` | holds |
| 4.6 six-state determinant | `(d,a) = (3,0), (23/10, 7/10), (11/10, 19/10), (3,3)` | `321489 = 9⁴·49`; `2142878976/390625`; `−38697264/390625`; `0`, all equal to `(d²−a²)⁴((d²−2)²−a²)`; rank `2` at `d = a = 3`; coefficients of `det(a = 3, d = 3+h)` in `h`: `0, 0, 0, 0, 51840, 143424, …` | holds |
| 4.6 `T_r(−v−v⁻¹) = (−1)^r(v^r + v^(−r))` | `v = 5/2`, `r = 0..5` | all six equal | holds |
| 4.6 telescoping and leading terms | `n = 4` | `2 + 3 + 1 = 6 = E_(4,0)`; `2E_(4,2) + 4E_(4,4) = 12 = 2·C(4,2)` | holds |

The r3 and r6 rows on 1.1 (dagger values), 1.3 dimensions, 1.4 weights, 3.1–3.3 norms and 4.1–4.5 concern unchanged text and are carried.

## Not verifiable

- Graham–Lehrer 1998 (doi 10.5169/seals-63902): uncertified and settled since r2; not reopened.
- Temperley–Lieb 1971 (doi 10.1098/rspa.1971.0067) and Baxter–Kelland–Wu 1976 (doi 10.1088/0305-4470/9/3/009): paywalled, cited by locator only; the Potts/ice equivalence they are cited for is independently supported by Jones 1985 p. 104 and by the computations above.
- Penneys Example 4.6.14 (2.2): §4.6 (cache a5da4024 from line 779) and Example 4.6.12 (line 941) were located; 4.6.14 was not individually located in the OCR text this round; the r2 reading (lines 941–1009) is carried.
- The order of the full braid image at `δ = √3` for `m ≥ 4` was not computed (the `N = 3` closure in the `27×27` regular representation was not attempted); finiteness is what the README claims and what Galindo–Rowell prove.

## Source issues

- **Misprint** in Morin-Duchesne–Saint-Aubin (arXiv 1203.4996) at Proposition 4.3, equation (29), printed p. 24: the source gives an unsigned product, which at `N = 2`, `d = 0` yields `α² − β²`; it should carry the leading-term sign, yielding `β² − α²` there; affects nothing (the roadmap supplies the sign `σ_(n,t)`; carried from r2).
- **Misprint** in Jones 1985 (doi 10.1090/S0273-0979-1985-15304-2) at printed p. 104, second paragraph: the text layer gives the Temperley–Lieb representation space of `A_n` as having dimension `2n+2`; it should be `2^(n+1)`, the `(n+1)`-site spin chain (superscript placement not confirmable from the extraction); affects nothing.
