<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1562#issuecomment-6402355172 -->
Review (claude) of 0a0dea3

Verdict: accepted
Conditional on the announced gaps: `geometric-compact-mhs`, `unitary-splitting-families`, `generic-orbifold-transgression`, `equivariant-grothendieck`, `fractional-equivariant-hodge-tate`, `equal-characteristic-abelian-duality`, `relative-picard-norm-duality`, `relative-higgs-git-properness`, `smooth-stack-hartogs`, `relative-hitchin-picard`, `higgs-sector-purity`, `tame-stack-trace`, `relative-gerbe-splitting-representability`

1. **F01** (P3) AbelianSchemes locator typography `A¹.3, A¹.5`

   **Location.** `README.md` line 87: "Consume §§A¹.3, A¹.5, A2.2–A2.3, A3.2–A3.3, A3.5, A3.7 for invariant differentials, the theorem of the cube, …".

   **Claim.** The two superscript-one labels do not name sections of the supplier.

   **Witness.** AbelianSchemesAndArithmeticModuli at its open head prints `### A1.3 Invariant differentials` (reader line 767) and `### A1.5 The theorem of the cube and multiplication pullbacks` (reader line 879); the string `A¹` occurs nowhere in that README. The gap entry for the same supplier and the Needs lines elsewhere already use the `A2.2–A2.3`, `A3.3–A3.7` form.

   **Repair.** Write `§§A1.3, A1.5, A2.2–A2.3, A3.2–A3.3, A3.5, A3.7`. Tested: with `A1.3`/`A1.5` the two cited objects (invariant differentials, theorem of the cube) are exactly those headings' contents.

2. **F02** (P3) Undefined symbol `Br(X)_K` in §1.4

   **Location.** `README.md` line 417: "…Br(K)→Br(X)_K→H¹(GK,Pic(X_Ks))→H³(GK,(Ks)×)", and line 421: "Its exactness at Br(X)_K alone gives a constant Brauer class".

   **Claim.** `Br(X)_K` is used twice and defined nowhere in the package; the Hochschild–Serre low-degree sequence consumed from SchemeAndStackFoundations §2.15 has, in that position, the kernel of Br(X)→Br(X_{K^s}).

   **Witness.** A grep of the README for `Br(X)_K` returns only lines 417 and 421; §1.1 (line 330) defines "arithmetic" for gerbes but introduces no notation for the Brauer-group kernel. SchemeAndStackFoundations §2.15 (main, line 3867) states Hochschild–Serre with the geometric-kernel term.

   **Repair.** At first use write "Br(X)_K := ker(Br(X)→Br(X_{K^s})), the classes that are K-arithmetic in the sense of §1.1", then keep the symbol. Tested on the §1.4 statement: β of an arithmetic μr-gerbe lies in that kernel by §1.1, so the sequence's exactness at Br(X)_K is the step the route uses; the real-conic Check (Hamilton class dies in Br of the pointless conic) is unaffected since it concerns the previous arrow.

3. **F03** (P3) Assertions about the printed text of an uncertified source; undefined qualifier "corrected"

   **Location.** `README.md` line 203: "equality of the corrected χ-counts after every map R→𝔽q"; line 841: "The source's proof writes an irrelevant coprimality with d"; line 858: "The printed sign in N and in the torsor power is corrected throughout."

   **Claim.** The two sentences at 841 and 858 state what GWZ20 prints. GWZ20 is recorded as uncertified (no text), so neither the author nor any reviewer on the project can check them, and they read as editorial narrative about a source rather than mathematics. "Corrected χ-counts" at 203 has no referent: §0.1 defines one χ-count (line 147) and no corrected variant.

   **Witness.** `sources.toml` entry `GWZ20`: `status = "uncertified"`, `version_note = "paywalled; cited by its locator without the text"`; README line 1093: "cited without a certified source text". The mathematics itself is right and was recomputed: N=M⁻¹Q^n has degree −deg M+n deg Q=0; (P^L)^e⊗π*Q^(e−1) has label L^e M^(1−e) Q^(n(e−1))=L^e N^(e−1); for n=3, d=1, e=3 the class t of order 3 has et=0 with gcd(e,d)=1, so gcd(e,n)=1 is the operative condition.

   **Repair.** Line 203: delete "corrected". Line 841: "The torsor-class argument uses gcd(d,n)=gcd(e,n)=1; coprimality of e with d is not used." Line 858: "The sign of M in N and in the torsor power is the one fixed by §3.10." If a misprint in GWZ20 is ever confirmed from a legal text, it belongs in the errata register, not the README.

