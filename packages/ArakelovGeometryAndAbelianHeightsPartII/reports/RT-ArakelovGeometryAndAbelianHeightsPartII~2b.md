<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1056#issuecomment-6636371415 -->
Red team round 2 pass b (claude) of c9ce4b5

Verdict: needs_changes

1. **F01** (P1) §8.8's induction cites SchemeAndStackFoundations §4.13 for a Bertini statement that section does not make

   Location: `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1378`, "induct on n through a general section of a model of L̄ₙ₋₁, whose zero locus is geometrically integral and normal by Bertini (SchemeAndStackFoundations §4.13)".

   Claim: for n ≥ 2 the arithmetic Hodge index inequality reduces to dimension n − 1 along a general member of a very ample system that is geometrically integral and normal, and §4.13 supplies that member.

   Witness: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5680–5684` (main): the only Bertini target of §4.13 is `bertini_smoothness`, "for X ⊆ ℙⁿ_k smooth over an infinite field k, a general hyperplane section X ∩ H is smooth"; it says nothing about irreducibility, and nothing about sections of a normal non-smooth X. yuan-zhang-2025 lines 8401–8407 defer the proof of Theorem 6.5.8 to the original references, so the step is owned nowhere in the roadmap's citations. Geometric irreducibility is owned by LefschetzPencilsAndVanishingCycles §5.1 (merge order 64, before this roadmap at 269): "if X is geometrically irreducible … g^{−1}(L) is geometrically irreducible for the generic linear subspace L" (Jouanolou, Théorème 6.3). Normality of a general hyperplane section of a geometrically normal variety (Seidenberg) has no owner on main, at the open heads or in SchemeAndStackFoundations (`roadmaps grep` for "Seidenberg" and "Bertini": no match beyond `bertini_smoothness` and §5.1 above).

   Repair: (i) add to `design/plan.json` `gaps` and to the SchemeAndStackFoundations supplier contract: "What SchemeAndStackFoundations must provide (gap:bertini-normal-sections): for a geometrically normal, geometrically irreducible projective variety of dimension at least two over an infinite field and a very ample line bundle, a general member of the complete linear system is geometrically normal (Seidenberg's hyperplane-section theorem)." (ii) In §8.8's route replace "whose zero locus is geometrically integral and normal by Bertini (SchemeAndStackFoundations §4.13)" by "whose zero locus is geometrically irreducible by LefschetzPencilsAndVanishingCycles §5.1 (a generic hyperplane of ℙ(H⁰) with dim X ≥ 2; F is infinite, as F ⊇ ℚ or F has positive transcendence degree over k) and geometrically normal, hence geometrically integral, by gap:bertini-normal-sections". (iii) Add "LefschetzPencilsAndVanishingCycles §5.1; gap:bertini-normal-sections" to §8.8's Needs and to the Layer 8 Dependencies block, and drop SchemeAndStackFoundations §4.13 from both unless smoothness is used. Tested on the instance of §13.4: X = C² is smooth of dimension 2, so §5.1 with s = 1 and dim g(X) = 2 > 1 gives a geometrically irreducible curve in \|mN\|, and the gap gives its normality; `bertini_smoothness` alone would give smoothness there but never irreducibility, and gives nothing for the geometrically normal non-smooth X of §8.8's statement.

2. **F02** (P2) §10.3(3) asserts φ ≥ 0 over every non-archimedean complete field, but its route covers only discrete and trivial valuations

   Location: `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1493`, "(3) φ(C) ≥ 0 at non-archimedean places", under the standing "over a complete valued field K"; route :1495 "(3) From §10.2(3)"; API bullet :1503 "φ ≥ 0 at non-archimedean places".

   Claim: φ(C) = −∫ g_{Δ,a} c₁(O(Δ)_a)² is nonnegative for every complete non-archimedean K.

   Witness: yuan-2026 lines 1652–1661 give the graph expression only "if K is non-archimedean with a discrete valuation"; §10.2(3) is a statement about pm-graphs, and §10.3(1), the only link between φ(C) and φ(Γ), assumes split semistable reduction over a discretely valued K with \|ϖ\| = e⁻¹ (§7.5 is stated for "K complete discretely valued"). For the completed residue field of a point of S^an with dense value group (a type-3 point, radius p^a with a irrational, over \|·\|_p), no target identifies φ(C) with a graph invariant. No consumer needs the general case: §11.3 (:1761) tests effectivity on the test set of §2.5 (discrete and archimedean points) and §§13.2, 13.9 sum over places of a global field.

   Repair: replace "(3) φ(C) ≥ 0 at non-archimedean places." by "(3) φ(C) ≥ 0 when K is trivially valued (φ(C) = 0) or discretely valued: after a finite extension K′/K with split semistable reduction, (1) and §10.2(3) give φ(C_{K′}) ≥ 0, and φ(C) = φ(C_{K′}) for the extended absolute value by (4)." Replace the API bullet by "φ ≥ 0 at trivially and discretely valued non-archimedean K". In §11.3's route replace "(§10.3(3))" by "(§10.3(3), at the discrete points of the test set)". Tested: the genus-2 unit type-0 node gives 1/12 ≥ 0 before and after an unramified quadratic extension, good reduction gives 0, the trivial valuation gives 0; for a type-3 residue field nothing is claimed.

3. **F03** (P3) Three line locators point at a page start or a mention, not at the cited statement

   Locations and witnesses:
   - `README.md:1797` (§12.1): "yuan-2026, §4.1, pp. 59–60, yuan-2026 line 1995". Line 1995 is Remark 3.11 (end of §3); §4.1 "Potentially big line bundles" begins at yuan-2026 line 2010.
   - `README.md:1230` (§8.1): "yuan-2026, Definition 2.5, p. 30, yuan-2026 line 1004". Line 1004 is the first line of p. 30, a remark on theta divisors; Definition 2.5 is at yuan-2026 line 1031.
   - `README.md:1971` (§13.4) and `README.md:2021` (§13.8): "cinkir-2015 … line 30". Line 30 is a sentence on Faber's genus-2 bound; item (iii) with φ(Γ) ≥ (17/288)ℓ(Γ) is at cinkir-2015 lines 41–42, and the statement that the bound is attained by the regular tetrahedron is at lines 50–51.

   Repair: "yuan-2026 line 2010" in §12.1; "yuan-2026 line 1031" in §8.1; "cinkir-2015 line 41" in §13.4 and "cinkir-2015 line 50" in §13.8.

4. **F04** (P3) Two Needs lines omit inputs their routes use

   Locations and witnesses:
   - `README.md:1108` (§7.2a): "*Needs:* §2.6; TropicalAndBerkovichArithmetic §3.3." The route (:1100) chooses a skeleton through whose retraction f factors (TropicalAndBerkovichArithmetic §2.7) and uses c₁(M̄) = −i_*(Δ(f\|_Γ)), the curvature identity c₁(O(f)) = −i_*Δf of TropicalAndBerkovichArithmetic §6.7 (consumed at :105).
   - `README.md:1387` (§8.8) and the Layer 8 Dependencies block :1395: the route's archimedean step "∫ f ddᶜf = −∫ df ∧ dᶜf ≤ 0 on the Riemann surface" is the current calculus of ComplexComparisonPartII §C5.4 (consumed at :97), absent from both lists.

   Repair: §7.2a: "*Needs:* §2.6; TropicalAndBerkovichArithmetic §§2.7, 3.3 and 6.7." §8.8: append "ComplexComparisonPartII §C5.4" to its Needs and to the Layer 8 Dependencies block. Both suppliers are earlier in the merge order (ComplexComparisonPartII 45, TropicalAndBerkovichArithmetic 205), so the gate stays clean.

## Round-1 findings at this head

Every finding of the two round-1 passes was checked at `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md` (head c9ce4b5), with the repaired passage quoted and, where the repair is mathematical, recomputed.

| Finding | Status | Repaired passage and witness |
|---|---|---|
| a-F01 (§2.4 zero-dimensional density) | repaired | README.md:486 "If k = ℤ, or k is a field and dim U > 0, … are dense in U^an. If k is a field and dim U = 0, then U = X = Spec F"; Check at :494 (Spec 𝔽₂: discrete set empty, test set and U^an one point); §2.5 at :501 carries the same split. |
| a-F02 (§7.3↔§7.4 cycle) | repaired | New §7.2a (:1096–1108) states M̄² = ∫ f c₁(M̄) ≤ 0 with equality iff f constant; §7.3 route :1114 "local Calabi uniqueness, §7.2a"; §7.4 route :1138 "(§7.2a)"; §7.3 Needs :1132 lists §7.2a, not §7.4. Recomputed the ℙ¹/ℚ_p Check: f = clamp of log\|t\| to [0, log p], c₁ = δ_ζ₁ − δ_ζp, M̄² = 0 − log p. Statement matches yuan-zhang-2025 line 9945 (Theorem A.6.1, d = 1). |
| a-F03 (small-twist bigness) | repaired | §4.3(3)–(4) at :738 (continuity, yuan-zhang-2025 line 5747; large twist, line 5821); §4.7 route :815 uses continuity for (1), nef Hilbert–Samuel for (2), the large twist for (3). Recomputed the Check at :749: sup norm ≥ e^{m(1−c)} for 0 < c < 1 (Cauchy estimate on the unit circle), top self-intersection 2(c − 1) for c > 1. |
| a-F04 = b-F02 (§4.4 Check) | repaired | README.md:762 "⟨L, L⟩ = ⟨O(1), O(1)⟩ + 2M … 0 for the max metric and 1/2 for the Fubini–Study metric, so the pairing degrees are 2 and 5/2". |
| a-F05 (§8.7 normalization) | repaired | README.md:1369 "deĝ(π_*⟨M̄, M̄⟩)/[K : ℚ] = −2ĥ_θ(M)"; :1370 quadratic field: raw −4a, normalized −2a, torsion 0. |
| a-F06 (process sentence) | repaired | The sentence "retain the design's … examples" is absent (grep finds no "design's"); README.md:69 ends with the power map and Weil height. |
| a-F07 (spectral φ coefficient) | repaired | README.md:1493 "(1/(2λ))\|∫_C φ_λ ω_j ∧ ω̄_k\|², equivalently Σ (2/λ)\|∫_C φ_λ β_j ∧ β̄_k\|² for the basis β_j = ω_j/√2"; Check :1516. Independently recomputed from the curvature form of wilms-2017 (2.9) (line 501) and g_Δ = Σ φ_λ(x)φ_λ(y)/λ (zhang-2010 lines 1253–1259): ∫ g_Δ A² = −(1/2)Σ(1/λ)\|∫φ_λ ψ_j∧ψ̄_k\|² for (i/2)-orthonormal ψ, so φ carries 1/(2λ). |
| a-F08 (higher-dimensional Hodge index) | repaired, one new defect | New §8.8 (:1374–1387) matches yuan-zhang-2025 Theorem 6.5.8 (line 8381) hypothesis by hypothesis. §13.4 route :1973 recomputed: with a = g−1, N = (g+1)W − 2aD, M = aD − W: N² = 8a²[(g+1)² − 2(g+1) − a] = 8g(g−1)³, M·N = 4a²(a+1−g) = 0, M² = −2a³, and deĝ(M̄²N̄) = 2a³φ − 2a²(2g+1)ω_a², agreeing with looper-silverman-wilms-2021 (6.1), lines 736–776. The n ≥ 2 route of §8.8 cites a Bertini statement its supplier does not make: S01. |
| a-F09 (mass identity owner) | repaired | New §3.5 (:660–672, yuan-zhang-2025 Lemma 5.4.4, line 6767); §2.6 :514 "that identity is the target §3.5"; §5.2 Needs :913 and §4.9 Needs :853 include §3.5. The 𝔾_m Check is right: Gauss-point Dirac at finite places, unit-circle measure at infinity, mass 1 against 0 for the trivial metric. |
| a-F10 (Checks for §2.7, §8.1) | repaired | README.md:558–559 (‖X₀‖ = 1/\|t\| = 1/2 at \|t\| = 2, X₀² norm 1/4, φ(t) = t² sends \|t\| = 2 to \|t\| = 4 where ‖X₀‖ = 1/4); :1247–1248 (exp(−cos 2πx) has flat Laplacian −4π² cos 2πx; trivially valued points admit no constant). Values recomputed. |
| a-F11 (generically finite pullback) | repaired differently, sound | README.md:1862 asserts potential bigness over Y only when Y is normal, else over its normalization; route :1864 passes to the closure Z of the image and moves nef bigness by the §3.1 projection formula; Check :1870 (exceptional degree 0, square 8 = 4·2 for the twice-theta bundle in genus 2). |
| b-F01 (admissible at trivial and archimedean points) | repaired | §7.6(3)–(4) are definitions (:1177); §8.1 :1230, §8.3 :1267, §10.3 :1493 and §10.6 :1558 split by type of point; norm-equivariance Check :1189 (scaling by \|λ\| = 1 and by \|λ\|_∞^{1/2}). |
| b-F03 (§10.14 quantifiers) | repaired differently, correct | README.md:1709 fixes S = M_{g,N} over ℤ[1/N]. The repair's (2) was recomputed: Ξ_S − E′ plus the base divisor with Green value t·4g log 2π has Green function ε(Γ_v) log e_v at discrete v and 0 at archimedean v, so it is an E as in (1); the review's original "consequently" clause was indeed false. |
| b-F04 (§12.4 codimension) | repaired | README.md:1848 "d := m − dim Z > 0, where dim Z is the largest dimension of an irreducible component"; mixed-dimension Check :1856 (2 ≤ 3; d = 2 would give 2 ≤ √3). |
| b-F05 (locators) | repaired | §§9.2, 9.3 cite yuan-2026 line 1239 (Theorem 2.10 is at line 1239); §13.4 line 2972 (Remark 4.12); §1.9 line 2262 (Remark 4.4); gross-schoen-1995 pp. 660–679 (page header 660 at line 364, §6 heading at line 367). |

The repair of a-F08 introduced the unowned Bertini step of S01 and the incomplete Needs of S04; no other repair introduced an error.

## Verified sound

Scope. All 2129 lines of `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md` and all 73 lines of `Suggested.lean` were read. `git diff --stat origin/main...HEAD` touches 11 files, all under the package folder (README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, six reports). `design/plan.json` carries exactly the two declared gaps with the slugs, suppliers and `needs` sentences of README.md:99 and :117.

Suggested.lean: 0 declarations (module docstring and namespace only), one `import Mathlib`, no `set_option`, no `lemma`, no process words, no machine paths; the docstring lists, layer by layer, the headline theorems and the missing carriers, including the round-1 additions (local Calabi uniqueness, the arithmetic Hodge index inequality). The `#check @name` comparison has zero rows. No headline is statable at the pins: the headlines need adelic line bundles, Deligne pairings, Berkovich curve metrics, polarized metric graphs, Faltings' δ, the Moriwaki height machine or the degree of a closed subscheme of a curve power, none of which exist in Mathlib 6b7abb3 or Tau Ceti a91d3aa (re-checked by name and by object: no metric graph, Berkovich spectrum, hermitian or adelic line bundle, arithmetic intersection or Faltings δ at the pins; Tau Ceti has `InvertibleSheaf`, `eulerDegree`, `AbelianVariety` without metrics). No padding is possible.

