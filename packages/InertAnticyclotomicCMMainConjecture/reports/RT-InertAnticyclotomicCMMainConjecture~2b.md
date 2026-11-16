<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6905676002 -->
Red team round 2 pass b (claude) of b91cf69

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.4 states "X_rel has rank one" and gives no route to it; the only adjacent route is the specialisation its own Check refutes

   **Location.** `packages/InertAnticyclotomicCMMainConjecture/README.md:497` "S_rel is a finitely generated torsion-free Λ_R-module of rank one, C has rank one, X_rel has rank one and X_str is a finitely generated torsion Λ_R-module"; `README.md:499` "so the two-variable relaxed dual has rank 2−1=1; its specialisation along γ⁺−1 is compared with X_rel by SelmerIwasawaCohomology §3.3".

   **Claim.** The route of §3.4 proves rank_(Λ_R) X_rel=1.

   **Witness.** The route derives the ranks of S_rel, C, X_str and of the two-variable relaxed dual, and nowhere the rank of X_rel over Λ_R. Specialisation gives only rank ≥1: M=Λ_(2)⊕Λ_(2)/(γ⁺−1) has rank 1 and M/(γ⁺−1)M=Λ_R² has rank 2 (the module of the Check at `README.md:507`). §4.3 (`README.md:575`) needs the rank one of X_rel as an independent input to conclude that γ⁺−1 is prime to the two-variable torsion, so it cannot come from that specialisation.

   **Repair.** In the route of §3.4, after "The rank of S_rel is then one.", insert:

   > X_rel has rank one over Λ_R by the strict–relaxed sequence on K∞ itself, 0→S_str→S_rel→ℋ→X_rel→X_str→0, the corestriction and restriction limit of SelmerIwasawaCohomology §2.19 for the pair of conditions 0 and all of H¹((K_n)_𝔭,T′) at 𝔭. Here ℋ is free of rank two (§3.3), S_rel is torsion-free of rank one and X_str is torsion. S_str has rank zero: otherwise S_rel/S_str would be a torsion module injecting into the torsion-free ℋ, hence zero, and loc(c_a) would vanish, against §3.3. So rank X_rel=2−1+0+0=1. This rank is not read off from the two-variable rank: specialisation along γ⁺−1 can only raise the rank (last Check).

   and replace "its specialisation along γ⁺−1 is compared with X_rel by SelmerIwasawaCohomology §3.3" by "its specialisation along γ⁺−1 is compared with X_rel by SelmerIwasawaCohomology §3.3; that the specialisation has rank one is the anticyclotomic computation above, not a consequence of the two-variable rank". Tested on the witness: the inserted argument uses no two-variable module, so M is not an instance; ranks 0−1+2−1+0=0 in the five-term sequence.

