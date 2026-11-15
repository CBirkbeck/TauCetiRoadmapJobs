# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at 5b20d73)
**Verdict:** needs changes

**Previous findings (review of dfb2bb6).** R01 (ten AlgebraicModularFormsAndSerreWeights fragment names): repaired; `README.md:385–388` reads “R15.5 (§5.10, Deligne–Serre eigenvalue lifting, and §5.14, eigenform lifting with weight shifts) … R15.6 (§7.4–§7.5, residual modularity witness)”, and `:3227, 3302, 3327` cite §§1.1, 1.2, 2.1, 2.3, 2.5, 3.1, 5.10, 5.14, 7.4–7.5, 7.7, each a heading of that roadmap at its head. R02 (K₀/K₁ quotient cited to AL.2.2): repaired; `:612–614` “Two facts about the supplied local groups are proved here … K₀(pⁿ)/K₁(pⁿ)≅(O/pⁿ)ˣ, and K₀(pⁿ)=K₁(pⁿ)·Z(O)”, with the 𝔽₂ Check at `:622–623`. R03 (gaps not recorded where the intake reads them): not repairable in the folder; superseded by R01 below. R04 (mutual citation with QuaternionicModularForms): the citation is gone (0 hits in the README) and R17.3.8a–R17.3.8d now state the material; this leaves R02 below. R05 (garbled sentences): repaired; `:1615, 1685, 2950` read “The API gives: …”, `:774–778` and `:842` are sentences.

## R01 (P2) — The two declared gaps ask for what main already states

**Location:** `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:291–314`, “What ArithmeticGaloisRepresentations must provide (gap:weil-local-constants): … the Deligne–Langlands local constant `ε(V,ψ,dx)`” and “(gap:artin-functional-equation): … `Λ(s,ρ⊗χ) = W(ρ⊗χ)·Λ(1−s,ρ^∨⊗χ⁻¹)`”; also `:48–50`.

**Claim:** No roadmap states these two results, so ArithmeticGaloisRepresentations must add them.

