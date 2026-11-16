<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13039#issuecomment-6906411910 -->
Red team round 2 pass b (claude) of 45c2dfc

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §4.3 lifts through the filling criterion, whose hypothesis fails for `RH^*`

   - **Location.** `README.md:643`: "lift by the filling criterion §4.5 applied to the tautological STE, with §§2.6, 2.9 and 3.3 for the boundary factors"; *Needs* at `README.md:645`.
   - **Claim.** §4.5 with `S = RH^*` gives `H^{2r}(M̄_{2,n}) = RH^{2r}(M̄_{2,n})` for `r ≤ 10`.
   - **Witness.** `(g, n, k) = (2, 12, 12)`: §4.5 requires the triple `(1, 11, 11)` (`(1, 11) ≺ (2, 12)`, `22 − 11 = 11 ≤ 30 − 12 = 18`, `11 ≤ 12`). There the quotient is `S₁₂`, of rank two, and `RH¹¹(M̄_{1,11}) = 0`: not surjective, as the README's own Check says (`README.md:681`).
   - **Repair.** The target is true; the route must use the parity of the degrees, not §4.5.
     - Replace the quoted clause by: "lift by §0.4 and induction on the stable-pair order. §4.5 does not apply to `RH^*`: its hypothesis fails at the odd triple `(1, 11, 11)`, which is called on whenever `n ≥ 9`, `r ≥ 6` and `2n − 2r ≥ 5`, for instance at `(2, 12)` with `r = 6`. Instead, the boundary term `H^{2r−2}(D̃)(−1)` has Künneth factors on moduli of genus at most two; two factors of odd degree would both have degree at least eleven (§2.9), which `2r − 2 ≤ 18` excludes, so every factor has even degree at most eighteen and is tautological, by §2.6 in genus zero, §3.3 in genus one and the induction in genus two; clutching pushforwards of tautological classes are tautological, and `W_{2r}H^{2r}(M_{2,n}) = RH^{2r}(M_{2,n})` lifts by definition."
     - *Needs:* "§§4.2, 0.4, 2.6, 2.9, 3.3, 3.1" (drop §4.5).
     - Add the Check: "§4.5 with `S = RH^*` is not the route: at `(2, 12, 12)` it calls on `(1, 11, 11)`, where the quotient is `S₁₂` and `RH¹¹ = 0`. The parity argument needs no odd triple: `H^{10}` of the divisor `M̄_{1,a} × M̄_{1,b}` has no summand `H^i ⊗ H^j` with `i, j` odd, since `i, j ≥ 11`."
     - Add to "Corrections to the sources": "CLP, sentence before Corollary 2.7, pp. 7–8: the corollary is deduced by applying Lemma 2.1 to `RH^*`; the hypothesis of the lemma fails at `(1, 11, 11)`, and the corollary follows instead from the boundary sequence and the vanishing of odd cohomology through degree nine (§4.3)."
     - Tested on `(2, 12)`, `r = 6`: the divisors are `M̄_{1,14}` (even `H^{10}`, §3.3), `M̄_{1,a} × M̄_{1,b}` (no odd pair) and `M̄_{0,a} × M̄_{2,b}` (induction). §§10.2 and 10.6 also apply §4.5 to `RH^*`, in degrees four and six: their odd triples have `k′ ≤ 5`, where `W_{k′}H^{k′} = 0`, so they are unaffected.

