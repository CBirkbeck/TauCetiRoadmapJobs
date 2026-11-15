# Review of HodgeTateAndCanonicalSubgroups (pull request #1084 at 333737c)

**Verdict:** needs changes

Seven findings: one P2, six P3. The gate passes and the dependency check reports no problem.

## Previous findings

- R01 (two Lean identifiers in prose) — repaired: `quotientAction` and `hodgeTateFlagPoint` have 0 hits; line 800 reads "the action of `K_p/K′_p = 𝔽_p^×` on it is translation", line 989 "equals 2.7's flag point `π_HT(A, β)`".
- R02 (Checks naming numbered items) — repaired: line 1248 "that the hypothesis `H = H′[p^n]` … resolves through the level-two subgroup"; line 2012 "hold trivially"; line 2183 "the spectral sequence is the Hochschild–Serre"; line 2245 "the hypothesis that every finite étale cover splits is needed"; line 1004 "test cases above".
- R03 (code spans) — partly: the listed spans are repaired (line 234 "`p^{1/(p−1)}` (0.5)", line 139 "`H^i(X_ét, F) ≅ H^i(X_proét, ν^*F)`"); one span still swallows a word (R06 below).
- R04 (repeated Checks and `*Needs:*` items) — partly: no `*Needs:*` line repeats an item and line 1439 states the indexing once; 0.10 again has two Checks with the same value (R06 below).
- R05 (three locators) — repaired: line 1853 "Defs. 3.2.1–3.2.2 and Rem. 3.2.3, p. 26"; line 1218 "§7.1, Def. 7.1(1), p. 28"; line 2503 "pp. 82–89".
- R06 (layer endings) — repaired: 9 layers, 9 `### Examples`, 9 `### Dependencies`; the batch table is under Layer 0's Dependencies (lines 661–670).

## R01 (P2) — The cokernel bound at `p = 2` is asserted in 0.5 and in the Lean headline, and declined as unproved in 5.5

**Location:** `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md` line 246 ("This includes every prime and every p-power order over `O_C`"), `Suggested.lean` line 54; line 1487 ("No `p=2` modified-bundle target is asserted (PS16 Remark 1.10)") and line 9.

**Claim:** cokernels of character maps are killed by `v(a) ≥ 1/(p−1)` at every prime, on the cited sources; the same estimate at `p = 2` is outside scope in Layer 5.

**Witness:** FAR10 line 1284 (Thm. 7) assumes `p ≠ 2`; PS16 lines 199–206: `p ≥ 3`, and at `p = 2` exponent 2, unwritten. FAR11 line 1267 and SW13 line 1466 only quote the earlier theorem; CDM12 is a survey.

**Repair:** (a) Keep every prime: add to 0.5 "At every prime use `T_pG⊗A_inf ⊂ M(G) ⊂ T_pG⊗µ⁻¹A_inf` ([SW20], Appendix to Lecture 17, pp. 159–160); at the Hodge–Tate specialization `µ ↦ ζ_p−1`, of valuation `1/(p−1)` (1 at `p = 2`), and the cokernel is finitely presented, so the endpoint is attained", with the supplier section owning `M(G)` in `*Needs:*`; label FAR10 and PS16 as the `p ≥ 3` sources; then state 5.5–5.7 and 5.13 for every prime (`b = 1`, `n ≥ 2`, `D = g` at `p = 2`) and delete the `p = 2` exclusion of line 9. Or (b) add `p ≠ 2` to 0.5 and `(hp2 : p ≠ 2)` to the Lean theorem, and correct line 246 and the pull-request summary ("covers every prime").

## R02 (P3) — Target 3.2 has no consumer and restates a step of its supplier's construction

**Location:** README lines 1084–1094 (3.2, "C₁ lifts to G compatibly modulo `p^{1−ε}`").

**Claim:** every target is needed by a later target or is an end theorem; what a supplier plans is imported.

**Witness:** no `*Needs:*` line cites §3.2. 3.4 takes existence from `CohomologyComparisons` §6.2, whose README (line 1144) already uses "the co-Lie obstruction for the Frobenius kernel", citing Scholze Cor. 3.2.2.

