# Repair report: red-team round 1 of AutomorphicSpectralTheoryPartII

This report covers seven findings: pass a F01–F04 and pass b F01–F03. Nothing overlaps between the two passes. The first four finding sections answer pass a and the last three answer pass b; each heading keeps its review's identifier and severity.

## F01 (P2) — applied

**Check.** The finding holds. bplzz line 1100–1104 lets only the bi-K algebra `S(G(𝔸_F))_K` act on the K-invariant L² space. The witness holds: in the standard S₃ representation, (23) sends (1,1,−2) to (1,−2,1), which is not ⟨(12)⟩-fixed.

**Change.** In §4.1, the API bullet changed from "closed invariant subspace; convolution by a Schwartz test function acts on it" to "closed and stable under G∞ and `S(G∞)⊗S(G(𝔸_f))_K`". The reason is given: Z(g∞) is central, and the spherical factors at v∉T are commutative. The bullet now says that general tests change the level. A new S₃ Check computes e_K*δ_(23)*e_K(1,1,−2)=(−1/2,−1/2,1). Pattern search: §§4.3, 4.4 and 5.3 already restrict to bi-K tests.

## F02 (P2) — applied

**Check.** The finding holds. §2.12 asserted R(f)μ∈S_w before S_w is defined in §2.14. The §2.14 route then cited "the tempered-measure smoothing estimate" from §2.12, and §2.14 needs §2.13, which needs §2.12.

**Change.**
- §2.12: the S_w sentence and the BPCZ Lemma 2.5.11.1 locator are replaced by "uniform-growth estimates in §2.13, relative decay in §2.14". The S_w API bullet is replaced by the weak definition of R(f)μ and the support bound for compactly supported f.
- §2.14: the bullet now says "bounded above" and has the locator (bpcz line 1395). Its route follows the source proof: T by §2.13, support in supp μ·(supp f)⁻¹, stability under S(G(𝔸)), and Dixmier–Malliavin.
- §2.14 *Needs:* adds §2.12, §2.1, and AutomorphicFormsOnReductiveGroups §0.3 and §2.7 (`dixmierMalliavin`, checked at its head).

## F03 (P3) — applied

**Check.** bpcz line 1268 is the header of printed page 212, and (2.5.5.4)–(2.5.5.5) sit at lines 1273–1277.

**Change.** In §2.7, "p.211" became "p.212". Pattern check:
- §2.6 cites pp.211–212 for all of §2.5.5, which is correct.
- §2.8 cites Proposition 2.5.5.1 (line 1284, p.212) inside the range pp.211–212, which is correct.

## F04 (P3) — applied

**Check.** The finding holds. Two §0.5 Checks only restated the quantifiers of the definition.

**Change.** They are replaced by two computed Checks:
- Θ={−1}, Y=ℤ, exp(z): eⁿ/(1+n)^d→∞ for every d, so it is not moderate. It is moderate for Θ={1}, where |exp|≤e^M on the strip.
- Θ={−1}, Y=ℤ, z²: r=−2 gives sup n²/(1+|n|)²=1; r=−1 gives ∞.

Both values are recomputed in the table below.

## F01 (P2) — applied differently

**Check.** The finding holds that the `needs` sentences bundle independent inputs. Two parts of the suggested repair are wrong, and I did not follow them:
1. The suggested new slug `nuclear-nash-schwartz-product` (AutomorphicSpectralTheory §0.14) duplicates the existing gap `nash-schwartz-analysis`, which is on the same section and already asks for the Nash Schwartz product comparison.
2. The second half of `satake-exponential-family` was not only misplaced but false as written. Spherical convolution does not keep each stage fixed: 1_{K diag(ϖ,1) K} moves support C to C·supp(h). The correct statement is AutomorphicFormsOnReductiveGroups §0.3: stages with supports C₁ and C₂ convolve into the stage with support C₁C₂.

**Change.** Changes in both the plan.json `gaps` list and the README contracts:

| Old slug | Change |
|---|---|
| `rapid-semisimple-centre` | Kept, now only the semisimple multiplier for W-invariant symbols. |
| (new) `split-centre-fourier-laplace` | AutomorphicSpectralTheory §§6.1–6.3. The Nash product clause now points to the existing `nash-schwartz-analysis`. |
| `discrete-polynomial-counting` | Split into `refined-langlands-discrete-data` (AutomorphicSpectralTheory §§4.11–4.14) and `discrete-spectrum-casimir-counting` (§§4.7–4.9). |
| `real-plancherel-characters` | Split into `real-plancherel-decomposition` (AutomorphicFormsOnReductiveGroups §§2.4, 2.7) and `tempered-characters-in-torus-strips` (§§2.2–2.4). The faithfulness clause is dropped: §1.2 now derives it from the Plancherel identity. |
| `satake-exponential-family` | Stage clause removed. The §1.9 API bullet now states the support change and cites AutomorphicFormsOnReductiveGroups §0.3. |

Every usage was updated: §§1.2, 1.3, 1.6, 5.7, the Layer 1 and Layer 5 Dependencies, and the §1.3 *Needs:* (which adds `nash-schwartz-analysis`). Mechanical check: there are 29 slugs in each file, and the supplier, needs and section strings are identical in both.

