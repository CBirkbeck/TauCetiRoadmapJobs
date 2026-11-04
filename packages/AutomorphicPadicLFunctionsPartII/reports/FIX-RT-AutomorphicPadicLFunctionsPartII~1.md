# AutomorphicPadicLFunctionsPartII repair report (red-team round 1)

Two red-team passes were settled. Finding IDs keep their source IDs. The first eight sections (F01–F08) refer to `RT-AutomorphicPadicLFunctionsPartII_r1a` (review a); the next five (F01–F05) refer to `RT-AutomorphicPadicLFunctionsPartII_r1b` (review b). Where the two reviews overlap, the claim is settled once and the other section points to it: review b F01 is settled with review a F02 (the class sign), and review b F03 with review a F05 (the §2.6/§3.6 cycle). Only `packages/AutomorphicPadicLFunctionsPartII/README.md` and the top-level `gaps` list of `design/plan.json` (one `needs` sentence) changed. `Suggested.lean`, `sources.toml` and `metadata.toml` did not change.

## F01 (P1) — applied

§4.1 "initially Re(s)>d+(|β|−|α|)/2" → "Re(s)>1+(|β|−|α|)/(2d)=1+w/2", with the reason: admissibility gives β_barσ−α_σ=w, so each summand has size N(λ)^(w/2−Re s). §4.2 now names the same region, the region where K^(β+α) at |α|+ds converges. Added the ℚ(i,√2) witness as a negative-control Check. The locator records that KS-v4 line 2008 is replaced.

## F02 (P1) — applied

ε(d,β)=(−1)^(d(d−1)/2+|β|+1) → ε(d,a,β)=(−1)^(d(d+1)/2+|a|+|β|+1), which is (−1)^(d(d−1)/2+|α|+|β|+1) in terms of α. Changed in §4.3 (statement, proof route, Checks), the Conventions, §§7.1, 7.4, 8.3, 8.4, 8.5 and the worked example. §3.5 now states C=(−π)^d/covol. New Checks: the d=1 residue computation, the a=1 and a=3 derivative signs, the a=2 witness (≈+563.3), and the parity form of the sign.

Evidence. I recomputed the chain from scratch:
- Def. 3.15 corrected gives (−1)^(j+b) at j=d−1, b=|β|.
- The corrected Lemma 3.16(2)/(3) contraction is (−1)^(d(d+1)/2)d!C. I checked this by exterior-algebra computation for d=1,…,5 (values −1, −2, +6, +24, −120), and the expansion coefficient (−1)^(j+1)j! for every j<d.
- C·covol_Leb=(2πi)^d/(−2i)^d=(−π)^d.
- ∂_(z_i)χ_ℓ=−π barℓ_i χ_ℓ. KS-v4 line 1977 has +πr.
- The functional equation contributes no sign, and the fibre integral and cap contribute none.

The product is the stated ε. Directly at d=1: ∂_z^a(z+λ)⁻¹=(−1)^a a!(z+λ)^(−a−1), and the β-part carries (−1)^β, so the sign is (−1)^(a+β). The existing a=3 example keeps ε=−1, so the values in §§7.1, 8.3, 8.4 and 8.5 are unchanged.

## F03 (P1) — applied differently

The finding is right: the torus cap H^(d−1)(Γ,M)→H₀(Γ,M)=M_Γ lands in coinvariants. The suggested repair is not applied because it is false for d≥2. That repair defines θ as the integral preimage of the critical moments with zero noncritical moments. Such a θ would be Γ-invariant. The closure of an infinite Γ in (O_L⊗ℤ_p)^× contains a copy of ℤ_p acting freely on the units, and a bounded invariant measure vanishes there. On ℤ_p^× with ⟨1+p⟩, the cosets of 1+p^nℤ_p would have equal masses, so the mass of 1+pℤ_p lies in p^(n−1)O for all n. Hence μ_Eis would vanish on the units, and the §8.3 pushforward would be zero, contradicting the interpolation at any nonzero absolutely convergent L-value.

