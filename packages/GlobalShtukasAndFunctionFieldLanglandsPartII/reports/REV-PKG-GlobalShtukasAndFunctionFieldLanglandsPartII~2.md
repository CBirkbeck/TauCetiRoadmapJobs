<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1152#issuecomment-6394617286 -->
Review (claude) of ce1bda8

Verdict: needs changes

1. **F01** (P1) §4.0's all-prime anchor depends on unowned p-adic inputs held by a later roadmap

   - **Location.** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md` line 578: "This construction includes the companion comparison and local conductor/invariant transfer that extend the étale conclusion to p=2 and p=3. A crystalline invariant formula alone is insufficient." Other affected lines:
     - line 582: "zero for every p, with the companion and conductor comparison included";
     - line 13: "KloostermanSheavesAndBesselIsocrystals §§KB.1, KB.6, KB.7 and KB.11 consume this anchor", and the same paragraph puts "crystalline companions" outside the scope;
     - line 594 (*Needs*): it names only ℓ-adic suppliers, and §4.0 has no proof route.
   - **Claim.** §4.0 builds the étale Kloosterman anchor at every prime p from its listed inputs and supplies it to KloostermanSheavesAndBesselIsocrystals. §4.2, §4.4 and §4.5 (Gan–Harris–Sawin at every p) use that anchor.
   - **Witness.** hny line 976: Theorem 2 needs p good (p>2 for B, C; p>3 for F₄, G₂). xz line 2503: Remark 4.5.8(i) lifts this only via Corollary 4.5.6's p-adic companions, planned in KB.6 and KB.7 (merge position 259 > 243).
   - **Why this blocks.** No layer here, no supplier named in §4.0, and no pinned declaration provides the p-adic step:
     - the Bessel F-isocrystal adjoint computation (xz Corollary 4.5.7, xz line 2478);
     - the étale–crystalline monodromy comparison (xz Corollary 4.5.6, xz line 2469).

     The board design of KloostermanSheavesAndBesselIsocrystals owns both: KB.6 *rigidity-local*, KB.7 *etale-monodromy* and KB.11 *all-prime-corollaries*. KB.1 *eigenobject* also plans the étale eigenobject itself. If KB imported §4.0, as line 13 asserts, the two roadmaps would form a cycle. The dependency check cannot see this, because §4.0 does not cite KB. The defect predates round 2. The F02 repair recommendation of the first round overlooked that the small-prime step is p-adic, and the repair then stated the problematic ownership explicitly.
   - **Repair.** Restricting §4.0 to good primes is excluded by the general-library principle. Choose one of the following.
     - **(a) Import from KB.**
       - Cite KloostermanSheavesAndBesselIsocrystals KB.1 (*eigenobject*, *trace-companions*), KB.6 (*rigidity-local*), KB.7 (*etale-monodromy*) and KB.11 (*all-prime-corollaries*) as §4.0's suppliers for the small-prime case.
       - Keep as this roadmap's own target only two things: the identification of the Kloosterman parameter with the global excursion parameter (normalized Satake and Chebotarev, ghs Remark 3.10, ghs line 486), and the no-proper-Levi consequence.
       - Delete the line-13 sentence saying KB consumes §4.0, and add KB to the supplier contracts.
       - Rerun the dependency check. It should move this roadmap after KB, whose design cites only GlobalShtukasAndFunctionFieldLanglands GS.0–GS.1, and show no CYCLE line.
     - **(b) Move the inputs down.** State the two p-adic inputs as targets here: the adjoint rigidity of the Bessel isocrystal (xz Corollary 4.5.7) and the companion monodromy comparison (xz Corollary 4.5.6). Name their suppliers, for example PadicDifferentialEquationsAndRigidCohomology (position 139). Remove "crystalline companions" from the out-of-scope list and write §4.0's proof route.
   - **Test of the repair.** Take split G₂ over 𝔽₂(t) or 𝔽₃(t) at the auxiliary place x of §4.2. hny Theorem 2 does not apply there. After repair (a), KB.11 covers "every almost-simple H at every p" and KB.7 transports the result to the étale side. After repair (b), the moved-down targets cover p = 2 and 3.

2. **F02** (P3) Two locators do not support their statements

   - **Location.**
     - Line 451 (§3.3): "Include products, Weil restriction and twists by characters through the abelianization". Its locator (line 455) cites ch26 Theorem 3.8 and ghs Theorems 2.1(iii) and 2.3(iv)–(vi) and Corollary 2.4(ii).
     - Line 386 (§3.0): "(fs, Proposition IX.5.1, p. 328, fs line 12683)". The same page is given at line 1361 and in the `fs` locator of `sources.toml` (line 214).
   - **Claim.** The cited texts state these results at these pages.
   - **Witness.** ghs lines 284–307 and ch26 lines 473–482 state only induction, pro-p Iwahori and normal image. Products and Weil restriction are fs Theorem I.9.6(vi)–(vii) (fs lines 1337–1342, p. 36). fs line 12683 precedes the p. 328 header (fs line 12694).
   - **Repair.**
     - In §3.3, add "fs, Theorem I.9.6(ii), (vi)–(vii), p. 36, fs line 1337" to the locator. Add to the proof route: "products, Weil restriction and twists: transport fs Theorem I.9.6 through §3.2."
     - Change "p. 328" to "pp. 327–328" for Proposition IX.5.1 at line 386, at line 1361 and in the manifest entry.

3. **F03** (P3) The not-statable list omits §4.0

   - **Location.** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean` lines 11–39 (the list of headlines not statable at the pins).
   - **Claim.** The list names every owned headline.
   - **Witness.** README line 13: "Section 4.0 owns the all-prime étale Kloosterman anchor, including its local adjoint-invariant comparison". No item of the docstring mentions Kloosterman anchors.
   - **Repair.** If §4.0 keeps an owned all-prime theorem (R01, repair (b)), add an item: the all-prime étale Kloosterman anchor lacks lisse ℓ-adic sheaves on curves and the Kloosterman automorphic datum. Under repair (a) no headline remains in §4.0, and nothing needs to be added.

