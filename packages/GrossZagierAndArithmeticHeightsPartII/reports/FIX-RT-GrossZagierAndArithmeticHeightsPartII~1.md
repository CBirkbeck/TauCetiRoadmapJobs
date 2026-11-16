# FIX-RT-GrossZagierAndArithmeticHeightsPartII~1

Repair of red-team round 1 (passes a and b) on `packages/GrossZagierAndArithmeticHeightsPartII`. Thirteen findings, settled in nine sections (four pairs overlap). Every verdict below was checked against the cached sources (K, Z, LL2, Howard19, MZ) and three texts fetched for this round through the sources service (HSY23a, HSY23b, Shi22, all arXiv).

## RT-GrossZagierAndArithmeticHeightsPartII~1a/F01, RT-GrossZagierAndArithmeticHeightsPartII~1b/F02 (P1) — applied differently

K Lemma 9.6 (K lines 3934–3975) indeed fails. §8.6 now states the exact open step (odd largest invariant, invariants positive), proved in rank three by HSY23a Theorem 1.2 (line 161), so open only for n ≥ 4 (witness H₁ ⊥ H₁). §8.7, §13.10, Summary, Acceptance file and `Suggested.lean` say they rest on §8.6.

## RT-GrossZagierAndArithmeticHeightsPartII~1a/F02, RT-GrossZagierAndArithmeticHeightsPartII~1b/F03 (P1) — applied

Z line 1313 needs det(1 − g) integral, true only for n ≤ 3. §14.5: semi-Lie for p ≥ n; group for p ≥ n + 1 and n ≤ 3. §9.5(b): converse at q = n proved for n ≤ 3, excluded for n ≥ 4. Same change in §14.6, Layer 14, Scope, Summary, Source corrections, Acceptance file, `Suggested.lean`.

## RT-GrossZagierAndArithmeticHeightsPartII~1a/F03, RT-GrossZagierAndArithmeticHeightsPartII~1b/F01 (P1) — applied differently

K lines 614 and 3894 confirm the imported rank-two input. New §7.5a states the divisor decomposition and Int(L) for both signs (HSY23b Theorems 1.1–1.2; Shi22 Theorems 1.1–1.2). Int = ∂Den in rank two sits in §8.7, not §7.5a, to avoid Layer 7 needing §8.1. §§7.7, 8.5, 8.7 use §7.5a; three sources added.

## RT-GrossZagierAndArithmeticHeightsPartII~1a/F04, RT-GrossZagierAndArithmeticHeightsPartII~1b/F04 (P2) — applied

`gap:jr-afl-local-inputs` → `gap:jr-zhang-formulation-fl`, `gap:jr-smooth-transfer-existence`, `gap:jr-transfer-weil-compatibility`, one sentence each. The first two are passages from GanGrossPrasadUnitaryGroups' `gap:relative-fundamental-lemma` and `gap:relative-finite-transfer` (its README lines 153, 157). *Needs* re-pointed (§§9.3–9.8 first; §14.4 second; §14.1 all); `design/plan.json` `gaps` matches.

## RT-GrossZagierAndArithmeticHeightsPartII~1a/F05 (P3) — applied

SchemeAndStackFoundations §5.8 (main, README line 8498) is Hirzebruch–Riemann–Roch. Contract "§§5.1, 5.3–5.4 and 5.7" → "§§5.1, 5.3–5.4, 5.7 and 5.8 (… Hirzebruch–Riemann–Roch)". §2.7's route names HRR, and §5.8 is added to §2.7 *Needs* and Layer 2 Dependencies. No other target uses higher Riemann–Roch.

## RT-GrossZagierAndArithmeticHeightsPartII~1a/F06 (P3) — applied

Title "gross–zagier formulas …" → "Gross–Zagier formulas …", as titles on main capitalise proper names ("Riemann–Roch", "Abhyankar's lemma").

## RT-GrossZagierAndArithmeticHeightsPartII~1b/F05 (P2) — applied differently

Confirmed: §2.7.1 needs H(L,L) ⊆ R, and no F₀-rescaling turns u⁻¹O_F into O_F. §5.1 now defines the trace dual, integral and vertex lattices, invariants, val and t (LL2 Definition 2.10), citing Mathlib `Module.equiv_directSum_of_isTorsion` rather than §2.7.3, which is defined only for O_F-integral lattices. Check, API bullet and §5.1/§6.3/Layer 5–6 *Needs* updated.

## RT-GrossZagierAndArithmeticHeightsPartII~1b/F06 (P3) — applied

