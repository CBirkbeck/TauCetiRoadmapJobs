# AutomorphicCongruences repair report

## F01 (P1) — applied

Complete ζ(2)², partial L^Σ and normalized J_v → partial ζ^Σ(2)², partial L^Σ and raw J_v, with Σ ∋ ∞, in both the cleared and the quotient identity (§2.4). The complete-ratio form with normalized J_v^♮ is the stated equivalent. A q = 2 Check added. §2.12's archimedean constant 1/(k−1) is now the raw J_∞. Evidence: CLW line 5769–5777; Wan-2020 line 4074–4079.

## F02 (P2) — applied

The gap:hilbert-cm-unit-congruence contract (README and plan.json) now assumes Wan's Δ+ ((Δ), Wan-2015 line 26–27). The vague "some discriminant place" becomes a "finite place dividing D_(M/F), which exists by Δ+". §5.5 assumes Δ+ for [F:ℚ] > 1 and gains the ℚ(√3), ℚ(ζ₁₂), p = 13 negative control. The ℚ(√29,√−7) Check now verifies Δ+.

## F03 (P2) — applied

§2.8(a) narrowed to cases (A)/(B) → CLW's full statement: ξ_p ≢ ξ_p̄ implies L_(π,K,ξ) is integral, for every p ≥ 3. §0.9 is now stated generally, with (A)–(C) kept and a new case (D) supplied by PadicFamilies (gap:cm-congruence-katz-integral, §§1.7–1.10). The same pattern in §2.8(b) ("case (C) holds") was removed too.

## F04 (P3) — applied

§5.4 gains an **API.** list: G_D normalization, the source and target of extraction, coefficientwise specialization, uniqueness, ℓ_f versus 1_f, and the degenerate-coefficient ideal at every boundary component. It also gains four computed Checks: diag(1,0)/diag(1,1), 2·3 = 6 (not 18), 1 versus ϖ, and the all-cusp test. The admitted cusps are now Wan's x = diag(u, t ū⁻¹) ∈ G(𝔸^Σ_(F,f)).

## Details of the repairs

**F01.** At q = 2 with Satake parameters (i, −i) in each factor:
- L_2(1/2,Π,r) = (3/2)⁻⁴ = 16/81. Of the eight parameter products, four are i and four are −i.
- L_2(1,Π,Ad) = (8/9)³ = 512/729.
- ζ_2(2) = 4/3.
- The raw integral is (16/9)(16/81)(729/512) = 1/2.

When Σ is enlarged by 2:
- The old right side changes by 32/9 while the left side stays fixed.
- The new right side changes by (9/16)(81/16)(512/729)·(1/2) = 2·(1/2) = 1.

The sentence "standard L-factor normalizations … cleared when necessary" was deleted: with the raw convention no local L-factor at a place of Σ enters. Wan-2020's printed mixture is named in §2.4 as replaced. Other places with the same object:
- §2.12's step 3, its first API bullet and the k = 2, 4 paragraph now say "raw archimedean integral J_∞ of §2.4". This agrees with FW line 5653–5654 and with CLW line 5792, where the archimedean integral is 1 in weight two.
- No other Ichino normalization occurs in the README. §2.22 only refers to §2.4.

**F02.** For the reviewer's witness, d_F = 12 and d_M = 144, so N(D_(M/F)) = 1. ℚ(√3) has class number 1 and a fundamental unit of norm +1, so its narrow class number is 2 and M = ℚ(ζ₁₂) is its narrow Hilbert class field. Δ+'s first clause is therefore exactly "M/F is ramified at a finite place".

For the positive control:
- d_M = 29·(−7)·(−203) = (29·7)², so N(D_(M/F)) = 49.
- (−7/29) = (22/29) = (2/29)(11/29) = (−1)(−1) = 1, so the ramified prime of F splits in M.

The BCS endpoint is unchanged: §5.10 already assumes Δ+, and §5.13 already proves it for its fields.

**F03.** CLW line 6232–6233 asserts integrality under ξ_p ≢ ξ_p̄ alone. The proof (line 6379–6381) appeals to HT93, HT94 and Hid06, which reach only §0.9's cases (A) and (B): Hid06 assumes p > 3, and HT94 line 163–165 inverts φ(Nc) and, in case (ii), 𝒱(T). Case (D) covers the rest:
- p = 3 with 3 | φ(𝔫)·∏(1+N𝔩);
- any p at which neither (A) nor (B) applies;
- the trivial-zero case.

The gap asks for the congruence-to-Katz divisibility H(g) | h_K·L^Katz_ξ for the CM family alone. It mentions neither π nor a Selmer group, so it assumes neither the final integrality nor CLW's divisibility. It is stated in the normalization in which CLW's L^Hida is the product: the CM-period-normalized Petersson norm, HT93 Theorem 7.1 and (8.8b). Those factors include the local factor L_q(X) = 1+X at the primes of HT93's set S (HT93 line 1894–1923), which is how the factor ∏(1+N𝔩) of HT94 Theorem 0.3 can enter.