4. **F04** (P3) Some Checks still restate an API bullet or another Check

   The F13 duplicate pattern still occurs at these places. The repair is to delete each listed Check or clause. The Check count after deletion is given for each definition.

   | Section | Check (README line) | Duplicates | Count after deletion |
   | --- | --- | --- | --- |
   | §0.3 | line 183 | API line 175 | 7 |
   | §2.1 | line 324 ("L(σ, 1) is the constant sheaf of rank one") | API line 318 | 4 |
   | §3.4 | line 490, second clause | Check line 489 (GL₂ Steinberg eigenvalues q^(±1/2)) | 6 |
   | §4.1 | line 621 | API line 613 | 6 |
   | §6.1 | line 919, first clause | API line 911 | 5 |
   | §7.3 | line 1082 | API line 1077 | 4 |

5. **F05** (P3) Garbled pointers and formatting

   - **Location and repair.** Each item below names the defect and its fix.
     - Line 1305 reads "by §8.1 and §8.1 every split w ∉ S has real part ½h^∨". Change it to "by §8.1 and the recognition theorem of §8.0".
     - *Needs* lines 802, 980, 996, 1115, 1149, 1157, 1259 and 1319 contain ".;". Remove the stray period.
     - Duplicate *Needs* entries: line 158 lists MotivesAndAlgebraicCycles §6.3 twice, line 1115 lists §7.3 twice, and line 1149 lists §3.2 twice. Keep one of each.
     - Check lists are broken by blank lines at lines 155, 509, 528, 623, 658, 847 and 1277. Delete the blank lines.
     - Paragraphs at lines 395, 585, 793 and 1178 start with a stray leading space. Remove it.
     - The "## Layer" headings at lines 214, 302, 382, 572, 750, 893, 1005 and 1158 have no blank line before them. Add one.
     - "the generic place" at lines 848 and 984 is undefined. Write "the place v of §5.4(1)".

