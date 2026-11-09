# Review of GroupSchemesOverABase (pull request #1522 at acbc20b)

**Verdict:** needs changes

This is an incremental re-review of the 138 lines changed since 71b006e: the **Owned here** paragraph, the ReductiveGroups and new NeronModelsAndSemistableAbelianVarieties bullets under **Left to other roadmaps**, the Tau Ceti, ReductiveGroups and NeronModels contracts, 4.8, Layer 4's Dependencies and **Downstream consumers**. Nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GroupSchemesOverABase'` is empty), and `Suggested.lean` is unchanged since 9265182.

The project's dropped-names list no longer names GroupSchemesOverABase (it changed at 17:26 UTC on 9 Nov., eleven minutes before this head). So the roadmaps that consume this one may cite it again, and the ownership question of the previous round is settled in this roadmap's favour: it is 67th in the candidate order, before EllipticCurveModularityPartII (276), HeightsRationalPointsAndObstructions (142) and PurityForFlatCohomology (221).

The three restored consumer bullets, however, describe citations that do not exist at the consumers' heads. Each of those three roadmaps still states the material itself and names this roadmap nowhere, so the three objects still have two owners (R01–R03). The repair in this folder is to make the bullets true; the citations are the consumers' work. The 4.8 repair of the previous R01 is correct apart from one locator (R04).

## R01 (P2) — The EllipticCurveModularityPartII bullet names a contract that does not exist; Cartier's theorem still has two owners

**Location.** `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 1426–1428: "EllipticCurveModularityPartII (its contract *From TauCetiRoadmap.GroupSchemesOverABase*) consumes 4.5, Cartier's theorem `smooth_of_charZero`, in §6.0f".

**Claim.** EllipticCurveModularityPartII has a contract with this roadmap and consumes 4.5 through it.

