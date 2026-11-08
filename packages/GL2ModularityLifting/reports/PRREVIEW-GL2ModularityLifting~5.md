# Review of GL2ModularityLifting (pull request #1071 at 5dd2828)

**Verdict:** needs changes

This is an incremental re-review of 18 changed lines since 2c701b5. All three findings of the previous review are repaired, and each new wording matches the supplier at its head. The gate passes, the dependency check reports 0 problems and `Suggested.lean` elaborates with exactly two `sorry` warnings. One new P3 remains in a passage that depends on the repaired line 31.

## R01 (P3) — §12.8 says it does not use the compatible-system carrier, but its statement quantifies over a view of it

**Location.** `TauCetiRoadmap/GL2ModularityLifting/README.md` line 3004 (§12.8): "The family hypotheses are ordinary indexed representation and polynomial data, not an invocation of a compatible-system carrier, existence theorem, strict compatibility or all-member de Rham predicate."

**Claim.** The README contradicts itself about what §12.8 consumes. The statement of §12.8 (line 2992) takes "`𝓕_i : RankTwoFamily`". Line 31, as repaired, defines `RankTwoFamily` as the "view of the raw compatible-system carrier of SmallRamificationAndAbelianVarietyBaseCases §5.0d". Line 67 lists §§12.6–12.8 as the consumers of that §5.0d carrier. So §12.8 uses the carrier and also says it does not. The other reading of "a compatible-system carrier" does not help. That is AutomorphicGaloisRepresentations §7.1, "The compatible-system carrier and operations", cited at line 33, and §7.1 uses the same SmallRamificationAndAbelianVarietyBaseCases carrier. What line 3004 means to exclude is already said correctly at line 33: "Layer 12 uses only the weaker good-polynomial predicate and the explicitly stated member conditions". The inconsistency was already there when the carrier was called `AutomorphicSystemData`. The R02 repair made it a contradiction in so many words.

