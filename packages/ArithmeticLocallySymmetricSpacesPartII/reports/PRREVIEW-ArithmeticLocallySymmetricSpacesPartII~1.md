# Review of ArithmeticLocallySymmetricSpacesPartII (pull request #2401 at b6c4a2b)

**Verdict:** needs changes

## R01 (P3) — `weightRep` restates Tau Ceti's `Representation.piTensorProduct`

**Location:** `TauCetiRoadmap/ArithmeticLocallySymmetricSpacesPartII/Suggested.lean` lines 64–65, `PiTensorProduct.mapMonoidHom.comp (MonoidHom.pi fun σ => …)`; README §3.1 line 421, "the factors are assembled by Mathlib `PiTensorProduct.mapMonoidHom` and `MonoidHom.pi`".

**Claim:** The body of `weightRep` writes out by hand a definition that already exists in the pinned Tau Ceti. The README should cite that definition and use it, not restate it.

**Witness:** Tau Ceti `Representation.piTensorProduct` (TauCeti/RepresentationTheory/Tensor/Pi/Basic.lean:48) is `PiTensorProduct.mapMonoidHom.comp (MonoidHom.pi ρ)`. Its `piTensorProduct_apply_tprod` (line 58) is exactly §3.1's pure-tensor API bullet.

**Repair:** Add `public import TauCeti.RepresentationTheory.Tensor.Pi.Basic` and make the body `Rep.of (X := PiTensorProduct ℂ fun σ : F →+* ℂ => Sym[ℂ]^(t σ) (Fin 2 → ℂ)) (Representation.piTensorProduct fun σ => (TauCeti.symPowerRep ℂ 2 (t σ)).comp (embeddingStdRep σ Γ))`. I tested this: it elaborates, both theorems keep their types, and the action is pointwise equal to the current one. In the README:
- In §3.1, write "the factors are assembled by Tau Ceti `Representation.piTensorProduct`".
- Under From Tau Ceti, cite `Representation.piTensorProduct` and `Representation.piTensorProduct_apply_tprod` with their file.
- In the §3.1 *Needs:* line, the Layer 3 Dependencies and the From Mathlib paragraph, replace `PiTensorProduct.mapMonoidHom` and `MonoidHom.pi` with the Tau Ceti declaration.

## R02 (P3) — §1.1 *Needs:* omits the supplier of the canonical topology

**Location:** README §1.1 line 246: "*Needs:* LocallyAnalyticDistributionsPartII §5.2; NoncommutativeAndEquivariantIwasawa §0.15; CompletedCohomologyPartII §3.1."

**Claim:** The statement (line 242, "with its canonical finite-module topology") and the route (line 244, "the finite-dimensional continuous Hom comparison") both use NoncommutativeAndEquivariantIwasawa §F.1. The *Needs:* line does not list it.

**Witness:** NoncommutativeAndEquivariantIwasawa §F.1, at its head, proves the canonical compact quotient topology and the continuity of linear maps. This README's own contract (line 92) also consumes §F.1 for that topology.

**Repair:** "*Needs:* LocallyAnalyticDistributionsPartII §5.2; NoncommutativeAndEquivariantIwasawa §F.1; NoncommutativeAndEquivariantIwasawa §0.15; CompletedCohomologyPartII §3.1."

## R03 (P3) — The description's summary credits completed-homology descent with the Bianchi lower bound

**Location:** Pull-request description, summary block: "Completed-homology descent gives Fu's bound dim S_κ(K_f) ≤ CΔ(κ)/min_v κ_v, its group-cohomology form `finrank_groupCohomology_weightRep_le`, and two-sided linear Bianchi growth, `bianchi_groupCohomology_linear_growth`."

**Claim:** Descent gives only the upper half of §5.8. The lower half comes from the base-change count of §§5.3–5.7.

**Witness:** README line 150 says "§§5.1–5.6 use no completed cohomology". The §5.8 route (line 725) takes its lower bound from §5.7, which rests on §5.6 (fgt10 Theorem 4.17).

**Repair:** "Completed-homology descent gives Fu's bound dim S_κ(K_f) ≤ CΔ(κ)/min_v κ_v and its group-cohomology form `finrank_groupCohomology_weightRep_le`; with a Finis–Grunewald–Tirao base-change lower bound it gives two-sided linear Bianchi growth, `bianchi_groupCohomology_linear_growth`."

