# Review of GeneralizedCohomology (pull request #2535 at aa14dec)

**Verdict:** accepted

**Summary.** Accepted with no finding: every Check and convention I recomputed across the five layers holds, the fifteen sampled sections agree with their sources at the cited locators, and the revised sentence of G3.9 is true and matches BordismFormalGroups F2.2 on main. Two small corrections, neither blocking: `rationalHurewicz` is still stated only for spaces in the lowest universe (carried over from the previous review, this head being unchanged), and the sentence after the new G3.9 pointer says "these comparisons" without saying which. One point about ownership against two open pull requests is left for a human to decide.

## C01 — `rationalHurewicz` is stated only for spaces in `Type`, while G5.6 states it for every pointed space

This is the previous review's correction; the head has not changed, so it stands. The binder is `{X : Type}` with coefficients in `ModuleCat.{0} ℚ` (`Suggested.lean`, line 204), whereas G5.6 (README line 4219) says "a pointed space X" and every other declaration of the file about a space, pair or simplicial set is universe-polymorphic. An implementer who proves the Lean statement has proved less than the prose. I elaborated the polymorphic form at the pins: `{X : Type u}`, `C := ModuleCat.{u} ℚ` and `ModuleCat.of ℚ (ULift.{u} ℚ)` in place of `ModuleCat.of ℚ ℚ`, the rest unchanged, gives only the `sorry` warning. Alternatively the README could say that the Lean statement is for spaces in the lowest universe.

## C02 — After the new pointer to F2.2, "these comparisons" in G3.9 no longer has a clear referent