**Repair:** delete 3.2; add to Scope "The lifting of `ker F^m` modulo `p^{1−ε}` (Scholze, Cor. III.2.2) is part of `CohomologyComparisons` §6.2's construction"; drop R07.6 and DerivedModuleAlgebra §§0.4–0.13, 0.25 from Layer 3's Dependencies (line 1262). If a target here does use it, name §3.2 in that target's `*Needs:*` instead.

## R03 (P3) — Consumer roadmaps are cited by section labels they do not define

**Location:** README lines 9, 32, 803, 835, 924, 984, 1005, 1268, 1362, 1550, 1613, 1623, 2542, 2637, 2954, 3075, 3110, 3114, 3132 ("PerfectoidShimuraVarieties S1–S3", "S6", "OverconvergentAutomorphicForms O5–O6", "IG.3", "TC.2").

**Claim:** cross-roadmap citations name a section or target of the cited roadmap.

**Witness:** at their open heads PerfectoidShimuraVarieties has `## Layer 0` … `## Layer 6` and 0 occurrences of `S0`–`S6`; OverconvergentAutomorphicForms has `## Layer 0` … `## Layer 8` and no `O2`–`O8`; `IG.3` and `TC.2` occur in neither target roadmap.

**Repair:** replace `S k` by "PerfectoidShimuraVarieties Layer k" (Boxer–Pilloni Theorem 4.4.40 is in its Layer 6, README line 1913), `O k` by "OverconvergentAutomorphicForms Layer k" (Layer 5: AIP coefficients and comparison; Layer 6: Hecke operators), `IG.3` by "IgusaVarietiesAndTorsionConcentration Layer 3", `TC.2` by "TorsionCohomologyInfrastructure Layer 2".

## R04 (P3) — Locators: theorems of 6.12 without one, 6.36 cited to a proof that imports it, a wrong section in 6.37, repeated entries

**Location:** README line 1942 (6.12: "Def. 4.1.2 (1)–(2), p. 41"); line 2396 (6.36: "proof of the remaining statements of Thm. 6.2.1, p. 87"); line 2410 (6.37: "§3.5, p. 42"); lines 254, 2813, 2924.

**Claim:** each theorem has a locator at the text that states it.

**Witness:** DLLZ-adic: openness is Cor. 4.1.9 (line 2157, p. 43), the three-way characterisation Lem. 4.1.13 (line 2229, p. 45), cancellation Prop. 4.1.15 (line 2314, p. 46). DLLZ-adic lines 4335–4336 take the bound of 6.36 from [dJvdP96, Prop. 2.5.8]. DLLZ-RH line 2040 (p. 42) is in §3.6.

**Repair:** 6.12: "Def. 4.1.2, p. 41; Cor. 4.1.9 and Lem. 4.1.10, p. 43; Lem. 4.1.11, p. 44; Lem. 4.1.13, p. 45; Props. 4.1.14–4.1.15, p. 46". 6.36: "de Jong–van der Put, *Étale cohomology of rigid analytic spaces*, Doc. Math. 1 (1996), Prop. 2.5.8; used in [DLLZ-adic], proof of Thm. 6.2.1, p. 87", with a References entry. 6.37: "§3.6, proof of Lem. 3.6.1, p. 42". Line 254: keep one FAR10 entry; line 2813: "Thm. 3.2.4(1), pp. 25–26" once; line 2924: "Thm. 3.2.7(5), pp. 26–27" once.

## R05 (P3) — Notation used without a definition: `ε_m^can`, `G*`, `Γ*`, `Γ₀*`

**Location:** README line 1419 ("for `ε′ ≤ ε_{m+1}^can`"), line 1437 ("for `0 ≤ ε ≤ ε_m^can`"); lines 1002, 1013 ("the Hodge-type Hilbert G* datum"); lines 1613, 1624 (`Γ*(p^∞)`, `Γ₀*(p^n)`, `G*(ℤ_p)`).