4. **F04** (P3) A proof route names a source lemma as its supplier; one garbled sentence

   **Location.** `README.md` line 578 (§2.6 route): "By the imported Lemma 6.7 its phase is a constant root of unity times the Tate character of the nonzero opposite torsor class." Line 563 (§2.5 route): "after its prime-to-characteristic equal-characteristic extension the equal-characteristic local-duality supplier contract".

   **Claim.** "Lemma 6.7" is a lemma of GWZ20, not a target, a supplier section or a pinned declaration; the owner of the gerbe-evaluation/Tate-character statement is ArithmeticGaloisDuality D7.6, paragraph "Local abelian-variety duality and gerbe evaluation" (characteristic zero), plus `gap:equal-characteristic-abelian-duality`, both of which the §2.6 Needs line already lists. Line 563 is missing a preposition and does not parse.

   **Witness.** ArithmeticGaloisDuality at its open head, D7.6 (reader line 5847), paragraph at reader line 5968 ("Let F be a finite extension of ℚ_ℓ … A an abelian variety over F and A∨ its dual … Ext … H^r(F,A∨)≅Ext^{r+1}_F(A,G_m)"); README line 81 consumes exactly these paragraphs.

   **Repair.** Line 578: replace "the imported Lemma 6.7" by "the D7.6 gerbe-evaluation square, extended to equal characteristic by the local-duality contract". Line 563: "…after its prime-to-characteristic extension to equal characteristic through the equal-characteristic local-duality supplier contract…". Tested on the one-empty-fibre instance of §2.6: the phase on the nonempty torsor is a constant times a nontrivial character of a compact group, integral 0, as the Check at line 582 states.

Independent review of the package at board head `0a0dea3` (round 2 was reviewed at `21fdf6f`). Files read in full: `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md` (1096 lines, 44 numbered subsections), `Suggested.lean`, `metadata.toml`, `sources.toml`, and `design/plan.json` (its `gaps` list). The round-2 review and its repair report were read first; the single round-2 finding was re-verified at the current head, the repair's own pattern search was repeated, and the citation maintenance the repair performed (CountingBundlesAndHallAlgebrasOfCurves locators) was resolved at that roadmap's open head. No finding is blocking. Four P3 notes follow; the next stage applies them.

## Verified sound

### Round-2 finding, checked at the current head

| Round-2 finding | Repaired passage | Independent check | Status |
|---|---|---|---|
| F01 (P2): base-free cardinalities (e²,e,e) for a cyclic tame inertia group | README line 135: "viewed as a constant group over a base S on which e is invertible, the general inputs are the Kummer sequence 0→Pic(BI_S)/e→H²(BI_S,μe)→H²(BI_S,Gₘ)[e]→0 and, over a field K, the Hochschild–Serre spectral sequence … no cardinality is asserted over a general base. Over the finite residue field k=𝔽q of O_F with e dividing q−1 … |H²(BI_k,μe)|=e², |Pic(BI_k)/e|=|Hom(I,k×)|=e and |H²(BI_k,Gₘ)[e]|=e." New Checks at lines 348–351. | Recomputed: cd(k)=1 kills the a≥2 column; H⁰(k,H²(I,μe))=μe/e=ℤ/e and H¹(k,Hom(I,μe))=H¹(k,ℤ/e)=ℤ/e (trivial action since μe⊂k), product e²; Pic(BI_k)=Hom(I,k×)=μe(k), order e, killed by e; Kummer gives e²/e=e. Negative controls: C₂/ℂ (2,2,1); C₃/𝔽₅ (1,1,1); C₂/ℚ₅ (16,2,8); all computed in the table below. The repair restricts only the cardinality sentence; the complex and local-field scope of the roadmap is unchanged. | Repaired |

Pattern search repeated: `|H`, `|Pic`, `|Br`, `BI`, `e²`, `order e` occur in the contract paragraph (lines 135–137) and in the new §1.1 Checks only; the μ_(re) bound at line 137 is base-explicit (𝔽₉: 8 | q−1, 16 ∤ q−1). No other base-free cardinality remains.

Citation maintenance by the repair: the former `CB.7/canonical-higgs`, `CB.7/higgs-moduli`, `CB.9/higgs-purity` slugs were replaced by §§7.1, 7.3, 9.1 in Scope (line 11), the contract (line 103), §3.1 (lines 631, 640, 652), §3.4 (lines 702, 711), §4.1 (850), §4.3 (872, 881), §5.2 (986, 996), three layer Dependencies, and `plan.json` gap `higgs-sector-purity` (section `9.1`). Resolved at CountingBundlesAndHallAlgebrasOfCurves' open head (#1547): `### 7.1 positive canonical Higgs sheaves and coherent comparisons` (reader line 1103; "For gcd(r,d)=1, Higgs semistability implies stability"; geometric stability), `### 7.3 stable canonical Higgs moduli` (1142; g≥1, coarse smooth quasiprojective H_(r,d) of dimension 2D, `h` proper, Check H_(1,d)=Pic^d×A^g), `### 9.1 pure Higgs cohomology and BB shifts` (1447; g≥1, coprime, ℓ≠p, H_c^n pure of weight n). Each citation says what the section says, under its hypotheses (g≥1 there; genus zero is §3.9 here); the diff since `21fdf6f` touches nothing else.

### Principles