G3.9 ends "Degreewise finite generation plus these comparisons supply the localized/completed arithmetic descent used by TangentialBordism" (README lines 2422–2424). Before this change "these comparisons" included the nilpotent-completion comparison that G3.9 then proved. Now the preceding sentence hands that comparison to BordismFormalGroups F2.2 (its lines 749–755), so a reader of TangentialBordism's *Needs:* lines, which cite G3.9, cannot tell whether G3.9 still supplies it. Naming the inputs would settle it, for example "Degreewise finite generation, the Hom/Ext sequence and the completed smash comparisons above, with F2.2's comparison where the nilpotent completion is needed, supply …".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| G1.3 cofibers, Mayer–Vietoris (251–289) | S¹ by two arcs; cover (X, ∅); May's ψ | (a,b) ↦ (a−b, a−b) has cokernel ℤ = H¹(S¹). May p. 147: ψ(α,β) = i*α − j*β. Puppe sequence at Hatcher p. 398. | Pass |
| G1.5 unique smash lift (324–354) | X=Y=S¹; X=S⁰; U=V=ℝ | H̃²(S¹∨S¹)=0, H̃²(T²)=ℤ=H̃²(S²). (Y⊔Y)/(Y⊔pt)=Y. (ℝ²)⁺=S²; (ℝ²)₊ not compact. Hatcher 4I.1, p. 467. | Pass |
| G1.7 sphere and circle (382–406) | KU on S¹; r=0; HF₂ | KU⁰(S¹)=ℤ⊕0, KU¹(S¹)=0⊕ℤ. 2σ²=0 is vacuous mod 2. Suspension isomorphisms in Hatcher's axioms, p. 448. | Pass |
| G2.2 sphere modules (478–515) | Day square at level 2; transposition on S² | (0,2),(2,0) give one S² each, (1,1) gives \|Σ₂/(Σ₁×Σ₁)\|=2: four copies. Degree −1. HSS 3.4.4 p. 35; Shipley 3.1, 3.2; Hovey 7.7–7.11. | Pass |
| G2.3 stable model structure (517–548) | λ:F₁S¹→F₀S⁰ at level 0; S→* into HZ | Level 0: point → S⁰. Naive π₀: ⊕ℤ against ℤ (HSS 3.1.10, p. 23). [S,HZ]=ℤ against 0. | Pass |
| G2.5 signs and Freudenthal (608–761) | m=n=2; m=3; m=4; X=S², S¹ | Inversions binom(m,2)·binom(n,2): 1 → −1; 3·binom(n,2); 6 → +1. π₃S²=ℤ → π₄S³=ℤ/2 onto. | Pass |
| G2.8 Γ-spaces (842–906) | M=ℕ; M=0; discrete A | ℕ special, π₀ not a group; completion ℤ. MMSS 18.2, 18.3, 18.8 pp. 53–54; Elmendorf–Mandell 1.1, 1.2, 1.4. | Pass |
| G2.11 Checks (1911–1926) | N[1]; Λ²₀ ↦ (0,1,0); C/D for torsion D; even-χ finite spectra | Core = two points. No edge 1→0. colim(ℤ →2 ℤ →3 …)=ℚ. χ(X⊕ΣX)=0, χ(S)=1. | Pass |
| G3.4 telescope and Milnor (2076–2120) | Tower ×2, ×3, ×4,…; constant tower | lim=0, lim¹=Ext(ℚ,ℤ)≠0; constant: lim¹=0. Hatcher 3F.8 on p. 314 for increasing subcomplexes. | Pass |
| G3.5 open covers, gap refinement (2122–2182) | ρ≡1; two arcs; f=Σkφ_k; {0}∪[1/i,1] | gap{i}=1. gap{1}=max(0,ρ₁−ρ₂), gap{1,2}=min(ρ₁,ρ₂). Σk(w_k−w_(k+1))=Σw_k=1. f ≥ k_min. Two components against one. | Pass |
| G3.6 phantom map (2184–2223) | Constant-one class in coker of a_i−(i+2)a_(i+1) | Preimage forces a₀ ≡ Σ_(k≤n)k! mod (n+1)!; 0<s_n<(n+1)! and s_n increases, so no integer a₀. Schwede II.5.6(ii), p. 257. | Pass |
| G3.8 Checks (2375–2385) | ×2 tower of Hℤ; (1,0,1,0,…) | lim=0, lim¹=ℤ₂/ℤ. Σ4^r=−1/3 ∉ ℤ. π₁S=ℤ/2 (Hatcher 4J.4, p. 474). | Pass |
| G3.9 revised sentence (2420–2422) | X=Hℤ; X=KU | Hℤ: both completions have π₀=ℤ_p. KU: HF_p∧KU≃0, yet π₀KU^∧_p=ℤ_p. F2.2 states bounded-below (BordismFormalGroups 749–755). | Pass; C02 |
| G3.10 skeletal Milnor (2443–2486) | CP∞→K(ℤ,2); surjective towers | Components 0←ℤ←ℤ, limit ℤ; π₁Map(CP^m,K(ℤ,2))=H¹=0. Hatcher pp. 312–313, Example 0.6 p. 6, Theorem 3.19 p. 220. | Pass |
| G4.0 conventions (2500–2793) | Sp(N), N=1,2; Stiefel; basis (1,j); reflection | N(2N+1)=3,10. N(2N+1)−(N−r)(2N−2r+1)=r(4N−2r+1). j·i=−k. −conj(q_L(−w̄)q_R⁻¹)=q_R w q_L⁻¹. | Pass |
| G4.2 Thom spaces (2831–2858) | Zero bundle; ε^r over a point; γ over RPⁿ | B₊; S^r; RP^(n+1). Hatcher defines T(E) on p. 441. | Pass |
| G4.5 projective-bundle classes (2926–3086) | Line bundle; quaternionic line; torus | Σc_i(V)c₁(L*)^(r−i)=0 gives a_i=(−1)^i c_i. c(Rξ⊗ℂ)=c(Cξ)², p₁=−2a₁=2e^std. Roots x,−x: a₁ ↦ −x². | Pass |
| G4.6 homotopy of GL_k(ℝ) (3088–3152) | k=0,…,5; TS⁴; r₃ | Table agrees. TS⁴: (q,q⁻¹), class (1,−1), so SO(4)→SO(5) adds. r₃=−1·rotation: trivial on π₃. Hatcher pp. 293, 299; VBKT p. 75. | Pass |
| G5.0 signs (3167–3329) | ε_k=(−1)^(k(k−1)/2) | ε_kε_(k+1)(−1)^k=(−1)^(k²+k)=1. π_iBO for i ≤ 8 against the 3-connected cover. | Pass |
| G5.3 Thom spectra (3403–3454) | Point; MO; empty base | colim Σ⁻ⁱΣ∞Sⁱ=S. H₀(MO;ℤ)=ℤ/2 against H₀(BO;ℤ)=ℤ. Schwede I.1.16–1.18, pp. 17–19. | Pass |
| G5.4 examples (3456–3609) | [ℍ]=ab⁻¹; Pin⁺ | a·ab⁻¹=4; u²·2u²u⁻⁴=2. star(ιv)ιv=−Q(v). HSS 6.2.3 p. 67 says commutative symmetric ring spectra. | Pass |
| G5.5 Checks (3611–4187) | Cl₂ matrices; z=v+iw; h₁, h₂; ε_(r+s) | e₁e₂=diag(−i,i)=−e₂e₁. ‖z‖_H=√2, Taylor norm 1. ∫h₁²=1. binom(r+s,2)=binom(r,2)+binom(s,2)+rs. | Pass |
| G5.7 Checks (4580–4587) | U=ℝ, ℓ=0; S¹ ⊂ ℝ² | F_R(R∧Σ∞S¹,R)=Σ⁻¹R=Σ⁻¹P_R(ℝ). Σ⁻²Σ∞(S²∨S¹)=S∨S⁻¹. | Pass |
| `kanQuillen_modelCategory` | Pins; Δ[1]→Δ[0]; ∂Δ[1]→Δ[0] | No `ModelCategory SSet` in either library. Contractible against two components. `simp`, `rfl`, `infer_instance` fail. | Pass |
| `sSetTopAdj_unit_weakEquivalence` | X=Δ[0]; probes | Unit is an isomorphism there. `infer_instance` cannot synthesize; no Tau Ceti file states it. | Pass |
| `homotopyExcision` | m=n=0; S²=D²∪D², m=n=1 | Both antecedents false, nothing asserted. Degree 2: ℤ→ℤ onto; degree 3: 0→ℤ not. Matches Hatcher 4.23. | Pass |
| `numerableFiberBundle_hurewicz` | ι=∅; F=∅ | Σρ_i=1 forces B=∅, so Z=∅. Supports cover, so trivialization sources cover Z and p is continuous. | Pass |
| `homologyComparison` | Empty complex; axioms at the pin | Additivity is for index sets in `Type u` (EilenbergSteenrod.lean:214); class has homotopy, excision, additivity, pair sequence (:297). | Pass |
| `stableStem_isOfFinOrder` | (n,k)=(0,3),(1,4); exceptional case | π₄S³=π₆S⁴=ℤ/2. Stem j=n+1 ≤ k−2, so k+j ≠ 2k−1 and k ≥ j+2. | Pass |
| `rationalHurewicz` | k=0,1,2,3 | 2·0−1=0 in ℕ: nothing. k=1: H₁ spanned by π₁. k=3: isomorphism to degree 4, onto in 5. | Pass; C01 |
| Headlines named as not statable | Suspension, telescope, stable equivalences at the pins | Only `Topology/Sphere/Suspension.lean`; no mapping telescope; no stable equivalences or Ω-spectra in Tau Ceti. | Pass |