**Witness.** AutomorphicGaloisRepresentations (#1007) §7.1, its lines 3477–3480: "Use the shared raw compatible-system carrier of SmallRamificationAndAbelianVarietyBaseCases §5.0d". SmallRamificationAndAbelianVarietyBaseCases (#970) line 1994: "The shared raw compatible-system carrier is a target here". This README: line 2992 `𝓕_i : RankTwoFamily`; line 67 *Uses* "§5.0d (Conventions; §§12.6–12.8)".

**Repair.** Replace the sentence at line 3004 with: "The family hypotheses are the `RankTwoFamily` data of the Conventions with their common good polynomials; no existence theorem, strict or almost-strict compatibility, or all-member de Rham predicate is invoked." Tested against the instance that refuted the original: the new sentence agrees with line 31 (a view of the raw carrier), line 33 (only the good-polynomial predicate), line 67 (§5.0d consumed by §§12.6–12.8) and line 2992 (the statement over `RankTwoFamily`). It also keeps the intended exclusions, since §12.8 still assumes de Rham only at the two selected members.

## Previous findings

- R01 — repaired: line 185 now reads "the full-scope totally real irreducible implication of §5.8, “Full-scope irreducible lifting conditional on component support”, conditional on `CMComponentSupport`". This is OrdinaryAutomorphicFormsAndModularityLifting's heading verbatim (its line 635), and it defines CMComponentSupport (its line 639). `fullScopeOrdinaryLifting` now occurs 0 times.
- R02 — repaired: line 31 reads "view of the raw compatible-system carrier of SmallRamificationAndAbelianVarietyBaseCases §5.0d". Line 65 reads "The raw compatible-system carrier of §5.0d, with its coefficient field, bad set, good-place polynomials, finite local realization fields, members…". Line 67 reads "the stronger arithmetic compatible family of that section, with its chosen `E_λ`-models…". The docstring at `Suggested.lean` line 31 is updated. `AutomorphicSystemData` and `ArithmeticCompatibleFamily` occur 0 times. The repair exposes R01 above.
- R03 — repaired: line 125 quotes "Layer R15.2, “Integral q-expansion and coherent Hecke theory”" and "Layer R15.5, “Deligne–Serre eigenvalue lifting”", and lines 1242 and 1314 do the same. Line 1314 quotes "Layer R15.6, “Residual modularity and the classical target”". Line 1302 cites "AlgebraicModularFormsAndSerreWeights §§5.10 and 5.14". The old titles and the slug occur 0 times.

## Verified sound

**Gate, dependency check, diff.** The worker's gate at 5dd2828 reports every check 0 and `build=0 OK`. My re-run of `gate … --base origin/main` reports every check 0 and `OK`. The dependency check with `--movable` prints `depcheck: 244 roadmaps, 2477 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GL2ModularityLifting'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Lean.** `lake env lean` on `Suggested.lean` gives two `sorry` warnings (lines 48 and 87) and nothing else. On a scratch copy I added `#check @` for all five declarations (`odd_involution_descent`, `completionAt`, `completionAtField`, `completionAtAlgebra`, `cht_soluble_prescribed_completions`). The elaborated types match the worker's signature file and the previous round exactly; the diff changes only the docstring. The file has no `variable` block, so no binder can be lost. The one-tactic probe (`first | simp | rfl | infer_instance | trivial | decide | norm_num | (intros; simp_all) | exact ⟨_, rfl⟩`) leaves both theorems with unsolved goals, so neither is padding. The signature file also lists a `-field` "class" at line 34 and an elaboration error at "line 104". Both are artefacts of the signature tool: the docstring line 34 begins with "class-field", and line 104 is in the tool's own check file. Elaborating the real file shows neither.

**Changed passages, resolved at the supplier heads** (read through `roadmaps show`; line numbers are those dumps):
- SmallRamificationAndAbelianVarietyBaseCases (#970) §5.0d "Minimal lifts and their compatible families" (line 1981). The raw carrier at lines 1994–2003 has a coefficient field E, a finite bad set S, monic good-place polynomials, continuous semisimple members, finite local realization fields `L_λ/E_λ` and Hodge multisets, with no compatibility asserted. Its operations (coefficient extension, conjugation, restriction, sum, tensor, dual, Tate twist) are at lines 2007–2015. The "arithmetic compatible family … with chosen `E_λ`-models" is at line 2027. The geometric-to-arithmetic adapter `X^n P(1/X)/P(0)` is at line 2038. Lines 31, 65 and 67 describe exactly these.
- OrdinaryAutomorphicFormsAndModularityLifting (#1066) §5.8 is at line 635: `F ≠ ℚ` totally real, p odd, component support defined at line 639, conditional lifting after it. Lines 187, 189, 1382 and 1392 cite §5.8 and `CMComponentSupport` only.
- AlgebraicModularFormsAndSerreWeights (#928) line 18 maps R15.2, R15.5 and R15.6 to Layers 2, 5 and 7. The headings are at line 271 (Layer 2), line 1203 (Layer 5) and line 1514 (Layer 7). §5.10 "Deligne–Serre eigenvalue lifting" is at line 1297 and §5.14 "Controlled eigenform lifting and weight shifts" at line 1341. §2.8 (line 381) gives surjectivity of reduction when the cusp-sheaf `H¹` has no λ-torsion. The *Uses* line 125 (R15.2 in §5.2 and §5.5, R15.5 in §5.5) matches where the citations sit: line 1242 is in §5.2, and lines 1292, 1302 and 1314 are in §5.5.
- Dependents of line 31: the statements of §§12.6–12.8 (lines 2949, 2969 and 2992) use only `(E,S,(ρ_λ),(P_q))` over the given realization fields. None assumes an `E_λ`-model, so line 67's "is not an input" holds. R01 is the one inconsistency.
- The leads in `citations.md` are the four `HeckeGaloisDatum` names. GlobalGaloisDeformations (#920) declares them at its lines 1634 (`classifying_surjective`), 1635 (`classifying_unique`), 1672 (`ofPoints`) and 1688 (`mem_of_points`), in §§6.7–6.8 (lines 1616 and 1663).

**Seeded sample.** None of the fifteen sampled targets (0.1, 0.3, 2.4, 2.12, 3.7, 4.1, 5.6, 6.8, 6.11, 6.14, 6.16, 8.7, 8.9, 12.1, 12.5) lies in a changed passage, so their source locators were not re-read this round. Their statements are in the adversarial table below with computed values, and none fails. The README flags no locator as unverified.

**Ownership and overlaps.** `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. The diff introduces no new object; it only rewords three supplier citations. `RankTwoFamily` occurs in no other roadmap at any head (`roadmaps grep --fixed RankTwoFamily`: this README at lines 31, 2949, 2969 and 2992, and this `Suggested.lean` at line 31). Supplier order is unchanged. SmallRamificationAndAbelianVarietyBaseCases, OrdinaryAutomorphicFormsAndModularityLifting and AlgebraicModularFormsAndSerreWeights are all earlier in the merge order.

**Adversarial table.** Rows marked "(r4)" are carried from the previous report for statements the diff leaves untouched. The rows above them are new: the changed statements, the new finding and the sampled targets.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Line 31, `RankTwoFamily` as a view of the raw carrier | SRAVBC §5.0d fields; two base-`ℚ` rank-two data that differ only in Hodge multisets `{0,−1}` and `{0,−2}` | same E, S, `P_q`, `ρ_λ`, `L_λ`, so the quotient relation identifies them and forgets exactly the labels. SRAVBC's Check "unrelated polynomials and members are valid raw data" holds, and the view's good-polynomial predicate rejects such data | sound | none |
| Line 65, Frobenius adapter | elliptic Tate system `P = X² − (a_q/q)X + 1/q`; cyclotomic `P = X − q⁻¹` | `X²P(1/X)/P(0) = q(1 − (a_q/q)X + X²/q) = X² − a_qX + q`; `X·P(1/X)/P(0) = (1 − X/q)/(−1/q) = X − q`, arithmetic Frobenius eigenvalue q | sound | none |
| Line 67, arithmetic compatible family not an input | SRAVBC line 2027 against the hypotheses of §§12.6–12.8 | §12.6 and §12.7 retain `(E,S,(ρ_λ),(P_q))`; §12.8 has members "over their specified finite local realization fields"; no `E_λ`-model or common WD parameter is assumed in any of them | sound | none |
| Line 185, OAFML §5.8 | heading text; OAFML Check `R = k[[t,x]]`, `T = R/(x)` | heading verbatim (line 635). The point killing `x` factors through T, but `ker(R→T) = (x) ⊄ (0)`, so component support is strictly stronger than support at one point, and the README carries it as a hypothesis | sound | none |
| Lines 125, 1242, 1314, AMFSW layer titles | AMFSW head headings and line 18 | R15.2 → Layer 2 "Integral q-expansion and coherent Hecke theory"; R15.5 → Layer 5 "Deligne–Serre eigenvalue lifting"; R15.6 → Layer 7 "Residual modularity and the classical target" | verbatim | none |
| Line 1302, lifting to characteristic zero | AMFSW §5.12 operator `[[0,p],[1,0]]` on `ℤ_p²`; `H¹(X₁(N)_κ, ω^k(−C))` for `N ≥ 5`, `p ∤ N` | §5.10 lifts eigenvalues, not eigenvectors: here `λ² = p` needs `ℚ_p(√p)`. The README claims "same eigenvalues modulo p", which is §5.10's conclusion, and §5.14 adds `a₁ = 1` and the newform. Serre duality with `Ω ≅ ω²(−C)` gives `H¹ ≅ H⁰(ω^{2−k})^∨`, which is 0 for `k ≥ 3` and κ for `k = 2`; the fibre dimension is constant, so `H¹` is torsion-free and §2.8's criterion applies | sound | none |
| `Suggested.lean` docstring line 31 | `#check @` on all five declarations | types identical to the signature file and to r4 | sound | none |
| §12.8 line 3004 against lines 31, 67, 2992 | "a compatible-system carrier" read as SRAVBC's carrier, or as AGR §7.1's | AGR §7.1 (its lines 3477–3480) is SRAVBC's carrier; line 31 makes `RankTwoFamily` a view of it; line 2992 quantifies over `𝓕_i : RankTwoFamily`; line 67 lists §12.8 as a consumer | contradiction under both readings | R01 |
| §0.3 Check 2 | `Γ = C₂`, p odd, `1 ⊕ sign` | residual characters `1 ≠ −1`; `(1 ± c)/2` is integral since 2 is a unit, so every stable lattice is `L⁺ ⊕ L⁻` and none is nonsplit; the representation is reducible, outside Ribet's hypothesis | sound negative control | none |
| §0.3 Check 3 | `!![1,t;0,1]` over `k[[t]]`, char p | `(1 t; 0 1)^p = (1 pt; 0 1) = 1`, so the image is finite; it reduces to the identity mod t | sound | none |
| §2.4, §2.12 at `Q = ∅` | `Δ_Q = 1`, `h = 0` | `π_Q = π`; `M_n = M^□`, and killing the j framing variables gives M | sound | none |
| §3.7, domain hypothesis | `B = 𝒪[[x,y]]/(xy)` | components `(x)` and `(y)`; a module supported on `(x)` gives a kernel `(y)` that is not p-power torsion, hence the hypothesis and the Check pointing to Layer 4 | sound | none |
| §4.1 avoidance pair | `p = 3`, `ζ = ζ₃`; `p = 2` | `(X−ζ)(X−ζ⁻¹) = X²+X+1`, which differs from `(X−1)²` by `3X ≡ 0 mod λ`; at `p = 2`, `ζ = −1 = ζ⁻¹`, so `p > 2` is needed | sound | none |
| §5.6 Check 3 | `B = ℤ_p[[x,y]]/(x² − cy²)`, c a non-square unit | `B[1/p]` is integral, but over `ℚ_p(√c)` the equation factors as `(x−√c y)(x+√c y)`: two components with residue field `𝔽_p` | sound | none |
| §6.8 last Check | over `ℚ₂`, η unramified with `η(Frob) = ζ₃` | determinants `εη·η⁻¹ = ε = η·εη⁻¹`; `ε̄ = 1`, so both semisimplify to `η̄ ⊕ η̄⁻¹`; the HT-0 quotients are `η⁻¹` and η, with `ζ̄₃ ≠ ζ̄₃²` in `𝔽₄` | sound | none |
| §6.14 Check 1 | `R̄` 𝒪-flat | a 2-power-torsion kernel in an 𝒪-flat ring is 0, so `R̄ ≅ 𝕋^□` | sound | none |
| §§6.15–6.16, oddness at 2 | `ρ(c) = −1` (scalar); `diag(1,−1)` | determinants 1 (even) and −1 (odd); both reduce to the identity mod 2 | sound | none |
| §8.9 (iii) | `det ρ = ψε^{k−1}`, `k = 2, 3` | `det ρ(c) = ψ(c)(−1)^{k−1} = −1` iff `ψ(c) = (−1)^k`, so ψ is even for k = 2 and odd for k = 3 | sound | none |
| §8.9 Checks 1–2 | `k = 3`, `w = 7`; `k ≥ 2` | dihedral induced from `ℚ(√w*)`: the supersingular case forces `k−1 ≡ (w+1)/2 mod (w+1)`, so w = 3; the ordinary case forces `w = 2k−1 = 5`; 7 ∉ {3,5}. `w > 2k ≥ 4` gives `w ≥ 5` | sound | none |
| §12.5 Check 1 | weights 2 and 4 at `p = 3` | residual determinants `ω₃` and `ω₃³ = ω₃`, both consistent with `1 ⊕ ω₃` | sound | none |
| §10.7a unit-logarithm rank | totally real F of degree d; `F = ℚ` | `r₁ + r₂ − 1 = d − 1`; `d = 1` gives 0 while `G^ab_{ℚ,S}(p)` has rank 1 | sound (r4) | none |
| §10.7a torsion kernel | u a root of unity; `ε = (1+√5)/2` | `u ⊗ 1 = 0` iff u is torsion; ε has infinite order | sound (r4) | none |
| §10.7a Check, `F = ℚ`, `p = 3`, `S = {3, 7}` | `ℤ₃ˣ × ℤ₇ˣ` | pro-3 quotient `ℤ₃ × ℤ/3`; local units have index 3; rank 1, torsion `ℤ/3` | sound (r4) | none |
| LL1 case split | `p ≥ 5` irreducible, nonsplit distinct, split distinct, scalar; `p = 3` | `End = k` → §6.1; split distinct → §6.2; scalar → §6.3; `p = 3` → §6.3 | sound (r4) | none |
| LL2 against PLL §6.6 | `(ωχ ∗; 0 χ)` with `∗ = 0` | excluded by §6.6, covered by LL1 | sound (r4) | none |
| LL3 against PLL §4.5 | abelian type; supercuspidal type | abelian unconditional; supercuspidal kept as a hypothesis | sound (r4) | none |
| §8.8 against `R33.1/kisin-fontaine-mazur-over-rationals` | hypotheses side by side | weights `{0,k−1}` against `{a,b}` up to `χ_p^a`; `b−a+1 = k` | sound (r4) | none |
| §9.3 against the `p = 2` clause | hypotheses | same; irreducibility follows from the nonsolvable image | sound (r4) | none |
| §10.15 against `R33.1/pan-residually-reducible-lifting` | `p ≥ 5`; `p = 3` | same at `p ≥ 5`; `p = 3` outside ratio ω stated only here | sound (r4) | none |
| §§12.1–12.3 against `R33.1/dp-modularity-lifting-inputs` | odd p; `p = 2`; Theorems 1.6, 1.7 | same four clauses | sound (r4) | none |
| §1.6 persistence of (α), (β) | inert quadratic `F′/F`; Steinberg | unramified stays unramified; conductor exponent 1 stays 1 | sound (r4) | none |
| §3.1 radius and cutoff | `s = 1, p = 3, m = 2, h + j = 1` | `r_m = 18`; `xy ∉ m^{(2)}` | sound (r4) | none |
| §3.2 shift | `b = 2, r_m = 3`; `h = 1, p = 2, a = 2` | degree-6 monomial has an exponent ≥ 3; level 5 gives exponent 8 | sound (r4) | none |
| §3.4 patched data | `h = 0` | `R∞/(y) ≅ R̄^ψ_S` | sound (r4) | none |
| §3.4a dimensions | Gee's `T`, `r` | `dim = 4#T + r` on both sides | sound (r4) | none |
| §5.13 type-sensitive comparison | `w_ℓ` | `(1 ± w_ℓ)/2` complementary projectors | sound (r4) | none |
| §5.13 acceptable type | lift of type `τ′` | `σ_{τ′}(ℓ^s) = 1` | sound (r4) | none |
| §7.8 exclusions (also §8.7's Checks) | `p = 3, 1 ⊕ ω`; `p ≥ 5, 1 ⊕ ω`; irreducible | Hu–Tan at `p ≥ 5`, Tung at `p = 3`, Kisin with Emerton 3.3.22 | sound (r4) | none |
| §7.8 (ii) at `p = 3` | `(1 ∗; 0 ω) ⊗ χ` | twist by `ω⁻¹ = ω` gives `(ω ∗; 0 1)` | sound (r4) | none |
| §9.3 against Paškūnas (iv) | `(χ ∗; 0 χ)` | excluded there, covered by Tung Theorem A | sound (r4) | none |
| §9.2 total oddness | `ρ(c) = 1` vs `diag(1,−1)` at 2 | both reduce to 1; determinants 1 and −1 | sound (r4) | none |
| §10.1 nice prime | split reduction; prime not containing p | property (2) fails; `p ∈ q` fails | sound (r4) | none |
| §10.6 | `p = 3`, ratio ω | excluded by Theorem 4.1.7's clause | sound (r4) | none |
| §10.7 Euler characteristic | odd ρ, `ad⁰` | `h¹ − h² = 2d` | sound (r4) | none |
| §§10.8, 10.9 dimensions | `d = 4` | 5 and 5 | sound (r4) | none |
| §10.11 connectedness | `k[[a,b,c,d,z₁..z₆]]/(ab,cd)` | four components of dim 8; pairs meet in dim 7 or 6; `7 > 5` | sound (r4) | none |
| §10.11 reducible locus | `R_B^{red}` | `dim ≤ 1 + [F:ℚ]` with `δ_F = 0` | sound (r4) | none |
| §10.15 `p = 3` clause | ratio vs product | `ω = ω⁻¹`, so the exclusion is the same | sound (r4) | none |
| §11.1 twist by Teichmüller lift | β unramified at 3 | `det(ρ ⊗ η⁻¹) = ψη⁻²ε^{k−1}`; residual characters `ᾱβ̄⁻¹, 1` | sound (r4) | none |
| §11.2 | `k ∈ {2,4}` | `ω₃^{k−1} = ω₃ ≠ 1` | sound (r4) | none |
| §§12.6, 12.7 against DP Definition 1.10 | clauses (4)–(6) and the exception | as listed in r4 | sound (r4) | none |
| §12.3 Check | `V₅(11a1) ⊗ ε₅` | twist `ω₅ ⊕ ω₅²`; `det = ε³`; weights `{1,2}` | sound (r4) | none |
| §0.1 trace identity | `g = h = k = 1`; `diag(1,−1)`; `diag(a,b)` | 0, 0, 0 | sound (r4) | none |
| §0.1 descent | `G = 1`; char 2; `χ₁ + χ₂` | `T(c) = 2 ≠ 0`; h2 excludes char 2; Brauer–Nesbitt uniqueness | sound (r4) | none |
| §1.7 Lean form | `S = ∅`; real or complex v; `F = ℚ`, `S = {3}` | `E = ⊥`; `ℝ ⊗ E ≅ ℂⁿ`; `E = ℚ(√6)`, `n = 1` | sound (r4) | none |
| §1.8 quadratic clause (5) | odd z, non-square unit `d_z` | `F(√d)` inert at z, `F′ ∩ D = F` | sound (r4) | none |
| §6.2 oddness at 2 | `(1 1; 0 −1)`, `diag(1,−1)`, `−1` | determinants −1, −1, 1 | sound (r4) | none |
| §6.7a parameters | `t, j, d` | `h + j + t − d = 2h + 1` | sound (r4) | none |
| §6.11 count | `B[[x_1..x_{h+j+t−d}]]` | `h + j + t + 1` | sound (r4) | none |
| §§7.6, 7.9 | `{3,7}`; `{m, m+k′−1} = {0,k−1}` | `k = 5`; `m = 0`, `k′ = k` | sound (r4) | none |
| §7.11 | `k_h = 1`; a non-de Rham character | equal weights; not de Rham | sound (r4) | none |
| §8.6 Check | `y² = x³ − x` at 7 | 8 points, `a₇ = 0` | sound (r4) | none |
| Worked example 3 | `𝒪[[X₁,X₂,X₃]]/(X₁² + X₂X₃ + 2X₁)` | singular mod 2; regular after inverting 2 | sound (r4) | none |
| Conventions `p*` | 3, 5, 7 | −3, 5, −7 | sound (r4) | none |

## Not verifiable

- Source locators of this round's seeded sample were not re-read: none of the fifteen targets lies in the 18 changed lines, and an incremental review checks the sample only where it falls in them. The previous report's unreadable texts are unchanged: Kisin, *Moduli of finite flat group schemes, and modularity*; Kisin, *Modularity of 2-adic Barsotti–Tate representations*; and Kisin, *Modularity for some geometric Galois representations* (DVI only, or paywalled). They bear on §§5.6, 6.8 and 6.14 of the sample.
- Supplier heads without a checkout in this brief (SmallRamificationAndAbelianVarietyBaseCases, OrdinaryAutomorphicFormsAndModularityLifting, AlgebraicModularFormsAndSerreWeights, AutomorphicGaloisRepresentations, GlobalGaloisDeformations) were read through `roadmaps show`. The line numbers above refer to those dumps.

## Source issues

- none
