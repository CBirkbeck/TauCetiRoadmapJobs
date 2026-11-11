<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6801210357 -->
Review (claude) of f94471a

Verdict: needs_changes

1. **F01** (P3) 8.1 counts three statements where it lists four

   - **Location.** README lines 1424–1427 (8.1 route): "For the third statement, generators
     `f_1, …, f_c` … and the second statement applies over `𝔅 = 𝔸^c × 𝔐`"; line 1500 (8.3): "the
     invariance of 8.1's third statement for `T_{Z′/𝔜} ⊕ T_{W/𝔜}`".
   - **Claim.** The third listed statement of 8.1 is the invariance under `T_{Y′/𝔐}|_{X′}`.
   - **Witness.** 8.1 lists four bullets (lines 1393, 1402, 1407, 1411). The third is relative
     invariance over `𝔅`; the `T_{Y′/𝔐}` invariance that 8.3 needs is the fourth.
   - **Repair.** In 8.1's route write "For the fourth statement … the third statement applies over
     `𝔅 = 𝔸^c × 𝔐`"; in 8.3 write "8.1's fourth statement". Tested: 8.3 needs invariance under
     `T_{Y′/𝔐}` with `Y′` the graph ambient `Z′ ×_𝔜 W`, which is bullet four.

2. **F02** (P3) `ρ` in 8.1 and `φ^*` in 8.3 are not defined, and `φ` is already the obstruction theory

   - **Location.** README line 1394 (8.1): "`∂β(Y′, X) = [C_{u^*C/C}] − [ρ^*C_{X′/Y′}]`"; line 1525
     (8.3 API): "boundary `[φ^*C_{u^*𝔠_{X/𝔜}/𝔠_{X/𝔜}}] − [N × 𝔠_{X′/𝔜}]`".
   - **Claim.** Both boundaries are stated with every map named.
   - **Witness.** The README never defines `ρ`. In behrend-fantechi1997 line 1392, `φ` is the map
     `F → u^*E` of vector-bundle stacks; in this README `φ` is `E → L_{X/𝔜}` (Convention 6).
   - **Repair.** 8.1: write `[N ×_{X′} C_{X′/Y′}]`, as the third Check of 8.1 already computes
     (`𝔸¹_ν × Spec k[E]/(E²)`). 8.3: name the projection `q : 𝔉 → u^*𝔈` of VirtualFundamentalClass
     §8.1's sequence and write `[q^*C_{u^*𝔠_{X/𝔜}/𝔠_{X/𝔜}}]`.

3. **F03** (P3) 8.3, first case: the cone is a `B T_{X′/X}`-torsor, not a `T_{X′/X}`-torsor

   - **Location.** README lines 1497–1498 (8.3 route): "`C_{X′/𝔜}` is the `T_{X′/X}`-torsor over
     `u^*C_{X/𝔜}`".
   - **Claim.** For smooth `v`, the intrinsic cone of `X′` is a torsor under the vector bundle
     `T_{X′/X}` over the pulled-back cone.
   - **Witness.** `X = Spec k`, `X′ = 𝔸¹`: `𝔠_{X′} = B T_{𝔸¹}` of dimension `0`, `u^*𝔠_X = 𝔸¹` of
     dimension `1`; a `T`-torsor over it has dimension `2`. The same section's fourth Check has
     `u^*𝔠_{X/𝔜} × B T_{Z′/𝔜}`.
   - **Repair.** "`𝔠_{X′/𝔜} → u^*𝔠_{X/𝔜}` is a torsor under `B T_{X′/X}`, the kernel of
     `𝔉 → u^*𝔈`". On the instance: `1 − 1 = 0 = dim B T_{𝔸¹}`.

