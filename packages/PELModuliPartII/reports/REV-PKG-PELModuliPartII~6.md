<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6896956502 -->
Review (claude) of d35cdf6

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) RSZ21 locator names §3.3 for material that is in §3.4

   **Location.** `packages/PELModuliPartII/README.md:1265` (§6.6): "RSZ21, §3.3, (3.15)–(3.16) and
   Remark 3.7, pp. 11–12"; line 1290 (§6.7): "RSZ21, §§3.3, 4.1, pp. 14–19";
   `packages/PELModuliPartII/sources.toml:137`: `locator = "§3.3, (3.15)–(3.16), Remark 3.7; …"`.

   **Claim.** The CM moduli M₀^a, its decomposition by classes ξ and the nonemptiness remark are in
   RSZ21 §3.3.

   **Witness.** RSZ21 line 524 is the heading of §3.3 (moduli by isogeny classes, p. 9); line 621 is
   the heading of §3.4 (p. 11). (3.15), (3.16) and Remark 3.7 are lines 680, 687, 688 (p. 12), inside
   §3.4; pp. 14–16 are §3.4 too.

   **Repair.** In README §6.6 write "RSZ21, §3.4, (3.15)–(3.16) and Remark 3.7, pp. 11–12"; in §6.7
   write "RSZ21, §§3.4, 4.1, pp. 14–19"; in the RSZ21 manifest entry replace the leading "§3.3" of
   `locator` by "§3.4". Tested: §3.4 runs from line 621 (p. 11) to line 939 (p. 17, where §4.1 starts
   at line 940), so it contains lines 680–688 and pp. 14–16; the page numbers already written are
   right. Pattern search: I checked the other section-number locators against the headings of the
   cached texts (RSZ21 §§4.1, 5.1, 5.2; LZ22 §§2.1, 2.2, 2.5–2.7, 2.11, 10.1, 10.2, 11.1–11.4, 11.6,
   13.1, 13.4, 14.1–14.2; LL22 §§2.1, 2.8, 4.5; LL21 §5; Wu16 §3.4; Cho18 §3.9; RZ17 §8; HLSY23
   §§2.1–2.3, 10.2; Mih19 §§10, 11, 11.2); no other slip.

2. **F02** (P3) three code spans are cut in the middle of a formula

   **Location.** `packages/PELModuliPartII/README.md:1265` (§6.6): "char(ι₀(a)|Lie
   `` `A₀)=∏_{φ∈Φ}(T−φ(a)` ``)"; line 1313 (§6.8) and line 1336 (Layer 6 Examples):
   "`` `Σ_{φ∈Φ_v}(n` `` r₀,φ−r_φ)".

   **Claim.** House style: a formula is one inline code span.

   **Witness.** In each case the span opens or closes inside a parenthesis, so the formula renders half
   in code and half in prose; in the last two the product n·r₀,φ is left as "n r₀,φ" across the break.
   A scan of all code spans for unbalanced brackets finds exactly lines 1313 and 1336; line 1265 is
   mis-nested.

   **Repair.** Line 1265: "`` `char(ι₀(a)|Lie A₀)=∏_{φ∈Φ}(T−φ(a))` `` for all a∈O_F". Lines 1313 and
   1336: "`` `Σ_{φ∈Φ_v}(n·r₀,φ−r_φ)` ``". Tested on the example of line 1336 (n=3, one φ, r_φ=2): the
   repaired formula gives 3·1−2=1 with r₀,φ=1 and 3·0−2=−2 with r₀,φ=0, the two values the example
   states.

Two P3 findings, no P1 or P2. All three findings of round 5 are repaired. The mathematics, the
supplier citations, the dependency direction and the Lean file pass; what remains is one wrong
section number in a source locator (README twice, manifest once) and three broken code spans.

## Verified sound

### Round-5 findings

