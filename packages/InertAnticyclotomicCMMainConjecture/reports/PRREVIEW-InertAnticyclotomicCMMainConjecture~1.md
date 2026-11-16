# Review of InertAnticyclotomicCMMainConjecture (pull request #2435 at 920db3f)

**Verdict:** needs changes

## R01 (P1) — §4.3 applies Billot's theorem, which nothing owns

**Location:** `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/README.md:579`: "Apply Billot's specialisation theorem to E over K₀=H(E[p]), which satisfies its standing hypotheses … With the coprimality just proved, the theorem equates the characteristic ideal of the dual of the strict module with that of the torsion".

**Claim:** §4.3's route uses BIL86 Theorem 3.24 (with its Proposition 3.17 and Theorem 3.22) as an input. No target here, no supplier section and no pinned declaration provides it, and the Leopoldt gap exists only to meet its hypothesis.

**Witness:** The §4.3 *Needs:* line (README.md:591) names no owner for it. `roadmaps grep 'Billot'` finds it in no other roadmap. Scope (line 13) owns only "the relaxed-dual characteristic comparison".

**Repair:** Insert at the start of §4.3: "First prove the two-variable input. For E over K₀=H(E[p]), F∞=K₀(E[p^∞]) and L∞=K₀K∞, assume Leopoldt's conjecture at p for every finite subextension of F∞/K₀, and assume γ⁺−1 is prime to the characteristic ideal of the torsion of the Selmer dual over F∞. Then the strict Selmer dual over L∞ has characteristic ideal equal to the image under γ↦γ⁻¹ of the characteristic ideal of the torsion of the Selmer dual over L∞ (BIL86 Theorem 3.24, pp.364–365, through Proposition 3.17 and Theorem 3.22). A route: Iwasawa duality with the involution over F∞ (SelmerIwasawaCohomology §3.12), then derived specialisation along γ⁺−1 (SelmerIwasawaCohomology §3.10)." Then make three more changes: add SelmerIwasawaCohomology §3.10 to the §4.3 *Needs:* line; make the existing route cite this statement in place of "Billot's specialisation theorem"; and add "the two-variable strict–relaxed specialisation identity" to the Layer 4 bullet of Scope (line 13).

## R02 (P2) — Two gaps give a second owner to objects ModularIwasawaMainConjecturesPartII plans

**Location:** `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/README.md:79,81`: "What NonordinaryCMSpecialValues must provide (gap:elliptic-unit-euler-system) … What NonordinaryCMSpecialValues must provide (gap:inert-two-variable-main-conjecture): Rubin's two-variable theorem at a non-split prime".

**Claim:** Both gaps ask NonordinaryCMSpecialValues for objects that ModularIwasawaMainConjecturesPartII already plans, although NonordinaryCMSpecialValues' scope leaves Euler-system relations and Rubin's main conjecture to other roadmaps. Each object would have two owners.

