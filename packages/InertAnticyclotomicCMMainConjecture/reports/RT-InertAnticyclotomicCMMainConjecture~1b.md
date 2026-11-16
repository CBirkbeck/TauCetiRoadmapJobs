<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6904617071 -->
Red team round 1 pass b (claude) of b0292e7

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.4: weak Leopoldt over the ℤ_p²-extension followed by descent does not give torsion of X_str over Λ_R

   Location: `packages/InertAnticyclotomicCMMainConjecture/README.md:495`, "Torsion of X_str and the upper bound on the rank follow from the elliptic-unit Euler system through weak Leopoldt (EulerSystemsAndKolyvaginSystems §8.25), applied over the ℤ_p²-extension, which is admissible, or on the anticyclotomic tower …, followed by descent".

   Claim: either alternative proves that X_str is a torsion Λ_R-module.

   Witness: the first alternative yields only that the two-variable strict dual is Λ_(2)-torsion. M=Λ_(2)/(γ⁺−1) is Λ_(2)-torsion and M/(γ⁺−1)M=Λ_R has rank one. Descent needs γ⁺−1 prime to the two-variable characteristic ideal, which §8.25 does not give.

   Repair (replace the sentence; tested on the witness: the route no longer passes through a Λ_(2)-torsion statement, so M is not an instance):

   > Torsion of X_str follows from the elliptic-unit Euler system of §3.1 through weak Leopoldt (EulerSystemsAndKolyvaginSystems §8.25) applied on the anticyclotomic tower K∞ itself, where the Λ_R-adic class c_a is non-torsion because its localisation is nonzero in the torsion-free H (§3.3). K∞/K is not admissible, since every prime of K inert over ℚ and prime to p splits completely in it, so the admissibility hypothesis of §8.25 is replaced by Rubin's condition (*) of §8.11, which is a target of this subsection: at every prime 𝔮∤p of K that splits completely in K∞ and every finite F⊂𝒦_a, the localisation of the class at 𝔮 is unramified. It holds because the standard units of modulus fgpⁿ, n≥1, g prime to p, are units outside p when the modulus has two prime divisors and 𝔭-units otherwise (NonordinaryCMSpecialValues §2.2), so their Kummer classes, and the twists by T_0, are unramified at 𝔮. The two-variable statement (the relaxed dual over Λ_(2) has rank one) uses §8.25 over the ℤ_p²-extension, which is admissible; torsion over Λ_(2) alone does not descend to Λ_R, as Λ_(2)/(γ⁺−1) shows, and is not used for X_str.

   and add as a Check of §3.4: "Λ_(2)/(γ⁺−1) is Λ_(2)-torsion with specialisation Λ_R of rank one, so torsion of the two-variable strict dual does not give torsion of X_str; the anticyclotomic class must be non-torsion on K∞ itself." The repair worker should confirm (*) at the primes 𝔮|f that are inert over ℚ (where T′ is ramified) against Rubin's remark as stated in EulerSystemsAndKolyvaginSystems §8.11 before keeping the sentence "It holds because …"; if it cannot, keep (*) as a stated target with that case named.