| Finding | Repaired passage | Evidence | Status |
| --- | --- | --- | --- |
| F01, §2.3 locator named remarks as equations | README line 653: "(LZ22, §10.1, p. 64; §10.2, equation (10.2.0.1) and the orthogonal decomposition following it, pp. 64–65.)" | LZ22 lines 2817–2819 (p. 64) W_n split; line 2851 (p. 64) label (10.2.0.1); lines 2854–2857 (p. 65) norm-ϖ vector and decomposition; page 65 starts at line 2853 | repaired |
| F02, two forward prerequisites | §7.6 "Localized smoothness and representability" now follows §7.5 "Unitary local-model comparison"; §8.4 "Almost self-dual local equations" follows §8.3 "Almost self-dual generic comparison"; §8.4: "the uniformization datum (V′,j,Λ′_p) of §8.3" | mechanical scan of the 75 *Needs:* lines: 0 forward edges, 0 unknown ids; every moved reference read in context (Summary, Conventions, four supplier bullets, §0.4 Check, §§7.3–7.10, 8.1, 8.4–8.7, 9.6, 9.9, three Dependencies lists, References, Lean docstring) | repaired |
| F03, reversed negative control | §3.7: "reading the dimension of the reduced locus as the relative dimension would give 0 instead of 1." | n=2: n−1=1, n/2−1=0; n=4: 3 and 1 | repaired |

No finding was marked not actionable; nothing is re-raised. The repair report's decision not to add
a former-numbering table stands: `roadmaps grep PELModuliPartII` finds no citation on main or at any
open head, so no citation breaks.

Changed passages, adversarial pass: Layer 7 edges 7.3→7.2; 7.4→7.2; 7.5→7.2; 7.6→7.1, 7.5;
7.7→7.3, 7.5, 7.6; 7.8→7.4, 7.5; 7.9→7.5; 7.10→7.4, 7.8, 7.9. Layer 8 edges into Layer 7:
{7.2, 7.5, 7.6}, equal to its Dependencies list; Layer 9 edges into Layer 7: {7.1, 7.3, 7.4, 7.9},
equal to its list. The manifest's `cited_for` lists were compared mechanically with the sections
that name each source: 17 of 17 sources agree exactly.

### Principles, shape, policy

Read all 75 targets. 75 sections, 75 *Needs:* lines, ten layers each ending with Examples and
Dependencies. Every block with an API has at least three Checks (the 17 sections with two Checks are
theorems without an API block). No LaTeX delimiters, no process words, pull-request numbers, machine
paths or HTML anchors; no `lemma`; no algorithm. Layers are named by their mathematics, and the
order (local foundations, four local families, global data, global models, uniformization) is forced
by the *Needs:* edges just listed. Local hypotheses p>2 are domains of the cited theorems, not a
good-primes shortcut: §6.6 covers every prime and §§7.6, 7.7, 8.4 keep the bad primes through
gap:bad-prime-projectivity.

### Sampled source locators (15 targets)

