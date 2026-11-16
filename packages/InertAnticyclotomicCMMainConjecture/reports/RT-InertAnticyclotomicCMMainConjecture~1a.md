<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6904620269 -->
Red team round 1 pass a (claude) of b0292e7

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Wiles reciprocity is cited from AnticyclotomicLocalUnits §4.3 at a generality that section does not state

   **Location.** `packages/InertAnticyclotomicCMMainConjecture/README.md:360`: "Wiles reciprocity in dual-exponential form (AnticyclotomicLocalUnits §4.3, stated for every element of U∞*⊗_O R)". Used again at `README.md:480` (§3.3, for y_a, the image of loc(c_a)) and `README.md:606` (§4.5).

   **Claim.** That the supplier states, for an arbitrary element x of U∞*⊗_O R and an arbitrary inert CM datum, that the χ-weighted semilocal sum of dual exponentials of x equals δ_χ(x)·ω.

   **Witness.** AnticyclotomicLocalUnits §4.3 at its open head begins "For the projected class x∈U∞*⊗_O R" and has *Needs:* §4.2; §4.2's class is ξ_ν for the auxiliary field of §4.1 (2 split, W(φ)=+1, ν an l-power character). No sentence of §4.3 quantifies over every element or every datum.

   **Why it blocks.** Three targets rest on the general form: §2.2 (the ν=1 class of an arbitrary Gross datum, e.g. K=ℚ(√−23), which is not the datum of AnticyclotomicLocalUnits §4.1), §3.3 (δ_χ(y_a)=c·d_a(χ⁻¹)·δ_χ(ξ) for the classes y_a, which are not projected classes of §4.2 at all but images under the duality isomorphism H≃V_R), and §4.5. With the supplier as written, the step "δ_χ of the image of a class of H equals its dual-exponential sum" has no owner.

   **Repair.** Declare it as a supplier gap (the statement is local and the supplier's proof route is already local).

   1. In `README.md:360` replace the parenthesis by: "(AnticyclotomicLocalUnits §4.3, in the form for an arbitrary element requested below, gap:wiles-reciprocity-every-local-unit)". In §3.3 and §4.5 replace "explicit reciprocity (AnticyclotomicLocalUnits §4.3; …)" by "explicit reciprocity (AnticyclotomicLocalUnits §4.3, gap:wiles-reciprocity-every-local-unit; …)", and add the gap slug to the *Needs:* lines of §§2.2, 3.3, 4.5 and to the Dependencies paragraphs of Layers 2–4.
   2. Under `### From TauCetiRoadmap.AnticyclotomicLocalUnits` add: "What AnticyclotomicLocalUnits must provide (gap:wiles-reciprocity-every-local-unit): For every finite extension L/Φ with ring of integers R, every x∈U∞*⊗_O R, every n≥0 and every finite character χ of Gal(Φ_n/Φ) with values in L, the image of x in H¹(Φ_n,Hom_O(T_πF,O)(1))⊗_O R under the Kummer comparison of §4.2 has dual exponential π^(−n−1)δ_n(x)·ω_F, and the χ-weighted sum of its Gal(Φ_n/Φ)-conjugates is δ_χ(x)·ω_F, where ω_F is the invariant differential of F with λ′(0)=1; this is §4.3 with the projected class of §4.2 replaced by an arbitrary element and with no global datum."
   3. Add to the top-level `gaps` of `design/plan.json`: slug `wiles-reciprocity-every-local-unit`, supplier `AnticyclotomicLocalUnits`, section `§4.3`, `needs` = the sentence above.
   4. In §3.3 add one sentence fixing the compatibility that the gap is applied to: "The isomorphism H≃V_R is normalised so that, on the image of U∞*⊗_O R, it is the inverse of the Kummer comparison of AnticyclotomicLocalUnits §4.2; this is the only normalisation under which the gap computes δ_χ(y_a)."

   Test on the refuting instance: for K=ℚ(√−23), p=5 and y_a (not a projected class of the auxiliary datum), the gap's hypothesis "every x∈U∞*⊗_O R" is met, so δ_χ(y_a) is computed; with the present citation it is not.

2. **F02** (P3) `NCM.k/<slug>` identifiers do not exist at the supplier's head

   **Location.** `README.md:20, 29, 71, 144, 158, 192, 214, 354, 368, 382, 429, 489, 525, 615, 637` and others: "NCM.0/cm-period", "NCM.1/normalized-zeta-class", "NCM.2/inert-frobenius", ….

   **Claim.** That these are ids of NonordinaryCMSpecialValues.

   **Witness.** At its open head NonordinaryCMSpecialValues has numbered sections only; its table "Former numbering | Sections here" maps NCM.0–NCM.5 to section ranges (NCM.1 ↦ §§2.7–2.10). No slug after the slash (`cm-period`, `elliptic-reciprocity`, …) occurs anywhere in that README (0 matches).

   **Repair.** Cite the sections, which I matched by content at the supplier's head:

   | Present id | Section at the supplier's head |
   |---|---|
   | NCM.0/cm-period | §0.4 The integral CM period |
   | NCM.0/dual-tate-convention | Conventions (Duals and twists) and §2.4 |
   | NCM.1/normalized-zeta-class | §2.7 The normalised class and its integrality |
   | NCM.1/elliptic-reciprocity | §2.8 Direct-character reciprocity at an inert prime |
   | NCM.1/period-change | §2.10 Period changes |
   | NCM.2/inert-frobenius | §3.4 The inert Frobenius is multiplication by −p |
   | NCM.2/semilocal-splitting | §3.3 Splitting of p in the ring class fields |
   | NCM.2/cm-lubin-tate | §3.5 Apply the Honda comparison at π = −p |
   | NCM.3/twisted-root-sign | §1.4 The p-anticyclotomic conductor sign |
   | NCM.3/forced-central-zero | §1.5 Wrong-sign central values vanish |
   | NCM.5/central-nonvanishing | §6.4 Correct-sign central values are almost always nonzero |

   In `design/plan.json` the gap `inert-two-variable-main-conjecture` has `section: "NCM.1"`; the README places the contract in the supplier's subsection without a section. Give both the same locator (the extension is of §§2.2–2.3, the elliptic units and zeta elements, which is what the README's Scope paragraph says).