2. **F02** (P3) torsion-freeness of S_rel and of the two-variable relaxed module is attributed to H⁰ of W; the modules are over T′

   **Location.** `README.md:499` "Torsion-freeness of S_rel follows from H⁰(K∞,W)=0 and the corestriction-limit description (SelmerIwasawaCohomology §3.1), following the argument of AHI06 Lemma 1.1.9"; and, same line, "the two-variable relaxed module is torsion-free by the argument for S_rel below, H⁰ of W over K̃∞ lying in H⁰(Θ∞,W)".

   **Claim.** Vanishing of the G_(K∞)-invariants of W gives torsion-freeness of lim_cor H¹(K_n,T′).

   **Witness.** AHI06 lines 374–378 use the torsion of the divisible module of the same lattice (there T_p and W_p=T_p⊗ℚ_p/ℤ_p). Here S_rel has coefficients T′, whose divisible module T′⊗_R L/R has character φ_p⁻¹χ_cyc, not φ_p: at Frob of (−1+2i) in ℚ(i) the values are ᾱ and α.

   **Repair.** Replace the first sentence by:

   > Torsion-freeness of S_rel follows from H⁰(K∞,T′⊗_R L/R)=0 and the corestriction-limit description (SelmerIwasawaCohomology §3.1), following the argument of AHI06 Lemma 1.1.9 with T′ in place of its lattice; the ordinary hypothesis of that paper is not used. The vanishing is local at 𝔭: T′/ϖ_RT′=Hom(W[ϖ_R],μ_p), on which the tame group Gal(Φ(F[π])/Φ) acts through κ⁻¹·κ^(p+1)=κ^p, κ being its faithful character of order p²−1 on F[π] and χ_cyc restricting to N_(Φ/ℚ_p)∘κ=κ^(p+1) modulo p; κ^p is nontrivial, and G_(Ψ∞) and G_(Θ∞) still act through the whole tame group (§§0.2, 3.3).

   and in the two-variable sentence replace "H⁰ of W over K̃∞ lying in H⁰(Θ∞,W), which vanishes because G_(Θ∞) still acts on W[π] through the tame group Δ" by "H⁰ of T′⊗_R L/R over K̃∞ lying in H⁰(Θ∞,T′⊗_R L/R), which vanishes by the same computation". Tested: at p=5, κ^5 has order 24/gcd(5,24)=24≠1. (The uses of H⁰(Ψ∞,W)=0 in §§3.3, 4.1, 5.2, 5.3, 5.6 concern cohomology of W and are correct.)

3. **F03** (P3) one bare H still names the local Iwasawa module

   **Location.** `README.md:676` "that conjecture is the integral splitting H=ℋ⁺⊕ℋ⁻ of §3.3".

   **Claim.** H is the Hilbert class field everywhere (Conventions, `README.md:27`).

   **Witness.** §3.3 (`README.md:482`) writes "ℋ=ℋ⁺⊕ℋ⁻ is free of rank two"; the left side at line 676 is the same module.

   **Repair.** Write "the integral splitting ℋ=ℋ⁺⊕ℋ⁻ of §3.3".

4. **F04** (P3) c_a is defined only up to R×, and the constant of §3.3 is called nonzero where §4.5 needs a unit

   **Location.** `README.md:441` "twist the norm-compatible family of their Kummer classes … by the module T_0 … to a class in lim_cor H¹(K(fpⁿ),T′)"; `README.md:484` "where c is a nonzero constant independent of χ and a, fixed by the period and trace normalisations"; `README.md:612` "each is L_p times the image of the distribution factor of a, up to the period and trace units of §§0.1, 0.4".

   **Claim.** c_a is a determined class, and loc(c_a)↦unit·d_a·ξ integrally.

   **Witness.** NonordinaryCMSpecialValues §2.9 gives an isomorphism (lim H¹(F_n,ℤ_p(1)))⊗T_0≃lim H¹(F_n,T_0(1)); a class needs an element of T_0, which line 441 does not name. With t∈T_0 replaced by πt, c becomes πc and §3.3 still holds as written, while (coordinates of loc C)=(πL_p)≠(L_p).

   **Repair.** In §3.1, after "by the module T_0 … with the trace-dual coefficient lattice", insert "that is, tensor with an R-basis t_0 of T_0; another basis changes every c_a by one unit of R, so C does not depend on it". In §3.3 replace "where c is a nonzero constant independent of χ and a, fixed by the period and trace normalisations of §§0.1 and 0.4" by "where c∈R× is independent of χ and a: ξ is formed with the R-basis γ=per_φ(ω)/Ω of Hom_R(T,R) (NonordinaryCMSpecialValues §2.7, through §2.4's integral dictionary), c_a with the basis t_0 of T_0, and the two differ by the trivialisation of the inverse different of §0.4, a unit". Tested on the witness: πt is not a basis, so the rescaled family is excluded and the ideal is (L_p).