No route-specific shortcut: the p>n, root, invertibility, even-degree and coprimality conditions are theorem hypotheses (lines 19, 839, 854, 967), not a "good primes" restriction; genus 0 and 1 are inside the theorem through §3.9. No re-planned roadmap (ownership below). Supply direction: depcheck clean (below). No copied passage: the three readable sources were compared at every cited line; the README restates. No algorithm. `Suggested.lean`: single `import Mathlib`, one module docstring, the namespace, no declaration, no `set_option`, no `lemma`, no sorry'd data. Policy grep for process words (so far, checkpoint, handoff, round, pull request, PR numbers, optional, deferred, removed, repair, review) and LaTeX delimiters: no hit; the only match is the mathematical use of "removed" at line 665.

### Sources: seeded sample and flagged locators

GWZ20 is settled as uncertified; all 15 seeded targets cite it, so their theorem numbers and pages cannot be certified against a text here (see Not verifiable). What could be read was read at its line.

| Seeded target | Recorded locator | Outcome |
|---|---|---|
| 0.3 Equivariant Katz | GWZ20 Thm 2.15, pp.523–524; route via BITTNER04 Lemma 7.1 | GWZ20 uncertified. BITTNER04 line 812 is Lemma 7.1 (p.18): presentations (sm) and (bl) of the good-action ring; line 805 is the K₀^G quotient by the projective-space ideal (the "further representation quotient" the gap keeps separate); lines 830–844 use equivariant completion, resolution and equivariant weak factorization, as the gap `equivariant-grothendieck` requests. Route checked (table). |
| 0.4 Finite-denominator Tate roots | GWZ20 Lemma 2.17, pp.525–526; ITO04 §5.3 | ITO04 lines 628–645 construct ρ^(1/d)=exp((1/d)log ρ) after a finite extension, with (ℚp(1/d))^⊗d≅ℚp(1); the README's finite-cover and shallow-principal-unit hypotheses match. |
| 0.5 Fractional Katz | GWZ20 Thm 2.18, pp.526–527; ITO04 Lemma 4.3, Prop 5.1, Defs 5.2–5.3 | ITO04 line 524 Lemma 4.3 (p.12): additivity of Hodge–Tate multiplicities needs the middle term of full Hodge–Tate dimension; line 555 Prop 5.1 (p.13): traces at almost all Frobenii give equal semisimplifications; lines 573, 611, 624, 666 are Defs 5.2, 5.3, §5.3 and Example 5.5. All as cited. |
| 1.3 Principal splitting torsor | GWZ20 Def 6.4, p.566 | Uncertified; construction checked by instances (table). |
| 1.4 Constant Brauer classes | GWZ20 eq. (24), Lemma 6.5, pp.565–566 | Uncertified; the sequence is Hochschild–Serre's, consumed from SchemeAndStackFoundations §2.15 (main line 3867); checked (table). |
| 2.1 Abstract Hitchin systems | GWZ20 Def 6.8, p.568; Rem 6.14; Def 4.10; Cor 5.29 | Uncertified; degenerate instances computed (table). |
| 2.3 Compatible gauge forms | GWZ20 Lemma 6.13, Rem 6.14, pp.570–571 | Uncertified; normalisations recomputed (table); Logic §§2.7, 2.12 resolved. |
| 2.7 Fibrewise arithmetic mirror | GWZ20 Thm 6.12, pp.569–570, 574–575 | Uncertified; elliptic control recomputed (table). |
| 3.4 Properness | GWZ20 Thm 7.6, p.577; CB §7.3 | CB §7.3 at head: `h` proper for g≥1, coprime, canonical; README consumes it "under its original hypotheses" (line 702). |
| 3.5 Determinant change | GWZ20 Lemma 7.7, pp.578–579; §7.5 | Uncertified; Kummer/Lang step checked (table). |
| 4.3 Betti/Hodge in coprime degree | GWZ20 Cor 7.17, p.586; HT03 §6, pp.17–18 | HT03 line 648 is §6 (p.17); Thm 6.2 (line 680) proves E(M_Dol)=E(M_DR) for coprime r,d from a proper family of rational homology manifolds: pure MHS and Poincaré duality identify ordinary and compact cohomology (lines 681–691). That is the purity-plus-duality mechanism §4.3 invokes; HT03 asserts no degree independence and no general-D statement, which the README does not attribute to it. |
| 4.6 Local Brauer splitting | GWZ20 Lemma 7.19, p.587 | Uncertified; Br(O_F)=0 step checked (table). |
| 5.1 Main theorem | GWZ20 Thm 7.21, p.588 | Uncertified; hypotheses and controls checked (table). |
| 5.2 Canonical-twist Hodge numbers | GWZ20 Cor 7.22, p.589; HT03 §6 | HT03 Lemma 6.3/Thm 6.4 (lines 693–725): sector-wise purity for the Γ-fixed loci with the gerbe line bundle extended, the mechanism the sector-purity gap asks for. |
| 5.3 Virtual comparison | GWZ20 Thm 6.12, p.569; Thm 7.23 proof, p.589 | Uncertified; the virtual/actual distinction checked (table). |