Policy grep of README.md and Suggested.lean: no pull-request numbers, no "review", "repair", "round" or process narrative, no `lemma` (45 occurrences of "Lemma" are citations of source lemmas), no absolute paths.

Dependency gate, run at this head:

```text
depcheck: 207 roadmaps, 1779 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every supplier cited is earlier in the merge order (SchemeAndStackFoundations 2, LefschetzPencilsAndVanishingCycles 64, ComplexComparisonPartII 45, TropicalAndBerkovichArithmetic 205, this roadmap 269).

Targets read: 94 numbered targets (every `###` target), 94 Needs lines, 382 Check bullets. Supplier sections added or re-pointed by the round-1 repairs were resolved: SchemeAndStackFoundations §4.13 (main, :5643; see S01 for what it states) and §5.10 (main, :7175, surface Hodge index present); TropicalAndBerkovichArithmetic §3.3 at its open head (rev 1494 :1522, Δf = −f″ds − Σ outgoing slopes, ∫fΔg = ∫f′g′, ddᶜf = −Δf), §§2.13, 6.6–6.8 present. Ownership by object was re-run with `roadmaps grep` over main and the open heads for "Hodge index", "Calabi", "pseudo-effective", "Deligne pairing", "Bertini", "Seidenberg": the adelic Hodge index inequality, local Calabi uniqueness, the quasi-projective total-mass identity and the Deligne pairing have no other owner; Bertini irreducibility is owned by LefschetzPencilsAndVanishingCycles §5.1 (S01). No `Suggested.lean` name can collide (none is declared).