**Claim:** every term is the literature's or is defined where it first appears.

**Witness:** `ε_m^can` occurs only in these two lines; the README defines neither it nor `G*`. BHW line 721 sets `ε_m^can := 1/p^{m+1}`.

**Repair:** line 1419: "`ε′ ≤ p^{−(m+2)}`"; line 1437: "`0 ≤ ε ≤ p^{−(m+1)}`". Add to Conventions: "`G* = G ×_{Res_{F/ℚ}𝔾_m} 𝔾_m` is the subgroup of `G = Res_{F/ℚ}GL₂` of elements with determinant in `𝔾_m` (the Hodge-type Hilbert group); `Γ*`, `Γ₀*` are the intersections of the level groups with `G*(ℤ_p)`."

## R06 (P3) — Section references without a roadmap, a code span that swallows a word, a repeated Check, one letter for two radii

**Location:** README line 2541 ("duplicating §§2.7, 7.1–7.3"), line 2992 ("§§2.7, 7.1–7.3:local-rational supplies"); line 2762 (`` `µ′_{Z,*}(L̂_Z⊗OC_log,Z) can` ``); lines 346–347; line 1302 ("`δ = p^nε < 1/2`" … "`δ = ((p+1)/p)ε`").

**Claim:** a bare `§k.n` is a target of this roadmap; each Check tests something new; a symbol has one meaning in a statement.

**Witness:** here §2.7 is the flag point and 7.1–7.3 the toric estimates and primitive comparison, not period rings. Lines 346 and 347 both compute `D_f = V(p)` for the quotient of the Tate curve by `μ_p`.

**Repair:** lines 2541 and 2992: "`PadicHodgeTheory` §§2.7, 7.1–7.3" (2992 without ":local-rational"). Line 2762: "`µ′_{Z,*}(L̂_Z⊗OC_log,Z)` can be smaller". Delete line 346's first sentence, keeping "`D_f = D_{ker f}` requires finite flatness of the kernel" on line 347. Line 1302: "modulo `p^{1−((p+1)/p)ε}`".

## R07 (P3) — Three constructions with fewer than three Checks

**Location:** README lines 457–459 (0.17, one Check), 690–692 (1.2, one Check), 1889–1892 (6.10, two Checks).

**Claim:** every definition has at least three discriminating Checks.

**Witness:** 0.17 defines the boundary map `(ℤ/p^n)^{2g}⊗O → ω_G/p^n`, 1.2 the filtration `F_{−j}`, 6.10 the sheaf `Ω^log_{Y/X}`; a filtration indexed `F_j` instead of `F_{−j}` passes 1.2's only Check.