## F02 (P3) — applied

**Check.** δ_P^Q was used in §2.16 but defined nowhere in the README. The source definition is bpcz line 697–705 (§2.2.8, p.199).

**Change.** §2.3 now defines `δ_P^Q(x)=exp⟨2ρ_P^Q,H_P(x)⟩` in my own words, with δ_P^G=δ_P and δ_P^P=1, and separates it from the depth d_P^Q. A new Check covers the GL₂ Borel at diag(a,1) with |a|=4: δ_B^G=4 and δ_B^B=1. This agrees with the witness in the Conventions.

## F03 (P3) — applied

**Check.** bplzz line 401 states Definition 2.1 for integers p>0.

**Change.** The §0.1 locator now says "which require p>0; the case p=0 is admitted here and its growth bound is treated in §0.2". The mathematics is unchanged. For p=0, |E₀(w)|≤e^{|w|} gives the order-1 bound.

## Adversarial pass on added or changed statements

| Statement | Instances | Computed values | Result |
|---|---|---|---|
| §4.1 bi-K stability | S₃ standard representation, K=⟨(12)⟩, v=(1,1,−2) | δ_(23)v=(1,−2,1), not fixed. e_K δ_(23) e_K v=(−1/2,−1/2,1), and (12) fixes it. | Restriction to bi-K tests is necessary and sufficient here. |
| §4.1 commutation | GL₁, T = all finite places | H_G^T=ℂ, so the only constraint is Z(g∞), which commutes with G∞. | Stable. |
| §2.12 support bound | μ=δ_y, f supported in a compact set U | R(g)δ_y=δ_{yg⁻¹}, so supp R(f)δ_y ⊂ y·U⁻¹, which is compact, and w is bounded on it by the weight comparison. The README states the support bound as supp μ·(supp f)⁻¹. | Consistent with §2.14's route. |
| §2.14 measure statement | μ=δ_y, w=1 | S₁=T, and R(f)δ_y is smooth of uniform growth. | Holds. |
| §2.14 measure statement | μ=δ_y, w=n_P | S_{n_P}=S, and R(f)δ_y for compact f has compact support, so it lies in S. | Holds. |
| §2.14 hypothesis | w=n_P, μ=Haar on a noncompact quotient | w is not bounded on the support and the conclusion fails: R(f)1=(∫f)·1∉S. | "Bounded above" is necessary. |
| §0.5 Check 3 | exp(n)/(1+n)^d | d=0: ∞; d=10: e^n/(1+n)^10 → ∞. Θ={1}: \|exp(α)\| ≤ e^M. | Discriminates. |
| §0.5 Check 4 | n²(1+\|n\|)^r | r=−2: values 0, 1/4, 4/9, …, sup 1. r=−1: n²/(1+n) → ∞. | Discriminates. |
| §2.3 δ_P^Q | GL₂ Borel, diag(a,1), \|a\|=4 | δ_B^G=4. δ_B^B: ρ_B^B=0, so 1. | Matches the Conventions and the §2.16 Check. |
| §2.3 δ_P^Q | P=G | δ_G^G=1, and CT is the identity. | Consistent. |
| §1.9 support change | GL₂(ℚ_p), C=K_p, h=1_{K diag(p,1) K} | supp(1_K*h)=K diag(p,1) K ≠ K. The stage changes; the level K is kept. | The new bullet is correct; the old gap clause was false. |
| §1.2 detection via Plancherel | f with π(f)=0 for every tempered π | ‖f‖₂²=∫‖π(f)‖²_HS=0, so f=0 (f is continuous). | Faithfulness follows, so dropping it from the gap is justified. |
| §0.1 p=0 | Λ=∅; Λ=ℤ∖{0} | Sum 0 (bound holds). 2Σ1/n=∞ (fails). | Unchanged mathematics. |

## Checks

- **Elaboration.** I ran `lake env lean packages/AutomorphicSpectralTheoryPartII/Suggested.lean` from the content checkout. The only output was the three `declaration uses 'sorry'` warnings, at lines 85, 98 and 108. There were no errors.
- **Signatures.** Suggested.lean was not edited this round. The elaborated signatures in the job's signature file therefore still apply, and none of the ten has lost a binder. Every Lean name still appears in the README.
- **Dependency check:** `depcheck: 56 roadmaps, 647 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation resolver:** "Lean names found nowhere: None."
- **Gate failures.** None were listed for this round.

## Notes for the maintainer

- **Changed gap slugs.** Other roadmaps may cite the removed slugs `real-plancherel-characters` and `discrete-polynomial-counting`; the new slugs are listed above. AutomorphicSpectralTheory and AutomorphicFormsOnReductiveGroups now receive the split contracts.
- **New supplier citations.**
  - AutomorphicFormsOnReductiveGroups §0.3 (support stages under convolution) and §2.7 (`dixmierMalliavin`), checked at the head of its open pull request.
  - AutomorphicSpectralTheory §§4.7–4.9 and §§4.11–4.14, checked at its head. Both are earlier in the merge order.
- **Ownership.** No new construction is owned here. All new inputs are assigned to the existing suppliers.
- **Sources.** No new source was needed, and needs-references.toml was not written.
- **Untrusted text.** Neither review contained any instruction-like text.
