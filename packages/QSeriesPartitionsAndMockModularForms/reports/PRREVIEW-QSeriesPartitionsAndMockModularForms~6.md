# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at 367fc6f)

**Verdict:** needs changes

Incremental re-review of the 6 lines changed since b6c4190 (`TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` lines 13, 822 and 1763; `Suggested.lean` is byte-identical to 4daf6e0; nothing changed outside the folder). The three edits move the Dedekind-sum and Kronecker-symbol closed forms of ν_eta for c>0 to ModularForms §0.2 everywhere they are named, which repairs the previous R02. The previous R01 concerned the pull request's description, which this head does not change, so it is the one finding left. The folder itself needs no edit.

## R01 (P3) — ModularForms §0.2 exists only at the open ModularForms revision, and the description does not name that revision

**Location.** `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` line 832: “*Needs:* TauCetiRoadmap.ModularForms §0.2; Mathlib `ModularForm.eta_ne_zero`, …”; the same id is cited at lines 13, 47, 48, 101, 822, 842, 972 and 1763.

**Claim.** §5.2 consumes the eta transformation, its generator values and (by reference only) its closed forms from ModularForms §0.2.

**Witness.** ModularForms on main (eaf17b1) has no Layer 0 and no §0.2. The id is defined only at the open ModularForms revision #1706, head 3453d2ba, `TauCetiRoadmap/ModularForms/README.md` lines 385–470 (the law at 390–391, the Dedekind-sum value at 393, the Kronecker form at 409–415). The pull request's “Depends on” list and merge-order paragraph, as quoted at this head, name neither ModularForms nor #1706.

**Repair.** Unchanged from the previous report: leave the README as it is (it cites the roadmap and section, as the house style requires), and in the pull request's description add ModularForms (#1706) to the “Depends on” list and place it before this pull request in the merge-order paragraph. Tested on the instance: #1706's README cites this roadmap only as a consumer of §0.2 (line 1499), so the edge ModularForms → QSeriesPartitionsAndMockModularForms creates no cycle, and the dependency check with that edge already reports 0 problems. This is a description-only change; no file in the folder needs to move.

## Previous findings

- R01 — not repaired: the diff touches only README lines 13, 822 and 1763; the description's “Depends on” list still reads “#1172 … #925 … #851 … #1314 … #1063” and the merge-order chain still ends “#1314 (HabiroCyclotomicCompletions) → this pull request”, with no ModularForms entry (this report's R01).
- R02 — repaired: line 1763 now reads “and its cocycle; the Dedekind-sum and Kronecker-symbol closed forms of ν_eta(γ) for c>0 are ModularForms §0.2’s and are not restated here”, and lines 13 and 822 name the same owner, matching #1706 lines 393, 409–415 and 1500–1502. The repair introduced no new problem: the three sentences, the §0.2 contract at line 101 and Check “eta multiplier positive c” at line 842 all name one owner, and §5.2 still states neither closed form.

## Verified sound

**The three changed lines.** Line 13 now says §0.2 owns “its Dedekind-sum and Kronecker-symbol closed forms for c>0” and that §5.2 “states neither closed form of ν_eta”; line 822 says the two closed forms “are that section’s and are not reproved or restated here”; line 1763 is quoted above. Each claim about §0.2 was resolved at #1706 head 3453d2ba: the Dedekind-sum value exp(πi((a+d)/(12c)−s(d,c)−1/4)) at line 393, the Kronecker form (d/c)·e(((a+d)c−bd(c²−1)−3c)/24) for odd c and (c/d)·e(((a+d)c−bd(c²−1)+3d−3−3cd)/24) for even c at lines 409–415, and the consumer sentence at lines 1499–1502, which hands this roadmap the transformation and generator laws and HalfIntegralWeightModularForms the closed forms. A grep by object over main and the 467 open heads for the Kronecker form of the eta multiplier finds it stated only at #1706 §0.2 and #1721 §3.3 (lines 962–968) and named, as consumed, in this README; #1721's own proof of both closed forms duplicates #1706, which is a matter between those two pull requests, not in this folder. §5.2 itself (lines 822–842) contains no closed-form formula: its public laws are the supplied law, the cocycle with its ±1 root ratio and the lifted character, and its Checks compute only ν_eta(T), ν_eta(S), ν_eta(−I), ν_eta(1) and ν_eta(1 0;1 1).

**Consumer side.** HalfIntegralWeightModularForms #1721 head 1a78fdd2, `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md` 944–947 consumes from §5.2 the quotient definition, its independence of z, ν_η(T)=e(1/24), ν_η(S)=e(−1/8), the law and the square-root cocycle; §5.2 at this head still carries every one of these (public laws 1–2, Checks “t” and “s”), so the consumer is not broken by the edit.