Other readable locators: HT03 line 385 is Proposition 3.2 (pp.10–11) and line 498 Proposition 3.6 (p.13), smooth isomorphisms of unitary-trivialisation torsors with the dual Pryms over ℂ, as §§1.5, 4.5 say; neither proves arithmetic descent, which §§4.4–4.5 keep as this roadmap's obligation.

### Computed adversarial pass

Let E/𝔽₃ be y²=x³−x: affine points (0,0),(1,0),(2,0) plus ∞, so #E(𝔽₃)=4, Frobenius trace 0, trace of Fr² is 0²−2·3=−6, #E(𝔽₉)=9+1+6=16, and E(𝔽₃)=(ℤ/2)². Write ζ for a primitive cube root of unity.

| Statement | Instances tried, values on each side | Result / change |
|---|---|---|
| Contract line 135 (F01 repair) | e=1: (1,1,1). C₂/𝔽₅: H⁰(k,H²(C₂,μ₂))=2, H¹(k,ℤ/2)=2, H²(k,μ₂)=0 → H²=4; Pic/2=Hom(C₂,𝔽₅×)=2; Br[2]=4/2=2; formula (4,2,2). C₃/𝔽₅: q=5≡2 mod 3, Frobenius inverts μ₃; invariants 0, coinvariants μ₃/(F−1)μ₃=0 (F−1 is x↦x in ℤ/3), Hom(C₃,𝔽₅×)=1, H²(Gₘ)=H¹(k,μ₃)=0 → (1,1,1) vs (9,3,3). C₂/ℂ: H²(C₂,μ₂)=μ₂ (norm 2=0, g−1=0), Pic=Hom(C₂,ℂ×)=2, ℂ×/ℂ×²=1 → (2,2,1). C₂/ℚ₅: terms 2, |ℚ₅×/ℚ₅×²|=4, |Br(ℚ₅)[2]|=2; d₂ from E^{0,1} killed by the section, d₂ on E^{0,2} by the global class x∪x of the sign character, E^{3,0}=0 → 16; Pic/2=2; Br[2]=8; cross-check H²(BC₂,Gₘ)=ℚ/ℤ⊕(ℤ/2)², 2-torsion 8. Kummer: 16=2·8, 4=2·2, 2=2·1, 1=1·1. | Holds with e|q−1 and the residue base; no change. |
| §1.1 Checks 348–351 | Same five computations; the H¹(𝔽₅,Hom(C₂,μ₂)) class restricts to 0 over 𝔽₂₅ (Frob²↦0) hence arithmetic, its Gₘ-image H¹(𝔽₅,μ₂)≠0 hence not neutral; the sign-root class restricts to the generator of H²(C₂,μ₂) over k̄, not arithmetic; sign is not a square of a character of C₂ (χ(g)²=1≠−1). | Checks correct and discriminating. |
| 0.1 conventions (line 25, 164–169) | [pt/C₂](𝔽₃): two torsor classes, each Aut C₂: 1/2+1/2=1; sign mass 1/2−1/2=0. [A¹/C₂](𝔽₃) sign action: u=0 stacky (1/2+1/2), u=1 split orbit (1), u=2 nonsplit torsor (1): total 3=q. A¹: H_c²=ℚℓ(−1), trace 3, E=xy. | Compact support, torsor weighting and χ-projection consistent. |
| 0.3 Equivariant Katz | G=1, A¹ vs G_m⊔pt: q=(q−1)+1 for every q; xy=(xy−1)+1. S₃ trivial on a point, χ=sign: 0=0. P¹ Hodge–Tate: H²=H¹(Ω¹)⊗C_p(−1), multiplicity at Tate degree −1 is h^{1,1}=1, matching "multiplicity at Tate degree −p with H^q(Ω^p)" and the CohomologyComparisons (−b) twist. Blow-up of a point of P²: (1+2t+t²)−(1+t)=(1+t+t²)−1. | Holds; hypotheses (all finite extensions, R⊂ℂ finite type) present. |
| 0.4 Tate roots | N=1: ℚℓ(1). ℓ=3, N=2 on image in 1+3ℤ₃: exp(½log u) converges and squares to u. All-3-power roots in ℚ₃: u=4=1+3 has v₃(log 4)=1 but a 3^m-th root in ℚ₃ needs u∈1+3^(m+1)ℤ₃; roots of unity contribute nothing (ζ^(3^m)=1 forces ζ=1 in μ₂). ℓ=2 needs the 1+4ℤ₂ neighbourhood, covered by "shrinking and finite étale cover". | Holds; Check at 227 is correct. |
| 0.5 Fractional Katz; 0.2 transport | q=9: s₂=3, type (1/2,1/2); ℒℒ⁻¹: 1, (0,0). Transport at q=p: x^r−p is Eisenstein over ℚ(μ_m) when p∤m, so Gal(ℚ̄/ℚ(μ_m)) acts transitively on the roots ζ^j p^{1/r} at every level; nested nonempty closed sets, compactness gives one σ carrying one compatible system to another and fixing the character values. Counter-control showing p∤m is needed: √5∈ℚ(μ₅), so for m=5 no σ fixing ℚ(μ₅) sends √5 to −√5. V−V=0: even/odd cancellation retained. | Holds; the §0.2 hypothesis is exactly what the argument uses. |
| 1.3 Split′ | Neutral μ₂ on E with origin: Split_μ₂=E[2], 4 points; Split′=E[2]×^{E[2]}Pic⁰=E∨, dimension 1. U=V=Spec K: Pic=0, point. Hamilton class on X/ℝ with X(ℝ)≠∅: a ℂ-neutralization and its conjugate differ by a line bundle pulled back from Spec ℂ, trivial, so the descent datum is trivial and Split′(ℝ)≠∅ while restriction to a real point gives (−1,−1)≠0 in Br(ℝ). | Holds; Check at 407 is correct. |
| 1.4 constant classes | Conic x²+y²+z²=0 over ℝ: Br(ℝ)→Br(C) kills (−1,−1), so no unconditional injection. With a K-point, a retraction gives injectivity. H³(ℝ,ℂ×)=H¹(C₂,ℂ×)=ker N/(σ−1)=S¹/S¹=0, so the right map is onto. A K-point of Split′ kills the Picτ-torsor class, hence its image in H¹(K,Pic(X_{K^s})), so β∈im Br(K) by exactness at the kernel term. | Holds; R02 names the kernel term. |
| 2.1 abstract systems | E×A¹→A¹, P=E×A¹: M′=M, complement empty (codimension ≥2 vacuously), relative dimension 1. Trivial group, M=A: relative dimension 0. Blow-up of a point of a smooth surface fibration: exceptional divisor of codimension 1 in the complement of the old torsor locus; the bound fails, as Check 476 says. | Holds. |
| 2.3 gauge forms | ω=dt∧θ on E×A¹; |u|=1 for u∈O_F×; |π|=1/3 at q=3; π²(dx)^⊗2 has density |π²|^{1/2}=1/3. a=xy: da∧(−dx/x)=−(x dy)∧(dx/x)=dx∧dy; with +dx/x the sign flips. A²∖0: 1 extends as 1 (codimension 2); G_m⊂A¹: t(0)=0 (codimension 1, excluded). Blow-up chart x=u, y=uv: dx∧dy=u du∧dv, order 1 along u=0. Torsor exact sequence det Ω_{M′/O_F}=π*det Ω_A⊗π*e*Ω_{P/A} gives the nowhere-zero section; its inverse extends too, product 1. | Holds; Hartogs on the smooth stack is the declared gap. |
| 2.7 arithmetic mirror | Identity elliptic pair with neutral gerbes above each a: m=1: 4=4; m=2: 16=16; empty fibre: 0=0. A∖A♦ is a proper closed subset of smooth A, measure 0. Base change to k[[t]] forces the equal-characteristic duality gap. | Holds. |
| 3.4 properness | n=1: SL point→point; GL₁=Pic^d×H⁰(D)→H⁰(D) proper because Pic^d is proper (CB §7.3 Check H_(1,d)=Pic^d×A^g agrees). deg D<0: θ=0, base a point, coprime stable bundle moduli projective. Nonproper total space over k retained at 700. | Holds. |
| 3.5 determinant twists | det(E⊗N)=det E⊗N^n: degree d+n deg N≡d mod n. L₂=L₁N^n with N rational: class 0. E/𝔽₃: E(𝔽₃)/2 has order 4 and H¹(𝔽₃,E[2])=E[2]/(F−1)E[2]=E[2] has order 4 (F trivial on the rational 2-torsion); Lang: H¹(𝔽₃,E)=0. n-th roots form a J[n]-torsor since [n] is étale for n invertible. | Holds. |
| 3.6, 3.10 norms and powers | n=2: M=D⁻¹, target LD (not LD⁻¹); (P^L)²=P^{L²M⁻¹}=P^{L²D}; e=0: label M, target O. Layer 3 example: n=2, g=2, D=ω: spectral genus 2·2−1+2=5, Prym 5−2=3, base 3, total 6=(n²−1)deg D. | Signs consistent across Conventions, §§3.6, 3.10, 4.2 and the examples. |
| 3.2, 3.3 | n=2,g=2,deg D=2: rank End₀=3, dimension 6; char p | n: id∈End₀. y²=x³+x+3 over 𝔽₁₇: all 17 values of x³+x+3 are nonzero (3,5,13,16,3,14,4,13,13,10,10,2,9,3,7,10,1), so E[2](𝔽₁₇)=1 against geometric order 4; discriminant ≡9≠0; μ₈⊂𝔽₁₇. diag(1,−1) vs diag(1,1): traces 0 and 2, equal on even powers. | Holds. |
| 4.1, 4.2 counts | n=3,d=1,e=3: t≠0, et=0 with gcd(e,d)=1 — gcd(e,n) is the condition. n=2, deg D=2: deg M=−2, deg Q=−1, N=ωQ² of degree 0; e=3 label L³N² of degree 3d; e=1 label L. deg D=1: deg M=−1, no integral Q. | Holds (see R03 for wording only). |
| 4.3 Betti/Hodge | Rank one E×A¹/𝔽₃: compact Betti (1,2,1) in degrees 2,3,4; Poincaré duality to (1,2,1) in 0,1,2; genus-0 empty branches: 0 in every degree. HT03 Thm 6.2 mechanism (pure + duality) read at lines 680–691; CB §9.1 gives ℓ-adic purity for canonical coprime GL, g≥1; the complex general-D fixed-determinant and sector statements are `gap:higgs-sector-purity`, not claimed from §9.1. E-polynomial alone: Check 879 correct (a mixed example is not degree-separable). | Holds. |
| 4.6 local Brauer | c∈Br(F) constant along the fibre; x∈M(O_F) by properness; x*β∈Br(O_F)=0 so c=0, phase 1. Constant invariant 1/3 would give ζ≠1. Root gerbe of O(1) on P¹: Kummer class 1 mod 2, Brauer image 0, so Pic/r residue is not erased (Check 936). PGL degree step: an SL point in (P^L)^a has label L^a M^{1−a} of degree ≡ad≡e mod n since n | deg M under the even-degree hypothesis. | Holds. |
| 5.1 main theorem | n=1: 1=1 over 𝔽₂, 𝔽₃. n=2,g=2: |Γ|=16, root order 32; 3⁸−1=6560=32·205, p=3>2 admitted; characteristic 2 excluded. P¹, D=O, n=2, d=1: 0=0 (block O(a), a≥1>1/2). | Holds; full genus range stated and routed through §3.9. |
| 5.2 Hodge numbers | Eigenpair ζ,ζ⁻¹: 1/3+2/3=1; −1-eigenspace of a symplectic automorphism is symplectic hence even-dimensional, so ages are integral; degree 2, type (1,1) → stringy degree 4, type (2,2), sign (−1)^2=(−1)^4; age 1/2 on [A¹/C₂] (nonsymplectic) excluded; n=1: h_c^{0,0}=1. | Holds. |
| 5.3, 5.4 virtual vs actual | I₂ and J₂^m (rows (1,m),(0,1)) have trace 2 for all m, fixed spaces of dimension 2 and 1; ℚℓ[0]⊕ℚℓ[−1]: trace 0, dimension 2 ≠ 0; two Frobenius-exchanged lines: matrix ((0,1),(1,0)), trace 0 odd / 2 even. | §5.3 stays virtual; §5.4 names the ungraded direct sum and forbids the inference. |
| 5.5, 5.6 pairings | (−3,−3)₃=(−3,−1)₃=(3,−1)₃=(−1 | 3)=−1, invariant 1/2 (diagonal need not vanish). C₃: (1+1+1)/3=1 on the selected character, (1+ζ+ζ²)/3=0 otherwise; (ℤ/2)⁴ gives 1/16; S₃'s two linear characters sum to 2 at a 3-cycle. | Conventions consistent with line 33. |
| Headlines not in the sample (0.8, 1.5, 2.4–2.6, 2.8, 3.7–3.9, 4.5, 4.7) | Text unchanged since round 2; its computed rows were reread and spot-checked: BS₃ has 3 sectors not 6; P_PGL(F)≠P_SL(F)/Γ(F) (E(𝔽₃)/E[2](𝔽₃) has 1 element, (E/E[2])(𝔽₃) has 4); n=3, E=O(1)²⊕O on P¹: block slope 1>2/3; one-empty-fibre integral c(1+ζ+ζ²)/3=0. | No change. |