Round 2 checked the fourteen findings of the first review (F01–F14) against the repaired package. All fourteen are repaired (table under *Verified sound*). The repairs introduced no false Check and the padding is gone: `Suggested.lean` now declares nothing, and its docstring explains why. One blocking defect remains. The F02 repair made §4.0 the owner of an all-prime étale Kloosterman anchor. Its small-prime case rests on p-adic Bessel F-isocrystal and companion inputs. Those inputs are planned only by KloostermanSheavesAndBesselIsocrystals, which comes later in the merge order, and this roadmap's Scope puts crystalline companions out of scope (R01). The other four findings are P3.

## Verified sound

### Repairs of the first round (14 of 14 repaired)

| Finding | Repaired passage (quoted) | Status |
| --- | --- | --- |
| F01 | line 386: "apply the abstract excursion centre map of LanglandsParameterStacks §LP2e.15 and its Schur-object parameter of §LP2c.8 to the coherent continuous Hecke datum … exported by HeckeStacksAndLocalShtukas §§HS4.1 and HS4.7" | Repaired. LP2e.15 and LP2c.8 were read at the open head and say "the Bernstein-centre application belongs to the consumers". HS4.1 and HS4.7 were read. Layer 3 Dependencies (line 571) were updated. |
| F02 | line 7: "Section 3.0 owns their equal-characteristic local Fargues–Scholze application"; line 13: "Section 4.0 owns the all-prime étale Kloosterman anchor" | The text is repaired, but the §4.0 ownership statement is defective (R01). The use of HS2.9 for §3.1 is correct: HS2.9 covers "both characteristics". |
| F03 | Suggested.lean lines 7–9: "None of this roadmap's headline theorems is statable at these pins; consequently this module declares no targets." | Repaired. |
| F04 | line 1263: "its two `Finsupp.mapDomain` margins"; Mathlib contract at line 37 | Repaired, though differently from the request: the definitions were deleted together with F03. |
| F05 | Suggested.lean lines 16–17, 24–27 and 35–36 now cover Satake rationality, Beuzart-Plessis pseudo-globalization, the spherical separator and the extraneous-point classification. | Repaired. §4.0 is still missing from the list (R03). |
| F06 | lines 49, 594 and 749: "FunctionFieldArithmetic §5.8 (Chebotarev)" | Repaired. At the open head, §5.8 is "Quantitative Chebotarev in each degree". |
| F07 | line 37 "§8.4"; line 500 "coefficient-transport contract specified at §3.3 … (the parameter-square-root-transport contract)"; line 1323 "§§5.1 and 8.0"; line 651 "pp. 38–39" | Repaired. ghs Lemma A.3 ends at ghs line 1869 on p. 39. |
| F08 | line 13: "Counting local systems, crystalline companions, special cycles, Tate cohomology and potential automorphy are outside this roadmap's scope." | Repaired. A grep finds no invented roadmap name. |
| F09 | line 630: "Let G be connected reductive … Fix an automorphic character ξ of the smooth connected central torus"; line 1218: "connected semisimple over K and split at v" | Repaired, differently from the request. The torus case is computed in the adversarial table below. |
| F10 | line 435: "For every occurring excursion parameter σ to which Π belongs in the sense of §2.1"; line 630: "every occurring global parameter σ to which Π belongs" | Repaired. |
| F11 | line 156: "At q=4, cyclic C₃ inertia with trivial Frobenius image also has all weights 0, since 4≡1 modulo 3." | Repaired. |
| F12 | line 827: "For odd p, Kummer theory identifies this group with Br(K′)[2]. For p=2, Artin–Schreier theory gives H²=0" | Repaired. The stacks-as Tags 03PL (line 1410, p. 31), 03R7 (line 4359, p. 95) and 0A3K (line 4444, p. 97) were read. |
| F13 | The twenty listed bullets are gone, and each definition still has three or more Checks. | Repaired. Restating Checks remain elsewhere (R04). |
| F14 | line 842: "including the central reduction of the reductive-central-reduction contract"; line 269: "a maximal torus … root subgroups on which ω is ≤ 0 … proper unless ω vanishes on all roots"; line 872: "generic at every w ∉ S" | Repaired, differently from the request. The sign change was checked on SL₂ and SL₃ (adversarial table). |

### Principles