| Target | Locator, lines opened | Result |
| --- | --- | --- |
| 0.1 | Mih19 Part III line 1812 (p. 40); Lemma 11.2 line 1860 (p. 41); Def. 11.6 line 1912 (p. 42); Defs 11.7–11.9 lines 1920–1940, Remark 11.11 line 1945 (p. 43); Prop. 12.11 line 2114 (p. 47) | supported; π nilpotent in R as stated at line 1934 |
| 0.2 | RZ96 Prop. 2.9 line 1961 (printed 52); Thm 2.16 line 2026 (54); Def. 3.18 line 2691 (77); Def. 3.21 line 2801 (81–82); Thm 3.25 line 3008 (88); LZ22 line 415 (N₁≅Spf O_F̆) | supported; printed pages read from the running heads |
| 0.3 | Mih19 Def. 2.2 line 270 (p. 7), Def. 2.8 line 363 (p. 9); LL22 Def. 2.1 line 405 (p. 9) | supported |
| 0.7 | Zhang21 (3.1)–(3.6) lines 664–696; LZ22 §2.1 lines 392–399 (p. 10) | supported: (n−1,1) at Zhang21 line 659 against (1,n−1) at LZ22 line 396; published pages below |
| 1.4 | LZ22 (2.11.0.1) lines 583–584 (p. 15); Zhang21 (3.2) lines 684–686 | supported: LZ22 adds the conjugate source, Zhang21 the unconjugated one |
| 1.6 | Zhang21 (3.3)–(3.6) lines 688–696 | supported, including "half the formal dimension" (line 695) |
| 2.5 | LZ22 Remark 10.2.1 lines 2871–2884 (p. 65); Conj. 10.4.1 line 2932 (p. 67); LRZ26 Thm 14.6.2 lines 2622–2626 | supported: generic degree q+1 and generic isomorphism only; LRZ26 gives finite flat π₁, proper π₂ |
| 3.7 | LL22 Lemma 2.4 lines 437–443, footnote 8 line 450 (p. 10); Prop. 2.28 lines 1111–1122 (pp. 22–23); Remark 2.29 line 1127; Wu16 §3.4 line 602 (p. 12), (3.21)–(3.26) lines 653–670 (p. 13), Thms 5.17–5.18 lines 1584, 1600 (p. 30) | supported: two components; each V_Λ∩component connected smooth projective of dimension t(Λ)/2−1 |
| 4.4 | LL22 Prop. 2.62 line 2045 (p. 40), Lemma 2.63 line 2134 (p. 42), Remark 2.68 line 2214 (p. 44) | supported; the remark confirms the ramified case is open |
| 5.3 | HLSY23 Def. 2.2 lines 437–447 (p. 10); Howard19 lines 240–247 (p. 6) | supported; the definition sits wholly on p. 10 (the cited range pp. 10–11 contains it); the missing polarization clause in (2) is as the README says |
| 5.7 | HLSY23 lines 448–450 (p. 10); Howard19 Prop. 2.2 lines 245–248 (p. 6); RSZ21 Thm 6.7 line 1716 (p. 32), Remark 6.8 line 1741 (p. 33) | supported: flat, regular of dimension n |
| 5.9 | HLSY23 (2.5)–(2.6) lines 482–486 (p. 11), normalization lines 489–492 (p. 12) | supported: e a generator of the τ-fixed points, (e,e)_Y a unit |
| 7.4 | RSZ21 Def. 6.10 lines 1755–1757, (6.6)–(6.7) lines 1764–1774 (p. 33), (6.8)–(6.10) lines 1783–1801, Lemma 6.11 line 1807 (p. 34); LZ22 §11.6 line 3350 (p. 77) | supported: rank formula, two annihilator equations, independence of π |
| 9.2 | RZ96 Prop. 2.34 line 2349 (64), Prop. 2.37 lines 2409–2420 (66–67), Thm 6.23 line 8821 (289), Thm 6.30 line 8965 (293); LZ22 §§2.5–2.7 lines 451–471 (p. 12) | supported: 2.37 gives a formal algebraic space for a torsion-free separated discrete group |
| 9.7 | LZ22 (13.1.0.1) lines 3514–3527 (p. 80), footnote 5 line 3560; Zhang21 (7.3)–(7.6) lines 1817–1835; Cho18 Thm 4.3 line 1825 (p. 42) | supported: p>2 at line 3516; N′ with its three factors |

Further locators opened while checking: RSZ21 Def. 3.6 and lines 650–700 (R01), Thms 5.4, 5.7
(pp. 26–27), (5.5)–(5.7) (pp. 23–24), (4.2) (p. 17); RZ96 Def. 6.9 (279), Lemma 6.28 (292),
Cor. 6.29 (293); LL21 Lemmas 5.2, 5.5, Notation 5.6 (pp. 26–28); RZ17 (8.1)–(8.2) (p. 28), Lemma 8.6
(p. 30); LL22 Def. 1.1 (p. 3), Assumption 1.3 (p. 4), Notation 4.19 (p. 57); LZ22 §13.4 line 3593.

### Adversarial table (sampled targets, headlines, findings)

