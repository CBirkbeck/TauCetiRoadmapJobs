# Review of ModularForms (pull request #1706 at 75cafd5)
**Verdict:** accepted

This is an incremental re-review of the 85 lines changed since 3453d2b, all in `TauCetiRoadmap/ModularForms/README.md` (64 insertions, 21 deletions). `Suggested.lean` is byte-identical to 3453d2b (and to a24d49a). The changed passages are:
- Scope (lines 32–33: HalfIntegralWeightModularForms' consumption);
- two supplier-contract additions (`Complex.cot`, lines 129–130; `TauCeti.Contour.classicalResidueTheorem_starConvex`, lines 272–278) and the path sentence at line 160;
- the earlier-label table (new row "Layer 8W", line 344);
- §0.2: the Euclidean-algorithm route for the value of ε at c>0 (lines 410–414), the cotangent form of Dedekind sums and the residue route to reciprocity (lines 420–428), the derivation of the cusp orders (lines 463–469), two new Checks (lines 487–494), the split *Needs:* line (lines 505–516) and the Dependencies sentence (lines 527–528);
- Downstream consumers (lines 1529–1546).

No finding remains, new or carried. What was checked is below.

## Previous findings

- R01 — repaired: "`TauCeti.Contour.classicalResidueTheorem_starConvex` in `TauCeti/Analysis/Contour/StarConvex.lean`: for an open set Ω star-shaped about a point, a finite set S, …" (README.md:272–278); the *Needs:* item at 509–510 names it and `Complex.cot`; the Kronecker-form item (511–513) adds "the translation and inversion laws"; Dependencies (527–528) adds "cotangent and residue-theorem". No new problem: all four repair items are present and the declaration's hypotheses are described correctly (see below).
- R02 — repaired: "It consumes Layers 0–10 of this roadmap" (README.md:32–33) and "besides the rest of Layers 0–10" (1544–1545). The list differs from the one the previous report proposed, but it is HalfIntegralWeightModularForms' own statement of what it consumes (#1721 line 358: "ModularForms Layers 0–10 for integral-weight forms, Hecke theory, newforms, products and …"), so it is correct.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My rerun at 75cafd5 reports every check 0 and OK, with the same counters as the worker's run: `set_option=0 … build=0 OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ModularForms'` is empty: nothing is changed outside the folder.
- **Dependency check.** `depcheck: 244 roadmaps, 2464 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean TauCetiRoadmap/ModularForms/Suggested.lean` exits 0. The only warnings are the eleven `declaration uses sorry`, at lines 42, 57, 66, 79, 88, 95, 101, 108, 122, 134 and 145.
- **Signatures.** `git diff 3453d2b HEAD -- TauCetiRoadmap/ModularForms/Suggested.lean` is empty, so the worker's elaborated signatures (11 declarations, 0 with a dropped binder) are those checked in the previous reports; `etaTransformation` has the single binder γ and no `variable` block.
- **Probe and headlines.** The one-tactic probe and the headline review of the previous reports stand unchanged. The new §0.2 material (the ε route, the cotangent form, the residue route, the order derivation) consists of proof routes for targets already stated in the README; none is a headline, so nothing new belongs in `Suggested.lean`.

### Library declarations opened at the pins (4 new)

- `Complex.cot` at `Mathlib/Analysis/Complex/Trigonometric.lean:44`, inside `namespace Complex` (line 23): `cos z / sin z`. The contract's path and description are exact.
- `TauCeti.Contour.classicalResidueTheorem_starConvex` at `TauCeti/Analysis/Contour/StarConvex.lean:193`, inside `namespace TauCeti.Contour` (line 105). Hypotheses: `StarConvex ℝ x Ω`, `IsOpen Ω`, `DifferentiableOn ℂ f (Ω \ S)` for a `Finset ℂ` S, `MeromorphicAt f s` for s ∈ S with s ∈ Ω, `IsPiecewiseC1On γ a b`, γ in Ω, `γ a = γ b`, γ off S; conclusion `∫ t in a..b, deriv γ t • f (γ t) = 2πi ∑_{s∈S} windingNumber γ a b s * residue f s`. This is exactly what the contract bullet at 272–278 says.
- `TauCeti.Contour.residue` at `TauCeti/Analysis/Contour/Residue/Basic.lean:80` and `TauCeti.Contour.windingNumber` at `TauCeti/Analysis/Contour/Winding/Number/Basic.lean:76`, both inside `namespace TauCeti.Contour`.
- A `#check` scratch file for these names did not elaborate: the object file of `TauCeti.Analysis.Contour.StarConvex` is not built in the worktree (it is not imported by `Suggested.lean`), so the names were resolved by reading the files at the pin instead.

### Cross-roadmap citations resolved (the Downstream and Scope lists)

- **NoncongruenceModularForms** (#1709): its citations of this roadmap name Layers 0 (lines 1545, 1557), 1 (244, 1349–1379), 2–3 (1452–1483), 4 (1557), 8 (1502, 1557), 10B (99, 656) and 10C (1391, 1425), and the normalized j. This supports "consumes Layers 0–4, 8, 10B and 10C, the order dictionary of §1.1 and analytic Riemann–Roch of §10B among them" (README.md:1529–1531).
- **AlgebraicModularFormsAndSerreWeights** (#928, read with `roadmaps show --pr 928`): it cites Layers 0 (lines 229, 269, 1366), 2 (377, 1382), 4–5 (1345–1415), 8 (355–427), 8G (1401, 1415) and 10/10C (229–231, 269). "Layers 0, 2, 4, 5, 8 and 10" (README.md:1537–1538) covers these; 8G's content is §8.2 of Layer 8 by the label table.
- **QSeriesPartitionsAndMockModularForms** (#1391): §0.2 is consumed at lines 13, 822, 832 and 842 (the eta multiplier, with the same values at T, S, −I and at (1 0; 1 1)); Layers 10A–10B and Conventions at lines 755, 795 and 1326. This supports "§§10A–10B for its analytic modular curves and their cohomology" (README.md:1541–1542).
- **HalfIntegralWeightModularForms** (#1721): line 358 "ModularForms Layers 0–10"; specific citations of Layers 0, 1, 2, 3, 4, 5, 7, 8, 8G and 10 at lines 504, 604, 623, 710, 751, 1246, 1275, 1435, 1467, 1495, 1559, 1709, 1729. This supports Scope 32–33 and Downstream 1544–1545.
- **The 8W row.** "Layer 8W, the weight-one lattice by the Deligne–Serre route | §8.1": §8.1 is "Rational descent and the weight-one lattice" (README.md:921).
- `overlaps.md`: no other open pull request changes this roadmap; no cited id is dropped by an open pull request; the eight dropped anchors that other roadmaps cite each have an old → new row in the label table (checked in the previous report, unchanged here).
- `citations.md`'s single lead (`LeanBridge.QExpansion.LMFDB.W60.identifies_lmfdb_1_60_a_orbit`, README.md:1580) is outside the diff, unchanged since 3453d2b, and is a name in LeanBridge at a stated revision, not a claim about this roadmap's `Suggested.lean`.

### Sources (seeded sample)

Of the fifteen sampled targets, only "0.2 The eta transformation and eta quotients" falls in the diff; the other fourteen are unchanged and stand as verified in the earlier reports. The diff adds no new locator: the new routes cite Apostol Theorem 3.7 (already cited, `apostol-mfds` uncertified) and the two library declarations above. The mathematics of each new route was checked by computation (table rows N1–N12).

### Adversarial table

Rows N1–N12 are new, for the changed statements, with the values computed (eta by its product to 400 terms at τ=0.1+0.9i; residues by a numerical circle integral; the contour by Simpson quadrature). Rows marked (r7) and (r6) are carried from the previous reports for statements the diff leaves untouched.

| Statement | Instances | Values on the two sides | Result; change |
|---|---|---|---|
| N1. T-step ε(γT)=e^(πi/12)ε(γ), s(d+c,c)=s(d,c) (410–412) | (1 0; 2 1), (3 2; 7 5) | numeric ratios 0.965926+0.258819i = e^(πi/12); s(d+c,c)−s(d,c) = 0 | holds; retain |
| N2. S-step ε(γS)=e^(−πi/4)ε(γ) for c,d>0, γS=(b −a; d −c) (412–413) | (1 0; 2 1), (1 1; 2 3), (2 1; 3 2), (3 2; 7 5) | numeric ratio 0.707107−0.707107i = e^(−πi/4) in all four; principal roots multiply because arg(d−c/τ)+arg(−iτ) = arg(−i(dτ−c)) ∈ (−π/2, π/2) | holds; retain |
| N3. S-step right side via reciprocity | symbolic | (b−c)/(12d)+s(c,d)−1/4 = (a+d)/(12c)−s(d,c)−1/2 reduces to c(b−c)+c²+d²+1 = d(a+d), i.e. ad−bc=1: exact, not only mod 2 | holds; retain |
| N4. S-step needs d>0 (negative control, 491–494) | (1 −1; 3 −2), (2 −1; 5 −2) | numeric ratios −0.707107+0.707107i = −e^(−πi/4) = e^(3πi/4) | the Check's claim holds |
| N5. c=1 base γ=TᵃSTᵈ=(a ad−1; 1 d) (413–414) | (a,d)=(2,3), (−1,4) | numeric 0.866025+0.5i, 1.0; exp(πi((a+d)/12−1/4)) the same | holds; retain |
| N6. Check: S-step at (1 0; 2 1) (491–492) | γ, γS=(0 −1; 1 −2) | numeric ε(γ)=0.866025−0.5i=exp(−πi/6); ε(γS)=0.258819−0.965926i=exp(−5πi/12); ratio e^(−πi/4) | correct |
| N7. Check: γ=(1 −1; 3 −2), ε(γS)=i·ε((1 1; 2 3)) (492–494) | numeric | det 1; ε(γ)=0.5−0.866025i=exp(−πi/3); ε((1 1; 2 3))=exp(−πi/12); i·that = 0.258819+0.965926i = exp(5πi/12) = numeric ε((−1 −1; −2 −3)); ratio exp(3πi/4) | correct; ε(−γ′)=iε(γ′) for c′>0 since √w=i√(−w) on ℍ, consistent with ε(−I)=−i |
| N8. Cotangent form s(h,c)=(1/(4c))Σcot(πj/c)cot(πhj/c) (420–421) | all coprime 1≤h,c≤19 | 0 mismatches with the sawtooth definition (tolerance 10⁻¹²); s(2,3): (1/12)(−1/3−1/3)=−1/18; with 1/(2c): −1/9 | holds; Check 487–489 correct |
| N9. Residues of cot(πz)cot(πhz)cot(πcz) (423–426) | (h,c)=(2,3), (3,5), (1,1), (1,4) | at 0: −0.247574, −0.247574, −0.318310, −0.477465 = −(h²+c²+1)/(3πhc); Σ over j/h: 0, −0.070736, 0, 0 = 4s(c,h)/π; Σ over j/c: −0.070736, 0, 0, 0.159155 = 4s(h,c)/π; totals all −0.318310 = −1/π | holds; retain |
| N10. Horizontal sides → −2i, vertical sides cancel, rectangle integral (426–428) | (2,3), sides at Re z=0.0123 and 1.0123, heights T=2, 5, 10 | top+bottom = −2.000000i at every T (cot(πz)→∓i as Im z→±∞); the two vertical integrals differ by 0; the full rectangle gives −2.000000i = 2πi·(−1/π) | holds; retain |
| N11. Check (1,1): only the triple pole, residue −1/π, s(1,1)=0=3/12−1/4 (489–490) | h=c=1 | residue of cot³(πz) at 0: −0.318310 = −3/(3π); no simple poles; 3/12−1/4=0 | correct |
| N12. Cusp-order derivation: gcd(δc,d)=gcd(d,δ), (δc δx; d y)=σ′(A B; 0 δ/A), c′w+d′=(A/δ)(dτ+y), leading exponent A²/(24δ), w conversion (463–469) | (N,d,δ)=(4,2,4), (12,6,4), (9,3,9), (6,2,3), (8,4,8) with σ=(1 0; d 1) | A=2,2,3,1,4; factorisation verified entrywise; c′w+d′−(A/δ)(dτ+y)=0; \|η(δστ)/√(dτ+y)\| / \|e(A²τ/(24δ))\| at τ=0.37+4i = 0.7071, 0.7071, 0.5774, 0.5774, 0.7071 = √(A/δ), a constant; w = N/gcd(d²,N) = N/(d·gcd(d,N/d)) = 1,1,1,3,1 | holds; retain |
| (r7) Reciprocity law | all coprime 1≤h,c≤40 | 979 pairs, 0 failures | retain |
| (r7) Reciprocity, degenerate and negative control | (1,1); (2,4) | 0=3/12−1/4; for (2,4): s=0 both sides, right side −1/32 | coprimality stated |
| (r7) Kronecker form vs Dedekind value | 1≤c≤30, \|d\|≤45 | 1671 matrices, 0 mismatches | retain |
| (r7) Kronecker form vs η(γτ)/(√(cτ+d)η(τ)) | c≤12, \|d\|≤15, three a's, three τ | 2061 evaluations, 0 failures | retain |
| (r7) Wrong models of the symbol | swap (d/c)↔(c/d) at (1 2; 3 7); (2/−1) | (7/3)=1, (3/7)=−1; (−2/−1)=−1, (−2/1)=1 | text correct |
| (r7) c=1 base of the Kronecker form | (a b; 1 d) | both forms e((a+d)/24−1/8) | retain |
| (r7) Checks (14 3; 23 5); (1 0; 2 1), (−1 0; 2 −1); (2,3) reciprocity; η(z)η(23z) | as listed there | (5/23)=−1, s(5,23)=7/46, e(−1/6); e(−1/12), e(−1/6); −1/18; ε(γ₁)ε(γ₂₃)=−1=(−23/5) | correct |
| (r7) Criterion via Kronecker form | N=2,4,8,11,12,23; ten quotients | 62–118 matrices each, 0 failures | retain |
| (r7) c≤0 reduction; cusp orders for every exponent vector; width w | −I, c<0; eight quotients; N=4 | χ(−1)=(−1)ᵏ; Ligozat values 1/4, 0, 1, 1/24, 2/3, 1/24, −1/8, 1/2 match numerics; w=1,4,1 | retain |
| (r7) Scope normalisation identity; contracts (coefficient criterion, Hecke algebra, Jacobi) | ν_η vs ε; Δ; level 1; J(3\|7) | equal exponents; −6048, −1472; ℤ; −1 | correct |
| (r6) Translation law; inversion law root choice; `etaTransformation` existence; ε formula numerically; ε at generators; Check (1 0; n 1); Lean Dedekind sum; Lean context | as listed in PRREVIEW-ModularForms~6 | e^(πi/12); √(−iτ) values 1, √2, 2^(1/4)e^(iπ/8); (√w)²⁴=w¹²; 164 matrices × 3 τ, 0 failures; e^(πi/12), e^(−πi/4), −i, 1; n=3 e^(−3πi/12); `Int.fract`−1/2; binder γ only | retain |
| (r6) 0.1 constant terms and corrected E₂ | χ mod 3, k=1; t=2 | B₁,χ=−1/3, a₀=1/6; −1−24q−24q² | retain |
| (r6) 1.1 δ, cusp term, irregular order | Γ₁(5), Δ; exponents 1, 3 | widths 1,1,5,5; mass 24; ord 1; 2 | retain |
| (r6) 2.1 rank two p=2; 2.2 degrees | T(1,2)²; diag(1,p), pI | T(1,4)+3T(2,2); p+1, 1 | retain |
| (r6) 3.1 oldspace; 4.1 primitive associate; 5.1 controls | N=11, 22; Δ(z)+cΔ(2z); Δ at level 2, 2Δ | old 0/new 1, old 2/new 0; a₂=−24+c, conductor 1; not new, a₁=2 | retain |
| (r6) 6.1 commutation scalar; 7.1 abscissa | χ(2)=i mod 5, k=3; E₄ | 4−i≠1+4i; pole at 4 | retain |
| (r6) 8.0 normalisation, descent, cusp 0, N≤3, surjectivity; 8.1 bounded denominators; 8.2 norm factors | Δ; √2Δ, Δ/11; f(i); Γ₁(10); η(z)η(23z); Δ/11, fΔ; √2, 1 | q−24q²; √2∉ℚ, 1/11∈ℚ; E₆(i)=0; Γ₁(2)∩Γ₁(5)=Γ₁(10); avatar of σ(φs^k); a₁=1 after ×11, q²−25q³; X²−2, (X−1)² | retain |
| (r6) 9.1 Satake; 9.2 twist level, depletion; 9.3 Sturm length, letters | Δ p=2, level 11 p=11; ψ mod m, Δ mod 2; Γ₁(13) k=2, 25, 26 | X²+24X+2048, {1,0}; Γ₁(Nm²), q+252q³; B=28, z, ba | retain |
| (r6) 10A genus; 10B Riemann–Roch, Hurwitz; 10C dimensions, β=μ∗μ, newspace | Γ₀(11), Γ₀(2), Γ₁(13), Γ₁(22); ℙ¹, id, z², double cover; level 1 k=12, Γ(3), 1,p,p²,p³,6,12, Γ₀(22), Γ₁(22), Γ₁(13) | 1, 0, 2, 6; χ=deg+1, −2=−2+0, −2=−4+2, 0=−4+4; 2, 1; 4, 0; 1,−2,1,0,4,−2; 0; 4; 2 | retain |
| (r6) 10D lattice, uniformisation, −1, order three, cusps, degree; 11.1 trace formula; weight-60 example | m=2, 3; Y=℘′/2; N∣2; Γ₁(13); k=12 n=1…5, k=16, 24, 60, k=2; mod 17, 37, 83 | 4π⁴/3, 8π⁶/27; Y²=X³−(g₂/4)X−g₃/4; 2/N∈ℤ+ℤz ⇔ N∣2; d=84; 1, −24, 252, −1472, 4830; 216, 1080, −449691864; k=2 gives −1, −3 where the trace is 0, 0; roots 6, 9, 10; 16, 22, 23; none | retain k≥4 |
| (r6) `existsCoefficientTwist`, `crossLevelStrongMultiplicityOne`, `existsUniqueGaloisConjugate`, `newspaceDimension` | m=1, n=0; k≤0; Δ, σ=id; k≤0, N=1 | ψ(0)=1, a₀=0; no newform; g=Δ; 0=0, β(1)dim S_k | retain |

## Not verifiable

- **Apostol, *Modular Functions and Dirichlet Series in Number Theory*, Theorems 3.1, 3.4 and 3.7** (`apostol-mfds`, settled as uncertified). The reciprocity law and the ε values were checked by computation instead (N1–N11 and the r7 rows).
- **Ono, *The Web of Modularity*, Theorems 1.64–1.65.** No legal copy in the earlier rounds and no manifest entry; the criterion and the orders were checked by computation (N12 and the r7 rows), and the order formula rests on Rouse–Webb, which was read.
- **The `#check` probe of the three new library names** did not elaborate because the object file of `TauCeti.Analysis.Contour.StarConvex` is not built in the worktree; the names, namespaces, files and line numbers were confirmed by reading the pinned sources.
- **The uncertified sources carried from earlier reports** (Diamond–Shurman, Miyake, Shimura, Atkin–Li, Forster, Sturm, Silverman) are cited by locator only; none is touched by this diff.

## Source issues

- none
