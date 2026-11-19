# Review of ImaginaryQuadraticClassNumber (pull request #2593 at 2592125)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: §3.1 plans complex uniformisation of elliptic curves (the group isomorphism ℂ/Λ ≅ E_Λ(ℂ), and a lattice for every complex elliptic curve), which ModularForms §10D on main, already a supplier of this roadmap, owns. Every numerical Check and worked example was recomputed and is correct, and `Suggested.lean` elaborates with six `sorry` warnings and agrees with the README. Four small corrections (no old → new numbering for ids other roadmaps cite, sentences endorsing an effective Siegel bound, a wrong Shin locator, missing Shin locators in Layer 3) and one format note do not block. One fact about another roadmap is left for the human reviewers.

## R01 (P2) — Complex uniformisation of elliptic curves has two owners: §3.1 plans it, and ModularForms §10D on main already owns the same theorems

Implementers would build the same theorem twice, under two sets of conventions, and a consumer cannot tell which statement to cite.

§3.1 (lines 680–698) asks the implementer to "deduce the holomorphic group isomorphism ℂ/Λ → E(ℂ) with its inverse; prove period-lattice recovery for every complex elliptic curve". It then plans a converse construction through a Lie-group structure and an exponential map. The Scope (line 1079) claims "complex uniformization of elliptic curves in both directions", and the Summary (line 36) says it "is built here". ModularForms is on main. Its §10D (README lines 1313–1340) states the same results:
- the map u ↦ (℘_Λ(u), ℘′_Λ(u)/2) is a bijective group isomorphism ℂ/Λ → E_Λ(ℂ);
- every elliptic curve over ℂ is isomorphic to some E_Λ;
- ℘ is homogeneous under rescaling of the lattice;
- every isomorphism E_Λ → E_Λ′ is induced by a homothety u ↦ αu.

ModularForms §10D names ModularCurvesPartII and EllipticPeriods as its consumers, and ModularForms never cites this roadmap. This roadmap already takes ModularForms as a supplier (Summary, lines 33–35; Owned elsewhere, lines 1114–1120). So ModularForms is the earlier owner, and citing it creates no cycle. The Owned-elsewhere bullet mentions only that EllipticCurves excludes uniformisation, and never mentions §10D.

The smallest repair has three parts:
- In §3.1, cite ModularForms §10D for the group isomorphism, the lattice of every complex elliptic curve, homogeneity and homothety-induced isomorphisms, and add §10D to the *Needs:* line and the supplier contracts.
- Keep as targets here only what §10D does not state and the CM dictionary needs, for instance holomorphy of the isomorphism and of its inverse. Give each one clause saying how it differs.
- The converse construction is then a proof route to §10D's theorem rather than a target here. Change the Summary's "is built here", the ownership line of the Scope and the Owned-elsewhere bullet to match.

## C01 — The renumbering drops the ids H1.1–H3.6 that other roadmaps cite, and the README gives no old → new correspondence

When this merges, citations in roadmaps on main stop pointing at a heading that exists:
- EulerSystemsAndKolyvaginSystems cites H1.4 (its README line 115).
- AnalyticNumberTheoryPartI cites H2.2–H2.4 (lines 19, 75, 270, 276).
- QuadraticCharactersAndReduction cites H2.1 (line 14).
- NoncommutativeAndEquivariantIwasawa cites H3.1–H3.2 (line 42).

Open roadmaps cite them as well. ComplexMultiplicationAndExplicitReciprocity and ArithmeticStatisticsPartVII link the heading anchor `#h31-modular-functions-and-the-imaginary-quadratic-cm-dictionary`, which no longer exists. The description says that "old Hk.n is §k.n throughout, so citations from other roadmaps still resolve". That holds only for a reader who guesses the rule, and it fails for anchored links.

Two repairs:
- Add one sentence to the README, for instance at the end of Conventions 8: "Sections Hk.n of the former numbering are §k.n (H1.1–H1.4 are §§1.1–1.4, H2.1–H2.4 are §§2.1–2.4, H3.1–H3.6 are §§3.1–3.6)."
- In the description, say that the heading anchors changed.

## C02 — The Summary and the Scope present an effective Siegel bound as something AnalyticNumberTheoryPartI derives, although no such bound is known

