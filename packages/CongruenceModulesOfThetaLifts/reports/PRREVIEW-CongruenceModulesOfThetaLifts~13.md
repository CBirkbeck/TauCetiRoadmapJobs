# Review of CongruenceModulesOfThetaLifts (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 368 changed lines since `aecb53a`. What was checked:
- the new `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels of all twenty sections, against their sources wherever an open text exists;
- the revised route of 7.4 and the narrowed 7.16a (2), against BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 at this head and against the roadmaps that cite 7.16a;
- the three new supplier citations, the dependency check and the elaboration.

There is no finding. There are two small corrections and two format notes, none blocking:
- The remark after 7.16a (3) calls the general form of (2) "this roadmap's own formulation", but also says it is not a statement of the section.
- One sentence of the description does not hold for 7.16a (2).

The human reviewers are asked about the unrefereed main source and about the formal proof, which was not opened.

## C01 — The remark after 7.16a (3) leaves it undecided whether the general form of (2) is a target

An implementer cannot tell whether (2) is to be proved for every definite unitary group of the setting of 7.16, or only under the new hypothesis on `E/F` and `V`.

The README gives two readings of the general form:
- The Origin of 7.16a (line 1878) calls it "this roadmap's own formulation", and so does the Labels paragraph (line 197). By the README's own convention (line 190), such a form is "stated beside it … proved by the route written here".
- The remark itself (line 1927) says it "is not a statement of this section", because its route needs the Galois representations of BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 outside the setting of that section's statement.

Nothing else depends on the choice: GluedTargetAndDivisionInequality and ThetaChainsAndFrobeniusPrimeSums cite only 7.16a (3), and (3) lies in the narrowed setting.

Either of these would settle it:
- State the general form as this roadmap's own target. Its *Needs:* would cite the remark of BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1, which asserts the Galois representations for every Hermitian space definite at every infinite place.
- Say only that it is not stated here, and drop it from the Origin of 7.16a and from the Labels paragraph.

## C02 — One sentence of the description does not hold for this folder

The description says, of sections narrowed to the formal proof's special case, that "the general theorem is the one in the general roadmap". In this folder, 7.16a (2) now assumes that `E/F` is unramified at every finite place and that `V` is the standard Hermitian space. The general form for every definite unitary group is stated in no general roadmap: it survives only in the remark after (3). The same holds for its supplier BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1, whose general form is only its remark.

A sentence such as this would make the description accurate: "In a few sections the general form is kept only as a remark and is stated nowhere as a target, for instance CongruenceModulesOfThetaLifts 7.16a (2) and BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1."

## N01 — Two 2026 arXiv preprints are listed as "nearest published results"

In the Origins of 7.8a (line 1276) and 7.16 (line 1789), Čoupek–Gazaki–Marmora (arXiv:2603.26035) and Bhatt–Gee–Kisin (arXiv:2607.08660) are called "nearest published results". Both are preprints. "Nearest results in the literature" would be accurate.

## N02 — "and on main" in the Dependencies (line 2025) is process wording

The new entries PadicFamilies §1.7a, PadicHodgeRegulators §1.5 and GeometryOfNumbersAndQuadraticArithmetic §0.2.5 are listed under "and on main". §1.7a is added by this same change, so the phrase is not even accurate before the merge. "And outside this family" would be timeless.

## Questions for the author

- The Origin of 7.9 cites Dieulefait–Wiese, Proposition 6.1, with the Trans. Amer. Math. Soc. reference. In arXiv:0905.1288v1 the statement is numbered 6.1. Is the number the same in the published version? The published text is paywalled, so I could not compare.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.4, revised route of (1), (4) | the chain's hosts; `F = ℚ` | §16.1 at head needs `E/E⁺` unramified at every finite place, the standard form and `[E⁺:ℚ] ≥ 2`. ThetaChains Layer 2 intro (line 270) and §2.2 supply the first two. `F = ℚ` is impossible: every imaginary quadratic field ramifies | holds | none |
| 7.4, Check of (1) | `r + t = 1` | Hecke polynomial `X − T_{w,1}(x)`. Its root is `β = BC(Π)_w(ϖ_w)^{−1}` under geometric reciprocity, so `r_x(geometric Frob) = BC(Π)_w(ϖ_w)` | holds | none |
| 7.5 (1), parameter via ThetaKernels §3.21a (iii) | `n = r`, `d = r + t` | Lift parameter is `(cα_1,…,cα_r)` plus a segment of length `d − n = t`. Twists: `−t/2`, and `(t−1)/2 − (c−1) − (r+t−1)/2 = −r/2 − (c−1)` | holds | none |
| 7.5a, Origin: GQT Thm 7.3 (i) | `m = r+2t`, `m′ = r`, `n = r+t` | `m + m′ = 2r + 2t = 2d(n)`, and `m > m′ > 0` for `t, r ≥ 1`. GanQiuTakeda2014 line 1693 | holds | none |
| 7.5b | the dimension count at `x ∈ Z_good` | `dim V_x ≤ dim part = dim image ≤ dim V_x`: equality, so the image is `V_x` | holds | none |
| 7.9, Origin: DW Prop 6.1 | `ℓ ∉ {p,q}` and `ℓ ∈ {p,q}` | DW use one irreducible local place per `ℓ` (`D_q` or `D_u`; arXiv v1 lines 441–444). Criterion here: `N = 8` forces `p = 5`, and `p + 3 ≤ 8` | holds | none |
| 7.6, Origin: Fontaine–Laffaille; `#Exc` | window `[W₀ − X, W₀ + X]` | `X = Sc+2η_s+2σ⁺+4` gives `2X + 1 = 2Sc+4η_s+4σ⁺+9` integers, matching the bound. FL interval length `ℓ − 2` matches Check (i) | holds | none |
| 7.7a, `E² = δE` | `ℓ = 3`, `t = 3`, `s₀ = 1` | `α₁−α₂` and `α₁−α₃` have valuation 1 each (`(1+3u)² − 1 = 3(2u+3u²)`), so `v_δ = 2`, as in the Examples | holds | none |
| 7.7c, `v_δ = 0` | `ℓ > t+1`, `χ_cyc(g)` a generator mod `ℓ` | `1 − χ_cyc(g)^{−k}` is a unit for `1 ≤ k ≤ t−1 < ℓ−1`, so `δ` is a unit | holds | none |
| 7.7d, *Corollary of* PadicHodgeRegulators §1.5 | `ℚ_p(1)` and `ℚ_p` over `ℚ_p`; weight `−1` convention | `dim H¹_f = 1 + 0` and `0 + 1`. Negative weights count, so only the `m` lows per embedding count: `j_u ≤ n_u·m` | holds | none |
| 7.8 (2) (b) | `#Q ≤ 4R`, `u_q` of order `ℓ^M` | `t·Σ v(u_q − 1) ≤ 4Rt/(ℓ^{M−1}(ℓ−1)) → 0` as `M` grows | holds | none |
| 7.8a Origin, 7.10a | the order of `c` | `c_B ≤ C_B·t·[E:ℚ]·(r+t)·(1+log_ℓ 4b)` (line 1302), matching the Origin's order of `c`. 7.10a has six rows; [FormalProof] bounds rows 5–6 as wholes | holds | none |
| 7.10c | `Σ_{𝔭|ℓ} ϱ(𝔭)e_𝔭` | `Σ e_𝔭 f_𝔭 log ℓ/[𝕃:ℚ] = log ℓ` | holds | none |
| 7.11, Method | `B₀ = fmbx^ε`, `L = x^ε` | `fmbL² = fmbx^{2ε} = x^ε·B₀`. `V(E,t) ≤ b = exp(x^ε) ≤ B₀` by UniformWildKernelBounds §7.6 | holds | none |
| 7.15, Origin: HK Prop B.5 | `Δ = 2ℤ² ⊂ ℝ²`, `W = ℝ(1,1)` | `π(Δ) = ℤ(1,−1)`, whose dual is `ℤ(½,−½) = Δ*∩W^⊥`. `Δ∩W^⊥ = ℤ(2,−2)` differs (HK Remark B.7). B.5 is the `ℤⁿ` case | holds | none |
| 7.15 (b), Check | `M = 𝒪²`, `ℓ = 2` unramified, `Z` the diagonal | `PM = 𝒪(1,1)/2` and `(PM)^∨ = 𝒪(1,1)`, so `ℐ = ℐ⁺ = 1`. The bound is `1 + 1·1·(0 + 0) = 1`: attained | holds | none |
| 7.16 (headline 4) | `E = ℚ(i)`, `ℓ = 19`, `λ = (44,0)`, `μ = (25,19)` | `dp = 19 > i_W = 0` once the weight hypothesis on `χ_0` fails: a negative control | holds | none |
| 7.16a (2), narrowed | `F = ℚ`; the chain; consumers | "`E/F` unramified everywhere" excludes `F = ℚ`, so `[F:ℚ] ≥ 2` as §16.1 needs. Consumers cite only (3) | holds | C01 |
| 7.16a, Origin: EGH | Lemma 4.5.1, §7.4 | Deligne–Serre lift (EmertonGeeHerzig2013 line 1579). Lattice reduction is Lemma 7.4.1 (line 2519). This is the route step of (2) | holds | none |
| 7.10c/7.11 (headline 1) | statements unchanged | `d^Z_j(C·fmbL² + V) ≤ d^Z_j(C + κ_W)x^ε·B₀` when `V ≤ κ_W x^ε B₀` | holds | none |
| 7.7b (ii) (headline 3) | `ν_ρ(w) = e_ρ`, `ν_χ(w) = e_χ` | `Σ_w(e_ρ + t·e_χ) = #{w|ℓ}·(e_ρ + t·e_χ)`: the formal proof's form is a specialisation | holds | none |