## R04 (P3) — The description puts the rank main term in every homological degree

**Location:** Pull-request description, second paragraph: "group homology with coefficients ⊠ Sym^{k_i} equals a·∏(k_i+1) up to a nonnegative multiaffine error with no full-product term, uniformly in every degree."

**Claim:** Only degree zero carries the main term a·∏(k_i+1). In degrees i ≥ 1 the homology is bounded by the error polynomial alone.

**Witness:** README §2.6 (line 380) states dim H_i ≤ B_M(k+1) for i ≥ 1. For M = A^a with a ≥ 1, every H_i with i ≥ 1 is 0, not about a·∏(k_i+1).

**Repair:** "degree-zero group homology with coefficients ⊠ Sym^{k_i} has dimension a·∏(k_i+1) up to a nonnegative multiaffine error with no full-product term, and every higher homology group is bounded by the same error, uniformly in the degree."

## R05 (P3) — Sixteen Check bullets compute nothing

**Location:** README lines 277, 322, 335, 403, 461, 498, 499, 550, 617, 640, 702, 703, 715, 716, 731, 732; for example line 335: "The argument uses right exactness alone."

**Claim:** These bullets are remarks, not tests. None computes a value, and none separates the target from a plausible wrong statement, so as Checks they are vacuous.

**Witness:** Line 731, "The result is stable under changing finitely many small weights", would hold just as well for a false growth claim. The computed Checks of §5.8 (lines 733–734) already test the threshold and the parity.

**Repair:** Delete the sixteen bullets. Four of them record a scope limit (461, 498, 702, 716); state each of those once in its target's prose instead. Every affected section keeps at least one computed Check.

## Verified sound

