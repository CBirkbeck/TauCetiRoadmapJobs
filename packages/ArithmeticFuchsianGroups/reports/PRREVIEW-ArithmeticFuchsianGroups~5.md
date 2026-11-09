# Review of ArithmeticFuchsianGroups (pull request #2026 at 82ce1e4)

**Verdict:** needs changes

This is an incremental re-review of the 107 lines changed since b98ed29.

- The five findings of the previous review are all repaired (see "Previous findings" below).
- The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with only the 17 `sorry` warnings.
- One P3 remains. The R03 repair added a justifying clause that is false for a field the definition admits. Nothing in the roadmap's route depends on that clause.

## R01 (P3) — §1.1: "`M₂(ℝ)` is infinite-dimensional over `k`" fails for `k = ℝ`, which `RealSplitting` admits

- **Location.** `TauCetiRoadmap/ArithmeticFuchsianGroups/README.md` lines 396–397: "The comparison is made over `ℝ`: `M₂(ℝ)` is infinite-dimensional over `k`, so `TauCeti.skolemNoether` does not apply to `S₁, S₂` over `k`."
- **Claim.**
  - `RealSplitting k a b` is defined for an arbitrary field `k`: README line 388 and `Suggested.lean:50` (`(k : Type*) [Field k]`).
  - Take `k = ℝ`. The only ring endomorphism of `ℝ` is the identity, so `place = id`. The `ramified` field is then vacuous, and `splitting` is an `ℝ`-algebra map into `M₂(ℝ)`, which has dimension 4 over `k`.
  - So `TauCeti.skolemNoether ℝ` applies to `S₁, S₂` directly, and both halves of the sentence are false.
  - More generally, the clause fails exactly when `place` is onto `ℝ`. If `ℝ` is finite over a subfield `F`, then `ℂ` is finite over `F`, and Artin–Schreier forces `F = ℝ`.
  - The route over `ℝ` that follows the clause is correct for every `k`. Only this justification overclaims. The R03 repair introduced it.
- **Witness.** Take `k = ℝ`, `(a,b) = (1,1)`, and `S₁ : i ↦ diag(1,−1), j ↦ (0 1; 1 0)`.
  - `S₁` is a real splitting: `i² = j² = I` and `ji = (0 −1; 1 0) = −ij`.
  - Put `S₂ = Ad(diag(2,1)) ∘ S₁`.
  - `finrank ℝ M₂(ℝ) = 4`, and `TauCeti.skolemNoether ℝ` returns `u = diag(2,1)`. My scratch probe elaborates the call for any two `ℝ`-algebra maps `ℍ[ℝ,a,b] → M₂(ℝ)`.
- **Repair.** Write: "The comparison is made over `ℝ`: for a number field `k`, `M₂(ℝ)` is infinite-dimensional over `k`, so `TauCeti.skolemNoether` does not apply to `S₁, S₂` over `k`; the argument below works for every field `k`."
  - *Tested at `k = ℝ`.* The sentence now claims nothing there. The route gives `ι = id` and `f_m = S_m`, and returns the same `u = diag(2,1)`.
  - *Tested at `k = ℚ`.* The restricted clause is true, since `ℝ` has uncountable dimension over `ℚ`.
  - Line 236 ("never over `k` with target `M₂(ℝ)`") describes how the roadmap uses the theorem, not what the theorem allows, and can stay.

## Previous findings

- R01 — repaired: README lines 6–9: "and, for a maximal order `O`, computes its covolume `8π|d_k|^(3/2)ζ_k(2)(4π²)^(−n)∏(N𝔭−1)` … ; a smaller order `O′ ⊆ O` multiplies it by the finite index `[Γ(O) : Γ(O′)]`."
- R02 — repaired: lines 532–537: at a split place, unit fraction `(1 − q⁻¹)(1 − q⁻²)`; at a division place, volume `q⁻¹` and unit fraction `1 − q⁻²`; "At every finite place, dividing … by … `1 − q⁻¹` … gives the norm-one volume".
- R03 — repaired: lines 394–404, 658–661, 233–237. `QuaternionAlgebra.lift` gives `f_m : ℍ[ℝ, place(a), place(b)] → M₂(ℝ)`, and Skolem–Noether is applied over `ℝ`. The repair's justifying clause introduced R01 above.
- R04 — repaired: lines 665–678 (`liftSL`: three Checks; `Γ^(2)`: four) and lines 593–604 (`diag(−1,1)`, `2I` and the Hurwitz-order Checks for `N_B⁺(O)` and `ν`).
- R05 — repaired: `Suggested.lean:222` reads "Layer 2: the arithmetic commensurator criterion and the PGL passage", and `:270` reads "Layer 3: the order-32 Gassmann covers". These are identical to README lines 999 and 1193.