**Witness.** #1491 at 86f110e (committed 17:44 UTC on 9 Nov., after this head and after the list changed), `README.md`:
- "GroupSchemesOverABase" occurs 0 times (`roadmaps grep --fixed 'GroupSchemesOverABase'` over main and the 457 open heads matches only this pull request, #1828 and FlagVarieties on main);
- line 12: §6.0f "owns … Cartier's smoothness theorem for group schemes locally of finite type over a field of characteristic zero beyond the affine case at the pins";
- line 785: "Prove Cartier's theorem in the generality used here", with the same statement as `smooth_of_charZero` (characteristic 0, `GrpObj` over `Spec k`, `LocallyOfFiniteType`, conclusion `Smooth`) and the same route (Stacks 047I, then the characteristic-zero criterion);
- line 795, its *Needs:* "Cartier's theorem …, proved within this subsection".

This is the duplication of the previous R02, unchanged on the other side (table, row 44).

**Repair.**
- In this folder, state the fact without the contract: "EllipticCurveModularityPartII §6.0f uses Cartier's theorem for group schemes locally of finite type over a field of characteristic `0`, which is 4.5's `smooth_of_charZero`, for the intersection of two abelian subvarieties, which gives the minimal period subvariety." Write "(its contract *From TauCetiRoadmap.GroupSchemesOverABase*)" only once that contract exists at #1491's head.
- For a single owner, EllipticCurveModularityPartII §6.0f cites 4.5 and drops its own statement and route; the dropped-names list no longer prevents that. This roadmap is the owner by the merge order and keeps 4.5 as it is.

## R02 (P2) — The HeightsRationalPointsAndObstructions bullet names a contract that does not exist; the Picard group of a reductive group over a field still has two owners

**Location.** README lines 1432–1434: "HeightsRationalPointsAndObstructions (its contract *From TauCetiRoadmap.GroupSchemesOverABase*) consumes 6.2 in §3.8e".

**Claim.** HeightsRationalPointsAndObstructions consumes 6.2 through a contract with this roadmap.

**Witness.** #1017 at 3dc9d71, the same head as in the previous review, `README.md`:
- "GroupSchemesOverABase" occurs 0 times;
- line 1568, §3.8e: "For Pic Ḡ prove the field case here, on the reductive quotient Ḡ_red", then the big cell, the boundary divisors and `Pic Ḡ = P/X*(T_der)`;
- its Checks (lines 1576–1579): `Pic SL₂ = 0`, `Pic PGL₂ = ℤ/2`, `Pic GL_n = 0` with kernel `ℤ·det`, `Pic = 0` for a torus, the same values as 6.2's Checks (lines 1221–1224 here);
- line 1599 uses "both by §3.8e" for `X*(G)` and `P/X*(T_der)`.

The previous R03's duplication, unchanged (table, row 45).

**Repair.**
- In this folder: "HeightsRationalPointsAndObstructions §3.8e uses the Picard groups of a connected split reductive group and of its flag variety over a field, which are 6.2's, for the reductive quotient of `Ḡ`." No "(its contract …)" until the contract exists.
- For a single owner, §3.8e cites 6.2 for `Ḡ_red` and keeps only the reduction along the unipotent radical and the product with `X̄`, which 6.2 does not state.

## R03 (P2) — The PurityForFlatCohomology bullet is false at #1840's head; Layers 1–2's objects have two owners again

**Location.** README lines 1435–1438: "PurityForFlatCohomology (its contract *From TauCetiRoadmap.GroupSchemesOverABase*) consumes 0.1, 1.1–1.5, 2.1–2.3 and 2.7 in §§7.12a–7.12e for its purity results. Those sections prove only that the points of `D_S(ℤ)` and `D_S(ℤ/n)` and the Kummer sequence match Tau Ceti's sheaves `𝔾_m` and `μ_n`, and that finite groups of multiplicative type are finite locally free."

**Claim.** Purity has a contract with this roadmap, and its §§7.12a–7.12e prove only the comparisons named.

**Witness.** #1840 at ebfcd46 (committed 16:35 UTC on 9 Nov., before this head), `README.md`:
- "GroupSchemesOverABase" occurs 0 times; the contract that was at line 538 of 96339c0 is gone;
- line 65: the theory of groups of multiplicative type over a base "(§§7.12a–7.12e) is supporting theory, specified here only";
- lines 206–209: diagonalizable groups, groups of multiplicative type and tori "with their homomorphisms, smoothness, exactness and kernels, character sheaves, subgroups, quotients and largest subtori (§§7.12a–7.12e), are likewise owned here … and a later roadmap on group schemes over a base is to import them from these sections";
- §7.12a (line 2485) defines `D_S(M)` for every finitely generated `M`; §7.12b (2561) proves the smoothness criterion by the order of `M_tors`; §7.12c (2636) defines diagonalizable, multiplicative type and tori; §7.12d (2704) defines `X*(G)` and proves the anti-equivalence; §7.12e (2756) proves kernels, quotients and the largest subtorus. Their *Needs:* lines (2498, 2591, 2660, 2730, 2781) name only Mathlib, SchemeAndStackFoundations, ModularCurves and each other.

So both sentences of the bullet are false at that head, and the objects of 0.1, 1.1–1.5, 2.1–2.3 and 2.7 are stated in two open roadmaps (the situation of the review before last). Purity's sentence that "a later roadmap on group schemes over a base" imports from it has the order reversed: this roadmap is 67th and Purity 221st.

**Repair.**
- In this folder: "PurityForFlatCohomology §§7.12a–7.12e use diagonalizable groups, groups of multiplicative type and tori over a base, with their character sheaves, subgroups, quotients and largest subtori, which are 0.1, 1.1–1.5, 2.1–2.3 and 2.7's, for its §§7.13–7.15 and Layer 8." Delete the second sentence; restore "(its contract …)" and the description of what §§7.12a–7.12e prove only once Purity's head cites these sections again.
- For a single owner, Purity's §§7.12a–7.12e cite 0.1, 1.1–1.5, 2.1–2.3 and 2.7 and keep only the comparisons with Tau Ceti's `𝔾_m` and `μ_n` and the Kummer sequence, as its head 96339c0 did.

## R04 (P3) — 4.8 cites Milne 2.37 (c)–(e) for a statement that only (e) and the preceding paragraph support

**Location.** README lines 967–970: "For `G` of finite type, `π₀(G/k)` is the `π₀` of 4.7 of the scheme `G`, so it agrees with NeronModelsAndSemistableAbelianVarieties 2.2's, and for `G` and `G′` of finite type `π₀(G ×_k G′/k) = π₀(G/k) ×_k π₀(G′/k)` (Milne, Proposition 2.37 (c)–(e))."

**Claim.** Milne 2.37 (c)–(e) support the identification with 4.7's `π₀` and the compatibility with products.

**Witness.** Milne, *Algebraic groups* (2017 PDF, cache text, printed p. 51–52 = PDF pages 63–64), lines 2493–2516: (c) is the compatibility with extension of the base field and (d) the fibres of `|G| → |π₀(G)|` and the order of `π₀(G)`, both of which the repair of the previous R01 moved to NeronModels 2.2; (e) is the product formula. The identification of `π₀(G)` with the `π₀` of the scheme (the homomorphism corresponding to `π(X) ⊆ O(X)`, 1.29) is the paragraph before the proposition, lines 2490–2492, not a part of 2.37.

**Repair.** Write "(Milne, the paragraph before Proposition 2.37 for the identification with the `π₀` of 1.29, and Proposition 2.37 (e))". The Lean docstring of `exists_componentGroup` cites "Proposition 2.37" without parts and needs no change.

## Previous findings

- R01 — repaired: 4.8 opens "For `G` of finite type over `k`, the finite étale `k`-group `π₀(G/k)`, the faithfully flat projection … are NeronModelsAndSemistableAbelianVarieties 2.2's", keeps the locally-finite-type extension, the universal property, the comparison with 4.7 and products, and cites 2.2 in its *Needs:*, the contract (line 255), **Left to other roadmaps** (line 99) and Layer 4's Dependencies (line 1049). The NeronModels bullet and "GS4.2" are deleted, and the five Tau Ceti names and the ReductiveGroups Layer 3 entry used only by 4.8 are gone (0 occurrences). The repair introduced R04.
- R02 — not repaired: "EllipticCurveModularityPartII (its contract *From TauCetiRoadmap.GroupSchemesOverABase*) consumes 4.5". The bullet came back after the dropped-names list changed, but #1491's head still owns and proves Cartier's theorem itself (R01 above).
- R03 — not repaired: "HeightsRationalPointsAndObstructions (its contract *From TauCetiRoadmap.GroupSchemesOverABase*) consumes 6.2 in §3.8e". #1017 is at the same head and still proves the field case itself (R02 above).
- R04 — partly repaired: the bullet now has the requested wording, "consumes 0.1, 1.1–1.5, 2.1–2.3 and 2.7 in §§7.12a–7.12e … Those sections prove only …". Meanwhile #1840 moved from 96339c0 to ebfcd46, dropped the contract and owns §§7.12a–7.12e in full, so the wording is false at that head (R03 above).

## Verified sound

### Gate, dependency check, elaboration

- **Worker's gate** (`scratch/gate.md`): every counter `0`, `OK`.
- **My rerun** with `--build` and `--order` set to the candidate order: every counter `0`, including `build=0`, `depcheck=0`, `dropped=0`, `outside-folder=0`, `readme-ids-missing=0`; `OK`, exit 0.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @…` for all 33 declarations: exit 0, exactly 25 `declaration uses sorry` warnings (lines 82, 115, 121, 128, 135, 142, 178, 195, 209, 225, 233, 243, 261, 273, 280, 285, 292, 301, 308, 317, 326, 334, 346, 361, 377), no error, all 33 types printed and equal to `scratch/signatures.md`. `exists_componentGroup` assumes `[Field k]` and `[LocallyOfFiniteType G.X.hom]` only, which is 4.8's generality after the repair (the finite-type statements it now leaves to NeronModels 2.2 were never in the Lean statement).
- **Headlines and padding.** `Suggested.lean` is unchanged, so the previous rounds' headline list and one-tactic probe stand.

### The changed passages, resolved

- **Owned here** (lines 41–64). Every id named resolves to a heading with the stated content: 0.1 (line 286), 0.2 (304), 1.1–1.5 (337–413: construction, homomorphisms, smoothness, exactness, Cartier duality), 1.6 torsors (426), 2.1 (453), 2.2 quasi-isotriviality (489), 2.3 character sheaf and anti-equivalence (501), 2.4–2.6 (518, 533, 558), 2.7 (592), 4.5 with monomorphisms (817), 6.2 Picard groups over a field (1206), 6.3 `G/B⁻` over a base (1226). 2.3's anti-equivalence is stated for groups of multiplicative type (of finite type, by 2.1's definition) and étale-locally constant finitely generated sheaves, as the paragraph says.
- **NeronModels 2.2 at #852 (861f8ce), lines 1245–1312.** It constructs `π₀(G/k)` for `G` of finite type and proves the faithfully flat projection with kernel `G⁰`, the fppf-quotient universal property, the points over `k^sep` and `k̄`, the extension of `k`, and the agreement with Tau Ceti's `componentGroupScheme` and ReductiveGroups Layer 3 on affine groups: exactly what 4.8's first sentence attributes to it. What 4.8 keeps is not there: groups locally of finite type, the universal property among homomorphisms to étale groups, the identification with 4.7's `π₀(X/k)`, products. The 4.8 Checks (`μ₃/ℚ`, `μ_p/𝔽_p`, `ℤ_k`, `𝔾_m ⋊ ℤ/2`) still match the text: `ℤ_k` is the locally-finite-type case only this roadmap states.
- **Contracts and dependencies.** The Tau Ceti contract lists `galoisEquivalence` for 4.7 only; the ReductiveGroups contract and the Layer 3 bullet under **Left to other roadmaps** name 4.6 only; the NeronModels contract and Layer 4's Dependencies name 2.2 for 4.8 and 2.3 for 4.2. The summary (lines 21–24) and **How to read the build** (lines 274–276) describe 4.8 as the locally-finite-type component group, consistent with the new text.
- **4.8 locators.** SGA 3 Exp. VI_A 5.5.1 (i) (Gille–Polo text in the sources cache, lines 1449–1451): for `G` locally of finite type and flat over an Artinian local ring, `G⁰\G` is an étale group; (ii) the constant-group statement over an algebraically closed field, which is now 2.2's. Milne, Proposition 2.37 (a) (cache line 2494): universal among homomorphisms to étale algebraic groups, for `G` of finite type, as cited. (e) (line 2507) is the product formula; see R04 for the range.
- **Consumer heads at the index of 18:08 UTC.**

  | Pull request | Head | Committed | Mentions of this roadmap |
  | --- | --- | --- | --- |
  | #1491 EllipticCurveModularityPartII | 86f110e | 9 Nov. 17:44 | 0 |
  | #1017 HeightsRationalPointsAndObstructions | 3dc9d71 | 9 Nov. 13:36 | 0 |
  | #1840 PurityForFlatCohomology | ebfcd46 | 9 Nov. 16:35 | 0 |
  | #852 NeronModelsAndSemistableAbelianVarieties | 861f8ce | 9 Nov. 15:12 | 0 |
  | #1828 SpringerResolutionAndCharacteristicCycles | f8ea4db | 7 Nov. | 1 ("GroupSchemesOverABase §7.6", line 10) |
  | FlagVarieties (main) | 3090489 | | 1 ("GS7", line 19) |

  This head was committed at 17:37; the dropped-names list changed at 17:26. The Springer and FlagVarieties bullets and the identifier sentence (GS7 only) are correct.
- **Overlaps** (`scratch/overlaps.md`): no other open pull request changes this roadmap and no cited id is dropped. The ReductiveGroups §8.1 and §8.2 citations resolve at #1676 (47dfaf2) and the pull-request description names #1676.

### The seeded sample where it falls in the change

The change touches the sample only through the **Owned here** ids and the contracts: 0.1, 1.1, 1.2, 1.4 and 4.5 are named there and resolve as above; 4.2's supplier line (NeronModels 2.3) is unchanged and was verified against conrad-chevalley lines 8 and 81–86 last round. The other sampled targets (2.4, 2.6, 3.1, 3.2, 3.5, 4.1, 7.4, 7.6, 7.8) lie outside the change and were verified in earlier rounds.

### Remarks on untouched text (no change requested)

- ReductiveGroups at #1676 (47dfaf2) no longer cites this roadmap, so the previous round's remark on its upward citations of 1.1, 1.2, 2.4 and 4.5 is moot.
- AlgebraicModuliForArithmeticGeometry §7.9 overlaps 4.6's first statement (the neutral component of a group algebraic space locally of finite type over a field); 0.2 cites §7.9 and 4.6 does not. Carried from the previous round.

### Adversarial table

Rows 1–43 are the previous report's rows 1–43 (PRREVIEW-GroupSchemesOverABase_r15, carried from r14 and r13), for statements this change does not touch. Rows 44–45 are r15's rows 44–45, re-checked at the consumers' heads. Rows 46–52 were computed this round.

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1–43 | as in r15 | as in r15 | as in r15 | ok |
| 44 | 4.5 `smooth_of_charZero` vs EllipticCurveModularityPartII §6.0f (#1491 86f110e, lines 785, 795) | `μ_n/ℚ`; `α_p/𝔽_p`; `B₁ ∩ B₂` proper non-affine | both: étale; both exclude it (there: free `Ω¹` of rank 1, dimension 0); both cover it, Tau Ceti `smooth_of_grpObj_of_charZero` (affine) does not | same statement, two owners (R01) |
| 45 | 6.2 vs HeightsRationalPointsAndObstructions §3.8e (#1017 3dc9d71, lines 1568, 1576–1579) | `SL₂`; `PGL₂`; `GL_n`; torus | `0 = 0`; `ℤϖ/2ℤϖ = ℤ/2` both; `0` with kernel `ℤ·det` both; `0` with kernel `X*(T)` both | same object, two owners (R02) |
| 46 | Layers 1–2 objects vs Purity §§7.12a–e (#1840 ebfcd46, lines 2485–2781) | `D_S(ℤ/6)` over `ℤ`; `μ_n`; `𝔾_m × μ₂`; anti-equivalence | smooth over `ℤ[1/6]` both (§7.12b: `|M_tors|` a unit); `X*(μ_n) = (ℤ/n)_S` both; `Hᵗᵒʳ = 𝔾_m` both (§7.12e); both state `H ↦ X*(H)` on étale-locally constant f.g. sheaves | same objects, two owners (R03) |
| 47 | Purity bullet, second sentence | #1840 ebfcd46 lines 65, 206–209 and the five *Needs:* lines | "specified here only", "owned here"; 0 citations of this roadmap; §§7.12a–e define and prove, not only compare | false (R03) |
| 48 | 4.8 rewritten, `exists_componentGroup` | `μ₃/ℚ`; `μ_p/𝔽_p`; `ℤ_k`; `𝔾_m ⋊ ℤ/2` | `π₀ = μ₃` (3 geometric points), étale, `G⁰ = 1`; `π₀ = 1`, `G⁰ = μ_p`, no smoothness; `π₀ = ℤ_k`, étale, not finite, outside 2.2's finite type; `ℤ/2`, every `𝔾_m → ` étale trivial | ok |
| 49 | 4.8 products (Milne 2.37 (e)) | `μ₃ × ℤ/2` over `ℚ`; `𝔾_m × ℤ_k` | `π₀ = μ₃ × ℤ/2` (order 6) `= π₀(μ₃) × π₀(ℤ/2)`; `π₀ = 1 × ℤ_k = ℤ_k` (locally finite type, outside 2.37's hypothesis, stated here only for finite type) | ok; locator range (R04) |
| 50 | 4.8 first sentence vs NeronModels 2.2 (#852 lines 1255–1290) | the five attributed items | finite étale group ✓ (line 1255); faithfully flat, kernel `G⁰` ✓ (1263–1265); `k^sep` points ✓ (1271–1273); extension of `k` ✓ (1281); affine comparisons ✓ (1283–1289) | ok |
| 51 | **Owned here** ids | 20 ids named | 20 of 20 resolve to the heading with that content (lines listed above) | ok |
| 52 | Identifier sentence and Springer bullet | GS7; "§7.6" | FlagVarieties main line 19; #1828 line 10 | ok |

## Not verifiable

- **Sansuc 1981, §6 and Popov 1974, §4** (6.2's locators, named by R02): the cached `sansuc1981` text is the GDZ landing page; 6.2 is outside the change and was not re-fetched.
- **Carried and untouched:** Demazure–Gabriel, *Groupes algébriques* I (no legal online copy); Slodowy, LNM 815 (paywalled); Jantzen II.1.8 and II.4.4, Humphreys 1.12, Bourbaki Lie VI §3 no. 4 (not read); Milne's CUP print (the 2017 PDF, read from the cache, has the cited numbers; its printed page equals the PDF page minus 12).

Ownership was checked against the open roadmap pull requests: `roadmaps grep --fixed 'GroupSchemesOverABase'` over main and the 457 open heads; `roadmaps show` for #852, #1017, #1491, #1676 and #1840; the sibling checkouts of #1491, #1676, #1828 and #1840, whose heads match the index.

## Source issues

- none