**Witness:** ModularIwasawaMainConjecturesPartII §2.2 (the norm relation, with factor 1−Frob_𝔮⁻¹ for 𝔮∤pm), §4.1 (the Euler system of these units) and §4.8(ii) (Rubin's Theorem 4.1(ii) at an inert prime); NonordinaryCMSpecialValues README line 21. No roadmap consumes this one.

**Repair:** Delete lines 79 and 81, and add the subsection "### From TauCetiRoadmap.ModularIwasawaMainConjecturesPartII" with the text: "Use §2.2 for the units _aζ_m (equal to _az_m when p divides m) with their norm relation at every 𝔮 with m𝔮 prime to a; §4.1 for the Euler system they form; and §§4.7–4.8(ii) for Rubin's modules, his sequence (5) and his Theorem 4.1(ii) at an inert prime." In §3.1, §3.5 and the Layer 3 Dependencies, replace "(gap:elliptic-unit-euler-system)" by "ModularIwasawaMainConjecturesPartII §§2.2, 4.1", and "NonordinaryCMSpecialValues (gap:inert-two-variable-main-conjecture)" by "ModularIwasawaMainConjecturesPartII §4.8". In line 20, replace the last two sentences by "Those norm relations and Rubin's theorem at a non-split prime are ModularIwasawaMainConjecturesPartII §§2.2, 4.1 and 4.8(ii)." Withdraw both slugs. Tested on a scratch copy of the README: the dependency check reports "moved … from #374 to #404, right after its last supplier ModularIwasawaMainConjecturesPartII" and 0 problems.

## R03 (P3) — The §5.5 locator does not contain §5.5's statements

**Location:** `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/README.md:723`: "If a generator f of char(X) is a unit multiple of an element of Λ_O, then ord_ρ f=ord_(ρ⁻¹) f (BKO21 proof of Theorem 6.2, pp.962–963)."

**Claim:** The cited passage states neither the inequality dim ≤ length = ord_ρ nor the ρ/ρ⁻¹ comparison.

**Witness:** BKO21 lines 902–905 (p.963) assert the strict bound with "standard arguments show that" and no lemma. The proof writes ord_χ throughout, with no ρ⁻¹ comparison.

**Repair:** Replace the parenthetical by "(used without statement in BKO21, proof of Theorem 6.2, p.963, as its 'standard arguments'; proved here from the Mathlib lemmas of the route)".

## R04 (P3) — The description misstates what Suggested.lean contains

**Location:** The pull-request description, third paragraph and the Validation paragraph: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" … "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** At the head, `Suggested.lean` declares nothing and contains no `sorry`. The text implies stated declarations, and it does not say that no headline theorem is statable.

**Witness:** `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/Suggested.lean:42–44` is an empty namespace. `lake env lean` on the file prints no message.

**Repair:** "`Suggested.lean` states no declaration: none of the headline theorems (§§4.2, 4.4, 4.6, 6.4) is statable at the pins, and its module docstring names what each lacks. The targeted Lake build succeeds with no warning."

## Verified sound

| Target | Instances tried | README side | Computed / source side | Result |
|---|---|---|---|---|
| §0.1 inert Gross datum | K=ℚ(√−23), p=5; f=(1) | h_K=3, 5 inert, [H:ℚ]=6; Frobenius polynomial (X+p)² | forms (1,1,6),(2,±1,3); −23≡2, a non-square mod 5; trace −10; f=(1) forces α=−α | holds |
| §0.2 towers | n=0, 1; conjugation on Γ⁻ | K_0=K, Ψ_0=Φ; [Ψ_1:Φ]=5 | tame degree 24≠5; cγc⁻¹γ=1, against γ² if c↦id; BKO21 lines 371, 854 | holds |
| §1.3 local vanishing | good v, q=4; W coefficients | H¹(V_T)=0; H¹(W) may be nonzero | \|α\|=\|q/α\|=2 ⇒ no invariants; H¹(W)=W(−1)^Frob ≠0 iff α≡q mod 𝔪; AHI06 lines 236–242 | holds |
| §2.2 special values | χ=1 at p=5; χ with c=2 | δ(ξ)=L(φ̄,1)/Ω; δ_1=(1+p⁻¹)δ | deleted factor 1−(−5)/25=6/5; BKO21 (3.6)–(3.7), Prop. 3.3 at ν=1: L_f and L_pf | holds |
| §2.4 L_p | ξ=πv; a=T, u=1+T | L_p=π; coordinate u⁻¹a | ideal (π); T/(1+T) generates (T); BKO21 lines 833–838 | holds |
| §3.2 descent | K=ℚ(√−23), p=5; M=H, K₀ | #G=3 and 72 | both prime to 5; cor∘res=×#G is invertible; BKO21 lines 876–886 | holds |
| §3.5 strict comparison | Λ_R/(π); tame χ at p=5 | integral char(X_str)=char(S_rel/C) | char=(ϖ_R)^e, lost after ⊗ℚ_p; RUB91 Thm 4.1(ii) needs χ nontrivial on D_p; order-24 χ is | holds; input: R02 |
| §4.3 relaxed torsion | involution on (T), (T−a); Billot (1)–(4) | char((X_rel)_tors)=char(X_str) | T↦−T+T²−⋯ keeps (T); a′=(1+a)⁻¹−1≠a; BIL86 lines 288–289, 380, 618–621 | input unowned: R01 |
| §4.4 signed char | ℋ^ε=Λ, S_ε=(T), C=(T²), char X_str=(T) | identity 2: (T)·(T) | char Λ/(T²)=(T²); B_tors→C_tors is onto when A is torsion; AHII05 lines 247–280 | holds |
| §5.1 ω_n^± | n=0; p=5, n=2 | ω_0⁺ω_0⁻=γ−1; degrees 20, 5 | φ(25)=20, 1+φ(5)=5, sum 25; Φ_25 vanishes at order 25, c=3∈Ξ⁻; AHII05 lines 307–317 | holds |
| §5.2 local control | p=5, n=2; n=1, s=+; dual 𝔪=(ϖ,T) | iso; coranks 20, 5; L_1⁺=0 | levels ≤1 have c∈{0,2}⊂Ξ⁺; 𝔪/T𝔪≅R⊕R/ϖ leaves a finite cokernel; AHII05 lines 318–338 | holds |
| §5.3 Selmer control | n=0; dual of γ−ζ | χ⁻¹-specialisation | the dual of γ−ζ is −ζγ⁻¹(γ−ζ⁻¹); ω_0⁺=1 makes both sides 0; AHII05 lines 343–346 | holds |
| §5.4 decomposition | Λ_R/(ω_2⁺,ω_2⁻) | finite kernel and cokernel | ideal ⊂(p,T) and contains Φ_25(1)=5: a finite nonzero ring; AHII05 line 397 prints γ^(p^k) | holds; misprint recorded |
| §5.5 dim ≤ length | A/𝔪^k; κ²; Λ/(g²) | dim ≤ length = ord | 1≤k; 2=2; dim 1 against ord 2; BKO21 lines 902–905 state no such lemma | holds; locator: R03 |
| §6.3 matching parity | χ of order 5, ε=+; χ=1 | dim Sel^χ ≤ ord_χ L_p | χ∈Ξ⁺, so ω_n⁻(χ)=0; ord_(χ⁻¹)=ord_χ for O-coefficients; BKO21 lines 906–908 | holds |
| §4.6 main conjecture | [R:O]=2, L_p=T; ξ=πv | char over Λ_R is (L_p) | Λ_O-ideal (T²); (π) gives μ=e; BKO21 Thm 6.1 is stated over O⟦G⁻⟧ (line 259) | holds over Λ_R |
| §6.4 rank bounds | χ=1 with ε=±; K=ℚ(√−23) | ord_1 L_p, plus 1 when ε=− | 1∈Ξ⁺; h=3 rules out E/K; conductor pⁿ in BKO21 line 889 is n=c(χ)≥r | holds |
| §4.2 opposite torsion | ε=+ | X_− torsion; S_str=S_−=0 | ranks 1−1+r−0=0 ⇒ r=0; AHII05 lines 216–231 | holds |
| §3.1 module C | K=ℚ(i), p=7, 𝔮=(−1+2i) | factor 1−φ(𝔮)⁻¹Frob⁻¹ | (6+2i)/5≠0, against 1−1=0 untwisted; ModularIwasawaMainConjecturesPartII §2.2 states the same relation | holds; owner: R02 |
| §4.5 unit factor | α≡1 mod 6f, α≡2 mod p | N(a)−φ(a) is a unit | α(ᾱ−1)≡2·1=2 mod p; α≡1 mod 5 gives 0 | holds |
| §1.2 conjugate embedding | p=5, β³=aπ | c does not extend to L | quotient is a cube root of a⁴ (order 6), so has order 18, not in μ_24 | holds |
| §1.5 contragredient action | L=Φ(ζ₅), x=(ζ₅−ζ₅²)/25 | f(x)=0, f(γ⁻¹x)=2/5 | Tr(ζ₅)=−2 gives 0; Tr(1−ζ₅)=10 gives 2/5 | holds |
| §0.4 dual lattice | R=O[√π] | inverse different (√π)⁻¹R | 2 is a unit, so the different is (√π); R/√πR has 25 elements | holds |

- Source locators checked against the text: 43 (BKO21 12, AHII05 14, AHI06 7, BIL86 6, RUB91 4). These cover all 15 sampled targets; one locator is defective (R03).
- Library declarations opened at the pins, each with the hypotheses the README states: Mathlib 14 (e.g. `RingTheory/Length.lean:202,293`, `RingTheory/LocalRing/Length.lean:54`, `RingTheory/PowerSeries/WeierstrassPreparation.lean:459,505,808–814`); Tau Ceti 22 (e.g. `RingTheory/Iwasawa/Char/Ideal.lean:85–198`, `ContCohomology/SelmerStructure.lean:69–103`, `EllipticCurve/GaloisCohomology/Selmer/Basic.lean:176–238`, `RingTheory/Iwasawa/CompletedCoordinate.lean:78,162`).
- Cross-roadmap citations resolved at main or at the open heads: about 80 sections and names in 11 roadmaps, none missing. The gap suppliers' sections were read: AnticyclotomicLocalUnits §4.3, PadicMeasuresIwasawaAlgebras §4.6, IntegralIwasawaTheory §§2.2, 4.3–4.4.
- Gate rerun at 920db3f: every check 0, OK. Dependency check: "248 roadmaps, 2377 edges, 0 problem(s)"; with R02's repair, "moved … from #374 to #404", 0 problems.
- `lake env lean` on Suggested.lean: exit 0, no message. The file declares nothing, so there were no `#check` signatures to compare. The docstring's missing carriers are confirmed absent at the Tau Ceti pin: no Lubin–Tate module, no signed Selmer groups, no anticyclotomic tower.
- Overlap check: read ModularIwasawaMainConjecturesPartII, AnticyclotomicLocalUnits, NonordinaryCMSpecialValues, EulerSystemsAndKolyvaginSystems, EulerSystemsCyclotomicMainConjecture, PadicMeasuresIwasawaAlgebras, IntegralIwasawaTheory; shared: elliptic-unit norm relations and Rubin's Thm 4.1(ii), owner ModularIwasawaMainConjecturesPartII (R02); local units, owner AnticyclotomicLocalUnits (cited); CM classes, owner NonordinaryCMSpecialValues (cited); characteristic ideals, owners Tau Ceti and PadicMeasuresIwasawaAlgebras §4.6 (cited); nobody else owns BKO21 Theorems 6.1–6.2.
- Source independence: 18 passages compared with 5 sources, none shared beyond forced terms; largest share BKO21, 31 of 82 locators. Contents compared with BKO21 §§2–6 and AHII05 §§2–5 (30 locators): independent. Layer 1 ↔ AHII05 §2 and Layer 5 ↔ §5, but AHII05 §3 spreads over Layers 3–4, and Layers 0, 2 and 6 have no counterpart in either paper.
- Gaps: all six slugs are stated in the README with named suppliers. Four are precise and minimal (AnticyclotomicLocalUnits §4.3, PadicMeasuresIwasawaAlgebras §4.6 twice, IntegralIwasawaTheory §4.4); the other two are R02.

## Not verifiable

- BRU67, pp.121–124: waived in the manifest, cited by locator, not read.
- BKO21 lines 825–841: the overlines are lost in the extraction, so whether φ̄χ or conjugate(φχ) is printed could not be read. The README's formulas agree with BKO21 (3.4) and Prop. 3.3.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the product of the plus and minus control elements is γ to the power p^k minus one; it should be γ^(pⁿ)−1, by the definitions on p.618; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says the conjugation symmetry is Lemma 2.1.2 of the earlier paper; it should be AHI06 Lemma 1.2.1, since AHI06 has only a Remark 2.1.2 about a measure; affects the proof.
- **Misprint** in BIL86 at Introduction, p.342: the source says the pseudo-isomorphism and the series equality are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24, as numbered on p.364; affects nothing.
- **Gap** in BKO21 at Theorem 6.1, p.962: the source says the characteristic ideal over Λ=O⟦G⁻⟧ (p.948) is generated by L_p, for a module built from R-coefficients; it should be taken over R⟦G⁻⟧, or be the norm over O⟦G⁻⟧ when R≠O; affects a stated result.

## For the human reviewers

- BKO21 was read from an operator-held local PDF that carries JSTOR download terms (BKO21 line 375). README line 854 links a Caltech institutional copy instead.