5. **F05** (P3) the gap is stated for elements of U∞*⊗_O R and is applied to elements of the quotient V_R

   **Location.** `README.md:482` "the reciprocity of §2.2 for elements of U∞*⊗_O R computes the derivatives of the image"; `README.md:484` "gap:wiles-reciprocity-every-local-unit, which applies to the element y_a"; `README.md:364` "applied to ξ".

   **Claim.** ξ and y_a are elements to which the gap applies.

   **Witness.** ξ, y_a∈V_R, and AnticyclotomicLocalUnits §0.5 defines V∞*=U∞*/(σ−1)U∞*, a quotient; the gap (`README.md:69`) quantifies over x∈U∞*⊗_O R and Kummer classes over Φ_n, not Ψ_n.

   **Repair.** In §3.3, replace "which applies to the element y_a" by "applied to a lift of y_a to U∞*⊗_O R, for instance the image of the localisation of the two-variable class of §3.1 under the two-variable form of the Kummer comparison; V_R is the quotient of U∞*⊗_O R by σ−1 (AnticyclotomicLocalUnits §0.5), and δ_χ for χ of Γ⁻ kills (σ−1)U∞* (§1.4 there), so the value does not depend on the lift"; in §2.2 replace "applied to ξ" by "applied to the class ξ_1∈U∞*⊗_O R of which ξ is the image"; add AnticyclotomicLocalUnits §§0.5, 1.4 to the *Needs:* of §3.3 and §0.5 to that of §2.2. Tested: for x̃ and x̃+(σ−1)u, δ_χ differs by δ_χ((σ−1)u)=0.

Read in full: `packages/InertAnticyclotomicCMMainConjecture/README.md` (855 lines) and `Suggested.lean` (42 lines, no declaration). One P2 finding (S01) and four P3 findings (S02–S05). No statement of the README was found false.

## Round 1 findings at this head

| Round 1 id | Status | Witness at b91cf69 |
|---|---|---|
| 1a/F01 (P1), 1b/F02 (P2): Wiles reciprocity cited beyond AnticyclotomicLocalUnits §4.3 | repaired | `README.md:69` "What AnticyclotomicLocalUnits must provide (gap:wiles-reciprocity-every-local-unit): §4.3 with its projected class replaced by an arbitrary element and with no auxiliary global field"; `README.md:364` "§4.3 in the form requested as gap:wiles-reciprocity-every-local-unit"; same slug in `design/plan.json` `gaps` (supplier AnticyclotomicLocalUnits, §4.3); slug on the *Needs:* lines of §§2.2, 3.3, 4.5 and the Dependencies of Layers 2–4. The supplier's §4.3 still opens "For the projected class", so the gap asks for nothing provided. A residual imprecision in how the gap is applied is S05. |
| 1b/F01 (P2): §3.4 torsion of X_str by two-variable descent | repaired | `README.md:499` "Torsion of X_str follows from weak Leopoldt (EulerSystemsAndKolyvaginSystems §8.25) for the Euler system of §3.1 on the anticyclotomic tower K∞ itself"; (*) of §8.11 proved through unit-ness; Checks at `README.md:506–507`. Checked against the supplier: §8.11 states that §8.25 holds under (*) without admissibility; Hyp(K∞,V) of §8.2 with τ=1 gives V/(τ−1)V=V of dimension 1 and V irreducible. The repair left one clause of the statement without a route (S01) and names the wrong module for torsion-freeness (S02). |
| 1a/F02, 1b/F03 (P3): `NCM.k/<slug>` ids | repaired | 0 occurrences of `NCM.` in the README; `README.md:73` "Use §0.4 for the smooth integral model … §§2.7, 2.8 and 2.10 … §3.4 for φ((p))=−p". The eleven sections were re-read at the supplier's head and state what is cited. `plan.json` gap section is "§§2.2–2.3". |
| 1a/F03 (P3): F and H each name two objects | partly repaired | §3.2 uses M (`README.md:463` "Let M be H or K₀=H(E[p])"); ℋ occurs on 29 lines. One bare H remains for the local module: `README.md:676` "the integral splitting H=ℋ⁺⊕ℋ⁻ of §3.3" (S03). |
| 1a/F04 (P3): §3.1 twist equated with AHII05's | repaired | `README.md:443` "AHII05 §3, p.614, twists instead by the inverse cyclotomic character times the avatar, which lands in the Tate module of a curve over ℚ, of character ψ_p, whereas the twist by T_0 lands in T′". Values at Frob of (−1+2i): α and ᾱ=5/α. |
| 1a/F05 (P3): unused *Needs:* edges, Scope list | repaired | §3.4 *Needs:* (`README.md:509`) has no PadicMeasuresIwasawaAlgebras §4.6; §4.1 (`:555`) no SelmerIwasawaCohomology §3.11; §4.3 (`:587`) no §4.1; §6.2 (`:787`) no §5.4; Scope (`:21`) "3.10–3.12 and 3.16". |
| 1a/F06, 1b/F04 (P3): §5.2 assumed E over K | repaired | `README.md:676` "For every inert CM datum, s∈{+,−} and n≥0, the restriction map L_n^s→L_∞^s[ω_n^s] is an isomorphism"; `:647` "Sections 5.1, 5.2 and 5.5 need no such hypothesis". |

