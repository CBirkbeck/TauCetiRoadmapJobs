# Review of ArithmeticKTheoryPartII (package, round 4)

**Verdict:** needs changes

Seven findings: three P2 (blocking) and four P3. One P2 re-raises a finding the last repair report marked not actionable (R01); the other two blocking findings are new and come from resolving every supplier citation at the suppliers' present heads. The mathematics of the targets, the two Lean headlines and the sampled source locators are sound.

## Earlier findings, checked first

| Round-3 finding | Status | Passage and verification |
| --- | --- | --- |
| F01 (P2) classical-symplectic-plus contract not minimal | Not repaired (retained by the repair as "not actionable in this package: human adjudication required") | `packages/ArithmeticKTheoryPartII/README.md:65` is unchanged: "What StableHomotopyKTheory must provide (gap:classical-symplectic-plus): Identify the group completion of finite free unimodular alternating ℤ-forms …". Re-raised as R01, with a further witness. |
| F02 (P3) wrong FGV section for the 691 Check | Repaired | README:526 now reads "(FGV §1.1.1, p. 2, FGV lines 80–85; §§2.7, 5.3.)". FGV line 65 opens §1.1.1 on p. 2; FGV line 85 names k=6, p=691; §1.2 opens at FGV line 124 on p. 3. No other occurrence of the old locator. |
| F03 (P3) FGV manifest page range | Repaired | `packages/ArithmeticKTheoryPartII/sources.toml:12` now reads "Sections 1.1–1.4, … printed pp. 1–62". README cites pp. 1 (FGV line 32), 2 (FGV lines 80–85), 6–7 (FGV line 271, §1.4) and at most p. 62; all inside the range. |

The two applied repairs changed one locator and one manifest field; neither introduced a new statement. The repaired pattern (a locator naming the wrong section) was searched for in the rest of the package through the sample below: none found.

## R01 (P2) — The classical-symplectic-plus contract asks for what earlier roadmaps already provide

Re-raised: REV-PKG-ArithmeticKTheoryPartII~3/F01

**Location.** `packages/ArithmeticKTheoryPartII/README.md:65` and the same slug in `packages/ArithmeticKTheoryPartII/design/plan.json` (top-level `gaps`, supplier section "§4.27"); consumers README:11, 91, 277, 297, 327, 604, 611, 656, 992, 1039.

**Claim.** No earlier roadmap supplies the group completion of unimodular alternating ℤ-forms with identity component BSp∞(ℤ)⁺, so StableHomotopyKTheory §4.27 must add it.

**Witness.** StableHomotopyKTheory §4.18 (its README line 1727) proves B(S⁻¹S)≃K₀(S)×B Aut(s∞)⁺ for any symmetric monoidal groupoid with faithful translations and a cofinal sequence, with the perfect stable commutator. AbelianSchemesAndArithmeticModuli §A5.4 gives all elementary divisors 1 at determinant 1. New this round: HermitianKTheoryOfPoincareCategories §0.5 already names the classical group completion of symplectic forms (`GW^{−ev}_cl`) and GeometryOfNumbersAndQuadraticArithmetic §6.11.1 proves its π₀ over ℤ is ℤ on the alternating hyperbolic plane. §4.27 itself is the symmetric case only (J=⟨1⟩⊥⟨−1⟩, component group ℤ²).

**Why the "not actionable" reason fails.** The reason given is procedural (a re-raised finding is reserved for a human); it gives no ground on which the contract is minimal, and the repair report's own evidence table confirms each step of the specialization. The contract is therefore still a gap that asks for what is provided, and it would give the symplectic group-completion carrier a third home beside GeometryOfNumbersAndQuadraticArithmetic §6.1.6/§6.11.1 and HermitianKTheoryOfPoincareCategories §0.5.

**Exact repair.** As in round 3: delete README:65 and the `classical-symplectic-plus` entry of the plan's `gaps`; cite StableHomotopyKTheory §4.18 and AbelianSchemesAndArithmeticModuli §A5.4 in their contract subsections (add §A5.4 to README:107); rewrite the first sentence of §1.1 (README:277) as this roadmap's own instance (every object is Hᵍ, so (Hⁿ) is cofinal, translations are faithful, K₀=ℤ by half-rank, and §4.18 gives ℤ×BSp∞(ℤ)⁺, naturally for the forgetful functor and P↦P⊕P∨); replace "StableHomotopyKTheory §4.27 (gap:classical-symplectic-plus)" and the "classical-symplectic-plus contract" wording at the consumer lines by "StableHomotopyKTheory §4.18; AbelianSchemesAndArithmeticModuli §A5.4"; keep §4.27 in Scope as the symmetric-form comparison.