- No new route-specific shortcut was introduced.
- The parent roadmap (open pull request head) is imported by numbered section. Its §§1.4, 1.9–1.14, 2.1–2.5, 2.9–2.10, 3.6, 3.10, 3.12, 4.8, 4.12, 5.3–5.10, 6.1–6.2 and 7.6–7.9 all exist with the stated content. Parent §6.2 supplies the weight-0 algebraicity that §1.1 uses. Parent §5.13 only formulates the multiplicity-space conjecture that §6.3 proves in the elliptic case.
- No copied passage, no computational algorithm and no LaTeX delimiters were found.
- Process words: a grep for so-far, removed, packet, round, pull-request numbers, paths and TODO markers finds none.
- `Suggested.lean`: one `import Mathlib`, no `set_option`, no declarations and hence no sorry'd data, one module docstring titled "…: target signatures", and a namespace.

### Source sample (15 targets; the author flagged no locator as unverified)

| Target | Locator checked (source line, printed page) | Result |
| --- | --- | --- |
| 0.1 | ch26 Def 2.5 (line 323, p. 7); ghs Def 2.5 (line 329, pp. 7–8) | Supports. ghs gives the analogous purity condition. |
| 3.1 | lh Props 5.13 and 5.14 (lines 1737 and 1787, pp. 37–38), Thm 5.16 (line 1818, p. 39), Lemma 5.18 (line 1870, p. 40), Thm 2.12 (line 699, p. 15), Thm 4.9 (line 1316, p. 28), Prop 4.12 (line 1383, p. 29) | Supports: formally étale, formal scheme for large deg N, étale Θ_n with levels n·v and n·v+N, partial Frobenius. |
| 3.3 | ch26 Thm 3.8 (line 473, p. 10); ghs Thm 2.1(iii) (line 266, p. 6), Thm 2.3(iv)–(vi) (lines 284–307, pp. 6–7), Cor 2.4(ii) (line 320, p. 7) | Supports, except products and Weil restriction (R02). |
| 4.0 | hny Thms 1–2 (lines 950 and 976, p. 17), Cor 2.13 (line 982, pp. 17–18); xz Cors 4.5.6–4.5.7 (lines 2469 and 2478, pp. 53–54), Rem 4.5.8 (line 2503, p. 54); ghs Prop 3.9 and Rem 3.10 (lines 450 and 486, pp. 10–11) | The locators are correct. The small-prime conclusion rests on xz's p-adic route (R01). |
| 4.3 | ghs Lemma A.1 (line 1789, p. 38), Lemma A.3 (line 1834, p. 39); glo Lemma 8.1 (line 1673, p. 38), Prop 8.2 (line 1726, p. 39) | Supports exactly, including "same cuspidal support" only. |
| 4.5 | ghs Thm 1.2 and Cor 1.3 (lines 110 and 116, p. 3), Cor 3.12 and Rem 3.13 (lines 519 and 524, p. 11); ch26 lines 571–576 (p. 12) | Supports. The published Theorem 1.2 has no restriction on p. |
| 4.8 | ch26 Thm 4.3 and sketch step (2) (lines 531–547, p. 11) | The README adds a geometricity hypothesis. The addition is justified: step (2) is a gap in the source (*Source issues*). |
| 5.2 | ch26 proof of Thm 5.4 (lines 665–680, p. 14) and footnote 6 (line 685, p. 14); stacks-as Tags 03PL, 03R7 and 0A3K | Supports. |
| 5.3 | ch26 proof of Thm 5.4 (lines 639–696, pp. 14–15) | Supports. The fixed-ι tempered clause avoids the source's use of Thm 4.3 at line 690. |
| 5.4 | ch26 Thm 5.4 (line 609, p. 13); standing hypotheses (lines 372–374); Cor 6.32 (line 1192, p. 25) | Supports. The central-compact hypothesis is needed (G₂ row below). |
| 6.5 | ch26 Exp 5.9 and Sketch 5.10 (lines 731 and 757, pp. 15–16); sun Thm 2.11 (line 667, p. 14) | Supports. sun proves ι-mixedness only, and the integrality is the declared gap. |
| 7.2 | ch26 Conj 1.3 (line 167), Conj 1.8(a)–(c) (lines 188–196), Exp 1.9 (line 201), all on p. 4 | Supports. |
| 8.2 | ch26 Thm 1.11 (line 230, p. 5); Prop 10.2 (line 1554, p. 32); proof (lines 1566–1581, pp. 32–33); Rem 8.6 (line 1394, p. 29) | Supports. Split at v. The adjoint and central-compact clauses are narrower than the source, and justified. |
| 8.4 | ch26 Property A (line 1639, p. 34), proof (lines 1642–1654), Rem 10.8 (line 1691, p. 35) | Supports, including the column-exceeds-row direction. |
| 8.6 | ch26 Thm 10.3 (line 1592, p. 33), Rem 10.7 (line 1681, pp. 34–35) | Supports. |

