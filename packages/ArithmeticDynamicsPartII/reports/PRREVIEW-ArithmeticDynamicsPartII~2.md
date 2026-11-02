# Review of ArithmeticDynamicsPartII (pull request #1686 at 16dd84b)

**Verdict:** accepted

Incremental re-review of the 78 lines changed since 6170dac (README §3.0 three new targets, the §3.7 `*Needs:*` repointing, the §5.4 Check, the scope and Mathlib-contract sentences, the CKSZ14 reference line; two new Lean theorems and the module docstring). The two previous findings are repaired. The two findings below are P3 and do not block.

## R01 (P3) — Cite the primary sources behind CKSZ14 Lemmas 2.1 and 2.3

**Location:** `TauCetiRoadmap/ArithmeticDynamicsPartII/README.md:320` “(CKSZ14, Lemma 2.1, pp. 581–582 …)”, `:334` “(CKSZ14, Lemma 2.3, p. 582 …)”, and the reference line `:1084`.

**Claim:** Both new general targets are located only in CKSZ14, which states each lemma without proof as a quotation: Lemma 2.1 is D’Andrea–Krick–Sombra’s arithmetic Nullstellensatz (CKSZ14 line 133 names “[11, Theorem 2]”), Lemma 2.3 is the Beukers–Smyth theorem (CKSZ14 line 165 names “[3, Section 4.1]”). An implementer of either target needs the primary statement, whose hypotheses and constants differ in form from the quotation.

**Witness:** I read both primary texts legally. DKS, arXiv:1103.4561, Theorem 0.2 (published as Theorem 2): for V=𝔸ⁿ the bound is h(α) ≤ 2d₀D(3h₀/(2d₀) + Σ_ℓ h/d_ℓ + c(n,n,s)), with D the product of the top min(s,n+1) degrees and d₀=max(1,deg G); bounding D ≤ Dⁿ⁺¹ and DΣ_ℓ h/d_ℓ ≤ (n+1)Dⁿh gives exactly C(n,N)(Dⁿ⁺¹h + dDⁿH + dDⁿ⁺¹). Beukers–Smyth, §4.1 Theorem (preprint p. 7): at most 22V(f) cyclotomic points, V(f) the Newton-polytope area, or infinitely many with a factor xⁱyʲ−ω, i,j integers not both zero; their Remark 3 (preprint p. 10) gives V(f) ≤ d²/2, hence 11d², for total degree d. The published numbering of DKS (Annals 177, 2013) is Theorem 2.

**Repair:** Add the two works to `## References` with locators (DKS Theorem 2, arXiv Theorem 0.2, specialised to V=𝔸ⁿ; Beukers–Smyth §4.1 Theorem and the Newton-polytope remark deriving 11d²), cite them in the two target paragraphs alongside CKSZ14, and record them in `sources.toml` (the DKS text is on arXiv; the Beukers–Smyth text is on Smyth’s Edinburgh author page under `preprints/beukers_smyth.pdf`). No statement changes.

## R02 (P3) — The extension clause covers zero F_i but not nonzero constant F_i

**Location:** `TauCetiRoadmap/ArithmeticDynamicsPartII/README.md:320` “Discard zero Fᵢ and take a maximum of the constants … This extends the nonzero-polynomial formulation without changing the bound.”

**Claim:** The primary theorem (DKS Theorem 0.2, line 166: “d₁ ≥ ⋯ ≥ d_s ≥ 1”) assumes every F_i nonconstant, so the roadmap’s “degree at most D” statement also needs the case of a nonzero constant F_i, which the paragraph’s own first Check (F₁=2, G=1) exercises. The case is trivial but the route does not say so.

**Witness:** With F₁=c a nonzero integer constant, b=|c|, r=1, Q₁=sign(c)·G and the other Q_i=0 give ΣF_iQ_i=bG, and log b ≤ H ≤ C·dDⁿH once C ≥ 1/27; the F₁=2, G=1 Check is this case with G=1.

**Repair:** Add one clause: “a nonzero constant Fᵢ=c gives b=|c|, r=1, Qᵢ=sign(c)·G directly, within the bound since log|c| ≤ H”. No Lean change.

## Previous findings

