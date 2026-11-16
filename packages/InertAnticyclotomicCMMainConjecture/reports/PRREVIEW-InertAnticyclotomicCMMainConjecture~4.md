# Review of InertAnticyclotomicCMMainConjecture (pull request #2435 at 09efa59)

**Verdict:** accepted

## Previous findings

- none: the previous review, of this same head, raised no finding.

## Deferred findings

- D01 — stands

## Verified sound

| Target | Instances tried | README side | Computed / source side | Result |
|---|---|---|---|---|
| §0.5 signed decomposition over R | x=a₊v₊+a₋v₋, s=+; a=p; a=T; R=O[√π], u=1+√π, p=5 | x∈V_R⁺ iff δ_χ(x)=0 on Ξ⁻; δ(uv₊)=(1+√π)δ(v₊); δ_1=6/5·δ | δ_χ(x)=a₋(χ⁻¹)δ_χ(v₋), δ_χ(v₋)≠0 (BKO21 line 308) ⇒ a₋ has infinitely many zeros ⇒ 0; T has one zero | holds |
| §1.1 signed Kummer conditions | n=0; Q⊗π⁻¹ and [π]Q⊗π⁻¹; trace from level 1 | L_0⁺=0, L_0⁻ ordinary; restriction = inclusion, corestriction = trace | A_0⁺={λ_1=0}=0; [π]Q⊗π⁻¹=Q⊗1=0; trace multiplies λ by p; BKO21 lines 862–866, AHII05 p.613 | holds |
| §1.4 four Selmer conditions | n=0; good v with α≡q; divisible class lifted to V_T | Sel_+(K)=Sel_str, Sel_−(K)=Sel; image of Sel_a(V_T) is the divisible part | failure of the lift lies in a finitely generated R-module, so vanishes on divisible classes; H¹(K_v,W)=W(−1)^Frob≠0 iff α≡q | holds |
| §1.5 dual action (touches §§5.3, 5.6) | L=Φ(ζ₅), x=(ζ−ζ²)/25, f=Tr | f(x)=0, f(γ⁻¹x)=2/5; dual of γ−χ(γ) is −χ(γ)γ⁻¹(γ−χ(γ)⁻¹) | Tr(ζ−ζ²)=−2+2=0; Tr(1−ζ)=8+2=10; γ⁻¹−χ(γ) expands to the same | holds |
| §2.2 special values | χ=1, p=5; χ with c=2; primes dividing f | δ(ξ)=L(φ̄,1)/Ω; δ_1=(1+p⁻¹)δ; no factor at nontrivial χ | 1−(−5)/25=6/5; BKO21 (3.6)–(3.7), lines 467–473, 825–828: L_f for δ, L_pf for δ_χ; φ̄χ ramified at p and at f | holds |
| §2.3 sign and nonvanishing | ε=+, orders p and p²; ε=−, χ=1 | ξ∈V_R^ε; δ_χ(ξ)≠0 for almost all χ∈Ξ^ε | W=(−1)^c ε: c=2 gives +1, c=3 gives −1; χ=1 lies in Ξ⁺=Ξ^(−ε) only for ε=−; BKO21 Prop. 3.3(3) | holds |
| §2.4 Rubin's L_p | ξ=πv; a=T, u=1+T; ξ=ϖ_R v, e≥2 | L_p=π; coordinate u⁻¹a; (ϖ_R)⊋(π) | T/(1+T) generates (T); (ϖ_R)^e=(π); BKO21 lines 833–838 | holds |
| §2.5 interpolation | a=γ, ζ of order 5; ε=−, χ=1, L_p=π | L_p(χ)=L(conj(φχ),1)/(Ω δ_(χ⁻¹)(v_ε)) | δ_(χ⁻¹)(γv)=ζδ_(χ⁻¹)(v), ζ≠ζ⁴; φ̄χ⁻¹=conj(φχ); BKO21 lines 839–844 give the same formula | holds |
| §3.1 twisted Euler factor (touches §4.5) | K=ℚ(i), p=7, 𝔮=(−1+2i), trivial character | 1−φ(𝔮)⁻¹Frob⁻¹; smoothing N(a)−φ(a)σ_a | Frob⁻¹z⊗t=φ(𝔮)⁻¹Frob⁻¹(z⊗t); 1−ᾱ/5=(6+2i)/5≠0 while 1−1=0; σ_az⊗t=φ(a)σ_a(z⊗t) | holds |
| §3.2 descent over H | K=ℚ(√−23), p=5, M=H, K₀ | #G=3, 72; outer inflation–restriction terms vanish | forms (1,1,6),(2,±1,3); −23≡2 non-square mod 5; gcd(72,5)=1; BKO21 lines 876–886 assume only p∤h_K | holds |
| §3.3 ℋ≃V_R and y_a=c·d_a·ξ | K=ℚ(i), p=7, a=(−1+2i); a=O_K; label swap | ℋ^s↦V_R^s; d_a(1)=6−2i; c_(O_K)=0 | N(6−2i)=40; \|αχ⁻¹\|=√5≠5; Ann(D^s)=V∞*,s (AnticyclotomicLocalUnits §3.6); AHII05 Prop. 3.4 gives ranks 2, 1, 1 | holds |
| §4.2 opposite signed torsion | ranks in the first sequence of §4.1, s=±ε; S_str of rank 1 | S_(−ε)=S_str=0, S_ε=S_rel, X_(−ε) torsion | s=−ε: 0−1+1−r+0=0 ⇒ r=0; rank-one S_str forces loc(S_rel)=0, against loc(C)≠0; AHII05 Thm 3.6 | holds |
| §4.4 signed characteristic formula | ℋ^ε=Λ, S_ε=(T), C=(T²), char X_str=(T) | identity 2: (T)·(T)=(T²) | char Λ/(T²)=(T²); B_tors→C_tors onto when the kernel is torsion; AHII05 (4.1)–(4.4) | holds |
| §4.5 localised lattice | α≡1 mod 6f, α≡2 mod p; α≡1 mod p | N(a)−φ(a)γ_a a unit; char(ℋ^ε/loc C)=(L_p) | N(a)−φ(a)=α(ᾱ−1)≡2·1=2, unit for p≥5; α≡1 gives 0; one unit d_a makes loc(C)=Λ_Rξ | holds |
| §4.6 main conjecture | L_p=T, d=2; L_p=π | char(X_(−ε))=(L_p) over Λ_R; norm over Λ_O | §4.4(2) with §4.5; Λ_R/(T) over Λ_O is (Λ_O/(T))², ideal (T²); BKO21 Thm 6.1, line 881 | holds |
| §5.2 signed local control | p=5, n=2; n=1, s=+; dual 𝔪=(ϖ_R,T) | isomorphism; coranks 20 and 5; L_1⁺=0 | φ(25)=20, 1+φ(5)=5; injective map of divisible corank d into cofree corank d has finite divisible cokernel, 0; 𝔪/T𝔪≅R⊕R/ϖ_R | holds |
| §5.4 finite-level decomposition | p=5, n=2; χ=1, ε=+; χ of order 25 | finite kernel and cokernel; Sel_(−ε)^χ=Sel^χ on Ξ^ε | (ω_2⁺,ω_2⁻)⊂(p,T), contains a power of 5; A_n^(−ε) kills Ξ^(−ε), keeps Ξ^ε; AHII05 Prop. 5.3 | holds |
| §5.6 strict specialisation | X_str=Λ_R/(g²); χ=1 | dim Sel_str^χ ≤ dim(X_str⊗_(χ⁻¹)L_χ) ≤ ord_(χ⁻¹) | dimension 1, order 2; kernel of restriction in H¹(Γ_n,H⁰(K∞,W))=0; AHII05 Lemma 5.1 proof gives H⁰=0 | holds |
| §6.1 strict divisor contains L_p | char X_(−ε)=(fg), char X_str=(f), g=T; ord 1 and 2 | (L_p)⊆char(X_str); ord_ρ char(X_str)≤ord_ρ L_p | (fg)⊆(f), not conversely; 1≤3; BKO21 lines 894–896 | holds |
| §6.4 rank bounds | ε=+, χ=1; orders 5 and 25 at p=5; K=ℚ(√−23) | ≤ord_χ L_p on Ξ^ε, +1 on Ξ^(−ε) | Ξ^(−ε): 1+ord_(χ⁻¹)char(X_str) ≤ 1+ord_χ L_p, R=O; χ(ω_n^(−ε))=0 iff χ∈Ξ^ε; BKO21 Thm 6.2, lines 888–907; h=3 excluded | holds |
| Conventions, Agboola–Howard labels (§0.3) | orders 1, p, p² | their sign-s set is Ξ^(−s); object labels agree | AHII05 p.613: Ξ⁻ = trivial and odd k, so c∈{0, even}; E^± kills Ξ^∓ (theirs) = Ξ^± (here); X_(−ε) torsion in both | holds |