The new fs locators of §3.0 were also checked:
- Def/Prop IX.4.1: fs line 12667, p. 327.
- Thm IX.5.2: fs line 12745, p. 329.
- Prop IX.3.2 proof: fs line 12651, pp. 326–327.
- Thm VIII.4.1: fs line 11272, p. 291.
- Cor VIII.4.3: fs line 11346, p. 292.
- Prop IX.5.1: p. 327, not 328 (R02).

### Adversarial table (values computed)

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.2 Check, C₃ inertia | q=4 and q=5 | 4 mod 3 = 1, so Frobenius fixes C₃. 5 mod 3 = 2, so σ=σ⁻¹ and σ³=1 give σ=1. | holds | none |
| §0.1 geometricity | G_m over 𝔽₄, values 2 and 3; (3+4i)/5; e^i | 2·log₄2 = 1. 2·log₄3 = 1.58496 is not an integer. \|(3±4i)/5\| = 1 with minimal polynomial 5x²−6x+5. e^i is transcendental. | holds | none |
| §0.3, §2.3, §4.1 Salem Check | x⁴−x³−x²−x+1 | Root moduli are 1, 1, 1.722084 and 0.580692. | holds | none |
| §1.3 sign (F14), SL₂ | diag(2,1/2), q=4 | Weights are 1 and −1, with W₋₁ = ⟨e₂⟩. E₂₁ is kept and E₁₂ is not, so the stabilizer is the lower Borel. | holds | none |
| §1.3, SL₃ | diag(4,1,1/4) and diag(2,2,1/4) | Weights (2,0,−2) keep E₂₁, E₃₁ and E₃₂, a Borel. Weights (1,1,−2) keep E₁₂, E₂₁, E₃₁ and E₃₂, a proper parabolic with a GL₂ Levi. | holds | none |
| §1.3 improper case | diag(1,1) | All ω = 0, so the stabilizer is SL₂ (dimension 3). | holds | none |
| §3.0 unit and torus (F01) | G=1; G_m with uniformizer value 2 or 1/2, q=4 | The unit scalar is 1. φ_A(Frob) is 2 or 1/2, which separates the inverse convention. | holds | none |
| §3.0 scalar action | GL₂ Steinberg and trivial, q=4 | Both pairs are (2,1/2) with trace 5/2. N has rank 1 and 0 respectively, so the scalar action cannot recover N. | holds | none |
| §3.1 lattice (F02) | GL₁, lattice z^(−d)O_v, d ∈ {1,2}, deg v ∈ {1,2} | deg O_X(dv) = d·deg v gives 1, 2, 2 and 4. | holds | none |
| §3.3 Weil restriction | unramified quadratic E/F, χ(ϖ_E) = 2, q_F = 4 | The induced eigenvalue √2 has weight 0.5 relative to q_F. | holds | R02 locator |
| §3.5 transport (F07) | q=5, √5 ↦ −√5 | The pair (√5, 1/√5) becomes (−√5, −1/√5) with the same moduli and weights ±1; (−I)² = I. | holds | none |
| §4.0 anchor | Kl₂ against constant rank 2 | Swan conductors 1 and 0; invariants at ∞ of dimension 0 and 2. | holds | none |
| §4.0, p=2 | SO₃ with inertia image A₄ | Adjoint invariants (3 + 3·(−1) + 8·0)/12 = 0. | holds, but the fact comes from xz Rem 4.5.8(iv), a p-adic source | R01 |
| §4.0, p ∈ {2,3} | split G₂ | The hny Theorem 2 hypothesis p>3 fails, so the invariant vanishing needs xz Cor 4.5.6. | input unowned | R01 |
| §4.2 torus (F09) | G = G_m, ξ = 1 | Exactly one Π, namely Π = 1; the adjoint Lie algebra has dimension 0. | holds | none |
| §4.2 irreducibility | PGL₂ with Kl₂ anchor | Adjoint inertia invariants are 0, while a proper Levi gives a 1-dimensional invariant line. | holds | none |
| §4.3 pseudo-coefficient | PGL₂ Steinberg EP function | Traces: St = 1, trivial = −1, induced = 0 = 1 + (−1). | holds | none |
| §4.5 | PGL₂ Steinberg, q=4 | Eigenvalues 1/2 and 2 (weights −1, 1), N of rank 1, pure of weight 0. | holds | none |
| §4.6 | G_m character χ(ϖ) = 3 against PGL₂ Steinberg, q=4 | 1.58496 is not an integer (shows the semisimple hypothesis is needed); St gives weights ±1. | holds | none |
| §4.7 | PGL₂ Steinberg over ℚ(√5) | Exponent \|χ(a)\| = 1/√5 under both embeddings, which is < 1. | holds | none |
| §4.8 | Salem ζ against (3+4i)/5 | Salem: moduli 1 and 1.722, so the parameter is not geometric and is excluded by the hypothesis. (3+4i)/5: every conjugate has modulus 1. | holds | none |
| §5.2 obstruction (F12) | p odd; p = 2 | p odd: H²(K′, ℤ/2) ≅ Br(K′)[2] by stacks-as Lemma 28.1 and Thm 61.6. p = 2: H^q = 0 for q ≥ 2 by Lemma 63.1. | holds | none |
| §5.3 | Steinberg anchor; constant value 3 on a complete curve | Weights ±1 (integers) against 1.58496 (not an integer). | holds | none |
| §5.4 central-compact | split G₂, s_c = (−1)^a on aα₁∨+bα₂∨, ν = ½ω₂, q=4 | With s_c the coroot values are −1, −2, 2, 2, −2, −4, none equal to 4^(±1). Without s_c they are 1, 2, 2, 2, 2, 4, and 4 = q gives reducibility. | holds | none |
| §5.4 PGL₂ | complementary pair (√2, 1/√2), q=4 | Weights ±0.5, excluded. | holds | none |
| §6.5 | G_m → Spec 𝔽_q; BG_m | H¹_c has weight 0 and H²_c weight 2. H^(−2i)_c(BG_m) = ℚ̄_ℓ(i) has weight −2i. | holds | none |
| §7.2 | trivial PGL₂ with ψ = 1⊠std; complementary diag(q^(1/4), q^(−1/4)) | Weights ±1 equal the eigenvalues of h. The complementary class has weights ±1/2 and fails (a). | holds | none |
| §7.5 | rational Hecke operator with polynomial T²−2 | Eigenvalues ±√2 (degree 2); model over ℚ(√2). | holds | none |
| §7.6 | ℚ̄_ℓ[T]/(T−a), a transcendental | Dimension 1 with eigenvalue a, which is not algebraic. | holds | none |
| §8.2 split at v (F09) | cover of residue degree 2: q 4→16, eigenvalue 2→4 | 2·log₄2 = 1 = 2·log₁₆4. | holds | none |
| §8.2 and §8.5 | dual Sp₆, partition (2,2,2) | Central profile 3δ₁+3δ₋₁; extraneous profile δ₂+δ₁+2δ₀+δ₋₁+δ₋₂. | holds | none |
| §8.4 Property A | all symmetric arrays on [−2,2]² with entries 0..2 | 19,683 arrays checked with 0 violations. Without symmetry, a(1,0) = 1 violates it. | holds | none |
| §8.6 nonsplit cover (F09) | ramification index 2 | N becomes 2N: same rank and same orbit. | holds | none |
| §8.6 direction | Sp₆ | At index 2, r = 1 > c = 0, contradicting Property A (which requires c > r). | holds | none |