- R01 — repaired: README §5.4 Check now reads “every nonparabolic companion order (trace a≠±2) is at most 6: the orders at traces 0,1,4 are 4,6,3” and keeps the order-10 matrix at trace 3=−2 as the negative control; I recomputed all five orders (4,6,5,10,3) and the interval 5/48 ≤ 1 ≤ 48√5.
- R02 — repaired: §3.0 now owns “Height-controlled arithmetic Nullstellensatz” and “Complex plane-curve torsion bound” as separately located targets with Checks and `*Needs:*`, the elimination target consumes them, and `Suggested.lean` states both (`arithmetic_nullstellensatz`, `complex_torsion_bound`). Both statements were checked against the primary sources (R01 above asks only that those be cited).

## Verified sound

**Gate and elaboration.** I reran the gate at 16dd84b: every check 0, `OK`. `lake env lean` on `TauCetiRoadmap/ArithmeticDynamicsPartII/Suggested.lean` finished in 8 s with exactly 23 `declaration uses sorry` warnings and nothing else; the file has 40 declarations (17 definitions with real bodies, 23 admitted theorems), one `import Mathlib`, no `set_option`, no sorry’d data, no admitted example. No file outside the folder changed (`git diff --stat origin/main...HEAD` excluding the folder is empty). The dependency check returned

```text
depcheck: 204 roadmaps, 1544 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. No supplier gap is declared and none is needed by the change.

**Signatures.** A scratch copy with `#check @arithmetic_nullstellensatz` and `#check @complex_torsion_bound` printed the elaborated types; they agree with the README statements: C depends only on (n,N) and is quantified before D,d,H,h,F,G; D,d ≥ 3, H,h ≥ 0; total degrees via `MvPolynomial.totalDegree`; coefficient bounds |coeff| ≤ exp H, exp h; vanishing on all complex common zeros via `eval₂ (Int.castRingHom ℂ)`; b,r positive naturals; the identity Σ F_i Q_i = C b · G^r in ℤ[X]; the bound C(Dⁿ⁺¹h + dDⁿH + dDⁿ⁺¹). The torsion bound takes f ≠ 0 in `MvPolynomial (Fin 2) ℂ`, S by multiplicative `IsOfFinOrder` on both coordinates and `eval z f = 0`, the alternative “finite with ncard ≤ 11·totalDegree²” or “infinite with a divisor X₀ⁱ − C ρ · X₁ʲ or X₀ⁱX₁ʲ − C ρ, i+j > 0, ρ of finite order”. No section binder is involved (both are closed statements). The remaining 38 declarations are untouched since 6170dac; the worker’s signatures file shows no lost binder.

**Padding probe.** On the scratch copy, `simp` on each new theorem and `infer_instance` on the torsion bound all fail (unsolved goals / no instance). No pinned declaration states either result: `Mathlib/RingTheory/Nullstellensatz.lean:171` is the qualitative radical identity over a field; no file in the pinned Mathlib or Tau Ceti mentions cyclotomic points on curves, torsion-coset bounds or an effective Nullstellensatz. Neither theorem is padding.

**Sources for the changed passages.** CKSZ14 line 127 (logarithmic height of a nonzero polynomial), lines 135–149 (Lemma 2.1: N+1 ≥ 2 polynomials, degree ≤ D ≥ 3, heights H, h, G of degree ≤ d ≥ 3 vanishing on the common zero set, positive b, r, the displayed bound with C(n,N)), lines 166–173 (Lemma 2.3: either N(V) ≤ 11d² or infinitely many torsion points and a factor Xⁱ−ρYʲ or XⁱYʲ−ρ, i,j ≥ 0 not both zero), lines 389–396 (Lemma 2.3 forces a repeated point among K = 11d²+1 torsion solutions), lines 424–444 (Lemma 2.1 gives the integer identity (4.6) and the height bound (4.7)), line 286 (§4 heading). Pages: Lemma 2.1 pp. 581–582, Lemma 2.3 p. 582, §4 pp. 585–591. Primary texts (fetched legally this round): DKS arXiv:1103.4561 lines 164–188 (Theorem 0.2 with its bound; the specialisation to 𝔸ⁿ is in R01) and Beukers–Smyth preprint lines 7–10, 306–319, 449–457 (22V(f), the binomial factor, V(f) ≤ d²/2). The Laurent-binomial factor xⁱyʲ−ω with integer exponents becomes, after multiplying by a monomial, one of the README’s two polynomial forms in every sign case (i,j ≥ 0: form 2; i > 0 > j or i < 0 < j: form 1; both negative: form 2 with ρ = ω⁻¹). EFLMT24 and the C24/BGS16/CZ13 locators of the unchanged passages were certified in the r1 report and are not re-read.