- Source locators checked against the text: 38. BKO21 12 (pp.948–953, 960–963), AHII05 15 (pp.612–620), AHI06 7 (pp.1006, 1009–1010, 1028–1029, 1032–1033), RUB91 4 (pp.28, 36–37). BIL86 was not reopened.
- Library declarations opened at the pins: 31, all present. Among them `TauCeti.Iwasawa.charIdeal_quotient_span_singleton` (RingTheory/Iwasawa/Char/Ideal.lean:198), `TauCeti.ContCohomology.SelmerStructure` (SelmerStructure.lean:69), `IsLocalRing.length_restrictScalars` (Mathlib/RingTheory/LocalRing/Length.lean:54), `Polynomial.IsDistinguishedAt.algEquivQuotient` (WeierstrassPreparation.lean:459).
- Cross-roadmap citations resolved at the suppliers' heads or on main: AnticyclotomicLocalUnits 15 sections, NonordinaryCMSpecialValues 14, SelmerIwasawaCohomology 17 headings (5 read), ArithmeticGaloisDuality 7, EulerSystemsAndKolyvaginSystems 5 (4 read), IntegralIwasawaTheory 4, PadicMeasuresIwasawaAlgebras 2, LubinTateFormalModulesAndQuasiCanonicalLifts 4, NoncommutativeAndEquivariantIwasawa §4.3. Each makes the statement it is cited for.
- Gaps: the six contracts are precise and minimal. No roadmap on main or earlier in the order states Leopoldt over an imaginary quadratic field, the P_ρ multiplicity, restriction of scalars over a base O, or Wiles reciprocity for every unit. The plan lists four slugs; the other two are D01's.
- Gate rerun at 09efa59 with the targeted build: every check 0, OK. Dependency check: "depcheck: 257 roadmaps, 2447 edges, 0 problem(s)". The diff outside the folder is empty.
- `lake env lean` on Suggested.lean: exit 0, no message. The file declares nothing, so there is no `#check` comparison and no one-tactic probe. Headlines §§4.2, 4.4, 4.6, 6.4 are named in the docstring; the pins have no Lubin–Tate module, anticyclotomic tower, elliptic units or signed conditions.
- Pull-request text against the head: adds the roadmap, six gaps, no declaration, ModularIwasawaMainConjecturesPartII later in the order (line 408 against 378). All match.
- Overlap check: read ModularIwasawaMainConjecturesPartII, AnticyclotomicLocalUnits, NonordinaryCMSpecialValues, EulerSystemsAndKolyvaginSystems, SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa, PadicMeasuresIwasawaAlgebras, IntegralIwasawaTheory; shared objects are the elliptic-unit norm relation and Rubin's theorem at a non-split prime, planned by ModularIwasawaMainConjecturesPartII §§2.2, 4.8 (D01). Signed anticyclotomic Selmer groups, Rubin's L_p and Billot's identity are owned only here.