4. **F04** (P3) 6.1 uses SchemeAndStackFoundations §§2.6 and 2.10, which the supplier contract omits

   - **Location.** README line 1183 (6.1): "*Needs:* VirtualFundamentalClass §§3.2, 4.3–4.5, 6.5;
     SchemeAndStackFoundations §§2.6, 2.10"; the contract, lines 312–334, and the Scope list, lines
     93–100.
   - **Claim.** Every consumed section is in the contract.
   - **Witness.** The contract lists §§1.3, 1.9–1.10, 1.18–1.23, 2.18–2.20, 3.3, 4.1, 5.1–5.6. Both
     sections exist on main (§2.6 "Quasi-coherent cohomology", §2.10 "Comparison morphisms between
     the topologies of a scheme"); `plan.json` target 6.1 lists them.
   - **Repair.** Add to the SchemeAndStackFoundations contract, and to the Scope sentence: "§2.6
     (vanishing of higher quasi-coherent cohomology on affine schemes) and §2.10 (its comparison
     between the Zariski, étale and fppf topologies), used in 6.1 to split the extension on affine
     charts".

5. **F05** (P3) 4.4 attributes a Check to VirtualFundamentalClass §2.5 that sits under its Layer 2 Examples

   - **Location.** README lines 976–977 (4.4, second Check): "The zero-section self-intersection of
     `O(1)` on `ℙ¹` is a point class under both theories, the VirtualFundamentalClass §2.5 Check."
   - **Witness.** At the supplier's open head, §2.5 has no Checks list; the sentence is the third
     bullet of "Layer 2 … Examples … Checks". (§2.1's `B(ℤ/2)` Check, cited one bullet above, is
     where the README says.)
   - **Repair.** "the Check in the Examples of VirtualFundamentalClass Layer 2".

6. **F06** (P3) 8.1 applies a corollary stated for varieties to a space that is not integral

   - **Location.** README lines 1395–1398 (8.1, first bullet): "from the double deformation space
     … and the intersection of its two `P`-divisors (kresch1999b Corollary 1.10, lines 182–190),
     which makes no use of reducedness".
   - **Claim.** Corollary 1.10 applies as stated to the double deformation space of any ambient.
   - **Witness.** kresch1999b line 182: the corollary is for `P`-divisors "on a variety", with its
     normalisation (line 183). For `Y = 𝔸¹ × Spec k[ε]/(ε²)` the double deformation space is
     non-reduced.
   - **Repair.** Add one clause: "applied to each irreducible component of the double deformation
     space with its reduced structure, and summed with the multiplicities of the components". On
     the witness this gives `β = 2·(ν/T)`, the value of 8.1's third Check; Proposition 2.3 itself
     (lines 242–243) is stated for arbitrary local immersions, so the statement is unchanged.

7. **F07** (P3) two manifest `locator` fields lag behind the citations

   - **Location.** `packages/VirtualFundamentalClassPartII/sources.toml`, entry `kresch1999b`,
     field `locator`: "Lemma 2.2 and the terminology of local immersions; Theorem 3.1 and its proof;
     the remarks on Behrend–Fantechi Proposition 3.5"; entry `vistoli1989`, field `locator`.
   - **Witness.** README 8.1 and 1.1 cite kresch1999b Corollary 1.10, Propositions 2.1 and 2.3 and
     Remarks 2.5–2.6 (they are in `cited_for` only). README line 822 cites vistoli1989 Lemma 3.20,
     absent from "(3.1)–(3.13), Lemmas 3.16, 3.19, 4.6".
   - **Repair.** Extend the two `locator` fields with "Corollary 1.10; Propositions 2.1, 2.3;
     Remarks 2.5–2.6" and "Lemma 3.20".

Seven findings (R01–R07, all P3), each with a repair to apply; none is blocking. The declared
supplier gap `gap:closed-substacks-of-stacks` is precise, minimal and declared in both files, and is
not a finding. All 13 findings of round 1 are repaired. No P1 or P2 finding was
found in the repaired passages, in the 15 sampled targets, or in the rest of the text.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md`,
`packages/VirtualFundamentalClassPartII/design/plan.json`,
`packages/VirtualFundamentalClassPartII/sources.toml`. This is a design: there is no
`Suggested.lean`, so nothing was elaborated (this lane does not elaborate) and the one-tactic
padding probe and the headline-statability check do not apply.

## Round-1 findings, one by one

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P2) | repaired | Convention 3: "Every stack has one, indeed a finite one (1.1, from rydh2015 Theorem B, lines 81–85), so a proper cover is never a hypothesis here"; 1.1 fourth Check: "`L → B_{𝔸¹}G` is finite étale of degree `2 = (e(B_{𝔸¹}G)/e(L)) · [k(t) : k(t)]`". No "with a proper cover" hypothesis remains (grep of README and `plan.json`). |
| F02 (P2) | repaired | 5.1: "a representable `t : T → ℳ` with `T` separated (equivalently `t` separated, as `ℳ` is separated)"; negative-control Check with `L → 𝔸¹`. |
| F03 (P2) | repaired | 6.3: "with `s := rk Ob`, a locally constant function on `X`, `[X/𝔜, E]^vir = Σ_s c_s(Ob|_{X_s}) ∩ [X_s]`"; 9.5: "`rk E = χ(C_t, F_t^*T_X) = δ + ℓ · (1 − g)`"; Summary: "for a target of pure dimension". |
| F04 (P2) | repaired | 8.1: "Let `Y` be an algebraic stack locally of finite type over `k`, neither reducedness nor pure dimension being assumed"; 8.2: "No reducedness of `𝔜` is assumed"; 8.4: "reduced or not". See R06 for one clause the repair left implicit. |
| F05 (P3) | repaired | 4.2: "3.5's class on the algebraic space `ℱ ×_𝒢 Y` (an algebraic space because `f` is representable; it need not be a scheme)". |
| F06 (P3) | repaired | 3.2: "`f_* div(φ) = (e(f(𝒱))/e(𝒱)) · div(N(φ))` if `dim f(𝒱) = dim 𝒱`", with the `𝔸¹ → 𝔸¹ × BG` Check. |
| F07 (P3) | repaired | 7.2: "Condition 3 for affine `T̄` alone already implies condition 1". |
| F08 (P3) | repaired | 9.1: "a prestable family étale locally on the base: for every scheme `T → 𝔅` there is an étale covering `{T_i → T}` such that each `𝒞_{T_i}` … is a scheme". |
| F09 (P3) | repaired (differently, correctly) | 8.3 API: "`[u^*C/(T_{Z′/𝔜} ⊕ T_{W/𝔜})] ≅ 𝔉 ×_{u^*𝔈} u^*𝔠_{X/𝔜}`". I rederived it (row 8.3 below); the round-1 formula with an extra factor `N` in the quotient was wrong and the fix worker's form agrees with behrend-fantechi1997 lines 1416–1421. |
| F10 (P3) | repaired | 1.2 API: "`e(𝒱)` is the sum of the degrees `deg(ℐ/𝒱)` of 1.3 over the irreducible components `ℐ` of `(I_𝒱)_red` that dominate `𝒱`". |
| F11 (P3) | repaired | 8.1: "(VirtualFundamentalClass §§1.6, 9.1)", also in its *Needs:* line. |
| F12 (P3) | repaired | 5.4: "is VirtualFundamentalClass §2.1's degree of proper zero-cycles … it is not defined again here. What this section adds is the closed formula". |
| F13 (P3) | repaired | `**API.**` lists now stand in 3.1, 3.2, 3.4, 3.5, 4.1 and 4.2. |

Patterns of the repairs searched in the rest of the text: no other hypothesis that is automatic
by 1.1; no other rank formula with `dim X` off pure dimension; no other fibre product called a
scheme; no other "reduced" hypothesis (the two remaining uses, 3.5's route and 8.1's reduced
case, are attributions to vistoli1989 Lemmas 3.16 and 4.6, which do assume it, lines 1172 and
1451). R01 is a residue of the F04 repair (a bullet was added, the ordinal words were not moved).

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 206 roadmaps, 1897 edges, 0 problem(s)

No UPWARD or CYCLE line.

## Maintainer notes

None of the six stands as a finding.

1. Words: holds as satisfied. Convention 2 uses "local immersion" for the class and "local
   embedding" for the chart pair, and gives Vistoli's words once (vistoli1989 (1.19)–(1.20)).
2. Cotangent complex: satisfied. Convention 6: "No truncated cotangent complex is defined"; 9.3
   builds `φ` into the full `L_{M/𝔅}` from the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3 (third bullet) and 4.4.
4. Invariance: the sub-claim "the owner's text names no acting group" is refuted at the owner's
   head: VirtualFundamentalClass §2.5 reads "invariance under the restricted tangent action
   `T_{Y′}|_{X′}` of Kresch, Theorem 3.1" and has the plane negative check. The README imports
   both and adds the relative forms in 8.1, with the plane example as its first Check.
5. Functoriality: 8.3 uses the graph but no intermediate theory and says why (the lift is
   obstructed in `Ext¹(g^*Ω_{Z′/𝔜}, u^*E)`); the step that replaces it is the API comparison,
   rederived below.
6. Suppliers: satisfied. No AlgebraicVectorBundles or EllipticCohomology citation (grep). The
   suppliers are VirtualFundamentalClass, SchemeAndStackFoundations, EquivariantIntersectionTheory,
   StableReductionPartII (§5.15 only), StableReduction, EnhancedDerivedSheaves and
   DerivedModuleAlgebra, each by section; see R04 for two sections missing from the contract.

## Adversarial table

Sampled targets, the repaired passages and every target a finding touches.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 finite cover exists | `BG`; `L`; `B_{𝔸¹}G`; hypotheses of rydh2015 Theorem B | `Spec k → BG` degree `|G|`; `id_L`; `L → B_{𝔸¹}G` degree `2`; Convention 1 gives quasi-compact, Deligne–Mumford, quasi-compact separated diagonal | holds | none |
| 1.1 Check: no separated proper cover of `L` | DVR through `0₁`, second extension through `0₂` | two maps `Spec R → Z` with one generic point and closed points over `0₁ ≠ 0₂` | holds | none |
| 1.1 Check: no separated proper cover of `B_{𝔸¹}G` | torsor `P = X ×_{BG} 𝔸¹ → X` | `P → X` proper and étale, so finite étale; degree `2` over `t ≠ 0`, `1` over `0`, on a component whose image in `𝔸¹` is closed and dense | holds | none |
| 1.2 `e = Σ deg(ℐ/𝒱)` | `B(ℤ/2)`; `BS₃`; `Bμ₃/ℚ`; `[𝔸¹/μ₂]` | `1+1`; `1+3+2 = 6`; `1 + (3/3)·2 = 3` with two components; dominating sum `1` | holds | none |
| 1.2 `k(𝒱)`, `e` | real gerbe `[Spec ℂ/(ℤ/4)]`; `[𝔸¹/μ₂]` | `ℂ^{ℤ/4} = ℝ`, `e = 2`; `k(x²)`, `e = 1`, `e(Bμ₂) = 2` | holds | none |
| 1.3 degree formula | `pt → BG`; `BG → pt`; `ℤ/p`-quotient; Frobenius | `|G|`; `1/|G|`; `(1/p)·p = 1 = p/p`; `p` | holds | none |
| 2.2 `A_0([𝔸¹/μ₂]) = ℤ/2` | `div(y)`; `div(P(y))`, `P` inseparable, `char ≠ 2` | `ord_0(x²) = 2`; `K[x]/(x² − θ)` étale over `K = k[y]/P`, coefficient `1`, order `0` at the origin | holds | none |
| 2.3 comparisons | `Spec k`; `L`; `[𝔸¹/μ₂]` | `ℤ`; `ℤ²/ℤ(1,1) ≅ ℤ` (every other point is `div` of its minimal polynomial); `ℤ/2 ⊗ ℚ = 0` | holds | none |
| 3.2 divisor formula | `𝔸¹ → 𝔸¹ × BG`, `t`; atlas of `[𝔸¹/μ₂]`, `x`; `BH × 𝔸¹ → BG × 𝔸¹`, `t` | `|G|[0×BG]` both sides; `2[Bμ₂]` both sides with `N(x) = −y`, factor `1`; `[G:H][0×BG]` both sides, factor `|G|/|H|` | holds | none |
| 3.4 exterior product | `K/k` separable of degree 2; purely inseparable of degree `p`; `BG × BH`; unit | two points of degree 2 (`4 = 2+2`); `K ⊗ K = K[x]/(x − a^{1/p})^p`, `p·[Spec K]`, `p² = p·p`; `[B(G×H)]`; `[Spec k] × [𝒲] = [𝒲]` | holds | none |
| 3.5 refined Gysin | zero section of `O(−1)`; `{0} → 𝔸¹` along `z²`; `pt → BG` | `−[pt]`; `2[pt]`; `[G]`, pushing to `|G|[pt]` | holds | none |
| 4.2 stack Gysin | `π : pt → BG`, `Y = pt`; `𝔸¹_ℂ/∼ → 𝔸¹_ℝ`; `f = id` | `|G|^{−1}·|G|·[pt] = [pt]`; invariant functions real at `0`, residue field `ℂ`, not a scheme; identity | holds | none |
| 4.4 agreement | `B(ℤ/2)`; `O(1)` on `ℙ¹`; `Spec k` | `1/2` both; point class both; `1` both | holds; one Check mislocated | R05 |
| 5.1 duality with `T` separated | `L → 𝔸¹`; `𝔸¹ ⊔ 𝔸¹ → 𝔸¹` | pullback of `id` is `L`, excluded; `ℚ²` in dimension 1, `0` in dimension 0; `T ×_ℳ 𝒢′` separated for every separated test `𝒢′` | holds | none |
| 5.2 moduli spaces | `BG`; `[𝔸¹/μ₂]`; `ℤ/p`-quotient | `1/|G|`; `(1/2)[0]`; `1·[p(𝒱)]` with `e = p`, `k(y)/k(y^p)` purely inseparable | holds | none |
| 5.3 ring isomorphism | `G = 1`; `μ_n` on a point; `𝔾_m` on `𝔸² ∖ 0`, weights `(1,2)`; gradings | identity; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; `ℤ[t]/(2t²)`, `t ↦ [Bμ₂]` (zero of the weight-one coordinate), `∫t = 1/2`, `∫2t = 1`; `A^G_{n−c} ↔ A_{n−c−g} = A^c` as `dim [X/G] = n − g` | holds | none |
| 5.4 point degrees | `BG`; `Spec K` inseparable; real gerbe; `[ℙ¹/μ₂]` | `1/|G|`; `p`; `2/4 = 1/2`; `∫(2[𝒫]) = 1 = ∫[𝒪]` | holds | none |
| 6.1 comparison bundle | `[0→0]` vs `[O → O]`; `E = [O(−4) → Ω]` on `ℙ¹`; ranks | `P = 𝔸¹_X`, rank `1 = 0+1 = 1+0`; `Hom(E,E) = k ⊕ k ⊕ H¹(O(−2))`, homotopies `H⁰(O(−2)) = 0`, `φ(1+ξ) = φ`, `Ext¹(O(4), O(2)) = k`, nonsplit `= O(3)²`; `rk F_1 − rk F_0 = rk H_1 − rk H_0` | holds | none |
| 6.2 virtual class | `[O(1) → Ω]`; theory of 6.1 through `P`; `𝓛_n` on `L`; `d + r < 0` | `−1`; `c_1(O(3)²/O(2)) = 4 = c_1(O(4))`; `±n[0₂] ≠ 0` in `ℚ`; `0` | holds | none |
| 6.3 relative formulas | `Spec k[ε]/(ε²)`; node × `ℙ¹`; `pt → B𝔾_m`; `k[x]/(x^p)`; `pt ⊔ 𝔸¹` | `2[pt]`; `s = 1 = 2 − 1 − 0`, `−[𝔜 × pt]` in `A_1`; `[pt]`, `−1 + 1 = 0`; `s = 1 ≠ 0`, class `p[pt]` not `0`; `[pt] + 0` vs `0` for the single exponent | holds | none |
| 7.1 obstruction class | `k[x]/(x²)`, `x ↦ ε`; `pt → B𝔾_m`; étale | `(ε + aε²)² = ε² ≠ 0`; torsor under `1 + J ≅ J`; unique lift | holds | none |
| 7.2 equivalences | cone `C` of `φ`; char 2 `φ = (0, id)`; affine form | `Ext^i(g^*C, J) = 0` for `i ≤ 1`, so `Hom` bijective and `Ext¹` injective; `φ^*ω = 0` through `H^{−1}(φ) = 0` while `(x + ax²)² = x² ≠ 0`; behrend-fantechi1997 lines 1175–1201 use `Spec(A ⊕ M)` and `T̄ ⊆ W` affine | holds | none |
| 8.1 `β` on any ambient | `𝔸¹ × Spec k[ε]/(ε²)`, origin, `t = 0`; plane; `𝔅′ = 𝔅` | `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `C = Spec k[T,E]/(E²)`, `∂β = 2[ν=0] − 2[T=0]`; `ν/η` fixed by `ξ ↦ ξ+a`, moved by `η ↦ η+b`; `β = 0` | holds; route clause, notation, ordinals | R01, R02, R06 |
| 8.1 smooth factorisation | `Ỹ = Y × 𝔸^n`, `X ⊆ Y × 0` | `Ĩ = I + (z)`, `M°_X Ỹ = M°_X Y × 𝔸^n`; `M°_{Ỹ′}Ỹ = M°_{Y′}Y ×_Y Ỹ` by flatness, so the double space is the base change | holds | none |
| 8.2 regular pullback | open immersion; `{0} → 𝔸¹`; node, `V(a+b)`; non-reduced `𝔸¹ × Spec k[ε]/(ε²)`; purity of `𝔜′` | restriction; `[Z]`; `−2[pt × pt]` both sides; `2[pt]` both sides; a nonzerodivisor on a pure `d`-dimensional scheme cuts pure dimension `d − 1` | holds | none |
| 8.3 comparison of the API | normal sheaves: `K = [u^*I/I² → Ω_{Z′} ⊕ Ω_W]`; `v` smooth, `Z = 𝔜`; `{0} → 𝔸¹` | `K` is the extension of `g^*L_{Z′/Z} = [v^*Ω_Z → Ω_{Z′}]` by `u^*τ_{≥−1}L_{X/𝔜}`, the pushout of `u^*E → F → g^*L_{Z′/Z}` along `u^*E → u^*L`; dually `[u^*N/(T_{Z′} ⊕ T_W)] ≅ 𝔉 ×_{u^*𝔈} u^*𝔑`; fibre `[v^*T_Z/T_{Z′}]` on both sides; `u^*𝔠 × B T_{Z′}`; fibre `𝔸¹` | holds | R02, R03 (route wording of the first case) |
| 8.4 deformation invariance | `x² − by²`; `{xb = 1}`; `m + r = 1`; degree bookkeeping | `2` for `b` a square, a non-square (one point of degree 2) and `0`; `1` vs `0`; no degree; `π_{b*}η_b^![X]^vir = η_b^!(n[B]) = n[b]`, `k`-degree `n[κ(b):k]` | holds | none |
| 9.1 relative space of maps | `X = pt`; `ℙ¹ → ℙ^r`; `M = pt`, `F = id_{ℙ¹}` | formally étale; open in `ℙ^{(r+1)(d+1)−1}`; `H⁰(T_{ℙ¹}) = k³` vs one point | holds | none |
| 9.2 duality | smooth curve, `L` of degree `e`; `ω_C`; one-nodal irreducible fibre; product family | `e + 1 − g`; `g − 1`; `2g̃ − 2 + 2 = 2p_a − 2`; `RΓ(C, V) ⊗ O_M` | holds | none |
| 9.3 obstruction theory | `X = pt`; `ℙ¹ → ℙ^r` of degree `d`; translates of an elliptic curve; amplitude | `E = 0`, étale; `H¹ = 0`, `χ = (r+1)(d+1) − 1`; `Ob` trivial of rank 1, class `c_1 = 0`, virtual dimension `0`; `Rπ_*` in `[0,1]`, dual in `[−1,0]`, `Ob = R¹π_*F^*T_X` | holds | none |
| 9.4 global resolution | `V = O`; `O_{ℙ¹} ⊕ k_p`; `L = O`, `g ≥ 1` | `χ = h¹(H) − h¹(G) = χ(V) = 1 − g`; `H⁰(L^{−N}) = k`; `[0 → R¹π_*O]` misses `H⁰` | holds | none |
| 9.5 rank and dimension | lines in `ℙ²`; `c_1 = 0`, `dim 3`; `X = pt ⊔ ℙ¹`; Li–Tian | `3 + 2 + 0 − 3 = 2`; `n`; `ℓ = 0`, `rk E = 0` vs `1`; `(1−g)(dim X − 3) + n + c_1·β = (3 − dim X)(g − 1) + n + α·c_1` | holds | none |
| Conventions 5, 6, 7 | `Spec k → BG → Spec k`; elliptic curve; `[O(1) → Ω]`; `pt → B𝔾_m` | `|G|·(1/|G|) = 1`; `Hom(O[1], O[2]) = H¹(O) = k`; `rk 0`, `Ob = O(−1)`, degree `−1`; `−1 + 1 = 0` | holds | none |

## Verified sound

- **Shape.** 9 layers, 33 targets, 122 Checks in `plan.json` (every target has at least three);
  every layer ends with Examples and Dependencies; every target has a *Needs:* line and a
  locator; every definition (1.1–1.3, 2.1–2.2, 3.1–3.2, 3.4–3.5, 4.1–4.3, 5.1–5.2, 6.1–6.2, 7.1,
  9.1–9.3) has an `**API.**` list. Layer titles are mathematical; the README nowhere says it
  follows a source; the order is forced by the dependency lines (Chow lane 1 → 4, comparisons 5,
  virtual classes 6, obstruction classes 7 independent of 1–5, base change 8, maps from curves
  9). No LaTeX delimiters, process words, pull-request numbers or machine paths (grep).
- **Sampled source locators (15 targets), read at the cited lines.** vistoli1989 lines 232–269,
  299–328, 337–338, 347–376, 379, 422–428, 542–584, 1172–1174, 1197–1207, 1451–1470, 1570–1722,
  1758–1776 (this round also covers the four passages round 1 left unopened: 96–99, 232–269,
  1451–1470, 1610–1613); behrend-fantechi1997 lines 884–897, 1162–1201, 1261–1320, 1353–1363,
  1392–1423, 1583–1614, 1617–1739; kresch1999b lines 182–207, 232–256, 259–304, 307–343,
  390–405; behrend1997 lines 139–197; li-tian1998 lines 1472–1474, 1566, 1585–1586;
  edidin-graham1998 lines 758–759, 790–798; rydh2015 lines 81–87; deligne-mumford1969 lines
  1012–1019; keel-mori1997 line 28; stacks-chow line 1356; stacks-chow-spaces lines 57–61,
  126–133, 797–818, 1986–1990, 2224. Each carries the theorem number and hypotheses the README
  quotes. No locator was flagged by the author as unverified.
- **Pinned declarations opened.** Mathlib: `AlgebraicGeometry.AlgebraicCycle`
  (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` line 44), `AlgebraicCycle.map` (line
  69, weights as arguments), `Scheme.ord` (`OrderOfVanishing.lean` line 52, with
  `ord_eq_zero_of_coheight_neq_one` line 61), `IsClosedImmersion` (`Morphisms/ClosedImmersion.lean`
  line 44), `Flat` (`Morphisms/Flat.lean` line 42), `Etale` (`Morphisms/Etale.lean` line 39),
  `Smooth` (`Morphisms/Smooth.lean` line 59), `IsProper` (`Morphisms/Proper.lean` line 41).
  Tau Ceti: `Chow.cyclesOfDimension` (`Chow/Basic.lean` line 86), `RatEquiv` (257), `ChowGroup`
  (295), `cycleClass` (304), `ChowGroup.equivIntOfUnique` (369), the closed-immersion
  pushforward (`Chow/ClosedImmersion.lean`), `SchPseudofunctor` (`Stack/Basic.lean` line 37),
  `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean`), `PrestableFamily`
  (`Curves/Prestable.lean` line 45: a class on a morphism of schemes extending `IsProper` and
  `GeometricallyConnected`, no genus), `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree`
  (`VectorBundle/Degree.lean`).
- **Cross-roadmap citations resolved this round.** VirtualFundamentalClass at its open head:
  every cited section §§0.2–9.6 exists; read in full §§0.2–0.3, 1.5–1.6, 2.1–2.5, 3.2–3.5,
  4.3–4.5, 6.1–6.6, 7.1–7.7, 8.1–8.5, 9.1–9.6, each with the content the contract states
  (§2.5 has the separated-test-stack clause, Kresch's restricted action and the plane check;
  §6.4 the cartesian base change of relative theories; §9.4 smooth bases; §9.5 the hypotheses of
  Proposition 7.5; §7.3 the resolution property). SchemeAndStackFoundations on main: all 24
  cited sections (including §§2.6, 2.10) and all 26 cited names found; §5.5's `z ↦ z²` Check and
  §5.6's doubled-origin Check exist. StableReductionPartII §5.15 at its open head states the
  Edidin–Graham comparison with exactly the hypotheses and compatibilities the contract quotes.
  EquivariantIntersectionTheory §§2.1–2.2; StableReduction Layers 2–3 (cohomology and base
  change, the relative dualising sheaf with trace, the component-degree formula, fibrewise
  ampleness, prestable families); EnhancedDerivedSheaves §0.3, E1.4, E1.8; DerivedModuleAlgebra
  §§0.7, 0.12, 0.25; AlgebraicGromovWittenTheory §§4.1–4.3 (named as a consumer only): all exist.
- **Supplier order.** Every supplier is on main, earlier in the merge order, or an open pull
  request adding a new folder. No never-cite roadmap is cited. StableReductionPartII itself
  consumes VirtualFundamentalClass §§2.1–2.3 and nothing of this roadmap: no cycle.
- **Declared gap.** `gap:closed-substacks-of-stacks`: same slug in `plan.json` (supplier
  VirtualFundamentalClass, section §2.1) and in the README contract; the `needs` sentence names
  one theory with its components and "without separatedness". Searched by object: no roadmap on
  main or at an open head states closed, reduced or integral closed substacks of stacks
  (VirtualFundamentalClass §2.1 uses them without stating them). Precise, minimal, declared.
- **Duplication and ownership.** Searched main and the open heads by object: finite covers of
  stacks by schemes, integral or non-separated Chow groups of stacks, the moduli-space
  isomorphism, relative obstruction classes, the Kodaira–Spencer morphism, deformation
  invariance of virtual counts. No other owner. Each target that touches a section of
  VirtualFundamentalClass or AlgebraicGromovWittenTheory says which hypothesis it removes; none
  restates a statement of the owner at equal generality. `scratch/overlaps.md`: no dropped id,
  no revision-only id, no conflicting head.
- **Manifest.** Every cited work has exactly one key; gillet1984 and fulton1998 are settled as
  uncertified. Nothing was fetched or added this round.

## Not verifiable

- gillet1984 §4 and fulton1998 (six locators): uncertified, cited by locator only.
- Laumon–Moret-Bailly, Theorem 16.6: not in the manifest; the README cites it only through
  rydh2015 lines 86–87, which I read.
- The gluing over charts in 8.1–8.3 and the passage of 8.3's comparison from normal sheaves to
  cones on overlaps: checked on charts and at the level of complexes, not globally. The source
  (behrend-fantechi1997 Lemma 5.9) asserts the cone statement only for `𝔜 = Spec k`.
- Internal cross-references in vistoli1989 are read from an OCR text; I did not rely on its
  printed lemma numbers where they disagree with the content (for example the lemma cited at
  line 1768).
- Elaboration: not available in this lane, and a design has no Lean file.
- Ownership against open pull requests was checked through the roadmaps tool (search by object
  at the open heads); the three packages of the board index live on other branches and are in
  unrelated subjects, and were not opened.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–897: the source says Vistoli's rational equivalence is invariant under the whole pulled-back tangent bundle of the ambient; it should be invariance under the tangent bundle of the regularly embedded smooth stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both global resolutions may be taken to map to the obstruction complex by morphisms of complexes; it should justify this, since an isomorphism in the derived category need not be so represented; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, lines 331–336: the source says the acting bundle is the tangent bundle of the arbitrary locally immersed stack; it should be that of the smooth regularly immersed one, as its proof uses; affects nothing.
- **Gap** in kresch1999b at the proof of Proposition 2.3, lines 275–304: the source says the corollary on two divisors, stated for a variety, applies to the double deformation space; it should apply it componentwise with multiplicities, that space being neither reduced nor irreducible in general; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f94471a8829d7952e90a44dd985c39a9a1ee7342", "job": "REV-DESIGN-VirtualFundamentalClassPartII~2", "model": "fable", "worker": "chris-x10"} -->