What I did instead: θ_Γ(h,y) is now defined in M_Γ (§6.3), and μ_Eis,Γ in Meas(O_L⊗ℤ_p,O_ℂp)_Γ (§7.1). Critical moments, Γ-invariant twists (§7.4) and the weighted pushforward (§8.3, with a new well-definedness obligation) factor through the coinvariants. Subgroup change is now the projection formula. I added both counterexamples as Checks. The cap with coinvariant target is added to gap:torus-cap-projection, in the README and in plan.json.

## F04 (P3) — applied

§2.4's identity-isogeny API bullet and Check are removed. A hypothesis sentence now records that f=O_L forces x=e∈A[c]. Added the reviewer's Gaussian instance at 5 as a Check: f=(2−i), c=(3), differentials 4 and 0, degree 5, Nc=9 a unit, x of order 5 outside A[3]. I verified each value: i acts by 3, 2−3≡4, 2+3≡0 (mod 5). The valid §1.1 identity-isogeny Check (D empty) is a different construction and is kept.

## F05 (P2) — applied

§2.6's sentences about the analytic image and §3.5, and its "chosen embedding" clause, are deleted. §2.6 now states only the field-base edge-map comparison. §3.6 states the analytic comparison: the flat image of Φ represents the de Rham polylogarithm of §2.6 under the analytic de Rham comparison. ComplexComparisonPartII C5.1 is added to §3.6 *Needs* and to the Layer 3 Dependencies; C5.1 "The ordinary comparison" exists at that roadmap's head. The order is now §2.6→§3.5→§3.6. This also settles review b F03.

## F06 (P3) — applied

§4.1 "An unrestricted lattice sum counts unit orbits infinitely often" → orbit multiplicity 1 for Γ=1, 4 for μ₄ with invariant weight, and infinite for an infinite finite-index unit subgroup (d>1). This agrees with the §4.1 μ₄ Check (multiplicity 4).

## F07 (P3) — applied

§0.3: the weight remark and the prohibition → two computed cases over ℤ[i,1/2] with Γ=μ₄: (3,0) gives i⁻⁴=1 and full invariants; (0,0) gives −i and invariants 0. The ℚ(ζ₃) mod-2 control is kept. §1.4: the duplicate zeroth-derivative Check is removed, the factorial warning moved to the API, and the g=z₂ check added (0 and 1; swapped gives 1 and 0).

## F08 (P3) — applied differently

§1.3 "proof in §2.6, pp.26–27" → "pp.26–28, KS-v4 lines 1105–1184, with trace identification and injection at lines 1177–1184, p.28". I kept p.26, which the reviewer's "pp.27–28" drops: §2.6 begins at line 1105 (page-26 marker at 1091) with Proposition 2.32, which the proof uses. Page markers: 27 at line 1134, 28 at line 1176. The §1.2 locator (pp.26–27, Prop. 2.32–Cor. 2.35) is correct and unchanged.

## F01 (P1) — applied differently

The finding is right: at d=1, a=β=0 the coefficient is +1, not ε(1,0)=−1. The fix is the one recorded under review a F02. The proposed formula (−1)^(d(d+1)/2+|β|+1) is not used: it omits the derivative sign (−1)^|a|. Witnesses: at d=1, a=1, β=0, ∂_z(z+λ)⁻¹=−(z+λ)⁻² gives −1!, where the proposed formula gives +1. The roadmap's own λ⁻⁴ example (a=3) has ε=−1, while the proposal gives +1 and would turn the correct +2352U into −2352U. The stated cause is also not right. Proposition 3.23's printed sign agrees with Lemma 3.16(2) (−1)^j and the reordering, not with (3), so the uniform −1 was right. What was missing was the volume sign (−1)^d and (−1)^|a|.

## F02 (P2) — applied

Line 18 "NonordinaryCMSpecialValues owns the independent inert-prime CM central-value direction" → "The independent inert-prime CM central-value direction is outside this roadmap; nothing here is supplied by it." The NonordinaryCMSpecialValues board design cites AutomorphicPadicLFunctions:L3/L3h as its supplier, so the edge pointed the wrong way. The depcheck now prints no `moved:` line. The Downstream consumers sentence is kept.

## F03 (P3) — applied

Settled with review a F05: the §2.6 sentence citing §§3.5–3.6 is deleted, and the analytic comparison lives in §3.6.