For the text no repair touched, the first round's rows with computed values are relied on. Its thinner rows (4.6–4.8, 6.5, 7.5–7.6) are recomputed above.

### Duplication and ownership

- **Pins.** At Mathlib 6b7abb3 and Tau Ceti a91d3aa, a grep for WeilGroup, WeilDeligne, Shtuka, Kloosterman, lisse, DualGroup and Jacobson–Morozov returns 0 hits in each.
- **Mathlib contract.** `Finsupp` (`Mathlib/Data/Finsupp/Defs.lean:88`), `Finsupp.mapDomain` (`Mathlib/Data/Finsupp/Basic.lean:267`), `Finset.sum_comm`, `Finset.sum_eq_single`, `Finsupp.sum`, `Representation`, `LinearMap` and `AlgebraicGeometry.Scheme` all elaborate (`#check` in a scratch file).
- **Tau Ceti contract.** `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91` and `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272` exist as described.
- **§3.0.** HS4.7 assigns fs Proposition IX.5.1 to ExcursionOperatorsAndSpectralAction ES1. That roadmap exists nowhere: it is not on main, not in an open pull request, and only its Part II design is on the board. IgusaVarietiesAndTorsionConcentration IG.F.21 (open head) builds the same action only for finite E/ℚ_p. No readable roadmap owns the equal-characteristic case, so §3.0's ownership stands.
- **§3.1 and §3.2.** A roadmaps grep finds no other Li-Huerta or Gan–Harris–Sawin target.
- **Pseudo-coefficients (§4.3).** AutomorphicSpectralTheory 6.18 treats real groups only. EndoscopicTransferAndUnitaryTraceComparison 2.16 is restricted to characteristic 0. The elliptic-pseudo-coefficients gap is therefore not already provided.
- **Consumers.** SmoothRepresentationsOfLocalGroupsPartII (position 294) and LieHighestWeightPartII (293) consume §§5.1, 8.0 and 8.5. This move-down is recorded in Scope.
- **§4.0.** See R01.
- **Open pull requests.** Ownership against them was checked with the index tool over all 353 open heads, together with the board packages.

