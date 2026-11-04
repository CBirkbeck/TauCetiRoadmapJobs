<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1105#issuecomment-6394024300 -->
Review (claude) of 0488884

Verdict: needs changes

1. **F01** (P2) gap:polarized-toric-algebraization asks for Mumford's construction, which ShimuraCompactifications already supplies

   - **Location.** `packages/AbelianSurfacesModularity/README.md` line 90: "What NeronModelsAndSemistableAbelianVarieties must provide (gap:polarized-toric-algebraization): For a rank-g torus over a complete discretely valued field, split by a finite unramified extension, and a Galois-stable rank-g period lattice, algebraize the rigid quotient …". The same gap is used at line 86, in §4.7 (line 681 and the *Needs* at line 713), in the FC90 clause of References (line 1232) and in `design/plan.json` `gaps`. The gap was added by the round-1 repair of F01.
   - **Claim.** No earlier roadmap algebraizes polarized degeneration data with an unramified torus, so NeronModelsAndSemistableAbelianVarieties §3.14 has to supply it.
   - **Witness.** ShimuraCompactifications C4.5 builds, from positive polarized degeneration data over a complete normal base with isotrivial tori (C4-a), a degeneration with polarized generic fibre; C4.6 matches Néron §§3.13–3.14 over a DVR. ORDER.txt: line 178 < 261.
   - **Repair.**
     - Delete the contract at line 90 and the slug `polarized-toric-algebraization` from `design/plan.json` `gaps`.
     - Add a subsection `### From TauCetiRoadmap.ShimuraCompactifications`. It consumes C4.4–C4.6 under (C4-a), over ℤ₂ with ideal (2), with:
       - abelian part 0;
       - isotrivial character and period lattices X ≅ Y ≅ ℤ², Frobenius acting by R;
       - φ the identity;
       - periods ((q,t²),(t²,q)).
     - In §4.7, replace "Apply the polarized toric algebraization contract of NeronModelsAndSemistableAbelianVarieties §3.14" by "Apply ShimuraCompactifications C4.5–C4.6". Keep Néron §3.14 only for the torsion cone, the evaluation Weil pairing and unramified descent.
     - Update line 86, the §4.7 *Needs* and the FC90 sentence in References to match.
     - **Tested on the instance:**
       - The coupled datum satisfies the C4.4 positivity condition: the valuation of the period form at mλ₁+nλ₂ is 6(m²+n²) > 0 for (m,n) ≠ 0.
       - The identity Y → X is Galois-equivariant: χ₁ ↦ χ₂ ↦ −χ₁ and λ₁ ↦ λ₂ ↦ −λ₁.
       - On a scratch copy of the README with the new citation, the dependency check prints `depcheck: 48 roadmaps, 560 edges, 0 problem(s)`.

2. **F02** (P2) gap:three-two-two-two-seed is this roadmap's own seed construction, written as a gap

   - **Location.** `packages/AbelianSurfacesModularity/README.md` line 55: "What AbelianSchemesAndArithmeticModuli must provide (gap:three-two-two-two-seed): Lift and deform Res_(𝔽₉/𝔽₃) of y²=x(x−1)(x−t), t²=−1, to a nearby genus-two Jacobian over ℚ₃ …". The gap is also used in §8.7 (line 1147 and the *Needs* at line 1181) and in `design/plan.json` `gaps`, where its supplier section is A4.14 and A6.32.
   - **Claim.** Deforming this one decomposable special fibre to a Jacobian is something AbelianSchemesAndArithmeticModuli A4.14 and A6.32 must provide.
   - **Witness.** A4.14 is stated only for smooth C₀ and excludes decomposable surfaces; A6.32 only constructs Weil restrictions. This roadmap's §5.3 (line 833) performs the same lift–Torelli–neighbourhood passage for E₋₁×E₂ and E₁×E₋₂.
   - **Repair.**
     - Delete the gap (README line 55 and `design/plan.json` `gaps`).
     - Add to §4.8 the unmarked Torelli statement: genus-two curves with a symplectic level-3 framing form the open complement of the product locus in B(ρ̄) (BCGP21 Definition 10.2.2 and the paragraph after it, p. 269, line 12976).
     - Add to §8.7 a target, the Weil-restriction seed at 3, with this statement:
       - Res_(𝔽₉/𝔽₃)E is a principally polarized ordinary surface over 𝔽₃.
       - Lift it to ℤ₃ by A4.12, or by the ordinary canonical lift of A4.10.
       - By the new §4.8 statement and the local-neighbourhoods contract, a nearby ℚ₃-point is a Jacobian with the same special fibre. Its Jacobian reduction is therefore good, ordinary and 3-distinguished, and its 2-torsion is unramified of type [2,2,2].
     - *Needs* of the new target: AbelianSchemesAndArithmeticModuli A4.10 and A4.12, A6.32–A6.33; §4.8; the NeronModelsAndSemistableAbelianVarieties local-neighbourhood contract.
     - **Tested on the instance:**
       - #E(𝔽₉) = 8 and the trace is 2, so Q = X⁴−2X²+9, with b = −2 prime to 3 and distinct roots.
       - The Frobenius swap of the two product factors fixes 0 of the 6 odd theta characteristics, which is partition [2,2,2].