Domain checks: every denominator (|G|, N, r, q^m) is nonzero by hypothesis; q=1 and rank 0 are excluded at lines 19, 27; natural-number subtraction does not occur (degrees are integers, torsor powers are signed); nonreduced bases keep pulled-back neutralizations (line 355); multiplication by p is not treated as étale (line 502).

### Shape, Lean form, headlines and padding

44 subsections; 14 construction blocks (0.1, 0.2, 0.6, 0.7, 1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 3.1, 3.3, 3.7, 4.4) with API lists and 6, 6, 7, 6, 11, 6, 5, 5, 6, 10, 5, 7, 5, 5 Checks; 30 theorem subsections, each with hypotheses, a locator and a Needs line; every layer ends with Examples and Dependencies; Summary, Scope, Conventions, Exact supplier contracts, How to read the build, Downstream consumers, Worked examples, References present. Internal Needs edges all point to earlier subsections (checked pairwise: e.g. 3.9→2.1, 3.2, 3.4, 3.8; 4.1→2.3, 3.4, 3.9, 3.10; 5.4→0.4, 0.6–0.7, 3.9, 5.1, 5.3).

`Suggested.lean` declares nothing; its docstring names all 30 headline theorems (one per theorem subsection) and, for each, the missing carrier. I searched the pinned Tau Ceti tree (`a91d3aaf`) for Higgs, Hitchin, Prym, stringy, gerbe, lisse sheaves and the étale fundamental group, and pinned Mathlib (`6b7abb3c`) `AlgebraicGeometry` for a fundamental group: no file. Abstract `MixedHodgeStructure`, schemes, line-bundle classes, matrices and character sums do not make any headline statable by a few simple definitions, so the all-not-statable docstring is correct; none is forced through a stand-in. One-tactic probe and the `#check @name` signature comparison: zero candidates, nothing changed. `lake env lean` on `Suggested.lean` from the content checkout: exit 0, no output (no `sorry` warning because nothing is declared); no `TauCeti.*` import, so no module build.