### Supplier order

Output of the dependency check:

    moved: GlobalShtukasAndFunctionFieldLanglandsPartII moved in the merge order from #27 to #243, right after its last supplier HeckeStacksAndLocalShtukas (ArithmeticGaloisRepresentations, LanglandsParameterStacks, MotivesAndAlgebraicCycles, DiamondEtaleCohomology, DiamondSixOperations, DeligneWeightsAndPurity, FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 49 roadmaps, 566 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The hidden edge to KB is R01. The repair report quoted a different run (48 roadmaps, 549 edges, no moved line); the moved line is not a defect.

Every cited supplier section exists at the head where it lives:
- LanglandsParameterStacks LP0.1–LP0.4, LP1.11–LP1.12, LP2e.5, LP2e.15, LP2c.1–LP2c.4 and LP2c.8.
- HeckeStacksAndLocalShtukas HS0.1–HS0.4, HS1, HS2.9, HS3.1–HS3.4, HS4.1 and HS4.7.
- FunctionFieldArithmetic 5.8 and 6.1–6.6.
- SmoothRepresentationsOfLocalGroups SR.0.2, SR.1.3–SR.1.5, SR.2.2, SR.3.1–SR.3.4, SR.4.1–SR.4.2 and SR.5.2.
- DeligneWeightsAndPurity 0.1–0.19, 5.2–5.12, 7.8–7.9, 8.5 and 8.17–8.18.
- ArithmeticGaloisRepresentations 2.6; MotivesAndAlgebraicCycles 6.3; ReductiveGroupsPartII RG2.3–RG2.5.2.
- DiamondEtaleCohomology C0; DiamondSixOperations S1.2, S1.5 and S2.1–S2.4.
- NilpotentOrbits N0–N2 (main); RepresentationTheory/LieHighestWeight Layers 0 and 6 (main); SchemeAndStackFoundations Layers 1–2; EtaleCohomologyFoundations F.0–F.4.
- KloostermanSheavesAndBesselIsocrystals KB.1, KB.6, KB.7 and KB.11 (board main).