**Gate.** The worker's gate on this head (data) passed every check with `build=0`. This review's own run of the gate with the build reproduced every text, metadata, dependency and outside-folder counter at 0, and failed only the build step with a Lake error that is not the pull request's: the shared Lake package directory that the worktree's `.lake/packages` link points to (the one keyed to the branch's manifest, Tau Ceti a91d3aaf and Mathlib 6b7abb3c) no longer exists on this machine, and Lake refuses to materialize a dependency over the dangling link. The worker's passing build and the previous two reviews' elaborations are of the same `Suggested.lean` (unchanged since 4daf6e0). `git diff --stat origin/main...HEAD` outside the folder lists nothing.

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`, exit 0, with no UPWARD, CYCLE or moved line. This roadmap is at line 248 of the merge order; ModularForms is on main.

**Elaboration.** Not re-run at this head for the reason under Gate: the probe copy of `Suggested.lean` with 27 `#check @…` lines was prepared, but `lake env lean` fails before reading it. `Suggested.lean` is byte-identical to the file the previous review elaborated (exit 0, 15 `declaration uses sorry` warnings, 27 signatures, 12 real-bodied definitions, no statable headline absent, no padding found by the one-tactic probe); none of the changed README lines names a Lean declaration of this roadmap, so the README–Lean agreement of the previous report stands.

**Pinned declarations.** The changed lines cite no library declaration. The §5.2 *Needs:* line (unchanged) cites `ModularForm.eta_ne_zero` (`Mathlib/NumberTheory/ModularForms/DedekindEta.lean` 113), `ModularForm.eta_comp_eq_csqrt_I_inv` (`Mathlib/NumberTheory/ModularForms/Discriminant.lean` 135–136) and `ModularForm.discriminant_T_invariant` (same file 127), resolved at Mathlib 6b7abb3c by the previous review; they could not be reopened at this round for the reason under Gate and are carried.

**Seeded sample in the changed passages.** Only “5.2 the eta multiplier” falls in the diff. Zwegers2002 line 734 is Theorem 1.11, line 746 defines v(γ)=η(γτ)/((cτ+d)^(1/2)η(τ)) for γ∈SL₂(ℤ) (the quotient §5.2 identifies with ε(γ)), line 741 uses v(γ)⁻³ in part (2), and line 804 has χ(γ)=v(γ)³ on printed p. 17 (header at line 798); printed pp. 15–17 are the extraction's pages 19–21. The theorem number, pages and the definition match the citation at line 822. The other fourteen seeded targets are untouched; their checks from the previous reports stand. The README flags no locator as unverified.

**Overlap and citation leads.** IntegralLattices §0G (lines 1303, 1365) is on main at `TauCetiRoadmap/IntegralLattices/README.md` 568, so the lead that only #1239 defines it is false. ModularForms §0.2 is R01. `BruinierFunke2003, §3` (line 1167) is a source key, and `QToolkit.pochhammer` (line 69) is HabiroCyclotomicCompletions §1.1's declaration; both unchanged false leads. No open pull request changes this roadmap and none drops an id it cites.

**Gaps.** The three declared gaps are unchanged in the README and `design/plan.json`; §5.2 still cites `gap:classical-metaplectic-model` for the cover comparison only.

**Adversarial mathematics.** The new rows have computed values for the changed statements: the Kronecker form and the Dedekind-sum value that lines 13, 822 and 1763 attribute to §0.2 were evaluated exactly (Dedekind sums as rationals, Kronecker symbols by the Jacobi recursion) at eight matrices and compared with η(γτ)/(√(cτ+d)η(τ)) computed from the eta product (6000 factors) at τ=0.17+1.1i where Im γτ allows it. The rows for untouched statements are carried from the previous report and marked.

| Statement / object | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| Lines 13, 822, 1763: §0.2's two closed forms for c>0 are one object (Kronecker form = Dedekind-sum value) | S; (1 0;1 1); (2 1;3 2); (14 3;23 5); (1 0;2 1); (−1 0;2 −1); (37 20;61 33); (1 0;4 1) | Kronecker form: 0.707107−0.707107i, 0.965926−0.258819i, 0.965926−0.258819i, 0.500000−0.866025i, 0.866025−0.500000i, 0.500000−0.866025i, 0.258819−0.965926i, 0.500000−0.866025i; Dedekind-sum value identical in each case (|difference| ≤ 4×10⁻¹¹, exact rationals: s(5,23)=7/46, s(33,61) by the sum) | Keep: one owner, one value |
| Same, against η itself | S, (1 0;1 1), (2 1;3 2), (1 0;2 1), (−1 0;2 −1) at τ=0.17+1.1i | η(γτ)/(√(cτ+d)η(τ)) = 0.707107−0.707107i, 0.965926−0.258819i, 0.965926−0.258819i, 0.866025−0.500000i, 0.500000−0.866025i, equal to both closed forms | Keep |
| Kronecker form, odd c by hand | (2 1;3 2): (2/3)=−1; exponent (4·3−1·2·8−9)/24=−13/24 | −e(−13/24)=e(−1/24)=exp(−πi/12); Dedekind: s(2,3)=−1/18, exp(πi(4/36+1/18−1/4))=exp(−πi/12) | Keep |
| Kronecker form, even c by hand | (−1 0;2 −1): (2/−1)=+1; exponent (−4+(−3)−3+6)/24=−1/6 | e(−1/6)=exp(−πi/3)=0.5−0.866i; Dedekind: s(−1,2)=0, exp(πi(−2/24−1/4))=exp(−πi/3) | Keep |
| Line 13: “§5.2 states neither closed form” | grep of lines 822–842 for s(d,c), Dedekind, Kronecker, Rademacher | only the Check at 842 names “the Dedekind-sum value of ModularForms §0.2” as the supplier's value, with (a+d)/(12c)=1/6, s(1,1)=0; no formula is stated | Keep |
| Line 1763: #1721 §3.3's consumption list against §5.2's public laws | quotient, z-independence, ν(T), ν(S), law, cocycle | each is a public law or Check of §5.2 at this head (lines 826–827, 836–837); #1721 line 947 says none is redefined there | Keep |
| Lines 13, 101: §0.2 supplies ε(γ) with ε²⁴=1 and η(γτ)=ε(γ)√(cτ+d)η(τ) | T, S, −I, (1 0;1 1), (2 1;3 2), (14 3;23 5), (1 0;2 1), (−1 0;2 −1) at the three τ | the quotient η(γτ)/(√(cτ+d)η(τ)) is the same at all three τ for each matrix; its 24th power is 1.000000 every time | Keep (carried from r5) |
| Line 101: Dedekind-sum value for c>0, exp(πi((a+d)/(12c)−s(d,c)−1/4)) | S; (1 0;1 1); (2 1;3 2); (14 3;23 5); (1 0;2 1); (−1 0;2 −1) | s(0,1)=0, s(1,1)=0, s(2,3)=−1/18, s(5,23)=7/46, s(1,2)=s(−1,2)=0; formula gives 0.707107−0.707107i, 0.965926−0.258819i, 0.965926−0.258819i, 0.500000−0.866025i, 0.866025−0.500000i, 0.500000−0.866025i, equal to the numerical quotients | Keep (carried from r5) |
| Line 101: Dedekind value without the −1/4 (Apostol's root) | (1 0;1 1) | exp(πi/6)=0.866025+0.5i, and the quotient with √(−i(τ+1)) is numerically 0.866025+0.500000i: the −1/4 converts the roots exactly | Keep (carried from r5) |
| Line 101 / §5.2: ε(T), ε(S), ε(−I) | c=0,d=1; c=1,d=0; c=0,d=−1 | 0.965926+0.258819i=e^(πi/12); 0.707107−0.707107i=e^(−πi/4); −1.000000i=1/√(−1)=1/i | Keep (carried from r5) |
| §5.2 definition: ν_eta=ε equals the quotient at every τ | c=0 ⇒ d=±1; c≠0 | cτ+d=±1 or Im(cτ+d)=c·Im τ≠0, η(τ)≠0 by `eta_ne_zero`, so the quotient is defined, and it equals ε(γ) by §0.2's law | Keep (carried from r5) |
| §5.2 inversion rewrite (√i)⁻¹√τ=√(−iτ) | the three τ | √(−iτ)/√τ=0.707107−0.707107i=e^(−πi/4) each time; η(−1/τ)/(√(−iτ)η(τ))=1.000000 | Keep (carried from r5) |
| §5.2 public law 1 (the supplied law in this notation) | as in the first row | as in the first row; the law is labelled as §0.2's and not reproved | Keep (carried from r5) |
| §5.2 cocycle law and root ratio ±1 | (γ₁,γ₂)=(−I,−I), (S,S), (S,T), (T,S), ((2 1;3 2),S), (S,(14 3;23 5)), (−I,S) at three τ | ratios −1, +1, +1, +1, +1, +1, −1, constant in τ; residuals of the law ≤1.3×10⁻¹³ | Keep (carried from r5) |
| §5.2 cocycle law at large c | (14 3;23 5)(2 1;3 2)=(37 20;61 33) | ν(37 20;61 33) by the Dedekind value 0.258819−0.965926i = ν(γ₁)ν(γ₂)·ratio with ratio 1.0000 at τ=2i. Direct product evaluation is truncation-limited, since Im(γτ)≈4×10⁻⁴ | Keep (carried from r5) |
| §5.2 root-ratio continuity by cases (repaired R02) | γ₁=−I (c₁=0, d₁=−1); γ₁=S (c₁=1) | c=0: √(−1)=i is constant even though −1 is on the cut; c≠0: c·γ₂τ+d is non-real, so the root is continuous; the ±1-valued ratio is constant on connected ℍ (−1 and +1 in the rows above) | Keep (carried from r5) |
| Check “eta multiplier positive c” | (1 0;1 1) | (a+d)/(12c)=2/12=1/6, s(1,1)=0, exp(πi(1/6−1/4))=e^(−πi/12)=0.965926−0.258819i, equal to the numerical quotient at all three τ; competing root gives e^(πi/6) as stated | Keep (carried from r5) |
| Checks “inversion root”, “discriminant” (unchanged text, re-run against the new *Needs:*) | τ=i; 24th powers | √(−i·i)=1; −√(−iτ) forces η(i)=−η(i), against `eta_ne_zero`; exp(πi/24)²⁴=−1.000000 against `discriminant_T_invariant`; exp(−πi/4)²⁴=1.000000 | Keep; both names now in the *Needs:* line (carried from r5) |
| §5.2 *Needs:* (line 832) | each item against its use | §0.2: the law; `eta_ne_zero`: the quotient and Check “inversion root”; `eta_comp_eq_csqrt_I_inv`: the rewrite; `discriminant_T_invariant`: Check “discriminant”; gap: the lift. `CuspForm.discriminant` is no longer used, since τ-independence is §0.2's | Keep (carried from r5) |
| Layer 5 Dependencies (line 972) | union of §§5.1–5.7 *Needs:* | contains §0.2, `eta_ne_zero`, `eta_comp_eq_csqrt_I_inv`, `discriminant_T_invariant` and the gap | Keep (carried from r5) |
| §5.7 Check “modular inversion” (depends on §5.2) | S at τ=i | ν(S)⁻³√i=e^(3πi/4)e^(πi/4)=e^(πi)=−1 | Keep (carried from r5) |
| §11.2 Check “rank level lower unipotent” (uses ν_eta) | (1 0;N 1), N=10368 and N/3=3456 | §0.2's value e^(−πiN/12) (s(1,n)=(n−1)(n−2)/(12n), #1706 line 448): e^(−864πi)=1, e^(−288πi)=1 | Keep (carried from r5) |
| §4.8a new Check “weight-zero normalizations”, U₁₁ | F=q¹¹+q | Σ_(0≤j<11)e(11(τ+j)/11)=11q and Σ_j e((τ+j)/11)=e(τ/11)·Σ_j ζ₁₁^j=0, so U₁₁F=q; aₙ(U₁₁F)=a₁₁ₙ(F) gives a₁=1, a₁₁=0: agrees | Keep (carried from r5) |
| §4.8a new Check, Fricke at weight 0 | W=(0,−1;11,0), k=0 | `slash_apply`: F(Wτ)·\|det W\|^(−1)·denom⁰=F(−1/(11τ))/11 (σ W=id, det 11>0); (√11)^(2−0)=11, so the normalized operator is F(−1/(11τ)), the unnormalized slash 11⁻¹F(−1/(11τ)) | Keep (carried from r5) |
| §4.8a identification with ModularForms’ normalized Fricke operator at general k | N=11, k=2; involutivity | (√N)^(2−k)(F∣[k]W)(τ)=N^(1−k/2)·F(−1/(Nτ))·N^(k−1)(Nτ)^(−k)=N^(−k/2)τ^(−k)F(−1/(Nτ)); at k=0 it is F(−1/(Nτ)); at k=2, N=11: (11τ²)^(−1)F(−1/(11τ)), and applying it twice gives 11⁻²τ⁻²·(−1/(11τ))⁻²F(τ)=F(τ), the standard involution | Keep (carried from r5) |
| §4.8a Fricke principal-part identity with the identified operator | F=1 | 11·1−11·1=0=1−1; trace 1+11=12=[SL₂(ℤ):Γ₀(11)] (unchanged Check re-run) | Keep (carried from r5) |
| §8.1 new law: scalar multiplier χ(d_γ) ↔ Tau Ceti character space | integral k, γ∈Γ₀(N) | §8.1 automorphy F(γτ)=φ_γ(τ)^(2k)ν(γ)F(τ) with φ_γ²=cτ+d gives F(γτ)=(cτ+d)^k χ(d_γ)F(τ), i.e. F∣[k]γ=χ(d_γ)F, the right side of `mem_modFormCharSpace_iff_nebentypus`; sign of the lift φ is invisible since 2k is even; γ∈Γ₁(N) has d≡1, χ(1)=1, so F is a Γ₁(N)-form; cusp boundedness/vanishing match `ModularForm`/`CuspForm` | Keep (carried from r5) |
| §8.1 new law, parity instance | −I∈Γ₀(N), odd k, χ(−1)=1 | F∣[k](−I)=(−1)^kF=−F must equal χ(−1)F=F, so F=0 on both sides; both spaces are zero, agreement holds vacuously (no overclaim) | Keep (carried from r5) |
| §8.1 new Check “character entry” | N=5, χ(2)=i, γ=(3 1;5 2) | det 6−5=1, c=5≡0: γ∈Γ₀(5); χ(4)=i²=−1, χ(3)=χ(2³)=−i, χ(1)=1; χ(d_γ)=χ(2)=i; upper-left χ(3)=−i=conj(i); in general ad≡1 (N) gives χ(a)=χ(d)⁻¹, different from χ(d) unless χ²=1 | Keep (carried from r5) |
| Line 64 contract: the character space is the joint χ-eigenspace of the diamond operators | pin a91d3aaf | `modFormCharSpace k χ = ⨅ d, eigenspace (diamondOpHom k d) (χ d)` (file lines 315–317); `χ : (ZMod N)ˣ →* ℂˣ`, `k : ℤ`; no namespace in the file, so the bare names are the full names | Keep (carried from r5) |
| Line 46 Mathlib row: slash formula | g with det g>0; k=2, W=(0,−1;11,0) | `slash_apply` gives F(−1/(11τ))·11·(11τ)^(−2)=F(−1/(11τ))/(11τ²), which equals the normalized Fricke operator at k=2 with factor (√11)⁰=1 | Keep (carried from r5) |
| 4.8a full expansion (Lemma 4), existence | F=1 (N=M=0) | left side 1; right side A₀=1, all other A_r=0; a competing “g_n only” expansion gives constant coefficient 0≠1; a “G_n only” expansion vanishes at cusp 0 whereas 1(0)=1 | Keep; this is the repaired R01 instance (carried from r5) |
| 4.8a full expansion, uniqueness | orders at infinity of the generators | G_r: −r (r≥2); B₁₁: −1; 1: 0; g_r: μ(r)=1,2,3,5,4,6,7,8,10,9 for r=2…11, a bijection onto ℤ_{>0}; all orders distinct, so a vanishing combination has every coefficient 0 | Keep “uniquely” (carried from r5) |
| 4.8a full expansion, forced coefficients | F∈S holomorphic at cusp 0 (M=0) with N=1 | B₁₁ has pole order 1 at cusp 0, so A_(−1)=0 and F is constant; agrees with “no single simple pole on genus one” | Keep; formula allows the zero coefficient (carried from r5) |
| 4.8a S^∞ expansion (Lemma 5), degenerate | F∈S^∞ with M=0; M=1 | empty sum 0 on the right; on the left F has no pole (M=0) or one simple pole (M=1), so F is constant and vanishes at infinity: F=0 | Keep (carried from r5) |
| 4.8a S^∞ versus S | F=1 | value at infinity 1≠0, so 1∉S^∞; the Check “eleven full expansion” states exactly this | Keep (carried from r5) |
| 4.8a B₁₁ existence via G₂g₂ | orders at the two cusps | G₂: −2 at ∞, +1 at 0 (from g₂'s order μ(2)=1 under Fricke); g₂: +1 at ∞, −2 at 0; product: −1 at ∞, −1 at 0: simple poles at both; Fricke: (G₂g₂)(−1/(11τ)) = 11²g₂·11⁻²G₂ = G₂g₂ | Keep; Atkin (48)–(49), lines 534–536 (carried from r5) |
| 4.8a B₁₁ uniqueness up to a constant | two such B, B′ with leading q⁻¹ | B−B′ is holomorphic at ∞ with at most a simple pole at cusp 0; on genus one a single simple pole is impossible, so B−B′ is constant; Riemann–Roch: ℓ(P_∞+P_0)=2−1+1=2 | Keep (carried from r5) |
| 4.8a B₁₁ normalization | Atkin's B from Table 1 vs. G₂g₂−12 | constant coefficient of G₂g₂: 1·5+2·1=7, minus 12 gives −5 = Table 1 line 578; x¹ coefficient 19+10−12=17 = Table 1 | Keep; README's B₁₁ = Atkin's B + 5, its own declared normalization, harmless since A₀ absorbs constants and only Lemma 5 feeds X₁₁, Y₁₁ (carried from r5) |
| 4.8a Check “eleven Fricke pole” | span of 1, G_n, g_n | pole order at ∞ of a combination is max over nonzero terms of {r≥2, 0, none}: 0 or ≥2; B₁₁ has 1 | Keep (carried from r5) |
| 4.8a G_n, g_n memberships | n=2,3 from Table 1 | G₂=x⁻²(1,2,−12,…) ∈ S⁰ (Appendix A line 532), g₂=x(1,5,19,…) vanishes at ∞; g_n pole order at cusp 0 = order of G_n at ∞ = n | Keep (carried from r5) |
| 4.8a θ, μ, ξ, ε tables | n=2…8 | θ=(2,3,4,6,6) = Table 3 exponents 2,3,4,6,6; μ=(1,2,3,5,4) = Table 1 leading powers of g₂…g₆ (x¹,x²,x³,x⁵,x⁴); ξ(4..8)=(1,3,3,4,5), ε=ξ+1 for n≥4 = lines 235–239 | Keep (carried from r5) |
| Scope and §From AST: Powers law | k=0,s=2; k=1,s=1; k=0,s=1 | Δ_k yˢ = −s(s−1)yˢ − ks yˢ = s(1−k−s)yˢ: −2y², −y, 0 | Keep; sign matches §8.2/§8.3 Checks (carried from r5) |
| §8.2 factorization with the supplied Δ_k | k=0 on y and y² | L₀y = −2iy²(i/2) = y²; R_(−2)y² = 2i(−i/2)(2y) − 2y = 0, so −R_(−2)L₀ y = 0 = Δ₀y; R₀y² = 2y, L₂(2y) = 2y², −L₂R₀y² − 0 = −2y² = Δ₀y² | Keep (carried from r5) |
| §8.2 law Δ₁(log y)=0 | k=1 | −y²(−1/y²) + i·y·(i/y) = 1 − 1 = 0 | Keep (carried from r5) |
| §8.2 unitary shift | k=1/2 | (k/2)(1−k/2) = (1/4)(3/4) = 3/16; AST's y^(k/2) conjugation constant k²/4−k/2 = −3/16 | Keep; opposite signs are the two directions of the same conjugation (carried from r5) |
| 4.8a Fricke identity (unchanged text, re-run) | F=1 | 11·1 − 11·1 = 0 = 1 − 1; trace 1 + 11 = 12 = [SL₂(ℤ):Γ₀(11)] | Keep (carried from r5) |
| Conventions: starting index, units, q=1 | n=0,2; arbitrary ring; q=1 | P₀=1; P₂=1−a−aq+a²q; at q=1 both sides=(1−a)²; zero ring 1=0 | Keep; analytic q=1 excluded (carried from r5) |
| 1.2 integer product | a=3,q=2,n=−1 | P₋₁=−2; P₁(3/2;2)=−1/2; product=1 | Keep (carried from r5) |
| 1.2 invalid negative domain | a=q=2,n=−1 | factor 1−a/q=0; inverse product cannot equal 1 over ℚ | Excluded by unit hypothesis (carried from r5) |
| 1.3 regular quotient | a=3,b=1,q=2,n=−1; then b=2 | quotient=(1−2)/(3−2)=−1; at b=2 quotient=0 although separate denominator P₋₁(b;q) is undefined | Keep regular quotient (carried from r5) |
| 1.4 full formal product | generic a through X²; a=1 | coefficients 1−a, −a(1−a), −a(1−a); at a=1 all zero | Keep index-zero factor (carried from r5) |
| 1.4 positive tail / scalar change | a=1; ℤ→𝔽₂ | tail=1−X−X²+O(X⁵); image=1+X+X²+O(X⁵); constant=1 | Keep; unit survives (carried from r5) |
| 1.5 inversion | a=3,q=2,n=2 and n=−1 | P₂=10; (−3)²·2·P₂(1/3;1/2)=10; negative formula gives −2 on both sides | Keep (carried from r5) |
| 1.6 prefix and tail | n=0,1; a=0; a=1 | P(a;q)=P₁(a;q)P(aq;q); a=0 gives 1=1·1; a=1 gives 0=0·P(q;q) | Keep nonzero-tail condition when dividing (carried from r5) |
| 2.1 unilateral normalization | no parameters, n=1; q=1/2 | coefficient −1/(1−q)=−2; deleting normalized sign gives +2 | Keep (carried from r5) |
| 2.1 numerator parameter | one a, n=1 | coefficient (1−a)/(1−q); at a=1 it is 0 | Keep termination (carried from r5) |
| 2.2 bilateral normalization | j=0,−1; a=3,b=1,q=2,z=1 | term₀=1; term₋₁=−1 on regular quotient; a=q produces zero denominator | Keep pole exclusions (carried from r5) |
| 2.3 radius and terminating exceptions | q=2,a=−1/2; a=1/2 | asymptotic coefficient ratio 1/4, radius 4; a=1/2 series terminates at 1−z/2 | Keep distinction (carried from r5) |
| 2.3 q=0 unilateral convention | nonterminating r=s+1; coefficient C after n=0 | sum=1+Cz/(1−z), not 1+Cz; positive normalization exponent gives 1+(−1)^e Cz | Keep 0⁰ convention (carried from r5) |
| 2.4 q-binomial headline | q=.2,a=.3,z=.7 | sum≈3.007306345365; product ratio≈3.007306345365 | Keep (carried from r5) |
| 2.4 large-base headline | q=2,a=0,z=3 | sum≈−.0522988955771; inverse-base product≈−.0522988955771; radius condition 0<1 | Keep a=0 case (carried from r5) |
| 2.4 Euler headlines | q=.2,z=.7; entire identity z=2 | inverse sum/product≈4.015699529238; entire sum/product≈4.627022595122 | Keep different z domains (carried from r5) |
| 2.4 Euler boundary / natural subtraction | q=0,n=0,1,2 | n(n−1)/2=0,0,1; entire series=1+z, matching product | Keep (carried from r5) |
| 2.5 Ramanujan 1ψ1 headline | a=.8,b=.1,q=.2,z=.7 | bilateral sum≈1.189220922478; four-product ratio≈1.189220922478 | Keep (carried from r5) |
| 2.5 regular b=0 | j=−1,a=3,q=2,z=1 | regular term=−2; factor b−q is −2, not a pole | Keep b=0 allowed (carried from r5) |
| 2.6 Bailey pair | α=δ₀; q=1/2,a=1,n=1 | β₁=1/((1−q)(1−aq))=4; β=δ₀ would give 0 | Keep relation ties sequences (carried from r5) |
| 2.6 false candidate pair | α=β=δ₁; q=1/2,a=1,n=1 | β₁=1; defining sum=1/((1−q)(1−q²))=8/3 | Excluded (carried from r5) |
| 2.7 Bailey-transform headline | a=q=0, ρ₁,ρ₂ units, α=δ₀ | βₙ=1; α′=δ₀; β′ₙ=1, including n=0 via t⁰=1 | Keep; genuine general transformation not a tautology (carried from r5) |
| 3.1 Gaussian signed/rectangle adapter | n=0,k=−1,0; n=4,k=2,Q=−1 | values 0,1; Gaussian value 2 whereas uncancelled field quotient is 0/0 | Keep polynomial identity (carried from r5) |
| 3.2 Schur polynomials | n=0,1,2 | initial pairs (1,1),(1,1); n=2 gives 1+Q and 1+Q²; recurrence agrees | Keep indexing (carried from r5) |
| 3.3 gap/residue definitions | empty; (1,1); (1,3) | empty satisfies both; (1,1) fails gap despite residue condition; (1,3) satisfies gap but not ±1 residues | Keep distinct predicates (carried from r5) |
| 3.3 first RR counting headline | n=0,…,8 | gap counts and residue counts both [1,1,1,1,2,2,3,3,4] | Keep (carried from r5) |
| 3.3 second RR counting headline | n=0,…,8 | counts on both sides [1,0,1,1,1,1,2,2,3] | Keep minimum-part condition (carried from r5) |
| 3.3 analytic RR headline | q=.2 | first sum/product≈1.252084005385; second≈1.050083338710 | Keep (carried from r5) |
| 3.4 quintuple headline | q=.2,z=.7 | bilateral sum≈1.099066055466; product≈1.099066055466 | Keep (carried from r5) |
| 3.4 theta addition | constant coefficient, a=2,b=3 | both sides −10/3 | Keep signs (carried from r5) |
| 3.5 partition adapter | n=0,…,8 | native counts and Euler reciprocal coefficients both [1,1,2,3,5,7,11,15,22] | Keep native carrier (carried from r5) |
| 4.1 rank and crank | empty; (1); (3,2,1,1) | (rank,crank)=(0,0),(0,−1),(−1,−1); ≥ instead of > gives crank 0 in third case | Keep strict comparison (carried from r5) |
| 4.1 conjugation | (3,3)↔(2,2,2) | ranks 1 and −1; crank(3,3)=3 | Keep transpose sign (carried from r5) |
| 4.2 vector partitions / size-one correction | coefficient of q | product gives z+z⁻¹−1; adding (1−z) gives z⁻¹, ordinary crank of (1) | Keep (carried from r5) |
| 4.3 generating functions | n=0,1 | rank coefficients 1,1; crank coefficients 1,z⁻¹; forgetting correction gives z+z⁻¹−1 at n=1 | Keep (carried from r5) |
| 4.4 residue counts/filter | t=1; t=2,n=2 | t=1 count=p(n); at n=2 ranks ±1 give residue counts [0,2], same as Fourier filter | Keep; t=0 filter excluded (carried from r5) |
| 4.4a complete dissections | mod 5,size4; mod 7,size5 | rank residue vectors [1,1,1,1,1] and [1,1,1,1,1,1,1] | Keep; full source limitation below (carried from r5) |
| 4.4a modulus-11 rank distinction | size6 | rank counts [1,2,1,1,0,1,1,0,1,1,2], versus all-one crank vector | Keep; no false rank-11 equidistribution (carried from r5) |
| 4.5 rank equidistribution headline | n=0 in 5n+4,7n+5 | every residue count 1 on both progressions | Keep (carried from r5) |
| 4.5 crank equidistribution headline | (ℓ,d)=(5,4),(7,5),(11,6),n=0 | all residue counts 1 in each case | Keep (carried from r5) |
| 4.6 offsets | ℓʳ=1,5,25,7,49,343 | least inverses of 24 are 0,4,24,5,47,243; 24δ≡1 for each nontrivial modulus | Keep positivity/coprimality (carried from r5) |
| 4.7 extraction | U₂X; U₂X²; U₀1 | 0; X; ΣXⁿ respectively, versus Laurent zero-modulus junk 0 | Keep t>0 comparisons (carried from r5) |
| 4.7 residue-range comparison | t=2,a=2,input1 | power-series extraction 0; Laurent extraction X⁻¹ | Keep a<t (carried from r5) |
| 4.7 pullout | t=1,a=1,f=X,g=1 | E₁,₁(X)=1 but X·E₁,₁(1)=0 | Keep a<t hypothesis (carried from r5) |
| 4.8 eta decimation | ℓ=5,r=1,2; ℓ=11,r=1 | offsets 4,24; parity Euler factors P(X⁵),P(X); L₁ for 11 starts 11X | Keep (carried from r5) |
| 4.8a eta equations | first nonconstant terms | degree-five: X⁵−Y has 5t^(11/6), cancelled by 5Y²X; degree-seven: 7t^(11/4), cancelled by 7YX⁴ | Keep lower-degree term (carried from r5) |
| 4.8a seven-module base | Ω₇(B⁻¹)/7 | b₃+7b₇; O₇ requires b₇ coefficient divisible by 49 | Keep separate first step (carried from r5) |
| 4.8a S versus basis | F=1 at infinity | F constant coefficient 1; every finite gₙ combination coefficient 0 | Failed in r1 (R01); repaired statement re-tested in the new rows below (carried from r5) |
| 4.8a Fricke trace | F=1 | 1+11U₁₁1=12; Fricke difference identity 0=0 | Keep factor 11 (carried from r5) |
| 4.8a genus / uniqueness | X₀(11), pole order ≤1 at infinity alone | g=1+12/12−2/2=1; function-space dimension 1 (constants), not 2 | Keep (carried from r5) |
| 4.9 prime-power headline | r=1,n=0; ℓ=7,r=3,n=0 | p4=5,p5=7,p6=11; p243=133978259344888≡245 mod343, hence divisible by49 but not343 | Keep exponent floor(r/2)+1 (carried from r5) |
| 5.1 odd theta | z=0 and z=1/4,τ=i | θ(0)=0; θ(1/4)≈−.643589764039; first pair i q^(1/8)(e^(πiz)−e^(−πiz)) | Keep sign; derivative −2πη³ (carried from r5) |
| 5.3 E and β | x=0,t=0; derivative x=0 | E(0)=0,β(0)=1,E′(0)=2; missing √π scaling gives 2/√π | Keep (carried from r5) |
| 5.3 Wirtinger / xi | τ,y and i·y at k=0 | bar∂τ=0; bar∂y=i/2; ξ₀y=1; ξ₀(iy)=−i | Keep antilinearity (carried from r5) |
| 5.4 Mordell | τ=i,z=1/2 | h≈1; exact symmetry/shift expression gives1 | Keep (carried from r5) |
| 5.4 shift/S | τ=i,z=1/4 | shift sides≈11.708242116621; S sides≈.606847937009 | Keep (carried from r5) |
| 5.5 R correction | u=1/12,τ=i; u→u+1 | R≈.323196786374; translated value≈−.323196786374 | Keep antiperiodicity (carried from r5) |
| 5.6 μ | u=1/3,v=1/4,τ=i | μ≈−.894187284346i; μ+iR/2≈−.732588891159i | Keep nonzero correction (carried from r5) |
| 5.7 elliptic headline | same u,v,τ; u→u+τ | both sides≈−.015829018232+.027416663811i | Keep (carried from r5) |
| 5.7 modular headline | S; same u,v,τ | both sides≈.716779363149i; eta factor at i is i²=−1 | Keep (carried from r5) |
| 5.7 I,−I,T consistency | eta-quotient factor | I:1; −I:1; T:e^(−πi/4); branch-free quotient agrees with ν⁻³√w | Keep (carried from r5) |
| 6.1 unary corrections | a=b=0; a=1/6,b=0 | g₀,₀=C₀,₀=0 by pairing; g₁/₆,₀ begins (1/6)q^(1/72); ξC=−√2g | Keep sign (carried from r5) |
| 6.1 scaled correction | d>0,τ↦dτ | differentiating gives ξC(a,b;dτ)=−√(2d)g(a,b;dτ), not −√2g | Keep √d (carried from r5) |
| 6.2 period domain | a=1/2; endpoints with a integral | valid interior sign is fixed; at a=0 the zero summand has sign0 and cannot use a formula assuming 0<a<1 | Keep endpoint separation (carried from r5) |
| 6.3 torsion normalization | u=1/2,v=τ/2; β→β+1 | both points off lattice; characteristic phase changes by −1 in the half-character case | Keep rational phases (carried from r5) |
| 7.1 cone data | hyperbolic plane; c₁=(1,0),c₂=(0,−1),c₀=(1,−1) | Q(c₁)=Q(c₂)=0,Q(c₀)=−1; B(c₁,c₀)=B(c₂,c₀)=−1 | Keep common cone component (carried from r5) |
| 7.1 rank-one negative lattice | form [−2] | Q(x)=−x², isotropic vectors only0; no nonzero primitive isotropic boundary | Keep explicit boundary domain (carried from r5) |
| 7.2 ordered theta kernel | hyperbolic ν=(1/2,1/2), then (1/2,−1/2) | sign difference 1−(−1)=2, then −1−(−1)=0; c₁=c₂ gives0 | Keep ordering (carried from r5) |
| 7.3 convergence majorant | boundary c=(1,0),ν=c | Q(ν)=0; boundary modified quadratic form also0, so positive definiteness cannot be asserted there | Keep separate boundary analysis (carried from r5) |
| 7.4 transformation | hyperbolic A,detA=−1; odd diag(1,−1) | S prefactor τ; odd half-diagonal shift vector (1,1), rather than0 | Keep odd/even distinction (carried from r5) |
| 7.5 factorization | rank-one correction; double-length coset split | −C(1/4,0;2τ); second split −C(1/8,0;8τ)−C(5/8,0;8τ) | Keep scaling and both cosets (carried from r5) |
| 8.1 automorphy/growth | trivial representation, constant1 | weight0:1=1, but not cuspidal; odd integral full-group weight: −I would require1=−1 | Keep parity and cusp conditions (carried from r5) |
| 8.2 operators | y,y²,log y | L₀y=y²; Δ₀y=0; Δ₀y²=−2y²; Δ₁log y=0 | Keep; supplier locator R02 (carried from r5) |
| 8.2 unitary comparison | k=1/2 | holomorphic-to-unitary constant shift −3/16; corresponding eigenvalue 3/16 | Keep supplier sign (carried from r5) |
| 8.3 harmonic spaces | constant1; y² at k=0 | Δ₀1=0; Δ₀y²=−2y²≠0 | Keep actual PDE condition (carried from r5) |
| 8.4 scalar ODE kernel | k=0,w=±1 | H₀(w)=eʷ, values e and e⁻¹; partner e⁻ʷ has reversed values, nonzero Wronskian | Keep independent modes (carried from r5) |
| 8.4 constant modes | k=1,y=1,e | (1,log y)=(1,0),(1,1); incorrectly using (1,y⁰) gives (1,1) twice | Keep k=1 exception (carried from r5) |
| 8.4 gamma comparison | k=0,w=−1 | e·Γ(1,2)=e⁻¹=H₀(−1); shape1>0 | Keep k<1 for real integral (carried from r5) |
| 8.4a parabolic matrices | M=[[1,1],[0,1]],v=(τ,1) | v(τ+1)=(τ+1,1)=Mv(τ); scalar periodic coefficients alone miss τ | Keep Jordan modes (carried from r5) |
| 8.4a nonunitary frequency | M=2; M=i | shifts −i log2/(2π) and 1/4 respectively; e(shift)=2 and i | Keep complex frequencies (carried from r5) |
| 8.5 Weil normalization | rank-zero lattice; lattice ⟨2⟩,h=1/2 | rank zero at weight1/2: central law f=−f forces0; ⟨2⟩ gives Q(h)=1/4, T phase i and central phase −i | Keep conjugate Weil convention (carried from r5) |
| 8.5 Fourier/xi | k=0, conjugate(q⁻¹); zero mode a y^(1−k) | ξ₀ conjugate(q⁻¹)=4πq⁻¹; ξ_k(a y^(1−k))=(1−k)conjugate(a) | Keep polar shadows in full space (carried from r5) |
| 8.6 surjectivity proof normalization | k=0,g=1 | bar∂y=i/2 gives ξ₀y=1; bar∂(2y)=i gives ξ₀(2y)=2 | Keep roadmap's half factor; source issue below (carried from r5) |
| 8.6 divisor hypotheses | two elliptic components,D supported on one | H¹ on untouched component has dimension1, not0 for any n | Keep positive degree on every component (carried from r5) |
| 8.7 mock object/completion | zero correction; k=0 zero-mode conventions | shadow0 for zero correction; y and y−1 differ by holomorphic constant1; ξ₀ of both=1 | Keep specified normalization (carried from r5) |
| 8.7 conjugate scalar | F→iF | ξ(iF)=−iξ(F), not iξ(F) | Keep shadow's antilinearity (carried from r5) |
| 9.1 holomorphic theta | m=1,classes0,1 | θ₁,₀=1+(e(2z)+e(−2z))q+…; θ₁,₁=q^(1/4)(e(z)+e(−z))+… | Keep 2m indexing (carried from r5) |
| 9.2 Jacobi definition | constant1,m>0,z=0,τ=i | elliptic shift would require1=e^(2πm), false; θ₁,j satisfies the law | Keep index/elliptic condition (carried from r5) |
| 9.3 mixed residues | (1+v+bar(v))/v²; bar(v)/v; 1/v;1 | residues 1,0,1,0 respectively | Keep bar-degree-zero extraction (carried from r5) |
| 9.3 affine coordinates | v=2w, differential dv/v | transformed differential dw/w, residue1=1; function alone gains factor1/2 | Keep differential/Jacobian convention (carried from r5) |
| 9.4 polar kernel | simple pole; m-character endpoints | residue −1/(2πi); R_m,0(0)=1 and R_m,m(0)=0 | Keep signs and endpoint values (carried from r5) |
| 9.4 cone realization | specified two-dimensional kernel | Q(c₂)=−m, B(c₁,c₂)=−1 | Keep positive m (carried from r5) |
| 9.5 decomposition | φ=θ_m,j, no poles; double pole | corrected coefficient vector δ_j, polar part0; for v⁻²A(v), residue A′(0) | Keep arbitrary pole order (carried from r5) |
| 9.5 weights | k=1 | coefficient weight k−1/2=1/2, not3/2 | Keep (carried from r5) |
| 10.1 third-order definitions | f,ω through q³ | f=1+q−2q²+3q³; ω=1+2q+3q²+4q³ | Keep actual unilateral series (carried from r5) |
| 10.1a rank and f bridge | q=.2,z=.7; z=−1 symbolically | rank sides≈1.328424407776; z=−1 gives identical denominators Pₙ(−q;q)² for f | Keep (carried from r5) |
| 10.1a ω bridge | q=.2 | P(q²;q²)ω(q)≈1.499934967742; bilateral side≈1.499934967742 | Keep (carried from r5) |
| 10.2 third-order vector S | τ=.17+1.1i | both vectors≈(.420123272091+.012234952158i, .606697161074−.072841738892i, .009455858563−.099933933909i) | Keep; component residuals below 7×10⁻¹⁶ (carried from r5) |
| 10.2 T/leading phases | first entry q^(−1/24); last pair q^(1/3)ω(±q^(1/2)) | first phase ζ₂₄⁻¹; T swaps last two with phase ζ₃ | Keep exchange (carried from r5) |
| 10.3 fifth-order definitions | q→0 | f₀,f₁,F₀,F₁,φ₀,ψ₁,χ₀,χ₁ constants1; ψ₀,φ₁ constants0; φ₁(−q)/q→−1 | Keep signed arguments (carried from r5) |
| 10.3a Hecke bridges, f₀/f₁ | q=.2 after Euler multiplication | both sides≈.888030023612 and .785716216301 | Keep (carried from r5) |
| 10.3a Hecke bridges, F₀/F₁ | q=.2 after even Euler multiplication | both sides≈1.006323199306 and 1.199932391424 | Keep (carried from r5) |
| 10.3a Hecke bridges, φ₀/φ₁ | q=.2 | both sides≈1.241935979521 and .201920619323 | Keep prefactor q for φ₁ (carried from r5) |
| 10.4 indefinite realization | Q and cone vectors in retained theta formulas | ordered-cone sign2 on same-sign interior; reversing endpoints gives−2 | Keep endpoint order from §7 (carried from r5) |
| 10.5 fifth correction vectors | τ=.17+1.1i; sum of paired completions | first correction G₅,₁,₁≈.557887761575−.009932845653i, G₅,₂,₁ is its negative; sum0 | Keep nonzero corrections and cancellation (carried from r5) |
| 10.6 fifth transformations | multiply displayed S matrix by itself | I₆: diagonal1, off-diagonal0 (floating residual norm≈3.14×10⁻¹⁶) | Keep asymmetric √2 entries (carried from r5) |
| 10.6 fifth S law on actual series | τ=.17+1.1i | both six-vectors≈(.505362227191+.004128522071i, .353688249173−.057818438796i, .397756535369+.001034066381i, .247237506773−.046495045432i, .385593599225−.004119716235i, .128003056987−.049554342949i) | Keep; residuals below 7×10⁻¹⁶ (carried from r5) |
| 10.7 seventh vector | cone normalization and leading exponents | Q(c)=−21/2,B(c₁,c₂)=−28; exponents −1/168,47/168,143/168 | Keep order (F₀,F₂,F₁) (carried from r5) |
| 10.8 seventh transformations | S²; third T phase | I₃: diagonal1, off-diagonal0 (residual≈2.36×10⁻¹⁶); 143≡−25 mod168 | Keep (carried from r5) |
| 11.2 root completion | α=1/2,τ=i | correction-defined F≈.506566028747; H₃ first component≈.506566028747 | Keep (carried from r5) |
| 11.2 corrected Lerch expression | α=1/2,τ=i before completion | hα/D≈.650841567833i; corrected expression≈.650841567833i; printed source expression≈.650850612912i | Keep roadmap correction; source issue below (carried from r5) |
| 11.2 root endpoints | α=1/3; α=0 | first has 3α∈ℤ, so separate terms polar but combined rank series regular; α=0 gives η⁻¹ of weight−1/2 | Keep cancellation; trivial root excluded (carried from r5) |
| 11.2 shadow / phase | α=1/2; lower-unipotent N=10368 | correction −2C(1/6,0;3τ) gives +2√6g; rational phase 3N/4=7776∈2ℤ | Keep (carried from r5) |
| 11.3 residue deviations | t=1; t=2 | t=1 coefficient p(n)−p(n)=0 and empty correction0; t=2 deviations ±f/2 with the common q^(−1/24) factor | Keep Fourier projection (carried from r5) |

There are 6 new rows; all keep. With the 155 carried rows (the previous report's 156 less its R02 row, now replaced) the table has 161 rows.

## Not verifiable

- The Lake build and the elaboration could not be run at this round: the shared package directory for the branch's manifest is absent on this machine, so `lake build`, `lake env lean` and the gate's build step all stop at “materializing new dependency … already exists”. The worker's gate on this head passed with `build=0`, and `Suggested.lean` is unchanged since the last elaborated head; the pinned-declaration lines are carried from the previous report for the same reason.
- Fourteen of the fifteen seeded targets lie outside the changed lines. Following the incremental brief, they were not re-read in this round.
- GasperRahman2004 and BFOR2017 are waived, and Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified. The changed lines cite none of them, and none was requested.
- Ownership against open pull requests whose files this brief does not give was not checked.

## Source issues

- none