2. **F02** (P2) the `ℓ`-adic weight filtration over `ℚ̄` is cited to a statement over `𝔽_q`

   - **Location.** `README.md:34`: "`ℚ_ℓ`-étale cohomology of `X_ℚ̄` with its continuous `G_ℚ`-action"; `README.md:232` (§0.4): "DeligneWeightsAndPurity §8.24 (weight spectral sequence and purity, ℓ-adic)"; `README.md:1553` (§10.7): "in the ℓ-adic realization by DeligneWeightsAndPurity §8.24".
   - **Claim.** §8.24 supplies the weight filtration, the boundary sequences and the `E₂`-degeneration for `H^*(M_{g,n} ⊗ ℚ̄, ℚ_ℓ)` as `G_ℚ`-modules.
   - **Witness.** DeligneWeightsAndPurity §8.24 (head of its open pull request) begins "Let `X₀` be a smooth proper scheme … over `𝔽_q`" and is a "spectral sequence of Frobenius modules"; the README's own contract says "over `𝔽_q`" (`README.md:103`). No sentence of the README defines `W_k` on the `G_ℚ`-realization of an open stack.
   - **Repair.** No new gap is needed.
     - Add to the Conventions, **Cohomology**: "In the `ℓ`-adic realization over `ℚ̄`, the weight filtration of `H^*(M_{g,n})` and `H_c^*(M_{g,n})` is the filtration of the boundary resolution of `j_!ℚ_ℓ` by the sheaves of the normalized boundary strata with their orientation characters (§10.7), which is defined over `ℚ` and so is `G_ℚ`-stable; in particular `W_kH^k(M_{g,n})` is the image of `H^k(M̄_{g,n})`. Its `E₁` terms are cohomology groups of smooth proper stacks and its differentials are restriction maps, so the stack Artin comparison (WeilConjectures, WC.1) identifies it with the Hodge weight spectral sequence of gap:dm-stack-mixed-hodge, which gives the degeneration at `E₂`. DeligneWeightsAndPurity §8.24 is stated over `𝔽_q` and is applied to the reductions `M̄_{g,n} ⊗ 𝔽_p`, for the point counts of Layers 1, 8 and 9."
     - In the *Needs* of §§0.4 and 10.7 replace "DeligneWeightsAndPurity §8.24 (… ℓ-adic)" by "DeligneWeightsAndPurity §8.24 (over finite fields) and WeilConjectures, WC.1 (stack Artin comparison, for the `G_ℚ`-realization)"; in §10.7 replace "in the ℓ-adic realization by DeligneWeightsAndPurity §8.24" by "over `𝔽_q` by DeligneWeightsAndPurity §8.24, over `ℚ̄` by the comparison of the Conventions".
     - Tested: `W₁₁H¹¹(M_{1,11})` is the image of `H¹¹(M̄_{1,11}) = S₁₂`, a `G_ℚ`-stable subspace; for `M_{0,4}`, `C¹_0/im α = ℚ²` is `Gr^W_0H_c¹` in both realizations.

3. **F03** (P3) SchurWeyl is cited at Layer 7 for objects of its Layers 0–5

   - **Location.** `README.md:20`: "Partitions, Specht modules, the fixed-degree Frobenius characteristic and Pieri rules are SchurWeyl, Layer 7"; `README.md:509` "SchurWeyl, Layers 7 and 9 (Young symmetrizers, …)"; `README.md:712` "SchurWeyl, Layer 7 (Specht modules and tabloids)"; `README.md:530`, `1700`.
   - **Claim.** Layer 7 of SchurWeyl owns partitions, tabloids, Young symmetrizers, Specht modules and hook dimensions.
   - **Witness.** `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md` on main: Layer 0 "partitions, diagrams, tableaux", Layer 1 "permutation modules `M^λ`", Layer 2 "Young symmetrizers", Layer 3 "the Specht modules `S^λ`", Layer 5 "the hook-length formula"; Layer 7 is "symmetric functions, the Frobenius characteristic, and RSK" (lines 309–580).
   - **Repair.** `README.md:20`: "Partitions, permutation modules, Young symmetrizers and Specht modules are SchurWeyl, Layers 0–3, and hook dimensions its Layer 5; the fixed-degree Frobenius characteristic and Pieri rules are SchurWeyl, Layer 7". Contract (`README.md:133`): prefix "Layers 0–3 and 5 (partitions, tabloids and permutation modules, Young symmetrizers, Specht modules, the hook-length formula);". *Needs*: §3.1 "SchurWeyl, Layer 2 (Young symmetrizers) and Layer 9 (…)"; §3.2 "SchurWeyl, Layers 3 and 5 (hook Specht modules and their dimensions)"; §4.7 "SchurWeyl, Layers 1 and 3 (tabloids and Specht modules)"; §11.8 "SchurWeyl, Layer 7 (Pieri rule) and Layer 5 (hook dimensions)"; adjust the Dependencies lines of Layers 3, 4 and 11.