This roadmap itself says "The constants are ineffective" (line 18). The Summary then speaks of AnalyticNumberTheoryPartI's "effective form of Siegel's bound" (lines 30–31). The Scope (lines 1124–1127) says that roadmap "states L(1, χ) ≥ c/log q with an effective absolute c, derived there from the uniform exclusion of Landau–Siegel zeros". A reader is told that an effective form exists. It does not:
- Excluding Landau–Siegel zeros is open.
- No effective bound L(1, χ) ≥ c_ε q^(−ε) with ε < 1/2 is known for all real primitive χ.
- The best effective bounds are of Goldfeld–Gross–Zagier type, h(D) ≫ log|D| up to a factor, which is the route EffectiveClassNumbers plans.

The sentences describe AnalyticNumberTheoryPartI's text correctly (its line 19, §0.9 at line 290, §0.34), but they should not vouch for it. The smallest repair has two options:
- Say that AnalyticNumberTheoryPartI states an effective form as a target resting on its §0.34, the exclusion of Landau–Siegel zeros, which is an open problem.
- Or say only that the effective forms are not stated here.

## C03 — The locator of finite-level reciprocity points to Shin's Lemma 4.1 and Theorem 4.8, which do not state it

§3.1 (line 708) cites "Shin, §4: … Lemma 4.1 and Theorem 4.8" for this statement: sτ_D + t acts through the matrix `[[t − Bs, −Cs], [s, t]]`, and the kernel is the image of the units. The References (lines 1298–1299) repeat the citation. In shin2010:
- Lemma 4.1 (lines 699–726) is the identity g₀g₁g₂ = 2ζ₈ together with γ₂ = (g¹² + 16)/g⁴.
- Theorem 4.8 (lines 957–962) is generation of K_(2) when 2 is inert and 3 is unramified.
- The matrix group W_{N,τ_K} is defined in §2, p. 4 (lines 193–199).
- The surjection onto Gal(K_(N)/H_K) and its kernel are Proposition 2.5, p. 5 (lines 206–251).

Repair: cite "Shin, §2, the group W_{N,τ_K} (p. 4) and Proposition 2.5 (p. 5)" in §3.1 and in the References.

## C04 — The targets of §3.2, and the fields F_N of §3.1, carry no locator, although shin2010 states each of them

Layer 3 cites Shin only as "§§2, 4, 5" (line 626), so a reader cannot check the §3.2 bullets against a text. Their places in shin2010:

| Claim | Place in shin2010 |
|---|---|
| q-order B₂(⟨r₁⟩)/2 | Proposition 2.3(i), p. 3 (lines 138–139) |
| Transformation law with its root-of-unity factor | Proposition 2.3(ii), p. 4 (lines 142–148) |
| Congruence criterion for products | Proposition 2.1, p. 3 (lines 101–119) |
| Exponent 12N/gcd(6, N) | Remark 2.2, p. 3 (lines 121–130) |
| Integrality over ℤ[j] | Proposition 2.3(vi), p. 4 (line 177) |
| γ₂ = (g¹² + 16)/g⁴ | Lemma 4.1(ii), p. 12 (lines 707–726) |
| §3.1: F_N, Gal(F_N/F₁) ≅ GL₂(ℤ/N)/{±1} and the action of diag(1, d) | §2, pp. 2–3 (lines 73–100) |

Repair: add these locators at the claims.

## N01 — In §2.1 the locator "(Davenport, Chapter 6)" (lines 412–413) is attached to the sentence that no second fundamental-discriminant predicate is introduced

That sentence is about this roadmap, and no book can support it. The locator would sit better after the definition of χ_D in the section's first sentence.

## Previous findings

- The previous review raised no finding that was open at its head. Its R01–R05 were recorded as repaired, and the repaired passages are still present at this head:
  - `classNumber_eq_two_of_minpoly_eq_X_sq_add_five`, line 215;
  - `root`, `root_smul` and `root_injective`, lines 282–285;
  - the three unit-order specializations, lines 460–464;
  - `coeffSubfield` and `coeffSubfield_cuspDatumInfty_bot`, lines 632–636;
  - the uniformization pieces at the pin, lines 666–679.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 distinguished embedding | ℚ(√−5) by θ and −θ; parameters −4, −1 | ι_(K,θ)(θ)=i√5, ι_(K,−θ)(θ)=−i√5=conj; QA(−4)→QA(−1), ω↦2ω, 2i=2·i | agree | none |