Rows of the round-5 table that carry computed values were relied on for unchanged text; the rows
below were computed this round.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 strict modules, duals | O=ℤ_p, μ_{p^∞}; K=ℚ_p(√p) Lubin–Tate twisted by conjugation; height 1 dim 1; height 2 dim 1 | P rank 1, P/Q rank 1; 2√p has valuation 1/2<1 so √p≠−√p in O_K/(p) for p odd (for p=2 valuation 3/2≥1, equal: p odd is used); dual dimension 1−1=0 étale; 2−1=1 biformal | pass |
| 0.2 representability | n=1, d=[K:ℚ_p]; d=2 totally ramified | unstructured parameters 1·(2d−1), structured 0; wrong dimension d gives d·(2d−d)=d²; Cartier dual dimension 4−1=3 against relative dual 2−1=1 | pass |
| 0.3 principal hermitian modules | d=2, n=3; n=1 both signatures | relative height 6, absolute 12, dimension 3 = degree of (T−a)^r(T−ā)^s; Lie character a against ā | pass |
| 0.4 Check on μ-ordinary slopes | (r,s)=(1,0), (1,1), (1,2) | averages of (1^r,0^s),(1^s,0^r): (1/2); (1,0); (1,1/2,0); supersingular iff min(r,s)=0 iff rs=0 | pass |
| 0.7 conjugation | (r,s)→(s,r) twice | (1,2)→(2,1)→(1,2) | pass |
| 1.2 smoothness | n=1,2,3 | relative dimension 0,1,2 = rs at (1,n−1) | pass |
| 1.4 rank raising | n=1,2 with ℰ̄ and with ℰ | (1,0)+(0,1)=(1,1), (1,1)+(0,1)=(1,2); with ℰ: (2,0), (2,1); height 2n+2 | pass |
| 1.6 graph | n=2,3,4 | relative (0 in 1), (1 in 3), (2 in 5); with the DVR (1,2), (2,4), (3,6): half only in the second count | pass |
| 2.2 regular crossing | uv=ϖ; uv=t² | dimension 2, maximal ideal (u,v): regular; (u,v,t) needs 3 generators in dimension 2: not regular | pass |
| 2.5 generic degree | q=3 | isotropic points of a nondegenerate hermitian form on ℙ¹(𝔽₉): q+1=4; deg α=9; 27²=729≠81 | pass |
| 3.4 base ring | n=2 | O_L̆[[t]]/(ϖ)=k[u]/(u²)[[t]] nonreduced; over O_L̆ fibre k[[t]] | pass |
| 3.7 components | n=2; n=4, t=4 and t=2 | n=2: all vertex lattices of type 2, strata points, a connected 0-dimensional reduced locus is one point per component; n=4: dimension 4/2−1=1, 2/2−1=0 | pass |
| 4.4 equivalence | f=1; f=2 | no banal component, μ=1; absolute height 4n against relative 2n | pass |
| 5.3 framing | c∈O_K^×; c=ϖ; kernel X[i(u)] | unit multiples identified; valuation 1 rejected; kernel order q^n≠1 | pass |
| 5.4 trace recovery | A=⟨Πx,y⟩, B=⟨x,y⟩ | Tr(u⁻¹δ(A+uB))=δ(0·A+2B)=2δB since u⁻¹+ū⁻¹=0 | pass |
| 5.7 regularity | n=2,3; yz=u | relative 1,2; absolute 2,3; maximal ideal (y,z) in dimension 2 | pass |
| 5.9 norm factor | a∈O_L^×; a=u | aā unit; uū=−u², K-valuation 1=val_L(u) | pass |
| 6.6 CM moduli | a=ℤ, 2ℤ, (1/2)ℤ; c=1+√2; R=k[ε], R[x]/(x²); existence for all a | duals Λ, (1/2)Λ, 2Λ⊊Λ (rejected); c²=3+2√2, c⁴=17+12√2; x²=(x+α)(x−α)+α² so α²=0, α=εc; a=(c′)·Nm(𝔠) with c′≫0 is solvable exactly when F/F⁺ ramifies at a finite place, matching RSZ21 line 688 | pass; R01, R02 are locator and format only |
| 6.8 parity exponent | n=3, r_φ=2 | 3·1−2=1 and 3·0−2=−2; Σ(n−r_φ)=Σ r_φ̄ from r_φ+r_φ̄=n | pass; R02 format |
| 7.4 Krämer–Eisenstein | n=3 distinguished; banal factor | rank P = r_{φ₀}=2 with structural action, quotient 1 conjugate; banal: P is the whole summand, quotient 0, equation = Eisenstein | pass |
| 7.6 good and bad bases | F⁺=ℚ(√3), F=ℚ(ζ₁₂), p=3 | e(F/ℚ)=2=e(F⁺/ℚ) at 3, residue field 𝔽₃, −1 a nonsquare: inert, 3 ramified in F⁺, bad for O_F×O_F | pass |
| 7.7 projectivity | F⁺=ℚ, n=4 | trace form of signature (6,2) in 8≥5 variables: isotropic (Meyer) | pass |
| 7.8, 7.9 | n=2 wedge and Krämer; ramified coefficients | uv=t²·unit not regular; yz=u regular after unramified extension | pass |
| 8.4 local equations | N=1,2 | W(k); W(k)[[x₁,x₂]]/(x₁x₂−p): p∉m² so regular of dimension 2; hyperbolic plane has determinant −1 | pass |
| 8.7 tangent space | N=1,2,3 | Hom(line, rank N−1): 0,1,2; CM factor étale adds 0 | pass |
| 9.1 Tate–Dieudonné | supersingular E; ordinary E; conjugated CM action | 4=4; 2≠4; Hom_K=0 against semilinear maps of a free rank-one K⊗ℚ_ℓ-module of dimension 2 | pass |
| 9.2 quotients | H=antidiag(1,1)⊕(3), Λ₊, Λ₋, Σ, g=diag(3,1/3,1); Γ=ℤ; {±1}; S₃ on six copies | det −3; duals ⟨e,f/3,a/3⟩, ⟨e/3,f,a/3⟩, ⟨e,f,a/3⟩, lengths 3,3,1; h(3e,f/3)=1, gΛ₋=Λ₊; −1 fixes every point (one sheet, not two); free S₃ gives one copy | pass |
| 9.5 Θ | Spec k→Spec k[ε]/(ε²); g=diag(3,1/3) | points 1=1, tangent 0≠1; gg⁻¹=1, g²=diag(9,1/9) | pass |
| 9.6 normalization | val_u(ϖ)=1, 0 | u²/ϖ of valuation 0, 1 | pass |
| 9.7, 9.9, 9.10 | n=1; n=2; q=3 | N₁ a point; filtration ranks 1/1; degrees 9, 4, 1 | pass |

