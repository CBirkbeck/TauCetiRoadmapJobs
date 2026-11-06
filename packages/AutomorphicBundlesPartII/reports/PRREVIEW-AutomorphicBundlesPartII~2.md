# Review of AutomorphicBundlesPartII (pull request #1823 at 2a5bbb5)

**Verdict:** needs changes

Incremental re-review of the 46 lines of `TauCetiRoadmap/AutomorphicBundlesPartII/README.md` changed since 6787f01 (`Suggested.lean` is untouched). The four findings of the previous review were checked one by one against the sources and the suppliers at their heads; three are repaired in full and one leaves two residues, which are the two findings below. Both are P3 wording defects in the repaired passage and its one consumer; nothing blocking remains. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P3) — §5.0 writes the augmentation-ideal splitting with Δ where the cover's group is Δ(Π₀)

**Location.** `README.md` §5.0, line 873: "the augmentation-ideal splitting f_*O_T≅O_S⊕(I_Δ⊗_(ℤ[Δ])f_*O_T) of the cover, checked étale-locally where f_*O_T is the regular module O_S[Δ]".

**Claim.** The splitting of BCGP21 Lemma 3.8.5 is applied with the group Δ.

**Witness.** The same paragraph defines Δ=(O_F)^(×,+)_((p))/O_F^(×,+)(Kᵖ) (BCGP21 (3.3.14), b4cc8b01 line 2316) and says the cover f: X_(K,c)→X^(G₁)_(K,π(c)) has group Δ(Π₀) (line 2686–2687). Δ is infinite (for F=ℚ it is p^ℤ) and permutes components; it does not act on a single component, so f_*O_T is a ℤ[Δ(Π₀)]-module, not a ℤ[Δ]-module, and I_Δ⊗_(ℤ[Δ])f_*O_T is not defined. Lemma 3.8.5 (line 2696) is stated for the Galois group of the cover.

**Repair.** In that sentence replace the three occurrences of Δ by Δ(Π₀): "f_*O_T≅O_S⊕(I_(Δ(Π₀))⊗_(ℤ[Δ(Π₀)])f_*O_T) … the regular module O_S[Δ(Π₀)]". The Check at line 888 (group C_p) and the API bullet at line 881 are unaffected.

## R02 (P3) — §5.1 still calls the §5.0 descent a "prime-to-p stabilizer" comparison

**Location.** `README.md` §5.1, line 919: "On a quotient apply the prime-to-p stabilizer direct-factor comparison of §5.0 to the completed coefficient."

**Claim.** The direct-factor comparison of §5.0 carries a prime-to-p condition on the component stabilizer.

**Witness.** §5.0 at this head (line 873) states the comparison "at every reasonable level, with no hypothesis on p", and the Conventions (line 31) and §5.13 (line 1106) say the same; the phrase is the one residue of the deleted hypothesis p∤#Δ(Kᵖ) (the previous review's R01). `grep -n "prime-to-p stabilizer"` finds only this line.

**Repair.** Write "apply the compactified direct-factor comparison of §5.0 to the completed coefficient."

## Previous findings

- R01 — partly repaired: the hypothesis p∤#Δ(Kᵖ) is gone from the Conventions, §5.0 and §5.13; §5.0 now names Δ, Δ(Π₀) and Δ(Kᵖ) after BCGP21 (3.3.14)–(3.3.16), proves freeness on the compactification by Lemma 3.5.3 and splits by Lemma 3.8.5; the averaging Check is replaced by the C_p-torsor Check. Residues: the splitting is written with Δ instead of Δ(Π₀) (R01 above) and §5.1 still says "prime-to-p stabilizer" (R02 above).
- R02 — repaired: "μ cuspidal of orthogonal type, hence the automorphic induction of a Hecke character ψ of a quadratic field K … Ind_(G_K)^(G_ℚ) of the finite-order character … no modular realization of μ is used"; the weight-one gap is now tied to §8.2's Klingen terms.
- R03 — repaired: no occurrence of `GSp4ClassificationInputs` remains; every citation reads "§11.1 under the symplectic classification contract of its §§11.0g–11.0h".
- R04 — repaired: §2.3 "pp. 396–398" and §1.6 "pp. 395–396, 398–400" are now right. The §6.4 item was a false lead: H90 Theorem 2.7 begins at line 2242 under the printed header 58 (line 2229) and runs onto p. 59; the line-2267 witness was the in-text back-reference. The unchanged locator "Theorems 2.4.4 and 2.7, pp. 57–58; Proposition 2.7.2 and (3.0.1), p. 59" is correct.

