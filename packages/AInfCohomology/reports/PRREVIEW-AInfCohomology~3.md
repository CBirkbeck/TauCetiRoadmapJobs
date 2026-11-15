# Review of AInfCohomology (pull request #1044 at 8356bcc)

**Verdict:** needs changes

## R01 (P3) — The pinned Tau Ceti integral perfectoid class is not cited

**Location:** `TauCetiRoadmap/AInfCohomology/README.md` lines 268–270 "That `ker θ` is principal is not in Mathlib; it is PerfectoidSpaces, P1"; line 381 "P1.24–P1.25 supply integral perfectoidness"; line 567 "`S` is integral perfectoid in the sense of BMS1 Definition 3.5".

**Claim:** the predicate and its principal kernel come only from a roadmap; the "From Tau Ceti" contract (lines 300–329) lists nothing from `TauCeti.RingTheory.Perfectoid`.

**Witness:** at the pin `2fd255d`, `TauCeti/RingTheory/Perfectoid/Integral.lean:76` declares `TauCeti.Perfectoid.IsIntegralPerfectoid` (BMS1 Definition 3.5), and line 106 proves `IsIntegralPerfectoid.isPrincipal_ker_fontaineTheta`.

**Repair:** add to "From Tau Ceti": "- **Integral perfectoid rings.** `TauCeti.Perfectoid.IsIntegralPerfectoid p A` (BMS1 Definition 3.5: some `π` with `π^p ∣ p` and `A` `π`-adically complete, Frobenius surjective on `A/p`, `ker θ` principal), with `IsIntegralPerfectoid.isPrincipal_ker_fontaineTheta`, `IsIntegralPerfectoid.isAdicComplete_span_natCast` and `IsIntegralPerfectoid.of_perfectRing`, in `TauCeti.RingTheory.Perfectoid.Integral`; `TauCeti.Perfectoid.isPerfectoidTateRing_of_isAlgClosed` in `TauCeti.RingTheory.Perfectoid.IsAlgClosed`. The class is a predicate; that `O_C` satisfies it, the nonzerodivisor property and the cyclotomic generator are PerfectoidSpaces P1.17–P1.18, P1.24–P1.25 and Layer AI.0." Change lines 268–270 to "That `ker θ` is principal is a clause of Tau Ceti's `IsIntegralPerfectoid`; that perfectoid pairs satisfy it is PerfectoidSpaces, P1, and …".

## R02 (P3) — Three references to the wrong layer

**Location:** line 3688 "Use, from Layer AI.5, the normalized length of CK §7.10"; lines 102–105 "finitely presented modules over a valuation ring with their Fitting ideals, … (AI.2)"; line 328 "AI.2 adds diagonal presentations over valuation rings".

**Claim:** the normalized length is a Layer AI.5 target, and the valuation-ring structure theorem a Layer AI.2 target.

**Witness:** *Normalized length over a rank-one valuation ring* is at line 3635, in §AI.6.7. *Finitely presented modules over a valuation ring and their Fitting ideals* is at line 1201, in §AI.1.3, and every `*Needs:*` line cites it as §AI.1.3.

**Repair:** line 3688: "Use the normalized length of *Normalized length over a rank-one valuation ring* (§AI.6.7; CK §7.10)". Lines 102–105: move "finitely presented modules over a valuation ring with their Fitting ideals" into the "(AI.1)" list. Line 328: "§AI.1.3 adds diagonal presentations over valuation rings".

## R03 (P3) — Soft hyphens inside two target titles and three proof sketches

**Location:** lines 1466 "**Dé­calage of commuting Koszul operators**", 1525 "**Dé­calage interface for Dieudonné consumers**", and lines 1481, 2156, 2480.

**Claim:** these titles are the ids other roadmaps cite.

**Witness:** each of the five lines contains U+00AD (`grep -n -P "\x{00AD}"` lists exactly these). A citation typed as "Décalage of commuting Koszul operators" does not match the title byte for byte.

**Repair:** delete the five U+00AD characters, and the same character in the citations of these two titles.

## R04 (P3) — The chart claim takes its hypothesis from the source by reference

**Location:** lines 2684–2686 "for a valuation ring `O` as in ČK, Claim 1.6.1, and a nonzero nonunit `π ∈ O`" and "`O` and `π` as in ČK, Claim 1.6.1, for the second".

**Claim:** the hypotheses of the second clause are stated.