- Source locators checked against the text:
  - GanQiuTakeda2014 Thm 7.3 (i), line 1693.
  - Dieulefait–Wiese Prop 6.1, arXiv v1 p. 12.
  - Horesh–Karasik Prop B.5 and Remark B.7, arXiv v2 p. 34.
  - Emerton–Gee–Herzig Lemma 4.5.1, §7.4 and Lemma 7.4.1.
  - The abstracts of Bhatt–Gee–Kisin, Bartlett and Čoupek–Gazaki–Marmora.
  - Not readable: Yamana Thm 10.1 (2) and Bloch–Kato Cor. 3.8.4.
- Cross-roadmap citations resolved, at main or at this head:
  - PadicHodgeRegulators §1.5 (main); GeometryOfNumbersAndQuadraticArithmetic §0.2.5 (main); PadicFamilies §1.7a (added at this head).
  - MetaplecticAutomorphicForms §3.14; ThetaKernelsForUnitaryDualPairs §3.21a (iii).
  - BaseChangeAndGaloisRepresentationsForUnitaryGroups §§15.1, 16.1 and the remark of 16.1.
  - ThetaChainsOnDefiniteUnitaryGroups, Layer 2 intro and §2.2; LengthBoundsInPadicFamilies §1.7a; UniformWildKernelBounds §7.6.
  - The citations of 7.16a in GluedTargetAndDivisionInequality (lines 228, 488, 1598, 1690) and ThetaChainsAndFrobeniusPrimeSums (lines 268, 1057, 1693, 1735).