## Dependency check

    depcheck: 241 roadmaps, 2259 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line for this roadmap. `merge-order/ORDER.txt` has NonordinaryCMSpecialValues at line 345, AnticyclotomicLocalUnits at 347 and this roadmap at 348.

## The pass: statements, instances and computed values

`Suggested.lean` declares nothing, so the declaration table is empty (section, variables and instances: none). The README targets:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions: φ((p))=−p | restriction of φ to ℚ | odd quadratic character trivial on norms from K: κ_K; κ_K(p)=−1 at inert p | −p, agrees with NonordinaryCMSpecialValues §§1.4, 3.4 |
| Conventions: f≠(1); units inject modulo gpⁿ | α and −α; u=−1,i,ω | α=−α impossible; N(u−1)=4,2,3<p² | holds |
| Sign table | χ=1, order 5, order 25 | c=0,2,3; +,+,−; same table in AnticyclotomicLocalUnits Conventions | agrees |
| Agboola–Howard dictionary | AHII05 lines 102–109 | their Ξ⁻={1}∪odd k = c even; E⁺ killed on their Ξ⁻=Ξ⁺ here | labels of signed objects agree |
| §0.1 Check 2 | p=5 | (X+5)², trace −10, #E(𝔽₂₅)=36 | holds |
| §0.2 | norm group of K(p^∞) at 𝔭 | closure of p^ℤ·μ(K) ⊇ (−p)^ℤ; completion inside Φ∞, Galois group 1+pO | Θ∞, agrees |
| §0.4 | R=O[√π] | different (2√π); quotient of order p²; Hom_(ℤ_p)(L/R,ℚ_p/ℤ_p)=inverse different | holds |
| §0.5 iff | a=T, a=p, both directions | T(χ⁻¹)=0 only at χ=1; p≠0 everywhere | holds |
| §1.1 | n=0; trace m→n on a base point | A_0⁺=0, A_0⁻=F(Φ); λ_1 multiplied by p^(m−n) (supplier §8.5: λ_χ(Tr y)=pλ_χ(y)) | holds |
| §1.2 last Check | p=5, β³=aπ | a⁴ of order 6 ∉ μ_8; cube root of order 18∤24 | holds |
| §1.3 | good v | H¹_ur(W)=W/(α−1)W=0; H¹(I_v,W)^Frob≠0 iff α≡q | holds |
| §1.4 lifting | divisible class | failure in a quotient of H¹(𝔭,T)/L_T, finitely generated over ℤ_p | zero on divisible subgroup |
| §1.5 Check 1 | L=Φ(ζ₅) | Tr(ζ)=−2, Tr(1)=8; f(x)=0, f(γ⁻¹x)=10/25 | holds |
| §2.2 | χ=1 | 1−(−p)/p²=1+p⁻¹; supplier §2.8 gives L_(pg) with g=f | holds |
| §2.3 | ε=+, order p, p² | W=(−1)²,(−1)³ | ξ∈V_R^ε |
| §2.5 | δ_(χ⁻¹)(L_p v) | L_p(χ)δ_(χ⁻¹)(v); φ̄χ⁻¹=conj(φχ); BKO21 line 841 | agrees |
| §3.1 twist | Frob⁻¹(c⊗t), σ_a(c⊗t) | 1−φ(𝔮)⁻¹Frob⁻¹; N(a)−φ(a)σ_a; at α=−1+2i: (6+2i)/5 | agrees with supplier §2.7 |
| §3.1 Euler system | least modulus of F | K(m)∩K(m′)=K(gcd); 𝔮∤N divides it iff 𝔮 ramifies in F | relations of EulerSystemsAndKolyvaginSystems §2.2 |
| §3.2 | K=ℚ(√−23), p=5 | #G=3, 72 | holds |
| §3.3 | a=(α), a=O_K; supplier §2.6 smoothed formula | d_a(χ⁻¹)=N(a)−φ(a)χ(a)⁻¹, same as (N(a)−ψ(a)χ(a)⁻¹); 6−2i of norm 40; 0 | agrees; unit of c: S04 |
| §3.4 X_str | τ=1; 𝔮=(1+i), 3O_K at p=7 | Frob²=1 in ℤ_7; 2⁶≠1, 9³≠1 in ℤ_7; H¹(I_w,T′)^Frob=T_0^(Frob=1)=0 | holds |
| §3.4 X_rel | M=Λ_(2)⊕Λ_(2)/(γ⁺−1) | rank 1, specialisation rank 2 | no route: S01 |
| §3.4 torsion-freeness | residual character of T′ on Δ | κ^p, order 24 at p=5; W has κ | true, wrong module cited: S02 |
| §3.5 | RUB91 lines 486–489, 547–551 | hypotheses and equality clause as in the gap; μ_p⊄H since p unramified in H | declared gap, not raised |
| §4.1 | n=0, s=+; dual of §2.19 on W | 0→S_str→S_s→L^(s,⊥)→Sel_rel(W)^∨→Sel_s(W)^∨→0 | second sequence obtained |
| §4.2 | alternating ranks | s=−ε: 0−1+1−x=0, x=0; s=ε: 1−1+1−x=0, x=1 | holds |
| §4.4 | 0→A→B→C→0, A torsion | B_tors→C_tors onto; (T)(T)=(T²) in the model | both identities |
| §4.5 | α≡1 mod 6f, α≡2 mod p | α(ᾱ−1)≡2; t↦πt gives (πL_p) | unit; basis unnamed: S04 |
| §4.6 | R/O degree 2, L_p=T | (T²) | holds |
| §5.1 | n=0,1,2; A_n^s | ω_0⁺=1 kills A_0⁺=0; ω_0⁻=γ−1 kills F(Φ); degrees 20+5 | holds |
| §5.2 | n=2; 𝔪=(ϖ,T) | coranks 20, 5; 𝔪/T𝔪≃R⊕R/ϖ | holds |
| §5.3–5.4 | χ-eigenspace of F(Ψ_n)⊗L_χ | λ_ψ vanishes on it unless ψ=χ; contained in A^(−ε)⊗L_χ iff χ∈Ξ^ε | holds |
| §5.5 | A/𝔪^k, κ²; f∈Λ_O | 1≤k, 2=2; ζ↦ζ⁻¹ in Gal(Φ(μ_(p^r))/Φ) | holds |
| §§6.1–6.4 | (fg)⊆(f); χ=1 with ε=± | orders 1≤3; bounds ord, ord+1; E(K_n)⊗ℚ_p=E(K_n)⊗_(O_K)Φ | agrees with BKO21 lines 888–893 |
| Gaps (6) | README and `design/plan.json` | same six slugs, suppliers and sections; README gap formula Σχ(g)·g(π^(−n−1)δ_n(x))=δ_χ(x) equals supplier §1.3 | declared, precise |