**Witness:** ck line 220 takes `O` a valuation subring of the integral closure of `W(k̄)`; the proof (ck line 228) reduces to discretely valued `O` by a limit argument. `O = O_C` is not such a union, and the README does not exclude it.

**Repair:** "for a valuation subring `O` of the integral closure of `W(k̄)` in an algebraic closure of `W(k̄)[1/p]` (so `O` is a filtered union of discrete valuation rings) and a nonzero nonunit `π ∈ O`"; line 2686: "`U` log regular in the sense of Kato for the first clause; `O` and `π` as stated for the second."

## R05 (P3) — Broken code spans and garbled sentences

**Location:** line 1307 "`completion_I(Lη_I C)→Lη_I` Ĉ"; 1329 "`M=direct` sum over `n≥0` of `B e_n`"; 1577 "`β:N[1/f]≅P ⊗_R` R̂"; 1587 "used subsequent"; 1591 "Patch on the source two opens"; 2222 "for `i >` 0 when `E` is a commutative differential graded `𝔽_2-algebra D`"; 614 "as in §3".

**Claim:** these are the statements and routes of the targets.

**Witness:** in each the code span closes mid-formula or the sentence does not parse; line 614 names a section of no stated work (this README has no §3).

**Repair:** 1307 "`completion_I(Lη_I C) → Lη_I Ĉ`"; 1329 "`M = ⊕_{n≥0} B e_n`"; 1577 "`β : N[1/f] ≅ P ⊗_R R̂`"; 1587 "used in §AI.2.3"; 1591 "Patch over the two opens `D(p)` and `D([ϖ^♭])` of `U`"; 2222 "for `i > 0` when `E` is a commutative differential graded `𝔽_2`-algebra `D`"; 614 "as in BMS1 §3".

## R06 (P3) — The closing paragraph of the references

**Location:** line 4324 "`K`. Kato, *Logarithmic structures of Fontaine–Illusie* and *Toric singularities*; `O`. Gabber and `L`. Ramero, …; `T`. Nikolaus and `P`. Scholze, *On topological cyclic homology*; `M`. Bökstedt's computation of `THH(𝔽_p)`."

**Claim:** these are citations a reader can follow.

**Witness:** the initials are code spans; none of the eleven works has a year or venue; Nikolaus–Scholze is already the entry **NS**; "Bökstedt's computation" names no text, and the targets cite KN22 and NS for it.

**Repair:** turn each into a keyed entry of the list above, without code spans, for example "**Kat94**: K. Kato, *Toric singularities*, Amer. J. Math. 116 (1994), 1073–1099", "**Kat89**: K. Kato, *Logarithmic structures of Fontaine–Illusie*, in Algebraic analysis, geometry, and number theory, Johns Hopkins Univ. Press (1989), 191–224", "**GR03**: O. Gabber and L. Ramero, *Almost ring theory*, LNM 1800 (2003)"; delete the Nikolaus–Scholze and Bökstedt items.

## R07 (P3) — "corrected" with nothing said to be corrected

**Location:** line 2468 "Use the corrected PD envelope of `A_0→A_0/ξ_0` in Lemma 12.8"; line 2397 "Construct corrected `λ` and reduce to the perfect residue field with the corrected Tor-independence statement"; line 2540 "as corrected in Theorem 14.1".

**Claim:** the route uses a corrected form of the cited statements.

**Witness:** bms1 line 4950–4952 (proof of Lemma 12.8) introduces `A_0 = ℤ_p[[T]]` and the PD envelope of `A_0 → A_0/ξ_0` with no correction; the README names no defect at any of the three places, unlike line 1153 for Lemma 6.9.

**Repair:** line 2468 "Use the PD envelope of `A_0→A_0/ξ_0`, `A_0=ℤ_p[[T]]`, from the proof of Lemma 12.8"; line 2540 "as in Theorem 14.1"; line 2397 "Construct `λ` and reduce to the perfect residue field by *Tor independence for finite Witt vectors* (§AI.0.3)". Where the roadmap's statement does differ from the printed one, say how, as line 1153 does.

## Previous findings