### Library declarations opened at the pins

| Declaration | Pinned file and line | What it says / does not |
|---|---|---|
| `sum_hom_units_eq_zero` | `Mathlib/RingTheory/IntegralDomain.lean:186` | nontrivial `f : G →* R` into a domain sums to 0; used for §§0.1, 2.6, 5.6. |
| `Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean:43` | diagonal sum; no semisimplicity. |
| `AddMonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64` | finitely supported coefficients; the bidegree carrier of §0.2. |
| `TauCeti.Hodge.MixedHodgeStructure` | `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` | filtration data on base-change models; no variety. |
| `TauCeti.Hodge.tate_hodgeNumber` | `TauCeti/Geometry/Hodge/Tate/Basic.lean:160` | Hodge number of ℤ(m) is 1 at p=−m; line 195's sign check. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf`, `LineBundleClass`, `inv_mk` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:27`, `…/LineBundle/Class.lean:21` | full subcategory and isomorphism classes; no relative Picard. |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | over a field; no relative dual. |
| `rigidifiedPicardFunctor`, `rigidifiedPicardPoint` | `TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:33`, `…/Point.lean:40` | pointed classes; no representability. |
| `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite` | `TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:35` | (χσ)⁻¹χg summed over χ isolates g=σ; the Fourier step of §5.6. |

