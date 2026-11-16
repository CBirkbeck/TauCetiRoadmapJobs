<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6905662816 -->
Red team round 2 pass a (claude) of b91cf69

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §4.2's route follows the proof of AHII05 Theorem 3.6 clause by clause

   **Location.** `packages/InertAnticyclotomicCMMainConjecture/README.md:561`: "If S_(−ε) also had rank one then S_+∩S_− would have rank one, and it lies in S_str because ℋ^+∩ℋ^−=0 (§3.3); then S_rel/S_str would be torsion and inject into the torsion-free ℋ, forcing S_rel=S_str".

   **Claim.** `README.md:848`: "Statements and proof routes are written in this roadmap's own words."

   **Witness.** AHII05 lines 222–231. The route's six clauses are the source's six steps in the same order: rank of S_ε from C; assume rank one for S_(−ε); intersection in S_str; torsion quotient into ℋ; S_rel=S_str contradicts nonzero localisation; rank zero gives vanishing. Longest shared run of words is 2; the match is of clause order, 6 of 6. The argument is not forced: the direct proof below has no contradiction step and gives S_ε=S_rel first.

   Round 1 pass b listed this for the human reviewers and pass a counted it as forced. The brief classes clause-by-clause following as a finding, and a different proof exists, so it is raised here.

   **Repair.** Replace the route paragraph of §4.2 by:

   > A route is as follows. The kernel of localisation on S_rel is S_str, so S_rel/S_str embeds in ℋ, which is torsion-free (§3.3). The image contains loc(C)≠0, so it has rank one, as does S_rel (§3.4); hence S_str has rank zero and vanishes in the torsion-free S_rel, and localisation is injective on S_rel. Since C has rank one, S_rel/C is torsion: every x∈S_rel has a nonzero multiple λx in C, whose localisation lies in ℋ^ε. The image of loc(x) in ℋ/ℋ^ε is then killed by λ, and ℋ/ℋ^ε is free (§3.3), so loc(x)∈ℋ^ε and S_ε=S_rel, of rank one. A class of S_(−ε) lies in S_rel=S_ε, so its localisation lies in ℋ^ε∩ℋ^(−ε)=0 and the class lies in S_str=0. The ranks of X_s follow from the first sequence of §4.1: for s=ε it contains ℋ/ℋ^ε inside X_ε with torsion quotient X_str, and for s=−ε it gives rank 1−1+0=0.

   Tested on the model of §4.4 (ℋ^ε=Λ_R, S_rel=(T), C=(T²)): loc is injective, S_rel/C=Λ_R/(T) is torsion, every class localises into ℋ^ε, so S_ε=S_rel and S_(−ε)=S_str=0, as stated. The second and third Checks of §4.2 stay valid; in the first Check replace "if S_str had rank one" by "if localisation vanished on a rank-one submodule".

2. **F02** (P3) a bare H still names the local Iwasawa module

   **Location.** `README.md:676`: "that conjecture is the integral splitting H=ℋ⁺⊕ℋ⁻ of §3.3".

   **Claim.** H is the Hilbert class field (`README.md:27`); the local module is ℋ.

   **Witness.** The round-1 repair report says "H stays the Hilbert class field"; here H is set equal to a rank-two Λ_R-module. It is the only such occurrence (searched for H followed by =, /, ^ or a sign).

   **Repair.** Write "the integral splitting ℋ=ℋ⁺⊕ℋ⁻ of §3.3".

3. **F03** (P3) §3.4 states that X_rel has rank one over Λ_R and its route does not derive it

   **Location.** `README.md:497`: "X_rel has rank one and X_str is a finitely generated torsion Λ_R-module"; route at `README.md:499`.

   **Claim.** The indicated route proves each assertion of the statement.

   **Witness.** The route derives the ranks of C and S_rel, torsion of X_str, and the rank of the two-variable relaxed dual ("has rank 2−1=1"). For X_rel over Λ_R it says only that the two-variable specialisation "is compared with X_rel", which gives no rank (the Check at `README.md:507` shows specialisation does not control rank). §§4.2 and 4.3 use rank one of X_rel.

   **Repair.** Insert after "The rank of S_rel is then one.":

   > X_rel has rank one: in the strict–relaxed sequence 0→S_str→S_rel→ℋ→X_rel→X_str→0 over Λ_R, the limit of the finite-level sequences of SelmerIwasawaCohomology §2.19, ℋ has rank two (§3.3), the image of S_rel has rank one, being nonzero in the torsion-free ℋ and a quotient of the rank-one S_rel, and X_str is torsion; so the rank is 2−1+0=1.

   Tested: ranks 0 (S_str), 1, 2, then X_rel = 2−1+0 = 1; the sequence is §2.19 directly, so §4.1 is not needed and no forward reference arises. Both §2.19 and §3.3 are already in the *Needs:* of §3.4.

