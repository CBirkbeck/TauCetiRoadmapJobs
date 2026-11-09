# Review of GroupSchemesOverABase (pull request #1522 at 6417bcc)

**Verdict:** needs changes

This is an incremental re-review of the 3 lines changed since 9265182. The only change is the PurityForFlatCohomology bullet under "Downstream consumers" (README lines 1443–1445). Outside the folder, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GroupSchemesOverABase'` is empty: the files listed in the change summary come from merging main (c25c2106). The previous R02 is repaired, in the pull-request description. The previous R01 is not repaired, and it is R01 below. The repair that R01 needs is a choice between two owners, and one of the two routes needs a human decision on the project's configuration.

The worker's gate passes, and so does my rerun with the candidate merge order and `--build`. The dependency check reports 0 problems. `Suggested.lean` is unchanged and still elaborates with exactly 25 `sorry` warnings.

## R01 (P2) — Layers 1–2 still have two owners, and the two READMEs now hand them to each other

**Location.** `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 41–43, under **Owned here**: "diagonalizable groups `D_S(M)` for finitely generated `M` (Layer 1); groups of multiplicative type of finite type, tori, character and cocharacter sheaves". Lines 1443–1445: "PurityForFlatCohomology §§7.12a–7.12e consume 0.1, 1.1–1.4, 2.1–2.3 and 2.7 … for its purity results."

**Claim.** This roadmap owns these objects, and PurityForFlatCohomology consumes them.

**Witness.** PurityForFlatCohomology at the head of #1840 (643f30e), `README.md` lines 206–210 and 3308–3310: these objects are "owned here", and a later roadmap on group schemes over a base is to import them. "GroupSchemesOverABase" occurs 0 times in its `README.md` and in its `Suggested.lean`.

**Why the bullet does not settle it.**

- **The sections restate the objects instead of citing them.** At that head, §§7.12a–7.12e define the objects themselves:
  - §7.12a defines `D_S(M)` as the base change of `TauCeti.DiagonalizableGroup.groupScheme` along `specULiftZIsTerminal` (its lines 2479–2482). That is 1.1 here (lines 339–341).
  - §7.12a also restates 1.2 and, for finite `M`, 1.5's Cartier duality through `TauCeti.DiagonalizableGroup.cartierDualIso` (its lines 2522–2527).
  - §7.12b states 1.3 and 1.4 with the same Tau Ceti lemmas (its lines 2556–2589).
  - §§7.12c–7.12e state 2.1–2.3 and 2.7.
- **The other roadmap re-asserted ownership after the last review.** That happened at commit adbbf28, whose message is "§7.12a–e owned again".
- **The reason is the project's configuration.** The dropped-names list (`tauceti-roadmap.toml`, `dropped_names_file`, line 100) is described as "names our roadmaps never cite as suppliers (other authors' pull requests whose material we own ourselves)". It lists GroupSchemesOverABase, and so does this review's own never-cite list. The gate on #1840 therefore refuses the citation that the bullet describes. That roadmap's review `packages/PurityForFlatCohomology/reports/PRREVIEW-PurityForFlatCohomology~8.md` raised exactly that citation as a P1 finding ("dropped=39 … FAIL").
- **Result.** The bullet is false at the head it names, and it cannot become true while that list stands. It also leaves out 1.5, which §7.12a restates.

The two roadmaps each own the objects and each say the other imports them. No single owner remains.

**Repair.** This folder cannot pick the owner alone. Either route gives one owner.

**(a) This roadmap stays the owner.** This needs a human: remove GroupSchemesOverABase from the project's dropped-names list.
- PurityForFlatCohomology then replaces §§7.12a–7.12e by citations of 0.1, 1.1–1.5, 2.1–2.3 and 2.7 here, and deletes its lines 206–210 and 3308–3310.
- Here, change only the bullet: "consume 0.1, 1.1–1.4, …" becomes "consume 0.1, 1.1–1.5, …".
- The candidate order supports this route: this roadmap is at #67 and PurityForFlatCohomology at #219.
- Three of the project's own open roadmaps already take this route at their heads. Each carries a `From TauCetiRoadmap.GroupSchemesOverABase` contract:
  - NeronModelsAndSemistableAbelianVarieties (#852, its line 481);
  - HeightsRationalPointsAndObstructions (#1017, its line 118);
  - EllipticCurveModularityPartII (#1491, its line 90).

**(b) Without that decision, cede the objects in this folder.**
- Delete lines 1443–1445.
- Under **Left to other roadmaps**, add: "PurityForFlatCohomology owns `D_S(M)` over a base with its homomorphisms and, for finite `M`, its Cartier duality (§7.12a); smoothness, étaleness, kernels and exactness (§7.12b); groups of multiplicative type and tori, étale-locally diagonalizable (§7.12c); the character sheaf and the anti-equivalence (§7.12d); and subgroups, quotients, cocharacters and the largest subtorus (§7.12e)."
- Remove those objects from **Owned here**.
- Delete targets 1.1–1.5, 2.1–2.3 and 2.7 in favour of that citation. Keep 1.6 and 2.4–2.6, which §7.12 does not state.
- Keep 0.1. Its carrier is Mathlib's `(Over.pullback f).mapGrp`, which §7.12a uses as well, and its Hopf-algebra comparison is not in §7.12a.
- Repoint every *Needs:* on the deleted ids to the matching section, and add a `From TauCetiRoadmap.PurityForFlatCohomology` contract.
- In `Suggested.lean`, delete `bijective_diagonalizableMap`, `smooth_diagonalizable_iff`, `etale_diagonalizable_iff`, `flat_surjective_diagonalizableMap`, `isKernel_diagonalizableMap` and `IsMultiplicativeType.exists_etale_cover`.
- Keep the five definitions that 2.5, 2.6 and Layer 3 need to be statable, and name §§7.12a and 7.12c in their docstrings.
- The cost: this roadmap moves after #219, so the citations from #852 (#66) and #1017 (#142) point upward. Those citations are refused by the same list.

**Tested.**
- **Route (b).** In a scratch copy, 1.1's *Needs:* was pointed at PurityForFlatCohomology §7.12a. The dependency check with `--movable` prints "moved: GroupSchemesOverABase moved in the merge order from #67 to #219, right after its last supplier PurityForFlatCohomology" and "0 problem(s)". Without `--movable` it prints one UPWARD line, #67 → #219.
- **Route (a).** §§7.12a–7.12e restate 1.1–1.5, 2.1–2.3 and 2.7 term by term, at the same generality:
  - an arbitrary `S` and finitely generated `M`;
  - fppf covers on which the group `M_i` may vary;
  - torsion-free `M_i` for tori.

  So a citation from #1840 loses nothing.

## Previous findings

- R01 — not repaired: lines 1443–1445 now say PurityForFlatCohomology §§7.12a–7.12e consume 0.1, 1.1–1.4, 2.1–2.3 and 2.7. At #1840 (643f30e) those sections still own the objects and cite this roadmap 0 times, so the ownership is still split (R01 above).
- R02 — repaired: the description's "Depends on" names ReductiveGroups #1676 for §8.1, §8.2 and Layer 9D, says #1797 and #1808 share its numbering and #1332's differs, and its headline list now reads "4.2, 4.3, 4.5–4.9".

## Verified sound

### Gate, build, dependency check, elaboration

- **Worker's gate** (`scratch/gate.md`): every counter `0`, `OK`.
- **My rerun.** With `--order scratch/merge-order-candidate.txt --build`, every counter is `0`, including `build=0`, `depcheck=0`, `dropped=0` and `outside-folder=0`, and the result is `OK`. Without `--order`, the configured `ORDER.txt` gives `depcheck: NOT IN ORDER: GroupSchemesOverABase`. That is expected: the roadmap is absent from `ORDER.txt` because it is on the dropped-names list (R01), and the brief places it with the candidate order.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 238 roadmaps, 2319 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Pins.** `lake-manifest.json` pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, unchanged since 9265182. `Suggested.lean` is unchanged since 9265182 (`git diff 9265182 HEAD --stat` touches only `README.md`).
- **Elaboration.** I ran `lake env lean` on `scratch/signatures/SignatureCheck.lean`: `Suggested.lean` with `#check @…` appended for all 33 declarations. It exits 0 with exactly 25 `declaration uses 'sorry'` warnings, at lines 82, 115, 121, 128, 135, 142, 178, 195, 209, 225, 233, 243, 261, 273, 280, 285, 292, 301, 308, 317, 326, 334, 346, 361 and 377, and nothing else. All 33 types print.
- **Signatures and padding.** The elaborated types match `scratch/signatures.md` and the previous review's comparison with the README: every binder is in its declaration's own signature, and nothing changed. The previous one-tactic probe (all 25 theorems resist `rfl`, `infer_instance`, `simp` and single library lemmas) stands for the unchanged file.