## F04 (P3) — applied

§5.9 *Needs* and the Layer 5 Dependencies now cite "PeriodsAndSpecialValues PS.0 (gap:hecke-motive-periods); PeriodsAndSpecialValues PS.1 (gap:critical-cm-deligne-period)". I repaired the same pattern in §5.9's hypothesis sentence, which said "supplied by PS.0–PS.1". Slugs, supplier and sections match plan.json.

## F05 (P3) — applied differently

Added to the Scope paragraph: "No roadmap titled automorphic p-adic L-functions precedes this part: its base is formed by the three suppliers of the next sentence, which records where each of them stops, and nothing outside the suppliers named below is consumed." The wording is timeless, without "on main or among open roadmaps". Renaming the package is not settled here: the name is a maintainer decision.

## Check outcomes

- **Elaboration**: `lake env lean packages/AutomorphicPadicLFunctionsPartII/Suggested.lean`, run from the content checkout, gives only the two expected `declaration uses 'sorry'` warnings (lines 63, 86) and no errors. The file is unchanged and imports only `Mathlib`.
- **Signatures**: I wrote `#check @name` for all four declarations into one scratch file and elaborated it once. The types of `hermitianPairing`, `kroneckerTerm`, `kronecker_meromorphic_continuation` and `kronecker_functional_equation` are identical to the worker's signatures file. There are no section variables and no binder was lost. They match README §§3.3–3.4 (half-plane d+|ν|/2, positivity of h, `DiscreteTopology` and `IsZLattice`, the alternating-dual predicate). No change.
- **Dependency check** (after edits):
  ```
  depcheck: 51 roadmaps, 587 edges, 0 problem(s)
  ```
  There is no UPWARD, CYCLE or `moved:` line. Before the edit the review recorded a `moved:` line caused by NonordinaryCMSpecialValues.
- **Citations**: `roadmaps resolve` on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **Gate failures listed in the brief**: none were listed.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed (each side) | Result / change |
|---|---|---|---|
| §4.1 half-plane | ℚ(i,√2), α=(6,6), β=0, s=−3; s=−1; ℚ(i), μ₄, α=4 | old bound −4 admits −3, but summand n⁻¹²·n¹²=1 diverges; new bound −2 excludes it; at s=−1 terms n⁻⁸; at d=1 both bounds give −1 | Corrected the bound, added a Check |
| §4.2 region | α=(6,6), β=0, d=2 | \|α\|+2Re s>2+6 ⇔ Re s>−2 = 1+w/2 | Stated explicitly |
| Top contraction (§3.5) | d=1…5 by script | −1, −2, +6, +24, −120 = (−1)^(d(d+1)/2)d!; source gives −1, +2, +6, −24, −120 | README value confirmed |
| C (§3.5) | d=1, ℤ[i]; general d | vol(A)=−2i, C=−π; C=(−π)^d/covol | Stated explicitly |
| ε, d=1 | a=β=0 residue; a=1; a=2 (ℤ[i], h₂, x=1/3); a=3 (λ⁻⁴) | +1 (residue +h(t)); −1; +24·E₃(1/3)=+563.3 (E₃(1/3)=23.4697 by summation to 800²); −1 | Old formula gave −1, −1, −1, −1, so 3 of 4 wrong; b's gave +1 at a=1 and a=3, so 2 of 4 wrong; new formula 4 of 4 |
| ε parity | admissible types | \|a\|+\|β\|≡d(w+1); d=1: (−1)^(w+1); d=2: +1 always (a=(1,1), β=0 → +1) | Check added; the index a=(1,0) at d=2 is inadmissible and was not used |
| §7.4 Check | d=1, β=0, a=3 / a=2 | −31 / +31 | Rewritten with a explicit |
| §8.5 signs | (α,β)=(3,0), (2,1), (4,0), (3,1); d=2, α=(1,1) | +1, +1, −1, −1; +1 | Rewritten |
| §8.3/§8.4 λ⁻⁴ values | ε=−1, δ_c=−2352, raw −188160 | +2352U; +188160 → 62720/27; M(χ)=−Ω_p⁴U, product 2352Ω_p⁴U | Unchanged values, sign label renamed |
| §6.3 cap target | Γ=ℤ on ℤ₅ by 6; Γ=1 (d=1) | H¹=M_Γ=ℤ₅/5, M^Γ=0; M_Γ=M | θ is a coinvariant class |
| Invariant measures | ℤ_p^×, ⟨1+p⟩ | coset masses μ(1+pℤ_p)/p^(n−1) ∈ O ∀n ⇒ 0; δ₀ invariant | Reviewer's image-theorem repair refuted |
| §6.3 subgroup law | index 2, p=2 | projection(θ_Γ′)=2θ_Γ; critical moments ×2 | Projection formula |
| §7.1 critical functional | d=2 CM quartic, a=(1,1), β=0 vs a=(1,0) | weight N(γ)⁻²=1 (invariant) vs σ₁(γ)⁻²σ₂(γ)⁻¹≠1 | Noncritical moments are not attached to the class |
| §8.3 pushforward | χ critical of type (α,β) | χ(q_f(t⁻¹,s))·t⁻¹ = t^a s^β·(locally constant); q_f kills U_f⊇Γ₀ | Well-definedness obligation added |
| gap torus-cap-projection | Γ=ℤ, M=ℤ trivial / sign | H₀=ℤ / ℤ/2 (matches the §2.2 Check H¹=ℤ/2) | needs sentence extended |
| §2.4 instance | Gaussian at 5 | 2−3≡4, 2+3≡0, deg 5, N(3)=9, ord x=5 | Nonvacuous Check |
| §2.4 identity | f=O_L | x=e∈A[c]=D ⇒ x∉U, 0 instances | Excluded |
| §0.3 Checks | μ₄, (3,0) / (0,0); ℚ(ζ₃) mod 2 | i⁻⁴=1; −i with −(1+i) a unit, N(1+i)=2; −1≡1 | Three computed Checks |
| §1.4 Check | g=z₂ | ∂₁g=0, ∂₂g=1; swapped gives 1, 0 | Added |
| §2.6/§3.6 order | Needs graph | §2.6: §1.3, §1.4, P3.3; §3.6: §3.5, §1.3, §2.6, C5.1 | Acyclic |
| Scope edge | depcheck | 587 edges, 0 problems, no `moved:` | Edge removed |

