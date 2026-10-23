<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/129#issuecomment-6362094679 -->
Review (claude) of 52297e2

Verdict: needs_changes

1. **F01** (P1) AutomorphicPadicLFunctions is not an allowed supplier and cannot be read anywhere

   Location: packages/AutomorphicCongruences/README.md line 31: "(c) Three atlas roadmaps that are not yet upstream and must precede this one: AutomorphicPadicLFunctions (L3h, L4, L4e, L5), KatoEulerSystems …". There are 50 citations: the contracts at lines 109–117, 133–145 and 229–233, and the *This uses* lines of L1.1, L1.4, L1.5, L1.7, L2s.1–L2s.4, L2.2, L2.4, L2.5, L2.14, L5w.3–L5w.5, L5a.3, L5a.5 and L5b.4.

   Claim: AutomorphicPadicLFunctions supplies the unitary PEL carriers, the Eischen–Wan Klingen family, Hsieh's Theorems A–C (anticyclotomic μ = 0), the Wan 2015 GU(2,2) L-function and the Perrin-Riou/Hida normalisation.

   Witness:
   - It is not on content main (no `TauCetiRoadmap/AutomorphicPadicLFunctions`).
   - It is in no open roadmap PR: `roadmaps show` reports "no roadmap AutomorphicPadicLFunctions on main or in an open roadmap pull request".
   - It is not in the board index of packages under review. Board main holds only `AutomorphicPadicLFunctionsPartII/design`, which is a different roadmap.
   - It is absent from scratch merge-order-main.txt.

   The depcheck reports 0 problems only because it never sees this name.

   Consequence: the μ = 0 input of L2.5, L2.6 (second containment), L5a.5 and L5w.3 has no owner. So does the GU(2,2)/GU(3,1) geometric carrier of L1.1, L2s.1 and L5w.4. HeegnerPointEulerSystems (PR head, README line 220) asks this roadmap for `gap:primitive-toric-mu`. L5w.3 forwards that request to the same missing supplier, so it stays unanswered.

   Repair: for each consumed item, do one of the following:
   - make it a target here;
   - declare it as `What <Supplier> must provide (gap:<slug>): <needs>` against a roadmap that is in the allowed list (for example AutomorphicBundles, PELModuli/ShimuraVarieties, PadicFamilies or AutomorphicLFunctionsAndLocalFactors) and add the slug to plan.json;
   - get AutomorphicPadicLFunctions into the merge order ahead of this roadmap and cite its sections at a readable head.

   Tested on L2.5: the repaired *Needs* must name an allowed owner of Hsieh's Theorem B. No roadmap or package currently has one (`roadmaps grep "Hsieh"` finds none outside this README).

2. **F02** (P1) Supplier "refinements" are written as supplied, but the cited sections do not contain them and no gap is declared

   Location: line 53: "A refinement named here is required with the stated hypotheses before any endpoint using it is proved." The affected contracts are at lines 119–131, 163, 181, 201–209, 211–221 and 269–291. There is no plan.json, and no `gap:` slug appears anywhere in the README.

   Witness (each cited section, read at its pin or head):
   - **PadicMeasuresIwasawaAlgebras.** The README cites "L4 (`characteristic-ideal-api-0`)" for divisorial characteristic ideals over non-factorial normal domains (L0.1, L0.3, L5w.7–L5w.12, L5b.x). TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md line 2716 (main) defines `charIdeal` only "for a finite torsion module over a noetherian normal UFD A".
   - **IntegralIwasawaTheory "I.5".** Cited for a totally real abelian main-conjecture bound (line 271). At its PR head, Layer 5 is "Ferrero–Washington without a main conjecture", and no totally real main conjecture is planned.
   - **PadicFamilies "L5".** Cited for Katz CM-field and Hida CM-Rankin functions (lines 119–131). At its PR head, Layer 5 is "Totally real ordinary families and quaternionic periods". The only Katz entry is §0.1, Katz's p-adic modular functions.
   - **OrdinaryAutomorphicFormsAndModularityLifting "R21.4".** Cited for Fujiwara's minimal theorem (line 213). Its PR head never mentions Fujiwara; the README itself calls the existing targets "insufficient".
   - **Further requests.** AutomorphicGaloisRepresentationsPartII needs a descent adapter to imaginary quadratic K (line 163: AG2.2 has [F⁺:ℚ] ≥ 2). SmoothRepresentationsOfLocalGroups SR.5 "must be refined" (line 181). GlobalGaloisDeformations is asked to "prove all six Fujiwara 6.11 clauses" (line 219). SelmerIwasawaCohomology L2–L4 has unplanned additions (lines 277–289).

   Repair: turn each request into a declared gap. Write it in the supplier's subsection as `What <Supplier> must provide (gap:<slug>): <one precise sentence with hypotheses>`, with the same slug in plan.json `gaps`; or make the item a target of this roadmap. Tested on the first item: `gap:divisorial-char-ideal-normal-domain` on PadicMeasuresIwasawaAlgebras §4.6, needs "for a finitely generated torsion module over a noetherian normal domain, the divisorial ideal of `charDivisor`, its multiplicativity in exact sequences and containment detection at height-one primes". This matches what L0.1 and L5w.10 consume.