### The changed passage, resolved

- **The ids the bullet names exist here.** 0.1 (line 286), 1.1 (337), 1.2 (358), 1.3 (373), 1.4 (389), 2.1 (453), 2.2 (489), 2.3 (501), 2.7 (592).
- **The sections it names exist at #1840 (643f30e).** §7.12a (2477), §7.12b (2553), §7.12c (2628), §7.12d (2696), §7.12e (2748). What they say is R01.
- **Mathlib names of 0.1 at the pin.** `Functor.mapGrp` (`Mathlib/CategoryTheory/Monoidal/Grp.lean:598`, with `mapGrpIdIso` at 644 and `mapGrpCompIso` at 651), `Over.pullback` (`Mathlib/CategoryTheory/Comma/Over/Pullback.lean:59`), `AlgebraicGeometry.hopfSpec` (`Mathlib/AlgebraicGeometry/Group/Affine.lean:177`).
- **ReductiveGroups ids (previous R02).** Main has Layer 8 at line 1023 and 9B at 1610, and no §8.1, §8.2 or 9D. #1676 (4f4198c, today) has §8.1 *Split reductive data* (2763), §8.2 *Pinnings* (2787), 9B (3274), Layer 9D (3572) and the bullet *Relative reductive groups over an arbitrary affine base* (3584). #1332 (7dbc27d) has §8.1 *Split classification* (2514) and §8.2 *Relative reductive groups* (2551). The description accounts for all three.
- **Overlaps** (`scratch/overlaps.md`). No other open pull request changes this roadmap, and no cited id is dropped. The ids that only open revisions define are the ReductiveGroups ids above, which the description now names. The closest roadmap in vocabulary is PurityForFlatCohomology (R01).