4. **F04** (P3) §5.2 lists a *Needs:* edge its route does not use

   **Location.** `README.md:687`: "*Needs:* §5.1; §1.1; §3.3; SelmerIwasawaCohomology §3.11; ArithmeticGaloisDuality §R02.2.2".

   **Claim.** `README.md:123`: "Each *Needs:* line lists what its statement and its indicated route use".

   **Witness.** The route of §5.2 gets injectivity from "Inflation–restriction" (ArithmeticGaloisDuality §R02.2.2) and H⁰(Ψ∞,W)=0, and the rest from coranks and Weierstrass division. SelmerIwasawaCohomology §3.11, global restriction control with localisation errors, is not used; §5.2 is local at 𝔭.

   **Repair.** Delete "SelmerIwasawaCohomology §3.11; " from the *Needs:* of §5.2. The Layer 5 Dependencies keep §3.11, which §§5.3 and 5.6 use.

5. **F05** (P3) Hyp(K∞,V) is cited from a section that introduces it for admissible towers only

   **Location.** `README.md:499`: "The hypothesis Hyp(K∞,V) of §8.2 holds with τ=1, because V=T′⊗_R L is one-dimensional over L. K∞/K is not admissible in the sense of §8.1".

   **Claim.** EulerSystemsAndKolyvaginSystems §8.2 defines Hyp(K∞,V) for the anticyclotomic tower.

   **Witness.** At the supplier's head §8.2 begins "Let `K∞/K` be admissible", and the next sentence of the README says K∞/K is not. The record itself (an element τ of G_(K∞), a dimension and irreducibility) does not use admissibility, and §8.11 keeps §8.25's other hypotheses.

   **Repair.** Write: "The record Hyp(K∞,V) of §8.2, whose two clauses do not involve the admissibility under which that section introduces it, holds with τ=1: τ=1 fixes μ_(p^∞), (O_K^×)^(1/p^∞) and K(1), V/(τ−1)V=V is one-dimensional over L, and a one-dimensional V is irreducible over G_(K∞)."

