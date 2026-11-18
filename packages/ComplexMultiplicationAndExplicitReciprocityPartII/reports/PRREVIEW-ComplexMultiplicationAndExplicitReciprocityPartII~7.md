# Review of ComplexMultiplicationAndExplicitReciprocityPartII (pull request #1695 at 87d95d3)

**Verdict:** needs changes

**Summary.** Needs changes, for two supplier defects and no mathematical one: every formula, Check and sampled source locator I recomputed or opened agrees with the text. The Borcherds section of §4.2a is planned a second time although GrossZagierAndArithmeticHeights §6.20a owns it, and the quadratic completion and the Artin conductors are cited to a heading that AutomorphicLFunctionsAndLocalFactors does not have (AnalyticNumberTheoryPartI owns both). There are three small corrections and one format note, none blocking. Two points are left to the human reviewers: the board plan still declares three gaps of the removed layers, and the Colmez scan carries a JSTOR stamp.

## R01 (P2) — The Borcherds section of §4.2a is constructed here although GrossZagierAndArithmeticHeights §6.20a(e) already owns it

Now that Layer 4 is the only route to the averaged formula, its Borcherds input has two owners: an implementer of §4.2a would build the lift a second time, on a second carrier, and the two could not be compared afterwards.

§4.2a (README line 525) asks to "prove that, after replacing f by a sufficiently divisible positive integral multiple, there is a rational Borcherds section Ψ(f) of ω^(c_f(0,0))", its route "descends the Borcherds product", its *Needs* (line 541) names only §4.2 and MetaplecticAutomorphicForms Layers 4–7, and the MetaplecticAutomorphicForms contract (line 1062) says the "support-controlled Borcherds inputs are the constructions of §§4.2–4.2a and §4.5 here". GrossZagierAndArithmeticHeights §6.20a(e) (pull request #1487, `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` line 1993; earlier in the merge order) states the same object under the same hypotheses: base ℚ, signature (p,2) with p ≥ 3, a weakly holomorphic f of weight 1 − p/2 for the lattice Weil representation with integral principal part, the Borcherds function Ψ(f) with its divisor on the special divisors, and, in its route, the rational section of L^(c(0,0)) after passing to a multiple. Its part (f) is Borcherds' criterion for the existence of forms with prescribed principal part, which the existence statement of §4.5 uses.

The smallest change: in §4.2a import the lift and its generic-fibre divisor from GrossZagierAndArithmeticHeights §6.20a(e), and keep as this roadmap's targets what that section does not state, namely the norm identity `Φ(f) = −log‖Ψ(f)‖² + c_f(0,0)·log(4π e^γ)`, the descent to the integral model and the vertical support clauses. Add the citation to the *Needs* of §4.2a and to Layer 4's Dependencies, add a `From TauCetiRoadmap.GrossZagierAndArithmeticHeights` contract, and change the sentence of line 1062 accordingly. §4.5 would cite §6.20a(f) for the criterion behind its existence statement.

## R02 (P2) — The quadratic completion and the Artin conductors are cited to a heading that AutomorphicLFunctionsAndLocalFactors does not contain

Six *Needs* and Dependencies lines and one contract send the reader to a section that is not there, and the supplier itself says the material is elsewhere, so §§0.1, 0.3, 3.4 and 3.5 have no resolvable owner for the completed quadratic L-function and for local Artin conductor exponents.

The README cites "AutomorphicLFunctionsAndLocalFactors Layer AL.1, “CM quadratic completion and orbital comparisons”" at lines 71, 91, 123, 427, 437 and 475, and line 986 consumes it "for the precise quadratic finite/completed gamma adapter". On main, Layer AL.1 of that roadmap (README line 643) has no heading of that name; its only quadratic section is AL.1.7, "Quadratic orbital comparison" (line 1136), about Zhang's orbital integrals, and its own deferral list (line 28) reads: AL.1.7.1–AL.1.7.2, the CM quadratic Hecke completion and its gamma logarithmic correction, are AnalyticNumberTheoryPartI §2.22a. That section exists (AnalyticNumberTheoryPartI README line 1749, "2.22a CM quadratic completion and gamma correction") and states exactly the Λ of the Conventions, `Λ_η(s) = Q^(s/2) Γ_ℝ(s+1)^g L_f(s,η)` with Q = D_E/D_F. The conductor exponent that §3.4 extends linearly from irreducible characters is AnalyticNumberTheoryPartI §2.2a, "Artin conductors" (line 1309); Layer AL.1 has only the conductor exponent of a quasi-character (AL.1.1.1). No open pull request adds the cited heading.

The smallest change: replace the citation by AnalyticNumberTheoryPartI §2.22a in §§0.1 and 0.3, and by AnalyticNumberTheoryPartI §2.2a in §§3.4 and 3.5, in the two Dependencies lists and in the supplier contracts; the `From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` subsection then has nothing left to consume and its remaining sentences belong under AnalyticNumberTheoryPartI.

## C01 — The Lubin–Tate contract points at a §6.2 that this README no longer has

In the `From TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts` contract (line 1000): "The CM complementary-type multipliers and their comparison modulo the different are §6.2 here, not supplier material." The layers now run 0–4 and 9–13; there is no Layer 6 and nothing in the remaining text uses complementary-type multipliers. Delete the sentence.

## C02 — Harmonic weak Maass forms and the shadow operator are used in §§4.2 and 4.2b with no owner cited

§4.2 takes "a harmonic weak Maass form f of weight 1−n/2 in the lattice Weil representation" and §4.2b uses "the Bruinier–Funke shadow" ξ(f); the *Needs* lines name MetaplecticAutomorphicForms Layers 4–7, which define neither (its only Maass space is the weight-one-half one of its §7.2). The spaces H_k(Γ,ρ), H_k⁺ and the ξ kernel for Weil representations are QSeriesPartitionsAndMockModularForms §§8.3 and 8.5, on main. Add that citation to the *Needs* of §§4.2 and 4.2b and to the supplier contracts.

## C03 — "A uniformizer acts trivially" holds for the uniformizer 5 only

In the Lubin–Tate Check of the Conventions (line 36): "A uniformizer acts trivially on that torsion field." Under arithmetic reciprocity over ℚ₅ the uniformizer 5 fixes ℚ₅(μ₅), but the uniformizer 10 = 5·2 acts as the unit 2 does, by 2⁻¹ = 3. The supplier contract says it correctly (rec_K(π) for the π that defines G_π). Write "The uniformizer 5 acts trivially".

## N01 — OrthogonalSpinGroups is named as a supplier in the scope and used by no target

The scope (line 942) says the lattice and group theory behind §§4.2–4.5 "are supplied by IntegralLattices and OrthogonalSpinGroups", but no *Needs* line and no contract names OrthogonalSpinGroups, although §4.2 builds a GSpin model. A citation in the *Needs* of §4.2, with a contract line, would let a reader find the Clifford and GSpin input.

## Deferred findings

- D01 — stands

## Previous findings

The previous review (of `8c1992c`) had no finding; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conventions: target formula and metric shifts | E=ℚ(i), y²=x³−x | ℓ(0)=−log4+2log(Γ(¼)/Γ(¾))=0.7832; RHS −0.3916−0.3466−0.9189=−1.657; h_Fal−½log2=−1.3105−0.3466=−1.657 | Agree |
| 0.1 CM class functions (sample) | ℚ(i); C₂×S₃ type; C₆ function (0,1,1,0,−1,−1) | (1,0)=(1+χ)/2; overlaps 6,2,2 → 10/3, translates 0,4,4 → 8/3, sum 6; f(r)=1≠f(r⁻¹)=−1 | Checks true; A Def. 9.1.1–9.1.3 at A lines 5002–5052 |
| 0.3 average character | σ=1, σ=c, d=1,2 | σ=1: 2^d·d/(2d)=2^(d−1)=2^(d−2)(1+1); σ=c: 0=2^(d−2)(1−1); Z̃ gives −ℓ(0)/2−log(D_E/D_F)/4−d·log(2π)/2 | Agree; A (9.3.1), line 5116 |
| 1.1 CM height torus (sample) | d=1, d=2, general d | dim 2d−(d−1)=d+1; G_m∩ker N_F/ℚ=μ_d; single-embedding vector has pair sums (1,0,…) not constant for d>1 | True; A §3.1 lines 1012–1038 (source calls the diagonal an embedding) |
| 1.5 total reflex pair (sample) | E=ℚ(ζ₈) | types {1,3},{1,5},{7,3},{7,5}; stabilisers {1,3},{1,5} → ℚ(√−2), ℚ(i); degree 4=2², dimension 2 | Product, as stated; A lines 1209–1244 |
| 2.1 crystalline local representations (sample) | read at locator | A Prop. 3.5.2, Remark 3.5.3 (lines 1291–1360): factorisation through image of E_q×, K_q=K_p∩T_q | Supported |
| 2.4 CM bundles and crystals (sample) | read at locator | A Prop. 3.5.5(1)–(5), lines 1408–1426: de Rham homology, dual Dieudonné crystal, W(F̄_q) fibre | Supported; README narrows the crystal to the étale locus |
| 2.5 Hecke and torus actions (sample) | F=ℚ(√2), u=3+2√2 | N(u)=9−8=1, u≠1 acts on E; t∘f_a∘t⁻¹=f_(a t/t̄), trivial for t∈F× | H₀ not a T-representation; A lines 1514–1542 |
| 2.6 metric on ω₀ | E=ℚ(i), z=(1,i) | B(z,z)=2(1−1)=0; B(z,z̄)=2(1+1)=4>0; source's sign gives −4 | README sign right |
| 3.2–3.5 partition length and conductors (sample 3.5) | A=ℤ₃, B=C=ℤ₃[√3], singleton | C[x]/(x−π,x+π)=C/(2π), length 1; μ_p(a_ηη)=v_P(2π)/2=½; (2/2)(½+½)=1; general: cross-pair sum both ways | Agree; A Lemma 9.4.4 and Prop. 9.4.5 as printed give −1 |
| 3.6–3.8 determinant relation | solve for Ω♯ | (2^(d−1)log D_F + 2^(d−1)·deĝω₀/deg − 2^d·d·log2π)/2 · 2^(−d) = log D_F/4 + deĝω₀/(4deg) − d·log(2π)/2 | Equals §3.8 |
| 4.2a Borcherds support | n=5 self-dual at 2; odd p, v_p(D)=1, 2 | Clauses of A Thm 4.8.1 (lines 2585–2607): p odd, p²∤D ⇒ E_p=0; n≥5 ⇒ E=E₂; self-dual at 2 ⇒ 0 | Matches; ownership: R01 |
| 4.2c Hodge-height identity (sample) | Γ_ℝ′/Γ_ℝ(1); ℚ(ζ₈), ξ=√2 | −½(logπ+γ+log4); so −2Λ′/Λ−d·log(4πe^γ)=−2ℓ(0)−log(D_E/D_F); Tr(√2·x x̄)=8(a₁a₂+b₁b₂); ⟨1⟩ dual coset norm ¼ | Agree; A Thm 8.3.4, line 4989 |
| 4.2d + 3.8 + 0.3 chain | combine | deĝω₀/deg=−2ℓ(0)−log D_E; mean=−ℓ(0)/2−log D_E/4+log D_F/4−d·log(2π)/2 | Equals the target formula |
| 4.5 bad-prime elimination (sample) | d=2, p=2; d≥2 | n⋄=2d≥4≥3; L⋄ self-dual at p ⇒ p∤D_L⋄ ⇒ E_p absent from Σ_(p∣D); rank Λ=2 | Supported; A lines 5760–5811 |
| 4.6 imaginary quadratic average (sample) | E=ℚ(i) | −ℓ(0)/2−log4/4−log(2π)/2 = −log R_Γ−½logπ = −1.0847−0.5724=−1.657 | Check true; C lines 297–300, 339–370; A lines 53–56 |
| 9.1 averaged Colmez (sample, headline) | ℚ(i) via s=1 form | log4/4+ℓ(1)/2−γ/2−log2π = 0.3466+0.1230−0.2886−1.8379=−1.657 | Both forms agree; A Thm 9.5.5 and Prop. 9.3.1 |
| 10.1 `relative_class_number_growth` (headline) | exponents; ε≥¼; sextic | D_E^(½−ε)/D_F^(½+ε) ≥ D_E^(¼−3ε/2); ε≥¼: h_E/h_F≥1≥D^(≤0); regulator ratio 2²/Q∈{4,2} | True; one-tactic probe leaves it open |
| 10.2 `distant_cm_isogenies` (sample, headline) | ℚ(i), ℚ(√−3), ε=⅛; ideal count | 4^(−⅛)·4^(⅛)=1; (¾)^(⅛)=0.9647; Hom(A,B)=b·a⁻¹, degree N(x·a·b⁻¹); classes with ideal of norm ≤X ≪X^(1+ε) < h_E | True, A fixed first; T lines 138–151; probe open |
| 10.3 individual bound | m=2, b=−1, heights (−1,3) | 2·1−(1)(−1)=3≥3; functional equation gives ℓ(0)=−log Q+d(log2π+γ)−ℓ(1) | Agree |
| 11.1–11.3 primitive orbit bound (sample 11.3) | g=1; κ=2, δ=1/16 | 2·3⁴=162, 4·3⁸=26244; (1+√2)⁸=577+408√2≡1 mod 3; δκ=⅛<3/16, εκ=1/16<3/16 | True; T Thm 1.2 (line 31), Lemma 4.1, Thm 4.2 (lines 241–265) |
| 12.3 compact index | ℤ+3ℤ[i]; exp at p=2 | J=3, D=36; I=|𝔽₉×|/|𝔽₃×|=4, I²D_E=64≠36; n−v₂(n!)=1,1,1; 2n−v₂(n!)=3,5,9 | Checks true; T12 line 731 prints the I-form |
| 12.4 reduction to primitive fields (sample) | exponent bookkeeping | orbit ≥ c·B^(ω(J))·I·P^δ′; J≤I^c·P^d; D=J²P ≤ I^(2c)P^(2d+1); B^(#S)≥c_η(IP)^(−η) | Positive power of D survives; T12 Thm 7.1, (4), (5) |
| 12.5 orbit bound for every CM point (sample) | read at locator | T Thm 5.2 (lines 274–277); PT14 Conj. 7.1 (line 654) | Supported |
| 13.2–13.3 lattice Checks | ℤ[i]; 2ℤ[i]; ψ=Im(x̄y) | covolume 2⁻¹·2=1; Gram diag(2m,2m), det 4m²; diag(8,8), det 64; det q=1=|Nm i|·det ψ; λ₁≥2g by AM–GM | True |
| 13.5 bounded-degree finiteness | read at locator | PT14 Lemma 7.4 (line 751); MZ §5.4 (lines 1437–1444) | Supported |
| LT contract Checks | ℚ₅, u=2; ℚ₂ | 2·3≡1 mod 5; 2·13=26≡1 mod 25; u=3 acts by 3 mod 4 | True; wording of line 36: C03 |

- Source locators checked against the text: 31 (A 20, T 6, T12 2, PT14 2, MZ 1, C 2 passages at their cited lines), all on the cited statement and page.
- Library declarations opened at the pins: 27 (Mathlib `CMField.lean` 70, 142, 164, 373, 439; `ClassNumber.lean` 65, 70, 78; `FlatRank.lean` 89, 202, 232; `Discriminant/Basic.lean` 126; `Covolume.lean` 171; Tau Ceti `AbelianVariety/Basic.lean` 95, 118, 171, `End/Basic.lean` 74, 83, `Isogeny.lean` 61, `Hom/Basic.lean` 133, `IdealCount/Basic.lean` 399, `Discriminant/Basic.lean` 61, `Orders/Discriminant.lean` 70, 85, 115, `IntegralLattice/Basic.lean` 63, `SuccessiveMinima.lean` 47); each line opens on the named declaration.
- Cross-roadmap citations resolved by opening the supplier: 24 roadmaps' sections on main or at their open heads; one does not resolve (R02); one owner is uncited (R01) and one is missing (C02).
- Automatic checks: all passed at this head; dependency check `depcheck: 201 roadmaps, 2196 edges, 0 problem(s)`, no UPWARD or CYCLE line; no path changed outside the folder; worktree clean.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings (lines 50 and 72) and nothing else. Elaborated types compared with §§10.1–10.2: every binder (`0 < g`, `0 < ε`, `NumberField E`, `IsCMField E`, `finrank ℚ E = 2 * g`, `A.dim = g`) is in each signature; nothing changed.
- One-tactic probe on a copy (`simp`, `rfl`, `infer_instance`, `aesop`, `positivity`): both theorems stay open at the outer existential. No padding. The eight headlines the docstring lists as not statable were checked against the pins: neither library has a Faltings height or a CM type.

Overlap check: read GrossZagierAndArithmeticHeights, GrossZagierAndArithmeticHeightsPartII, FaltingsFinitenessAndIsogenyTheoremsPartII, ComplexMultiplicationAndExplicitReciprocity, AbelianSchemesAndArithmeticModuliPartII, ArakelovGeometryAndAbelianHeights, PELModuli, HilbertModularVarietiesAndShimuraCurves; shared: the orthogonal Borcherds lift, owner GrossZagierAndArithmeticHeights §6.20a (R01); the averaged Colmez theorem and CM-type invariance are left to this roadmap by ArakelovGeometryAndAbelianHeights, and heights of GSpin special divisors by GrossZagierAndArithmeticHeightsPartII.

Source independence: 13 passages compared with 6 sources (A, T, T12, PT14, MZ, C), none shared beyond formulas and standard names; largest share A, 39 of 70 bracketed locators; contents compared with A: independent (Layer 0 ↔ §§9.1, 9.3; Layer 1 ↔ §§3.1–3.4; Layer 2 ↔ §§3.5–3.6; Layer 3 ↔ §9.4; Layer 4 ↔ §§4–8, 9.5: not the source's order, and the order inside Layers 1–2 is forced by their *Needs* chains 1.1→1.2→1.3→1.4→1.5 and 2.1→2.2→2.3→2.4→2.5, 2.6→2.7→2.8). PT was not opened this round.

Research link: Layers 0–9 prove the averaged Colmez formula of Andreatta–Goren–Howard–Madapusi Pera (2018); Layers 10–12 are Tsimerman's (2018) Galois-orbit bounds for CM points, the input to André–Oort for A_g; Layer 13 gives the bounded-degree CM finiteness that Masser–Zannier (2020) use. Rests on the README summary and on A, T and MZ as read.

## Not verifiable

- The six declared supplier gaps are contracts, not proved statements; each was checked for its slug, supplier section and hypotheses only.
- The Pila–Tsimerman preprint locators of §§13.1–13.4 (PT, Lemmas 3.2–3.7) were not in the sample and were not opened this round.
- The source's statement that Bruinier's theorem gives the support-controlled form (A Theorem 9.5.6) cites a text not in the cache; only A's restatement was read.

## Source issues

- **Error** in A at Theorem 9.1.5, p. 510: the source says a linear map on all of CM⁰ is determined uniquely by its values on the functions a⁰(E,Φ); it should be unique on their span only, since they all vanish at complex conjugation; affects a stated result.
- **Misprint** in A at §3.1, p. 415: the source says the diagonal G_m embeds in T = T_E/T_F¹; it should be the quotient T_F/T_F¹ ≅ G_m, the diagonal having kernel μ_d for d ≥ 2; affects nothing.
- **Error** in A at Lemma 9.4.4, p. 517: the source gives the length as the two within-part sums minus half the discriminant length, negative for a ramified quadratic singleton; it should be half the discriminant length minus the within-part sums; affects the proof.
- **Error** in A at Proposition 9.4.5, p. 519: the source puts a factor −e_P/2 before the sum of the two conductor values; it should be +e_P/2, as ℤ₃[√3] shows (1, not −1); affects a stated result.
- **Misprint** in A at Lemma 9.4.3, p. 516: the source gives the absolute period of a generator as 2π to the power −dim A; it should be the power +dim A, the trace being the integral divided by (2πi)^dim; affects nothing.
- **Misprint** in A at the paragraph after (8.3.1), pp. 507–508: the source says the error is supported at primes with p² not dividing D_L and uses L and n; it should be odd p with p² dividing D_L⋄, with L⋄ and n⋄, as in Theorem 4.8.1; affects nothing.
- **Error** in A at §9.4, p. 514: the source defines the squared norm on ω₀ as minus the bilinear value on a positive definite space, which is negative; it should be the bilinear value itself; affects nothing.
- **Error** in T at §2.2, p. 382: the source says the regulators of a CM field and its real subfield are equal; it should be that their ratio is 2^(g−1)/Q with Q ∈ {1,2}; affects nothing.
- **Error** in T12 at §7.2, preprint p. 18: the source writes the discriminant of R_x as the squared compact index times the field discriminants; it should use the order index [O_x:R_x], as ℤ+3ℤ[i] shows (36, not 64); affects the proof.

## For the human reviewers

- The board plan (`packages/ComplexMultiplicationAndExplicitReciprocityPartII/design/plan.json`) still declares nine gaps; the README at this head has six. The three others (ArakelovGeometryAndAbelianHeights §4.7, HilbertModularVarietiesAndShimuraCurves twice) belonged to the removed Layers 5–8.
- Four of the six gaps ask for extensions of roadmaps already on main: ShimuraVarieties, ClassFieldTheory, GlobalNumberFields (completed) and GeometryOfNumbersAndQuadraticArithmetic (README lines 1020, 1034, 1044, 1054, 1056). The description states this.
- Licence: source C is cited from the author's page, but the cached scan carries a JSTOR download stamp on its pages (C lines 266–267, 347–348).
- PT and T12 are cited by arXiv preprint pagination; the README says the published editions were not collated (line 1074).