3. **F03** (P3) The letters F and H each name two objects, once in the same sentence

   **Location.** `README.md:459` "Let F be H or K₀=H(E[p])"; `README.md:472` "For F=K₀ the order h_K(p²−1) contains the tame degree [Φ(F[π]):Φ]=p²−1"; `README.md:303` "Let H=lim_cor H¹((K_n)_𝔭,T′)".

   **Claim.** F is the Lubin–Tate formal module (Conventions, `README.md:31`) and H the Hilbert class field (`README.md:27`).

   **Witness.** In line 472, "F=K₀" and "Φ(F[π])" occur together: read literally the second is the π-torsion of the field K₀. In §3.2–§3.3 "the Gross datum over H" and "H=H⁺⊕H⁻ is free of rank two" are 20 lines apart.

   **Repair.** In §3.2 rename the auxiliary field: "Let M be H or K₀=H(E[p]) and G=Gal(M/K)", and replace F by M in the rest of §3.2 and in its Checks (FK_n ↦ MK_n, "for F=K₀" ↦ "for M=K₀", "F=H" ↦ "M=H"). In §1.5 and everywhere after, write the local Iwasawa modules as 𝓗 and 𝓗^s (the notation of AHII05 §3), keeping H for the Hilbert class field; update the docstring line "char(X_(−ε)) = char(H^ε/loc C)" of `Suggested.lean` to match.