### Seeded sample where it falls in the change

- **0.1:** no source locator; its Mathlib names are resolved above.
- **2.3:** sga3-10 lines 778–790 (X 5.1: twisted constant means fpqc-locally constant; quasi-isotrivial means étale-locally constant), 876–880 (5.6: the Hom functor of quasi-isotrivial groups of multiplicative type is representable and twisted constant), 885–890 (5.7: the anti-equivalence for quasi-isotrivial groups), 909–912 (5.9: the anti-equivalence between groups of multiplicative type of finite type and finitely generated twisted constant groups, all quasi-isotrivial). The anti-equivalence and the base-change compatibility of 2.3 are supported.
- **2.7:** sga3-9 lines 184–194 (IX 2.7: kernel and image of multiplicative type, the quotient exists and is of multiplicative type; N.D.E. 5 at line 197, the map `I → H` is a closed immersion) and 245–252 (2.11: subgroups and quotients of a diagonalizable group are diagonalizable on an open and closed partition, and diagonalizable when `S` is connected), with X 5.9 as above.
- The other sampled targets (0.2, 1.5, 1.6, 2.6, 3.2, 3.6, 4.1, 4.2, 7.5–7.8) are untouched. The previous review verified them (its "Sources read" list).

### Remarks on untouched text (no change requested in this round)