Other edits for F03:
- Scope ("no other owner" list), the PadicFamilies neighbour row, the new contract line, the plan.json entry, §0.9 and §2.8 *Needs*, and the Layer 0 and Layer 2 Dependencies.
- New Checks in §0.9 and §2.8. The n = 7 example now selects (D) with v₃(6) = 1; the n = 5 example stays in (B) with v₃(4) = 0. Each section also has a u/3 versus u integrality Check.

**F04.** Sources used:
- Wan-2015 line 2392, p. 54: G_D = W′(f)⁻¹L_D^(2)|µ(x)|_F^(−κ)E_D. Unlike SU, there is no M^(κ/2) factor.
- Theorem 27, line 890–903, p. 23: the Siegel-operator boundary sequence over the cusps [g].
- Theorem 88, line 3597–3611, p. 71: integral coefficients at x = diag(u, t ū⁻¹) ∈ G(𝔸^Σ_(F,f)), specializing to G_(D_φ)/Ω_(f_φ,can) with no unit, and the det β = 0 ideal.
- Remark 89, line 3612–3615: the 1_f variant.

I scanned the README for other construction sections without an API list. §§1.4–1.6 and 2.10 have one. §§5.7 and 7.3 are existence-and-comparison theorems, not definitions, and were left unchanged.

## Checks

**Elaboration.** `lake env lean packages/AutomorphicCongruences/Suggested.lean`, run from the content checkout, exited 0 with no diagnostics (about 8 s). No `TauCeti.*` import is used, so no targeted build was needed.

**Elaborated-signature audit.** `Suggested.lean` has no declarations: its namespace is empty and its docstring says why. There was nothing to `#check`, and the file is unchanged. No README target that the file names changed its statable status. The §2.8 headline is still not statable, for the same missing carriers listed in the docstring.

**Dependency direction.**