3. **F03** (P3) RelativeJacobiansAndIntegralCurveModels cited at the wrong section, and without its section hypothesis

   - **Location.** `packages/AbelianSurfacesModularity/README.md` line 182: "and §2.3 for specialization in a smooth proper curve family and its relative Jacobian. Smooth curve reduction gives good Jacobian reduction and identifies its special fibre with the Jacobian of the curve fibre". Lines 178 and 626 and the *Needs* of §§4.4, 5.1 and 8.1 cite §2.4 for the same fact.
   - **Claim.** The supplier gives good Jacobian reduction for every smooth genus-two model.
   - **Witness.** There, §2.3 is Jacobian points and Galois descent over a pointed field curve; specialization is §2.4, and §§2.1–2.4 assume a section. y²+(x³+x²+1)y = x⁶+x⁵+1 is smooth and pointless over 𝔽₂, so its ℤ₂-lifts have no section.
   - **Repair.**
     - At line 182, replace "§2.3" by "§§2.2 and 2.4".
     - At line 182, and in the bullet at line 626, add: "for a model without a section, pass to an unramified extension over which the smooth special fibre has a rational point (lift it by Hensel's lemma), apply §§2.2 and 2.4 there, and descend good Jacobian reduction by NeronModelsAndSemistableAbelianVarieties §5.1".
     - **Tested:**
       - The example curve has (#C(𝔽₂), #C(𝔽₄)) = (0, 6), so it acquires points over 𝔽₄.
       - 16 of the 768 smooth equations over 𝔽₂, and 19 of the 1296 over 𝔽₃, have no rational point.

4. **F04** (P3) "the cited dataset" no longer refers to anything

   - **Location.** `packages/AbelianSurfacesModularity/README.md` line 1011 (Check of §7.6): "The conductor-1982 curve has positive dyadic conductor, whereas its mod-3 representation is unramified in the cited dataset". Line 1017 (Examples) uses the same curve with no locator.
   - **Claim.** A cited dataset supports the example.
   - **Witness.** After F11 deleted the dataset section, the README cites no dataset. The curve and its unramified mod-3 representation are BCGP25 §10.1, p. 210, line 9773; §7.6 cites only lines 9671 and 9700.
   - **Repair.** Replace "in the cited dataset" by "(BCGP25 §10.1, p. 210, line 9773)", and add the same locator to the sentence at line 1017.

5. **F05** (P3) ambiguous "§1.1" in Theorem B

   - **Location.** `packages/AbelianSurfacesModularity/README.md` line 985: "(both hold when ρ̄_(Jac X,3) is surjective, the hypothesis of Theorem B in §1.1)".
   - **Claim.** The surjectivity hypothesis of Theorem B is in §1.1.
   - **Witness.** The README's own §1.1 is "The ten outer conjugacy classes of PGSp₄(𝔽₃)". Theorem B's surjectivity hypothesis is in BCGP25 §1.1, p. 3, line 150.
   - **Repair.** Write "the hypothesis of BCGP25 Theorem B (BCGP25 §1.1, p. 3, line 150)".

All thirteen round-1 findings are repaired (details under Verified sound). Two of the repairs left side defects (R01 and R03, R04). One declared gap is this roadmap's own construction (R02). Two findings block: R01 and R02, both P2.

## Verified sound

### Round-1 findings, one by one

| Id | Repaired passage (quoted) | Status |
| --- | --- | --- |
| F01 | line 685: "Exactly two of the six odd quadratic refinements of K are fixed, so this action is a double transposition." Line 683 keeps the diagonal periods as a negative control. | repaired: the 2C seed is now correct (computations below). The gap the repair added is R01. |
| F02 | line 9: "… belong to NeronModelsAndSemistableAbelianVarieties §§6.11–6.13, including the Siegel-parabolic intersection comparison in §6.13." The old §2.3 is gone and §§4.4–4.5 no longer cite it. | repaired |
| F03 | line 881: "Apply InverseGaloisAndArithmeticFundamentalGroups IG.2.7 to the smooth rational marked Torelli locus, with local opens at 2,3 and infinity." gap:projective-thin-count has 0 hits in the README and in plan.json, and Suggested.lean no longer lists it. | repaired |
| F04 | line 200: "over ℚ, a product of two non-isogenous elliptic curves is modular here with r = 2, and some products fail the stronger notion." Also line 212. | repaired |
| F05 | line 378: "(ArithmeticGaloisRepresentations §7.9 (adequacy))"; line 481: "(ArithmeticGaloisRepresentations §7.9 (weak adequacy))". | repaired |
| F06 | line 148: "R17.5.1 and R17.5.4–R17.5.7 for the solvable Artin branch". Also line 1053. | repaired |
| F07 | line 623: "In characteristic 2 the criterion is gcd(h,h′²f+f′²)=1 and, at infinity, h₃ ≠ 0 or h₂²f₆+f₅² ≠ 0." Line 178 points integral models to RelativeJacobiansAndIntegralCurveModels. | repaired; R03 is a residual inconsistency |
| F08 | line 46 is the only occurrence of the fixed-vector paragraph. | repaired |
| F09 | a parse of every *Needs* line finds no self-reference, forward reference or cycle. §5.3 now needs "§§4.8, 5.1–5.2". | repaired |
| F10 | line 663: "BCGP25 Lemma 9.2.13 omits hypothesis (4)." "corrected" has 0 hits. | repaired |
| F11 | the C★ coefficients and the precision target are gone; §4.9 (line 738) uses the Lemma 9.2.17 curve; §8.2 is now Lemma 10.2.5. | repaired; R04 is a dangling reference |
| F12 | line 106: "Translate the general even-rank symmetric-form dichotomy of PL.4 to the matrix ψ(c_v)J of BCGP25 Lemma 5.2.7, prove its nonzero-diagonal test, and count the involution classes …". It is identical in plan.json. | repaired |
| F13 | sources.toml line 58: "Conventions and §0.1; §§1.4 and 7.1 (tidiness); §4.8 (odd-theta rationality); §8.3 (Galois types)". | repaired |

### Elaboration and declaration check

`lake env lean` on `packages/AbelianSurfacesModularity/Suggested.lean`, run from the content checkout, exits 0 with no output. The file declares nothing, so there is no `sorry` warning and the `#check @name` binder comparison has nothing to check. The file has:

- a single `import Mathlib`;
- no `set_option` and no sorry'd data;
- the required module docstring, which names each non-statable headline and the carrier it lacks;
- `namespace TauCetiRoadmap.AbelianSurfacesModularity`.

### Headlines and padding

The README's headlines are:

- §0.3, Layer 3 and §4.10;
- §§6.2–6.3;
- §§7.1–7.6, which include Theorems A and B;
- §8.1, §§8.2–8.4 and §§8.7–8.8.

None of them is statable at the pins:

- Mathlib has no automorphic representations of GL₄ or GSp₄ and no genus-two Jacobians.
- Tau Ceti's hyperelliptic file is function-field level only (`TauCeti/FieldTheory/FunctionField/Hyperelliptic/RationalSubfield.lean`).
- Tau Ceti's `TauCeti.AlgebraicGeometry.AbelianVariety` (`AbelianVariety/Basic.lean` line 95) carries no polarization and no torsion.

The docstring matches this list. The one-tactic probe is vacuous because the file has no declarations, so there is no padding.

### Dependency check (verbatim)

    depcheck: 48 roadmaps, 559 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. ORDER.txt puts the roadmap at line 261, after GSp4NonregularModularityLifting (line 260).

### Declared gaps

- The 21 `(gap:…)` contracts in the README equal the 21 slugs in `design/plan.json`, with identical supplier and needs text, each in its supplier's subsection.
- No gap has supplier `none`.
- R01 and R02 are the exceptions to minimality.
- For gap:strong-odd-symplectic-criterion, the count n+1+⌊n/2⌋ is correct when n is half the dimension, as in BCGP25 p. 119 line 5334: n = 1, 2, 3 give 2, 4, 5, and n = 2 gives the four classes of §2.3. Writing "Sp_(2n)" would keep n from being read as PL.4's even GL_n rank. This is a note, not a finding.
- I judged local-neighbourhoods, surface-residual-endomorphisms and genus-two-level-three-monodromy to be single-theme contracts, not compound ones.

### Seeded source sample (BCGP25 arXiv v1 extraction; no locator was flagged unverified by the author)

| Target | Source checked | Result |
| --- | --- | --- |
| 0.2 | Definition 9.1.2, line 8635, p. 187; Definition 1.8.10, line 499, p. 11 | supported |
| 1.2 | §9.1, lines 8625–8634; §9.2, lines 8872–8875; Remark 9.1.1, line 8630 | supported ("unramified twist" is quadratic because the multiplier is fixed) |
| 2.2 | §8.1, lines 8299–8304 (characteristic ≠ 2) | supported |
| 2.4 | Lemma 8.2.1, lines 8356–8390; Brauer character before Lemma 8.1.2, line 8310 | supported. Widening to any characteristic-2 field containing 𝔽₄ is valid because 𝔽₄ is a splitting field. |
| 3.2 | Theorem 8.3.2, lines 8546–8581; Theorem 1.8.17, line 641 | supported. Theorem 1.8.17 attaches ρ_π,p only for π ordinary at p, which justifies the README's restriction to ordinary attaching primes. |
| 4.3 | Lemma 9.1.4, lines 8676–8698 | supported (point counts recomputed) |
| 4.5 | Table 9.2.5 and Lemmas 9.2.6–9.2.7, lines 8943–8998; Lemmas 9.2.11–9.2.12, lines 9051–9082; Lemma 9.2.19, lines 9226–9237 | supported |
| 4.6 | Lemma 9.2.13, lines 9083–9100; §9.2.16, line 9177 | supported, with hypothesis (4) added (round-1 source issue) |
| 4.8 | Definition 9.2.1, lines 8856–8871; BCGP21 Definition 10.2.2, Proposition 10.2.3 and Lemma 10.2.4, lines 12966, 12991 and 13038 | supported |
| 5.2 | Remark 9.3.8, lines 9448–9468; Lemma 9.3.1(3), line 9270 | supported (a new source misprint is listed below) |
| 5.3 | Corollary 9.3.6 and Lemma 9.3.7, lines 9362–9447 | supported (table recomputed) |
| 6.3 | Remark 9.4.4, line 9553; Remark 9.4.3, line 9550 | supported |
| 7.5 | Theorem B, line 150; Theorem 9.5.4, line 9656; line 9561 | supported |
| 8.3 | §10.2, lines 9785–9819; FKRS12 Definition 1.3 and Theorems 1.4–1.5, lines 167–194; Theorem 4.3, line 1002 | supported |
| 8.7 | Lemma 10.3.6, lines 10182–10291 | supported (all nine triadic curves and three dyadic curves recomputed) |

Result: 15 of 15 targets supported.

### Adversarial pass (values computed this round)

The rows cover every passage the repairs changed or added, and every sampled target. For §0.3, §1.1, §§1.3–1.5, §§2.5–2.6, §3.1, §§4.1–4.2, §5.1, §§7.1–7.4, §8.2, §§8.4–8.6 and §8.8 (none touched by a repair except for renumbering), I rely on the round-1 table, whose rows carry computed values.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Frobenius direction | elliptic fibre of trace 1 at 3 | Q = X²−X+3, L = 1−T+3T²; the inverse convention gives constant 1/3 | holds | none |
| §0.1, repaired wording | E₁×E₂ over ℚ | ranks 2+2 = 4, r = 2; claim worded as existence only | holds | none |
| §0.2 (sample) | traces −1 and 2 at 3 | (x²+x+3)(x²−2x+3) = X⁴−X³+4X²−3X+9; factor discriminants −11 and −8; ≡ X²(X+1)² mod 3 | holds | none |
| §1.2 (sample) | (x²+x+2)² over 𝔽₃; ±I | x⁴+2x³+2x²+x+1, the 4C/12C row (lower sign); ν(±I) = 1 ≠ −1 | holds | none |
| §2.1 Check, repaired | centralizers in S₆ | C((12)(34)(56)) has order 48 and is C₂≀S₃ ≅ S₄×C₂; its intersection with a point stabilizer has order 8; C((12)) = ⟨(12)⟩×S₄ has order 48 | holds | none |
| §2.2 (sample) | separable quintic; irreducible sextic; trivial action | 1, 0 and 6 fixed letters | holds | none |
| §2.3 (renumbered) | I, I+E₁₄, I+E₁₄+E₂₃, (I,I;0,I) | diag(gJ) = 0000, 1000, 1100, 0000 | holds | none |
| §2.4 (sample) | Brauer characters | V on a 3-cycle: 1+1+ω+ω⁻¹ = 1; U⊕U^σ: −2; permutation character (6,1,3) minus 2 = (4,−1,1) | holds | none |
| §4.3 (sample) | C₁, C₂, C₃ over 𝔽₂ and 𝔽₄ | (N₁,N₂) = (5,7), (3,7), (3,3); (a,b) = (2,3), (0,1), (0,−1); Q(1) = 14, 6, 4; all smooth by the §4.4 test | holds | none |
| §4.4 test, characteristic 2 (new) | h=1,f=x⁵; h=1,f=x⁶; h=x³+1,f=x²+x; h=f=0 | smooth; singular (infinity value 0); smooth (gcd(x³+1, x⁶+x⁵+1) = 1, h₃ = 1); singular | holds | none |
| §4.4 test, odd characteristic (new) | f = x⁵−x and x⁴−1 over 𝔽₃; D = x⁶+1 = (x²+1)³ | smooth; excluded (degree 4); D′ = 0, so gcd = D and the curve is singular | holds | none |
| §§4.4 and 5.1 counts (new test) | all 2048 pairs (h,f) over 𝔽₂; all 2187 f over 𝔽₃ | 768 smooth and 384 ordinary over 𝔽₂. Over 𝔽₃: 1296 smooth (2·486 + 2·162) and 864 ordinary; 10 square Q: (a,b) = (−2,7)×4, (2,7)×4, (4,10)×1, (−4,10)×1 | holds | none |
| RelativeJacobians contract (new) | pointless smooth models | 16 of 768 over 𝔽₂ and 19 of 1296 over 𝔽₃ have no rational point; the supplier assumes a section | citation defect | R03 |
| §4.5 (sample) | Q(1) parity; eigenvalue ratio | 8A rows give Q(1) = 9 and 3; the ±3 rows give 19 and 1; the nonsquare 4C/12C row gives 7. If α and −α both satisfied x²+x+2 then 2α = 0, but 0 is not a root. | holds | none |
| §4.6 (sample) | Y over 𝔽₂ | N = (3,9), (a,b) = (0,2), Q = X⁴+2X²+4, Q(1) = 7, not ordinary; X²+1 takes 1, 2, 2 on 𝔽₃ | holds | none |
| §4.7 coupled 2C seed: arithmetic (new) | u² = u+1, t = u³, q = 8000 | N(u) = −1, t = 2u+1, t² = 8u+5, σt = −t⁻¹, (σt)⁻² = t²; φλ₁ = λ₂, φλ₂ = λ₁⁻¹; valuation matrix diag(6,6); q = 8000 = 20³ = 5·40² | holds | none |
| §4.7 equivariance (new) | Galois action on the character group X and the period lattice Y | χ₁ ↦ χ₂ ↦ −χ₁; λ₁ ↦ λ₂ ↦ −λ₁; the identity Y → X is equivariant; the period matrix is symmetric | holds | none |
| §4.7 Weil pairing (new) | e₂(x,x′) = χ_φ(y′)(x)/χ_φ(y)(x′) | well defined modulo Y (by symmetry of the period form); ⟨e_i,f_j⟩ = δ_ij; ⟨f₁,f₂⟩ = t/(−t) = −1; diagonal periods give 1 | holds | none |
| §4.7 theta counts (new) | all 16 refinements for (K₁, swap) and (K₀, swap) | coupled periods: 6 odd, 2 fixed ((1,1,0,0) and (1,1,1,1)), centralizer 16 in the 720-element group. Diagonal periods: 0 fixed, centralizer 48, and x ↦ ⟨x,Mx⟩ vanishes identically. | holds | none |
| §4.7 3-torsion (new) | Frobenius on T[3]: (ζ^i,ζ^j) ↦ (ζ^j,ζ^−i), i.e. −R; on the period thirds (20,u²), (u²,20): R | B(−Rx,Ry) = −B(x,y), so ν = −1; M² = −I, so the class is 2C | holds | none |
| §4.7 product seeds | (x²−1)(x²+x+2); (x²+x+2)(x²−x+2); the curve Y | x⁴+x³+x²+2x+1 mod 3 (8A); X⁴+3X²+4 ≡ X⁴+1 (4D); Y has 4 points over 𝔽₂ (trace −1); its 2-division roots −1, 3, −5/4 are rational | holds | none |
| gap:polarized-toric-algebraization (new) | ShimuraCompactifications C4.4–C4.6 with A = 0 and X = Y = ℤ² isotrivial | C4.5 constructs the algebraization; C4.6 matches it with Néron 3.13–3.14 | already provided | R01 |
| §4.8 (sample) | cover degrees | 720/120 = 6; the trivial subgroup has degree 120 over P | holds | none |
| §4.9 (renumbered, new seed) | the Lemma 9.2.17 model mod 2 | singular mod 2, so reduction is bad; conductor 2² (source); purely toric by §4.6 with (4); quotient values ±i | holds | none |
| §4.10 | table against Theorem 9.2.3, lines 8904–8914 | 4 good, 8 semistable; excluded {4C, 12C}; 2C supplied by the coupled seed | holds | none |
| §5.2 (sample) | traces −1, 2 and 1, −2 | unit roots ≡ a mod 3: (−1,−1) gives scalar −1, (1,1) gives +1; Q₋(1) = 10, Q₊(1) = 18 | holds | none |
| §5.3 (sample) | the four quintics over 𝔽₃ and 𝔽₉ | (N₁,N₂) = (7,15), (7,11), (3,13), (5,11); (a,b) = (3,7), (3,5), (−1,2), (1,1); Q ≡ X²q(X) with q = X²+1, X²−1, X²−X−1, X²+X+1 | holds | none |
| §6.1 (renumbered) | class 2C | the coupled seed fixes 2 odd theta characteristics, so it gives a point of P(ρ̄)(ℚ₂) | holds | none |
| §6.2 | x(x²+1)(x²+2) | one real root plus ∞: 2 fixed letters and 2 swapped pairs, sign +1 | holds | none |
| §6.3 (sample) | markings per curve | at most 6·103680 = 622080 | holds | none |
| §7.5 (sample) | Theorem B against Theorem 9.5.4 | identical hypotheses; the 10 square-Q curves have 0 rational Weierstrass points (line 9275) | holds | R05 (locator) |
| §7.6 | −ζ for ζ of order 1, 2, 3, 4, 6 | orders 2, 1, 6, 4, 3; a root α of x²±x+2 has α⁴ = N(α) = −1, so order 8 | holds | R04 (locator) |
| §8.1 | densities | 624/2048 = 39/128; 854/2187; product 5551/46656 | holds | none |
| §8.3 (sample) | ℝ×ℝ with trivial and swap actions | fixed dimensions 2 and 1; 34 rational types (FKRS12 line 1005) | holds | none |
| §8.7 (sample) | the nine triadic curves; Res E; the middle dyadic model | all partitions match; all smooth; (a,b) = (0,−2), (1,2), (2,2), (2,2), (1,2), (1,−1), (2,4), (0,1), (2,5), none square; #E(𝔽₉) = 8, so Q = X⁴−2X²+9; middle dyadic model (5,7), so (2,3) and Q(1) = 14 | holds | none |
| gap:three-two-two-two-seed | A4.14 against a decomposable fibre | A4.14 needs a smooth C₀; the steps are A4.12, the Torelli open of §4.8 and local neighbourhoods, as in §5.3 | own target | R02 |

### Pinned declarations opened (Mathlib 6b7abb3c, Tau Ceti a91d3aaf)

Mathlib:

- `Matrix.J` (`LinearAlgebra/SymplecticGroup.lean` 58) and `Matrix.symplecticGroup` (101, a submonoid);
- `Matrix.charpoly` (`Charpoly/Basic.lean` 132) and `Matrix.IsSymm` (`Symmetric.lean` 33);
- `alternatingGroup` (`Alternating.lean` 72), `card_alternatingGroup` (136, requires a nontrivial type) and `alternatingGroup.isSimpleGroup` (`Alternating/Simple.lean` 203, requires 5 ≤ card);
- `MulAction.stabilizer` (`GroupAction/Defs.lean` 515) and `Representation` (`RepresentationTheory/Basic.lean` 48);
- `groupCohomology.H1` (`LowDegree.lean` 965) and `Polynomial.aroots` (`Roots.lean` 479).

Tau Ceti:

- `TauCeti.AlgebraicGeometry.AbelianVariety` (`AbelianVariety/Basic.lean` 95; its fields are a group object, properness and geometric integrality);
- `TauCeti.schurMultiplier` (`SchurMultiplier.lean` 148);
- `Representation.exists_ne_zero_apply_eq_self_of_forall_pow_eq_one` (`PGroupInvariants.lean` 161, in namespace `Representation`, requiring CharP, Finite and Nontrivial).

### Cross-roadmap citations resolved (open heads, the board's design packages, main)

Every cited section exists:

- AbelianSchemesAndArithmeticModuli: A3.7, A3.8, A3.11, A3.12, A4.9–A4.14, A5.7, A6.5, A6.7, A6.8, A6.12, A6.20, A6.32–A6.34.
- AbelianSchemesAndArithmeticModuliPartII: F3.2.
- ArithmeticGaloisRepresentations: §§5.12, 6.3, 6.4, 7.3, 7.6, 7.9–7.11.
- FaltingsFinitenessAndIsogenyTheorems: R28.4 and R28.4.4–R28.4.7.
- NeronModelsAndSemistableAbelianVarieties: §§3.5, 3.6, 3.11, 3.12, 3.14, 5.0a–5.0c, 5.1–5.6, 6.10–6.13.
- LocalGaloisDeformationRings: §§2.2, 6.27, 6.29, 6.31–6.35.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory: R07.6.10.
- PotentialAutomorphyInfrastructurePartII (design): PL.0 (both named parts) and PL.4, including "Strong residual oddness at a real place" with `complexConjugation_dichotomy`.
- GSp4NonregularModularityLifting (design): NR2.5, NR2.6, NR10, NR11.2–NR11.6 and "Proof gates and scope of the conditional conclusions".
- OrdinaryAutomorphicFormsAndModularityLifting: §2.11.
- InverseGaloisAndArithmeticFundamentalGroups: IG.2.4–IG.2.7. IG.2.7's second Check covers smooth rational varieties.
- EndoscopicTransferAndUnitaryTraceComparison: §§8.3, 11.1, 13.2.
- AutomorphicLFunctionsAndLocalFactors: AL.2 (both named parts), AL.3 (strong multiplicity one for isobaric sums), AL.4 (both named parts).
- ModularityAndLanglandsExtensions: §§1.9, 1.11, 1.13, 3.26 and the automorphic-induction part.
- GL2AutomorphicRepresentationsAndTransfer: R17.5.1, R17.5.4–R17.5.7, R17.5.11.
- AutomorphicGaloisRepresentationsPartII: AG2.2 and AG2.5.
- AutomorphicFormsOnReductiveGroups: §§2.3–2.7.
- EllipticCurveModularity: R29.6.
- EllipticCurveModularityPartIIGL2TypeAbelianVarieties: GT.3.
- ShimuraVarieties: §§1.2 and 5.0.
- AlgebraicModuliForArithmeticGeometry: §§3.5 and 5.2.
- RelativeJacobiansAndIntegralCurveModels: §§0.1–0.3, 2.3 and 2.4 (see R03).
- On main: AlgebraicCurves Layer 10, PolynomialGaloisGroups Layers 0 and 4, EllipticCurves Layers 3 and 4.

The citation service lists no unresolved citations.

### Ownership and duplication (by object)

I searched main, the 352 open roadmap heads (roadmaps grep) and the board's packages for each object below. The only existing owner found is the one in R01.

| Object | Owner found |
| --- | --- |
| Algebraization of polarized degeneration data ("Mumford's construction") | ShimuraCompactifications C4.5 (R01) |
| Genus-two smoothness test in ℙ(1,3,1) | none |
| Odd-theta moduli and its Torelli open | none |
| Coupled-period 2C seed | none |
| Genus-two Torelli density | none; only A4.14's formal statement, for smooth curves |

This roadmap is therefore the owner of the explicit local seeds, the smoothness test, P(ρ̄) and the type dictionary.

## Not verifiable

- FC90, KIS99 and THORNE17 are paywalled and recorded as uncertified, so they were not read.
  - The identification of the Weil pairing with the period formula used in §4.7 rests on the standard Mumford–Raynaud theory (FC90, not read). I checked only that the formula is well defined, bilinear and alternating.
- I did not compute Frobenius classes that need the degree-40 and degree-27 resolvents. These are:
  - the 6G/6H split of the 𝔽₂ census (32/16 ordinary, 48 non-ordinary 6G);
  - the classes of C₂, C₃, Y and the Lemma 9.2.17 curve.
  These rest on the source.
- Conductors (249, 975, 1947, 797, 1982, 7165) were not recomputed.
- BCGP25 Table 6.4.4: the extraction loses the column positions of the failure marks, as in round 1.
- The published IHÉS numbering of BCGP21 §10.2 was not read. The README uses arXiv v3 numbering, which I verified.

## Source issues

- **Misprint** in BCGP25 at proof of Lemma 9.3.7, p. 203: the source says that, after twisting to a trivial étale module, one takes the product of the trace −1 and trace 2 curves; it should be the trace 1 and trace −2 product (the former has étale Frobenius −1), matching Remark 9.3.8's quartic; affects nothing.
- **Misprint** in BCGP25 at §9.2 after Definition 9.2.1, p. 192: the source says rationality of P(ρ) is BCGP21 Theorem 10.2.3 (and p. 4 cites Theorem 10.2.1); it should be BCGP21 Lemma 10.2.4 in arXiv v3, Proposition 10.2.3 being the untwisted statement; affects nothing.

The round-1 source issues that touch the sample (Lemma 9.2.13, the proof of Lemma 9.2.14, §9.2.16, the orders in the proof of Lemma 9.3.7, the table of Lemma 10.3.6, and the Zarhin step in the proof of Theorem 8.3.2) were re-checked and stand. They are not repeated here.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0488884", "job": "REV-PKG-AbelianSurfacesModularity~2", "model": "opus", "worker": "fable-rev91"} -->