4. **F04** (P3) "no supplier states" the `p`-adic inputs: WeilConjectures states them

   - **Location.** `README.md:97`: "their Deligne–Mumford versions need local `p`-adic inputs that no supplier states"; `README.md:1402`: "needs local `p`-adic inputs that no supplier states".
   - **Claim.** No supplier states the `p`-adic comparison for Deligne–Mumford stacks.
   - **Witness.** WeilConjectures §1.8 (head of its open pull request): "For smooth proper DM stacks over a `p`-adic trait, include descent of the rational crystalline and de Rham comparison of PadicHodgeTheory §8.1; it is the input to the stack polynomial-count theorem over all `Spec ℤ`."
   - **Repair.** In both places replace "that no supplier states" by "(the descent of the crystalline and de Rham comparison to smooth proper Deligne–Mumford stacks, WeilConjectures, WC.1, stack points, compact supports and duality, with PadicHodgeTheory §§5.3 and 8.1), which this roadmap does not consume". The route of §9.7 is unchanged.

5. **F05** (P3) §3.4 still attributes the cohomology comparison to the supplier; §2.1 does not name the definition it compares with

   - **Location.** `README.md:553`: "Route: by §2.3 of MappingClassGroupsAndCanonicalRepresentations, `H^*(M_{g,n}, ℚ) = H^*(Mod_{g,n}, ℚ)`"; `README.md:391`: "the rational Betti cohomology of the analytic stack `[T/Γ]`, which is that of its homotopy type, the Borel construction".
   - **Claim.** The supplier's §2.3 gives the comparison; the stack's Betti cohomology is that of the Borel construction.
   - **Witness.** That §2.3 (head) proves contractibility, the proper action and `M_{g,n}^an = [T(g, n)/PMod(g, n)]`, and no cohomology isomorphism; the README's own contract says "Assumed: no statement on cohomology" (`README.md:149`). The *Needs* of §2.1 (`README.md:395`) names no supplier of the stack's Betti cohomology.
   - **Repair.** §3.4: "Route: by the comparison of §2.1, `H^*(M_{g,n}, ℚ) = H^*(Mod_{g,n}, ℚ)`". §2.1, after "Route:", insert: "The Betti cohomology of the analytic stack (gap:dm-stack-mixed-hodge) is computed on the Čech nerve of the atlas `T → [T/Γ]`, the simplicial manifold `T × Γ^•`, whose geometric realization is `T ×_Γ EΓ`." Add "MixedHodgeModulesAndIrregularHodgeTheory, gap:dm-stack-mixed-hodge (Betti cohomology of the analytic stack)" to the *Needs* of §2.1. Tested on `M_{1,1}`: the nerve of `ℍ → [ℍ/SL₂(ℤ)]` realizes `ℍ ×_{SL₂(ℤ)} ESL₂(ℤ)`, with rational cohomology `ℚ` in degree zero.

6. **F06** (P3) §4.4 API: products of generators are missing from the description of a generated STE

   - **Location.** `README.md:663`: "Every class of a generated STE is a finite sum of decorated-graph expressions: clutching pushforwards of exterior products of pullbacks of generators, multiplied by tautological classes."
   - **Claim.** These expressions span the generated STE.
   - **Witness.** An STE is a system of subalgebras (`README.md:654`), so it contains `f_A^*x · f_B^*y` for two generators on one vertex; the listed expressions carry one pullback of a generator per vertex and are not shown closed under cup product. §4.11 itself counts "finitely many tensor lengths" (`README.md:758`).
   - **Repair.** "…clutching pushforwards of exterior products of classes on the vertices, each a product of forgetful pullbacks of generators and of a tautological class." Tested: `f_A^*ω · f_B^*ω ∈ H²²(M̄_{1,22})`, `A ∩ B = ∅`, lies in `S_ω` and is of the repaired form with two generator factors on one vertex.