Source locators verified against the cached extractions this round (84 line locators, each landing on the cited label unless listed in S03): yuan-2026 lines 379, 382, 477, 593, 629, 662, 695, 732, 762, 863, 901, 945, 1031, 1038, 1100, 1129, 1150, 1180, 1239, 1255, 1320, 1329, 1445, 1544, 1581, 1599, 1642–1689, 1734, 1795, 1845, 1858, 1911, 1995, 2044, 2146, 2175, 2235, 2262, 2319, 2536, 2745, 2855, 2871, 2891, 2972, 2992, 3030, 3096, 3531, 3621, 3640, 3662, 3946, 3956, 4011, 4017; yuan-zhang-2025 lines 750, 823, 831, 956, 1103, 1298, 1360, 1413, 1508, 1533, 1759, 1953, 2248, 2417, 2434, 2566, 2632, 2649, 2878, 3843, 3854, 3943, 3981, 4256, 4909, 5106, 5121, 5315, 5396, 5411, 5418, 5439, 5460, 5747, 5821, 5945, 6011, 6122, 6219, 6396, 6607, 6767, 7012, 7212, 7503, 7542, 8160, 8381, 9945, 9960; zhang-2010 lines 206, 215, 253, 1231–1295, 2148; wilms-2017 lines 31, 44, 425–430, 501–517; wilms-2022 lines 121, 1247–1266; looper-silverman-wilms-2021 lines 695–777; cinkir-2011 lines 177–187; cinkir-2015 lines 28–56; baker-rumely-2007 lines 1906, 1953; de-jong-2018 lines 1299, 1508; gaudron-remond-2014 line 305; moriwaki-2000 lines 490, 648, 708; gao-habegger-2019 lines 2530, 2556, 2592, 2596, 2639; wazir-2006 line 170; demarco-mavraki-ye-2026 lines 659, 688; yuan-2008 lines 196, 221; stacks-pullback line 3679; gross-schoen-1995 lines 364–367.