- NeronModelsAndSemistableAbelianVarieties at #852 (e816215, committed after this head) consumes 0.2, 4.6 and 4.8 here (its lines 121–124, 481, 1203, 1228). So line 1441's "consumes nothing from it" is inaccurate at that head, and with 4.2's *Needs:* on its 2.3 (line 774) the two roadmaps cite each other. The upward edge is #852's (#66 → #67), and its gate refuses the name.
- HeightsRationalPointsAndObstructions (#1017, 49a5570: 6.2, its lines 50 and 118) and EllipticCurveModularityPartII (#1491, 1604bab: 4.5, its lines 90 and 770) cite this roadmap at their heads. "Downstream consumers" does not list them.

### Adversarial table

Rows 1–41 carry the previous report's values for statements the diff leaves untouched (PRREVIEW-GroupSchemesOverABase_r13, "Adversarial table", same row numbers). Rows 42–47 were computed this round.

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | 0.1 `baseChange` (r13) | `f = 𝟙 S`; `D_ℤ(ℤ/2)` to `𝔽₂`; `S′ = ∅` | chosen pullback, iso not equal; `𝔽₂[t]/(t² − 1) = 𝔽₂[t]/(t − 1)²`; `End(𝔾_m)` goes `ℤ → {∗}` | ok |
| 2 | 0.2 `exists_identityComponent` (r13) | `𝔾_m/ℤ_p`; `Spec(O × K)`; `μ₂/ℤ` | `G⁰ = G`; RGPartII excludes the disconnected generic fibre; `μ₂` not smooth, union of identity components not open | ok |
| 3 | 1.1 Checks (r13) | `D_S(0)`; `D(ℤ)`; `D_ℤ(ℤ/2)` at `3`, `2` | `S`; `O_S[t^{±1}]`; two reduced points; `(t−1)²` | ok |
| 4 | 1.2 `bijective_diagonalizableMap` (r13) | connected `S`; `Spec(k × k)`; `∅`; `Hom(μ₂, 𝔾_m)` | `ℤ`; `ℤ²`; one map vs many `φ`; `ℤ/2` | ok |
| 5 | 1.3 smooth/étale iff (r13) | `ℤ/6` over `ℤ`; `M = ℤ`; `M = 0`; `ℤ/p` over `𝔽_p`; `S = ∅` | smooth over `ℤ[1/6]` only; smooth, never étale; étale; `(t−1)^p`; vacuous | ok |
| 6 | 1.4 kernel, flatness (r13) | `n·id`; `0 → ℤ`; `ℤ → 0`; `φ = 0` | `μ_n`; kernel `𝔾_m`; unit section, not flat (excluded); `𝔾_m` | ok |
| 7 | 1.5 Cartier duality (r13) | `ℤ/n`; `0`; `(ℤ/2)²` | `μ_n` also when `p ∣ n`; trivial; `μ₂ × μ₂` | ok |
| 8 | 1.6 torsors (r13) | `k`, `μ_n`; local ring; `ℤ`, `μ₂` | `k^×/k^{×n}`; `Pic = 0`; `{±1}` | ok |
| 9 | 2.1 bullet 1 (r13) | `D(M) ×_S D(N)` | `O_S[M ⊕ N]` | ok |
| 10 | 2.1 bullet 2 (r13) | `Spec(k × k)`, `𝔾_m ⊔ μ₂` | types `ℤ`, `ℤ/2`, no single `M` | ok |
| 11 | 2.1 bullets 3–4, Check (r13) | `μ_p/𝔽_p`; `𝔾_m × μ₄/ℤ`; a torus | not smooth; `(t−1)⁴` at `2`, smooth over `ℤ[1/2]`; smooth | ok |
| 12 | 2.1 Checks (r13) | `μ_p`; `𝔾_a`; norm-one torus; `M = 0` | multiplicative, not torus; `X* = 0`; `X*(ℝ) = 0`; rank `0` | ok |
| 13 | 2.2 `exists_etale_cover` (r13) | `μ_n/ℤ`; norm-one torus; Kummer at `2` | identity cover; `Spec ℂ`; not étale at `2` | ok |
| 14 | 2.5 `isotrivial` (r13) | `Spec(k × k)`, `𝔾_m ⊔ 𝔾_m²`; nodal curve; field | componentwise only; infinite monodromy; X 1.4 | ok |
| 15 | 2.6 `exists_torus_not_isotrivial` (r13) | `n`-cycle; chain; identity gluing; rank `1` | `[[1, n],[0, 1]] ≠ 1`; split; `𝔾_m²`; rank 1 has monodromy `±1` | ok |
| 16 | Linearity paragraph (r13) | norm-one torus; 2.6 torus; `GL_n`; semisimple | embeds in `GL₂`; not linear; linear; linear | ok |
| 17 | 2.7 (r13) | `𝔾_m × μ₂`; `𝔾_m`; `μ_n` | `Hᵗᵒʳ = 𝔾_m`, quotient `μ₂`; `X_* = ℤ`; `Hᵗᵒʳ = 1` | ok |
| 18 | 3.1 (r13) | `k[ε]`, `𝔾_m`; `𝔾_a`; `Spec(k × k)` | `ℤ = ℤ`; `(1 + ε)t` excluded; `(a,b) ↦ a` | ok |
| 19 | 3.2, 3.3 (r13) | `t, t⁻¹`; `Spec(k × k)`; `𝔾_a` char 0; `μ_n` | differ on every fibre; agree on one fibre only; `𝔾_a[n] = 1`; `H[n] = H` | ok |
| 20 | 3.4 Checks (r13) | `Hom(𝔾_m, 𝔾_m)`; `Hom(μ_n, 𝔾_m)`; `Hom(𝔾_m, GL₂)` | `ℤ_S`; `(ℤ/n)_S`; infinitely many components | ok |
| 21 | 3.5 Checks (r13) | diagonal torus; `±1`; `μ_p ⊂ SL_p` | `N/Z = ℤ/2`; `Z = GL₂`; `Z = SL_p` | ok |
| 22 | 3.6 transporter Check (r13) | `u = diag(t, 1)`, `K = diag(1, s)` | antidiagonal, misses `1` | ok |
| 23 | 4.1 Checks (r13) | `GL_n/B`; `𝔾_m/μ_n`; `G/G`, `G/e` | dim `n(n−1)/2`; `t ↦ tⁿ`; `Spec k`, `G` | ok |
| 24 | 4.2 `chevalley` (r13) | `A`; `A × 𝔾_m`; `A[2] × 𝔾_m` | `L = 1`; `L = 𝔾_m`; `2^{2g}` components | ok |
| 25 | 4.3 `affinization` (r13) | `(ℤ/2)_k`; `A`-by-`𝔾_a` | `k × k`; `L = 𝔾_a` | ok |
| 26 | 4.4 ranks (r13) | `E`; `𝔾_m`; `𝔾_a`; `GL_n`; `B ⊂ GL₂` | `(1,0,1,0,0)`; `(0,1,1,0,0)`; `(0,0,1,1,0)`; `(0,n,n,0,n²−1)`; `(0,2,2,0,0)` | ok |
| 27 | 4.5 separated, reduced, Cartier (r13) | glued group; `Y^p = tX^p`; `μ₃ ⋊ ℤ/2`; `∏_ℕ 𝔾_a` | not separated; non-reduced; `G_red` not normal; reduced, not smooth | ok |
| 28 | 4.5 `isClosedImmersion_of_mono` (r13) | `ℤ_k → 𝔾_a`; Frobenius; `𝔾_m → 𝔾_m ⋊ ℤ/2` | not qc (excluded); kernel `α_p`; closed | ok |
| 29 | 4.5 route (r13) | `u : H → G` | finite type, separated, proper by VI_B 1.4 | ok |
| 30 | 4.6–4.8 (r13) | `μ₃/ℚ`; `μ_p/𝔽_p`; `𝔾_m ⋊ ℤ/2`; `ℝ[x,y]/(x²+y²)` | `π₀ = μ₃`; `π₀ = 1`; `π₀ = ℤ/2`; `Spec ℝ` | ok |
| 31 | 4.9 Perrin (r13) | `∏_ℕ 𝔾_m`; `ℤ_k`; `∏ GL₂ ⊇ ∏ B` | `G_n = 𝔾_m^n`; `ℤ̂ ≠ ℤ_k`; `∏ ℙ¹` not a scheme | ok |
| 32 | 5.1–5.2 (r13) | `𝔾_m`; `G^{(p)}`; `GL_n` | constant; `ρ_r: 1 → 0`; diagonal torus | ok |
| 33 | 5.3 (r13) | split multiplicative Weierstrass; `G^{(p)}`; Iwahori of `SL₂` | `ρ_ab: 1 → 0`; `1 = 1`; `d_s: 3 → 0` | ok |
| 34 | 5.4 (r13) | `G^{(λ)}`; `𝔾_m × 𝔾_a` | `ρ_r` `1` on `D(λ)`, `0` on `V(λ)`; `(1, 1)` | ok |
| 35 | 5.5 (r13) | supersingular; class `0`; class `ω` | `P = x^p`; `𝔾_a`; `(G_s)_affq = 𝔾_a` | ok |
| 36 | 6.1–6.3 (r13) | `SL₂`; `PGL₂`; `GL_n`; torus | `O(1)`, `Pic(ℙ¹_S) = Pic(S) ⊕ ℤ`; `ℤ/2`; `ℤ^{n−1}`; `Pic(S)` | ok |
| 37 | 7.1–7.2 (r13) | `SL₂`; `PGL₂`; `GL_n` | `ℤ[t + t⁻¹]`; Cor. 6.4; `𝔸^{n−1} × 𝔾_m` | ok |
| 38 | 7.3–7.4 (r13) | `SL₂`; `SL₂ × 𝔾_m` | `{±1}` codim `3`; trace `−c`; `C` of dim `1 < 2` | ok |
| 39 | 7.5 (r13) | char 2 unipotent; `c ≠ ±2`; `c = 2` | `k[a,b]/((a−1)²)`; split iff `c² − 4` square; `μ₂ × 𝔾_a` | ok |
| 40 | 7.6–7.8 (r13) | `SL₂` regular semisimple, regular unipotent, `±1`; torus | `{t, t⁻¹}`; `k[t]/(t−1)²`; `ℙ¹`; `Pic(G̃) = ℤ`, `Pic(G) = 0` | ok |
| 41 | Research context (r13) | `𝔾_m^r`; DVR; ramified `R` | `Pic(R)^r = 0`; case (2); open | ok |
| 42 | Ownership of Layers 1–2 | #1840 head 643f30e; this README | §7.12a `D_S(M)` = base change of the Tau Ceti group along `specULiftZIsTerminal` (2479–2482) = 1.1 (339–341); §7.12b smooth iff `\|M_tors\|` a unit, étale iff `M` finite for `S ≠ ∅`, kernel `D_S(M/φ(N))`, flat surjective for injective `φ` = 1.3–1.4; 0 citations of this roadmap; ownership sentences at 206–210, 3308–3310 | R01 |
| 43 | New bullet, lines 1443–1445 | the 9 ids here; §§7.12a–e there; dropped-names list | all 9 ids exist here, all 5 sections there; "consume" false (0 citations); the list's line 8 names this roadmap, so #1840's gate refuses the citation; §7.12a also restates 1.5, missing from the bullet | R01 |
| 44 | 1.5 vs §7.12a | `M = ℤ/n`; `M = 0`; `(ℤ/2)²` | both: dual of `(ℤ/n)_S` is `μ_n` without invertibility of `n`, via `cartierDualIso` and base change; trivial; `μ₂ × μ₂` | duplicate (R01) |
| 45 | 2.3 locators | X 5.1, 5.6, 5.7, 5.9 | twisted constant = fpqc-locally `M_S`; Hom representable; anti-equivalence for quasi-isotrivial (5.7), for finite type (5.9) | ok |
| 46 | 2.7 locators | IX 2.7, 2.11; X 5.9 | `ker u` and `G/ker u` of multiplicative type, `I → H` closed immersion; subgroups of `D_S(M)` diagonalizable over connected `S` | ok |
| 47 | Route (b) of R01 | 1.1's *Needs:* → PurityForFlatCohomology §7.12a | `--movable`: moved #67 → #219, `0 problem(s)`; plain: 1 UPWARD | feasible |

## Not verifiable

Carried from the previous review. These are untouched, and this round did not re-read them:

- **Demazure–Gabriel, *Groupes algébriques* I** (4.3's III §3 8.2, and II §6 1.1, III §3 5.4, 7.5): a book with no legal online copy.
- **Slodowy, LNM 815, ch. 3–4** (7.3, 7.6): paywalled. 7.6's Steinberg 1.1 locator was checked.
- **Jantzen II.1.8, II.4.4; Humphreys 1.12; Bourbaki Lie VI §3 no. 4; Popov 1974 §4; Milne's CUP print**: not read. The 2017 PDF that the README names has the cited numbers.

Ownership was checked against the open roadmap pull requests through `roadmaps grep` and the heads named in the brief. #852, #1017 and #1491 were read from the open-roadmaps mirror at the heads that `roadmaps list` gives.

## Source issues

- none (this round's locators, SGA 3 X 5.1, 5.6, 5.7, 5.9 and IX 2.7, 2.11, showed none. The two issues of the previous review stand as reported there.)