## Verified sound

**Gate.** The worker's gate at 2a5bbb5 passes every check (set_option=0, sorry-data=0, imports=0, depcheck=0, outside-folder=0, build=0). Dependency check run by this review: `depcheck: 241 roadmaps, 2362 edges, 0 problem(s)`, no UPWARD or CYCLE line, no `moved:` line. `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds README.md, Suggested.lean and metadata.toml only.

**Lean.** `lake env lean` on `Suggested.lean` (unchanged since 6787f01): the only diagnostic is `warning: declaration uses sorry` at line 73. The `#check @` probe of the three declarations re-elaborated: `dvrCoefficientRing : (O : Type u) → [CommRing O] → O → ℕ → Type u`; `integerCoherentCohomology : (R) → [CommRing R] → (X : Scheme) → [X.Over (Spec R)] → X.Modules → ℤ → ModuleCat R`; `finiteCoefficientSerreDuality` quantifies over `[IsDomain O] [IsDiscreteValuationRing O]`, `Irreducible ϖ`, `n : ℕ`, `X` over `Spec (O ⧸ span {ϖ^n})`, `[SmoothOfRelativeDimension d]`, `[IsProper]`, `F` locally free of finite presentation, `i : ℤ`, concluding `Dual_A (Hⁱ(X, F ⟹ Λ^d Ω)) ≃ₗ[A] H^(d−i)(X,F)`: equal to the README §1.6 statement, no binder lost. The one-tactic padding probe and the library-name checks of the previous report (`cohomologyBaseModule`, `cohomologyMapBaseLinear`, `cohomologyZeroBaseLinearEquiv`, `cohomologyδBaseLinear`, `SheafOfModules.exteriorPower`, `Scheme.relativeDifferentials`, `instMonoidalClosed`, `cohomologyOneDualEquivCohomologyZero`, `CochainComplex.isKProjective_of_projective`) stand: the file and the pins are unchanged.

