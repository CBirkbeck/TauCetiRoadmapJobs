# Review of InertAnticyclotomicCMMainConjecture (pull request #2435 at 069a185)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check, proof route or supplier citation was found false, unsupported or unowned, and the sign, conductor and character-inversion conventions agree with the sources and with the suppliers at every point recomputed. There is one small correction (the description's summary still counts six requested supplier inputs where the head declares four) and two format notes, none blocking. Two items are left to the human reviewers: Brumer's paper is cited by locator only, and the cached copy of the most-cited article carries a publisher-archive download footer.

## C01 — The description's summary counts six requested supplier inputs; the head requests four

A reader of the opening summary of the description expects six open supplier contracts and finds four. The last sentence of the summary reads "Only the rank bounds assume E is over K; six missing inputs are requested from suppliers." The README's supplier contracts state four requests: Wiles reciprocity for every local unit (AnticyclotomicLocalUnits §4.3), restriction of scalars over a general base and the multiplicity at a character prime (both PadicMeasuresIwasawaAlgebras §4.6), and Leopoldt for abelian extensions of an imaginary quadratic field (IntegralIwasawaTheory §4.4). The two inputs that used to be requests, the norm relations of elliptic units away from p and Rubin's two-variable theorem at a non-split prime, are now taken from ModularIwasawaMainConjecturesPartII §§2.2, 4.7, 4.8(ii), as the description's own prose further down says ("Four inputs …"). The sentence would be right as: "Only the rank bounds assume E is over K; four missing inputs are requested from suppliers."

## N01 — The overview says the roadmap is "following" two papers

The third sentence of the README's Summary ends "following Burungale, Kobayashi and Ota (BKO21) and Agboola and Howard (AHII05)", and the description's summary has "It follows Burungale–Kobayashi–Ota". The layers are not arranged as either paper is (see the source-independence line), so the phrase undersells the text; "the results are those of …" or "proved by … and …" would say what is meant without presenting a source as the plan.

## N02 — The route of §3.4 is one paragraph of about 1,400 words