**Repair test.** H=[[0,1],[−1,0]]: type (1), half-rank 1; H⊥H has class 2 and automorphism group Sp₄(ℤ); f⊥id_H=g⊥id_H restricts to f=g; diag(1,−1) has self-pairing 1 at (1,0) and is not an object. Both suppliers precede this roadmap (merge-order positions 17 and 42 against 340).

## R02 (P2) — The skew-integer-splitting contract asks GeometryOfNumbersAndQuadraticArithmetic for what HermitianKTheoryOfPoincareCategories §§8.1 and 8.3 state

**Location.** README:93: "What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:skew-integer-splitting): Specialize the GW–L fiber sequence to integral skew forms and prove the odd-primary positive-factor splitting with unscaled hyperbolic map H, c_B H=1+ψ⁻¹, and retraction (1/2)c_B." Same slug in the plan's `gaps`. Also README:13 and 95–97, which cite HermitianKTheoryOfPoincareCategories only for "Layers 4–6".

**Claim.** The skew integral GW–L fibre sequence and its splitting after inverting 2 are stated nowhere and must be added to GeometryOfNumbersAndQuadraticArithmetic §§6.8a, 6.10a–6.11.

**Witness.** HermitianKTheoryOfPoincareCategories §8.1 (its README line 1257): for every ring R and invertible module with involution M, a fibre sequence `K(R;M)_{hC₂} →hyp GW^s_cl(R;M) → L^short(R;M)`; §8.3 (line 1282): `GW^s_{cl,*}(R;M)[1/2] ≅ (K_*(R;M)[1/2])^{C₂} ⊕ W_*(R;M)[1/2]`. At (R,M)=(ℤ,−ℤ) this is FGV's (3.4)–(3.5) (FGV lines 911–933).

**Why it matters.** HermitianKTheoryOfPoincareCategories (position 63) consumes GeometryOfNumbersAndQuadraticArithmetic (position 54); asking the latter for the former's Layer 8 theorem creates a second owner upstream of the first. Layers 4–6 at that head are surgery layers; the GW comparisons the README attributes to them are in §0.5 and Layer 8.

**Exact repair.** Delete README:93 and the `skew-integer-splitting` entry of the plan's `gaps`. In the HermitianKTheoryOfPoincareCategories contract (README:95–97) and Scope (README:13) cite "§§0.5, 8.1, 8.3 and Layers 4–6", saying that §8.1 at (ℤ,−ℤ) is the fibre sequence K(ℤ)_{hC₂}→KSp(ℤ)→τ≥0 L with first map the unscaled hyperbolic functor and §8.3 its splitting away from 2. Keep "c_B H=1+ψ⁻¹, hence retraction (1/2)c_B on the positive part" as this roadmap's own law in §1.1 (it is already the third law there: the forgetful functor sends P⊕P∨ to P⊕P∨). Add "HermitianKTheoryOfPoincareCategories §§8.1, 8.3" to the Needs of §3.4 (README:511) and to the Layer 1 and Layer 3 Dependencies; keep GeometryOfNumbersAndQuadraticArithmetic §6.10a for the integer L-groups. Rerun the dependency check.

**Repair test.** Degree 0: K₀(ℤ)_{C₂}=ℤ→KSp₀(ℤ)=ℤ sends 1 to H (half-rank 1), the skew Witt group of ℤ is 0, and c_B H(1)=2. Degree 2 away from 2: (K₂(ℤ)[1/2])^{C₂}=0 and W₂[1/2]=ℤ[1/2], so KSp₂(ℤ)[1/2]=ℤ[1/2], agreeing with §3.4 at p=3 (ℤ₃).

## R03 (P2) — ChromaticHomotopyTheory CH.2–CH.3 does not exist at that roadmap's head, and it no longer owns what is consumed

**Location.** README:11 "ChromaticHomotopyTheory CH.2–CH.3 owns generic periodic self-maps and their telescope comparison"; README:83–87 (contract and gap:compatible-v1-towers); citations at README:301, 319, 327, 534, 543, 551, 633, 656, 826, 928; the plan's `gaps` entry (supplier section "CH.2–CH.3").

**Claim.** ChromaticHomotopyTheory has sections CH.2 and CH.3 supplying type-one self-maps, telescope independence and the height-one comparison.

**Witness.** At the head of ChromaticHomotopyTheory's open pull request the README has "## Layer 2: Nilpotence, type and periodicity" (line 238; only convention Checks: "The supplied nilpotence, type and periodicity interfaces apply…") and "## Layer 3: Generalized Serre theory" (line 288). Its Scope (line 10) says GeneralAlgebraicKTheoryPartII §§4.2–4.4 and 4.18–4.21 own telescopes and height-one equality, and BordismFormalGroups F6.1–F6.4 periodicity. "CH.2" occurs nowhere in it.