Howard19 lines 58, 78, 107 confirm it. "Howard19 Corollary D" → "Theorem B (= Theorem 5.1) and Corollary C, p. 2" in §§5.3, 7.1, 7.8. The §5.3 Check now says Theorem B holds for any r. Added that LL2 runs Howard's Krämer-model proof on the exotic space, and the F₀ remark (HSY23b footnote 1). References and manifest updated.

## RT-GrossZagierAndArithmeticHeightsPartII~1b/F07 (P3) — applied

Added the Chow-valued modularity headline (YZZ09 Theorem 1.3; Liu11a Theorem 3.5; §§12.6a–12.7) to the Acceptance file and the `Suggested.lean` docstring. Not statable: it needs GSpin and unitary Shimura varieties, their special divisors and Hilbert modular forms for the Weil representation. Tau Ceti `Chow.ChowGroup` exists, but there is no Shimura variety to apply it to. No declaration added.

## Checks run

- **Elaboration.** `lake env lean packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file has no declarations, so no `#check @name` scratch file was needed and no signature changed. It still has one `import Mathlib`, no `set_option` and no `TauCeti.*` import.
- **Dependency check.** `depcheck: 257 roadmaps, 2453 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **New sources.** HSY23a (arXiv:2208.07992v3), HSY23b (arXiv:2011.01356v3) and Shi22 (arXiv:2004.07158v4) were fetched through the service as certified open-repository texts. Shi22 is not paywalled (review b assumed it was). No `needs-references.toml` was written.
- **Ownership.** I searched main and the open heads with `roadmaps grep` for Krämer models, special cycles and Kudla–Rapoport. No other roadmap owns Krämer special-cycle intersection numbers, so the new §7.5a is this roadmap's, as its scope already states. GrossZagierAndArithmeticHeights (Shimura curves) states no U(1,1) Krämer special-cycle numbers.
- **Plan file.** Only the `gaps` list of `design/plan.json` changed: three new entries replace one, two entries (`relative-fundamental-lemma`, `relative-finite-transfer`) were added, and `8.6` was added to `neededBy` of `nonaffine-formal-filtration-product`. Every `gap:` slug in the README now has a `gaps` entry and a `What <Supplier> must provide (gap:<slug>)` line, and the reverse.

## Gate failures

- **README names gap:relative-finite-transfer and gap:relative-fundamental-lemma, which `gaps` did not declare.** Both slugs are named in the `jr-smooth-transfer-existence` and `jr-zhang-formulation-fl` contracts as the inputs they are deduced from. Added a `gaps` entry for each (supplier EndoscopicTransferAndUnitaryTraceComparison, section "Layers 2 and 4", as for the other three Jacquet–Rallis gaps). Added the matching `What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:…)` lines under the README's "Exact supplier contracts", before the lines that use them. Each `needs` restates in this roadmap's notation (F₀ the base field, F the quadratic algebra, rank m) the request GanGrossPrasadUnitaryGroups makes under the same slug. `neededBy`: 9.3, 9.5, 9.7, 9.8 and 14.1 for the fundamental lemma; 14.1 and 14.4 for finite transfer. These are the sections that consume the gaps derived from them. Nothing else changed. After the repair, depcheck gives `depcheck: 257 roadmaps, 2453 edges, 0 problem(s)`, `roadmaps resolve` reports no Lean names found nowhere, and `Suggested.lean` (unchanged) elaborates with exit 0 and no output.

## Adversarial pass on changed or added statements

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| §7.5a, χ = 1 | (α,β) = (0,0), (0,1), (0,2), (1,1) | 0; 1; 2; 2 − 2q | agrees with §8.2 count in each case |
| §7.5a, χ = −1 | (0,0), (0,1), (0,2), (1,1) | 2−2 = 0; 4−3 = 1; 6−4 = 2; 2(3+q)−4 = 2+2q | agrees with §8.2 |
| §8.2 at (1,1), χ = 1 | 1 + (q+1) + (1 + 2q) overlattices | (1−q) + 2(1−q) + (q−1)·1 + 0 = 2 − 2q | = §7.5a |
| §8.2 at (1,1), χ = −1 | L and q+1 type-one lines | (1+q) + (q+1) = 2 + 2q | = §7.5a |
| §7.5a, H₁ | b = 1, q = 3 | 2 − (q+1) = 1 − q = −2; ∂Den = (1−q) + (q+1)·0 | equal |
| §7.5a, classification | s even, h(v,w) = π^s ε, c = ε̄⁻¹ | Tr(π^s) = 2π^s, unit multiple since p odd | s must be odd; L ≅ H_s |
| §7.5a, unit x | m_Λ(x) = 0 | Exc multiplicity 1 | horizontal part ≠ Z(x) |
| §7.7 base | Int ↦ Int + c in every rank | both sides of the law unchanged | needs §7.5a; Int(I₃) = 0 + 1 = 1 |
| §8.6 parity | L₀ ⊥ H_b, b odd | norm(l₁+πl₂) = −2π^(b+1); coefficient 1/(2π) | min val(L♭′) = val(L) − b + 1 |
| §8.6, rank 3 | ⟨π₀⟩ ⊥ H₃ | val 8; L♭ val 2 + 4 = 6; bound 8 − 3 + 1 = 6 | Lemma 9.6 fails; HSY23a covers it |
| §8.6, rank 4 | H₁ ⊥ H₁ | rank-3 sublattices val ≥ 1+1+2 = 4; π-modular, no rank-one summand | unreachable: target |
| §8.6, a_n even | L₀ ⊥ ⟨y⟩ | val(L₀) = val(L) − a_n < val(L♭) | decrease exists |
| §9.5(b), n = q = 3 | V₂ anisotropic | ≤ 3 of 4 residues excluded; det(1−g) ∈ O_F | converse holds |
| §9.5(b), n = q = 5 | V₄ isotropic | 6 residues vs 5 + 1 conditions | not asserted |
| §14.5 induction | step n uses S_(n−1) | primes p′ ≥ n = (n−1)+1, S ⊇ {p′ ≤ n−1} | never uses (a) at p = dim |
| §5.1 trace dual | plane h(e,f) = u⁻¹ | h(ae+bf,e) = −bu⁻¹, h(ae+bf,f) = au⁻¹ ⇒ Λ^∨ = Λ; O_F-dual = uΛ | invariants (0,0) |
| §5.1 line | h(e,e) = 1 | Λ^∨ = u⁻¹Λ | invariant 1 = 2·0+1 (§5.5) |
| §5.1 integral vector | h(x,x) ∈ F₀ ∩ u⁻¹O_F | = O_F₀ (even u-valuation) | line integral ⟺ h(x,x) ∈ O_F₀ |
| §2.7 HRR | smooth projective V(Λ) | χ(α) = deg(ch α·td T) linear in K₀ | factors through K̄₀ |
| gap:relative-fundamental-lemma | F/F₀ unramified, m = 1, W = ⟨1⟩ | Λ = O_F·e₁ self-dual since h(e₁,e₁) = 1 is a unit; Λ ⊕ O_F·e self-dual in W ⊕ ⟨1⟩; the other line ⟨ϖ⟩ has no self-dual lattice (valuation 1 is odd) | the unit matches the self-dual space and 0 the other, as stated |
| gap:relative-fundamental-lemma | split F = F₀ × F₀ | one hermitian space per rank, U(W) ≅ GL_m(F₀) | no "other space"; elementary base change is stated separately |
| gap:relative-finite-transfer | m = 1, F unramified | two lines ⟨1⟩, ⟨ϖ⟩; every regular semisimple orbit of Res(GL₁ × GL₂) matches exactly one | both directions are meaningful; extension by zero gives orbital integrals 0 on the other space |

## Notes for the maintainer

- **Renamed gap slug.** `gap:jr-afl-local-inputs` no longer exists. The three new slugs, `gap:jr-zhang-formulation-fl`, `gap:jr-smooth-transfer-existence` and `gap:jr-transfer-weil-compatibility`, are requests to EndoscopicTransferAndUnitaryTraceComparison (open PR). No other roadmap cited the old slug.
- **GanGrossPrasadUnitaryGroups gap names.** `gap:relative-finite-transfer` and `gap:relative-fundamental-lemma` are now declared in this roadmap's `gaps` too. They have the same supplier (EndoscopicTransferAndUnitaryTraceComparison, merge order 149) and the same content as GanGrossPrasadUnitaryGroups' requests (board package, merge order 239; both come before this roadmap at 350). Keep the two declarations of each slug in agreement. Ours names section "Layers 2 and 4"; GanGrossPrasadUnitaryGroups names its "Part II relative comparison continuation". When the supplier settles where the Jacquet–Rallis comparison lives, both should cite that one section. The depcheck reports no problem.
- **Headings.** New heading §7.5a. §8.6 keeps its number and title, but its statement changed: it is now the identity for lattices of odd largest invariant, not a reduction step. No other roadmap cites §8.6 or §8.7. SchemeKTheoryOperationsPartII on main mentions this roadmap only as a consumer.
- **For human review.** The roadmap now states plainly that two published theorems are only partly proved by their published arguments:
  - K Theorem 1.3 in rank n ≥ 4, via K Lemma 9.6;
  - Z Theorem 15.1's group statement at p = n ≥ 5, via Z Proposition 4.12(i).

  An expert confirmation, or a pointer to a fix, would settle §8.6 and the q = n converse.
- **Untrusted text.** Nothing in the reviews or fetched texts asked for anything outside the job.