```text
depcheck: 52 roadmaps, 613 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The new supplier, PadicFamilies, is line 190 of the merge order; this roadmap is line 249.

**Citation resolve.** The only lead is "KatoEulerSystems, §§0.1: no roadmap KatoEulerSystems on main or in an open pull request". This is an index miss: KatoEulerSystems is board package #163 and is earlier in the merge order (line 248).

**New citations.** PadicFamilies §§1.7, 1.8 and 1.10 were checked at its open head through `roadmaps show`: "The congruence module of an augmentation", "The congruence ideal of an augmentation" and "Congruence modules of a branch of a Hida family".

**Ownership.** I searched the open roadmap pull requests and main through `roadmaps grep` and `roadmaps show` for "Hida–Tilouine", "anticyclotomic main conjecture", CM congruence ideals and modules, and Katz/congruence. Nothing in PadicFamilies, EulerSystemsCyclotomicMainConjecture or ComplexMultiplicationAndExplicitReciprocity states the integral CM-branch congruence comparison. ModularIwasawaMainConjectures README line 165 treats Katz–Hida–Tilouine inputs as owned elsewhere. PadicFamilies owns congruence ideals of Hida-family branches (§§1.7–1.10) and already receives gap:katz-cm-padic-l, which includes Hida's CM Rankin–Selberg function with its congruence-ideal denominator. So the new gap is assigned there, not owned here: no route in the literature reaches the cases in (D).

**Plan consistency.** All 16 plan.json gaps have a README contract line with an identical `needs` sentence. Every `gap:` slug used in the README has a plan entry.

**Sources.** No new text was needed and `needs-references.toml` was not written. In `sources.toml` I extended two locators:
- CLW: equation (7.11.9).
- Wan-2015: Remark 89, the (Δ) hypothesis of §1.1, and the G_D normalization before Corollary 71.

Ichino2008 is still cited only by Theorem 1.1, its waived locator.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §2.4 cleared identity (raw) | Σ enlarged by q = 2, parameters (i,−i)³, pairings 1 | ζ_2(2)=4/3; L_2(r)=16/81; L_2(Ad)=512/729; J_2=1/2. Multiplier on the right: (9/16)(81/16)(512/729)·(1/2) = 1; on the left: 1 | Σ-independent |
| §2.4 old arrangement (control) | same | right side ×(512/729)/(16/81) = 32/9; left side ×1 | false identity, replaced |
| §2.4, partial ζ and L with normalized J (control) | same | right side ×2·1 = 2 | false, named in prose |
| §2.4 equivalence with the complete-ratio form | factor at v ∈ Σ, ∞ included | normalized J^♮_v times the local ratio = raw J_v; product over Σ cancels | consistent for either archimedean convention, provided the factors are finite and nonzero |
| §2.4 zero pairings | pairings (1,0,1) / (1,2,1) | products 0 / 2; the cleared identity holds with both sides 0 when d_i = κ_i∏_v d_(i,v) = 0 | quotient only when nonzero (unchanged) |
| §2.12 raw archimedean integral | k = 2, 4 | 1/(k−1) = 1, 1/3; ∞ ∈ Σ, so no Γ-factor enters L^Σ | consistent with FW line 5654 and CLW line 5792 |
| Contract gap:hilbert-cm-unit-congruence | F=ℚ(√3), M=ℚ(ζ₁₂), p=13 | d_F=12, d_M=144, N(D)=1; 4²=16≡3 and 5²=25≡−1 mod 13 | excluded by Δ+ (negative control added) |
| same | F=ℚ(√29), M=F(√−7), p=23 | d_M=(29·7)²=41209, N(D)=49; 11²=121≡6≡29 and 4²≡−7 mod 23; (22/29)=1 | Δ+ holds; positive control |
| same | F=ℚ(√5), M=F(i) | 5 splits in ℚ(i) (5≡1 mod 4); 2 ramifies in M/F | Δ+ holds (sanity) |
| §0.9 general divisibility | p=3, 𝔫=7 / 𝔫=5 | v₃(φ(7))=v₃(6)=1 → (D); v₃(φ(5))=v₃(4)=0 → (B) | case split complete |
| §0.9 (D) is not the endpoint | H=3, h_K L^Katz=3 / 1, RS value u/3 | L^Hida=u (integral) / u/3 (not) | (D) is about g alone; it neither mentions nor assumes π, f or a Selmer group |
| §0.9 (A) at p=3 | Hid06 assumes p>3 | — | (A) is never used at p=3 (Check kept) |
| §2.8(a) full | p=3 split, K≠ℚ(√−3) (since 3 ramifies there) | ξ_p≢ξ_p̄ ⇒ Ind ξ̄ irreducible and distinguished | hypothesis set equals CLW line 6232 |
| §2.8 rational versus integral | u/3 versus u over O[[Γ_K]], p=3 | same ideal after ⊗ℚ; v = −1 versus 0 | (C) cannot replace (D) (Check added) |
| §2.8(b) | conductor split only | ∏_(𝔩\|c″)(1+N𝔩) is an empty product = 1 | uses (a) only for L ∈ O[[Γ_K]]⊗ℚ; extra "(C) holds" hypothesis dropped |
| §5.4 degenerate index | β=diag(1,0) / diag(1,1) | det 0 / 1 | divisibility only for det β = 0 |
| §5.4 normalization once | raw 2, scalar 3 | 6 (once), 18 (twice), 2 (never) | only 6 matches Theorem 88 |
| §5.4 primitivity | DVR, coefficient 1 versus ϖ | reductions 1 / 0 | only the first serves §§5.5–5.7 |
| §5.4 all cusps | two boundary components, constant terms 0 / 1 | standard-cusp test passes; all-cusp test fails | Theorem 27 boundary needs every component |
| §5.4 period change | Ω·u versus Ω·ϖ | coefficients ×u⁻¹ (lattice kept) / ×ϖ⁻¹ (not) | canonical period fixed up to units |

## For the maintainer

- **New supplier request.** gap:cm-congruence-katz-integral on PadicFamilies (§§1.7–1.10). It asks for the integral CM-branch congruence-to-Katz divisibility in the cases that Hid06 and HT94 Theorem 0.3 do not reach. As far as I know, no published proof covers these cases, notably p = 3 with 3 | φ(𝔫)·∏(1+N𝔩) and the trivial-zero case. CLW's proof of Theorem 8.2.1(2) uses the comparison without proving it. If PadicFamilies judges the statement open, or false in some normalization, the CLW integrality endpoint §2.8(a) depends on it there; that is a scope question for a human.
- **Strengthened statements.** §2.8 now carries CLW's full statement in both parts. Consumers that cite §2.8 (ModularIwasawaMainConjectures, through the Layer 2 endpoints) receive a stronger statement; no consumer's citation breaks.
- **Hilbert-CM contract.** gap:hilbert-cm-unit-congruence gained the Δ+ hypothesis. Its slug is unchanged.
- **§5.4 scope.** The admitted cusps are now stated as Wan's x = diag(u, t ū⁻¹) ∈ G(𝔸^Σ_(F,f)), not "every cusp".
- **No changes** to Lean names, `Suggested.lean`, `metadata.toml` or the layer structure.
- **Source issue, already recorded by the review.** Wan-2020 line 4079 mixes conventions; §2.4 now says that its arrangement is replaced.
- **Suspicious text.** None was found in the review: it contained claims only.