7. **F07** (P3) "`S_n`-equivariant polynomial count" is used and never defined

   - **Location.** `README.md:367`: "has polynomial point count over every finite field, with `S_n`-equivariant polynomial counts"; also §§9.2 and 9.9.
   - **Claim.** The term is fixed by the Conventions.
   - **Witness.** The Conventions define only "polynomial point count" (`README.md:38`); `README.md:362` warns that twisted counts form a class function that need not be a character, so two readings differ (each twisted count a polynomial; or one element of the representation ring over `ℚ[T]`).
   - **Repair.** Add to the Conventions, **Point counts**: "An `S_n`-equivariant polynomial count of a stack `X` with `S_n`-action is an element `A = Σ_j a_j T^j` of `R_ℚ(S_n) ⊗ ℚ[T]` such that, for every prime power `q` and every `σ ∈ S_n`, the mass of the twist `X^σ(𝔽_q)` of §1.1 is `Σ_j χ_{a_j}(σ) q^j`; it is written through the Frobenius characteristics of the `a_j`." Tested on `M̄_{0,4}`: `A = s_{(4)} T + s_{(4)}`, and for a 4-cycle `σ` the twist has `q + 1` points.

Round 2. Both files were read in full (`packages/MotivicStructuresInModuliOfCurves/README.md`, 1933 lines; `packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, 46 lines). Seven new findings: two P2 (S01, S02) and five P3 (S03–S07). No false target statement was found; S01 is a proof route that fails on an explicit instance while its target stays true.

## Round 1 findings at this head

| Finding | Status | Witness at this head |
| --- | --- | --- |
| 1a/F01 (gap for Riemann–Roch on the cover) | repaired | `README.md:71` "What EquivariantIntersectionTheory must provide (gap:equivariant-grr): …"; `README.md:929` cites it in the *Needs* of §6.5; `design/plan.json` has the slug (nine slugs in both files). SchemeAndStackFoundations §5.8 on main states `grothendieck_riemann_roch` for projective morphisms of smooth quasi-projective varieties, as the gap assumes. |
| 1a/F02 (boundary factors in homological degree) | repaired | `README.md:1745` "exactly one factor has odd homological degree, eleven or thirteen … the other factor … has homological degree two or zero, tautological by §10.4"; `README.md:1758`; Check at `README.md:1754`. |
| 1a/F03 (family (e), 858) | repaired | `README.md:1664` "of the twelve markings other than `x` and `k`, so that `i`, `j` or `k` may be `y` (`858`)"; `13 · 66 = 858`. |
| 1a/F04 = 1b/F04 (`g = 1` in §2.2) | repaired | `README.md:405` "For `g = 1` the statement is `H¹(M_{1,1}, ℚ) = H¹(SL₂(ℤ), ℚ) = Hom(SL₂(ℤ), ℚ) = 0`". |
| 1a/F05 = 1b/F06 (Summary and Theorem 1.9) | repaired | `README.md:3` ends "and for `n ≤ 11` every `H^k(M̄_{3,n})^ss` is a polynomial in `L` and `S₁₂` (CLP, Theorem 1.9)". Summary and docstring both list the same eight headline results. |
| 1a/F06 (§4.9, genus one) | repaired | `README.md:734` "in genus one by §3.2, which makes `W_{k′}H^{k′}(M_{1,n′})` a sum of forgetful pullbacks when `n′ > k′ ≥ 1` and zero when `k′ > n′`". |
| 1a/F07 (§11.9, 55) | repaired | `README.md:1710` "which excludes `55` (`880`) and `66` (`891`)". |
| 1a/F08 (stack `B`) | repaired | `README.md:888` "Write `B` for the stack of such pairs `(E, F)` …". |
| 1b/F01 (§9.7 without `p`-adic inputs) | repaired, with a new inaccuracy | `README.md:1402` routes through §5.4 and cycle classes; pairs `≼ (4, 3)` recomputed: `(4, ≤3), (3, ≤5), (2, ≤7), (1, ≤9)`, inside `c = 11, 11, 10, 10`. The added sentence "that no supplier states" is S04. |
| 1b/F02 (cohomology comparison) | partly repaired | `README.md:391` states the comparison and `README.md:149` the contract, but `README.md:553` still reads "by §2.3 of MappingClassGroupsAndCanonicalRepresentations, `H^*(M_{g,n}, ℚ) = H^*(Mod_{g,n}, ℚ)`". See S05. |
| 1b/F03 (§3.2 route) | repaired | `README.md:528` "The summand `Sym^qV` has `H⁰ = 0` for `q > 0`, and `W_kH¹(M_{1,1}, Sym^{k−1}V) = S_{k+1}`"; Check at `README.md:537`; `μ(12, 10) = 12 − 1 = 11`. |
| 1b/F05 (§10.6 *Needs*) | repaired | `README.md:1541`–`1543`; Check `(1, 7, 6)`: `2·7 − 6 = 8 ≤ 2·10 − 6 = 14`. |

## The adversarial pass: computed instances

`Suggested.lean` declares nothing (module docstring, `import Mathlib`, an empty namespace); the signature lead `and` is a word of the docstring. No Lean was run. Rows are README targets; rows already tabulated with the same values in round 1 are not repeated unless recomputed here.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.3 order, vertex clause | general graph; one-vertex loop | `Σ_v (2g_v − 2 + n_v) = 2g − 2 + n`, each term `≥ 1`; loop vertex `g_v = g − 1` | holds | none |
| §2.1 bounds, §2.3 | `n = 0`; `n = 1`; `n ≥ 2`; `(1, 1)` | `2d − (4g − 5) = 2g − 1`; `2d − (4g − 3) = 2g − 1`; `2d − (4g − 4 + n) = 2g − 2 + n`; vcd `1` | holds | none |
| §2.5–§2.9 base regions | `k = 5, 7, 9` | `(1, ≤5), (2, ≤3)`; `(1, ≤7), (2, ≤5), (3, ≤3)`; `(1, ≤9), (2, ≤7), (3, ≤5), (4, ≤3)` | inside §1.6 except genus four | none |
| §1.5 trace identity | `U` Jordan, `σ = diag(1, 1, −1)`; transposition `σ′` | `tr(σU) = 1 = tr σ`; `tr(σ′U) = 2 ≠ 1 = tr σ′` | holds | none |
| §3.2 | `k = 1`; `n = k`; `k = 13` | `S₂ = 0`; `T_{(1^k)}` sign, rank `2 dim S_{k+1}`; `μ(12, 10) = 11` | holds | none |
| §3.6 | `c₁₂`, `c₁₃`, `n = 13` sum | `11L − 55`; `e₂(L, …, L − 11) = 66L² − 726L + 1925`, plus `11L`; `66 + 429L + 66L²` | holds | none |
| §3.6 genus two | `(0, 0)` | `(L² + L²)/2 = L²`; `L³ + L² − L² = L³` | holds | none |
| §4.2(b) | `n = k = 1`; `n = k = 2`, `g ≥ 3` | `0 = 0`; span of `ψ₁, ψ₂, κ₁ − ψ₁, κ₁ − ψ₂` has rank `3` | holds | none |
| §4.3 route via §4.5 | `(2, 12, 12)` with `(1, 11, 11)` | `11 ≤ 18`, `11 ≤ 12`; quotient `S₁₂`, `RH¹¹ = 0` | route fails, target true | S01 |
| §4.3 Check (Graber–Pandharipande) | degree of the class | codimension `11` in `M̄_{2,20}` (`graber-pandharipande` line 97), so degree `22` | holds | none |
| §4.5 induction | boundary factor; forgetful source | `Σ_v (2d_v − k_v) = 2d − k`; `2(d − 1) − k ≤ 2d − k` | closes | none |
| §4.6 | stratum `(0, n₁) × (2, n₂)`; tree leaf `w` | `n₂ ≤ n − 1`; `m = n − n_w + 2 ≤ n − 1`; `ξ_*(pr₁^*γ) = [D_e] · π^*γ` | holds | none |
| §4.9 | genus one; genus zero | region `n′ = k′ ≥ 1`; region empty (`n′ ≤ k′ ≤ n′ − 4`) | holds | none |
| §4.4 API | `f_A^*ω · f_B^*ω` on `M̄_{1,22}` | two generator factors on one vertex | bullet too narrow | S06 |
| §§10.2, 10.6 via §4.5 | odd triples `k′ ≤ 5` | `W₁H¹ = W₃H³ = W₅H⁵ = 0` (§2.7) | unaffected by S01 | none |
| §9.3 | `n = 0, …, 3` | `2d − s = 2(9 + n) − (9 + 2n) = 9` | holds | none |
| §9.6 | `n = 0` row | closed minus boundary: `q⁶: 32 − 33`, `q⁷: 13 − 12`, `q⁸: 4 − 3`, `q⁹: 1` | holds | none |
| §9.7 | `n = 3, 4, 5` | `(1, 9), (2, 7), (3, 5), (4, 3)`; `(1, 10), (2, 8), (3, 6), (4, 4)`; `(1, 11)` outside | holds for `n ≤ 4` | none |
| §8.9 | unmarked sum | `q¹⁵ − q¹⁴ − q¹³ + q¹² = q¹²(q − 1)²(q + 1)`, quotient `q⁸` | holds | none |
| §8.10 | unmarked sum | `p₁₅ − (q² + 1)p₁₂ + (q⁴ + q²)p₆ = q¹⁵ − q¹² − q¹¹ + q⁸ + q⁷ + q⁶ + q⁵ + q⁴` | holds | none |
| §8.5 | `dim V^con`, `V^nsp` | `1 + 3 + 5 + 7 − 1 = 15`; `20 − 4 − 1 = 15` | holds | none |
| §12.1 | base pairs | `(1, ≤13), (2, ≤11), (3, ≤9), (4, ≤7), (5, ≤5), (6, ≤3)` against `c`; `(2, 11)`: `H¹⁵ = a·H¹³` at `d = 14` | holds | none |
| §12.2 | base pairs | `(3, ≤11), (4, ≤9), (5, ≤7), (6, ≤5), (7, ≤3)`, all equal to or inside `c`; `(2, 13)`: `H¹⁷ = a·H¹⁵` at `d = 16` | holds | none |
| §12.3, §12.9 | twists | weight of `L^{d−12}S₁₂` is `2d − 13`; `(L^{d−12}S₁₂)^∨(−d) = L S₁₂` | holds | none |
| §12.10 | boundary of `M̄_{3,n}`, `k ≤ 17` | factor degrees `≤ 15`; odd pairs need `≥ 22`; genus-one factors `≤ 12` flags | holds | none |
| Weight filtration, `ℓ`-adic over `ℚ̄` | supplier's base | DeligneWeightsAndPurity §8.24 is over `𝔽_q` | citation short | S02 |
| gap:equivariant-grr | mixed spaces | `X ×^G U → Y ×^G U` projective between smooth quasi-projective varieties; §5.8 applies in each degree | precise | none |

## Dependency check

```text
depcheck: 242 roadmaps, 2273 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Read.** 1933 README lines, 111 numbered targets with their *Needs* and Checks; 0 Lean declarations.
- **Lean file.** One `import Mathlib`, one module docstring of the required form, an empty namespace, no `set_option`, `sorry`, `lemma` or stand-in. The eight headlines of the docstring are the eight of the Summary; none is statable at the pins (no algebraic stacks, stable curves or their moduli). No padding. No `#check @name` comparison was possible or needed.
- **Recomputed.** The 27 rows above.
- **Locators verified this pass (11).** CLP Lemma 2.1 and its proof (`clp` lines 179–205), Proposition 2.6 and Corollary 2.7 (lines 309–319), Proposition 4.2 with `BPGL_n` (lines 465–472), Table 1 and Proposition 4.5 (lines 525–534), proof of Theorem 1.9 (lines 535–540), top-heaviness (lines 106–109), the Graber–Pandharipande sentence (line 114); Canning–Larson Theorem 1.4, p. 4 (`canning-larson` line 473; `M̄_{4,n}`, `n ≤ 6`), Proposition 3.15, p. 13 (line 845), Lemma 9.9 (`n ≤ g + 7`, line 1790); Canning–Larson genus seven Remark 2.3, pp. 6–7 (`canning-larson-genus-seven` lines 257–268).
- **Supplier citations checked by content (9 roadmaps).** WeilConjectures §§1.7–1.15, 5.22–5.27, 6.8 (item names as cited; §5.23 has no range on `s`; §5.24 needs no `p`-adic input); DeligneWeightsAndPurity §§8.24, 9.6; EquivariantIntersectionTheory Convention 5, §§2.1–2.3, 3.3; SchemeAndStackFoundations §§2.20, 3.2, 3.3, 4.15, 4.17, 5.1–5.8 (`chow_blowup_formula` in §5.7, `grothendieck_riemann_roch` in §5.8); StableReductionPartII §§4.14, 5.15 (the Edidin–Graham comparison is stated there), 5.16, 7.11; MappingClassGroupsAndCanonicalRepresentations §2.3; SchurWeyl Layers 0–9 and §9.7 (S03). The citation resolver lists nothing missing.
- **Pinned declarations (4).** `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology` (a `def` with `[ContractibleSpace E]`, `TauCeti/AlgebraicTopology/Cohomology/GroupCohomology.lean:248`); `ModularForm.dimension_level_one`, `CuspForm.rank_eq_one_of_weight_eq_twelve`, `CuspForm.rank_eq_zero_of_weight_lt_twelve` (their namespaces in `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean`).
- **Gaps.** Nine slugs in the README and in `design/plan.json`, each with a named supplier and section.
- **Policy.** The pull request changes only the package folder; no pull-request number, process narrative or machine path in the README or the docstring; `sources.toml` has no local path.
- **Further source read.** Graber–Pandharipande, arXiv:math/0104057, fetched through the sources service (it is not in `sources.toml`; the README cites it only as recalled in CLP): its class has codimension eleven in `M̄_{2,20}`, so the second Check of §4.3 is correct as printed.
- **Ownership.** `scratch/overlaps.md` lists no second copy, no dropped id and no close roadmap by results; nothing further was found by object.

## Not verifiable

- `harer-vcd` and `mukai` are uncertified: cited by locator, text not read.
- The tables of §§8.9–8.11, 8.14, 9.4, 9.5, 9.9 and 9.10 beyond the rows above were not recomputed this round; round 1 recomputed them.
- The multiplicities `264`, `836` and `186263` of §3.6, and the 891-row matrix of §11.7 (CLP Figure 2 is not legible in the extraction).
- Whether WeilConjectures' "stack Artin comparison" covers open stacks and compact supports, as the repair of S02 assumes: its §1.8 names the comparison without stating its generality.
- Suppliers not re-read by content this round (headings were checked in round 1): VirtualFundamentalClass, MixedHodgeModulesAndIrregularHodgeTheory, MotivesAndAlgebraicCycles, AutomorphicGaloisRepresentations, ArithmeticGaloisRepresentations, AlgebraicModuliForArithmeticGeometry, PELModuli, CanonicalModelsAndGonality, AlgebraicCurves, HabiroNahmSeries, SchemeKTheoryOperations.

Source independence: 8 passages compared with 3 sources (`clp`, `canning-larson`, `canning-larson-genus-seven`), none shared beyond formulas and standard names (longest common run four words); largest share `clp`, about 84 of 216 locators; contents compared with `clp`: independent (Layers 4, 6–7, 10 and 12 each join or split its sections, and the order `5 → 6–7 → 10 → 11 → 12` is forced by the *Needs* of §§7.7, 10.4, 11.10 and 12.1).

## Source issues

- **Gap** in clp at Corollary 2.7, pp. 7–8: the source says the corollary follows at once from Lemma 2.1 applied to the tautological rings; it should use the boundary sequence and odd vanishing, the lemma's hypothesis failing at the triple (1, 11, 11); affects the proof.
- **Error** in clp at Lemma 2.1, hypothesis (2.2), pp. 4–5: the source says only smaller triples of degree at most two less are needed; it should include the same degree with fewer markings, which its proof uses; affects a stated result.

## For the human reviewers

- **Scope.** §4.6 states CLP Lemma 3.2 with an added generator and leaves the printed form open for even degrees from 24 (`README.md:28`, `687`); no refereed source states the modified lemma.
- **Licence.** `kannan` (arXiv:2602.09117) is an unpublished 2026 preprint, cited only for a misprint in `gorsky` (`README.md:1312`, `1900`); `canning-larson` is cited as an arXiv preprint "to appear" (`README.md:1911`).
- **Licence.** The polynomial tables of `README.md` §§9.4–9.6, 9.9 and 9.10 restate numerical results of `bfp` as targets with locators.
- **Not tested.** `harer-vcd` and `mukai` are uncertified; §§2.1 and 7.3 rest on their locators alone.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "45c2dfcaf13eda435e8a6da8f18ae8ae8f351c74", "job": "RT-MotivicStructuresInModuliOfCurves~2b", "model": "fable", "worker": "chris-x29"} -->