- R01 — repaired: line 524 reads "**Cyclotomic period elements**. For `C` complete algebraically closed…" and line 541 "- `ε=1` makes `μ=0` and does not give an admissible primitive root system."; no backticked name under `AInf.`, `Decalage.`, `BKF.`, `AOmega.`, `AInfSheaf.`, `Semistable.`, `CohomologicalBK.` or `Trace.` remains; the docstrings at `Suggested.lean` lines 93, 116, 124 name target titles.
- R02 — repaired: the description reads "the shifted finite Witt coefficient maps `θ̃_r` from the `θ_r` supplied by PerfectoidQuotients §0.2, and their kernels".
- R03 — repaired: the validation sentence is gone; "The README's own Lean names are exactly the declarations of `Suggested.lean`" holds (11 of 11 names occur, no other own name).
- R04 — repaired: the AI-assistance sentence names Codex, Claude Fable 5.1 and Opus 5.5 and the repair passes.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions witness (line 180) | `Spf O_C`; p=2 | `θ(μ)=1−1=0`; `θ(ξ̃)=Σ1=p`; `θ̃(μ)=ζ_p−1`; `θ̃(ξ̃)=Σζ_p^j=0`; p=2: `ξ=1+[ε^{1/2}]↦1+(−1)=0` | holds; swapping `ξ`,`ξ̃` fails all four | none |
| `ker_fontaineTheta_eq_span_xi` | hypothesis only on `(ε^{1/p})^♯`; p=2 | primitive `ζ_p` forces `ε^♯=1` and all `ζ_{p^n}` primitive; `θ(xi)=0` | matches BMS1 3.16–3.17 (p.25) | none |
| `iInf_span_xiLevel_eq_span_mu` | r=1,2 | `xiLevel 1=ξ`; `xiLevel 2=ξφ⁻¹(ξ)=μ/φ⁻²(μ)`; mod p: `⋂(ε−1)/(ε^{1/p^r}−1)O^♭=(ε−1)O^♭` by valuations `1−p^{−r}→1` | bms1 lines 1320–1344 | none |
| `finite_witt_coherence` | r=1; zero map; m=0 | kernel = source `Fin m → W_r`, FG; r=1 is coherence of a valuation ring; `O_C^♭` is the integers of a perfectoid field | BMS1 3.24 covers both rings | none |
| `ainf_deRhamPlus_flat` | carrier | `deRhamMap` is `algebraMap` into `AdicCompletion (ker θ[1/p]) A_inf[1/p]` = `BDeRhamPlus` (`BDeRham.lean:75`) | ck line 2616 (§6.1, p.60) | none |
| `ainf_invert_p_projective_free` | M=0; rank 1 | rank 0 free; `(p,x)[1/p]=A_inf[1/p]` | BMS1 Cor 4.12 (p.37) | none |
| `ainf_free_of_torsionFree_reduction` | `A_inf/p`; `(p,ξ)`; M=0 | `M_tor/ξ↪M/ξ` p-power torsion ⇒ 0 ⇒ `M_tor=0`; `M̄[ξ]↪M/ξ` ⇒ `M̄=0`; `(p,ξ)/ξ`: `p·[ξ]=0`, `[ξ]≠0` | BMS1 4.13 last clause | none |
| Regularity of integral periods | `(p,μ)`, `(p,ξ)` | `A_inf/p=O_C^♭` domain; `μ↦ε−1≠0`; `A_inf/ξ=O_C` torsion-free | 3.10 p.22, 3.17 p.25, 3.23 p.27 | none |
| Flat cyclotomic power-series specialization | j=0; mod p | `𝔽_p[[T]]→O_C^♭`, `T↦ε−1` nonzero nonunit, torsion-free over a DVR; local map | Remark 4.31, Lemma 4.30 (p.43) | none |
| Square-zero divided differential | `[ℤ →4 ℤ]`, f=2 | `δ_0(1)=2`; `f·δδ(x)=dδ(x)`, `f·dδ(x)=d²x=0` | Def 6.2 (p.49) | none |
| Completion at the décalage ideal | `C=ℚ`, `ℤ/p`, `ℤ` (f=p) | `ℚ`: 0 both sides; `ℤ/p`: `Lη=H⁰/H⁰[p]=0` both; `ℤ`: `lim Lη(ℤ/pⁿ)=lim ℤ/p^{n−1}=ℤ_p` | Lemma 6.20 (p.55) | none |
| Truncation bounds for décalage (source issue) | `C=[ℤ→0]` in degrees n−1, n | `(ηC)^{n−1}=f^{n−1}ℤ⊄fⁿℤ` though `Hⁿ=0`; the map still exists: `dx=fⁿdw` | README's route is right | none |
| Linear module patching | `Tor₁(M,R/f)=M[f]=0` | so `M⊗R̂` is f-torsion-free without flatness of `R→R̂` | SW20 5.2.9, PDF p.48 = printed 38 | none |
| Kedlaya triviality | primes over p | `(p)` and the closed point only (rank-one `O_C^♭`) | Lemma 4.6 (p.34) | none |
| Derived p-completed A_inf sheaf | affinoid perfectoid | `H⁰=A_inf(R⁺)`, `H^{>0}` killed by `[𝔪^♭]` | Def 5.4 (p.46), 5.5–5.6 (p.47) | none |
| `Sq⁰` on `E∞`-`𝔽_2`-algebras | degree 0; cdga | degree 0: `x↦x²`; `Sq⁰(ax)=a²Sq⁰(x)`; cdga: 0 for `i>0` | Remark 7.8 (pp.58–59) | R05 (line 2222) |
| Absolute A_crys comparison | locators | Thm 12.1 p.96; Lemma 12.8 p.100; Prop 12.9 p.102 | statement matches | R07 |
| Cohomology finiteness from period realizations | `A_inf/(μ)` | `pμ`-localization 0, `⊗B_crys⁺` not projective: both hypotheses needed | Cor 4.20 (p.40) | none |
| Log regularity and the divisorial log structure | chart; `O=O_C` | `(a_i)↦∏t_i^{a_i}`, `a↦π^a`; limit argument needs `O` a union of DVRs | ck lines 220–231 | R04 |
| All-coordinates root covers | group | `Δ_{Σ,Λ}=Δ_Σ×∏Δ_λ`, generators `δ_σ`, `δ_{λ,i}`, `1≤i≤d` | ck lines 1626–1663, 1738–1745 | none |
| Normalized length | `V/(pⁿ)`; `V/(π^a)`, `π^e∼p`; DVR | `n`; `a/e`; length when p is a uniformizer; `Fitt₀(⊕V/a_i)=(∏a_i)` | ck lines 3123–3136 (p.71) | R02 (line 3688) |
| Étale–log crystalline torsion inequalities | second from first | `l(Hⁱ(ℤ/pⁿ))=n·r+l(Hⁱ_tors/pⁿ)+l(H^{i+1}_tors/pⁿ)` on both sides | Thm 7.9 (p.70) | none |
| Frobenius-twisted Breuil–Kisin de Rham map | `K=ℚ_p(p^{1/p})` | `θ_𝔖(u)=π^p=p`; `O_K` finite over `𝔖` via `φ` (rank p), perfect | BMS2 11.2(2) p.298, 11.12(2) p.304, proof p.306 | none |
| Breuil–Kisin twist base change | r>s | `φ(E)=E^p+pδ(E)`; `φ^{s−1}(E)^p∈(p,E_s)` since `p^s≥(p^s−1)/(p−1)`; so `φ^s(E)≡p·unit mod E_s`; `θ̃(f(E))=E(π)=0` | 4.2 p.262, 4.24 p.276, 4.33 p.281 | none |
| Worked examples | q-integers; BK shift | `[−1]_q=−q⁻¹→−1`; `ℤ_p/p^a⊗O_K=O_K/π^{pa}`; conic: log de Rham ranks 1,0,1 | consistent with the targets | none |
| BMS1 Theorem 1.8, proper specializations | locators | Thm 1.8 p.5; Thm 14.3 p.119; (i)–(iv) as in §AI.5.1 | match | R07 (line 2540) |