Source independence: 14 passages compared with 4 sources (BKO21, AHII05, AHI06, RUB91), none shared beyond forced formulas and standard terms; largest share BKO21, 32 of 96 locators; contents compared with BKO21 (§§1–6) and AHII05 (§§2–5): independent, Layers 0, 2 and 6 have no counterpart in AHII05, Layer 4 spans its §§3–4, and the *Needs:* lines of §§3.4, 4.1, 5.2 and 6.3 force the order.

## Not verifiable

- BRU67, pp.121–124: waived in the manifest, cited by locator, not read.
- BIL86 pp.350–366: its extraction drops the formulas; not reopened this round, the locators stand as the two previous reviews read them from the scan.
- Inputs of the §4.3 route outside BIL86 (Perrin-Riou's thesis for Lemmas 3.19–3.20, Greenberg for the absence of pseudo-null submodules): not read.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the product of the plus and minus elements is γ to the power p^k minus 1; it should be γ^(pⁿ)−1, by the definitions on p.618; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says the symmetry is Lemma 2.1.2 of the first paper, which has no lemma of that number; it should be Lemma 1.2.1, p.1010; affects nothing.
- **Misprint** in BKO21 at Theorem 6.1, p.962: the source says the characteristic ideal is taken over Λ=O⟦G⁻⟧ of p.948, for a module with R-coefficients; it should be over R⟦G⁻⟧, the ideal over O⟦G⁻⟧ being the norm; affects a stated result.

## For the human reviewers

- BKO21 was read from an operator-held local PDF carrying JSTOR download terms (BKO21 lines 11, 284). The README's References link a Caltech institutional copy instead.