## Verified sound

- **Suggested.lean:** 0 declarations read; single `import Mathlib`; no `set_option`; module docstring of the required form naming the four headlines (§§4.6, 4.2, 4.4, 6.4) and what each lacks. None is statable at the pins (no signed local conditions, Lubin–Tate module, local-unit module or Coates–Wiles derivative there); nothing is stated through a stand-in; no padding. The `#check` comparison has no case; no Lean was run.
- **Targets read:** 36 subsections in 7 layers, all 855 lines. **Checks tested:** 120 read, about 60 recomputed (table); none false or vacuous; each definition (§§0.1, 1.1, 1.4, 1.5, 2.1, 2.4, 3.1, 5.1) has at least three.
- **Sibling citations checked at the current heads or main:** AnticyclotomicLocalUnits Conventions and §§0.1, 0.5, 1.2–1.5, 2.4, 3.1, 3.2, 3.6, 4.2–4.4, 8.2, 8.4, 8.5 by content; NonordinaryCMSpecialValues §§1.4, 1.5, 2.2, 2.3, 2.6–2.9, 6.4 by content, §§0.4, 2.1, 2.4, 2.10, 3.3–3.5 by heading; EulerSystemsAndKolyvaginSystems §§2.2, 8.1, 8.2, 8.11, 8.25 by content; SelmerIwasawaCohomology §2.19 by content and 16 further headings; ArithmeticGaloisDuality 7 headings; ComplexMultiplicationAndExplicitReciprocity §§4.1, 4.3 with both names; IntegralIwasawaTheory §§2.2, 4.1e–4.4; PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5, 4.6; NoncommutativeAndEquivariantIwasawa §4.3 (elliptic units and Rubin's theorem for a CM curve over ℚ, p split, as the Scope says); both downstream consumers. 62 citations, none missing.
- **Pinned declarations checked (18):** `Module.length_le_of_surjective`, `Module.length_eq_finrank`, `IsLocalRing.length_restrictScalars`, `Polynomial.cyclotomic_prime_pow_mul_X_pow_sub_one`, `Ideal.span_singleton_mul_left_unit`, `IsGalois.normalBasis`, the four `TauCeti.Iwasawa` characteristic-ideal theorems with their hypotheses, `SelmerStructure` with `localization`, `selmerGroup`, `mem_selmerGroup_iff`, `WeierstrassCurve.kummerSelmerMap_injective`, `fg_point_of_numberField`, and the pinned Hecke-character files the docstring mentions. The rest were verified in round 1 and are unchanged.
- **Locators verified against the cached texts (21):** BKO21 §6 opening, §§6.0.1–6.0.2, Theorems 6.1–6.2, footnote 3 (lines 802–893); AHII05 §2 definitions, §3 opening, Remark 3.2, Propositions 3.3–3.4, (3.2), Conjecture 3.5, Theorem 3.6 with (3.3), Theorems 4.1–4.3 with (4.1)–(4.4); AHI06 Lemma 1.1.9; RUB91 §4 opening and Theorem 4.1; BIL86 introduction, Lemma 3.6, Proposition 3.8, the Leopoldt hypothesis, Theorems 3.23–3.24 and the closing remark.
- **Gaps:** six, each with the same slug, supplier and section in `design/plan.json` and under the supplier's subsection of the README, one precise statement each; none asks for what its supplier, an earlier roadmap or the pins state.
- **Ownership against open work:** checked with the listed heads and main; no second owner of the signed Selmer groups, Rubin's L-function, the main conjecture or the rank bounds; `Suggested.lean` declares no name.
- **Policy:** the pull request changes only the package folder; no pull-request number, process narrative, `lemma` declaration or machine path in the README or the Lean file; every target has a locator.

Source independence: 14 passages compared with 5 sources (BKO21 lines 802–893 against the Conventions and §§1.1, 1.4, 2.1–2.5, 4.6, 6.4; AHII05 lines 95–299 against §§1.5, 3.1, 3.4, 4.1–4.5; AHI06 Lemma 1.1.9 against §3.4; RUB91 §4 and Theorem 4.1 against the gap contract; BIL86 Theorems 3.23–3.24 against §4.3), none shared beyond formula-forced phrases of under ten words; largest share BKO21, 32 of 90 locators (AHII05 31); contents compared with BKO21 (§§2, 3, 6.0.1–6.0.3) and AHII05 (§§2–5): independent — Layers 0, 2 and 6 have no counterpart in AHII05, its §§3–4 are split between Layers 3 and 4, BKO21 §6 places the L-function before the Selmer groups, and the remaining order is forced by the *Needs:* lines of §§3.3, 4.1, 4.4, 5.3 and 6.3. BRU67 was not read (waived).

## Not verifiable

- BRU67 (waived): the attribution of Leopoldt for abelian extensions of an imaginary quadratic field to pp.121–124.
- Overlines in BKO21 §6.0.1 are lost in the extraction (BKO21 lines 825–841); the README's two formulas were checked against each other and against NonordinaryCMSpecialValues §2.8.
- Rubin's remark behind condition (*) was read only as EulerSystemsAndKolyvaginSystems §8.11 restates it; that source is not in this roadmap's cache.
- The proofs behind §§3.5 and 4.3 (the passage from Rubin's and Billot's statements to the φ-component over Λ_R) beyond their inputs and the lattice models.
- No Lean was elaborated: the file has no declaration.

## Source issues

- **Misprint** in BKO21 at §6.0.2, printed page 962 (BKO21 line 864): the source says the characters defining the signed formal points factor through the Galois group of Ψ_n over Ψ; it should be over Φ; affects nothing.
- **Error** in BKO21 at §6.0.2, printed page 962 (BKO21 lines 878–879): the source says its sign convention is opposite to Agboola–Howard's when quoting their torsion theorem; it should say only the character-set labels differ, the signed Selmer labels agreeing; affects nothing.
- **Gap** in BKO21 at Theorem 6.1, printed page 962 (BKO21 lines 833–837, 881): the source says the L-function lies in the algebra with coefficients O while the Selmer dual is a module over a larger R; it should use R⟦G⁻⟧ or the norm of the generator; affects a stated result.
- **Misprint** in AHII05 at the proof of Theorem 4.2, printed page 617 (AHII05 line 269): the source says the quotient of the whole local module by S_ε is torsion; it should be the quotient of the signed submodule of sign ε; affects nothing.
- **Error** in AHII05 at the proof of Theorem 4.1, printed page 616 (AHII05 line 245): the source cites a Lemma 2.1.2 of the first paper for the symmetry; it should be Lemma 1.2.1 there; affects the proof.
- **Misprint** in BIL86 at the introduction, printed page 342 (BIL86 lines 56, 65): the source says the pseudo-isomorphism and the series equality are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24; affects nothing.

## For the human reviewers

- **Scope.** `gap:inert-two-variable-main-conjecture` asks NonordinaryCMSpecialValues §§2.2–2.3 for Rubin's two-variable theorem at a non-split prime (RUB91 Theorem 4.1(ii)), proved in RUB91 §§5–10; the supplier's sections state units and zeta elements only.
- **Wording.** The routes of §4.2 (`README.md:561`) and §4.4 (`README.md:598`) have the same steps in the same order as AHII05 lines 222–231 and 265–280, in different words.
- **Licence.** BKO21 is read from a repository copy of the published PDF carrying JSTOR download stamps and a terms line (BKO21 lines 813–815); `sources.toml` classes it `institutional`.
- **Not tested.** BRU67 is waived; the Ax–Brumer attribution in the References rests on the locator alone.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b91cf69493a9cfadfeeac4a531b7931da28abaef", "job": "RT-InertAnticyclotomicCMMainConjecture~2b", "model": "fable", "worker": "chris-x79"} -->