**Witness:** Main, `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:14109` (§7.12b: unique `ε_F(V,ψ,dx)`, degree-zero induction, `λ(E/F,ψ)`, twist exponent `a_F(V)+n(ψ)dim V`) and `:14137` (§7.12c: `Λ(s,χ)=W(χ)Λ(1−s,χ̄)`, W the product of §7.12b's constants). ArithmeticGaloisRepresentations at its head, lines 164–170, assigns both elsewhere.

**Repair:** Delete the two gap paragraphs and `:48–50`'s clause. Add under “From roadmaps”: “ClassicalArithmeticCompletion §7.12b supplies the local constants of complex Weil representations with additivity, degree-zero inductivity, the constants λ(E/F,ψ), agreement with the rank-one constants and the unramified-twist exponent; §7.12c supplies the completed finite-image Artin function and its functional equation with root number the product of those constants.” State in R16.0.1 the one thing §7.12b lacks, as a definition: `ε((r,N),ψ,dx)=ε(r,ψ,dx)·det(−Φ | V^{I}/(ker N)^{I})` ([deligne73], §8.12, p.572). In R17.5.5 say that the twists are finite-order characters times a power of the norm, so that §7.12c applies to `ρ⊗χ₀` with `s` shifted. Repoint `:495, 520, 557, 580, 2738, 2748, 2766, 2845, 2853`. Tested on §7.12b's Check: for unramified quadratic `E/F`, λ=1, and `(d_K,−1)_v=1` for a unit discriminant, as `:2738` requires.

## R02 (P2) — R17.3.8a–R17.3.8d and QuaternionicModularForms both own the classical quaternionic forms

**Location:** `README.md:79–83`, “R17.3.8a–R17.3.8d own the classical quaternionic coefficient modules with their determinant normalizations and integral monoid actions, the quaternionic level forms over every number field … and the Hecke operators”.

**Claim:** These objects have one owner.

**Witness:** QuaternionicModularForms at its open head (#934), README lines 35–45: it owns “the algebraic coefficient modules over every commutative ring with their splittings, determinant normalisations and nebentypus (Layer 1)”, the level and classical forms (§§2.1–2.3) and `T_v`, `T_{v²}`, `S_v` with inversion formulas (Layer 3); its line 1516 lists R17.3 as consuming them.

**Repair:** One owner. AutomorphicFormsOnReductiveGroups (its line 1318), HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.8 and AutomorphicGaloisRepresentations §§0.2a–0.2f already cite R17.3.8a–R17.3.8d, and none of them cites QuaternionicModularForms, so keep the four sections here and have #934 withdrawn, or revised so that its §§1.3, 2.1–2.2 and 3.1 cite R17.3.8a–R17.3.8d and its line 1516 no longer lists R17.3 as a consumer. The mathematics of this folder does not change.

## R03 (P3) — The local Hecke statements are wider in Lean than in the README

**Location:** `README.md:2121–2123`, “for every submonoid of GL₂(F_v) containing `GL₂(𝒪_v)` it forms a Hecke pair … `T_v²=T_{v²}+(q_v+1)S_v` in its Hecke ring (`gl2_hecke_T_sq`)”, and `:2132–2133`.

**Claim:** The README's generality equals the Lean signature's.

**Witness:** `Suggested.lean:342–343`: `variable (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]`. `𝔽_q((t))` satisfies these and is no completion `F_v` of a number field, the only fields R17.3.8d names.

**Repair:** Add to the Good-place bullet: “The relation and the inversion formulas are local: they hold for GL₂ of every nonarchimedean local field, of either characteristic, since the coset counts `q+1` and `q²+q` use only the finite residue field; `gl2Integral_isHeckeTriple`, `gl2_hecke_T_sq` and `gl2_hecke_inv` are stated at that generality.” Tested at `𝔽_3((t))`: 4² = 12 + 4·1.

## R04 (P3) — Undefined symbol in the proof of the congruence theorem

**Location:** `README.md:704`, “Reduce r to prime powers pᵉ and combine their moduli”, and `:708`, “avoiding r, generator supports, ramification and rational primes below T”.

**Claim:** Every symbol of the proof route is defined.

**Witness:** `:702` ends “It therefore suffices to detect powers in M, with exponent nu”; no `r` is introduced in R16.1.7 before `:704`.

**Repair:** `:704`: “Factor the exponent `nu` into prime powers pᵉ and combine their moduli.” `:708`: “avoiding the primes dividing `nu`, the supports of the generators, ramification and the rational primes below T”.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Fixed-space comparison (R16.2.7) | basis (v, π(s)v); (2 1;−1 0); unramified χ∘det | U has matrix [[λ,qc],[−1,0]], polynomial X²−λX+qc; U−1≠0, (U−1)²=0; both invariant spaces the line | holds; cg20 lines 182–191 (pp.805–806) |
| Ramification realization (R17.1.5) | ℚ: ∅, {∞}, {2,∞}; complex place | M₂(ℚ); odd set, none; (−1,−1)₂=(−1,−1)_∞=−1, Hamilton; always split | holds; [prr23] unread |
| Stronger variant (R17.2.5) | f strongly cuspidal on I(μ,ν); x=k⁻¹a, y=k; ζχ on unramified principal series | inner integral ∫_N f(x⁻¹nak)dn=0, so ρ(f)=0; recovers (16.1.7); trace 1−1=0 with ρ(ζχ)≠0 | holds; jl70-ubc line 16820 (printed p.275) |
| Quaternion proof (R17.2.6) | (16.1.7) at two places; two Steinberg factors | terms (iv)–(viii) vanish (jl70-ubc line 16823); (−1)(−1)=+1 | holds; convergence is AutomorphicSpectralTheory's |
| Classical coefficient and Hecke adapter to Pan's spaces (R17.3.9) | (n,s)=(k,−k); scalar u; k=2, ℓ=3 | left action Sym^k⊗det^{−k+k}; u^{k−2k}=u^{−k}=τ(u)⁻¹; supplied S_ℓ=1/9, Pan's S_ℓ=9 | holds; pan26-global lines 3075–3086, 3231–3288; ℓS_ℓ=ℓ^{k+1} at weight k+2 |
| Whittaker-type-module bridge (R17.4.13b) | q=4, t=1/4, χ=1, s=2 | attached module L=(32/31)(16/15)(8/7)=1.2584; generic constituent 1.1011; ratio 8/7 | holds; gj78 lines 2060–2070, 2212–2224 (pp.531–536) |
| Cubic monomial input (R17.4.17) | θ=1; inert Frobenius; transposition | Ind 1=1⊕Std(S₃); eigenvalues 1, ζ₃, ζ₃²; 1, 1, −1 | holds; jpss79 Theorem 14.2 at printed p.253 (OCR) |
| All-place comparison (R17.4.17) | ℝ³, ℝ×ℂ; unramified quadratic | λ²=(d,−1)=+1, −1 (λ(ℂ/ℝ)=i); λ=1 | holds; deligne73 lines 792, 1287, 1335, 1972 (pp.530, 549, 551, 572); ownership is R01 |
| Oddness API (R17.5.13) | diag(1,−1) at 3 and at 2; R=ℤ×ℤ | −1≠1; −1=1; det (−1,1) is neither 1 nor −1 | holds; domain needed; bcgp21 lines 12593–12623 (pp.473–474) |
| Domain test (R17.5.15) | x=2, −1, 5 in ℚ₂ˣ | −1, 1, 1 | holds; tunnell78 line 193 (p.182) |
| Order test (R17.5.15) | a=1, 2, 3 in ℤ/4 | i, −1, −i; χ(1)²=χ(2)=−1 | holds |
| Construction and local finiteness (R17.5.16) | L=ℚ(i), a=1+i | a/ā=i, a unit of absolute value 1; phase of order 8 | holds; carayol86 line 1558 (p.450); patrikis line 1374 |
| Parabolic comparison (R17.6.4) | (a,d)=(2,3), (3,2), (1,1) | dn≥a(n+1) at n=a iff d≥a+1: 6≥6; dual stalk; never | holds; carayol86 lines 1808–1850 (pp.457–458) |
| `chevalley_power_congruence` | E=⟨2⟩⊂ℚˣ, n=2, T={2}; n=3 | 2^j≡1 mod 3 iff j even; mod 7 iff 3∣j | holds |
| `finite_hecke_full_local_prescription` | ℚ, S={2}, χ₂ unramified of order 8 | no prime-conductor order-8 solution (χ⁴(2)=(2/ℓ)=1); order 16 at ℓ≡1 (32) with 2 a non-quartic residue | holds; order growth needed |
| `supercuspidalProjective` | π⊗ρ, ρ(g)=(1 v(det g);0 1) | ϖI acts by ω(ϖ)(1 2;0 1), not semisimple, outside the fixed-ω category | holds |
| `existsQuaternionRamification_iff`, `nonempty_quaternionAlgEquiv_of_localSplitting` | (−1,−1) against (1,1) over ℚ | split sets differ at 2 and ∞, hypothesis false; equal data give the identity | holds |
| `algWeightSlash_mul`, `algWeightAction` | n=1, γ=(1 1;0 1), δ=(1 0;1 1) | (1∣γ)∣δ=z+1=1∣(γδ), γδ=(2 1;1 1); 1∣(δγ)=z+2 | right action, as stated |
| `algWeight_equiv_symPowerRep` | n=1, s=0, g=diag(2,1); scalar u | (·)∣g⁻¹ has eigenvalues 1, 1/2 = those of std⊗det⁻¹; u^{n+2s} on the right, u^{−n−2s}=u^n·u^{2(−n−s)} on the left | holds over every commutative ring |
| `quaternionLevelForms_finite`, `classicalForms_finrank` | Hurwitz level, (n,s)=(2ℓ,−ℓ), ℓ=0..3; M₂(ℚ), GL₂(ℤ̂), (10,−5) | A₄-averages (1), (3+3·(−1)+0)/12, (5+3−8)/12, (7−3+8)/12 = 1, 0, 0, 1; zero space, so `htriv` is needed | holds; matches dim S_k(Γ₀(2)), k=4, 6, 8 |
| `gl2_hecke_T_sq`, `gl2_hecke_inv` | q=3; degrees | 4²=12+4·1; K·diag(ϖ⁻¹,1)·K=ϖ⁻¹·K·diag(1,ϖ)·K | holds; generality is R03 |
| R17.3.8d level-`K₀` cosets | x_α=η(1 0;ϖ^tα 1) | x_αx_{α′}⁻¹=(1 0;ϖ^{t−1}(α−α′) 1), in the level iff α≡α′; q cosets = [K₀:K₀∩η⁻¹K₀η] | holds |
| R17.3.8a global units | ℚ(√3), u=2+√3 | N(u)=1; weights (1,3): σ₂(7+4√3), not a root of unity; (2,2): 1 | holds |
| `finite_projective_lift` | open kernel | finite quotient, so the finite-range clause is implied | holds |
| `odd_solvable_artin_weight_one` | Std(S₃) of x³−2 at p=5, 7, 31 | traces 0, −1, 2; determinants −1, 1, 1 | holds |
| `solvable_finite_image_integral_lift` | S₃ in GL₂(𝔽₂) | reflection lattice over ℤ; det −1≡1 | holds |
| `solvable_characteristicTwo_projective_dihedral` | GL₂(𝔽₂); A₄ in PSL₂(𝔽₄); cyclic | D₃; V₄ unipotent with one fixed line, reducible; reducible | holds |
| `characteristicTwo_solvable_weight_one` | K real quadratic, Ind φ̃ even | twist by ξ ramified at one real place: det at c is (−1)(+1)=−1; ξ≡1 mod l | holds |
| R17.6.7 dyadic cases | D≡1, 5, 4, 0 mod 8 | ν=0, 2, 2, 3 from ∣D∣·Nf=2^νN | holds; rt97 lines 368–375 |
| R17.6.3b on ℙ¹×ℙ¹ | c₁(t,s)=(t²,s) | (t²)⊂(t)², n=1; trace 1+3+2=6=3·χ(ℙ¹) | holds |
| R01: local constants on main | unramified quadratic E/F; ramified quadratic character of ℚ₃ | λ=1; ε=−i√3, twist by ∣·∣ multiplies by 1/3 = q^{−(a+n(ψ))} | ClassicalArithmeticCompletion §7.12b states them |

- Source locators checked against the text: 48, in 16 texts (jl70-ubc, rt97, pan26-global, loeffler11, cg20, gj78, jpss79, henniart02, deligne73, bcgp21, tunnell78, patrikis, carayol86, varshavsky05, cdn23, mw26); all agree with the README.
- Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): 45, among them `IsHeckeTriple` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:75`), `MvPolynomial.basisRestrictSupport` (`Mathlib/RingTheory/MvPolynomial/Basic.lean:95`), `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`), `symPowerRep` (`.../SymmetricPower.lean:57`, `k : Type`, which forces `K : Type` in `algWeight_equiv_symPowerRep`); none missing. Tau Ceti's `HeckeRing.GL2.heckeT_prime_pow_recurrence` is for the rational Hecke ring at a prime number and does not give `gl2_hecke_T_sq`.
- Cross-roadmap citations resolved at main or at the open heads: AutomorphicFormsOnReductiveGroups §§0.5, 2.6, 5.8, 7.2–7.4, 7.6; AdelicAlgebraicGroups §§1.5, 2.2–2.3, 3.4, 4.4, 5.2, 5.3; RestrictedPowerSeries §§0.1, 2.2; AlgebraicModularFormsAndSerreWeights R15.1–R15.6 and the twelve § numbers (the resolver's two leads are its declared aliases); seven downstream consumers, each citing the sections the README names.
- Gate at this head: every scanner 0, `build=0`, OK. Dependency check: `depcheck: 245 roadmaps, 2248 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on a copy with `#check @name` for the 24 declarations, exit 0, 19 `sorry` warnings and nothing else; each type compared with its README statement. `gl2Integral` keeps only `[Field L] [ValuativeRel L]`, which is all its body uses. One-tactic probe (`first | rfl | simp | infer_instance | exact trivial | decide`): all 19 theorems fail; no padding. `algWeightSlash_mem`, `_mul`, `_one` and `gl2Integral_isHeckeTriple` are what makes `algWeightAction` and the Hecke-ring statements well-formed.
- Headlines statable at the pins are stated; the module docstring names the missing carriers for the others. Pull-request text read against the head: 19 theorems, five definitions, suppliers and consumers as described; no stale sentence.
- Overlap check: read AutomorphicLFunctionsAndLocalFactors, EndoscopicTransferAndUnitaryTraceComparison, ModularityAndLanglandsExtensions, AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactorsPartII, SmoothRepresentationsOfLocalGroups, ModularForms, AdelicAlgebraicGroups; nothing shared with these (each consumes or supplies by section). Shared elsewhere: classical quaternionic forms with QuaternionicModularForms (R02); local constants and the Artin functional equation, owner ClassicalArithmeticCompletion (R01).
- Source independence: 8 passages compared with 7 sources, none shared beyond an eleven-word arithmetic statement (rt97 line 365); largest share Jacquet–Langlands (the keys jl70, jl70-ubc and jl70-global), 32 of 228 locators; contents compared with jl70-ubc (§§1–16): independent, the layers cite §§2, 3, 5, 10, 11, 12, 14, 15, 16 out of order.

## Not verifiable

- [prr23], Theorem 1.33: the book is not openly readable; the statement was checked on instances only.
- [jl70] and [jl70-global] page numbers (IAS retypeset and IAS scan): only the UBC text was read, where Theorem 16.1 is on printed p.260 and (16.1.7) on p.275.
- [casselman73]: the only copy named is on a third party's page, which the sources service does not classify; not read.
- [langlands80], [ac89], [flm11], [bh06], [bz76], [bm02], [cdt99], [wiese04], [ddt], [isaacs74], [webb16], [chevalley51], [cht08], [shimura71] and the remaining references outside the sample: cited by locator, not read this round.
- [mw26]: the section numbers 11 and 13 and their pages 14 and 17 agree; the theorem labels were not legible in the extraction.
- [jpss79] and [tunnell78] were read from OCR of image-only scans.

## Source issues

- **Error** in cg20 at §1.3, printed p.805: the source says a smooth admissible irreducible unramified representation that is not trivial has a two-dimensional Iwahori-fixed space; it should be infinite-dimensional, since an unramified determinant character has a one-dimensional one; affects a stated result.
- **Gap** in jl70-ubc at Theorem 16.1, printed p.260: the source says its proof is a formal sketch whose analytic facts were not verified; it should supply the convergence and trace identities; affects the proof.
- **Misprint** in rt97 at §2, case (ii), printed p.306: the source says the discriminant is congruent to plus or minus five modulo eight; it should be five, since three is not a discriminant residue; affects nothing.
- **Misprint** in rt97 at §2, sentence after the list (i)–(iv), printed p.307: the source assigns the dyadic exponent three to case (iii); it should be case (iv); affects nothing.

## For the human reviewers

- **Ownership.** QuaternionicModularForms (#934, earlier in the merge order) and R17.3.8a–R17.3.8d here state the same forms; this review's brief forbids citing QuaternionicModularForms as a supplier. Which pull request keeps them is yours to settle (R02).
- **Gaps.** The README declares two gaps on ArithmeticGaloisRepresentations (`README.md:291, 306`); no `design/plan.json` exists for this roadmap, so the intake has announced neither. R01 removes both.
- **Licence.** [mw26] (`README.md:3505`) is an arXiv preprint of September 2026 with no published version; R17.2.6 cites its Theorems 11.1 and 13.1 for twisted absolute convergence.
- **Licence.** [casselman73] (`README.md:3460`) is linked on a personal page that is not the author's or the publisher's.