Declared gaps: both are precise, named with a supplier and section, minimal (nothing in Mathlib, Tau Ceti or an earlier roadmap provides singular Bedford–Taylor products or the level moduli with Noether and Hodge positivity), and carried identically in `plan.json` and README.md:99, :117. Not raised. The repair report's one `not actionable` item (implementation of StableReductionPartII) is settled by the gap and is not re-raised.

Adversarial pass, recomputed this round (one row per statement; rows for targets unchanged since round 1 whose values I re-ran are included where they feed a repaired target):

| Statement and context | Instances | Values on each side | Result |
|---|---|---|---|
| §2.4 density, k a field, dim U = 0 | Spec 𝔽₂/𝔽₂; Spec F, F/k finite | every absolute value trivial on k is trivial on F (integrality of F over k): U^an = 1 point = test set; discrete set ∅ | repaired statement true |
| §2.4 density, k a field, dim U = 1 | 𝔸¹ over trivially valued k | absolute values on k(t) trivial on k: trivial or e^{−s·ord_v}; s → ∞ gives the closed point, s → 0 the trivial point | discrete points dense |
| §2.7 canonical metric on O(1) | \|t\| = 2 (centre ∞), \|t\| = 1/2 (centre 0) | ‖X₀‖ = \|X₀/X₁\| = 1/2 and 1; X₀² norm 1/4; φ(t) = t²: ‖φ*X₀‖ at \|t\| = 2 equals ‖X₀‖ at \|t\| = 4 = 1/4 | Checks correct |
| §3.4(1) negative control | E: y² = x³+3x+2 over 𝔽₅ | discriminant ≡ 4 ≠ 0; affine points (1,±1),(2,±1); #E = 5; F*[P] = 5[P], F*O(P−O) = O | reducedness needed |
| §3.5 total mass | ℙ¹_K O(2) max; ℙ¹×ℙ¹ O(1,0)·O(0,1); 𝔾_m ⊂ ℙ¹_ℚ with O(1)_max | 2 = 2; 1 = 1; Gauss-point Dirac and unit-circle measure both in 𝔾_m^an, mass 1 against L̃ = O(1) degree 1, trivial metric 0 | consistent with YZ Lemma 5.4.4 |
| §4.3(4) and §4.7(3) large twist | ℙ¹_ℚ, O(1)_max ⊗ O(−1), N̄ = O(1) | nonzero integer polynomial has sup ≥ 1 on the unit circle; twist multiplies by e^{m(1−c)} > 1 for c < 1: volume 0; c > 1: (O(1)_max + (c−1)O(1)_base)² = 0 + 2(c−1) > 0 | small twist fails, large works |
| §4.7(2) nef case | L̄ nef, L̃ big, N̄ degree 1 | (L̄ + cN̄)^d = L̄^d + d c L̃^{d−1} with N̄² = 0 and L̄^d ≥ 0; h_{L̄+cN̄} = h_L̄ + c/a_K | route consistent with §3.1 Check and §4.6 |
| §4.4 Check | ℙ¹_ℤ, M = O(1) | ⟨O(1),π*M⟩ = M (fibre degree 1), ⟨π*M,π*M⟩ = 0, ⟨O(1),O(1)⟩ degree 0 (max) or 1/2 (FS): 2 or 5/2 | corrected |
| §7.2a sign and equality | O_C norms 1, e⁻¹; ℙ¹/ℚ_p clamp | f ≡ 1: M̄² = 0; clamp: Δf = −δ_ζ₁ + δ_ζp (outgoing slopes 1 at ζ₁, −1 at ζp), c₁ = −Δf, M̄² = f(ζ₁) − f(ζp) = −log p = −∫(f′)² over length log p | matches Tropical §3.3 convention |
| §7.5 and §8.3 genus-1 circle | n unit edges, μ = ds/n | r(x,t) = t(n−t)/n; ∫g_μ(x,y)dμ(y) = 0 forces g_μ(x,x) = (1/2n²)(n³/6) = n/12 | Check value n/12 correct |
| §8.4 fibre of Q̄ | E with P = O(Δ − e×E − E×e) | Δ*P degree 0 − 1 − 1 = −2 (elliptic non-example); P\|_{E×{β}} = O(β − e) = the class β | sign of "fibre at β is β" correct |
| §8.7(2) and §8.5 | d = 1, section x | x*i_α*Θ̄ = −⟨dO(x)_a − ᾱ, same⟩ = d²x*w + 2d x*ᾱ − ⟨ᾱ,ᾱ⟩ equals x* of the right side of §9.1(1) | §9.1(1) route closes |
| §9.1(2) | general d, g | deg(d²w + 2dᾱ) = 2gd²; first identity coefficient 4d² − 4gd² = −(4g−4)d²; second identity expands to (g−1)×first | both identities consistent |
| §9.2(1)–(3) | g = 2, 3 | d²+2d = 8, 24; d²(d²+4d−4g+4) = 32, 384; shift: ι_α = [−(2g−2)], ι_α*Θ̄ = (2g−2)²Θ̄ | matches yuan-2026 line 1239–1257 |
| §10.3(2) normalization | (i/2)-orthonormal ψ versus i-orthonormal β = ψ/√2 | A² = (1/2)Σ[ψ_j∧ψ̄_k](x)[ψ_k∧ψ̄_j](y); ∫g_Δ A² = −(1/2)Σ(1/λ)\|∫φ_λψ_j∧ψ̄_k\|²; φ = +(1/2)Σ(1/λ)\|…ψ…\|² = 2Σ(1/λ)\|…β…\|² | coefficient 1/(2λ) for ψ; Zhang's printed 2/λ needs β |
| §10.3 Laplacian sign | Δ = ∂∂̄/(πi μ) | ∫fΔf μ = (2/π)∫\|f_z\|²dxdy ≥ 0 | positive eigenvalues as stated |
| §10.3 trivially valued K | model C² over K | c₁(O(Δ))² = (2−2g)δ_ζ, ζ the trivial valuation with centre the generic point, ‖1_Δ‖(ζ) = 1, φ = 0 | Check correct |
| §10.2(3) constants | Cinkir 2011 Thm 2.9 | t(2) = 1/27, t(3) ≈ 0.05447, t(4) = 3/88, t(5) = 1/25, t → 1/14; 2i(g−i)/g ≥ 1; min = 3/88 > 1/39 | φ ≥ ℓ/39 follows |
| §10.6 sign of Φ_S | triple pairing with 1_Δ in one slot | log‖1_{DDD}‖ = log‖1_P‖ + ∫log‖1_Δ‖c₁(D)²; g_Φ = −∫g_Δ c₁(D)² = φ > 0 at archimedean points | sign matches §11.3's use |
| §10.7 auxiliary degrees | B(D,w₁,w₁), B(D,D,w₁), B(w₁,w₁,w₂) | composition formula §3.3(1): P, −P, (2g−2)P; W³ = 12aP, W²D = 4P, WD² = −2P | §13.4 inputs correct |
| §10.9 chain | g ≥ 2 | P = 12λ − (2g−1)Δ + eff; Δ ≤ (39(3g−1)/2)(P − nef − eff); (1 + 39(3g−1)(2g−1)/2)P = 12λ + nef + eff; 1 + 19.5·15 = 293.5 ≤ 300 at g = 2 | coefficient 3/(5(2g−1)(3g−1)) |
| §10.14(2) | Ξ_S − E′ + O(t·4g log 2π) | discrete: (δ+ε) − δ = ε; archimedean: t(δ − 4g log 2π) − tδ + t·4g log 2π = 0 | reduces to (1) |
| §10.14 route limit point | t_i → 0, a_i = 1/log(1/\|t_i\|) | \|f(t_i)\|^{a_i} → e^{−ord_Δ f} for f regular on an affine open; limit is the discrete point exp(−ord_Δ) of ℚ(S), in S^an since analytification imposes no bound on A; Green values 0 along the sequence, ε(Γ) = (g−1)/(3g) > 0 at the limit | continuity obstruction sound |
| §11.1 route | Yuan Theorem 3.10 proof, lines 1965–1992 | (Φ̃,φ) − (D_i,g_i) bounded by a_i(E₀,g₀); D_i − a_iE₀ ≥ (1/39 − 2a_i)E₀ as model divisors (a model divisor in the closure of the effective cone is effective); a_i < 1/78 | matches the source |
| §11.3 expansion | d = 1, g = 2, [K:ℚ] = 2 | P^d ≥ P^{d−1}·(2/(3g−1))O(c₀) = (2c₀/5)·2 = 4c₀/5 raw, 2c₀/5 normalized | matches yuan-2026 lines 1936–1940 |
| §11.4 | g = 2, d = 0, [F:k] = 2 | fibre degree of i_ω*Θ̄ = 4g(g−1)(2g−2) = 16; (i_ω*Θ̄ + π*P)¹ ≥ 16·2 = 32; w degree 32/8 = 4 | positive |
| §12.5(4) blow-up | Y = Bl_pt J, g = 2 | exceptional degree 0; (f*Θ)² = Θ² = 8 (twice-theta, 4·2); nef and big, not ample | route uses only bigness |
| §13.4(3) | A(g) = 1 + (3/(2c) + 2)(2g+1)/(g−1) | A(3) = 1 + (432/17 + 2)(7/2) ≈ 96.94; A(4) = 139; A(5) = 109.625; g = 2 hyperelliptic 1 + (40.5+2)(5/2) = 107.25; limit 47 | all < 144 |
| §13.5 lower bound | 12h = ω_a² + δ + ε | δ + ε ≤ (φ/c + φ/(2c) + 2φ) ≤ (A − 1)ω_a² | ω_a² ≥ h/12 |
| §13.8 geometric part | K₄ unit edges, g = 3, c = 17/288 | (3/(2c)+3)φ − δ − ε ≥ φ ≥ cδ: (483/17)(17/48) − 6 − 11/6 = 107/48; minus c·6 = 15/8 > 0; minus 6 = −181/48 < 0 | c(g)Δ, not Δ |
| §13.9 chain | general g | coef·ω_a² ≥ ω_a² + (3/(2c)+3)φ = 12deĝλ̄ + d(C); coef ≤ 139 + 7/2 = 142.5 < 144 (g > 2), 109.75 (g = 2); 2g log(2π⁴) + 4g log 2π = 6g log(2π²) | constants as stated |
| §13.7 | g = 1 | h_Del min ≈ −0.749; h_Fal ≈ −1.321 ∈ (−1.491, −0.919); c = (1/2)log(2π²) + 1 gives h + c ≥ 1 | Bost in Faltings normalization needed |
| §13.10 | h ≤ 1 and h ≥ max(1, 24\|c₅\|); function fields | c′ = ((g−1)/(2g+1))c₀; h/12 + c₅ ≥ h/24; c₃ = 4^{−4g²}/12, c₄ = 12 | both directions hold |