One P2 finding (S01, a proof route that follows a source's proof clause by clause) and four P3 findings (S02–S05). No statement of the README was found false. `Suggested.lean` declares nothing, so there is no Lean signature to refute. All ten round-1 findings are repaired except one leftover symbol from the renaming of 1a/F03 (S02).

## Round-1 findings at this head

| Round-1 finding | Status | Witness at b91cf69 |
|---|---|---|
| 1a/F01 (P1), 1b/F02 (P2): Wiles reciprocity cited beyond AnticyclotomicLocalUnits §4.3 | repaired | `README.md:364` "AnticyclotomicLocalUnits §4.3 in the form requested as gap:wiles-reciprocity-every-local-unit, since that section states it only for its own projected class"; contract at `README.md:69`; slug in `design/plan.json` with supplier AnticyclotomicLocalUnits, §4.3; cited in the *Needs:* of §§2.2, 3.3, 4.5 and in the Dependencies of Layers 2–4. The supplier's §4.3 still begins "For the projected class", so the gap is needed. The contract's two formulas agree with the supplier's §1.3 definition δ_χ(x)=π^(−n−1)Σχ(g)·gδ_n(x). |
| 1b/F01 (P2): weak Leopoldt over the ℤ_p²-extension does not descend | repaired | `README.md:499` "Torsion of X_str follows from weak Leopoldt (EulerSystemsAndKolyvaginSystems §8.25) for the Euler system of §3.1 on the anticyclotomic tower K∞ itself"; Check at `README.md:507`. Each step of the new route was recomputed (table below); no new error found. One conclusion of the statement is not derived by the new route (S03) and one supplier hypothesis is applied outside its stated setting (S05). |
| 1a/F02, 1b/F03 (P3): `NCM.k/<slug>` ids | repaired | 0 occurrences of "NCM." in the README; the eleven replacement sections exist at the supplier's head with the cited content (§§0.4, 1.4, 1.5, 2.4, 2.7, 2.8, 2.10, 3.3, 3.4, 3.5, 6.4 read). |
| 1a/F03 (P3): F and H each name two objects | partly repaired | §3.2 uses M; ℋ is used from §1.5 on; `Suggested.lean:26` reads char(ℋ^ε/loc C). One bare H remains for the local module: `README.md:676` (S02). |
| 1a/F04 (P3): twist equated with Agboola–Howard's | repaired | `README.md:443` "AHII05 §3, p.614, twists instead by the inverse cyclotomic character times the avatar … the two lattices are identified only conjugate-linearly". At Frob of (−1+2i): ψ_p gives α, φ_p⁻¹χ_cyc gives 5/α=ᾱ. |
| 1a/F05 (P3): unused *Needs:* edges, Scope list | repaired | §3.4 no longer lists PadicMeasuresIwasawaAlgebras §4.6; §4.1 no longer lists SelmerIwasawaCohomology §3.11; §4.3 no longer lists §4.1; §6.2 no longer lists §5.4; `README.md:21` lists "3.10–3.12 and 3.16". A further edge of the same kind, not raised in round 1, is S04. |
| 1a/F06, 1b/F04 (P3): §5.2 assumed E over K | repaired | `README.md:676` "For every inert CM datum, s∈{+,−} and n≥0"; `README.md:647` "Sections 5.1, 5.2 and 5.5 need no such hypothesis". |

No finding was marked `not actionable in this package`, so nothing is re-raised.

## The pass: statements, instances and computed values

`Suggested.lean` has 0 declarations (docstring and empty namespace), so the declaration table is empty. README targets, 36 subsections:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions: units inject modulo gpⁿ | u=−1, i, ω, −ω | N(u−1)=4, 2, 3, 1, all <p²; p∣(u−1) would give p²∣N | holds |
| Conventions: f≠(1) | f=(1) | α=φ((α))=φ((−α))=−α | contradiction, as stated |
| Conventions: sign table | χ=1, order 5, order 25 | c=0, 2, 3; signs +, +, −; equal to the supplier's table | agrees |
| Conventions: standing hypotheses against the source | BKO21 lines 802–809 | p inert, p∤h_K (6.1), Gross Q-curve over H, good reduction above p | same generality |
| §0.1 Checks | K=ℚ(√−23), p=5 | −23≡2, nonsquare mod 5; h=3; (X+5)², trace −10 | holds |
| §0.2 completion of K̃∞ | idele p at 𝔭 | equals p⁻¹ away from 𝔭, a unit at finite v∤p; −1 has trivial pro-p image; so π=−p is a norm | Θ∞ inside the tower of π |
| §0.4 Check 1 | R=O[√π] | different (2√π)=(√π); quotient of order p² | holds |
| §0.5 iff | x=a₊v₊+a₋v₋, s=+ | δ_χ(x)=a₋(χ⁻¹)δ_χ(v₋) on Ξ⁻; infinitely many zeros force a₋=0 | both directions |
| §1.1 base layer | n=0 | A_0⁺={λ_1=0}=0, A_0⁻=F(Φ); ω_0⁺=1 kills 0, ω_0⁻=γ−1 kills F(Φ) | consistent with §5.1 |
| §1.2 last Check | p=5, β³=aπ, K=ℚ(√−2) | −2≡3 nonsquare mod 5; c(aπ)/(aπ)=a⁴ of order 6, not in μ_8; cube root of order 18∤24 | no extension of c |
| §1.3 | good v | invariants of W(−1): Frobenius acts by α/q; H¹_ur=W/(α−1)W=0 | nonzero iff α≡q |
| §1.4 divisible part | lift x̃ of divisible x | failure in a quotient of H¹(Ψ_n,T)/(L_T+loc H¹(G_S,T)), finitely generated over R; image of a divisible group there is 0 | holds |
| §1.5 Check 1 | L=Φ(ζ₅), x=(ζ−ζ²)/25 | Tr(ζ)=Tr(ζ²)=−2, f(x)=0; f(γ⁻¹x)=Tr((1−ζ)/25)=10/25=2/5 | holds |
| §2.2 | χ=1, p=5 | 1−(−5)/25=6/5; factors at primes of f equal 1 (φ̄χ ramified) | agrees with supplier §4.4 |
| §2.3 | ε=+, order p and p² | (−1)²=+1, (−1)³=−1; AHII05 line 157 with n=r | ξ∈V_R^ε |
| §2.5 | apply δ_(χ⁻¹) to ξ=L_p v | L_p(χ)δ_(χ⁻¹)(v)=L(φ̄χ⁻¹,1)/Ω; BKO21 line 841 has δ_(χ⁻¹)(v_ε) in the denominator | agrees |
| §3.1 twist | 𝔮=(α), α=−1+2i | (1−Frob⁻¹)z⊗t=(1−φ(𝔮)⁻¹Frob⁻¹)(z⊗t); 1−ᾱ/5=(6+2i)/5; α−1=i(2+2i) | Euler factor of T′ |
| §3.1 Euler system indexing | F⊂F′ with least moduli m∣m′ | new primes of m′ are prime to 6pa and to f, ramify in F′ and not in F; primes already in m give factor 1 (case 𝔮∣g of the gap) | relations of §2.2 of the supplier |
| §3.2 | M=H, K₀; K=ℚ(√−23), p=5 | #G=3, 72; places above 𝔭: 3 with local degree 1, or local degree 24; coinvariants one copy | holds |
| §3.3 | a=O_K; a=(α) | d_a=0; d_a(1)=5−α=6−2i, norm 40; |N(a)|≠√N(a) for N(a)>1 | loc(c_a)≠0 for a≠O_K |
| §3.3 label | points of sign s live on Ξ^(−s) | annihilator = units vanishing on Ξ^(−s) = V∞*,s (supplier §3.6) | ℋ^s↔V_R^s |
| §3.4 non-admissibility | 𝔮=(1+i), 3O_K in ℚ(i), p=7 | Frob=Frob⁻¹ in torsion-free Γ⁻, so trivial; norms 2, 9 not roots of unity in ℤ_7 | split in K∞, not in K̃∞ |
| §3.4 condition (*) | 𝔮∣f with T′ ramified | modulus fgp^m has two prime divisors, units; Kummer class of a unit dies on inertia at 𝔮∤p; double cosets preserve this; limit over k exact (finite H⁰) | (*) holds as H¹_ur of supplier §8.11 |
| §3.4 X∞=X_str | v∤p | H¹_f(W)=image of H¹(V_T)=0 | Rubin's strict-at-p Selmer group is Sel_str |
| §3.4 unramified outside S | w∉S | H¹(I_w,T′)^Frob=(T′(−1))^Frob=T_0^Frob, Frobenius of absolute value q^(−1/2)≠1 | zero |
| §3.4 X_rel over Λ_R | strict–relaxed sequence | 2−1+0=1 | true; not in the route (S03) |
| §3.4 last Check | M=Λ_(2)/(γ⁺−1) | torsion; M/(γ⁺−1)M=Λ_R | holds |
| §3.5 | RUB91 lines 486–489, 545–551 | p∤#μ(H), H⊆K₀, p∤[K₀:K]; divisibility; equality on χ nontrivial on D_p; κ⁻¹ω=κ^p nontrivial mod p | gap matches the source |
| §4.1 | n=0, s=+ | local terms 0 and H¹(Φ,T′) of rank 2 | holds |
| §4.2 | model of §4.4 | S_ε=S_rel=(T), S_str=0; ranks of X_ε, X_(−ε): 1, 0 | holds; route is S01 |
| §4.3 coprimality | M_P≅free^r⊕⊕Λ_P/P^k at P=(γ⁺−1) | rank of M/PM = r + number of P-primary factors; equals 1 iff none | deduction valid |
| §4.3 Billot | BIL86 lines 284–289, 380, 618–621 | K⊆F, p inert, good reduction, E[p] rational; Leopoldt for all intermediate fields; involution in the series | hypotheses as stated |
| §4.4 | ℋ^ε=Λ_R, S_ε=(T), C=(T²), char X_str=(T) | (T)(T)=(T²) | holds |
| §4.5 | α≡1 mod 6f, α≡2 mod p | α(ᾱ−1)≡2·1=2, unit for p≥5; loc(C)=(d_a)_a·ξ=Λ_Rξ | (L_p) |
| §5.1 | p=5, n=0,1,2 | ω_0⁺=1, ω_0⁻=γ−1; ω_2⁺=Φ_25, ω_2⁻=(γ−1)Φ_5; degrees 20+5=25 | holds |
| §5.2 | n=2; AHII05 lines 318–321 | coranks 20, 5 on both sides; injective map of cofree modules of equal corank is onto | isomorphism; the source claims only a finite cokernel |
| §5.3 | v∣f | kernel a quotient of W^(I_v), proper in L/R, finite | holds |
| §5.4 | n=0, 1, 2 | Λ_R/(ω⁺,ω⁻) is 0, 0, finite nonzero | holds |
| §5.5 | A/𝔪^k; κ² | 1≤k; 2=2 | holds |
| §5.6, §6.1 | X=Λ_R/(g²); (fg)⊆(f) | dimension 1≤2; containment | holds |
| §6.2 | n=0, χ=1 | E(Φ)⊗Φ one-dimensional over Φ | holds |
| §6.3–6.4 | ε=+: χ=1, order 5, order 25 | bounds ord, ord, ord+1; BKO21 lines 888–893; E(K_n)⊗ℚ_p=E(K_n)⊗_(O_K)Φ as p is inert | agrees |
| Gap wiles-reciprocity | supplier §1.3 | Σχ(g)·g(π^(−n−1)δ_n(x))=δ_χ(x) | the two clauses of the contract agree |
| Gap elliptic-unit-euler-system | 𝔮∤g, 𝔮∣g | exponents 1−Frob_𝔮⁻¹ and 1; a prime to 6pg and 𝔮∤a makes _az of modulus g𝔮pⁿ defined | precise |

## Dependency check

    depcheck: 241 roadmaps, 2259 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `merge-order/ORDER.txt` lists NonordinaryCMSpecialValues (345), AnticyclotomicLocalUnits (347) and this roadmap (348).

## Verified sound

- **Suggested.lean.** 42 lines read; 0 declarations; single `import Mathlib`; no `set_option`; module docstring of the required form naming four headline theorems (§§4.6, 4.2, 4.4, 6.4) and the missing carriers. None is statable at the pins: the signed Kummer conditions, V∞*, δ_χ, the elliptic-unit class and the CM avatar have no pinned carrier. The algebraic facts of §§5.1 and 5.5 are statable but are not headlines and would be padding. No Lean was elaborated: the `#check` comparison has no case.
- **Headline theorems:** main conjecture §4.6; opposite signed torsion §4.2; characteristic formula §4.4; rank bounds §6.4. All four are named in the docstring; none is forced through a stand-in.
- **Targets read:** 36 of 36 subsections, all 855 lines. **Checks:** every Check read; 45 recomputed (table); none false or vacuous; each definition (§§0.1, 1.1, 1.4, 1.5, 2.1, 2.4, 3.1, 5.1) has at least three.
- **Locators verified against the cached texts, 27:** BKO21 standing hypotheses p.960, §6.0.1 p.961, §6.0.2 pp.961–962, Theorems 6.1–6.2 pp.962–963, footnote 3; AHII05 Proposition 3.1, (3.1), Remark 3.2 p.614, Propositions 3.3–3.4 p.615, Theorem 3.6 and (3.3) p.616, Theorems 4.1–4.3 and (4.1)–(4.4) pp.616–617, §5 definitions and (5.1), Lemma 5.1 p.618, Theorem 5.2 pp.619–620, Proposition 5.3 p.620; RUB91 §4 p.36, Theorem 4.1(ii) and Remark (2) p.37; BIL86 §3 hypotheses p.350, Remark 3.3 p.351, Lemma 3.6, Proposition 3.8 and the Leopoldt hypothesis p.353, Theorem 3.24 p.364.
- **Sibling citations checked at the current heads or on main, 62 sections:** AnticyclotomicLocalUnits §§0.1, 0.5, 1.2–1.5, 2.4, 3.1, 3.2, 3.6, 4.2–4.4, 8.2, 8.4, 8.5 (content read for §§0.5, 1.2–1.5, 2.4, 3.2, 3.6, 4.1–4.4, 8.4, 8.5); NonordinaryCMSpecialValues §§0.4, 1.4, 1.5, 2.1–2.4, 2.6–2.10, 3.3–3.5, 6.4 (content read for §§2.2, 2.3, 2.6–2.10); EulerSystemsAndKolyvaginSystems §§2.2, 8.1, 8.2, 8.11, 8.25 (all read); SelmerIwasawaCohomology, 17 headings; ArithmeticGaloisDuality, 7 headings; ComplexMultiplicationAndExplicitReciprocity §§4.1, 4.3 and both names; NoncommutativeAndEquivariantIwasawa §4.3 (the elliptic-unit construction and Rubin's theorem there are for a CM curve over ℚ at an ordinary prime, as the README says); IntegralIwasawaTheory §§2.2, 4.1e–4.4; PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5, 4.6; LubinTateFormalModulesAndQuasiCanonicalLifts §§2.4, 2.5, 8.2, 8.3.
- **Pinned declarations:** 24 re-checked at the pins in the files the README names (`Module.length_le_of_surjective`, `Module.length_eq_finrank`, `IsLocalRing.length_restrictScalars`, `Polynomial.cyclotomic_prime_pow_mul_X_pow_sub_one`, `Ideal.span_singleton_mul_left_unit`, `IsGalois.normalBasis`, `TauCeti.Iwasawa.charDivisor`, `charIdeal`, `charIdeal_eq_mul_of_exact`, `IsPseudoIsomorphism.charIdeal_eq`, `LinearEquiv.charIdeal_eq_comap`, `charIdeal_quotient_span_singleton`, `TauCeti.PowerSeries.isRegularLocalRing`, `ringKrullDim_of_isDiscreteValuationRing`, `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` with its hypothesis ringKrullDim ≤ 2, `SelmerStructure` with `localization`, `selmerGroup`, `mem_selmerGroup_iff`, `WeierstrassCurve.selmerStructure`, `selmerGroup`, `kummerSelmerMap`, `kummerSelmerMap_injective`, `fg_point_of_numberField`, `completedGroupAlgebra`, `completedGroupAlgebraModule`).
- **Declared gaps:** 6 of 6 have the same slug in `design/plan.json` and under `## Exact supplier contracts`, a named supplier and section, and one precise statement. None asks for what is provided: the supplier's §4.3 is for the projected class only; its §2.2 has norm compatibility in the p-tower only; BIL86 lines 50–54 say Leopoldt is superfluous only for the pseudo-isomorphism, not for Theorem 3.24.
- **Ownership against open work:** `scratch/overlaps.md` lists no second copy, no dropped id and no competing revision. A search of the open heads and main for the BKO21 theorems finds only ModularIwasawaMainConjecturesPartII, which names this roadmap as the owner. No fully qualified Lean name is declared.
- **Policy:** the pull request changes only `packages/InertAnticyclotomicCMMainConjecture/`; no pull-request number, process narrative or machine path in the README or the Lean file; "lemma" occurs only in source locators; every target has a locator.

Source independence: 14 passages compared with 4 sources (BKO21 §6 standing hypotheses, §6.0.1, §6.0.2, Theorems 6.1–6.2; AHII05 Propositions 3.1 and 3.3 with proofs, Theorem 3.6 with proof, Theorems 4.1–4.2 with proofs, §5 definitions, Lemma 5.1, Theorem 5.2 and Proposition 5.3 with proofs; RUB91 §4 and Theorem 4.1; BIL86 §3 hypotheses and Theorem 3.24), one following its source clause by clause (S01), none sharing a run of more than 4 words; largest share BKO21, 31 of 82 locators (AHII05 30); contents compared with BKO21 (§§2, 3, 6.0.1–6.0.3) and AHII05 (§§2–5): independent — Layers 0, 2 and 6 have no counterpart in AHII05, its §3 is divided between Layers 3 and 4, BKO21 §6 puts the L-function before the Selmer groups while Layer 1 precedes Layer 2 here, and the remaining order is forced by the *Needs:* lines of §§3.3, 4.1, 4.4, 5.3 and 6.3. AHI06 was not reopened in this pass; BRU67 was not read (waived).

## Not verifiable

- BRU67 (waived): the attribution of Leopoldt for abelian extensions of an imaginary quadratic field to pp.121–124 rests on the locator.
- Overlines are lost in the extraction of BKO21 (lines 825–841), so which of φ̄χ and the conjugate of φχ is printed could not be read; the README's formulas are consistent with each other and with the suppliers.
- Rubin's remark behind condition (*) is read only through EulerSystemsAndKolyvaginSystems §8.11; the source text is not in the cache. Here (*) holds in the strong form computed in the table, and for T′ it is also automatic, since H¹(F_𝔮,T′⊗L)=0 at 𝔮∤p makes every local class finite.
- The passages from Rubin's and Billot's theorems to the φ-component over Λ_R (§§3.5, 4.3) are routes; their inputs and the resulting ideals in the lattice models were checked, not the proofs.
- AHI06 locators (Lemmas 1.1.4, 1.1.9, 1.2.1, 2.4.5, Corollary 2.4.6, Propositions 2.4.15–2.4.16) were verified in round 1 and not reopened.
- No Lean was elaborated.

## Source issues

- **Misprint** in BKO21 at §6.0.2, printed page 962 (BKO21 line 864): the source says the characters defining the signed formal points factor through the Galois group of Ψ_n over Ψ; it should be over Φ; affects nothing.
- **Error** in BKO21 at §6.0.2, printed page 962 (BKO21 lines 878–879): the source says its sign convention is opposite to Agboola–Howard's when quoting their torsion theorem; it should say only the character-set labels differ, the labels of the signed Selmer groups agreeing; affects nothing.
- **Gap** in BKO21 at Theorem 6.1, printed page 962 (BKO21 lines 833–837, 881): the source says the characteristic ideal is over Λ with coefficients O and the L-function lies in Λ, for a Selmer dual over a larger ring R; it should use R⟦Γ⁻⟧, or the norm of the generator; affects a stated result.
- **Misprint** in AHII05 at the proof of Proposition 5.3, printed page 620 (AHII05 line 397): the source says the product of the two signed elements is γ to the power p^k minus one; it should be γ^(pⁿ)−1; affects nothing.
- **Misprint** in AHII05 at the proof of Theorem 4.2, printed page 617 (AHII05 line 269): the source says the quotient of the whole local module by S_ε is torsion; it should be the quotient of the signed submodule of sign ε; affects nothing.
- **Error** in AHII05 at the proof of Theorem 4.1, printed page 616 (AHII05 line 245): the source cites a Lemma 2.1.2 of the companion paper for the symmetry; it should be Lemma 1.2.1 there; affects the proof.
- **Misprint** in BIL86 at the introduction, printed page 342 (BIL86 lines 56, 65): the source says the pseudo-isomorphism and the series equality are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24; affects nothing.

## For the human reviewers

- **Scope.** `gap:inert-two-variable-main-conjecture` asks NonordinaryCMSpecialValues §§2.2–2.3 for RUB91 Theorem 4.1(ii), whose proof the source places in its §§5–10 (RUB91 lines 552–555).
- **Scope.** The source's proof of the headline is a reference to AHII05 "by a similar argument" for h_K>1 (BKO21 lines 883–886); Layers 3–4 write that argument out.
- **Licence.** The cached BKO21 copy, classed `institutional` in `sources.toml`, carries JSTOR download stamps and a terms line on each page (BKO21 lines 813–815, 855–857).
- **Wording.** The route of §4.4 (`README.md:598`) uses the same two exact sequences, in the same order, as AHII05 lines 265–280; I counted this as forced by the statement, unlike §4.2 (S01).
- **Not tested.** BRU67 is waived and was not read; the Ax–Brumer attribution at `README.md:855` rests on the locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b91cf69493a9cfadfeeac4a531b7931da28abaef", "job": "RT-InertAnticyclotomicCMMainConjecture~2a", "model": "fable", "worker": "chris-x55"} -->
