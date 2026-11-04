# Review of AdelicAlgebraicGroups (pull request #792 at 2262a60)

**Verdict:** needs changes

Incremental re-review of 86 changed lines since 1f7bd94. Six of the eight previous findings are repaired and the build-warning failure is gone: the targeted build and the direct elaboration both exit 0 with exactly 20 `sorry` warnings. Two blocking items remain: the upward LFunctions supplier (unchanged in substance) and the dependency checker's FuchsianOrbifolds cycle line, which is a false positive under the main-branch supplier rule but still fails the gate. No file outside the folder changed.

## R01 (P1) — The cycle gate still resolves FuchsianOrbifolds to its open revision

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:124–128`, “supplies the coarse quotient Riemann surface `Γ\ℍ`”; gate line `CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds`.

Claim: the checker builds the reverse edge from the open revision of an existing roadmap, which this brief says is never a dependency.

Witness: main's `TauCetiRoadmap/FuchsianOrbifolds/README.md` contains zero occurrences of AdelicAlgebraicGroups and is not in the merge order (it is on main). The supplied open revision of FuchsianOrbifolds cites AdelicAlgebraicGroups at its README lines 133 and 965. On the main-branch graph this two-node cycle does not exist.

Repair: no author edit; the citation of main's FuchsianOrbifolds layers 0, 1, 4 and 5 is valid. The worker must resolve this supplier to main when adjudicating the gate, or the board must settle the checker's choice of revision. Recorded at P1 only because the brief classes every reported cycle failure so; it is a disputed checker result, not a mathematical cycle. Exact line: `CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds`.

## R02 (P2) — LFunctions remains an upward supplier

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:261`, “LFunctions, Layer 5 for continuation and Layer 7 for nonvanishing”; also lines 110, 499, 2002–2014 and 2312.

Claim: AA.2.4 consumes finite-order Hecke continuation and nonvanishing at one from a roadmap later in the merge order.

Witness: `UPWARD: AdelicAlgebraicGroups (#20) -> LFunctions (#269)`; the movable check reports `not movable` because OrthogonalTamagawaAndLatticeMass (#116) consumes AA.1–4. All seven cited LFunctions names resolve at its open head (`heckeLFunctionC` at its Suggested.lean:1566, `eulerCorrection`:1576, `heckeLFunctionC_eq`:1587, `heckeLFunctionC_induced`:1597, `heckeLFunctionC_eq_primitive`:1607, `heckeLFunction_ne_zero_of_one_le_re`:2680), so the citation is exact but upward.

Repair: unchanged from the previous review. Put the prerequisite in AA.2.4 as an owned target, or assign it to one earlier owner that LFunctions also consumes: continuation and a nonzero germ at one for every nontrivial primitive finite-order ray class character, with the finite Euler correction for larger moduli. Delete the supplier-table row at line 261, the sentences at 110 and 499, the chain `AA → LFunctions → ThetaSeries` at 2002 and the Dependencies entry at 2312. The χ₄ passage at 2035–2039 already records the values the contract must cover: `L(1, χ₄) = π/4`, correction `1 + 3⁻ˢ`, value `π/3` at one; I recomputed all three. The pinned `TauCeti.continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq` still requires `s ≠ 1` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.lean:134`, as in the previous review) and is not a substitute.

## Previous findings

- R01 — repaired: `Suggested.lean:1` now begins with the `module` header; the targeted build and `lake env lean` exit 0 with 20 `sorry` warnings and no module-system warning.
- R02 — not repaired: the checker still prints `CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds`; main's FuchsianOrbifolds has zero reverse citations. Carried as R01, still a disputed false positive.
- R03 — partly repaired: `oddPrimitiveModFour` is gone (zero occurrences) and the χ₄ values are stated; LFunctions layers 5 and 7 are still consumed at 110, 261, 499, 2002 and 2312. Carried as R02.
- R04 — repaired: second countability (558–559) and the idele normalization (935–937) are labelled owned deductions, Rosengarten §1 is cited for the restricted product; the four level-map targets (4669–4671, 4683–4686, 4742–4743, 4805–4807) are owned deductions with Milne p. 58 kept for the small-level neatness, inverse system and right action. All four verified against the text (Milne lines 2510–2525).
- R05 — repaired: lines 155 and 382 carry only `MeasureTheory.Subgroup.index_mul_measure`, declared at `Mathlib/MeasureTheory/Group/Measure.lean:285` inside `namespace MeasureTheory` (line 41).
- R06 — repaired: line 316–317 cites `TauCeti.Bialgebra.CotangentSpace` (`Cotangent.lean:57`) and `Derivation.cotangentLinearEquiv` (`Cotangent.lean:261`); lines 118–119, 503–504 and 4446 cite LocalFieldsRamification layer 0 for valuations and layer 1 for residue units (main's README:59 and :267).
- R07 — repaired: the detached blocks are merged into the Checks of their targets at 578–580, 648–650, 810–815, 1609–1613 and 1755–1757; a scan for consecutive `**Checks.**` headings finds none. Values preserved (exceptional mass 2, tail normalization to 1, the real quadratic idele `(2, 1/2)`).
- R08 — repaired: line 897 reads `μ_∞`.

## Verified sound

**Scope.** The diff touches README lines in AA.0.1, 0.2, 0.3, 0.4, 2.1, 2.2, 2.4, 4.3 and 4.4, the supplier paragraphs at 105–128 and 495–506, the supplier table at 150–160 and the AA.2.5 chart target at 310–322; the Lean change is the two-line `module` header. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds only README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`). The pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, the same as at the previous review, so the inherited library audit still applies.