**Repair:** 0.17: "On the interior the map is 0.2's for `A^∨[p^n]`; at an ordinary point it is onto `ω_A/p^n`." "At a totally degenerate cusp it kills the toric part and sends the character quotient `X/p^n` isomorphically onto `ω_T/p^n` by `χ ↦ dχ/χ`; the finite part alone gives the zero map." 1.2: "For `V = ℚ_p(−1)` with H in Hodge degree one, `M₀ = tM`, so `F_i = 0` for `i < 1` and `F₁ = Ô(−1)`; indexing by `F_j` puts the jump at `−1`." "For an abelian scheme, `F₀ = Lie(A^∨)⊗Ô` has rank g and `F₁/F₀ = ω_A⊗Ô(−1)`, the sequence of 1.4." 6.10: "For the log disc over k, `Ω^log` is free on `dlog T`; `Ω¹ → Ω^log` is multiplication by T, an isomorphism only off `T = 0`."

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.3 | FAR10 line 1253 (Def. 17, p. 25); `E ≅ E^∨`; `𝒪_F` action | α defined for finite flat `G/O_K`; reversed pairing sign gives `−1`; image `𝒪_F⊗R`-stable | matches |
| 0.5 Lean headline | `n = 0`; `p = 2`; six one-tactic probes | `I = 0`, trivial; `‖a‖ ≤ ‖2‖` is `v(a) ≥ 1`; `rfl`, `simp`, `infer_instance`, `simp [def]`, `exact`, `aesop` fail | not padding; `p = 2`: R01 |
| 0.5 at `p = 2` | FAR10 l.1284; PS16 ll.199–206; FAR11 l.1268; SW13 l.1466; SW20 l.6172 | `p ≠ 2`; `p ≥ 3`, exponent 2 at 2; restatements; `v(ζ₂−1) = v(−2) = 1` | R01 |
| 0.6 | FAR10 ll.313, 441 (pp. 7, 9); supersingular `E[p]` | Newton polygon `(1,1)`, `(p²,0)`: `v(x) = 1/(p²−1)`; order-p subgroup `(p−1)/(p²−1) = 1/(p+1)` | matches |
| 0.19 | FAR10 ll.671, 709, 720 (pp. 13–14); `E[p]` at height w | subgroup degrees `1−w`, `w/p`; `w ≥ 1/2`: all `≤ 1/2`; `w < 1/2`: step of degree `1−w` | matches |
| 0.23 | FAR11 ll.299–300 (p. 6); `f = [p]` | `α_G: G → ω_{G^D}` for finite locally free `G/S`; both sides `p·α` | matches |
| 0.28 | FAR11 ll.2007–2025; `D = 0`, `D = G[p]` | `E ≅ G[p]^{(p)}`, `det ω_E ≅ (det ω_G)^{⊗p}`; order `p^{ah}·|D|`; `G[p^{a+1}]/G[p] ≅ G[p^a]` | matches |
| 2.2, 2.3 | `𝔾_m` datum; `GL₂` centre | `𝔽_p^×/±1`; `ℚ_p^×/±p^ℤ = ℤ_p^×/±1`; `T_p` trivial iff `p ≡ 1 mod N` | holds |
| 2.8 | CS17 ll.832, 857 (pp. 19–20); Siegel | type locally constant, tested at classical points; tensors preserved; kernel Lagrangian | matches |
| 2.10 | CS17 l.919 (p. 21); BPC25 ll.3236, 3498 (pp. 68, 74); generator `×u` | `gr^j(V_dR⊗Ô) ≅ gr^j(V_p⊗Ô)(j)`; `M_HT = M_dR×^{µ,ℤ_p×}ℤ_p(1)`; lines `ω^{−1}(1)` against `ω^{−1}`; change `µ(u)` | matches |
| 3.2 | SCH15 l.1078 (p. 32); `*Needs:*` scan | same base, `ε < 1/2`, modulo `p^{1−ε}`; 0 citing lines | matches source; R02 |
| 3.4 nonnormal Check | `R′ = {a ≡ b mod p^{1/(p−1)}}`, `s = (ζ_p, 1)` | `v(ζ_p−1) = 1/(p−1)`; quotient by `p^{1/p}` has `v = 1/(p(p−1))`: not in R′ | holds |
| 3.5, 3.6 | FAR11 ll.2001–2052; `p = 5` | `inf{pw,1−w} = inf{Ha(E),1−w}`; `w = 1/10 → 1/2`; `n = 2`: `S₂·(1/12) = 1/2`; `1/4 ≤ 3/10 ≤ 2/5` | matches |
| 4.4 | frame `αγ^∨`; lower unipotents | `HT′(e₁) = (cz+d)HT(e₁)`; `z′ = (az+b)/(cz+d)`; `((c+c′)z+1)` cocycle | holds |
| 4.6 | BHW ll.1147, 1180; `p ≥ 5, m = 1, ε = 1/(4p)`; `p = 2` | `x = 2 − p/(4(p−1)) ≥ 27/16`; `x ≥ m` iff `ε ≤ (p−1)/p^{m+1}` | holds |
| 5.2 | BHW ll.1448–1466 (p. 30); `diag(a,d)`, `diag(a,1)` | ψ is the image of `α(1,0)` in `H_m^∨`; `γ^∨ = diag(d,a)`: `ψ ↦ dψ`; `diag(1,a)` fixes `e₁` | matches |
| 5.5 | PS16 ll.199–258 (pp. 5–6); PIL20 ll.3408–3416 (p. 74); `g = 1` | `p ≥ 3`: exponent `1/(p−1)`; `p = 2`: exponent 2, `n ≥ 2`; `ω/ω^mod = O_C/p^{w/(p−1)}` | matches for `p ≥ 3`; R01 |
| 5.8 | BHW ll.1395, 1406–1407 | `v(I′_m) = m − p^m w/(p−1) ≥ m − p^m ε/(p−1) = x`, equality iff `w = ε` | README's inclusion holds; see Source issues |
| 5.12 | BHW ll.1467–1492 (pp. 30–31); `γ ∈ Γ₀(p^n)` | `z(u_n x) = p^n z(x)`: factor `(c/p^n)(p^n z)+d = cz+d`; `p = 5, m = 1, ε = 1/25, n = 2`: `p^nε = 1` | holds |
| 6.12 | DLLZ-adic ll.2157, 2163, 2229, 2314; `T = S^p` | characteristic 0: index p a unit of O; characteristic p: not | matches; R04 |
| 6.36 | DLLZ-adic ll.4335–4336 (p. 87); point; Tate curve | bound imported from [dJvdP96]; `d = 0`; `H¹(X_an, ℤ) = ℤ` | statement standard; R04 |
| 6.37 | DLLZ-RH l.1270 (p. 28), l.2040 (p. 42); `E = O^n` | n-fold sum of the identity; p. 42 lies in §3.6 | matches; R04 |
| 7.21 | DLLZ-RH ll.1126, 1171–1179 (pp. 24–26); constant L | `H_log = gr⁰RH_log = RH⁺_log/t`; field into `Ω^log(−1)`; `(O_{X_K}, 0)` | matches |
| 7.31–7.35 | `M⁰ = t^aM`; `ℚ_p(1)`; dual | `M∩Fil^jM⁰ = t^{max(0,a+j)}M`; jump a; Tate line `a = −1`, `Gr_{−1}(−1) = Ô`; dual jump `+1` | agrees with 2.10 and Conventions |
| 1.2 | `V = ℚ_p(−1)`, Hodge degree one | `M₀ = tM`; `F_i = 0` for `i < 1`, `F₁ = Ô(−1)` | Check proposed in R07 |
| Pull request text | title, summary block, prose against the head | adds the folder (3262 insertions); two Lean declarations; head trailer names Claude Opus 5.5 | agrees |