**Sources read at their locators for the changed passages.**
- §5.0 and Conventions: BCGP21 (3.3.14)–(3.3.16) at b4cc8b01 lines 2316–2318, printed p. 210 (marker 58): Δ, Δ(Π₀)=O_F^(×,+)(Π₀)/O_F^(×,+)(Kᵖ) the stabilizer of a connected component, Δ(Kᵖ) that of a geometrically connected one, "these last two groups are finite" (lines 2319–2322). Lemma 3.5.3 at line 2480, pp. 214–215: Δ acts freely on X_(K,Σ); its proof treats the nontrivial strata (lines 2481–2497). Proposition 3.8.3 at line 2655, p. 219, splitting in D(ℤ_p) with no hypothesis on p; its proof (p. 220) makes X_(K,c)→X^(G₁)_(K,π(c)) a finite étale cover with group Δ(Π₀) (line 2687); Lemma 3.8.5 at lines 2696–2703, pp. 220–221, f_*O_T=O_S⊕I_G⊗_(ℤ[G])f_*O_T checked étale-locally on the regular module. The locator "pp. 219–221" and "(3.3.14)–(3.3.16), p. 210, Lemma 3.5.3, pp. 214–215" are right.
- §5.13: BCGP21 Proposition 3.9.15 at lines 3106–3117, pp. 231–232: Hecke action on RΓ(X^(G₁),ω^κ(−D)) by restriction to the "G₁ direct factor", no condition on p.
- §7.0 case (c): CG20 fff30587 lines 2140–2142, p. 54: case (c) is μ|·|^(1/2)⊞μ|·|^(−1/2) with μ cuspidal of orthogonal type, induced from a quadratic extension of ℚ; cases (b), (d), (e), (f) at lines 2134–2146 as the README states; proof of Theorem 7.11 runs pp. 54–55 (markers 54 at 2104, 55 at 2147). BCGP21 Lemma 2.9.1 unchanged.
- §8.2 and the weight-one contract: CG20 Lemma 7.10 and proof at lines 2021–2054, pp. 52–53: "holds in all weights and in all prime-to-p levels"; the nerve term for the Klingen parabolic has G_h=GSp₂=GL₂ with V_λ(h,w) the canonical extension of an automorphic vector bundle on the modular curve (lines 2042–2046), and the Galois representations attached to its Hecke eigenclasses are asserted, not constructed (lines 2051–2054), which is what the contract supplies.
- §8.7 (sample target in the changed passage): CG20 proof of Theorem 7.11, pp. 54–55, using Theorem 5.2(1) (line 2158) and Theorem 5.6(3) (line 2155). §8.9 (sample target): BCGP21 Corollary 3.10.5 at line 3302, p. 237 (marker 85), h¹=l₀h⁰ under hypothesis (2) of Theorem 3.10.1, proof via Lemma 2.9.1 and Theorem 2.9.3; P20 Proposition 15.2.4.1 at line 4986, p. 109, m_h(π_f)=m_g(π_f)=1.
- R04's pages: CG18 c0ba8de0 (marker N = printed N+296): Lemma 7.5 line 4001 (p. 396), Lemma 7.6 line 4035, Lemma 7.7 line 4058 (p. 397), proof to p. 398; §7.2 duality statement line 4100 (p. 398). H90 ead5b841: Theorem 2.4.4 line 2203 (header 57), Theorem 2.7 lines 2242–2256 (header 58), Proposition 2.7.2 line 2268 and (3.0.1) line 2275 (header 59).

**Cross-roadmap citations resolved at their heads.** EndoscopicTransferAndUnitaryTraceComparison (#999): §11.0g "Symplectic and orthogonal local classification" (line 4409), §11.0h "Symplectic and orthogonal global classification and the rank-four transfers" (line 4423), §11.1 (line 4440), whose *Hypotheses* paragraph reads "the symplectic classification contract of §§11.0g–11.0h": the README's new phrase is the supplier's own. ArithmeticGaloisRepresentations (#856): §1.12 "Restriction and induction" (line 1440) states semisimplicity of `Ind_H^Γ U` for `H` open of invertible index, which is the induction the dihedral summand needs. WeightsInEtaleCohomology (#1001): R34.6 "Eigenform applications" is present (line 17 of its layer table); the weight-one realization is still absent there, so the gap is still a gap. ShimuraCompactifications, AutomorphicBundles, SchemeAndStackFoundations, DeformationAndDerivedPatchingAlgebra and the rest are untouched by the diff and were resolved in the previous report.

**Declared gaps.** The ten slugs of `design/plan.json` are unchanged and each has its contract in the README's supplier subsection. `gap:classical-weight-one-realization` is now consumed by a named target (§8.2's Klingen terms with a weight-one GL₂ bundle, line 1469) and the contract says so (line 133); the previous review's condition for keeping it is met. Minimality: a weight-one Klingen term exists (ω(1,1)|_∂ has det ω|_∂=ω_E, weight 1), so the contract asks for something a target needs.

**Ownership.** The diff adds no construction; the dihedral induction is cited from ArithmeticGaloisRepresentations §1.12 and the finite-order class-field characters from the suppliers already cited. The previous report's ownership search (GSp4NonregularModularityLifting #1817 imports these objects from this roadmap) stands.