2. **F02** (P2) §§2.2, 3.3, 4.5: AnticyclotomicLocalUnits §4.3 is cited for a generality it does not state

   Location: `README.md:360`, "Wiles reciprocity in dual-exponential form (AnticyclotomicLocalUnits §4.3, stated for every element of U∞*⊗_O R)"; also the *Needs:* lines of §§2.2, 3.3, 4.5 and the contract at `README.md:67`.

   Claim: the supplier states the comparison of the dual exponential with δ_χ for every element of U∞*⊗_O R, hence for the class ξ of an arbitrary inert CM datum and for loc(c_a).

   Witness: at the supplier's head, `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md:675` begins "For the projected class x∈U∞*⊗_O R", and line 629 fixes Layer 4 to "an imaginary quadratic K satisfying §4.1" (2 split) with the canonical character. K=ℚ(i), p=7, f=(2+2i) (README Checks, lines 453, 487, 579) has 2 ramified, so it is outside that layer.

   Repair: own the general statement here and cite the supplier only for the route.

   1. In §2.2, add before "A route is as follows":

   > **Wiles reciprocity for an inert CM datum.** For every inert CM datum, every n≥0 and every x∈U∞*⊗_O R, transport the finite Kummer class of x through the comparison of §0.4 to H¹(Φ_n,T′). Its image under the dual exponential normalised by ω is π^(−n−1)δ_n(x)·ω, and for every finite character χ of Gal(Φ_n/Φ) the χ-weighted sum over Gal(Φ_n/Φ) is δ_χ(x)·ω (BKO21 (3.4)–(3.6), pp.952–953). The statement is local at Φ and depends on the datum only through the strict isomorphism of the formal group of the good model with F that matches ω with the invariant differential of F (NonordinaryCMSpecialValues §3.5). AnticyclotomicLocalUnits §4.3 states it for the projected classes of its auxiliary field, in which 2 splits, with the canonical character; the route there, from PadicHodgeRegulators §1.4, uses neither restriction and is repeated here for the general datum.

   2. In the route of §2.2 replace "(AnticyclotomicLocalUnits §4.3, stated for every element of U∞*⊗_O R)" by "(the reciprocity statement above)". In §§3.3 and 4.5 replace "explicit reciprocity (AnticyclotomicLocalUnits §4.3; …)" by "explicit reciprocity (§2.2; …)".
   3. Add "PadicHodgeRegulators §1.4" to the *Needs:* of §2.2, to the Layer 2 Dependencies and to the supplier contracts ("### From TauCetiRoadmap.PadicHodgeRegulators: use §1.4 for Kato's dual exponential with its ordered adjunction, as AnticyclotomicLocalUnits §4.3 uses it"). PadicHodgeRegulators is earlier in the merge order (line 327 against 348) and its §1.4 "Kato's dual exponential" exists at its head.
   4. In the contract at line 67 change "§4.3 for Wiles reciprocity in dual-exponential form" to "§4.3 for Wiles reciprocity in dual-exponential form for the projected classes of its Layer 4 datum (the general-datum statement is §2.2 here)".

   Tested on the witness: for K=ℚ(i), p=7, f=(2+2i) the new target applies (its hypotheses are those of the Conventions), and no step cites a statement restricted to fields in which 2 splits.

3. **F03** (P3) the ids `NCM.k/<slug>` name nothing in NonordinaryCMSpecialValues

   Location: 52 occurrences on 26 lines of `README.md`, first at line 29 ("NonordinaryCMSpecialValues NCM.0/cm-period") and line 71.

   Claim: NonordinaryCMSpecialValues has targets named NCM.0/cm-period, NCM.1/normalized-zeta-class and so on.

   Witness: at that roadmap's head (`TauCetiRoadmap/NonordinaryCMSpecialValues/README.md`, last changed 2026-11-15) none of the eleven slugs occurs (0 hits each; `normalized-zeta-class` never occurred in that file's history, and the board's package of that roadmap has it only in `design/plan.json`). Lines 127–136 map only the layer ids NCM.0–NCM.5 to sections.

   Repair: replace each id by the section that states it (contents checked at the head):

   | Cited id | Section at the supplier's head |
   |---|---|
   | NCM.0/cm-period | §0.4 The integral CM period |
   | NCM.0/dual-tate-convention | §2.4 Kato's realisation, de Rham line and period map |
   | NCM.1/normalized-zeta-class | §2.7 The normalised class and its integrality |
   | NCM.1/elliptic-reciprocity | §2.8 Direct-character reciprocity at an inert prime |
   | NCM.1/period-change | §2.10 Period changes |
   | NCM.2/inert-frobenius | §3.4 The inert Frobenius is multiplication by −p |
   | NCM.2/semilocal-splitting | §3.3 Splitting of p in the ring class fields |
   | NCM.2/cm-lubin-tate | §3.5 Apply the Honda comparison at π = −p |
   | NCM.3/twisted-root-sign | §1.4 The p-anticyclotomic conductor sign |
   | NCM.3/forced-central-zero | §1.5 Wrong-sign central values vanish |
   | NCM.5/central-nonvanishing | §6.4 Correct-sign central values are almost always nonzero |

   The scope paragraph's "NCM.0's …, NCM.1's …" (line 20) stays valid through the supplier's mapping table and needs no change. Two wording corrections follow from reading §2.7: at line 73 the form N(a)−φ(a)σ_a of the twisted smoothing factor is stated in §2.7 (its route, with Kato (15.9.2)), §2.6 stating it evaluated at a character as N(a)−ψ(a)χ(a)⁻¹, so cite "§§2.6–2.7"; and §2.1's "normalised elliptic-unit classes" are, at the head, classes in H¹(K(a),T_φ^∨(1)[1/p]) integral away from the residual component ρ̄, which covers the component §2.1 uses; say so in the route of §2.1 ("integral on the component used here by §2.7").