- Record: no layer, section or item is removed or renumbered. All 20 sections carry both labels, and one carries a *Corollary of:* line (7.7d). The supplier contract of MetaplecticAutomorphicForms §3.14 now names that section's real subject (type-II theta input).
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1481 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: exit 0, no warnings. The file declares nothing and is unchanged by the pull request, so there was no `#check` to compare.
- Files changed outside the folder: none beyond the folders the brief names as the pull request's own.
- Overlap check: read ThetaLiftsForDefiniteUnitaryGroups (§§2.2, 4.2), ThetaKernelsForUnitaryDualPairs (§3.21a), UniformWildKernelBounds (§7.6), LengthBoundsInPadicFamilies (§1.7a), ThetaChainsOnDefiniteUnitaryGroups (Layer 2), and the citations from GluedTargetAndDivisionInequality and ThetaChainsAndFrobeniusPrimeSums. Shared objects:
  - the parameter of a lift at split places: owned by ThetaKernelsForUnitaryDualPairs §3.21a and ThetaLiftsForDefiniteUnitaryGroups §2.2, cited here;
  - congruence modules: owned by PadicFamilies §1.7a (algebra) → LengthBoundsInPadicFamilies §1.7a (modules) → 7.1, one direction;
  - nonvanishing: ThetaLiftsForDefiniteUnitaryGroups §4.2 is the stable range `d ≥ 2n+1`, while 7.5a is the complementary descent, so they do not share it.
- Source independence: 9 passages compared (changed passages only) with 7 sources (GQT, DW, HK, EGH, BGK, Bartlett, ČGM), none shared beyond forced phrases. Largest share: [FormalProof], 128 of 139 locators. Contents not compared, since no layer was added, removed or reordered.
- Research link: the targets bound congruence modules of theta lifts between definite unitary groups. They follow Hida (1981, 1986) and Ribet (1976), Bloch–Kato (1990), Bellaïche–Chenevier (2009) and weight elimination (Emerton–Gee–Herzig 2013; Le–Le Hung–Levin 2019), as steps of Alpöge's announced proof of GRH for Dirichlet L-functions (2026). Rests on the README's summary and References.

## Not verifiable

- Yamana (2014), Theorem 10.1 (2), in the Origin of 7.5a: Invent. Math. is paywalled, and the sources service found no open copy.
- Bloch–Kato (1990), Corollary 3.8.4, in the Origin of 7.7d: the Grothendieck Festschrift is paywalled and not in the sources cache.
- The twenty *Method of the formal proof* labels: they describe [FormalProof]'s proofs, and that repository was not opened.
- Mínguez (2008), Khare–Larsen–Savin (2008), Bellaïche–Chenevier (2009), Urban (2001), Fontaine–Laffaille (1982), Iovita–Marmora (2015), Le–Le Hung–Levin (2019) and Hida (1986): cited without locators in the new Origins, and not opened.

## Source issues

- none

## For the human reviewers

- Scope: 12 of the 20 sections are labelled "particular to this proof". Their only references are [FormalProof] (a Lean repository) and [Announcement] (Alpöge, 20 November 2026), neither of them refereed (README, References).
- Not tested: [FormalProof] holds 128 of the 139 locators and was not opened. The wording and arrangement checks, and the new Method labels, were not compared against it.