| §1.2 units, primes | d=−3, −1, −5; ℤ[√−3] | ω²=ω−1⇒ω³=−1, order 6; a²+3b²=1⇒±1; (2)=(2,√−5−1)²; 6 nonresidue mod 11 | agree | none |
| §1.3 forms and classes | Δ=−23, −20, −12, −4, −3 | 3, 2, 1 primitive classes; H(12)=1+1/3=4/3; weights 1/2, 1/3 = 2h/w | agree | none |
| §1.3 lattice of a form | (2,1,3), (2,−1,3) | τ=(−1+i√23)/4; ideal image 2(ℤ+ℤτ); opposite root (1+i√23)/4=−τ̄ | agree | none |
| §1.4 conductor formula | ℚ(i) f=2; ℚ(√−3) f=2,3,4; ℚ(√−11) f=2; ℚ(√−7) f=2 | Pic 1,1,1,2,3,1; disc −16,−12,−27,−48,−44,−28 | agree | none |
| §1.4 lattice form | D=−7, f=2; general f | (f²D+δ)/2−fω_D = f(fd−1)/2 ∈ ℤ; ℤ+ℤ(3+i√7)=ℤ+ℤi√7 | agree | none |
| §2.1 χ_D dictionary | χ₋₈ at 3,5,7; χ₋₄(3); χ₋₇(2); χ₋₂₀(2) | 1,−1,−1; −1 inert; 1 split; 0 ramified | agree | none |
| §2.2 class-number formula | the nine discriminants | L(1,χ)=0.6046, 0.7854, 1.1874, 1.1107, 0.9472, 0.7207, 0.4791, 0.3838, 0.2461 | h=1 each | none |
| §2.3 log bound | χ₋₄ at levels 4, 12; D=−7, −23 | 0.785≤2.386; π/3=1.047≤3.485; h-bounds 2.48, 6.31 | agree | none |
| §2.3 product character | χ₋₄·χ₋₄, χ₋₄·χ₈ | ζ(s)(1−2^−s); values at 1,3,5,7 = 1,1,−1,−1 = χ₋₈ | agree | none |
| §2.4 constants | D=−3, −163; B=0, 1 | c_ε≤0.6046·3^ε; C_ε≤163^(ε−1/2); B=0 vacuous, C_1≥163 | consistent | none |
| §3.1 multiplication matrix | D=−4 (B=0,C=1); D=−3 (B=−3,C=3) | i↦[[0,−1],[1,0]]; τ−2↦[[1,−3],[1,−2]], det 1 | agree; Shin misprint | source issue |
| §3.1 ray degree | 2 inert, D≠−3; D=−3; D=−4, N=2 | #(𝒪/2)ˣ=3 → degree 3; units onto 𝔽₄ˣ → 1; unit image 2 vs ±1 image 1 | agree | none |
| §3.1 uniformisation | ModularForms §10D lines 1326–1340 vs §3.1 lines 680–698 | both: ℂ/Λ→E_Λ(ℂ) bijective group isomorphism; every curve over ℂ is some E_Λ | two owners | R01 |
| §3.1 reciprocity locator | Shin Lemma 4.1, Theorem 4.8, Proposition 2.5 | 4.1: g₀g₁g₂=2ζ₈; 4.8: generation of K_(2); kernel: Proposition 2.5, p. 5 | wrong locator | C03 |
| §3.2 q-orders | g₀, g₁, g₂ at ∞ | B₂(0)/2=1/12, B₂(1/2)/2=−1/24, −1/24; sum 0 | agree with 2ζ₈ | none |
| §3.2 γ₂ at i | Weber cubic at j=1728 | (X−8)²(X+64); g₀¹²=8.000, g₁¹²=8.000, g₂¹²=−64.000; (8+16)/2=12=(−64+16)/(−4) | agree | none |
| §3.2 exponent | N=2, 3, 6, 8 | 12N/gcd(6,N)=12, 12, 12, 48 | agree with Shin Remark 2.2 | C04 locator |
| §3.3 level-two norm | D=−7, D=−8 | g₀¹²(τ₋₇)=−1.0000, j=−3375; x=0.56854·(−112.5685)=−64.0000, j=8000 | agree with (20) | none |
| §3.3 fourth-power cubic | Y=g_i⁴, ξ⁴=−α⁴ | Y³−γ₂Y+16=0 ⇒ (−Y)³−γ₂(−Y)−16=0 | agree | none |
| §3.4 bounds | A=e^(−π√31), A=e^(−π√51) | 2A^(1/12)=0.4656; 2.0733; product 0.9653; level three 0.9309 | <1 where claimed | none |
| §3.4 library form a≤1/2 | a<0 | needed A^a+A^(1−a)≤2A^a ⇔ a≤1/2 | true | none |
| §3.4 survivors | −31<D<0, 2 not inert; D≡21 mod 24 | −4,−7,−8,−15,−20,−23,−24 with h 1,1,1,2,2,3,2; −3,−51,−123,−195 | agree | none |
| §3.5 quartic, heegnerGamma | six integer points; X³+2X²+4X+2 | 0, −32, −96, −960, −5280, −640320; fourth-power cubic X³+96X−16 | agree | none |
| §3.6 order criterion | D=−3 f≤5; D=−4 f≤5; D≡1 mod 8 | Pic 1,1,2,2 for f=2–5; 1,2,2,2 for f=2–5; Pic 2−χ(2) at f=2 | agree with library | none |
| `quadratic_LFunction_siegel` | q=1, 2, 3, 8 | no primitive nonprincipal at 1, 2; L=0.6046 at 3, 1.1107 at 8 | consistent | none |
| `imaginary_classNumber_lower_bound` | ε≥1/2; D=−163 | exponent ≤0 makes it weaker; C_ε≤163^(ε−1/2) | consistent | none |
| `imaginary_discr_bounded_of_classNumber_le` | B=0, 1 | B=0 vacuous; every C at B=1 is ≥163 | consistent | none |
| `classNumber_eq_one_iff_discr_mem` | D=−7, −15, −163 | h=1, 2, 1; 7∈, 15∉, 163∈ list | agree | none |
| `classNumber_eq_one_iff_negative_squarefree_mem` | θ=2i (d=−4); d=−3, −15 | −4 not squarefree, excluded; 3∈, 15∉ | agree | none |
| `pic_eq_one_iff_discr_mem` | O₂⊂ℚ(√−11), O₄⊂ℚ(√−3), O₂⊂ℚ(√−7) | disc −44 Pic 3; −48 Pic 2; −28 Pic 1 | agree | none |
| Scope, effective form | AnalyticNumberTheoryPartI §0.9, §0.34 | effective L(1,χ)≥c/log q rests on Landau–Siegel exclusion, open | misleading | C02 |