3. **F03** (P2) `katoIntegralBound_im` restates KatoEulerSystems §4.3, misreports the supplier and drops hypotheses

   Location: line 91: "rationally and integrally under Kato's own hypothesis (12.5.2), that the image … contains SL₂(ℤ_p)". Line 95 and L5b.7 line 2511 then plan "Kato's Euler system satisfies Rubin's Hyp(ℚ_∞, T) … Rubin's Theorem II.3.3 … gives char(X_∞) divides ind_Λ(c)".

   Witness:
   - packages/KatoEulerSystems/README.md (board head 725fd74), §4.3 lines 1204–1237. `katoHypotheses_to_rubin` and `modularEulerSystemBound` already give Hyp(ℚ_∞, T) and the integral bound at every height-one prime under "a free rank-one τ-quotient and residual irreducibility over G_ℚ", which is exactly (im). KatoEulerSystems says this is weaker than the SL₂(ℤ_p) image.
   - §7.4 (lines 1941–1960) asserts char(Z_∞) divides L_E Λ only under the further condition p ∤ r_E ∏_{q divides N, q ≠ p} ℓ_q(q⁻¹).

   Repair:
   - Cite KatoEulerSystems §4.3 for the Rubin step and correct the line 91 description.
   - Restrict `katoIntegralBound_im` to the reciprocity translation from the index ideal to (L_MSD).
   - Add its missing hypotheses: p ∤ r_E for each E^χ, and the imprimitive Euler factors at q dividing N either kept (Σ-imprimitive Selmer group) or assumed to be units.

   Tested on E^χ with p dividing r_{E^χ}: §4.3 then gives only char divides r_E·L_{E,N}, not (L_MSD) ⊆ char.

4. **F04** (P2) Suggested.lean uses a free-variable algebra lemma as a headline, and its docstring does not list the headline theorems

   Location: packages/AutomorphicCongruences/Suggested.lean lines 85–95 (`factorSeparation`); docstring lines 8–17 ("representative target signatures … it is not exhaustive"); lines 99–114.

   Claim: `factorSeparation` is "the algebraic factor-separation milestone" of L5b.8.

   Witness: the statement involves only ideals `J : I → Ideal A` and elements `L : I → A` of an arbitrary domain. None of the roadmap's objects appear (no Selmer group, characteristic ideal or p-adic L-function). The README's own proof (line 2539) is three lines: multiply by ∏_{j≠i} L_j and cancel.

   The headline theorems are BCS 1.1.2(a)/(b) (L5b.9–L5b.10), SU 3.6.1/3.6.3 (L1.10–L1.11), CLW 8.2.1 (L2s.7–L2s.8), FW 7.32/4.51/5.1/5.2 (L2.6, L2.12, L4.5, L4.3) and Wan's divisibilities (L2.14, L5w.10). None is statable at the pins: there are no Selmer groups over ℤ_p-towers, no characteristic ideals over Iwasawa algebras and no Hida/Katz/MSD p-adic L-functions.

   Repair:
   - Delete `factorSeparation`; L5b.8 keeps the statement.
   - Rewrite the module docstring in the required form: "AutomorphicCongruences: target signatures", README.md is the roadmap, and one line per headline naming the missing carrier.

   Tested: once the theorem is deleted, the file elaborates with no `sorry` warning.