## Verified sound

**Gate, dependencies and scope.**
- I re-ran the gate on this head. Every check is 0, and it ends with `OK`. The worker's run also reports `build=0`.
- The dependency check prints `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- The roadmap is line 284 of the merge order. FuchsianOrbifolds is line 49 and TeichmullerGeometry, its consumer, is line 285.
- `git diff --stat` against the base, outside the folder, is empty.
- The change adds no supplier roadmap. Its new suppliers are one Mathlib declaration and two Tau Ceti instances at the pins.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` gives 17 warnings, all `declaration uses sorry`, at lines 84, 92, 110, 147, 155, 167, 177, 191, 200, 210, 218, 226, 232, 240, 252, 262 and 276. There are no other messages.
- The diff touches only the two section comments of `Suggested.lean`.
- A scratch copy with `#check @` for all 28 declarations elaborated. The types match the previous report's comparison: `IsMaximalOrder k O` on the covolume formula, `Group.FG Γ` and `IsNonelementary Γ` on the envelope theorems, and `Γ.IsCofinite` on Layer 2. I changed nothing.
- Since no statement changed, the previous report's one-tactic probe (none of the 17 closed) still stands.

**The §1.1 route, run at the pins.** A scratch file with `import Mathlib` and the two Tau Ceti modules elaborated with exit code 0. It does three things:
- `QuaternionAlgebra.lift q : ℍ[ℝ,a,b] →ₐ[ℝ] M₂(ℝ)`, for `q : QuaternionAlgebra.Basis M₂(ℝ) a 0 b`.
- For nonzero real `a, b` and any `f g : ℍ[ℝ,a,b] →ₐ[ℝ] M₂(ℝ)`, `TauCeti.skolemNoether ℝ f g`. The instances come from `instIsCentral a (Units.mk0 b hb)`, `instIsSimpleRing (Units.mk0 a ha) (Units.mk0 b hb)` and `invertibleOfNonzero`.
- `norm_num` proves both local-volume identities of §1.2(c) at `q = 2, 3, 5, 7`.