It carries six separate arguments (torsion of X_str from the Euler system under condition (*), the rank of S_rel, the strict–relaxed sequence, the two-variable ranks, the specialisation along γ⁺−1, torsion-freeness of S_rel). Paragraph breaks at those six points would let an implementer find the step a later section cites; nothing in the content needs to change.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conventions: c(χ), Ξ^±, table at p=5 | trivial, order 5, order 25 | c = 0, 2, 3; signs +, +, −; BKO21 line 251 gives conductor p^(n+1) for exact level n | agree |
| §0.3 sign dictionary with AHII05 | AH minus set: trivial and odd k | AH Ξ⁻ = {1} ∪ {k odd} = c even = Ξ⁺ here; AH E^+ killed by AH Ξ⁻ = Ξ⁺, so equals A^+ (AHII05 lines 102–109) | labels of objects equal, character sets swapped, as stated |
| §0.5 signed kernels over R | a=p; a=T; basis change u=1+√π | a(χ⁻¹)=p≠0; T has one zero; δ(uv)=(1+√π)δ(v), δ_1=6/5·δ at p=5 | consistent with BKO21 Thm 2.1, Cor 2.2 (lines 298–309) |
| §0.1 Check K=ℚ(√−23), p=5 | class number, inertness, Frobenius | forms (1,1,6),(2,±1,3): h=3; −23≡2 non-square mod 5; (X+p)², trace −10 | true |
| §0.4 inverse different | R=O; R=O[√π] | O: trivial; ramified: different (√π), quotient R/√πR of order p²; Tr_(O/ℤ_p)(1)=2 | true |
| §1.2 conjugate embedding Check | p=5, β³=aπ | (β′/β)³=a⁴ of order 6; cubes of μ_24 are μ_8; a cube root has order 18 ∤ 24 | no extension of c, as stated |
| §1.3 local vanishing | good v, q=4; integral group | \|α\|=√q=2≠1 and \|q/α\|=2≠1; H¹(W)=W(−1)^Frob nonzero iff α≡q | rational vanishing only, as stated |
| §1.4 propagation, n=0 | A_0⁺=0, A_0⁻=F(Φ) | Sel_+=Sel_str, Sel_−=Sel at base layer; divisible-lift argument: map from divisible group to f.g. R-module is 0 | sound |
| §1.5 contragredient action | L=Φ(ζ₅), x=(ζ−ζ²)/25 | Tr ζ = Tr ζ² = −2 so f(x)=0; f(γ⁻¹x)=(8+2)/25=2/5; wrong action gives R/(ζ−1)=𝔽₂₅ | Check true |
| §2.1 primitive class | moduli f p^(n+1) vs auxiliary l | with l: extra factors (1−φ̄(λ)/Nλ)(1−φ̄(λ̄)/Nλ̄)≠0; supplier §4.2 is stated on the auxiliary field of its §4.1 | trivial-ν instance is owned here, correctly |
| §2.2 special values | χ=1; conductor exponent 2 | deleted factor 1−(−p)/p²=1+p⁻¹=6/5 at p=5; none at ramified χ; BKO21 lines 469–478, 825–827 | agree |
| §2.3 sign | ε=+, orders p and p² | W(φχ)=(−1)^c ε: +1 at c=2, −1 at c=3; BKO21 line 487, AHII05 (3.1) with c=n+1 | agree |
| §2.4 L_p as coordinate | ξ=πv; basis uv with a=T, u=1+T | coordinate π; T/(1+T) generates (T) | well defined up to units |
| §2.5 interpolation | a=γ, χ(γ)=ζ of order 5 | δ_(χ⁻¹)(γv)=ζδ_(χ⁻¹)(v), not ζ⁻¹=ζ⁴; BKO21 line 841 has δ_(χ⁻¹) | agree |
| §3.1 Euler factor after twist | K=ℚ(i), p=7, α=−1+2i | α−1=i(2+2i); 1−ᾱ/5=(6+2i)/5≠0; Fr⁻¹(c⊗t₀)=φ(𝔮)·(Fr⁻¹c⊗t₀) gives 1−φ(𝔮)⁻¹Fr⁻¹ | matches P(Fr⁻¹) for Hom(T′,R(1)) |
| §3.2 descent | K=ℚ(√−23), p=5 | #G=3 and 72, prime to 5; H·K(φ_p mod p)=H(E[p]) | sound |
| §3.3 ℋ≃V_R, y_a=c·d_a·ξ | a=(α) as above; a=O_K | d_a(1)=6−2i, norm 40; \|αχ⁻¹\|=√5≠5; d_(O_K)=0 | nonvanishing for a≠O_K as stated |
| §3.4 ranks | strict–relaxed sequence; Λ₂⊕Λ₂/(γ⁺−1) | rank X_rel=2−1+0=1; specialisation of the test module has rank 2; κ̄⁻¹κ̄^(p+1)=κ̄^p of order p²−1 | sound |
| §3.5 strict comparison | RUB91 Thm 4.1(ii) | divisibility char(A∞) \| char(Ē∞/C̄∞), equality on χ nontrivial on the decomposition group (RUB91 lines 547–551) | cited at the right strength |
| §4.1–4.2 duality, S_ε=S_rel | model ℋ^ε=Λ, S_ε=(T) | first sequence: 0→ℋ/ℋ^ε→X_ε→X_str→0; second: cokernel Λ/(T) in X_rel; ranks 1−1+r−0=0 | agree with AHII05 (3.3), (4.3) |
| §4.3 relaxed torsion | rank test; involution on (T−a) | rank of X/gX = r + number of g-primary summands, so rank 1 forces g ∤ char(tors); a′=(1+a)⁻¹−1≠a | sound; BIL86 Thm 3.24 carries the involution |
| §4.4 opposite signed formula | C=(T²), char X_str=(T) | (T)·(T)=(T²)=char(Λ/(T²)) | agrees with AHII05 (4.2) |
| §4.5 unit distribution factor | α≡1 mod 6f, α≡2 mod p | N(a)−φ(a)=α(ᾱ−1)≡2·1=2, unit for p≥5 | ideal of the d_a is Λ_R |
| §4.6 main conjecture (headline) | R/O of degree 2, L_p=T; ξ=πv | over Λ_O: (T²); (π)=(ϖ_R)^e, μ=e | integral statement over Λ_R; BKO21 Thm 6.1 line 881 |
| §5.1 control elements | n=0; p=5, n=2 | ω_0⁺=1, ω_0⁻=γ−1; degrees 20+5=25; roots Ξ⁻ and Ξ⁺ | agree with AHII05 lines 308–317 |
| §5.2 local control | 𝔪=(ϖ,T) counter-model | 𝔪/T𝔪≃R⊕R/ϖ; with ℋ/ℋ^s free the cokernel is finite and divisible, hence 0 | isomorphism holds |
| §5.3 signed Selmer control | n=0, s=± | s=+: both sides 0; s=−: Γ⁻-coinvariants of X_− against Sel(K,W) | agrees with AHII05 Thm 5.2 |
| §5.5 dimension ≤ length | A/𝔪^k; Λ/(g²) | dimension 1, length k; ord_ρ=2 | sound |
| §6.1 containment | char X_(−ε)=(fg), char X_str=(f) | (fg)⊆(f); orders 1≤3 | sound |
| §6.4 rank bounds (headline) | ε=±, χ=1; order 5, 25 | χ=1: no extra one when ε=+, +1 when ε=−; BKO21 lines 888–893 | agree |
| C01 | description summary against supplier contracts | "six" against four declared requests | correction |

