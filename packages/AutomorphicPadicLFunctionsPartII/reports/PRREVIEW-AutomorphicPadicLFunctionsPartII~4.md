# Review of AutomorphicPadicLFunctionsPartII (pull request #1543 at 8e0fa4d)

**Verdict:** accepted

**Summary.** Accepted: a full review of this head found no statement, Check or supplier citation that is false or unsupported; every numerical Check recomputed agrees, the sampled Kings–Sprang locators carry the statements made of them, and the corrected signs of §§3.5 and 4.3 were recomputed independently. There are three small corrections (the description's dependency list misses a supplier this head adds, one ambiguous section pointer, one implicit hypothesis in §8.5) and four format notes, none blocking. The acceptance is conditional on the ten supplier gaps the README declares; three points are left for the human reviewers, among them that §8.5 states an interpolation formula differing by a type-dependent sign from the published one.

## C01 — The description's list of pull requests that must merge first omits MordellLawrenceVenkatesh, which §0.1 now needs

The description says "The open pull requests that must merge first are in the merge order below", and neither that chain nor the "Depends on" list contains MordellLawrenceVenkatesh. At this head §0.1 (line 73) and the contract "From TauCetiRoadmap.MordellLawrenceVenkatesh" (line 1325) consume its §§1.4 and 1.6, and that roadmap is not on main: it is the open pull request #1231. A reader who merges by the description's chain merges this roadmap before a supplier. The same head also adds three suppliers that are on main (ShimuraVarieties §5.1, AutomorphicGaloisRepresentationsPartII AG2.0, AnalyticNumberTheoryPartI §2.3a) and makes Weil's classification and the 2πi-normalized Betti duality targets of this roadmap; the description mentions none of these.

The text that would be right: add "#1231 MordellLawrenceVenkatesh" to the "Depends on" list and to the merge-order chain (before this pull request), and one sentence such as "§0.1 now proves Weil's classification of infinity types, using MordellLawrenceVenkatesh §§1.4 and 1.6, and §5.1 proves the 2πi-normalized Betti duality."

## C02 — In the proof route of §2.1, "§2.6" means SchemeAndStackFoundations §2.6, but reads as this roadmap's §2.6

The route of §2.1 (line 253) says "with affine quasi-coherent acyclicity from §2.6". Every other bare "§x.y" in the README is a section of this roadmap, and this roadmap's §2.6 is the de Rham cohomology of the completed logarithm coefficient, which comes later and has nothing to do with affine acyclicity; read that way the route has a forward dependency. The *Needs:* line of §2.1 shows what is meant ("SchemeAndStackFoundations §§2.6 and 2.23"), and SchemeAndStackFoundations §2.6 is "Quasi-coherent cohomology". Write "from SchemeAndStackFoundations §2.6".

## C03 — §8.5 quantifies over "every critical algebraic χ" without saying that its CM type is the fixed ordinary Σ

§0.1 defines a critical χ with its own CM type Σ_χ, and §8.5 (line 1231) and the fifth paragraph of the overview fix a p-ordinary Σ and then say "for every critical algebraic χ of conductor dividing p∞f and infinity type β−α". The restriction Σ_χ=Σ is carried only by the convention that α is indexed by Σ. For L=ℚ(i) and Σ={σ}, the character (λ)↦barλ⁻⁴ is critical in the sense of §0.1 with Σ_χ={barσ}, and the formula does not apply to it (this is the README's own example in the last Check of §5.9). The source states the restriction (KS-v4 line 3395: characters "with attached CM type Σ"). Adding "critical for Σ, that is μ_χ∈CI_L(O_(p^n f)×) for some n" or "with Σ_χ=Σ" at both places makes it explicit.

## N01 — Three slips of wording in *Needs:* lines and one assumption

The *Needs:* line of §1.2 lists "P2.3/P2.8; … P2.8" and "§2.23; §2.23 (gap:…)", and that of §8.2 lists `AbstractMeasure.dirac` twice; the assumption of §7.1 (line 1004) reads "The multivariate … Amice contract in the integral multivariate Amice contract is needed".

## N02 — AlgebraicTopology is cited by its former Stage numbering

"Stage 5 items 3–4, Stage 6, Stage 8 items 5, 7 and 8" resolve through the table of former numbering in AlgebraicTopology's README (Stage k item m is §k.m), so the citations are valid; the names on main are now Layer 5 §§5.3–5.4, Layer 6 and Layer 8 §§8.5, 8.7 and 8.8.

## N03 — Two locator slips

Equations (5.5.9)–(5.5.11) cited in §7.3 are on p.72 of KS-v4 (lines 3303–3313), not pp.71–72; and "Propositions 5.4–5.6" in §6.1 includes Lemma 5.5.

## N04 — Weil's classification of §0.1 is statable on the pinned carriers

The scope section says this roadmap owns Weil's classification. Its statement needs only `TauCeti.GlobalNumberFields.AlgebraicInfinityType`, its `embeddingCharacter` and `baseChange`, and `NumberField.IsCMField`, all at the pins. It is not one of the four theorems the overview names, so its absence from `Suggested.lean` is no defect; the author would be free to state it there.

## Source issues

- **Error** in KS-v4 at Proposition 3.13, p.35: the source says the uncompleted series has a simple pole at s=0 with residue −δ·e^(2πi⟨−z,w⟩) and gives the residue at d without π^d/Γ(d); it should be that these are the residues of π^(−s)Γ(s)K, the series itself being regular at 0 (for ℤ[i], K(0)=−1, residue π at 1); affects a stated result.
- **Misprint** in KS-v4 at Proposition 3.13, p.35: the source says the functional equation has phase e^(2πi⟨z,w⟩); it should be e^(2πi⟨w,z⟩), as in the theta identity three lines below in its own proof; affects a stated result.
- **Error** in KS-v4 at Lemma 3.16 (2), p.37: the source says the contraction coefficient is (−1)^j·j!·(2πi)^d/vol(A); it should be (−1)^(j+1)·j!·(2πi)^d/vol(A) (direct computation at d=2, j=1 gives +1, not −1); affects a stated result.
- **Error** in KS-v4 at the proof of Proposition 3.23, p.43: the source says the α-fold z-derivative of the character sum multiplies the series by (πr)^α; it should be (−πr)^α, since each ∂_z of exp(2πi⟨l,z⟩) gives −π·r·conj(l); affects a stated result (the signs of Theorems 3.27 and 5.27).
- **Error** in KS-v4 at the proof of Proposition 2.27, p.23: the source says restriction H_(d−1)(Γ,ℤ)→H_(d−1)(Γ′,ℤ) is surjective for every finite-index Γ; it should be that its image has index the order of the torsion of Γ (for d=1, Γ=μ₂ it is multiplication by 2); affects the proof.
- **Gap** in KS-v4 at Proposition 1.5, p.8: the source says the Γ-invariants of every algebraic torus module are the sum of the weights trivial on Γ; it should require R-torsion-free modules (R/(2) with a weight of value −1 has invariants); affects nothing.
- **Misprint** in KS-v4 at the proof of Theorem 5.27, Step 1, p.74: the source says the kernel of Gal(L(p^∞f)/L)→Gal(L(f)/L) is the local units modulo the closure of O_L×; it should be modulo the closure of the units congruent to 1 modulo f; affects the proof.

## Verified sound

Previous findings: the previous review (of 08a106e) raised no finding, so there is nothing to mark repaired.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §0.1 Weil's classification and critical sets | ℚ(i): μ=(−2,1), (−1,−1); ℚ(ζ₈): −2 on {1,3}; ℚ(i,√(1+i)): α=(1,2) | i^(−2)(−i)=i≠1, so Γ=1; i^(−1)(−i)^(−1)=1; N(1+√2)^(−2)=1; conjugate sums −1≠−2. | Agree with the Checks; KS-v4 lines 289–364; none |
| §0.1 proof route | converse direction on u∈O_F×; g-twist of a type | u^μ₀=N_(F/ℚ)(u)^w=±1, squares give 1; ∏σ(x)^μ(gσ)=g⁻¹(1)=1; MLV §1.6 hypothesis is all conjugations c. | Route closes; none |
| §0.3 invariants of C_(a,β) | ℚ(i), μ₄: (a,β)=(3,0),(0,0); ℚ(ζ₃), R/(2) | i^(−3)·i^(−1)=1; i^(−1)=−i, −i−1 a unit of ℤ[i,1/2]; ζ₆³=−1≡1 mod 2. | Agree; none |
| §1.1 trace-zero functions | Nc=3; Nc=9, Nc′=25; c=O_L | (2,−1,−1) sum 0; 24·8−192=0, restricted h_c has trace −(Nc−1)=−2 at Nc=3; 1−1=0. | Agree; KS-v4 lines 836–853, 938–941; none |
| §1.2 residue and limit comparison | d=1 reading; Γ acting nontrivially | H^i=0 (i<d), H^d≃H⁰(S,O_S); support group contains O[D]^Γ with trace map. | Matches KS-v4 lines 821–833, 1106–1181; none |
| §1.3 EK class | h=(2,−1,−1), k=(0,1,−1), (1,1,1) | traces 0, 0, 3; residues at e are 2 and 0, so EK(h)≠EK(k); trace 3 rejected. | Matches KS-v4 lines 870–881; none |
| §1.4 derivatives | z², z₁z₂, a=0 | second derivative 2; (1,1) derivative 1; ∇⁰ is the identity. | Agree; KS-v4 lines 879–903; none |
| §2.1 specialization | d=1, Γ=1, a=b=0; non-torsion x | scalar value of the section; no torsion splitting. Route's "§2.6" is the supplier's. | KS-v4 lines 904–922; C02 |
| §2.2–2.3 cap and index law | Γ=ℤ⊃mℤ; monodromy −1; μ₂⊃1 | H¹ restriction ×m; H⁰=0, H¹=ℤ/2; transfer ℤ→ℤ is ×2, so 1↦1/2 needs 2⁻¹. | Agree; source proof gap recorded; none |
| §2.6 de Rham cohomology of P♮^(n) | d=1, all n | truncated Koszul: dims n+1, n+2, 1; Euler characteristic 0; classes sit in Sym^n, so transitions vanish below degree 2. | Agree; none |
| §3.2 current sign | d=1, (p,q)=(1,0); Λ=2ℤ+iℤ | (−1)^(3d−1−p−q)=−1; C=−π/2, vol=πi·dx∧dy, total 2πi; Lebesgue Dirac πi. | Agree; none |
| §3.3–3.4, `kronecker_meromorphic_continuation`, `kronecker_functional_equation` | ℤ[i], h=1 and h=2; z=1/2, w=i/2; ν≠0; Poisson phase recomputed | Residue of K at 1: 4L(1,χ₄)=π; h=2: π/2=π/vol_H; K(0)=−1; phase e^(2πi⟨w,z⟩)=i; Gaussian moment transform has factor t^(−d−\|ν\|)/∏h. | Lean and README agree with each other and with the computation; none |
| §3.5 current | d=1; d=2, j=1; d=3 | ι_v(dz∧dz̄)=−v·dz; ι_v dι_v vol=C·v₁v₂(u₂−u₁)dz₁dz₂=−2C·v₁v₂u₁dz₁dz₂; (−1)^6·3!=+6. | README coefficient confirmed; source sign differs (Source issues); none |
| §4.1–4.2 orbit series | L=ℚ(ζ₈), α=(6,6), s=−3, −1; d=2 Jacobian | terms n^(−12)·n^12=1 (diverges), n^(−8); bound 1+w/2=−2; dlog(ur₁)∧dlog(ur₂)=−2·dlog u∧dlog r₁. | Agree; none |
| §4.3 explicit class and ε(d,a,β) | d=1: a=0,1,2,3, β=0,1; d=2 admissible; ℤ[i], c=(2), x=1/3, a=2 | (−1)^(a+β)a!; +1 for all at d=2; 4E₃(u)−8E₃(2u)=12E₃(1/3), E₃(1/3)=23.4697, class 563.27. | Agree; KS-v4 lines 1925–1977, 2094–2122; none |
| §5.1 periods and Betti duality | ℂ/ℤ[i], t=±1; ε=i; Ω=2, q=1 | q=t/π; ⟨γ,γ′⟩_top=2πit·Im(γ′γ̄); ξ∨(y)=2ti·ȳ; Ω∨=2ti=2πiq/barΩ; iΩ, iΩ∨; πi. | Agree; none |
| §5.2 normalization | d=1: α=3,β=0; α=2,β=1; v=0 | 2v/Ω³; 2πi·v/(Ω²Ω∨); 0. | Agree; KS-v4 lines 2353–2358, 2418–2426, 3397–3409; none |
| §5.3 partial L-functions | b=O_L; χ=N^m | coefficient 1; w=2m, L(χ,s)=ζ_L(s−m); ideals of [b] are λb, λ∈1+fb⁻¹ modulo O_f×. | Matches KS-v4 lines 2206–2225; none |
| §5.5–5.7 smoothing and integrality | χ=λ⁻⁴ on ℚ(i), c=(7), c′=(3); y²=x³−x; ℚ(√−3), y²+y=x³ | 80·(49−2401)=−188160; ×1/(2401·81)=−1280/1323; G₄(ℤ[i])=3.15121=ϖ⁴/15, value 1/10; −1/7 and 1−2⁻⁶=63/64. | Agree, including division by the unit order 6 at the unit 2; KS-v4 lines 2442–2475; none |
| §6.1 ordinary levels | ℚ(i): p=5, 3; i acting by 3 | (2+i)(2−i)=5, differentials 0 and 4; 3 inert, rejected; q_n∘[p_Σ^n]=[p^n]. | Matches KS-v4 lines 2633–2665; none |
| §6.3, §7.1 coinvariants | Γ=ℤ on ℤ₅ by 6; ℚ(√5,√−7), p=2; ℚ(ζ₈), p=5 | M_Γ=ℤ₅/5, M^Γ=0; disc 5·7·35=1225, weight N(φ)⁻¹=−1, coinvariants O/2; γδ₀=−δ₀, [δ₀]=0. | Agree; none |
| §7.2 translation | (1+√2)⁸ in 𝔽₂₅ | 577+408√2≡2+3√2; square 2+2√2; cube 1; index 3. | Agree; none |
| §7.3 partial Fourier transform | ℤ/3 character; ℤ/4→ℤ/2 inflation; n=0 | (0,1,0); (1/2,0,1/2,0); identity. Kernel inverse, factor p^(−dn). | Matches KS-v4 lines 3228–3238, 3313; N03 |
| §7.4 twisted moments | ρ=1; A=2,B=3,v=5,w=7 at a=3 and a=2 | recovers §7.1; −31 and +31. | Matches KS-v4 line 3244 on; none |
| §8.1–8.2 local factor and atoms | 𝔽₃ quadratic character; χ(c)=2, Nc=7; c=O_L | (ζ²−ζ)/3=−i/√3; 7−1/2=13/2 against 13; δ_c=0. | Matches KS-v4 lines 3637–3640, 3727; none |
| §8.3 smoothed measure | χ=λ⁻⁴, p=5, f=(3), c=(7), c′=(3); ψ(c′)=−1; ℤ₂× example | δ_c(χ)=−2352, ε=−1, product +2352; factors (12−24i)/5, (632−24i)/625, 80/81; 188160/81=62720/27; 82/81; δ₁+δ₋₁. | Agree; none |
| §8.5 interpolation | (α,β)=(3,0),(2,1),(4,0),(3,1); d=2; f=(1+i)³; BK-2010 parity | +1,+1,−1,−1; +1; μ₄→(ℤ[i]/f)× bijective, \|1/6−1\|₅=1/5<5^(−1/4); (−1)^(k+l−1)(k−1)! gives +2, −6. | Self-consistent with §§4.3, 7.1, 8.3, 8.4; C03 |
| Supplier AG2.0 against §8.3 avatar | u a local unit at p | r(Art_geo(u_p))=χ_p(u)·∏τ(u)^(−a); inverse character on ideal-theoretic inclusion gives χ_fin(u)·u^(β−α), χ_fin=χ_p⁻¹. | Agrees with the contract; none |

- Source locators checked against the text: 15 sampled targets (KS-v4 lines 256–364, 795–1000, 1105–1184, 1503–1541, 1560–1640, 1711–1776, 1925–2003, 2094–2144, 2153–2226, 2338–2372, 2407–2475, 2633–2668, 3228–3320, 3392–3440, 3624–3653, 3714–3740), plus BK-2010 Theorem 1.17, Proposition 3.3, Theorem 3.11 (pp.17, 36, 44; sign at line 1773) and the four Sch-2014 locators (pp.52–56, 81). Two page slips (N03); no statement unsupported.
- Library declarations opened at the pins: 8 of Tau Ceti (`AlgebraicInfinityType` at `InfinityType/Basic.lean:273`, `embeddingCharacter` :287, `baseChange` at `BaseChange.lean:160`, `IsAlgebraic` at `Algebraic.lean:60`, `idealCharacter_apply_toPrincipalIdeal_eq_embeddingCharacter_inv` at `Ideal.lean:264`, `unitaryPart`, `isInternal_weightSpace` :416, `endOfPoint_tmul_of_mem_weightSpace` :568) and 20 of Mathlib (among them `IsCMField` at `CMField.lean:69`, `unitLattice_span_eq_top` :317, `summable_norm_sub_rpow` :236, `dual_eq_mul_inv` :356, `coeIdeal_differentIdeal` :532, `AbstractMeasure` :40, `covolume` :72, `fourier_gaussian_innerProductSpace` :352). All exist with the properties the contracts state.
- Cross-roadmap citations resolved: 21 roadmaps, every cited section or heading found on main or at the open head (MordellLawrenceVenkatesh §§1.4, 1.6; ComplexMultiplicationAndExplicitReciprocity §1.2 with its five named paragraphs and basic API, §2.1; ShimuraVarieties §5.1 `CMType`; AG2.0; AnalyticNumberTheoryPartI §2.3a; AL.0.1, AL.1.3, AL.1.5; A2.2, A4.3, A5.1, A5.3; P0.1–P4.3; SchemeAndStackFoundations §§2.6, 2.7, 2.19, 2.20, 2.23; C1.1, C5.1, C5.2, C5.4; R07.1.7, .9, .13; PadicMeasuresIwasawaAlgebras §§0.1, 1.2, 1.7, 2.1, 2.2, 3.1; ThetaSeries 1A, 1E, 1F, 2A, 2C; PS.0, PS.1; Hyperfunctions CurrentResolution; AlgebraicTopology by its former numbering). The citations of this roadmap in AutomorphicCongruences (§8.5), ModularIwasawaMainConjecturesPartII (§3.3) and NonordinaryCMSpecialValues (§§6.2, 8.5) resolve.
- Dependency check: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Every supplier is on main, completed, or earlier in the merge order. The diff outside the folder is empty.
- Declared gaps: the README states ten (`ray-tower-tame-unit-kernel`, `equivariant-poincare-limit`, `borel-bundle-currents`, `current-residue-trace`, `torus-cap-projection`, `ordinary-cm-pairings`, `integral-multivariate-amice`, `bounded-fraction-criterion`, `hecke-motive-periods`, `critical-cm-deligne-period`), each with a named supplier and a single precise requirement; none asks for what a supplier already has (`amiceTransformEquiv` is ℤ_p-valued on ℤ_p; A4.3 gives perfectness only).
- Automatic checks: all pass on this head when rerun. Elaboration: `lake env lean` on `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/Suggested.lean` gives the two `sorry` warnings (lines 67 and 91) and nothing else. `#check @name` on the four declarations: the elaborated types carry `0 < d`, `[DiscreteTopology Λ]`, `[IsZLattice ℝ Λ]`, positivity of h and the dual-lattice hypothesis, as in README §§3.3–3.4; nothing lost. One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) closes neither theorem: no padding.
- Headline theorems: Kronecker continuation and functional equation (stated); the equivariant class, refined evaluation, de Rham polylogarithm comparison, explicit class formula, regularized integrality, Shimura algebraicity, Deligne period relation, Eisenstein measure and ray-class interpolation (each named in the module docstring with the missing carrier; none is statable at the pins, which have no abelian schemes with CM periods, completed Poincaré sheaves or ray-tower Galois groups).
- Duplication by object: no other roadmap on main or open states the Kronecker series, Weil's classification, the trace-dual Betti structure or a measure for Hecke characters of totally imaginary fields; GlobalNumberFields has no classification of types trivial on unit subgroups.

Overlap check: read NonordinaryCMSpecialValues, ModularIwasawaMainConjecturesPartII, GrossZagierAndArithmeticHeights, LFunctions, DirichletPadicLFunctions, AnalyticNumberTheoryPartII; the Kronecker series, the ordinary CM periods and the ray-class measure are owned here and cited by the first two; nothing has two owners.

Source independence: 21 passages compared with 2 sources (KS-v4, BK-2010), none shared beyond formulas and standard names; largest share KS-v4, 56 of 66 locators; contents compared with KS-v4 §§1–5: independent (9 layers and 46 sections against 5 sections and 27 subsections; the coarse order Layer 0 ↔ §1, Layers 1–2 ↔ §2, 3–4 ↔ §3, 5 ↔ §4, 6–8 ↔ §5 is forced by the *Needs:* chain 1.3 → 2.2 → 4.3 → 5.4 → 5.7 → 8.3; §1.2 ↔ 2.6 and §§5.1–5.2 ↔ 4.2 are reordered, KS §§2.1–2.2, 3.1, 5.2 are supplier material, and §§2.6–2.8, the Betti duality of 5.1, the descents of 5.4 and 8.3 and §8.4 have no source subsection).

Research link: The headline targets are the main theorems of Kings–Sprang (arXiv v4 2024, Annals 2025): Theorem 4.10, Corollaries 4.14–4.15 and Theorem 5.27, extending Katz's measure for CM fields (Hida–Tilouine 1993) and Bannai–Kobayashi 2010 at d=1; rests on the README's references and on KS-v4 and BK-2010 as read.

## Not verifiable

- The targets that go beyond the cited proofs (integral unit-index descent of §5.4 and §8.3, the uniform congruences of §8.4) are consistent with every instance computed, but a `sorry` build and scalar checks do not establish them.
- HK-2018 and HT-1993 were not opened (outside the sample); their locators in §§2.6–2.7 and 8.5 are unchecked.
- The description's count of earlier review rounds concerns the job board, not this head.

## For the human reviewers

- §8.5 (lines 1232–1233) states the interpolation formula with a sign ε(d,α−1,β) absent from the published KS-v4 Theorem 5.27. The derivative step it rests on (KS-v4 line 1977) was recomputed and BK-2010 line 1773 has the same parity at d=1.
- The folder is named `…PartII`, but no roadmap `AutomorphicPadicLFunctions` exists on main, in the merge order or among the open pull requests, and the README's title no longer says "part II".
- The package design lists twelve gap slugs; the README states ten. `unit-type-classification` is now the target §0.1 here and `hecke-padic-avatar` is replaced by the citation of AG2.0, so any request announced to GlobalNumberFields for them is obsolete.