**Library declarations opened at the pins (file:line).**
- Mathlib:
  - `Algebra/QuaternionBasis.lean:41` (`Basis`: `i*i = c₁•1 + c₂•i`, `j*j = c₃•1`, `i*j = k`, `j*i = c₂•j − k`) and `:180` (`lift : Basis A c₁ c₂ c₃ ≃ (ℍ[R,c₁,c₂,c₃] →ₐ[R] A)`);
  - `Algebra/Quaternion.lean:83` (`ℍ[R,a,b]` is `QuaternionAlgebra R a 0 b`, so `c₂ = 0` gives `j*i = −k`, as the README's "relations of `ℍ[R,a,b]`" says).
- Tau Ceti:
  - `Algebra/Quaternion/CentralSimple.lean:69` (`instIsSimpleRing`: `[Field K] [Invertible 2] (a b : Kˣ)`) and `:151` (`instIsCentral`: `[CommRing K] (a : K) (b : Kˣ) [Invertible 2]`). The supplier contract at README lines 238–241 states exactly these hypotheses.
  - `Algebra/CentralSimple/SkolemNoether.lean:107`: `skolemNoether` with `[IsSimpleRing A] [FiniteDimensional K A] [Algebra.IsCentral K B] [IsSimpleRing B]`, concluding `g x = u * f x * u⁻¹`. This is the contract at lines 233–237 and the direction `f₂ = u f₁ u⁻¹` at line 404.
  - `MeasureTheory/Group/FundamentalDomain.lean:382` (`covolume_eq_card_mul_covolume`, for `Δ ≤ Γ`). It is cited by the rewritten "How to read the build" through §1.2 line 562.

**Cross-roadmap citations resolved.**
- **FuchsianOrbifolds Layer 4a**, at #1168's head f997c5f0: line 734 ("minimum area of compact orientable hyperbolic orbifolds") and item 1 `pi_div_twentyOne_le_covolume` (line 745: every cofinite Fuchsian group has covolume at least `π/21`). This is the new Hurwitz Check's citation.
- **ClassicalArithmeticCompletion §7.60** on main (line 15856). Line 15858 says that for a maximal local order the unit image of `Nrd` is `O_v^×`, which is what step (c) divides by.
- **The `roadmaps resolve` lead list.** At this head it finds no unresolved cross-roadmap citation and no unresolved Lean name.
  - The worker's two leads, `Building.exists_fixedPoint_of_bounded` and `Reduction.finite_classes`, are names that roadmaps declare. The first is at ReductiveGroupsPartII line 2955 on main. The second is AdelicAlgebraicGroups' (previous report, line 3169).
  - Both sit in untouched text.
- **The description still names #1168** under "Depends on" and in its merge-order paragraph. Layer 4a exists only at that head, so the new citation of it is declared.

**Sources: the seeded sample, where it falls in the changed passages.**
- **1.2.** Voight (39.1.7), (39.1.9), Main Theorem 39.1.8 (`voight2021` lines 30266–30272). The Eichler factor is `1 − 1/q` when the symbol is `−1`, so `Nm(𝔑)∏λ = ∏(q − 1)`, as in the formula.
  - The local volumes of step (c) are the roadmap's own (line 545). I recomputed them; see the table.
- **1.1, 1.3 and 2.2.** The changed text adds no source locator. Its new library claims are checked above. Maclachlan–Reid is still uncertified.
- **The other sample targets** (1.3b, 1.4, 1.5, 2.0, 2.1, 2.3, 2.4, 3.1–3.5) are untouched. They were verified in the previous report, and that verification carries over.

**Ownership.** `overlaps.md` lists no open pull request that changes this folder and no dropped id. The diff introduces no new object. `QuaternionAlgebra.lift`, `instIsCentral` and `instIsSimpleRing` are consumed from the pins, not restated. The ownership notes of the previous report (TeichmullerGeometry, FuchsianOrbifolds, QuaternionArithmetic) are unaffected by this change.

**Adversarial table.** The first block holds new rows for the changed passages, with computed values. The second block carries forward the previous report's rows for untouched statements.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Summary / §1.2 index scaling for `O′ ⊆ O` | `M₂(ℤ)`; Eichler level 2; `ℤ + 2M₂(ℤ)` | `8π(π²/6)/(4π²) = π/3`. `Γ₀(2)` has index 3, area `π = 3·π/3`. Norm-one elements are `≡ I mod 2`, giving `Γ̄(2)`, of index 6 and area `2π = 6·π/3` (matching line 851). | holds | none |
| §1.2(c), split place | `q = 2, 3, 5, 7` | `|GL₂(𝔽_q)|/q⁴ = 3/8, 16/27, 96/125, 288/343`; ÷`(1−1/q)` gives `3/4, 8/9, 24/25, 48/49 = 1 − q⁻²` | holds | none |
| §1.2(c), division place | `q = 2, 3, 5, 7` | `q⁻¹(1−q⁻²)/(1−q⁻¹) = 3/4, 4/9, 6/25, 8/49 = (1−q⁻²)/(q−1)`. The units are `O_v ∖ P`, `[O_v:P] = q²`. | holds | none |
| §1.2(c), wrong model | split `1−q⁻²` ÷ `(1−q⁻¹)` | `3/2, 4/3, 6/5, 8/7 = 1 + q⁻¹`, and `∏(1+p⁻¹)` diverges | Check discriminates | none |
| §1.2(c) product | all `𝔭` | `∏_all(1−q⁻²)·∏_(Ram_f)(q−1)⁻¹ = ζ_k(2)⁻¹∏(N𝔭−1)⁻¹`; for `M₂(ℤ)` this gives `π/3` again | holds | none |
| §1.1 comparison over `ℝ` | `k = ℚ`, `(1,1)`, `S₂ = Ad(diag(√2,1))∘S₁`; centralizer | `f_m` from `lift`; `u = diag(√2,1)`; `u′f₁u′⁻¹ = uf₁u⁻¹` gives `u⁻¹u′ ∈ Z(M₂(ℝ)) = ℝ·I` | holds; elaborated | none |
| §1.1 justifying clause | `k = ℝ`, `place = id`, `(1,1)` | `finrank_ℝ M₂(ℝ) = 4`; `skolemNoether ℝ S₁ S₂` applies directly | clause false | R01 |
| `QuaternionAlgebra.lift` relations | `S(i)`, `S(j)` | `S(i)² = place(a)I`, `S(j)² = place(b)I`, `S(j)S(i) = −S(i)S(j)` (Basis with `c₂ = 0`) | holds | none |
| Supplier contract, `skolemNoether` | binders at `:107` | `B` central and simple; `A` simple and finite-dimensional; the conclusion direction matches line 404 | holds | none |
| §2.2 Skolem–Noether over `K₀` | `PSL₂(ℤ)`, `c = diag(2,1)` | `A_Γ = M₂(ℚ)`, `finrank 4 > 0`, so finite-dimensional; `Ad(c)` is a `ℚ`-algebra automorphism; `b_c = diag(2,1)`, unique mod `ℚ^×` | holds | none |
| `liftSL` Checks | `⊥`; `⟨[S]⟩`; image of `Γ₁(4)` | `{±I}`; `S² = −I`, `S³ = −S`, `S⁴ = I`, order 4, and `S·S = −I ∉ {I,S}`; `−I` has diagonal `−1 ≢ 1 mod 4`, so `[±Γ₁(4):Γ₁(4)] = 2` | discriminates | none |
| `squareSubgroup` Checks | `PSL₂(ℤ)`; `C₂`; `Γ̄(2)`; `a²b²` | `ℤ/6 ⊗ ℤ/2 = ℤ/2`, index 2; `{1}`; `F₂/F₂^(2) = (ℤ/2)²`, index `4 = 2²` (line 624's bound); none of the 1457 reduced words of length ≤ 6 squares to `aabb` | discriminates | none |
| `N_B⁺(O)`, `ν` Checks | `diag(−1,1)`; `2I`; Hurwitz order | `det = −1`, Möbius action `(−z̄+0)/(0+1) = −z̄`; `Nrd(2I) = 4 = 2²`, so `[4] = [1]`; `covol(N) = (π/21)/index ≥ π/21`, so the index is 1. `2cos(2πj/7) = 1.2470, −0.4450, −1.8019`, with product `1.0000`. Sign vectors `(1,1,1), (0,1,1), (1,1,0)` span all 8 patterns. | holds | none |
| Lean section titles | `:222`, `:270` against README 999, 1193 | identical strings | holds | none |

Rows carried forward unchanged from the previous report (PRREVIEW-ArithmeticFuchsianGroups~4, at b98ed29). Their statements are untouched; the values are those recorded there:
- `RealSplitting`: the other place of `ℚ(√2)` gives `−1.414 < 0`; Hamilton's quaternions have no splitting; `(1,1)` fails.
- `normOneImage` / `isCofinite_normOneImage`: `PSL₂(ℤ)` has covolume `π/3`; `ℤ·1` is not an order.
- `cocompact_…_iff_anisotropic`: `(1,1)` is isotropic and has a cusp; `(−1,3)` is anisotropic by descent.
- `IsArithmetic`: false for `⊥`, true for `PSL₂(ℤ)`, false for `G₅` (`tr((ST)²) = φ − 1`).
- `finiteRamification`: `{2}`, `{2,3}`, `∅`, `∅`.
- `covolume_normOneImage`: `π/3`, `2π/3`, `π/21`.
- `IsNonelementary`: F, F, T.
- `squaredTraceField`: `ℚ(t)` against `ℚ(t²−2)`.
- The commensurable direction: `2^(±2/3)`.
- The envelope theorem: dimension 4, and 1 for `⊥`.
- `integral_trace_lattice_order`: `E₁₁` lies in the span.
- Squared-trace integrality: `5/2` and `φ`.
- `discr_ge_odlyzko_five`: `2.33·10⁻²⁹ ≤ 1`, and the margins `0.0008655 > 0.0008515`.
- Inequality (13): grid minimum `4.0·10⁻⁷ > 0`.
- `finite_conj_isArithmetic_covolume_le`: `F = ∅` below `π/21`.
- The §1.4 constants: `325.0 ≥ 49`.
- The standard presentation: `ab(PSL₂(ℤ)) = ℤ/6`; genus 3 gives `10 − 15 + 1 = −4`.
- The index-two inclusion.
- `discr_ge_totallyReal`: 31 rows; minimum ratio `1.2036914` at `n = 9`.
- `H`, `F_b`: `∫H = 4/3`.
- §2.0.
- `isArithmetic_iff_dense_commensurator`.
- `commensurator_discrete_of_not_isArithmetic` (`G₅`).
- `dense_commensurator_…_number_field` (degrees 1 and 3).
- `instTopologicalSpacePGL` (`diag(1+1/n,1) → 1`).
- `commensurator_pgl_eq_of_maximal`.
- `existsUnique_pgl_smul_eq_isometryEquiv` (`cosh d = 3`).
- §3.1 lifting.
- §3.2: class sizes and characters `8,0,0,0,2,0,4,0,0,2,0`.
- §3.3.
- §3.4: `h = 17`.
- §3.5: `64π`.

**Remark on untouched text.** README line 10 is 126 characters long after the reflow of the Summary. No rule applies, and no change is requested.

## Not verifiable

- **Takeuchi 1983, Theorem 2.1.** No legal full text was found: the previous report tried Project Euclid and J-STAGE. It should be recorded as uncertified with DOI `10.2969/jmsj/03530381`. The diff does not touch it.
- **Maclachlan–Reid, Theorems 11.2.1 and 11.3.1, and Margulis, Chapter IX.** Uncertified (paywalled), as the manifest records.
- **Odlyzko 1977, displayed formulas (4)–(13), and Odlyzko's Table 2.** The formulas are images in the extraction, and the table is not in the cited file. The previous report recomputed both, and the diff does not touch them.
- **Ownership against open pull requests.** I checked it only through `overlaps.md` and the change's own objects. The diff introduces no object a second roadmap could own.

## Source issues

- none