| Target | Instance | Roadmap value | Computed / source value | Result |
| --- | --- | --- | --- | --- |
| §0.1 proper-face B_c | m=3, c_∅=2, c_{0,2}=3, x=(2,5,4); m=2 on (t,t) | B=26; x₀x₁ not majorised | 2+3·2·4=26; B≤(Σc)t<t²; fu24 Thm 1.4 p.3 line 130 | holds |
| §0.3 generic quotients | m=1, k≥α; δ=Δ₁−Δ₂ at k=(n,n) | ≤2α; multiplicity (n+1)² | 2α−α²/(k+1)≤2α; δ kills W_(n,n); fu24 Thm 3.2 p.8, proof p.11 | holds |
| Conventions, Casimir | Sym^k highest-weight vector, k=0,1 | ½k(k+2): 0, 3/2 | ½k²−k+2k (fu24 line 362); reversed ½h²−h+2fe gives −½ at k=1 | holds |
| §1.1 Hom vs H₀ | M=A; one-dimensional W with character a | dim W both sides; a·a⁻¹=1 | A⊗W* free of rank dim W; fu24 p.22 line 1120 | holds; Needs R02 |
| §1.3 cyclic control | ℚ_p[X,Y], T=A/(X,Y), δ=X, W=T | 1 ≤ 1 | Hom(A/(X),ℚ_p)≅ℚ_p; fu24 p.23 line 1128 | holds |
| §2.1 free approximations | M=A/Aδ, δ a nonzero non-unit | (a,ℓ,rk N,rk T)=(0,1,1,0) | N=Aδ≅A; fu24 (33)–(34) p.22 | holds |
| §2.3 lower rank | ℓ=2, a=1, D=6; a=0 | 6−U_N; −U_N | 12−(6+U_N); −U_N≤0≤dim H₀; fu24 p.23 line 1139 | holds |
| §2.5 syzygies | ℓ=2, a=1, D=6; projection A²→A | U_N+U_M; H₁(A)=0 vs D | (6+U_N)−12+(6+U_M); fu24 (35)–(36) p.23 | holds |
| §2.6 Fu local theorem (headline) | M=A^a; m=2, i=7; p=2, g=−I | error 0; H₇=0; p=2 excluded | 7>3m=6; (1−g)(1+g)=0, a zero divisor; fu24 Thm 1.4 p.3 | holds |
| §2.7 support at cd 0 | W_(1,2); W₀⊕W_(1,2) | 1≤1≤6; 2≤2≤7 | aw13 Lemma 10.13 p.77; §10.12 reads m ⩾ 0 (rendered PDF) | holds |
| gap:canonical-dimension-zero | A/Aδ; lattice W_k⁰ | j=1, cd 3m−1; rational cd 0 | Ext¹=A/δA≠0; integral cd (3m+1)−3m=1 | holds |
| §3.1 `weightRep` | ℚ(i), γ=(i 1;−1 0), t=(1,1); t=0; signature (1,1), κ=(4,6) | trace 1; dim 1; dim 27 | i·(−i)=1, same-embedding model gives i²=−1; 3³=27 | holds; R01 |
| §3.2 auxiliary prime | γ=(1 1;−3 −2); diag(p²,1)-conjugate of SL₂(ℤ_p) | order 3 in pro-3 Iwahori; (1 p;0 1) excluded | det 1, tr −1; p=p²b forces b=1/p∉ℤ_p; fu24 §7 p.23 | holds |
| §3.4 descent | ℚ(i), total degree 2 | dim K₀=6; terms (0,2),(1,1),(2,0) | 3d=6; fu24 (38) p.23, bound p.24 line 1172 | holds |
| §4.2 and `finrank_groupCohomology_weightRep_le` | ℚ, SL₂(ℤ), Sym^k, a=k+1; t=0; 𝔞=⊤ | ℚ excluded; dim≤C; kernel everything | dim H¹=3 (k=10), 5 (k=22), unbounded; `IsTotallyReal ℚ` instance found at the pin | holds |
| §4.3 parallel weights | signature (1,1), κ=4 | exponent 2, size 16 | Δ=4³=64, 64/4=16; fu24 p.3 line 93 | holds |
| §4.4 Bianchi upper bound | κ=6 ↔ n=2 | dim E₂=9; bound C·κ | Δ/min κ=κ²/κ=κ; fu24 Thm 1.2 and Cor 1.3 p.3 | holds |
| §5.1 cusp torus | Koszul complex at n=1,2,3 | (1,2,1) | n=2: dims (9,18,9), ranks (8,8); det(1 1;i −i)=−2i; fgt10 (1.2)–(1.8) | holds |
| §5.3 fixed-type count | N=3, k=4, σ=ω; N=2, k=6 | ½ excluded by σ^ι≃σ; total 1 | 3/12+1/4=½; types 0,1,0 give 1=dim S₆(Γ(2)); fgt10 Prop 4.18 | holds |
| §5.5 base-change count | ℚ(i), n=0,1; ℚ(√−3), n=0,1,2 | correction 0, ½; ν=(0,0,1) | fgt10 ν definition p.22, Props 4.10–4.11 pp.22–23 | holds |
| §5.6 positivity | u=1,2,5; u=3,7 | A/B=5/3, 3, 5; B=0 | A=5/24, 3/8, 5/4 vs B=1/8, 1/8, 1/4; A=1/6, 1/3; fgt10 Thm 4.17 | holds |
| §5.7 lower bound | Γ=SL₂(O_F); Sym^n⊗conj Sym^m with n+m odd | −I acts by 1; vanishing | (−1)^{2n}=1; ℚ(i) A−B=1/12>0; fgt10 Cor 4.20 p.27 | holds |
| §5.8 and `bianchi_groupCohomology_linear_growth` | ℚ(i), SL₂(ℤ[i]), n=99, 100; n=0 | 33.3, 8.4; dim 0 | slopes 1/3, 1/12, so c≤1/12; finite abelianisation forces n₀; fu24 Cor 1.3 | holds |

- Gate: the worker's gate passes every check at b6c4a2b. Dependency check, re-run: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. The merge order places this roadmap at line 204, after all its suppliers.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the two `sorry` warnings. The `#check @` output of all 4 declarations matches README §§3.1, 4.2 and 5.8: no binder lost, no change. One-tactic `simp` probes fail on both theorems, so there is no padding.
- Source locators checked against the text: 36 (fu24 16, fgt10 10, marshall12 3, serre77 3, aw13 2, aw14 2). All 15 sampled targets are supported as written. The text extraction prints ">" where the aw13 §10.12 and aw14 §5.4 PDFs print ⩾ 0.
- Library declarations opened at the pins: 28 in Mathlib and 8 in Tau Ceti. Every name and file in the supplier contracts resolves.
- Cross-roadmap citations resolved: 64 sections in 12 roadmaps, on main or at the open heads. `roadmaps resolve` returned no leads.
- Declared gaps: gap:skew-rank and gap:canonical-dimension-zero match `plan.json`. Neither NoncommutativeAndEquivariantIwasawa nor CompletedCohomologyPartII provides them (CompletedCohomologyPartII §5.5 uses an Ore rank it does not define).
- Outside-folder diff: empty. Main has no copy of this roadmap.