Manifest pins and checkout HEADs agree (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…`).

### Suppliers, order, gaps, ownership

Dependency check, exact output:

```text
depcheck: 56 roadmaps, 643 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. In `merge-order/ORDER.txt` this roadmap is line 314 of 315; every cited supplier that is in the order precedes it (SchemeAndStackFoundations 2, EtaleCohomologyFoundations 18, ReductiveGroupsPartII 23, AlgebraicModuli 35, AbelianSchemes 46, ArithmeticGaloisRepresentations 47, ArithmeticGaloisDuality 48, DeligneWeightsAndPurity 91, EtaleDualityAndPerverseSheaves 117, LogicAndDefinability 153, EndoscopicTransfer 161, CohomologyComparisons 204, CountingBundles 273); ClassFieldTheory, JacobianChallenge, AlgebraicVectorBundles and Completed/HodgeStructures are on main.

Citation resolver: one lead, `563: LogicAndDefinabilityInNumberTheory §2.11`. The roadmap is a board package (index: #164, head `f1db101`), outside the resolver's coverage; read at that head: `### 2.5 Jacobian change of variables` (419), `### 2.7 Measures attached to gauge forms` (461), `### 2.8 Positive-codimension loci are null` (487), `### 2.9 Weil volume and residue point counts` (499), `### 2.11 Dual abelian isogeny volume invariance` (543; dual abelian varieties over any nonarchimedean local field, isogeny degree prime to p — equal characteristic included, as §2.5 here says), `### 2.12 Fubini for relative top forms` (553), `## Layer 3: motivic functions, integration and transfer` (573, the gap supplier section). Not drift.

Every other cross-roadmap citation was resolved at its head (reader line numbers include the service's one-line header): AbelianSchemes (#849) A1.3:767, A1.5:879, A2.2:1024, A2.3:1066, A3.2:1385, A3.3:1413, A3.4:1439, A3.5:1452, A3.6:1476, A3.7:1570; EndoscopicTransfer (#999) 3.6:1237, 3.7:1271, 3.8:1290, 3.10:1344, 3.12:1417, 3.13:1444, 3.14:1461, 3.16:1522 (finite-field anisotropic counting, as the contract says); AlgebraicModuli (#853) 1.3:579, 2.1:994, 2.2:1026, 4.1:1746, 4.2:1817, 4.3:1936, 4.5:2305 (with `quotientGerbeTransgression` ×1 and `quotientInertiaComponents` ×2), 4.9:4395, 4.20:7332, 5.1:8603, 7.3:9173, 7.6.1:9490, 8.2:9722, 9.4:10129, 9.5:10155, 9.7:10203; ArithmeticGaloisDuality (#858) D7.6:5847 with the two named paragraphs at 5968 and 6018; CohomologyComparisons (#1064) 2.15:461 (proper smooth X/C, twist −b, P¹ check present); DeligneWeightsAndPurity (#929) 7.8:2553, 7.12:2619, 7.15:2679; EtaleDualityAndPerverseSheaves (#1040) 3.7:3535, 6.3:6563, 6.4:6759; ArithmeticGaloisRepresentations (#856) 1.7:1038, 1.8:1085, 5.1:3102, 5.2:3129, 5.3:3148; ReductiveGroupsPartII (#785) RG2.3.7:5202 "Lang's theorem and lifting"; on main: ClassFieldTheory Layers 5/6/7 at 920/1220/1312; JacobianChallenge Layers A–E at 111/135/143/218/332; AlgebraicVectorBundles L0B:228, L0C:254; SchemeAndStackFoundations 0.6:678, 1.15:2502, 1.16:2589, 1.20–1.23:2843/2951/2989/3021, 2.11:3656, 2.15:3867, 2.22:4428, 3.4–3.7:4789/4876/4905/4937, 4.6:5291; EtaleCohomologyFoundations F.2.1:504, F.2.4–F.2.7:592/613/645/759, F.4.2–F.4.6:979/999/1021/1041/1089, F.5:1179, F.6:1200, F.7:1239; Completed/HodgeStructures Core:104, L2:326, L3:378, Relation to sibling roadmaps:423. No section cited that does not exist; no upward citation; no two owners for one object.

Declared gaps: the 13 slugs in `plan.json` and the 13 README contracts coincide by slug, supplier and `needs` sentence (R01 aside, the supplier sections named exist). Minimality checked against the suppliers: D7.6's two paragraphs are characteristic zero (reader lines 5968, 6018), so `equal-characteristic-abelian-duality` is needed; Logic has no equivariant scissor ring (grep "equivariant": only unrelated hits); CohomologyComparisons 2.15 is non-equivariant over C, not number-field; AlgebraicModuli has no Hartogs statement; EtaleDuality 3.7/6.3–6.4 mention no stack; HodgeStructures is linear-algebraic with no compact-support variety realization; neither AbelianSchemes nor AlgebraicModuli 7.3 has Picτ; CB §9.1/9.3 are canonical GL (g≥1), not general-D fixed-determinant or sector purity. Each `needs` is one interface with its hypotheses; none has supplier `none`.

Ownership by object: service grep over main and the 367 indexed open heads for "Hausel–Thaddeus", "stringy", "abstract Hitchin system", "principal splitting", "topological mirror", "Prym": no competing owner (Prym hits are the consumed Endoscopic sections and MordellLawrenceVenkatesh §8.10's reduced relative Prym of Aff(q)-covers, a different object; main's Orbifolds roadmap is differential-geometric and explicitly not Chen–Ruan). MotivesAndAlgebraicCycles §4.20 (nonequivariant scissor ring) and MotivicEtaleKTheory §3.2 (smooth ordinary MHS) remain narrower than the two realization gaps, as round 2 found. Sibling checkouts were not supplied as paths; ownership against open pull requests was checked only through the service index and the board-packages index.

## Not verifiable

- GWZ20 (Inventiones 2020) is settled as uncertified; every GWZ20 theorem number, page and hypothesis, including those of all 15 sampled targets and the claims about its printed text in R03, cannot be checked against a text here. Not requested again.
- The geometric theorems themselves (properness, codimension certificates, purity of sectors, the §5.4 actual isomorphism) are roadmap targets; the computations above certify statements, conventions and controls, not proofs.
- The 13 supplier contracts are pending work; their precision and minimality were checked, their future implementations were not.

## Source issues

- **Error** in HT03 at Proposition 3.2 proof, numbered p.11 (HT03 line 426): the source says swapping the two Jacobian factors sends the Poincaré bundle to its inverse; it should say the normalized Poincaré bundle is symmetric under the swap (the Mumford bundle m*L⊗p₁*L⁻¹⊗p₂*L⁻¹ is swap-invariant; inversion comes from −1 on one factor); affects the proof.
- **Misprint** in ITO04 at §5.3 and Example 5.5, numbered pp.14–15 (ITO04 lines 663–668): the source says the fractional p-adic E-function takes values in the polynomial ring in u^{1/d}, v^{1/d}, yet Example 5.5 gives ℚp(n/d) the value u^{−n/d}v^{−n/d}; it should allow negative exponents (Laurent); affects a stated result.
- **Error** in ITO04 at Definition 5.2(2)(b) and the §5.3 variant, numbered pp.13–15 (ITO04 lines 582–585, 649): the source requires integral coefficients of det(1−t·Frob) on each weight piece, but ℚp(1), which Example 5.5 places in the group, has polynomial 1−q⁻¹t; it should enlarge the coefficient condition to the Tate-twisted lattice; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0a0dea3", "job": "REV-PKG-TopologicalMirrorSymmetryForHitchinSystems~3", "model": "fable", "worker": "fable-rev131"} -->