4. **F04** (P3) §5.2 carries a hypothesis its statement and route never use

   Location: `README.md:670`, "Assume E is defined over K. For s∈{+,−} and n≥0 the restriction map L_n^s→L_∞^s[ω_n^s] is an isomorphism"; and line 641, "The targets of §§5.2–5.4 and 5.6 assume in addition that E is defined over K".

   Claim: signed local control needs E defined over K.

   Witness: the statement concerns only H¹(Ψ_n,W), L_n^s and R. Its route uses H⁰(Ψ∞,W)=0, the corank of A_n^s and freeness of H/H^s (§3.3), each proved for every inert CM datum; for K=ℚ(√−23), p=5 the same argument gives the isomorphism.

   Repair: delete "Assume E is defined over K." from §5.2; at line 641 write "The targets of §§5.3, 5.4 and 5.6 assume in addition …" and "Sections 5.1, 5.2 and 5.5 need no such hypothesis: 5.1 and 5.5 are algebraic and 5.2 is local at 𝔭." The consumers §§5.3 and 5.6 keep their own hypothesis.

Read in full: `packages/InertAnticyclotomicCMMainConjecture/README.md` (849 lines) and `Suggested.lean` (41 lines, no declaration). Four findings: two P2 (a proof route that does not deliver its conclusion; a supplier cited beyond its standing hypotheses) and two P3 (supplier ids that exist nowhere at the supplier's head; an unused hypothesis that narrows a local statement).

Dependency check (`gate --depcheck … --name InertAnticyclotomicCMMainConjecture --movable --pr 13122`), whole output:

    depcheck: 235 roadmaps, 2235 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap directly after AnticyclotomicLocalUnits.

## The pass: statements, instances and computed values

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions: c(χ), Ξ^± | χ=1; order 5, 25 at p=5 | c=0,2,3; signs +,+,−; BKO21 line 251: conductor p^(n+1) for first level n | agrees |
| Unit and point sign table | χ of order 5 | V∞*,− kills Ξ⁺ (BKO21 line 299); F⁺ kills Ξ⁺ (BKO21 line 863) | agrees |
| Agboola–Howard dictionary | their Ξ⁻ (odd order, trivial) | = c even = Ξ⁺ here; their E⁺ kills their Ξ⁻ = Ξ⁺ here, so label + in both (AHII05 lines 102–109) | agrees |
| δ_1=(1+p⁻¹)δ | Coleman trace at n=0 | Σ_(w∈F[π]∖0)g(w)=(π−1)g(0); π⁻¹(π−1)=1+p⁻¹; 6/5 at p=5 | agrees |
| Deleted Euler factor at χ=1 | p=5 | 1−(−5)/25=6/5 | agrees |
| §0.1 Checks | K=ℚ(√−23), p=5 | −23≡2 mod 5, nonsquare; h=3; (X+5)², trace −10 | agrees |
| §0.4 Checks | R=O[√π] | f′(√π)=2√π; inverse different (√π)⁻¹R; quotient of order p²; Tr_(O/ℤ_p)(1)=2 | agrees |
| §0.5 converse | a=T; a=p | a(χ⁻¹)=0 only at χ=1; p≠0 at every χ; infinitely many zeros force a=0 | agrees |
| §1.1 saturation Check | n=0, R=O, y=Q, [π]Q | Q⊗π⁻¹≠0; [π]Q⊗π⁻¹=Q⊗1=0 | agrees |
| §1.2 Checks | p=5, L=Φ(β), β³=aπ | cube root of a⁴ has order 18∤24; ζ₅∉ℤ₂₅ | agrees |
| §1.3 integral nonvanishing | good v, residue size q | H¹=W(−1)^Frob, nonzero iff α≡q; rational: |α|=√q≠1 | agrees |
| §1.4 divisible part | n=0 | A_0⁺=0, A_0⁻=F(Φ): Sel_+=Sel_str, Sel_−=Sel | agrees |
| §1.5 contragredient Check | L=Φ(ζ₅), x=(ζ−ζ²)/25 | f(x)=(−2+2)/25=0; f(γ⁻¹x)=(8+2)/25=2/5; dual of γ−χ(γ) is γ⁻¹−χ(γ) | agrees |
| §2.3 root numbers | ε=+, orders p, p² | (−1)^2=+1, (−1)^3=−1 (AHII05 (3.1); BKO21 line 487) | agrees |
| §2.5 interpolation | ξ=L_p v, χ(γ)=ζ₅ | δ_(χ⁻¹)(ξ)=L_p(χ)δ_(χ⁻¹)(v); φ̄χ⁻¹=conj(φχ) (BKO21 line 841) | agrees |
| §3.1 Euler factor | K=ℚ(i), p=7, α=−1+2i | α−1=i(2+2i); 1−ᾱ/5=(6+2i)/5; twist of 1−Frob⁻¹ by φ_p⁻¹ gives 1−φ(𝔮)⁻¹Frob⁻¹ | agrees |
| §3.1 Euler system indexing | F⊂F′ in 𝒦_a | primes of lcm-moduli m′ not in m = Σ(F′/F) for N=6pfa | agrees |
| §3.2 degrees | K=ℚ(√−23), p=5 | #G=3, 72 | agrees |
| §3.3 smoothing factor | a=(α), a=O_K | d_a(1)=6−2i, norm 40; |N(a)|≠√N(a) unless N(a)=1; d_(O_K)=0 | agrees |
| §3.4 torsion route | M=Λ_(2)/(γ⁺−1) | Λ_(2)-torsion, specialisation of rank 1 | fails: R01 |
| §4.1 sequences | model S_ε=(T)⊂H^ε=Λ_R | cokernel Λ_R/(T); zero map into H/H^ε | agrees with AHII05 (3.3), (4.3) |
| §4.2 ranks | s=±ε in first sequence | rk X_(−ε)=1−1+0=0; rk X_ε=1 | agrees |
| §4.3 involution | T−a | a′=(1+a)⁻¹−1=a iff a∈{0,−2} | agrees |
| §4.3 character of W^τ | Frobenius of (α), α=−1+2i | φ(ā)=ᾱ=5/α=N/φ | agrees |
| §4.4 identities | H^ε=Λ_R, S=(T), C=(T²), char X_str=(T) | (T)(T)=(T²)=char(Λ_R/(T²)); identity 1 from (4.4) | agrees |
| §4.5 unit factor | α≡1 mod 6f, α≡2 mod p | α(ᾱ−1)≡2·1=2; α≡1 mod p gives 0 | agrees |
| §5.1 | n=0,1,2 at p=5 | ω_0⁺=1, ω_0⁻=γ−1; ω_1⁻=γ^p−1; degrees 20+5=25; zeros of ω^s on Ξ^(−s) | agrees with AHII05 lines 308–317 |
| §5.2 | n=1,s=+; n=2 | L_1⁺=0; coranks 20, 5; 𝔪/T𝔪≃R⊕R/ϖ_R | agrees; hypothesis unused: R04 |
| §5.5 | A/𝔪^k; κ²; M=Frac(A) | 1≤k; 2=2; 0≤∞ | agrees |
| §5.5 ρ versus ρ⁻¹ | f∈Λ_O | Gal(Φ(μ_(p^r))/Φ)≃(ℤ/p^r)× contains −1 | agrees |
| §6.1 | char X_(−ε)=(fg), char X_str=(f) | (fg)⊆(f); orders 1≤3 | agrees |
| §6.2 | n=0, χ=1 | E(Φ)⊗Φ one-dimensional; over ℚ_p dimension 2pⁿ | agrees |
| §6.4 | χ=1 with ε=± ; n=c(χ) | bound ord, ord+1; BKO21 lines 888–893 use conductor pⁿ and K_n | agrees |
| Gap contracts (5) | slugs in README and `design/plan.json` | same five slugs, each with a named supplier and section | declared; not raised |

## Verified sound

- `Suggested.lean`: 41 lines read, 0 declarations, single `import Mathlib`, no `set_option`, module docstring of the required form naming four headline groups and what each lacks. No headline is statable at the pins: the signed Kummer conditions, V∞*, δ_χ, L_p and the CM avatar have no pinned carrier (the carriers the docstring names as present were found at the pins). The `#check` comparison has nothing to elaborate; no Lean was run.
- Targets read: 36 subsections in 7 layers, with their 118 Checks; about 70 Checks recomputed (table above), none false or vacuous; every definition has at least three.
- Locators verified against the cached texts, 47: BKO21 (Theorem 2.1, Corollary 2.2, p.949; §2 p.948; §§3.0.1–3.0.2, pp.950–953; Proposition 3.3; footnote 3, p.960; §§6.0.1–6.0.2, pp.961–962; Theorems 6.1–6.2, pp.962–963); AHII05 (§2 pp.612–613; Propositions 3.1, 3.3, 3.4 and (3.2); Remark 3.2; Conjecture 3.5; Theorem 3.6 and (3.3); Theorems 4.1–4.3 and (4.1)–(4.4); §5 with (5.1), Lemma 5.1, Theorem 5.2, Proposition 5.3; both misprints the References record); AHI06 (Lemmas 1.1.4, 1.1.9, 1.2.1, 2.4.5, Corollary 2.4.6, Propositions 2.4.15–2.4.16, pages by the offset 999); RUB91 ((1c) p.28; §4 and (5) p.36; Theorem 4.1(ii) and Remark (2), p.37); BIL86 (Remark 3.3 p.351; Lemma 3.6; Proposition 3.8 and the Leopoldt hypothesis p.353; Theorem 3.24 pp.364–365; the introduction's numbering p.342).
- Sibling citations checked, 83 by existence of the section at the cited roadmap's current head or on main, about 35 by content: AnticyclotomicLocalUnits §§0.1, 0.5, 1.2–1.5, 2.4, 3.1, 3.2, 3.6, 4.2–4.4, 8.2, 8.4, 8.5; NonordinaryCMSpecialValues §§0.1, 0.4, 1.4, 1.5, 2.1–2.3, 2.6–2.10, 3.3–3.5, 6.4; SelmerIwasawaCohomology (17 sections); ArithmeticGaloisDuality (7); EulerSystemsAndKolyvaginSystems §§2.2, 8.1, 8.11, 8.25; ComplexMultiplicationAndExplicitReciprocity §§4.1, 4.3 with both names; IntegralIwasawaTheory §§2.2, 4.1e–4.4; PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5, 4.6; LubinTateFormalModulesAndQuasiCanonicalLifts §§2.4, 2.5, 8.2, 8.3; EllipticCurves Layers 1, 3, 4, 7; ClassFieldTheory Layers 6, 11–13; NoncommutativeAndEquivariantIwasawa §4.3; the two downstream consumers each name this roadmap once.
- Pinned declarations: all 36 Mathlib and Tau Ceti names of the README exist at the pins in the files the README gives, with the hypotheses it reports (`charIdeal_eq_mul_of_exact`: noetherian, N finite and torsion; `charIdeal_quotient_span_singleton`: domain, noetherian, factorial, f≠0; `LinearEquiv.charIdeal_eq_comap`: no noetherian hypothesis; `uniqueFactorizationMonoid`: Krull dimension ≤2; `kummerSelmerMap_injective`: elliptic, m a unit).
- Gaps: PadicMeasuresIwasawaAlgebras §4.6 has base change for an arbitrary finite free O→O′ and restriction of scalars only to ℤ_p, and no statement on order of vanishing; IntegralIwasawaTheory §4.4 covers abelian extensions of ℚ only; NonordinaryCMSpecialValues §2.2 states norm compatibility in the p-tower only. None of the five gaps asks for what is provided.
- Ownership: no second owner found for the signed Selmer groups, Rubin's L-function or the rank bounds among main and the open heads (`roadmaps overlaps` closest: ModularIwasawaMainConjecturesPartII, which defers to this roadmap). `Suggested.lean` declares no name.
- Policy: the pull request changes only the package folder; no process words or pull-request numbers in the README or the docstring; no `lemma` declaration; every target has a locator.

## Not verifiable

- Overlines are lost in the extraction of BKO21 (lines 426, 469, 825–841), so whether its displayed L-values are of φ̄χ or of the conjugate of φχ could not be read; the README's choice agrees with AnticyclotomicLocalUnits §4.4 and NonordinaryCMSpecialValues §2.8, and with BKO21's interpolation formula after χ↦χ⁻¹.
- BRU67 is waived; its content was not read.
- Rubin's remark behind condition (*) (EulerSystemsAndKolyvaginSystems §8.11) at primes dividing f that are inert over ℚ: the source text is not in the cache (see R01).
- The comparison of the inert-prime twisting dictionary with AHI06 Lemma 2.4.5 and Propositions 2.4.15–2.4.16 (§3.5): AHII05 line 187 asserts it "exactly as in" the ordinary case without proof; the README records this as a route to redo, and the gap contract carries Rubin's theorem itself.
- No Lean was elaborated (none permitted, and the file has no declaration).

Source independence: 16 passages compared with 5 sources, none shared (longest common run 4 words, in formula-forced phrases); largest share BKO21, 32 of 90 locators; contents compared with BKO21 (§§2, 3, 6.0.1–6.0.3) and AHII05 (§§2–5): independent — Layers 1 and 2 invert the order of BKO21 §§6.0.1–6.0.2, Layer 3 and Layer 4 split AHII05 §3 between them, and the order Selmer groups → units → duality → control is forced by the *Needs:* lines of §§3.1, 4.1 and 5.3.

## Source issues

- **Misprint** in BKO21 at §6.0.2, p.962 (BKO21 line 864): the source says the characters defining the signed formal points factor through the Galois group of Ψ_n over Ψ; it should be over Φ; affects nothing.
- **Gap** in BKO21 at §6.0.1 and Theorem 6.1, pp.961–962 (BKO21 lines 824–837, 881): the source places the elliptic unit in the O-module and the L-function in O⟦G⁻⟧ while the Selmer dual is an R-module for a larger R; it should use R⟦G⁻⟧, or the norm of the generator over O⟦G⁻⟧; affects a stated result.
- **Error** in BKO21 at §6.0.2, p.962 (BKO21 lines 878–879): the source says its sign convention is opposite to Agboola–Howard's when quoting their torsion theorem; it should say only the character-set labels differ, the signed Selmer labels agreeing; affects nothing.
- **Misprint** in AHII05 at the proof of Proposition 5.3, p.620 (AHII05 line 397): the source says the product of the two signed elements is γ to the power p^k minus one; it should be γ^(pⁿ)−1; affects nothing.
- **Misprint** in AHII05 at the proof of Theorem 4.2, p.617 (AHII05 line 269): the source says the quotient of the whole local module by S_ε is torsion; it should be the quotient of the signed submodule of sign ε; affects nothing.
- **Error** in AHII05 at the proof of Theorem 4.1, p.616 (AHII05 line 245): the source cites a Lemma 2.1.2 of the first paper for the symmetry; it should be Lemma 1.2.1 there; affects the proof.
- **Misprint** in BIL86 at the introduction, p.342 (BIL86 lines 56, 65): the source says the pseudo-isomorphism and the series equality are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24; affects nothing.

## For the human reviewers

- The route of §4.2 (`README.md:555`) has the same five steps, in the same order, as the proof of AHII05 Theorem 3.6 (AHII05 lines 222–231), in different words; likewise §4.4 and AHII05 lines 265–280.
- BKO21 is read from an institutional repository copy of the JSTOR-stamped published PDF (BKO21 lines 242–244 carry JSTOR terms of use); `sources.toml` classes it `institutional`.
- BRU67 is cited by locator only (waived); the Ax–Brumer input of §4.3 rests on it through a declared gap.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b0292e75b5e66e29157e0b034aec39184debee6c", "job": "RT-InertAnticyclotomicCMMainConjecture~1b", "model": "fable", "worker": "chris-x79"} -->