5. **F05** (P2) `paskunas2016_projectiveEnvelope` extends a theorem of an open roadmap; it should be a gap or a Part II

   Location: line 175: "The p = 3 case of the projective-envelope and freeness statements is the target `paskunas2016_projectiveEnvelope` of L3.5 here". Also line 1541.

   Witness: TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md (PR #1312 head) §5.8, lines 1859–1863, states "P̃ is the dual of the universal deformation of π̄" under "p ≥ 5", and §5.9 removes P̃ from Hom. The p = 3 case is that same theorem with a smaller prime bound. PadicLocalLanglandsForGL2QpPartII (board design, head 3e0777d) does not plan it either.

   Repair: replace the target with `What PadicLocalLanglandsForGL2Qp must provide (gap:paskunas-p3-envelope): §5.8 and §5.9 and Nakamura Thm 4.7 freeness for p = 3 under (N1, N3, N4)`, and add the slug to plan.json. L3.7 and L3.8 then cite the gap.

6. **F06** (P2) L0.1 claims finite generation without assuming that T has finitely many ramified places

   Location: line 329: "Its dual X^Σ_F = Hom_A(Sel^Σ_F, A^∨) is finitely generated over A". The same claim is in `SigmaSelmer.dual` (line 341). The hypotheses are only "A a profinite ℤ_p-algebra, T … continuous A-linear G_F-action".

   Witness:
   - The proof route is SU Lemma 3.1.9 (SU line 778–780), which is stated for a G_{F,S}-module with S a finite set.
   - Continuity does not force finite ramification. Take A = 𝔽_p[[X]][ε]/(ε²), primes ℓ_k ≡ 1 mod p, and a character sending a tame generator at ℓ_k to 1 + εX^k. Each value has order p, and the values tend to 1. The character is continuous on G_ℚ^ab and ramified at every ℓ_k.

   Repair: add "T is unramified outside a finite set S of places" to L0.1, to `SigmaSelmer.dual` and to the standing hypotheses of L0.2–L0.3 (SU's applications all satisfy it). Line 331, "If S contains Σ, p and the ramification of T", then becomes well posed. Tested on the character above: it is now excluded.

7. **F07** (P3) Padding in Suggested.lean

   Location: Suggested.lean lines 27–75: `EisensteinIdeal.hecke` and `EisensteinIdeal.base`, and four `example`s.

   Witness: no headline uses the two definitions. They restate `Ideal.span (Set.range …)` and `Ideal.comap`. The four examples compute the small values that the README's own Checks list: (5), (0), ⊤ and the ZMod 5 kernel. These are line 437 and L5w.6 lines 2083–2086.

   Repair: delete all six declarations from Suggested.lean. L0.4 and L5w.6 keep the statements and Checks, and the paragraph at line 319 is updated to match.

8. **F08** (P3) 170 backticked names of this roadmap are not declared in Suggested.lean

   Location: every "Provide `X`:" paragraph and every "The intended arithmetic theorem name is `X`" line. Examples: `SigmaSelmer.mk` (line 339), `LatticeDatum.toGMA` (line 465), `fujiwaraInstance` (line 1961), `cmCongruence_dvd_katz` (line 543), `ichinoTripleProduct` (line 71).

   Witness: Suggested.lean declares only `EisensteinIdeal.hecke`, `EisensteinIdeal.base` and `factorSeparation`. A script count over the README found 175 backticked names of identifier form. 172 of them are not declared in Suggested.lean; excluding `charIdeal` (PadicMeasuresIwasawaAlgebras) and Mathlib's `quotientKerEquivOfSurjective_apply_mk` leaves 170 own names undeclared. The `factorSeparation` name is also given both to the arithmetic L5b.8 target (line 2541) and to the Lean algebra lemma.

   Repair: state the API items in prose, without backticked Lean names. Keep backticks only for Mathlib, Tau Ceti or supplier declarations.

9. **F09** (P3) Supplier locators that do not exist at the cited supplier, and stale pins

   Location and witness:
   - **Campaign labels that resolve nowhere.** R20.6 (line 83), R31.4/R31.6 (lines 167, 1474), R30.5/R30.6 (lines 173, 1645), R32.1/R32.2/R32.4 (lines 185, 1033, 1455), R21.4 (line 211), R04.2 (line 1455), R08.1/R08.3/R08.6 (line 1474), R03.3/R03.6/P7 (lines 1474, 2200), IHG.n and I.5. The supplier heads use Layer 0–n numbering; the resolver lists 16 such cases in scratch citations.md.
   - **Content is at a different section or owner:**
     - PadicLocalLanglandsForGL2Qp R30.5 → §§5.5, 5.7–5.9.
     - CompletedCohomologyAndLocalGlobalCompatibility R31.4 → §§4.1, 4.5, 4.7; R31.6 → §6.2.
     - GlobalGaloisDeformations R04.2 (`universal-deformation-ring`, `fixed-determinant-rings`) → LocalGaloisDeformationRings §F.2.5/§F.2.9; GlobalGaloisDeformations' own *Needs* cite them there.
     - PadicHodgeRegulators "L3–L4" (lines 147–151, 1273) → the Coleman maps and regulator are §§8.19 and 8.22, and the noncritical refinement is §9.22 (board head 5eff35d lines 1618, 1660, 1944).
     - DirichletPadicLFunctions "L4" (line 77; that layer covers Gamma/Gauss sums) → the Kubota–Leopoldt object is IntegralIwasawaTheory §5.0, with DirichletPadicLFunctions §§2.8 and 5.8 for Euler deletion.
   - **Wrong "main" claims.** IntegralHeckeAndGaloisDeterminants and SmoothRepresentationsOfLocalGroups are linked as `tree/main` and called "existing upstream" (lines 12, 31, 197), but they are open-PR roadmaps. Line 1500 says PadicMeasuresIwasawaAlgebras' determinant functor is "not present in the current upstream checkout", but main §5.1 defines `detLine`.
   - **Stale pins.** Line 57 gives Mathlib `082e2d37…` and Tau Ceti `f7904748…`; lake-manifest.json pins Mathlib `6b7abb3c…` and Tau Ceti `a91d3aaf…`.

   Repair: cite each supplier by roadmap name and its actual section number at its head, link by name rather than to the explorer repository, and update the pins.

10. **F10** (P3) Process narrative and PR numbers in the README

   Location:
   - Line 31: 21 PR numbers "(#1019)" … "(#968)", and "not yet upstream".
   - Lines 73, 157, 243: "was not reachable for this package … sources follow-up".
   - Lines 197, 259, 1500, 1980, 2233: "current upstream …", "Current IHG.6", "requested from AC L0", "The current NumberFieldArithmetic roadmap records this … as built".
   - Lines 496, 1253, 1933: "stage".
   - Line 2109: "verify against the PDF symbols". Line 2175: "against the PDF, whose text extraction drops ≥".
   - Line 2454: "(E7)". Lines 2652 and 2671: "accessed … October 2026".

   Repair: delete these phrases. Where the content matters, say it timelessly, for example "Ichino 2008 (cited by locator)".

11. **F11** (P3) Checks that are not discriminating, or are false

   Location and witness:
   - **Not Checks at all.** L0.6 (line 496) has a single Check, "Checks the three kinds of local condition named by the stage", which is vacuous. L0.9 bullet 1 (line 567), L1.11 (line 871), L2.3 (line 1136) and L2.14 (line 1396) are consumer notes. L5w.7 (line 2109) and L5w.10 (line 2175) are process notes.
   - **Duplicate.** L1.1 Checks 1 and 5 repeat the GU(1,1) case.
   - **False.** L5a.4 Check line 2326, "Omitting this clause recovers only the original BCS selection", is false. Under (disc) and (ii), every ramified prime q of K is odd and does not divide D_F, since primes dividing D_F split in K. So FK/F is already ramified at q, and Δ+ follows without the "new ramified prime" clause. Example: K = ℚ(√−7) ramifies at 7, which is unramified in any admissible F.
   - **False at the consumer's head.** Line 2327 says HeegnerPointEulerSystems HE.8b "consumes this target". At its PR head, §8b.3 restates BCS Lemma 5.2.3 and its *Needs* do not cite L5a.4.

   Repair:
   - Replace the non-Checks with computed tests. L0.6: the unramified class at T_v = 0 versus the strict-zero condition (already in the L0 Examples).
   - Drop the redundant clause from L5a.4 and L5w.13, or prove the equivalence and state it as a Check.
   - Correct the line 2327 note.

12. **F12** (P3) Statement precision and conventions

   Location and witness:
   - **L0.7 (line 504).** The conclusions (i)–(iv) use ψ, N, N′, L(χ′) and J(χ′), which are never defined here. They are SU's internal notation (SU line 2275–2284).
   - **L2s.7 (line 1045).** "I = E_{π,ξ}A_P" follows CLW's naming (CLW line 6292) and contradicts L0.5's own convention, where I ⊂ R and J = A ∩ I (line 445). Under L0.5, E_{π,ξ}A_P is J.
   - **L5a.3 (line 2298).** It writes L_p(g^F/M) for "the base change g_F", against the line 37 convention (g^F is the twist, g_F the base change).
   - **L5w.6 (line 2059).** "𝔈_D = I_D ∩ Λ_D" presupposes an injective coefficient map, which the same section disclaims; write ker(Λ_D → h_D/I_D) only.
   - **`FWResidual.scalar_endomorphisms` (line 1438).** A21 does not force End = 𝔽 when 𝔽 is too small. Take ρ̄|G_ℚp unramified with Frob acting by the char poly X² + 2 over 𝔽_5: it is irreducible over 𝔽_5, A21's extension clause is vacuous, and End = 𝔽_25. FW line 928–929 has the same implicit assumption. Add "𝔽 contains the eigenvalues of ρ̄|G_ℚp".
   - **L3.3 (line 1484).** It cites "proof of Thm 5.1 (Lemma 2.8), p. 73", but FW Lemma 2.8 is stated on pp. 20–21 (FW line 1143–1158).
   - **L2.14 (line 1386).** It omits Wan20 Thm 1.1's hypotheses that the family is new outside p and that f_0 is the ordinary stabilisation of a newform of level N (Wan-2020 line 76–78).

   Repair: as listed.

13. **F13** (P3) `ichinoTripleProduct` is stated more generally than the text it cites

   Location: lines 71–73. The statement covers arbitrary cuspidal representations, and it is "taken from Wan-2020, §8.4, pp. 79–80".

   Witness: Wan-2020 line 4061–4063 restates Ichino's formula for "archimedean components … holomorphic discrete series of weight two". L2.4 applies the formula in weight k.

   Repair: cite Ichino 2008, Theorem 1.1, by locator under the settled key `Ichino2008`. Keep Wan-2020 §8.4 (p. 80) only for the translated-pairing variant.

14. **F14** (P3) No sources.toml, and the References omit cited works

   Location: packages/AutomorphicCongruences/ contains no sources.toml. The References (lines 2634–2677) leave out Ichino 2008, Ikeda 1994, Harris 1984, Rubin 2000, BST19, Kisin 2009, Pan, Hung 2017, Hsieh 2012/2014, JSW17, GV00 and BDP22, all of which are cited in the text.

   Witness: the brief's list for this package is the waived/settled keys (Ichino2008, Ikeda1994, Harris1984, Rubin2000, BST19) plus Kisin. None of them is in a package manifest.

   Repair: add sources.toml (schema `tauceti-roadmap-sources/v1`) with one entry per cited work, reusing the settled keys, and complete the References.

   Because the package has no manifest, the entries this review fetched (SU, FW, CLW, CLW-addendum, Wan-2020, NAK, BCS-v2, CGS23, Betina-Williams, Hid06) were recorded in the reviewer's scratch manifest, not in the package.

15. **F15** (P3) House style

   Location: there are no `*Needs:*` lines; 92 "This uses …" sentences stand in for them. API lists are "Provide `X`:" paragraphs rather than prose bullets. L0.9 (line 551) "Register[s] the residual case as the open target `cmCongruence_dvd_katz_residual`" and says that no endpoint uses it, which is a deferral.

   Repair: rewrite to `*Needs:*` lines and prose API bullets. Either make the residual target a definite target with its consumer, or delete it and leave the restriction stated only in L2s.8.

Fifteen findings: two P1, four P2, nine P3. The mathematics checked here is mostly sound: all 15 sampled targets match their sources, and every Check and worked example that was computed holds. The blocking problems are about who supplies what. One supplier is in no readable place, and many supplier "refinements" are never declared as gaps. One target restates a board package's theorem, one plans an extension of an open roadmap, one hypothesis is missing, and `Suggested.lean` uses an algebra lemma in place of a headline theorem.

Files are cited as repository-relative paths. Board packages are read at the heads given by the board index. Open roadmap PRs are read at the heads in the roadmap index of 2026-10-23T09:03:29Z. Sources are cited by manifest key and line of the cached text.

## Adversarial pass

There is one row per subsection or convention. "src" means the value was read in the source at the cited line.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. containment direction | Ch(X) ⊆ (L) vs (L) ⊆ Ch | BCS (5.4) has (L_p) ⊂ ch (Kato); L1.10 has Ch ⊆ (L) | consistent | none |
| Conv. quadratic splitting at 2 | D = −7, D = 13 | −7 ≡ 1, 13 ≡ 5 mod 8; 2 splits in ℚ(√−7), inert in ℚ(√13) | holds | none |
| Conv. dual trivialisation | t∨(Δ⁻¹) = αΛ | t(Δ) = α⁻¹Λ; FW line 4246 has Δ⁻¹ ≃ Λ | holds | none |
| Conv. reciprocal polynomial (L0 Examples) | M = diag(2,3) | det(TI−M) = T²−5T+6; det(1−XM) = 1−5X+6X²; M⁻¹: 1−(5/6)X+(1/6)X² | holds | none |
| L0.1 Σ-primitive Selmer | T = 0; T_v = 0 at ℚ_p; infinitely ramified T | X = 0, Ch = (1); unramified Hom(G/I, ℚ_p/ℤ_p) ≠ 0 kept; character with values 1+εX^k continuous, ramified at all ℓ_k | f.g. claim lacks a hypothesis | R06 |
| L0.2 primitive vs Σ | ℓ = 11, p = 5, α = 1 | 1 − 1/11 = 10/11, v_5 = 1, nonunit | holds | none |
| L0.3 specialisation | f ∈ 𝔞 | f mod 𝔞 = 0 gives an empty conclusion (Check) | holds | none |
| L0.4 Eisenstein ideal | k = 12, p = 691, p = 5; ℤ → 𝔽_5; ℤ → ℤ[X] | τ(2) − 2049 = −2073 = −3·691; 2073 ≡ 3 mod 5 (unit); I = 0 but 𝔈 = (5); the constants miss X (coeff of X is 0 vs 1); proper_iff: 1 ∈ comap ι I iff I = ⊤; src SU line 3800–3822 | holds | none |
| L0.5 lattice datum | n = 0; ν-polarisation | n = 0 is excluded by the absolutely irreducible middle block; src SU 4.2 compatibility Φᵗ = −ψ(c)Φ (SU line 1847) | holds | none |
| L0.6 local conditions | Steinberg place | uses the L0.2 element 10/11 | holds; its only Check is vacuous | R11 |
| L0.7 lattice construction | ord_P J = 2, N′ = 0 | gives ord Ch ≥ 2 (SU line 2284–2285) | holds; symbols undefined | R12 |
| L0.8 periods | unit vs uniformiser rescaling | u ∈ R^× keeps the ideal; ϖ changes the valuation by 1 | holds | none |
| L0.9 CM congruence | 𝔫 = 7, 5 at p = 3; Hid06 bound | φ(7) = 6 ≡ 0, φ(5) = 4 ≢ 0 mod 3; src Hid06 line 58 "p > 3" | holds | none (R15 for the residual target) |
| L1.1 GU(2,2) forms | n = 1 | reduces to GU(1,1) | holds | duplicate Check (R11) |
| L1.2 Hida control | q = 0/1 sequence | boundary ⊕ over C_{n−1}; rank independent of ψ | holds (SU Thm 6.3.3/6.3.10 cited) | none |
| L1.3 Eisenstein datum | specialisation I → O | Λ_D ⊗ O = O[[Γ⁻ × Γ_K]], with 3 variables and Krull dimension 4 | holds | none |
| L1.4 Klingen series | normalising twice | the constant term is multiplied by the scalar once only | holds | none |
| L1.5 SU L-function | (iii) with M⁻ = 1 | needs an odd number of inert primes, so M⁻ = 1 is excluded | holds | none |
| L1.6 Klingen family | ℰ_D ≡ 0 mod P | no bound (SU line 3839–3842 requires "nonzero mod P") | holds | none |
| L1.7 coprimality | P pulled back from 𝕀[[Γ⁺]] | excluded by (i), handled by L1.5(iii) | holds | none |
| L1.8 pseudo-character | dimension | T(1) = 4; GL₂ version gives 2 | holds | none |
| L1.9 Selmer lower bound | four characters ≡ 1 mod P | excluded by (7.3.3.a) | holds | none |
| L1.10 two-variable | χ_𝐟 ≠ 1 | excluded | holds | none |
| L1.11 cyclotomic | q ∥ N ramified | K chosen with q inert, N⁻ = q | holds | consumer-note Check (R11) |
| L2s.1 semi-ordinary projector | u ∈ ℤ_p^×; eigenvalue p | u^{r!} → 1 (μ_{p−1} killed once r ≥ p−1, v_p(r!) → ∞); p^{r!} → 0; Λ_so Krull dimension 3; src CLW line 961–965, 2107–2113 | holds | none |
| L2s.2 control/boundary | 0 ≥ t⁺ ≥ −t⁻ + 4 | src CLW line 969, 993–999 | holds | none |
| L2s.3 Klingen pair | k = 4 vs 6 | interpolation only at k ≥ 6 even (CLW-addendum line 225–229) | holds | none |
| L2s.4 joint avoidance | A = k[[X,Y]]; (L₁,₁, L₆,₂) | (X,Y) has height 2; f₁(X), g₁(Y) irreducible distinguished generate a height-2 ideal in O[[X,Y]]; src CLW-addendum line 300–347 | holds | none |
| L2s.5 CLW Eisenstein bound | proof sign | E ⊂ P^m gives ord ≥ m; source prints ≤ (CLW line 6212) | holds (typo noted correctly) | none |
| L2s.6 CAP exclusion | ordinary vs non-ordinary π | (8.2.4)–(8.2.5) force α_iα_j⁻¹ ≠ p^{±1} (CLW line 6324–6330) | holds | none |
| L2s.7 CLW divisibility | P ∩ O[[Γ⁺]] ≠ 0 | excluded (CLW line 6272) | holds | I/J naming (R12) |
| L2s.8 integrality | p = 3, 𝔫 = 7 | case (C) only; Hid06 needs p > 3 (Hid06 line 58); CLW cites HT93/HT94/Hid06 (CLW line 6380) | holds | none |
| L2.1 general-weight control | b₁ ≤ A(a,n) | outside Thm 7.11's range, no claim | holds | none |
| L2.2 vector Klingen | weight m ≥ (k−2)/2 | highest weight ((k−2)/2, −(k−2)/2, −m; κ+m) after reparametrisation | consistent | none |
| L2.3 factorisation | density | an identity in Frac by interpolation | holds | consumer-note Check (R11) |
| L2.4 two-family theorem | k = 2, 4; data sets | 1/(k−1) = 1, 1/3 (FW line 5653–5654); set 1 leaves L₁,₁ as the nonunit, set 2 leaves L₆,₂ (CLW-addendum line 303–308) | holds | none |
| L2.5 removing pulled-back primes | anticyclotomic μ = 0 | some a_i is a unit, so not all a_i ∈ Q | holds | owner missing (R01) |
| L2.6 FW divisibility | Steinberg twist | χ_ur(ℓ) = −ℓ^{k/2−1} (FW line 5724–5727) | holds | none |
| L2.7 BF classes | conductor dividing mp^∞ | LLZ avoidance does not apply (Check) | holds | none |
| L2.8 reciprocity | pseudo-null cokernel | needed for L2.9 | holds | none |
| L2.9 equivalence | p-power | equality only up to p^n | holds | none |
| L2.10 auxiliary K | ℓ = 2 vs ℓ ≠ 2 | FW Def 4.24 (FW line 3036–3044): 2 split if ℓ ≠ 2, ramified if ℓ = 2 | holds | none |
| L2.11 Yager module | m = 0; K₁ of degree p, x = 1 | d₀ = p fails; Tr(1) = p nonunit; generator iff trace unit (O_K free over ℤ_p[G], trace = augmentation) | holds | none |
| L2.12 FW crystalline | k = 2 vs 4 | α ≠ β known at k = 2 (FW line 3881–3883); E(f_α) ∋ (1−β/α) = 0 at α = β; [A →X A] at X = 0 gives H⁰ = Tor₁ = E | holds | none |
| L2.13 FW ordinary | direction | char(H¹/z) divides char(H²) (FW line 304–305) | holds | Kato bound wording (R03) |
| L2.14 Wan divisibility | Thm 1.1 (a)–(g) | src Wan-2020 line 76–94 | holds | omitted hypotheses (R12) |
| L3.1 residual predicates | p = 5 dihedral; a_p ≡ ±1; χ̄⊕χ̄; small 𝔽 | p* = 5; u² = 1 iff a_p ≡ ±1 (u² = ω² impossible for p ≥ 5); End = M₂(𝔽); X²+2 over 𝔽_5 gives End = 𝔽_25 | one API item fails | R12 |
| L3.2 R = T, CI | dimension | Krull dim 4 = 1 + 3; finite free over O[[X₁,X₂,X₃]] (FW line 986, 1123–1128) | holds | none |
| L3.3 seed points | reducible vs irreducible ρ̄_p | Lemma 2.8 congruence up to ω^{(p−1)/2} (FW line 1143–1158) | holds | locator (R12) |
| L3.4 fundamental line | [A →d A] in degrees 0,1; k[[x,y]]/(x,y) | image dA, inverse d⁻¹A (matches PMIA main §5.1 "degrees 0, 1 … image aΛ"); Fitt₀ = (x,y), char = A | holds | none |
| L3.5 completed homology | p = 3 | outside PadicLocalLanglandsForGL2Qp §5.8 (p ≥ 5) | holds | ownership (R05) |
| L3.6 equivariant zeta | j = 0 smoothing | augmentation of c² − c²σ_c is 0 | holds | none |
| L3.7 universal zeta | Σ = {p} | Euler product empty, z_{Σ,1}(f) = z(f) | holds | none |
| L3.8 specialisation | Euler factors at Σ₀ | dropping them contradicts (79) | holds | none |
| L3.9 zeta trivialisation | zero map | det 0, no injection; dual vs primal αΛ ↔ α⁻¹Λ | holds | none |
| L3.10 GenMC | t(e) = 1, ϖ, γ−1 | images A, ϖA, (γ−1)A; only the first is a unit | holds | none |
| L4.1 integrality | x/y ∉ Λ in UFD Λ | a height-one 𝔭 = (y₀) ∋ y, ∌ x exists | holds | none |
| L4.2 étale descent | x(α) unit | α ∉ m_Λ, so α is a unit | holds | none |
| L4.3 universal family | over 𝕋 vs Λ | only Λ asserted (FW line 367–377) | holds | none |
| L4.4 family to point | ramified λ(f) | avoids the zero set of β (FW line 4285–4290) | holds | none |
| L4.5 pointwise | parity 2a ≡ k−1 mod p−1 | impossible for k even, p odd (FW line 4031–4033); Cor 5.3 "iff" (FW line 4044–4045) | holds | none |
| L4.6 Euler/Tor terms | rank jump of T^{I_ℓ} | correction factor needed when not Iwasawa-suitable | holds | none |
| L4.7 congruent zeta | f ≡ g mod ϖ^m | both are specialisations of one z_{Σ,n} | holds | none |
| L4.8 residual zeta | 1 − γ in 𝔽[[γ−1]] | = −(γ−1), nonzero nonunit | holds | none |
| L4.9 residual structure | (a) vs (b) | containment needs modular or (b) (NAK line 3473–3478) | holds | none |
| L4.10 λ-defect | sample | defect constant (NAK line 3496–3499) | holds | none |
| L5w.1 Fujiwara instance | real quadratic F | no odd-degree Ihara needed | holds | supplier gap (R02) |
| L5w.2 canonical period | ℓ_f ↦ uℓ_f | ideal unchanged for u ∈ I^× | holds | none |
| L5w.3 quaternionic period | n⁻ = 1, [F:ℚ] = 2 | 0 ≡ 2 mod 2 | holds | owner (R01) |
| L5w.4 Hilbert Klingen | degenerate β | det β = 0 coefficients in (L L′) | holds | none |
| L5w.5 coprimality | P from R⁺ | excluded to L5w.9 | holds | none |
| L5w.6 Wan Eisenstein ideal | H = 8, λ = 3; ℤ → 𝔽_5 | (5) not (25); I = 0, 𝔈 = (5) | holds | notation (R12) |
| L5w.7 height-one congruence | k[x,y], P = (x) | k[y] → k(y) not onto; localising needed | holds | process Check (R11) |
| L5w.8 1+2+1 extension | ρ rank 2, χ, χ′ | trace rank 1+2+1 = 4 | holds | gaps (R02) |
| L5w.9 pulled-back primes | nonsplit μ > 0 | kept on both sides | holds | none |
| L5w.10 Wan family | non-torsion X | extended ideal 0, no torsion claim | holds | process Check (R11) |
| L5w.11 specialisation | φ(f) = 0 | no information (excluded) | holds | none |
| L5w.12 quartic CM | n⁻ = 1 | zero factors, even parity | holds | none |
| L5w.13 selected fields | ℓ ≡ −1 mod 5 | q_v = ℓ² ≡ 1 ≠ 4 = −1 mod 5 | holds | redundant clause (R11) |
| L5a.1 PR/Greenberg equivalence | E(K)[p] ≠ 0 | the left exactness fails (Check) | holds | none |
| L5a.2 quartic restriction | Shapiro over M vs K | η_F trivial on G_M, so the summands must be over K (BCS-v2 line 455–457 printed over M) | holds (correction right) | none |
| L5a.3 restricted L-function | integral vs ⊗ℚ_p | only ⊗ℚ_p (BCS-v2 line 470–475) | holds | notation (R12) |
| L5a.4 field existence | K = ℚ(√−7) | ramified at 7 ∤ D_F, so Δ+ automatic | holds | false Check (R11) |
| L5a.5 μ of Greenberg | µ(L) ≤ µ(L(X,0)) | ϖ^μ divides L ⇒ ϖ^μ divides L(X,0) (BCS-v2 line 428–433) | holds | none |
| L5a.6 product divisibility | rational to integral via μ = 0 | analytic valuation at (ϖ) is 0 (BCS-v2 line 515–517) | holds | none |
| L5b.1 four twists | χ ∈ {1, η_K, η_F, η_Kη_F} | product character is the third quadratic subfield | holds | none |
| L5b.2 quadratic decomposition | p = 2 | (1±c)/2 unavailable; excluded | holds | none |
| L5b.3 cyclotomic control | non-torsion | zero ideal not cancelled | holds | none |
| L5b.4 analytic factorisation | √|D_K| factor | a unit since p splits, p ∤ D_K | holds | none |
| L5b.5 four-factor bound | orientation | char product ⊆ analytic product | holds | none |
| L5b.6 (im) under twist | σ with χ(σ) = −1 | (−(1+N)) − 1 = −(2+N) invertible (det 4); σ²: 2N, coker ℤ_p; [[1,p],[0,1]] gives ℤ_p ⊕ ℤ/p | holds | none |
| L5b.7 four Kato bounds | p ∣ r_E | only char divides r_E·L_{E,N} | missing hypotheses | R03 |
| L5b.8 factor separation | J = ((ϖ),(ϖ)), L = (ϖ², 1); empty I | equal products, (1) ⊄ (ϖ); empty: ⊤ = ⊤ | holds | Lean stand-in (R04) |
| L5b.9 rational endpoint | p = 5 included | p > 3 (BCS-v2 line 60) | holds | none |
| L5b.10 integral endpoint | finite p-torsion coker | fails (im) | holds | none |
| L5.1 aggregate | rational vs integral | (ϖ) = (1) after 1/p | holds | none |
| Lean `hecke`/`base` | binder check | `#check`: binders [CommRing Λ] [CommRing H] present | holds | padding (R07) |
| Lean `factorSeparation` | one-tactic probe; binders | `simp` makes no progress; `exact?` finds only itself; [IsDomain A] [Fintype I] kept | true (3-line proof) | stand-in (R04) |

## Verified sound

**Source sample.** Seeded sample (seed: sha256 of the job id) of 15 targets: L0.4, L2s.1, L2s.4, L2s.6, L2s.8, L2.4, L2.12, L2.14, L3.2, L3.3, L4.5, L4.9, L5a.2, L5a.3, L5a.5. All 15 match their sources in theorem number, page, hypotheses and statement, apart from the locator and omission notes in R12 and R13. Roughly 60 locators were opened:
- SU §§3.1.3, 3.1.8–3.1.9, 4.5.5–4.5.8, 6.5.3, Thm 6.5.4.
- FW: Assumption 2.1; Lemma 2.2; Prop 2.4; Cor 2.5; Prop 2.6; Cor 2.7; Lemma 2.8; Prop 3.16; Def 4.24; Thms 4.38, 4.51, 1.6–1.8, 1.13; Prop 4.42; §4.7; pp. 92–97 (Ikeda, 1/(k−1), Props 7.27–7.29, Def 7.30, Lemma 7.31, Thm 7.32); Thm 5.1; Thm 5.2; Cors 5.3–5.4; proof pp. 72–73.
- CLW: Thm 2.9.1, Thm 4.6.1, the §7 proposition pages, Thms 8.1.1 and 8.2.1 with proofs pp. 77–81.
- CLW-addendum: all of it.
- Wan-2020: Thms 1.1–1.2, §7.5 p. 64, §8.4 p. 80.
- NAK: Thms 5.2, 5.7–5.10, 5.13; Cor 5.14; (78)–(79).
- BCS-v2: Thm 1.1.2, Prop 4.2.2, Lemmas 5.1.1–5.1.2, Prop 5.2.1, Lemma 5.2.3, (5.4).
- CGS23: Prop 1.2.4, Lemma 1.4.4, Prop 1.4.5.
- Betina-Williams: Thms A–C.
- Hid06: p. 466.

**Corrections the README makes that check out against the sources.** CLW's ≤ typo on p. 78; BCS's "over M" in Lemma 5.1.1; L2.4's two-family adaptation, which matches the addendum line by line.

**Lean.** `lake env lean` on Suggested.lean, run from the content checkout, gives one warning only: "declaration uses `sorry`" at line 90. There is no `set_option`, no `lemma` and no sorried data, and the only import is `import Mathlib`. `#check @` on all three declarations shows every binder kept.

**Library declarations at the pins.** 21 Mathlib names elaborate at pin 6b7abb3c, including `RingHom.quotientKerEquivOfSurjective`, `RingHom.comap_ker`, `Ideal.mk_ker`, `RingHom.quotientKerEquivOfSurjective_apply_mk`, `Ideal.span_singleton_mul_left_unit`, `Ideal.map_mul`, `Ideal.map_span`, `Ideal.mem_comap`, `IsRegularLocalRing`, `UniqueFactorizationMonoid` and `Module.length`. Tau Ceti declarations at pin a91d3aaf:
- `TauCeti.ContCohomology.H1`: RepresentationTheory/Homological/ContCohomology/LowDegree.lean line 712.
- `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`: AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean line 952.
- `NumberField.ncard_primesOver_multiquadratic_iff`: NumberTheory/Multiquadratic/MultiquadraticSplitting.lean line 198.
- `TauCeti.Multiquadratic.isGalois`: NumberTheory/Multiquadratic/Galois/Basic.lean line 190.
- `TauCeti.fittingIdeal`: RingTheory/FittingIdeal/Basic.lean line 343.

**Cross-roadmap citations resolved.**
- Sections that exist as cited: ArithmeticGaloisDuality R02.4 and D7; AutomorphicBundles B5; AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5, AG2.6; AutomorphicLFunctionsAndLocalFactors AL.3; MetaplecticAutomorphicForms §§6.13, 6.17–6.19; PhiGammaModulesAndIwasawaCohomology §§4.4, 4.5, 5.4; EulerSystemsAndKolyvaginSystems §§8.2, 8.37; SelmerIwasawaCohomology L2–L4; ModularSymbolsPadicLFunctions L1–L2; GlobalGaloisDeformations R04.3 and R04.6; SmoothRepresentationsOfLocalGroups SR.5; IntegralHeckeAndGaloisDeterminants Layers 1, 2, 4, 5, 6; KatoEulerSystems Layers 0–7 (§§4.1–4.4, 5.1, 5.4, 7.2, 7.4); PadicMeasuresIwasawaAlgebras §§4.6, 5.1 on main.
- Determinant convention: identical to PMIA main §5.1 ("degrees 0, 1 … image aΛ").
- Consumers: ModularIwasawaMainConjectures (board head e1ec38a) declares `gap:automorphic-endpoints` on this roadmap, which is consistent. HeegnerPointEulerSystems (PR head) imports L5a.1–L5a.3, L5w.1, L5w.3 and L5w.10, all of which exist.

**Dependency check.**
```
depcheck: 25 roadmaps, 237 edges, 0 problem(s)
```
There is no UPWARD or CYCLE line. ModularIwasawaMainConjectures, HeegnerPointEulerSystems, RankZeroOneBSD and RankOneConverse appear only as consumers. KatoEulerSystems (order 176) and PadicHodgeRegulators (order 158) precede this roadmap (order 177). The check does not see AutomorphicPadicLFunctions (R01).

**Ownership by object.**
- No other roadmap plans Ichino's triple product formula, Ikeda's dense-image theorem, Harris's CAP exclusion or the Yager module (searched with `roadmaps grep` across main and 326 open PRs, and in the board heads fetched). This roadmap is a legitimate owner of those.
- The polarized 1+n+1 lattice theorem is not a case of IntegralHeckeAndGaloisDeterminants Layer 6 (rank-two), which is correct.
- Completed Borel–Moore homology belongs to CompletedCohomologyPartII and CompletedCohomologyAndLocalGlobalCompatibility, and is not restated here.

## Not verifiable

- **Pottharst 2013** (L2.12, Thms 1.11–1.13 and 3.13): the published ANT PDF is not openly licensed, and no preprint id was found. Recorded in scratch needs-references.toml.
- **Waived or settled keys** Ichino2008, Ikeda1994, Harris1984, Rubin2000 and BST19: these are cited by locator per the brief and were not read. The Ikeda locators were checked only through FW pp. 92–93, the Ichino ones only through Wan-2020 §8.4, and Harris only through CLW p. 80 and FW p. 97.
- **Kisin 2009**: not in the cache (dry run).
- **Outside the sample, not fetched:** HT93, HT94, Hid91, Wan-2015, BCS-published, CW, KLZ17, LLZ14, Fujiwara, Vatsal, Paškūnas 2016, Kato 2004, CGS-v2. The L0.9 case (B) claims about HT94 Thm 0.3 (localisation at φ(𝔫)) and the Wan-2015 locators of L5w are therefore unchecked.
- **IntegralHeckeAndGaloisDeterminants and SmoothRepresentationsOfLocalGroups:** read at the head of their joint open PR, not on main.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "52297e2", "job": "REV-PKG-AutomorphicCongruences", "model": "opus", "worker": "fable-rev1"} -->