**Exact repair.** Replace the ChromaticHomotopyTheory contract subsection by two: "From TauCetiRoadmap.BordismFormalGroups" (F6.3: periodic self-maps, Adams' v₁ maps on the mod-p Moore spectrum of degree 2p−2, the height-one tower built from p-power Moore spectra, telescopes T(n)) and "From TauCetiRoadmap.GeneralAlgebraicKTheoryPartII" (§§4.1–4.3 telescopes and periodic homotopy; §4.20 ⟨T(1)⟩=⟨K(1)⟩ at every prime). Re-declare gap:compatible-v1-towers on BordismFormalGroups F6.3, narrowed to what these two do not state: v₁ self-maps on S/pⁿ of degree 2pⁿ⁻¹(p−1) compatible with the reductions S/pⁿ⁺¹→S/pⁿ after common iteration, including q=3 without an associative Moore product; drop "telescope independence and their p-completed K(1)-local comparison" from its `needs` (supplied by §§4.1, 4.20). Update the plan's `gaps` entry identically, Scope (README:11) and every citation listed above. Rerun the dependency check.

**Repair test.** q=5: F6.3's Adams map has degree 2p−2=8, the README's 2pⁿ⁻¹(p−1) at n=1; q=25 needs degree 40=5·8, which is the narrowed gap. BordismFormalGroups is on main and GeneralAlgebraicKTheoryPartII is at position 336, before 340: no upward edge.

## R04 (P3) — EtaleHomotopyTypes is cited by identifiers its README does not have

**Location.** README:15, 115–119, 586, 598, 611, 615, 624, 633, 656: "EtaleHomotopyTypes EH.5, EH.6 and G7"; the plan's `gaps` entry graded-moore-realization (section "EH.5, EH.6 and G7").

**Claim.** EtaleHomotopyTypes has sections EH.5, EH.6 and G7.

**Witness.** At the head of its open pull request the README has "## Layer 5: Betti realization and analytic descent" (line 850, §§5.1–5.3b) and "## Layer 6: p-completion and Betti–étale comparison" (line 922, §§6.1–6.9); "EH." and "G7" occur nowhere in it.

**Exact repair.** Write "EtaleHomotopyTypes Layer 5" for EH.5 and "Layer 6" for EH.6 throughout (where a single statement is meant: §5.2 Betti realization, §5.3a smooth descent, §6.6 componentwise completion, §6.7 the zigzag, §6.9 automorphism naturality), delete "and G7", and set the gap's section to "Layers 5–6" in README:119's subsection and in the plan.

**Repair test.** §6.9's title is "Field-automorphism naturality of discrete points", the statement README:615 consumes; §6.6 is the graded completion README:117 requires.

## R05 (P3) — ComplexMultiplicationAndExplicitReciprocity has no §1.3

**Location.** README:13, 99–103, 373, 441, 673, 744: "ComplexMultiplicationAndExplicitReciprocity §§1.3, 2.1–2.2"; the plan's `gaps` entry cm-arbitrary-automorphism (section "§§1.3, 2.1–2.2").

**Claim.** §1.3 of that roadmap supplies the Serre tensor.

**Witness.** At the head of its open pull request Layer 1 has only "### 1.1 Rational CM twisting" (line 339) and "### 1.2 Serre tensor, Lie and period comparisons" (line 355); the next heading is Layer 2.

**Exact repair.** Replace "§1.3" by "§1.2" at each listed line and in the plan's gap section ("§§1.2, 2.1–2.2").

**Repair test.** §1.2 defines `cmSerreTensor` for a finite projective O_L-module, the object README:101 and §2.2 consume. The gap itself stays needed: §2.2's dictionary there is stated for σ∈Aut(ℂ/E*) only.

## R06 (P3) — `finiteFieldKGroups` is not a GeneralAlgebraicKTheory name

**Location.** README:53 "GeneralAlgebraicKTheory §§7.1–7.7, 13.8b–13.8c. Consume `finiteFieldKGroups`, which identifies …" and README:896 "GeneralAlgebraicKTheory §§13.8b–13.8c `finiteFieldKGroups`".

**Claim.** GeneralAlgebraicKTheory declares `finiteFieldKGroups`.

**Witness.** The name occurs nowhere in GeneralAlgebraicKTheory's README or Lean file at its head; §13.8c (line 3028) states the calculation in prose. It is an alias introduced by GeometryOfNumbersAndQuadraticArithmetic §6.10 (its README line 3003).

**Exact repair.** At both lines write "GeneralAlgebraicKTheory §13.8c's finite-field calculation" without the backticked name.

**Repair test.** §13.8c states K₀(F_q)=ℤ, K₂ᵢ(F_q)=0, K₂ᵢ₋₁(F_q)≃ℤ/(qⁱ−1), the three facts README:53 lists; K₃(F₂)=ℤ/3 as in §7.6's Check.

## R07 (P3) — Single pages written "pp."

**Location.** README:447, 534, 579, 699, 910, 970 ("author copy pp. 29;", "pp. 22;", "pp. 60;", "pp. 38;", "pp. 44;", "pp. 50;").

**Claim / witness.** Each locator is one page (FGV page markers at lines 1285, 962, 2754, 1720, 2016, 2289).

**Exact repair.** Write "p. 29", "p. 22", "p. 60", "p. 38", "p. 44", "p. 50".

## Verified sound

Read in full: the README (1050 lines, 9 layers, 42 target subsections), `Suggested.lean`, `metadata.toml`, `sources.toml`, the plan's 17 gaps, the round-3 review and the round-4 repair report. Counts: 3 earlier findings checked (2 repaired, 1 re-raised); 15 seeded targets checked at their FGV locators (15 exact); 4 Lean declarations elaborated and compared; 14 one-tactic probes (none closes); 24 supplier roadmaps opened at their present heads and 101 section or declaration citations resolved by heading or name (94 found; the 7 others are R03–R06); 14 pinned declarations opened; 45 computed rows below. No maintainer notes were left for this roadmap.

### Sources: seeded sample

All against the cached 64-page FGV author copy. No locator is flagged unverified by the author.

| Target | Text read | Result |
| --- | --- | --- |
| 0.2 Picard-to-K map | FGV lines 443–472 | §2.4, Definition 2.6, (2.3)–(2.4), pp. 10–11. Exact. The README's Frac(R)× arrows correct the source (see Source issues). |
| 0.3 Cyclotomic Picard classes | FGV lines 586–648 | Corollary 2.12 (p. 14), Remark 2.13 (p. 15); Lemma 2.11 gives the ordinary comparison for i≥2, so k≥1 is right. Exact. |
| 1.2 Bott-inverted symplectic K-theory | FGV lines 503–509, 964–996 | Remark 2.8 (p. 11): degree 2pⁿ⁻¹(p−1); §3.6 (p. 22): telescope, inverse limit, "no longer periodic". Exact. |
| 2.4 CM types and ideal differences | FGV lines 1082–1126, 1171–1176, 1232–1293 | Definitions 4.3–4.4 (pp. 24–25), (4.10) (p. 26), Proposition 4.7 (p. 27), proof and Lemma 4.8 (pp. 28–29). Exact. |
| 3.1 CM Bott classes | FGV lines 1294–1325 | §5, (5.1)–(5.3), p. 29; automorphism group U₁(O) at FGV line 1310. Exact (R07 format only). |
| 3.3 Betti transfer formula | FGV lines 1403–1446 | §5.2, (5.7) (p. 31), Corollary 5.4 and Remark 5.5 (p. 32). Exact. |
| 3.4 Betti–Hodge splitting | FGV lines 871–933 | Theorem 3.5 (pp. 19–20), Corollary 3.6 (p. 20), §3.4 (pp. 20–21). Exact. |
| 3.6 Periodic and K(1)-local comparison | FGV lines 989–1006 | Corollary 3.10 and Remark 3.11, p. 22. Exact. |
| 4.2 Rigidified ppav simplicial model | FGV lines 2773–2785 | Appendix A.4, p. 60: O(1) restricting to 3Δ*L, (n+1)-tuples, no compatibility with embeddings. Exact. |
| 4.3 Betti model | FGV lines 2665–2728, 2786–2797 | A.3 (pp. 58–59), Proposition A.13 (p. 60). Exact. |
| 5.1 Groupoid CM reciprocity | FGV lines 1601–1656 | §6.3 (p. 35), Theorem 6.6, (6.3)–(6.4) (p. 36). Exact; the README's weaker lift condition is deliberate and stated. |
| 5.3 Relative bar convention | FGV lines 1718–1746 | §7.1, (7.5)–(7.8), p. 38. Exact. |
| 6.1 Finite arithmetic Galois action | FGV lines 1805–1871 | Lemma 7.7 (pp. 39–41). Exact. |
| 6.2 CM reciprocity identifies the cocycle | FGV lines 1855–1965 | (7.12) (p. 40) through the final formula (p. 42). Exact. |
| 7.2 p-adic universal extension | FGV lines 1968–2021 | §7.4 (p. 43), Theorem 7.8 (pp. 43–44). Exact. |

### Computed adversarial record

"Retain" means the computed instance agrees; it is not a proof of the target. Rows for untouched text not recomputed here rely on the round-2 and round-3 tables, which carry values for every section.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Artin direction | Frob₂ on μ₅, twist 3 | 2³=8≡3; 2⁻¹=3, 2⁻³=27≡2 | Arithmetic ≠ geometric | Retain |
| Conventions: Gaussian form | b(1,1)=i/2, Φ={id} | h(1,1)=−2i·(i/2)=1; ω(1,i)=−Tr((i/2)(−i))=−Tr(1/2)=−1; Im h(1,i)=Im(−i)=−1 | Im h=ω; native J is −i | Retain |
| §0.2 fractional-ideal arrows | 2ℤ→3ℤ | (3/2)·2ℤ=3ℤ, 3/2∉ℤ× | Frac(R)× needed | Retain |
| §0.3 eigenspace | [L]−1 and β²ᵏ⁻¹ | ψ⁻¹([L]−1)=−([L]−1) modulo I², ψ⁻¹β²ᵏ⁻¹=−β²ᵏ⁻¹; product sign + | Positive summand | Retain |
| §0.3 degrees | k=1, 2 | Exponents 1, 3; degrees 2, 6; 4k−2≥2 so Lemma 2.11's range holds | Ordinary K allowed | Retain |
| §1.2 periods | q=5, 25 | 2·1·4=8; 2·5·4=40=5·8 | Common iterate | Retain; R03 owner |
| §1.1 KSp carrier | H, H⊥H, diag(1,−1) | Half-ranks 1, 2; Aut=Sp₂(ℤ), Sp₄(ℤ); diag(1,−1) has self-pairing 1 | §4.18 applies | R01 |
| §3.2 type sums, new prime | q=7, Φ={1,2,3} and {1,2,4}, i=1, 3, 5 | {1,2,3}: 6, 36≡1, 276≡3; {1,2,4}: 7≡0, 73≡3, 1057≡0 | Not every type is a unit; span is | Retain |
| §3.2 pair switch | q=7, {1,2,4}→{6,2,4}, i=1 | 0→12≡5; difference 5=−2·1 | Unit ±2aⁱ | Retain |
| §3.2 even i | q=5, i=2 | {1,2}: 5≡0; {4,2}: 20≡0 | Oddness needed | Retain |
| §3.3 unit term | q=5, i=1; q=9, i=3 | 1+2+3+4=10≡0; cubes 1,8,1,8,1,8 sum 27≡0 | Transfer of β²ᵏ⁻¹ is 0 | Retain |
| §3.4 degree 0 | q odd | ℤ/q→ℤ/q by 2; π₀(ku)⁻=0 | Isomorphism | Retain |
| §3.4 degree 1 | q odd | KSp₁(ℤ;ℤ/q)=0; K₁(ℤ)/q=(ℤ/2)/q=0 and K₀[q]=0; π₁(ku)=0 | 0≅0 | Retain |
| §3.4 degree 2 | q odd | KSp₂=ℤ, so ℤ/q; K₂(ℤ;ℤ/q)=0; π₂(ku;ℤ/q)⁻=ℤ/q | Agree | Retain |
| §3.4 kernel is all of K | degree 4k−2 | K⁻≅H⁰(ℤ′;μ^(⊗(2k−1))): −1 acts by −1, so x=−x, x=0 | K=K⁺ | Retain |
| §3.4 fibre sequence owner | (R,M)=(ℤ,−ℤ) | K₀(ℤ)_{C₂}=ℤ→ℤ by H; skew W₀(ℤ)=0; degree 2: 0⊕ℤ[1/2] | Stated by the Poincaré roadmap | R02 |
| §3.6 "agrees for i≥0" | i=1 | K₁^β(ℤ;ℤ/q)=H¹(ℤ′;μ_q) has ψ⁻¹=−1, so its + part is 0=K₁(ℤ;ℤ/q)⁺; ku→KU iso for i≥0 | True, including i=1 | Retain |
| §3.6 negative degrees | i=−2, −4 | ψ⁻¹ on π₋₂KU is (−1)⁻¹=−1; on π₋₄ it is +1 | Check correct | Retain |
| §3.6 K₁ control | ℤ′×/q | ±p^ℤ modulo q is ℤ/q≠0=K₁(ℤ;ℤ/q) | Degree-one exception real | Retain |
| §4.2 Čech degrees | r=0, 1, 2 | 1, 2, 3 embeddings; 0, 1, 2 isomorphisms | Matches FGV line 2779 | Retain |
| §5.3 differential | n=1, 2, 3 | d[g]⊗m=gm−m; d[g∣g′]⊗m=[g]⊗g′m−[gg′]⊗m+[g′]⊗m; degree 3 signs +,−,+,− | Cocycle relation (7.5) | Retain |
| §5.3 comparison T_n | General n against Mathlib `d_single` | First native term [h₁…]⊗ρ(h₀)⁻¹m with h₀=g_n⁻¹ gives ⊗g_n m; contraction j ↔ FGV position n−j−1, signs (−1)^(j+1) both sides; last (−1)ⁿ | Chain isomorphism | Retain |
| §5.3 inverse convention | C₃ on 𝔽₇, g·m=2m | FGV: 2−1=1; native: 4−1=3; after T₁: 2−1=1 | Distinguished | Retain |
| §5.3 relative H₁ | C₂, H=1, sign ℤ/5; ℤ, H=1, trivial ℤ | H₁(C₂;M)=0, H₀(C₂;M)=M/2M=0, so H₁(G,1;M)≅M=ℤ/5; second: ℤ→ℤ→H₁rel→ℤ→ℤ (last iso), H₁rel=ℤ | Checks correct | Retain |
| §5.3 nonabelian | S₃, a(g,m)=(1−sgn g)m/2 | a(sr,1)=1=1+0; a(s²,1)=0=−1+1 | Relation holds | Retain |
| §5.4 universal action | C₂, sign ℤ/5 | c(m,t)=(−m,t+m); c²(m,t)=(m,t+m−m); section (m,2m): c(m,2m)=(−m,3m)=(−m,−2m) | Equivariant section ≠ chosen one | Retain |
| §6.2 weight | χ=2, k=2, q=5 | 2³=8≡3, not 2²=4 | Exponent 2k−1 | Retain |
| §7.1 completed H₁ | C₂ with sign ℤ_p; Γ=ℤ_p trivial | H₁(C₂;ℤ_p^−)=0=H₀, so relative H₁=ℤ_p; second: ℤ_p | Checks correct | Retain |
| §7.2 kernel finite | k≥1 | K_(4k−2)(ℤ) finite, so K⊗ℤ_p finite; p=3, k=1: K₂(ℤ)=ℤ/2, 3-part 0 | Zero-kernel case | Retain |
| §7.6 restriction | (p,k,ℓ)=(3,1,2), (3,2,2), (5,1,2), (3,1,19) | ℤ₃/(2²−1)=ℤ/3=K₃(ℤ)₃; 2⁴−1=15, ℤ/3=K₇(ℤ)₃ (240); 3 is a 5-unit, 0; 19²−1=360, ℤ/9≠ℤ/3 | Generator hypothesis needed | Retain |
| §8.3 range | ΣH(ℤ/p), degrees 2n−1 | β(y^[n]) decomposable when some C(n,a) is a unit: n=2..p−1; at n=p all C(p,a)≡0 | Q₂ₚ₋₁≠0=π: beyond 2p−3 | Retain |
| §8.4 bound | i=0, 2 | g>5: g≥6; g>9: g≥10; FGV line 33 has g≥2i+5 | Conservative | Retain |
| §8.5 generators | Degrees 2, 6, 10 | 4k−2 for k=1, 2, 3 | Borel's symplectic degrees | Retain |
| Lean split prime | q=3 | 7=(3+ζ₃)(3+ζ̄₃)=9−3+1; ±7 give both signs; 2 inert, 3 ramified (P=P̄) | True; controls rejected | Retain |
| Lean split prime | q=5 | t=4+√5: N=11≡1 (5); values 6.236, 1.764; εt=(9+5√5)/2: 10.09, −1.09; −t, −εt | All four sign patterns | Retain |
| Lean `p ∉ (t)` | General | (t) prime, p∈(t) iff (t) is the prime over p, which ramifies and cannot equal P·P̄ with P≠P̄ | Consistent, not vacuous | Retain |
| Lean CM lines | q=3, L=(c) | 𝔡⁻¹=(1/√−3); δ=∓1/√−3 has Im ∓0.577, types {conj}, {id}; B₁=B₂=𝓞, a=c̄/c | Both types | Retain |
| `IsSkewCMLine` | ℚ(i): δ=i/2, i, 0 | (i/2)=𝔡⁻¹; (i)=𝓞 of index 4 in 𝔡⁻¹; 0 excluded | Perfection discriminates | Retain |
| `IsSkewCMLine` on zero ideal | B=0 | `simp [IsSkewCMLine]` proves ¬IsSkewCMLine K Φ 0 δ (scratch) | Nondegenerate | Retain |
| `conjugateFractionalIdeal` | 1; (2+i) | `simp` proves conj(conj 1)=1 (scratch); (2+i)↦(2−i), product (5) | Semilinear transport | Retain |
| Gap compatible-v1-towers | Supplier section | "CH.2" absent at head; F6.3 has degree 2p−2 Adams maps; §4.20 has T(1)=K(1) | Wrong owner | R03 |
| Gap graded-moore-realization | Supplier section | Layers 5 and 6 exist; "EH.5", "G7" absent | Stale identifiers | R04 |
| Gap cm-arbitrary-automorphism | Supplier section | §1.2 is the Serre tensor; no §1.3; §2.2 has σ∈Aut(ℂ/E*) only | Needed; id stale | R05 |
| Other 12 gaps | Suppliers at head | No relative group homology in ArithmeticGaloisDuality; no inverse-different transfer in SchemeKTheoryOperations; no sphere-unit map in KTheoryFiniteLocalFields; no 2p−3 Postnikov splitting in StableHomotopyKTheory; no full-cover descent in ArithmeticKTheory §6.11 (stated for E=F(μ^(⊗i))); no p-Hilbert field in ClassFieldTheory | Still needed | Retain |
| Merge order | Position | This roadmap 340; latest supplier GeneralAlgebraicKTheoryPartII 336 (after R03), ChromaticHomotopyTheory 338 today | No upward edge | Retain |

### Lean acceptance test

`lake env lean` on `packages/ArithmeticKTheoryPartII/Suggested.lean` from the content checkout exits 0; the only messages are "declaration uses `sorry`" at 52:8 and 95:8. No `TauCeti.*` import is used. A scratch copy with `#check @` for the four declarations reproduces the worker's signatures: every binder is kept (p, n, primality, p≠2, 0<n, the field, number-field, cyclotomic and CM instances, ε, Φ with its one-per-pair hypothesis, L≠0), and each type equals the README statement at §§2.3–2.4; nothing changed. One-tactic probes on both theorems (`simp`, `rfl`, `infer_instance`, `exact?`, `simp` with the two definitions unfolded, `aesop`, `decide`): 14 of 14 leave the goal open. No padding. The file has one `import Mathlib`, one namespace, one layer comment, a docstring on every declaration, two theorems and two real-body definitions; no `set_option`, `lemma`, sorry'd data, admitted example, `#eval`, `#synth` or `#print`.

Headline inventory: §2.3 and §2.4 are stated. The docstring names as not statable, each with its missing carrier, the Picard–Bott and Artin–transfer comparisons, Betti–Hodge splitting, the height-one comparison, CM generation, the coherent action and finite-genus detection, groupoid CM reciprocity, the universal relative extension, the finite, p-adic, locally split and all-twist universality theorems, degree 4k−1 triviality, the Vandiver criterion, the indecomposable product and Hurewicz theorems, the stable symplectic and rational Hodge comparisons and Bernoulli divisibility. None of those carriers (higher K-groups, KSp, relative group homology, Pontryagin-homology quotients, abelian schemes) exists at the pins. Finite-rank Sp₂ᵍ(ℤ) stability is statable and is declared a supporting target, which is a fair reading.

### Pinned declarations opened

Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `complexConj` (:142), `ringOfIntegersComplexConj` (elaborated); `FractionalIdeal.spanSingleton` (`Mathlib/RingTheory/FractionalIdeal/Operations.lean:575`, a monoid-with-zero homomorphism), `ringEquivOfRingEquiv` (:972); `FractionalIdeal.dual` (`Mathlib/RingTheory/DedekindDomain/Different.lean:230`); `NumberField.exists_ideal_in_class_of_norm_le` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean:78`, bound (4/π)^{r₂}·n!/nⁿ·√|d| as the README states); `groupHomology.inhomogeneousChains.d` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:125`, first term with ρ(g₀)⁻¹, signs (−1)^(j+1): the convention §5.3 compares against); `groupHomology` (:226); `CommRing.Pic` (`Mathlib/RingTheory/PicardGroup.lean:429`); `Matrix.symplecticGroup` (`Mathlib/LinearAlgebra/SymplecticGroup.lean:102`); `Representation` (`Mathlib/RepresentationTheory/Basic.lean:48`); `CategoryTheory.Under` (`Mathlib/CategoryTheory/Comma/Over/Basic.lean:631`); `TauCeti.NumberFieldArithmetic.artinHomAway` (`TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean:181`); `SymplecticForm.exists_compatible` (`TauCeti/Geometry/Symplectic/ExistsCompatible.lean`, used at :193). The library-matches file was read for all four declarations: no candidate states either headline.