**Pinned declarations opened for the new Mathlib contract.** `MvPolynomial.totalDegree` at `Mathlib/Algebra/MvPolynomial/Degrees.lean:432` (sup over the support; the zero polynomial gets 0, as the README says); `MvPolynomial.eval₂` at `Mathlib/Algebra/MvPolynomial/Eval.lean:69` and `MvPolynomial.eval` at `:256`; `IsOfFinOrder` at `Mathlib/GroupTheory/OrderOfElement.lean:64` and `isOfFinOrder_iff_pow_eq_one` at `:74` (a positive power equals one, so 0 ∈ ℂ is excluded, as the README says); `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical` at `Mathlib/RingTheory/Nullstellensatz.lean:171`; `quadraticChar` at `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:119`. All lines match.

**Ownership.** `roadmaps grep` over the 439 open heads and main for “arithmetic Nullstellensatz”, “effective Nullstellensatz”, “Beukers–Smyth”, “cyclotomic points”, “torsion coset”, “Ihara–Serre–Tate”, “Manin–Mumford” and “D’Andrea” found owners only for abelian-variety Manin–Mumford (HeightsRationalPointsAndObstructions §§5.6–5.7, AbelianSchemesAndArithmeticModuliPartII), not for tori. On main, SubspaceTheorem §8.8 owns a different object (the Corvaja–Zannier local Nullstellensatz inequality) and its scope list at line 259 names Laurent’s theorem for tori as left to DiophantineApproximationAndTranscendence §2.4, which states unit-equation and recurrence targets, not a torsion-point bound for plane curves. ArithmeticDynamics §0.15 (open head) owns the binary-form resultant certificate, which the new scope sentence at README line 11 correctly contrasts with the multivariable, height-controlled statement. This roadmap is therefore the owner of both new targets; no other `Suggested.lean` declares the two new fully qualified names. The board packages list (five packages) contains no related roadmap.

### Headline coverage

Unchanged from the r1 report (21 native-carrier headlines present), plus the two new supporting statements `arithmetic_nullstellensatz` (line 89) and `complex_torsion_bound` (line 108) in Layer 3. The module docstring now says they are stated on native multivariate polynomials; the not-statable items (level stack, rigidified compactification, coarse degree) are unchanged.

### Adversarial values

New rows for every changed statement; rows for statements the diff leaves untouched are carried from the r1 report (cited as “r1”) with their values.

