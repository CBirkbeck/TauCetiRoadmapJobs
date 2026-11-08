# Review of GroupSchemesOverABase (pull request #1522 at c62bf17)

**Verdict:** needs changes

Incremental re-review of the 114 lines changed in `TauCetiRoadmap/GroupSchemesOverABase/README.md` since 6c001bc. `Suggested.lean` is byte-identical to 6c001bc. All six findings of the previous review are repaired. The repairs leave four new P3 findings, none blocking. Three are in Layer 5, where 3.6 and 5.2 were widened and 5.3 restricted; the fourth is the new Milne concordance sentence. The worker's gate passes. `lake env lean` gives the same 21 `sorry` warnings and nothing else. The dependency check finds no problem.

## R01 (P3) — 5.3: the repaired route no longer reaches the non-affine `ρ_ab` and `ρ_r + ρ_ab` inequalities

**Location.** `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 948–959: "`ρ_ab(s) ≤ ρ_ab(s′)` and `ρ_r(s) + ρ_ab(s) ≤ ρ_r(s′) + ρ_ab(s′)` … prolong the prime-to-`p` torsion subgroups of a split maximal torus of the special fibre … ; the abelian rank uses the prime-to-characteristic Tate module of the abelian quotient". The Summary (lines 23–24) lists both inequalities as end theorems for every smooth `G` with connected fibres.

**Claim.** For `G` smooth, separated, of finite presentation with connected fibres, not necessarily affine, the route proves both inequalities from two inputs: (a) the prolonged torsion of the special fibre's torus, and (b) the Tate module of "the abelian quotient" (A4.1).

**Witness.** Fibres `𝔾_m²` at `s` and `E × 𝔾_a` at `s′` pass both inputs, since `μ_{ℓ^∞}² ↪ E[ℓ^∞]` (in X 8.3 the lifted torsion fills `E`) and `0 ≤ 1`. They still break `2 ≤ 1`. Swapping the fibres breaks `ρ_ab`, with ℓ-coranks `2 = 2`.

Why the inputs fall short:

- The repair deleted the centralizer and density steps. The prolonged `μ_n^r` now have no stated use.
- A torus contributes ℓ-corank 1 per dimension and an abelian variety 2. Counting ℓ-coranks therefore gives at best `ρ_r(s) ≤ ρ_r(s′) + 2ρ_ab(s′)`.
- The abelian quotient exists only fibre by fibre: 5.5 shows the affine part jumping. So A4.1 applies to no abelian scheme over `S` here, and a Tate-module count cannot separate torus from abelian ℓ-torsion either.
- Neither pattern above is excluded by the inputs the route names.

The pre-repair route had the same gap behind its centralizer step, and the previous review passed it. The change makes it visible, because the paragraph now ends at the prolongation. The affine case is not affected: there `ρ_ab = 0` and the claim is 5.4's `ρ_r`.

**Repair.**

- **`ρ_ab`:** complete the A4.1 step, or replace it with a route that does reach the claim. For example: the schematic closure of the Chevalley subgroup `L(G_{s′})` in `G` is a closed subgroup scheme that is flat, separated and of finite type, with affine generic fibre. It is therefore affine (SGA 3, Exp. VI_B, 12.10.1; sga3-6b lines 4521–4523). Its special fibre is an affine subgroup of `G_s` of dimension `dim L(G_{s′})`, so it lies in `L(G_s)`, which gives `ρ_ab(s) ≤ ρ_ab(s′)`. Tested on the swapped pattern: `𝔾_m²` affine forces `G` affine, which excludes `E × 𝔾_a` at `s`. Also tested on `G^(p)` (closure `G`, special fibre `𝔾_a` of dimension 1) and on the X 8.3 group (closure the unit section).
- **`ρ_r + ρ_ab`:** either name the input that keeps the lifted torus torsion out of the abelian part, and say how it yields the bound, or treat it like `ρ_n` and `ρ_u`. In the second case, state it for `G` affine (where it is 5.4's `ρ_r`), add it to the first sentence of the Research context, and make the Summary read "of the abelian rank (lower), and, for `G` moreover affine, of the reductive rank (lower), the nilpotent and unipotent ranks (upper) and the semisimple dimension (lower)".
- **A4.1:** if it no longer serves 5.3, drop it from lines 91–92, 245–246, 978 and 1032.

## R02 (P3) — 5.3 restates 5.4 and needs it, though 5.4 comes after it

**Location.** README lines 951–952: "For `G` affine, moreover `ρ_n(s) ≥ ρ_n(s′)` and `ρ_u(s) ≥ ρ_u(s′)`, which are 5.4 (SGA 3, Exp. XII, 1.7 a))"; line 977: "*Needs:* 5.1, 5.2, 5.4, 3.1, 3.4, 3.5".

**Claim.** The targets of Layer 5 are written in build order, and 5.3 is a statement of its own.

**Witness.** 5.4 (line 992) states the same two inequalities, as semicontinuity, with the same locator, XII 1.7 a) (sga3-12 lines 127–129). Yet 5.3's *Needs:* line lists 5.4, a later target of the same layer.

**Repair.** Delete the clause from 5.3, together with 5.4 in its *Needs:* line: 5.4 owns the statement, and the `d_s` route in 5.3 does not use it. Alternatively, swap 5.3 and 5.4. Checked: after the deletion, every item on 5.3's *Needs:* line is an earlier target or a supplier. If R01 is repaired by stating `ρ_r + ρ_ab` for affine `G`, put that statement in 5.4 as well.

## R03 (P3) — 5.2: the widened clause needs 3.6 and the transporter of XI 6.2, not only 3.5

**Location.** README lines 937–939: "For every `G` of this layer with a maximal torus fpqc-locally on `S`, … `T ↦ Z_G(T)` is a bijection onto the Cartan subgroups (SGA 3, Exp. XII, 7.1 a) and b)). *Needs:* 5.1, 2.1, 3.5."

**Claim.** The statement and its route need only 5.1, 2.1 and 3.5.

**Witness.** For non-affine `G`, for example `E × 𝔾_m`, `Z_G(T)` is a subgroup scheme only by 3.6; 3.5 assumes `G` affine (line 637). The proof of XII 7.1 takes the smooth transporter `Transp_G(T, C)` from XI 6.2 (sga3-12 lines 1242–1244, 1254–1257).

**Repair.** Make the line "*Needs:* 5.1, 2.1, 3.5, 3.6". Add to 3.6 one sentence stating that, for `u : H → G` with `H` of multiplicative type of finite type and `K ⊆ G` a closed subgroup that is smooth or of multiplicative type, the transporter `Transp_G(u, K)` is a closed subgroup scheme, smooth over `S` (SGA 3, Exp. XI, 6.2). 3.6's route, XI 6.1 and 6.4 "as in the proof of 6.2", already proves it.

## R04 (P3) — References: the concordance for Milne's version 2.00 misses two of the cited statements

**Location.** README lines 1331–1333: "The author's version 2.00, https://www.jmilne.org/math/CourseNotes/iAG200.pdf, numbers the statements used 1.12, 1.14–1.19 and A.82–A.84."

**Claim.** Every Milne statement the README cites appears in version 2.00 under one of those numbers.

**Witness.** 4.5 cites Corollary 1.39, and 4.8 (and `Suggested.lean` line 329) cites Proposition 2.37. Version 2.00 numbers these Corollary 1.25 (milne-iag line 898) and Proposition 5.48 (milne-iag line 3689), outside the list.

**Repair.** Either write "numbers them 1.12, 1.14–1.19, 1.25, 5.48 and A.82–A.84", or, more simply, replace the sentence with: "The author's 2017 version, https://www.jmilne.org/math/Books/iAG2017.pdf, has this numbering." I checked that file against all twelve labels the README cites: Prop. 1.22, 1.26, Ex. 1.27, Prop. 1.29, 1.30, 1.31, Rem. 1.33, Prop. 1.34, Cor. 1.35, Summary 1.36, Cor. 1.39 and Prop. 2.37 (milne-iag2017 lines 906–1134 and 2493). Each sits at that number with the content the README cites.

## Previous findings

- R01 — repaired: "**Overlap.** PurityForFlatCohomology §§7.12a–7.12e restate diagonalizable groups, groups of multiplicative type, tori, the character sheaf and the largest subtorus over a base … This roadmap owns them (1.1–1.4, 2.1–2.3, 2.7)" (lines 99–102). The false consumer bullet is gone.
- R02 — repaired: "For `G` affine, moreover `ρ_n(s) ≥ ρ_n(s′)` and `ρ_u(s) ≥ ρ_u(s′)`" (lines 951–952). The non-affine case and the Klein four-group obstruction are now in the Research context (lines 1293–1303). The route the repair leaves behind is R01 here.
- R03 — repaired: "`H` is essentially free over `S` (SGA 3, Exp. VIII, 6.3), so its centralizer in the separated `G` is a closed subgroup scheme of `G` (SGA 3, Exp. VIII, 6.4 and 6.5 e))" (lines 657–659). The "not affine" clause is gone.
- R04 — repaired: "`H ⊆ G` a subgroup of multiplicative type and of finite type over `S`" (lines 655–656); "For every `G` of this layer with a maximal torus fpqc-locally on `S`" (line 937). The *Needs:* line of the widened 5.2 is R03 here.
- R05 — repaired: "(1.4, 2.3; SGA 3, Exp. IX, 2.7 and 2.11; Exp. X, 5.9)" (line 550). The References add IX 2.7 and 2.11.
- R06 — repaired as far as this pull request can: "with the revised exposés on P. Polo's page, https://webusers.imj-prg.fr/~patrick.polo/SGA3/ … Numdam PMIHES_1961__8__5_0 (II)" (lines 1317–1339). The board manifest `packages/GroupSchemesOverABase/sources.toml` is not a file of this pull request. It still has its 17 ids; adding `sga3-6a`, `sga3-7a`, `sga3-8`, `ega2` and `milne-iag` (now with `milne-iag2017`) is the worker's bookkeeping. The new Milne sentence's error is R04 here.

## Verified sound

### Gate, build, dependency check, signatures

- **Worker's gate** at c62bf17: every counter is 0 and the result is `OK`, including `dropped=0`. The previous review's `dropped=2` false positive, on this module's own namespace, is gone.
- **My rerun of the gate.** It gives the same zeros, except `depcheck: NOT IN ORDER: GroupSchemesOverABase`, and it printed no build counter. The rerun checks against the tool's configured order, not the candidate order, and "not in the merge order" is not a finding. I elaborated the module directly instead (next item).
- **Elaboration.** `lake env lean TauCetiRoadmap/GroupSchemesOverABase/Suggested.lean`, run from the repository root, exits 0. It prints 21 `declaration uses 'sorry'` warnings, at lines 81, 114, 120, 127, 134, 141, 177, 194, 208, 224, 232, 242, 260, 272, 279, 284, 291, 301, 310, 318 and 330, and nothing else. These are the same lines as at 6c001bc.
- **Signatures and probe.** `git diff 6c001bc..c62bf17` on the folder touches only the README. So the previous review's `#check @name` comparison of all 29 declarations, and its one-tactic probe (21 errors, nothing closes), still hold. `signatures.md` reports 0 lost binders.
- **Dependency check** with the candidate order and `--movable`: `depcheck: 235 roadmaps, 2426 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. The order places this roadmap at line 66, after NeronModelsAndSemistableAbelianVarieties (65) and AbelianSchemesAndArithmeticModuli (41); PurityForFlatCohomology is at line 220.
- **Outside the folder.** `git diff --stat origin/main...HEAD` without the folder is empty. The CI and `CONTRIBUTING.md` files in the change list come from the merge of main.

### Sources read for the changed passages

- **3.6, SGA 3 Exp. VIII.**
  - sga3-8 lines 273–282 (2.1 a)–c): finite exactly when `M` is finite, of degree `Card M`).
  - Lines 696–701 (6.3: multiplicative type implies essentially free).
  - Lines 703–741 (6.4 and its proof: the ideal `K` generated by the coordinate forms `u_i(J)` with respect to a basis).
  - Lines 782–783 and 801–802 (6.5 b), d)), 830–834 (6.5 e): `Centr_G(Z)` closed for `Z` essentially free and `G` separated).
  - The finite-presentation sentence holds: for `H` finite locally free there are finitely many coordinate forms. For `G` locally of finite presentation the inverse image of the diagonal has an ideal of finite type, so the ideal of the centralizer is of finite type.
- **3.6, SGA 3 Exp. XI.**
  - sga3-11 lines 284–288 (2.1), 290–294 (2.2), 321–325 (2.4: `Centr(v)` formally smooth).
  - Lines 1198–1215 (6.1: `H` commutative of finite type, `nH` finite flat, fibrewise density).
  - Lines 1235–1255 (6.2 and its proof through `H ×_S G` over `G`).
  - Lines 1256–1263 (6.3), 1264–1273 (6.4: arbitrary `S′`, ideal of finite type gives `T′ → S′` of finite presentation).
  - A group of multiplicative type of finite type satisfies a′) and b) by 3.3 (IX 4.7), after fpqc localisation to `D_ℤ(M)`. The general-case sentence of 3.6 holds as written.
- **5.2.** sga3-12 lines 1189–1203 (XII 7.1 a)–c): `G` smooth, separated, of finite type, with an fpqc-local maximal torus, no affineness). These hypotheses lie within Layer 5's standing hypotheses (line 919). Lines 1237–1257 are the proof, which uses XI 6.2 (R03).
- **5.3 and 5.4.** sga3-12 lines 124–141 (XII 1.7 a)–d)); sga3-10 lines 1478–1515 (X 8.7, with `ρ_u = ρ_n − ρ_r − ρ_ab` as in README 4.4); sga3-6b lines 4478–4523 (VI_B 12.10, 12.10.1, used in the repair of R01).
- **2.7.** sga3-9 lines 184–192 (IX 2.7), 245–254 (IX 2.11); sga3-10 lines 909–912 (X 5.9). Correct.
- **Research context.** sga3-10 lines 1343–1346 (X 8.3: generic fibre an elliptic curve, special fibre `𝔾_m`). Correct.
- **Milne, for the References sentence and the Milne locators of 4.5–4.8** (the seeded targets 4.5–4.8 fall here).
  - Version 2.00 (milne-iag, author's page): lines 767 (1.12), 781 (1.14), 791 (1.15), 814 (1.16), 821 (1.17), 830 (1.18), 843 (1.19), 898 (1.25), 3689 (5.48), 21039–21050 (A.82–A.84).
  - The 2017 version (milne-iag2017, `jmilne.org/math/Books/iAG2017.pdf`, author's page, with the title of the CUP book): lines 906, 948, 960, 1001, 1017, 1048, 1064, 1070, 1083, 1093, 1134 and 2493–2502.
  - The README's published locators for 4.5 (1.22, 1.26 (a), 1.27, 1.39), 4.6 (1.34, 1.35, 1.36), 4.7 (1.29, 1.30, 1.31, 1.33 (a), (b)) and 4.8 (2.37 (a), (c)) all match.
- **Other seeded targets.** 0.1, 1.1, 1.2, 1.3, 2.1, 2.3, 2.5, 2.6, 3.4, 6.2 and 7.4 lie in unchanged text and are carried forward. The previous review read 0.1, 1.3, 2.5 and 3.4 directly; the others were read in earlier rounds.

### Cross-roadmap citations and ownership

- **PurityForFlatCohomology** at its current head (e5658f93), `TauCetiRoadmap/PurityForFlatCohomology/README.md`:
  - §7.12a (line 2258: `D_S(M)` as the base change of `TauCeti.DiagonalizableGroup.groupScheme` along `S → Spec ℤ`, contravariant in `M`);
  - §7.12b (2332), §7.12c (2407);
  - §7.12d (2475: `X^*(G) = ℋom(G, 𝔾_m)`);
  - §7.12e (2527, (d): `G^tor = D_S(X^*(G)/X^*(G)_tors)`).
  
  The Overlap paragraph is accurate on all three objects. The grep for `GroupSchemesOverABase` in that roadmap's README and `Suggested.lean` is empty. This roadmap is the earlier owner (merge-order line 66 against 220), and the citation that settles the duplicate belongs on PurityForFlatCohomology's side; this side has done what it can.
- **Ownership by object for the widened 3.6 and 5.2.** `roadmaps grep` for `XII, 7.1`, `XII 7.1`, `Exp. XI, 6.[124]` and `XI 6.2` over main and the open heads finds only this roadmap. "Cartan subgroup" hits elsewhere are the Cartan subgroups of `GL₂(𝔽_q)` (#856, #879, #1046, #1048, #1484, #1007) or of real groups (#999, #1015), so they are unrelated.
- `overlaps.md` lists no dropped ids. The ReductiveGroups revisions in the closest list drop nothing this README cites.

### Adversarial table

Rows for unchanged statements are carried from the previous review (r8) with its values. Rows for changed statements are recomputed.

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | `exists_identityComponent` (0.2) | `𝔾_{m,S}`; `(ℤ/2)_S`; `μ₂/ℤ` | `G⁰ = G`; unit component of `S ⊔ S`; `μ₂` not smooth, excluded | ok (r8 row 1) |
| 2 | `bijective_diagonalizableMap` | `Spec(k×k)`; `∅`; `Hom(μ₂, 𝔾_m)` | `ℤ²` vs `ℤ`, excluded by `ConnectedSpace`; excluded; `ℤ/2` | ok (r8 row 2) |
| 3 | `smooth_diagonalizable_iff`, `etale_diagonalizable_iff` | `ℤ/6`/`ℤ`; `ℤ/p`/`𝔽_p`; `ℤ`; `0` | `6 = 0` in `𝔽₂, 𝔽₃`; `(t−1)^p`; smooth not étale; `Nat.card 0 = 1` | ok (r8 row 3) |
| 4 | `flat_surjective_diagonalizableMap` | `n·id`; `0 → ℤ`; `ℤ → 0` | free of rank `n`; `𝔾_m → S`; unit section not flat, excluded by `hφ` | ok (r8 row 4) |
| 5 | `isKernel_diagonalizableMap` | `φ = 0`; `ℤ → 0`; sum `ℤ² → ℤ`; `n·id` | `𝔾_m = D(ℤ/0)`; `S = D(0)`; `1 = D(ℤ/ℤ)`; `μ_n = D(ℤ/n)` | ok (r8 row 5) |
| 6 | 1.1 vs ModularCurves 0B | `ℤ/N` | `O_S[t]/(t^N − 1)` both sides | ok (r8 row 6) |
| 7 | `IsMultiplicativeType`, `IsTorus` | `μ_p`; `𝔾_a`; norm-one torus; `M = 0` | not free; `Hom(𝔾_a, 𝔾_m) = 0`; split by `ℂ`; rank 0 | ok (r8 row 7) |
| 8 | 1.6 Kummer | `k`; `ℤ` | `k^×/k^{×n}`; `{±1}` | ok (r8 row 8) |
| 9 | `exists_etale_cover` | `μ_n/ℤ`; Kummer over `𝔽₂` | identity cover; fppf not étale | ok (r8 row 9) |
| 10 | 2.3, 2.4 | `Spec(k×k)`; `μ₃/ℚ` | ranks `1, 2`; trivial action on `ℤ/3` | ok (r8 row 10) |
| 11 | `IsMultiplicativeType.isotrivial` | `Spec k`; nodal curve; `Spec(k×k)`; `𝔾_m ⊂ 𝔸¹` | split by finite separable; excluded; excluded; isotrivial on `U` | ok (r8 row 11) |
| 12 | `exists_torus_not_isotrivial` | `n`-cycle; infinite chain; identity gluing | `[[1,n],[0,1]] ≠ 1`; split; `𝔾_m²` | ok (r8 row 12) |
| 13 | 2.7 (locator changed) | `𝔾_m × μ₂`; `μ_n`; `𝔾_m` | `X* = ℤ ⊕ ℤ/2`, `Hᵗᵒʳ = D(ℤ) = 𝔾_m`, `H/Hᵗᵒʳ = μ₂`; `Hᵗᵒʳ = 1`; `X_* = ℤ`; IX 2.7, 2.11, X 5.9 state kernel/image/quotient and the anti-equivalence | ok |
| 14 | `bijective_baseChange_map_of_thickening` | `k ↪ k[ε]`; `k ↪ 𝔸¹`; `𝔾_a` | `ℤ` both sides; excluded; `(1+ε)t` excluded | ok (r8 row 14) |
| 15 | `hom_eq_of_eq_fibre` | `t, t⁻¹`; `Spec(k×k)`; `g_a`-conjugate in `GL₂` | differ everywhere; excluded; target not multiplicative | ok (r8 row 15) |
| 16 | `eq_of_eq_on_torsion` | `n = 0`; `μ_n`; `𝔾_a` | excluded by `0 < n`; `H[n] = H`; `𝔾_a[n] = 1` excluded | ok (r8 row 16) |
| 17 | 3.4 Checks | `Hom(𝔾_m, 𝔾_m)`; `Hom(μ_n, 𝔾_m)`; `Hom(𝔾_m, GL₂)` | `ℤ_S`; `(ℤ/n)_S`; infinitely many components | ok (r8 row 17) |
| 18 | 3.5 Checks | diagonal torus; `±1`; `μ_p ⊂ SL_p` | `Z = T`, `N/Z = S₂`; `GL₂`; `SL_p` smooth | ok (r8 row 18) |
| 19 | 3.6 widened, `H` not finite | `E × 𝔾_m ⊇ 1 × 𝔾_m`; `E × (𝔾_m ⋊ ℤ/2) ⊇ 1 × 𝔾_m`; `H = 1` | `Z = G`, dimension 2, smooth, not affine; `σ` inverts `𝔾_m`, `Z = E × 𝔾_m`, dimension 2; `Z = G` | ok |
| 20 | 3.6, finite-presentation step | `μ_n ↪ GL₂/ℤ`, `ζ ↦ diag(ζ, 1)`; `n = 1` | conditions `b(1−ζ) = 0`, `c(ζ−1) = 0` in `O(G)[ζ]/(ζ^n−1)`; coordinates in `1, …, ζ^{n−1}` give `b = c = 0` for `n ≥ 2`: two generators, `Z` the diagonal torus; `n = 1`: no equation, `Z = GL₂` | ok |
| 21 | 3.6 Checks | `E ⊇ ℤ/n ≅ μ_n`; `𝔾_m ⋊ ℤ/2` over `ℤ[1/6]`; `u ∈ SL₂(𝔽₂)` | `Z = E`; `Z(μ₂) = G`, `Z(μ₃) = 𝔾_m` (`ζ⁻¹ = ζ` impossible on `μ₃`); `Z = Spec 𝔽₂[a,b]/((a−1)²)`, `(ℤ/2)_{𝔽₂}` not multiplicative | ok |
| 22 | 3.6 wrong models | upper `𝔾_a ⊂ SL₂/𝔽₂`; VI_B 5.6.4 group; `D(ℚ)` | `Z = {[[a,b],[0,a]] : a² = 1}` non-reduced, excluded by multiplicative type; fixed points not closed, excluded by `IsSeparated`; not of finite type, out of scope | ok |
| 23 | 4.1 Checks | `GL_n/B`; `𝔾_m/μ_n`; `G/G`, `G/e` | `n(n−1)/2`; `t ↦ tⁿ`; `Spec k`, `G` | ok (r8 row 23) |
| 24 | `chevalley` | `A × 𝔾_m`; `A[2] × 𝔾_m` | `L = 𝔾_m`; `2^{2g}` components | ok (r8 row 24) |
| 25 | `affinization` | `(ℤ/2)_k`; `α_p`; non-split `A`-by-`𝔾_a` | `k × k`; `k[t]/(t^p)`; `G_affq = 1 ≠ L` | ok (r8 row 25) |
| 26 | 4.4 Checks | elliptic curve; `𝔾_m`, `𝔾_a`; `GL_n` | `(1,0,1,0,0)`; `(0,1,1,0,0)`, `(0,0,1,1,0)`; `(0,n,n,0,n²−1)` | ok (r8 row 26) |
| 27 | `isSeparated_of_field` | trivial; `ℤ_k`; VI_B 5.6.4 | `Spec k`; diagonal closed; excluded by the field | ok (r8 row 27) |
| 28 | `smooth_of_isReduced`, `exists_reduced_subgroup` | `μ_p`; `Y^p = tX^p`; `X^{p²} = tX^p`; `μ₃ ⋊ ℤ/2` | excluded; excluded by `PerfectField`; excluded; `G_red = ℤ/2` not normal | ok (r8 row 28); Milne 1.26, 1.27, 1.39 confirmed in milne-iag2017 |
| 29 | `exists_identityComponent_of_field`, `isIrreducible_connectedComponent` | `μ₃/ℚ`; `ℤ_k`; `μ_p`; `xy = 0`; `O_n` | `G⁰ = Spec ℚ`; `G⁰ = e`; one point; excluded; `SO_n` | ok (r8 row 29); Milne 1.34–1.36 confirmed |
| 30 | `exists_connectedComponentScheme` | `∅`; `ℚ(i)`; `k[x]/(x²)`; `k(t^{1/p})`; `x²+y²` over `ℝ` | `∅`; `X`; `Spec k`; `Spec k`; `Spec ℝ` | ok (r8 row 30); Milne 1.29–1.31, 1.33 confirmed |
| 31 | `exists_componentGroup` | `ℤ_k`; `μ₃/ℚ`; `μ_p`; `𝔾_m ⋊ ℤ/2` | `ℤ_k`; `μ₃`; `Spec 𝔽_p`; `ℤ/2` | ok (r8 row 31); Milne 2.37 (a), (c) confirmed |
| 32 | 5.5 Check | supersingular `E`; superspecial `A`; `a = 1` surface | `P = x^p`; `P = x^p`; `m = 2`, `P = x^{p²}` | ok (r8 row 32) |
| 33 | 5.2 widened (XII 7.1) | `E × 𝔾_m`; X 8.3 group; `GL_n` | unique maximal torus `1 × 𝔾_m`, Cartan subgroup `Z_G(T) = G`, bijection `{T} ↔ {G}`; torus rank `0` at `η`, `1` at `s`: no fpqc-local maximal torus, excluded; diagonal torus, Cartan subgroup itself | statement ok; `Z_G(T)` needs 3.6, conjugacy needs the XI 6.2 transporter: R03 |
| 34 | 5.4 Checks | `G^(λ)`; `𝔾_m × 𝔾_a`; X 8.3 group | `ρ_r = 1` on `D(λ)`, `0` on `V(λ)`; `ρ_r = ρ_u = 1`; `ρ_r` rises `0 → 1`, affineness needed | ok (r8 row 34) |
| 35 | 5.3 affine `ρ_n`, `ρ_u` | `G^(p)` over `ℤ_p`; `GL_n` | `(ρ_r, ρ_n, ρ_u) = (1,1,0)` at `η`, `(0,1,1)` at `s`: `1 ≥ 1`, `1 ≥ 0`; constant `(n,n,0)` | true; restates 5.4: R02 |
| 36 | 5.3 non-affine `ρ_ab`, `ρ_r + ρ_ab` | X 8.3 group; route patterns `(𝔾_m², E × 𝔾_a)`, `(E × 𝔾_a, 𝔾_m²)` at `(s, s′)` | X 8.3: `(ρ_ab, ρ_r)` from `(1,0)` to `(0,1)`: `0 ≤ 1`, `1 ≤ 1`. Pattern 1: corank `2 ≤ 0 + 2·1`, `ρ_ab` `0 ≤ 1` pass, claim `2 ≤ 1` fails. Pattern 2: corank `2 ≤ 2`, `ρ_ab` `1 ≤ 0` fails | statements not refuted; route gap: R01 |
| 37 | 5.3 `d_s` route | Iwahori of `SL₂` over `ℤ_p`; `GL_n` | `d_s` `0 ≤ 3`; constant `n² − 1` | ok (r8 rows 33–36 for Checks; route unchanged apart from its *Needs:* line) |
| 38 | Research context, Klein four-group | `PGL₂`, char `≠ 2`, `a = diag(1,−1)`, `b = [[0,1],[1,0]]` | `ab = −ba` in `GL₂`, so `ā, b̄` commute; `Z(ā)` = diagonal ∪ antidiagonal; `diag(x,y)` or `antidiag(x,y)` commutes with `b̄` iff `y = ±x`; `Z = {1, ā, b̄, āb̄}`, dimension `0 < 1 = ρ_n`. A smooth `Z_G(H_n)` has equal fibre dimensions through the unit section, and density gives `Z_{G_s}(H_{n,s}) = Z_{G_s}(T_s)` for `n` large | ok |
| 39 | Overlap paragraph | `D_S(M)`, `X*(H)`, `Hᵗᵒʳ` against PurityForFlatCohomology §§7.12a, d, e; `𝔾_m × μ₂` | same construction and direction; `ℋom(G, 𝔾_m)` both sides; `D(X*/tors)` both sides, `Hᵗᵒʳ = 𝔾_m` both sides | ok |
| 40 | 6.2, 6.3 | `SL₂`; `PGL₂`; `GL_n`; torus; `ℙ¹_S` | `0`; `ℤ/2`; `ℤ^{n−1}`; `0`; `Pic(S) ⊕ ℤ` | ok (r8 row 35) |
| 41 | 7.4–7.8 Checks | `SL₂`, `κ(c)`; `c = 2`; `u` in char 2; torus | trace `−c`; `(x−1)²`, centralizer `μ₂ × 𝔾_a`; non-smooth; `G^reg = G` | ok (r8 row 36) |
| 42 | 7.6 Checks | regular semisimple; regular unipotent; `±1` | two Borel subgroups; one; fibre `ℙ¹` | ok (r8 row 37) |

### Remark on unchanged text (no change asked)

- The 5.1 Check (line 928) cites "5.4, Checks", a later subsection. It is unchanged since the previous review, which passed it.

## Not verifiable

- **Milne, CUP print (2017).** The DOI page is paywalled. The labels were checked in the author's 2017 PDF, which carries the book's title and every label at the cited content.
- **Demazure–Gabriel III §3 5.4 and 8.2** (4.1, 4.3); **Jantzen II.1.8, II.4.4** (Conventions, 6.1); **Popov 1974 §4** and **Sansuc 1981 §6** (6.2); **Humphreys Thm 1.12** (5.3; supplied by `TauCeti.stabilizer_eq_closure_wallReflections`); **Slodowy ch. 3–4**; **Bourbaki Lie VI §3 no. 4**. These books are cited by locator only, as in the previous review; none of them is cited by a changed passage.

## Source issues

- none