- Gate: the worker's gate passes every check; `lake env lean` on `Suggested.lean` gives six `declaration uses sorry` warnings (lines 79, 87, 96, 113, 118, 127) and nothing else. One-tactic probe (`rfl`, `infer_instance`, `simp`, `simp_all`, `exact?`) closes none of the six. Nothing is changed outside the folder.
- Dependency check: `depcheck: 247 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD or CYCLE line. AInfCohomology is line 83 of the merge order; every consumer it names is later.
- Source locators checked against the text (41): 26 in bms1 (arXiv v3), 3 in the published BMS1, 10 in ck, 3 arXiv and 3 published in BMS2, SW20 Lemma 5.2.9; all agree with the README's theorem numbers and pages.
- Library declarations opened at the pins (37): the 22 Mathlib and 15 Tau Ceti names checked from the supplier contracts all exist, e.g. `WittVector.FractionRing.frobeniusRingHom` (`Isocrystal.lean:83`), `BDeRhamPlus` (`BDeRham.lean:75`), `TauCeti.fittingIdeal_baseChange` (`FittingIdeal/BaseChange.lean:151`). `TauCeti.Perfectoid.IsIntegralPerfectoid` is R01.
- Cross-roadmap citations resolved (24): PerfectoidSpaces P7.16 (both `ProEtaleSite.*` names, README lines 17309, 17360), FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.18, R07.4.15, R07.4.16, CrystallineCohomology CR.2, CR.4, CR.4.4, CR.5:log-algebra, PerfectoidQuotients §§0.0–0.3, DerivedDeRhamCohomology §§1.13, PD.6–PD.7, 5.23, ClassicalAdicEtaleCohomology §§1.3, 4.7, ArithmeticGaloisDuality D7.3, PadicPeriodRings §§2–4, EnhancedDerivedSheaves E4, E5, AdicEtaleGeometry A1. All 245 internal title-and-section citations resolve to a target in the cited section.
- Elaborated signatures: `mu` and `deRhamMap` drop only binders their types do not need; the six theorems keep `CompleteSpace`, `IsAlgClosed`, `CharZero` through `include`. README and Lean generality agree.
- Eleven open roadmaps, none on main, still cite the removed labels (`AInf.cyclotomic`, `AInf.linear_module_patching`, `AInf.Trace.tateFinite`, `AInf.Trace.tateOrbit`, `AInf.Yan`, …): CohomologyComparisons, RefinedTraceMethods, RelativeFarguesFontaine, PrismaticCohomology and its Parts II–IV, PadicHodgeTheory, GaloisActionOnEtaleCohomology, QWittVectors, KTheoryFiniteLocalFields. Their repair is in those roadmaps.
- Overlap check: read PrismaticCohomologyPartIV, PrismaticCohomologyPartIII, PrismaticCohomology, CohomologyComparisons, CrystallineCohomology, PerfectoidSpaces, EnhancedDerivedSheaves, AdicSpacesPartIV, RefinedTraceMethods; principal p-décalage and log regularity (definition): CrystallineCohomology, cited; Bökstedt periodicity and THH of connective `E∞`-rings: here (§AI.7.2), imported by RefinedTraceMethods; BKF modules, `AΩ`, `Lη_I`: here, imported by the Prismatic parts.
- Source independence: 22 passages compared with 4 sources (BMS1, BMS2, ČK, SW20), none shared beyond formulas (longest run 7 words, line 2222 against bms1 line 2812); largest share ČK, 311 of 570 locators, all in Layer AI.6; contents compared with ČK and BMS1: the layers are independent of both (BMS1 §§3, 6–7, 4, 5+9, 8+10–12, 14 against AI.0, AI.1, AI.2, AI.3, AI.4, AI.5); inside AI.6, §§AI.6.3–AI.6.7 run in the order of ČK §§4–8 with §6 split, §§7–8 merged and §9 moved into AI.6.4, an order the `*Needs:*` lines of §AI.6.7 force.

## Not verifiable

- Kato, *Toric singularities*, Theorem 11.6 (line 2688): not opened; checked only through ČK's own citation of it at ck line 231.
- Huber 1.7.3(iii), Gabber–Ramero 6.1.14, 6.3.1, 6.3.5 and 7.1.6, Beilinson §§1.15–1.16, Nekovář–Nizioł §3A: cited at targets I read, not opened.
- ČK's base ring in Claim 1.6.1: the extraction drops the overline of `W(k)`; R04's repair reads it as the integral closure.
- The targets outside the sample and the headline rows were read for citations, Checks and locators' form, not recomputed.

## Source issues

- **Error** in BMS1 at Lemma 6.9, proof, printed p.51 (arXiv v3): the source says the degree `n−1` term of the décalage lies in `I^n ⊗ C^{n−1}`, the quotient being `I^{n−1} ⊗ H^n(C)[I]`; it should be that the quotient is an extension of that by cocycles modulo `I`, and only the image of `d` lies in `I^n ⊗ B^n`; affects the proof.

## For the human reviewers

- Arrangement: §§AI.6.3–AI.6.7 follow the order of ČK §§4–8 (with one split, one merge and §9 moved), and ČK supplies 311 of the README's 570 parenthesised locators, all in Layer AI.6 (`TauCetiRoadmap/AInfCohomology/README.md` lines 2903–3750).