**Adversarial table.** Rows for untouched statements are carried from the previous report (`PRREVIEW-AutomorphicBundlesPartII~1`, "r1"); rows for changed statements are computed here.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §5.0 direct-factor comparison (changed) | split C_p-torsor over 𝔽_p, group of order p | 𝔽_p[C_p]=𝔽_p·1⊕span{g−1}: dims 1+(p−1)=p; ε(1)=1≠0 so 1∉I; averaging needs 1/p, absent | splitting exists with p=#G; Check correct |
| same | trivial cover G=1; G=S₃ over 𝔽₃ | I_G=0, f_*O_T=O_S; 𝔽₃[S₃]=𝔽₃·1⊕I with dim I=5, a splitting of O_S-modules only (Lemma 3.8.5 asserts no more) | true |
| §5.0 groups (changed) | F=ℚ, any Kᵖ | Δ=ℚ^(×,+)_((p))/{1}=p^ℤ≅ℤ infinite; Δ(Π₀), Δ(Kᵖ) finite (BCGP21 line 2319) | I_Δ⊗_(ℤ[Δ]) on one component undefined: R01 |
| §5.13 descent (changed) | hyperspecial level, any p | Prop. 3.9.15 restricts 1KᵖgKᵖ to the G₁ factor with no condition (lines 3113–3116) | true; consistent with §5.0 |
| §7.0 case (c) infinitesimal character (changed) | a=2, μ of character (x,y) | {x±1/2, y±1/2}={3/2,3/2,1/2,1/2} ⇒ x=y=1; (x,y)=(1,0) gives {3/2,1/2,1/2,−1/2} ≠ | μ has (1,1), μ⊗|·|⁻¹ has (0,0) |
| same at a=3 | entries 3/2, −1/2 | x+1/2=3/2 forces x−1/2=1/2≠−1/2 | case (c) empty, as the Check says |
| §7.0 case (c) archimedean types (changed) | K imaginary, ψ finite order; K real, ψ_∞=(1,sgn); (1,1); (sgn,sgn); ψ_∞=(|·|^(it),|·|^(−it)), t≠0 | Ind(1,sgn): weight-one limit of discrete series, character (0,0); Ind(1,1): even Maass λ=1/4; Ind(sgn,sgn): odd Maass λ=1/4; last has (it,−it)≠(0,0) | the two subcases are exactly those listed; negative control excluded |
| §7.0 case (c) Galois side (changed) | p inert in K; p=𝔭𝔭̄ split | Ind ψ at Frob_p: [[0,ψ(𝔭)],[1,0]], trace 0, det −ψ(𝔭); split: diag(ψ(𝔭),ψ(𝔭̄)), trace a_p | Check correct; wrong model trace ψ(pO_K) excluded |
| §7.0 case (c) twist | μ=(μ⊗|·|⁻¹)⊗|·| | ρ_μ=Ind(χ_ψ)⊗ε^(±1), ε the class-field character of |·| | matches "twisted by the class-field character of |·|" |
| §8.2 weight-one Check (changed) | ω(k,k)=det^k; ω(a,2)=Sym^(a−2)⊗det²; (a,0) | ω|_∂ has graded pieces ω_E, O so det ω|_∂=ω_E: weight k; pieces of ω(a,2)|_∂: ω_E^(2..a), all ≥2; (a,0): weights 0..a include 1 | Check correct; weight-one terms occur, gap needed |
| §8.7, §8.9 (contract rename only) | — | §§11.0g–11.0h at #999 lines 4409, 4423; §11.1 line 4440 | citations resolve |
| §1.6 / `finiteCoefficientSerreDuality` | A=ℤ/9, X=ℙ¹_A, F=O, d=1; n=0; d=0; i<0; i>d | r1: i=0: 0 and 0; i=1: A and A; n=0 both 0; A²≃Hom(A²,A); Dual(0)=0 vs 0 | true (r1) |
| §1.4, §1.5, §1.1–1.3 Checks | O=ℤ₃ n=0,1,2; 𝔽₅ δ=2; g=1 ψ₁=2,4 c=3; P_(123); (5,2) x=2 | r1: 𝔽₃, ℤ/9, 0; 3·2≡1; 3/2,3/4, product 3; f(m)=1 vs 0; 2⁷/4³=2 | Checks correct (r1) |
| §2.2, §2.3, §2.5, §3.5, §3.6 | trivial C₂-torsor/𝔽₂; Δ=1 N=O/ϖ n=2; R=𝔽₂[t]/t²; k=𝔽₂ Δ=C₂; O=ℤ₃ | r1: free rank 1; k not free over O/ϖ²; Tor₂=k→H₁⊗k iso; k⊗^L k = k in every degree; k in degrees −1,0 | Checks correct (r1) |
| §3.9–§3.12, §4.2, §4.3 | Bl_pt ℙ²; Spec k→𝔸¹; double cover; t↦t²; A=k[x]; F=(O/ϖ)[−1]; q=2 (1,3,2), q=1 (1,4,4) | r1: coker O_E(−1), H⁰=H¹=0; i^!O=k[−1]; trace 2, char 2: 0; (t)⊄(t²); x⁻¹∈H¹_(x); U=0,1 both; X⁴−3X³+14X²−24X+64; (X−1)⁴ | Checks correct (r1) |
| §5.3–§5.8 ranges | p=7, μ=0, t=1,2; (3,1),(6,1),(7,1); (4,2),(6,1),(7,1); (4,4),(7,4),(8,4); p=5 | r1: (4,2),(3,1); (5,3),(4,2); (5,5),(4,4); α+β=0,3,4<4; (0,0,1),(2,1,1); t=1, α=0,3,4; a∈[4,5], (p+1)/2=3 | matches CG20 pp. 22–24 (r1) |
| §5.16, §6.2, §6.3 | T=O[t]/(t(t−ϖ)); sl₂; f(y)=y, dy/y² | r1: characters 0,ϖ≡(ϖ,t), T⊗ℂ=ℂ²; dim sl₂/so₂=2, dim p_o/k_o=1; (y∂_y)ⁿy=y, ∫(log y)^(−2n)dy=∞ | Checks correct (r1) |
| §7.0 spin orbit, split weight, chambers; §7.2; §7.3 | (4,2),(5,2),(3,2;0); (a,2),(a,3−a),(1,b≤1); R_sing=5 | r1: (3/2,3/2,−3/2,−3/2) sum 0; (3/2,3/2,−5/2,−5/2); (7/2,7/2,3/2,3/2); chambers {0,1},{1,2},{0,1,2,3}; k=4 ok, k=3 fails | matches CG20 (r1) |
| §8.4 Satake, §8.7 algebraicity, §8.8 gaps and twist, §8.9 l₀ | q=2 α=1 β=2 u=4 D=2; (a,2); R_sep=3 R_gap=5; z=2; two real places | r1: X⁴−15X³+70X²−120X+64, T₂=30; (0,0,1−a,1−a)∈ℤ⁴; pairings 5,7,9,2 fail; |z|²=4; (d,2d),(d,d),(d,0) | Checks correct (r1) |

## Not verifiable

- GK19 Remark 10.1.3, p. 962 (§7.1): settled as uncertified in the manifest; cited by locator only (unchanged).
- H90 is an OCR'd scan: theorem numbers and printed headers were read; the fine print of Theorems 2.4.4 and 2.7 was checked for existence and page only.
- Ownership against open pull requests whose files this brief does not give was not re-searched this round; the previous report's search over the index stands for the unchanged constructions, and the diff adds none.

## Source issues

- none (the three entries of the previous report stand; the passages re-read this round contain no new one)