### Cross-roadmap citations resolved

Main is `83bb79f`; open heads are those of the roadmap index of 2026-11-11. Found as headings at the cited roadmap: ArithmeticKTheory §§3.1, 3.5, 5.2, 6.11 (with `cyclotomicH2Descent`, line 3067), 6.15, 6.16, 7.1, 7.5; GeneralAlgebraicKTheory §§7.1, 7.7, 13.8b, 13.8c; SchemeKTheoryOperations §§6.1, 6.9–6.11; StableHomotopyKTheory §§3.20, 3.34, 3.37, 4.18, 4.21, 4.24–4.27, 5.1, 5.19, 7.1, 7.3, 7.4, 7.7, 7.9, 7.13, 7.17, 7.28; GeneralizedCohomology G2 (items 5 and 8), G3 (item 8), G5; SymplecticGeometry CotangentLagrangian C2.0, C2.1; TopologicalKTheory T4, T5, T7 and its β=[L]−1 with L=O(−1) (line 158); GeometryOfNumbersAndQuadraticArithmetic §§6.5, 6.8a, 6.10a, 6.11; HermitianKTheoryOfPoincareCategories Layers 4–6; ComplexMultiplicationAndExplicitReciprocity §§2.1, 2.2; AbelianSchemesAndArithmeticModuli A5.4, A5.5, A5.8; PELModuli M1.5, M1.12, M2.3, M2.4, M2.8, M2.9, M3.9, M6.2, M6.3, M6.9; ClassFieldTheory Layers 11–13 with the three Layer 13 names; Chebotarev Layer 10; ArithmeticGaloisDuality R02.1, R02.2, R02.4.3; EtaleCohomologyFoundations F.0.2, F.0.3, F.4.0–F.4.6; IntegralIwasawaTheory §§3.1, 7.4, 12.3; KTheoryFiniteLocalFields §§1.1, 1.2; ArithmeticLocallySymmetricSpaces ALS.0.8, ALS.1.5, ALS.1.6, ALS.2.3, ALS.2.4; AlgebraicTopology Stage 6 (§§6.0–6.6); BorelRegulators §2.1. Not found where cited: R03–R06.