- Source locators checked against the text: 46 (BKO21 13, AHII05 15, AHI06 6, RUB91 3, BIL86 9), all at the stated pages.
- Library declarations opened at the pins: 36 (Mathlib 14, Tau Ceti 22), all present with the hypotheses the supplier contracts state; for example `TauCeti.Iwasawa.charIdeal_eq_mul_of_exact` (TauCeti/RingTheory/Iwasawa/Char/Ideal.lean line 132), `LinearEquiv.charIdeal_eq_comap` (line 152), `TauCeti.ContCohomology.SelmerStructure` (SelmerStructure.lean line 69), `Module.length_le_of_surjective` (Mathlib/RingTheory/Length.lean line 202).
- Cross-roadmap citations resolved: every cited section of 13 roadmaps exists under the cited number; the statements of AnticyclotomicLocalUnits §§1.4, 3.2, 4.1–4.4, 8.4, 8.5, NonordinaryCMSpecialValues §§1.4, 1.5, 2.2, 2.7–2.9, 6.4, ModularIwasawaMainConjecturesPartII §§2.2, 4.7, 4.8, EulerSystemsAndKolyvaginSystems §§8.1, 8.2, 8.11, 8.25, PadicMeasuresIwasawaAlgebras §4.6 and IntegralIwasawaTheory §§4.3–4.4 were read and say what is assumed of them.
- Declared supplier gaps: four, each stated once in the supplier contracts with a named supplier; none is already provided (PadicMeasuresIwasawaAlgebras §4.6 restricts scalars only to ℤ_p and has no character-prime multiplicity; IntegralIwasawaTheory §4.4 covers abelian extensions of ℚ only; AnticyclotomicLocalUnits §4.3 is stated for its projected class). The acceptance is conditional on these four.
- Supplier order: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no upward or cyclic edge. ModularIwasawaMainConjecturesPartII names this roadmap only as owner of the inert main conjecture and consumes nothing from it.
- Elaboration: `Suggested.lean` elaborates with no message. It declares nothing; its docstring names the four headline theorems (§§4.2, 4.4, 4.6, 6.4) and the carriers each lacks, and none is statable at the pins (no signed Selmer conditions, no local-unit module, no L_p). No padding, no `set_option`, no sorry'd data.
- Automatic checks: all passed; nothing outside the roadmap folder is changed.
- Overlap check: read ModularIwasawaMainConjecturesPartII, AnticyclotomicLocalUnits, NonordinaryCMSpecialValues, ModularIwasawaMainConjectures, EulerSystemsAndKolyvaginSystems, SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa; nothing shared (the signed Selmer groups of ModularIwasawaMainConjectures §0.11 are the cyclotomic Coleman-map ones, a different object; HeegnerPointEulerSystems and EulerSystemsCyclotomicMainConjecture were searched by object only).

Source independence: 12 passages compared with 5 sources, none shared; largest share BKO21, 33 of 96 locators (AHII05 32); contents compared with BKO21 and AHII05: independent (BKO21 §§3–5 belong to the local supplier; AHII05 §3 is split between Layers 3 and 4, and Layers 0, 2 and 6 have no counterpart there; the order Selmer groups, ranks, characteristic ideals, control is forced by the *Needs:* lines of §§3.4, 4.1, 4.4, 5.3).

Research link: The headline targets are Theorems 6.1 and 6.2 of Burungale–Kobayashi–Ota (2021), built on Agboola–Howard (2005), Rubin's two-variable main conjecture (1991) and Billot (1986); the README's References and the texts read support this. BKO21 line 909 announces the equality case in later work.

## Not verifiable

- BRU67 (Brumer 1967, pp.121–124): recorded as waived and not read; the claim that it covers abelian extensions of an imaginary quadratic field rests on the locator alone.
- BIL86 Proposition 3.17, Lemmas 3.18–3.21 and Theorem 3.22: located at the stated pages, but their displayed formulas are missing from the text extraction, so only the surrounding prose and Theorems 3.23–3.24 were compared.
- RUB91 §1, pp.28–29 (elliptic units), cited in the References only: not opened.
- Kato's and Wiles's reciprocity laws behind NonordinaryCMSpecialValues §2.8 and AnticyclotomicLocalUnits §4.3: read only as the suppliers state them.

## Source issues

- **Error** in BKO21 at Theorem 6.1 with §6.0.1, pp.961–962: the source says the characteristic ideal is taken over the algebra with coefficients O and puts the elliptic unit in the O-module of local units, while the Selmer module has coefficients R; it should be over the Iwasawa algebra with coefficients R, with the unit extended to R; affects a stated result.
- **Misprint** in AHII05 at the proof of Proposition 5.3, p.620: the source says the product of the plus and minus elements is γ to the power p^k, minus one; it should be γ to the power p^n, minus one; affects nothing.
- **Misprint** in AHII05 at the proof of Theorem 4.1, p.616: the source says the complex-conjugation symmetry is Lemma 2.1.2 of its first reference; it should be Lemma 1.2.1 of AHI06, p.1010; affects nothing.
- **Misprint** in BIL86 at the introduction, p.342: the source says the pseudo-isomorphism and the equality of characteristic series are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24 (3.25 is a lemma); affects nothing.

## For the human reviewers

- Licence: the cached text of BKO21, recorded as an institutional-repository copy, carries a publisher-archive download footer on every page (BKO21 lines 242–244); whether that copy is the repository's open deposit is for a human to confirm.
- Not tested: BRU67 is cited by locator only (waived); the Ax–Brumer input of §4.3 is requested from IntegralIwasawaTheory §4.4 and was not checked against Brumer's text.