4. **F04** (P3) §3.1 equates its twist with Agboola–Howard's, which is a different character

   **Location.** `README.md:439`: "this is the twist of AHII05 by the inverse cyclotomic character times the avatar."

   **Claim.** The twist of ℤ_p(1) by T_0 (action φ_p⁻¹), landing in T′ (character φ_p⁻¹χ_cyc), is the twist of AHII05.

   **Witness.** AHII05 line 135 twists by ω_cyc⁻¹ψ_p and lands in T=T_p(E), character ψ_p. At Frob of (α), α=−1+2i (the README's own example, `README.md:579`): φ_p⁻¹χ_cyc gives ᾱ, ψ_p gives α; ᾱ≠α.

   **Repair.** Replace the clause by: "AHII05 §3 twists instead by the inverse cyclotomic character times the avatar and lands in T_p(E); for E over ℚ that module is the Cartier dual of W only through the conjugate-linear identification c∘φ_p=φ_p⁻¹χ_cyc of §4.3, and over a general R the twist by T_0 used here is the one that lands in T′."

5. **F05** (P3) *Needs:* edges that neither the statement nor the route uses, and a Scope list that omits a consumed section

   **Location and witness.**

   - `README.md:503` (§3.4): PadicMeasuresIwasawaAlgebras §4.6. The statement is about ranks and torsion; the route names no characteristic ideal, base change or restriction of scalars.
   - `README.md:549` (§4.1): SelmerIwasawaCohomology §3.11 (restriction control). The route uses §2.19, limits (§3.1) and H⁰ vanishing only.
   - `README.md:581` (§4.3): §4.1. Neither sequence of §4.1 occurs in the statement or the route of §4.3.
   - `README.md:781` (§6.2): §5.4. The route uses localisation at 𝔭, the logarithm and the normal basis theorem; §5.4 is not used.
   - `README.md:21` (Scope) lists SelmerIwasawaCohomology "3.0, 3.1, 3.3 and 3.10–3.12", while `README.md:85`, `495`, `503` consume §3.16.

   **Claim refuted.** `README.md:119`: "Each *Needs:* line lists what its statement and its indicated route use".

   **Repair.** Delete the four edges (and PadicMeasuresIwasawaAlgebras §4.6 from the Layer 3 Dependencies paragraph, SelmerIwasawaCohomology §3.11 from Layer 4's only if no other §4.x uses it: none does), or add to each route the sentence that uses the edge. In the Scope list write "3.0, 3.1, 3.3, 3.10–3.12 and 3.16".

6. **F06** (P3) §5.2 carries the hypothesis "E is defined over K", which its statement and route do not use

   **Location.** `README.md:670`: "Assume E is defined over K. For s∈{+,−} and n≥0 the restriction map L_n^s→L_∞^s[ω_n^s] is an isomorphism"; `README.md:641` lists §5.2 among the sections that assume it.

   **Witness.** L_n^s and L_∞^s are defined for every inert CM datum (§1.1), and the route cites only §§1.1, 3.3, 5.1 and Weierstrass division, none of which assumes descent (`README.md:47`: "The main-conjecture statements of Layers 0–4 do not assume this"). Instance: K=ℚ(√−23), p=5, n=2, R any admitted ring: both sides have R-corank 20 (s=+) and 5 (s=−) and the route applies word for word. The source's restriction to E over ℚ (AHII05 Lemma 5.1) is not a hypothesis of the argument.

   **Repair.** Delete "Assume E is defined over K." from §5.2; in the Layer 5 preamble write "The targets of §§5.3–5.4 and 5.6 assume in addition …; Sections 5.1, 5.2 and 5.5 need no such hypothesis." (The integral first sentence of §5.3 is equally independent of descent; only its clause on Sel_s(K_n,V_pE)^χ needs it. Say so there in one clause, or leave §5.3 as it is: this second point is a note, not a finding.)

One blocking finding (R01); five P3 findings (R02–R06). No statement of the README was found false; `Suggested.lean` declares nothing, so there is no Lean signature to refute.

## Adversarial table

Values are those I computed; "ok" follows the values, never replaces them.

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Conventions: p splits completely in H | K=ℚ(√−23), p=5 | forms (1,1,6),(2,±1,3): h=3; −23≡2 mod 5, squares mod 5 are {1,4}: inert; (5) principal ⇒ Artin class trivial | ok |
| Conventions: sign table | χ trivial, order 5, order 25 | c=0,2,3; signs +,+,− ; same as AnticyclotomicLocalUnits Conventions table | ok |
| Conventions: units of modulus gpⁿ inject | u=−1, i, ω, −ω | N(u−1)=4, 2, 3, 1; all <25≤p² | ok |
| §0.1 Check 2 | p=5 | char. poly (X+5)², trace −10; #E(𝔽₂₅)=25+1+10=36 | ok |
| §0.2 degree check | p=5 | [Ψ_1:Φ]=5, [Φ(F[π]):Φ]=24 | ok |
| §0.3 dictionary with AHII05 | their Ξ⁻ = {1}∪{odd k}, Ξ⁺={even k≥2} (AHII05 lines 102–105); E^± killed on Ξ^∓ (line 109) | their Ξ^s ↦ c even/odd: Ξ^(−s) here; their E^s kills Ξ^(−s)_AH = Ξ^s here = A^s | ok, labels of signed objects agree |
| §0.4 different | R=O[√π] | different (2√π)=(√π) since 2 is a unit; R/√πR has p² elements; Tr_(O/ℤ_p)(1)=2 | ok |
| §0.5 iff | x=a_+v_++a_−v_−, s=+, χ∈Ξ⁻ | δ_χ(x)=a_−(χ⁻¹)δ_χ(v_−), δ_χ(v_−)≠0 ⇒ a_− has infinitely many zeros ⇒ a_−=0; converse direct | ok both directions |
| §0.5 Check 3 | R=O[√π], u=1+√π, p=5 | δ(uv_+)=(1+√π)δ(v_+); δ_1=6(1+√π)δ(v_+)/5; supplier §8.4 gives δ(v_+)∈O× | ok |
| §1.1 base layer | n=0 | A_0⁺={λ_1=0}=0 (F(Φ) torsion-free), A_0⁻=F(Φ): L_0⁺=0, corank L_0⁻=1 | ok, agrees with supplier §8.5 Check |
| §1.1 Check 2 | Q generator of F(Φ) | Q⊗π⁻¹≠0; [π]Q⊗π⁻¹=Q⊗1=0 | ok |
| §1.2 last Check | p=5, β³=aπ | quotient of roots cubes to a⁴ (order 6); cube root has order 18; 18∤24 | ok, no extension of c |
| §1.3 | good v, q=Nv | invariants of V_T: α≠1 as abs. value √q; of dual(1): q/α abs. √q; H¹(W) = W(−1)^Frob ≠0 iff α≡q | ok |
| §1.4 propagation | divisible class x, lift x̃ | failure lies in f.g. R-module modulo image of H¹(G_S,T); divisible group maps to 0 | ok |
| §1.4 inclusions | n=0 | Sel_+=Sel_str, Sel_−=Sel (L_0⁺=0, L_0⁻ ordinary) | ok |
| §1.5 duality sign | dual of γ−χ(γ) | γ⁻¹−χ(γ)=−χ(γ)γ⁻¹(γ−χ(γ)⁻¹) (expanded: −χ+γ⁻¹) | ok |
| §1.5 Check 1 | L=Φ(ζ₅) | Tr(ζ)=Tr(ζ²)=−2, Tr(1)=8: f(x)=0, f(γ⁻¹x)=10/25=2/5 | ok |
| §2.1 Check 4 | l=λλ̄ | deleted factors (1−φ̄(λ)/Nλ)(1−φ̄(λ̄)/Nλ̄), absolute values of the subtracted terms Nλ^(−1/2)<1 | ok |
| §2.2 | χ=1, p=5 | 1−(−p)/p²=6/5; L_(pf)=(1+p⁻¹)L; supplier §4.4 with ν=1: δ=Ω⁻¹L_f, δ_χ=Ω⁻¹L_(pf) | ok, three places agree |
| §2.3 | ε=+, order p and p² | c=2: W=+1; c=3: W=−1 ⇒ δ_χ(ξ)=0 on Ξ⁻=Ξ^(−ε) ⇒ ξ∈V^ε | ok |
| §2.4 | ξ=πv, u=1+T, a=T | coordinates π; T/(1+T), ideal (T) | ok |
| §2.5 | apply δ_(χ⁻¹) to ξ=L_p v | L_p(χ)δ_(χ⁻¹)(v)=L(φ̄χ⁻¹,1)/Ω=L(conj(φχ),1)/Ω | ok; ε=−, χ=1: 0=L_p(1)·0 |
| §3.1 Check 4 | K=ℚ(i), α=−1+2i | α−1=i(2+2i); Nα=5; 1−ᾱ/5=(6+2i)/5 | ok |
| §3.1 Euler factor | twist by φ_p⁻¹ | Frob⁻¹x⊗t=φ(𝔮)⁻¹Frob⁻¹(x⊗t): 1−φ(𝔮)⁻¹Frob⁻¹ = det(1−Frob⁻¹X on T′*(1)) at X=Frob⁻¹ | ok |
| §3.2 | K=ℚ(√−23), p=5 | #G=3 and 72; local degree 1 (H), 24 (K₀); coinvariants of the semilocal sum = one copy | ok |
| §3.3 | a=O_K; a=(α) | d_a=1−1=0; d_a(1)=5−α=6−2i, norm 40; |N(a)|≠|φ(a)| ⇒ d_a(χ⁻¹)≠0 | ok |
| §3.3 rank | n=0 | rank H¹(Φ,T′)=[Φ:ℚ_p]·1=2=1+1 | ok |
| §3.4 | Euler characteristic | r₂(K)·rank=1 | ok; (π,T) rank one, not free |
| §3.5 | RUB91 Theorem 4.1(ii) | hypotheses p∤#μ(H), H⊆K₀, p∤[K₀:K] (RUB91 lines 486–489); equality on χ nontrivial on D_p (lines 549–551) | ok as declared gap |
| §4.1 | n=0, s=+ | first sequence: local term 0, two identities; second: local term H¹(Φ,T′) of rank 2 | ok |
| §4.1 Check 4 | H^ε=Λ, S_ε=(T), S_str=0 | 0→Λ/(T)→X_rel→X_ε→0 | ok |
| §4.2 | rank count | s=−ε: 0→S_rel→H/H^(−ε): ranks 1,1 ⇒ X_(−ε) torsion; S_rel/S_ε torsion in free H/H^ε ⇒ 0 | ok |
| §4.3 Check 2 | involution on T−a | a′=(1+a)⁻¹−1; a′=a iff a∈{0,−2} | ok |
| §4.4 | model S_ε=(T), C=(T²), char X_str=(T) | (2): (T)(T)=(T²)=char(Λ/(T²)); (1): char(X_ε)_tors·(T)=(T) | ok, consistent with §§3.5, 4.3 |
| §4.5 | α≡1 mod 6f, α≡2 mod p | N(a)−φ(a)=α(ᾱ−1)≡2·1=2, unit for p≥5; α≡1 mod p gives 0 | ok |
| §4.6 | R/O degree 2, L_p=T | Λ_O-ideal (T²) | ok |
| §5.1 | p=5, n=0,1,2 | ω_0⁺=1, ω_0⁻=γ−1; ω_1⁺=1; degrees 20+5=25; zero sets Ξ⁻ / Ξ⁺ | ok |
| §5.2 | n=1, s=+; 𝔪=(ϖ,T) | L_1⁺=0; 𝔪/T𝔪≃R⊕R/ϖ (relations T·[ϖ]=ϖ·[T]) | ok; hypothesis unused (R06) |
| §5.3 | n=0 | s=+: both 0; s=−: Γ⁻-coinvariants of X_− | ok |
| §5.5 | A DVR, M=A/𝔪^k; M=κ² | dim 1 ≤ length k; 2=2 | ok |
| §5.6, §6.1 | X=Λ/(g²); char=(fg) vs (f) | dim 1 ≤ order 2; (fg)⊆(f) | ok |
| §6.2 | n=0, χ=1 | E(Φ)⊗Φ one-dimensional; over ℚ_p: 2pⁿ | ok |
| §6.3–6.4 | ε=+: χ=1, order 5, order 25 | Ξ⁺,Ξ⁺,Ξ⁻: bounds ord, ord, ord+1; matches BKO21 lines 888–893 | ok |

## Dependency check

    depcheck: 235 roadmaps, 2235 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line for this roadmap. Suppliers named: AnticyclotomicLocalUnits, NonordinaryCMSpecialValues, SelmerIwasawaCohomology, ArithmeticGaloisDuality, EulerSystemsAndKolyvaginSystems, ComplexMultiplicationAndExplicitReciprocity, LubinTateFormalModulesAndQuasiCanonicalLifts (all earlier in `merge-order/ORDER.txt`), and IntegralIwasawaTheory, PadicMeasuresIwasawaAlgebras, EllipticCurves, ClassFieldTheory (on main). ModularIwasawaMainConjecturesPartII and CMRankZeroConverse are named only as consumers.

## Verified sound

- **Suggested.lean.** 0 declarations; single `import Mathlib`; no `set_option`; module docstring names 4 headline theorems (§§4.6, 4.2, 4.4, 6.4) and the missing carriers. I agree none is statable at the pins: the pinned `TauCeti.ContCohomology.SelmerStructure` has no signed local condition, and no Lubin–Tate formal module, anticyclotomic tower or Coates–Wiles derivative exists there. No padding. The `#check` comparison has zero cases.
- **Headline theorems** (from the README): main conjecture §4.6; opposite signed torsion §4.2; characteristic formula §4.4; rank bounds §6.4. All four named in the docstring; none statable; none stated through a stand-in.
- **Targets read:** 36 of 36 (every line of the README, 849 lines). **Checks tested:** 118 of 118 read, the numerical ones recomputed (table above); none false or vacuous; every definition (§§0.1, 1.1, 1.4, 1.5, 2.1, 2.4, 3.1, 5.1) has at least three.
- **Pinned declarations:** 31 of 31 found at the pins with the file the README names (`Module.length`, `Module.length_le_of_surjective`, `Module.length_eq_finrank` (needs `Module.Finite`, which the README's "or ∞" covers), `IsLocalRing.length_restrictScalars`, `Polynomial.cyclotomic_prime_pow_mul_X_pow_sub_one`, `Ideal.span_singleton_mul_left_unit`, `IsGalois.normalBasis`, `IsDedekindDomain.selmerGroup`, `TauCeti.completedGroupAlgebra`, `TauCeti.IsCompactModule.completedGroupAlgebraModule`, `TauCeti.Iwasawa.charDivisor`, `charIdeal`, `charIdeal_eq_mul_of_exact`, `IsPseudoIsomorphism.charIdeal_eq`, `LinearEquiv.charIdeal_eq_comap`, `charIdeal_quotient_span_singleton` (domain, noetherian, UFD: as the README says), `TauCeti.PowerSeries.isRegularLocalRing`, `ringKrullDim_of_isDiscreteValuationRing`, `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` (dimension ≤2), `TauCeti.ContCohomology.SelmerStructure` with `localization`, `selmerGroup`, `mem_selmerGroup_iff`, `H1`, `WeierstrassCurve.selmerGroup`, `selmerStructure`, `kummerSelmerMap`, `kummerSelmerMap_injective`, `WeierstrassCurve.Affine.fg_point_of_numberField`, `selmerGroup₂`, `selmerGroupA`). The README's description of the `SelmerStructure` fields matches the structure at the pin (no discreteness, no unramified condition, `AddSubgroup` conditions).
- **Sibling citations checked:** 58 section citations in 11 roadmaps, each heading found at the cited roadmap's current head or on main (AnticyclotomicLocalUnits 13, NonordinaryCMSpecialValues 5 numbered + 11 former ids (R02), SelmerIwasawaCohomology 17, ArithmeticGaloisDuality 7, EulerSystemsAndKolyvaginSystems 4, IntegralIwasawaTheory 5, PadicMeasuresIwasawaAlgebras 4, ComplexMultiplicationAndExplicitReciprocity 2, LubinTateFormalModulesAndQuasiCanonicalLifts 4, NoncommutativeAndEquivariantIwasawa 1, layers of EllipticCurves and ClassFieldTheory). Contents compared for AnticyclotomicLocalUnits §§0.1, 0.5, 1.2–1.5, 2.4, 3.1, 3.2, 3.6, 4.2–4.4, 8.2, 8.4, 8.5 and NonordinaryCMSpecialValues §§0.4, 1.4, 1.5, 2.1–2.3, 2.6–2.10, 3.3–3.5, 6.4: conventions agree (δ_χ(gx)=χ(g)⁻¹δ_χ(x), λ_χ(gy)=χ(g)λ_χ(y), δ_1=(1+p⁻¹)δ, unit signs kill the opposite parity, smoothing factor N(a)−ψ(a)σ_a, corestriction with no Euler factor at fixed support, W(φχ)=(−1)^c W(φ)); the one mismatch is R01.
- **Declared gaps:** 5 of 5 have the same slug in `design/plan.json` and in the README, a named supplier and a single precise statement. I found no earlier owner of any of them (searched the open heads and main for Rubin's Theorem 4.1(ii), the Ax–Brumer theorem over an imaginary quadratic field, the prime-to-p norm relation). BIL86's closing remark (line 641) removes the hypothesis E[p]⊂E(F), not Leopoldt, so the Leopoldt gap is needed.
- **Ownership against open work:** no other open roadmap or roadmap on main states Rubin's anticyclotomic p-adic L-function, the signed Selmer groups at an inert prime or BKO21 Theorems 6.1–6.2; ModularIwasawaMainConjecturesPartII names this roadmap as their owner. No fully qualified Lean name is shared (the file declares none).
- **Locators verified:** 34 against the cached texts: BKO21 Theorems 2.1, 6.1, 6.2, Corollary 2.2, §§6.0.1–6.0.2, footnote 3 and their pages; AHII05 §2, Remark 3.2, Propositions 3.1, 3.3, 3.4, (3.2), Conjecture 3.5, Theorems 3.6, 4.1–4.3, (3.3), (4.1)–(4.4), §5 definitions and (5.1), Lemma 5.1, Theorem 5.2, Proposition 5.3 and both recorded misprints; AHI06 Lemmas 1.1.4, 1.1.9, 1.2.1, 2.4.5, Corollary 2.4.6, Propositions 2.4.15–2.4.16 with printed pages; RUB91 (1c), §4, sequence (5), Theorem 4.1(ii), Remark (2); BIL86 Remark 3.3, Lemma 3.6, Proposition 3.8, Theorems 3.23–3.24 and the introduction's numbering.
- **Policy:** the pull request changes only the package folder; no pull-request number, process narrative, `lemma`, `set_option` or machine path in the README or the Lean file; every target has a locator; `sources.toml` has the six cited works, BRU67 as waived.

Source independence: 12 passages compared with 5 sources (BKO21 §6.0.1, §6.0.2, Theorems 6.1–6.2 and proof; AHII05 §2, Proposition 3.1, Theorem 3.6 and proof, Theorem 4.2 and proof, Lemma 5.1 and proof, Theorem 5.2 and proof; RUB91 Theorem 4.1; BIL86 Theorem 3.24; AHI06 Lemma 1.1.4), none shared beyond what the mathematics forces (longest shared run under ten words); largest share BKO21, 31 of 82 locators (AHII05 30); contents compared with BKO21 (§§1–6, with 6.0.1–6.0.3) and with AHII05 (§§2–5): independent — Layers 0, 2 and 6 have no counterpart in AHII05, its §§3–4 are divided differently between Layers 3 and 4, and BKO21 §6 places the L-function before the Selmer groups while Layer 1 precedes Layer 2 here; the remaining order is forced by the *Needs:* lines (§3.3 needs §2.3; §4.4 needs §3.5; §5.3 needs §5.2; §6.3 needs §4.6 and §5.3). BRU67 was not read (waived).

## Not verifiable

- BRU67 (waived): the attribution of Leopoldt for abelian extensions of an imaginary quadratic field to pp.121–124 was not checked against the text.
- The overlines in BKO21 §6.0.1 (which of φ̄χ and conj(φχ) is printed in the two displayed formulas) are lost in the cached extraction (BKO21 lines 825–841); the README's two formulas are consistent with each other by δ_(χ⁻¹)(a·v)=a(χ)δ_(χ⁻¹)(v), which is what I checked.
- RUB91 is an OCR text: the page of (1c) (p.28) was matched by position only (RUB91 line 171).
- The proofs behind the proof routes of §§3.5 and 4.3 (the passage from Rubin's and Billot's two-variable statements to the φ-component over Λ_R) are routes, not checked beyond their inputs and the consistency of the resulting ideals in the lattice models.
- No Lean was elaborated: the file has no declaration.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, printed page 620: the source says the product of the two control elements is γ to the power p^k minus 1; it should be γ^(pⁿ)−1, by the definitions on p.618; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, printed page 616: the source cites a Lemma 2.1.2 of the companion paper for the conjugation symmetry; it should be Lemma 1.2.1 of AHI06 (no Lemma 2.1.2 exists there); affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.2, printed page 617 (AHII05 line 269): the source says the quotient of the full local module by S_ε is torsion; it should be the quotient of the signed module H¹_ε by S_ε (the full quotient has rank one); affects nothing.
- **Misprint** in BIL86 at the introduction, printed page 342: the source attributes the pseudo-isomorphism and the characteristic-series equality to Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24, as numbered in the body; affects nothing.
- **Misprint** in BKO21 at §6.0.2, printed page 962 (BKO21 line 864): the source says the characters factor through the Galois group of Ψ_n over Ψ; it should be over Φ; affects nothing.
- **Gap** in BKO21 at Theorem 6.1, printed page 962: the source says the characteristic ideal is taken over Λ, defined with coefficients O, for a module over the larger ring R; it should be over R⟦Γ⁻⟧, or the generator replaced by its norm; affects a stated result.

## For the human reviewers

- **Scope/supplier size.** `gap:inert-two-variable-main-conjecture` asks NonordinaryCMSpecialValues for Rubin's two-variable theorem at a non-split prime (RUB91 Theorem 4.1(ii)), whose proof occupies RUB91 §§5–10; `design/plan.json` gives its section as "NCM.1".
- **Published proof.** The proof of the headline in the source is a four-line reference to AHII05 "by a similar argument" for h_K>1 (BKO21 lines 883–886); Layers 3–4 of the README write that argument out.
- **Licence.** The cached BKO21 copy, recorded as `institutional` (Caltech repository), carries JSTOR download stamps and a JSTOR terms line on each page (BKO21 lines 813–815).
- **Not read.** BRU67 is waived; the Ax–Brumer attribution in `README.md:849` rests on the locator alone.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b0292e75b5e66e29157e0b034aec39184debee6c", "job": "RT-InertAnticyclotomicCMMainConjecture~1a", "model": "fable", "worker": "chris-x89"} -->