- Source locators checked against the text: 47, in 12 sources (FAR10 7, FAR11 4, CS17 4, BPC25 3, BHW 7, PS16 3, PIL20 4, DLLZ-adic 8, DLLZ-RH 4, SCH15 2, SW13 1, SW20 1).
- Library declarations: `TauCeti.Bialgebra.CotangentSpace`, `TauCeti.Bialgebra.cotangentMap` and `GroupLike` elaborate at the pins of `lake-manifest.json`; the contract list of lines 54–104 was not reopened (one line of it changed since `a3bff2c`).
- Cross-roadmap citations resolved at the open heads: CohomologyComparisons §§0.4, 2.15, 6.1, 6.2; AutomorphicBundles, 19 section headings and 10 imported names (§§8.1, 8.2–8.3, 10.7); ShimuraCompactifications, 20 section headings; PrismaticCohomologyPartIV §8.60; ShimuraData `parabolicTypeVariety`; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.8, R07.1.20a, R07.1.24a, R07.6.6; AbelianSchemesAndArithmeticModuli A2.2, A4.5. Consumer labels: R03.
- Gate at `333737c`: every counter 0, `build=0`. Nothing outside the folder is changed.
- Dependency check: `depcheck: 245 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses sorry` at line 54; `#check @` on both declarations shows every binder of the README's finite flat clause. Headlines 0.19, 2.12, 3.6, 4.6, 5.12, 7.3, 7.20, 7.27 and 8.1 are named in the docstring with their missing carriers.
- Read in full at this head: lines 1–3195. 155 targets, each with `Sources:`, `*Needs:*` and Checks; the batch table of Layer 0 and the build orders of Layers 2–6 respect every `*Needs:*` line.
- Overlap check: read PerfectoidShimuraVarieties, AutomorphicBundles, CohomologyComparisons, PrismaticCohomologyPartIV, OverconvergentAutomorphicForms, and on main AdicSpacesPartIV, PerfectoidTowers, PerfectoidSpaces; nothing shared (towers, open `π_HT`, canonical subgroups beyond the shared family package, Igusa torsors, `ω^int`: this roadmap; `smallHasseCanonicalSubgroups`, `horizontalLogSites`, `rationalHTLeviTorsor`, fs log-adic carriers: the suppliers).