| Statement | Instances tried and computed values on both sides | Result / change |
|---|---|---|
| §3.0 Nullstellensatz, bound shape versus DKS | DKS Theorem 0.2 on 𝔸ⁿ: deg V=1, ĥ(V)=0, r=n; h(α) ≤ 3Dh₀ + 2d₀DΣ_ℓ h/d_ℓ + 2c d₀D with D ≤ Dmaxⁿ⁺¹, DΣ_ℓ h/d_ℓ ≤ (n+1)Dmaxⁿh, d₀ ≤ d. So C(n,N)=max(3, 2(n+1), 2c(n,n,N)) with c ≤ (6n+17)log(n+4)+3(n+1)log max(1,N−n). | Consistent with CKSZ14’s form and the Lean bound. |
| §3.0 Nullstellensatz, sign and exponent | DKS gives α ∈ ℤ∖{0}, μ ∈ ℕ: b=|α| after negating the Q_i if α<0; if μ=0 then α=ΣQ_iF_i and αG=Σ(Q_iG)F_i gives r=1 with the same b. | Positive b, r always available. |
| §3.0 Nullstellensatz, Check 1 | F₁=2, G=1: Σ=2·1=2=2·1¹; |2| ≤ exp(log 2), |1| ≤ exp 0; bound C(1,1)(9·0+9 log 2+27)=C(9 log 2+27). Mod 2: F₁=0, G=1, so without b the reduction claim fails. | Consistent. |
| §3.0 Nullstellensatz, Check 2 | F₁=X², G=X: X²·1=1·X², log 1=0 ≤ 27C; r=1 would need X² ∣ bX, false for every b>0. | Consistent. |
| §3.0 Nullstellensatz, Check 3 and degenerate inputs | F₁=0, G=0: 0=1·0¹; F₁=0, G=1: hypothesis fails at x=0 (0=0, 1≠0); F₁=X²+1, G=1: fails at i. n=0 or N=0: all F_i zero forces G=0 (one point / all points), identity 0=b·0ʳ; nonzero constant F₁=c: b=|c|, r=1, Q₁=sign(c)G. | True in every degenerate case; the constant case is R02. |
| §3.0 torsion bound, 11d² versus Beukers–Smyth | Total degree d ⟹ Newton polygon inside the triangle (0,0),(d,0),(0,d) of area d²/2, so 22V(f) ≤ 11d²; BS Remark 3 gives the same count by Bézout (3·d²+4·2d²=11d²). | Consistent; the quotation is a correct consequence. |
| §3.0 torsion bound, exceptional factor | BS factor xⁱyʲ−ω, (i,j)∈ℤ²∖0: (i,j)=(1,−1) ↦ X−ωY; (−1,−1) ↦ XY−ω⁻¹; (1,0) ↦ X−ω. Converse: Xⁱ−ρYʲ with i>0 has, for each root of unity y, i roots x of xⁱ=ρyʲ, all of finite order; with i=0, j>0, every x works once yʲ=ρ⁻¹. | Both polynomial forms and the converse hold. |
| §3.0 torsion bound, Checks | X+Y−1: |x|=|1−x|=1 ⟹ Re x=1/2 ⟹ x=ζ₆^{±1}, y=ζ₆^{∓1}, #S=2 ≤ 11. X−Y: (ζ,ζ) infinite, i=j=1, ρ=1. XY−1: (ζ,ζ⁻¹). X−2Y: |x|=2|y| impossible on unit circles, S=∅. f=1: S=∅, 0 ≤ 0. f=0 excluded (S everything). (X+Y−1)²: same 2 points ≤ 44. X−1: (1,ζ), i=1, j=0. | All six Checks recomputed; consistent. |
| §3.0 torsion bound, Lean carrier | `IsOfFinOrder (0:ℂ)` is false (0ⁿ≠1), so zeros with a vanishing coordinate are outside S, matching BS’s torus; `totalDegree 0 = 0` is unreachable since f ≠ 0; S.ncard of an infinite set is 0 but that branch requires `S.Finite`. | No junk value enters the statement. |
| §3.0 coefficient-uniform elimination | CKSZ14 §4: K=11d²+1 torsion solutions with orders ≤ T force a repeated point by Lemma 2.3 (line 389); Lemma 2.1 on (45d²+3d+6)/2 variables gives log A = O(T^{(45d²+3d+8)/2}) (line 440); the product over O(T^{2K}) tuples has O(T^{A_d}) prime factors. For d=1 the universal system is linear and the README treats it separately. | Consistent with the Needs line; exponent absorption as in r1. |
| §3.7 `*Needs:*` repointing | The line now names the §3.0 elimination target; T=z^{δ/(2A_d)} gives C_dT^{A_d}=C_dz^{δ/2} ≤ z^δ for z ≥ C_d^{2/δ} (C=4, δ=1, z=16: 16 ≤ 16). | Consistent. |
| §5.4 companion orders at p=5 | Traces 0,1,2,3,4 over 𝔽₅: orders 4, 6, 5, 10, 3; nonparabolic maximum 6; A=[[0,1],[4,3]] has A⁵=−I, A¹⁰=I. M₁(5)=2 (maximal divisors ≤1 of 4 and of 6), 5/48 ≤ 1 ≤ 48√5. | R01 of r1 repaired. |
| Scope sentence, §0.15 contrast | ArithmeticDynamics §0.15: binary forms F₀,F₁ of degree d, G_{k,0}F₀+G_{k,1}F₁=Res·X_k^{2d−1}; one resultant, two forms, no height bound. The new target: N forms in n variables with log b bounded. | Distinct objects; ownership sentence accurate. |
| Mathlib contract paragraph | Lines 432, 69, 256, 64, 74, 171 opened at the pin (above); zero-polynomial degree 0 and the exclusion of 0 from `IsOfFinOrder` verified from the definitions. | Consistent. |
| Conventions; coefficient equation and twist (r1) | (1,1,1): 3=3; (1,1,2): 6=6; twists 27=27, 54=54; coefficient 3 at (3,3,3): 27≠81. | Carried; untouched. |
| §0.1–§0.4 moves, graph, components, small primes (r1) | p=2: 4 vertices, 3 edges; move-orbit and component counts agree at p=2,3; M* and root-orbit counts (4,4),(8,8),(40,40),(28,28),(208,208) at p=2,3,5,7,13. | Carried; untouched. |
| §1.1–§1.4 Penner weights and divisibility (r1) | Root weights (1/3,1/3,1/3); extended weights (0,3,3) at (0,1,2) over 𝔽₅; 0 violations at p=5,7,13; 2∣4, 5∣40, 7∣28, 13∣208; at p=3, 8 mod 3=2. | Carried; untouched. |
| §2.1–§2.4 conics, counts, rotation headline (r1) | Slice sizes 8,6,10,10,6 at p=5; counts 0,40,28,88,208 = p(p∓3); enumerated orbit counts equal the rational formula at p=3,…,31; at p=2 the formula gives −3/4. | Carried; untouched. |
| §3.0 Kummer cover, boundary, gcd (r1) | Fibres 1+χ(x); sums 0 and −1 against bounds 0 and √5; x+y=1 in μ₄² has 3 points against 38.4; x=y has 4 and is excluded. | Carried; untouched. |
| §3.0a symmetric root (r1) | V-root and Γ-root sizes 40 and 208 at p=5, 13; 6 permutations, 1 permuted value. | Carried; untouched. |
| §3.5 opening game (r1) | Cube at (2,2,2): 8=8 while Markoff needs 12=8; S=∅ gives 0=0; S={0} is the excluded stable set. | Carried; untouched. |
| §3.6 giant orbit, §3.7 sparse primes (r1) | Root complements of size 0 at p=5,…,31, ≤ √p; disconnected-prime set empty up to 31. | Carried; the proof-route input is now owned. |
| §4.3 prime strong approximation (r1) | p=3: coefficient-one affine size 1 with lifts 0 and (3,3,3); coefficient-three size 9 with 8 nonzero lifts plus 0. | Carried; untouched. |
| §5.3 signed complement and cage–endgame (r1) | Orbit 40, complement 0, 20∣0; sign block 4, complement 36, 36 mod 20=16; (0,1,8) outside the cage at p=13 but in the 208-point orbit. | Carried; untouched. |
| §5.10 divisor antichain bounds (r1) | C·2^Ω ≤ τ·binom(Ω,⌊Ω/2⌋): 1≤1, 4≤6, 8≤12, 16≤18, 24≤24; M₆(12) count 2=C₁(12). | Carried; untouched. |
| §5.13–§5.14 interval and threshold (r1) | [4,10],[6,18] ⊂ [·,18]; 108M³ ≤ 864C³; 1492992² = 2229025112064; p⁵ > 8·384¹⁶. | Carried; untouched. |
| §6.2 trace order, §6.3 orbit congruences (r1) | 𝔽₅: trace 2 order 5, trace −2 order 10; (q,t)=(5,1): divisor 3 ∣ 36; (7,3): 2 ∣ 64; (11,4): 5 ∣ 40, 60; 𝔽₄ traces exhausted. | Carried; untouched. |
| §6.5 oriented divisibility (r1) | Oriented nonzero orbit sizes 4,40,28,88,208 ≡ 0 mod p; empty locus at p=3. | Carried; untouched. |
| §7.1 primitive squarefree locus (r1) | n=65: 40·208=8320 primitive, 41·209=8569 total; (40,40,40) mixed. | Carried; untouched. |
| §7.3–§7.4 MP condition and block primitivity (r1) | p=7: 64 < 8192; p=11: 25 < 12288; block-identification closures give 10,7,22,52 classes. | Carried; untouched. |
| §7.6 sign lifting (r1) | S₄ composition factors C₂,C₂,C₃,C₂; 394240=4·40·28·88 primitive triples reached modulo 770. | Carried; untouched. |
| §7.7–§7.8 squarefree headlines (r1) | Root orbit modulo 65 has 8320 points; image 8321 of 8569. | Carried; untouched. |

The 23 admitted theorems of `Suggested.lean` and the 17 definitions were compared with the README once more at the changed lines only; the other 38 declarations are byte-identical to 6170dac.

## Not verifiable

- **M25** and **DM96** remain settled uncertified; no changed passage cites them, so nothing new depends on their text.
- The published Annals version of DKS was not opened; its “Theorem 2” is identified with arXiv Theorem 0.2 through CKSZ14’s displayed bound, which matches the arXiv statement specialised to 𝔸ⁿ.
- The Beukers–Smyth text read is the author-page preprint; the published pages 67–85 (A K Peters, 2002) were not compared, so the locator in R01 is given as the preprint’s section and page.

## Source issues

- **Gap** in CKSZ14 at Lemma 2.1, printed p. 581: the source quotes the arithmetic Nullstellensatz for integer polynomials of degree at most D, whereas the cited DKS Theorem 2 assumes every Fᵢ nonconstant; the zero and nonzero-constant cases are trivial additions; affects nothing.
- Earlier rounds’ entries (C24, EFLMT24, MP18, BGS16) are in the r1 report and are not repeated.