- Source locators checked in shin2010: 7 of the README's 7. These are Lemma 4.1, Theorem 4.6 with (19)–(20), Theorem 4.8, Lemma 5.1, Theorem 5.2 with Table 1, and §2 (Propositions 2.1, 2.3 and 2.5, Remark 2.2). One is misplaced (C03).
- Library: all 218 qualified names in the README were checked with `#check` at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, and 0 are missing. About 30 statements were read against the text, among them:
  - `ClassNumberOne/FourthPowerCubic.lean:65,110`
  - `ClassNumberOne/HeegnerNumbers.lean:70,87`
  - `ClassNumberOne/HeegnerQuartic.lean:266`
  - `ModularForms/SiegelFunction/Bounds.lean:103`
  - `SiegelFunction/ClassNumberOne.lean:207`
  - `Orders/Quadratic/ClassNumberOne.lean:210`
  - `Quadratic/ResidueUnits.lean:79`
  - `Quadratic/DedekindZeta.lean:241`
  - `Quadratic/MaximalRealSubfield.lean:60,70`
  - `Orders/Discriminant.lean:85,221`
- Cross-roadmap citations resolved on main:
  - ClassFieldTheory Layers 10–13 (lines 1638, 1781, 1834, 1924)
  - GlobalNumberFields Layer 11 (line 571)
  - ModularForms Layer 11 (line 1459) and §10D (line 1313)
  - ModularCurves §5.3 (line 77)
  - EllipticCurves' scope exclusion of uniformisation (line 150)
  - AnalyticNumberTheoryPartI §0.9 (line 288) and §0.34 (line 19)