## Not verifiable

- moret-bailly-1989 Théorème 2.5 and faltings-1984 Theorem 6, pp. 401–402: settled as uncertified; the Noether constant was checked only against yuan-2026 lines 2992–3001 and Wilms' formula.
- The original proofs of yuan-zhang-2025 Theorem 6.5.8 (Yuan–Zhang 2017, Carney) are not in the cache; S01 concerns the README's own route (its Bertini step), not those proofs.
- Seidenberg's hyperplane-section theorem and Jouanolou's Théorème 6.3, proposed in S01 as the sources of the gap, were not fetched; the repair worker records them if it states a target instead of a gap.
- cinkir-2011 published numbering: the cache is arXiv v2, where the δ-coefficient bound is Theorem 2.9; yuan-2026 and cinkir-2015 cite it as Theorem 2.11 (see Source issues).
- Ownership against open pull requests was checked with `roadmaps grep` over the 446 open heads and main; sibling folders were not opened one by one beyond those named in the findings.
- No Lean elaboration was run (read-only brief; zero declarations).

## Source issues

- **Misprint** in yuan-2026 at proof of Theorem 3.7, printed p. 53 (line 1801): the source says the bound φ(Γ) ≥ ℓ(Γ)/39 is Cinkir 2011 Theorem 2.11; in the cited arXiv v2 the δ-coefficient bound is Theorem 2.9 (minimal coefficient 3/88) and Theorem 2.11 concerns Zhang's Conjecture 2.8; affects nothing.
- **Misprint** in cinkir-2015 at Introduction, printed p. 1 (lines 35–36): the source says Cinkir 2011 Theorem 2.11 gives the genus-3 δ₀-coefficient 1/39; the cited arXiv v2 Theorem 2.9 gives (892 − 11√79)/14580 ≈ 0.0545 and no 1/39; affects nothing (the roadmap uses Theorem 2.9's constants and 17/288).
- **Misprint** in zhang-2010 at Theorem 1.3.1, printed pp. 6–7 (line 215): the source says the archimedean φ has coefficient 2/λ with an (i/2)-orthonormal basis; recomputation from Proposition 2.5.3's i-orthonormal basis and the curvature form gives 1/(2λ) for that basis; affects a stated result; the same slip is at yuan-2026 line 1671 (both already in the register from round 1 and re-confirmed by an independent computation).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c9ce4b5bb7840dbea7bc53c828b00024ff225f9f", "job": "RT-ArakelovGeometryAndAbelianHeightsPartII~2b", "model": "fable", "worker": "chris-x17"} -->