The citation resolver's only lead (KB) is a board package, not a missing roadmap.

### Gap audit

- **Declaration.** All nine slugs are present in `design/plan.json` and in the README with identical needs sentences (checked by script).
- **Supplier order.** FunctionFieldArithmetic (171), SmoothRepresentationsOfLocalGroups (27), DeligneWeightsAndPurity (95) and NilpotentOrbits (main) all precede position 243.
- **Minimality.** None of the requested contents is already provided:
  - SmoothRepresentationsOfLocalGroups has no pseudo-coefficients.
  - DeligneWeightsAndPurity §8.5 covers schemes, and §8.24 only smooth proper Deligne–Mumford stacks.
  - Parent §1.4 gives stack operations and the trace formula but no weight preservation.
  - NilpotentOrbits N2 item 4 has orbit classes but no named exceptional profiles.
- No other dependency is written as supplied while missing, apart from R01.

### Shape and Lean

- **Elaboration.** `lake env lean packages/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean`, run from the content checkout, exits 0 with no output. There are no declarations, so there is no sorry warning.
- **Signature audit.** The `#check @name` audit has no local declarations to check. The cited Mathlib names elaborate.
- **README shape.** Summary, Scope, Conventions, contracts, build guide, Layers 0–8 each with Examples and Dependencies, Downstream consumers, Worked examples and References are all present.
- **Checks.** Every definition has three or more Checks, also after R04's deletions.
- **Backticked names.** Only Mathlib names are backticked; there are no backticked names of this roadmap's own.

### Headlines and padding

- **Headlines.** §§0.2, 0.4, 1.1–1.4, 2.2, 3.0–3.3, 3.5–3.8, 4.0, 4.2–4.8, 5.1 (local theorem), 5.3–5.5, 6.2, 6.3, 6.5, 7.5, 7.6, 8.0–8.2, 8.5 and 8.6.
- **Statability.** None is statable at the pins: Weil groups, L-groups, lisse sheaves, shtukas, automorphic modules and unitary duals are all absent. Mathlib's `IsSl2Triple` (`Mathlib/Algebra/Lie/Sl2.lean:38`) is not sufficient.
- **Property A (§8.4).** It is a free-variable lemma and correctly excluded.
- **Padding.** None: there are no declarations, so the one-tactic probe has nothing to test.
- **Docstring.** It names every unstatable headline except §4.0 (R03).

## Not verifiable

- The neutral-element sides of the E₇ and E₈ comparisons in §8.5 were not recomputed. They need the named-orbit identifications, which are the declared gap.
- The arXiv v3 of ghs, cited in the `ghs` version note as assuming p>3, was not read. The published text was read.
- The Annals version of ch26 was not collated. The README uses arXiv v1 numbering throughout and says so.
- KB.6, KB.7 and KB.11 were read as design statements only. Their p-adic proofs are not verified here.
- lz, xue, laf02, ty and st beyond the passages above were not reopened (outside the sample).

## Source issues

- **Misprint** in ch26 at Theorem 1.11, p. 5 (also in the paragraph after Expectation 1.9, p. 5): the source says the hypotheses are Conjectures 9.1 and 9.3; it should be Conjectures 9.1 and 9.5, since 9.3 is a displayed decomposition asserted by Conjecture 9.5(1); affects nothing.
- **Gap** in ch26 at Theorem 4.3 and step (2) of its sketch, p. 11: the source says every local monodromy of L(Π,τ) is geometric because G is semisimple; it should require integral weights, which are known only from an anchor or Expectation 5.9; affects a stated result.
- **Gap** in ch26 at §1.2, paragraph after Expectation 1.9, p. 5: the source says the parametrization is promoted to an Arthur parameter satisfying all of Conjecture 1.8; Theorems 1.11 and 10.3 only fix weight patterns and real parts and build no global ψ; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ce1bda8", "job": "REV-PKG-GlobalShtukasAndFunctionFieldLanglandsPartII~2", "model": "opus", "worker": "fable-rev98"} -->