## Maintainer notes

- **Consequences for other roadmaps.** The sign symbol is now ε(d,a,β). In §§8.3–8.5 it is written ε(d,α−1,β)=(−1)^(d(d−1)/2+|α|+|β|+1). For admissible types it reduces to (−1)^(d(d+1)/2+d(w+1)+1): this is +1 for every type at d=2, and (−1)^(w+1) at d=1. A consumer that copied the earlier ε(d,β) must recompute it.
- **No Lean name changed.**
- θ_Γ and μ_Eis,Γ are now Γ-coinvariant classes. Consumers that used an invariant θ (for example a future elliptic adapter in ModularIwasawaMainConjecturesPartII) should use the critical-moment or pushforward interfaces.
- **Supplier gap changed.** The torus-cap-projection gap with AlgebraicTopology Stage 6 now also asks for the cap into H₀(Γ;M)=M_Γ for arbitrary coefficients. The change is identical in the README and in plan.json.
- **Package name.** The package name still says "Part II" although no base roadmap exists; renaming is outside this package.
- **Source issues in KS-v4.** These should be passed on to the source's maintainers:
  - The half-plane in Definition 3.24, line 2008, and in the proof of Lemma 3.26, line 2051.
  - The derivative sign at line 1977.
  - The volume factor at lines 1996–2000.
  - Lemma 5.15's invariant cap target, lines 2926–2940. The cap lands in coinvariants, and an integral invariant θ cannot carry the unit restriction for d≥2.
- **Ownership.** No new carrier was introduced. The coinvariant reformulation is internal to §§6.3–8.3, which this roadmap already owns. Ownership against open pull requests whose files the brief did not provide was not checked.
- **Sources.** No new source was cited and no text was missing, so no needs-references request was filed. KS-v4 numbering is arXiv v4 throughout.
- **Untrusted text.** Neither review contained instructions to run commands or act outside the job.