### Ownership, duplication and overlaps

The overlap file lists no other pull request changing this roadmap, no dropped id and no id defined only by an open revision; the three stale identifiers of R03–R05 are design-stage node names that the suppliers' pull requests never carried, which is why that tool does not list them. Of the closest roadmaps (ArithmeticKTheory, KTheoryFiniteLocalFields, BorelRegulators, StableHomotopyKTheory, StableHomotopyKTheoryPartII), none owns the arithmetic action on KSp, CM Bott classes, the universal-extension theorems, the ppav Γ-model, integral indecomposables or the family divisibility theorem. The two ownership defects found are R01 and R02. No fully qualified name of `Suggested.lean` occurs in another readable roadmap.

### Gaps

All 17 slugs and `needs` texts match between README and plan (checked by script), each with a named earlier supplier. Fourteen are precise and still needed at the suppliers' heads; of these, two carry a stale section identifier (R04, R05). Three are findings: R01 and R02 (not minimal), R03 (wrong owner and partly supplied).

### Supplier order

```text
depcheck: 229 roadmaps, 2073 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line. The roadmap is at merge-order position 340.

### Shape and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers and References are present. Every definition block has its laws and at least three Checks (counts 3–7); every theorem has hypotheses and a locator. The layers are named by their mathematics and ordered by their Needs lines. No LaTeX delimiters, process words, pull-request numbers or machine paths in the package files. The four backticked names of this roadmap's own are declared in `Suggested.lean`. All three cited works are in the manifest.

## Not verifiable

- `charney1987`, Corollary 4.5: settled as uncertified (paywalled); not requested. FGV line 33 quotes g≥2i+5; the README's strict g>2i+5 is inside it.
- The FGV author copy was not collated against the journal pagination; locators refer to the author copy, as the manifest says.
- Whether BordismFormalGroups F6.3's height-one Moore tower already gives the reduction-compatible self-maps of degree 2pⁿ⁻¹(p−1) in full was not decided (the section is long); R03's narrowed gap is written so that it asks only for that compatibility.

## Source issues

- **Misprint** in FGV at Definition 2.6, p. 10, FGV line 455: the source takes arrows between fractional ideals to be ring units x with xI=I′; it should be nonzero elements of the fraction field; affects nothing.
- **Misprint** in FGV at Remark 2.13, p. 15, FGV line 645: the source says finite-coefficient K₀ splits as ℤ plus the Picard group; it should be ℤ/q plus the Picard group modulo q; affects nothing.
- **Misprint** in FGV at Corollary 2.12's proof, p. 14, FGV line 628: the source puts the Bott product in H² with twist 2k−1; it should be twist 2k, as in Lemma 2.11; affects the proof.
- **Misprint** in FGV at Lemma 4.8, p. 28, FGV line 1264: the source calls S the real embeddings of the cyclotomic integers; it should be those of the real subring; affects nothing.
- **Misprint** in FGV at Theorem 6.6, pp. 35–36, FGV lines 1619 and 1629: the source writes the class group's Galois group over K and the reciprocity value as a sum; it should be over E and a product in the Galois group; affects nothing.
- **Misprint** in FGV at Definition 7.3, p. 37, FGV line 1699: the source asks the section followed by the projection, in the wrong order, to be the identity of M; it should be projection after section; affects nothing.
- **Misprint** in FGV at §7.3, p. 41, FGV line 1903: the source gives the line class Bott exponent k−1; it should be 2k−1, as in the adjacent display; affects nothing.
- **Misprint** in FGV at Remark 7.9, p. 44, FGV line 2037: the source says Vandiver is equivalent to the whole set of primes above p being a singleton; it should be the conjugation-fixed subset; affects nothing.
- **Misprint** in FGV at Appendix A.4, p. 59, FGV line 2747: the source says the Rosati involution is defined by the ring action; it should be defined by the polarization; affects nothing.
- **Misprint** in FGV at Appendix A.4, p. 60, FGV line 2775: the source lists the abelian scheme twice in the rigidified tuple; it should be the scheme, its polarization and the action; affects nothing.