- Earlier findings: the previous review of this folder raised none. Its one small correction (C01) is not repaired, the head being the same.
- Source locators checked against the text: 64, in 11 sources. HatcherAT 19, HatcherVBKT 6, May 3, HSS 7, SchwedeSymSpec 10, MMSS 3, ElmendorfMandell 4, HebestreitSagave 3 (§6.3, Corollary 6.7, §7.1), Shipley 3, HoveyGeneralSpectra 4, HatcherSSAT 2. All agree with the README, printed pages included.
- Library declarations opened at the pins: 30, among them `TopPair.HomologyPretheory.IsAdditive` and `IsExtraordinaryEilenbergSteenrod` (Mathlib EilenbergSteenrod.lean:214, 297), `PartitionOfUnity.gap` and `gapPartition` (Tau Ceti Gap.lean:67, 419), `TopPair.ofInclusion` (TopPair.lean:48), `HomotopyGroup.hurewiczHom` (Hurewicz/Basic.lean:652) and the compression lemma (Relative/Disk.lean:207).
- Cross-roadmap citations resolved: BordismFormalGroups F2.2 on main (lines 659–765); the readers of G3.9 on main (TangentialBordism, EnhancedDerivedSheaves, BordismFormalGroups); the supplier sections named in the contracts were not re-read beyond those.
- Automatic checks: every check passes, in the worker's record and in my own run. Nothing changes outside the folder; the change is 3 insertions and 5 deletions in the README.
- Dependency check output: `depcheck: 200 roadmaps, 2207 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: seven `sorry` warnings and nothing else. `#check @name` on all ten declarations shows every binder of the README statements. One-tactic probes (`simp`, `rfl`, `infer_instance`) close none of the seven theorems.
- Pull request text: title and description agree with the head; no section, supplier contract or Lean declaration changes.

