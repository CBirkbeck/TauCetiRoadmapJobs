# Repair of LocallyAnalyticRepresentationsOfLocalGroups (package, round 4)

`REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~3` has eight findings. This round settles them as follows:

- six applied: F01–F04, F07 and F08;
- two not actionable in this package: F05 and F06.

Two files changed: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` and `packages/LocallyAnalyticRepresentationsOfLocalGroups/sources.toml`. In `sources.toml` only locators and `cited_for` lists changed, under the existing keys. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged. No source was fetched, and no `needs-references.toml` was written.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~3/F01 (P1) — applied

**Verified.** The witness is correct. For G = ℤ with its discrete structure, C^an(G, E) = E^ℤ. Its strong dual is E^(ℤ) with the finest locally convex topology, and its strong bidual is E^ℤ with the product topology again. So the space is reflexive, but it is not of compact type, because E^(ℤ) is not metrisable.

**Changed.** §0.7 route: "which for non-compact G is neither of compact type nor reflexive" → continuity follows from the universal property of the product topology alone. The text now says only that C^an(G, E) is not of compact type, because its dual is an infinite direct sum. Added the discrete-ℤ Check (reflexive, not of compact type, coordinatewise continuity). No other passage of the README asserts non-reflexivity.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~3/F02 (P2) — applied

**Verified.** The witness holds: u(t)·e_1e_2 = e_1e_2 + t e_1². The source argument takes successive differences n·x − x (ST01 lines 539–554, Prop. 3.4, pp. 13–14).

**Changed.** §1.6 (ii) route: "moved by a small unipotent subgroup into E_λ ⊗ π^U" → successive differences reach a nonzero vector of E_λ ⊗ π^U in the E[N_0]-span of x. Added the Sym² Check. The unsupplied Zariski-density step behind E[U_v]·e_λ = W is now proved in the route from 0.1 (i) (Needs: 0.1, RG2.0.2). The hypothesis is now "split connected reductive" (ST01 line 345).

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~3/F03 (P2) — applied

**Verified.** X² − 3 has no root in ℚ_3, since a root would have valuation 1/2. OS15 lines 315–325 (p. 8) define O^p without split weights and still claim O^p ⊆ O and that O^g contains every finite-dimensional semisimple module. Their K is a finite extension of ℚ_p (OS15 lines 146–154).

**Changed.** §4.2 (ii): "O^g consists of the finite-dimensional semisimple 𝔤-modules" → "finite-dimensional modules with 𝔥 acting diagonalisably with k-eigenvalues", which are semisimple by 4.1 (iii) and are sums of the L(μ) with μ dominant integral. Added the ℚ_3 Check and an OS15 Source correction.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~3/F04 (P2) — applied

**Verified.**

- RJRC22's neighbourhoods G^(h) = G_0·𝔾_h keep the full group G_0 of rational points (RJRC22 lines 138–140 and 1459–1463, Definition 4.4, p. 29).
- Their Proposition 4.48 (lines 2065–2079) uses D^(h+)(G, K) over K_■[G].
- The README's 𝔾_r instead follow BCGP25 lines 1096–1108, where only M_r acts.

**Changed.**

- §3.8 (ii) route: Shapiro on O(𝔾_r) "restricted to M_0" → solid equals continuous M_r-cohomology of V ⊗̂ C^an(G_n, ℚ_p), Pan's stage n, then the colimit.
- Agreement with RJRC22 Definition 4.40 now uses Shapiro on O(M_0·𝔾_r).
- (iii) follows from (ii) and 2.5. Needs: flatness items → 2.5, `continuousCohomology`.
- Added the ℤ_2/2ℤ_2 idempotent Check.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~3/F05 (P2) — not actionable in this package: the unrestricted small-prime irreducibility theorem is an open problem, so meeting the finding needs a human scope decision

**Why no edit settles it.**

- **The bound is a limitation of the only proof.** It enters through the highest-weight results of OS15 §8 (lines 1034–1037). For example, Sublemma 8.11 (lines 2230–2246) needs the structure constants 3 and 2 of the length-four root strings of G_2 to be units in O_K. The authors know of no counterexample (OS15 lines 120–122) and suggest a refined §8 "might" remove it (lines 1034–1037).
- **No later paper removes it.**
  - Orlik–Strauch, *Category O and locally analytic representations* (arXiv 1412.5270), keeps the same bounds.
  - Agrawal–Strauch (arXiv 2011.12370) does not address them.
  - OS10 gives only a sufficient Verma-irreducibility criterion.
- **No honest target can be written.** A target for Sp_4(ℚ_2) or G_2(ℚ_3) would need a locator and a proof route known to work. Neither exists, so stating it would plan research whose truth is unknown.

The finding itself names the alternative: "obtain a human change of scope". This finding re-raises R07, which was disputed last round, so a human decides. The Layer 6 introduction already records the bound, where it enters, and that the GL_n consumers are unaffected.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~3/F06 (P2) — not actionable in this package: the duplicate construction is in SpringerResolutionAndCharacteristicCycles, which must import Layer 4

**Checked.** SpringerResolutionAndCharacteristicCycles was read at its open head with `roadmaps show`. Its §10.4 (around line 1215) still constructs Verma and simple modules for 𝔤 = 𝔷 ⊕ [𝔤, 𝔤] and proves finite length and the classification of simples. It does not cite this roadmap.

This roadmap is line 253 of `merge-order/ORDER.txt` and Springer is line 258, so this roadmap is the earlier owner. Its Scope bullet already states single ownership of category O and the sl_2 boundary. The remaining change is Springer importing Layer 4 §§4.1–4.3, which is outside this package. Citing Springer here would add an upward edge.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~3/F07 (P3) — applied

**Verified** against the page markers: OS15 lines 98–102 are on p. 3; BR16 line 321 is on p. 8; DING25 (3.25) is at line 1820 (p. 45) and (3.26)–(3.27) at lines 1843–1853 (p. 46).

**Changed.**

- §4.3: "Introduction, p. 4" → "p. 3".
- §6.1: "Lemma 2.1, p. 9" → "p. 8".
- §9.5: "arXiv v2 p. 46" → "pp. 45–46".

**Same pattern.** All DING25, OS15 and BR16 page locators were swept against the cache, and two more slips were fixed:

- Layer 6 introduction: "Breuil, socle I, §1, p. 6" → "§2, p. 6" (BR16 lines 229–236).
- §8.14: "(3.17)–(3.18), p. 42" → "pp. 42–43" (DING25 line 1704 is the p. 43 marker; (3.17) is at line 1710).

The manifest locators of OS15, BR16, DING25, RJRC22 and ST01 were updated under their existing keys.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~3/F08 (P3) — applied

**Changed.** Each of §§3.1, 4.3, 4.4, 5.2, 5.4, 8.1, 8.3, 8.5, 8.7, 8.13, 8.14, 9.3, 9.5 and 10.2 now has an `API:` list of prose bullets before `*Needs:*`. The bullets state the defined object's properties with hypotheses and conclusions, taken from the section's own statement. There are no Lean names and no new targets; Checks and locators are unchanged.

A scripted scan found no other section that defines an object without an API list. Its hits in §§0.7, 4.1 and 7.4 were the word "defined" in non-definition sentences.

## Checks run

- **Elaboration.** `lake env lean` on the package's `Suggested.lean`, run from the content checkout, exited 0 with no output (6.3 s). Nothing `TauCeti.*` is imported, so nothing needed building.
- **Signatures.** `Suggested.lean` declares nothing and was not changed. The `#check @name` comparison therefore has an empty input, and no binder changed.
- **Dependency check.** Full output:

  ```text
  depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver.** It reports one lead: "LocallyAnalyticDistributionsPartII §1.1: no roadmap". This is a false positive: that roadmap is a board package at line 199 of the merge order, and §§1.1, 1.2 and 2.5 exist there (its README lines 141, 164 and 248). No Lean names were reported missing.
- **Gaps.** README and `design/plan.json` list the same nine slugs (compared mechanically). No gap was added or changed.
- **Hygiene.** No LaTeX delimiters and no machine paths. `sources.toml` parses with 29 entries.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.7 route (product topology only) | G = ℤ discrete; G = ℤ/2 discrete; G = ℚ_p; λ = 0 | ℤ: dual E^(ℤ), bidual E^ℤ, reflexive, not of compact type. ℤ/2: E², of compact type. ℚ_p: dual ⊕_(ℚ_p/ℤ_p) D(ℤ_p, E), not metrisable. λ = 0: F_0 = 0 | Continuity holds coordinatewise in every case; no duality claim is needed |
| 1.6 (ii) route, successive differences | Sym², v = e_1e_2, p = 2, t ∈ 2^kℤ_2; W = E², v = e_2; trivial W | u(t)v = e_1e_2 + t e_1² (mixed coefficient 1), (u − 1)v = t e_1² ≠ 0; u(t)e_2 − e_2 = t e_1; trivial W is already N_0-fixed | A single translate fails; differences succeed |
| 1.6 Zariski step | 𝔾_m over L = ℚ_p(√p); O_2 (disconnected) | U = 1 + p^kO_L has ℚ_p-dimension 2 = dim Res 𝔾_m, so its closure is everything. O_2: E[U]·e for U ⊆ SO_2(L) is a weight line ≠ W | Connectedness is needed for the route; hypothesis made explicit |
| 4.2 (ii) endpoint | ℚ_3, t ↦ (0 3; 1 0); gl_2, det ⊕ Sym²; 𝔤 = 𝔥 | k-weight sum: dimension 0 against 2, so excluded. det ⊕ Sym²: weights (1,1), (2,0), (1,1), (0,2) in k, included. 𝔤 = 𝔥: sums of k_μ | Corrected endpoint |
| 3.8 (ii) route | M_0 = ℤ_2, M_1 = 2ℤ_2; V = E; V = C(ℤ_p, E) | Idempotents: 2 on one disc, 4 on the induced space. V = E: H^0(M_r, O(𝔾_r)) = E (constants, by the identity principle), equal to Pan's H^0 = E. C(ℤ_p, E): degree 0 is C^la | Stage-r comparison consistent |
| 3.8 (iii) via (ii) and 2.5 | V = C(ℤ_p, E); V finite-dimensional | R^iLA = 0 for i ≥ 1 by 2.5, in agreement with RJRC22 Prop. 4.48 | Consistent |
| 4.3 API, "exactly when q ⊆ p_I" | gl_3, λ = (2, 0, 1); gl_2, λ = (0, 2) | I = {α_1}: b and p_(α_1) yes, p_(α_2) and g no. I = ∅: b only | Matches the Checks |
| 4.4 API, soc M^∨ ≅ M/rad M | gl_2, M(λ) with λ dominant | top M(λ) = L(λ) = soc M(λ)^∨ | Matches the Check |
| 5.2 API, deformation | n = 1, G = T | PS(χ(1 + ψε)) = χ(1 + ψε), class ψ (1.9) | Consistent |
| 5.4 API | N = 1; GL_2, Sym^k | H_0 = V; lower radical gives (k, 0) and (−1, k + 1), upper radical gives (0, k) and (k + 1, −1) | Consistent with 4.6 |
| 8.1 API, genericity symmetric | φ_1 ⊠ φ_1\|·\|_L and its swap | Ratios \|·\|_L and \|·\|_L⁻¹; both non-generic, because the condition runs over all i ≠ j | Consistent |
| 8.5 API, count | n = 1, 2, 3 | 0, 2d_L, 6d_L | Consistent |
| 8.14 API, dimensions | n = 2, L = ℚ_p | 2 ⊆ 3 ⊆ 4; two Ext¹_w span 5 | Consistent |
| 9.3 API, #S_(F_P) | P = B; P = G; blocks (2, 1) | (n − 1)d_L; (2^n − 2)d_L; 3d_L | Consistent |
| 9.5 API, additive not multilinear | r = 2, classes doubled | Image doubles (additive); a multilinear map would quadruple | Consistent |
| 10.2 API | L = ℚ_p; n = 2, d_L = 2 | π_(1,σ) = π_1; length of π_(1,σ) is 1 + 2 = 3, and the amalgam over two σ has length 1 + 2·2 = 5 = length of π_1 | Consistent |
| F07 pages | page markers | OS15: line 115 is the p. 4 marker. BR16: lines 290 and 346 are the p. 8 and p. 9 markers. DING25: lines 1704 and 1835 are the p. 43 and p. 46 markers | Corrected |

## For the maintainer

- **F05 needs a human decision.** Either accept the documented small-prime limitation of Layer 6, or change scope so the roadmap owns the open small-prime case. It was disputed last round and has now been re-raised.
- **F06 needs a matching edit in SpringerResolutionAndCharacteristicCycles.** Its §10.4 should import this roadmap's Layer 4 §§4.1–4.3 for Verma and simple modules, finite length and the classification of simples. It keeps its strict central reduction, orbit labels and localisation.
- **Ownership against open pull requests.** No new target or construction was added this round. The one ownership question raised (F06) was checked at Springer's open head.
- **Nothing other roadmaps cite was renamed or renumbered.** No section or Lean name moved. Consumers citing LR ids (TriangulineVarietyAndItsLocalModel and the board packages) are unaffected.
- **Hypothesis change in §1.6.** §1.6 now assumes 𝐆 split connected reductive. Every consumer in this roadmap uses GL_n or its Levi subgroups, which are connected.
- **No suspicious instructions** were found in the review text.