- Automatic checks: all passed on this head. The dependency check, rerun, gives `depcheck: 200 roadmaps, 2208 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. No path outside the folder changed.
- Lean: `lake env lean` on `Suggested.lean` gives exactly 6 `sorry` warnings. `#check @name` for all 6 declarations matches the README's generality. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`) closes none of them.
- Numerics: every computed value in the 45 Checks and the three Examples sections was recomputed in floating point or exactly; see the table.
- Pull-request text: correct for this head except for the sentence on resolving citations (C01). The cited roadmaps are the same set on main and at head, and no headline or Lean declaration was removed.
- Overlap check: I read the scopes of QuadraticCharactersAndReduction, EffectiveClassNumbers, IntegralLattices (at #1411), ComplexMultiplicationAndExplicitReciprocity, EllipticPeriods, AnalyticNumberTheoryPartI and MultiquadraticPartII, and ModularForms (found by searching by object). Ownership of each shared object:
  - Complex uniformisation: owned by ModularForms §10D, and claimed here too (R01).
  - Siegel's ineffective bound: owned here. AnalyticNumberTheoryPartI states an effective form and leaves the ineffective proof to this roadmap.
  - CM dictionary and finite-level reciprocity: owned here, consumed by ComplexMultiplicationAndExplicitReciprocity.
  - χ_D and the form–ideal correspondence: Tau Ceti. QuadraticCharactersAndReduction and IntegralLattices consume them.
  - Effective class-number bounds: EffectiveClassNumbers, a consumer of this roadmap.
  - MultiquadraticPartII shares nothing with this roadmap.

Source independence: 12 passages of §§3.1–3.6 and the Summary compared with shin2010, the only cited text that could be read. No wording is shared: the longest common run outside the bibliography is a 7-word formula phrase, "g^(12N/gcd(6,N)) is a modular". The source with the largest share of literary locators is shin2010, 7 of 15 (Davenport 4, Cox 2, Stark 2). Contents compared with shin2010: independent. Layers 1–2 have no counterpart in it, and Layer 3 omits Shin §3. Layer 3 splits Shin §2 into §§3.1–3.2 and Shin §5 into §§3.4–3.6, and the order of §§3.1–3.6 is forced by their *Needs:* lines. No source table or list is reused: the γ₂ values and the thirteen discriminants are mathematical facts, also present in the pinned library.

Research link: The headlines are Siegel's theorem (1935) and the Heegner–Stark class-number-one theorem (Heegner 1952; Stark 1967, 1969), proved by Shin's route (arXiv 1009.2253). Consumers include EffectiveClassNumbers (Goldfeld–Gross–Zagier bounds) and ComplexMultiplicationAndExplicitReciprocity. This rests on the README's References, its Downstream consumers list, and shin2010 lines 61–66.

## Not verifiable

- Cox, *Primes of the Form x² + ny²*, Theorems 7.7 and 7.24 (§§1.3–1.4) and §12: this is a commercial book with no legal open copy, and it is not recorded in the sources manifest. Not opened.
- davenport1980, Chapters 6 and 21 (§§2.1–2.4): settled as uncertified. Not opened.
- stark1969, pp. 16–27 (§3.3): settled as uncertified. Not opened.
- Stark 1967, Michigan Math. J. 14: cited without a locator. Not opened.

Automatic checks set aside as false positives: no check failed. The worker's declaration listing misreads two docstring lines of `Suggested.lean` that begin with a keyword: line 17 ("theorem of the roadmap…") is listed as a declaration `of`, and line 63 ("class number one…") as a class `number`.

## Source issues

- **Misprint** in shin2010 at Proposition 2.5, p. 5 (arXiv v6): the source says the kernel for ℚ(√−3) contains ±[[−1, −3], [1, −2]], a matrix of determinant 5; it should be ±[[1, −3], [1, −2]], the multiplication matrix of the unit τ_K − 2 = (−1 + √−3)/2; affects nothing.

## For the human reviewers

- AnalyticNumberTheoryPartI on main (line 19, §0.34) states unconditionally an effective c_LS with (1 − β) log q ≥ c_LS for all real zeros, the open Landau–Siegel problem; this README points to it (lines 30–31, 1124–1129).