Overlap check: read SimplicialCategories, KanQuillen and EnrichedLocalization (#2269), Straightening, InfinityCategoryFoundations and LimitsAndKanExtensions (#2270), and StableHomotopyKTheory, TangentialBordism, AlgebraicTopology and BordismFormalGroups on main. The Kan–Quillen structure on the realization class and the Kan-group criterion: owner here (G2.1); KanQuillen builds its structure on a different class and names G2.1 for the comparison. The Bergner and Joyal model structures, straightening and the HTT 4.2.4.4 diagram comparison: owner here (G2.11, on main); #2269 and #2270 plan them too and their READMEs do not cite G2.11, which is theirs to repair since main is earlier. The comparison of derived and HF_p-nilpotent completion: owner BordismFormalGroups F2.2, cited here. Nothing else is shared.

Source independence: 72 passages compared with 11 sources (the 64 locators and 8 prose passages: the homotopy excision statement, the Hurewicz–Dold paragraph, the λ Check of G2.3, the Γ-space definitions of G2.8, the Brown axioms of G3.1, the Thom-space sentence of G4.2 and the docstrings of `homologyComparison` and `stableStem_isOfFinOrder`). None shares wording beyond the hypotheses of Hatcher's Theorem 4.23 and a seven-word phrase of HSS Example 3.1.10, both forced by the mathematics. The largest share is LurieHTT, 28 of about 103 source citations in the layers, all inside G2.11, with HatcherAT next at 25. Contents compared with LurieHTT and HatcherAT: independent. G2.11 starts from HTT's Appendix A.3 and places the Joyal model after unmarked straightening, and Layers 2 and 5 have no Hatcher chapter.

Research link: Layers 2–3 give the stable homotopy category of Hovey, Shipley and Smith (2000) and the derived p-completion that BordismFormalGroups F2.2 uses for the Adams spectral sequence; G5.5 uses the operator model of KO of Joachim (2001) and Hebestreit–Sagave (2020). This rests on README lines 49–53 and 3732–3738 and on BordismFormalGroups F2.2.

## Not verifiable

- QuillenHA, ABSClifford, McDuffSegal, SegalCategories and JoachimKO are recorded as uncertified and were not read. The sampled sections 2.8 and 5.5 cite Segal §1, McDuff–Segal and Joachim §§2–4 by locator alone.
- The excision axiom of Mathlib's homology pretheories was read only as far as its class statement; that it covers the cell-attachment step of `homologyComparison` was not checked against the definition of an excisive map.

## Source issues

- none

## For the human reviewers

- Open pull requests #2269 and #2270 plan the Bergner and Joyal model structures and straightening, which G2.11 on main owns (README lines 4685–4691), and neither cites G2.11. Which side keeps them is not settled in either text.