Source independence: 16 passages compared with 10 sources (0.19, 0.28, 2.8, 2.10, 3.2, 3.5, 3.6, 5.2, 5.5, 5.8, 5.12, 6.12, 6.36, 6.37, 7.21 and the `Suggested.lean` docstrings against FAR10, FAR11, CS17, BPC25, SCH15, BHW, PS16, DLLZ-adic, DLLZ-RH, SW13), none shared beyond formulas and statements of a dozen words; largest share DLLZ-adic, 42 of 219 locators; contents compared with DLLZ-adic: independent (Layer 6 puts Appendix A first, §4.3 before §4.2, §6.3 before §§6.1–6.2, and 6.5, 6.14, 6.18, 6.25, 6.28, 6.31, 6.36, 6.37 have no counterpart; the remaining order is forced by the `*Needs:*` lines of 6.7, 6.12, 6.21 and 6.27).

## Not verifiable

- HALO (SHA 154459bd…) and ZIE (SHA 7e553f59…): not in the sources cache; 3.2's and 3.10's HALO clauses and the Ziegler locators of 2.11 and 2.14 were not read (2.11's body names Theorem 3.14, its Sources line Theorem 3.52).
- Fargues's original theorem quoted by FAR11 Thm. 2 and SW13 Prop. 4.3.6 (Fargues–Genestier–Lafforgue, Thm. II.1.1): not read; its hypothesis on p is what R01 turns on.
- de Jong–van der Put, Prop. 2.5.8 (6.36): not opened.
- OGU18, Prop. I.4.1.2: behind the publisher's paywall, cited by locator only.
- MILNE-SV, ECD, CON14, AIP15, BP26, BCGP21, AIPH, SCH13 and CDM12 Thm. 3.20: not opened this round.

## Source issues

- **Error** in BHW at (7.1), §7.1, printed p. 29: the source says the group of units congruent to `𝒪_p^×` modulo `p^x`, `x = m − εp^m/(p−1)`, is contained in `B_m`; it should be that `B_m` is contained in it, since `I′_m ⊂ p^xO⁺`; affects the proof.
- **Error** in DLLZ-adic at Lemma 2.2.11, printed pp. 9–10: the source says the monoid algebra of the plus ring is integrally closed for every monoid; it should be replaced by its integral closure (over `ℤ₂` with the group of order two, `(1+u)/2` is integral); affects a stated result.
- **Error** in DLLZ-adic at Prop. 5.4.2, printed p. 78: the source says monoid sections are the colimit over any pro-Kummer presentation; it should be for presentations by quasi-compact quasi-separated stages; affects a stated result.
- **Error** in SCH15 at Cor. III.2.6, printed p. 33: the source says the points of `C_m` over every p-adically complete flat test algebra are the sections congruent to zero modulo `p^{(1−ε)/p^m}`; it should be an inclusion, with equality for algebras integrally closed after inverting p; affects a stated result.

## For the human reviewers

- **Licence.** BPC25 (Boxer–Pilloni, *Higher Coleman theory*) is cited from an author manuscript dated 3 March 2025, not a published version; it carries 12 locators (2.10, 2.12, 2.13, Layer 7's Hodge-type flag, 8.1).
- **Licence.** README line 116 says the integral-model interface "follows the Imperial College London FLT project"; no declaration of `Suggested.lean` matches a declaration of that project that I could identify.