Overlap check: read LocallyAnalyticDistributionsPartII, CompletedCohomologyPartII, AutomorphyLiftingBeyondTaylorWiles, QuaternionicModularForms and TorsionCohomologyInfrastructure (the open-vocabulary list; the main-vocabulary and results lists are empty), plus BianchiModularForms and ModularityAndLanglandsExtensions. Nothing is shared:
- LocallyAnalyticDistributionsPartII (Scope) leaves Fu's Theorems 1.2–1.4 and 1.6 to applications.
- CompletedCohomologyPartII owns only level-aspect growth.
- BianchiModularForms and ModularityAndLanglandsExtensions §§4.40–4.43 state no dimension counts.

Source independence: 41 passages compared with 6 sources: the 36 verified locators, plus §0.3 against fu24's proof of Thm 3.2, §5.3 against serre77 I §4.2(c), §3.1 against marshall12 §2.1, §5.4 against fgt10 pp.25–26, and the two theorem docstrings. No wording is shared beyond forced formulas. Largest share: fu24, 32 of 52 parenthetical locators. Contents compared with fu24 §§1–7: independent. Fu §§2, 4 and 5 are supplied by LocallyAnalyticDistributionsPartII, Fu §6 is split across Layers 1–2, and Layer 5 has no Fu counterpart. The local-before-global order is forced by §3.4 *Needs:* §2.6 and §4.2 *Needs:* §3.4.

## Not verifiable

- fgt10 Lemma 4.19 trace values at p = 2: FGT take them from Bushnell–Henniart's constructions, which they cite without reproducing. I checked §5.4 against FGT's text only.
- fgt10 Theorem 4.17: FGT omit the sum over local types (p. 26). I checked §5.6's A_F and B_F against the printed statement and did not re-derive them.

## Source issues

- **Error** in fgt10 at Proposition 4.18, p. 25: the source says the formula holds for every σ with σ(−I) = (−1)^k; it should also require σ∘Ad(diag(−1,1)) ≃ σ, since an order-three character of SL₂(𝔽₃) at N = 3, k = 4 gives ½; affects a stated result.
- **Misprint** in fgt10 at Proposition 4.18, p. 25: the source says the coefficient of tr σ(S₃) is ρ_k; it should be μ_k as defined in (4.7); affects nothing.
- **Misprint** in fgt10 at Theorem 4.17, p. 25, final display: the source says ν_{L,k}, summed over L ≠ K; it should be ν_{L,n}, summed over L ∈ ℒ(K) with ω_L(N(a)) = −1; affects nothing.
- **Gap** in fgt10 at Corollary 4.20, p. 27: the source says it suffices that the coefficient of n+1 is non-negative; it should be strictly positive in both parities, which A_F > B_F gives; affects the proof.
- **Gap** in fgt10 at the proof of Theorem 4.17, p. 26: the source omits the sum over combinations of local types as elementary; it should be carried out; affects the proof.
- **Misprint** in fgt10 at §3.3, before (3.9), p. 17: the source says "any unitary representation"; it should be "any irreducible unitary representation"; affects nothing.
- **Misprint** in fu24 at Theorem 1.2, (3), p. 2: the source says the minimum runs over 1 ≤ i ≤ r = [F:ℚ] of an (r₁+r₂)-tuple; it should run over the r₁+r₂ place weights; affects nothing.
- **Misprint** in fu24 at equation (2), p. 2: the source says compactly supported cohomology; it should be Marshall's interior subspace, since for Bianchi n > 0 dim H¹_c exceeds dim H¹_! by the number of cusps; affects nothing.
- **Misprint** in fu24 at the proof of Proposition 3.4, p. 10: the source says f raises and e lowers weights; with [h,e] = 2e of (6), e raises and f lowers; affects nothing.
- **Misprint** in fu24 at §6, p. 22: the source says x^k is right invariant under a "lower upper triangular" nilpotent subgroup; it should be the upper triangular unipotent subgroup; affects nothing.

## For the human reviewers

- none