**Build and elaboration.** `lake build TauCetiRoadmap.AdelicAlgebraicGroups.Suggested`: exit 0, 9119 jobs, 20 warnings, all `declaration uses sorry`, no other warning. `lake env lean` on the file: exit 0, the same 20 warnings. The worker's signature file lists 62 declarations with 6 suspected dropped binders (`box`, `InfinitePoints`, `IsCentralCocharacter`, `algebraicPointMap`, `IsFaithfulAlgebraicPointHom`, the quotient-measure theorem); the Lean statements are byte-identical to the previous head apart from the header, and the previous assessment stands: none needs the dropped instance (`box` is set-theoretic; the algebraic definitions do not need `NumberField`; the quotient-measure theorem keeps its locally compact, Hausdorff, second countable, Borel and modular-character hypotheses). The one-tactic padding probe of the previous review (all 20 theorems fail `rfl`, `simp`, `infer_instance` and `exact?`) is carried forward on the same pins and the same statements.

**Gate.** Text scanners at this head, reproduced:

```text
gate AdelicAlgebraicGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=2 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The worker's run with the build adds `build=0`. The movable dependency check:

```text
not movable: AdelicAlgebraicGroups consumes LFunctions (#269) and is consumed by OrthogonalTamagawaAndLatticeMass (#116), which comes first: moving AdelicAlgebraicGroups after LFunctions would put a supplier after a consumer, a cycle through AdelicAlgebraicGroups
UPWARD: AdelicAlgebraicGroups (#20) -> LFunctions (#269) at README lines [110, 261, 499, 2306]
CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds
depcheck: 201 roadmaps, 1319 edges, 2 problem(s)
```

**Pinned declarations opened.** `MeasureTheory.Subgroup.index_mul_measure` (`Mathlib/MeasureTheory/Group/Measure.lean:285`, finite index, measurable subgroup, invariant measure); `TauCeti.Bialgebra.CotangentSpace` (`TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean:57`, the augmentation ideal modulo its square) and `Derivation.cotangentLinearEquiv` (same file:261, namespace `Derivation`); `RestrictedProduct.topologicalSpace_eq_iSup` (`Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean:293`) and `RestrictedProduct.isOpenEmbedding_inclusion_principal` (same file:374, hypotheses: the `B i` open and `cofinite ≤ 𝓟 S`), the two inputs of the owned second-countability deduction; `HasStrictFDerivAt.toOpenPartialHomeomorph` (`Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:117`). The bare `Subgroup.index_mul_measure` no longer appears.

**Supplier resolution.** LocalFieldsRamification on main: layer 0 “local fields and their finite extensions” (README:59) supplies the valuative structure of a finite extension (`finiteExtension_valuativeExtension`), layer 1 “units, the filtration, and the multiplicative group” (README:267) supplies residue-field units and Teichmüller lifts (README:310–338); the relabelled citation matches. FuchsianOrbifolds on main: layers 0–1, 4, 5 exist (README:193, 215, 286, 311); zero reverse citations. LFunctions at its open head: layer 5 (README:929) and layer 7 (README:1440) exist and the seven names resolve as listed under R02. The resolver's 55 leads are unchanged from the previous review: this roadmap's own Lean names (all declared in Suggested.lean) and named supplier targets of ReductiveGroupsPartII RG2.1, SchemeAndStackFoundations and ZExtension. Ownership of the unchanged targets against open work is inherited; QuaternionicModularForms has no supplied checkout, so its ownership against AA.5.3 was not re-read (the previous external note stands, no finding here).

**Source sample.** The seeded targets that fall in changed passages are 0.4 (idele normalization locator) and 4.3 (the LocalFieldsRamification locator; Milne Proposition 3.5 unchanged); AA.4.4 is not sampled but its four locators changed and were checked. Fresh evidence this round, read in the sources cache (Sutherland, Rosengarten) or fetched through the service from the author's page (Milne, id `Milne`, no manifest edited):

| Target | Text, locator, result |
|---|---|
| 0.1 second countability, 0.4 additive normalization | Sutherland lines 285–287 (p. 6): `μ_v(𝒪_v) = 1`, Lebesgue at real places, `2 μ_ℂ` at complex places; lines 291–303: the σ-algebra on `𝔸_K` is generated by boxes `∏ B_v` with `B_v = 𝒪_v` for almost all `v` and the measure is defined on them. Supports the new sentence “uses such boxes to define the adelic measure”; second countability is indeed absent, correctly labelled owned. |
| 0.4 idele normalization | Rosengarten lines 53–59 (§1, p. 2): local Haar measures with `𝒪_v` mass 1, `dx` on ℝ, `|dz ∧ dz̄|` on ℂ giving `ℂ/ℤ[i]` mass 2, then the restricted-product measure on `G(𝔸)`; lines 64–68: convergence factors. Supports “forms restricted products of local Haar measures on adelic points”; `vol(𝒪_v^×) = 1` is not there, correctly labelled this roadmap's convention. |
| 4.3 neat elements | Milne lines 1514–1520 (p. 34): definition of a neat automorphism and a neat element; lines 1521–1525: Proposition 3.5, a neat finite-index congruence subgroup, proof delegated to Borel 1969 and Witte Morris. The cyclotomic distance argument is not in the text, correctly labelled owned. |
| 4.4 free action, covering maps, action groupoid, Cartesian squares | Milne lines 2510–2516 (pp. 57–58): for `K` sufficiently small every `Γ_g` is neat (by 3.5), hence torsion-free; lines 2517–2525 (p. 58): the inverse system `Sh_{K′} → Sh_K`, the right action `T(gh) = T(h) ∘ T(g)`. Supports exactly the retained attributions; degree, fibre transitivity, stabilizer finiteness and the Cartesian square are not there, correctly labelled owned. |

The remaining sampled targets (1.1, 1.2, 1.3, 1.4, 2.3, 2.5, 3.2, 3.4, 3.7, 4.1, 4.2, 4.6, 4.7) are in unchanged passages; their evidence is the previous report's table (Conrad Thm 3.4 and 3.6 lines 232–291; Arthur §5 and §7; Rosengarten Lemma 3.5 lines 1017–1025; Borel Thm 5.1–5.8 lines 608–733; Orr Thm 4.1 and Lemmas 4.2–4.14; HW Thm 6.1; Rapinchuk Thm 2.3 lines 565–571; Khayutin Prop 3.6 lines 1001–1045; Loeffler Prop 3.1.4), carried forward as evidence of that review, not re-fetched.

**Adversarial table.** Rows for changed statements are computed this round. Rows for untouched statements are carried from [r6](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~6.md) (which carried them from r5); their values are evidence of those reviews.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 0.1 second countability of `Πʳ [G i, B i]` (owned deduction, README:554–562) | `ι = ℕ`, `G i = ℤ/4`, `B i = 2ℤ/4`; `ι = ∅`; `ι` uncountable, `G i = ℤ/2`, `B i = 0` | ℕ case: countably many principal pieces, each a countable product of countable discrete spaces, second countable; the singleton `{0}` is `⋂_n box({0} below n, B elsewhere)`; empty case: a point; uncountable case: `U_∅ = {0}` is open so the group is discrete and uncountable, not second countable | Hypothesis `Countable ι` is needed and present; the two Mathlib inputs carry the `B i` open hypothesis; no change |
| 0.1 merged box Checks (README:578–580) | `C = univ`; one `C i₀ = ∅`; `C = B` | `∀ i, x i ∈ univ` holds for all `x`; no `x` has `x i₀ ∈ ∅`; `box B = {x ∣ ∀ i, x i ∈ B i} = U_∅` | Correct; no change |
| 0.2 merged level Checks (README:648–650) | `S = ι`; `S = {i₀}`; `x i₀ ∉ B i₀` | `U_ι = ∏ G i`; `U_{{i₀}}` restricts every coordinate but `i₀`; `x ∉ U_∅` | Correct; no change |
| 0.3 merged normalized-family Checks (README:810–815) against `exists_unique_convergentHaarProduct` (Lean:86) | `i ∈ S`; tail `a_i = 1`; tail `a_i = 2` | definition `C_S · ∏ʳ(μ_i, a_i⁻¹μ_i)`: exceptional factor `μ_i` unchanged; `a_i = 1` gives `μ_i`; `a_i = 2` gives `(1/2)μ_i` and `C_S` carries the factor 2; box formula `(∏_{T} μ_i(C_i)) · ∏_{i∉T} a_i` agrees with the Lean `∏ i ∈ T … * ofReal (∏' a_i)` | Consistent; no change |
| 0.4 idele normalization (README:930–948) | `K = ℚ`, `∏ ℤ_p^× × [1, e]`; `K = ℚ(i)`, annulus `1 ≤ ‖z‖ ≤ e` | ℚ: `1 · ∫_1^e dx/x = 1`; ℚ(i): `2 ∫∫ r dr dθ / r² = 2 · 2π · 1 = 4π`, whereas `dx dy/‖z‖²` would give `2π` | Rosengarten's `‖dz ∧ dz̄‖ = 2 dx dy` convention; no change |
| 2.1 merged split-component Check (README:1609–1613) | real quadratic `F`, idele `(2, 1/2, 1_f)` | norm `|2| · |1/2| = 1`; `A_G(ℝ)^0 = {(t, t) : t > 0}`; `(2, 1/2) ≠ (t, t)` for every `t` | Lies in the norm-one group but outside the split component; no change |
| 2.2 merged Borel Check (README:1755–1757) | two-point discrete `X`, identity `(X, {∅, X}) → (X, 𝒫X)` | preimage of `{a}` is `{a} ∉ {∅, X}` | Not measurable; the Borel hypothesis is needed; no change |
| 2.4 χ₄ passage (README:2035–2039) | `s = 1`; modulus `4` enlarged to `12`; place `2`; parity | `L(1, χ₄) = 1 − 1/3 + 1/5 − … = π/4 ≠ 0`; `χ₄(3) = −1` so the modulus-12 function is `L(s, χ₄)(1 + 3⁻ˢ)`, value `(π/4)(4/3) = π/3`; ramified at 2, factor 1; `χ₄(−1) = −1`, odd, conductor `4∞` | Values correct; supplier still upward (R02) |
| 2.5 chart target locator (README:316–317) | `G_a` over `k`; `ℚ₃` | augmentation ideal `(T)` of `k[T]`, `I/I² = kT`, dual one-dimensional; `𝔽₃^×` of order 2 | The cited Tau Ceti declarations exist at the pin; no change |
| 4.3 distance of roots of unity with the new locator (README:4438–4447) | `p = 3`, `ζ₃`; `p = 3`, `ζ = −1`; `p = 2`, `ζ = −1` | `|ζ₃ − 1|₃ = 3^{−1/2}` (extended valuation on `ℚ₃(ζ₃)`, layer 0); `|−1 − 1|₃ = |2|₃ = 1` (order-2 residue unit, layer 1); `|−2|₂ = 1/2 = 2^{−1/(2−1)}` | Layer split matches the inputs used; no change |
| 4.4 free action and covering (README:4666–4690; Lean:473) | `GL₁/ℚ`, `U = U(3)`, `U′ = U(9)`, `K∞ = ℝ_{>0}`; `U(2)` | `ℚ^× ∩ U(3) = {1}` (positive units of ℤ congruent to 1 mod 3), neat; `X_U = (ℤ/3)^×` (2 points), `X_{U′} = (ℤ/9)^×` (6), degree `6/2 = 3 = [U : U′]`; `U/U′ = {1, 4, 7}` acts freely and transitively on the fibre `{1, 4, 7}` over `1`; `U(2)`: `−1 ∈ ℚ^× ∩ U(2)` has torsion eigenvalue, not neat | Owned deduction holds on the instance; no change |
| 4.4 action groupoid (README:4733–4746) | `SL₂/ℚ`, `K∞ = SO(2)`, `U = SL₂(ℤ̂)`, object `i` | stabilizer `⟨(0 −1; 1 0)⟩`, order 4, finite and nontrivial; `U` not neat (eigenvalues `±i`) | Finiteness without triviality as stated; no change |
| 4.4 Cartesian squares (README:4799–4808) | `GL₁/ℚ`, `U = U(3)`, `U′ = U(9)`, `L = U(15)` | `U(9)U(15) = U(3)` (at 3: `(1+9ℤ₃)(1+3ℤ₃) = 1+3ℤ₃`; at 5: `ℤ₅^×`); `U′ ∩ L = U(45)`; `|X_{U(45)}| = φ(45) = 24`; fibre product `6 · 8 / 2 = 24` | Bijective on the instance; the general injectivity uses trivial stabilizers at neat `U`, as the README says; no change |
| Module header (Lean:1) | targeted build; direct elaboration | build: exit 0, 20 `sorry` warnings, 0 other; `lake env lean`: exit 0, 20 `sorry` | R01 of the previous review repaired |
| R05 name (README:155, 382) | `C₂ ≤ C₄`, counting | index `2` × `μ(C₂) = 2` gives `4 = μ(C₄)` | Qualified name only; repaired |
| R08 symbol (README:897) | complex unit square | `2 dx dy` mass 2, `dx dy` mass 1 | `μ_∞`; repaired |
| 0.2 `exists_unique_haarProduct` (Lean:71) | `ι = ∅`; `C₂ × C₃` counting; one noncompact `B i = ℝ` | empty: box `univ`, mass 1, Dirac; `C₂ × C₃`: full box 6, singletons 1; noncompact factor: a compact `C_{i₀}` of positive finite mass pins the scalar | Keep; carried from r6 |
| 0.3 `exists_unique_convergentHaarProduct` (Lean:86) | `a_i = 1 − 1/(i+2)²`; `S = ∅`, all `a_i = 1`; `T ⊂ T′` | partial products → 1/2; all `a_i = 1` gives `∏ʳ μ_i`; enlarging `T` multiplies the finite part by `∏_{T′∖T} a_i` and divides the tail by the same | Keep; carried from r6 |
| 1.1 `IntegralModel.localPoints` | `G_a`, `X ↦ pT`, `v ∣ p` | integral points `p⁻¹ℤ_p ⊋ ℤ_p`; standard model `ℤ_p` | Keep; carried from r6 |
| 1.2 `exists_restrictedProductEquiv` (Lean:212) | `G_a/ℚ`, exceptional prime 2 | `(1/2 at 2, 0 elsewhere)` admitted; `1/p` at every prime excluded | Keep; carried from r6 |
| 2.1 `normOne` | `G_m/ℚ`, idele `(p at ∞, p at p)`; `SL₂` | norm `p · p⁻¹ = 1`; `GroupLike O(SL₂)` trivial so `normOne = ⊤` | Keep; carried from r6 |
| 2.2 modular function | Borel of `GL₂`, `p = n(x)m(a)` | left Haar `da dx/a²`, right `da dx/a`; `Δ(diag(2,1)) = 2 = δ_P`; `dμ_ℓ = δ_P⁻¹ dμ_r` | Keep; Source issues; carried from r6 |
| 2.2 `exists_unique_quotientMeasure` (Lean:236) | `H = ⊥`; `H = ⊤`; `C₂ ⊂ C₄`; `SL₂(ℝ) ⊃ B` | `⊥`: `ν = μ_G/μ_H({1})`; `C₂ ⊂ C₄`: `4 = 2 × 2`; Borel: `Δ_G = 1 ≠ Δ_B`, no invariant measure on `ℙ¹(ℝ)` | Keep; carried from r6 |
| 2.4 Weil volume, finite reductive orders | `GL₂`, `q = 2`; rank-one split and nonsplit at `q = 2` | `6/16 = 3/8`, `2 · 3/8 = 3/4 = 1 − 2⁻²`; `|2 − 1| = 1`, `|−2 − 1| = 3`; `2 · 1 · 3 = 6 = #SL₂(𝔽₂)` | Keep; Source issues; carried from r6 |
| 2.5 scalar Jacobian | `ℚ(i)/ℚ`, basis `(1, i)` | real determinant 1, `j = 2⁻¹`; `|d_ℚ| |d_{ℚ(i)}|^{−1/2} = 1/2` | Keep; carried from r6 |
| 3.1 Iwasawa order | `GL₂`, `m = diag(2,1)` | `mnm⁻¹ = n(2x)`, `δ_P(m) = 2`, `δ_P(m)⁻¹` in `nmk` order | Keep; carried from r6 |
| 3.2 `IsReduced`, `exists_reduced_GLZ` (Lean:339, 345) | `n = 0, 1`; `diag(4,1)` vs `diag(1,4)`, `C = 2` | `n = 0`: `C = 2` works; `4 < 2` false, `1 < 8` true; Minkowski bounds give some `C` | Keep; carried from r6 |
| 3.3 closed orbits, lattices | zero representation; weight-one action; `(1/2)ℤ` | `{0}` closed; `𝔾_m ⊂ 𝔸¹` omits 0; `1/4 ∉ (1/2)ℤ` | Keep; carried from r6 |
| 3.4 `arithmetic_finite_volume_iff` (Lean:281) | trivial; `G_m/ℚ`; `SL₂`; `μ₂` | `G_m`: `{±1}\ℝ^×` infinite, `GroupLike = ℤ`; `SL₂`: finite, no characters; `μ₂` excluded by connectedness in `reductiveCommHopfAlgProperty` | Keep; carried from r6 |
| 3.4 `finite_classes` (Lean:295) | `G_a`, `G_m` at full level; `U = {1}` | one class each; `U = {1}` not open, uncountable class set | Keep; carried from r6 |
| 3.4 norm-one domain, `finite_volume_iff` (Lean:304, 313) | `G_a`; `G_m`; `G_a ⋊ G_m` | `𝔸/F` compact; `F^×\𝔸^1` compact, `F^×\𝔸^×` infinite; `ax+b`: `X* = ℤ`, infinite | Keep; carried from r6 |
| 3.4 `exists_compact_normOne_iff` (Lean:323) | `G_m`; `SL₂`; `GL₂` cocharacter | `diag(t, t⁻¹)` noncentral and quotient noncompact; `diag(2,1) n(1) ≠ n(1) diag(2,1)` | Keep; carried from r6 |
| 3.5 heights | `GL₁` point 2 over ℚ | `(2, 1/2)`: `√17/2 · 2 = √17`; relative over quadratic `E`: 17 | Keep; carried from r6 |
| 3.6 cusps | `SL₂(ℤ)` | `Im(−1/z) = y/(x² + y²) ≤ 1/y < 1` for `y > 1` | Keep; carried from r6 |
| 3.7 Siegel torus intersection; tilted and twisted examples | `SL₂ ⊃ SO₂`; `x = 2`; `η diag(2,1,1/2) η⁻¹` | `S_G ∩ H = μ₂`, `S_H = 1`; `[[2, −3/2],[0, 1/2]]`, image `3/4 + i/4` on the ray; `(ηᵀη)₁₃ = −3/2` | Keep; Source issues (Orr); carried from r6 |
| 4.1 `HasWeakApproximation` (Lean:367); torsor convention | `μ₂` at `{∞, 2}`; `S₃`, `g = (12)`, `h = (13)` | diagonal `{(1,1),(−1,−1)}` not dense; swapped rule `(132)` vs `(123)`, inverse rule both `(13)(12)` | Keep; carried from r6 |
| 4.2 strong approximation (Lean:360, 385) | `SL₂`; `SL₂ × SL₁(D)`; trivial `G` | `SL₂(ℝ)` noncompact; product has compact `SL₁(D)(ℝ)`, hypothesis fails; trivial `G`: set is `univ` | Keep; carried from r6 |
| 4.3 `IsNeatAut`, torsion-free balls | `(0 −1; 1 1) · 2`; `p = 3, a = 1`; `p = 2, a = 2` | eigenvalue ratio `ζ₃`, not neat; `3⁻¹ < 3^{−1/2}`; `2⁻² < 2⁻¹` | Keep; carried from r6 |
| 4.4 real quadratic non-covering Check | `ℚ(√2)`, `η = 17 + 12√2` | `3 + 2√2 ≢ 1 mod 4`, `η ≡ 1`; irrational rotation `√2 (L, 0)` | Keep; carried from r6 |
| 4.5 Hecke Check | `K₀(p)`, Iwahori | `I diag(p,1) I` and `I diag(1,p) I` have disjoint reductions | Keep; carried from r6 |
| 4.6 `nrd_image` (Lean:501); squares (Lean:511) | Hamilton; split `(1,1)`; ℚ, idele `−1` at 3 | sums of four squares; `Nrd(diag(c,1)) = c`; `−1 = (r y₃)²` impossible in `ℚ₃` | Keep; carried from r6 |
| 4.7 Fourier limits (Lean:527, 538) | `C = ∏_ℕ {±1}` | kernel masses 1/2; `∫ ψ_J dm_n = 1` iff `J ∈ {∅, {n}}` | Keep; carried from r6 |
| 5.1 torus theorem (Lean:584) | ℚ; `ℚ(√2)`, `Q = ∅`; ℚ, `Q = {3}`, `p = 2` | rank 0 point; `Γ⁺ = ⟨ε²⟩`, index 2; `4 = 2²` admitted, 2 nonsquare mod 3 excluded | Keep; carried from r6 |
| 5.2 `exists_componentHomeomorph` (Lean:634) | `GL₂(ℤ̂)`; `K(3)` | one component; `(ℤ/3)^×` two components `Γ(3)\ℍ` | Keep; carried from r6 |
| 5.3 class sets and stabilizers; compactness | Hamilton at Hurwitz level; `U₁(9)`; `U = (D ⊗ 𝔸_f)^×` | 24 units, quotient 12, `3 = (72/2)(1/12)`; `1 + ni` pairwise non-proportional | Keep; carried from r6 |

**Headline inventory.** Unchanged from the previous review: 20 theorem declarations (restricted and convergent Haar products, restricted-product realization, homogeneous quotient integration, arithmetic covolume, class number, finite volume and compactness, real reduction, weak and strong approximation, neat levels and covering maps, Hasse–Schilling–Maass, idele classes modulo squares, two Fourier limits, the GL₁ torus, the GL₂ upper-half-plane decomposition), and the module docstring names the seven headline groups not statable at the pins with their missing carriers.

## Not verifiable

- Platonov–Rapinchuk–Rapinchuk 2023, Lemma 3.63 and pp. 128–130, 188–196: Cambridge paywall; locator only (inherited).
- Platonov–Rapinchuk 1994, Theorems 6.4, 6.6, 7.8 and Proposition 6.17: Academic Press paywall (inherited).
- BHC 1962, the cited sections: JSTOR paywall (inherited).
- Voight, Lemma 11.2.1 and Proposition 11.3.4: Springer DOI refused by the service, author URL 404 at the previous attempt; the Hurwitz values were recomputed in that review (inherited).
- Orr–Schnell 2023, Theorem 1: publisher host not classified by the service; checked indirectly through Orr v6 and the BKT erratum (inherited).
- Platonov 1969 and its addendum: Mathnet timed out at the previous attempt (inherited).
- Schneider's p-adic Lie theory, BHV Appendix B.1, Stacks tags 0245, 04TY, 04SK: not fetched in this or the previous incremental review.
- The thirteen sampled targets in unchanged passages: evidence carried from the previous reports, not re-fetched this round.
- QuaternionicModularForms: no supplied checkout, so its current ownership against AA.5.3 was not re-read.

## Source issues

No new issue in the passages read this round (Sutherland p. 6, Rosengarten p. 2, Milne pp. 34 and 57–58). The four inherited issues from r5, with their witnesses retained in the table:

- **Error** in Orr at Lemma 4.6 and Theorem 4.1, printed pp. 19 and 15: the source says the ambient Siegel torus intersects the subgroup in its split torus; it should be the identity component of that intersection, which can have extra finite components; affects a stated result.
- **Misprint** in Arthur at §5, left/right Haar comparison, printed p. 25: the source says the left measure is the right measure multiplied by the positive modular exponential; it should be multiplied by its reciprocal; affects nothing.
- **Misprint** in Dudas–Michel at Proposition 7.14, printed p. 28: the source says the torus order is the signed determinant of Frobenius minus identity; it should be the absolute value of that determinant; affects nothing.
- **Error** in CG at §8.2, printed p. 79: the source says the component group is the maximal exponent-pⁿ quotient of the ray class group; it should retain the full narrow-class contribution, including at empty auxiliary level; affects a stated result.