Context and generality: there is no Lean declaration, so no `variable` block can drop a hypothesis;
README hypotheses were compared with the sources at the lines above (p>2 at LZ22 line 3516, HLSY23
unit multiples at line 447, Howard19 regularity at line 247).

### Library at the pins

Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, unchanged since round 5. Opened: `LinearMap.charpoly`
(`Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, `charpoly_monic` :72, `charpoly_natDegree` :76 with
`StrongRankCondition`); `Matrix.charpoly` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`);
`Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean:66`); `WittVector`
(`Mathlib/RingTheory/WittVector/Defs.lean:52`); `WittVector.Isocrystal`
(`Mathlib/RingTheory/WittVector/Isocrystal.lean:112`); `IsRegularLocalRing`
(`Mathlib/RingTheory/RegularLocalRing/Defs.lean:52`); `AlgebraicGeometry.Scheme`
(`Mathlib/AlgebraicGeometry/Scheme.lean:40`), `Flat` (`Morphisms/Flat.lean:42`), `Smooth` and
`SmoothOfRelativeDimension` (`Morphisms/Smooth.lean:59`, :127); `TauCeti.AlgebraicGeometry.AbelianVariety`
(`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, over a field);
`TauCeti.FormalScheme.Spf.carrier` (`…/Spf/Carrier.lean:73`), `structureSheaf`
(`…/Spf/StructureSheaf.lean:262`); `TauCeti.TateModule` (`TauCeti/Algebra/Module/Torsion/TateModule.lean`,
the docstring's ℓ-adic remark). A search of both pins for p-divisible groups, abelian schemes and
formal schemes finds only the `Spf` files: the carriers the headlines need are absent.

### Suggested.lean

`lake env lean` on `packages/PELModuliPartII/Suggested.lean`, run from the content checkout: exit 0,
no output. One import (`import Mathlib`), one docstring, one empty namespace, no `set_option`, no
declaration. Headlines of the Summary: §§1.2, 2.2, 3.4, 3.7, 5.7; 6.6; 7.6, 7.7, 7.8, 7.9, 8.4, 8.7;
9.5–9.10 (18), each named in the docstring with the missing carrier, plus §9.1. None is statable:
each needs formal schemes with formal smoothness, strict modules or p-divisible groups over a base,
abelian schemes with PEL structure, or Dieudonné modules of abelian varieties. One-tactic probe:
0 of 0 sorried theorems; `#check @name` audit: 0 of 0 declarations. No backticked name in the README
is presented as this roadmap's own declaration.

### Suppliers, gaps, direction

Every cited section was resolved now, on main (`1a19c9f`) or at the open head: PELModuli (#966)
M0.4, M0.6, M0.7, M0.10, M0.16–M0.18, M0.22–M0.25, M1.1, M1.6, M1.7, M1.9, M1.13, M2.8, M2.11,
M2.12, M2.14, M2.15, M3.1, M3.2, M3.8, M4.3, M4.5–M4.8, M5.5 (README lines 584–3663 there);
AbelianSchemesAndArithmeticModuli A4.1, A4.3, A4.7–A4.9, A6.10, A6.11, A6.13;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2.10, .17, .20, .26;
EndoscopicTransferAndUnitaryTraceComparison 7.6, 8.3, 8.10, 10.2; IgusaVarietiesAndTorsionConcentration
0.27, 0.31; AlgebraicModuliForArithmeticGeometry 1.3; GeometryOfNumbersAndQuadraticArithmetic 2.7,
2.9; PadicHodgeTheory 3.3–3.5, 8.3; ShimuraVarieties 1.7, 2.5–2.7, 4.5, 5.10, 6.7;
ShimuraCompactifications 7.5, 7.18, Layer 7; on main: AdelicAlgebraicGroups 4.1
(`TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4101`; this roadmap has reached main since round
5), AdicSpacesPartIII Layer F0 (:682) and R2.9 (:7714), SchemeAndStackFoundations Layer 1 (:2764)
and Layer 4 (:6245), ReductiveGroupsPartII RG2.3.5 (:4664); downstream SelmerIwasawaCohomologyPartII
2.2–2.4, 2.6, 5.2, 5.4. All headings exist with the cited subject. `roadmaps resolve` lists nothing
missing.

Gaps: the four slugs are in `design/plan.json` and in the README supplier subsections with the same
sentence and a named supplier; each asks for one object with its hypotheses, and none is provided
by main, the pins or an open head (searched for hermitian local–global existence, unitary multichain
stabilizers, nilpotent-display equivalence, multichain PEL moduli). SelmerIwasawaCohomologyPartII
(`README.md:245` at #1403) declares the same slug hermitian-local-global towards the same supplier:
one owner, two consumers, no conflict.

Dependency check, exact output:

```text
depcheck: 245 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Duplication and ownership: searched main and the open heads by object (strict O-modules and
O-displays, unitary Rapoport–Zink spaces, Krämer and almost self-dual models, quotients of formal
schemes by discrete groups, Tate–Dieudonné comparison). Hits are consumers or the suppliers already
cited (EndoscopicTransferAndUnitaryTraceComparison §10.2, PELModuli §M2.15,
GrossZagierAndArithmeticHeights as a consumer of the former); no second owner. The board package
index lists two other packages (AnalyticNumberTheory, LawrenceVenkateshMethod), unrelated. The
overlap file reports no other pull request changing this roadmap, no dropped id and no id defined
only by a revision.

Overlap check: read IgusaVarietiesAndTorsionConcentration, SelmerIwasawaCohomologyPartII, HilbertModularVarietiesAndShimuraCurves, PELModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (the open list by vocabulary; the lists for main and by results are empty); framed deformation functor and unramified single-lattice PEL space: IgusaVarietiesAndTorsionConcentration §0.27; displays and BT: PELModuli §M2.15; special-fibre strata of the LTXZZ models: SelmerIwasawaCohomologyPartII Layer 2; nothing owned twice.

### Copyright and arrangement

Wording compared at the 15 sampled locators and at eleven further passages (Mih19 Defs 11.7–11.9
against §0.1; LZ22 lines 392–399 against §1.1; LZ22 lines 411–418 against §1.3; HLSY23 lines 437–447
against §§5.1, 5.3; HLSY23 lines 455–492 against §§5.4, 5.8, 5.9; RSZ21 lines 626–700 against §6.6;
RSZ21 lines 1755–1806 against §7.4; LL22 lines 1111–1128 against §3.7; RZ96 lines 2409–2420 against
§9.2; Zhang21 lines 650–700 against §§1.4, 1.6; LZ22 lines 2871–2884 against §2.5). The longest
shared runs are definitional ("acts on Lie", "the dual lattice", "locally free … of rank one"),
under six words, and forced by the mathematics. No table, figure or example list is taken over.
Arrangement: LL22 has the largest share; its contents (§2.1–2.8 local intersection, §3 theta
lifting, §4.1–4.7 inner product formula) do not map onto Layers 0–9: Layers 3–4 draw on §2.1, §2.3
and §2.8, and §§7.3, 7.7, 9.6 on §4.5.

Source independence: 26 passages compared with 11 sources, none shared; largest share LL22, 39 of 219 locator mentions; contents compared with LL22: independent.

## Not verifiable

- Published page numbers of Zhang21 (Annals, pp. 879–881, 901–909) and of LTXZZ22 (Inventiones,
  pp. 147–193): the cached texts are the arXiv versions with their own pagination (Zhang21 (3.1)–(3.6)
  on p. 12, (7.3)–(7.6) on p. 32; LTXZZ22 §4.2 on p. 36, §5.2 on p. 56). Sections, equations and
  statements were read; the published pages are consistent with a constant scale but not certified.
  The manifest records the version note.
- Ownership against open pull requests rests on the index of 2026-11-15T15:19:03Z.

## Source issues

- **Gap** in HLSY23 at Definition 2.2(2), printed p. 10: the source says the framing is a height-zero O_F-linear quasi-isogeny; it should also relate the two polarizations up to a unit; affects a stated result.
- **Misprint** in HLSY23 at §1.2, printed p. 2: the source says the Krämer filtration has rank 1; it should have rank n−1, as in Definition 2.2(3); affects nothing.
- **Misprint** in LZ22 at §13.4, condition (3), printed p. 82: the source says the isogeny α has degree q; it should have degree q² at v₀, forced by the polarization identity of the same line; affects a stated result.
- **Error** in RZ96 at Corollary 6.29, printed p. 293: the source says each of two polarized K-objects satisfying Lemma 6.28 separately suffices for the Hom comparisons; it should require equal slopes at each place above p; affects a stated result.
- **Gap** in LL22 at §4.5, printed p. 66: the source says the integral models are projective by RSZ20 Theorem 4.7; it should supply properness and an ample line, which that theorem does not give; affects the proof.

Those of round 5's register that were not reopened this round (LL22 A₀ for A, LTXZZ22 Definition
4.2.2, Remark 4.2.5 and Theorem 4.2.3) stand as recorded there.

## For the human reviewers

- **Licence.** RZ96 is read from a scan on an author's institutional page (`sources.toml`, entry RZ96, class author-page); the book is a Princeton University Press title. Whether that copy is authorised is not something the manifest settles.
- **Not tested.** Published pagination of Zhang21 and LTXZZ22 (see Not verifiable): locators carry published page numbers that were not read in the published versions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d35cdf61b94634666545c64cfef2a070a7453499", "job": "REV-PKG-PELModuliPartII~6", "model": "fable", "worker": "chris-x83"} -->
